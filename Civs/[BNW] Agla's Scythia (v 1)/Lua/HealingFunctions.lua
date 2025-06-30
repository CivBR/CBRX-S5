-- JFD_PapalStatesInnocent_Functions
-- Author: JFD
-- DateCreated: 4/13/2014 4:19:30 PM
--==========================================================================================================================
-- INCLUDES
--==========================================================================================================================
include("FLuaVector.lua")
include("PlotIterators")

--==========================================================================================================================
-- UTILITY FUNCTIONS
--==========================================================================================================================
-- GLOBALS
----------------------------------------------------------------------------------------------------------------------------


--HasTrait
function HasTrait(player, traitID)
	if isCPDLL then 
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


------------------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------------------

--==========================================================================================================================
-- GLOBALS
--==========================================================================================================================
-- GLOBALS
----------------------------------------------------------------------------------------------------------------------------
local activePlayerID			 = Game.GetActivePlayer()
local activePlayer				 = Players[activePlayerID]
local activeTeamID				 = Game.GetActiveTeam()
local activeTeam				 = Teams[activeTeamID]
--==========================================================================================================================
-- UNIQUE FUNCTIONS
--==========================================================================================================================
-- GLOBAL
----------------------------------------------------------------------------------------------------------------------------
local traitPapalStatesInnocentID = GameInfoTypes["TRAIT_AGLA_SCYTHIA"]
local civilizationAglaID = GameInfoTypes["CIVILIZATION_AGLA_SCYTHIA"]
local unitCarroccioID			 = GameInfoTypes["UNIT_AGLA_ENAREE"]
local promotionCarroccioID		  = GameInfoTypes["PROMOTION_AGLA_ENAREE"]
local promotionCityPenaltyID	  = GameInfoTypes["PROMOTION_CITY_PENALTY"]
local promotionCityPenaltySmallID = GameInfoTypes["PROMOTION_SMALL_CITY_PENALTY"]
function JFD_PapalStateInnocent_Carroccio_PlayerDoTurn(playerID)
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	if player:IsBarbarian() then return end
	if (not player:GetCapitalCity()) then return end
	local faithReward = 5
	for unit in player:Units() do
		local unitType = GameInfo.Units[unit:GetUnitType()].Type
		for row in GameInfo.Unit_FreePromotions("UnitType = '" .. unitType .. "' AND PromotionType = 'PROMOTION_CITY_PENALTY'") do
			if (not unit:IsHasPromotion(promotionCityPenaltyID)) then
				unit:SetHasPromotion(promotionCityPenaltyID, true)
			end
		end
		for row in GameInfo.Unit_FreePromotions("UnitType = '" .. unitType .. "' AND PromotionType = 'PROMOTION_SMALL_CITY_PENALTY'") do
			if (not unit:IsHasPromotion(promotionCityPenaltySmallID)) then
				unit:SetHasPromotion(promotionCityPenaltySmallID, true)
			end
		end
	end
	for unit in player:Units() do
		if unit:IsHasPromotion(promotionCarroccioID) then
			local plot = Map.GetPlot(unit:GetX(), unit:GetY())
			for adjacentPlot in PlotAreaSpiralIterator(plot, 1, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_INCLUDE) do
				local adjacentUnit = adjacentPlot:GetUnit()
				if (unit and adjacentUnit and adjacentUnit:GetOwner() == playerID and adjacentUnit:GetUnitType() ~= unitCarroccioID) then
					--ER_Edit: nerfing due to unit usually healing +10; adding a failsafe so that the UGP doesn't die
					if adjacentUnit:GetDamage() > 0  and unit:GetCurrHitPoints() > 15 then
						adjacentUnit:ChangeDamage(-faithReward)
						unit:ChangeDamage(faithReward*3)
					end
					if adjacentUnit:IsHasPromotion(promotionCityPenaltyID) then
						adjacentUnit:SetHasPromotion(promotionCityPenaltyID, false)
					end
					if adjacentUnit:IsHasPromotion(promotionCityPenaltySmallID) then
						adjacentUnit:SetHasPromotion(promotionCityPenaltySmallID, false)
					end
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(JFD_PapalStateInnocent_Carroccio_PlayerDoTurn)

local promotionAglaProphetID = GameInfoTypes["PROMOTION_AGLA_PROPHET_ENAREE"]
local unitAglaProphetID = GameInfoTypes["UNIT_AGLA_ENAREE"]
local unitProphetID = GameInfoTypes["UNIT_PROPHET"]
local unitClassProphetID = GameInfoTypes["UNITCLASS_PROPHET"]
function ProphetOverride(playerID, unitID)
    local player = Players[playerID]
    local playerTeam = Teams[player:GetTeam()]
    
    if player:GetCivilizationType() ~= civilizationAglaID then return end
    
    local unit = player:GetUnitByID(unitID)
    if (not unit) then return end
    if unit:GetUnitType() ~= unitProphetID then return end
    if unit:IsHasPromotion(promotionAglaProphetID) then return end
    
    local newUnit = player:InitUnit(unitAglaProphetID, unit:GetX(), unit:GetY())
    newUnit:Convert(unit)
    newUnit:SetHasPromotion(promotionAglaProphetID, true)
    unit:Kill(-1)
end
Events.SerialEventUnitCreated.Add(ProphetOverride)

--==========================================================================================================================
-- OBSOLETE UNIQUE FUNCTIONS
--==========================================================================================================================
-- DEUS VULT
----------------------------------------------------------------------------------------------------------------------------
--local g_CityPapalStates	   = nil
--local g_PlayerPapalStatesID   = nil
--local g_ReligionPapalStatesID = nil
--local traitPapalStatesInnocentID	   = GameInfoTypes["TRAIT_JFD_CHURCH_STATES"]
--
----JFD_PapalStates_DeusVult_CityCaptureComplete
--function JFD_PapalStates_DeusVult_CityCaptureComplete(oldOwnerID, capital, plotX, plotY, newOwnerID)
--	local player = Players[newOwnerID]
--	print(player:GetName(), "just captured a city")
--	if (not player:GetCapitalCity()) then return end
--	if HasTrait(player, traitPapalStatesInnocentID) then return end
--	local oldPlayer = Players[oldOwnerID]
--	if HasTrait(oldPlayer, traitPapalStatesInnocentID) then return end
--	local plot = Map.GetPlot(plotX, plotY)
--	local city = plot:GetPlotCity()
--	if city:IsOriginalCapital() then return end
--	local playerTeamID = player:GetTeam()
--	local religionID = player:GetCapitalCity():GetReligiousMajority()
--	if userSettingPietyCore then religionID = player:GetStateReligion() end
--	if religionID <= 0 then return end
--	local playerPapalStatesID, teamPapalStatesID, religionPapalStatesID, isChurchHuman = JFD_PapalStates_GetPapalStatesInfo(newOwnerID)
--	if (not playerPapalStatesID) then return end
--	if religionID ~= religionPapalStatesID then return end
--	g_CityPapalStates = city
--	g_PlayerPapalStatesID = playerPapalStatesID
--	g_ReligionPapalStatesID = religionPapalStatesID
--	if isChurchHuman then
--		print("the pope decides if they want the city")
--		JFD_PapalStates_DeusVult_UI(newOwnerID, playerPapalStatesID, city, religionPapalStatesID)
--	elseif player:IsHuman() then
--		print("the human can decide if they want to hand over the city to the Pope")
--	else
--		print("the AI is the Pope and the AI may hand over the city to the pope")
--		local playerPapalStates = Players[playerPapalStatesID]
--		if playerPapalStates:IsEmpireUnhappy() then
--			if city:GetNumFollowers(religionPapalStatesID) < city:GetPopulation() then
--				JFD_PapalStates_DeusVult_UIConvert()
--			else
--				JFD_PapalStates_DeusVult_UILeave()
--			end
--		else
--			local faithCost = (playerPapalStates:GetTotalFaithPerTurn()*city:GetPopulation())
--			local flavourOffense  = JFD_GetLeaderFlavour(newOwnerID, "FLAVOR_OFFENSE")
--			local flavourReligion = JFD_GetLeaderFlavour(newOwnerID, "FLAVOR_RELIGION")
--			print(player:GetName(), "Religion Flavour:", flavourReligion, "Offense Flavour:", flavourOffense)
--			if ((flavourReligion > flavourOffense and playerPapalStates:GetFaith() > faithCost) or JFD_GetRandom(1,5) == 1) then
--				JFD_PapalStates_DeusVult_UIPuppet()
--			else
--				if city:GetNumFollowers(religionPapalStatesID) < city:GetPopulation() then
--					JFD_PapalStates_DeusVult_UIConvert()
--				else
--					JFD_PapalStates_DeusVult_UILeave()
--				end
--			end
--		end
--	end 
--	if (not plot:IsRevealed(teamPapalStatesID)) then
--		plot:ChangeVisibilityCount(teamPapalStatesID, 1)
--		plot:SetRevealed(teamPapalStatesID, true)
--	end
--end
--GameEvents.CityCaptureComplete.Add(JFD_PapalStates_DeusVult_CityCaptureComplete)
--
----JFD_PapalStates_DeusVult_DeclareWar
--function JFD_PapalStates_DeusVult_DeclareWar(teamID, otherTeamID)
--	local player = Players[Teams[teamID]:GetLeaderID()] --attacking
--	local otherPlayer = Players[Teams[otherTeamID]:GetLeaderID()]
--	if player:IsHuman() and HasTrait(player, traitPapalStatesInnocentID) then
--		local religionID = player:GetCapitalCity():GetReligiousMajority()
--		if userSettingPietyCore then religionID = player:GetStateReligion() end
--		if religionID <= 0 then return end
--		for otherOtherPlayerID = 0, GameDefines.MAX_MAJOR_CIVS - 1, 1 do
--		local otherOtherPlayer = Players[otherOtherPlayerID]
--		if (otherOtherPlayer and otherOtherPlayer:IsAlive() and otherOtherPlayer:IsHuman() and (not HasTrait(player, traitPapalStatesInnocentID)) then
--			local otherOtherPlayerReligionID = player:GetCapitalCity():GetReligiousMajority()
--			if userSettingPietyCore then otherOtherPlayerReligionID = player:GetStateReligion() end
--			if religionID == otherOtherPlayerReligionID then
--				
--			end
--		end
--	elseif otherPlayer:IsHuman() and HasTrait(otherPlayer, traitPapalStatesInnocentID) then
--		
--	end
--end
--GameEvents.DeclareWar.Add(JFD_PapalStates_DeusVult_DeclareWar)
--==========================================================================================================================
-- OBSOLETE UI FUNCTIONS
--==========================================================================================================================
-- DEUS VULT (HUMAN POPE)
----------------------------------------------------------------------------------------------------------------------------
--
----JFD_PapalStates_DeusVult_UI
--function JFD_PapalStates_DeusVult_UI(playerID, playerPapalStatesID, city, religionID)
--	local player = Players[playerID]
--	local playerPapalStates = Players[playerPapalStatesID]
--	CivIconHookup(activePlayerID, 64, Controls.CivIcon, Controls.CivIconBG, Controls.CivIconShadow, false, true)
--	Controls.MainUI:SetHide(false)
--	Controls.Title:SetText(Locale.ToUpper("TXT_KEY_TRAIT_JFD_CHURCH_STATES_SHORT"))
--	Controls.Summary:LocalizeAndSetText("TXT_KEY_JFD_CHURCH_STATES_MESSAGE", player:GetName(), player:GetCivilizationShortDescription(), city:GetName(), Game.GetReligionName(religionID))
--	
--	local civName = player:GetCivilizationShortDescription()
--	local numConverts = city:GetNumFollowers(-1)
--	for religion in GameInfo.Religions("ID <> '" .. religionID .."'") do
--		numConverts = numConverts + city:GetNumFollowers(religion.ID)
--	end
--	local yieldCost = (playerPapalStates:GetTotalFaithPerTurn()*g_CityPapalStates:GetPopulation())
--	local yieldCostType = "[ICON_PEACE] Faith"
--	local yieldReward = (playerPapalStates:GetTotalFaithPerTurn()*city:GetPopulation())
--	local yieldRewardType = "[ICON_PEACE] Faith"
--	--if (userSettingPietyCore and player:HasStateReligion()) then
--	--	yieldReward = 0
--	--	yieldRewardType = "[ICON_JFD_PIETY] Piety"
--	--end
--	Controls.Button1:LocalizeAndSetToolTip("TXT_KEY_JFD_CHURCH_STATES_CONVERT_BUTTON_TT", civName, Game.GetReligionName(religionID), numConverts)
--	if playerPapalStates:GetFaith() >= yieldCost then 
--		Controls.Button2:SetDisabled(false)
--		Controls.Button2:LocalizeAndSetToolTip("TXT_KEY_JFD_CHURCH_STATES_PUPPET_BUTTON_TT", yieldCost, yieldCostType)	
--	else
--		Controls.Button2:SetDisabled(true)
--		Controls.Button2:LocalizeAndSetToolTip("TXT_KEY_JFD_CHURCH_STATES_PUPPET_BUTTON_TT_DISABLED", yieldCost, yieldCostType)
--	end
--	Controls.Button4:LocalizeAndSetToolTip("TXT_KEY_JFD_CHURCH_STATES_LEAVE_BUTTON_TT", civName, yieldReward, yieldRewardType)
--end
--
----JFD_PapalStates_DeusVult_UIConvert
--function JFD_PapalStates_DeusVult_UIConvert(isAIOnAI)
--	local playerPapalStates = Players[g_PlayerPapalStatesID]
--	local religionID = g_ReligionPapalStatesID
--	for religion in GameInfo.Religions("ID <> '" .. religionID .. "'") do
--		g_CityPapalStates:ConvertPercentFollowers(religionID, religion.ID, 100)
--	end
--	g_CityPapalStates:AdoptReligionFully(religionID)
--	g_CityPapalStates:ConvertPercentFollowers(religionID, -1, 100)
--	if playerPapalStates:IsHuman() then
--		activePlayer:AddNotification(NotificationTypes["NOTIFICATION_GREAT_PERSON_ACTIVE_PLAYER"], Locale.ConvertTextKey("TXT_KEY_JFD_CHURCH_STATES_CONVERT_NOTIFICATION_HUMAN", g_CityPapalStates:GetName(), Game.GetReligionName(religionID)), Locale.ConvertTextKey("TXT_KEY_TRAIT_JFD_CHURCH_STATES_SHORT"), g_CityPapalStates:GetX(), g_CityPapalStates:GetY(), unitNotificationID, -1)
--	else
--		local cityOwner = Players[g_CityPapalStates:GetOwner()]
--		if (activeTeam:IsHasMet(cityOwner:GetTeam()) and activeTeam:IsHasMet(playerPapalStates:GetTeam())) then
--			activePlayer:AddNotification(NotificationTypes["NOTIFICATION_GREAT_PERSON_ACTIVE_PLAYER"], Locale.ConvertTextKey("TXT_KEY_JFD_CHURCH_STATES_CONVERT_NOTIFICATION_AI", playerPapalStates:GetName(), cityOwner:GetCivilizationShortDescription(), cityOwner:GetCivilizationAdjective(), g_CityPapalStates:GetName(), Game.GetReligionName(religionID)), Locale.ConvertTextKey("TXT_KEY_TRAIT_JFD_CHURCH_STATES_SHORT"), g_CityPapalStates:GetX(), g_CityPapalStates:GetY(), unitNotificationID, -1)
--		end
--	end
--	Controls.MainUI:SetHide(true)
--end
--Controls.Button1:RegisterCallback(Mouse.eLClick, JFD_PapalStates_DeusVult_UIConvert)
--
----JFD_PapalStates_DeusVult_UIPuppet
--local buildingGovernorsMansionID = GameInfoTypes["BUILDING_JFD_GOVERNORS_MANSION"]
--function JFD_PapalStates_DeusVult_UIPuppet(isAIOnAI)
--	local playerPapalStates = Players[g_PlayerPapalStatesID]
--	local cityOwner = Players[g_CityPapalStates:GetOwner()]
--	local yieldCost = (playerPapalStates:GetTotalFaithPerTurn()*g_CityPapalStates:GetPopulation())
--	playerPapalStates:ChangeFaith(-yieldCost)
--	cityOwner:ChangeFaith(yieldCost)
--	playerPapalStates:AcquireCity(g_CityPapalStates, false, true)
--	g_CityPapalStates:SetPuppet(true)
--	g_CityPapalStates:SetProductionAutomated(true)
--	city:SetOccupied(false)
--	if buildingGovernorsMansionID then
--		if JFD_IsPlotFoundsColony(playerID, g_CityPapalStates) then
--			g_CityPapalStates:SetNumRealBuilding(buildingGovernorsMansionID, 1)
--		end
--	end
--	if playerPapalStates:IsHuman() then
--		activePlayer:AddNotification(NotificationTypes["NOTIFICATION_GREAT_PERSON_ACTIVE_PLAYER"], Locale.ConvertTextKey("TXT_KEY_JFD_CHURCH_STATES_PUPPET_NOTIFICATION_HUMAN", g_CityPapalStates:GetName(), Game.GetReligionName(g_ReligionPapalStatesID)), Locale.ConvertTextKey("TXT_KEY_TRAIT_JFD_CHURCH_STATES_SHORT"), g_CityPapalStates:GetX(), g_CityPapalStates:GetY(), unitNotificationID, -1)
--	else
--		if (activeTeam:IsHasMet(cityOwner:GetTeam()) and activeTeam:IsHasMet(playerPapalStates:GetTeam())) then
--			activePlayer:AddNotification(NotificationTypes["NOTIFICATION_GREAT_PERSON_ACTIVE_PLAYER"], Locale.ConvertTextKey("TXT_KEY_JFD_CHURCH_STATES_PUPPET_NOTIFICATION_AI", playerPapalStates:GetName(), cityOwner:GetCivilizationShortDescription(), cityOwner:GetCivilizationAdjective(), g_CityPapalStates:GetName(), Game.GetReligionName(g_ReligionPapalStatesID)), Locale.ConvertTextKey("TXT_KEY_TRAIT_JFD_CHURCH_STATES_SHORT"), g_CityPapalStates:GetX(), g_CityPapalStates:GetY(), unitNotificationID, -1)
--		end
--	end
--	Controls.MainUI:SetHide(true)
--end
--Controls.Button2:RegisterCallback(Mouse.eLClick, JFD_PapalStates_DeusVult_UIPuppet)
--
----JFD_PapalStates_DeusVult_UILeave
--function JFD_PapalStates_DeusVult_UILeave(isAIOnAI)
--	local playerPapalStates = Players[g_PlayerPapalStatesID]
--	local yieldReward = (playerPapalStates:GetTotalFaithPerTurn()*g_CityPapalStates:GetPopulation())
--	local yieldRewardType = "[ICON_PEACE] Faith"
--	playerPapalStates:ChangeFaith(yieldReward)
--	if playerPapalStates:IsHuman() then
--		activePlayer:AddNotification(NotificationTypes["NOTIFICATION_GREAT_PERSON_ACTIVE_PLAYER"], Locale.ConvertTextKey("TXT_KEY_JFD_CHURCH_STATES_LEAVE_NOTIFICATION_HUMAN", g_CityPapalStates:GetName(), Game.GetReligionName(religionID)), Locale.ConvertTextKey("TXT_KEY_TRAIT_JFD_CHURCH_STATES_SHORT"), g_CityPapalStates:GetX(), g_CityPapalStates:GetY(), unitNotificationID, -1)
--	end
--	Controls.MainUI:SetHide(true)
--end
--Controls.Button4:RegisterCallback(Mouse.eLClick, JFD_PapalStates_DeusVult_UILeave)
--
----JFD_PapalStates_DeusVult_FindOnMapButton
--function JFD_PapalStates_DeusVult_FindOnMapButton()
--	if g_CityPapalStates then
--		local plot = g_CityPapalStates:Plot()
--		if plot then
--			UI.LookAt(plot, 0)
--			local hex = ToHexFromGrid(Vector2(plot:GetX(), plot:GetY()))
--			Events.GameplayFX(hex.x, hex.y, -1) 
--		end
--	end
--end
--Controls.FindOnMapButton:RegisterCallback(Mouse.eLClick, JFD_PapalStates_DeusVult_FindOnMapButton)
------------------------------------------------------------------------------------------------------------------------------
---- DEUS VULT (AI POPE BUT HUMAN CONQUEROR)
------------------------------------------------------------------------------------------------------------------------------
--==========================================================================================================================
--==========================================================================================================================