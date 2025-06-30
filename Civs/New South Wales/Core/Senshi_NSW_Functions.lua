-- Civs_SenshiNSWa_Functions
-- Author: JFD
-- DateCreated: 2/15/2014 6:33:36 PM
--==========================================================================================================================
-- INCLUDES
--==========================================================================================================================
------------------------------------------------------------------------------------------------------------------------
include("FLuaVector.lua")
include("PlotIterators.lua")
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
------------------------------------------------------------------------------------------------------------------------
--MATH UTILS
------------------------------------------------------------------------------------------------------------------------
--Game.GetRandom
function Game.GetRandom(lower, upper)
	return Game.Rand((upper + 1) - lower, "") + lower
end
local g_GetRandom = Game.GetRandom
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
local buildingSheepStationID = GameInfoTypes["BUILDING_SENSHI_SHEEP_STATION"]
local buildingDumSheepStationID = GameInfoTypes["BUILDING_SENSHI_NSW_SHEEP_DUMMY"]

local improvementPastureID = GameInfoTypes["IMPROVEMENT_PASTURE"]

local resourceSheepID = GameInfoTypes["RESOURCE_SHEEP"]

local traitNSWID = GameInfoTypes["TRAIT_SENSHI_NEW_SOUTH_WALES"]

local unitRumCorpsID = GameInfoTypes["UNIT_SENSHI_RUM_CORPS"]

local tPastures = {}
tPastures[-1] = {}
------------------------------------------------------------------------------------------------------------------------
-- FUNCTIONS
------------------------------------------------------------------------------------------------------------------------
function HurtFoesNearNSW(plot, playerTeam)
	for loopPlot2 in PlotAreaSweepIterator(plot, 2, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_INCLUDE) do
		for index = 0,(loopPlot2:GetNumUnits() - 1) do
			local unit = loopPlot2:GetUnit(index)
			local unitOwner = Players[unit:GetOwner()]
			if playerTeam:IsAtWar(unitOwner:GetTeam()) then
				unit:ChangeDamage(5)
			end
		end
	end
end

--SenshiNSWa_PlayerDoTurn
local function SenshiNSWa_PlayerDoTurn(playerID)
	local player = Players[playerID]
	local playerTeam = Teams[player:GetTeam()]
	if (not player:IsAlive()) then return end
	if player:IsBarbarian() then return end
	if player:IsMinorCiv() then return end
	
	if not tPastures[playerID] then
		tPastures[playerID] = {}
	end
	
	local playerCapital = player:GetCapitalCity()
	if (not playerCapital) then return end
	
	--UB (new)
	local bIsAtWar = (playerTeam:GetAtWarCount(true) > 0)
	if player:CountNumBuildings(buildingSheepStationID) > 0 then
		-- first, track which cities have the UB
		local tSheepCities = {}
		for city in player:Cities() do
			if city:IsHasBuilding(buildingSheepStationID) then
				tSheepCities[city] = true
			elseif city:IsHasBuilding(buildingDumSheepStationID) then
				city:SetNumRealBuilding(buildingDumSheepStationID, 0)
			end
		end
		-- then check your pastures and trigger the ability as needed
		local tSheepPerCity = {}
		for plotID, _ in pairs(tPastures[playerID]) do
			local pPlot = Map.GetPlotByIndex(plotID)
			if pPlot:GetImprovementType() == improvementPastureID then
				local plotOwnerID = pPlot:GetOwner()
				if plotOwnerID == playerID then
					local pCity = pPlot:GetWorkingCity() -- only works w/i 3 tiles of a city but so does the original code
					if pCity:IsHasBuilding(buildingSheepStationID) then
						-- damage nearby enemy units
						if bIsAtWar then
							HurtFoesNearNSW(pPlot, playerTeam)
						end
						-- check sheep
						if pPlot:GetResourceType() == resourceSheepID and tSheepPerCity[pCity] then
							tSheepPerCity[pCity] = (tSheepPerCity[pCity] + 1) or 1
						end
					end
				else
					tPastures[playerID][plotID] = false
					tPastures[plotOwnerID][plotID] = true
				end
			else
				tPastures[playerID][plotID] = false
			end
		end
		for pCity, iNumSheep in pairs(tSheepPerCity) do
			pCity:SetNumRealBuilding(buildingDumSheepStationID, iNumSheep)
		end
	elseif player:CountNumBuildings(buildingDumSheepStationID) > 0 then
		for city in player:Cities() do
			city:SetNumRealBuilding(buildingDumSheepStationID, 0)
		end
	end
end
GameEvents.PlayerDoTurn.Add(SenshiNSWa_PlayerDoTurn)
------------------------------------------------------------------------------------------------------------------------
local tHappyRes = {}
for row in DB.Query("SELECT * FROM Resources WHERE Happiness > 0") do
	tHappyRes[row.ID] = true
end

--Senshi_NSW_PlayerCityFounded
function Senshi_NSW_PlayerCityFounded(playerID, plotX, plotY)
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	local playerTeamID = player:GetTeam()
	
	--UA
	local playerCapital = player:GetCapitalCity()
	if (not playerCapital) then return end
		
	if (not HasTrait(player, traitNSWID)) then return end
	local plot = g_MapGetPlot(plotX, plotY)
	local city = plot:GetPlotCity()
	local playerIsHuman = (player:IsHuman() and player:IsTurnActive())
	for loopPlot in PlotAreaSpiralIterator(plot, 3, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
		local plotResourceID = loopPlot:GetResourceType()
		if plotResourceID > -1 then
			if tHappyRes[plotResourceID] then
				loopPlot:SetRevealed(playerTeamID, true)	
				if playerIsHuman then
					local hex = ToHexFromGrid(Vector2(loopPlot:GetX(), loopPlot:GetY()))
					Events.GameplayFX(hex.x, hex.y, -1)
				end
			end
		end
	end
end
GameEvents.PlayerCityFounded.Add(Senshi_NSW_PlayerCityFounded)
----------------------------------------------------------------------------------------------------------------------------
--Senshi_NSW_BuildFinished
local function Senshi_NSW_BuildFinished(playerID, plotX, plotY, improvementID)
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	local playerTeamID = player:GetTeam()
	
	--UA
	if (not HasTrait(player, traitNSWID)) then return end
	local plot = g_MapGetPlot(plotX, plotY)
	local plotResourceID = plot:GetResourceType()
	if plotResourceID > -1 then
		if tHappyRes[plotResourceID] then
			for loopPlot in PlotRingIterator(plot, 1, SECTOR_NORTH, DIRECTION_CLOCKWISE) do
				if loopPlot:GetOwner() == -1 then
					local cityID = plot:GetWorkingCity():GetID()
					loopPlot:SetOwner(playerID, cityID, true, true)
					loopPlot:SetRevealed(playerTeamID, true)	
				end
			end
		end
	end
	
	--pasture table: new pasture
	local plotID = plot:GetPlotIndex()
	local plotOwnerID = plot:GetOwner()
	if improvementID == improvementPastureID then
		tPastures[plotOwnerID][plotID] = true
	elseif tPastures[plotOwnerID][plotID] then
		tPastures[plotOwnerID][plotID] = nil
	end
end
GameEvents.BuildFinished.Add(Senshi_NSW_BuildFinished)
------------------------------------------------------------------------------------------------------------------------
local tRawResources = {}
for row in DB.Query("SELECT * FROM Resources WHERE OnlyMinorCivs = 0 AND CivilizationType IS NULL") do
	tRawResources[row.ID] = true
end

--Senshi_NSW_CityTrained
local function Senshi_NSW_CityTrained(playerID, cityID, unitID)
    local player = Players[playerID]
	local playerTeam = Teams[player:GetTeam()]
	local playerTeamTechs = playerTeam:GetTeamTechs()
	if (not player:IsAlive()) then return end
	local unit = player:GetUnitByID(unitID)
	
	--UA
	if (not HasTrait(player, traitNSWID)) then return end
	local numCS = 0
	if unit:IsCombatUnit() then
		for row, _ in pairs(tRawResources) do
			numCS = numCS + player:GetResourceExport(row)
			if numCS >= 10 then numCS = 10 break end
		end	
		if numCS > 0 then
			numCSPercent = math.ceil(unit:GetBaseCombatStrength()*numCS/100)
			numCSGiven = numCSPercent + unit:GetBaseCombatStrength()
			unit:SetBaseCombatStrength(numCSGiven)
		end
	end

	--UU
	if unit:GetUnitType() == unitRumCorpsID then
		local numXP = player:GetHappinessFromResources()
		unit:ChangeExperience(numXP)
	end
end
GameEvents.CityTrained.Add(Senshi_NSW_CityTrained)
------------------------------------------------------------------------------------------------------------------------
--Senshi_NSW_CityCaptureComplete
local function Senshi_NSW_CityCaptureComplete(oldOwnerID, isCapital, plotX, plotY, newOwnerID)
	local player = Players[newOwnerID]
	if (not player:IsAlive()) then return end

	local city = g_MapGetPlot(plotX, plotY):GetPlotCity()
	if (not city) then return end

	local playerCapital = player:GetCapitalCity()
	if (not playerCapital) then return end

	--UA
	if city:GetGarrisonedUnit() and city:GetGarrisonedUnit() == unitRumCorpsID then
		local resources = {}
		local resourcesCount = 1
		for row, _ in pairs(tRawResources) do
			resources[resourcesCount] = row
			resourcesCount = resourcesCount + 1
		end	
		local resourceID = resources[g_GetRandom(1,#resources)]
		if resourceID then
			local plot = g_MapGetPlot(plotX, plotY)
			plot:SetResourceType(resourceID)
		end
	end
	
	--pasture table: pastures captured
	for loopPlot in PlotAreaSweepIterator(city:Plot(), 3, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
		local plotID = loopPlot:GetPlotIndex()
		if loopPlot:GetImprovementType() == improvementPastureID then
			tPastures[oldOwnerID][plotID] = false
			tPastures[newOwnerID][plotID] = true
		end
	end
end
GameEvents.CityCaptureComplete.Add(Senshi_NSW_CityCaptureComplete)
--=======================================================================================================================
--=======================================================================================================================
