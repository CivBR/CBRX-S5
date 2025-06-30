-- JFD_Civs_ChileBalcemada_Functions
-- Author: JFD
-- DateCreated: 2/15/2014 6:33:36 PM
-- ======================== --
-- TABLESAVERLOADER SUPPORT --
-- ======================== --

-- Just stealing the includes from the code I'm referencing to be safe
include("Cebu_GlobalDefines.lua");
include("TableSaverLoader016.lua");

tableRoot = NC_Cebu
tableName = "NC_Cebu"

include("Cebu_TSLSerializerV3.lua");

TableLoad(tableRoot, tableName)

function OnModLoaded() 
	local bNewGame = not TableLoad(tableRoot, tableName)
	TableSave(tableRoot, tableName)
end
OnModLoaded()

-- if not KilomboStartingUnitXP[0] then
	-- for playerID, pPlayer in pairs(Players) do
		-- KilomboStartingUnitXP[playerID] = {}
	-- end
-- end
--==========================================================================================================================
-- INCLUDES
--==========================================================================================================================
------------------------------------------------------------------------------------------------------------------------
include("FLuaVector.lua")
include("PlotIterators.lua")
include("UniqueDiplomacyUtilsV2.lua")
include("IconSupport.lua")
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
----------------------------------------------------------------------------------------------------------------------------
-- JFD_IsCivilisationActive
function JFD_IsCivilisationActive(civilisationID)
	for iSlot = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
		local slotStatus = PreGame.GetSlotStatus(iSlot)
		if (slotStatus == SlotStatus["SS_TAKEN"] or slotStatus == SlotStatus["SS_COMPUTER"]) then
			if PreGame.GetCivilization(iSlot) == civilisationID then
				return true
			end
		end
	end
	return false
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_GetRandom
function JFD_GetRandom(lower, upper)
	return Game.Rand((upper + 1) - lower, "") + lower
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
local defineMaxPlayers = GameDefines["MAX_PLAYERS"]
--==========================================================================================================================
-- UNIQUE FUNCTIONS
--==========================================================================================================================
------------------------------------------------------------------------------------------------------------------------
-- GLOBALS
------------------------------------------------------------------------------------------------------------------------
local civilizationID = GameInfoTypes["CIVILIZATION_NC_CEBU"]
local isCivActive = JFD_IsCivilisationActive(civilizationID) -- Just in case
local traitCebuID = GameInfoTypes["TRAIT_NC_CEBU"]
local g_IsTraitActive = IsTraitActive(traitCebuID) 



local buildingDummyCebuTradeGold = GameInfoTypes["BUILDING_DUMMY_NC_CEBU_GOLD"]
local buildingDummyCebuTraded = GameInfoTypes["BUILDING_DUMMY_NC_CEBU_HAS_TRADED"]
local buildingDummyCebuPorcelain = GameInfoTypes["BUILDING_DUMMY_NC_CEBU_PORCELAIN"]
local buildingDummyCebuJewelry = GameInfoTypes["BUILDING_DUMMY_NC_CEBU_JEWELRY"]

local improvementBarangayID = GameInfoTypes["IMPROVEMENT_NC_BARANGAY"]

local promotionMangubatID = GameInfoTypes["PROMOTION_NC_TIMAWA"]
local unitMangubatID = GameInfoTypes["UNIT_NC_TIMAWA"]

local yieldGoldID = GameInfoTypes["YIELD_GOLD"]
------------------------------------------------------------------------------------------------------------------------
-- FUNCTIONS
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
-- UA: Each trade route to a new foreign civilisation from the capital creates a copy of a city-state luxury resource
------------------------------------------------------------------------------------------------------------------------
-- Adapted from Rosas Argentina

function NC_Cebu_UA1_PlayerDoTurn(playerID)
	local pPlayer = Players[playerID]
	if pPlayer == nil then return end
	if not pPlayer:IsAlive() then return end
	if pPlayer:GetCivilizationType() ~= civilizationID then return end	
	
	local tradeRoutes = pPlayer:GetTradeRoutes()
	local incomingTradeRoutes = pPlayer:GetTradeRoutesToYou()
	
-- Check whether player has trade routes
	if tradeRoutes ~= nil then
		-- print("NC_Cebu_UA1_PlayerDoTurn: Cebu has trade routes")
		
		-- Loops over trade routes
		for tri, tRoute in pairs(tradeRoutes) do
			-- print("Looping over player trade routes!")
			-- Grabs the cities as variables
			local fromPlayer = Players[tRoute.FromID]
			local fromCity = tRoute.FromCity
			-- local fromCity = pPlayer:GetCityByID(tRoute.FromCity)
			local toPlayer = Players[tRoute.ToID]
			local toCity = tRoute.ToCity
			-- local toCity = toPlayer:GetCityByID(toCityID)
			
			
			-- Gives City-State luxuries on trade route with new civ
			if toPlayer and (toPlayer ~= pPlayer) then
				-- print("NC_Cebu_UA1_PlayerDoTurn: Cebu has a trade route to another civ")
				
				local iCapital = fromPlayer:GetCapitalCity()
				
				if (fromCity == iCapital) then
					-- print("NC_Cebu_UA1_PlayerDoTurn: Cebu trade route is from the capital")
				
					local otherCapital = toPlayer:GetCapitalCity()
					
					if (otherCapital:GetNumRealBuilding(buildingDummyCebuTraded) == 0) then
						-- print("NC_Cebu_UA1_PlayerDoTurn: Cebu has not traded with civ before, adding luxury dummy")
						otherCapital:SetNumRealBuilding(buildingDummyCebuTraded, 1)
						
						local iRand = JFD_GetRandom(1, 2)
						if (iRand == 1) then
							-- print("NC_Cebu_UA1_PlayerDoTurn: Adding source of Porcelain")
							local numRes = iCapital:GetNumRealBuilding(buildingDummyCebuPorcelain)
							iCapital:SetNumRealBuilding(buildingDummyCebuPorcelain, numRes + 1)
						else
							-- print("NC_Cebu_UA1_PlayerDoTurn: Adding source of Jewelry")
							local numRes = iCapital:GetNumRealBuilding(buildingDummyCebuJewelry)
							iCapital:SetNumRealBuilding(buildingDummyCebuJewelry, numRes + 1)
						end
						
					end
					
				end
			end
			
			-- print('---')
		end
	end
	
end



if isCivActive then
	GameEvents.PlayerDoTurn.Add(NC_Cebu_UA1_PlayerDoTurn)
end

------------------------------------------------------------------------------------------------------------------------
-- UA: Your units may pillage your own improvements, damaging enemy units inside your territory and generating culture
------------------------------------------------------------------------------------------------------------------------
-- AND
------------------------------------------------------------------------------------------------------------------------
-- UU: Pillaging an improvement or trade route does not cost an action and increases combat strength for the rest of the turn
------------------------------------------------------------------------------------------------------------------------
-- Taken almost wholesale from TopHat's Cheyenne

local iPillageMission = GameInfoTypes["MISSION_PILLAGE"]
local iPillager = GameInfoTypes["UNIT_NC_TIMAWA"]
local iPillagerClass = GameInfoTypes["UNITCLASS_PIKEMAN"]
local pActivePlayer = Players[Game.GetActivePlayer()]
local domainLandID = GameInfoTypes["DOMAIN_LAND"]

function Cebu_IsButtonPossible(pUnit)
	local pUnitOwner = Players[pUnit:GetOwner()]
	if (pUnitOwner:GetCivilizationType() == civilizationID) or (pUnit:IsHasPromotion(promotionMangubatID)) then
		-- print("Cebu_IsButtonPossible: Civilization is Cebu or unit is Mangubat")
		local pPlot = pUnit:GetPlot()
		local pPlotOwner = -1
		if pPlot:IsOwned() then
			pPlotOwner = Players[pPlot:GetOwner()]
		end
		-- if pUnitOwner ~= pPlotOwner then
		if pUnit:GetBaseCombatStrength() < 1 then return false end
		
		if (pUnit:GetDomainType() == domainLandID and (pPlot:GetTerrainType() == GameInfoTypes.TERRAIN_COAST or pPlot:GetTerrainType() == GameInfoTypes.TERRAIN_OCEAN)) then
			-- print("Cebu_IsButtonPossible: Land unit on sea tile, false unless Mangubat (TEST THIS FOR REGULAR UNITS)")
			if (not pUnit:IsHasPromotion(promotionMangubatID)) then return false end
		end
		if pPlot:GetImprovementType() > -1 and not pPlot:IsImprovementPillaged() then
			-- print("Cebu_IsButtonPossible: Plot has an improvement and isn't pillaged")
			if pPlot:IsOwned() then
				-- print("Cebu_IsButtonPossible: Civilization is Cebu or unit is Mangubat")
				local pUnitTeam = Teams[pUnitOwner:GetTeam()]
				local iOtherTeam = pPlotOwner:GetTeam()
				-- You can pillage the tiles of civs you're at war with
				if pUnitTeam:IsAtWar(iOtherTeam) then
					-- print("Cebu_IsButtonPossible: Cebu at war with other civ, RETURNING TRUE")
					return true
				-- You can pillage your own tiles
				elseif pUnitOwner == pPlotOwner then
					-- print("Cebu_IsButtonPossible: Cebu unit in own territory, RETURNING TRUE")
					return true
				end
			-- You can pillage unowned improvements
			else
				-- print("Cebu_IsButtonPossible: Tile not owned, RETURNING TRUE")
				return true
			end
		end
		-- end
	end
	-- print("Cebu_IsButtonPossible: No condition satisfied, RETURNING FALSE")
	return false
end

function Cebu_DoButtonEffect(pPlayer, pUnit)
	local pPlot = pUnit:GetPlot()
	local pPlotOwner = -1
	local pUnitOwner = Players[pUnit:GetOwner()]
	if pPlot:IsOwned() then
		pPlotOwner = Players[pPlot:GetOwner()]
	end
	local iEra = pPlayer:GetCurrentEra()
	
	if pPlot:GetImprovementType() > -1 and not pPlot:IsImprovementPillaged() then -- TODO: Double-check, should at least prevent the player from spamming the button
		
		local improvementWaterMod = 1
		local plotTerrain = pPlot:GetTerrainType()
		if (plotTerrain == GameInfoTypes.TERRAIN_COAST) or (plotTerrain == GameInfoTypes.TERRAIN_OCEAN) then
			pPlot:SetImprovementType(-1)
			improvementWaterMod = 2
		end
		pPlot:SetImprovementPillaged(true)
		
		-- Reducing movement of unit after pillaging, unless it's a Mangubat
		if (not pUnit:IsHasPromotion(promotionMangubatID)) then
			-- print("Cebu_DoButtonEffect: Unit is not Mangubat, reducing moves")
			pUnit:ChangeMoves(-120)
			if pUnit:MovesLeft() < 0 then pUnit:SetMoves(0) end
		end
		
		pUnit:ChangeDamage(-25)
		
		if pPlayer ~= pPlotOwner then
			-- print("Cebu_DoButtonEffect: Player not pillaging their own tile, providing Gold")
			pPlayer:ChangeGold(20)
			if pPlayer:IsHuman() then
				local iX = pUnit:GetX()
				local iY = pUnit:GetY()
				local sMessage = "[COLOR_YIELD_GOLD]+20 [ICON_GOLD][ENDCOLOR]"
				Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(iX, iY))), sMessage, 0)
			end
		end
		
		-- Additional effects go here!
		-- UU: Gains extra Combat Strength for the rest of the turn
		if pUnit:IsHasPromotion(promotionMangubatID) then
			-- print("Cebu_DoButtonEffect: Applying Mangubat Combat Strength bonus")
			pUnit:SetBaseCombatStrength(pUnit:GetBaseCombatStrength() + 2)
		end
		
		-- Damages nearby units and generates Culture for each of them
		if pPlayer == pPlotOwner then
			-- print("Cebu_DoButtonEffect: Cebu pillaged own tile, beginning effect")
			for adjacentPlot in PlotAreaSweepIterator(pPlot, 2, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
				-- print("Cebu_DoButtonEffect: Checking tile")
				local foundUnit = adjacentPlot:GetUnit()
				if foundUnit and not foundUnit:IsTrade() and foundUnit:GetOwner() ~= pPlayer:GetID() then
					
					-- print("Cebu_DoButtonEffect: Found unit adjacent to pillager")
					
					local playerTeam = Teams[pPlayer:GetTeam()]
					local foundUnitOwner = Players[foundUnit:GetOwner()]
					
					if playerTeam:IsAtWar(foundUnitOwner:GetTeam()) then
						-- print("Cebu_DoButtonEffect: Cebu at war with unit owner, damaging...")
						
						foundUnit:SetDamage((100 - foundUnit:GetCurrHitPoints()) + (25 * improvementWaterMod))
						-- print("Cebu_DoButtonEffect: Culture before is " .. pPlayer:GetJONSCulture())
						if foundUnit:GetBaseCombatStrength() > 0 then
							if foundUnit:GetBaseRangedCombatStrength() > foundUnit:GetBaseCombatStrength() then
								-- print("Cebu_DoButtonEffect: Providing Culture based on ranged combat strength")
								pPlayer:ChangeJONSCulture(math.ceil((foundUnit:GetBaseRangedCombatStrength()/3) * improvementWaterMod))
							else
								-- print("Cebu_DoButtonEffect: Providing culture based on melee combat strength")
								pPlayer:ChangeJONSCulture(math.ceil((foundUnit:GetBaseCombatStrength()/3) * improvementWaterMod))
							end
						else
							-- print("Cebu_DoButtonEffect: Unit is civilian, providing set Culture")
							pPlayer:ChangeJONSCulture(5 * improvementWaterMod) -- TODO: Change value to something nicer
						end
						-- print("Cebu_DoButtonEffect: Culture after is " .. pPlayer:GetJONSCulture())
						
					end
				end
			end
		end
	end
	
end

function CebuUnit_UnitActionButton()
	local pUnit = UI.GetHeadSelectedUnit();
	Cebu_DoButtonEffect(pActivePlayer, pUnit)
end

function CebuUnit_SerialEventUnitInfoDirty()
	local pUnit = UI.GetHeadSelectedUnit();
	if (not pUnit) then return end
	if Cebu_IsButtonPossible(pUnit) then
		Controls.UnitActionButton:SetHide(false)
	else
		Controls.UnitActionButton:SetHide(true)
	end
	
	local buildCityButtonActive = pUnit:IsFound();
				
	local primaryStack = ContextPtr:LookUpControl("/InGame/WorldView/UnitPanel/PrimaryStack")
	local primaryStretchy = ContextPtr:LookUpControl("/InGame/WorldView/UnitPanel/PrimaryStretchy")
	primaryStack:CalculateSize();
	primaryStack:ReprocessAnchoring();

	local stackSize = primaryStack:GetSize();
	local stretchySize = primaryStretchy:GetSize();
	local buildCityButtonSize = 0
	if buildCityButtonActive then
		if OptionsManager.GetSmallUIAssets() and not UI.IsTouchScreenEnabled() then
			buildCityButtonSize = 36;
		else
			buildCityButtonSize = 60;
		end
	end
	primaryStretchy:SetSizeVal( stretchySize.x, stackSize.y + buildCityButtonSize + 348 );
end

local function CebuUnit_UpdateUnitInfoPanel()
	if (not OptionsManager.GetSmallUIAssets()) then
		Controls.UnitActionButton:SetSizeVal(50,50)
		Controls.UnitActionIcon:SetSizeVal(64,64)
		Controls.UnitActionIcon:SetTexture("UnitActions360.dds")
	else
		Controls.UnitActionButton:SetSizeVal(36,36)
		Controls.UnitActionIcon:SetSizeVal(45,45)
		Controls.UnitActionIcon:SetTexture("UnitActions360.dds")
	end
	Controls.UnitActionIcon:LocalizeAndSetToolTip("TXT_KEY_NC_CEBU_PILLAGE_TOOLTIP")
	Controls.UnitActionButton:ChangeParent(ContextPtr:LookUpControl("/InGame/WorldView/UnitPanel/PrimaryStack"))
end

function CheckIfCanPillage(playerID, unitID, missionID)
	-- thanks to chrisy for reminding me that CanStartMission exists
	if missionID == iPillageMission then
		local pPlayer = Players[playerID]
		local pUnit = pPlayer:GetUnitByID(unitID)
		if pPlayer:GetCivilizationType() == civilizationID then
			-- print("CheckIfCanPillage: Preventing Cebu unit from using normal pillage option")
			return false
		elseif pUnit:IsHasPromotion(promotionMangubatID) then
			-- print("CheckIfCanPillage: Preventing Cebu UU from using normal pillage option")
			return false
		end
	end
	return true
end

function Cebu_AI_DoTurn(playerID)
	local pPlayer = Players[playerID]
	if (pPlayer:GetCivilizationType() == civilizationID) then
		-- print("Cebu_AI_DoTurn: Civilization is Cebu")
		if (not pPlayer:IsHuman()) then
			-- print("Cebu_AI_DoTurn: Cebu is AI player")
			for pUnit in pPlayer:Units() do
				if Cebu_IsButtonPossible(pUnit) then
					-- print("Cebu_AI_DoTurn: Unit has button possible")
					if pUnit:GetPlot():IsOwned() then
						local pPlotOwner = Players[pUnit:GetPlot():GetOwner()]
						local pUnitTeam = Teams[pPlayer:GetTeam()]
						if pPlotOwner ~= pPlayer then
							-- print("Cebu_AI_DoTurn: Unit tile is owned by another player")
							local iOtherTeam = pPlotOwner:GetTeam()
							if pUnitTeam:IsAtWar(iOtherTeam) then
								-- print("Cebu_AI_DoTurn: Cebu at war with tile owner, randomizing action")
								local iRand = JFD_GetRandom(1, 2)
								if iRand == 2 or pUnit:IsHasPromotion(promotionMangubatID) then	
									-- print("Cebu_AI_DoTurn: Decided to pillage")
									Cebu_DoButtonEffect(pPlayer, pUnit)
								end
							end
						else
							-- If we're pillaging our own tile, we want to make sure it's worth it
							-- print("Cebu_AI_DoTurn: Unit tile is owned by Cebu")
							local enemyUnitCount = 0
							local plot = pUnit:GetPlot()
							for adjacentPlot in PlotAreaSweepIterator(plot, 2, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
								local foundUnit = adjacentPlot:GetUnit()
								
								if foundUnit and foundUnit:GetOwner() ~= playerID then
									-- print("Cebu_AI_DoTurn: Found unit")
									local iOtherPlayer = Players[foundUnit:GetOwner()]
									local iOtherTeam = iOtherPlayer:GetTeam()
									if pUnitTeam:IsAtWar(iOtherTeam) then
										-- print("Cebu_AI_DoTurn: Found enemy unit, incrementing count")
										enemyUnitCount = enemyUnitCount + 1
									end
								end
							end
							-- print("Cebu_AI_DoTurn: Found " .. enemyUnitCount .. " enemy units")
							
							if enemyUnitCount >= 3 then
								-- print("Cebu_AI_DoTurn: Found at least 3 enemy units, randomly deciding to pillage")
								local iRand = JFD_GetRandom(1, 2)
								if iRand == 2 then	
									Cebu_DoButtonEffect(pPlayer, pUnit)
								end
							end
						end
					else
						Cebu_DoButtonEffect(pPlayer, pUnit)
					end
				end
			end
		end
	end
	
	-- Trying to handle the "other player has Cebu UU" case
	if pPlayer:HasUnitOfClassType(iPillagerClass) then
		-- print("Cebu_AI_DoTurn: Checking other civ units for Cebu UU")
		if (not pPlayer:IsHuman()) then
			-- print("Cebu_AI_DoTurn: Cebu is AI player")
			for pUnit in pPlayer:Units() do
				if Cebu_IsButtonPossible(pUnit) then
					-- print("Cebu_AI_DoTurn: Unit has button possible")
					if pUnit:GetPlot():IsOwned() then
						local pPlotOwner = Players[pUnit:GetPlot():GetOwner()]
						if pPlotOwner ~= pPlayer then
							-- print("Cebu_AI_DoTurn: Unit tile is owned by another player")
							local pUnitTeam = Teams[pPlayer:GetTeam()]
							local iOtherTeam = pPlotOwner:GetTeam()
							if pUnitTeam:IsAtWar(iOtherTeam) then
								-- print("Cebu_AI_DoTurn: Cebu at war with tile owner, decided to pillage")
								Cebu_DoButtonEffect(pPlayer, pUnit)
							end
						end
					else
						Cebu_DoButtonEffect(pPlayer, pUnit)
					end
				end
			end
		end
	end
end

local function Initialize()	
	Events.LoadScreenClose.Add(CebuUnit_UpdateUnitInfoPanel);
	Events.SerialEventUnitInfoDirty.Add(CebuUnit_SerialEventUnitInfoDirty);
end

Controls.UnitActionButton:RegisterCallback(Mouse.eLClick, CebuUnit_UnitActionButton);
IconHookup(37, 45, "UNIT_ACTION_ATLAS", Controls.UnitActionIcon)
GameEvents.CanStartMission.Add(CheckIfCanPillage)
GameEvents.PlayerDoTurn.Add(Cebu_AI_DoTurn)
Initialize();


-- Combat Strength from Plundering

local tClasses = {}
tClasses[GameInfoTypes.UNITCLASS_CARGO_SHIP] = GameInfoTypes.UNITCLASS_CARGO_SHIP
tClasses[GameInfoTypes.UNITCLASS_CARAVAN] = GameInfoTypes.UNITCLASS_CARAVAN

function Cebu_DetectPlunder(iPlayer, iUnit)
    local pPlayer = Players[iPlayer]
    local pUnit = pPlayer:GetUnitByID(iUnit)
    local iUnitClass = pUnit:GetUnitClassType()
    
    if tClasses[iUnitClass] ~= nil then
		-- print("Cebu_DetectPlunder: Player has at least one copy of UU")
        local pTeam = Teams[pPlayer:GetTeam()]
        local pPlot = pUnit:GetPlot()
        local iNumUnits = pPlot:GetNumUnits()
        for iVal = 0,(iNumUnits - 1) do
            local pLUnit = pPlot:GetUnit(iVal)
			if pLUnit:IsHasPromotion(promotionMangubatID) then
				-- print("Cebu_DetectPlunder: Unit is Cebu UU")
				if pLUnit:GetCombatLimit() > 0 and pTeam:IsAtWar(pLUnit:GetTeam()) then
					-- print("Cebu_DetectPlunder: Unit is plundering I think")
					-- Being plundered, run function
					if not pLUnit:GetUnitType() == unitMangubatID then return end
					-- print("Cebu_DetectPlunder: Giving UU extra Combat Strength for plundering")
					pLUnit:SetBaseCombatStrength(pLUnit:GetBaseCombatStrength() + 2)
					break
				end
			end
        end
    end
    
    return false
end
GameEvents.CanSaveUnit.Add(Cebu_DetectPlunder)

------------------------------------------------------------------------------------------------------------------------
-- UU: Resetting Combat Strength bonus
------------------------------------------------------------------------------------------------------------------------

function NC_Cebu_UU_PlayerDoTurn(playerID)
	local pPlayer = Players[playerID]
	if pPlayer == nil then return end
	if not pPlayer:IsAlive() then return end
	if pPlayer:GetCivilizationType() ~= civilizationID then return end	
	
	-- Adding Combat Strength based on number of Puppeted cities
	for unit in pPlayer:Units() do
		if unit:GetUnitType() == unitMangubatID then -- Could use promotion instead
			-- print("NC_Cebu_UU_PlayerDoTurn: Resetting UU combat strength")
			unit:SetBaseCombatStrength(GameInfo.Units[unitMangubatID].Combat) -- I think resetting is necessary???? Not sure though
		end
	end
end

GameEvents.PlayerDoTurn.Add(NC_Cebu_UU_PlayerDoTurn)

----------------------------------------------------------------------------------------------------------------------------
-- UI: +1 Gold for every incoming international trade route
----------------------------------------------------------------------------------------------------------------------------
-- Repurposed from Rosas Argentina

-- TopHat is the only reason I'm able to do this, thank you lad, stolen from Louis XI - left TopHat's comments mostly intact
-- Combined with code from Rozvi and I think also DMS Indira Gandhi

-- This is ugly as hell, but I've done my best to provide clarifying comments

-- Had to mess around with IDs a lot, no clue if this works

function NC_Cebu_UI_PlayerDoTurn(playerID)
	local pPlayer = Players[playerID]
	if pPlayer == nil then return end
	if not pPlayer:IsAlive() then return end
	if pPlayer:GetCivilizationType() ~= civilizationID then return end	

	-- STEP 0: Reset Gold dummy buildings

	for cCity in pPlayer:Cities() do
		-- print("NC_Cebu_UI_PlayerDoTurn: Resetting Cebu trade dummies")
		cCity:SetNumRealBuilding(buildingDummyCebuTradeGold, 0)
	end
	
	for k,v in pairs(OtherPlayersWithBarangays) do
		-- print("NC_Cebu_UI_PlayerDoTurn: Resetting other civ trade dummies")
		local kPlayer = Players[k]
		for vk,vv in pairs(v) do
			local city = kPlayer:GetCityByID(vk)
			if city then
				city:SetNumRealBuilding(buildingDummyCebuTradeGold, 0)
			end
		end
	end
	
	-- STEP 1: Check all the Barangays, see if there are any new cities or if any Barangays are pillaged/no longer belong to cities, have been resettled, or belong to a city/civ that didn't have one before
	for k,v in pairs(BarangayPlots) do
		local pPlot = Map.GetPlotByIndex(k)
		local pCity = pPlot:GetWorkingCity()
		if pCity then
		
			-- Pillaged tiles need not be tallied
			if pPlot:IsImprovementPillaged() == true then
				-- print("NC_Cebu_UI_PlayerDoTurn: Removing pillaged improvements from count (this can never happen, it's destroyed on pillage)")
				BarangayPlots[k] = false
			else
				local pOtherPlayer = Players[pCity:GetOwner()]
				-- If there's a city (belonging to a civ (that's not Cebu) with a Barangay that doesn't currently have a Barangay, add it to the list
				if pOtherPlayer:GetCivilizationType() ~= civilizationID then
					-- If the city belongs to a civ that didn't have a Barangay before, add them to the list
					if not OtherPlayersWithBarangays[pOtherPlayer:GetID()] then
						-- print("NC_Cebu_UI_PlayerDoTurn: New civ obtained Barangay, adding to list")
						OtherPlayersWithBarangays[pOtherPlayer:GetID()] = {}
					end
					if not OtherPlayersWithBarangays[pOtherPlayer:GetID()][pCity:GetID()] then
						-- print("NC_Cebu_UI_PlayerDoTurn: City with Barangay not being counted yet, adding to list")
						OtherPlayersWithBarangays[pOtherPlayer:GetID()][pCity:GetID()] = true
						
					end
				end
				
				-- If the plot wasn't being tallied before but belongs to a city and isn't pillaged now, we need to tally it
				if BarangayPlots[k] == false then
					-- print("NC_Cebu_UI_PlayerDoTurn: Previously pillaged Barangay has been repaired (this can never happen, it's destroyed on pillage)")
					BarangayPlots[k] = true
				end
			end
			
		-- Barangays not in cities need not be tallied
		else
			-- print("NC_Cebu_UI_PlayerDoTurn: Barangay not in city")
			BarangayPlots[k] = false
		end
	end

	-- STEP 2: Search the trade routes of every civ with a Barangay to count up the number of trade routes per city
	
	local tNumTradeRoutesCebu = {}
	
	local tradeRoutes = pPlayer:GetTradeRoutes()
	local incomingTradeRoutes = pPlayer:GetTradeRoutesToYou()
	
	-- Count up Cebu's trade routes per city
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
				-- print("NC_Cebu_UI_PlayerDoTurn: New outgoing trade route counted for Cebu city")
				if tNumTradeRoutesCebu[fromCityPlotID] then
					tNumTradeRoutesCebu[fromCityPlotID] = (tNumTradeRoutesCebu[fromCityPlotID] + 1)
				else
					tNumTradeRoutesCebu[fromCityPlotID] = 1
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
				-- print("NC_Cebu_UI_PlayerDoTurn: New incoming trade route counted for Cebu city")
				if tNumTradeRoutesCebu[toCityPlotID] then
					tNumTradeRoutesCebu[toCityPlotID] = (tNumTradeRoutesCebu[toCityPlotID] + 1) or 1
				else
					tNumTradeRoutesCebu[toCityPlotID] = 1
				end
			end
			
		end
	end
	
	-- Check for trade routes to other civs' cities with Barangays
	
	for k,v in pairs(OtherPlayersWithBarangays) do
		local kPlayer = Players[k]
		local otherTradeRoutes = kPlayer:GetTradeRoutes()
		local otherIncomingTradeRoutes = kPlayer:GetTradeRoutesToYou()
		
		-- Count up the other civ's trade routes per city, provided the city has a Barangay
		if otherTradeRoutes ~= nil then
			-- print('DMS_Minaeans_PDT: iterate TRs')
			-- print('---')
			
			-- Loops over trade routes
			for tri, tRoute in pairs(otherTradeRoutes) do
				-- Grabs the cities as variables
				local fromCity = tRoute.FromCity
				local fromCityPlotID = fromCity:Plot():GetPlotIndex()
				local fromPlayer = Players[tRoute.FromID]
				local toCity = tRoute.ToCity
				local toCityPlotID = toCity:Plot():GetPlotIndex()
				
				if (toPlayer ~= kPlayer) and (OtherPlayersWithBarangays[fromPlayer:GetID()][fromCity:GetID()] ~= nil) then
					-- print("NC_Cebu_UI_PlayerDoTurn: New outgoing trade route counted for other civ city")
					if tNumTradeRoutesCebu[fromCityPlotID] then
						tNumTradeRoutesCebu[fromCityPlotID] = (tNumTradeRoutesCebu[fromCityPlotID] + 1)
					else
						tNumTradeRoutesCebu[fromCityPlotID] = 1
					end
				end
				
			end
		
		end
		
		if (otherIncomingTradeRoutes ~= nil) then
			for tri, tRoute in pairs(otherIncomingTradeRoutes) do
				-- Grabs the cities as variables
				local fromCity = tRoute.FromCity
				local fromCityPlotID = fromCity:Plot():GetPlotIndex()
				local fromPlayer = Players[tRoute.FromID]
				local toCity = tRoute.ToCity
				local toCityPlotID = toCity:Plot():GetPlotIndex()
				local toPlayer = Players[tRoute.ToID]
				
				if (fromPlayer ~= kPlayer) and (OtherPlayersWithBarangays[toPlayer:GetID()][toCity:GetID()] ~= nil) then
					-- print("NC_Cebu_UI_PlayerDoTurn: New incoming trade route counted for other civ city")
					if tNumTradeRoutesCebu[toCityPlotID] then
						tNumTradeRoutesCebu[toCityPlotID] = (tNumTradeRoutesCebu[toCityPlotID] + 1) or 1
					else
						tNumTradeRoutesCebu[toCityPlotID] = 1
					end
				end
				
			end
		end
	end


	-- STEP 3: For all valid Barangays, check the city they belong to and their trade route count, then give that many Gold dummies to the city
	
	for k,v in pairs(BarangayPlots) do
		if (v == true) then
			local pPlot = Map.GetPlotByIndex(k)
			local pCity = pPlot:GetWorkingCity()
			if pCity then
				
				local tradeRouteCount = tNumTradeRoutesCebu[pCity:Plot():GetPlotIndex()]
				if tradeRouteCount and (tradeRouteCount > 0) then
					-- print("NC_Cebu_UI_PlayerDoTurn: Adding Gold dummies to city based on Barangays and trade routes!")
					-- print("NC_Cebu_UI_PlayerDoTurn: Should yield " .. tradeRouteCount .. " Gold for tile!")
					pCity:SetNumRealBuilding(buildingDummyCebuTradeGold, (pCity:GetNumRealBuilding(buildingDummyCebuTradeGold) + tradeRouteCount))
					
					local iOwner = pCity:GetOwner()
					local pOwner = Players[iOwner]
					
					if pOwner:IsHuman() then -- TODO: This might not work, test this
						local iX = pPlot:GetX()
						local iY = pPlot:GetY()
						local sMessage = "[COLOR_YIELD_GOLD]+" .. tradeRouteCount .. " [ICON_GOLD][ENDCOLOR]"
						Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(iX, iY))), sMessage, 0)
					end
				end
			end
		end
	end
end



-- STEP 4: When an improvement is finished, if it's a Barangay then add it to the Barangays table, if it's a repaired Barangay then set its value in the table to true, and if it was a Barangay but isn't anymore then remove it
function NC_Cebu_OnBuildFinished(playerID, plotX, plotY, improvementID)
	local pPlayer = Players[playerID]
	local plot = Map.GetPlot(plotX, plotY)
	-- PEARL OF THE DESERT
	if HasTrait(pPlayer, traitCebuID) and ((improvementID == improvementBarangayID)) then
		BarangayPlots[plot:GetPlotIndex()] = true
		-- BarangayCities[plot:GetWorkingCity()] = true
		-- print("NC_Cebu_OnBuildFinished: New Barangay built, adding to table")
	end -- TODO: Shouldn't need to add anything on removal of a Barangay
end

if isCivActive then
	GameEvents.PlayerDoTurn.Add(NC_Cebu_UI_PlayerDoTurn)
	GameEvents.BuildFinished.Add(NC_Cebu_OnBuildFinished)
end

print("Cebu_Functions.lua loaded!")
--=======================================================================================================================
--=======================================================================================================================
