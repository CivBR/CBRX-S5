
-- Phoenician Decisions
-- Author: Sukritact
--=======================================================================================================================

print("Phoenician Decisions: loaded")

--=======================================================================================================================
-- Civ Specific Decisions
--=======================================================================================================================
-- Phoenicia: Help construct the Grand Temple
-------------------------------------------------------------------------------------------------------------------------

local Decisions_PhoenicianSolomon = {}
	Decisions_PhoenicianSolomon.Name = "TXT_KEY_DECISIONS_PHOENICIANSOLOMON"
	Decisions_PhoenicianSolomon.Desc = "TXT_KEY_DECISIONS_PHOENICIANSOLOMON_DESC"
	HookDecisionCivilizationIcon(Decisions_PhoenicianSolomon, "CIVILIZATION_MC_PHOENICIA")
	Decisions_PhoenicianSolomon.CanFunc = (
	function(pPlayer)
		if pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_MC_PHOENICIA then return false, false end
		if load(pPlayer, "Decisions_PhoenicianSolomon") == true then
			Decisions_PhoenicianSolomon.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_PHOENICIANSOLOMON_ENACTED_DESC")
			return false, false, true
		end
		
		local iCost = math.ceil(400 * iMod)
		Decisions_PhoenicianSolomon.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_PHOENICIANSOLOMON_DESC", iCost)
		if pPlayer:GetGold() < iCost then return true, false end
		
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 2) then return true, false end
		
		local tCSFriendly = {}
		Decisions_PhoenicianSolomon.Data1 = nil
		for iLPlayer, pLPlayer in pairs(Players) do
			if pLPlayer:IsEverAlive() then
				if (pLPlayer:IsAlive() and pLPlayer:IsMinorCiv() and (pLPlayer:IsFriends(pPlayer:GetID()) or pLPlayer:IsAllies(pPlayer:GetID()))) then
					table.insert(tCSFriendly, iLPlayer)
				end
			end
		end
		if #tCSFriendly < 1 then
			print("No Friendlies")
			return true, false
		end
		Decisions_PhoenicianSolomon.Data1 = Players[tCSFriendly[GetRandom(1, #tCSFriendly)]]
		
		return true, true
	end
	)
	
	Decisions_PhoenicianSolomon.DoFunc = (
	function(pPlayer, pCityState)
		local iCost = math.ceil(400 * iMod)	
		pPlayer:ChangeNumResourceTotal(iMagistrate, -2)
		pPlayer:ChangeGold(-iCost)		
		pPlayer:GetCapitalCity():SetNumRealBuilding(GameInfoTypes.BUILDING_DECISIONS_PHOENICIANSOLOMON, 1)
		pCityState:ChangeMinorCivFriendshipWithMajor(pPlayer:GetID(), 80)
		save(pPlayer, "Decisions_PhoenicianSolomon", true)
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_MC_PHOENICIA, "Decisions_PhoenicianSolomon", Decisions_PhoenicianSolomon)
-------------------------------------------------------------------------------------------------------------------------
-- Phoenicia: Trade for Resources
-------------------------------------------------------------------------------------------------------------------------
local Decisions_PhoenicianTrade = {}
	Decisions_PhoenicianTrade.Name = "TXT_KEY_DECISIONS_PHOENICIANTRADE"
	Decisions_PhoenicianTrade.Desc = "TXT_KEY_DECISIONS_PHOENICIANTRADE_DESC"
	Decisions_PhoenicianTrade.tLuxuries = {}
	for tResource in GameInfo.Resources("ResourceUsage = 2") do
		table.insert(Decisions_PhoenicianTrade.tLuxuries, tResource.ID)
	end
	Decisions_PhoenicianTrade.CanFunc = (
	function(pPlayer)
		if pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_MC_PHOENICIA then return false, false end
		
		if load(pPlayer, "Decisions_PhoenicianTrade") == nil then
			save(pPlayer, "Decisions_PhoenicianTrade", 0)
		end
		
		local tYourResources = {}
		for iKey, iResource in ipairs(Decisions_PhoenicianTrade.tLuxuries) do
			if (pPlayer:GetNumResourceTotal(iResource, false) > 0) then
				tYourResources[iResource] = true
			end
		end
		
		local tCSResources = {}
		for iCityState, pCityState in pairs(Players) do
			if pCityState:IsEverAlive() and pCityState:IsMinorCiv() and pCityState:IsAlive() and (Teams[pPlayer:GetTeam()]:IsHasMet(pCityState:GetTeam())) then
				for iKey, iResource in ipairs(Decisions_PhoenicianTrade.tLuxuries) do
					if (pCityState:GetNumResourceTotal(iResource, false) > 0) then
						tCSResources[iResource] = true
					end
				end
			end
		end
		-------------------------------------
		-- Begin Decision Generation
		-------------------------------------				
		for iResource, _ in pairs(tCSResources) do
			
			local sKey = "Decisions_PhoenicianTrade" .. iResource
			local tResource = GameInfo.Resources[iResource]
			
			tTempDecisions[sKey] = {}
			tTempDecisions[sKey].Name = Locale.ConvertTextKey("TXT_KEY_DECISIONS_PHOENICIANTRADE", tResource.Description)
			tTempDecisions[sKey].Desc = "TXT_KEY_DECISIONS_PHOENICIANTRADE_DESC"
			tTempDecisions[sKey].Data1 = tResource
			tTempDecisions[sKey].Weight = function(pPlayer, tResource) return tResource.OnlyMinorCivs end
			tTempDecisions[sKey].Type = "Civilization"
			HookDecisionCivilizationIcon(tTempDecisions[sKey], "CIVILIZATION_MC_PHOENICIA")
			tTempDecisions[sKey].CanFunc = (
			function(pPlayer, tResource)
			
				local iResource = tResource.ID
				local sKey = "Decisions_PhoenicianTrade" .. iResource
				local sName = tResource.Description
				local sIcon = tResource.IconString
				
				if load(pPlayer, sKey) == true then
					tTempDecisions[sKey].Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_PHOENICIANTRADE_ENACTED_DESC", sName, sIcon)
					return false, false, true
				end
				if tYourResources[iResource] then return false, false end
				if load(pPlayer, "Decisions_PhoenicianTrade") >= 3 then return false, false end
				
				tTempDecisions[sKey].Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_PHOENICIANTRADE_DESC", sName, sIcon)
				
				if (pPlayer:GetNumResourceAvailable(GameInfoTypes.RESOURCE_MC_TYRIAN_DYES, false) < 1) then return true, false end
				if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 1) then return true, false end
				
				return true, true
			end
			)
			
			tTempDecisions[sKey].DoFunc = (
			function(pPlayer, tResource)
				local iResource = tResource.ID
				local sKey = "Decisions_PhoenicianTrade" .. iResource
				
				pPlayer:ChangeNumResourceTotal(iMagistrate, -1)
				pPlayer:ChangeNumResourceTotal(GameInfoTypes.RESOURCE_MC_TYRIAN_DYES, -1)
				pPlayer:ChangeNumResourceTotal(iResource , 1)
				save(pPlayer, "Decisions_PhoenicianTradeJewelry", true)
				
				local iTimes = load(pPlayer, "Decisions_PhoenicianTrade") + 1
				save(pPlayer, "Decisions_PhoenicianTrade", iTimes)
				save(pPlayer, sKey, true)
			end
			)
		end
		-------------------------------------
		-- End Decision Generation
		-------------------------------------	
	end
	)

Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_MC_PHOENICIA, "Decisions_PhoenicianTrade", Decisions_PhoenicianTrade)

--[[
-------------------------------------------------------------------------------------------------------------------------
-- Phoenicia: Trade for Jewelry
-------------------------------------------------------------------------------------------------------------------------

local Decisions_PhoenicianTradeJewelry = {}
	Decisions_PhoenicianTradeJewelry.Name = Locale.ConvertTextKey("TXT_KEY_DECISIONS_PHOENICIANTRADE", Locale.ConvertTextKey(GameInfo.Resources.RESOURCE_JEWELRY.Description))
	Decisions_PhoenicianTradeJewelry.Desc = "TXT_KEY_DECISIONS_PHOENICIANTRADE_DESC"
	HookDecisionCivilizationIcon(Decisions_PhoenicianTradeJewelry, "CIVILIZATION_MC_PHOENICIA")
	Decisions_PhoenicianTradeJewelry.CanFunc = (
	function(pPlayer)
		if pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_MC_PHOENICIA then return false, false end
		local sName = GameInfo.Resources.RESOURCE_JEWELRY.Description
		local sIcon = GameInfo.Resources.RESOURCE_JEWELRY.IconString
		if load(pPlayer, "Decisions_PhoenicianTradeJewelry") == true then
			Decisions_PhoenicianTradeJewelry.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_PHOENICIANTRADE_ENACTED_DESC", sName, sIcon)
			return false, false, true
		end
		
		Decisions_PhoenicianTradeJewelry.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_PHOENICIANTRADE_DESC", sName, sIcon)
		if (pPlayer:GetNumResourceAvailable(GameInfoTypes.RESOURCE_MC_TYRIAN_DYES, false) < 1) then return true, false end
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 1) then return true, false end
		
		local bHasMet = false
		for iCityState, pCityState in pairs(Players) do
			if pCityState:IsEverAlive() then
				if pCityState:IsMinorCiv() then
					if pCityState:GetNumResourceTotal(GameInfoTypes.RESOURCE_JEWELRY , false) > 0 then
						if pCityState:IsAlive() and (Teams[pPlayer:GetTeam()]:IsHasMet(pCityState:GetTeam())) then
							bHasMet = true
							break
						end
					end
				end
			end
		end
		if bHasMet then return true, true else return true, false end
	end
	)
	
	Decisions_PhoenicianTradeJewelry.DoFunc = (
	function(pPlayer)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -1)
		pPlayer:ChangeNumResourceTotal(GameInfoTypes.RESOURCE_MC_TYRIAN_DYES, -1)
		pPlayer:ChangeNumResourceTotal(GameInfoTypes.RESOURCE_JEWELRY , 1)
		save(pPlayer, "Decisions_PhoenicianTradeJewelry", true)
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_MC_PHOENICIA, "Decisions_PhoenicianTradeJewelry", Decisions_PhoenicianTradeJewelry)
]]