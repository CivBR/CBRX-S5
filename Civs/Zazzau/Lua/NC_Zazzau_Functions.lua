-- JFD_Civs_AfghanistanZahirShah_Functions
-- Author: JFD
-- DateCreated: 2/15/2014 6:33:36 PM
-- ======================== --
-- TABLESAVERLOADER SUPPORT --
-- ======================== --

-- Just stealing the includes from the code I'm referencing to be safe
-- TODO: Actually add the TSL files to the mod
include("Zazzau_GlobalDefines.lua");
include("TableSaverLoader016.lua");

tableRoot = NC_Zazzau
tableName = "NC_Zazzau"

include("Zazzau_TSLSerializerV3.lua");

TableLoad(tableRoot, tableName)

function OnModLoaded() 
	local bNewGame = not TableLoad(tableRoot, tableName)
	TableSave(tableRoot, tableName)
end
OnModLoaded()

-- Setting up luxury tracker
local LUXURIES = {}; -- Just here to get a list of resources categorized as luxury
for row in DB.Query("SELECT ID FROM Resources WHERE ResourceClassType = 'RESOURCECLASS_LUXURY'") do LUXURIES[row.ID] = true end

--==========================================================================================================================
-- INCLUDES
--==========================================================================================================================
------------------------------------------------------------------------------------------------------------------------
include("FLuaVector.lua")
include("PlotIterators.lua")
include("RoadPathfinder.lua")
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

local iNumDirections = DirectionTypes.NUM_DIRECTION_TYPES - 1
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
local civilizationID = GameInfoTypes["CIVILIZATION_NC_ZAZZAU"]
local bIsActive = JFD_IsCivilizationActive(civilizationID)
local traitZazzauID = GameInfoTypes["TRAIT_NC_ZAZZAU"]

local buildingGanuwarID = GameInfoTypes["BUILDING_NC_GANUWAR"]
local buildingGanuwarDummyID = GameInfoTypes["BUILDING_NC_GANUWAR_DUMMY"]
local buildingHasGanuwarID = GameInfoTypes["BUILDING_NC_GANUWAR_TRACKER"]
local buildingDummyZazzauTradeGoldID = GameInfoTypes["BUILDING_NC_ZAZZAU_GOLD_DUMMY"]

local improvementCustomsHouseID = GameInfoTypes["IMPROVEMENT_CUSTOMS_HOUSE"]


local promotionYanLifidaID = GameInfoTypes["PROMOTION_NC_ZAZZAU_YAN_LIFIDA"]
local promotionYanLifidaBonusXPID = GameInfoTypes["PROMOTION_NC_ZAZZAU_YAN_LIFIDA_BONUS"]

local unitYanLifidaID = GameInfoTypes["UNIT_NC_YAN_LIFIDA"]

local unitGreatGeneralID = GameInfoTypes["UNIT_GREAT_GENERAL"]
local iGGClass = GameInfoTypes["UNITCLASS_GREAT_GENERAL"]

local iPracticalNumCivs = (GameDefines.MAX_MAJOR_CIVS - 1)

------------------------------------------------------------------------------------------------------------------------
-- FUNCTIONS
------------------------------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------------------------------------
-- UA: The birth of a Great General contributes towards the research of a military technology
----------------------------------------------------------------------------------------------------------------------------
-- Based off JFD's Julius Caesar Rome
-- And also MC's Khrushchev Soviet Union

local tMilTechs = {}

-- TODO: Maybe make this only land unit techs
for row in DB.Query("SELECT * FROM Units WHERE Combat > 0 OR RangedCombat > 0") do
	local iTech = GameInfoTypes[row.PrereqTech]
	if iTech then
		tMilTechs[iTech] = true
	end
end

local promotionWeaponsResharpenedID = GameInfoTypes["PROMOTION_NC_WEAPONS_RESHARPENED"]
local function NC_Zazzau_SerialEventUnitCreated(playerID, unitID)
	-- print("NC_Zazzau_SerialEventUnitCreated: Running NC_Zazzau_SerialEventUnitCreated...")
	local pPlayer = Players[playerID]
    local pTeam = Teams[pPlayer:GetTeam()]
	local pTeamTechs = pTeam:GetTeamTechs()
	if (not pPlayer:IsAlive()) then return end
	local iEra = pPlayer:GetCurrentEra()
	
	--Dictator Perpetuo
	if (not HasTrait(pPlayer, traitZazzauID)) then return end
	local unit = pPlayer:GetUnitByID(unitID)
	if (not unit) then return end
	if unit:GetUnitType() ~= unitGreatGeneralID then return end
	if unit:IsHasPromotion(promotionWeaponsResharpenedID) then return end
	
	-- print("NC_Zazzau_SerialEventUnitCreated: New unit is Great General")
	
	local currentTechID = pPlayer:GetCurrentResearch()
	
	if tMilTechs[currentTechID] == true then
		-- print("NC_Zazzau_SerialEventUnitCreated: Found a military tech, providing research bonus!")
		print(currentTechID)
		pTeamTechs:ChangeResearchProgressPercent(currentTechID, 20, pPlayer)
	
	-- Give bonus research to the next unresearched military tech
	-- Could make this a helper function
	else 
		for tech, val in pairs(tMilTechs) do
			if not pTeam:IsHasTech(tech) and pPlayer:CanResearch(tech) then
				-- print("NC_Zazzau_SerialEventUnitCreated: Found a military tech, providing research bonus!")
				-- print(tech)
				pTeamTechs:ChangeResearchProgressPercent(tech, 20, pPlayer)
				break
			end
		end
	end
	unit:SetHasPromotion(promotionWeaponsResharpenedID, true)
end

if bIsActive then
	Events.SerialEventUnitCreated.Add(NC_Zazzau_SerialEventUnitCreated)
end

----------------------------------------------------------------------------------------------------------------------------
-- UA: Researching a military technology grants Great General points
----------------------------------------------------------------------------------------------------------------------------
-- Based off Fran's Joao II Portugal

function NC_Zazzau_TeamTechResearched(eTeam, eTech, iChange)
	-- print("NC_Zazzau_TeamTechResearched: Running NC_Zazzau_TeamTechResearched...")
	local team = Teams[eTeam]
	local playerID = team:GetLeaderID()
	local player = Players[playerID]
	if player:GetCivilizationType() == civilizationID then
		-- print("NC_Zazzau_TeamTechResearched: Player is Zazzau")
		if tMilTechs[eTech] then
			-- print("NC_Zazzau_TeamTechResearched: Military tech has been researched, providing Great General points")
			player:ChangeCombatExperience(50) -- TODO: Balance this number
		end
	end
end

if bIsActive then
	GameEvents.TeamTechResearched.Add(NC_Zazzau_TeamTechResearched)
end

----------------------------------------------------------------------------------------------------------------------------
-- UA: Capturing a city with a new luxury resource for the first time permanently increases the Gold output of Trade Routes
----------------------------------------------------------------------------------------------------------------------------

-- Maintain a table of all collected luxury resources
-- When the player settles or expands onto a tile, check if it has a luxury resource, then mark it as owned
-- When the player captures a city, check if it has previously unowned luxuries on its tiles, add a permanent trade route gold upgrade if so, then mark it as owned

-- This is all adapted from TopHat's Hohokam
-- Probably doesn't work with multiple Kongs at once, but oh well

local conqueredLuxuries = 0

function NC_Zazzau_UA_CheckMapAtGameStart()
	-- print("NC_Zazzau_UA_CheckMapAtGameStart: Running NC_Zazzau_UA_CheckMapAtGameStart...")
	for k,v in pairs(ZazzauOwnedLuxuries) do
		if v == 2 then
			conqueredLuxuries = conqueredLuxuries + 1
		end
	end
end

if bIsActive then
	Events.SequenceGameInitComplete.Add(NC_Zazzau_UA_CheckMapAtGameStart)
end

-- Handles the case where a city is founded on a luxury
function NC_Zazzau_UA_CityFounded(playerID, iX, iY)
	-- print("NC_Zazzau_UA_CityFounded: Running NC_Zazzau_UA_CityFounded...")
	local pPlayer = Players[playerID]
	if pPlayer:GetCivilizationType() == civilizationID then
		
		local pPlot = Map.GetPlot(iX, iY)
		if pPlot:GetResourceType() >= 0 and LUXURIES[pPlot:GetResourceType()] then
			-- print("NC_Zazzau_UA_CityFounded: Plot has luxury")
			if not ZazzauOwnedLuxuries[pPlot:GetResourceType()] then
				-- print("NC_Zazzau_UA_CityFounded: Zazzau did not have luxury before, adding!")
				ZazzauOwnedLuxuries[pPlot:GetResourceType()] = 1
			end
		end
		for iDir = 0, iNumDirections, 1 do
			local pAdjPlot = Map.PlotDirection(iX, iY, iDir)
			if pAdjPlot:GetResourceType() >= 0 and LUXURIES[pAdjPlot:GetResourceType()] then
				-- print("NC_Zazzau_UA_CityFounded: Plot has luxury")
				if not ZazzauOwnedLuxuries[pAdjPlot:GetResourceType()] then
					-- print("NC_Zazzau_UA_CityFounded: Zazzau did not have luxury before, adding!")
					ZazzauOwnedLuxuries[pAdjPlot:GetResourceType()] = 1
				end
			end
		end
	end
end

-- Handles the case where a city purchases a plot with a luxury
function NC_Zazzau_UA_BoughtPlot(playerID, cityID, iX, iY)
	-- print("NC_Zazzau_UA_BoughtPlot: Running NC_Zazzau_UA_BoughtPlot...")
	local pPlayer = Players[playerID]
	if pPlayer:GetCivilizationType() == civilizationID then
		local pPlot = Map.GetPlot(iX, iY)
		if pPlot:GetResourceType() >= 0 and LUXURIES[pPlot:GetResourceType()] then
			-- print("NC_Zazzau_UA_BoughtPlot:Plot has luxury")
			if not ZazzauOwnedLuxuries[pPlot:GetResourceType()] then
				-- print("NC_Zazzau_UA_BoughtPlot: Zazzau did not have luxury before, added!")
				ZazzauOwnedLuxuries[pPlot:GetResourceType()] = 1
			end
		end
	end
end

-- Handles the case where the player obtains a luxury with a citadel
function NC_Zazzau_UA_CitadelBuilt(playerID, iX, iY, improvementType)
	-- print("NC_Zazzau_UA_CitadelBuilt: Running NC_Zazzau_UA_CitadelBuilt...")
	if improvementType == iCitadel then
		local pPlayer = Players[playerID]
		if pPlayer:GetCivilizationType() == civilizationID then
			for iDir = 0, iNumDirections, 1 do
				local pAdjPlot = Map.PlotDirection(iX, iY, iDir)
				if pAdjPlot:GetResourceType() >= 0 and LUXURIES[pAdjPlot:GetResourceType()] then
					-- print("NC_Zazzau_UA_CitadelBuilt: Plot has luxury")
					if not ZazzauOwnedLuxuries[pPlot:GetResourceType()] then
						-- print("NC_Zazzau_UA_CitadelBuilt: Zazzau did not have luxury before, added!")
						ZazzauOwnedLuxuries[pAdjPlot:GetResourceType()] = 1
					end
				end
			end
		end
	end
end

-- Handles the case where the player captures a city
-- TODO: Should this max out at one new resource per city
function NC_Zazzau_UA_CityCaptured(oldPlayerID, bCapital, iX, iY, newPlayerID)
	-- print("NC_Zazzau_UA_CityCaptured: Running NC_Zazzau_UA_CityCaptured...")
	local pNewPlayer = Players[newPlayerID]
	if pNewPlayer:GetCivilizationType() == civilizationID then
		-- print("NC_Zazzau_UA_CityCaptured: Zazzau captured city")
		local pCity = Map.GetPlot(iX, iY):GetPlotCity()
		for i = 0, pCity:GetNumCityPlots() - 1, 1 do
			local pPlot = pCity:GetCityIndexPlot(i)
			if pPlot:GetOwner() == newPlayerID and pPlot:GetWorkingCity() == pCity then
				if pPlot:GetResourceType() >= 0 and LUXURIES[pPlot:GetResourceType()] then
					-- print("NC_Zazzau_UA_CityCaptured: Plot has luxury")
					if not ZazzauOwnedLuxuries[pPlot:GetResourceType()] then
						-- print("NC_Zazzau_UA_CityCaptured: Zazzau did not have luxury before, added to conquered luxuries list!")
						ZazzauOwnedLuxuries[pPlot:GetResourceType()] = 2
						conqueredLuxuries = conqueredLuxuries + 1
					end
				end
			end
		end
	end
end

-- Actually providing the gold
-- This is ugly and bad but w/e

function NC_Zazzau_UA_PlayerDoTurn(playerID)
	-- print("NC_Zazzau_UA_PlayerDoTurn: Running NC_Zazzau_UA_PlayerDoTurn...")
	local pPlayer = Players[playerID]
	if pPlayer == nil then return end
	if not pPlayer:IsAlive() then return end
	if pPlayer:GetCivilizationType() ~= civilizationID then return end	
	
	-- Resetting gold dummies 
	-- print("NC_Zazzau_UA_PlayerDoTurn: Trade gold dummies: " .. conqueredLuxuries)
	for cCity in pPlayer:Cities() do
		-- print("NC_Zazzau_UA_PlayerDoTurn: Resetting trade gold dummies")
		cCity:SetNumRealBuilding(buildingDummyZazzauTradeGoldID, conqueredLuxuries)
	end

end

if bIsActive then
	GameEvents.PlayerCityFounded.Add(NC_Zazzau_UA_CityFounded)
	GameEvents.CityBoughtPlot.Add(NC_Zazzau_UA_BoughtPlot)
	GameEvents.BuildFinished.Add(NC_Zazzau_UA_CitadelBuilt)
	GameEvents.CityCaptureComplete.Add(NC_Zazzau_UA_CityCaptured)
	GameEvents.PlayerDoTurn.Add(NC_Zazzau_UA_PlayerDoTurn)
end


----------------------------------------------------------------------------------------------------------------------------
-- UU: Extra Great General points on kill
----------------------------------------------------------------------------------------------------------------------------
-- Based heavily off Oyo, how fitting

function NC_Zazzau_UnitPrekill(playerID, unitID, unitType, iX, iY, bDelay, killerID)
	-- print("NC_Zazzau_UnitPrekill: Running NC_Zazzau_UnitPrekill...")
	if bDelay then
		if killerID == -1 then return end
		pKiller = Players[killerID]
		-- print("NC_Zazzau_UnitPrekill: Marking killer")
	elseif pKiller then
		if not (playerID == civilizationBarbarianID) then
			if not HasTrait(pKiller, traitZazzauID) then return end
			-- print("NC_Zazzau_UnitPrekill: killing player is Zazzau")
			local pPlot = Map.GetPlot(iX, iY)
			local pUnit = pPlot:GetUnit(0)
			if pUnit then
				-- print("NC_Zazzau_UnitPrekill: Unit found on tile post-kill")
				local pUnitOwner = Players[pUnit:GetOwner()]
				if (pUnit:IsHasPromotion(promotionYanLifidaID)) then
					-- print("NC_Zazzau_UnitPrekill: Yan Lifida did the kill, providing Great General points")
					pKiller:ChangeCombatExperience(10) -- Probably not as good as using pUnitOwner but this also actually seems to work
					-- TODO: Popup
					
				end
				
			end
			
		end
		
		pKiller = nil
	end
end

if bIsActive then
	GameEvents.UnitPrekill.Add(NC_Zazzau_UnitPrekill)
end


----------------------------------------------------------------------------------------------------------------------------
-- UU: Gains extra XP from combat while near a Great General
----------------------------------------------------------------------------------------------------------------------------
-- Based off Chrisy15's Ho Chi Minh Vietnam
function NC_Zazzau_UU_PlayerDoTurn(playerID)
	-- print("NC_Zazzau_UU_PlayerDoTurn: Running NC_Zazzau_UU_PlayerDoTurn...")
	local pPlayer = Players[playerID]
	if pPlayer == nil then return end
	if not pPlayer:IsAlive() then return end
	if pPlayer:GetCivilizationType() ~= civilizationID then return end	
	
	for pUnit in pPlayer:Units() do
		if pUnit:IsHasPromotion(promotionYanLifidaID) then
			-- print("NC_Zazzau_UU_PlayerDoTurn: Checking Yan Lifida plot")
			local pPlot = pUnit:GetPlot()
			local bGive = false
			-- Checking stacked units
			for i = 0, pPlot:GetNumUnits() - 1 do
				local pOtherUnit = pPlot:GetUnit(i)
				if (pOtherUnit:GetUnitClassType() == iGGClass) then
					-- print("NC_Zazzau_UU_PlayerDoTurn: Found Great General on plot")
					bGive = true
				end
			end
			-- Checking adjacent units
			if not bGive then
				-- print("NC_Zazzau_UU_PlayerDoTurn: Checking adjacent plots")
				local iX, iY = pUnit:GetX(), pUnit:GetY()
				for nearbyPlot in PlotAreaSweepIterator(pPlot, 2, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
					if nearbyPlot:IsUnit() then
						for i = 0, nearbyPlot:GetNumUnits() - 1 do
							local pAdjUnit = nearbyPlot:GetUnit(i)
							if (pAdjUnit:GetUnitClassType() == iGGClass and pAdjUnit:GetOwner() == playerID) then
								-- print("NC_Zazzau_UU_PlayerDoTurn: Found Great General on plot")
								bGive = true
								break
							end
						end
					end
					if bGive then
						break
					end
				end
			end
			pUnit:SetHasPromotion(promotionYanLifidaBonusXPID, bGive)
		end
	end
	
end

if bIsActive then
	GameEvents.PlayerDoTurn.Add(NC_Zazzau_UU_PlayerDoTurn)
end

----------------------------------------------------------------------------------------------------------------------------
-- UB: Cheaper to build in captured cities
----------------------------------------------------------------------------------------------------------------------------
-- AND
----------------------------------------------------------------------------------------------------------------------------
-- UB: Generates extra City Strength and Happiness for every Ganuwar in your empire
----------------------------------------------------------------------------------------------------------------------------
-- This won't work with multiple Zazzaus in the same game, OH WELL
local ganuwarCount = 0
local gamuwarCap = 12
local productionYield = GameInfoTypes["YIELD_PRODUCTION"]

function NC_Zazzau_CountGanuwarOnGameStart()
	-- print("NC_Zazzau_CountGanuwarOnGameStart: Running NC_Zazzau_CountGanuwarOnGameStart...")
	for i = 0, iPracticalNumCivs, 1 do -- TODO: Is there a better way to do this
		
		local pPlayer = Players[i]
		if pPlayer and pPlayer:IsAlive() and pPlayer:GetCivilizationType() == civilizationID then
			-- print("NC_Zazzau_CountGanuwarOnGameStart: Player is Zazzau")
			for city in pPlayer:Cities() do
				if city:GetNumRealBuilding(buildingGanuwarID) > 0 then
					-- print("NC_Zazzau_CountGanuwarOnGameStart: Found Ganuwar")
					ganuwarCount = ganuwarCount + 1
				end
			end
			
			-- print("NC_Zazzau_CountGanuwarOnGameStart: Ganuwar total is " .. ganuwarCount)
		end
	end
end

-- Add to Ganuwar count and add tracker dummy on constructing a Ganuwar
function NC_Zazzau_CityConstructed(playerID, cityID, buildingID)
	-- print("NC_Zazzau_CityConstructed: Running NC_Zazzau_CityConstructed...")
	local pPlayer = Players[playerID]
    if pPlayer and pPlayer:GetCivilizationType() == civilizationID then
		-- print("NC_Zazzau_CityConstructed: Player is Zazzau")
		local pCity = pPlayer:GetCityByID(cityID)
		if buildingID == buildingGanuwarID then
			-- print("NC_Zazzau_CityConstructed: Ganuwar constructed, adding to count")
			ganuwarCount = ganuwarCount + 1
			pCity:SetNumRealBuilding(buildingHasGanuwarID, 1) -- Adding a dummy to check for in case the city gets captured
		end
	end
end

-- Remove from Ganuwar count and remove tracker dummy on selling a Ganuwar
function NC_Zazzau_CitySoldBuilding(playerID, cityID, buildingID)
	-- print("NC_Zazzau_CitySoldBuilding: Running NC_Zazzau_CitySoldBuilding...")
	local pPlayer = Players[playerID]
    if pPlayer and pPlayer:GetCivilizationType() == civilizationID then
		-- print("NC_Zazzau_CitySoldBuilding: Player is Zazzau")
		local pCity = pPlayer:GetCityByID(cityID)
		if buildingID == buildingGanuwarID then
			-- print("NC_Zazzau_CitySoldBuilding: Ganuwar sold, removing from count")
			ganuwarCount = ganuwarCount - 1
			pCity:SetNumRealBuilding(buildingHasGanuwarID, 0) -- Removing dummy
		end
	end
end

-- Check for tracker dummy, remove tracker dummy, and remove from Ganuwar count if a city is captured
function NC_Zazzau_CityCaptured(oldPlayerID, bCapital, iX, iY, newPlayerID)
	-- print("NC_Zazzau_CityCaptured: Running NC_Zazzau_CityCaptured...")
	local pOldPlayer = Players[oldPlayerID]
	if pOldPlayer:GetCivilizationType() == civilizationID then
		-- print("NC_Zazzau_CityCaptured: City was captured from Zazzau")
		local pCity = Map.GetPlot(iX, iY):GetPlotCity()
		
		-- Checking for the dummy that marks a Ganuwar and isn't destroyed on city capture, unlike the UB itself
		if pCity:GetNumRealBuilding(buildingHasGanuwarID) > 0 then
			-- print("NC_Zazzau_CityCaptured: City had Ganuwar, removing from count")
			ganuwarCount = ganuwarCount - 1
			pCity:SetNumRealBuilding(buildingHasGanuwarID, 0) -- Removing dummy
		end
	end
end


-- Each turn, loop over player cities and if they have a Ganuwar add dummies for each Ganuwar in the empire (up to a cap)

function NC_Zazzau_UB_PlayerDoTurn(playerID) -- Begins the function, grabs the player's ID
	-- print("NC_Zazzau_UB_PlayerDoTurn: Running NC_Zazzau_UB_PlayerDoTurn...")
	local pPlayer = Players[playerID] -- Defines a local variable equal to the ID of the current player. human specifically?
	if pPlayer:GetCivilizationType() == civilizationID then
	
		-- print("NC_Zazzau_UB_PlayerDoTurn: Player is Zazzau")
		local ganuwarBonusTotal = math.ceil((ganuwarCount - 1) / 4) -- The first extra Ganuwar and every fourth Ganuwar after that up to the 13th provides a bonus
		ganuwarBonusTotal = math.min(ganuwarBonusTotal, 4)
		
		-- print("NC_Zazzau_UB_PlayerDoTurn: Ganuwar bonus total is " .. ganuwarBonusTotal)
		
		for city in pPlayer:Cities() do
			
			if city:GetOriginalOwner() ~= playerID then
			
				-- print("NC_Zazzau_UB_PlayerDoTurn: Found captured city")
				if city:GetProductionBuilding() == buildingGanuwarID then -- TODO: This works, right
					-- print("NC_Zazzau_UB_PlayerDoTurn: Captured city is building a Ganuwar")
					local numProd = city:GetYieldRate(productionYield)
					-- print("NC_Zazzau_UB_PlayerDoTurn: numProd is " .. numProd)
					if numProd > 0 and city:GetProductionTurnsLeft() > 0 then -- Checks whether the city has any production at all, and whether the city won't complete its production on this turn
						city:ChangeProduction(numProd) -- If so, effectively doubles the production speed of the building
						--print("Ndongo UA Section 2 has fired!")
					end
				end
			
			end
			
			-- Bonus city defense and happiness for each Ganuwar in the empire (up to a point)
			
			if city:GetNumRealBuilding(buildingGanuwarID) > 0 then
				-- print("NC_Zazzau_UB_PlayerDoTurn: City has Ganuwar, adding Ganuwar bonuses")
				city:SetNumRealBuilding(buildingGanuwarDummyID, ganuwarBonusTotal)
			else 
				-- print("NC_Zazzau_UB_PlayerDoTurn: City does not have Ganuwar, no Ganuwar bonuses")
				city:SetNumRealBuilding(buildingGanuwarDummyID, 0)
			end
		end
	end
	
end

if bIsActive then
	GameEvents.PlayerDoTurn.Add(NC_Zazzau_UB_PlayerDoTurn) -- Adds the above function to the PlayerDoTurn event
	GameEvents.CityConstructed.Add(NC_Zazzau_CityConstructed)
	GameEvents.CitySoldBuilding.Add(NC_Zazzau_CitySoldBuilding)
	GameEvents.CityCaptureComplete.Add(NC_Zazzau_CityCaptured)
end





if bIsActive then
	Events.SequenceGameInitComplete.Add(NC_Zazzau_CountGanuwarOnGameStart)
end