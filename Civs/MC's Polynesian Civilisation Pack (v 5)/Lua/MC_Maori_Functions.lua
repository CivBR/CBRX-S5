--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ /// Maori functions \\\ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ///                   \\\ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--~~~ UA: Mana of Tumatauenga - Every time a unit is defeated in battle, receive 25% of the production  ~~~
--~~~                           cost towards that unit in the Capital. Melee units lower the combat     ~~~
--~~~                           strength of adjacent enemy units.                                       ~~~
--~~~      UU: Taiaha Warrior - Replaces Pikeman. Stronger, generates expereince faster. Nearby units   ~~~
--~~~                           have +5% combat strength. Upgrades to Musketman.                        ~~~
--~~                   UI: Pa - Requires Engineering. Must be built on a hill and cannot be built next  ~~~
--~~~                           to another Pa. Provides food and boosts the military production in a    ~~~
--~~~                           city by 5% when worked.                                                 ~~~
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\\\ ///~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
local iMaori = GameInfoTypes.CIVILIZATION_MC_MAORI

--=========================================================================================================
-- INCLUDES
--=========================================================================================================
include( "Sukritact_SaveUtils.lua" ); MY_MOD_NAME = "Maori_UA";

--=========================================================================================================
-- Utility Functions
--=========================================================================================================
-- JFD_IsCivilisationActive
-----------------------------------------------------------------------------------------------------------
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
-----------------------------------------------------------------------------------------------------------
-- InitUnitFromCity
-----------------------------------------------------------------------------------------------------------
function InitUnitFromCity(pCity, iUnitType, iNum)
	local tUnits = {}
	pPlayer = Players[pCity:GetOwner()]
	for i = 1, iNum do
		pUnit = pPlayer:InitUnit(iUnitType, pCity:GetX(), pCity:GetY())
		if not(pUnit:JumpToNearestValidPlot()) then return tUnits end
		
		table.insert(tUnits, pUnit)
		
		pUnit:SetExperience(pCity:GetDomainFreeExperience(pUnit:GetDomainType()))
		for promotion in GameInfo.UnitPromotions() do
			iPromotion = promotion.ID
				if (pCity:GetFreePromotionCount(iPromotion) > 0 and pUnit:IsPromotionValid(iPromotion)) then
				pUnit:SetHasPromotion(iPromotion, true)
			end
		end
		
	end
	return tUnits
end
-----------------------------------------------------------------------------------------------------------
-- GetRandom
-----------------------------------------------------------------------------------------------------------
function GetRandom(lower, upper)
    return (Game.Rand((upper + 1) - lower, "")) + lower
end

--=========================================================================================================
-- UA: Mana of Tumatauenga
-- Author: Sukritact
--=========================================================================================================
local iManaRate = 0.25
local iMaori = GameInfoTypes.CIVILIZATION_MC_MAORI

local tBarbUnits = {
	[GameInfoTypes.UNIT_BARBARIAN_WARRIOR] 	= GameInfoTypes.UNIT_WARRIOR,
	[GameInfoTypes.UNIT_BARBARIAN_ARCHER] 	= GameInfoTypes.UNIT_ARCHER,
	[GameInfoTypes.UNIT_BARBARIAN_SPEARMAN]	= GameInfoTypes.UNIT_SPEARMAN,
	[GameInfoTypes.UNIT_BARBARIAN_SWORDSMAN] = GameInfoTypes.UNIT_SWORDSMAN,
	[GameInfoTypes.UNIT_BARBARIAN_HORSEMAN]	= GameInfoTypes.UNIT_HORSEMAN,
}

local tStoredUnits = {}
for iPlayer, pPlayer in pairs(Players) do

	tStoredUnits[iPlayer] = {}
	
	for tUnit in GameInfo.Units() do
		local iStored = load(pPlayer, tUnit.ID)
		if iStored and iStored > 0 then
			tStoredUnits[iPlayer][tUnit.ID] = true
		end
	end
end

function UnitKilledInCombat_MaoriUA(iPlayer, iKilled, iUnitType)
	local pPlayer = Players[iPlayer]
	if (pPlayer:GetCivilizationType() ~= iMaori) then return end
	
	local pCity = pPlayer:GetCapitalCity()
	if not(pCity) then return end
	
	-- Certain Barbarian units must be converted to regular units
	if tBarbUnits[iUnitType] then iUnitType = tBarbUnits[iUnitType] end
	
	local tUnit = GameInfo.Units[iUnitType]
	
	-- Must be a Combat unit
	if tUnit.CombatLimit < 1 then return end
	
	-- Must be a unit that can be built
	local iCost = pCity:GetUnitProductionNeeded(iUnitType)
	if iCost < 1 then return end
	
	-- Define iDelta
	local iDelta = math.ceil(iManaRate * iCost)
	if iDelta < 1 then return end
	-- Check if it is not trainable by the player
	local bStore = pCity:CanTrain(iUnitType, 1)
	print(bStore)
	
	local sStr
	local sTitle = Locale.ConvertTextKey("TXT_KEY_TRAIT_MANA_OF_TUMATAUENGA_SHORT")
	
	-----------------------------------------
	-- For units you can train
	-----------------------------------------
	if bStore then	
		-- If you happen to have some production stored from before
		local iStored = load(pPlayer, iUnitType)
		if iStored and iStored > 0 then
			iDelta = iDelta + iStored
			tStoredUnits[iPlayer][iUnitType] = nil
			save(pPlayer, iUnitType, 0)
		end
	
		pCity:ChangeUnitProduction(iUnitType, iDelta)
		local iRemainder = (iCost - pCity:GetUnitProduction(iUnitType))
		if iRemainder < 1 then
			InitUnitFromCity(pCity, iUnitType, 1)
			pCity:SetUnitProduction(iUnitType, 0)
			sStr = Locale.ConvertTextKey("TXT_KEY_MAORI_UA_NOTIFICATION_2", Locale.ConvertTextKey(tUnit.Description))
		else
			sStr = Locale.ConvertTextKey("TXT_KEY_MAORI_UA_NOTIFICATION", Locale.ConvertTextKey(tUnit.Description), iDelta, iRemainder)
		end
	-----------------------------------------
	-- For units you can't train
	-----------------------------------------
	else
		tStoredUnits[iPlayer][iUnitType] = true
	
		local iStored = load(pPlayer, iUnitType)
		if not(iStored) then iStored = 0 end
		
		-- If you happen to have some production stored from before
		local iOldStored = pCity:GetUnitProduction(iUnitType)
		if iOldStored > 0 then iStored = iStored + iOldStored; pCity:SetUnitProduction(iUnitType, 0) end
		
		iStored = iDelta + iStored
		
		iRemainder = iCost - iStored
		if iRemainder < 1 then
			InitUnitFromCity(pCity, iUnitType, 1)
			save(pPlayer, iUnitType, 0)
			sStr = Locale.ConvertTextKey("TXT_KEY_MAORI_UA_NOTIFICATION_2", Locale.ConvertTextKey(tUnit.Description))
		else
			save(pPlayer, iUnitType, iStored)
			sStr = Locale.ConvertTextKey("TXT_KEY_MAORI_UA_NOTIFICATION", Locale.ConvertTextKey(tUnit.Description), iDelta, iRemainder)
		end
	end

	pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GREAT_PERSON_ACTIVE_PLAYER, sStr, sTitle, pCity:GetX(), pCity:GetY(), iUnitType)
end

function SpecificCityInfoDirty_MaoriUA(iPlayer, iCity, iUpdateType)

	if iUpdateType ~= CityUpdateTypes.CITY_UPDATE_TYPE_PRODUCTION then return end

	local iPlayer = Game.GetActivePlayer()
	local pPlayer = Players[iPlayer]

	if (pPlayer:GetCivilizationType() ~= iMaori) then return end
	if not(pPlayer:IsTurnActive()) then	return end

	local pCity = pPlayer:GetCityByID(iCity)
	
	if pCity:IsCapital() then
		for iUnitType, _ in pairs(tStoredUnits[iPlayer]) do
			if pCity:CanTrain(iUnitType, 1) then
				-- If you happen to have some production stored from before
				local iStored = load(pPlayer, iUnitType)
				if iStored and iStored > 0 then
					tStoredUnits[iPlayer][iUnitType] = nil
					save(pPlayer, iUnitType, 0)
				end
			
				pCity:ChangeUnitProduction(iUnitType, iStored)
				tStoredUnits[iPlayer][iUnitType] = nil
			end
		end
	end
	
end

if JFD_IsCivilisationActive(iMaori) then
	GameEvents.UnitKilledInCombat.Add(UnitKilledInCombat_MaoriUA)
	Events.SpecificCityInfoDirty.Add(SpecificCityInfoDirty_MaoriUA)
end

--=========================================================================================================
-- UU: Taiaha Warrior (boosts nearby units)
-- Author: JFD
--=========================================================================================================

function JFD_TaiahaWarrior(playerID)
	local player = Players[playerID]
	if player:IsAlive() and not player:IsBarbarian() and not player:IsMinorCiv() then
		for unit in player:Units() do
			local taiahaPromotion = GameInfoTypes["PROMOTION_MC_TAIAHA_COMBAT_BONUS"]
			if unit and unit:IsCombatUnit() then
				local taiahaWarriorNearby = false
				for taiahaWarrior in player:Units() do
					if taiahaWarrior:IsHasPromotion(GameInfoTypes["PROMOTION_MC_TAIAHA_WARRIOR"]) and taiahaWarrior ~= unit then
						if Map.PlotDistance(unit:GetX(), unit:GetY(), taiahaWarrior:GetX(), taiahaWarrior:GetY()) < 2 then
							taiahaWarriorNearby = true
						end
					end
				end
				
				if taiahaWarriorNearby then
					if not unit:IsHasPromotion(taiahaPromotion) then
						unit:SetHasPromotion(taiahaPromotion, true)
					end
				else
					if unit:IsHasPromotion(taiahaPromotion) then
						unit:SetHasPromotion(taiahaPromotion, false)
					end
				end
				
			else
				if unit:IsHasPromotion(taiahaPromotion) then
					unit:SetHasPromotion(taiahaPromotion, false)
				end
			end
		end
	end
end

GameEvents.UnitSetXY.Add(JFD_TaiahaWarrior) 
GameEvents.PlayerDoTurn.Add(JFD_TaiahaWarrior)

--=========================================================================================================
-- UI: Pa (Boosts military production when worked)
-- Author: JFD
--=========================================================================================================

function JFD_GetNumberWorkedPas(playerID, city)
	local numWorkedPas = 0
	for cityPlot = 0, city:GetNumCityPlots() - 1, 1 do
		local plot = city:GetCityIndexPlot(cityPlot)
		if plot then
			if plot:GetOwner() == playerID then
				if city:IsWorkingPlot(plot) then	
					if plot:GetImprovementType() == GameInfoTypes["IMPROVEMENT_MC_MAORI_PA"] then 
						numWorkedPas = numWorkedPas + 1
					end
				end
			end
		end
	end
	
	return numWorkedPas
end
	
function JFD_PaMilitaryProduction(playerID)
	local player = Players[playerID]
	if player:IsAlive() then
		for city in player:Cities() do
			city:SetNumRealBuilding(GameInfoTypes["BUILDING_PA_MILITARY_UNIT_PRODUCTION"], JFD_GetNumberWorkedPas(playerID, city))
		end
	end
end
GameEvents.PlayerDoTurn.Add(JFD_PaMilitaryProduction)
--=======================================================================================================================
--=======================================================================================================================