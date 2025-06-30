print("Unit Limits Loading Start")

local function PopulateUnitTypeTable(query, targetTable)
	for row in DB.Query(query) do
		targetTable[row.ID] = row.Type
	end
end

local civilians, landUnits, airUnits, seaUnits, hoverUnits = {}, {}, {}, {}, {}

PopulateUnitTypeTable("SELECT * FROM Units WHERE (Combat = 0 AND RangedCombat = 0)", civilians)
PopulateUnitTypeTable("SELECT * FROM Units WHERE Domain = 'DOMAIN_LAND'", landUnits)
PopulateUnitTypeTable("SELECT * FROM Units WHERE Domain = 'DOMAIN_AIR'", airUnits)
PopulateUnitTypeTable("SELECT * FROM Units WHERE Domain = 'DOMAIN_SEA'", seaUnits)
PopulateUnitTypeTable("SELECT * FROM Units WHERE Domain = 'DOMAIN_HOVER'", hoverUnits)

local function GetOwnedPlotCount(player)
	local plotCount = 0
	for plotID = 0, Map.GetNumPlots() - 1 do
		local plot = Map.GetPlotByIndex(plotID)
		if plot and plot:GetOwner() == player:GetID() then
			plotCount = plotCount + 1
		end
	end
	return plotCount
end

local function Coiot_UnitLimits_Check(playerID)
	local player = Players[playerID]
	local landCap, airCap, seaCap, hoverCap = 10, 5, 5, 5
	local carrierCap, submarineCap = 1, 1

	local activeMajorCivs = 0
	for i = 0, GameDefines.MAX_MAJOR_CIVS - 1 do
		local otherPlayer = Players[i]
		if otherPlayer:IsAlive() then
			activeMajorCivs = activeMajorCivs + 1
		end
	end

	-- Adjustment based on game turn
	local turn = Game.GetGameTurn()
	if turn >= 400 then landCap = 20 end
	if turn >= 500 then landCap, airCap, seaCap, hoverCap = 25, 10, 10, 5 end
	if turn >= 600 then landCap, airCap, seaCap, hoverCap = 30, 15, 15, 10 end
	if turn >= 700 then landCap, airCap, seaCap, hoverCap = 35, 20, 20, 15 end
	if activeMajorCivs < 10 then landCap, airCap, seaCap, hoverCap = 50, 25, 25, 20 end

	-- City and population-based adjustments
	local cityCount = player:GetNumCities()
	local totalPop = player:GetTotalPopulation()
	local avgPop = totalPop / math.max(cityCount, 1)

	landCap = landCap + math.ceil(20 * cityCount * avgPop)
	airCap = airCap + math.ceil(5 * cityCount * avgPop)
	seaCap = seaCap + math.ceil(5 * cityCount * avgPop) + math.ceil(carrierCap * (cityCount / 2)) +
		math.ceil(submarineCap * (cityCount / 2))
	hoverCap = hoverCap + math.ceil(5 * cityCount * avgPop)

	local missileCap = math.ceil(1.5 * cityCount)

	-- Adjust unit limits based on owned plots
	local plotCount = GetOwnedPlotCount(player)
	local plotLimit = math.ceil(1.25 * plotCount)

	landCap = math.min(landCap, plotLimit)
	airCap = math.min(airCap, plotLimit)
	seaCap = math.min(seaCap, plotLimit)
	hoverCap = math.min(hoverCap, plotLimit)

	-- Function to count non-combat units
	local function CountNonCombatUnits(unitTable)
		local count = 0
		for unit in player:Units() do
			if (not unit:IsCombatUnit()) and unitTable[unit:GetUnitType()] then
				count = count + 1
			end
		end
		return count
	end

	local landCount = CountNonCombatUnits(landUnits)
	local airCount = CountNonCombatUnits(airUnits)
	local seaCount = CountNonCombatUnits(seaUnits)
	local hoverCount = CountNonCombatUnits(hoverUnits)
	local carrierCount, submarineCount, missileCount = 0, 0, 0

	for unit in player:Units() do
		if (not unit:IsCombatUnit()) and seaUnits[unit:GetUnitType()] then
			seaCount = seaCount + 1
			if unit:GetUnitClassType() == GameInfoTypes.UNITCLASS_CARRIER or unit:GetUnitClassType() == GameInfoTypes.UNITCLASS_FW_SUPERCARRIER then
				carrierCount = carrierCount + 1
			elseif unit:GetUnitClassType() == GameInfoTypes.UNITCLASS_SUBMARINE or unit:GetUnitClassType() == GameInfoTypes.UNITCLASS_NUCLEAR_SUBMARINE or unit:GetUnitClassType() == GameInfoTypes.UNITCLASS_FW_CYBERSUB then
				submarineCount = submarineCount + 1
			end
		end
		if unit:GetUnitType() == GameInfoTypes.UNIT_NUCLEAR_MISSILE or unit:GetUnitType() == GameInfoTypes.UNIT_ATOMIC_BOMB then
			missileCount = missileCount + 1
		end
	end

	return landCap, airCap, seaCap, hoverCap, carrierCap, submarineCap, landCount, airCount, seaCount, hoverCount,
		carrierCount, submarineCount, cityCount, missileCap, missileCount
end

local function Coiot_UnitLimits_CanTrain(playerID, cityID, unitType)
	local landCap, airCap, seaCap, hoverCap, carrierCap, submarineCap, landCount, airCount, seaCount, hoverCount, carrierCount, submarineCount, cityCount, missileCap, missileCount =
		Coiot_UnitLimits_Check(playerID)

	if civilians[unitType] then return true end
	if landUnits[unitType] and landCount >= landCap then return false end
	if airUnits[unitType] and airCount >= airCap then return false end
	if hoverUnits[unitType] and hoverCount >= hoverCap then return false end
	if unitType == GameInfoTypes["UNIT_NUCLEAR_MISSILE"] or unitType == GameInfoTypes["UNIT_ATOMIC_BOMB"] then
		if missileCount >= missileCap then return false end
	end
	if seaUnits[unitType] then
		if unitType == GameInfoTypes["UNIT_SUBMARINE"] or unitType == GameInfoTypes["UNIT_NUCLEARCARRIER"] or unitType == GameInfoTypes["UNIT_FW_CYBERSUB"] then
			if submarineCount >= math.ceil(submarineCap * (cityCount / 2)) then return false end
		elseif unitType == GameInfoTypes["UNIT_CARRIER"] or unitType == GameInfoTypes["UNIT_FW_SUPERCARRIER"] then
			if carrierCount >= math.ceil(carrierCap * (cityCount / 2)) then return false end
		elseif seaCount >= seaCap then
			return false
		end
	end
	return true
end
GameEvents.CityCanTrain.Add(Coiot_UnitLimits_CanTrain)
print("Unit Limits Can Train")
