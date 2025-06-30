-- PhoenicianUA
-- Author: Sukritact
--=======================================================================================================================

print("loaded")

--=======================================================================================================================
-- Utility Functions
--=======================================================================================================================
-- JFD_IsCivilisationActive: Thanks to JFD for this one!
-------------------------------------------------------------------------------------------------------------------------
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

local iCiv = GameInfoTypes.CIVILIZATION_MC_PHOENICIA
if not(JFD_IsCivilisationActive(iCiv)) then return end
-------------------------------------------------------------------------------------------------------------------------
-- IsModActive
-------------------------------------------------------------------------------------------------------------------------
function IsModActive(iModID)
	local bActive = false
	local tMods = Modding.GetEnabledModsByActivationOrder()
	
	for iKey, tMod in ipairs(tMods) do
		if (tMod.ModID) == iModID then
			bActive = true
		end
	end
	
	return bActive
end

--Piety and Prestige or Dynamic TopPanel Yields
local bDynamicTooltip = not(IsModActive("eea66053-7579-481a-bb8d-2f3959b59974") or IsModActive("475933b9-264f-42e6-8c73-70bbc7e839ea"))
--=======================================================================================================================
-- Main Code
--=======================================================================================================================
local iGold = GameInfoTypes.YIELD_GOLD
local iMod = 0.05 -- Yields from Trade Routes must be /100 so this is actually just *5
local iScienceExport = {}

function PhoenicianUA (iPlayer, bIsTurnStart)
	local pPlayer = Players[iPlayer]
	
	if (pPlayer:GetCivilizationType() ~= iCiv) then
		return
	end
	
	iScienceExport[iPlayer] = 0
	-- Trade routes from you
	local tTradeRoutes = pPlayer:GetTradeRoutes()
	for i,v in ipairs(tTradeRoutes) do
		iScienceExport[iPlayer] = iScienceExport[iPlayer] + v.ToScience
	end
	-- Trade routes to you
	local tTradeRoutes = pPlayer:GetTradeRoutesToYou()
	for i,v in ipairs(tTradeRoutes) do
		iScienceExport[iPlayer] = iScienceExport[iPlayer] + v.FromScience
	end
	
	local iDeltaGold = iScienceExport[iPlayer] * iMod
	
	if bIsTurnStart then
		pPlayer:ChangeGold(iDeltaGold)
	end
	
	if bDynamicTooltip then
		if iPlayer == Game.GetActivePlayer() then
			local iTotalGold = pPlayer:GetGold()
			local iGoldPerTurn = pPlayer:CalculateGoldRate() + iDeltaGold
			ContextPtr:LookUpControl("/InGame/TopPanel/GoldPerTurn"):SetToolTipCallback(PhoenicianGoldTipHandler)
			ContextPtr:LookUpControl("/InGame/TopPanel/GoldPerTurn"):SetText(Locale.ConvertTextKey("TXT_KEY_TOP_PANEL_GOLD", iTotalGold, iGoldPerTurn))
		end
	end
end

function PhoenicianUATrigger1(iPlayer)
	PhoenicianUA(iPlayer, true)
end

GameEvents.PlayerDoTurn.Add(PhoenicianUATrigger1)

function PhoenicianUATrigger2()
	local iPlayer = Game.GetActivePlayer()
	local pPlayer = Players[iPlayer]
	if pPlayer:IsTurnActive() then
		PhoenicianUA(iPlayer, false)
	end
end

if bDynamicTooltip then
	Events.SerialEventGameDataDirty.Add(PhoenicianUATrigger2)
	Events.SerialEventTurnTimerDirty.Add(PhoenicianUATrigger2)
	Events.SerialEventCityInfoDirty.Add(PhoenicianUATrigger2)
end
--=======================================================================================================================
-- Tooltip
--=======================================================================================================================
local tipControlTable = {}
TTManager:GetTypeControlTable("TooltipTypeTopPanel", tipControlTable)

function PhoenicianGoldTipHandler( control )

	local strText = ""
	local iPlayerID = Game.GetActivePlayer()
	local pPlayer = Players[iPlayerID]
	local pTeam = Teams[pPlayer:GetTeam()]
	local pCity = UI.GetHeadSelectedCity()
	
	local iTotalGold = pPlayer:GetGold()

	local iGoldPerTurnFromOtherPlayers = pPlayer:GetGoldPerTurnFromDiplomacy()
	local iGoldPerTurnToOtherPlayers = 0
	if (iGoldPerTurnFromOtherPlayers < 0) then
		iGoldPerTurnToOtherPlayers = -iGoldPerTurnFromOtherPlayers
		iGoldPerTurnFromOtherPlayers = 0
	end
	
	local iGoldPerTurnFromReligion = pPlayer:GetGoldPerTurnFromReligion()
	
	--Phoenicia Gold
	local iPhoenicianGoldBoost = (iScienceExport[iPlayerID] * iMod)

	local fTradeRouteGold = (pPlayer:GetGoldFromCitiesTimes100() - pPlayer:GetGoldFromCitiesMinusTradeRoutesTimes100()) / 100
	local fGoldPerTurnFromCities = pPlayer:GetGoldFromCitiesMinusTradeRoutesTimes100() / 100
	local fCityConnectionGold = pPlayer:GetCityConnectionGoldTimes100() / 100
	--local fInternationalTradeRouteGold = pPlayer:GetGoldPerTurnFromTradeRoutesTimes100() / 100
	local fTraitGold = pPlayer:GetGoldPerTurnFromTraits()
	local fTotalIncome = fGoldPerTurnFromCities + iGoldPerTurnFromOtherPlayers + fCityConnectionGold + iGoldPerTurnFromReligion + fTradeRouteGold + fTraitGold + iPhoenicianGoldBoost
	
	if (pPlayer:IsAnarchy()) then
		strText = strText .. Locale.ConvertTextKey("TXT_KEY_TP_ANARCHY", pPlayer:GetAnarchyNumTurns())
		strText = strText .. "[NEWLINE][NEWLINE]"
	end
	
	if (not OptionsManager.IsNoBasicHelp()) then
		strText = strText .. Locale.ConvertTextKey("TXT_KEY_TP_AVAILABLE_GOLD", iTotalGold)
		strText = strText .. "[NEWLINE][NEWLINE]"
	end
	
	strText = strText .. "[COLOR:150:255:150:255]"
	strText = strText .. "+" .. Locale.ConvertTextKey("TXT_KEY_TP_TOTAL_INCOME", math.floor(fTotalIncome))
	strText = strText .. "[NEWLINE]  [ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_TP_CITY_OUTPUT", fGoldPerTurnFromCities)
	strText = strText .. "[NEWLINE]  [ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_TP_GOLD_FROM_CITY_CONNECTIONS", math.floor(fCityConnectionGold))
	strText = strText .. "[NEWLINE]  [ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_TP_GOLD_FROM_ITR", math.floor(fTradeRouteGold))
	if (math.floor(fTraitGold) > 0) then
		strText = strText .. "[NEWLINE]  [ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_TP_GOLD_FROM_TRAITS", math.floor(fTraitGold))
	end
	if (iGoldPerTurnFromOtherPlayers > 0) then
		strText = strText .. "[NEWLINE]  [ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_TP_GOLD_FROM_OTHERS", iGoldPerTurnFromOtherPlayers)
	end
	if (iGoldPerTurnFromReligion > 0) then
		strText = strText .. "[NEWLINE]  [ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_TP_GOLD_FROM_RELIGION", iGoldPerTurnFromReligion)
	end

	--Phoenicia Tooltip
	if iPhoenicianGoldBoost > 0 then
		strText = strText .. "[NEWLINE]  [ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_TP_PHOENICIAN_GOLD", iPhoenicianGoldBoost)
	end
	
	strText = strText .. "[/COLOR]"
	
	local iUnitCost = pPlayer:CalculateUnitCost()
	local iUnitSupply = pPlayer:CalculateUnitSupply()
	local iBuildingMaintenance = pPlayer:GetBuildingGoldMaintenance()
	local iImprovementMaintenance = pPlayer:GetImprovementGoldMaintenance()
	local iTotalExpenses = iUnitCost + iUnitSupply + iBuildingMaintenance + iImprovementMaintenance + iGoldPerTurnToOtherPlayers
	
	strText = strText .. "[NEWLINE]"
	strText = strText .. "[COLOR:255:150:150:255]"
	strText = strText .. "[NEWLINE]-" .. Locale.ConvertTextKey("TXT_KEY_TP_TOTAL_EXPENSES", iTotalExpenses)
	if (iUnitCost ~= 0) then
		strText = strText .. "[NEWLINE]  [ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_TP_UNIT_MAINT", iUnitCost)
	end
	if (iUnitSupply ~= 0) then
		strText = strText .. "[NEWLINE]  [ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_TP_GOLD_UNIT_SUPPLY", iUnitSupply)
	end
	if (iBuildingMaintenance ~= 0) then
		strText = strText .. "[NEWLINE]  [ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_TP_GOLD_BUILDING_MAINT", iBuildingMaintenance)
	end
	if (iImprovementMaintenance ~= 0) then
		strText = strText .. "[NEWLINE]  [ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_TP_GOLD_TILE_MAINT", iImprovementMaintenance)
	end
	if (iGoldPerTurnToOtherPlayers > 0) then
		strText = strText .. "[NEWLINE]  [ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_TP_GOLD_TO_OTHERS", iGoldPerTurnToOtherPlayers)
	end
	strText = strText .. "[/COLOR]"
	
	if (fTotalIncome + iTotalGold < 0) then
		strText = strText .. "[NEWLINE][COLOR:255:60:60:255]" .. Locale.ConvertTextKey("TXT_KEY_TP_LOSING_SCIENCE_FROM_DEFICIT") .. "[/COLOR]"
	end
	
	-- Basic explanation of Happiness
	if (not OptionsManager.IsNoBasicHelp()) then
		strText = strText .. "[NEWLINE][NEWLINE]"
		strText = strText ..  Locale.ConvertTextKey("TXT_KEY_MC_PHOENICIA_TOPPANEL_GOLD")
	end
	
	--Controls.GoldPerTurn:SetToolTipString(strText)
	
	tipControlTable.TooltipLabel:SetText( strText )
	tipControlTable.TopPanelMouseover:SetHide(false)
	
	-- Autosize tooltip
	tipControlTable.TopPanelMouseover:DoAutoSize()
	
end
--=======================================================================================================================
--=======================================================================================================================