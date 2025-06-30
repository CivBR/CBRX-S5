--CanConstruct: Kist for Itelmen only + on snow/tundra (do not use JFD)
--PDT: Count no. of different rivers in empire, 1 Faith + 2 Culture for each. Look for Barbs and Enemy gun units on Forest & adj to UU, give slowed promo.
--PDT (all): look for units with slowed promo, remove all moves.
--CityConstructed: if UB and on river, give prod dum.
--SetPopulation: if growth, count stored food. then look for smaller cities on same river and give that number to them. if no smaller cities or not on river, use allotments of 30 food to build Farms on owned nearby empty or farm resource tiles. Prioritise river tiles.

include("RiverConnections.lua")

local civilizationID = GameInfoTypes["CIVILIZATION_RHO_ITELMEN"]
local buildPehmy = GameInfoTypes["BUILDING_RHO_PEHMY"]
local unitKamma = GameInfoTypes["UNIT_RHO_KAMMA"]
local buildKist = GameInfoTypes["BUILDING_RHO_KIST"]
local dumPehmyprod = GameInfoTypes["BUILDING_RHO_PEHMYPROD_DUMMY"]
local terTundra = GameInfoTypes["TERRAIN_TUNDRA"]
local terSnow = GameInfoTypes["TERRAIN_SNOW"]
local impFarm = GameInfoTypes["IMPROVEMENT_FARM"]
local feaForest = GameInfoTypes["FEATURE_FOREST"]
local promKammaslowed = GameInfoTypes["PROMOTION_RHO_KAMMAMARK"]
local combatGun = GameInfoTypes["UNITCOMBAT_GUN"]

local iPracticalNumCivs = (GameDefines.MAX_MAJOR_CIVS - 1)

function JFD_IsCivilisationActive(civID)
	for iSlot = 0, iPracticalNumCivs, 1 do
		local slotStatus = PreGame.GetSlotStatus(iSlot)
		if (slotStatus == SlotStatus["SS_TAKEN"] or slotStatus == SlotStatus["SS_COMPUTER"]) then
			if PreGame.GetCivilization(iSlot) == civID then
				return true
			end
		end
	end
	return false
end
local bIsActive = JFD_IsCivilisationActive(civilizationID)

--Look I know its only wheat but this is just in case someone adds something else
local tFarmResources = {}
for row in DB.Query("SELECT * FROM Resources WHERE Type IN (SELECT ResourceType FROM Improvement_ResourceTypes WHERE ImprovementType = 'IMPROVEMENT_FARM')") do
	tFarmResources[row.ID] = true
end

--Game.GetRandom
function Game.GetRandom(lower, upper)
	return Game.Rand((upper + 1) - lower, "") + lower
end

--River stuff taken from Bengal
local gRiverManager = nil
local gNeedRescan = false

function getRiverManager()    
    if (gRiverManager == nil) then
        gRiverManager = RiverManager:new()
        gNeedRescan = false
    end
    if (gNeedRescan) then
        gRiverManager:rescanMap()
        gNeedRescan = false
    end
    return gRiverManager
end

--by jarcast
function Jar_GetCitiesOnSameRiver(pCity, iPlayer)
    local pPlayer = Players[iPlayer];
    local tCitiesSameRiver= {}
    local pCityX, pCityY = pCity:Plot():GetX(), pCity:Plot():GetY()
    for cCity in pPlayer:Cities() do
        if pCity ~= cCity then
            local cCityX, cCityY = cCity:Plot():GetX(), cCity:Plot():GetY()
            --local tCommonRivers = getRiverManager():getCommonRivers(cCityX, cCityY, pCityX, pCityY)            
            local tCommonRivers = getRiverManager():getRiverBankRoute(cCityX, cCityY, pCityX, pCityY)
            local numcommonrivers = #tCommonRivers
            if numcommonrivers > 0 then
                table.insert(tCitiesSameRiver, cCity:GetID() )
            end
        end
    end
    return tCitiesSameRiver
end

function KistRestriction (playerID, iCity, buildingType)
	if buildingType == buildKist then
		local player = Players[playerID]
		if player:GetCivilizationType() ~= civilizationID then return false end
		local city = player:GetCityByID(iCity)
		if city:Plot():GetTerrainType() == terTundra or city:Plot():GetTerrainType() == terSnow then
			return true
		end
		return false
	end
	return true
end
GameEvents.CityCanConstruct.Add(KistRestriction)

function PehmyRiverProduction (playerID, cityID, buildingType, bGold, bFaith)
	local player = Players[playerID]
	if not player:IsAlive() then return end
	if player:GetCivilizationType() ~= civilizationID then return end
	if buildingType == buildPehmy then
		local city = player:GetCityByID(cityID)
		if city:Plot():IsRiver() then
			city:SetNumRealBuilding(dumPehmyprod, 1)
		end
	end
end
if bIsActive then
	GameEvents.CityConstructed.Add(PehmyRiverProduction)
end

function ItelmenRiverCountUUPDT (playerID)
	local player = Players[playerID]
	if not player:IsAlive() then return end
	if player:GetCivilizationType() ~= civilizationID then return end
	local checkedcities = {}
	local nRiversInEmpire = 0
	for city in player:Cities() do
		if city:Plot():IsRiver() and not checkedcities[city:GetID()] then
			nRiversInEmpire = nRiversInEmpire + 1
			checkedcities[city:GetID()] = true
			local tCitiesOnRiver = Jar_GetCitiesOnSameRiver(city, playerID)
			for k, v in pairs(tCitiesOnRiver) do
				checkedcities[v] = true
			end
		end
	end
	player:ChangeFaith(nRiversInEmpire)
	player:ChangeJONSCulture(3*nRiversInEmpire)
	if player:IsHuman() and nRiversInEmpire > 0 then
		Events.GameplayAlertMessage(Locale.ConvertTextKey("You receive {1_Num} [ICON_PEACE] Faith and {2_Num} [ICON_CULTURE] Culture from the number of different rivers you have settled.", nRiversInEmpire, 3*nRiversInEmpire))
	end
	for unit in player:Units() do
		if unit:GetUnitType() == unitKamma then
			for direction = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do
				local aplot = Map.PlotDirection(unit:GetX(), unit:GetY(), direction)
				if aplot:IsUnit() and aplot:GetFeatureType() == feaForest then
					local iNumUnits = aplot:GetNumUnits()
					if iNumUnits > 0 then
						for i = 0, iNumUnits - 1 do
							local aplotunit = aplot:GetUnit(i)
							local team = Teams[player:GetTeam()]
							if aplotunit:IsBarbarian() or (aplotunit:GetUnitCombatType() == combatGun and Teams[Players[aplotunit:GetOwner()]:GetTeam()]:IsAtWar(team) ) then
								aplotunit:SetHasPromotion(promKammaslowed, true)
							end
						end
					end
				end
			end
		end
	end

end
if bIsActive then
	GameEvents.PlayerDoTurn.Add(ItelmenRiverCountUUPDT)
end

function ItelmenUUSlowingPDTAll (playerID)
	local player = Players[playerID]
	if not player:IsAlive() then return end
	for unit in player:Units() do
		if unit:IsHasPromotion(promKammaslowed) then
			unit:SetHasPromotion(promKammaslowed, false)
			unit:SetMoves(0)
		end
	end
end
if bIsActive then
	GameEvents.PlayerDoTurn.Add(ItelmenUUSlowingPDTAll)
end

function ItelmenUAGrowthStuff (cityX, cityY, oldpop, newpop)
	local plot = Map.GetPlot(cityX, cityY)
	local city = plot:GetPlotCity()
	local player = Players[city:GetOwner()]
	local playerID = player:GetID()
	if not player:IsAlive() then return end
	if player:GetCivilizationType() ~= civilizationID then return end
	if oldpop < newpop then
		local storedfood = city:GetFood()
		if storedfood > 0 then
			local spawnfarms = 1
			if plot:IsRiver() then
				local citypop = city:GetPopulation()
				local tCitiesOnRiver = Jar_GetCitiesOnSameRiver(city, playerID)
				if #tCitiesOnRiver > 0 then
					for k, v in pairs(tCitiesOnRiver) do
						local rivercity = player:GetCityByID(v)
						if rivercity:GetPopulation() < citypop then
							spawnfarms = 0
							rivercity:ChangeFood(storedfood)
							city:SetFood(0)
							if player:IsHuman() then
								Events.GameplayAlertMessage(Locale.ConvertTextKey("{1_Num} [ICON_FOOD] Food has been sent from " .. city:GetName() .. " to the smaller cities on its river!", storedfood))
							end
						end
					end
				end
			end
			if spawnfarms == 1 then
				local nfarmstospawn = math.floor(storedfood/15)
				if nfarmstospawn > 0 then
					local tValidRiverPlots = {}
					local tValidOtherPlots = {}
					for i = 0, city:GetNumCityPlots()-1, 1 do
						local pPlot = city:GetCityIndexPlot(i)
						if pPlot and pPlot:GetOwner() == playerID and pPlot:GetImprovementType() == -1 and (not pPlot:IsWater()) and (not pPlot:IsCity()) and (not pPlot:IsMountain()) and (pPlot:GetResourceType() == -1 or tFarmResources[pPlot:GetResourceType()]) then
							if pPlot:IsRiver() then
								table.insert(tValidRiverPlots, pPlot)
							else
								table.insert(tValidOtherPlots, pPlot)
							end
						end
					end
					local TotalOpenPlots = #tValidRiverPlots + #tValidOtherPlots
					if TotalOpenPlots < nfarmstospawn then nfarmstospawn = TotalOpenPlots end
					for i = 1, nfarmstospawn, 1 do
						if #tValidRiverPlots > 0 then
							local randnum = Game.GetRandom(1, #tValidRiverPlots)
							local randplot = tValidRiverPlots[randnum]
							randplot:SetImprovementType(impFarm, true)
							city:ChangeFood(-15)
							table.remove(tValidRiverPlots, randnum)
						elseif #tValidOtherPlots > 0 then
							local randnum = Game.GetRandom(1, #tValidOtherPlots)
							local randplot = tValidOtherPlots[randnum]
							randplot:SetImprovementType(impFarm, true)
							city:ChangeFood(-15)
							table.remove(tValidOtherPlots, randnum)
						end
					end
				end
			end
		end
	end
end
if bIsActive then
	GameEvents.SetPopulation.Add(ItelmenUAGrowthStuff)
end