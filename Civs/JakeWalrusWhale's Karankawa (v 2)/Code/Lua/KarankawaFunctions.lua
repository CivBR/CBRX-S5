--============================================================
-- GLOBALS
--============================================================
print("JWW Karankawa Lua Activated")

include("FLuaVector.lua")

local iKarankawa = GameInfoTypes["CIVILIZATION_JWW_KARANKAWA"]

local iPracticalNumCivs = (GameDefines.MAX_MAJOR_CIVS - 1)
function JFD_IsCivilisationActive(civilizationID)
	for iSlot = 0, iPracticalNumCivs, 1 do
		local slotStatus = PreGame.GetSlotStatus(iSlot)
		if (slotStatus == SlotStatus["SS_TAKEN"] or slotStatus == SlotStatus["SS_COMPUTER"]) then
			if PreGame.GetCivilization(iSlot) == civilizationID then
				return true
			end
		end
	end
	return false
end
local bIsActive = JFD_IsCivilisationActive(iKarankawa)

function JFD_GetRandom(lower, upper)
    return Game.Rand((upper + 1) - lower, "") + lower
end

--===========================================================================
-- TABLESAVERLOADER SUPPORT
--===========================================================================
include("TableSaverLoader016.lua");
JWW_Karankawa = {}
include("Karankawa_TSLSerializerV3.lua");

JWW_Karankawa.DugoutPlots = JWW_Karankawa.DugoutPlots or {}
DugoutPlots = JWW_Karankawa.DugoutPlots

TableLoad(tableRoot, tableName)

function OnModLoaded() 
	local bNewGame = not TableLoad(tableRoot, tableName)
	TableSave(tableRoot, tableName)
end
OnModLoaded()
--===========================================================================
-- UA (Isla del Malhado)
--===========================================================================
local iMarshFeature = GameInfoTypes["FEATURE_MARSH"]
local iFloodplainFeature = GameInfoTypes["FEATURE_FLOOD_PLAINS"]
local iEmbarkPromo = GameInfoTypes["PROMOTION_EMBARKATION"]
local iHolly = GameInfoTypes["RESOURCE_JWW_HOLLY"]
local iOysters = GameInfoTypes["RESOURCE_JWW_OYSTERS"]

local iCoast = GameInfoTypes["TERRAIN_COAST"]
local iOcean = GameInfoTypes["TERRAIN_OCEAN"]
local iGrass = GameInfoTypes["TERRAIN_GRASS"]
local iPlains = GameInfoTypes["TERRAIN_PLAINS"]
local iJungle = GameInfoTypes["FEATURE_JUNGLE"]
local iMarsh = GameInfoTypes["FEATURE_MARSH"]
local iForest = GameInfoTypes["FEATURE_FOREST"]
-----------------------------------------------------------------------------
-- TODO: This is inefficient
local iEmbarkTech = GameInfoTypes["TECH_OPTICS"]
for row in DB.Query("SELECT Type FROM Technologies WHERE AllowsEmbarking = 1") do
	iEmbarkTech = GameInfoTypes[row.Type]
	break -- Just in case 
end
-----------------------------------------------------------------------------
-- On river or floodplain tiles, units move faster and can embark before unlocking Optics
-----------------------------------------------------------------------------
function NC_Karankawa_UA_PlayerDoTurn(iPlayer)
	local pPlayer = Players[iPlayer]
	if pPlayer:IsAlive() and (pPlayer:GetCivilizationType() == iKarankawa) then
		local pTeam = Teams[pPlayer:GetTeam()]
		for pUnit in pPlayer:Units() do
			local pPlot = pUnit:GetPlot()
			local giveBonusPromos = false
			if (pPlot:GetFeatureType() == iMarshFeature) or (pPlot:GetFeatureType() == iFloodplainFeature) or (pPlot:IsRiver()) then
				giveBonusPromos = true
			end
			
			-- Adding promotions to unit (or taking them away)
			if not (pTeam:IsHasTech(iEmbarkTech)) then
				pUnit:SetHasPromotion(iEmbarkPromo, giveBonusPromos)
				if giveBonusPromos then
					pUnit:ChangeMoves(60)
				end
			end
		end
	end
end
-----------------------------------------------------------------------------
-- 1. Unit kills can spawn an Oysters or Holly bonus resource
-- 2. Killing units near Holly or Oysters will cause the unit to heal and gain culture and golden age points
-----------------------------------------------------------------------------
local healAmount = 10
local cultureGain = 10
local GAPGain = 10

function NC_Karankawa_UA_UnitPrekill(playerID, unitID, unitType, iX, iY, bDelay, killerID)
	if not bDelay then return end
	if killerID == -1 then return end
	local pKiller = Players[killerID]
	if pKiller:GetCivilizationType() == iKarankawa then
		local pPlot = Map.GetPlot(iX, iY)
		local pResPlot = pPlot
		local pUnit = pPlot:GetUnit(0)
		
		-- Granting bonuses when a kill occurs near holly/Oysters
			
		-- Check for Holly or Oysters on or adjacent to the unit kill tile
		local nearHollyOrOysters = false
			
		if (pPlot:GetResourceType() == iHolly or pPlot:GetResourceType() == iOysters) then
			nearHollyOrOysters = true
			pResPlot = pPlot
		else
			for direction = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do
				local pAdjPlot = Map.PlotDirection(pUnit:GetX(), pUnit:GetY(), direction)
				if (pAdjPlot:GetResourceType() == iHolly or pAdjPlot:GetResourceType() == iOysters) then
					nearHollyOrOysters = true
					pResPlot = pAdjPlot
					break
				end
			end
		end
			
		-- Grant yields if unit kill was near Holly or Oysters
		if nearHollyOrOysters then
			for direction = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do --Heal all units adj to Holly/Oyster resource that's nearby
				local pAdjResPlot = Map.PlotDirection(pResPlot:GetX(), pResPlot:GetY(), direction)
				if pAdjResPlot:IsUnit() then
					local pUnit = pAdjResPlot:GetUnit(0)
					if pUnit and (pUnit:GetOwner() == killerID) then
						if pUnit:GetCurrHitPoints() < 100 then
							pUnit:SetDamage((100 - pUnit:GetCurrHitPoints()) - healAmount)
							Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(pUnit:GetX(), pUnit:GetY()))), "[COLOR_POSITIVE_TEXT]+" .. healAmount .. " from [ICON_RES_JWW_HOLLY]/[ICON_RES_JWW_OYSTERS]![ENDCOLOR]", 0)
						end
					end
				end
			end
			pKiller:ChangeJONSCulture(cultureGain)
			pKiller:ChangeGoldenAgeProgressMeter(GAPGain)

		end
			
			
		-- Spawning holly/oysters
		if (pPlot:GetImprovementType() == -1) and (pPlot:GetResourceType() == -1) then
			local iRand = JFD_GetRandom(1, 5)
			if iRand == 1 then
				--if (pPlot:CanHaveResource(iOysters)) then
				if (pPlot:GetTerrainType() == iCoast) or (pPlot:GetTerrainType() == iOcean) then
					pPlot:SetResourceType(iOysters)
				--elseif (pPlot:CanHaveResource(iHolly)) then
				elseif (pPlot:GetTerrainType() == iGrass) or (pPlot:GetTerrainType() == iPlains) or (pPlot:GetFeatureType() == iJungle) or (pPlot:GetFeatureType() == iMarsh) or (pPlot:GetFeatureType() == iForest) then
					pPlot:SetResourceType(iHolly)
				end
			end
		end
	end
end
-----------------------------------------------------------------------------
if bIsActive then
	GameEvents.PlayerDoTurn.Add(NC_Karankawa_UA_PlayerDoTurn)
	GameEvents.UnitPrekill.Add(NC_Karankawa_UA_UnitPrekill)
end
--===========================================================================
-- UU (Dug-Out)
--===========================================================================
local iDugout = GameInfoTypes["UNIT_JWW_DUG_OUT"]
local iKarankawaStrength = GameInfoTypes["PROMOTION_JWW_KARANKAWA_COMBAT_STRENGTH"]
local iFishingBoatsImprovement = GameInfoTypes["IMPROVEMENT_FISHING_BOATS"]
-----------------------------------------------------------------------------
-- Resources constructed by this UU grant a combat and movement boost to units starting on the tile
-----------------------------------------------------------------------------
-- Tracking construction
-- Use global variables to avoid having the event be called twice for the same plot
KarankawaUU_BuildFinished_PlayerID = 0
KarankawaUU_BuildFinished_X = 0
KarankawaUU_BuildFinished_Y = 0
KarankawaUU_BuildFinished_Improvement = 0

-- Fires on build finished
function NC_Karankawa_UU_BuildFinished(playerID, iX, iY, eImprovement) -- Thanks DMS
	-- Don't continue if this is a duplicate call
	if (KarankawaUU_BuildFinished_PlayerID == playerID and KarankawaUU_BuildFinished_X == iX and KarankawaUU_BuildFinished_Y == iY and KarankawaUU_BuildFinished_Improvement == eImprovement) then
		return;
	end
	-- Store inputs for duplication check
	KarankawaUU_BuildFinished_PlayerID = playerID;
	KarankawaUU_BuildFinished_X = iX;		
	KarankawaUU_BuildFinished_Y = iY;		
	KarankawaUU_BuildFinished_Improvement = eImprovement;
	--
	local pPlayer = Players[playerID];
	local pPlot = Map.GetPlot(iX, iY);

	if pPlot and pPlot:IsUnit() then
		for i = 0, pPlot:GetNumUnits() - 1 do
			local pUnit = pPlot:GetUnit(i)
			if pUnit:GetUnitType() == iDugout and eImprovement ~= -1 then
				DugoutPlots[pPlot:GetPlotIndex()] = true
				break
			else
				-- Removing former dugout plots
				local isDugoutPlot = DugoutPlots[pPlot:GetPlotIndex()]
				if isDugoutPlot and isDugoutPlot == true then
					DugoutPlots[pPlot:GetPlotIndex()] = false
				end
			end
		end	
	end	
end

-- Providing bonuses
function NC_Karankawa_UU_PlayerDoTurn(iPlayer)
	local pPlayer = Players[iPlayer]
	if pPlayer:IsAlive() and pPlayer:GetCivilizationType() == iKarankawa then
		for pUnit in pPlayer:Units() do
		
			local pPlot = pUnit:GetPlot()
			local iPlot = pPlot:GetPlotIndex()
			
			local giveStrengthPromo = false
			local isDugoutPlot = DugoutPlots[iPlot]
			
			if isDugoutPlot then -- TODO: Maybe awkward
				pUnit:ChangeMoves(120)
				if pUnit:IsCombatUnit() then
					giveStrengthPromo = true
				end
				
			end
			
			pUnit:SetHasPromotion(iKarankawaStrength, giveStrengthPromo)
		end
	end
end
-----------------------------------------------------------------------------
-- If attacked by an enemy or on fishing boat construction, turn into a naval melee unit
-----------------------------------------------------------------------------
-- Also handling Work Boat tile construction

-- Stolen from Uighur_Caesar's Songhai (Sonni Ali)
function GetStrongestMilitaryUnit(pPlayer, bIgnoreResources, ...)
	local tUnit = {["Combat"] = 0}
	for iKey, sCombatType in pairs(arg) do
		for row in GameInfo.Units("CombatClass = \'" .. sCombatType .. "\'") do
			if pPlayer:CanTrain(row.ID, bIgnoreResources) and row.Combat > tUnit.Combat then
				tUnit = row
			end
		end
	end
	return tUnit.ID
end

local unitTriremeID	= GameInfoTypes["UNIT_TRIREME"]

function NC_Karankawa_UU_UnitPrekill(playerID, unitID, unitType, iX, iY, bDelay, killerID)
	
	if not bDelay then return end
	local pPlayer = Players[playerID]
	if pPlayer:GetCivilizationType() == iKarankawa then
		if unitType == iDugout then
			local pPlot = Map.GetPlot(iX, iY)
			-- Add plot to list of Dugout construction plots if unit dies on an improved tile (aka if it was expended to build Fishing Boats)
			-- NOTE: This will also fire if it dies on pre-built Fishing Boats but OH WELL
			if pPlot:GetImprovementType() == iFishingBoatsImprovement then
				DugoutPlots[pPlot:GetPlotIndex()] = true
			end
			
			-- Initialize strongest naval melee unit the player can build
			local newUnitID = GetStrongestMilitaryUnit(pPlayer, false, "UNITCOMBAT_NAVALMELEE") or unitTriremeID
			local newUnit = pPlayer:InitUnit(newUnitID, pPlot:GetX(), pPlot:GetY())
			newUnit:JumpToNearestValidPlot() -- Move to nearest empty plot
			
		end
	end
end

-----------------------------------------------------------------------------
if bIsActive then
	GameEvents.BuildFinished.Add(NC_Karankawa_UU_BuildFinished)
	GameEvents.PlayerDoTurn.Add(NC_Karankawa_UU_PlayerDoTurn)
	GameEvents.UnitPrekill.Add(NC_Karankawa_UU_UnitPrekill)
end
--===========================================================================
-- UB (Ba-ak)
--===========================================================================
local iBaak = GameInfoTypes["BUILDING_JWW_BAAK"]
local iGoldenAgeDummy = GameInfoTypes["BUILDING_JWW_KARANKAWA_GOLDEN_AGE_DUMMY"]
-----------------------------------------------------------------------------
-- 1. Improved Holly and Oysters in this city contribute to longer Golden Ages
-- 2. During a Golden Age, enemy units nearby will take small amounts of damage every turn
-----------------------------------------------------------------------------
function NC_Karankawa_UB_PlayerDoTurn(iPlayer)
	local pPlayer = Players[iPlayer]
	if pPlayer:IsAlive() and pPlayer:GetCivilizationType() == iKarankawa then
		local IsGoldenAge = pPlayer:IsGoldenAge()
		for pCity in pPlayer:Cities() do
		
			if pCity:IsHasBuilding(iBaak) then
				if IsGoldenAge then
				
					-- Increase length of Golden Age per Holly/Oyster
					if pCity:IsHasBuilding(iGoldenAgeDummy) then
						-- Count Holly/Oysters
						local hollyOysterCount = 0
						for i = 0, pCity:GetNumCityPlots() - 1, 1 do
							local cityPlot = pCity:GetCityIndexPlot(i)
							
							if cityPlot:GetWorkingCity() == pCity and (cityPlot:GetResourceType() == iHolly or cityPlot:GetResourceType() == iOysters) then
								hollyOysterCount = hollyOysterCount + 1
							end
						end
						pCity:SetNumRealBuilding(iGoldenAgeDummy, 0)
						local iNumTurns = pPlayer:GetGoldenAgeTurns() + hollyOysterCount
						pPlayer:ChangeGoldenAgeTurns(hollyOysterCount)
					end
					
					-- Damage enemy units
					local pTeam = Teams[pPlayer:GetTeam()]
					for i = 0, pCity:GetNumCityPlots() - 1, 1 do
						local cityPlot = pCity:GetCityIndexPlot(i)
						
						if cityPlot:GetWorkingCity() == pCity then
							if cityPlot:IsUnit() then
								for i = 0, cityPlot:GetNumUnits() - 1 do
									local pEnemyUnit = cityPlot:GetUnit(i)
									local iEnemyTeam = Players[pEnemyUnit:GetOwner()]:GetTeam()
									if pTeam:IsAtWar(iEnemyTeam) then
									
										if pEnemyUnit:GetCurrHitPoints() > 3 then
											-- Should take 5% of the unit's current hitpoints, rounded up
											pEnemyUnit:SetDamage((100 - pEnemyUnit:GetCurrHitPoints()) + math.ceil(pEnemyUnit:GetCurrHitPoints() / 20)) 
											-- print("Karankawa: Damaged unit")
										else
											-- Just kill the enemy unit if their HP is low enough
											pEnemyUnit:Kill()
										end
									end
								end
							end
						end
					end
					
					
				-- Re-adds Golden Age tracker dummy
				else
					pCity:SetNumRealBuilding(iGoldenAgeDummy, 1)
				end
			end
			
		end
	end
end
-----------------------------------------------------------------------------
if bIsActive then
	GameEvents.PlayerDoTurn.Add(NC_Karankawa_UB_PlayerDoTurn)
end
--===========================================================================