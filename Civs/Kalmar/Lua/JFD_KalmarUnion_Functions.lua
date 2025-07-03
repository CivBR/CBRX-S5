-- JFD_KalmarUnion_Functions
-- Author: JFD
-- DateCreated: 5/4/2014 12:54:31 AM
--==========================================================================================================================
-- INCLUDES
--==========================================================================================================================
include("JFD_KalmarUnion_Utils.lua")
include("PlotIterators.lua")
--==========================================================================================================================
-- UTILITY FUNCTIONS
--==========================================================================================================================
-- GLOBALS
----------------------------------------------------------------------------------------------------------------------------
--IsCPDLL
function IsCPDLL()
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if mod.ID == "d1b6328c-ff44-4b0d-aad7-c657f83610cd" then
			return true
		end
	end
	return false
end
local isCPDLL = IsCPDLL()

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
--==========================================================================================================================
-- UNIQUE FUNCTIONS
--==========================================================================================================================
-- GLOBAL
----------------------------------------------------------------------------------------------------------------------------
local activePlayerID = Game.GetActivePlayer()
local activePlayer	 = Players[activePlayerID]
local mathCeil		 = math.ceil
----------------------------------------------------------------------------------------------------------------------------
-- THE NORDIC CROWNS
----------------------------------------------------------------------------------------------------------------------------
local traitKalmarUnionID = GameInfoTypes["TRAIT_JFD_KALMAR_UNION"]
--JFD_KalmarUnion_NordicCrowns_DoTurn
local buildingTradeLengthID = GameInfoTypes["BUILDING_JFD_KALMAR_UNION_TRADE_LENGTH"]
local buildingTradeRouteID  = GameInfoTypes["BUILDING_JFD_KALMAR_UNION_TRADE_ROUTE"]
local techGuildsID		    = GameInfoTypes["TECH_GUILDS"]
function JFD_KalmarUnion_NordicCrowns_DoTurn(playerID)
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	if (not HasTrait(player, traitKalmarUnionID)) then return end
	for minorPlayerID = 0, GameDefines.MAX_MINOR_CIVS - 1 do
		local minorPlayer = Players[minorPlayerID]
		if (minorPlayer:IsAlive() and minorPlayer:IsMinorCiv()) then
			local capital = minorPlayer:GetCapitalCity()
			local kalmarUnionRate = JFD_GetKalmarUnionRate(playerID, minorPlayerID)
			if kalmarUnionRate ~= 0 then
				JFD_ChangeKalmarUnionCounter(playerID, minorPlayerID, capital, kalmarUnionRate)
			end
		end
	end
	local capital = player:GetCapitalCity()
	if (not capital) then return end
	if (not capital:IsHasBuilding(buildingTradeLengthID)) then
		capital:SetNumRealBuilding(buildingTradeLengthID, 1)
	end
	if Teams[player:GetTeam()]:IsHasTech(techGuildsID) then
		if (not capital:IsHasBuilding(buildingTradeRouteID)) then
			capital:SetNumRealBuilding(buildingTradeRouteID, 1)
		end
	end
end
GameEvents.PlayerDoTurn.Add(JFD_KalmarUnion_NordicCrowns_DoTurn)

--JFD_KalmarUnion_NordicCrowns_TeamTechResearched
function JFD_KalmarUnion_NordicCrowns_TeamTechResearched(teamID, techID)
	local player = Players[Teams[teamID]:GetLeaderID()]
	if (not HasTrait(player, traitKalmarUnionID)) then return end
	if techID ~= techGuildsID then return end
	player:GetCapitalCity():SetNumRealBuilding(buildingTradeRouteID, 1)
end
GameEvents.TeamTechResearched.Add(JFD_KalmarUnion_NordicCrowns_TeamTechResearched)

--JFD_KalmarUnion_NordicCrowns_CityStateJoinedUnion
local buildingCourthouseID = GameInfoTypes["BUILDING_JFD_KALMAR_UNION_COURTHOUSE"]
function JFD_KalmarUnion_NordicCrowns_CityStateJoinedUnion(playerID, minorPlayerID, plotX, plotY)
	local player = Players[playerID]
	local minorPlayer = Players[minorPlayerID]
	for city in minorPlayer:Cities() do
		print(city:GetName())
		player:AcquireCity(city, false, true)
		local cityX = city:GetX()
		local cityY = city:GetY()
		local newCity = Map.GetPlot(cityX, cityY):GetPlotCity()
		newCity:ChangeResistanceTurns(-newCity:GetResistanceTurns())
		newCity:SetNumRealBuilding(buildingCourthouseID, 1)
	end
	if player:IsHuman() then
		JFD_SendNotification(playerID, "NOTIFICATION_CAPITAL_RECOVERED", Locale.ConvertTextKey("TXT_KEY_JFD_CITY_STATE_JOINS_KALMAR_UNION_NOTIFICATION", minorPlayer:GetName()), Locale.ConvertTextKey("TXT_KEY_JFD_CITY_STATE_JOINS_KALMAR_UNION_NOTIFICATION_SHORT", minorPlayer:GetName()), false, plotX, plotY)
		JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_CITY_STATE_JOINS_KALMAR_UNION", minorPlayer:GetName(), player:GetName(), player:GetCivilizationDescription()))
		Events.AudioPlay2DSound("AS2D_SOUND_JFD_KALMAR_UNION")
	end
end
LuaEvents.JFD_CityStateJoinedKalmarUnion.Add(JFD_KalmarUnion_NordicCrowns_CityStateJoinedUnion)
----------------------------------------------------------------------------------------------------------------------------
-- GUN HOLK
----------------------------------------------------------------------------------------------------------------------------
--JFD_KalmarUnion_GunHolk_CityTrained
local unitCargoShipID = GameInfoTypes["UNIT_CARGO_SHIP"]
local unitGunHolkID   = GameInfoTypes["UNIT_JFD_GUN_HOLK"]
function JFD_KalmarUnion_GunHolk_CityTrained(playerID, cityID, unitID)
    local player = Players[playerID];
    if (not HasTrait(player, traitKalmarUnionID)) then return end
    local unit = player:GetUnitByID(unitID)
	if unit:GetUnitType() ~= unitCargoShipID then return end
	local city = player:GetCityByID(cityID)
	if player:CanTrain(unitGunHolkID, true, true, false) then
		player:InitUnit(unitGunHolkID, city:GetX(), city:GetY())
	end
end
GameEvents.CityTrained.Add(JFD_KalmarUnion_GunHolk_CityTrained)
----------------------------------------------------------------------------------------------------------------------------
-- KOBSTAD
----------------------------------------------------------------------------------------------------------------------------
--JFD_KalmarUnion_Kobstad_DoTurn
local buildingKobstadID		    = GameInfoTypes["BUILDING_JFD_KOBSTAD"]
local buildingKobstadGoldID     = GameInfoTypes["BUILDING_JFD_KOBSTAD_GOLD"]
local improvementCustomsHouseID = GameInfoTypes["IMPROVEMENT_CUSTOMS_HOUSE"]
local improvementTradingPostID  = GameInfoTypes["IMPROVEMENT_TRADING_POST"]
function JFD_KalmarUnion_Kobstad_DoTurn(playerID)
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	for city in player:Cities() do
		if city:IsHasBuilding(buildingKobstadID) then
			local numTradingPosts = 0 
			local cityPlot = Map.GetPlot(city:GetX(), city:GetY())
			for loopPlot in PlotAreaSweepIterator(cityPlot, 3, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
				if (loopPlot:GetImprovementType() == improvementTradingPostID and city:IsWorkingPlot(loopPlot)) then
					numTradingPosts = numTradingPosts + 1
				elseif (loopPlot:GetImprovementType() == improvementCustomsHouseID and city:IsWorkingPlot(loopPlot)) then
					numTradingPosts = numTradingPosts + 1
				end
			end
			city:SetNumRealBuilding(buildingKobstadGoldID, numTradingPosts)
		else
			city:SetNumRealBuilding(buildingKobstadGoldID, 0)
		end
	end
end
if (not isCPDLL) then
	GameEvents.PlayerDoTurn.Add(JFD_KalmarUnion_Kobstad_DoTurn)
end
--==========================================================================================================================
-- UI FUNCTIONS
--==========================================================================================================================
-- INCLUDES
----------------------------------------------------------------------------------------------------------------------------
include("EUI_utilities")
----------------------------------------------------------------------------------------------------------------------------
-- GLOBAL
----------------------------------------------------------------------------------------------------------------------------
local isUsingEUI = false
local eUIOffset = -40
----------------------------------------------------------------------------------------------------------------------------
-- THE NORDIC CROWNS
----------------------------------------------------------------------------------------------------------------------------
--JFD_KalmarUnion_OnEnterCityScreen
function JFD_KalmarUnion_OnEnterCityScreen()
	if HasTrait(activePlayer, traitKalmarUnionID) then
		Controls.MainGrid:SetHide(true)
	end
end
Events.SerialEventEnterCityScreen.Add(JFD_KalmarUnion_OnEnterCityScreen)
 
--JFD_KalmarUnion_OnExitCityScreen
function JFD_KalmarUnion_OnExitCityScreen()
	if HasTrait(activePlayer, traitKalmarUnionID) then
		Controls.MainGrid:SetHide(false)
	end
end
Events.SerialEventExitCityScreen.Add(JFD_KalmarUnion_OnExitCityScreen)
 
--JFD_KalmarUnion_ActivePlayerTurnStart
function JFD_KalmarUnion_ActivePlayerTurnStart()
    if (not HasTrait(activePlayer, traitKalmarUnionID)) then return end
    if activePlayer:GetNumCities() == 0 then return end
    local isHidden = Controls.MainGrid:IsHidden()
    local currentOffset = Controls.MainGrid:GetOffsetY()
    if isUsingEUI and currentOffset ~= eUIOffset then
        Controls.MainGrid:SetOffsetY(eUIOffset)
    end
    if isHidden then Controls.MainGrid:SetHide(false) end
    Controls.LabelText:LocalizeAndSetToolTip("TXT_KEY_JFD_KALMAR_UNION_CITY_VIEW_HELP", JFD_GetKalmarUnionList(activePlayerID))
end
Events.ActivePlayerTurnStart.Add(JFD_KalmarUnion_ActivePlayerTurnStart)

--JFD_KalmarUnion_SequenceGameInitComplete
function JFD_KalmarUnion_SequenceGameInitComplete()
    if (not HasTrait(activePlayer, traitKalmarUnionID)) then return end
	if ContextPtr:LookUpControl("/InGame/TopPanel/ClockOptionsPanel") then
		isUsingEUI = true
		Controls.MainGrid:SetOffsetY(eUIOffset)
	end
	local isHidden = Controls.MainGrid:IsHidden()
	if isHidden then Controls.MainGrid:SetHide(false) end
	Controls.LabelText:LocalizeAndSetToolTip("TXT_KEY_JFD_KALMAR_UNION_CITY_VIEW_HELP", JFD_GetKalmarUnionList(activePlayerID))
end
Events.SequenceGameInitComplete.Add(JFD_KalmarUnion_SequenceGameInitComplete)
--==========================================================================================================================
--==========================================================================================================================
