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

local iDummyBuilding = GameInfoTypes["BUILDING_TCM_DUMMY_BACTRIA"]

function happinessFromSettling(iPlayer, iCityX, iCityY)
	local player = Players[iPlayer]
	if player:GetCivilizationType() == civilizationID then
		local capital = player:GetCapitalCity()
		local recordedCities = load(player, "tcmRecordedNumCities") if recordedCities == nil then recordedCities = 0 end
		capital:SetNumRealBuilding(iDummyBuilding, recordedCities)
		for city in player:Cities() do
			local numResistance = city:GetResistanceTurns()
			city:ChangeResistanceTurns(-numResistance)
		end
	end
end
GameEvents.PlayerCityFounded.Add(happinessFromSettling)

local yieldFood = YieldTypes.YIELD_FOOD

function producedUnit(ownerId, cityId, unitId, bGold, bFaithOrCulture)
	local player = Players[ownerId]
	if player:GetCivilizationType() == civilizationID then
		local unit = player:GetUnitByID(unitId)
		--local unitType = unit:GetUnitType()
		local unitClass = unit:GetUnitClassType()
		if load(player, "tcmHasThePowerOf" .. unitClass) == true then
			unit:ChangeExperience(15)
		end
		if unitType == unitTypeID then
			local city = player:GetCityByID(cityId)
			local food = math.floor(city:GetBaseYieldRate(yieldFood) * 0.27)
			unit:ChangeExperience(food)
		end
	end
end
GameEvents.CityTrained.Add(producedUnit)
--=====================================================================================================================================================================
--Elephantarch
--=====================================================================================================================================================================
local tElephantPromos = {}
for iTableNum = 1, 5, 1 do
	tElephantPromos[iTableNum] = GameInfoTypes["PROMOTION_TCM_ELEPHANT_CHARGE_" .. iTableNum]
end

function elepantarchcharge(playerID, unitID, unitX, unitY)
	local player = Players[playerID]
	local unit = player:GetUnitByID(unitID)
	if unit:GetUnitType() == unitTypeID then
		local bHasAnyPromo = false
		for iNum, iPromo in pairs(tElephantPromos) do
			if iNum < 5 then
				bHasAnyPromo = true
				unit:SetHasPromotion(iPromo, false)
				unit:SetHasPromotion(tElephantPromos[iNum + 1], true)
				break
			end
		end
		if not bHasAnyPromo then
			unit:SetHasPromotion(tElephantPromos[1], true)
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
			for iNum, iPromo in pairs(tElephantPromos) do
				unit:SetHasPromotion(iPromo, false)
			end
		end
		save(player,"hadElephantarchCharge", false)
	end
end
GameEvents.PlayerDoTurn.Add(phrouria)
--=====================================================================================================================================================================
--Event
--=====================================================================================================================================================================
--local iDefeatBarbKing = GameInfoTypes["POLICY_TCM_BACTRIA_DEFEAT_BARB_KING"]
--local iGG = GameInfoTypes["UNIT_GREAT_GENERAL"]
function eventKillUsurper(unitOwnerId, unitId, unitType, unitX, unitY, bDelay, eKillingPlayer)
	local player = Players[unitOwnerId]
	local bactria = Players[eKillingPlayer]
	if bactria and bactria:GetCivilizationType() == civilizationID and player:IsBarbarian() then
		if bactria:HasPolicy(iDefeatBarbKing) then
			local unit = player:GetUnitByID(unitId)
			if unit:GetUnitType() == iGG then
				bactria:ChangeGoldenAgeTurns(15)
				bactria:SetHasPolicy(iDefeatBarbKing, false)
			end
		end
	end
end
--GameEvents.UnitPrekill.Add(eventKillUsurper)
--=====================================================================================================================================================================
