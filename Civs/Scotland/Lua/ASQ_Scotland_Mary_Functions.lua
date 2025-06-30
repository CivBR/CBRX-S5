-- ASQ_Scotland_Mary_Functions
-- Author: NopeCopter
-- DateCreated: 3/21/2025
--==========================================================================================================================
-- INCLUDES
--==========================================================================================================================
------------------------------------------------------------------------------------------------------------------------
include("FLuaVector.lua")
include("PlotIterators.lua")
--include("UniqueDiplomacyUtilsV2.lua")
--==========================================================================================================================
-- GLOBALS
--==========================================================================================================================
------------------------------------------------------------------------------------------------------------------------
local g_ConvertTextKey  = Locale.ConvertTextKey
local g_MapGetPlot		= Map.GetPlot
local g_MathCeil		= math.ceil
local g_MathFloor		= math.floor
local g_MathMax			= math.max
local g_MathMin			= math.min
				
local Players 			= Players
local HexToWorld 		= HexToWorld
local ToHexFromGrid 	= ToHexFromGrid
local Teams 			= Teams
--==========================================================================================================================
-- UTILITIES
--==========================================================================================================================
------------------------------------------------------------------------------------------------------------------------
-- CORE UTILITIES
------------------------------------------------------------------------------------------------------------------------
--HasTrait
function HasTrait(player, traitID)
	if Player.HasTrait then 
		return player:HasTrait(traitID)
	else
		local leaderType = GameInfo.Leaders[player:GetLeaderType()].Type
		local traitType  = GameInfo.Traits[traitID].Type
		for row in GameInfo.Leader_Traits("LeaderType = '" .. leaderType .. "' AND TraitType = '" .. traitType .. "'") do
			return true
		end
	end
	return false
end

----------------------------------------------------------------------------------------------------------------------------
-- JFD_IsCivilisationActive
function JFD_IsCivilizationActive(civilizationID)
	for iSlot = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
		local slotStatus = PreGame.GetSlotStatus(iSlot)
		if (slotStatus == SlotStatus["SS_TAKEN"] or slotStatus == SlotStatus["SS_COMPUTER"]) then
			if PreGame.GetCivilization(iSlot) == civilizationID then
				return true
			end
		end
	end
	return false
end

function Neirai_GetNearestCity(pPlayer, pPlot)
    local distance = 9999
    local cNearestCity = nil
    for cCity in pPlayer:Cities() do
        local pCityPlot = cCity:Plot()
        local between = Map.PlotDistance(pCityPlot:GetX(), pCityPlot:GetY(), pPlot:GetX(), pPlot:GetY())
        if (between < distance) and (between > 0) then
            distance = between
            cNearestCity = cCity
        end
    end
    return cNearestCity
end

function GetTradeRoutesFromCity(pCity)
	local pOwner = Players[pCity:GetOwner()]
	local tLocalRoutes = {}
	local iVal = 1
	for k, v in pairs(pOwner:GetTradeRoutes()) do
		if v.FromCity == pCity then
			tLocalRoutes[iVal] = v
			iVal = iVal + 1
		end
	end
	return tLocalRoutes
end

function GetNumTradeRoutesFromCity(pCity)
	local pOwner = Players[pCity:GetOwner()]
	local iVal = 1
	for k, v in pairs(pOwner:GetTradeRoutes()) do
		if v.FromCity == pCity then
			iVal = iVal + 1
		end
	end
	return iVal
end

------------------------------------------------------------------------------------------------------------------------
-- GetPlayerByCivilization
------------------------------------------------------------------------------------------------------------------------
function GetPlayerByCivilization(civilizationType)
	for _, pPlayer in pairs(Players) do
		if pPlayer and pPlayer:GetCivilizationType() == civilizationType then 
			return pPlayer
		end
	end
end
------------------------------------------------------------------------------------------------------------------------
-- MOD UTILITIES
------------------------------------------------------------------------------------------------------------------------
--Game_IsCPActive
function Game_IsCPActive()
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if mod.ID == "d1b6328c-ff44-4b0d-aad7-c657f83610cd" then
			return true
		end
	end
	return false
end
local g_IsCPActive = (Game_IsCPActive() and Player.HasStateReligion)
------------------------------------------------------------------------------------------------------------------------
--Game_IsVMCActive
function Game_IsVMCActive()
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if mod.ID == "d1b6328c-ff44-4b0d-aad7-c657f83610cd" then
			return true
		end
	end
	return false
end
local g_IsVMCActive = Game_IsVMCActive()
--==========================================================================================================================
-- GAME DEFINES
--==========================================================================================================================
------------------------------------------------------------------------------------------------------------------------
local defineMaxMajorCivs = GameDefines["MAX_MAJOR_CIVS"]
local defineMaxMinorCivs = GameDefines["MAX_MINOR_CIVS"]
--==========================================================================================================================
-- UNIQUE FUNCTIONS
--==========================================================================================================================
------------------------------------------------------------------------------------------------------------------------
-- GLOBALS
------------------------------------------------------------------------------------------------------------------------
local civilizationBarbarianID = 63
local civilizationID = GameInfoTypes["CIVILIZATION_ASQ_SCOTLAND_MARY"]
local bIsActive = JFD_IsCivilizationActive(civilizationID)
local traitScotlandMaryID = GameInfoTypes["TRAIT_ASQ_SCOTLAND_MARY"]

local buildingKirkID = GameInfoTypes["BUILDING_ASQ_KIRK"]
local buildingKirkHappinessDummyID = GameInfoTypes["BUILDING_ASQ_KIRK_HAPPINESS_DUMMY"]
local buildingPlotCountID = GameInfoTypes["BUILDING_ASQ_SCOTLAND_PLOTCOUNT"]
local buildingPlotCooldownID = GameInfoTypes["BUILDING_ASQ_SCOTLAND_PLOT_COOLDOWN"]
local buildingMaryScotFaithDummyID = GameInfoTypes["BUILDING_ASQ_SCOTLAND_FAITH_DUMMY"]

local promotionHackbutterBonusID = GameInfoTypes["PROMOTION_ASQ_SCOTLAND_HACKBUTTER_BONUS"]

local unitHackbutterID = GameInfoTypes["UNIT_ASQ_HACKBUTTER"]

local iPracticalNumCivs = (GameDefines.MAX_MAJOR_CIVS - 1)

-- Adapted from TopHat's France, but hopefully not horribly bugged
function GetTraitPlayerFromTeam(teamID, traitID)
	local iTeam = 0
	for iPlayer = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
		local pPlayer = Players[iPlayer]
		if pPlayer and pPlayer:GetCivilizationType() == civilizationID then -- TODO: If this doesn't work, bypass HasTrait entirely here
			iTeam = pPlayer:GetTeam()
			if iTeam == teamID then
				return pPlayer
			end
		end
	end
	return nil
end
------------------------------------------------------------------------------------------------------------------------
-- FUNCTIONS
------------------------------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------------------------------------
-- UA: Cities with a spy grant some of their faith in the capital
----------------------------------------------------------------------------------------------------------------------------

-- Adapted from TopHat's France (Louis XI)
function ASQ_ScotlandMary_UpdateWhichCitiesSpiedOn(playerID)
	local pPlayer = Players[playerID]
	if not pPlayer:IsAlive() then return end
	if pPlayer:GetCivilizationType() == civilizationID then
		local pCapital = pPlayer:GetCapitalCity()
		local pFaithTotal = 0
		
		if pPlayer:GetNumSpies() < 1 then return end
		-- this for loop marks currently spied-upon cities
		-- "GES" stands for GetEspionageSpies
		
		if pCapital then
			for kGES, vGES in pairs(pPlayer:GetEspionageSpies()) do
				local pTargetPlot = Map.GetPlot(vGES.CityX, vGES.CityY)
				if pTargetPlot then
					local cTargetCity = pTargetPlot:GetPlotCity()
					local cityFaithCount = cTargetCity:GetFaithPerTurn()
					pFaithTotal = pFaithTotal + math.ceil(cityFaithCount / 5)
				end
			end
			
			pCapital:SetNumRealBuilding(buildingMaryScotFaithDummyID, pFaithTotal)
		end
		
		
	end
end


if bIsActive then
	GameEvents.PlayerDoTurn.Add(ASQ_ScotlandMary_UpdateWhichCitiesSpiedOn)
end

----------------------------------------------------------------------------------------------------------------------------
-- UU: Stronger when starting its turn adjacent to barbarians
----------------------------------------------------------------------------------------------------------------------------
function ASQ_ScotlandMary_UU_PlayerDoTurn(playerID)
	local pPlayer = Players[playerID]
	if pPlayer == nil then return end
	if not pPlayer:IsAlive() then return end
	if pPlayer:GetCivilizationType() ~= civilizationID then return end
	for unit in pPlayer:Units() do
		local bGive = false
		if unit:GetUnitType() == unitHackbutterID then
			local pUnitPlot = unit:GetPlot()
			for nearbyPlot in PlotAreaSweepIterator(pUnitPlot, 1, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
				if nearbyPlot then
					local nearbyPlotUnit = nearbyPlot:GetUnit()
					if nearbyPlotUnit and nearbyPlotUnit:GetOwner() == civilizationBarbarianID then
						bGive = true
						break
					end
				end
			end
		end
		
		unit:SetHasPromotion(promotionHackbutterBonusID, bGive)
	end
end

if bIsActive then
	GameEvents.PlayerDoTurn.Add(ASQ_ScotlandMary_UU_PlayerDoTurn)
end


----------------------------------------------------------------------------------------------------------------------------
-- UB: Generates a burst of Culture and Faith when this city is converted
----------------------------------------------------------------------------------------------------------------------------
local iCultureBase = 20
local iFaithBase = 20

function ASQ_ScotlandMary_UB_OnConversion(playerID, religionID, iX, iY)
	local pPlayer = Players[playerID]
	local cCity = Map.GetPlot(iX, iY):GetPlotCity()
	local iEra = pPlayer:GetCurrentEra()
	if pPlayer:GetCivilizationType() == civilizationID then
		if cCity:IsHasBuilding(buildingKirkID) then
			pPlayer:ChangeJONSCulture(iCultureBase * (iEra + 1))
			pPlayer:ChangeFaith(iFaithBase * (iEra + 1))
		end
	end
end


if bIsActive then
	GameEvents.CityConvertsReligion.Add(ASQ_ScotlandMary_UB_OnConversion)
end
----------------------------------------------------------------------------------------------------------------------------
-- UB: +2 happiness in cities following another religion
----------------------------------------------------------------------------------------------------------------------------
local function ScotlandMary_Main_GetMainReligion(pPlayer)
	if pPlayer:HasCreatedReligion() then
		return pPlayer:GetReligionCreatedByPlayer()
	end
	if pPlayer:GetCapitalCity() then
		return pPlayer:GetCapitalCity():GetReligiousMajority()
	end
	return -1
end

-- Also removes the once-per-turn Plot lock button
function ASQ_ScotlandMary_UB_PlayerDoTurn(playerID)
	local pPlayer = Players[playerID]
	if pPlayer == nil then return end
	if not pPlayer:IsAlive() then return end
	if pPlayer:GetCivilizationType() ~= civilizationID then return end
	local iReligion = ScotlandMary_Main_GetMainReligion(pPlayer)
	for cCity in pPlayer:Cities() do
		local bGive = 0
		if cCity:IsHasBuilding(buildingKirkID) then
			if cCity:GetReligiousMajority() ~= -1 and cCity:GetReligiousMajority() ~= iReligion then
				bGive = 1
			end
		end
		
		cCity:SetNumRealBuilding(buildingKirkHappinessDummyID, bGive)
		if cCity:IsHasBuilding(buildingPlotCooldownID) then
			cCity:SetNumRealBuilding(buildingPlotCooldownID, cCity:GetNumRealBuilding(buildingPlotCooldownID) - 1)
		end
	end
end

if bIsActive then
	GameEvents.PlayerDoTurn.Add(ASQ_ScotlandMary_UB_PlayerDoTurn)
end

print("ASQ_ScotlandMary_Functions.lua loaded!")