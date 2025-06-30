-- JFD_Civs_CanadaKing_Functions
-- Author: JFD
-- DateCreated: 5/4/2014 12:54:31 AM
--==========================================================================================================================
-- INCLUDES
--==========================================================================================================================
----------------------------------------------------------------------------------------------------------------------------
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
local defineMaxMinorCivs = GameDefines["MAX_MINOR_CIVS"]
--==========================================================================================================================
-- CORE FUNCTIONS
--==========================================================================================================================
----------------------------------------------------------------------------------------------------------------------------
--==========================================================================================================================
-- UNIQUE FUNCTIONS
--==========================================================================================================================
----------------------------------------------------------------------------------------------------------------------------
-- GLOBALS
----------------------------------------------------------------------------------------------------------------------------
local civilizationCanadaKingID = GameInfoTypes["CIVILIZATION_AGLA_ZELENY_KLYN"]
local traitCanadaKingID = GameInfoTypes["TRAIT_AGLA_ZELENY_KLYN"]

----------------------------------------------------------------------------------------------------------------------------
-- FUNCTIONS
----------------------------------------------------------------------------------------------------------------------------
--JFD_CanadaKing_PlayerDoTurn

local buildingCanadaKingTradeRoute1ID = GameInfoTypes["BUILDING_AGLA_ZELENY_KLYN_TRADE_ROUTE_1"]
local buildingCanadaKingTradeRoute2ID = GameInfoTypes["BUILDING_AGLA_ZELENY_KLYN_TRADE_ROUTE_2"]
local buildingCanadaKingTradeRoute3ID = GameInfoTypes["BUILDING_AGLA_ZELENY_KLYN_TRADE_ROUTE_3"]

local function JFD_CanadaKing_PlayerDoTurn(playerID)
	local player = Players[playerID]
	local playerTeamID = player:GetTeam()
	local playerTeam = Teams[playerTeamID]
	if (not player:IsAlive()) then return end
	
	local playerCapital = player:GetCapitalCity()
	if (not playerCapital) then return end
	

	--VOLUNTEER SPIRIT
	if (not HasTrait(player, traitCanadaKingID)) then return end
	for city in player:Cities() do
		if city:IsHasBuilding(buildingCanadaKingTradeRoute1ID) then
			city:SetNumRealBuilding(buildingCanadaKingTradeRoute1ID, 0)
		end
		if city:IsHasBuilding(buildingCanadaKingTradeRoute2ID) then
			city:SetNumRealBuilding(buildingCanadaKingTradeRoute2ID, 0)
		end
		if city:IsHasBuilding(buildingCanadaKingTradeRoute3ID) then
			city:SetNumRealBuilding(buildingCanadaKingTradeRoute3ID, 0)
		end
	end	

	local numFriendWars = 0
	for otherPlayerID = 0, defineMaxMajorCivs - 1 do
		local otherPlayer = Players[otherPlayerID]
		if otherPlayer:IsDoF(playerID) then
			local otherTeam = Teams[otherPlayer:GetTeam()]
			if otherTeam:GetAtWarCount(false) > 0 then
				numFriendWars = numFriendWars + 1
			end
		end
	end
	if numFriendWars >= 3 then
		playerCapital:SetNumRealBuilding(buildingCanadaKingTradeRoute1ID, 1)
		playerCapital:SetNumRealBuilding(buildingCanadaKingTradeRoute2ID, 1)
		playerCapital:SetNumRealBuilding(buildingCanadaKingTradeRoute3ID, 1)
	elseif numFriendWars == 2 then
		playerCapital:SetNumRealBuilding(buildingCanadaKingTradeRoute1ID, 1)
		playerCapital:SetNumRealBuilding(buildingCanadaKingTradeRoute2ID, 1)
	elseif numFriendWars == 1 then
		playerCapital:SetNumRealBuilding(buildingCanadaKingTradeRoute1ID, 1)
	end
end
GameEvents.PlayerDoTurn.Add(JFD_CanadaKing_PlayerDoTurn)
--=======================================================================================================================
--=======================================================================================================================
