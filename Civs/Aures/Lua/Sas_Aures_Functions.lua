--==========================================================================================================================
------------------------------------------------------------------------------------------------------------------------
-- Sas_Aures_Functions
-- Author: JFD
-- DateCreated: 5/4/2014 12:54:31 AM
--==========================================================================================================================
-- INCLUDES
--==========================================================================================================================
------------------------------------------------------------------------------------------------------------------------
include("PlotIterators")
include("FLuaVector.lua")
--==========================================================================================================================
-- GLOBALS
--==========================================================================================================================
----------------------------------------------------------------------------------------------------------------------------
local g_ConvertTextKey  = Locale.ConvertTextKey
local g_MapGetDistance	= Map.GetDistance
local g_MapGetPlot		= Map.GetPlot
local g_MathCeil		= math.ceil
local g_MathFloor		= math.floor
local g_MathMax			= math.max
local g_MathMin			= math.min
				
local Players 			= Players
local HexToWorld 		= HexToWorld
local ToHexFromGrid 	= ToHexFromGrid
local Teams 			= Teams

local activePlayerID	= Game.GetActivePlayer()
local activePlayer		= Players[activePlayerID]
local activeTeamID		= activePlayer:GetTeam()
local activeTeam		= Teams[activeTeamID]
--==========================================================================================================================
-- UTILITIES
--==========================================================================================================================
-- CORE UTILITIES
----------------------------------------------------------------------------------------------------------------------------
--Game_IsCPActive
function Game_IsCPActive()
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if mod.ID == "d1b6328c-ff44-4b0d-aad7-c657f83610cd" then
			return true
		end
	end
	return false
end
local g_IsCPActive = Game_IsCPActive()
----------------------------------------------------------------------------------------------------------------------------
--HasTrait
function HasTrait(player, traitID)
	if g_IsCPActive then 
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
--Player_SendWorldEvent
local notificationWorldEventID = NotificationTypes["NOTIFICATION_DIPLOMACY_DECLARATION"]
function Player_SendWorldEvent(player, description, includeHuman)
	print("Sending World Event: ", description)
	local playerTeam = Teams[player:GetTeam()]
	if (not includeHuman) and player:IsHuman() then return end
	if (not playerTeam:IsHasMet(activeTeamID)) then return end
	activePlayer:AddNotification(notificationWorldEventID, description, "[COLOR_POSITIVE_TEXT]World Events[ENDCOLOR]", -1, -1)
end 
-------------------------------------------------------------------------------------------------------------------------
--Player_SendNotification
function Player_SendNotification(player, notificationType, description, descriptionShort, global, data1, data2, unitID, data3, metOnly, includesSerialMessage)
	local notificationID = NotificationTypes[notificationType]
	local teamID = player:GetTeam()
	local data1 = data1 or -1
	local data2 = data2 or -1
	local unitID = unitID or -1
	local data3 = data3 or -1
	if global then
		if (metOnly and activeTeam:IsHasMet(teamID) or (not metOnly)) then
			activePlayer:AddNotification(notificationID, description, descriptionShort, data1, data2, unitID, data3)
			if (includesSerialMessage and description) then Events.GameplayAlertMessage(description) end
		end
	else
		if (not player:IsHuman()) then return end
		if (metOnly and activeTeam:IsHasMet(teamID) or (not metOnly)) then
			activePlayer:AddNotification(notificationID, description, descriptionShort, data1, data2, unitID, data3)
			if (includesSerialMessage and description) then Events.GameplayAlertMessage(description) end
		end
	end
end   
------------------------------------------------------------------------------------------------------------------------
--Game_GetRandom
function Game_GetRandom(lower, upper)
	return Game.Rand((upper + 1) - lower, "") + lower
end
local g_GetRandom = Game_GetRandom
--=======================================================================================================================
-- MOD USE
--=======================================================================================================================
-- MODS
-------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------
-- SETTINGS
-------------------------------------------------------------------------------------------------------------------------
--==========================================================================================================================
-- GAME DEFINES
--==========================================================================================================================
----------------------------------------------------------------------------------------------------------------------------
local defineMaxMajorCivs = GameDefines["MAX_MAJOR_CIVS"]
local defineMaxPlayers = GameDefines["MAX_PLAYERS"]
--==========================================================================================================================
-- UNIQUE FUNCTIONS
--==========================================================================================================================
-- GLOBALS
--------------------------------------------------------------------------------------------------------------------------
local buildingDummyAuresID = GameInfoTypes["BUILDING_DUMMY_SAS_AURES"]
local buildingDummyKsourID = GameInfoTypes["BUILDING_DUMMY_SAS_KSOUR"]
local buildingKsourID = GameInfoTypes["BUILDING_SAS_KSOUR"]
local civilizationSasAuresID = GameInfoTypes["CIVILIZATION_SAS_AURES"]
local unitZenataID = GameInfoTypes["UNIT_SAS_ZENATAHORSEMAN"]
local promotionAuresID = GameInfoTypes["PROMOTION_SAS_AURES"]
local promotionSasZenataIgnoreZoCID = GameInfoTypes["PROMOTION_SAS_ZENATA_IGNORE_ZOC"]
local unitCombatRangedID = GameInfoTypes["UNITCOMBAT_RANGED"]
local yieldFaithID = GameInfoTypes["YIELD_FAITH"]
local terrainDesertID = GameInfoTypes["TERRAIN_DESERT"]
--------------------------------------------------------------------------------------------------------------------------
-- FUNCTIONS
--------------------------------------------------------------------------------------------------------------------------
--Sas_Aures_PlayerDoTurn
local function Sas_Aures_PlayerDoTurn(playerID)
	local player = Players[playerID]
	local playerTeamID = player:GetTeam()
	local playerTeam = Teams[player:GetTeam()]
	if (not player:IsAlive()) then return end
	if player:IsBarbarian() then return end
	if player:IsMinorCiv() then return end
	
	local playerCapital = player:GetCapitalCity()
	if (not playerCapital) then return end

	--UA
	if player:GetCivilizationType() == civilizationSasAuresID then
		local numGPBonus = 0
		local numResourceBonus = {}
		for unit in player:Units() do
			unit:SetHasPromotion(promotionAuresID, false)
			local plot = g_MapGetPlot(unit:GetX(), unit:GetY())
			if unit:GetUnitCombatType() ~= unitCombatRangedID and plot:IsImprovementPillaged() then
				unit:SetHasPromotion(promotionAuresID, true)
			end
		end

		for city in player:Cities() do
			local numPillagedFaith = 0
			local plot = g_MapGetPlot(city:GetX(), city:GetY())
			local adjacentDesert = false
			for loopPlot in PlotAreaSweepIterator(plot, 3, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
				if loopPlot:IsImprovementPillaged() and loopPlot:GetOwner() == city:GetOwner() then
					numPillagedFaith = numPillagedFaith + 1
				end
				if loopPlot:GetTerrainType() == terrainDesertID then
					adjacentDesert = true
				end
			end
			city:SetNumRealBuilding(buildingDummyAuresID, numPillagedFaith)

			if city:IsHasBuilding(buildingKsourID) and (not city:IsHasBuilding(buildingDummyKsourID)) then
				if plot:GetTerrainType() == terrainDesertID or adjacentDesert then
					city:SetNumRealBuilding(buildingDummyKsourID, 1)
				end
			end	
		end
	end
end
GameEvents.PlayerDoTurn.Add(Sas_Aures_PlayerDoTurn)
------------------------------------------------------------------------------------------------------------------------
--Sas_Aures_CityConstructed
local function Sas_Aures_CityConstructed(playerID, cityID, buildingID, isGold, isFaith)
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	local playerTeam = Teams[player:GetTeam()]

	local city = player:GetCityByID(cityID)

	--UB
	if buildingID == buildingKsourID then
		local plot = g_MapGetPlot(city:GetX(), city:GetY())
		local adjacentDesert = false
		for loopPlot in PlotAreaSweepIterator(plot, 3, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
			if loopPlot:GetTerrainType() == terrainDesertID then
				adjacentDesert = true
				break
			end
		end

		if city:IsHasBuilding(buildingKsourID) and (not city:IsHasBuilding(buildingDummyKsourID)) then
			if plot:GetTerrainType() == terrainDesertID or adjacentDesert then
				city:SetNumRealBuilding(buildingDummyKsourID, 1)
			end
		end	
	end
end
GameEvents.CityConstructed.Add(Sas_Aures_CityConstructed)
------------------------------------------------------------------------------------------------------------------------
--Sas_Aures_CityTrained
local function Sas_Aures_CityTrained(playerID, cityID, unitID, isGold, isFaith)
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	local playerTeam = Teams[player:GetTeam()]

	local city = player:GetCityByID(cityID)
	local unit = player:GetUnitByID(unitID)

	--UU
	if unit:GetUnitType() == unitZenataID then
		local numXP = city:GetBaseYieldRate(yieldFaithID)
		unit:ChangeExperience(numXP)

		local plot = g_MapGetPlot(city:GetX(), city:GetY())
		for loopPlot in PlotAreaSweepIterator(plot, 3, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
			if loopPlot:GetOwner() == city:GetOwner() then
				for index = 0,(loopPlot:GetNumUnits() - 1) do
					local otherUnit = loopPlot:GetUnit(index)
					local unitOwner = Players[otherUnit:GetOwner()]
					if playerTeam:IsAtWar(unitOwner:GetTeam()) then
						unit:SetHasPromotion(promotionSasZenataIgnoreZoCID,true)
						break
					end
				end
			end
		end
	end
end
GameEvents.CityTrained.Add(Sas_Aures_CityTrained)
--==========================================================================================================================
--==========================================================================================================================
