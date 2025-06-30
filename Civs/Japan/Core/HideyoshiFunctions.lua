--=======================================================================================================================
-- Senshi's Japan (Toyotomi Hideyoshi)
--=======================================================================================================================
include("PlotIterators")
include("FLuaVector.lua")
include("C15_IteratorPack_v4")
local iHideyoshiCiv = GameInfoTypes.CIVILIZATION_SENSHI_HIDEYOSHI;

------------------------------------------------------------------------------------------------------------------------
-- JFD_IsCivilisationActive
------------------------------------------------------------------------------------------------------------------------
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

local isHideyoshiCivActive = JFD_IsCivilisationActive(iHideyoshiCiv);

--========================================================================================================================
-- UNIQUE ABILITY: Gekokujo
--========================================================================================================================
local iLeadership = GameInfoTypes.PROMOTION_GREAT_GENERAL;
local iCourthouseDummy = GameInfoTypes.BUILDING_SENSHI_HIDEYOSHI_DUMMY;
local iDomainSea = GameInfoTypes.DOMAIN_SEA;

------------------------------------------------------------------------------------------------------------------------
-- DoPromoteCityCapture
------------------------------------------------------------------------------------------------------------------------
function DoPromoteCityCapture(iPlayer, bCapital, iX, iY, iNewPlayer)
	local pPlayer = Players[iNewPlayer]
	if pPlayer:GetCivilizationType() == iHideyoshiCiv then
		local pPlot = Map.GetPlot(iX, iY)
		for pUnit in C15_PlotUnitsIterator(pPlot) do
			if pUnit and pUnit:GetOwner() == iNewPlayer then
				if (not pUnit:IsHasPromotion(iLeadership)) and pUnit:GetDomainType() ~= iDomainSea then
					pUnit:SetHasPromotion(iLeadership, true)
					--print(pUnit, "captured a city, gained Leadership")
					if pPlayer:IsHuman() then
						local hex = HexToWorld(ToHexFromGrid(Vector2(iX, iY)))
						Events.AddPopupTextEvent(hex, Locale.ConvertTextKey("Leadership"))
					end
				end
			end
		end
	end
end

------------------------------------------------------------------------------------------------------------------------
-- DoLeadershipCourthouse
------------------------------------------------------------------------------------------------------------------------
function DoLeadershipCourthouse(iPlayer)
	local pPlayer = Players[iPlayer]
	if pPlayer:GetCivilizationType() == iHideyoshiCiv then
		for pCity in pPlayer:Cities() do
			pCity:SetNumRealBuilding(iCourthouseDummy, 0)
			if pCity:GetOriginalOwner() ~= iPlayer then
				local pPlot = pCity:Plot()
				for pUnit in C15_PlotUnitsIterator(pPlot) do
					if pUnit and pUnit:IsHasPromotion(iLeadership) then
						--print(pCity, "is being pacified by", pUnit)
						pCity:SetNumRealBuilding(iCourthouseDummy, 1)
					end
				end
			end
		end
	end
end
			
if isHideyoshiCivActive then
	GameEvents.CityCaptureComplete.Add(DoPromoteCityCapture);
	GameEvents.PlayerDoTurn.Add(DoLeadershipCourthouse);
end

--========================================================================================================================
-- UNIQUE UNIT: Ashigaru
--========================================================================================================================
local iAshigaru = GameInfoTypes.UNIT_SENSHI_ASHIGARU;
local iMusketman = GameInfoTypes.UNIT_MUSKETMAN;
local iPikemanClass = GameInfoTypes.UNITCLASS_PIKEMAN;
local iNoCapture = GameInfoTypes.PROMOTION_NO_CAPTURE;

------------------------------------------------------------------------------------------------------------------------
-- DoAshigaruAdjacency
------------------------------------------------------------------------------------------------------------------------
function DoAshigaruAdjacency(iPlayer)
	local pPlayer = Players[iPlayer]
	if pPlayer:HasUnitOfClassType(iPikemanClass) then
		for pUnit in pPlayer:Units() do
			if pUnit:GetUnitType() == iAshigaru then
				local pPlot = pUnit:GetPlot()
				local iStrength = GameInfo.Units[iAshigaru].Combat
				local iDelta = 0
				for pAdjUnit in C15_NearbyUnitIterator(pPlot, false) do
					if pAdjUnit:GetUnitType() == iAshigaru then
						iDelta = iDelta+1
					end
				end				
				pUnit:SetBaseCombatStrength(iStrength + iDelta)
				if iDelta > 0 then
					--print("Ashigaru with strength of ", iStrength + iDelta)
				end
			end
		end
	end
end

------------------------------------------------------------------------------------------------------------------------
-- DoAshigaruCityCapture
------------------------------------------------------------------------------------------------------------------------
function DoAshigaruCityCapture(iPlayer, bCapital, iX, iY, iNewPlayer)
	local pPlayer = Players[iNewPlayer]
	local pPlot = Map.GetPlot(iX, iY)
	for pUnit in C15_PlotUnitsIterator(pPlot) do
		if pUnit and pUnit:GetUnitType() == iAshigaru and (not pUnit:IsHasPromotion(iNoCapture)) then
			pUnit:SetHasPromotion(iNoCapture, true)
			local pNewUnit = pPlayer:InitUnit(iMusketman, iX, iY)
			pNewUnit:SetDamage(pUnit:GetDamage())
			pNewUnit:SetExperience(pUnit:GetExperience())
			pNewUnit:SetLevel(pUnit:GetLevel())
			for unitPromotion in GameInfo.UnitPromotions() do
				local iPromotionID = unitPromotion.ID;
				if (pUnit:IsHasPromotion(iPromotionID)) then
					pNewUnit:SetHasPromotion(iPromotionID, true)
				end
			end
			pNewUnit:SetMoves(0)
			--print("Ashigaru", pUnit, "captured a City, upgraded to Musketman", pNewUnit)			
			pUnit:Kill(true, -1)
			pNewUnit:SetHasPromotion(iNoCapture, false)
		end
	end
end

GameEvents.PlayerDoTurn.Add(DoAshigaruAdjacency);
GameEvents.CityCaptureComplete.Add(DoAshigaruCityCapture);

--========================================================================================================================
-- UNIQUE BUILDING: Wajo
--========================================================================================================================
local iWajo = GameInfoTypes.BUILDING_SENSHI_WAJO;
local iDamage = 35

------------------------------------------------------------------------------------------------------------------------
-- DoDamageFromWajo
------------------------------------------------------------------------------------------------------------------------
function DoDamageFromWajo(iPlayer, iCity, iBuilding, bGold, bFaithOrCulture)
	local pPlayer = Players[iPlayer]
	if pPlayer:GetCivilizationType() == iHideyoshiCiv then
		if iBuilding == iWajo then
			local pCity = pPlayer:GetCityByID(iCity);
			if pCity:GetOriginalOwner() ~= iPlayer then
				local pOriginalOwner = Players[pCity:GetOriginalOwner()]
				for pTargetCity in pOriginalOwner:Cities() do
					pTargetCity:ChangeDamage(iDamage)
					--print(pTargetCity:GetName(), "was damaged by Wajo built in", pCity:GetName())
				end
				if pOriginalOwner:IsHuman() then
					local pCityName = pCity:GetName()
					local alertMessage = Locale.ConvertTextKey("TXT_KEY_BUILDING_SENSHI_WAJO_NOTIFICATION", pCityName)
					Events.GameplayAlertMessage(alertMessage)
				end
			end
		end
	end
end

if isHideyoshiCivActive then
	GameEvents.CityConstructed.Add(DoDamageFromWajo);
end