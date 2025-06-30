--=======================================================================================================================
print("Ket Decisions: loaded")
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
local civilizationID  = GameInfoTypes.CIVILIZATION_THP_KET
local mathCeil = math.ceil

-------------------------------------------------------------------------------------------------------------------------
-- Ket: Invoke the Allel Dolls
-------------------------------------------------------------------------------------------------------------------------
local bAllelDummy = GameInfoTypes.BUILDING_THP_KET_ALLEL
local fForest = GameInfoTypes.FEATURE_FOREST
local techPhilosophy = GameInfoTypes.TECH_PHILOSOPHY

local Decisions_THP_Ket_Allel = {}
	Decisions_THP_Ket_Allel.Name = "TXT_KEY_DECISIONS_THP_KET_ALLEL"
	Decisions_THP_Ket_Allel.Desc = "TXT_KEY_DECISIONS_THP_KET_ALLEL_DESC"
	HookDecisionCivilizationIcon(Decisions_THP_Ket_Allel, "CIVILIZATION_THP_KET")
	Decisions_THP_Ket_Allel.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationID then return false, false end
		if load(player, "Decisions_THP_Ket_Allel") then
			Decisions_THP_Ket_Allel.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_THP_KET_ALLEL_ENACTED_DESC")
			return false, false, true
		end
		local cultureCost = mathCeil(100*iMod)
		Decisions_THP_Ket_Allel.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_THP_KET_ALLEL_DESC", cultureCost)
		if not Teams[player:GetTeam()]:IsHasTech(techPhilosophy) then return true, false end
		if player:GetHappiness() >= 0 then return true, false end
		if player:GetJONSCulture() < cultureCost then return true, false end
		if player:GetNumResourceAvailable(iMagistrate, false) < 1 then return true, false end
		return true, true
	end
	)

	Decisions_THP_Ket_Allel.DoFunc = (
	function(player)
		local playerID = player:GetID()
		local cultureCost = mathCeil(100*iMod)
		player:ChangeNumResourceTotal(iMagistrate, -1)
		player:ChangeJONSCulture(-cultureCost)
		save(player, "Decisions_THP_Ket_Allel", true)
		JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_THP_KET_ALLEL", player:GetName(), player:GetCivilizationShortDescription(), player:GetCivilizationAdjective()))
	end
	)

	Decisions_THP_Ket_Allel.Monitors = {}
	Decisions_THP_Ket_Allel.Monitors[GameEvents.PlayerDoTurn] = (
	function(playerID)
		local pPlayer = Players[playerID]
		if load(pPlayer, "Decisions_THP_Ket_Allel") then
			for cCity in pPlayer:Cities() do
				for i = 0, cCity:GetNumCityPlots() - 1, 1 do
					local pPlot = cCity:GetCityIndexPlot(i)
					if pPlot:GetFeatureType() == fForest then
						if cCity:IsWorkingPlot() then
							cCity:SetNumRealBuilding(bAllelDummy, 1)
							break
						end
					end
				end
				cCity:SetNumRealBuilding(bAllelDummy, 0)
			end
		end
	end
	)

Decisions_AddCivilisationSpecific(civilizationID, "Decisions_THP_Ket_Allel", Decisions_THP_Ket_Allel)

-------------------------------------------------------------------------------------------------------------------------
-- Ket: Develop the Ilimka
-------------------------------------------------------------------------------------------------------------------------
local techNavigation = GameInfoTypes.TECH_NAVIGATION

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

function HasRiverCity(pPlayer)
	for cCity in pPlayer:Cities() do
		if cCity:Plot():IsRiver() then
			return true
		end
	end
	return false
end

local Decisions_THP_Ket_Ilimka = {}
	Decisions_THP_Ket_Ilimka.Name = "TXT_KEY_DECISIONS_THP_KET_ILIMKA"
	Decisions_THP_Ket_Ilimka.Desc = "TXT_KEY_DECISIONS_THP_KET_ILIMKA_DESC"
	HookDecisionCivilizationIcon(Decisions_THP_Ket_Ilimka, "CIVILIZATION_THP_KET")
	Decisions_THP_Ket_Ilimka.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationID then return false, false end
		if load(player, "Decisions_THP_Ket_Ilimka") then
			Decisions_THP_Ket_Ilimka.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_THP_KET_ILIMKA_ENACTED_DESC")
			return false, false, true
		end
		local goldCost = mathCeil(600*iMod)
		Decisions_THP_Ket_Ilimka.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_THP_KET_ILIMKA_DESC", goldCost)
		if not Teams[player:GetTeam()]:IsHasTech(techNavigation) then return true, false end
		if not HasTradeRouteWithMajor(player) then return true, false end
		if not HasRiverCity(player) then return true, false end
		if player:GetGold() < goldCost then return true, false end
		if player:GetNumResourceAvailable(iMagistrate, false) < 1 then return true, false end
		return true, true
	end
	)

	Decisions_THP_Ket_Ilimka.DoFunc = (
	function(player)
		local playerID = player:GetID()
		local goldCost = mathCeil(600*iMod)
		player:ChangeNumResourceTotal(iMagistrate, -1)
		player:ChangeGold(-goldCost)
		save(player, "Decisions_THP_Ket_Ilimka", true)
		JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_THP_KET_ILIMKA", player:GetName(), player:GetCivilizationShortDescription(), player:GetCivilizationAdjective()))
	end
	)

	Decisions_THP_Ket_Ilimka.Monitors = {}
	Decisions_THP_Ket_Ilimka.Monitors[GameEvents.PlayerDoTurn] = (
	function(playerID)
		local pPlayer = Players[playerID]
		if load(pPlayer, "Decisions_THP_Ket_Ilimka") then
			local tCheckedPlots = {}
			for cCity in pPlayer:Cities() do
				local iCityProductionIncrement = 0
				for i = 0, cCity:GetNumCityPlots() - 1, 1 do
					local pPlot = cCity:GetCityIndexPlot(i)
					if not tCheckedPlots[pPlot] then
						if pPlot:IsRiver() and pPlot:GetResourceType() ~= -1 then
							iCityProductionIncrement = iCityProductionIncrement + 1
						end
						tCheckedPlots[pPlot] = 1
					end
				end
				cCity:ChangeProduction(iCityProductionIncrement)
			end
		end
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationID, "Decisions_THP_Ket_Ilimka", Decisions_THP_Ket_Ilimka)

--
--
