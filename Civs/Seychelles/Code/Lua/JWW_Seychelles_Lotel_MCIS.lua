--Stolen from Chrisy
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
include("IconSupport")
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- UTILS
-------------------------------------------------------------------------------------------------------------------------
-- JFD_IsCivilisationActive
function JFD_IsCivilisationActive(civilizationID)
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
-------------------------------------------------------------------------------------------------------------------------
-- GLOBALS
-------------------------------------------------------------------------------------------------------------------------
local activePlayerID		= Game.GetActivePlayer()
local activePlayer			= Players[activePlayerID]
local civilizationID 		= GameInfoTypes["CIVILIZATION_JWW_SEYCHELLES"]
local isSeychellesCivActive	 = JFD_IsCivilisationActive(civilizationID)
local isSeychellesActivePlayer = activePlayer:GetCivilizationType() == civilizationID
if isSeychellesCivActive then
	print("JWW Seychelles Lotel MCIS is loaded!")
end

function CityInfoStackDataRefresh(tCityInfoAddins, tEventsToHook)
   table.insert(tCityInfoAddins, {["Key"] = "JWW_Seychelles_Lotel_MCIS", ["SortOrder"] = 1})
end
if isSeychellesActivePlayer then
	LuaEvents.CityInfoStackDataRefresh.Add(CityInfoStackDataRefresh)
	LuaEvents.RequestCityInfoStackDataRefresh()
end

function Lotel_CityInfoStackDirty(key, instance)
	if not key == "JWW_Seychelles_Lotel_MCIS" then return end
	Lotel_ProcessCityScreen(instance)
end

if isSeychellesActivePlayer then
	LuaEvents.CityInfoStackDirty.Add(Lotel_CityInfoStackDirty)
end
if not(OptionsManager.GetSmallUIAssets()) then Controls.IconFrame:SetOffsetX(294) end
--=======================================================================================================================
-- CORE FUNCTIONS	
--=======================================================================================================================
-- Globals
--------------------------------------------------------------------------------------------------------------------------
g_JWW_Seychelles_Lotel_MCIS_TipControls = {}
TTManager:GetTypeControlTable("JWW_Seychelles_Lotel_MCIS_Tooltip", g_JWW_Seychelles_Lotel_MCIS_TipControls)
-------------------------------------------------------------------------------------------------------------------------
-- ProcessCityScreen
-------------------------------------------------------------------------------------------------------------------------
local iLotelDummy = GameInfoTypes["BUILDING_JWW_SEYCHELLES_UB"]

function Lotel_ProcessCityScreen(instance)
	-- Ensure City Selected
	local city = UI.GetHeadSelectedCity()
	if (not city) then
		instance.IconFrame:SetHide(true)
		return
	end
	instance.IconFrame:SetToolTipType("JWW_Seychelles_Lotel_MCIS_Tooltip")
	IconHookup(4, 64, "JWW_SEYCHELLES_COLOR_ATLAS", instance.IconImage)
	if not city:IsHasBuilding(iLotelDummy) then
		instance.IconFrame:SetHide(true)
		return
	end

	local iPercent = (city:GetNumBuilding(iLotelDummy) * 25)
	local textDescription = "[COLOR_POSITIVE_TEXT]" .. string.upper(Locale.ConvertTextKey("TXT_KEY_JWW_SEYCHELLES_LOTEL_MCIS_DESC")) .. "[ENDCOLOR]"
	local textHelp = Locale.ConvertTextKey("TXT_KEY_JWW_SEYCHELLES_LOTEL_MCIS_HELP", iPercent)
	g_JWW_Seychelles_Lotel_MCIS_TipControls.Heading:SetText(textDescription)
	g_JWW_Seychelles_Lotel_MCIS_TipControls.Body:SetText(textHelp)
	g_JWW_Seychelles_Lotel_MCIS_TipControls.Box:DoAutoSize()
	instance.IconFrame:SetHide(false)
end
--[[
function UA_ProcessCityScreen(instance)
	local city = UI.GetHeadSelectedCity()
	if (not city) then
		instance.IconFrame:SetHide(true)
		return
	end
	instance.IconFrame:SetToolTipType("JWW_Seychelles_UA_MCIS_Tooltip")
	IconHookup(0, 64, "JWW_SEYCHELLES_COLOR_ATLAS", instance.IconImage)
	if not city:IsHasBuilding(iUADummy) then
		instance.IconFrame:SetHide(true)
		return
	end

	local iNum = city:GetNumBuilding(iUADummy)
	local textDescription = "[COLOR_POSITIVE_TEXT]" .. string.upper(Locale.ConvertTextKey("TXT_KEY_JWW_SEYCHELLES_UA_MCIS_DESC")) .. "[ENDCOLOR]"
	local textHelp = Locale.ConvertTextKey("TXT_KEY_JWW_SEYCHELLES_UA_MCIS_HELP", iNum)
	g_JWW_Seychelles_UA_MCIS_TipControls.Heading:SetText(textDescription)
	g_JWW_Seychelles_UA_MCIS_TipControls.Body:SetText(textHelp)
	g_JWW_Seychelles_UA_MCIS_TipControls.Box:DoAutoSize()
	instance.IconFrame:SetHide(false)
end]]
--=======================================================================================================================
--=======================================================================================================================
