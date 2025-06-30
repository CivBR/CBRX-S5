--=======================================================================================================================
print("Tang Decisions: loaded")
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- MOD CHECKS
-------------------------------------------------------------------------------------------------------------------------
function JFD_IsEDActive()
	local iEDID = "1f941088-b185-4159-865c-472df81247b2"
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if (mod.ID == iEDID) then
			return true
		end
	end
	return false
end
local bIsEDActive = JFD_IsEDActive()
-------------------------------------------------------------------------------------------------------------------------
-- UTILITIES
-------------------------------------------------------------------------------------------------------------------------
-- JFD_SendWorldEvent
function JFD_SendWorldEvent(playerID, description)
	local player = Players[playerID]
	local playerTeam = Teams[player:GetTeam()]
	local activePlayer = Players[Game.GetActivePlayer()]
	if (not player:IsHuman()) and playerTeam:IsHasMet(activePlayer:GetTeam()) then
		Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes["NOTIFICATION_DIPLOMACY_DECLARATION"], description, "[COLOR_POSITIVE_TEXT]World Events[ENDCOLOR]", -1, -1)
	end
end 
--=======================================================================================================================
-- DECISIONS
--=======================================================================================================================
-- GLOBALS
-------------------------------------------------------------------------------------------------------------------------
local civilizationID  = GameInfoTypes.CIVILIZATION_THP_TANG
local mathCeil = math.ceil

-------------------------------------------------------------------------------------------------------------------------
-- Tang: Develop Woodblock Printing
-------------------------------------------------------------------------------------------------------------------------
local bShuyuan = GameInfoTypes.BUILDING_THP_SHUYUAN
local techPrinting = GameInfoTypes.TECH_PRINTING_PRESS

local Decisions_THP_Tang_Printing = {}
	Decisions_THP_Tang_Printing.Name = "TXT_KEY_DECISIONS_THP_TANG_PRINTING"
	Decisions_THP_Tang_Printing.Desc = "TXT_KEY_DECISIONS_THP_TANG_PRINTING_DESC"
	HookDecisionCivilizationIcon(Decisions_THP_Tang_Printing, "CIVILIZATION_THP_TANG")
	Decisions_THP_Tang_Printing.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationID then return false, false end
		if load(player, "Decisions_THP_Tang_Printing") then
			Decisions_THP_Tang_Printing.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_THP_TANG_PRINTING_ENACTED_DESC")
			return false, false, true
		end
		local goldCost = mathCeil(300*iMod)
		local cultureCost = mathCeil(200*iMod)
		Decisions_THP_Tang_Printing.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_THP_TANG_PRINTING_DESC", goldCost, cultureCost)
		if player:GetGold() < goldCost then return true, false end
		if player:GetJONSCulture() < cultureCost then return true, false end
		if player:CountNumBuildings(bShuyuan) < 2 then return true, false end
		if player:GetNumResourceAvailable(iMagistrate, false) < 1 then return true, false end
		return true, true
	end
	)

	Decisions_THP_Tang_Printing.DoFunc = (
	function(player)
		local playerID = player:GetID()
		local goldCost = mathCeil(300*iMod)
		local cultureCost = mathCeil(200*iMod)
		player:ChangeNumResourceTotal(iMagistrate, -1)
		player:ChangeGold(-goldCost)
		player:ChangeJONSCulture(-cultureCost)
		local team = Teams[player:GetTeam()]
		local bIsRedundant = team:GetTeamTechs():HasTech(techPrinting)
        	team:SetHasTech(techPrinting, true)
		save(player, "Decisions_THP_Tang_Printing", true)
		if bIsRedundant then
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_THP_TANG_PRINTING_REDUNDANT", player:GetName(), player:GetCivilizationShortDescription(), player:GetCivilizationAdjective()))
		else
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_THP_TANG_PRINTING", player:GetName(), player:GetCivilizationShortDescription(), player:GetCivilizationAdjective()))
		end
	end
	)

Decisions_AddCivilisationSpecific(civilizationID, "Decisions_THP_Tang_Printing", Decisions_THP_Tang_Printing)

-------------------------------------------------------------------------------------------------------------------------
-- Tang: Patronize the Tea Horse Road
-------------------------------------------------------------------------------------------------------------------------
local pTeaHorsePolicy = GameInfoTypes.POLICY_THP_TANG_TEAHORSES
local resHorses = GameInfoTypes.RESOURCE_HORSE

function HasTradeRouteWithMajor(pPlayer)
	local tTrades = pPlayer:GetTradeRoutes()
	for k, v in pairs(tTrades) do
		local pReceiver = Players[v.ToID]
		if pReceiver ~= pPlayer and not pReceiver:IsMinorCiv() then
			return true
		end
	end
	return false
end

local Decisions_THP_Tang_TeaHorses = {}
	Decisions_THP_Tang_TeaHorses.Name = "TXT_KEY_DECISIONS_THP_TANG_TEAHORSES"
	Decisions_THP_Tang_TeaHorses.Desc = "TXT_KEY_DECISIONS_THP_TANG_TEAHORSES_DESC"
	HookDecisionCivilizationIcon(Decisions_THP_Tang_TeaHorses, "CIVILIZATION_THP_TANG")
	Decisions_THP_Tang_TeaHorses.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationID then return false, false end
		if load(player, "Decisions_THP_Tang_TeaHorses") then
			Decisions_THP_Tang_TeaHorses.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_THP_TANG_TEAHORSES_ENACTED_DESC")
			return false, false, true
		end
		local goldCost = mathCeil(350*iMod)
		Decisions_THP_Tang_TeaHorses.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_THP_TANG_TEAHORSES_DESC", goldCost)
		if not HasTradeRouteWithMajor(player) then return true, false end
		if player:GetGold() < goldCost then return true, false end
		if player:GetNumResourceAvailable(iMagistrate, false) < 1 then return true, false end
		return true, true
	end
	)

	Decisions_THP_Tang_TeaHorses.DoFunc = (
	function(player)
		local playerID = player:GetID()
		local goldCost = mathCeil(350*iMod)
		player:ChangeNumResourceTotal(iMagistrate, -1)
		player:ChangeGold(-goldCost)
        	player:SetNumFreePolicies(1)
		player:SetNumFreePolicies(0)
		player:SetHasPolicy(pTeaHorsePolicy, true)
		save(player, "Decisions_THP_Tang_TeaHorses", true)
		JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_THP_TANG_TEAHORSES", player:GetName(), player:GetCivilizationShortDescription(), player:GetCivilizationAdjective()))
	end
	)

	Decisions_THP_Tang_TeaHorses.Monitors = {}
	Decisions_THP_Tang_TeaHorses.Monitors[GameEvents.PlayerDoTurn] = (
	function(playerID)
		local pPlayer = Players[playerID]
		if load(pPlayer, "Decisions_THP_Tang_TeaHorses") then
			local tLuxes = load(pPlayer, "THP_TangLuxuriesTable")
			local iNumLuxes = 0
			local iPriorNumLuxes = load(pPlayer, "THP_TangPriorLuxes")
			-- ideally this whole if statement will only trigger the first time this function is called
			if not tLuxes then
				tLuxes = {}
				local iKey = 1
				for row in DB.Query("SELECT Type FROM Resources WHERE ResourceClassType = 'RESOURCECLASS_LUXURY'") do
					tLux[iKey] = row.Type
					iKey = iKey + 1
				end
				save(pPlayer, "THP_TangLuxuriesTable", tLuxes)
			end
			for k, v in pairs(tLuxes) do
				if pPlayer:GetNumResourceTotal(v) > 0 then
					iNumLuxes = iNumLuxes + 1
				end
			end
			save(pPlayer, "THP_TangPriorLuxes", iNumLuxes)
			local iNumToChangeBy = iNumLuxes - iPriorNumLuxes
			pPlayer:ChangeNumResourceTotal(resHorses, iNumToChangeBy)
		end
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationID, "Decisions_THP_Tang_TeaHorses", Decisions_THP_Tang_TeaHorses)

--
--
