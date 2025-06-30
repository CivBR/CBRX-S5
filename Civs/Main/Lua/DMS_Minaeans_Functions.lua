-- DMS_Minaeans_Functions
-- Author: DMS
--==========================================================================================================================
-- includes
--==========================================================================================================================
include("PlotIterators.lua")
--==========================================================================================================================
-- USER SETTINGS
--==========================================================================================================================
-- DMS_GetUserSetting (adapted from JFD's JFD_GetUserSetting - credit goes there!)
----------------------------------------------------------------------------------------------------------------------------
function DMS_GetUserSetting(type)
	for row in GameInfo.DMS_GlobalUserSettings("Type = '" .. type .. "'") do
		return row.Value
	end
end
--==========================================================================================================================
-- UTILITIES
--==========================================================================================================================
-- Debug
----------------------------------------------------------------------------------------------------------------------------
local bPrintForDebug = DMS_GetUserSetting("DMS_MINAEANS_DEBUGGING_ON") == 1

function DMS_Print(string)
	if (not bPrintForDebug) then
		return
	else
		return print(string)
	end
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_IsCivilisationActive
----------------------------------------------------------------------------------------------------------------------------
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
-- JFD_SendNotification
----------------------------------------------------------------------------------------------------------------------------
function JFD_SendNotification(playerID, notificationType, description, descriptionShort, global, iX, iY)
	local player = Players[playerID]
	if global then
			Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes[notificationType], description, descriptionShort, iX or -1, iY or -1)
	else
		if player:IsHuman() then
			Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes[notificationType], description, descriptionShort, iX or -1, iY or -1)
		end
	end
end
----------------------------------------------------------------------------------------------------------------------------
-- Globals
----------------------------------------------------------------------------------------------------------------------------
local activePlayerID 						= Game.GetActivePlayer()
local activePlayer 							= Players[activePlayerID]
local activePlayerTeam 						= Teams[Game.GetActiveTeam()]
local civilisationMinaeansID				= GameInfoTypes["CIVILIZATION_DMS_MINAEANS"]
local isMinaeansCivActive 					= JFD_IsCivilisationActive(civilisationMinaeansID)
local isMinaeansActivePlayer 				= activePlayer:GetCivilizationType() == civilisationMinaeansID
-- unique components 
local traitWaddAbID							= GameInfoTypes["TRAIT_DMS_WADD_AB"]
local buildingHawtahID						= GameInfoTypes["BUILDING_DMS_HAWTAH"]
local unitKabirID							= GameInfoTypes["UNIT_DMS_KABIR"]
-- dummy buildings
local buildingUAFaithID						= GameInfoTypes["BUILDING_DMS_MINAEANS_WADD_AB_FAITH"]
local buildingUBTradeDistanceID				= GameInfoTypes["BUILDING_DMS_MINAEANS_HAWTAH_DISTANCE"]
-- misc
local improvementTradingPost				= GameInfoTypes["IMPROVEMENT_TRADING_POST"]
local specialistWriter						= GameInfoTypes["SPECIALIST_WRITER"]
local yieldGold								= GameInfoTypes["YIELD_GOLD"]
-- math
local mathCeil	= math.ceil
local mathMin	= math.min
local mathMax	= math.max
-- trade route duration
-- drop this
--local tTradeRouteDuration = {}
--tTradeRouteDuration[GameInfoTypes["GAMESPEED_QUICK"]] = 20
--tTradeRouteDuration[GameInfoTypes["GAMESPEED_STANDARD"]] = 24
--tTradeRouteDuration[GameInfoTypes["GAMESPEED_EPIC"]] = 28
--tTradeRouteDuration[GameInfoTypes["GAMESPEED_MARATHON"]] = 32
--gameSpeed = Game.GetGameSpeedType()
--tradeRouteDuration = tTradeRouteDuration[gameSpeed]
--if tradeRouteDuration == nil then 
--	DMS_Print('DMS_Minaeans_PDT: tradeRouteDuration could not be determined, default to 24')
--	tradeRouteDuration = tTradeRouteDuration[GameInfoTypes["GAMESPEED_STANDARD"]]
--end
-- GameEvents
local GameEventsPlayerDoTurnAdd				= GameEvents.PlayerDoTurn.Add
local GameEventsUnitPrekillAdd				= GameEvents.UnitPrekill.Add
--==========================================================================================================================
-- MAIN FUNCTIONS	
--==========================================================================================================================
-- DMS_Minaeans_PDT
----------------------------------------------------------------------------------------------------------------------------
function DMS_Minaeans_PDT(playerID)
	local player = Players[playerID]
	if player == nil then return end
	if not player:IsAlive() then return end
	if player:GetCivilizationType() ~= civilisationMinaeansID then return end
	local tradeRouteCitiesGold = 0
	local tradeRoutes = player:GetTradeRoutes()
	if tradeRoutes ~= nil then
		DMS_Print('DMS_Minaeans_PDT: iterate TRs')
		DMS_Print('---')
		for tri, trt in pairs(tradeRoutes) do
			DMS_Print('DMS_Minaeans_PDT: TR: ' .. tri)
			DMS_Print('DMS_Minaeans_PDT: trt.TurnsLeft = ' .. trt.TurnsLeft)
			if trt.TurnsLeft <= 2 then -- apparently different for land trade and sea trade routes, the former ending when 1 turn left, the latter when 0 :thinkingsperm:
				if playerID ~= trt.ToID then -- tr is international
					local fromCity = player:GetCityByID(trt.FromCity)
					local toPlayer = Players[trt.ToID]
					local toCityID = trt.ToCity
					local toCity = toPlayer:GetCityByID(toCityID)
					tradeRouteCitiesGold = tradeRouteCitiesGold + mathMax(fromCity:GetYieldRate(yieldGold, true), 0) + mathMax(toCity:GetYieldRate(yieldGold, true), 0)
					DMS_Print('DMS_Minaeans_PDT: fromCityGold = ' .. fromCity:GetYieldRate(yieldGold, true))
					DMS_Print('DMS_Minaeans_PDT: toCityGold = ' .. toCity:GetYieldRate(yieldGold, true))
					DMS_Print('DMS_Minaeans_PDT: tradeRouteCitiesGold = ' .. tradeRouteCitiesGold)
				end
			end
			DMS_Print('---')
		end
	end
	local capital = player:GetCapitalCity()
	if capital ~= nil then
		if tradeRouteCitiesGold > 0 then
			local GWpoints = mathMin(100, mathCeil(tradeRouteCitiesGold / 2)) * 100
			capital:ChangeSpecialistGreatPersonProgressTimes100(specialistWriter, GWpoints )
			DMS_Print('DMS_Minaeans_PDT: grant ' .. GWpoints .. ' GW point(s) in ' .. capital:GetName())
			if player:IsHuman() then
				Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_TRAIT_DMS_WADD_AB_NOTIFICATION", GWpoints, capital:GetName()));
			end
		end
	end
	local numGWs = player:GetNumGreatWorks()
	DMS_Print('DMS_Minaeans_PDT: numGWs = ' .. numGWs)
	if numGWs > 0 then
		capital:SetNumRealBuilding(buildingUAFaithID, mathMin(numGWs, 40))
		DMS_Print('DMS_Minaeans_PDT: place ' .. mathMin(numGWs, 40) .. ' in ' .. capital:GetName())
	end
	local numHawtah = player:CountNumBuildings(buildingHawtahID)
	DMS_Print('DMS_Minaeans_PDT: numHawtah = ' .. numHawtah)
	for city in player:Cities() do
		if city:IsHasBuilding(buildingHawtahID) then
			city:SetNumRealBuilding(buildingUBTradeDistanceID, numHawtah)
			DMS_Print('DMS_Minaeans_PDT: city ' .. city:GetName() .. ' has UB - place ' .. numHawtah .. ' UB dummy buildings in city')
		end
	end
end
----------------------------------------------------------------------------------------------------------------------------
-- DMS_Minaeans_UPK
----------------------------------------------------------------------------------------------------------------------------
function DMS_Minaeans_UPK(ownerID, unitID, unitType, x, y, bDelay, killerID)
	if bDelay == false then return end
	local player = Players[ownerID]
	if player == nil then return end
	if not player:IsAlive() then return end
	if player:GetCivilizationType() ~= civilisationMinaeansID then return end
	if unitType ~= unitKabirID then return end
	local unitPlot = Map.GetPlot(x,y)
	if unitPlot == nil then return end
	DMS_Print('DMS_Minaeans_UPK: Kabir expended on plot (' .. x .. ',' .. y .. ')')
	for plot in PlotAreaSweepIterator(unitPlot, 1, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_INCLUDE) do
		if plot:GetImprovementType() == -1 then
			DMS_Print('DMS_Minaeans_UPK: adj plot (' .. plot:GetX() .. ',' .. plot:GetY() .. ') does not have an improvement')
			if (not plot:IsCity()) then
				DMS_Print('DMS_Minaeans_UPK: adj plot (' .. plot:GetX() .. ',' .. plot:GetY() .. ') is not a city')
				if (not plot:IsWater()) and (not plot:IsLake()) and (not plot:IsMountain()) then
					DMS_Print('DMS_Minaeans_UPK: adj plot (' .. plot:GetX() .. ',' .. plot:GetY() .. ') is not water nor mountain')
					plot:SetImprovementType(improvementTradingPost)
					DMS_Print('DMS_Minaeans_UPK: place trading post on adj plot (' .. plot:GetX() .. ',' .. plot:GetY() .. ')')
				end
			end
		end
	end
end
----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------
GameEventsPlayerDoTurnAdd(DMS_Minaeans_PDT)
GameEventsUnitPrekillAdd(DMS_Minaeans_UPK)
----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------