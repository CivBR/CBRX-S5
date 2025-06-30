-- ========= --
-- UTILITIES --
-- ========= --

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

-- ======= --
-- DEFINES --
-- ======= --
include( "IconSupport" );
include("InstanceManager")
include("FLuaVector.lua")

local iCiv = GameInfoTypes["CIVILIZATION_SAS_BERZEG"]
local bIsActive = JFD_IsCivilisationActive(iCiv)

local iAul = GameInfoTypes["BUILDING_SAS_AUL"]

-- ====================================================== --
-- UA: HILL & MOUNTAIN MOVEMENT FOR RELIG UNITS & STACKED --
-- ====================================================== --

local iCircMovement = GameInfoTypes["PROMOTION_SAS_CIRCASSIA_MOVEMENT"]

local tReligUnits = {}
for row in DB.Query("SELECT * FROM Units WHERE ReligiousStrength > 0") do
	tReligUnits[row.ID] = true
end

function Circassia_UpdateMovementPromos(playerID)
	local pPlayer = Players[playerID]
	if pPlayer:GetCivilizationType() == iCiv then
		-- first, clear old promos and track what plots include religious units
		local tReligPlots = {}
		for pUnit in pPlayer:Units() do
			pUnit:SetHasPromotion(iCircMovement, false)
			if tReligUnits[pUnit:GetUnitType()] then
				tReligPlots[pUnit:GetPlot()] = true
			end
		end
		
		-- then, add the promotion to units on the flagged plots
		for pPlot, _ in pairs(tReligPlots) do
			for i = 0, pPlot:GetNumUnits() - 1, 1 do
				local pCheckedUnit = pPlot:GetUnit(i)
				pCheckedUnit:SetHasPromotion(iCircMovement, true)
			end
		end
	end
end

if bIsActive then
	GameEvents.PlayerDoTurn.Add(Circassia_UpdateMovementPromos)
end

-- ================================================= --
-- UA: DURING WAR, RELIG UNITS MAY ANNEX CITY-STATES --
-- ================================================= --

local iDummyUnit = GameInfoTypes["UNIT_SAS_CIRCASSIAN_ANNEXER"]
local iMissionAnnex = GameInfoTypes["MISSION_BUY_CITY_STATE"]
local iMissionaryClass = GameInfoTypes["UNIT_MISSIONARY"]

-- Checks if the unit is eligible to trigger the button
function Circassia_IsButtonPossible(pUnit)
	if tReligUnits[pUnit:GetUnitType()] then
		local pOwner = Players[pUnit:GetOwner()]
		if pOwner:GetCivilizationType() == iCiv then
			local pTeam = Teams[pOwner:GetTeam()]
			if pTeam:GetAtWarCount(true) > 0 then
				local pPlot = pUnit:GetPlot()
				local pPlotOwner = Players[pPlot:GetOwner()]
				if pPlotOwner and pPlotOwner:IsMinorCiv() then return true end
			end
		end
	end
	return false
end

-- Executes the effect of the button
function Circassia_AnnexCS(pPlayer, pUnit)
	local pDummy = pPlayer:InitUnit(iDummyUnit, pUnit:GetX(), pUnit:GetY())
	pDummy:PushMission(iMissionAnnex)
	
	pUnit:Kill()
	if pDummy then
		pDummy:Kill()
	end
end

-- This intermediary function allows us to generate arguments to input into Circassia_AnnexCS
function Circassia_DoButtonEffect()
	local pUnit = UI.GetHeadSelectedUnit();
	local pPlayer = Players[Game.GetActivePlayer()]
	Circassia_AnnexCS(pPlayer, pUnit)
end

function Circassia_SerialEventUnitInfoDirty()
	local pUnit = UI.GetHeadSelectedUnit();
	if (not pUnit) then return end
	if Circassia_IsButtonPossible(pUnit) then
		Controls.CircassiaButton:SetHide(false)
	else
		Controls.CircassiaButton:SetHide(true)
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

local function Circassia_UpdateUnitInfoPanel()
	if (not OptionsManager.GetSmallUIAssets()) then
		Controls.CircassiaButton:SetSizeVal(50,50)
		Controls.CircassiaButtonImage:SetSizeVal(64,64)
		Controls.CircassiaButtonImage:SetTexture("UnitActions360.dds")
	else
		Controls.CircassiaButton:SetSizeVal(36,36)
		Controls.CircassiaButtonImage:SetSizeVal(45,45)
		Controls.CircassiaButtonImage:SetTexture("UnitActions360.dds")
	end
	Controls.CircassiaButtonImage:LocalizeAndSetToolTip("TXT_KEY_SAS_CIRCASSIA_BUTTON_TOOLTIP")
	Controls.CircassiaButton:ChangeParent(ContextPtr:LookUpControl("/InGame/WorldView/UnitPanel/PrimaryStack"))
end


function Circassia_AnnexationAbilityDoTurn(playerID)
	local pPlayer = Players[playerID]
	if pPlayer:IsHuman() then return end
	if (pPlayer:GetCivilizationType() == iCiv) and pPlayer:HasUnitOfClassType(iMissionaryClass) then
		local pTeam = Teams[pPlayer:GetTeam()]
		if pTeam:GetAtWarCount(false) < 1 then return end
		-- the first unit eligible to annex will always annex, and then the game will stop checking for the turn
		for pUnit in pPlayer:Units() do
			if Circassia_IsButtonPossible(pUnit) then
				Circassia_AnnexCS(pPlayer, pUnit)
				break
			end
		end
	end
end

local function Initialize()	
	Events.LoadScreenClose.Add(Circassia_UpdateUnitInfoPanel);
	Events.SerialEventUnitInfoDirty.Add(Circassia_SerialEventUnitInfoDirty);
end

if bIsActive then
	Controls.CircassiaButton:RegisterCallback(Mouse.eLClick, Circassia_DoButtonEffect)
	GameEvents.PlayerDoTurn.Add(Circassia_AnnexationAbilityDoTurn)
	IconHookup(52, 45, "UNIT_ACTION_ATLAS", Controls.CircassiaButtonImage)
	Initialize();
end

-- ===================================== --
-- UB: CITY STRENGTH & HP FROM MOUNTAINS --
--      UB: FAITH PER CITY STRENGTH      --
-- ===================================== --

local iCityStrDummy = GameInfoTypes["BUILDING_SAS_CIRCASSIA_CITY_HP"]
local iFaithDummy = GameInfoTypes["BUILDING_SAS_CIRCASSIA_FAITH"]
local iNumDir = DirectionTypes.NUM_DIRECTION_TYPES - 1

function Circassia_UpdateCityDummies(pPlayer, pCity)
	local iNumMountains = 0
	local playerID = pPlayer:GetID()
	-- first, check for all mountains owned by the city
	for i = 0, pCity:GetNumCityPlots() - 1, 1 do
		local pPlot = pCity:GetCityIndexPlot(i)
		if pPlot and pPlot:IsMountain() and (pPlot:GetOwner() == playerID) then
			iNumMountains = iNumMountains + 1
		end
	end
	
	-- then, check again in the immediate adjacent ring, since adjacent mountains count twice
	for iDir = 0, iNumDir, 1 do
		local pPlot = Map.PlotDirection(pCity:GetX(), pCity:GetY(), iDir)
		if pPlot and pPlot:IsMountain() and (pPlot:GetOwner() == playerID) then
			iNumMountains = iNumMountains + 1
		end
	end
	
	-- assign city strength dummies per total count
	pCity:SetNumRealBuilding(iCityStrDummy, iNumMountains)
	
	-- then check strength/HP and add faith dummies
	local iStrength = pCity:GetStrengthValue()
	local iDividedStrength = math.floor(iStrength / 1000)
	pCity:SetNumRealBuilding(iFaithDummy, iDividedStrength)
end

function Circassia_AulDoTurn(playerID)
	local pPlayer = Players[playerID]
	if pPlayer:CountNumBuildings(iAul) > 0 then
		for pCity in pPlayer:Cities() do
			if pCity:IsHasBuilding(iAul) then
				Circassia_UpdateCityDummies(pPlayer, pCity)
			elseif pCity:IsHasBuilding(iCityStrDummy) or pCity:IsHasBuilding(iFaithDummy) then
				pCity:SetNumRealBuilding(iCityStrDummy, 0)
				pCity:SetNumRealBuilding(iFaithDummy, 0)
			end
		end
	end
end

function Circassia_AulCityConstructed(playerID, cityID, buildingType)
	if buildingType == iAul then
		local pPlayer = Players[playerID]
		Circassia_UpdateCityDummies(pPlayer, pPlayer:GetCityByID(cityID))
	end
end

function Circassia_AulSoldBuilding(playerID, cityID, buildingType)
	if buildingType == iAul then
		pCity:SetNumRealBuilding(iCityStrDummy, 0)
		pCity:SetNumRealBuilding(iFaithDummy, 0)
	end
end

if bIsActive then
	GameEvents.PlayerDoTurn.Add(Circassia_AulDoTurn)
	GameEvents.CityConstructed.Add(Circassia_AulCityConstructed)
	GameEvents.CitySoldBuilding.Add(Circassia_AulSoldBuilding)
end
