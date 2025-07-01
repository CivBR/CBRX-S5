--Give Embarkation to Everyone
local domainLand = GameInfoTypes["DOMAIN_LAND"]
local promoEmbark = GameInfoTypes["PROMOTION_EMBARKATION"]
local techOptics = GameInfoTypes["TECH_OPTICS"]

function EmbarkationForEveryone(teamID, techID, bValue)
	if bValue and (techID == techOptics) then
		local team = Teams[teamID]
		if not team then return end

		local playerID = team:GetLeaderID()
		local pPlayer = Players[playerID]
		if not pPlayer or not pPlayer:IsAlive() then return end

		for pUnit in pPlayer:Units() do
			if pUnit:GetDomainType() == domainLand then
				pUnit:SetHasPromotion(promoEmbark, true)
			end
		end
	end
end

GameEvents.TeamTechResearched.Add(EmbarkationForEveryone)

-- ReplaceFounder
local policyReformationID = GameInfo.Policies["POLICY_PIETY"].ID

function ReplaceFounder(playerID)
	local player = Players[playerID]

	if policyReformationID and player:HasPolicy(policyReformationID) and player:GetReligionCreatedByPlayer() < 1 then
		for city in player:Cities() do
			if city:IsHolyCityAnyReligion() and city:IsHolyCityForReligion(player:GetCapitalCity():GetReligiousMajority()) then
				local religion = player:GetCapitalCity():GetReligiousMajority()
				Game.SetFounder(religion, player:GetID())
				local hplayer = Players[Game.GetActivePlayer()]
			end
		end
	end
end

GameEvents.PlayerAdoptPolicy.Add(ReplaceFounder)
GameEvents.PlayerDoTurn.Add(ReplaceFounder)

-- Holy Wars
function HolyWar(iTeam, iTargetTeam)
	local iPlayer = Teams[iTeam]:GetLeaderID()
	local pPlayer = Players[iPlayer]
	local pTarget = Players[Teams[iTargetTeam]:GetLeaderID()] -- renaming variable to avoid confusion risk

	if not pPlayer:HasCreatedReligion() then return end
	-- if not pTarget:HasCreatedReligion() then return end -- not in S4, open for debate

	local iAttackerReligion = pPlayer:GetReligionCreatedByPlayer()
	if iAttackerReligion < 1 then return end -- pantheons and "no religion" don't count as religions

	local iRange = pPlayer:HasPolicy(policyReformationID) and 15 or 10

	local pCapital = pPlayer:GetCapitalCity()
	local pTargetCapital = pTarget:GetCapitalCity()

	if not pCapital or not pTargetCapital then return end

	local iDefenderReligion = pTargetCapital:GetReligiousMajority()
	if iDefenderReligion == iAttackerReligion then return end -- stop the function if both belligerents follow the same religion

	for i = 0, GameDefines.MAX_MAJOR_CIVS - 1 do
		local pOtherPlayer = Players[i]
		if pOtherPlayer:IsAlive() and i ~= iPlayer then
			local pOtherCapital = pOtherPlayer:GetCapitalCity()
			if pOtherCapital then
				local iOtherReligion = pOtherCapital:GetReligiousMajority()
				if iOtherReligion > 0 then
					local iDistance = Map.PlotDistance(pCapital:GetX(), pCapital:GetY(), pOtherCapital:GetX(),
						pOtherCapital:GetY())
					if iDistance <= iRange then
						if iOtherReligion == iAttackerReligion then
							-- civ joins attacker
							Teams[pOtherPlayer:GetTeam()]:DeclareWar(iTargetTeam)
						elseif (iOtherReligion == iDefenderReligion) and (iDefenderReligion > 0) then
							-- civ joins defender
							Teams[pOtherPlayer:GetTeam()]:DeclareWar(iTeam)
						end
					end
				end
			end
		end
	end
end

GameEvents.DeclareWar.Add(HolyWar)

-- Future Tech Bonus (v 1)
local tUnits = {
	[GameInfoTypes.UNIT_FW_HOVERTANK] = true,
	[GameInfoTypes.UNIT_XCOM_SQUAD] = true,
	[GameInfoTypes.UNIT_FW_BATTLESUIT] = true
}

local techFutureID = GameInfo.Technologies["TECH_FUTURE_TECH"].ID

function unitSpawner(iTeam, iTech, iChange)
	if iTech ~= techFutureID then return end

	for iPlayer = 0, GameDefines.MAX_MAJOR_CIVS - 1, 1 do
		local pPlayer = Players[iPlayer]
		if pPlayer and Teams[pPlayer:GetTeam()] == iTeam then
			local city = pPlayer:GetCapitalCity()

			local unitCount = 10
			for _ = 1, unitCount do
				local iRand = Game.Rand(#tUnits, "RandomUnit")
				local pUnitType = tUnits[iRand]
				pPlayer:InitUnit(pUnitType, city:GetX(), city:GetY())
			end
		end
	end
end

GameEvents.TeamTechResearched.Add(unitSpawner)

-- Strat Resource Mod
local UnitsThatNeededStrategicResources = {}

function LoadStrategicResourceRequirements()
	print("Loading strategic resource requirements...")
	for row in DB.Query('SELECT * FROM UnitsThatNeededStrategicResources') do
		local unitType = row.UnitType
		local resourceType = row.ResourceType
		local resourceID = GameInfoTypes[resourceType]

		if unitType and resourceID then
			UnitsThatNeededStrategicResources[unitType] = resourceID
		else
			print("Invalid row: " .. tostring(unitType) .. " / " .. tostring(resourceType))
		end
	end
end

function UnitProductionChange(iPlayer)
	local player = Players[iPlayer]

	if not player:IsAlive() or player:IsHuman() then
		return
	end

	for city in player:Cities() do
		local productionUnit = city:GetProductionUnit()

		if productionUnit ~= -1 then
			local unitInfo = GameInfo.Units[productionUnit]
			if unitInfo then
				local unitType = unitInfo.Type
				local requiredResource = UnitsThatNeededStrategicResources[unitType]

				if requiredResource then
					local productionBonus = CalculateProductionBonus(city, requiredResource)
					local finalProductionBonus = math.min(
						productionBonus,
						city:GetUnitProductionNeeded(productionUnit)
					)
					city:ChangeUnitProduction(productionUnit, finalProductionBonus)
				end
			end
		end
	end
end

function CalculateProductionBonus(city, resourceType)
	local productionBonus = 0

	for i = 0, city:GetNumCityPlots() - 1 do
		local plot = city:GetCityIndexPlot(i)

		if plot and plot:GetResourceType() == resourceType then
			productionBonus = productionBonus + 5
		end
	end

	return productionBonus
end

Events.SequenceGameInitComplete.Add(LoadStrategicResourceRequirements)
GameEvents.PlayerDoTurn.Add(UnitProductionChange)

-- Early Game City Gifting Saftey Net
local lock = false
local maxCapitalDistance = 15
local minCitiesToBeLeftWith = 4
local maxTurn = 100

function CityGiftingSafetyNet(from_player, _, x, y, to_player, _, is_conquered)
	-- end function if the city wasn't gifted
	if is_conquered then return end

	-- handle multi-firing of the function
	if lock then
		lock = false
		return
	end

	-- if it's past the turn limit, the city gift can stay
	if Game.GetGameTurn() >= maxTurn then
		return
	end

	local bCanTheCityStay = true
	
	-- retrieve the city
	local plot = Map.GetPlot(x, y)
	if not plot or not plot:IsCity() then
		return
	end
	local city = plot:GetPlotCity()
	local oldOwner = Players[from_player]

	-- the city must be given back if the old owner has too few cities remaining
	local losingPlayerCities = oldOwner:GetNumCities()
	if losingPlayerCities < minCitiesToBeLeftWith then
		bCanTheCityStay = false
	end

	if bCanTheCityStay then
		local fromCapital = Players[from_player]:GetCapitalCity()
		local toCapital = losingPlayers:GetCapitalCity()

		if not fromCapital or not toCapital then
			return
		end

		local fromCapitalPlot = fromCapital:Plot()
		local toCapitalPlot = toCapital:Plot()

		-- if the civs' capitals are too far apart, the city should be given back
		local capitalDistance = Map.PlotDistance(fromCapitalPlot:GetX(), fromCapitalPlot:GetY(), toCapitalPlot:GetX(),
			toCapitalPlot:GetY())

		if capitalDistance >= maxCapitalDistance then
			bCanTheCityStay = false
		end
	end

	-- give back the city if needed
	if not bCanTheCityStay then
		print("Acquiring city back from Peace Deal")
		oldOwner:AcquireCity(city, false, true)
	end
	
	lock = true
end

GameEvents.CityCaptureComplete.Add(CityGiftingSafetyNet)
GameEvents.CityAcquired.Add(CityGiftingSafetyNet)
GameEvents.CityAcquiredAndKept.Add(CityGiftingSafetyNet)
