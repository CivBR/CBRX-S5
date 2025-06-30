-- JFD_KalmarUnion_Utils
-- Author: JFD
-- DateCreated: 9/29/2016 5:38:13 AM
--=======================================================================================================================
-- USER SETTINGS
--=======================================================================================================================
--JFD_GetUserSetting
function JFD_GetUserSetting(type)
	for row in GameInfo.JFD_GlobalUserSettings("Type = '" .. type .. "'") do
		return row.Value
	end
end
local userSettingKalmarUnionCoreFirstNotificationJoinTurns  = JFD_GetUserSetting("JFD_CIVILIZATIONS_KALMAR_UNION_CORE_NOTIFICATION_FIRST_JOIN_TURNS")
local userSettingKalmarUnionCoreSecondNotificationJoinTurns = JFD_GetUserSetting("JFD_CIVILIZATIONS_KALMAR_UNION_CORE_NOTIFICATION_SECOND_JOIN_TURNS")
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- GLOBALS
------------------------------------------------------------------------------------------------------------------------
local convertTextKey = Locale.ConvertTextKey
local mathMax		 = math.max
local mathMin		 = math.min
--------------------------------------------------------------------------------------------------------------------------
-- MATHS
--------------------------------------------------------------------------------------------------------------------------
--JFD_GetRandom
function JFD_GetRandom(lower, upper)
    return Game.Rand((upper + 1) - lower, "") + lower
end

--JFD_Round
local mathFloor = math.floor
function JFD_Round(num, idp)
	local mult = 10^(idp or 0)
	return mathFloor(num * mult + 0.5) / mult
end
--------------------------------------------------------------------------------------------------------------------------
-- NOTIFICATIONS
--------------------------------------------------------------------------------------------------------------------------
--JFD_SendNotification
function JFD_SendNotification(playerID, notificationType, description, descriptionShort, global, data1, data2, unitID, data3, metOnly, includesSerialMessage)
	local player = Players[playerID]
	local data1 = data1 or -1
	local data2 = data2 or -1
	local unitID = unitID or -1
	local data3 = data3 or -1
	local sendNotification = false
	local sendSerialMessage = false
	if global then
		if metOnly then
			if Teams[Game.GetActiveTeam()]:IsHasMet(player:GetTeam()) then
				sendNotification = true
			end
		else
			sendNotification = true
		end
	else
		if player:IsHuman() then
			if metOnly then
				if Teams[Game.GetActiveTeam()]:IsHasMet(player:GetTeam()) then
					sendNotification = true
				end
			else
				sendNotification = true
			end
		end
	end

	if sendNotification then
		Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes[notificationType], description, descriptionShort, data1, data2, unitID, data3)
		if includesSerialMessage then
			Events.GameplayAlertMessage(description)
		end
	end
end   

--JFD_SendWorldEvent
function JFD_SendWorldEvent(playerID, description)
	local player = Players[playerID]
	local playerTeam = Teams[player:GetTeam()]
	local activePlayer = Players[Game.GetActivePlayer()]
	if (not player:IsHuman()) and playerTeam:IsHasMet(activePlayer:GetTeam()) then
		Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes["NOTIFICATION_DIPLOMACY_DECLARATION"], description, "[COLOR_POSITIVE_TEXT]World Events[ENDCOLOR]", -1, -1)
	end
end 
------------------------------------------------------------------------------------------------------------------------
-- NORDIC CROWN
------------------------------------------------------------------------------------------------------------------------
--JFD_GetKalmarUnionRate
function JFD_GetKalmarUnionRate(playerID, minorPlayerID)
	local player = Players[playerID]
	local playerTeam = Teams[player:GetTeam()]
	local minorPlayer = Players[minorPlayerID]
	local kalmarUnionRate = 0
	local isAllies = minorPlayer:IsAllies(playerID)
	local isFriends = minorPlayer:IsFriends(playerID)
	local isHasTradeRoute = false
	if (not playerTeam:IsHasMet(minorPlayer:GetTeam())) then return 0, false end
	if playerTeam:IsAtWar(minorPlayer:GetTeam()) then
		kalmarUnionRate = -2
	elseif minorPlayer:GetMinorCivFriendshipLevelWithMajor(playerID) < 0 then
		kalmarUnionRate = -1 
	else
		for _, tradeRoute in ipairs(minorPlayer:GetTradeRoutesToYou()) do
			local fromCivID = tradeRoute.FromID
			local toCivID = tradeRoute.ToID
			if (fromCivID == playerID or toCivID == playerID) then
				if isAllies then
					kalmarUnionRate = kalmarUnionRate + 2
				elseif isFriends then
					kalmarUnionRate = kalmarUnionRate + 1
				end
				isHasTradeRoute = true
			end
		end
	end
	return kalmarUnionRate, isHasTradeRoute
end

--JFD_GetKalmarUnionCounter
local buildingDenmarkID = GameInfoTypes["BUILDING_JFD_KALMAR_UNION"]
local defineKUThreshold = GameInfo.GameSpeeds[Game.GetGameSpeedType()].RelationshipDuration
function JFD_GetKalmarUnionCounter(playerID, minorPlayerID, city, resturnsThreshold, returnsTurns)
	local player = Players[minorPlayerID]
	local kalmarUnionCounter = city:GetNumBuilding(buildingDenmarkID)
	local kalmarUnionThreshold = 0
	if resturnsThreshold then
		kalmarUnionThreshold = defineKUThreshold
	end
	local kalmarUnionTurns = 0
	local kalmarUnionRate = JFD_GetKalmarUnionRate(playerID, minorPlayerID)
	if (returnsTurns and kalmarUnionRate > 0) then
		kalmarUnionTurns = mathMax(0,JFD_Round((kalmarUnionCounter-kalmarUnionThreshold)/kalmarUnionRate)*-1)
	end
	return kalmarUnionCounter, kalmarUnionThreshold, kalmarUnionTurns
end

--JFD_ChangeKalmarUnionCounter
local buildingUnhappinessID = GameInfoTypes["BUILDING_JFD_UNHAPPINESS"]
function JFD_ChangeKalmarUnionCounter(playerID, minorPlayerID, city, value)
	local player = Players[minorPlayerID]
	local kalmarUnionCounter, kalmarUnionThreshold, kalmarUnionTurns = JFD_GetKalmarUnionCounter(playerID, minorPlayerID, city, true, true)
	JFD_SetKalmarUnionCounter(playerID, minorPlayerID, city, (kalmarUnionCounter+value))
	kalmarUnionTurns = (kalmarUnionTurns-1)
	if kalmarUnionCounter >= kalmarUnionThreshold then
		LuaEvents.JFD_CityStateJoinedKalmarUnion(playerID, minorPlayerID, city:GetX(), city:GetY())
	elseif (userSettingKalmarUnionCoreFirstNotificationJoinTurns > 0 and kalmarUnionTurns == userSettingKalmarUnionCoreFirstNotificationJoinTurns) then
		JFD_SendNotification(playerID, "NOTIFICATION_CAPITAL_RECOVERED", Locale.ConvertTextKey("TXT_KEY_JFD_CITY_STATE_JOINS_KALMAR_UNION_IMMINENT_NOTIFICATION", city:GetName(), kalmarUnionTurns), Locale.ConvertTextKey("TXT_KEY_JFD_CITY_STATE_JOINS_KALMAR_UNION_IMMINENT_NOTIFICATION_SHORT", city:GetName()), false, city:GetX(), city:GetY())
	elseif (userSettingKalmarUnionCoreSecondNotificationJoinTurns > 0 and kalmarUnionTurns == userSettingKalmarUnionCoreSecondNotificationJoinTurns) then
		JFD_SendNotification(playerID, "NOTIFICATION_CAPITAL_RECOVERED", Locale.ConvertTextKey("TXT_KEY_JFD_CITY_STATE_JOINS_KALMAR_UNION_IMMINENT_NOTIFICATION", city:GetName(), kalmarUnionTurns), Locale.ConvertTextKey("TXT_KEY_JFD_CITY_STATE_JOINS_KALMAR_UNION_IMMINENT_NOTIFICATION_SHORT", city:GetName()), false, city:GetX(), city:GetY())
	end
end

--JFD_SetKalmarUnionCounter
function JFD_SetKalmarUnionCounter(playerID, minorPlayerID, city, value)
	city:SetNumRealBuilding(buildingDenmarkID, mathMax(0,value))
end
-------------------
-- TEXT
-------------------
--JFD_GetKalmarUnionList
local buildingDenmarkID = GameInfoTypes["BUILDING_JFD_KALMAR_UNION"]
function JFD_GetKalmarUnionList(playerID)
	local player = Players[playerID]
	local playerTeam = Teams[player:GetTeam()]
	local kalmarUnionTT = ""
	for minorPlayerID = 0, GameDefines.MAX_MINOR_CIVS - 1 do
		local minorPlayer = Players[minorPlayerID]
		local capital = minorPlayer:GetCapitalCity()
		if (minorPlayer:IsAlive() and capital and minorPlayer:IsMinorCiv()) then
			local kalmarUnionRate, isHasTradeRoute = JFD_GetKalmarUnionRate(playerID, minorPlayerID)
			if (kalmarUnionRate ~= 0 or isHasTradeRoute) then
				local kalmarUnionCounter, kalmarUnionThreshold, kalmarUnionTurns = JFD_GetKalmarUnionCounter(playerID, minorPlayerID, capital, true, true)
				if kalmarUnionRate > 0 then 
					kalmarUnionRate = "[COLOR_POSITIVE_TEXT]+" .. kalmarUnionRate .. "[ENDCOLOR]" 
				elseif kalmarUnionRate < 0 then 
					kalmarUnionRate = "[COLOR_NEGATIVE_TEXT]"  .. kalmarUnionRate .. "[ENDCOLOR]" 
				end
				kalmarUnionTT = kalmarUnionTT .. Locale.ConvertTextKey("TXT_KEY_JFD_KALMAR_UNION_CITY_VIEW_LIST", minorPlayer:GetName(), kalmarUnionCounter, kalmarUnionThreshold, kalmarUnionRate, kalmarUnionTurns)	
			end
		end
	end
	if kalmarUnionTT == "" then kalmarUnionTT = Locale.ConvertTextKey("TXT_KEY_JFD_KALMAR_UNION_CITY_VIEW_LIST_NONE") end
	return kalmarUnionTT
end
--=======================================================================================================================
--=======================================================================================================================