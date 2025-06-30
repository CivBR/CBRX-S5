-- JFD_Civs_NewZealandHolyoake_Functions
-- Author: JFD
-- DateCreated: 5/4/2014 12:54:31 AM
--==========================================================================================================================
-- INCLUDES
--==========================================================================================================================
----------------------------------------------------------------------------------------------------------------------------
include("FLuaVector.lua")
include("PlotIterators.lua")
--include("UniqueDiplomacyUtilsV2.lua")
--==========================================================================================================================
-- UTILITIES
--==========================================================================================================================
----------------------------------------------------------------------------------------------------------------------------
-- CORE UTILITIES
----------------------------------------------------------------------------------------------------------------------------
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
--==========================================================================================================================
-- GAME DEFINES
--==========================================================================================================================
----------------------------------------------------------------------------------------------------------------------------
local defineMaxMajorCivs = GameDefines["MAX_MAJOR_CIVS"]
--==========================================================================================================================
-- UNIQUE FUNCTIONS
--==========================================================================================================================
----------------------------------------------------------------------------------------------------------------------------
-- GLOBALS
----------------------------------------------------------------------------------------------------------------------------


local traitNewZealandHolyoakeID = GameInfoTypes["TRAIT_AGLA_ZELENY_KLYN"]


----------------------------------------------------------------------------------------------------------------------------
-- FUNCTIONS
----------------------------------------------------------------------------------------------------------------------------
--JFD_NewZealandHolyoake_PlayerDoTurn
local g_Buildings_Table = {}
local g_Buildings_Count = 1
for row in DB.Query("SELECT * FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_MONUMENT', 'BUILDINGCLASS_OPERA_HOUSE', 'BUILDINGCLASS_MUSEUM', 'BUILDINGCLASS_BROADCAST_TOWER');") do 	
	g_Buildings_Table[g_Buildings_Count] = row
	g_Buildings_Count = g_Buildings_Count + 1
end
local buildingDummyNewZealandHolyoakeID = GameInfoTypes["BUILDING_DUMMY_AGLA_ZELENY_KLYN"]
local function JFD_NewZealandHolyoake_PlayerDoTurn(playerID)
	local player = Players[playerID]
	local playerTeamID = player:GetTeam()
	local playerTeam = Teams[playerTeamID]
	if (not player:IsAlive()) then return end
	
	local playerCapital = player:GetCapitalCity()
	if (not playerCapital) then return end
	
	--UNIQUE TRAIT
	if (not HasTrait(player, traitNewZealandHolyoakeID)) then return end
	for city in player:Cities() do
		local numGoldBuildings = 0
		--g_Buildings_Table
		local buildingsTable = g_Buildings_Table
		local numBuildings = #buildingsTable
		for index = 1, numBuildings do
			local row = buildingsTable[index]
			local buildingID = GameInfoTypes[row.DefaultBuilding]
			if city:IsHasBuilding(buildingID) then
				numGoldBuildings = numGoldBuildings + 1
			end
		end
		city:SetNumRealBuilding(buildingDummyNewZealandHolyoakeID, numGoldBuildings)
	end	
end
GameEvents.PlayerDoTurn.Add(JFD_NewZealandHolyoake_PlayerDoTurn)
----------------------------------------------------------------------------------------------------------------------------
--=======================================================================================================================
--=======================================================================================================================
