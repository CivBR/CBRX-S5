--==========================================================================================================================
--==========================================================================================================================
if Game.IsRTPTopPanelActive("a8ac71dc-dcd9-4f87-af61-8ae7951ade57") then return end
--==========================================================================================================================
-- INCLUDES
--==========================================================================================================================
----------------------------------------------------------------------------------------------------------------------------
--==========================================================================================================================
-- GLOBALS
--==========================================================================================================================
----------------------------------------------------------------------------------------------------------------------------
--==========================================================================================================================
-- UI FUNCTIONS
--==========================================================================================================================
----------------------------------------------------------------------------------------------------------------------------
-- TOP PANEL
----------------------------------------------------------------------------------------------------------------------------
--JFD_Epithets_UpdateTopPanel
local function JFD_Epithets_UpdateTopPanel()
	local activePlayerID = Game.GetActivePlayer()
	local activePlayer = Players[activePlayerID]
	local epithetProgress, epithetThreshold = activePlayer:GetTotalEpithetProgress()
	Controls.EpithetProgressString:SetHide(false)
	Controls.EpithetProgressString:ChangeParent(ContextPtr:LookUpControl("/InGame/TopPanel/TopPanelInfoStack"))
	Controls.EpithetProgressString:LocalizeAndSetText("[COLOR_JFD_EPITHET][ICON_JFD_EPITHET_PROGRESS] {1_Num}/{2_Num}[ENDCOLOR]", epithetProgress, epithetThreshold)
end
LuaEvents.JFD_UpdateTopPanel.Add(JFD_Epithets_UpdateTopPanel)
-------------------------------------------------------------------------------------------------------------------------
--JFD_Epithets_EpithetsString
function JFD_Epithets_EpithetsString()
	LuaEvents.RTP_ShowEpitherProgressOverviewPopup()
end
Controls.EpithetProgressString:RegisterCallback(Mouse.eLClick, JFD_Epithets_EpithetsString);
 ----------------------------------------------------------------------------------------------------------------------------
local function Initialize()	
	Events.LoadScreenClose.Add(			  JFD_Epithets_UpdateTopPanel);
	Events.SerialEventGameDataDirty.Add(  JFD_Epithets_UpdateTopPanel);
	Events.SerialEventTurnTimerDirty.Add( JFD_Epithets_UpdateTopPanel);
	Events.SerialEventCityInfoDirty.Add(  JFD_Epithets_UpdateTopPanel);
end
Initialize();
--==========================================================================================================================
--==========================================================================================================================