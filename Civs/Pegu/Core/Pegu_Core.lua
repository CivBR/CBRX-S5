-- Pegu_Core
-- Author: EmeraldRange
-- DateCreated: 10/27/2019 1:29:14 PM
--------------------------------------------------------------
print("Pegu loaded")
--=======================================================================================================================
-- JFD_IsCivilisationActive
--=======================================================================================================================
function JFD_IsCivilisationActive(civilisationID)
	for iSlot = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
		local slotStatus = PreGame.GetSlotStatus(iSlot)
		if (slotStatus == SlotStatus["SS_TAKEN"] or slotStatus == SlotStatus["SS_COMPUTER"]) then
			if PreGame.GetCivilization(iSlot) == civilisationID then
				return true
			end
		end
	end
	return false
end
--=======================================================================================================================
local iCiv = GameInfoTypes["CIVILIZATION_ER_PEGU"]
local bIsCivActive = JFD_IsCivilisationActive(iCiv)

--Defines
local iCeti = GameInfoTypes["BUILDING_ER_CETIYA"]
local iLargeGoldModifier = GameInfoTypes["BUILDING_ER_PEGU_15GOLDDUMMY"]
local iSmallGoldModifier = GameInfoTypes["BUILDING_ER_PEGU_5GOLDDUMMY"]
local iUAModifier = GameInfoTypes["BUILDING_ER_PEGU_UADUMMY"]
--=======================================================================================================================
--ER_PeguCetiTrade
--+20% per International Trade Route going from this city with a Ceti to a city with the same 
-- Goes through all trade routes, giving the influence and gold for Ceti if conditions are met
--=======================================================================================================================

function ER_PeguCetiTrade(playerID)
	local pPlayer = Players[playerID]
	if pPlayer:IsAlive() then
		--UB Can be captured
		--Reset each turn to properly deal with adding the bonuses
		for pCity in pPlayer:Cities() do
			pCity:SetNumRealBuilding(iLargeGoldModifier, 0) --jeremy was here
			pCity:SetNumRealBuilding(iSmallGoldModifier, 0)
		end
		for _,v in ipairs(pPlayer:GetTradeRoutes()) do	
			local pFromCity = v.FromCity
			local pToCity = v.ToCity
			if (pFromCity:IsHasBuilding(iCeti)) then
				--ReligionType -1 and 0 are invalid (no religion and pantheon)
				if ((pToCity:GetReligiousMajority() == pFromCity:GetReligiousMajority()) and (pToCity:GetReligiousMajority() > 0)) then
					if (v.Domain == 0) then --'DOMAIN_SEA' 
						pFromCity:SetNumRealBuilding(iLargeGoldModifier, pFromCity:GetNumRealBuilding(iLargeGoldModifier) +1)
					elseif (v.Domain == 2) then --'DOMAIN_LAND'
						pFromCity:SetNumRealBuilding(iSmallGoldModifier, pFromCity:GetNumRealBuilding(iLargeGoldModifier) +1)
					else --'ERROR'
						print("ERROR: Pegu Ceti Unexpected Domain Exception. Contact Emerald: line 58")
					end
				end
			end
		end
	end
end
--=======================================================================================================================
--ER_PeguVector
-- Receive +5% science and +5% faith in your empire per foreign civilisation trading with you. Gain +3 Influence per turn towards each city state you trade with following the same religion.
--
-- Goes through all trade routes, keeps a table of unique civilisations being traded to, and gives bonuses based on that.
-- Gives the Influence if a city state is found, both ways.
--=======================================================================================================================
function ER_PeguVector(playerID)
	local pPlayer = Players[playerID]
	if pPlayer:IsAlive() and pPlayer:GetCivilizationType() == iCiv then
		local iUniqueCivIndex = 1
		local tUniqueCivs = {}
		-- print("Lopping through trade routes to pegu")
		--=====Firstly, looping through Trade Routes TO Pegu=============
		for _, v in ipairs(pPlayer:GetTradeRoutesToYou()) do
			local pOrigin = Players[v.FromCity:GetOwner()]
			local iOriginType = pOrigin:GetCivilizationType()
			if (iOriginType ~= GameInfoTypes.CIVILIZATION_ER_PEGU)then
				local bUnique = true
				--Counting minors with tMinorCivs
				--Every minor has the same civilizationType. UA's first part only says civs not CS's
				if (pOrigin:IsMinorCiv()) and ((v.ToCity:GetReligiousMajority() == v.FromCity:GetReligiousMajority()) and (v.FromCity:GetReligiousMajority() > 0)) then 
					pOrigin:ChangeMinorCivFriendshipWithMajor(playerID, 3)
				else
					for k, w in pairs(tUniqueCivs) do
						if (iOriginType == w) then
							bUnique = false
						end	
					end
					if bUnique then
						tUniqueCivs[iUniqueCivIndex] = iOriginType
						iUniqueCivIndex = iUniqueCivIndex + 1
					end
				end
			end
		end
		-- print("Lopping through trade routes from pegu")
		--======Next, looping through Trade Routes FROM Pegu=============
		for _, v in pairs(pPlayer:GetTradeRoutes()) do
			local pDestination = Players[v.ToCity:GetOwner()]
			if pDestination:IsMinorCiv() and ((v.FromCity:GetReligiousMajority() == v.ToCity:GetReligiousMajority()) and (v.ToCity:GetReligiousMajority() > 0))then
				pDestination:ChangeMinorCivFriendshipWithMajor(playerID, 3)
			end
		end
		--Changing Science and Faith based on tUniqueCivs: number of unique civs is iUniqueCivIndex - 1
		--Cannot change science gain directly with lua and cannot directly change faith as a percent with buildings
		for pCity in pPlayer:Cities() do
			if (pCity:GetNumBuilding(iUAModifier) ~= iUniqueCivIndex -1) then 
				pCity:SetNumRealBuilding(iUAModifier, iUniqueCivIndex - 1)
			end
		end
		pPlayer:ChangeFaith(math.floor(pPlayer:GetTotalFaithPerTurn()*0.1*(iUniqueCivIndex - 1)))
	end
end

if bIsCivActive then
	GameEvents.PlayerDoTurn.Add(ER_PeguCetiTrade)
	GameEvents.PlayerDoTurn.Add(ER_PeguVector)
end