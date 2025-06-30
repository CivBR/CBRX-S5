-- JFD_Civs_AfghanistanZahirShah_Functions
-- Author: JFD
-- DateCreated: 2/15/2014 6:33:36 PM
--==========================================================================================================================
-- INCLUDES
--==========================================================================================================================
------------------------------------------------------------------------------------------------------------------------
include("FLuaVector.lua")
include("PlotIterators.lua")
include("IconSupport.lua")
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
local civilizationID = GameInfoTypes["CIVILIZATION_ASQ_XARAGUA"]
local bIsActive = JFD_IsCivilizationActive(civilizationID)
local traitXaraguaID = GameInfoTypes["TRAIT_ASQ_XARAGUA"]

local buildingBateyID = GameInfoTypes["BUILDING_ASQ_BATEY"]
local buildingAreitoBonusCountID = GameInfoTypes["BUILDING_ASQ_AREITO_BONUS_COUNT"]
local buildingAreitoID = GameInfoTypes["BUILDING_ASQ_AREITO_DUMMY"]
local buildingAreitoBonusID = GameInfoTypes["BUILDING_ASQ_AREITO_BONUS_DUMMY"]

local unitTekinaID = GameInfoTypes["UNIT_ASQ_TEKINA"]

local unitclassGreatArtistID = GameInfoTypes["UNITCLASS_ARTIST"]
local unitclassGreatWriterID = GameInfoTypes["UNITCLASS_WRITER"]
local unitclassGreatMusicianID = GameInfoTypes["UNITCLASS_MUSICIAN"]

local pOasis = GameInfoTypes["FEATURE_OASIS"]

local iPracticalNumCivs = (GameDefines.MAX_MAJOR_CIVS - 1)

local tNaturalWonders = {}

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
-- UA: Expending Cultural Great People starts a WLTKD in the nearest city
----------------------------------------------------------------------------------------------------------------------------
local defineWLTKDTurns 	= GameDefines["CITY_RESOURCE_WLTKD_TURNS"]

function ASQ_Xaragua_UA_UnitPrekill(unitOwnerID, unitID, unitType, plotX, plotY, isDelay, killingPlayerID)
	-- print("ASQ_Xaragua_UA_UnitPrekill: Running")
	local player = Players[unitOwnerID]
	if unitOwnerID == killingPlayerID then return end
	if (not player) then return end
	if (not player:IsAlive()) then return end
	if not isDelay then return end

	local playerCapital = player:GetCapitalCity()
	if (not playerCapital) then return end
	
	local unit = player:GetUnitByID(unitID)
	local unitClass = unit:GetUnitClassType()
	
	if unitClass ~= unitclassGreatArtistID and unitClass ~= unitclassGreatWriterID and unitClass ~= unitclassGreatMusicianID then return end
	-- print("ASQ_Xaragua_UA_UnitPrekill: Unit expended is Cultural Great Person")
	local plot = Map.GetPlot(plotX, plotY)
	local city = Neirai_GetNearestCity(player, plot)
	if city then
		-- print("ASQ_Xaragua_UA_UnitPrekill: Expended in city, adding WLTKD")
		local numWLTKD = city:GetWeLoveTheKingDayCounter()
		local numWLTKDTurns = (defineWLTKDTurns-numWLTKD)
		if numWLTKDTurns > 0 then
			city:ChangeWeLoveTheKingDayCounter(numWLTKDTurns)
			-- print("We Love the King Day!")
		end
	end
end

if bIsActive then
	GameEvents.UnitPrekill.Add(ASQ_Xaragua_UA_UnitPrekill)
end

----------------------------------------------------------------------------------------------------------------------------
-- UA: Gain Tekina points when adopting Beliefs, finishing Policy Trees, and reaching certain Population thresholds in a city
----------------------------------------------------------------------------------------------------------------------------
-- Stolen from Rosas Argentina
local specialistArtist = GameInfoTypes["SPECIALIST_ARTIST"]
local policyReformationID = GameInfoTypes["POLICY_REFORMATION"]

function ASQ_Xaragua_UA_PlayerAdoptPolicy(playerID, policyID)
	-- print("ASQ_Xaragua_UA_PlayerAdoptPolicy: Running")

	local pPlayer = Players[playerID]
	if (not pPlayer:IsAlive()) then return end
	if pPlayer:IsBarbarian() then return end
	
	if pPlayer:GetCivilizationType() ~= civilizationID then return end
	local policy = GameInfo.Policies[policyID]
	local policyBranchType = policy.PolicyBranchType
	local policyBranchFinisher = GameInfo.PolicyBranchTypes[policyBranchType].FreeFinishingPolicy
	local policyBranchFinisherID = GameInfoTypes[policyBranchFinisher]
	if (pPlayer:HasPolicy(policyBranchFinisherID)) or policyID == policyReformationID then
		-- print("ASQ_Xaragua_UA_PlayerAdoptPolicy: Player adopted branch finisher or Reformation policy")
		for city in pPlayer:Cities() do
			city:ChangeSpecialistGreatPersonProgressTimes100(specialistArtist, 5 * 100)
		end
	end
end

function ASQ_Xaragua_UA_SetPopulation(plotX, plotY, oldValue, newValue)
	-- print("ASQ_Xaragua_UA_SetPopulation: Running")
	local plot = Map.GetPlot(plotX, plotY)
	local pCity = plot:GetPlotCity()
	if not pCity then return end
	local iPlayer = pCity:GetOwner()
	local pPlayer = Players[iPlayer]
	if (not pPlayer:IsAlive()) then return end
	if pPlayer:IsBarbarian() then return end
	
	if pPlayer:GetCivilizationType() ~= civilizationID then return end
	if newValue % 5 == 0 and (newValue > oldValue) then
		-- print("ASQ_Xaragua_UA_SetPopulation: Population is multiple of 5")
		pCity:ChangeSpecialistGreatPersonProgressTimes100(specialistArtist, (newValue / 5) * 100)
	end
end

function ASQ_Xaragua_UA_PantheonFounded(iPlayer, iCity, iReligion, iBelief)
	-- print("ASQ_Xaragua_UA_PantheonFounded: Running")
	local pPlayer = Players[iPlayer]
	if (not pPlayer:IsAlive()) then return end
	if pPlayer:GetCivilizationType() ~= civilizationID then return end
	
	-- print("ASQ_Xaragua_UA_PantheonFounded: Adding bonuses")
	for city in pPlayer:Cities() do
		city:ChangeSpecialistGreatPersonProgressTimes100(specialistArtist, 5 * 100)
	end
end

function ASQ_Xaragua_UA_ReligionFounded(iPlayer, iCity, iReligion, iBelief1, iBelief2, iBelief3, iBelief4, iBelief5)
	-- print("ASQ_Xaragua_UA_ReligionFounded: Running")
	local pPlayer = Players[iPlayer]
	if (not pPlayer:IsAlive()) then return end
	if pPlayer:GetCivilizationType() ~= civilizationID then return end
	
	-- print("ASQ_Xaragua_UA_ReligionFounded: Adding bonuses")
	for city in pPlayer:Cities() do
		city:ChangeSpecialistGreatPersonProgressTimes100(specialistArtist, 5 * 100)
	end
end

function ASQ_Xaragua_UA_ReligionEnhanced(iPlayer, iCity, iReligion, iBelief1, iBelief2)
	-- print("ASQ_Xaragua_UA_ReligionEnhanced: Running")
	local pPlayer = Players[iPlayer]
	if (not pPlayer:IsAlive()) then return end
	if pPlayer:GetCivilizationType() ~= civilizationID then return end
	
	for city in pPlayer:Cities() do
		-- print("ASQ_Xaragua_UA_ReligionEnhanced: Adding bonuses")
		city:ChangeSpecialistGreatPersonProgressTimes100(specialistArtist, 5 * 100)
	end
end


if bIsActive then
	GameEvents.PlayerAdoptPolicy.Add(ASQ_Xaragua_UA_PlayerAdoptPolicy)
	GameEvents.SetPopulation.Add(ASQ_Xaragua_UA_SetPopulation)
	GameEvents.PantheonFounded.Add(ASQ_Xaragua_UA_PantheonFounded)
	GameEvents.ReligionFounded.Add(ASQ_Xaragua_UA_ReligionFounded)
	GameEvents.ReligionEnhanced.Add(ASQ_Xaragua_UA_ReligionEnhanced)
end

----------------------------------------------------------------------------------------------------------------------------
-- UU: May be expended to increase the yields of all existing Areitos in your empire
----------------------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------------------
-- The button code - adapted from Kipchaks, who are in turn adapted from TopHat's Cheyenne
------------------------------------------------------------------------------------------------------------------------
local pActivePlayer = Players[Game.GetActivePlayer()]
local domainLandID = GameInfoTypes["DOMAIN_LAND"]

function ASQ_Xaragua_UU_IsButtonPossible(pUnit)
	-- print("ASQ_Xaragua_UU_IsButtonPossible: Running...")
	-- To be possible, the unit must be a Tekina
	local pPlayer = Players[pUnit:GetOwner()]
	if pPlayer and pPlayer:GetCapitalCity() then
		if pUnit:GetUnitType() == unitTekinaID then
			-- print("ASQ_Xaragua_UU_IsButtonPossible: Tekina found!")
			return true
		
		end
	end
	-- print("ASQ_Xaragua_UU_IsButtonPossible: No condition satisfied, RETURNING FALSE")
	return false
end

function ASQ_Xaragua_UU_DoButtonEffect(pPlayer, pUnit)
	-- print("ASQ_Xaragua_UU_DoButtonEffect: Running...")
	local pPlot = pUnit:GetPlot()
	local iPlayer = pUnit:GetOwner() -- Should be fine but is a bit hacky
	local pPlayer = Players[iPlayer]
	local pCapital = pPlayer:GetCapitalCity()
	pCapital:SetNumRealBuilding(buildingAreitoBonusCountID, (pCapital:GetNumRealBuilding(buildingAreitoBonusCountID) + 1))
	pUnit:Kill()
	
	ASQ_Xaragua_PlayerCheck(iPlayer) -- TODO: Does this work
	
	-- TODO: Add visual effect/popup
end

function ASQ_Xaragua_UUUnit_UnitActionButton()
	-- print("ASQ_Xaragua_UUUnit_UnitActionButton: Running...")
	local pUnit = UI.GetHeadSelectedUnit();
	ASQ_Xaragua_UU_DoButtonEffect(pActivePlayer, pUnit)
end

function ASQ_Xaragua_UUUnit_SerialEventUnitInfoDirty()
	-- print("ASQ_Xaragua_UUUnit_SerialEventUnitInfoDirty: Running...")
	local pUnit = UI.GetHeadSelectedUnit();
	if (not pUnit) then return end
	if ASQ_Xaragua_UU_IsButtonPossible(pUnit) then
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

function ASQ_Xaragua_UUUnit_UpdateUnitInfoPanel()
	-- print("ASQ_Xaragua_UUUnit_UpdateUnitInfoPanel: Running...")
	if (not OptionsManager.GetSmallUIAssets()) then
		Controls.UnitActionButton:SetSizeVal(50,50)
		Controls.UnitActionIcon:SetSizeVal(64,64)
		Controls.UnitActionIcon:SetTexture("UnitActions360.dds")
	else
		Controls.UnitActionButton:SetSizeVal(36,36)
		Controls.UnitActionIcon:SetSizeVal(45,45)
		Controls.UnitActionIcon:SetTexture("UnitActions360.dds")
	end
	Controls.UnitActionIcon:LocalizeAndSetToolTip("TXT_KEY_ASQ_XARAGUA_ENHANCE_AREITO_TOOLTIP")
	Controls.UnitActionButton:ChangeParent(ContextPtr:LookUpControl("/InGame/WorldView/UnitPanel/PrimaryStack"))
end

function ASQ_Xaragua_UU_AI_DoTurn(playerID)
	-- print("ASQ_Xaragua_UU_AI_DoTurn: Running...")
	local pPlayer = Players[playerID]
	if (pPlayer:GetCivilizationType() == civilizationID) then
		-- print("ASQ_Xaragua_UU_AI_DoTurn: Civilization is ASQ_Xaragua_UU")
		if (not pPlayer:IsHuman()) then
			-- print("ASQ_Xaragua_UU_AI_DoTurn: ASQ_Xaragua_UU is AI player")
			for pUnit in pPlayer:Units() do
				if ASQ_Xaragua_UU_IsButtonPossible(pUnit) then
				
					local iRand = JFD_GetRandom(1, 4)
					if iRand == 4 then	
						-- print("ASQ_Xaragua_UU_AI_DoTurn: Decided to send off unit")
						ASQ_Xaragua_UU_DoButtonEffect(pPlayer, pUnit)
					end
				end
			end
		end
	end
	
end

local function Initialize()	
	Events.LoadScreenClose.Add(ASQ_Xaragua_UUUnit_UpdateUnitInfoPanel);
	Events.SerialEventUnitInfoDirty.Add(ASQ_Xaragua_UUUnit_SerialEventUnitInfoDirty);
end

Controls.UnitActionButton:RegisterCallback(Mouse.eLClick, ASQ_Xaragua_UUUnit_UnitActionButton);
IconHookup(54, 45, "UNIT_ACTION_ATLAS", Controls.UnitActionIcon)
GameEvents.PlayerDoTurn.Add(ASQ_Xaragua_UU_AI_DoTurn)
Initialize();

--------------------------------------------------------------
-- The Areito bonus effects code -- adapted from Chrisy15 and Vice Virtuoso's code in Emerald's Thayae Khittaya (the two Pomo_ functions are my own)
--------------------------------------------------------------
local bPopup

local tAreitos = {}
for row in DB.Query("SELECT ID FROM GreatWorks WHERE Type LIKE 'GREAT_WORK_ASQ_AREITO_%'") do
	tAreitos[row.ID] = true
end

local tGreatWorkBuildings = {}
for row in DB.Query("SELECT ID, BuildingClass, GreatWorkCount FROM Buildings WHERE GreatWorkCount > 0 AND GreatWorkSlotType = 'GREAT_WORK_SLOT_MUSIC'") do
	tGreatWorkBuildings[row.ID] = {Class = GameInfoTypes[row.BuildingClass], SlotCount = row.GreatWorkCount}
end
-----------------------------------
--C15_CountNumAreitosInCity
--Credit to Vice Virtuouso 
-----------------------------------
function C15_CountNumAreitosInCity(pCity) 
	-- print("C15_CountNumAreitosInCity: Running")
	local iCount = 0
	for k, v in pairs(tGreatWorkBuildings) do
		if pCity:IsHasBuilding(k) then
			for i = 0, v.SlotCount - 1 do
				local iWork = pCity:GetBuildingGreatWork(v.Class, i)
				if tAreitos[Game.GetGreatWorkType(iWork)] then
					iCount = iCount + 1
				end
			end
		end
	end
	-- print("C15_CountNumAreitosInCity: " .. iCount)
	return iCount
end
-----------------------------------
--ASQ_Xaragua_PlayerCheck
-----------------------------------
function ASQ_Xaragua_PlayerCheck(playerID)
	-- print("ASQ_Xaragua_PlayerCheck: Running")
	local pPlayer = Players[playerID]
	if pPlayer:GetCivilizationType() ~= civilizationID then return end
	local pCapital = pPlayer:GetCapitalCity()
	if not pCapital then return end

	for i = 0, iPracticalNumCivs, 1 do
		local pOtherPlayer = Players[i]
		if pOtherPlayer and (not pOtherPlayer:IsMinorCiv()) and (not pOtherPlayer:IsBarbarian()) then
			local pOtherCapital = pOtherPlayer:GetCapitalCity()
			for pCity in pOtherPlayer:Cities() do
				local iNumAreitos = C15_CountNumAreitosInCity(pCity)
				local iNumAreitoBonuses = pOtherCapital:GetNumRealBuilding(buildingAreitoBonusCountID)
				-- print("ASQ_Xaragua_PlayerCheck: iNumAreitos is " .. iNumAreitos)
				-- print("ASQ_Xaragua_PlayerCheck: iNumAreitoBonuses is " .. iNumAreitoBonuses)
				pCity:SetNumRealBuilding(buildingAreitoID, iNumAreitos)
				pCity:SetNumRealBuilding(buildingAreitoBonusID, (iNumAreitos * iNumAreitoBonuses))
			end
		end
	end
end

GameEvents.PlayerDoTurn.Add(ASQ_Xaragua_PlayerCheck)

-- UI Popup events all ~~stolen~~ inspired by Vice Virtuouso
-----------------------------------
-- C15_AreitoUI
--Check all of a player's buildings when CultureOverview is updated (swapping Great Works around), and update the ~~Logia~~ ~~Emerlad~~ Orange bonus buildings accordingly
-----------------------------------
function C15_AreitoUI()
	-- print("C15_AreitoUI: Running")
	if not bPopup then
		return
	end
	local iPlayer = Game.GetActivePlayer()
	ASQ_Xaragua_PlayerCheck(iPlayer)
end
Events.SerialEventCityInfoDirty.Add(C15_AreitoUI)	

-----------------------------------
--C15_Areito_SetCurrentPopup
--When a popup screen appears, check if it is CultureOverview. If so, set bPopup to true, which lets ~~UpdateLostLogiaBuildingsUI()~~ ~~C15_GreatCraftsPlayerCheck~~ C15_GreatBasketPlayerCheck fire
-----------------------------------
function C15_Areito_SetCurrentPopup(popupInfo)
	-- print("C15_Areito_SetCurrentPopup: Running")
	local popupType = popupInfo.Type
	if popupType == ButtonPopupTypes.BUTTONPOPUP_CULTURE_OVERVIEW then
		bPopup = true
	end
end
Events.SerialEventGameMessagePopup.Add(C15_Areito_SetCurrentPopup)
-----------------------------------
--C15_Areito_Popup
-----------------------------------
function C15_Areito_Popup( popupInfo )
	-- print("C15_Areito_Popup: Running")
	if( popupInfo.Type ~= ButtonPopupTypes.BUTTONPOPUP_GREAT_WORK_COMPLETED_ACTIVE_PLAYER ) then
		return;
	end
	local iPlayer = Game.GetActivePlayer()
	ASQ_Xaragua_PlayerCheck(iPlayer)
end
Events.SerialEventGameMessagePopup.Add(C15_Areito_Popup)
-----------------------------------
--C15_Areito_ClearCurrentPopup
--When a popup is closed, delete bPopup so it doesn't keep refreshing ~~Logia~~ Emerlad buildings when CultureOverview isn't open
-----------------------------------
function C15_Areito_ClearCurrentPopup()
	-- print("C15_Areito_ClearCurrentPopup: Running")
	bPopup = nil;
end
Events.SerialEventGameMessagePopupProcessed.Add(C15_Areito_ClearCurrentPopup)

----------------------------------------------------------------------------------------------------------------------------
-- UB: +1 Culture for every 5 Population in the city
----------------------------------------------------------------------------------------------------------------------------
local buildingBateyDummyID = GameInfoTypes["BUILDING_ASQ_BATEY_DUMMY"]
function ASQ_Xaragua_UB_PlayerDoTurn(playerID)
	-- print("ASQ_Xaragua_UB_PlayerDoTurn: Running")
	local player = Players[playerID];
    if (player:IsAlive() and player:GetCivilizationType() == civilizationID) then 
		for city in player:Cities() do
			if city:IsHasBuilding(buildingBateyID) then
				local cityPopulation = city:GetPopulation()
				local cultureBoost = math.floor(cityPopulation / 5)
				-- print("ASQ_Xaragua_UB_PlayerDoTurn: cultureBoost is " .. cultureBoost)
				city:SetNumRealBuilding(buildingBateyDummyID, cultureBoost)
			end	
		end
	end
end

if bIsActive then
	GameEvents.PlayerDoTurn.Add(ASQ_Xaragua_UB_PlayerDoTurn)
end

-- print("Xaragua_Functions.lua loaded!")