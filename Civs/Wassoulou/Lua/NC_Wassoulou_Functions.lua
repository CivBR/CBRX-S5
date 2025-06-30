-- JFD_Civs_AfghanistanZahirShah_Functions
-- Author: JFD
-- DateCreated: 2/15/2014 6:33:36 PM
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
local civilizationID = GameInfoTypes["CIVILIZATION_NC_WASSOULOU"]
local bIsActive = JFD_IsCivilizationActive(civilizationID)
local traitWassoulouID = GameInfoTypes["TRAIT_NC_WASSOULOU"]

local buildingDyulaGunsmithID = GameInfoTypes["BUILDING_NC_DYULA_GUNSMITH"]
local buildingWassoulouTradeRouteDummyID = GameInfoTypes["BUILDING_NC_WASSOULOU_TRADE_ROUTE_DUMMY"]
local buildingWassoulouXPDummyID = GameInfoTypes["BUILDING_NC_WASSOULOU_XP_DUMMY"]

local improvementCustomsHouseID = GameInfoTypes["IMPROVEMENT_CUSTOMS_HOUSE"]


local promotionBoloID = GameInfoTypes["PROMOTION_NC_WASSOULOU_BOLO"]

local unitBoloID = GameInfoTypes["UNIT_NC_BOLO"]

local iPracticalNumCivs = (GameDefines.MAX_MAJOR_CIVS - 1)

local tWassoulouBonusMovementPromos = {}
tWassoulouBonusMovementPromos[1] = GameInfoTypes["PROMOTION_NC_WASSOULOU_MOVEMENT_1"] -- TODO: Should be given by default and not provide any movement
tWassoulouBonusMovementPromos[2] = GameInfoTypes["PROMOTION_NC_WASSOULOU_MOVEMENT_2"]
tWassoulouBonusMovementPromos[3] = GameInfoTypes["PROMOTION_NC_WASSOULOU_MOVEMENT_3"]
tWassoulouBonusMovementPromos[4] = GameInfoTypes["PROMOTION_NC_WASSOULOU_MOVEMENT_4"]
tWassoulouBonusMovementPromos[5] = GameInfoTypes["PROMOTION_NC_WASSOULOU_MOVEMENT_5"]
tWassoulouBonusMovementPromos[6] = GameInfoTypes["PROMOTION_NC_WASSOULOU_MOVEMENT_6"]
tWassoulouBonusMovementPromos[7] = GameInfoTypes["PROMOTION_NC_WASSOULOU_MOVEMENT_7"]
tWassoulouBonusMovementPromos[8] = GameInfoTypes["PROMOTION_NC_WASSOULOU_MOVEMENT_8"]
tWassoulouBonusMovementPromos[9] = GameInfoTypes["PROMOTION_NC_WASSOULOU_MOVEMENT_9"]
tWassoulouBonusMovementPromos[10] = GameInfoTypes["PROMOTION_NC_WASSOULOU_MOVEMENT_10"]

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
-- UA: Capturing a city with two or more outgoing trade routes grants you an extra Trade Route slot
----------------------------------------------------------------------------------------------------------------------------

-- Create a table of every city owned by a civ the player is at war with on game start, counting up the number of trade routes each city HasStateReligion

local tTradeRoutesOfCivsAtWar = {}

function NC_Wassoulou_CountEnemyRoutesOnGameStart()
	-- print("NC_Wassoulou_CountEnemyRoutesOnGameStart: Running...")
	for i = 0, iPracticalNumCivs, 1 do -- TODO: Is there a better way to do this
		
		local playerID = i -- Just to make it easier to read the code
		local pPlayer = Players[playerID]
		if pPlayer and pPlayer:IsAlive() and pPlayer:GetCivilizationType() == civilizationID then
		
			local iTeam = pPlayer:GetTeam()
			
			for j = 0, iPracticalNumCivs, 1 do -- TODO: Is there a better way to do this
		
				local pOtherPlayer = Players[j]
				if pOtherPlayer and pOtherPlayer:IsAlive() then
				
					local pOtherTeam = Teams[pOtherPlayer:GetTeam()]
					
					if pOtherTeam:IsAtWar(iTeam) then
						
						for city in pOtherPlayer:Cities() do
						
							local cityTradeCount = GetNumTradeRoutesFromCity(city)
							tTradeRoutesOfCivsAtWar[city:Plot():GetPlotIndex()] = cityTradeCount -- TODO: Does this work
						end
						
					end
				end
			end
		end
	end
end

-- Update the table at the start of each turn

function NC_Wassoulou_UA_PlayerDoTurn(playerID)
	local pPlayer = Players[playerID]
	if pPlayer == nil then return end
	if not pPlayer:IsAlive() then return end
	if pPlayer:GetCivilizationType() ~= civilizationID then return end

	local iTeam = pPlayer:GetTeam()
			
	for i = 0, iPracticalNumCivs, 1 do -- TODO: Is there a better way to do this

		local pOtherPlayer = Players[i]
		if pOtherPlayer and pOtherPlayer:IsAlive() then
		
			local pOtherTeam = Teams[pOtherPlayer:GetTeam()]
			
			if pOtherTeam:IsAtWar(iTeam) then
				
				for city in pOtherPlayer:Cities() do
				
					local cityTradeCount = GetNumTradeRoutesFromCity(city)
					tTradeRoutesOfCivsAtWar[city:Plot():GetPlotIndex()] = cityTradeCount -- TODO: Does this work
				end
				
			end
		end
	end	

end

-- Also update the table when a new war is declared

function NC_Wassoulou_UA_DeclareWar(fromTeamID, toTeamID)
	-- print("NC_Wassoulou_UA_DeclareWar: Running...")
	local fromPlayerHasTrait = GetTraitPlayerFromTeam(fromTeamID, traitWassoulouID)
	local toPlayerHasTrait = GetTraitPlayerFromTeam(toTeamID, traitWassoulouID)
	
	local fromPlayerTeam = Teams[fromTeamID]
	local toPlayerTeam = Teams[toTeamID]
	if fromPlayerHasTrait then
		-- print("NC_Wassoulou_UA_DeclareWar: From player is Wassoulou")
		local otherPlayerID = toPlayerTeam:GetLeaderID()
		local pOtherPlayer = Players[otherPlayerID]
		for city in pOtherPlayer:Cities() do
				
			local cityTradeCount = GetNumTradeRoutesFromCity(city)
			tTradeRoutesOfCivsAtWar[city:Plot():GetPlotIndex()] = cityTradeCount -- TODO: Does this work
		end
	end
	if toPlayerHasTrait then
		-- print("NC_Wassoulou_UA_DeclareWar: To player is Wassoulou")
		local otherPlayerID = fromPlayerTeam:GetLeaderID()
		local pOtherPlayer = Players[otherPlayerID]
		for city in pOtherPlayer:Cities() do
				
			local cityTradeCount = GetNumTradeRoutesFromCity(city)
			tTradeRoutesOfCivsAtWar[city:Plot():GetPlotIndex()] = cityTradeCount -- TODO: Does this work
		end
	end
end

-- When the player captures a city, check to see how many trade routes it had, and if it's two or more, give the player an extra trade route slot

function NC_Wassoulou_UA_CityCaptured(oldPlayerID, bCapital, iX, iY, newPlayerID)
	local pNewPlayer = Players[newPlayerID]
	if pNewPlayer:GetCivilizationType() == civilizationID then
		local iPlot = Map.GetPlot(iX, iY):GetPlotIndex()
		if (tTradeRoutesOfCivsAtWar[iPlot]) > 1 then
			local pCapital = pNewPlayer:GetCapitalCity()
			pCapital:SetNumRealBuilding(buildingWassoulouTradeRouteDummyID, (pCapital:GetNumRealBuilding(buildingWassoulouTradeRouteDummyID) + 1))
			tTradeRoutesOfCivsAtWar[iPlot] = 0 -- To avoid any weirdness
		end
	end
end

if bIsActive then
	Events.SequenceGameInitComplete.Add(NC_Wassoulou_CountEnemyRoutesOnGameStart)
	GameEvents.PlayerDoTurn.Add(NC_Wassoulou_UA_PlayerDoTurn)
	GameEvents.DeclareWar.Add(NC_Wassoulou_UA_DeclareWar)
	GameEvents.CityCaptureComplete.Add(NC_Wassoulou_UA_CityCaptured)
end

----------------------------------------------------------------------------------------------------------------------------
-- UA: Spies increase XP gain for nearby units
----------------------------------------------------------------------------------------------------------------------------
-- Stolen mostly from TopHat's France (Louis XI)

local promoNearSpy = GameInfoTypes["PROMOTION_NC_WASSOULOU_SPY_ADJACENCY_ACTIVE"]
local promoNearSpyDummy = GameInfoTypes["PROMOTION_NC_WASSOULOU_SPY_ADJACENCY"]

function Wassoulou_CheckForNearbySpies(playerID, unitID, iX, iY)
	local pPlayer = Players[playerID]
	local uUnit = pPlayer:GetUnitByID(unitID)
	if pPlayer:GetCivilizationType() == civilizationID then
		-- If the player doesn't have any spies, don't bother checking for them
		local pUnitPlot = Map.GetPlot(iX, iY)
		if pPlayer:GetNumSpies() < 1 then
			uUnit:SetHasPromotion(promoNearSpyDummy, true)
			uUnit:SetHasPromotion(promoNearSpy, false)
			return
		end
		
		for k, v in pairs(pPlayer:GetEspionageSpies()) do
			local pSpyPlot = Map.GetPlot(v.CityX, v.CityY)
			if pSpyPlot then
				for pNearbyPlot in PlotAreaSweepIterator(pSpyPlot, 3, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
					if pNearbyPlot == pUnitPlot then
						uUnit:SetHasPromotion(promoNearSpy, true)
						uUnit:SetHasPromotion(promoNearSpyDummy, false)
						return
					end
				end
			end
		end
		uUnit:SetHasPromotion(promoNearSpyDummy, true)
		uUnit:SetHasPromotion(promoNearSpy, false)
		
	end
end

if bIsActive then
	GameEvents.UnitSetXY.Add(Wassoulou_CheckForNearbySpies)
end


----------------------------------------------------------------------------------------------------------------------------
-- UU: Gains +1 Movement on promotion
----------------------------------------------------------------------------------------------------------------------------

function NC_Wassoulou_UB_UnitPromoted(playerID, unitID, promotionID)
	local pPlayer = Players[playerID]
	local pUnit = pPlayer:GetUnitByID(unitID)
	if pUnit:IsHasPromotion(promotionBoloID) then
		local level = pUnit:GetLevel()
		pUnit:SetHasPromotion(tWassoulouBonusMovementPromos[level], true) -- TODO: Could make each level promotion provide an extra movement, and then just remove the previous level promotion
		-- TODO: Also does this fire when I give the movement promotion or only when the unit levels up, might need a check otherwise
	end
end

if bIsActive then
	GameEvents.UnitPromoted.Add(NC_Wassoulou_UB_UnitPromoted)
end

----------------------------------------------------------------------------------------------------------------------------
-- UU: Duplicates on capturing a city
----------------------------------------------------------------------------------------------------------------------------

function NC_Wassoulou_UU_CityCaptureComplete(oldPlayerID, bCap, iX, iY, cityID, iOldPop, bConquest)
	if not bConquest then return end
	local pPlot = Map.GetPlot(iX, iY)
	for i = 0, pPlot:GetNumUnits() - 1, 1 do
		local pUnit = pPlot:GetLayerUnit(i)
		if pUnit:IsHasPromotion(promotionBoloID) then
			
			local pPlayer = Players[pUnit:GetOwner()]
			local unitType = pUnit:GetUnitType()
			local pNewUnit = pPlayer:InitUnit(unitType, pUnit:GetX(), pUnit:GetY())
			pNewUnit:JumpToNearestValidPlot() -- TODO: Provide free levels to make it a proper duplicate?
			pNewUnit:SetExperience(pUnit:GetExperience())
		end
	end
end

if bIsActive then
	GameEvents.CityCaptureComplete.Add(NC_Wassoulou_UU_CityCaptureComplete)
end

----------------------------------------------------------------------------------------------------------------------------
-- UB: +5 XP for each trade route in the city
----------------------------------------------------------------------------------------------------------------------------

function NC_Wassoulou_UB_PlayerDoTurn(playerID)
	local pPlayer = Players[playerID]
	if pPlayer == nil then return end
	if not pPlayer:IsAlive() then return end
	if pPlayer:GetCivilizationType() ~= civilizationID then return end

	local tradeRoutes = pPlayer:GetTradeRoutes()
	local incomingTradeRoutes = pPlayer:GetTradeRoutesToYou()
	
	-- Clear trade route dummies
	for cCity in pPlayer:Cities() do
		if cCity:IsHasBuilding(buildingWassoulouXPDummyID) then
			cCity:SetNumRealBuilding(buildingWassoulouXPDummyID, 0)
		end
	end
	
	-- Count up Wassoulou's trade routes per city
	if tradeRoutes ~= nil then
		-- print('DMS_Minaeans_PDT: iterate TRs')
		-- print('---')
		
		-- Loops over trade routes
		for tri, tRoute in pairs(tradeRoutes) do
			-- Grabs the cities as variables
			local fromCity = tRoute.FromCity
			local fromCityPlotID = fromCity:Plot():GetPlotIndex()
			local toPlayer = Players[tRoute.ToID]
			local toCity = tRoute.ToCity
			local toCityPlotID = toCity:Plot():GetPlotIndex()
			
			if (toPlayer ~= pPlayer) then
				if (fromCity:IsHasBuilding(buildingDyulaGunsmithID)) then
					fromCity:SetNumRealBuilding(buildingWassoulouXPDummyID, (fromCity:GetNumRealBuilding(buildingWassoulouXPDummyID) + 1))
				end
			end
			
		end
	
	end
	
	if incomingTradeRoutes ~= nil then
		for tri, tRoute in pairs(incomingTradeRoutes) do
			-- Grabs the cities as variables
			local fromCity = tRoute.FromCity
			local fromCityPlotID = fromCity:Plot():GetPlotIndex()
			local fromPlayer = Players[tRoute.FromID]
			local toCity = tRoute.ToCity
			local toCityPlotID = toCity:Plot():GetPlotIndex()
			
			if (fromPlayer ~= pPlayer) then
				if (toCity:IsHasBuilding(buildingDyulaGunsmithID)) then
					toCity:SetNumRealBuilding(buildingWassoulouXPDummyID, (toCity:GetNumRealBuilding(buildingWassoulouXPDummyID) + 1))
				end
			end
			
		end
	end

end

if bIsActive then
	GameEvents.PlayerDoTurn.Add(NC_Wassoulou_UB_PlayerDoTurn)
end

----------------------------------------------------------------------------------------------------------------------------
-- UB: Burst of production whenever a new technology is researched
----------------------------------------------------------------------------------------------------------------------------
local productionYield = GameInfoTypes["YIELD_PRODUCTION"]


function NC_Wassoulou_NewTechResearched(teamID, techID, bool)
	if not bool then return end
	local pTeam = Teams[teamID]
	local playerID = pTeam:GetLeaderID()
	local pPlayer = Players[playerID]
	if pPlayer:GetCivilizationType() == civilizationID then
		local iTechCost = GameInfo.Technologies[techID].Cost
		local iQuantity = math.ceil(iTechCost / 10)
		-- Add Production bonus to every city with the UB
		for cCity in pPlayer:Cities() do
			if cCity:IsHasBuilding(buildingDyulaGunsmithID) then
				if cCity:GetProductionTurnsLeft() > 0 and cCity:GetProductionUnit() > 0 then
					cCity:ChangeProduction(iQuantity)
					-- print("NC_Wassoulou_NewTechResearched: Adding Production: " .. iQuantity)
				end
			end
		end
	end
end

if bIsActive then
	GameEvents.TeamSetHasTech.Add(NC_Wassoulou_NewTechResearched)
end
print("WassoulouFunctions.lua loaded!")