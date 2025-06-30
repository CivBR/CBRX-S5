--=====================================================================================================================================================================
--=====================================================================================================================================================================
WARN_NOT_SHARED = false; include( "SaveUtils" ); MY_MOD_NAME = "tcmBactria";
--=====================================================================================================================================================================
local civilizationID 	= GameInfoTypes["CIVILIZATION_TCM_BACTRIA"]
local unitTypeID 		= GameInfoTypes["UNIT_TCM_ELEPHANTARCH"]
local improvementID 	= GameInfoTypes["IMPROVEMENT_TCM_PHROURIA"]
--=====================================================================================================================================================================
--=====================================================================================================================================================================
--Trait
--=====================================================================================================================================================================
function cityCapturedCounter(iOldOwner, bIsCapital, iX, iY, iNewOwner, iPop, bConquest)
	local player = Players[iNewOwner]
	if player:GetCivilizationType() == civilizationID then
		local recordedCities = load(player, "tcmRecordedNumCities") if recordedCities == nil then recordedCities = 0 end
		recordedCities = recordedCities + 1
		save(player, "tcmRecordedNumCities", recordedCities)
		--LevelUp
		local enemyPlayer = Players[iOldOwner]
		if load(player, "tcmKilled" .. iOldOwner) == nil then
			local unitClass
			for unique in GameInfo.Civilization_UnitClassOverrides() do
				local civilizationString = GameInfo.Civilizations[enemyPlayer:GetCivilizationType()].Type
				if unique.CivilizationType == civilizationString then
					unitClass = unique.UnitClassType
				end
			end
			for unit in player:Units() do
				if unit:GetUnitClassType() == GameInfoTypes[unitClass] then
					unit:ChangeExperience(15)
				end
			end
			save(player, "tcmHasThePowerOf" .. unitClass, true)
			save(player, "tcmKilled" .. iOldOwner, true)
		end
		--
	end
end
GameEvents.CityCaptureComplete.Add(cityCapturedCounter)

function happinessFromSettling(iPlayer, iCityX, iCityY)
	local player = Players[iPlayer]
	if player:GetCivilizationType() == civilizationID then
		local capital = player:GetCapitalCity()
		local recordedCities = load(player, "tcmRecordedNumCities") if recordedCities == nil then recordedCities = 0 end
		capital:SetNumRealBuilding(GameInfoTypes["BUILDING_TCM_DUMMY_BACTRIA"], recordedCities)
		for city in player:Cities() do
			local numResistance = city:GetResistanceTurns()
			city:ChangeResistanceTurns(-numResistance)
		end
	end
end
GameEvents.PlayerCityFounded.Add(happinessFromSettling)

function producedUnit(ownerId, cityId, unitId, bGold, bFaithOrCulture)
	local player = Players[ownerId]
	if player:GetCivilizationType() == civilizationID then
		local unit = player:GetUnitByID(unitId)
		local unitType = unit:GetUnitType()
		local unitClass = GameInfo.Units[unitType].Class
		if load(player, "tcmHasThePowerOf" .. unitClass) == true then
			unit:ChangeExperience(15)
		end
		if unitType == unitTypeID then
			local city = player:GetCityByID(cityId)
			local food = math.floor(city:GetBaseYieldRate(YieldTypes.YIELD_FOOD) * 0.27)
			unit:ChangeExperience(food)
		end
	end
end
GameEvents.CityTrained.Add(producedUnit)
--=====================================================================================================================================================================
--Elephantarch
--=====================================================================================================================================================================
function elepantarchcharge(playerID, unitID, unitX, unitY)
	local player = Players[playerID]
	local unit = player:GetUnitByID(unitID)
	if unit:GetUnitType() == unitTypeID then
		if unit:IsHasPromotion(GameInfoTypes["PROMOTION_TCM_ELEPHANT_CHARGE_4"]) then
			unit:SetHasPromotion(GameInfoTypes["PROMOTION_TCM_ELEPHANT_CHARGE_5"], true)
			unit:SetHasPromotion(GameInfoTypes["PROMOTION_TCM_ELEPHANT_CHARGE_4"], false)
		elseif unit:IsHasPromotion(GameInfoTypes["PROMOTION_TCM_ELEPHANT_CHARGE_3"]) then
			unit:SetHasPromotion(GameInfoTypes["PROMOTION_TCM_ELEPHANT_CHARGE_4"], true)
			unit:SetHasPromotion(GameInfoTypes["PROMOTION_TCM_ELEPHANT_CHARGE_3"], false)
		elseif unit:IsHasPromotion(GameInfoTypes["PROMOTION_TCM_ELEPHANT_CHARGE_2"]) then
			unit:SetHasPromotion(GameInfoTypes["PROMOTION_TCM_ELEPHANT_CHARGE_3"], true)
			unit:SetHasPromotion(GameInfoTypes["PROMOTION_TCM_ELEPHANT_CHARGE_2"], false)
		elseif unit:IsHasPromotion(GameInfoTypes["PROMOTION_TCM_ELEPHANT_CHARGE_1"]) then
			unit:SetHasPromotion(GameInfoTypes["PROMOTION_TCM_ELEPHANT_CHARGE_2"], true)
			unit:SetHasPromotion(GameInfoTypes["PROMOTION_TCM_ELEPHANT_CHARGE_1"], false)
		else
			unit:SetHasPromotion(GameInfoTypes["PROMOTION_TCM_ELEPHANT_CHARGE_1"], true)
		end
		save(player,"hadElephantarchCharge", true)
	end
end
GameEvents.UnitSetXY.Add(elepantarchcharge)
--=====================================================================================================================================================================
--Phrouria
--=====================================================================================================================================================================
function phrouria(playerID)
	local player = Players[playerID]
	if player:GetImprovementCount(improvementID) > 0 or load(player,"hadPhrouriaLastTurn") == true then
		for city in player:Cities() do
			local plot = city:Plot()
			local numExtraCitizens = 0
			local previousExtraCitizens = load(plot, "lastNumExtraCitizens") if previousExtraCitizens == nil then previousExtraCitizens = 0 end
			for i = 0, city:GetNumCityPlots() - 1, 1 do
				local plot = city:GetCityIndexPlot( i )
				if plot ~= nil then
					if plot:GetOwner() == playerID and plot:GetImprovementType() == improvementID and city:IsWorkingPlot(plot) then
						for i = 0, plot:GetNumUnits() - 1, 1 do  
							local unit = plot:GetUnit(i)
							if unit:IsCombatUnit() then
								numExtraCitizens = numExtraCitizens + 1
								break
							end
						end
					end
				end 
			end
			save(plot, "lastNumExtraCitizens", numExtraCitizens)
			numExtraCitizens = numExtraCitizens - previousExtraCitizens
			if numExtraCitizens ~= 0 then
				city:ChangePopulation(numExtraCitizens, true)
			end
		end
		if player:GetImprovementCount(improvementID) == 0 then
			save(player,"hadPhrouriaLastTurn", false)
		else
			save(player,"hadPhrouriaLastTurn", true)
		end
	end
	if load(player,"hadElephantarchCharge") == true then
		for unit in player:Units() do
			unit:SetHasPromotion(GameInfoTypes["PROMOTION_TCM_ELEPHANT_CHARGE_1"], false)
			unit:SetHasPromotion(GameInfoTypes["PROMOTION_TCM_ELEPHANT_CHARGE_2"], false)
			unit:SetHasPromotion(GameInfoTypes["PROMOTION_TCM_ELEPHANT_CHARGE_3"], false)
			unit:SetHasPromotion(GameInfoTypes["PROMOTION_TCM_ELEPHANT_CHARGE_4"], false)
			unit:SetHasPromotion(GameInfoTypes["PROMOTION_TCM_ELEPHANT_CHARGE_5"], false)
		end
		save(player,"hadElephantarchCharge", false)
	end
end
GameEvents.PlayerDoTurn.Add(phrouria)
--=====================================================================================================================================================================
--Event
--=====================================================================================================================================================================
function eventKillUsurper(unitOwnerId, unitId, unitType, unitX, unitY, bDelay, eKillingPlayer)
	local player = Players[unitOwnerId]
	local bactria = Players[eKillingPlayer]
	if bactria and bactria:GetCivilizationType() == civilizationID and player:IsBarbarian() then
		if bactria:HasPolicy(GameInfoTypes["POLICY_TCM_BACTRIA_DEFEAT_BARB_KING"]) then
			local unit = player:GetUnitByID(unitId)
			if unit:GetUnitType() == GameInfoTypes["UNIT_GREAT_GENERAL"] then
				bactria:ChangeGoldenAgeTurns(15)
				bactria:SetHasPolicy(GameInfoTypes["POLICY_TCM_BACTRIA_DEFEAT_BARB_KING"], false)
			end
		end
	end
end
GameEvents.UnitPrekill.Add(eventKillUsurper)
--=====================================================================================================================================================================