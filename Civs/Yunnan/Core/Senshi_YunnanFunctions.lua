--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------
include("FLuaVector.lua")
include("PlotIterators.lua")
include("RouteConnections.lua")
--=======================================================================================================================
-- GLOBALS
--=======================================================================================================================
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
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
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
--IsTraitActive
local slotComputerID = SlotStatus["SS_COMPUTER"]
local slotTakenID = SlotStatus["SS_TAKEN"]
function IsTraitActive(traitID)
	for slotID = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
		local slotPlayer = Players[slotID]
		local slotStatus = PreGame.GetSlotStatus(slotID)
		if (slotStatus == slotTakenID or slotStatus == slotComputerID) then
			if HasTrait(slotPlayer, traitID) then
				return true
			end
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
----------------------------------------------------------------------------------------------------------------------------
-- MATH UTILITIES
----------------------------------------------------------------------------------------------------------------------------
--Game.GetRandom
function Game.GetRandom(lower, upper)
	return Game.Rand((upper + 1) - lower, "") + lower
end
local g_GetRandom = Game.GetRandom
--=======================================================================================================================
-- GAME DEFINES
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------
local defineMaxMajorCivs = GameDefines["MAX_MAJOR_CIVS"]
--=======================================================================================================================
-- UNIQUE FUNCTIONS
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------
-- GLOBALS
------------------------------------------------------------------------------------------------------------------------
local traitYunnanID = GameInfoTypes["TRAIT_SENSHI_YUNNAN"]
local g_IsTraitActive = IsTraitActive(traitYunnanID) 

local buildingDummyHumpStrengthID = GameInfoTypes["BUILDING_DUMMY_SENSHI_AIRBASE_STRENGTH"]
local buildingDummyYunnanStrengthID = GameInfoTypes["BUILDING_DUMMY_SENSHI_YUNNAN_STRENGTH"]

local routeRoadID = GameInfoTypes["ROUTE_ROAD"]
local routeRailroadID = GameInfoTypes["ROUTE_RAILROAD"]

local techRailroadID = GameInfoTypes["TECH_RAILROAD"]

local unitDianCorpsID = GameInfoTypes["UNIT_SENSHI_DIAN_CORPS"]

local buildingHumpAirbaseID = GameInfoTypes["BUILDING_SENSHI_HUMP_AIRBASE"]
local domainAirID = GameInfoTypes["DOMAIN_AIR"]
------------------------------------------------------------------------------------------------------------------------
--Senshi_Yunnan_PlayerDoTurn
function Senshi_Yunnan_PlayerDoTurn(playerID)
	local player = Players[playerID]
	local playerTeamID = player:GetTeam()
	local playerTeam = Teams[playerTeamID]
	if (not player:IsAlive()) then return end
	
	if (not HasTrait(player, traitYunnanID)) then return end

	local playerCapital = player:GetCapitalCity()
	if (not playerCapital) then return end
	
	local isHasRailroad =  playerTeam:IsHasTech(techRailroadID)
	
	local numStrengthForCapital = 0
	
	for city in player:Cities() do
		local numAircraft = 0
		if city:IsHasBuilding(buildingHumpAirbaseID) then
			local plot = city:Plot()
			for index = 0, plot:GetNumUnits() - 1, 1 do
				local unit = plot:GetUnit(index)
				if unit and unit:GetDomainType() == domainAirID then
					numAircraft = numAircraft + 1
				end
			end
		end
		city:SetNumRealBuilding(buildingDummyHumpStrengthID, numAircraft)

		local numStrengthAddition = 0
		if isHasRailroad then
			if isCityConnected(player, playerCapital, city, 'Railroad', false, false, nil) then
				numStrengthAddition = g_MathFloor(city:GetStrengthValue()/200) 
			elseif isCityConnected(player, playerCapital, city, 'Road', false, false, nil) then
				numStrengthAddition = g_MathFloor(city:GetStrengthValue()/400)   
			end
		elseif isCityConnected(player, playerCapital, city, 'Road', false, false, nil) then
			numStrengthAddition = g_MathFloor(city:GetStrengthValue()/400)    
		end
		numStrengthForCapital = numStrengthForCapital + numStrengthAddition
	end
	
	playerCapital:SetNumRealBuilding(buildingDummyYunnanStrengthID, numStrengthForCapital)
	
	for unit in player:Units() do
		if unit:GetUnitType() == unitDianCorpsID then			
			local plot = g_MapGetPlot(unit:GetX(), unit:GetY())
			local numHeal = 0
			if plot:GetImprovementType() ~= -1 and (not plot:IsImprovementPillaged()) then
				numHeal = numHeal + 5
			end
			if plot:GetRouteType() == routeRoadID then
				numHeal = numHeal + 5
			end
			if plot:GetRouteType() == routeRailroadID then
				numHeal = numHeal + 10
			end
			if numHeal > 0 then
				unit:ChangeDamage(-numHeal)
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(Senshi_Yunnan_PlayerDoTurn)

----------------------------------------------------------------------------------------------------------------------------
--Senshi_Yunnan_DeclareWar
local function Senshi_Yunnan_DeclareWar(teamID, otherTeamID)
	local team = Teams[teamID]
	local otherTeam = Teams[otherTeamID]
	local attackingPlayerID = team:GetLeaderID()
	local attackingPlayer = Players[attackingPlayerID]
	local playerID = otherTeam:GetLeaderID()
	local player = Players[playerID]
	
	--INDEPENDENCE, OR DEATH
	if HasTrait(player, traitYunnanID) then
		local numCapStrength = g_MathFloor(player:GetCapitalCity():GetStrengthValue()/100)
		local numCulture = numCapStrength
		player:ChangeJONSCulture(numCulture)
		
		if player:IsHuman() then
			Events.GameplayAlertMessage(g_ConvertTextKey("The [COLOR_NEGATIVE_TEXT]outbreak of War[ENDCOLOR] merited {1_Num} [ICON_CULTURE] Culture!", numCulture))
		end
	elseif HasTrait(attackingPlayer, traitYunnanID) then
		local numCapStrength = g_MathFloor(attackingPlayer:GetCapitalCity():GetStrengthValue()/100)
		local numCulture = numCapStrength
		attackingPlayer:ChangeJONSCulture(numCulture)
		
		if attackingPlayer:IsHuman() then
			Events.GameplayAlertMessage(g_ConvertTextKey("The [COLOR_NEGATIVE_TEXT]outbreak of War[ENDCOLOR] merited {1_Num} [ICON_CULTURE] Culture!", numCulture))
		end
	end	
end
GameEvents.DeclareWar.Add(Senshi_Yunnan_DeclareWar)