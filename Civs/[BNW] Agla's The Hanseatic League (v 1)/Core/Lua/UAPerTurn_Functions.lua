-- Leu_Mantua_Functions
-- Author: JFD
-- DateCreated: 5/4/2014 12:54:31 AM
--==========================================================================================================================
-- INCLUDES
--==========================================================================================================================
------------------------------------------------------------------------------------------------------------------------
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

----------------------------
-- GoldenAgeBegins LuaEvent
-- Written by: TopHatPaladin
-- 2019-09-26
----------------------------

-- ============= --
-- ARGUMENT INFO --
-- ============= --

--[[

The arguments in the THP_GoldenAgeBegins LuaEvent are, in order:
* playerID - an integer - the ID of the Player whose Golden Age is beginning
* iTurns - an integer - the number of turns remaining in the Golden Age; not necessarily equal to the number of turns most recently added to the golden age (see next bullet point)
* bIsNewGA - a boolean - returns true if the player was not previously in a Golden Age; returns false if a previously active Golden Age is simply lengthened
* bIsUnit - a boolean - returns true if the Golden Age was triggered by expending a unit
* bIsBuilding - a boolean - returns true if the Golden Age was triggered by constructing a building
* bIsPolicy - a boolean - returns true if the Golden Age was triggered by acquiring a Social Policy

Due to the limitations of what I can do to the game's base code, I can't have the LuaEvent trigger when a Golden Age is manually invoked with Lua.

--]]

-- =================== --
-- GOLDEN AGE LUAEVENT --
-- =================== --

local tGoldenAgeTurns = {}
function THP_GoldenAge_GameStart_Tabulate()
	for k, vPlayer in pairs(Players) do
		tGoldenAgeTurns[vPlayer] = vPlayer:GetGoldenAgeTurns()
	end
end
Events.SequenceGameInitComplete.Add(THP_GoldenAge_GameStart_Tabulate)

function THP_GoldenAge_DoTurn(playerID)
	local pPlayer = Players[playerID]
	local iTurns = pPlayer:GetGoldenAgeTurns()
	if iTurns > tGoldenAgeTurns[pPlayer] then
		local bIsNewGA = (tGoldenAgeTurns[pPlayer] == 0)
		LuaEvents.THP_GoldenAgeBegins(playerID, iTurns, bIsNewGA, false, false, false)
	end
	tGoldenAgeTurns[pPlayer] = iTurns
end
GameEvents.PlayerDoTurn.Add(THP_GoldenAge_DoTurn)

function THP_GoldenAge_UnitPrekill(playerID, unitID, unitType, iX, iY, bDelay, killerID)
	if (killerID == -1) and (not bDelay) then
		if GameInfo.Units[unitType].GoldenAgeTurns > 0 then
			local pPlayer = Players[playerID]
			local iTurns = pPlayer:GetGoldenAgeTurns()
			if iTurns > tGoldenAgeTurns[pPlayer] then
				local bIsNewGA = (tGoldenAgeTurns[pPlayer] == 0)
				LuaEvents.THP_GoldenAgeBegins(playerID, iTurns, bIsNewGA, true, false, false)
			end
			tGoldenAgeTurns[pPlayer] = iTurns
		end
	end
end
GameEvents.UnitPrekill.Add(THP_GoldenAge_UnitPrekill)

function THP_GoldenAge_CityConstructed(playerID, cityID, buildingType)
	if GameInfo.Buildings[buildingType].GoldenAge then
		local pPlayer = Players[playerID]
		local iTurns = pPlayer:GetGoldenAgeTurns()
		local bIsNewGA = (tGoldenAgeTurns[pPlayer] == 0)
		LuaEvents.THP_GoldenAgeBegins(playerID, iTurns, bIsNewGA, false, true, false)
		tGoldenAgeTurns[pPlayer] = iTurns
	end
end
GameEvents.CityConstructed.Add(THP_GoldenAge_CityConstructed)

function THP_GoldenAge_AdoptPolicy(playerID, policyID)
	if GameInfo.Policies[policyID].GoldenAgeTurns > 0 then
		local pPlayer = Players[playerID]
		local iTurns = pPlayer:GetGoldenAgeTurns()
		local bIsNewGA = (tGoldenAgeTurns[pPlayer] == 0)
		LuaEvents.THP_GoldenAgeBegins(playerID, iTurns, bIsNewGA, false, false, true)
		tGoldenAgeTurns[pPlayer] = iTurns
	end
end
GameEvents.PlayerAdoptPolicy.Add(THP_GoldenAge_AdoptPolicy)
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

local civilizationLeuMantuaID = GameInfoTypes["CIVILIZATION_AGLA_HANSE_WULLENWEVER"]

--------------------------------------------------------------------------------------------------------------------------
-- FUNCTIONS
--------------------------------------------------------------------------------------------------------------------------
--Leu_Mantua_PlayerDoTurn
local function Leu_Mantua_PlayerDoTurn(playerID)
	local player = Players[playerID]
	local playerTeamID = player:GetTeam()
	local playerTeam = Teams[player:GetTeam()]
	if (not player:IsAlive()) then return end
	if player:IsBarbarian() then return end
	if player:IsMinorCiv() then return end
	
	local playerCapital = player:GetCapitalCity()
	if (not playerCapital) then return end

	--UA
	if player:GetCivilizationType() == civilizationLeuMantuaID then
		local numGAP = 0 
		local numGArt = 0
		for minorPlayerID = 0, defineMaxPlayers - 1 do
			local minorPlayer = Players[minorPlayerID]
			local minorPlayerCapital = minorPlayer:GetCapitalCity()
			if (minorPlayer:IsAlive() and minorPlayerCapital and minorPlayer:IsMinorCiv()) then
				if minorPlayer:IsAllies(playerID) then
					numGAP = numGAP + 2
					numGArt = numGArt + 3
				elseif minorPlayer:IsFriends(playerID) then
					numGAP = numGAP + 1
					numGArt = numGArt + 2
				end
					if minorPlayer:IsMinorCivContestLeader(playerID, questID) then
						numGAP = (numGAP*2)
						numGArt = (numGArt*2)
				end
			end
		end
		if numGAP > 0 then
			player:ChangeGoldenAgeProgressMeter(numGAP)
			if player:IsHuman() then
				Events.GameplayAlertMessage(g_ConvertTextKey("City-States Friends and Allies provide {1_Num} [ICON_GOLDEN_AGE] [COLOR_POSITIVE_TEXT]Golden Age Points[ENDCOLOR] this turn!", numGAP))
			end
		end
		if numGArt > 0 then
			local cityGAP = playerCapital
			for city in player:Cities() do
				if city:IsHasBuilding(GameInfoTypes["BUILDING_PALACE"]) then
					cityGAP = city
					break
				end
			end
			cityGAP:ChangeSpecialistGreatPersonProgressTimes100(GameInfoTypes["SPECIALIST_MERCHANT"], (numGArt*100))
			if player:IsHuman() and player:IsTurnActive() then
				local hex = ToHexFromGrid(Vector2(plotX, plotY))
				Events.AddPopupTextEvent(HexToWorld(hex), g_ConvertTextKey("[COLOR_GREAT_PEOPLE_STORED]+{1_Num}[ENDCOLOR] [ICON_GREAT_PEOPLE] Great Artist Points", numGArt), true)
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(Leu_Mantua_PlayerDoTurn)
----------------------------------------------------------------------------------------------------------------------------

--==========================================================================================================================
--==========================================================================================================================
