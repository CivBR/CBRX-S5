-- JFD_Civs_EcuadorMoreno_Functions
-- Author: JFD
-- DateCreated: 2/15/2014 6:33:36 PM
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

function Neirai_GetNearestCity(pPlayer, pPlot)
    local distance = 9999
    local cNearestCity = nil
    for pCity in pPlayer:Cities() do
        local pCityPlot = pCity:Plot()
        local between = Map.PlotDistance(pCityPlot:GetX(), pCityPlot:GetY(), pPlot:GetX(), pPlot:GetY())
        if between < distance then
            distance = between
            cNearestCity = pCity
        end
    end
    return cNearestCity
end

function JFD_GetRandom(lower, upper)
    return Game.Rand((upper + 1) - lower, "") + lower
end

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
local civilizationID = GameInfoTypes["CIVILIZATION_NC_PONCA"]
local isCivActive = JFD_IsCivilisationActive(civilizationID) -- Just in case
local traitPoncaID = GameInfoTypes["TRAIT_NC_PONCA"]
local g_IsTraitActive = IsTraitActive(traitPoncaID) 

local buildingPoncaPeaceDummyID = GameInfoTypes["BUILDING_DUMMY_NC_PONCA_PEACE"]
local buildingMaithiID = GameInfoTypes["BUILDING_NC_MAITHI"]
local buildingWallsID = GameInfoTypes["BUILDING_WALLS"]

local promotionWashabe1ID = GameInfoTypes["PROMOTION_NC_WASHABE_1"]
local promotionWashabe1FakeID = GameInfoTypes["PROMOTION_NC_WASHABE_1_FAKE"]
local promotionWashabe2ID = GameInfoTypes["PROMOTION_NC_WASHABE_2"]
local promotionWashabe2FakeID = GameInfoTypes["PROMOTION_NC_WASHABE_2_FAKE"]
local promotionWashabe3ID = GameInfoTypes["PROMOTION_NC_WASHABE_3"]
local promotionWashabe3FakeID = GameInfoTypes["PROMOTION_NC_WASHABE_3_FAKE"]
local promotionWashabeBonusID = GameInfoTypes["PROMOTION_NC_WASHABE_BONUS"]

local unitWashabeID = GameInfoTypes["UNIT_NC_WASHABE"]
local unitSettlerID = GameInfoTypes["UNIT_SETTLER"]
local unitSettlerClassID = GameInfoTypes["UNITCLASS_SETTLER"]

local yieldProductionID = GameInfoTypes["YIELD_PRODUCTION"]

local improvementFarmID = GameInfoTypes["IMPROVEMENT_FARM"]

local iPracticalNumCivs = (GameDefines.MAX_MAJOR_CIVS - 1)
------------------------------------------------------------------------------------------------------------------------
-- FUNCTIONS
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
-- UA: During a peace treaty, you may settle one city within the other civilization's territory
------------------------------------------------------------------------------------------------------------------------

-- Determining which players Ponca is at peace with
-- This doesn't work if multiple players are playing as Ponca, but tough
function NC_Ponca_MakePeace(teamID, otherTeamID)
	local playerTeam = Teams[teamID]
	local playerID = playerTeam:GetLeaderID()
	local pPlayer = Players[playerID]
	
	local otherTeam = Teams[otherTeamID]
	local otherPlayerID = otherTeam:GetLeaderID()
	local otherPlayer = Players[otherPlayerID]
	
	if otherPlayer:IsMinorCiv() then return end
	if pPlayer:IsMinorCiv() then return end
	
	if pPlayer and pPlayer:GetCivilizationType() == civilizationID then
		if pPlayer:IsAlive() and otherPlayer:IsAlive() then
			local iCapital = otherPlayer:GetCapitalCity()
			if iCapital then
				-- print("NC_Ponca_MakePeace: Adding peace dummies to other civ's capital")
				iCapital:SetNumRealBuilding(buildingPoncaPeaceDummyID, 10)
			end
		end
	elseif otherPlayer and otherPlayer:GetCivilizationType() == civilizationID then
		if pPlayer:IsAlive() and otherPlayer:IsAlive()then
			local iCapital = pPlayer:GetCapitalCity()
			if iCapital then
				-- print("NC_Ponca_MakePeace: Adding peace dummies to other civ's capital")
				iCapital:SetNumRealBuilding(buildingPoncaPeaceDummyID, 10)
			end
		end
	end
end

local function NC_Ponca_UA1_PlayerDoTurn(playerID)
	local pPlayer = Players[playerID]
	if (not pPlayer:IsAlive()) then return end
	if pPlayer:IsBarbarian() then return end
	if pPlayer:IsMinorCiv() then return end
	
	if pPlayer and pPlayer:GetCivilizationType() == civilizationID then
		for i = 0, iPracticalNumCivs, 1 do
		
			local pOtherPlayer = Players[i]
			if pOtherPlayer then
		
				local iCapital = pOtherPlayer:GetCapitalCity()
				
				-- UA/UB: Looping to add production and happiness dummy
				if iCapital and iCapital:IsHasBuilding(buildingPoncaPeaceDummyID) then
				
					-- Counting down
					local numPeaceDummy = iCapital:GetNumRealBuilding(buildingPoncaPeaceDummyID)
					-- print("NC_Ponca_UA1_PlayerDoTurn: Counting down peace dummies in capital, was " .. numPeaceDummy)
					iCapital:SetNumRealBuilding(buildingPoncaPeaceDummyID, (numPeaceDummy - 1))
					
				end
			end
		end
	end
end
	
if isCivActive then
	GameEvents.MakePeace.Add(NC_Ponca_MakePeace)
	GameEvents.PlayerDoTurn.Add(NC_Ponca_UA1_PlayerDoTurn)
end

-- The button code (oh no)

-----------------------------------------------------------------------------
-- Ponca can settle a free city in someone else's lands (Button Code)
-----------------------------------------------------------------------------
function NC_Ponca_IsFreeCityPossible(unit)
	local pBool = false;
	local pPlayer = Players[unit:GetOwner()]
	local pCap = pPlayer:GetCapitalCity()
	if pPlayer:GetCivilizationType() == civilizationID then
		if unit:GetUnitType() == unitSettlerID then
			-- print("NC_Ponca_IsFreeCityPossible: Ponca has a Settler")
			local pPlot = unit:GetPlot();
			if unit:MovesLeft() <= 1 then return pBool end
			if pPlot then
				if (pPlot:IsOwned()) and (pPlot:GetOwner() ~= unit:GetOwner()) then	
					-- print("NC_Ponca_IsFreeCityPossible: Ponca Settler on someone else's land")
					if not pPlot:IsCity() then
						local pPlotOwner = Players[pPlot:GetOwner()]
						local otherCapital = pPlotOwner:GetCapitalCity()
						
						if otherCapital:IsHasBuilding(buildingPoncaPeaceDummyID) then
							-- print("NC_Ponca_IsFreeCityPossible: Other civ is in a peace deal with Ponca")
							if pPlot:GetTerrainType() == GameInfoTypes.TERRAIN_COAST or pPlot:GetTerrainType() == GameInfoTypes.TERRAIN_OCEAN then return pBool end
							if not (pPlot:GetFeatureType() == GameInfoTypes.FEATURE_JUNGLE or pPlot:GetFeatureType() == GameInfoTypes.FEATURE_MARSH or pPlot:GetFeatureType() == GameInfoTypes.FEATURE_FLOOD_PLAINS or pPlot:GetFeatureType() == GameInfoTypes.FEATURE_FOREST or pPlot:GetFeatureType() == -1) then return pBool end
							-- if not Players[unit:GetOwner()]:CanFound(pPlot:GetX(), pPlot:GetY()) then return pBool end
							-- print("NC_Ponca_IsFreeCityPossible: Ponca can found a city here!")
							pBool = true;
						end
					end
				end
			end
		end
	end
	return pBool
end

function NC_Ponca_MakeCity(iPlayer, pUnit)
	local pPlayer = Players[iPlayer]
	local pUnitPlot = pUnit:GetPlot();
	--local pCity = Neirai_GetNearestCity(pPlayer, pUnitPlot)
	local otherPlayerID = pUnitPlot:GetOwner()
	local otherPlayer = Players[otherPlayerID]
	local otherCapital = otherPlayer:GetCapitalCity()
	otherCapital:SetNumRealBuilding(buildingPoncaPeaceDummyID, 0)
	-- print("NC_Ponca_MakeCity: Claiming new city tile...")
	pUnitPlot:SetOwner(iPlayer)
	-- print("NC_Ponca_MakeCity: Founding city...")
	pPlayer:InitCity(pUnit:GetX(), pUnit:GetY())
	local newCity = pUnitPlot:GetPlotCity()
	-- local newCity = Neirai_GetNearestCity(pPlayer, pUnit:GetX(), pUnit:GetY()):GetID() -- TODO: Does this work
	pUnitPlot:SetOwner(iPlayer, newCity)
	-- print("NC_Ponca_MakeCity: Claiming adjacent valid tiles for Ponca...")
	for pAdjacentPlot in PlotAreaSweepIterator(pUnitPlot, 1, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
		-- print("NC_Ponca_MakeCity: Checking adjacent tile")
		-- local pAdjacentPlot = Map.PlotDirection(pUnit:GetX(), pUnit:GetY(), direction)
		if pAdjacentPlot and (not pAdjacentPlot:IsCity()) then
			local pAdjPlotOwner = pAdjacentPlot:GetOwner()
			if (pAdjPlotOwner == otherPlayerID) or (pAdjPlotOwner == iPlayer) or (pAdjPlotOwner == -1) then
				-- print("NC_Ponca_MakeCity: Claiming tile for city!")
				local pTeam = Teams[pPlayer:GetTeam()]
				pAdjacentPlot:SetOwner(iPlayer, newCity:GetID(), true, true)
				pAdjacentPlot:SetRevealed(pTeam, true)
			end
		end
	end
	pUnit:Kill()

end

function MakeCity_UnitActionButton()
	local pUnit = UI.GetHeadSelectedUnit();
	local iPlayer = Game.GetActivePlayer()
	NC_Ponca_MakeCity(iPlayer, pUnit)
end

function NC_Ponca_SerialEventUnitInfoDirty()
	local pUnit = UI.GetHeadSelectedUnit();
	if (not pUnit) then return end
	if NC_Ponca_IsFreeCityPossible(pUnit) then
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

local function NC_Ponca_MakeCity_UpdateUnitInfoPanel()
	if (not OptionsManager.GetSmallUIAssets()) then
		Controls.UnitActionButton:SetSizeVal(50,50)
		Controls.UnitActionIcon:SetSizeVal(64,64)
		Controls.UnitActionIcon:SetTexture("BedouinsCampFlag45.dds")
	else
		Controls.UnitActionButton:SetSizeVal(36,36)
		Controls.UnitActionIcon:SetSizeVal(45,45)
		Controls.UnitActionIcon:SetTexture("BedouinsCampFlag45.dds")
	end
	Controls.UnitActionIcon:LocalizeAndSetToolTip("TXT_KEY_NC_PONCA_SETTLE_IN_CITY_HELP")
	Controls.UnitActionButton:ChangeParent(ContextPtr:LookUpControl("/InGame/WorldView/UnitPanel/PrimaryStack"))
end

local function Ponca_MakeCity_Initialize()	
	Events.LoadScreenClose.Add(NC_Ponca_MakeCity_UpdateUnitInfoPanel);
	Events.SerialEventUnitInfoDirty.Add(NC_Ponca_SerialEventUnitInfoDirty);
end

-----------------------------------------------------------------------------
-- Ponca Settlers can build cities in other people's lands during peace (AI)
-----------------------------------------------------------------------------
function NC_Ponca_AIDoTurn(playerID)
	local pPlayer = Players[playerID]
	local pCap = pPlayer:GetCapitalCity()
	local pPlayerTeam = Teams[pPlayer:GetTeam()]
	
	if not pPlayer:IsHuman() then
		if pPlayer:GetCivilizationType() == civilizationID then
			if pPlayer:HasUnitOfClassType(unitSettlerClassID) then
				-- print("NC_Ponca_AIDoTurn: Ponca has Settler")
			
				for pUnit in pPlayer:Units() do
					if NC_Ponca_IsFreeCityPossible(pUnit) then
						-- print("NC_Ponca_AIDoTurn: Ponca unit can create a city")
						local pPlot = pUnit:GetPlot()
						local otherPlayer = Players[pPlot:GetOwner()]
						local otherCapital = otherPlayer:GetCapitalCity()
						--local pCity = Neirai_GetNearestCity(pPlayer, pPlot)
						--local iDistance = Map.PlotDistance(pUnit:GetX(), pUnit:GetY(), pCity:GetX(), pCity:GetY())
						--if iDistance < 20 then
						-- if not pPlot:IsOwned() then
						if JFD_GetRandom(1, 100) >= 75 then
							-- print("NC_Ponca_AIDoTurn: Randomly decided to place a city here")
							local iUnitOwner = pUnit:GetOwner()
							otherCapital:SetNumRealBuilding(buildingPoncaPeaceDummyID, 0)
							pPlot:SetOwner(iUnitOwner)
							pPlayer:InitCity(pUnit:GetX(), pUnit:GetY())
							local newCity = pPlot:GetPlotCity()
							-- local newCity = Neirai_GetNearestCity(pPlayer, pUnit:GetX(), pUnit:GetY()):GetID() -- TODO: Does this work
							pPlot:SetOwner(iUnitOwner, newCity:GetID())
							
							-- print("NC_Ponca_AIDoTurn: Claiming adjacent valid tiles")
							for pAdjacentPlot in PlotAreaSweepIterator(pPlot, 1, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
								-- print("NC_Ponca_AIDoTurn: Checking adjacent plot")
								-- local pAdjacentPlot = Map.PlotDirection(pUnit:GetX(), pUnit:GetY(), direction)
								if pAdjacentPlot and (not pAdjacentPlot:IsCity()) then
									local pAdjPlotOwner = pAdjacentPlot:GetOwner()
									if (pAdjPlotOwner == otherPlayer:GetID()) or (pAdjPlotOwner == pPlayer:GetID()) or (pAdjPlotOwner == -1) then
										-- print("NC_Ponca_MakeCity: Claiming tile for city!")
										local pTeam = Teams[pPlayer:GetTeam()]
										pAdjacentPlot:SetOwner(iUnitOwner, newCity:GetID(), true, true)
										pAdjacentPlot:SetRevealed(pTeam, true)
									end
								end
							end
							pUnit:Kill()
							-- print("NC_Ponca_AIDoTurn: Placed new city!")
							
						end
						-- end
						--end
					end
				end
			end
			
		end
	end
	
end

-----------------------------------------------------------------------------
if isCivActive then	
	Controls.UnitActionButton:RegisterCallback(Mouse.eLClick, MakeCity_UnitActionButton);
	IconHookup(0, 45, "NC_PONCA_CAMP_FLAG", Controls.UnitActionIcon)
	Ponca_MakeCity_Initialize();

	GameEvents.PlayerDoTurn.Add(NC_Ponca_AIDoTurn)
end

------------------------------------------------------------------------------------------------------------------------
-- UA: When a city grows, every worked Farm contributes a small amount of Science
------------------------------------------------------------------------------------------------------------------------
-- Based off of Erik's Swedes and Carlos I's Portugal
local function NC_Ponca_SetPopulation(plotX, plotY, oldPopulation, newPopulation)
	if newPopulation < oldPopulation then return end
	local pCity = g_MapGetPlot(plotX, plotY):GetPlotCity()
	if (not pCity) then return end
	local playerID = pCity:GetOwner()
	local pPlayer = Players[playerID]
	if (not pPlayer:IsAlive()) then return end
	if pPlayer:IsMinorCiv() then return end
	
	if HasTrait(pPlayer, traitPoncaID) then
		-- print("NC_Ponca_SetPopulation: Player is Ponca")
		local numFarms = 0
		for i = 0, pCity:GetNumCityPlots(), 1 do
			local pPlot = pCity:GetCityIndexPlot(i)
			if pPlot and pPlot:GetOwner() == pPlayer:GetID() then
				if pPlot:GetWorkingCity() == pCity then
					-- print("NC_Ponca_SetPopulation: Checking Ponca plot for farms")
					if (pPlot:GetImprovementType() == improvementFarmID) then
						-- print("NC_Ponca_SetPopulation: Found Ponca farm")
						if pPlot:IsBeingWorked() then
							-- print("NC_Ponca_SetPopulation: Farm being worked")
							numFarms = numFarms + 1
						end
					end
				end
			end
		end
		
		local team = Teams[pPlayer:GetTeam()]
		local teamTechs = team:GetTeamTechs()
		
		local currentTechID = pPlayer:GetCurrentResearch()
		if currentTechID > 0 then
			teamTechs:ChangeResearchProgress(currentTechID, numFarms, playerID)
			-- print("NC_Ponca_SetPopulation: Adding progress to tech research, +" .. numFarms)
			if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
				local hex = ToHexFromGrid(Vector2(plotX, plotY))
				Events.AddPopupTextEvent(HexToWorld(hex), g_ConvertTextKey("[COLOR_CYAN]+{1_Num}[ENDCOLOR] [ICON_RESEARCH]", numFarms), true)
			end
		end
		
	end
end

if isCivActive then
	GameEvents.SetPopulation.Add(NC_Ponca_SetPopulation)
end

------------------------------------------------------------------------------------------------------------------------
-- UU: Updating unit promotion chain since it doesn't work properly otherwise
------------------------------------------------------------------------------------------------------------------------
-- This is necessary because, if multiple PostCombatPromotion promotions reference each other, they'll all activate at once after the first combat, instantly giving the civ the promotion at the end of the chain
-- So, instead, we just break the chain up into multiple one-promotion chains and just manually update from the "fake" promotion to the "real" promotion at the start of the next turn

function NC_Ponca_UU_PlayerDoTurn(playerID)
	-- Defines
	local pPlayer = Players[playerID]
	if pPlayer == nil then return end
	if not pPlayer:IsAlive() then return end
	if pPlayer:GetCivilizationType() ~= civilizationID then return end
	local tradeRoutes = pPlayer:GetTradeRoutes()
	local iEra = pPlayer:GetCurrentEra()
	
	local faithVal = 30 -- For easier balancing
	
	
	-- Check whether player has trade routes
	for unit in pPlayer:Units() do
		-- print("NC_Ponca_UU_PlayerDoTurn: Iterating over Ponca units")
		
		-- Loops over trade routes
		if unit:IsHasPromotion(promotionWashabe1FakeID) then
			unit:SetHasPromotion(promotionWashabe1ID, true)
			unit:SetHasPromotion(promotionWashabe1FakeID, false)
		elseif unit:IsHasPromotion(promotionWashabe2FakeID) then
			unit:SetHasPromotion(promotionWashabe2ID, true)
			unit:SetHasPromotion(promotionWashabe2FakeID, false)
		elseif unit:IsHasPromotion(promotionWashabe3FakeID) then
			unit:SetHasPromotion(promotionWashabe3ID, true)
			unit:SetHasPromotion(promotionWashabe3FakeID, false)
		end
	end
end

GameEvents.PlayerDoTurn.Add(NC_Ponca_UU_PlayerDoTurn)

------------------------------------------------------------------------------------------------------------------------
-- UB: Built up to twice as fast based on the number of nearby foreign cities
------------------------------------------------------------------------------------------------------------------------
-- Bits and pieces taken from Cebu and Rosas Argentina and Shasta, but the structure is my own - sorry if it's terrible

function NC_Ponca_UB1_PlayerDoTurn(playerID)
	local pPlayer = Players[playerID]
	if pPlayer == nil then return end
	if not pPlayer:IsAlive() then return end
	if pPlayer:GetCivilizationType() ~= civilizationID then return end	
	
	for pCity in pPlayer:Cities() do
		if pCity:GetProductionBuilding() == buildingMaithiID then
			-- print("NC_Ponca_UB1_PlayerDoTurn: Ponca city building UB")
			local pPlot = pCity:GetCityIndexPlot()
			local nearbyCityCount = 0
			for nearbyPlot in PlotAreaSweepIterator(pPlot, 6, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
				local foundCity = nearbyPlot:GetPlotCity()
				if foundCity then
					-- print("NC_Ponca_UB1_PlayerDoTurn: Found a city near the Ponca city")
					if foundCity:GetOwner() ~= pPlayer:GetID() then
						-- print("NC_Ponca_UB1_PlayerDoTurn: Nearby city doesn't belong to Ponca")
						nearbyCityCount = nearbyCityCount + 1
					end
				end
				
			end
			
			-- print("NC_Ponca_UB1_PlayerDoTurn: Nearby city count is " .. nearbyCityCount)
			if nearbyCityCount > 0 then
				if nearbyCityCount > 5 then
					nearbyCityCount = 5
				end
				local numProd = pCity:GetYieldRate(yieldProductionID) * ((nearbyCityCount*10)/100)
				-- print("NC_Ponca_UB1_PlayerDoTurn: Speeding up UB construction by " .. numProd)
				pCity:ChangeBuildingProduction(buildingMaithiID, numProd)
			end
		end
	end

end

if isCivActive then
	GameEvents.PlayerDoTurn.Add(NC_Ponca_UB1_PlayerDoTurn)
end

------------------------------------------------------------------------------------------------------------------------
-- UB: Creates Farms on valid adjacent tiles on completion
------------------------------------------------------------------------------------------------------------------------
-- References Zog's Albania and Khrushchev's Soviets

function NC_Ponca_UB_CityConstructed(playerID, cityID, buildingID, isGold, isFaith)
	local pPlayer = Players[playerID]
	local pCity = pPlayer:GetCityByID(cityID)
	local pPlot = pCity:GetCityIndexPlot()
	if pPlayer == nil then return end
	if not pPlayer:IsAlive() then return end
	if pPlayer:GetCivilizationType() ~= civilizationID then return end
	
	if buildingID == buildingMaithiID then
		-- print("NC_Ponca_UB_CityConstructed: Ponca built UB")
		for adjacentPlot in PlotAreaSweepIterator(pPlot, 1, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
			-- print("NC_Ponca_UB_CityConstructed: Checking adjacent plot")
			if adjacentPlot and adjacentPlot:GetWorkingCity() == pCity then
				if (adjacentPlot:GetImprovementType() == -1 and adjacentPlot:CanHaveImprovement(improvementFarmID)) then
					-- print("NC_Ponca_UB_CityConstructed: Plot should work, checking features")
					if (adjacentPlot:GetFeatureType() == GameInfoTypes.FEATURE_FLOOD_PLAINS) or (adjacentPlot:GetFeatureType() == -1) then
						-- if not (adjacentPlot:GetFeatureType() == GameInfoTypes.FEATURE_JUNGLE or adjacentPlot:GetFeatureType() == GameInfoTypes.FEATURE_MARSH or adjacentPlot:GetFeatureType() == GameInfoTypes.FEATURE_OASIS or adjacentPlot:GetFeatureType() == GameInfoTypes.FEATURE_FOREST) then
						-- print("NC_Ponca_UB_CityConstructed: Plot can have farm, placing...")
						adjacentPlot:SetImprovementType(improvementFarmID)
					end
				end 
			end
			
		end
	end
end

if isCivActive then
	GameEvents.CityConstructed.Add(NC_Ponca_UB_CityConstructed)
end

------------------------------------------------------------------------------------------------------------------------
-- UB: Provides Faith when nearby enemy units die
------------------------------------------------------------------------------------------------------------------------

function NC_Ponca_UB_UnitPrekill(playerID, unitID, unitType, iX, iY, bDelay, killerID)
	-- print("NC_Ponca_UB_UnitPrekill: Running UnitPrekill")
	local pPlayer = Players[playerID]
	local iUnit = pPlayer:GetUnitByID(unitID)
	if bDelay then return end
	local pPlot = Map.GetPlot(iX, iY)
	if pPlot then -- TODO: Probably shouldn't need to be owned pPlot:IsOwned()
	
		-- Check for nearby cities when unit dies
		for nearbyPlot in PlotAreaSweepIterator(pPlot, 2, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
			if nearbyPlot and nearbyPlot:IsCity() then
				-- print("NC_Ponca_UB_UnitPrekill: Found city near dead unit")
				local foundCity = nearbyPlot:GetPlotCity()
				local foundCityOwner = Players[foundCity:GetOwner()]
				
				-- Check to see if the owner of the city is Ponca
				if foundCityOwner:GetCivilizationType() == civilizationID then
					-- print("NC_Ponca_UB_UnitPrekill: Nearby city belongs to Ponca")
				
					-- Check to see if the owner of the dead unit and Ponca are at war
					local iTeam = Teams[pPlayer:GetTeam()]
					local poncaTeam = Teams[foundCityOwner:GetTeam()]
					if iTeam and iTeam:IsAtWar(poncaTeam) then
						-- print("NC_Ponca_UB_UnitPrekill: Ponca is at war with dead unit owner")
					
						-- Check to see if the Ponca city has a Maithi
						if foundCity:IsHasBuilding(buildingMaithiID) then
							-- print("NC_Ponca_UB_UnitPrekill: Ponca city has UB, providing Faith bonus...")
						
							-- Actually gives the Faith bonus
							if iUnit:GetBaseCombatStrength() > 0 then
								-- print("Faith before: " .. foundCityOwner:GetFaith())
								if iUnit:GetBaseRangedCombatStrength() > iUnit:GetBaseCombatStrength() then
									foundCityOwner:ChangeFaith(math.ceil(iUnit:GetBaseRangedCombatStrength()/3))
									-- print("NC_Ponca_UB_UnitPrekill: Providing faith based on ranged combat strength: " .. math.ceil(iUnit:GetBaseRangedCombatStrength()/3))
								else
									foundCityOwner:ChangeFaith(math.ceil(iUnit:GetBaseCombatStrength()/3))
									-- print("NC_Ponca_UB_UnitPrekill: Providing faith based on combat strength: " .. math.ceil(iUnit:GetBaseCombatStrength()/3))
								end
								-- print("Faith after: " .. foundCityOwner:GetFaith())
							end
							
						end
						
					end
					
				end
				
			end
		end

	end
end

if isCivActive then
	GameEvents.UnitPrekill.Add(NC_Ponca_UB_UnitPrekill)
end

------------------------------------------------------------------------------------------------------------------------
-- UB: Provides Faith when the city completes a Trade Route
------------------------------------------------------------------------------------------------------------------------

function NC_Ponca_UB2_PlayerDoTurn(playerID)
	-- Defines
	local pPlayer = Players[playerID]
	if pPlayer == nil then return end
	if not pPlayer:IsAlive() then return end
	if pPlayer:GetCivilizationType() ~= civilizationID then return end
	local tradeRoutes = pPlayer:GetTradeRoutes()
	local iEra = pPlayer:GetCurrentEra()
	
	local faithVal = 30 -- For easier balancing
	
	
	-- Check whether player has trade routes
	if tradeRoutes ~= nil then
		-- print("NC_Ponca_UB2_PlayerDoTurn: Iterating over Ponca trade routes")
		
		-- Loops over trade routes
		for tri, tRoute in pairs(tradeRoutes) do
			-- print('DMS_Minaeans_PDT: TR: ' .. tri)
			-- print('DMS_Minaeans_PDT: tRoute.TurnsLeft = ' .. tRoute.TurnsLeft)
			if tRoute.TurnsLeft == 2 then -- apparently different for land trade and sea trade routes, the former ending when 1 turn left, the latter when 0 :thinkingsperm:
				
				-- print("NC_Ponca_UB2_PlayerDoTurn: Trade route completed, providing Faith")
				-- Grabs the cities as variables
				local fromPlayer = Players[tRoute.FromID]
				local fromCity = tRoute.FromCity
				local toPlayer = Players[tRoute.ToID]
				local toCity = tRoute.ToCity
				
				-- Checks whether the city with the trade route actually has the UB
				if fromCity:IsHasBuilding(buildingMaithiID) or toCity:IsHasBuilding(buildingMaithiID) then
				
					-- print("NC_Ponca_UB2_PlayerDoTurn: UB present, adding Faith")
					pPlayer:ChangeFaith(faithVal * (iEra + 1)) -- TODO: is the first era 0 or 1
					
				end
			end
			-- print('---')
		end
	end
end

if isCivActive then
	GameEvents.PlayerDoTurn.Add(NC_Ponca_UB2_PlayerDoTurn)
end

print("Ponca_Functions.lua loaded!")
--=======================================================================================================================
--=======================================================================================================================
