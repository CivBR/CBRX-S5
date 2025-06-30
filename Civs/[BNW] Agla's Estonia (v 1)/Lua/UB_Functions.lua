-- JFD_Civs_Hawaii_Functions
-- Author: JFD
-- DateCreated: 5/4/2014 12:54:31 AM
--==========================================================================================================================
-- INCLUDES
--==========================================================================================================================
------------------------------------------------------------------------------------------------------------------------
include("FLuaVector.lua")
include("PlotIterators.lua")
--==========================================================================================================================
-- GLOBALS
--==========================================================================================================================
----------------------------------------------------------------------------------------------------------------------------
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
-------------------------------------------------------------------------------------------------------------------------
--==========================================================================================================================
-- UNIQUE FUNCTIONS
--==========================================================================================================================
-- GLOBALS
--------------------------------------------------------------------------------------------------------------------------
local civilizationHawaiiID = GameInfoTypes["CIVILIZATION_AGLA_ESTONIA"]
local traitHawaiiID = GameInfoTypes["TRAIT_AGLA_ESTONIA"]
local buildingHouseKingsID = GameInfoTypes["BUILDING_AGLA_LAULUVALJAK"]

-------------------------------------------------------------------------------------------------------------------------
-- FUNCTIONS
-------------------------------------------------------------------------------------------------------------------------

--JFD_Hawaii_PlayerDoTurn
local buildingHouseKingsGPID = GameInfoTypes["BUILDING_AGLA_LAULUVALJAK_GREAT_PEOPLE"]
local function JFD_Hawaii_PlayerDoTurn(playerID)
	local player = Players[playerID]
	local playerTeamID = player:GetTeam()
	local playerTeam = Teams[player:GetTeam()]
	if (not player:IsAlive()) then return end
	if player:IsMinorCiv() then return end
	if player:IsBarbarian() then return end
	
	local playerIsHuman = player:IsHuman()

	local numPolBranches = player:GetNumPolicyBranchesFinished()

		if HasTrait(player, traitHawaiiID) then
		for city in player:Cities() do
			--HOUSE OF KINGS
			if (not city:IsHasBuilding(buildingHouseKingsID)) then
				numPolBranches = 0
			end
			city:SetNumRealBuilding(buildingHouseKingsGPID, numPolBranches)
		end
	end
end
GameEvents.PlayerDoTurn.Add(JFD_Hawaii_PlayerDoTurn)
-------------------------------------------------------------------------------------------------------------------------
--JFD_Hawaii_PlayerAdoptPolicy
local function JFD_Hawaii_PlayerAdoptPolicy(playerID)
	local player = Players[playerID]
	local playerTeamID = player:GetTeam()
	if (not player:IsAlive()) then return end
	if player:IsMinorCiv() then return end
	if player:IsBarbarian() then return end
	
	local numPolBranches = player:GetNumPolicyBranchesFinished()
	if HasTrait(player, traitHawaiiID) then
		for city in player:Cities() do
			--HOUSE OF KINGS
			if (not city:IsHasBuilding(buildingHouseKingsID)) then
				numPolBranches = 0
			end
			city:SetNumRealBuilding(buildingHouseKingsID, numPolBranches)
		end
	end
end
GameEvents.PlayerAdoptPolicy.Add(JFD_Hawaii_PlayerAdoptPolicy)
-------------------------------------------------------------------------------------------------------------------------

--=======================================================================================================================
--=======================================================================================================================
