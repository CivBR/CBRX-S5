--===========================================================================================================================
-- JFD_SendWorldEvent
--===========================================================================================================================
function JFD_SendWorldEvent(playerID, description)
	local player = Players[playerID]
	local playerTeam = Teams[player:GetTeam()]
	local activePlayer = Players[Game.GetActivePlayer()]
	if (not player:IsHuman()) and playerTeam:IsHasMet(activePlayer:GetTeam()) then
		Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes["NOTIFICATION_DIPLOMACY_DECLARATION"], description, "[COLOR_POSITIVE_TEXT]World Events[ENDCOLOR]", -1, -1)
	end
end 
--===========================================================================================================================
local Event_Abraham_Zacuto = {}
	Event_Abraham_Zacuto.Name = "TXT_KEY_EVENT_ABRAHAM_ZACUTO"
	Event_Abraham_Zacuto.Desc = "TXT_KEY_EVENT_ABRAHAM_ZACUTO_DESC"
	Event_Abraham_Zacuto.EventImage = "Event_tcm_Zacuto.dds"
	Event_Abraham_Zacuto.Weight = 3
	Event_Abraham_Zacuto.CanFunc = ( 
		function(pPlayer)
			if (pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_TCM_AVIS_PORTUGAL) then return end
			if load(pPlayer, "Event_Abraham_Zacuto") then return end
			iReligion = pPlayer:GetReligionCreatedByPlayer()
			if (pPlayer.GetStateReligion) then
				if (pPlayer:GetStateReligion() ~= -1) then iReligion = pPlayer:GetStateReligion() end
			end
			if not(iReligion) or (iReligion == -1) then return end

			return true
		end
		)
	Event_Abraham_Zacuto.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_Abraham_Zacuto.Outcomes[1] = {}
	Event_Abraham_Zacuto.Outcomes[1].Name = "TXT_KEY_EVENT_ABRAHAM_ZACUTO_OUTCOME_1"
	Event_Abraham_Zacuto.Outcomes[1].Desc = "TXT_KEY_EVENT_ABRAHAM_ZACUTO_OUTCOME_1_DESC"
	Event_Abraham_Zacuto.Outcomes[1].CanFunc = (
		function(pPlayer)
			local iScience = math.ceil(20 * iMod * (pPlayer:GetCurrentEra() + 1))
			local scientist = 75
			Event_Abraham_Zacuto.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_ABRAHAM_ZACUTO_OUTCOME_1_DESC", iScience, scientist)
			return true
		end
		)
	Event_Abraham_Zacuto.Outcomes[1].DoFunc = (
		function(pPlayer)
			local iScience = math.ceil(20 * iMod * (pPlayer:GetCurrentEra() + 1))
			LuaEvents.Sukritact_ChangeResearchProgress(pPlayer:GetID(), iScience)

			local capital = pPlayer:GetCapitalCity()
			capital:ChangeSpecialistGreatPersonProgressTimes100(GameInfoTypes["SPECIALIST_SCIENTIST"], 7500)	

			save(pPlayer, "Event_Abraham_Zacuto", true)

			JFD_SendWorldEvent(pPlayer:GetID(), Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_ABRAHAM_ZACUTO_1"))
		
			JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC",
				Locale.ConvertTextKey("TXT_KEY_EVENT_ABRAHAM_ZACUTO_OUTCOME_1_NOTIFICATION"),
				Locale.ConvertTextKey("TXT_KEY_EVENT_ABRAHAM_ZACUTO")
			)
		end
		)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_Abraham_Zacuto.Outcomes[2] = {}
	Event_Abraham_Zacuto.Outcomes[2].Name = "TXT_KEY_EVENT_ABRAHAM_ZACUTO_OUTCOME_2"
	Event_Abraham_Zacuto.Outcomes[2].Desc = "TXT_KEY_EVENT_ABRAHAM_ZACUTO_OUTCOME_2_DESC"
	Event_Abraham_Zacuto.Outcomes[2].CanFunc = (
		function(pPlayer)
			local iFaith = math.ceil((100 + ((pPlayer:GetCurrentEra() + 1) * 50)) * iMod)
			Event_Abraham_Zacuto.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_ABRAHAM_ZACUTO_OUTCOME_2_DESC", iFaith)
			return true
		end
		)
	Event_Abraham_Zacuto.Outcomes[2].DoFunc = (
		function(pPlayer)
			local iFaith = math.ceil((100 + ((pPlayer:GetCurrentEra() + 1) * 50)) * iMod)
			pPlayer:ChangeFaith(iFaith)

			save(pPlayer, "Event_Abraham_Zacuto", true)

			JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC",
				Locale.ConvertTextKey("TXT_KEY_EVENT_ABRAHAM_ZACUTO_OUTCOME_2_NOTIFICATION"),
				Locale.ConvertTextKey("TXT_KEY_EVENT_ABRAHAM_ZACUTO")
			)
		end
		)

Events_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_TCM_AVIS_PORTUGAL, "Event_Abraham_Zacuto", Event_Abraham_Zacuto)
--===========================================================================================================================
local Event_Camoes = {}
	Event_Camoes.Name = "TXT_KEY_EVENT_CAMOES"
	Event_Camoes.Desc = "TXT_KEY_EVENT_CAMOES_DESC"
	Event_Camoes.EventImage = "Event_tcm_Camoes.dds"
	Event_Camoes.Weight = 4
	Event_Camoes.CanFunc = ( 
		function(pPlayer)
			if (pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_TCM_AVIS_PORTUGAL) then return end
			if pPlayer:GetCurrentEra() < GameInfoTypes.ERA_RENAISSANCE then return end
			if not(pPlayer:HasAvailableGreatWorkSlot(GameInfoTypes["GREAT_WORK_SLOT_LITERATURE"])) then return end
			if load(pPlayer, "Event_Camoes") then return end
			return true
		end
		)
	Event_Camoes.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_Camoes.Outcomes[1] = {}
	Event_Camoes.Outcomes[1].Name = "TXT_KEY_EVENT_CAMOES_OUTCOME_1"
	Event_Camoes.Outcomes[1].Desc = "TXT_KEY_EVENT_CAMOES_OUTCOME_1_DESC"
	Event_Camoes.Outcomes[1].CanFunc = (
		function(pPlayer)
			local iGold = math.ceil(250 * iMod)
			if (pPlayer:GetGold() < iGold) then return end
			if not(pPlayer:HasAvailableGreatWorkSlot(GameInfoTypes["GREAT_WORK_SLOT_LITERATURE"])) then return end
			local iCulture = math.ceil(100 * iMod)
			Event_Camoes.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_CAMOES_OUTCOME_1_DESC", iGold, iCulture)
			return true
		end
		)
	Event_Camoes.Outcomes[1].DoFunc = (
		function(pPlayer)
			local iGold = math.ceil(250 * iMod)
			pPlayer:ChangeGold(-iGold)

			local iCulture = math.ceil(100 * iMod)
			pPlayer:ChangeJONSCulture(iCulture)

			local capitalX = pPlayer:GetCapitalCity():GetX()
			local capitalY = pPlayer:GetCapitalCity():GetY()
			pPlayer:InitUnit(GameInfoTypes["UNIT_TCM_CAMOES"], capitalX, capitalY):PushMission(GameInfoTypes["MISSION_CREATE_GREAT_WORK"])

			save(pPlayer, "Event_Camoes", true)

			JFD_SendWorldEvent(pPlayer:GetID(), Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_CAMOES_1"))

			JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC",
				Locale.ConvertTextKey("TXT_KEY_EVENT_CAMOES_OUTCOME_1_NOTIFICATION"),
				Locale.ConvertTextKey("TXT_KEY_EVENT_CAMOES")
			)
		end
		)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_Camoes.Outcomes[2] = {}
	Event_Camoes.Outcomes[2].Name = "TXT_KEY_EVENT_CAMOES_OUTCOME_2"
	Event_Camoes.Outcomes[2].Desc = "TXT_KEY_EVENT_CAMOES_OUTCOME_2_DESC"
	Event_Camoes.Outcomes[2].CanFunc = (
		function(pPlayer)
			return true
		end
		)
	Event_Camoes.Outcomes[2].DoFunc = (
		function(pPlayer)
			local capitalX = pPlayer:GetCapitalCity():GetX()
			local capitalY = pPlayer:GetCapitalCity():GetY()
			pPlayer:InitUnit(GameInfoTypes["UNIT_SCOUT"], capitalX, capitalY):ChangeExperience(80)

			save(pPlayer, "Event_Camoes", true)

			JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC",
				Locale.ConvertTextKey("TXT_KEY_EVENT_CAMOES_OUTCOME_2_NOTIFICATION"),
				Locale.ConvertTextKey("TXT_KEY_EVENT_CAMOES")
			)
		end
		)

Events_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_TCM_AVIS_PORTUGAL, "Event_Camoes", Event_Camoes)
--===========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
-- Event_Vasco
--------------------------------------------------------------------------------------------------------------------------
local Event_tcm_Vasco = {}
	Event_tcm_Vasco.Name = "TXT_KEY_EVENT_VASCO"
	Event_tcm_Vasco.Desc = "TXT_KEY_EVENT_VASCO_DESC"
	Event_tcm_Vasco.EventImage = 'Event_tcm_Vasco.dds'
	Event_tcm_Vasco.Data1 = {}
	Event_tcm_Vasco.Data2 = nil
	Event_tcm_Vasco.Weight = 6
	Event_tcm_Vasco.CanFunc = (
		function(player)
			if load(player, "Event_tcm_Vasco") == true then return false end
			if player:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_TCM_AVIS_PORTUGAL"] then return false end
			Event_tcm_Vasco.Data1 = {}
			for iCS, pCS in pairs(Players) do
				if (pCS:IsAlive() and pCS:IsMinorCiv() and not(Teams[player:GetTeam()]:IsHasMet(pCS:GetTeam()))) then
					table.insert(Event_tcm_Vasco.Data1, pCS)
				end
			end
			if #Event_tcm_Vasco.Data1 < 1 then return false end
			Event_tcm_Vasco.Data2 = Event_tcm_Vasco.Data1[GetRandom(1, #Event_tcm_Vasco.Data1)]
			Event_tcm_Vasco.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_VASCO_DESC", Event_tcm_Vasco.Data2:GetCivilizationShortDescription())
			return true
		end
		)
	Event_tcm_Vasco.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_tcm_Vasco.Outcomes[1] = {}
	Event_tcm_Vasco.Outcomes[1].Name = "TXT_KEY_EVENT_VASCO_OUTCOME_1"
	Event_tcm_Vasco.Outcomes[1].Desc = "TXT_KEY_EVENT_VASCO_OUTCOME_1_DESC"
	Event_tcm_Vasco.Outcomes[1].CanFunc = (
		function(player)	
			local iGoldRate = player:CalculateGoldRate()
			if iGoldRate > 100 then iGoldRate = 100 end
			local iReward = math.ceil(iGoldRate * iMod * 10)
			local iAltReward = math.ceil(5 * iMod * 10)
			if iReward < iAltReward then iReward = iAltReward end

			Event_tcm_Vasco.Outcomes[1].Name = Locale.ConvertTextKey("TXT_KEY_EVENT_VASCO_OUTCOME_1", Event_tcm_Vasco.Data2:GetCivilizationShortDescription())
			Event_tcm_Vasco.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_VASCO_OUTCOME_1_DESC", Event_tcm_Vasco.Data2:GetCivilizationShortDescription(), iReward)
			return true
		end
		)
	Event_tcm_Vasco.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
		
			local capitalX = player:GetCapitalCity():GetX()
			local capitalY = player:GetCapitalCity():GetY()
			player:InitUnit(GameInfoTypes["UNIT_CARGO_SHIP"], capitalX, capitalY)

			local iGoldRate = player:CalculateGoldRate()
			if iGoldRate > 100 then iGoldRate = 100 end
			local iReward = math.ceil(iGoldRate * iMod * 10)
			local iAltReward = math.ceil(5 * iMod * 10)
			if iReward < iAltReward then iReward = iAltReward end
			player:ChangeGold(iReward)

			Teams[player:GetTeam()]:Meet(Event_tcm_Vasco.Data2:GetTeam())


			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_VASCO_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_VASCO"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_VASCO_1", Event_tcm_Vasco.Data2:GetCivilizationShortDescription())) 
			save(player, "Event_tcm_Vasco", true)	
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_tcm_Vasco.Outcomes[2] = {}
	Event_tcm_Vasco.Outcomes[2].Name = "TXT_KEY_EVENT_VASCO_OUTCOME_2"
	Event_tcm_Vasco.Outcomes[2].Desc = "TXT_KEY_EVENT_VASCO_OUTCOME_2_DESC"
	Event_tcm_Vasco.Outcomes[2].CanFunc = (
		function(player)
			local iGoldRate = player:CalculateGoldRate()
			if iGoldRate > 100 then iGoldRate = 100 end
			local iReward = math.ceil(iGoldRate * iMod * 10)
			local iAltReward = math.ceil(5 * iMod * 10)
			if iReward < iAltReward then iReward = iAltReward end

			Event_tcm_Vasco.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_VASCO_OUTCOME_2_DESC", Event_tcm_Vasco.Data2:GetCivilizationShortDescription(), iReward)
			return true
		end
		)
	Event_tcm_Vasco.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()

			local capitalX = player:GetCapitalCity():GetX()
			local capitalY = player:GetCapitalCity():GetY()
			player:InitUnit(GameInfoTypes["UNIT_GREAT_ADMIRAL"], capitalX, capitalY)

			local iGoldRate = player:CalculateGoldRate()
			if iGoldRate > 100 then iGoldRate = 100 end
			local iReward = math.ceil(iGoldRate * iMod * 10)
			local iAltReward = math.ceil(5 * iMod * 10)
			if iReward < iAltReward then iReward = iAltReward end
			player:ChangeGold(iReward)

			Teams[player:GetTeam()]:Meet(Event_tcm_Vasco.Data2:GetTeam())

			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_VASCO_OUTCOME_RESULT_2_NOTIFICATION_B", Event_tcm_Vasco.Data2:GetCivilizationAdjectiveKey()), Locale.ConvertTextKey("TXT_KEY_EVENT_VASCO"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_VASCO_2_B", Event_tcm_Vasco.Data2:GetCivilizationShortDescription())) 
			save(player, "Event_tcm_Vasco", true)	
		end)
	
Events_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_TCM_AVIS_PORTUGAL"], "Event_tcm_Vasco", Event_tcm_Vasco)	
