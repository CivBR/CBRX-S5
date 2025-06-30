--PDT: loop units, if uu and prom check adj units, if enemy CS unit adj steal it and remove prom on uu
--cityfounded: reveal any regions of connected woodland
--tile claim: if forest/jungle, add prod in any unit building cities in 3 tiles. reduce cs (and apply mark) of any adj enemies.
--citytrained: if uu and no dum mark, spawn extra uu. if city has ub, count worked res and allies, give XP for total.
--cityconstructed: if ub and fresh water, spawn shrimp in adj water or on city tile.
--setera: chance to spawn extra shrimp in ub cities

local civilizationID = GameInfoTypes["CIVILIZATION_RHO_POTIGUARA"]
local buildShrimp = GameInfoTypes["BUILDING_RHO_SHRIMPPOND"]
local unitPhusa = GameInfoTypes["UNIT_RHO_PHUSA"]
local resShrimp = GameInfoTypes["RESOURCE_RHO_POTISHRIMP"]
local dumShrimpmark = GameInfoTypes["BUILDING_RHO_POTIGUARASHRIMPMARK_DUMMY"]
local dumPhusamark = GameInfoTypes["BUILDING_RHO_POTIGUARAPHUSAMARK_DUMMY"]
local feaForest = GameInfoTypes["FEATURE_FOREST"]
local feaJungle = GameInfoTypes["FEATURE_JUNGLE"]
local promConvert = GameInfoTypes["PROMOTION_RHO_POTIGUARA_PHUSACONVERT"]
local promWeaken = GameInfoTypes["PROMOTION_RHO_POTIGUARA_WEAKMARK"]

--Game.GetRandom
function Game.GetRandom(lower, upper)
	return Game.Rand((upper + 1) - lower, "") + lower
end

function PotiguaraPhusaConvertCSUnitsPDT (playerID)
	local player = Players[playerID]
	if not player:IsAlive() then return end
	if player:GetCivilizationType() ~= civilizationID then return end
	for unit in player:Units() do
		if unit:GetUnitType() == unitPhusa and unit:IsHasPromotion(promConvert) then
			local uplot = unit:GetPlot()
			for direction = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do
				local aplot = Map.PlotDirection(uplot:GetX(), uplot:GetY(), direction)
				if aplot and aplot:IsUnit() then
					for i = 0, aplot:GetNumUnits() - 1, 1 do
						local pUnit = aplot:GetUnit(i)
						if pUnit and pUnit:IsCombatUnit() and Teams[Players[pUnit:GetOwner()]:GetTeam()]:IsAtWar(player:GetTeam()) and Players[pUnit:GetOwner()]:IsMinorCiv() then
							local stealunit = player:InitUnit(pUnit:GetUnitType(), pUnit:GetX(), pUnit:GetY())
							stealunit:Convert(pUnit, false)
							unit:SetHasPromotion(promConvert, false)
							break
						end
					end
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(PotiguaraPhusaConvertCSUnitsPDT)

function PotiguaraTileClaimYields (playerID, cityID, plotX, plotY, bGold, bFaithOrCulture)
	local player = Players[playerID]
	if not player:IsAlive() then return end
	if player:GetCivilizationType() ~= civilizationID then return end
	local newplot = Map.GetPlot(plotX, plotY)
	if newplot:GetFeatureType() == feaForest or newplot:GetFeatureType() == feaJungle then
		for city in player:Cities() do
			if city:IsProductionUnit() then
				if Map.PlotDistance(plotX, plotY, city:GetX(), city:GetY()) < 4 then
					city:ChangeUnitProduction(city:GetProductionUnit(), 5 * city:GetCurrentProductionDifference())
				end
			end
		end
	end
	for direction = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do
		local aplot = Map.PlotDirection(newplot:GetX(), newplot:GetY(), direction)
		if aplot and aplot:IsUnit() then
			for i = 0, aplot:GetNumUnits() - 1, 1 do
				local pUnit = aplot:GetUnit(i)
				if pUnit and pUnit:IsCombatUnit() and Teams[Players[pUnit:GetOwner()]:GetTeam()]:IsAtWar(player:GetTeam()) then
					if (not pUnit:IsHasPromotion(promWeaken)) then pUnit:SetHasPromotion(promWeaken, true) end
					pUnit:SetBaseCombatStrength(math.max(5, pUnit:GetBaseCombatStrength() - (Players[pUnit:GetOwner()]:GetCurrentEra() + 1)))
				end
			end
		end
	end
end
GameEvents.CityBoughtPlot.Add(PotiguaraTileClaimYields)

function PotiguaraCityTrainedExtraUU_UBXP (playerID, cityID, unitID, bGold, bFaith)
	local player = Players[playerID]
	if not player:IsAlive() then return end
	if player:GetCivilizationType() ~= civilizationID then return end
	local city = player:GetCityByID(cityID)
	local unit = player:GetUnitByID(unitID)
	if city:IsHasBuilding(buildShrimp) then
		local nXP = 0
		local tWorkedRes = {}
		for i = 0, city:GetNumCityPlots()-1, 1 do
			local pPlot = city:GetCityIndexPlot(i)
			if pPlot and pPlot:GetOwner() == playerID and pPlot:IsBeingWorked() and pPlot:GetWorkingCity() == city then
				if pPlot:GetResourceType() ~= -1 then
					tWorkedRes[pPlot:GetResourceType()] = true
				end
			end
		end
		for k, v in pairs (tWorkedRes) do
			if v == true then
				nXP = nXP + 1
			end
		end
		local tEnemies = {}
		for i = 0, GameDefines.MAX_MAJOR_CIVS -1 do
			local pOther = Players[i]
			if pOther:IsEverAlive() and i ~= playerID and not (pOther:IsMinorCiv() or pOther:IsBarbarian()) then
				if Teams[pOther:GetTeam()]:IsAtWar(player:GetTeam()) then
					tEnemies[i] = true
				end
			end
		end
		for i = 0, GameDefines.MAX_MAJOR_CIVS -1 do
			local pOther = Players[i]
			if pOther:IsEverAlive() and i ~= playerID and not (pOther:IsMinorCiv() or pOther:IsBarbarian()) then
				if tEnemies[i] ~= true and Teams[pOther:GetTeam()]:IsHasMet(player:GetTeam()) then
					for k, v in pairs(tEnemies) do
						if Teams[pOther:GetTeam()]:IsAtWar(Players[k]:GetTeam()) then
							nXP = nXP + 1
							break
						end
					end
				end
			end
		end
		unit:ChangeExperience(math.min(nXP, 15))
	end
	if unit:GetUnitType() == unitPhusa and (not city:IsHasBuilding(dumPhusamark)) then
		city:SetNumRealBuilding(dumPhusamark, 1)
		local doubleunit = player:InitUnit(unitPhusa, city:GetX(), city:GetY())
		doubleunit:SetMoves(unit:GetMoves())
		doubleunit:SetExperience(unit:GetExperience())
	end
end
GameEvents.CityTrained.Add(PotiguaraCityTrainedExtraUU_UBXP)

function PotiguaraUBSpawnShrimpCityConstructed (playerID, cityID, buildingType, bGold, bFaith)
	local player = Players[playerID]
	if not player:IsAlive() then return end
	if player:GetCivilizationType() ~= civilizationID then return end
	if buildingType ~= buildShrimp then return end
	local city = player:GetCityByID(cityID)
	local cplot = city:Plot()
	if cplot:IsFreshWater() then
		if cplot:GetResourceType() == -1 then
			cplot:SetResourceType(resShrimp, 1)
		else
			local tSeasAdj = {}
			local tFreshAdj = {}
			for direction = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do
				local pPlot = Map.PlotDirection(cplot:GetX(), cplot:GetY(), direction)
				if pPlot and (pPlot:GetOwner() == -1 or pPlot:GetOwner() == playerID) and (not pPlot:IsCity()) and (not pPlot:IsMountain()) and pPlot:GetResourceType() == -1 then
					if pPlot:IsWater() then
						table.insert(tSeasAdj, pPlot)
					elseif pPlot:IsFreshWater() then
						table.insert(tFreshAdj, pPlot)
					end
				end
			end
			if #tSeasAdj > 0 then
				local randplot = tSeasAdj[Game.GetRandom(1, #tSeasAdj)]
				randplot:SetResourceType(resShrimp, 1)
			elseif #tFreshAdj > 0 then
				local randplot = tFreshAdj[Game.GetRandom(1, #tFreshAdj)]
				randplot:SetResourceType(resShrimp, 1)
			end
		end
	end
end
GameEvents.CityConstructed.Add(PotiguaraUBSpawnShrimpCityConstructed)

function PotiguaraUBShrimpSpawnNewEra (teamID, eEra)
	local playerID = Teams[teamID]:GetLeaderID()
	local player = Players[playerID]
	if not player:IsAlive() then return end
	if player:GetCivilizationType() ~= civilizationID then return end
	local shrimpcap = math.ceil((eEra + 1) / 3)
	for city in player:Cities() do
		if city:IsHasBuilding(buildShrimp) and city:GetNumRealBuilding(dumShrimpmark) < shrimpcap then
			local shrimpchance = math.max((player:GetNumPlots() * city:GetStrengthValue() * eEra) / city:GetNumRealBuilding(dumShrimpmark) * 400)
			shrimpchance = math.min(shrimpchance, 100)
			local randroll = Game.GetRandom(1, 100)
			if randroll <= shrimpchance then
				city:SetNumRealBuilding(dumShrimpmark, city:GetNumRealBuilding(dumShrimpmark) + 1)
				local cplot = city:Plot()
				if cplot:GetResourceType() == -1 then
					cplot:SetResourceType(resShrimp, 1)
				else
					local tSeasAdj = {}
					local tFreshAdj = {}
					for i = 0, city:GetNumCityPlots()-1, 1 do
						local pPlot = city:GetCityIndexPlot(i)
						if pPlot and (pPlot:GetOwner() == playerID) and (not pPlot:IsCity()) and (not pPlot:IsMountain()) and pPlot:GetResourceType() == -1 then
							if pPlot:IsWater() then
								table.insert(tSeasAdj, pPlot)
							elseif pPlot:IsFreshWater() then
								table.insert(tFreshAdj, pPlot)
							end
						end
					end
					if #tSeasAdj > 0 then
						local randplot = tSeasAdj[Game.GetRandom(1, #tSeasAdj)]
						randplot:SetResourceType(resShrimp, 1)
					elseif #tFreshAdj > 0 then
						local randplot = tFreshAdj[Game.GetRandom(1, #tFreshAdj)]
						randplot:SetResourceType(resShrimp, 1)
					end
				end
			end
		end
	end
end
GameEvents.TeamSetEra.Add(PotiguaraUBShrimpSpawnNewEra)

local tRevealedPlots = {}

function RecursiveRevealAdjWoodedTiles (plot, playerID)
	local player = Players[playerID]
	if not player:IsAlive() then return end
	if tRevealedPlots[plot:GetPlotIndex()] == true then return end
	local teamID = player:GetTeam()
	local oldVisibility = plot:GetVisibilityCount(teamID)
	if oldVisibility > 0 then
		plot:ChangeVisibilityCount(teamID, -oldVisibility, -1, true, true)
	end
	plot:ChangeVisibilityCount(teamID, 1, -1, true, true)
	plot:SetRevealed(teamID, true)
	plot:UpdateFog()
	tRevealedPlots[plot:GetPlotIndex()] = true
	for direction = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do
		local aplot = Map.PlotDirection(plot:GetX(), plot:GetY(), direction)
		if aplot and tRevealedPlots[aplot:GetPlotIndex()] ~= true and (aplot:GetFeatureType() == feaForest or aplot:GetFeatureType() == feaJungle) then
			RecursiveRevealAdjWoodedTiles(aplot, playerID)
		end
	end
	return
end

function PotiguaraCityFoundedRevealVisionTiles (playerID, cityX, cityY)
	local player = Players[playerID]
	if not player:IsAlive() then return end
	if player:GetCivilizationType() ~= civilizationID then return end
	local plot = Map.GetPlot(cityX, cityY)
	local team = player:GetTeam()
	RecursiveRevealAdjWoodedTiles(plot, playerID)
	Game.UpdateFOW(true)
	UI.RequestMinimapBroadcast()
end
GameEvents.PlayerCityFounded.Add(PotiguaraCityFoundedRevealVisionTiles)