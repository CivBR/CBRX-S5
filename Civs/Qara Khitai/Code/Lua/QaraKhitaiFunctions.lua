--============================================================
-- GLOBALS
--============================================================
include("FLuaVector.lua")
print("Qara Khitai Lua Activated")

local iQaraKhitai = GameInfoTypes["CIVILIZATION_JWW_QARA_KHITAI"]
local pActivePlayer = Players[Game.GetActivePlayer()]

local iPracticalNumCivs = (GameDefines.MAX_MAJOR_CIVS - 1)
function JFD_IsCivilisationActive(civilizationID)
	for iSlot = 0, iPracticalNumCivs, 1 do
		local slotStatus = PreGame.GetSlotStatus(iSlot)
		if (slotStatus == SlotStatus["SS_TAKEN"] or slotStatus == SlotStatus["SS_COMPUTER"]) then
			if PreGame.GetCivilization(iSlot) == civilizationID then
				return true
			end
		end
	end
	return false
end
local bIsActive = JFD_IsCivilisationActive(iQaraKhitai)

function JFD_GetRandom(lower, upper)
    return Game.Rand((upper + 1) - lower, "") + lower
end
--===========================================================================
-- UA (Battle of Qatwan)
--===========================================================================
local iUADummy = GameInfoTypes["BUILDING_JWW_QARA_KHITAI_UA"]
local iOrdo = GameInfoTypes["UNIT_JWW_ORDO_CAVALRYMAN"]
-----------------------------------------------------------------------------
-- Losing influence with a city state will grant a combat bonus to all nearby troops.
-----------------------------------------------------------------------------
tCityStatesInfluence = {}
for otherPlayerID = GameDefines.MAX_MAJOR_CIVS, GameDefines.MAX_MAJOR_CIVS + GameDefines.MAX_MINOR_CIVS - 1 do
	local pPlayer = Players[otherPlayerID]
	if pPlayer:IsEverAlive() and pPlayer:IsMinorCiv() then
		tCityStatesInfluence[otherPlayerID] = {Influence = 0}
	end
end

function JWW_UpdateInfluenceAndCombatStrength(iPlayer)
	local pPlayer = Players[iPlayer]
	if pPlayer:IsAlive() and (pPlayer:GetCivilizationType() == iQaraKhitai) then
		local pTeam = Teams[pPlayer:GetTeam()]

		for pUnit in pPlayer:Units() do --subtract combat strength (-2 every turn) *if the unit moves away from the city state, it still has the combat strength it just goes away over time
			if not (pUnit:GetUnitType() == iOrdo) then --doesnt apply to UU
				local iCombat = GameInfo.Units[pUnit:GetUnitType()].Combat
				if pUnit:GetBaseCombatStrength() > iCombat then
					pUnit:SetBaseCombatStrength(pUnit:GetBaseCombatStrength() - 2)
				elseif pUnit:GetBaseCombatStrength() < iCombat then
					pUnit:SetBaseCombatStrength(iCombat)
				end
			end
		end

		for otherPlayerID, v in pairs(tCityStatesInfluence) do --update Influence from turn to turn
			local pOtherPlayer = Players[otherPlayerID]
			local iInfluence = pOtherPlayer:GetMinorCivFriendshipWithMajor(iPlayer) --or other way around??
			local iDif = iInfluence - v.Influence
			if not pTeam:IsAtWar(pOtherPlayer:GetTeam()) then --Can't be at war with city-state for the bonus to be given
				if iDif < 0 then
					local pCity = pOtherPlayer:GetCapitalCity()
					local bUU = false
					JWW_GiveNearbyUnitsStrength(pCity, iPlayer, iDif, bUU) --if influence decreased, give strength
				end
			end		
			tCityStatesInfluence[otherPlayerID] = {Influence = iInfluence} --update new influence level
		end
	end
end

function JWW_GiveNearbyUnitsStrength(pCity, iPlayer, iDif, bUU) --working
	for i = 0, pCity:GetNumCityPlots(), 1 do
		local pPlot = pCity:GetCityIndexPlot(i)
		if pPlot and pPlot:IsUnit() then
			for i = 0, pPlot:GetNumUnits() - 1 do
				local pUnit = pPlot:GetUnit(i)
				if pUnit:GetOwner() == iPlayer then
					if not (pUnit:GetUnitType() == iOrdo) then --doesnt apply to UU
						if bUU then --Shaojian bonus
							Players[pCity:GetOwner()]:ChangeMinorCivFriendshipWithMajor(iPlayer, -5)
							local iDif = iDif - 5
							pCity:ChangeDamage(7)
						else
							pUnit:SetBaseCombatStrength(pUnit:GetBaseCombatStrength() + math.ceil(iDif * -0.33))
							local iCombat = GameInfo.Units[pUnit:GetUnitType()].Combat
							if pUnit:GetBaseCombatStrength() > (iCombat * 2) then --cap
								pUnit:SetBaseCombatStrength(iCombat * 2)
							end
						end
					end
				end
			end
		end
	end
end
-----------------------------------------------------------------------------
-- All cities gain additional happiness, gold, and culture for each city in the empire with a different original owner.
-----------------------------------------------------------------------------
function JWW_DiversityHire(iPlayer) --working
	local pPlayer = Players[iPlayer]
	local iNumOwners = 0
	if pPlayer:IsAlive() and pPlayer:GetCivilizationType() == iQaraKhitai then
		for i = 0, GameDefines.MAX_PLAYERS - 1, 1 do
			if i then
				local pNextPlayer = Players[i]
				if pNextPlayer:IsEverAlive() then
					for pCity in pPlayer:Cities() do
						if pCity:GetOriginalOwner() == i then
							iNumOwners = iNumOwners + 1
							break
						end
					end
				end
			end
		end

		for pCity in pPlayer:Cities() do
			pCity:SetNumRealBuilding(iUADummy, iNumOwners)
		end
	end
end
-----------------------------------------------------------------------------
if bIsActive then
	GameEvents.PlayerDoTurn.Add(JWW_UpdateInfluenceAndCombatStrength)
	GameEvents.PlayerDoTurn.Add(JWW_DiversityHire)
end
--===========================================================================
-- UU (Ordo Horseman)
--===========================================================================
local iOrdoProm = GameInfoTypes["PROMOTION_JWW_ORDO_DISTANCE_PROM"]
-----------------------------------------------------------------------------
-- Gains more combat strength the further it gets from its origin plot.
-----------------------------------------------------------------------------
local tOrdoStartingLocations = {} --workin (well besides that one bit)

--[[function JWW_StrongerWhenAfar(iPlayer, iCity, iUnit, bGold, bFaithOrCulture) --Give Promotion/Insert info into Table
	local pPlayer = Players[iPlayer]
	if pPlayer:IsAlive() then
		local pUnit = pPlayer:GetUnitByID(iUnit)
		if pUnit:GetUnitType() == iOrdo then
			pUnit:SetHasPromotion(iOrdoProm, true)
			tOrdoStartingLocations[pUnit] = {Plot= pUnit:GetPlot()}
		end
	end
end]]

function JWW_UpdateStrengthFromDistance(iPlayer) --Give Stength Depending on Distance (Updates every turn)
	local pPlayer = Players[iPlayer]
	if pPlayer:IsAlive() then
		for pUnit in pPlayer:Units() do
			if pUnit:GetUnitType() == iOrdo then
				if pUnit:IsHasPromotion(iOrdoProm) then
					for k, v in pairs(tOrdoStartingLocations) do
						if k and (k == pUnit) then
							local iDistance = Map.PlotDistance(v.Plot:GetX(), v.Plot:GetY(), pUnit:GetX(), pUnit:GetY())
							local iCombat = GameInfo.Units[pUnit:GetUnitType()].Combat
							pUnit:SetBaseCombatStrength(iCombat + iDistance)
						end
					end
				else
					pUnit:SetHasPromotion(iOrdoProm, true)
					tOrdoStartingLocations[pUnit] = {Plot= pUnit:GetPlot()}
				end
			end
		end
	end
end
-----------------------------------------------------------------------------
if bIsActive then
	GameEvents.CityTrained.Add(JWW_StrongerWhenAfar)
	GameEvents.PlayerDoTurn.Add(JWW_UpdateStrengthFromDistance)
end
--===========================================================================
-- UU (Shaojian)
--===========================================================================
local iShaojian = GameInfoTypes["UNIT_JWW_SHAOJIAN"]
-----------------------------------------------------------------------------
--1. Trade Missions conducted grant double the gold, but lose influence instead of gaining influence.
--2. If adjacent friendly combat units are nearby, more influence will be lost and the city will be damaged.
-----------------------------------------------------------------------------
function JWW_ChangeInfluenceAndGold(iPlayer, iUnit, unitType, iX, iY, bDelay, killerID) --working
	if not bDelay then return end
	local pPlayer = Players[iPlayer]
	local pUnit = pPlayer:GetUnitByID(iUnit)
	if pUnit:GetUnitType() == iShaojian then
		local pPlot = Map.GetPlot(iX, iY)
		local pOwner = Players[pPlot:GetOwner()]
		if pOwner:IsMinorCiv() then
			--1
			pOwner:ChangeMinorCivFriendshipWithMajor(iPlayer, -50)
			local iEra = pPlayer:GetCurrentEra()
			local iSpeed = Game.GetGameSpeedType()
			pPlayer:ChangeGold(300 + (100 * iEra * iSpeed)) --modifier for trade mission gold
			if pPlayer:IsHuman() then
				Events.GameplayAlertMessage('But the Shaojian doubles this [ICON_GOLD] Gold, and subtracts this [ICON_INFLUENCE] Influence instead!')
			end

			--2
			local bUU = true
			local pCity = pOwner:GetCapitalCity()
			local iDif = -30
			JWW_GiveNearbyUnitsStrength(pCity, iPlayer, iDif, bUU) --UA + UU pt2
		end
	end
end
-----------------------------------------------------------------------------
if bIsActive then
	GameEvents.UnitPrekill.Add(JWW_ChangeInfluenceAndGold)
end
--===========================================================================