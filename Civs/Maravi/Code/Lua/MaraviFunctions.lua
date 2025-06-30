--============================================================
-- GLOBALS
--============================================================
print("JWW Maravi Lua Activated")

include("FLuaVector.lua")
include("IconSupport.lua")
include("InstanceManager.lua")

local iMaravi = GameInfoTypes["CIVILIZATION_JWW_MARAVI"]

--TableSaverLoader (needed for Eye of Universe and its hints)
include("TableSaverLoader016.lua")
JWW_Maravi = {}
include("JWWMaraviTSL.lua")

JWW_Maravi.NyauTracker = JWW_Maravi.NyauTracker or {}
tNyauTracker = JWW_Maravi.NyauTracker

TableLoad(tableRoot, tableName)

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
local bIsActive = JFD_IsCivilisationActive(iMaravi)

function JFD_GetRandom(lower, upper)
    return Game.Rand((upper + 1) - lower, "") + lower
end

--===========================================================================
-- UA (Prophecy of Chauta)
--===========================================================================
local iUADummy = GameInfoTypes["BUILDING_JWW_MARAVI_UA_DUMMY"]
-----------------------------------------------------------------------------
-- For each unique luxury resource you own, units are trained with additional experience.
-----------------------------------------------------------------------------
function JWW_GiveDummiesPerUniqueLux(iPlayer)
	local pPlayer = Players[iPlayer]
	if pPlayer:IsAlive() and pPlayer:GetCivilizationType() == iMaravi then
		local iNumLuxuries = (pPlayer:GetHappinessFromResources() / 4)
		for pCity in pPlayer:Cities() do
			pCity:SetNumRealBuilding(iUADummy, iNumLuxuries)
		end
	end
end

function JWW_DeleteDummy(iOldPlayer, bCapital, iPlotX, iPlotY, iNewPlayer, iOldPop, bConquest, iGreatWorkCount) --if city changes owners, delete dummies
	local pPlot = Map.GetPlot(iPlotX, iPlotY)
	if pPlot:IsCity() then
		local pCity = pPlot:GetPlotCity()
		pCity:SetNumRealBuilding(iUADummy, 0)
	end
end
-----------------------------------------------------------------------------
-- Razing Cities grant Faith, and grant healing to all the units in the territory.
-----------------------------------------------------------------------------
function JWW_RazeForFaithAndHealth(iPlayer)
	local iFaith = 0
	local pPlayer = Players[iPlayer]
	if pPlayer:IsAlive() and pPlayer:GetCivilizationType() == iMaravi then
		for pCity in pPlayer:Cities() do
			if pCity:IsRazing() then
				local iFaithAdded = JFD_GetRandom(15, 25)
				iFaith = iFaith + iFaithAdded
				if pPlayer:IsHuman() then
					Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(pCity:GetX(), pCity:GetY()))), "+" .. iFaithAdded .. " [ICON_PEACE]", 0)
				end
				for i = 0, pCity:GetNumCityPlots(), 1 do
                    local pPlot = pCity:GetCityIndexPlot(i)
					if pPlot:GetWorkingCity() == pCity and pPlot:IsUnit() then
						local pUnit = pPlot:GetUnit()
						pUnit:ChangeDamage(-15)
					end
				end
			end
		end
		pPlayer:ChangeFaith(iFaith)
	end
end
-----------------------------------------------------------------------------
if bIsActive then
	GameEvents.PlayerDoTurn.Add(JWW_GiveDummiesPerUniqueLux)
	GameEvents.PlayerDoTurn.Add(JWW_RazeForFaithAndHealth)
	GameEvents.CityCaptureComplete.Add(JWW_DeleteDummy)
end
--===========================================================================
-- UU (Zimba Marauder)
--===========================================================================
local iZimba = GameInfoTypes["UNIT_JWW_ZIMBA_MARAUDER"]
local iPikemanClass = GameInfoTypes["UNITCLASS_PIKEMAN"]
-----------------------------------------------------------------------------
-- Defeating units will heal the Zimba and provide food to a random city.
-----------------------------------------------------------------------------
function JWW_KillAndEatThem(iPlayer, iUnit, unitType, iX, iY, bDelay, killerID)
	local pPlot = Map.GetPlot(iX, iY)
	if bDelay then
		if killerID == -1 then return end
		pKiller = Players[killerID]
		if pKiller == Players[iPlayer] then return end
		if (Players[pPlot:GetOwner()] == pKiller) then
			if not pKiller:HasUnitOfClassType(iPikemanClass) then
				pKiller = nil
			end
		end
	end
	if pKiller then
		local pUnit = pPlot:GetUnit(0)
		if pUnit and pUnit:GetUnitType() == iZimba then
			pUnit:ChangeDamage(-20)
			local iTimes = 0
			local iCity = JFD_GetRandom(1, pKiller:GetNumCities())
			for pCity in pKiller:Cities() do -- random city
				iTimes = iTimes + 1
				if iTimes == iCity then
					local iFood = JFD_GetRandom(5, 15)
					pCity:ChangeFood(iFood)
					if pKiller:IsHuman() then
						Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(iX, iY))), "[NEWLINE]+" .. iFood .. " [ICON_FOOD]", 0)
					end
				end
			end
		end
	end
end
-----------------------------------------------------------------------------
-- Pillaging in enemy territory permanently increases combat strength.
-----------------------------------------------------------------------------
--Thanks TopHat
local iPillageMission = GameInfoTypes["MISSION_PILLAGE"]
local pActivePlayer = Players[Game.GetActivePlayer()]

function IsButtonPossible(pUnit)
	if pUnit:GetUnitType() == iZimba then
		local pPlot = pUnit:GetPlot()
		local pPlotOwner = -1
		local pUnitOwner = Players[pUnit:GetOwner()]
		if pPlot:IsOwned() then
			pPlotOwner = Players[pPlot:GetOwner()]
		end
		if pUnitOwner ~= pPlotOwner then
			if pPlot:GetImprovementType() > -1 and not pPlot:IsImprovementPillaged() then
				if pPlot:IsOwned() then
					local pUnitTeam = Teams[pUnitOwner:GetTeam()]
					local iOtherTeam = pPlotOwner:GetTeam()
					if pUnitTeam:IsAtWar(iOtherTeam) then
						return true
					end
				else
					return true
				end
			end
		end
	end
	return false
end

function DoButtonEffect(pPlayer, pUnit)
	local pPlot = pUnit:GetPlot()
	pPlot:SetImprovementPillaged(true)
	pUnit:ChangeMoves(-120)
	if pUnit:MovesLeft() < 0 then pUnit:SetMoves(0) end
	pUnit:ChangeDamage(-25)
	pPlayer:ChangeGold(20)
	if pPlayer:IsHuman() then
		local iX = pUnit:GetX()
		local iY = pUnit:GetY()
		local sMessage = "[COLOR_YIELD_GOLD]+20 [ICON_GOLD][ENDCOLOR][NEWLINE]+ 1 [ICON_STRENGTH]"
		Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(iX, iY))), sMessage, 0)
	end
	
	pUnit:SetBaseCombatStrength(pUnit:GetBaseCombatStrength() + 1) --Jake did this part :p
end

function Pillager_UnitActionButton()
	local pUnit = UI.GetHeadSelectedUnit();
	DoButtonEffect(pActivePlayer, pUnit)
end

function Pillager_SerialEventUnitInfoDirty()
	local pUnit = UI.GetHeadSelectedUnit();
	if (not pUnit) then return end
	if IsButtonPossible(pUnit) then
		Controls.PillageButton:SetHide(false)
	else
		Controls.PillageButton:SetHide(true)
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

local function Pillager_UpdateUnitInfoPanel()
	if (not OptionsManager.GetSmallUIAssets()) then
		Controls.PillageButton:SetSizeVal(50,50)
		Controls.PillageIcon:SetSizeVal(64,64)
		Controls.PillageIcon:SetTexture("UnitActions360.dds")
	else
		Controls.PillageButton:SetSizeVal(36,36)
		Controls.PillageIcon:SetSizeVal(45,45)
		Controls.PillageIcon:SetTexture("UnitActions360.dds")
	end
	Controls.PillageIcon:LocalizeAndSetToolTip("TXT_KEY_JWW_ZIMBA_PILLAGE_HELP")
	Controls.PillageButton:ChangeParent(ContextPtr:LookUpControl("/InGame/WorldView/UnitPanel/PrimaryStack"))
end

function CheckIfCanPillage(playerID, unitID, missionID)
	-- thanks to chrisy for reminding me that CanStartMission exists
	if missionID == iPillageMission then
		local pPlayer = Players[playerID]
		local pUnit = pPlayer:GetUnitByID(unitID)
		if pUnit:GetUnitType() == iZimba then
			return false
		end
	end
	return true
end

function AI_Pillage(playerID)
	local pPlayer = Players[playerID]
	if pPlayer:HasUnitOfClassType(iPikemanClass) then
		if (not pPlayer:IsHuman()) and pPlayer:GetCivilizationType() == iMaravi then
			for pUnit in pPlayer:Units() do
				if IsButtonPossible(pUnit) then
					if JFD_GetRandom(1,2) == 1 then
						pPlot:SetImprovementPillaged(true)
						pUnit:ChangeMoves(-120)
						if pUnit:MovesLeft() < 0 then pUnit:SetMoves(0) end
						pUnit:ChangeDamage(-25)
						pPlayer:ChangeGold(20)
						pUnit:SetBaseCombatStrength(pUnit:GetBaseCombatStrength() + 1)
					end
				end
			end
		end
	end
end

local function Initialize()	
	Events.LoadScreenClose.Add(Pillager_UpdateUnitInfoPanel);
	Events.SerialEventUnitInfoDirty.Add(Pillager_SerialEventUnitInfoDirty);
end
-----------------------------------------------------------------------------
if bIsActive then
	GameEvents.UnitPrekill.Add(JWW_KillAndEatThem)

	Controls.PillageButton:RegisterCallback(Mouse.eLClick, Pillager_UnitActionButton);
	IconHookup(37, 45, "UNIT_ACTION_ATLAS", Controls.PillageIcon)
	GameEvents.CanStartMission.Add(CheckIfCanPillage)
	GameEvents.PlayerDoTurn.Add(AI_Pillage)
	Initialize();
end
--===========================================================================
-- UU2 (Nyau Cultist)
--===========================================================================
local iNyau = GameInfoTypes["UNIT_JWW_NYAU_CULTIST"]
local iMissionaryClass = GameInfoTypes["UNITCLASS_MISSIONARY"]
local iNyauProm = GameInfoTypes["PROMOTION_JWW_NYAU_INVIS"]
local iCityRuins = GameInfoTypes["IMPROVEMENT_CITY_RUINS"]
-----------------------------------------------------------------------------
--  Spawns naturally every time you accumulate 250 faith. (I don't really want this but i have to because of Unique Missionary shit not workin)
-----------------------------------------------------------------------------
for i = 0, GameDefines.MAX_MAJOR_CIVS - 1, 1 do
	if i and (Players[i]:GetCivilizationType() == iMaravi) then
		tNyauTracker[i] = {Start = 0, Prev = 0}
	end
end

function JWW_UpdateFaith(iPlayer) --Track Faith every turn to generate Nyau Cultists
	local pPlayer = Players[iPlayer]
	if pPlayer:IsAlive() and pPlayer:GetCivilizationType() == iMaravi then
		local iCurrFaith = pPlayer:GetFaith()
		for i, v in pairs(tNyauTracker) do
			--print("Nyau Faith Tracker: ", v.Prev, iCurrFaith)
			if i == iPlayer then
				if iCurrFaith < v.Start then --if player purchases with Faith
					local iCorrection = v.Prev - iCurrFaith --need to correct starting Faith value or Faith costs will massively increase
					local iNewStart = v.Start - iCorrection --ex: player has 500 Faith with goal of getting 750 faith, but buys smth with 200 Faith, goal should change from 750 to 550.
					tNyauTracker[iPlayer] = {Start = iNewStart, Prev = iCurrFaith}
				elseif (iCurrFaith - v.Start) > 250 then --Player meets 250 Faith threshold to receive Nyau
					local pCap = pPlayer:GetCapitalCity()
					local pUnit = pPlayer:InitUnit(iNyau, pCap:GetX(), pCap:GetY())
					pUnit:JumpToNearestValidPlot()
					pPlayer:ChangeFaith(-100) --lose some Faith as payment?
					tNyauTracker[i] = {Start = iCurrFaith, Prev = iCurrFaith}
				else
					tNyauTracker[iPlayer] = {Start = v.Start, Prev = iCurrFaith}
				end
			end
		end
	end
end
-----------------------------------------------------------------------------
-- Invisible when on roads, improvements, or the same tile as another unit.
-----------------------------------------------------------------------------
function JWW_GivePromOnRoadsAndImprovements(iPlayer)
	local pPlayer = Players[iPlayer]
	if pPlayer:IsAlive() and pPlayer:GetCivilizationType() == iMaravi then
		if pPlayer:HasUnitOfClassType(iMissionaryClass) then
			for pUnit in pPlayer:Units() do
				local bProm = false
				if pUnit:GetUnitType() == iNyau then
					local pPlot = pUnit:GetPlot()
					if pPlot:IsRoute() or (pPlot:GetImprovementType() > -1) or (pPlot:GetNumUnits() > 1) then
						bProm = true
					end
				end
				if bProm then
					pUnit:SetHasPromotion(iNyauProm, true)
				else
					pUnit:SetHasPromotion(iNyauProm, false)
				end
			end
		end
	end
end
-----------------------------------------------------------------------------
-- Can perform a "Gule Wamkulu" on city ruins, which expends the unit to build a city.
-----------------------------------------------------------------------------
function JWW_CanTransformRuinsIntoCity(unit)
	local pBool = false;
	local pPlot = unit:GetPlot();
	if unit:GetUnitType() ~= iNyau then return pBool end
	if unit:MovesLeft() <= 1 then return pBool end
	if pPlot:IsOwned() then return pBool end
	if pPlot ~= nil then
		local pPlayer = Players[unit:GetOwner()]
		if pPlayer:CanFound(pPlot:GetX(), pPlot:GetY()) and pPlayer:GetCivilizationType() == iMaravi then
			if pPlot:GetImprovementType() == iCityRuins then
				pBool = true;
			end
		end
	end
	return pBool
end

function JWW_TransformRuinsIntoCity(pActivePlayer, pUnit)
	local playerID = Game.GetActivePlayer()
	local pPlayer = Players[Game.GetActivePlayer()]
	if JWW_CanTransformRuinsIntoCity(pUnit) then
		local pPlot = pUnit:GetPlot()
		pPlot:SetImprovementType(-1)
		pPlayer:Found(pUnit:GetX(), pUnit:GetY())
		pUnit:Kill()
	end
end

function TransformRuinsIntoCity_UnitActionButton()
	local uUnit = UI.GetHeadSelectedUnit();
	JWW_TransformRuinsIntoCity(pActivePlayer, uUnit)
end

function TransformRuinsIntoCity_SerialEventUnitInfoDirty()
	local uUnit = UI.GetHeadSelectedUnit();
	if (not uUnit) then return end
	if JWW_CanTransformRuinsIntoCity(uUnit) then
		Controls.UnitActionButton:SetHide(false)
	else
		Controls.UnitActionButton:SetHide(true)
	end
	
	local buildCityButtonActive = uUnit:IsFound();
				
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

local function TransformRuinsIntoCity_UpdateUnitInfoPanel()
	if (not OptionsManager.GetSmallUIAssets()) then
		Controls.UnitActionButton:SetSizeVal(50,50)
		Controls.UnitActionIcon:SetSizeVal(64,64)
		Controls.UnitActionIcon:SetTexture("MaraviGaleWamkuluAtlas45.dds")
	else
		Controls.UnitActionButton:SetSizeVal(36,36)
		Controls.UnitActionIcon:SetSizeVal(45,45)
		Controls.UnitActionIcon:SetTexture("MaraviGaleWamkuluAtlas45.dds")
	end
	Controls.UnitActionIcon:LocalizeAndSetToolTip("TXT_KEY_JWW_GULE_WAMKULU_HELP")
	Controls.UnitActionButton:ChangeParent(ContextPtr:LookUpControl("/InGame/WorldView/UnitPanel/PrimaryStack"))
end

local function Initialize()	
	Events.LoadScreenClose.Add(TransformRuinsIntoCity_UpdateUnitInfoPanel);
	Events.SerialEventUnitInfoDirty.Add(TransformRuinsIntoCity_SerialEventUnitInfoDirty);
end

function JWW_AITransformRuinsIntoCity_DoTurn(playerID)
	local pPlayer = Players[playerID]
	if pPlayer:IsHuman() then return end
	if pPlayer:GetCivilizationType() == iMaravi then
		if pPlayer:HasUnitOfClassType(iMissionaryClass) then
			for pUnit in pPlayer:Units() do
				if pUnit:GetUnitType() == iNyau then
					if JWW_CanTransformRuinsIntoCity(pUnit) then
						local pPlot = pUnit:GetPlot()
						pPlot:SetImprovementType(-1)
						pPlayer:Found(pUnit:GetX(), pUnit:GetY())
						pUnit:Kill()		
					end			
				end
			end
		end
	end
end
-----------------------------------------------------------------------------
if bIsActive then
	GameEvents.PlayerDoTurn.Add(JWW_UpdateFaith)
	GameEvents.PlayerDoTurn.Add(JWW_GivePromOnRoadsAndImprovements)

	GameEvents.PlayerDoTurn.Add(JWW_AITransformRuinsIntoCity_DoTurn)
	Controls.UnitActionButton:RegisterCallback(Mouse.eLClick, TransformRuinsIntoCity_UnitActionButton);
	IconHookup(0, 45, "JWW_MARAVI_GULE_WAMKULU_ATLAS", Controls.UnitActionIcon)
	Initialize();
end
--===========================================================================