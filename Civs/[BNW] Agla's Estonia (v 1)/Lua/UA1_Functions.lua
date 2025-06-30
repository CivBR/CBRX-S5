-- JFD_Civs_AustriaJosephII_Functions
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
--=======================================================================================================================
--==========================================================================================================================
-- UNIQUE FUNCTIONS
--==========================================================================================================================
------------------------------------------------------------------------------------------------------------------------
-- GLOBALS
------------------------------------------------------------------------------------------------------------------------
local buildingDummyAustriaJosephIIID = GameInfoTypes["BUILDING_DUMMY_AGLA_ESTONIA"]


local traitAustriaJosephIIID = GameInfoTypes["TRAIT_AGLA_ESTONIA"]


------------------------------------------------------------------------------------------------------------------------
-- FUNCTIONS
------------------------------------------------------------------------------------------------------------------------
--JFD_AustriaJosephII_PlayerDoTurn

function JFD_AustriaJosephII_PlayerDoTurn(playerID)
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	if player:IsBarbarian() then return end
	if player:IsMinorCiv() then return end
	
	--UNIQUE TRAIT
	local playerCapital = player:GetCapitalCity()
	if (not playerCapital) then return end

	local hasTrait = HasTrait(player, traitAustriaJosephIIID)
	if hasTrait then
		local numBuilding = playerCapital:GetNumRealBuilding(buildingAustriaJosephIIID)
		local numUnlockedBranches = player:GetNumPolicyBranchesUnlocked()
		if numUnlockedBranches ~= numBuilding then
			playerCapital:SetNumRealBuilding(buildingDummyAustriaJosephIIID, numUnlockedBranches)
		end
	end
end
GameEvents.PlayerDoTurn.Add(JFD_AustriaJosephII_PlayerDoTurn)
------------------------------------------------------------------------------------------------------------------------
--JFD_AustriaJosephII_PlayerAdoptPolicy
local function JFD_AustriaJosephII_PlayerAdoptPolicy(playerID)
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	if player:IsBarbarian() then return end
	
	--UNIQUE TRAIT
	local playerCapital = player:GetCapitalCity()
	if (not playerCapital) then return end

	if HasTrait(player, traitAustriaJosephIIID) then
		local numBuilding = playerCapital:GetNumRealBuilding(buildingAustriaJosephIIID)
		local numUnlockedBranches = player:GetNumPolicyBranchesUnlocked()
		if numUnlockedBranches ~= numBuilding then
			playerCapital:SetNumRealBuilding(buildingDummyAustriaJosephIIID, numUnlockedBranches)
		end
	end
end
GameEvents.PlayerAdoptPolicy.Add(JFD_AustriaJosephII_PlayerAdoptPolicy)
--=======================================================================================================================
--=======================================================================================================================
