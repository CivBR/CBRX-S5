-- Anishinaabe Decisions
-- Author: Sukritact
--=======================================================================================================================

print("Anishinaabe Decisions: loaded")

--=======================================================================================================================
-- Anishinaabe Decisions
--=======================================================================================================================
-- Anishinaabe: Begin the use of Birch Bark Scrolls
-------------------------------------------------------------------------------------------------------------------------

local Decisions_AnishinaabeScrolls = {}
	Decisions_AnishinaabeScrolls.Name = "TXT_KEY_DECISIONS_ANISHINAABESCROLLS"
	Decisions_AnishinaabeScrolls.Desc = "TXT_KEY_DECISIONS_ANISHINAABESCROLLS_DESC"
	HookDecisionCivilizationIcon(Decisions_AnishinaabeScrolls, "CIVILIZATION_CLANISHINAABE")
	Decisions_AnishinaabeScrolls.CanFunc = (
	function(pPlayer)
		if pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_CLANISHINAABE then return false, false end

		local iCount = load(pPlayer, "Decisions_AnishinaabeScrollsCount") or 0
		local iDelta = math.ceil(iCount * 25 * iMod)
		Decisions_AnishinaabeScrolls.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_ANISHINAABESCROLLS_DESC", iDelta)


		if load(pPlayer, "Decisions_AnishinaabeScrolls") == true then
			Decisions_AnishinaabeScrolls.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_ANISHINAABESCROLLS_ENACTED_DESC", iDelta)
			return false, false, true
		end

		-- Check number of Midew earned
		if iCount < 2 then return true, false end

		-- Get num Magistrates
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 2) then return true, false end

		-- Find Capital
		local pCity = pPlayer:GetCapitalCity()
		if pCity == nil then
			return true, false
		end

		-- Find Midew
		pMidew = nil
		local pPlot = pCity:Plot()
		local iNumUnits = pPlot:GetNumUnits()
		for iVal = 0,(iNumUnits - 1) do
			local pUnit = pPlot:GetUnit(iVal)
			if (pUnit:GetUnitType() == GameInfoTypes.UNIT_CLMIDEW) then
				pMidew = pUnit
				break
			end
		end
		if not(pMidew) then return true, false end

		return true, true
	end
	)
	
	Decisions_AnishinaabeScrolls.DoFunc = (
	function(pPlayer)

		-- Find Capital
		local pCity = pPlayer:GetCapitalCity()
		if pCity == nil then
			return true, false
		end

		-- Find Midew
		pMidew = nil
		local pPlot = pCity:Plot()
		local iNumUnits = pPlot:GetNumUnits()
		for iVal = 0,(iNumUnits - 1) do
			local pUnit = pPlot:GetUnit(iVal)
			if (pUnit:GetUnitType() == GameInfoTypes.UNIT_CLMIDEW) then
				pMidew = pUnit
				break
			end
		end
		if not(pMidew) then return true, false end

		pMidew:Kill()
		pPlayer:ChangeNumResourceTotal(iMagistrate, -2)
		save(pPlayer, "Decisions_AnishinaabeScrolls", true)
	end
	)

	Decisions_AnishinaabeScrolls.Monitors = {}
	Decisions_AnishinaabeScrolls.Monitors[GameEvents.GreatPersonExpended] =  (	
		function(iPlayer, iUnitType)
			local pPlayer = Players[iPlayer]
			if not(load(pPlayer, "Decisions_AnishinaabeScrolls")) then return end

			local iCount = load(pPlayer, "Decisions_AnishinaabeScrollsCount") or 0
			local iDelta = math.ceil(iCount * 25 * iMod)

			if iDelta > 0 then
				pPlayer:ChangeFaith(iDelta)
				LuaEvents.Sukritact_ChangeResearchProgress(pPlayer:GetID(), iDelta)
			end

		end
	)

function Decisions_AnishinaabeScrollsMonitor(iPlayer, iUnit)
	local pPlayer = Players[iPlayer]
	local pUnit = pPlayer:GetUnitByID(iUnit)

	if pUnit:GetUnitType() ~= GameInfoTypes.UNIT_CLMIDEW then return end
	if load(pPlayer, iUnit) then return end

	local iCount = load(pPlayer, "Decisions_AnishinaabeScrollsCount") or 0
	save(pPlayer, "Decisions_AnishinaabeScrollsCount", iCount + 1)
	save(pPlayer, iUnit, true)
end
if (JFD_IsCivilisationActive(GameInfoTypes.CIVILIZATION_CLANISHINAABE)) then
	Events.SerialEventUnitCreated.Add(Decisions_AnishinaabeScrollsMonitor)
end

Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_CLANISHINAABE, "Decisions_AnishinaabeScrolls", Decisions_AnishinaabeScrolls)

--------------------------------------------------------------------------------------------------------------------------
-- Anishinaabe: Convene the Council of Three Fires
--------------------------------------------------------------------------------------------------------------------------

local Decisions_AnishinaabeCouncil = {}
	Decisions_AnishinaabeCouncil.Name = "TXT_KEY_DECISIONS_ANISHINAABECOUNCIL"
	Decisions_AnishinaabeCouncil.Desc = "TXT_KEY_DECISIONS_ANISHINAABECOUNCIL_DESC"
	HookDecisionCivilizationIcon(Decisions_AnishinaabeCouncil, "CIVILIZATION_CLANISHINAABE")
	Decisions_AnishinaabeCouncil.CanFunc = (
	function(pPlayer)
		if pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_CLANISHINAABE then return false, false end
		if load(pPlayer, "Decisions_AnishinaabeCouncil") == true then
			Decisions_AnishinaabeCouncil.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_ANISHINAABECOUNCIL_ENACTED_DESC")
			return false, false, true
		end

		local iNumCities = pPlayer:GetNumCities()
		local iEra = 1 + (pPlayer:GetCurrentEra() * 0.1)

		local iDelta1 = math.ceil(33 * iNumCities * iMod * iEra)
		local iDelta2 = math.ceil(15 * iNumCities * iMod * iEra)

		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 1) then return true, false end

		Decisions_AnishinaabeCouncil.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_ANISHINAABECOUNCIL_DESC", iDelta1, iDelta2, iDelta1 * 2)

		if iNumCities < 3 then return true, false end
		if pPlayer:GetNumPolicyBranchesFinished() < 1 then return true, false end

		return true, true
	end
	)
	
	Decisions_AnishinaabeCouncil.DoFunc = (
	function(pPlayer)
		save(pPlayer, "Decisions_AnishinaabeCouncil", true)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -1)
		LuaEvents.PushRandomEventPopup(pPlayer, Decisions_AnishinaabeCouncil.Popup)
	end
	)

	Decisions_AnishinaabeCouncil.Monitors = {}
	Decisions_AnishinaabeCouncil.Monitors[LuaEvents.PlayerEnteredNewEra] = (
	function(iPlayer)
		local pPlayer = Players[iPlayer]
		if load(pPlayer, "Decisions_AnishinaabeCouncil") then
			save(pPlayer, "Decisions_AnishinaabeCouncil", false)
		end
	end
	)
	
--------------------------------------------------------------------------------------------------------------------------
-- Anishinaabe: Convene the Council of Three Fires -- Popup
--------------------------------------------------------------------------------------------------------------------------

	Decisions_AnishinaabeCouncil.Popup = {}
    Decisions_AnishinaabeCouncil.Popup.Name = "TXT_KEY_DECISIONS_ANISHINAABECOUNCIL"
    Decisions_AnishinaabeCouncil.Popup.Desc = "TXT_KEY_EVENT_ANISHINAABECOUNCIL_DESC"
	Decisions_AnishinaabeCouncil.Popup.Weight = 0
	Decisions_AnishinaabeCouncil.Popup.CanFunc = (
		function(pPlayer)
	    	if pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_CLANISHINAABE then return false end
			return true
		end
		)
	Decisions_AnishinaabeCouncil.Popup.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Decisions_AnishinaabeCouncil.Popup.Outcomes[1] = {}
	Decisions_AnishinaabeCouncil.Popup.Outcomes[1].Name = "TXT_KEY_EVENT_ANISHINAABECOUNCIL_OUTCOME_3"
	Decisions_AnishinaabeCouncil.Popup.Outcomes[1].Desc = "TXT_KEY_EVENT_ANISHINAABECOUNCIL_OUTCOME_3_DESC"
	Decisions_AnishinaabeCouncil.Popup.Outcomes[1].CanFunc = (
		function(pPlayer)
			if load(pPlayer, "Event_AnishinaabeCouncil") == 1 then return end

			local iNumCities = pPlayer:GetNumCities()	
			local iEra = 1 + (pPlayer:GetCurrentEra() * 0.1)
			local iDelta1 = math.ceil(33 * iNumCities * iMod * iEra)
			Decisions_AnishinaabeCouncil.Popup.Outcomes[1].Desc = Locale.ConvertTextKey('TXT_KEY_EVENT_ANISHINAABECOUNCIL_OUTCOME_3_DESC', iDelta1)

			return true
		end
		)
	Decisions_AnishinaabeCouncil.Popup.Outcomes[1].DoFunc = (
		function(pPlayer)

			local iNumCities = pPlayer:GetNumCities()	
			local iEra = 1 + (pPlayer:GetCurrentEra() * 0.1)
			local iDelta1 = math.ceil(33 * iNumCities * iMod * iEra)
			pPlayer:ChangeJONSCulture(iDelta1)
		

			save(pPlayer, "Event_AnishinaabeCouncil", 1)
		end
		)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Decisions_AnishinaabeCouncil.Popup.Outcomes[2] = {}
	Decisions_AnishinaabeCouncil.Popup.Outcomes[2].Name = "TXT_KEY_EVENT_ANISHINAABECOUNCIL_OUTCOME_1"
	Decisions_AnishinaabeCouncil.Popup.Outcomes[2].Desc = "TXT_KEY_EVENT_ANISHINAABECOUNCIL_OUTCOME_1_DESC"
	Decisions_AnishinaabeCouncil.Popup.Outcomes[2].CanFunc = (
		function(pPlayer)
			if load(pPlayer, "Event_AnishinaabeCouncil") == 2 then return end

			local iNumCities = pPlayer:GetNumCities()	
			local iEra = 1 + (pPlayer:GetCurrentEra() * 0.1)
			local iDelta1 = math.ceil(33 * iNumCities * iMod * iEra)
			local iDelta2 = math.ceil(15 * iNumCities * iMod * iEra)
			Decisions_AnishinaabeCouncil.Popup.Outcomes[2].Desc = Locale.ConvertTextKey('TXT_KEY_EVENT_ANISHINAABECOUNCIL_OUTCOME_1_DESC', iDelta1 , iDelta2)

			return true
		end
		)
	Decisions_AnishinaabeCouncil.Popup.Outcomes[2].DoFunc = (
		function(pPlayer)
			local iNumCities = pPlayer:GetNumCities()	
			local iEra = 1 + (pPlayer:GetCurrentEra() * 0.1)
			local iDelta1 = math.ceil(33 * iNumCities * iMod * iEra)
			local iDelta2 = math.ceil(15 * iNumCities * iMod * iEra)

			pPlayer:ChangeFaith(iDelta1)
			LuaEvents.Sukritact_ChangeResearchProgress(pPlayer:GetID(), iDelta2)

			save(pPlayer, "Event_AnishinaabeCouncil", 2)
		end
		)
	--=========================================================
	-- Outcome 3
	--=========================================================
	Decisions_AnishinaabeCouncil.Popup.Outcomes[3] = {}
	Decisions_AnishinaabeCouncil.Popup.Outcomes[3].Name = "TXT_KEY_EVENT_ANISHINAABECOUNCIL_OUTCOME_2"
	Decisions_AnishinaabeCouncil.Popup.Outcomes[3].Desc = "TXT_KEY_EVENT_ANISHINAABECOUNCIL_OUTCOME_2_DESC"
	Decisions_AnishinaabeCouncil.Popup.Outcomes[3].CanFunc = (
		function(pPlayer)
			if load(pPlayer, "Event_AnishinaabeCouncil") == 3 then return end

			local iNumCities = pPlayer:GetNumCities()	
			local iEra = 1 + (pPlayer:GetCurrentEra() * 0.1)
			local iDelta1 = math.ceil(33 * iNumCities * iMod * iEra) * 2
			Decisions_AnishinaabeCouncil.Popup.Outcomes[3].Desc = Locale.ConvertTextKey('TXT_KEY_EVENT_ANISHINAABECOUNCIL_OUTCOME_2_DESC', iDelta1)

			return true
		end
		)
	Decisions_AnishinaabeCouncil.Popup.Outcomes[3].DoFunc = (
		function(pPlayer)

			local iNumCities = pPlayer:GetNumCities()	
			local iEra = 1 + (pPlayer:GetCurrentEra() * 0.1)
			local iDelta1 = math.ceil(33 * iNumCities * iMod * iEra) * 2
			pPlayer:ChangeGold(iDelta1)

			save(pPlayer, "Event_AnishinaabeCouncil", 3)
		end
		)	
Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_CLANISHINAABE, "Decisions_AnishinaabeCouncil", Decisions_AnishinaabeCouncil)