--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- MODS CHECKS
--------------------------------------------------------------------------------------------------------------------------
-- tcm_IsUsingCID
function tcm_IsUsingCID()
	local cidId = "10e9728f-d61c-4317-be4f-7d52d6bae6f4"
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if (mod.ID == cidId) then
			return true
		end
	end
	return false
end
local isUsingCID = tcm_IsUsingCID()
--------------------------------------------------------------------------------------------------------------------------
local Decisions_TCM_Bactria_Hellenize = {}
	Decisions_TCM_Bactria_Hellenize.Name = "TXT_KEY_DECISIONS_TCM_BACTRIA_HELLENIZE"
	Decisions_TCM_Bactria_Hellenize.Desc = "TXT_KEY_DECISIONS_TCM_BACTRIA_HELLENIZE_DESC"
	HookDecisionCivilizationIcon(Decisions_TCM_Bactria_Hellenize, "CIVILIZATION_TCM_BACTRIA")
	Decisions_TCM_Bactria_Hellenize.CanFunc = (
	function(player)
		if (player:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_TCM_BACTRIA"]) then return false, false end
		if load(player, "Decisions_TCM_Bactria_Hellenize") == true then
			Decisions_TCM_Bactria_Hellenize.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TCM_BACTRIA_HELLENIZE_ENACTED_DESC")
			return false, false, true
		end

		local yourReligion = player:GetReligionCreatedByPlayer()
		if yourReligion == nil or yourReligion == GameInfoTypes["RELIGION_PANTHEON"] then
			for religion in GameInfo.Religions() do
				if player:HasReligionInMostCities(religion.ID) and religion.ID ~= GameInfoTypes["RELIGION_PANTHEON"] then
					yourReligion = religion.ID
					break
				end
			end
		end
		local numFollowers = 0
		local numCities = 0
		for city in player:Cities() do 
			if city:GetOriginalOwner() ~= player:GetID() then numCities = numCities + 1 end 
			for religion in GameInfo.Religions() do
				if religion.ID ~= yourReligion then
					if city:GetNumFollowers(religion.ID) > 0 then
						numFollowers = numFollowers + city:GetNumFollowers(religion.ID)
					end
				end
			end
		end
		local gold = (300 + (player:GetCurrentEra() * 50)) * iMod
		local faith = (200 + (player:GetCurrentEra() * 30)) * iMod
		local points = (numFollowers * 8)
		Decisions_TCM_Bactria_Hellenize.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TCM_BACTRIA_HELLENIZE_DESC", gold, faith, points)
		if (player:GetNumResourceAvailable(iMagistrate, false) < 1) then return true, false end
		if player:GetGold() < gold then return true, false end
		if player:GetFaith() < faith then return true, false end
		if not(player:IsGoldenAge()) then return true, false end
		if (numCities < 4) then return true, false end
		return true, true
	end
	)
       
	Decisions_TCM_Bactria_Hellenize.DoFunc = (
	function(player)
		local yourReligion = player:GetReligionCreatedByPlayer()
		if yourReligion == nil or yourReligion == GameInfoTypes["RELIGION_PANTHEON"] then
			for religion in GameInfo.Religions() do
				if player:HasReligionInMostCities(religion.ID) then
					yourReligion = religion.ID
					break
				end
			end
		end
		local numFollowers = 0
		local numCities = 0
		for city in player:Cities() do 
			if city:GetOriginalOwner() ~= player:GetID() then numCities = numCities + 1 end 
			for religion in GameInfo.Religions() do
				if religion.ID ~= yourReligion then
					if city:GetNumFollowers(religion.ID) > 0 then
						numFollowers = numFollowers + city:GetNumFollowers(religion.ID)
					end
				end
			end
		end
		local points = (numFollowers * 8) * 100
		local gold = (300 + (player:GetCurrentEra() * 50)) * iMod
		local faith = (200 + (player:GetCurrentEra() * 30)) * iMod
		player:ChangeGold(-gold)
		player:ChangeFaith(-faith)
		player:ChangeNumResourceTotal(iMagistrate, -1)
		local capital = player:GetCapitalCity()
		capital:ChangeSpecialistGreatPersonProgressTimes100(GameInfoTypes["SPECIALIST_ARTIST"], points)
		for city in player:Cities() do
			if city:CanConstruct(GameInfoTypes["BUILDING_STADIUM"]) then city:SetNumRealBuilding(GameInfoTypes["BUILDING_STADIUM"], 1) end
			if city:CanConstruct(GameInfoTypes["BUILDING_EE_MENAGERIE"]) then city:SetNumRealBuilding(GameInfoTypes["BUILDING_EE_MENAGERIE"], 1) end
			if city:CanConstruct(GameInfoTypes["BUILDING_EE_TAVERN"]) then city:SetNumRealBuilding(GameInfoTypes["BUILDING_EE_TAVERN"], 1) end
			if city:CanConstruct(GameInfoTypes["BUILDING_THEATRE"]) then city:SetNumRealBuilding(GameInfoTypes["BUILDING_THEATRE"], 1) end
			if city:CanConstruct(GameInfoTypes["BUILDING_COLOSSEUM"]) then city:SetNumRealBuilding(GameInfoTypes["BUILDING_COLOSSEUM"], 1) end
		end
		save(player, "Decisions_TCM_Bactria_Hellenize", true)
	end
	)
       
Decisions_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_TCM_BACTRIA"], "Decisions_TCM_Bactria_Hellenize", Decisions_TCM_Bactria_Hellenize)

local Decisions_TCM_Bactria_Faraway_Lands = {}
	Decisions_TCM_Bactria_Faraway_Lands.Name = "TXT_KEY_DECISIONS_TCM_BACTRIA_FARAWAY_LANDS"
	Decisions_TCM_Bactria_Faraway_Lands.Desc = "TXT_KEY_DECISIONS_TCM_BACTRIA_FARAWAY_LANDS_DESC"
	HookDecisionCivilizationIcon(Decisions_TCM_Bactria_Faraway_Lands, "CIVILIZATION_TCM_BACTRIA")
	Decisions_TCM_Bactria_Faraway_Lands.CanFunc = (
	function(player)
		if (player:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_TCM_BACTRIA"]) then return false, false end
		if load(player, "Decisions_TCM_Bactria_Faraway_Lands") == player:GetCurrentEra() then
			Decisions_TCM_Bactria_Faraway_Lands.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TCM_BACTRIA_FARAWAY_LANDS_ENACTED_DESC")
			return false, false, true
		end
		local embassyNum = 0
		for iPlayer, otherPlayer in pairs(Players) do
			if Teams[player:GetTeam()]:HasEmbassyAtTeam(otherPlayer:GetTeam()) then
				embassyNum = embassyNum + 1
			end
		end
		local culture = (40 * (player:GetCurrentEra() + 1)) * iMod
		local gold = (60 * (embassyNum + 1)) * iMod
		if isUsingCID then
			Decisions_TCM_Bactria_Faraway_Lands.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TCM_BACTRIA_FARAWAY_LANDS_CID_DESC", culture, gold)
			if (player:GetNumResourceAvailable(GameInfoTypes["RESOURCE_JFD_DIGNITARIES"], false) < 1) then return true, false end
		else
			Decisions_TCM_Bactria_Faraway_Lands.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TCM_BACTRIA_FARAWAY_LANDS_DESC", culture, gold)
			if (player:GetNumResourceAvailable(iMagistrate, false) < 1) then return true, false end
		end
		if (player:GetJONSCulture() < culture) then return true, false end
		return true, true
	end
	)
       
	Decisions_TCM_Bactria_Faraway_Lands.DoFunc = (
	function(player)
		local embassyNum = 0
		for iPlayer, otherPlayer in pairs(Players) do
			if Teams[player:GetTeam()]:HasEmbassyAtTeam(otherPlayer:GetTeam()) then
				for city in otherPlayer:Cities() do
					for i = 0, city:GetNumCityPlots() - 1, 1 do
						local plot = city:GetCityIndexPlot( i )
						if plot:GetOwner() == otherPlayer:GetID() then
							plot:SetRevealed(player:GetTeam(), true)
							plot:UpdateFog()
						end
					end
				end
				embassyNum = embassyNum + 1
			end
		end
		local culture = ((50 * (player:GetCurrentEra() + 1)) + 25) * iMod
		local gold = (50 * (embassyNum + 1)) * iMod
		player:ChangeGold(gold)
		player:ChangeJONSCulture(-culture)
		if isUsingCID then
			player:ChangeNumResourceTotal(GameInfoTypes["RESOURCE_JFD_DIGNITARIES"], -1)
		else
			player:ChangeNumResourceTotal(iMagistrate, -1)
		end
		save(player, "Decisions_TCM_Bactria_Faraway_Lands", player:GetCurrentEra())
	end
	)
       
Decisions_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_TCM_BACTRIA"], "Decisions_TCM_Bactria_Faraway_Lands", Decisions_TCM_Bactria_Faraway_Lands)

