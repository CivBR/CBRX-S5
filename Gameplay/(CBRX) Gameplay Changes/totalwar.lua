-- Total War
function TotalWar(teamID, otherTeamID)
	if teamID == 0 or otherTeamID == 0 then return end
	local mainTeam = Teams[teamID]
	mainTeam:DeclareWar(otherTeamID)
end

-- Ultra-Late Game Unit Spawner
function SpawnXCOMS(playerID, cityID)
	local player = Players[playerID]
	local city = player:GetCityByID(cityID)
	local unitType = GameInfoTypes["UNIT_XCOM"]

	if city then
		local plot = city:Plot()
		local x, y = plot:GetX(), plot:GetY()
		player:InitUnit(unitType, x, y)
	end
end

function OnUnitTrained(playerID, cityID, unitID, isGold, isFaithOrCulture)
	-- Uncomment the following line to enable the spawning of extra XCOMs every time a city makes a unit
	-- SpawnXCOMS(playerID, cityID)
end

local TotalWarActive = false

local function DeclareWarEveryWhere()
	for teamID, team in pairs(Teams) do
		if team:IsAlive() then
			for otherTeamID, otherTeam in pairs(Teams) do
				if otherTeam:IsAlive() and teamID ~= otherTeamID then
					team:DeclareWar(otherTeamID)
					team:SetPermanentWarPeace(otherTeamID, true)
				end
			end
		end
	end
end

local function MakePeaceEveryWhere()
	for teamID, team in pairs(Teams) do
		if team:IsAlive() then
			for otherTeamID, otherTeam in pairs(Teams) do
				if otherTeam:IsAlive() and teamID ~= otherTeamID then
					team:SetPermanentWarPeace(otherTeamID, false)
				end
			end
		end
	end
end

local function EnableTotalWarScripts()
	TotalWarActive = true
	-- GameEvents.CityTrained.Add(OnUnitTrained)
	DeclareWarEveryWhere()
end

local function DisableTotalWarScripts()
	TotalWarActive = false
	-- GameEvents.CityTrained.Remove(OnUnitTrained)
	MakePeaceEveryWhere()
end

LuaEvents.EnableTotalWarScripts.Add(EnableTotalWarScripts)
LuaEvents.DisableTotalWarScripts.Add(DisableTotalWarScripts)