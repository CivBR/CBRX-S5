tDecisions.Decisions_PortugalCasaDaIndia = nil
tDecisions.Decisions_PortugalTradeTaxes = nil

--------------------------------------------------------------------------------------------------------------------------
-- Portugal: Institute the Casa da Índia
--------------------------------------------------------------------------------------------------------------------------

local Decisions_PortugalCasaDaIndia = {}
    Decisions_PortugalCasaDaIndia.Name = "TXT_KEY_DECISIONS_PORTUGALCASADAINDIA"
	Decisions_PortugalCasaDaIndia.Desc = "TXT_KEY_DECISIONS_PORTUGALCASADAINDIA_DESC"
	HookDecisionCivilizationIcon(Decisions_PortugalCasaDaIndia, "CIVILIZATION_TCM_AVIS_PORTUGAL")
	Decisions_PortugalCasaDaIndia.CanFunc = (
	function(pPlayer)
		if pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_TCM_AVIS_PORTUGAL then return false, false end
		if load(pPlayer, "Decisions_PortugalCasaDaIndia") == true then
			Decisions_PortugalCasaDaIndia.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_PORTUGALCASADAINDIA_ENACTED_DESC")
			return false, false, true
		end
		local iCost = math.ceil(300 * iMod)
		Decisions_PortugalCasaDaIndia.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_PORTUGALCASADAINDIA_DESC", iCost)
		if pPlayer:GetCurrentEra() < GameInfoTypes.ERA_MEDIEVAL then return true, false end
		if (pPlayer:GetGold() < iCost) then	return true, false end
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 1) then return true, false end
		if (pPlayer:GetNumInternationalTradeRoutesUsed() < pPlayer:GetNumInternationalTradeRoutesAvailable()) then return true, false end
		
		return true, true		
	end
	)
	
	Decisions_PortugalCasaDaIndia.DoFunc = (
	function(pPlayer)
		local iCost = math.ceil(300 * iMod)
		pPlayer:ChangeGold(-iCost)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -1)
		pPlayer:GetCapitalCity():SetNumRealBuilding(GameInfoTypes.BUILDING_DECISIONS_PORTUGALCASADAINDIA, 1)
		save(pPlayer, "Decisions_PortugalCasaDaIndia", true)
	end
	)
	
	Decisions_PortugalCasaDaIndia.Monitors = {}
	Decisions_PortugalCasaDaIndia.Monitors[GameEvents.PlayerDoTurn] =  (	
	function(iPlayer)
		local pPlayer = Players[iPlayer]
		if load(pPlayer, "Decisions_PortugalCasaDaIndia") == true then
			pPlayer:GetCapitalCity():SetNumRealBuilding(GameInfoTypes.BUILDING_DECISIONS_PORTUGALCASADAINDIA, 1)
		end
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_TCM_AVIS_PORTUGAL, "Decisions_PortugalCasaDaIndia", Decisions_PortugalCasaDaIndia)

--------------------------------------------------------------------------------------------------------------------------
-- Portugal: Collect Trade Taxes
--------------------------------------------------------------------------------------------------------------------------

local Decisions_PortugalTradeTaxes = {}
    Decisions_PortugalTradeTaxes.Name = "TXT_KEY_DECISIONS_PORTUGALTRADETAXES"
	Decisions_PortugalTradeTaxes.Desc = "TXT_KEY_DECISIONS_PORTUGALTRADETAXES_DESC"
	HookDecisionCivilizationIcon(Decisions_PortugalTradeTaxes, "CIVILIZATION_TCM_AVIS_PORTUGAL")
	Decisions_PortugalTradeTaxes.CanFunc = (
	function(pPlayer)
		if pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_TCM_AVIS_PORTUGAL then return false, false end
		
		local iEra = load(pPlayer, "Decisions_PortugalTradeTaxes")
		local iCurrentEra = pPlayer:GetCurrentEra()
		if iEra ~= nil then
			if iEra < iCurrentEra then
				save(pPlayer, "Decisions_PortugalTradeTaxes", nil)
			else
				Decisions_PortugalTradeTaxes.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_PORTUGALTRADETAXES_ENACTED_DESC")
				return false, false, true
			end
		end
		
		local iNumUnits = 0
		for pUnit in pPlayer:Units() do
			if (pUnit:GetDomainType() == DomainTypes.DOMAIN_SEA and (pUnit:IsCombatUnit() or pUnit:IsTrade())) then
				iNumUnits = iNumUnits + 1
			end
		end
		local iReward = math.ceil(iNumUnits * iMod * 200)
		Decisions_PortugalTradeTaxes.Data1 = iReward
		Decisions_PortugalTradeTaxes.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_PORTUGALTRADETAXES_DESC", iReward)
		if iNumUnits < 8 then return true, false end
		
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 2) then return true, false end
		if not(Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_NAVIGATION)) then return true, false end
		
		return true, true
	end
	)
	
	Decisions_PortugalTradeTaxes.DoFunc = (
	function(pPlayer, iReward)
		pPlayer:ChangeGold(iReward)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -2)
		save(pPlayer, "Decisions_PortugalTradeTaxes", pPlayer:GetCurrentEra())
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_TCM_AVIS_PORTUGAL, "Decisions_PortugalTradeTaxes", Decisions_PortugalTradeTaxes)







local Decisions_TCM_Portugal_Brazil_Prefab = {}
	Decisions_TCM_Portugal_Brazil_Prefab.Name = "TXT_KEY_DECISIONS_TCM_PORTUGAL_BRAZIL_PREFAB"
	Decisions_TCM_Portugal_Brazil_Prefab.Desc = "TXT_KEY_DECISIONS_TCM_PORTUGAL_BRAZIL_PREFAB_DESC"
	HookDecisionCivilizationIcon(Decisions_TCM_Portugal_Brazil_Prefab, "CIVILIZATION_PORTUGAL")
	Decisions_TCM_Portugal_Brazil_Prefab.CanFunc = (
	function(pPlayer)
		if (pPlayer:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_PORTUGAL"]) then return false, false end
		if load(pPlayer, "Decisions_TCM_Portugal_Brazil_Prefab") == true then
			Decisions_TCM_Portugal_Brazil_Prefab.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TCM_PORTUGAL_BRAZIL_PREFAB_ENACTED_DESC")
			return false, false, true
		end
		local gold = math.ceil(500 * iMod)
		Decisions_TCM_Portugal_Brazil_Prefab.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TCM_PORTUGAL_BRAZIL_PREFAB_DESC", gold)
		if pPlayer:GetNumResourceAvailable(iMagistrate, false) < 2 then return true, false end
		if pPlayer:GetGold() < gold then return true, false end
		if not(Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_ARCHITECTURE)) then return true, false end
		return true, true
	end
	)
       
	Decisions_TCM_Portugal_Brazil_Prefab.DoFunc = (
	function(pPlayer)
		local gold = math.ceil(500 * iMod)
		pPlayer:ChangeGold(-gold)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -2)
		pPlayer:SetNumFreePolicies(1)
        pPlayer:SetNumFreePolicies(0)
        pPlayer:SetHasPolicy(GameInfoTypes["POLICY_TCM_PORTUGAL_BRAZIL_PREFAB"], true)
		save(pPlayer, "Decisions_TCM_Portugal_Brazil_Prefab", true)
	end
	)
       
Decisions_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_PORTUGAL"], "Decisions_TCM_Portugal_Brazil_Prefab", Decisions_TCM_Portugal_Brazil_Prefab)

local Decisions_TCM_Portugal_Brazil_Wine = {}
	Decisions_TCM_Portugal_Brazil_Wine.Name = "TXT_KEY_DECISIONS_TCM_PORTUGAL_BRAZIL_WINE"
	Decisions_TCM_Portugal_Brazil_Wine.Desc = "TXT_KEY_DECISIONS_TCM_PORTUGAL_BRAZIL_WINE_DESC"
	HookDecisionCivilizationIcon(Decisions_TCM_Portugal_Brazil_Wine, "CIVILIZATION_PORTUGAL")
	Decisions_TCM_Portugal_Brazil_Wine.CanFunc = (
	function(pPlayer)
		if (pPlayer:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_PORTUGAL"]) then return false, false end
		if load(pPlayer, "Decisions_TCM_Portugal_Brazil_Wine") == true then
			Decisions_TCM_Portugal_Brazil_Wine.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TCM_PORTUGAL_BRAZIL_WINE_ENACTED_DESC")
			return false, false, true
		end
		local culture = math.ceil(200 * iMod)
		Decisions_TCM_Portugal_Brazil_Wine.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TCM_PORTUGAL_BRAZIL_WINE_DESC", culture)
		if pPlayer:GetNumResourceAvailable(iMagistrate, false) < 1 then return true, false end
		if pPlayer:GetJONSCulture() < culture then return true, false end
		if pPlayer:GetNumResourceTotal(GameInfoTypes["RESOURCE_WINE"]) < 4 then return true, false end
		return true, true
	end
	)
       
	Decisions_TCM_Portugal_Brazil_Wine.DoFunc = (
	function(pPlayer)
		local culture = math.ceil(200 * iMod)
		local capital = pPlayer:GetCapitalCity()
		pPlayer:ChangeJONSCulture(-culture)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -1)
		pPlayer:SetNumFreePolicies(1)
        pPlayer:SetNumFreePolicies(0)
        pPlayer:SetHasPolicy(GameInfoTypes["POLICY_TCM_PORTUGAL_BRAZIL_WINE"], true)
        capital:SetNumRealBuilding(GameInfoTypes["BUILDING_TCM_PORTUGAL_BRAZIL_TRADE_ROUTE"], 1)
		save(pPlayer, "Decisions_TCM_Portugal_Brazil_Wine", true)
	end
	)
       
Decisions_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_PORTUGAL"], "Decisions_TCM_Portugal_Brazil_Wine", Decisions_TCM_Portugal_Brazil_Wine)
