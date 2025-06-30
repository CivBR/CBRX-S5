--PDT: Add food equal to gold-food of tile in cities working luxes on tundra/snow. loop cities, add 2 GAP for each defense building in cits with UB. if city has UB and building defense building, add half gold to prod.
--GoldenAge: get num trade partners, calc 1-3 furs to spawn. loop all territory, spawn them.
--Prekill: if naval/civil and at war w/ civ and UU on/adj, give UU next range prom.

include("FLuaVector.lua")
include("GoldenAgeLuaEvent.lua") --credit once again to tophat

local civilizationID = GameInfoTypes["CIVILIZATION_RHO_BJARMIA"]
local buildJomali = GameInfoTypes["BUILDING_RHO_JOMALI"]
local unitAshslayer = GameInfoTypes["UNIT_RHO_ASHSLAYER"]
local terSnow = GameInfoTypes["TERRAIN_SNOW"]
local terTundra = GameInfoTypes["TERRAIN_TUNDRA"]
local domSea = GameInfoTypes["DOMAIN_SEA"]
local resFurs = GameInfoTypes["RESOURCE_FUR"]
local yieGold = GameInfoTypes["YIELD_GOLD"]
local yieFood = GameInfoTypes["YIELD_FOOD"]
local tAshRangeProms = {GameInfoTypes["PROMOTION_RHO_ASHSLAYERA"], GameInfoTypes["PROMOTION_RHO_ASHSLAYERB"], GameInfoTypes["PROMOTION_RHO_ASHSLAYERC"]}

local tAllLux = {}
for row in DB.Query("SELECT * FROM Resources WHERE ResourceClassType = 'RESOURCECLASS_LUXURY' AND OnlyMinorCivs = 0 AND CivilizationType IS NULL") do
	tAllLux[row.ID] = true
end

local tDefBuildings = {}
for row in DB.Query("SELECT * FROM Buildings WHERE Defense > 0 AND Type NOT IN (SELECT DefaultBuilding FROM BuildingClasses WHERE MaxGlobalInstances = 1 OR MaxPlayerInstances = 1)") do
	tDefBuildings[row.ID] = true
end

--Game.GetRandom
function Game.GetRandom(lower, upper)
	return Game.Rand((upper + 1) - lower, "") + lower
end

function BjarmiaPDTUAFood_UBGAPAndConstructSpeed (playerID)
	local player = Players[playerID]
	if not player:IsAlive() then return end
	if player:GetCivilizationType() ~= civilizationID then return end
	local nGAPtoaddfromDef = 0
	for city in player:Cities() do
		for i = 0, city:GetNumCityPlots()-1, 1 do
		local plot = city:GetCityIndexPlot(i)
			if plot and plot:GetResourceType() ~= -1 and tAllLux[plot:GetResourceType()] == true and (plot:GetTerrainType() == terSnow or plot:GetTerrainType() == terTundra) and plot:IsBeingWorked() and plot:GetWorkingCity() == city then
				local gtoftoadd = plot:GetYield(yieGold) - plot:GetYield(yieFood)
				if gtoftoadd > 0 then
					city:ChangeFood(gtoftoadd)
				end
			end
		end
		if city:IsHasBuilding(buildJomali) then
			if city:IsProductionBuilding() and tDefBuildings[city:GetProductionBuilding()] then
				city:ChangeBuildingProduction(city:GetProductionBuilding(), city:GetYieldRate(yieGold)/2)
			end
			for k, v in pairs (tDefBuildings) do
				if city:IsHasBuilding(k) then
					nGAPtoaddfromDef = nGAPtoaddfromDef + 2
				end
			end
		end
	end
	player:ChangeGoldenAgeProgressMeter(nGAPtoaddfromDef)
end
GameEvents.PlayerDoTurn.Add(BjarmiaPDTUAFood_UBGAPAndConstructSpeed)

function BjarmiaUURangeIncrement(unit)
	for k, v in pairs (tAshRangeProms) do
		if unit:IsHasPromotion(v) and k < 3 then
			unit:SetHasPromotion(v, false)
			unit:SetHasPromotion(tAshRangeProms[k + 1], true)
			return
		elseif k == 3 then return
		end
	end
	unit:SetHasPromotion(tAshRangeProms[1], true)
	return
end

function BjarmiaPrekillUURangeIncrease (playerID, unitID, unitType, iDeathX, iDeathY, isDelay, killerPlayerID)
	if (killerPlayerID == -1) or (killerPlayerID == playerID) then return end
	local kplayer = Players[killerPlayerID]
	if not kplayer:IsAlive() then return end
	if not isDelay then return end
	local player = Players[playerID]
	if not player:IsAlive() then return end
	local unit = player:GetUnitByID(unitID)
	local uplot = Map.GetPlot(iDeathX, iDeathY)
	if unit:GetDomainType() == domSea or (not unit:IsCombatUnit() and not unit:IsTrade()) then
		for i = 0, uplot:GetNumUnits() - 1, 1 do
			local pUnit = uplot:GetUnit(i)
			if pUnit:GetUnitType() == unitAshslayer then
				BjarmiaUURangeIncrement(pUnit)
			end
		end
		for direction = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do
			local aplot = Map.PlotDirection(uplot:GetX(), uplot:GetY(), direction)
			if aplot and aplot:IsUnit() then
				for i = 0, aplot:GetNumUnits() - 1, 1 do
					local pUnit = aplot:GetUnit(i)
					if pUnit:GetUnitType() == unitAshslayer then
						BjarmiaUURangeIncrement(pUnit)
					end
				end
			end
		end
	end
end
GameEvents.UnitPrekill.Add(BjarmiaPrekillUURangeIncrease)

function BjarmiaGoldenAgeBeginsUASpawnFurs (playerID, _, isNewGA)
	if not isNewGA then return end
	local player = Players[playerID]
	if not player:IsAlive() then return end
	if player:GetCivilizationType() ~= civilizationID then return end
	local nTradePartners = 0
	local tTradePartners = {}
	for k, v in ipairs(player:GetTradeRoutes()) do
		if v.ToID ~= playerID then
			tTradePartners[v.ToID] = 1
		end
	end
	for k, v in ipairs(player:GetTradeRoutesToYou()) do
		if v.FromID ~= playerID then
			tTradePartners[v.FromID] = 1
		end
	end
	for i = 0, GameDefines.MAX_CIV_PLAYERS - 1, 1 do
		local oplayer = Players[i]
		if tTradePartners[i] == 1 then
			nTradePartners = nTradePartners + 1
		end
	end
	local nFursToSpawn = 1
	if Game.GetRandom(1, 100) < (33 + (5 * nTradePartners)) then
		nFursToSpawn = nFursToSpawn + 1
	end
	if Game.GetRandom(1, 100) < (10 + (2 * nTradePartners)) then
		nFursToSpawn = nFursToSpawn + 1
	end
	local tEmptyPlots = {}
	local CheckedPlots = {}
	for city in player:Cities() do
		for i = 0, city:GetNumCityPlots()-1, 1 do
			local pPlot = city:GetCityIndexPlot(i)
			if pPlot and pPlot:GetOwner() == playerID then
				if pPlot:GetResourceType() == -1 and (not pPlot:IsMountain()) and (not pPlot:IsWater()) and (not CheckedPlots[pPlot:GetPlotIndex()]) then
					CheckedPlots[pPlot:GetPlotIndex()] = 1
					table.insert(tEmptyPlots, pPlot)
				end
			end
		end
	end
	for i = 1, nFursToSpawn, 1 do
		if #tEmptyPlots > 0 then
			local randomNumber = Game.GetRandom(1, #tEmptyPlots)
			local iplot = tEmptyPlots[randomNumber]
			iplot:SetResourceType(resFurs, 1)
			table.remove(tEmptyPlots, randomNumber)
		end
	end
end
LuaEvents.THP_GoldenAgeBegins.Add(BjarmiaGoldenAgeBeginsUASpawnFurs)