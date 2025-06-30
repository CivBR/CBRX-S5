-- JFD_RTP_Epithets_ProgressOverview
-- Author: JFD
-- DateCreated: 4/30/2019 8:35:33 AM
--==========================================================================================================================
-- INCLUDES
--==========================================================================================================================
------------------------------------------------------------------------------------------------------------------------
include("JFD_Epithets_Utils.lua")
include( "InstanceManager" );
--==========================================================================================================================
-- GLOBALS
--==========================================================================================================================
----------------------------------------------------------------------------------------------------------------------------
local g_ConvertTextKey  = Locale.ConvertTextKey
local g_GetRandom		= Game.GetRandom
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
-- ACTIVE MODS
--==========================================================================================================================
-------------------------------------------------------------------------------------------------------------------------
local g_IsNationalismActive = Game.IsNationalismActive()
--=======================================================================================================================
-- CACHED TABLES
--=======================================================================================================================
-------------------------------------------------------------------------------------------------------------------------
--g_JFD_Epithets_Table
local g_JFD_Epithets_Table = {}
local g_JFD_Epithets_Count = 1
for row in DB.Query("SELECT ID FROM JFD_Epithets;") do 	
	g_JFD_Epithets_Table[g_JFD_Epithets_Count] = row
	g_JFD_Epithets_Count = g_JFD_Epithets_Count + 1
end
--==========================================================================================================================
-- GLOBAL DEFINES
--==========================================================================================================================
-------------------------------------------------------------------------------------------------------------------------
--==========================================================================================================================
-- UI FUNCTIONS
--==========================================================================================================================
-------------------------------------------------------------------------------------------------------------------------
-- EPITHET PROGRESS OVERVIEW POPUP
-------------------------------------------------------------------------------------------------------------------------
local epithetInstance = InstanceManager:new( "EpithetInstance", "EpithetBox", Controls.EpithetStack );

--JFD_EpithetProgress_RTP_ShowEpitherProgressOverviewPopup
local function JFD_EpithetProgress_RTP_ShowEpitherProgressOverviewPopup()
	local playerID = Game.GetActivePlayer()
	local player = Players[playerID]
	
	epithetInstance:ResetInstances();

	local epithets = {}
	local epithetsCount = 1
	--g_JFD_Epithets_Table
	local epithetsTable = g_JFD_Epithets_Table
	local numEpithets = #epithetsTable
	for index = 1, numEpithets do
		local row = epithetsTable[index]
		epithets[epithetsCount] = row.ID
		epithetsCount = epithetsCount + 1
	end
	table.sort(epithets, function(x, y) return (player:GetEpithetProgress(x) > player:GetEpithetProgress(y)) end)

	local bestEpithetID = player:GetBestEpithet()
	
	local epithetsTable = epithets
	local numEpithets = #epithetsTable
	for index = 1, numEpithets do
		local epithetID = epithetsTable[index]
		local numProgress = player:GetEpithetProgress(epithetID)
		-- if numProgress > 0 then		
			local eraID = player:GetCurrentEra()
			local numThreshold = GameInfo.Eras[eraID].EpithetProgressThreshold	
			controlTable = epithetInstance:GetInstance();
			local percent = numProgress / numThreshold;
			controlTable.EpithetMeter:SetPercent( percent );

			local epithet = GameInfo.JFD_Epithets[epithetID]
			local epithetDesc = epithet.Description
			local epithetStra = epithet.Strategy
			if bestEpithetID == epithetID and (numProgress >= numThreshold) then
				epithetDesc = "[COLOR_JFD_EPITHET]" .. g_ConvertTextKey(epithetDesc) .. "[ENDCOLOR]"	
				controlTable.EpithetLabel:LocalizeAndSetText(epithetDesc);
				controlTable.EpithetLabel:LocalizeAndSetToolTip("TXT_KEY_JFD_EPITHET_PROGRESS_BEST_TT");
			else
				controlTable.EpithetLabel:LocalizeAndSetText(epithetDesc);
				controlTable.EpithetLabel:SetToolTipString(nil);
			end
			
			local strToolTipText = g_ConvertTextKey("TXT_KEY_PROGRESS_TOWARDS",epithetDesc);
			strToolTipText = strToolTipText .. ": " .. tostring(numProgress) .. "/" .. tostring(numThreshold);	
			strToolTipText = strToolTipText .. "[NEWLINE][NEWLINE]" .. g_ConvertTextKey(epithetStra)				
			controlTable.EpithetMeter:SetToolTipString(strToolTipText);
		-- end			
	end
	Controls.EpithetStack:CalculateSize();
	Controls.EpithetStack:ReprocessAnchoring();
	Controls.EpithetScrollPanel:CalculateInternalSize();
	ContextPtr:SetHide(false);
end
LuaEvents.RTP_ShowEpitherProgressOverviewPopup.Add(JFD_EpithetProgress_RTP_ShowEpitherProgressOverviewPopup);
-----------------------------------------------------------------------------------------------------------------------
--JFD_Epithets_HideEpitherProgressOverviewPopup
local function JFD_Epithets_HideEpitherProgressOverviewPopup()
	ContextPtr:SetHide(true);
end
JFD_Epithets_HideEpitherProgressOverviewPopup()
-------------------------------------------------------------------------------------------------------------------------
--JFD_Epithets_SetInputHandler
local function JFD_Epithets_SetInputHandler(uiMsg, wParam, lParam)
    if uiMsg == KeyEvents.KeyDown then
        if wParam == Keys.VK_ESCAPE then
			ContextPtr:SetHide(true);
        end
    end
end
ContextPtr:SetInputHandler(JFD_Epithets_SetInputHandler);
-----------------------------------------------------------------------------------------------------------------------
--JFD_Epithets_CloseButton
local function JFD_Epithets_CloseButton()
	ContextPtr:SetHide(true);
end
Controls.CloseButton:RegisterCallback(Mouse.eLClick, JFD_Epithets_CloseButton);
--==========================================================================================================================
--==========================================================================================================================