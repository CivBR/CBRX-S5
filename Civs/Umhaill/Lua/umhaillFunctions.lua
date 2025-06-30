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
-- ======================== --
-- TABLESAVERLOADER SUPPORT --
-- ======================== --

-- Just stealing the includes from the code I'm referencing to be safe
include("Umhaill_GlobalDefines.lua");
include("TableSaverLoader016.lua");

tableRoot = ASQ_Umhaill
tableName = "ASQ_Umhaill"

include("Umhaill_TSLSerializerV3.lua");

TableLoad(tableRoot, tableName)

function OnModLoaded() 
	local bNewGame = not TableLoad(tableRoot, tableName)
	TableSave(tableRoot, tableName)
end
OnModLoaded()

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
local civilizationID = GameInfoTypes["CIVILIZATION_ASQ_UMHAILL"]
local bIsActive = JFD_IsCivilizationActive(civilizationID)
local traitUmhaillID = GameInfoTypes["TRAIT_ASQ_GRACEOMALLEY"]

local buildingTowerHouseID = GameInfoTypes["BUILDING_ASQ_TOWERHOUSE"]

local unitLongaFadaID = GameInfoTypes["UNIT_ASQ_LONGAFADA"]

local iPracticalNumCivs = (GameDefines.MAX_MAJOR_CIVS - 1)
------------------------------------------------------------------------------------------------------------------------
-- FUNCTIONS
------------------------------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------------------------------------
-- UA: Your naval units distribute 75% of their total xp to others within 2 tiles when killed
----------------------------------------------------------------------------------------------------------------------------
-- Basically just stolen from Fran's Massagetae
local iDomainSea = GameInfoTypes["DOMAIN_SEA"]

function ASQ_Umhaill_UA_UnitPrekill(unitOwnerId, unitId, unitType, unitX, unitY, bDelay, eKillingPlayer)
	-- print("ASQ_Umhaill_UA_UnitPrekill: Running...")
	if bDelay then
		local player = Players[unitOwnerId]
		local enemyPlayer = Players[eKillingPlayer]
		-- Use this to make sure that the effect doesn't trigger if the unit is disbanded or expended for something. It MUST be killed.
		if enemyPlayer and enemyPlayer ~= player then
			if player:GetCivilizationType() == civilizationID then
				-- print("ASQ_Umhaill_UA_UnitPrekill: Dead unit player is Umhaill")
				local unit = player:GetUnitByID(unitId)
				if unit:GetDomainType(iDomainSea) then
					-- print("ASQ_Umhaill_UA_UnitPrekill: Unit is naval unit")
					local plot = unit:GetPlot()
					local experience = math.ceil(unit:GetExperience() * 0.75)
					--Adding nearby units to a list, used to hand out the experience from the killed unit. If theres no adjacent unit, it looks for more units in a 3 range radius. If there are still no units, it just picks someone from the player, awarding less experience.
					local numNearUnits = 0
					local unitList = {}
					for loopPlot in PlotAreaSweepIterator(plot, 2, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
						local otherUnit = loopPlot:GetUnit()
						if otherUnit and otherUnit:IsCombatUnit() then
							if otherUnit:GetOwner() == unitOwnerId then
								-- print("ASQ_Umhaill_UA_UnitPrekill: Found nearby unit")
								numNearUnits = numNearUnits + 1
								table.insert(unitList, otherUnit)
							end
						end
					end
					
					-- print("ASQ_Umhaill_UA_UnitPrekill: Number of nearby units is " .. numNearUnits)
					
					if numNearUnits > 0 then
						experience = math.ceil(experience / numNearUnits)
						-- print("ASQ_Umhaill_UA_UnitPrekill: Experience given is " .. experience)
						for key,otherUnit in pairs(unitList) do 
							otherUnit:ChangeExperience(experience)
						end
					end
				end
			end
		end
	end
end

if bIsActive then
	GameEvents.UnitPrekill.Add(ASQ_Umhaill_UA_UnitPrekill)
end

----------------------------------------------------------------------------------------------------------------------------
-- UA: City captures generate great admiral points based on how much you plundered
----------------------------------------------------------------------------------------------------------------------------
-- Partly adapted from Ilkhanate but not really
-- Thank you Rhoze for finding the game's Gold from city capture calculation!

local baseCaptureGold = 20
local captureGoldPerPop = 10

function ASQ_Umhaill_UA_PlayerCityFounded(playerID, cityX, cityY)
	-- print("ASQ_Umhaill_UA_PlayerCityFounded: Running...")
	-- Just here to make sure we know when a city is founded for the UA
	local player = Players[playerID]
	local plot = Map.GetPlot(cityX, cityY)
	local city = plot:GetPlotCity()
	local turnAcquired = city:GetGameTurnAcquired()
	-- print("ASQ_Umhaill_UA_PlayerCityFounded: city acquired turn " .. turnAcquired)
	UmhaillCityAcquired[plot:GetPlotIndex()] = turnAcquired
end 

function ASQ_Umhaill_UA_CityCaptureComplete(oldPlayerID, bCap, iX, iY, newOwnerID, iOldPop, bConquest)
	-- print("ASQ_Umhaill_UA_CityCaptureComplete: Running...")
	local pCity = Map.GetPlot(iX, iY):GetPlotCity()
	local pPlot = Map.GetPlot(iX, iY)
	local pPlayer = Players[newOwnerID]
	if bConquest then
		if pPlayer:GetCivilizationType() == civilizationID then
			-- print("ASQ_Umhaill_UA_CityCaptureComplete: City was conquered by Umhaill")
			local cityPop = iOldPop
			local latestTurn = UmhaillCityAcquired[pPlot:GetPlotIndex()]
			-- print("ASQ_Umhaill_UA_CityCaptureComplete: Turn acquired is " .. latestTurn)
			local currentTurn = Game.GetGameTurn()
			-- print("ASQ_Umhaill_UA_CityCaptureComplete: Current turn is " .. currentTurn)
			local turnsHeld = currentTurn - latestTurn -- TODO: Does this work
			if (turnsHeld > 50) then
				turnsHeld = 50
			end
			-- print("ASQ_Umhaill_UA_CityCaptureComplete: Old population is " .. cityPop)
			-- print("ASQ_Umhaill_UA_CityCaptureComplete: Turns held is " .. turnsHeld)
			
			-- Imitating the city capture plunder calculation
			local goldEstimate = baseCaptureGold + (captureGoldPerPop * cityPop)
			goldEstimate = goldEstimate * turnsHeld
			goldEstimate = math.ceil(goldEstimate / 50)
			
			-- print("ASQ_Umhaill_UA_CityCaptureComplete: goldEstimate is " .. goldEstimate)
			
			pPlayer:ChangeNavalCombatExperience(goldEstimate)
		end
	end
	
	-- Updating turn acquired
	local turnAcquired = pCity:GetGameTurnAcquired()
	-- print("ASQ_Umhaill_UA_CityCaptureComplete: city acquired turn " .. turnAcquired)
	UmhaillCityAcquired[pPlot:GetPlotIndex()] = turnAcquired
end

if bIsActive then
	GameEvents.PlayerCityFounded.Add(ASQ_Umhaill_UA_PlayerCityFounded)
	GameEvents.CityCaptureComplete.Add(ASQ_Umhaill_UA_CityCaptureComplete)
end

----------------------------------------------------------------------------------------------------------------------------
-- UU: when it kills a unit, gets x% of its xp, and the rest becomes gold
----------------------------------------------------------------------------------------------------------------------------
-- Modified from Oyo

local percentXPToKeep = 0.5 -- TODO: Play with this value
local pKiller;
local unitXP = 0

function ASQ_Umhaill_UU_UnitPrekill(playerID, unitID, unitType, iX, iY, bDelay, killerID)
	-- print("ASQ_Umhaill_UU_UnitPrekill: Running...")
	
	if bDelay then
		-- print("ASQ_Umhaill_UU_UnitPrekill: bDelay is true, storing information")
		if killerID == -1 then return end
		pKiller = Players[killerID]
		-- print("NC_Oyo_UnitPrekill: Marking killer")
		local pPlayer = Players[playerID]
		local pKilledUnit = pPlayer:GetUnitByID(unitID)
		unitXP = pKilledUnit:GetExperience()
		-- print("Killed unit's XP is: " .. unitXP)
	elseif pKiller then
		-- print("ASQ_Umhaill_UU_UnitPrekill: bDelay is false, handing out XP")
		if not (playerID == civilizationBarbarianID) then
			if not HasTrait(pKiller, traitUmhaillID) then return end
			-- print("NC_Oyo_UnitPrekill: capturing player is Oyo")
			local pPlot = Map.GetPlot(iX, iY)
			local pUnit = pPlot:GetUnit(0)
			if pUnit then
				-- print("ASQ_Umhaill_UU_UnitPrekill: Unit found on this tile post-kill")
				local pUnitOwner = Players[pUnit:GetOwner()]
				if (pUnit:GetUnitType() == unitLongaFadaID) then
					-- Providing XP and gold
					local XPToGive = unitXP * percentXPToKeep
					-- print("ASQ_Umhaill_UU_UnitPrekill: Unit is Longa Fada, providing XP: " .. XPToGive)
					pUnit:ChangeExperience(unitXP * percentXPToKeep)
					pUnitOwner:ChangeGold(unitXP * (1 - percentXPToKeep))
				end
				
			end
			
		end
		
		pKiller = nil
		unitXP = 0
	end
end

GameEvents.UnitPrekill.Add(ASQ_Umhaill_UU_UnitPrekill)


----------------------------------------------------------------------------------------------------------------------------
-- UB: cheaper to build in conquered cities
----------------------------------------------------------------------------------------------------------------------------

local productionYield = GameInfoTypes["YIELD_PRODUCTION"]

function ASQ_Umhaill_UB_PlayerDoTurn(playerID) -- Begins the function, grabs the player's ID
	-- print("ASQ_Umhaill_UB_PlayerDoTurn: Running...")
	local pPlayer = Players[playerID] -- Defines a local variable equal to the ID of the current player. human specifically?
	if pPlayer:GetCivilizationType() == civilizationID then
	
		for city in pPlayer:Cities() do
			
			if city:GetOriginalOwner() ~= playerID then
				-- print("ASQ_Umhaill_UB_PlayerDoTurn: City was conquered")
			
				-- print("NC_Zazzau_UB_PlayerDoTurn: Found captured city")
				if city:GetProductionBuilding() == buildingTowerHouseID then -- TODO: This works, right
					-- print("ASQ_Umhaill_UB_PlayerDoTurn: City is building Tower House")
					-- print("NC_Zazzau_UB_PlayerDoTurn: Captured city is building a Ganuwar")
					local numProd = city:GetYieldRate(productionYield)
					-- print("NC_Zazzau_UB_PlayerDoTurn: numProd is " .. numProd)
					if numProd > 0 and city:GetProductionTurnsLeft() > 0 then -- Checks whether the city has any production at all, and whether the city won't complete its production on this turn
						city:ChangeProduction(numProd) -- If so, effectively doubles the production speed of the building
						-- print("ASQ_Umhaill_UB_PlayerDoTurn: Accelerated construction by " .. numProd)
					end
				end
			
			end
			
		end
	end
	
end

if bIsActive then
	GameEvents.PlayerDoTurn.Add(ASQ_Umhaill_UB_PlayerDoTurn)
end

----------------------------------------------------------------------------------------------------------------------------
-- UB: Provides a small production boost when a unit dies nearby
----------------------------------------------------------------------------------------------------------------------------

function ASQ_Umhaill_UB_UnitPrekill(playerID, unitID, unitType, iX, iY, bDelay, killerID)
	-- print("ASQ_Umhaill_UB_UnitPrekill: Running...")
	if (not bDelay) then return end
	if (killerID == -1) then return end
	local pPlot = Map.GetPlot(iX, iY)
	
	for loopPlot in PlotAreaSweepIterator(pPlot, 3, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
		if loopPlot:IsCity() then
			-- print("ASQ_Umhaill_UB_UnitPrekill: Found city")
			local pCity = loopPlot:GetPlotCity()
			if pCity:GetNumRealBuilding(buildingTowerHouseID) > 0 then
				-- print("ASQ_Umhaill_UB_UnitPrekill: City has Tower House")
				-- Provide small Production boost
				-- TODO: Confirm this mechanic
				local numProd = math.ceil(pCity:GetYieldRate(productionYield) * 0.1)
				if numProd > 0 and pCity:GetProductionTurnsLeft() > 0 then -- Checks whether the city has any production at all, and whether the city won't complete its production on this turn
					pCity:ChangeProduction(numProd) -- If so, effectively doubles the production speed of the building
					-- print("ASQ_Umhaill_UB_UnitPrekill: Increased production by " .. numProd)
				end
			end
		end
	end

end

if bIsActive then
	GameEvents.UnitPrekill.Add(ASQ_Umhaill_UB_UnitPrekill)
end

print("umhaillFunctions.lua has loaded!")