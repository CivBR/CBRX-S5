--=======================================================================================================================
-- Civ Specific Events
--=======================================================================================================================
-- Globals
--------------------------------------------------------------------------------------------------------------------------
local civilisationID = GameInfoTypes["CIVILIZATION_TCM_BACTRIA"]
--------------------------------------------------------------------------------------------------------------------------
-- Event_tcm_Bactria_Usurper
--------------------------------------------------------------------------------------------------------------------------
local Event_tcm_Bactria_Usurper = {}
	Event_tcm_Bactria_Usurper.Name = "TXT_KEY_EVENT_TCM_BACTRIA_USURPER"
	Event_tcm_Bactria_Usurper.Desc = "TXT_KEY_EVENT_TCM_BACTRIA_USURPER_DESC"
	Event_tcm_Bactria_Usurper.EventImage = 'Event_tcm_Usurper.dds'
	Event_tcm_Bactria_Usurper.Data1 = nil
	Event_tcm_Bactria_Usurper.Weight = 1
	Event_tcm_Bactria_Usurper.CanFunc = (
		function(player)			
			if load(player, "Event_tcm_Bactria_Usurper") == player:GetCurrentEra() then return false end
			if player:GetCivilizationType() ~= civilisationID then return false end
			local chosenCity = GetRandom(1, player:GetNumCities())
			for city in player:Cities() do
				if chosenCity <= 0 then
					Event_tcm_Bactria_Usurper.Data1 = city
					break
				else
					chosenCity = chosenCity - 1
				end
			end
			if Event_tcm_Bactria_Usurper.Data1 == nil then return false end
			Event_tcm_Bactria_Usurper.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_TCM_BACTRIA_USURPER_DESC", Event_tcm_Bactria_Usurper.Data1:GetNameKey())
			return true
		end
		)
	Event_tcm_Bactria_Usurper.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_tcm_Bactria_Usurper.Outcomes[1] = {}
	Event_tcm_Bactria_Usurper.Outcomes[1].Name = "TXT_KEY_EVENT_TCM_BACTRIA_USURPER_OUTCOME_1"
	Event_tcm_Bactria_Usurper.Outcomes[1].Desc = "TXT_KEY_EVENT_TCM_BACTRIA_USURPER_OUTCOME_RESULT_1"
	Event_tcm_Bactria_Usurper.Outcomes[1].CanFunc = (
		function(player)	
			Event_tcm_Bactria_Usurper.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_TCM_BACTRIA_USURPER_OUTCOME_RESULT_1", Event_tcm_Bactria_Usurper.Data1:GetNameKey())
			return true
		end
		)
	Event_tcm_Bactria_Usurper.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local cityX = Event_tcm_Bactria_Usurper.Data1:GetX() - 1
			local cityY = Event_tcm_Bactria_Usurper.Data1:GetY()

			local barb = nil
			for iBarbarian, pBarbarian in pairs(Players) do
				if (pBarbarian:IsBarbarian()) then
					barb = pBarbarian
				end
			end
			if barb then
				local iUnit = nil
				for unitType in GameInfo.Units() do
					if player:CanTrain(GameInfoTypes[unitType.Type]) and unitType.Domain == "DOMAIN_LAND" then
						if iUnit == nil then
							iUnit = GameInfoTypes[unitType.Type]
						elseif unitType.Combat > GameInfo.Units[iUnit].Combat then
							iUnit = GameInfoTypes[unitType.Type]
						end
					end
				end
				if iUnit ~= nil then
					barb:InitUnit(GameInfoTypes["UNIT_GREAT_GENERAL"], cityX, cityY):JumpToNearestValidPlot()
					barb:InitUnit(iUnit, cityX, cityY):JumpToNearestValidPlot()
					barb:InitUnit(iUnit, cityX, cityY):JumpToNearestValidPlot()
					barb:InitUnit(iUnit, cityX, cityY):JumpToNearestValidPlot()
					barb:InitUnit(iUnit, cityX, cityY):JumpToNearestValidPlot()
					player:SetNumFreePolicies(1)
					player:SetNumFreePolicies(0)
					player:SetHasPolicy(GameInfoTypes["POLICY_TCM_BACTRIA_DEFEAT_BARB_KING"], true)
				end
				Event_tcm_Bactria_Usurper.Data1:ChangeResistanceTurns(5)
			end
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_TCM_BACTRIA_USURPER_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_TCM_BACTRIA_USURPER"))
			save(player, "Event_tcm_Bactria_Usurper", player:GetCurrentEra())	
		end)
	
Events_AddCivilisationSpecific(civilisationID, "Event_tcm_Bactria_Usurper", Event_tcm_Bactria_Usurper)
--=======================================================================================================================
--=======================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
-- Event_tcm_Bactria_Ambassor
--------------------------------------------------------------------------------------------------------------------------
local Event_tcm_Bactria_Ambassor = {}
	Event_tcm_Bactria_Ambassor.Name = "TXT_KEY_EVENT_TCM_BACTRIA_AMBASSOR"
	Event_tcm_Bactria_Ambassor.Desc = "TXT_KEY_EVENT_TCM_BACTRIA_AMBASSOR_DESC"
	Event_tcm_Bactria_Ambassor.EventImage = 'Event_tcm_Ambassor.dds'
	Event_tcm_Bactria_Ambassor.Weight = 4
	Event_tcm_Bactria_Ambassor.CanFunc = (
		function(player)			
			if load(player, "Event_tcm_Bactria_Ambassor") == true then return false end
			if player:GetCivilizationType() ~= civilisationID then return false end
			return true
		end
		)
	Event_tcm_Bactria_Ambassor.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_tcm_Bactria_Ambassor.Outcomes[1] = {}
	Event_tcm_Bactria_Ambassor.Outcomes[1].Name = "TXT_KEY_EVENT_TCM_BACTRIA_AMBASSOR_OUTCOME_1"
	Event_tcm_Bactria_Ambassor.Outcomes[1].Desc = "TXT_KEY_EVENT_TCM_BACTRIA_AMBASSOR_OUTCOME_RESULT_1"
	Event_tcm_Bactria_Ambassor.Outcomes[1].CanFunc = (
		function(player)
			local cost = 250 * iMod
			if player:GetGold() < cost then return false end
			Event_tcm_Bactria_Ambassor.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_TCM_BACTRIA_AMBASSOR_OUTCOME_RESULT_1", cost)
			return true
		end
		)
	Event_tcm_Bactria_Ambassor.Outcomes[1].DoFunc = (
		function(player) 
			local cost = 250 * iMod
			local playerID = player:GetID()
			local capital = player:GetCapitalCity()
			local capitalX = capital:GetX()
			local capitalY = capital:GetY()
			player:ChangeGold(-cost)
			player:InitUnit(GameInfoTypes["UNIT_CARAVAN"], capitalX, capitalY)
			capital:SetNumRealBuilding(GameInfoTypes["BUILDING_TCM_BACTRIA_TRADE_ROUTE"], 1)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_TCM_BACTRIA_AMBASSOR_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_TCM_BACTRIA_AMBASSOR"))
			save(player, "Event_tcm_Bactria_Ambassor", true)	
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_tcm_Bactria_Ambassor.Outcomes[2] = {}
	Event_tcm_Bactria_Ambassor.Outcomes[2].Name = "TXT_KEY_EVENT_TCM_BACTRIA_AMBASSOR_OUTCOME_2"
	Event_tcm_Bactria_Ambassor.Outcomes[2].Desc = "TXT_KEY_EVENT_TCM_BACTRIA_AMBASSOR_OUTCOME_RESULT_2"
	Event_tcm_Bactria_Ambassor.Outcomes[2].CanFunc = (
		function(player)
			return true
		end
		)
	Event_tcm_Bactria_Ambassor.Outcomes[2].DoFunc = (
		function(player)
			local playerID = player:GetID()
			for city in player:Cities() do
				city:SetNumRealBuilding(GameInfoTypes["BUILDING_WALLS"], 1)
			end
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_TCM_BACTRIA_AMBASSOR_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_TCM_BACTRIA_AMBASSOR"))
			save(player, "Event_tcm_Bactria_Ambassor", true)	
		end)

Events_AddCivilisationSpecific(civilisationID, "Event_tcm_Bactria_Ambassor", Event_tcm_Bactria_Ambassor)