print("Unit Limits Loading Start")

-- ======= --
-- DEFINES --
-- ======= --

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

local tCarriers, tSubmarines, tNukes = {}
PopulateUnitTypeTable("SELECT * FROM Units WHERE Class = 'UNITCLASS_CARRIER' UNION SELECT * FROM Units WHERE Class = 'UNITCLASS_FW_SUPERCARRIER'", tCarriers)
PopulateUnitTypeTable("SELECT * FROM Units WHERE Class = 'UNITCLASS_SUBMARINE' UNION SELECT * FROM Units WHERE Class = 'UNITCLASS_NUCLEAR_SUBMARINE' UNION SELECT * FROM Units WHERE Class = 'UNITCLASS_FW_CYBERSUB'", tSubmarines)
PopulateUnitTypeTable("SELECT * FROM Units WHERE NukeDamageLevel > 0", tNukes)

local iMaxCivs = GameDefines.MAX_MAJOR_CIVS - 1
local domainLand, domainAir, domainSea, domainHover = GameInfoTypes["DOMAIN_LAND"], GameInfoTypes["DOMAIN_AIR"], GameInfoTypes["DOMAIN_SEA"], GameInfoTypes["DOMAIN_HOVER"]

-- ========= --
-- FUNCTIONS --
-- ========= --

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
	for i = 0, iMaxCivs do
		local otherPlayer = Players[i]
		if otherPlayer and otherPlayer:IsAlive() and (not otherPlayer:IsBarbarian()) and (not otherPlayer:IsMinorCiv()) then
			activeMajorCivs = activeMajorCivs + 1
		end
	end

	-- Adjustment based on game turn and number of living civs
	if activeMajorCivs < 10 then
		landCap, airCap, seaCap, hoverCap = 50, 25, 25, 20
	else
		local turn = Game.GetGameTurn()
		if turn >= 400 then
			if turn >= 700 then
				landCap, airCap, seaCap, hoverCap = 35, 20, 20, 15
			elseif turn >= 600 then
				landCap, airCap, seaCap, hoverCap = 30, 15, 15, 10
			elseif turn >= 500 then
				landCap, airCap, seaCap, hoverCap = 25, 10, 10, 5
			else
				landCap = 20
			end
		end
	end

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
	local function ConsolidatedCountNonCombatUnits()
		local landCount, airCount, seaCount, hoverCount, carrierCount, submarineCount, missileCount = 0, 0, 0, 0
		for unit in player:Units() do
			if unit:IsCombatUnit() then
				local unitDomain = unit:GetDomainType()
				if unitDomain == domainLand then
					landCount = landCount + 1
				elseif unitDomain == domainAir then
					airCount = airCount + 1
					if tNukes[unit:GetUnitType()] then
						missileCount = missileCount + 1
					end
				elseif unitDomain == domainSea then
					seaCount = seaCount + 1
					local checkedUnitType = unit:GetUnitType()
					if tSubmarines[checkedUnitType] then
						submarineCount = submarineCount + 1
					elseif tCarriers[checkedUnitType] then
						carrierCount = carrierCount + 1
					end
				elseif unitDomain == domainHover then
					hoverCount = hoverCount + 1
				end
			end
		end
		return landCount, airCount, seaCount, hoverCount, carrierCount, submarineCount, missileCount
	end
	
	local landCount, airCount, seaCount, hoverCount, carrierCount, submarineCount, missileCount = ConsolidatedCountNonCombatUnits()

	return landCap, airCap, seaCap, hoverCap, carrierCap, submarineCap, landCount, airCount, seaCount, hoverCount,
		carrierCount, submarineCount, cityCount, missileCap, missileCount
end

local function Coiot_UnitLimits_CanTrain(playerID, cityID, unitType)
	local landCap, airCap, seaCap, hoverCap, carrierCap, submarineCap, landCount, airCount, seaCount, hoverCount, carrierCount, submarineCount, cityCount, missileCap, missileCount =
		Coiot_UnitLimits_Check(playerID)

	if civilians[unitType] and (not tNukes[unitType]) then return true end
	if landUnits[unitType] and landCount >= landCap then return false end
	if airUnits[unitType] and airCount >= airCap then return false end
	if hoverUnits[unitType] and hoverCount >= hoverCap then return false end
	if tNukes[unitType] then
		if missileCount >= missileCap then return false end
	end
	if seaUnits[unitType] then
		if tSubmarines[unitType] then
			if submarineCount >= math.ceil(submarineCap * (cityCount / 2)) then return false end
		elseif tCarriers[unitType] then
			if carrierCount >= math.ceil(carrierCap * (cityCount / 2)) then return false end
		elseif seaCount >= seaCap then
			return false
		end
	end
	return true
end
GameEvents.PlayerCanTrain.Add(Coiot_UnitLimits_CanTrain)
print("Unit Limits Can Train")
