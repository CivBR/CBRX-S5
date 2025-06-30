-- this file is a lightly modified version of TopHat's Sassanids code, which was in turn sledgehammered together from the code JFD wrote for Uighur_Caesar's Cuba under Batista
--==========================================================================================================================
-- INCLUDES
--==========================================================================================================================
include("IconSupport.lua")
include("InfoTooltipInclude.lua")
include("PlotIterators.lua")
include("FLuaVector.lua")
--==========================================================================================================================
-- GLOBALS
--==========================================================================================================================
----------------------------------------------------------------------------------------------------------------------------
-- These are just basic global variables
local g_ConvertTextKey  		= Locale.ConvertTextKey
local g_MapGetPlot				= Map.GetPlot
local g_MathCeil				= math.ceil
local g_MathFloor				= math.floor
local g_MathMax					= math.max
local g_MathMin					= math.min
				
local Players 					= Players
local HexToWorld 				= HexToWorld
local ToHexFromGrid 			= ToHexFromGrid
local Teams 					= Teams

local activePlayerID			= Game.GetActivePlayer()
local activePlayer				= Players[activePlayerID]
local activeTeamID				= activePlayer:GetTeam()
local activeTeam				= Teams[activeTeamID]
----------------------------------------------------------------------------------------------------------------------------
local iCiv = GameInfoTypes["CIVILIZATION_ASQ_SCOTLAND_MARY"]
local buildingPlotCountID = GameInfoTypes["BUILDING_ASQ_SCOTLAND_PLOTCOUNT"]
local buildingPlotCooldownID = GameInfoTypes["BUILDING_ASQ_SCOTLAND_PLOT_COOLDOWN"]
local plotFaithCost = 100 -- Play with this value!
local basePlotIncrease = 50
local cooldownTime = 10 -- Play with this value!
local civilizationBarbarianID = 63
--==========================================================================================================================
-- UTILITIES
--==========================================================================================================================
-- UTILITIES
----------------------------------------------------------------------------------------------------------------------------
--JFD_GetRandom
function JFD_GetRandom(lower, upper)
	return Game.Rand((upper + 1) - lower, "") + lower
end
------------------------------------------------------------------------------------------------------------------------
--Player_SendWorldEvent
local notificationWorldEventID = NotificationTypes["NOTIFICATION_DIPLOMACY_DECLARATION"]
function Player_SendWorldEvent(player, description, includeHuman)
	print("Sending World Event: ", description)
	local playerTeam = Teams[player:GetTeam()]
	if (not includeHuman) and player:IsHuman() then return end
	if (not playerTeam:IsHasMet(activeTeamID)) then return end
	activePlayer:AddNotification(notificationWorldEventID, description, "[COLOR_POSITIVE_TEXT]World Events[ENDCOLOR]", -1, -1)
end 
-------------------------------------------------------------------------------------------------------------------------
--Player_SendNotification
function Player_SendNotification(player, notificationType, description, descriptionShort, global, data1, data2, buildingID, data3, metOnly, includesSerialMessage)
	local notificationID = NotificationTypes[notificationType]
	local teamID = player:GetTeam()
	local data1 = data1 or -1
	local data2 = data2 or -1
	local buildingID = buildingID or -1
	local data3 = data3 or -1
	if global then
		if (metOnly and activeTeam:IsHasMet(teamID) or (not metOnly)) then
			activePlayer:AddNotification(notificationID, description, descriptionShort, data1, data2, buildingID, data3)
			if (includesSerialMessage and description) then Events.GameplayAlertMessage(description) end
		end
	else
		if (not player:IsHuman()) then return end
		if (metOnly and activeTeam:IsHasMet(teamID) or (not metOnly)) then
			activePlayer:AddNotification(notificationID, description, descriptionShort, data1, data2, buildingID, data3)
			if (includesSerialMessage and description) then Events.GameplayAlertMessage(description) end
		end
	end
end   
-------------------------------------------------------------------------------------------------------------------------
-- --g_JFD_GlobalUserSettings_Table
-- --print("Checkpoint 4")
-- local g_JFD_GlobalUserSettings_Table = {}
-- for row in DB.Query("SELECT Type, Value FROM JFD_GlobalUserSettings;") do 	
	-- g_JFD_GlobalUserSettings_Table[row.Type] = row.Value
-- end

-- --Game_GetUserSetting
-- function Game_GetUserSetting(type)
	-- return g_JFD_GlobalUserSettings_Table[type]
-- end
--print("Checkpoint 5")
----------------------------------------------------------------------------------------------------------------------------
-- Check for whether the player can validly plot in the city
function Player_CanPlotInCity(playerID, pCity)
	-- print("Player_CanPlotInCity: Running")
    local pPlayer = Players[playerID]
	local pCapital = pPlayer:GetCapitalCity()
    if pCity:GetReligiousMajority() > 0 then
		local plotModifier = pCapital:GetNumRealBuilding(buildingPlotCountID)
		if pPlayer:GetFaith() >= (plotFaithCost + (basePlotIncrease * plotModifier)) then
			if pCapital and not pCapital:IsHasBuilding(buildingPlotCooldownID) then
				return true
			end
		end
	end
    return false
end
--==========================================================================================================================
-- CORE FUNCTIONS
--==========================================================================================================================
--lets the AI use mrauk u faith purchases
--print("Checkpoint 10")
local function ASQ_ScotlandMary_AI_FaithPurchase(playerID)
	local pPlayer = Players[playerID]
	local pTeam = Teams[pPlayer:GetTeam()]
	if pPlayer:IsBarbarian() then return end
	if pPlayer:IsMinorCiv() then return end
	if pPlayer:IsHuman() then return end
	if (not pPlayer:IsAlive()) then return end
	if (pPlayer:GetCivilizationType() ~= iCiv) then return end
	if (Game.GetNumReligionsStillToFound() > 0) and (not pPlayer:HasCreatedReligion()) then return end
	local capital = pPlayer:GetCapitalCity()
	if (not capital) then return end
	
	--local natWondersTable = g_JFD_NationalWonders_Table
	--local numNatWonders = #natWondersTable
	local basePlotOdds = 10
	local hasPlottedEnemy = false
	for city in pPlayer:Cities() do
		local canPlot = Player_CanPlotInCity(playerID, city)
		if canPlot then
			-- 
			local cityReligion = city:GetReligiousMajority()
			if cityReligion > 0 then
				local plotOdds = basePlotOdds
				local pHolyCity = Game.GetHolyCityForReligion(cityReligion, -1)
				local iReligionOwner = pHolyCity:GetOwner()
				local pReligionOwner = Players[iReligionOwner]
				if playerID ~= iReligionOwner then
					if pTeam:IsAtWar(Teams[pReligionOwner]) then
						plotOdds = basePlotOdds + 20
					else
						plotOdds = basePlotOdds - 5
					end
				end
				
				local iFaith = pPlayer:GetFaith()
				local plotModifier = capital:GetNumRealBuilding(buildingPlotCountID)
				if (iFaith >= 2* (plotFaithCost + (basePlotIncrease * plotModifier))) then
					if JFD_GetRandom(1, 100) < plotOdds then
						ScotlandMary_UA_Plot_DoEffect(playerID, city)
					end
				end
				
			end
		end
	
	end
			
end
GameEvents.PlayerDoTurn.Add(ASQ_ScotlandMary_AI_FaithPurchase)

local function ScotlandMary_GetMainReligion(pPlayer)
	if pPlayer:HasCreatedReligion() then
		return pPlayer:GetReligionCreatedByPlayer()
	end
	if pPlayer:GetCapitalCity() then
		return pPlayer:GetCapitalCity():GetReligiousMajority()
	end
	return -1
end

function GetStrongestMilitaryUnit(pPlayer, bIgnoreResources, ...)
	local tUnit = {["ID"] = GameInfoTypes.UNIT_WARRIOR, ["Combat"] = -1}
	for iKey, sCombatType in pairs({...}) do
		for row in GameInfo.Units("CombatClass = \'" .. sCombatType .. "\'") do
			if pPlayer:CanTrain(row.ID, bIgnoreResources) and row.Combat > tUnit.Combat then
				tUnit = row
			end
		end
	end
	return tUnit.ID
end

local defineWLTKDTurns = GameDefines["CITY_RESOURCE_WLTKD_TURNS"]
local function ScotlandMary_UA_Plot_DoEffect(playerID, pCity)
	local pPlayer = Players[playerID]
	local pCapital = pPlayer:GetCapitalCity()
	local pMainReligion = ScotlandMary_GetMainReligion(pPlayer)
	local cityReligion = pCity:GetReligiousMajority()
	
	if pCapital then
		if cityReligion > 0 then
		
			if cityReligion == pMainReligion then
				local numWLTKD = pCity:GetWeLoveTheKingDayCounter()
				local numWLTKDTurns = (defineWLTKDTurns-numWLTKD)
				if numWLTKDTurns > 0 then
					pCity:ChangeWeLoveTheKingDayCounter(numWLTKDTurns)
				end
			else
				-- Spawn Rebels around the target religion's Holy City
				local pHolyCity = Game.GetHolyCityForReligion(cityReligion, -1)
				local pHolyCityPlot = pHolyCity:Plot()
				local pReligionOwner = Players[pHolyCity:GetOwner()]
				local playerBarbarianID = Players[civilizationBarbarianID]
				local iRebelUnitType = GetStrongestMilitaryUnit(pReligionOwner, true, "UNITCOMBAT_MELEE")
				local barbsSpawned = false
				for adjacentPlot in PlotAreaSweepIterator(pHolyCityPlot, 2, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
					if adjacentPlot and (not adjacentPlot:IsCity()) and adjacentPlot:GetNumUnits() == 0 then
						if JFD_GetRandom(1, 100) > 50 then -- This is not very good since it's not a truly random plot but it means there's a 10% chance to spawn on each plot until one succeeds
							-- print("ScotlandMary_UA_Plot_DoEffect: Spawning Rebels")
							local iNewUnit = playerBarbarianID:InitUnit(iRebelUnitType, adjacentPlot:GetX(), adjacentPlot:GetY())
							iNewUnit:JumpToNearestValidPlot() -- Since the plot might have a unit on it already, we just jump to the nearest valid plot
							
							-- Spawning additional units around new unit (since Rebels come in groups of 4)
							local newUnitPlot = iNewUnit:GetPlot()
							
							local iNewUnit2 = playerBarbarianID:InitUnit(iRebelUnitType, newUnitPlot:GetX(), newUnitPlot:GetY())
							iNewUnit2:JumpToNearestValidPlot()
							
							local iNewUnit3 = playerBarbarianID:InitUnit(iRebelUnitType, newUnitPlot:GetX(), newUnitPlot:GetY())
							iNewUnit3:JumpToNearestValidPlot()

							local iNewUnit4 = playerBarbarianID:InitUnit(iRebelUnitType, newUnitPlot:GetX(), newUnitPlot:GetY())
							iNewUnit4:JumpToNearestValidPlot()
							
							barbsSpawned = true
							break
						end
					end
				end
				
				if (not barbsSpawned) then -- Hacky solution to hopefully prevent not getting barbs
				
					for adjacentPlot in PlotAreaSweepIterator(pHolyCityPlot, 1, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
						if adjacentPlot and (not adjacentPlot:IsCity()) and adjacentPlot:GetNumUnits() == 0 then
							-- print("ScotlandMary_UA_Plot_DoEffect: Spawning Rebels")
							local iNewUnit = playerBarbarianID:InitUnit(iRebelUnitType, adjacentPlot:GetX(), adjacentPlot:GetY())
							iNewUnit:JumpToNearestValidPlot() -- Since the plot might have a unit on it already, we just jump to the nearest valid plot
							
							-- Spawning additional units around new unit (since Rebels come in groups of 3)
							local newUnitPlot = iNewUnit:GetPlot()
							
							local iNewUnit2 = playerBarbarianID:InitUnit(iRebelUnitType, newUnitPlot:GetX(), newUnitPlot:GetY())
							iNewUnit2:JumpToNearestValidPlot()
							
							local iNewUnit3 = playerBarbarianID:InitUnit(iRebelUnitType, newUnitPlot:GetX(), newUnitPlot:GetY())
							iNewUnit3:JumpToNearestValidPlot()

							local iNewUnit4 = playerBarbarianID:InitUnit(iRebelUnitType, newUnitPlot:GetX(), newUnitPlot:GetY())
							iNewUnit4:JumpToNearestValidPlot()
							
							barbsSpawned = true
							break
						end
					end
				end
			end
			pCapital:SetNumRealBuilding(buildingPlotCooldownID, cooldownTime)
			local plotModifier = pCapital:GetNumRealBuilding(buildingPlotCountID) + 1
			pCapital:SetNumRealBuilding(buildingPlotCountID, plotModifier)
			pPlayer:ChangeFaith(-1 * (plotFaithCost + (basePlotIncrease * plotModifier)))
		end
	end
end
--print("Checkpoint 11")
--==========================================================================================================================
-- UI FUNCTIONS
--==========================================================================================================================
-- GLOBALS
--------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------
-- FUNCTIONS
--------------------------------------------------------------------------------------------------------------------------
local isCityViewOpen = false

--UI_UpdateButton
--Updates the position of the city view button
function UI_UpdateButton()
	print("UI_UpdateButton: Running")
	Controls.MainBox:SetHide(true) -- Hides the box that holds the button?
	Controls.Button:SetDisabled(true) -- Disables the button
	Controls.Button:LocalizeAndSetToolTip(nil) -- Removes tooltip from button?
	if (activePlayer:GetCivilizationType() ~= iCiv) then return end -- Skip function if another player is active
	
	local city = UI.GetHeadSelectedCity() -- Gets reference to currently selected city
	if (not city) then return end -- Skip function if there's no selected city
	Controls.MainBox:SetHide(false) -- Un-hides the box that holds the button, showing the button
	
	local canPlot = Player_CanPlotInCity(activePlayerID, city) -- Checks and stores whether the player can carry out a plot in the city
	Controls.Button:SetText(g_ConvertTextKey("TXT_KEY_ASQ_SCOTLAND_MARY_PLOT")) -- Sets the text of the button?
	Controls.Button:LocalizeAndSetToolTip("TXT_KEY_ASQ_SCOTLAND_MARY_PLOT_TT") -- Sets the tooltip of the button explaining what it does?
	Controls.Button:SetDisabled(not canPlot) -- Enables or disables the button based on whether the player can plot
	if (not canPlot) then
		Controls.Button:LocalizeAndSetToolTip("TXT_KEY_ASQ_SCOTLAND_MARY_PLOT_TT_DISABLED") -- Sets the tooltip of the button to explain the player can't use it
	end
end
----------------------------------------------------------------
--UI_ConfirmYes
function UI_ConfirmYes()
	Controls.ConfirmBox:SetHide(true)
	local city = UI.GetHeadSelectedCity()
	if (not city) then return end
	-- Everything below this point fires when the player confirms they want to conduct a plot
	ScotlandMary_UA_Plot_DoEffect(activePlayerID, city)
	Events.AudioPlay2DSound("AS2D_INTERFACE_CITY_SCREEN_PURCHASE")
	Events.SerialEventExitCityScreen()
	local hex = ToHexFromGrid(Vector2(city:GetX(), city:GetY()))
	Events.GameplayFX(hex.x, hex.y, -1) 
end
Controls.ConfirmYes:RegisterCallback(Mouse.eLClick, UI_ConfirmYes)
----------------------------------------------------------------
--UI_ConfirmNo
function UI_ConfirmNo()
	Controls.ConfirmBox:SetHide(true)
end
Controls.ConfirmNo:RegisterCallback(Mouse.eLClick, UI_ConfirmNo)
------------------------------------------------------------------------------------------------------------------------
--UI_ConfirmButton
print("Checkpoint 13")
function UI_ConfirmButton()
	local city = UI.GetHeadSelectedCity()
	if (not city) then return end
	Controls.ConfirmBox:SetHide(false);
	local pPlayer = Players[city:GetOwner()]
	local pCapital = pPlayer:GetCapitalCity()
	local plotModifier = pCapital:GetNumRealBuilding(buildingPlotCountID)
	Controls.ConfirmLabel:LocalizeAndSetText("TXT_KEY_ASQ_SCOTLAND_MARY_PLOT_POPUP_CONFIRM", city:GetName(), (plotFaithCost + (basePlotIncrease * plotModifier)))
end
Controls.Button:RegisterCallback(Mouse.eLClick, UI_ConfirmButton)
--------------------------------------------------------------------------------------------------------------------------
--UI_SerialEventEnterCityScreen
function UI_SerialEventEnterCityScreen()
	isCityViewOpen = true
	UI_UpdateButton()
end
Events.SerialEventEnterCityScreen.Add(UI_SerialEventEnterCityScreen)
--------------------------------------------------------------------------------------------------------------------------
--UI_SerialEventExitCityScreen
function UI_SerialEventExitCityScreen()
	isCityViewOpen = false
	UI_UpdateButton()
end
Events.SerialEventExitCityScreen.Add(UI_SerialEventExitCityScreen)
--------------------------------------------------------------------------------------------------------------------------
--UI_SerialEventCityScreenDirty
function UI_SerialEventCityScreenDirty()
	if (not isCityViewOpen) then return end
	UI_UpdateButton()
end
Events.SerialEventCityScreenDirty.Add(UI_SerialEventCityScreenDirty)
Events.SerialEventCityInfoDirty.Add(UI_SerialEventCityScreenDirty)
--==========================================================================================================================
--==========================================================================================================================

----------------------------------------------------------------------------------------------------------------------------

print("ASQ_ScotlandMary_PlotButton.lua loaded!")