--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--////- - MC's Mysore: Lua Functions - -\\\\
--///- - Authors: Chrisy15 & Porkbean - -\\\
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
include("IconSupport")
include("InstanceManager")
include("C15_IteratorPack_v4.lua")
--=======================================================================================================================
-- Local defines
--=======================================================================================================================
local iUU = GameInfoTypes["UNIT_MC_MYSORE_CUSHOON"]
local iUUClass = GameInfoTypes[GameInfo.Units[iUU].Class]
local iUB = GameInfoTypes["BUILDING_MC_MYSORE_TARAMANDAL_PET"]
local iMissileUU = GameInfoTypes["UNIT_MC_MYSORE_CUSHOON_ROCKET"]
-- Fix Rockets
local iMarkerPromo = GameInfoTypes["PROMOTION_MC_MYSORE_CUSHOON"]

local iNumMissileOnTrain = 2
local iMissileHealthCost = 50
local iMissileHealthCostAIThreshold = 1.5
local iCultureBoostMod = 0.5
local iScienceBoostMod = 0.5

local sScienceText = "TXT_KEY_MC_MYSORE_SCIENCE" -- Two variables: Science granted, Unit Name
local sCultureText = "TXT_KEY_MC_MYSORE_CULTURE" -- Two variables: Culture granted, Unit Name

local sMissionTooltipHead = "TXT_KEY_MC_MYSORE_ROCKET_RESUPPLY" -- Big text heading, "Resupply Rockets"
local sMissionTooltipBody = "TXT_KEY_MC_MYSORE_ROCKET_RESUPPLY_TT" -- Explanation of what it does, "Spawn more Rockets for the Unit"
local sMissionTooltipFailHealth = "TXT_KEY_MC_MYSORE_ROCKET_RESUPPLY_TT_DISABLED_HEALTH" -- Warning Text, "Unit needs at least {1_Var} HP"; one variable, HP cost
local sMissionTooltipFailCity = "TXT_KEY_MC_MYSORE_ROCKET_RESUPPLY_TT_DISABLED_CITY" -- Warning Text, "Unit must be adjacent to UB"
local sMissionTooltipFailCapacity = "TXT_KEY_MC_MYSORE_ROCKET_RESUPPLY_TT_CAPACITY" -- Warning Text, "Unit is already at missile capacity"
local sMissionTooltipWarning = "TXT_KEY_MC_MYSORE_ROCKET_RESUPPLY_TT_WARNING" -- Warning Text, "This action will cost {1_Var} HP"; one variable, HP cost

local tMissionIcon = {IconAtlas = "UNIT_ACTION_ATLAS", PortraitIndex = 12} -- Requires x64 and x45 versions

local iRebase = GameInfoTypes["MISSION_REBASE"]

--=======================================================================================================================
-- UA Lua by PorkBean
--=======================================================================================================================

local tRocketUnits = {}

for row in DB.Query("SELECT ID FROM Units WHERE Special = ('SPECIALUNIT_MISSILE')") do
	tRocketUnits[row.ID] = true
end

local iMysoreCiv = GameInfoTypes.CIVILIZATION_MC_MYSORE;
local iRocketPromotion = GameInfoTypes.PROMOTION_MC_MYSORE;

local iScience = GameInfoTypes.YIELD_SCIENCE;
local iCulture = GameInfoTypes.YIELD_CULTURE;

local iScienceDummy = GameInfoTypes.BUILDING_MC_SCIENCE_DUMMY;
local iCultureDummy = GameInfoTypes.BUILDING_MC_CULTURE_DUMMY;

local iDummyTimer = GameInfoTypes.BUILDING_MC_DUMMY_TIMER;

------------------------------------------------------------------------------------------------------------------------
-- JFD_IsCivilisationActive
------------------------------------------------------------------------------------------------------------------------
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

local isMysoreCivActive = JFD_IsCivilisationActive(iMysoreCiv);

------------------------------------------------------------------------------------------------------------------------
-- GiveRocketPromotions
------------------------------------------------------------------------------------------------------------------------
function GiveRocketPromotions(iPlayer, iUnit)
	local pPlayer = Players[iPlayer]
	if pPlayer:IsAlive() and pPlayer:GetCivilizationType() == iMysoreCiv then
		local pUnit = pPlayer:GetUnitByID(iUnit)
		if pUnit and tRocketUnits[pUnit:GetUnitType()] then
			pUnit:SetHasPromotion(iRocketPromotion, true)
		end
	end
end

function DetectDeclareWar(iAttackingTeam, iDefendingTeam)
	local pAttackingTeam = Teams[iAttackingTeam]
	local iAttacker = pAttackingTeam:GetLeaderID()
	local pAttacker = Players[iAttacker]
	local pDefendingTeam = Teams[iDefendingTeam]
	local iDefender = pDefendingTeam:GetLeaderID()
	local pDefender = Players[iDefender]
	local pMysore = nil
	local bAttacker = true
	if pAttacker:GetCivilizationType() == iMysoreCiv then
		pMysore = pAttacker
		bAttacker = true
	elseif pDefender:GetCivilizationType() == iMysoreCiv then
		pMysore = pDefender
		bAttacker = false
	end
	if pMysore then
		InitDoubleScienceCulture(pMysore, bAttacker)
	end
end

function InitDoubleScienceCulture(pPlayer, bAttacker)
	local iTimerStart = 5
	if bAttacker == true then
		iTimerStart = 4
	end
	for pCity in pPlayer:Cities() do
		local iScienceFromBuildings = pCity:GetBaseYieldRateFromBuildings(iScience)
		pCity:SetNumRealBuilding(iScienceDummy, iScienceFromBuildings)
		local iCultureFromBuildings = pCity:GetBaseYieldRateFromBuildings(iCulture)
		pCity:SetNumRealBuilding(iCultureDummy, iCultureFromBuildings)
		pCity:SetNumRealBuilding(iDummyTimer, iTimerStart)
	end
end

function TickDoubleScienceCulture(iPlayer)	
	local pPlayer = Players[iPlayer]
	local iCurrentCount = 0
	for pCity in pPlayer:Cities() do
		if pCity:IsHasBuilding(iDummyTimer) then
			iCurrentCount = pCity:GetNumRealBuilding(iDummyTimer) --this should find a city with the current count so it can be given to cities captured during the war
			break;
		end
	end
	for pCity in pPlayer:Cities() do
		if pCity:IsHasBuilding(iDummyTimer) then
			pCity:SetNumRealBuilding(iDummyTimer, iCurrentCount-1)
			if not pCity:IsHasBuilding(iScienceDummy) then --give the science dummy if this is a new city
				local iScienceFromBuildings = pCity:GetBaseYieldRateFromBuildings(iScience)
				pCity:SetNumRealBuilding(iScienceDummy, iScienceFromBuildings)
			end
			if not pCity:IsHasBuilding(iCultureDummy) then
				local iCultureFromBuildings = pCity:GetBaseYieldRateFromBuildings(iCulture)
				pCity:SetNumRealBuilding(iCultureDummy, iCultureFromBuildings)
			end
		else
			if pCity:IsHasBuilding(iScienceDummy) then --remove if timer is over
				pCity:SetNumRealBuilding(iScienceDummy, 0)
			end
			if pCity:IsHasBuilding(iCultureDummy) then
				pCity:SetNumRealBuilding(iCultureDummy, 0)
			end
		end
	end
end

if isMysoreCivActive then
	Events.SerialEventUnitCreated.Add(GiveRocketPromotions)
	GameEvents.DeclareWar.Add(DetectDeclareWar)
	GameEvents.PlayerDoTurn.Add(TickDoubleScienceCulture)
end
--=======================================================================================================================
-- Chrisy's stuff
--=======================================================================================================================
-- Tech Utilities
function JFD_GetRandom(lower, upper)
    return Game.Rand((upper + 1) - lower, "") + lower
end

local tTechs = {}
for i = 0, GameDefines.MAX_CIV_TEAMS - 1 do
	tTechs[i] = {}
	for row in GameInfo.Technologies() do
		tTechs[i][row.ID] = true
	end
end

local tTechPrereqs = {}
for row in DB.Query("SELECT c.ID TechID, a.ID PrereqID FROM Technologies a, Technology_PrereqTechs b, Technologies c WHERE a.Type = b.PrereqTech AND c.Type = b.TechType") do -- Awkward because both IDs are being taken from the same table :/
	if not tTechPrereqs[row.TechID] then
		tTechPrereqs[row.TechID] = {}
	end
	tTechPrereqs[row.TechID][row.PrereqID] = true
end

function C15_CanResearchButItWorks(pTeam, iTech)
	if tTechPrereqs[iTech] then
		for k, v in pairs(tTechPrereqs[iTech]) do
			--print("Prereq: ", k)
			if not pTeam:IsHasTech(k) then
				--print("No has")
				return false
			end
		end
	end
	return true
end		

function C15_ChooseTech(pPlayer)
	local iTech = pPlayer:GetCurrentResearch()
	if (not iTech) or iTech < 0 then
		local iTeam = pPlayer:GetTeam()
		local pTeam = Teams[iTeam]
		local pTeamTech = pTeam:GetTeamTechs()
		local tResearchOptions = {}
		local tToDelete = {}
		local iLeastResearch = 9999999
		for k, v in pairs(tTechs[iTeam]) do
			if pTeam:IsHasTech(k) then
				tToDelete[k] = true
			elseif C15_CanResearchButItWorks(pTeam, k) then
				local iLeft = pTeamTech:GetResearchLeft()
				if iLeft < iLeastResearch then
					iLeastResearch = iLeft
				end
				if not tResearchOptions[iLeft] then
					tResearchOptions[iLeft] = {}
				end
				table.insert(tResearchOptions[iLeft], k)
			end
		end
		if ((not iTech) or iTech < 0) and tResearchOptions[iLeastResearch] then
			local iRandom = JFD_GetRandom(1, #tResearchOptions[iLeastResearch])
			iTech = tResearchOptions[iLeastResearch][iRandom]
		end
		for k, v in pairs(tToDelete) do
			tTechs[iTeam][k] = nil
		end
	end
	return iTech
end

function C15_Mysore_GrantScience(pPlayer, pUnit)
	local iTech = C15_ChooseTech(pPlayer)
	if iTech >= 0 then
		local iScience = math.max(math.floor(pPlayer:GetScience() * iScienceBoostMod), 1)
		local pTeamTechs = Teams[pPlayer:GetTeam()]:GetTeamTechs()
		pTeamTechs:ChangeResearchProgress(iTech, iScience, playerID)
		if Game.GetActivePlayer() == playerID then
			Events.GameplayAlertMessage(Locale.ConvertTextKey(sScienceText, iScience, pUnit:GetName()))
		end
	else
		print("iTech invalid! ", iTech)
	end
end

function C15_Mysore_GrantCulture(pPlayer, pUnit)
	local iCulture = math.max(math.floor(pPlayer:GetTotalJONSCulturePerTurn() * iCultureBoostMod), 1)
	pPlayer:ChangeJONSCulture(iCulture)
	if Game.GetActivePlayer() == playerID then
		Events.GameplayAlertMessage(Locale.ConvertTextKey(sCultureText, iCulture, pUnit:GetName()))
	end
end

local tMysoreFunctions = {}
tMysoreFunctions[GameInfoTypes["UNITCOMBAT_ARCHER"]] = C15_Mysore_GrantCulture
tMysoreFunctions[GameInfoTypes["UNITCOMBAT_SIEGE"]] = C15_Mysore_GrantScience

function C15_Mysore_CanStartMission(playerID, unitID, iMission)
	local pPlayer = Players[playerID]
	local pUnit = pPlayer:GetUnitByID(unitID)
	if iMission == iRebase and pUnit:GetUnitType() == iMissileUU then
		return false
	else
		return true
	end
end

GameEvents.CanStartMission.Add(C15_Mysore_CanStartMission)

function C15_Mysore_CityTrained(playerID, cityID, unitID)
	local pPlayer = Players[playerID]
	local pUnit = pPlayer:GetUnitByID(unitID)
	-- Fixing the "Rockets can't be correctly spawned in Cities" problem
	--[[if pUnit:GetUnitType() == iUU then
		for i = 1, iNumMissileOnTrain do
			pPlayer:InitUnit(iMissileUU, pUnit:GetX(), pUnit:GetY())
		end
	end]]
	
	if pPlayer:GetCityByID(cityID):IsHasBuilding(iUB) then
		local iCombatClass = pUnit:GetUnitCombatType()
		if tMysoreFunctions[iCombatClass] then
			tMysoreFunctions[iCombatClass](pPlayer, pUnit)
		end
	end
end

GameEvents.CityTrained.Add(C15_Mysore_CityTrained)

function C15_Mysore_SetXY(playerID, unitID, iX, iY)
	local pPlayer = Players[playerID]
	local pUnit = pPlayer:GetUnitByID(unitID)
	if pUnit and pUnit:IsHasPromotion(iMarkerPromo) then
		local pPlot = Map.GetPlot(iX, iY)
		if not pPlot:IsCity() then
			local iCapacity = pUnit:CargoSpace() - pUnit:GetCargo()
			for i = 1, iCapacity do
				pPlayer:InitUnit(iMissileUU, iX, iY)
			end
			pUnit:SetHasPromotion(iMarkerPromo, false)
		end
	end
end

GameEvents.UnitSetXY.Add(C15_Mysore_SetXY)

-- Missile Resupply Button

function C15_Mysore_IsValidResupplyPlot(playerID, pUnit)
	local pPlot = pUnit:GetPlot()
	for pIterPlot in C15_AdjacentPlotIterator(pPlot, false) do
		local pCity = pIterPlot:GetPlotCity()
		if pCity then
			if pCity:GetOwner() == playerID and pCity:IsHasBuilding(iUB) then
				return true
			end
		end
	end
	
	return false
end

function C15_Mysore_ButtonPressed(playerID, unitID)
	local pPlayer = Players[playerID]
	local pUnit = pPlayer:GetUnitByID(unitID)
	pPlayer:InitUnit(iMissileUU, pUnit:GetX(), pUnit:GetY())
	pUnit:ChangeDamage(iMissileHealthCost)
end

function C15_Mysore_AIButtonLogic(playerID)
	local pPlayer = Players[playerID]
	if pPlayer:CountNumBuildings(iUB) > 0 and pPlayer:GetUnitClassCount(iUUClass) > 0 and (not pPlayer:IsHuman()) then
		for pUnit in pPlayer:Units() do
			if pUnit:GetUnitType() == iUU and pUnit:CargoSpaceAvailable() > 0 then
				if C15_Mysore_IsValidResupplyPlot(playerID, pUnit) and pUnit:GetCurrHitPoints() >= iMissileHealthCost * iMissileHealthCostAIThreshold then
					C15_Mysore_ButtonPressed(playerID, pUnit:GetID())
				end
			end
		end
	end
end			
GameEvents.PlayerDoTurn.Add(C15_Mysore_AIButtonLogic)

--include( "IconSupport" );
local m_PopupInfo = nil;

-------------------------------------------------
-------------------------------------------------
local UnitActionButton = Controls.UnitActionButton
local UnitActionIcon = Controls.UnitActionIcon
if OptionsManager.GetSmallUIAssets() and not UI.IsTouchScreenEnabled() then
    UnitActionButton = Controls.UnitActionButton_Small
    UnitActionIcon = Controls.UnitActionIcon_Small
end

local tFoundAbroad = {}
for row in DB.Query("SELECT ID FROM Units WHERE FoundAbroad = 1") do
	tFoundAbroad[row.ID] = true
end

local tSpreadCounts = {}
for row in DB.Query("SELECT ID, ReligionSpreads FROM Units WHERE ReligionSpreads > 0") do
	tSpreadCounts[row.ID] = row.ReligionSpreads
end

UnitActionButton:RegisterCallback(Mouse.eLClick, C15_Mysore_ButtonPressed)
-------------------------------------------------------------------------------------------------------------------------

local tipControlTable = {};
TTManager:GetTypeControlTable( "TypeUnitAction_MC_Mysore_RocketResupply", tipControlTable );
function MC_Mysore_RocketResupply_UI_SerialEventUnitInfoDirty()
	local activePlayerID = Game.GetActivePlayer()
	local pPlayer = Players[activePlayerID]
	local unit = UI.GetHeadSelectedUnit();
	if (not unit) then return end
	local iUnitType = unit:GetUnitType()
	if iUnitType == iUU then
		UnitActionButton:SetHide(false)
		
		UnitActionButton:SetVoid1(activePlayerID)
		UnitActionButton:SetVoid2(unit:GetID())
		
		local sHead = "[COLOR_POSITIVE_TEXT]" .. Locale.ConvertTextKey(sMissionTooltipHead) .. "[ENDCOLOR]"
		
		tipControlTable.UnitActionText:SetText(sHead)
		
		local sTT = "[NEWLINE]" .. Locale.ConvertTextKey(sMissionTooltipBody)
		--print("TT Created")
		if unit:GetCurrHitPoints() <= iMissileHealthCost then
			--print("No Gov")
			sTT = sTT .. "[NEWLINE][NEWLINE]" .. Locale.ConvertTextKey(sMissionTooltipFailHealth, iMissileHealthCost)
			UnitActionButton:SetDisabled(true)
		elseif not C15_Mysore_IsValidResupplyPlot(activePlayerID, unit) then
			sTT = sTT .. "[NEWLINE][NEWLINE]" .. Locale.ConvertTextKey(sMissionTooltipFailCity)
			UnitActionButton:SetDisabled(true)
		--elseif unit:CargoSpaceAvailable() <= 0 then
		elseif unit:CargoSpace() - unit:GetCargo() <= 0 then
			sTT = sTT .. "[NEWLINE][NEWLINE]" .. Locale.ConvertTextKey(sMissionTooltipFailCapacity)
			UnitActionButton:SetDisabled(true)
		else
			sTT = sTT .. "[NEWLINE][NEWLINE]" .. Locale.ConvertTextKey(sMissionTooltipWarning, iMissileHealthCost)
		
			UnitActionButton:SetDisabled(false)
		end
		
		--UnitActionButton:SetToolTipString(sTT)
		tipControlTable.UnitActionHelp:SetText(sTT)
		tipControlTable.UnitActionHotKey:SetText("")
		
		tipControlTable.UnitActionMouseover:DoAutoSize();
		local mouseoverSize = tipControlTable.UnitActionMouseover:GetSize();
		if mouseoverSize.x < 350 then
			tipControlTable.UnitActionMouseover:SetSizeVal( 350, mouseoverSize.y );
		end
		
	else
		UnitActionButton:SetHide(true)
	end
		
	local buildCityButtonActive = false
	if (not unit:IsEmbarked()) and unit:GetMoves() > 0 then
		if unit:IsFound() then
			buildCityButtonActive = true
		elseif tFoundAbroad[iUnitType] then
			local pCapital = pPlayer:GetCapitalCity()
			if pCapital then
				if pCapital:Area() ~= unit:GetArea() then
					buildCityButtonActive = true
				end
			end
		end
	end
				
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
-------------------------------------------------------------------------------------------------------------------------
local function MC_Mysore_RocketResupply_UI_UpdateUnitInfoPanel()
	if (not OptionsManager.GetSmallUIAssets()) then
		IconHookup(tMissionIcon.PortraitIndex, 64, tMissionIcon.IconAtlas, UnitActionIcon)
	else
		IconHookup(tMissionIcon.PortraitIndex, 45, tMissionIcon.IconAtlas, UnitActionIcon)
	end
	UnitActionButton:ChangeParent(ContextPtr:LookUpControl("/InGame/WorldView/UnitPanel/PrimaryStack"))
end
 -------------------------------------------------------------------------------------------------------------------------
local function Initialize()
	Events.LoadScreenClose.Add(MC_Mysore_RocketResupply_UI_UpdateUnitInfoPanel);
	Events.SerialEventUnitInfoDirty.Add(MC_Mysore_RocketResupply_UI_SerialEventUnitInfoDirty);
end
Initialize();