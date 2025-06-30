-- JFD_KalmarUnion_Decisions
-- Author: JFD
--=======================================================================================================================
print("JFD's Kalmar Union Decisions: loaded")
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- UTILITIES
-------------------------------------------------------------------------------------------------------------------------
--JFD_GetEraAdjustedValue
local mathCeil = math.ceil
function JFD_GetEraAdjustedValue(playerID, num)
	local player = Players[playerID]
	local currentEraID = player:GetCurrentEra()
	local eraMod = GameInfo.Eras[currentEraID].ResearchAgreementCost
	return mathCeil(num * eraMod/100)
end 

--JFD_GetNumCityStateAllies
function JFD_GetNumCityStateAllies(playerID)
	local numCSAllies = 0
	for minorPlayerID = 0, GameDefines.MAX_MINOR_CIVS - 1 do
		local minorCiv = Players[minorPlayerID]
		if (minorCiv:IsAlive() and minorCiv:GetCapitalCity()) then
			if minorCiv:IsAllies(playerID) then
				numCSAllies = numCSAllies + 1
			end
		end
	end
	return numCSAllies
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
local userSettingClaimsCore = JFD_GetUserSetting("JFD_RTP_CLAIMS_CORE") == 1
--=======================================================================================================================
-- DECISIONS
--=======================================================================================================================
-- GLOBALS
--------------------------------------------------------------------------------------------------------------------------
local civilizationID        = GameInfoTypes["CIVILIZATION_JFD_KALMAR_UNION"]
local eraMedievalID         = GameInfoTypes["ERA_MEDIEVAL"]
local resourceDignitariesID	= GameInfoTypes["RESOURCE_JFD_DIGNITARIES"]
-------------------------------------------------------------------------------------------------------------------------
-- Kalmar Union: Dispatch a Magnate
-------------------------------------------------------------------------------------------------------------------------
local unitMagnateID = GameInfoTypes["UNIT_DECISIONS_JFD_MAGNATE"]
local Decisions_JFD_KalmarUnion_Magnate = {}
	Decisions_JFD_KalmarUnion_Magnate.Name = "TXT_KEY_DECISIONS_JFD_KALMAR_UNION_MAGNATE"
	Decisions_JFD_KalmarUnion_Magnate.Desc = "TXT_KEY_DECISIONS_JFD_KALMAR_UNION_MAGNATE_DESC"
	HookDecisionCivilizationIcon(Decisions_JFD_KalmarUnion_Magnate, "CIVILIZATION_JFD_KALMAR_UNION")
	Decisions_JFD_KalmarUnion_Magnate.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationID then return false, false end
		local eraID = load(player, "Decisions_JFD_KalmarUnion_Magnate")
		local currentEraID = player:GetCurrentEra()
		if eraID then
			if eraID < currentEraID then
				save(player, "Decisions_JFD_KalmarUnion_Magnate", nil)
			else
				Decisions_JFD_KalmarUnion_Magnate.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_KALMAR_UNION_MAGNATE_ENACTED_DESC")
				return false, false, true
			end
		end
		local playerID = player:GetID()
		local costCulture = JFD_GetEraAdjustedValue(playerID, mathCeil(200*iMod))
		local resourceID = iMagistrate
		local resourceType = "[ICON_MAGISTRATES] Magistrates"
		if userSettingClaimsCore then
			resourceID = resourceDignitariesID
			resourceType = "[ICON_JFD_DIGNITARY] Dignitaries"
		end
		Decisions_JFD_KalmarUnion_Magnate.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_KALMAR_UNION_MAGNATE_DESC", costCulture, resourceType)
		local playerID = player:GetID()
		if player:GetCurrentEra() < eraMedievalID then return true, false end
		if player:GetJONSCulture() < costCulture then return true, false end
		if player:GetNumResourceAvailable(resourceID, false) < 2 then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_KalmarUnion_Magnate.DoFunc = (
	function(player)
		local playerID = player:GetID()
		local capital = player:GetCapitalCity()
		local costCulture = JFD_GetEraAdjustedValue(playerID, mathCeil(200*iMod))
		local resourceID = iMagistrate
		if userSettingClaimsCore then
			resourceID = resourceDignitariesID
		end
		player:ChangeNumResourceTotal(resourceID, -2)
		player:ChangeJONSCulture(-costCulture)
		player:InitUnit(unitMagnateID, capital:GetX(), capital:GetY())
		save(player, "Decisions_JFD_KalmarUnion_Magnate", player:GetCurrentEra())
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationID, "Decisions_JFD_KalmarUnion_Magnate", Decisions_JFD_KalmarUnion_Magnate)
-------------------------------------------------------------------------------------------------------------------------
-- Kalmar Union: Issue Market Rights
-------------------------------------------------------------------------------------------------------------------------
local policyMarketRightsID = GameInfoTypes["POLICY_DECISIONS_JFD_KALMAR_UNION_MARKET_RIGHTS"]
local Decisions_JFD_KalmarUnion_MarketRights = {}
	Decisions_JFD_KalmarUnion_MarketRights.Name = "TXT_KEY_DECISIONS_JFD_KALMAR_UNION_MARKET_RIGHTS"
	Decisions_JFD_KalmarUnion_MarketRights.Desc = "TXT_KEY_DECISIONS_JFD_KALMAR_UNION_MARKET_RIGHTS_DESC"
	HookDecisionCivilizationIcon(Decisions_JFD_KalmarUnion_MarketRights, "CIVILIZATION_JFD_KALMAR_UNION")
	Decisions_JFD_KalmarUnion_MarketRights.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationID then return false, false end
		if  player:HasPolicy(policyMarketRightsID) then
			Decisions_JFD_KalmarUnion_MarketRights.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_KALMAR_UNION_MARKET_RIGHTS_ENACTED_DESC")
			return false, false, true 
		end
		local playerID = player:GetID()
		local costCulture = mathCeil(800*iMod)
		if userSettingClaimsCore then
			costCulture = mathCeil(500*iMod)
			Decisions_JFD_KalmarUnion_MarketRights.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_KALMAR_UNION_MARKET_RIGHTS_DESC_CLAIMS", costCulture)
		else
			Decisions_JFD_KalmarUnion_MarketRights.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_KALMAR_UNION_MARKET_RIGHTS_DESC", costCulture)
		end
		if player:GetCurrentEra() < eraMedievalID then return true, false end
		if player:GetJONSCulture() < costCulture then return true, false end
		if player:GetNumResourceAvailable(iMagistrate, false) < 1 then return true, false end
		if userSettingClaimsCore then
			if player:GetNumResourceAvailable(resourceDignitariesID, false) < 1 then return true, false end
		end
		if JFD_GetNumCityStateAllies(playerID) < 1 then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_KalmarUnion_MarketRights.DoFunc = (
	function(player)
		local playerID = player:GetID()
		local costCulture = mathCeil(800*iMod)
		if userSettingClaimsCore then
			costCulture = mathCeil(500*iMod)
			player:ChangeNumResourceTotal(resourceDignitariesID, -1)	
		end
		player:ChangeJONSCulture(-costCulture)
		player:ChangeNumResourceTotal(iMagistrate, -1)
		if isCPDLL then
			player:GrantPolicy(policyMarketRightsID, true)
		else
			player:SetNumFreePolicies(1)
			player:SetNumFreePolicies(0)
			player:SetHasPolicy(policyMarketRightsID, true)
		end
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationID, "Decisions_JFD_KalmarUnion_MarketRights", Decisions_JFD_KalmarUnion_MarketRights)
--=======================================================================================================================
--=======================================================================================================================
