-- JFD_Lithuania_Decisions
-- Author: JFD
--=======================================================================================================================
print("JFD's Lithuania Decisions: loaded")
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
include("FLuaVector.lua")
include("JFD_RTP_SovereigntyUtils.lua")
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- UTILITIES
--------------------------------------------------------------------------------------------------------------------------
--JFD_GetEraAdjustedValue
local mathCeil = math.ceil
function JFD_GetEraAdjustedValue(playerID, num)
	local player = Players[playerID]
	local currentEraID = player:GetCurrentEra()
	local eraMod = GameInfo.Eras[currentEraID].ResearchAgreementCost
	return mathCeil(num * eraMod/100)
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

--JFD_GetNumConqueredCapitals
function JFD_GetNumConqueredCapitals(playerID)
	local numCapitals = 0
	for city in Players[playerID]:Cities() do
		if city:IsOriginalCapital() and (not city:IsCapital()) then
			numCapitals = numCapitals + 1
		end
	end
	return numCapitals
end
--=======================================================================================================================
-- MOD USE
--=======================================================================================================================
-- MODS
-------------------------------------------------------------------------------------------------------------------------
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
--=======================================================================================================================
-- USER SETTINGS
--=======================================================================================================================
-- JFD_GetUserSetting
function JFD_GetUserSetting(type)
	for row in GameInfo.JFD_GlobalUserSettings("Type = '" .. type .. "'") do
		return row.Value
	end
end
local userSettingPietyCore	     = JFD_GetUserSetting("JFD_RTP_PIETY_CORE") == 1
local userSettingSovereigntyCore = JFD_GetUserSetting("JFD_RTP_SOVEREIGNTY_CORE") == 1
--=======================================================================================================================
-- DECISIONS
--=======================================================================================================================
-- GLOBALS
--------------------------------------------------------------------------------------------------------------------------
local civilizationID			= GameInfoTypes["CIVILIZATION_JFD_WALLACHIA"]
-------------------------------------------------------------------------------------------------------------------------
-- Wallachia: Adopt Early Firearms
-------------------------------------------------------------------------------------------------------------------------
local policyGunpowderID		   = GameInfoTypes["POLICY_DECISIONS_JFD_WALLACHIA_GUNPOWDER"]
local techGunpowderID		   = GameInfoTypes["TECH_GUNPOWDER"]
local unitClassLongSwordsmanID = GameInfoTypes["UNITCLASS_LONGSWORDSMAN"]
local unitLefegiiID			   = GameInfoTypes["UNIT_JFD_LEFEGII"]
local unitLefegiiGunID		   = GameInfoTypes["UNIT_JFD_LEFEGII_GUN"]
local Decisions_JFD_Wallachia_Gunpowder = {}
	Decisions_JFD_Wallachia_Gunpowder.Name = "TXT_KEY_DECISIONS_JFD_WALLACHIA_GUNPOWDER"
	Decisions_JFD_Wallachia_Gunpowder.Desc = "TXT_KEY_DECISIONS_JFD_WALLACHIA_GUNPOWDER_DESC"
	HookDecisionCivilizationIcon(Decisions_JFD_Wallachia_Gunpowder, "CIVILIZATION_JFD_WALLACHIA")
	Decisions_JFD_Wallachia_Gunpowder.CanFunc = (
	function(player)
		local playerID = player:GetID()
		if player:GetCivilizationType() ~= civilizationID then return false, false end
		if player:HasPolicy(policyGunpowderID) then
			Decisions_JFD_Wallachia_Gunpowder.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_WALLACHIA_GUNPOWDER_ENACTED_DESC")
			return false, false, true 
		end
		local costGold = mathCeil((player:GetUnitClassCount(unitClassLongSwordsmanID)*100)+300)
		Decisions_JFD_Wallachia_Gunpowder.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_WALLACHIA_GUNPOWDER_DESC", costGold)
		if (not Teams[player:GetTeam()]:IsHasTech(techGunpowderID)) then return true, false end
		if player:GetGold() < costGold then return true, false end
		if player:GetNumResourceAvailable(iMagistrate, false) < 1 then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_Wallachia_Gunpowder.DoFunc = (
	function(player)
		local playerID = player:GetID()
		local costGold = mathCeil((player:GetUnitClassCount(unitClassLongSwordsmanID)*100)+500)
		player:ChangeGold(-costGold)
		player:ChangeNumResourceTotal(iMagistrate, -1)
		if isCPDLL then
			player:GrantPolicy(policyGunpowderID, true)
		else
			player:SetNumFreePolicies(1)
			player:SetNumFreePolicies(0)
			player:SetHasPolicy(policyGunpowderID, true)
		end
		for unit in player:Units() do
			if unit:GetUnitType() == unitLefegiiID then
				local newUnit = player:InitUnit(unitLefegiiGunID, unit:GetX(), unit:GetY())
				newUnit:Convert(unit)
			end
		end
		JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_WALLACHIA_GUNPOWDER", player:GetName(), player:GetCivilizationShortDescription())) 
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationID, "Decisions_JFD_Wallachia_Gunpowder", Decisions_JFD_Wallachia_Gunpowder)
-------------------------------------------------------------------------------------------------------------------------
-- Lithuania: Form the Romanian Nation
-------------------------------------------------------------------------------------------------------------------------
local policyRomaniaID = GameInfoTypes["POLICY_DECISIONS_JFD_WALLACHIA_ROMANIA"]
local Decisions_JFD_Wallachia_Romania = {}
	Decisions_JFD_Wallachia_Romania.Name = "TXT_KEY_DECISIONS_JFD_WALLACHIA_ROMANIA"
	Decisions_JFD_Wallachia_Romania.Desc = "TXT_KEY_DECISIONS_JFD_WALLACHIA_ROMANIA_DESC"
	HookDecisionCivilizationIcon(Decisions_JFD_Wallachia_Romania, "CIVILIZATION_JFD_WALLACHIA")
	Decisions_JFD_Wallachia_Romania.CanFunc = (
	function(player)
		local playerID = player:GetID()
		if player:GetCivilizationType() ~= civilizationID then return false, false end
		if player:HasPolicy(policyRomaniaID) then
			Decisions_JFD_Wallachia_Romania.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_WALLACHIA_ROMANIA_ENACTED_DESC")
			return false, false, true 
		end
		local capital = player:GetCapitalCity()
		if (not capital) then return false, false end
		local costCulture = mathCeil(500*iMod)
		local costFaith = mathCeil(500*iMod)
		if userSettingSovereigntyCore then
			Decisions_JFD_Wallachia_Romania.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_WALLACHIA_ROMANIA_DESC_SOVEREIGNTY", costCulture, costFaith)
			if JFD_GetNumConqueredCapitals(playerID) < 1 then return true, false end
			if player:GetSovereignty(playerID) < 75 then return true, false end
		else
			Decisions_JFD_Wallachia_Romania.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_WALLACHIA_ROMANIA_DESC", costCulture, costFaith)
			if JFD_GetNumConqueredCapitals(playerID) < 2 then return true, false end
		end
		if player:GetJONSCulture() < costCulture then return true, false end
		if player:GetFaith() < costFaith then return true, false end
		if player:GetNumResourceAvailable(iMagistrate, false) < 2 then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_Wallachia_Romania.DoFunc = (
	function(player)
		local playerID = player:GetID()
		local costCulture = mathCeil(600*iMod)
		local costFaith = mathCeil(500*iMod)
		player:ChangeGoldenAgeTurns(12)
		player:ChangeJONSCulture(-costCulture)
		player:ChangeFaith(-costFaith)
		player:ChangeNumResourceTotal(iMagistrate, -2)
		PreGame.SetCivilizationDescription(playerID, "TXT_KEY_CIV_JFD_ROMANIA_DESC")
		PreGame.SetCivilizationShortDescription(playerID, "TXT_KEY_CIV_JFD_ROMANIA_SHORT_DESC")
		PreGame.SetCivilizationAdjective(playerID, "TXT_KEY_CIV_JFD_ROMANIA_ADJECTIVE")
		if isCPDLL then
			player:GrantPolicy(policyRomaniaID, true)
		else
			player:SetNumFreePolicies(1)
			player:SetNumFreePolicies(0)
			player:SetHasPolicy(policyRomaniaID, true)
		end
		JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_WALLACHIA_ROMANIA", player:GetName()))
	end
	)
Decisions_AddCivilisationSpecific(civilizationID, "Decisions_JFD_Wallachia_Romania", Decisions_JFD_Wallachia_Romania)
--=======================================================================================================================
--=======================================================================================================================
