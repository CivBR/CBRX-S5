--[[
CIVILIZATION_SENSHI_PAKISTAN/TRAIT_SENSHI_PAKISTAN
Cities you control receive a Growth bonus equal to half the Religious Pressure from your primary Religion within them. -- Tick
Receive Tiles and Citizens from nearby foreign Cities converted from your Religion to another.

UNIT_SENSHI_POLICE_RANGER
Heals +15 HP and provides +1 Local Happiness when beginning a turn garrisoned within a City. -- Tick
Heals +15 HP and provides +1 Influence per turn when beginning a turn within the borders of a City-State following your Religion. -- Tick

BUILDING_SENSHI_URDU_SOCIETY
Has a slot for a Writer Specialist which provides +25% Religious Pressure in the City when filled. -- Tick
City enters a short We Love the King Day whenever a nearby foreign City is converted from one Religion to another. -- Tick
]]

include("FLuaVector.lua")
include("PlotIterators.lua")

local sTrait = "TRAIT_SENSHI_PAKISTAN"
local iUU = GameInfoTypes["UNIT_SENSHI_POLICE_RANGER"]
local iUUClass = GameInfoTypes[GameInfo.Units[iUU].Class]
local iUB = GameInfoTypes["BUILDING_SENSHI_URDU_SOCIETY"]

local iFoodModDummy = GameInfoTypes["BUILDING_SENSHI_PAKISTAN_GROWTH"] -- Artemis
local iHappinessDummy = GameInfoTypes["BUILDING_SENSHI_PAKISTAN_HAPPINESS"] -- +1 Happiness
local iPressureDummy = GameInfoTypes["BUILDING_SENSHI_PAKISTAN_PRESSURE"] -- +25% Pressure

local iHowNearIsNearby = 10
local iShortWLTKD = math.ceil(GameDefines.CITY_RESOURCE_WLTKD_TURNS / 2)
local bGameRuleMajorityReligion = false -- The game qualifies "Majority Religion" for the sake of the diplo effect (and the UU City-State healing effect) etc as being the Religion in more than 50% of your Cities; if this variable is true, the Lua logic will follow similar rules, otherwise it will simply find the Religion with the most Cities following it

function JFD_GetRandom(lower, upper)
	return Game.Rand((upper + 1) - lower, "") + lower
end

local tLeaders = {}
for row in DB.Query("SELECT ID FROM Leaders WHERE Type IN (SELECT LeaderType FROM Leader_Traits WHERE TraitType = '" .. sTrait .. "')") do
	tLeaders[row.ID] = true
end

local tCities = {}
function C15_Senshi_Pakistan_LoadScreen()
    for k, v in pairs(Players) do
        if v and v:IsEverAlive() then
			for pCity in v:Cities() do
				local iX, iY = pCity:GetX(), pCity:GetY()
				if not tCities[iX] then
					tCities[iX] = {}
				end
				local iReligion = pCity:GetReligiousMajority()
				tCities[iX][iY] = {iReligion = iReligion, Count = pCity:GetNumFollowers(iReligion)}
			end
		end
	end
end

Events.SequenceGameInitComplete.Add(C15_Senshi_Pakistan_LoadScreen)		
		
function C15_ProdTextOnPlot(iX, iY, sString) -- Code's basically Suk's fwiw 
    local pHexPos = ToHexFromGrid{x=iX, y=iY}
    local pWorldPos = HexToWorld(pHexPos)
    Events.AddPopupTextEvent(pWorldPos, sString)
end

function C15_YourReligion(pPlayer)
	if Player.GetCurrentStateReligion then 
		return pPlayer:GetCurrentStateReligion()
	elseif Player.GetOriginalReligionCreatedByPlayer and pPlayer:GetOriginalReligionCreatedByPlayer() > 0 then
		return pPlayer:GetOriginalReligionCreatedByPlayer()
	elseif pPlayer:GetReligionCreatedByPlayer() > 0 then
		return pPlayer:GetReligionCreatedByPlayer()
	else
		local tReligions = {}
		for pCity in pPlayer:Cities() do
			local iReligion = pCity:GetReligiousMajority()
			if tReligions[iReligion] then
				tReligions[iReligion] = tReligions[iReligion] + 1
			else
				tReligions[iReligion] = 1
			end
		end
		
		local highK, highV = -1, -1
		for k, v in pairs(tReligions) do
			if v > highV then
				highK = k
				highV = v
			end
		end
		
		if bGameRuleMajorityReligion then
			if highV > pPlayer:GetNumCities() / 2 then
				return highk
			else
				return -1
			end
		else
			return highK
		end
	end
end

function C15_Senshi_Pakistan_DoTurn(playerID)
	local pPlayer = Players[playerID]
	local iReligion = C15_YourReligion(pPlayer)
	local bReligion = iReligion > 0
	local bUnitClass = pPlayer:GetUnitClassCount(iUUClass) > 0
	if bUnitClass and bReligion then
		local bActive = Game.GetActivePlayer() == playerID
		for pUnit in pPlayer:Units() do
			if pUnit:GetUnitType() == iUU then
				local pPlot = pUnit:GetPlot()
				local iOwner = pPlot:GetOwner()
				local pOwner = Players[iOwner]
				if pOwner and pOwner:IsMinorCiv() then
					if pOwner:HasReligionInMostCities(iReligion) then
						pUnit:ChangeDamage(-15)
						pOwner:ChangeMinorCivFriendshipWithMajor(playerID, 1)
						if bActive then
							C15_ProdTextOnPlot(pUnit:GetX(), pUnit:GetY(), "+1 [ICON_INFLUENCE]")
						end
					end
				end
			end
		end
	end
	
	if tLeaders[pPlayer:GetLeaderType()] or bUnitClass or pPlayer:CountNumBuildings(iHappinessDummy) > 0 or pPlayer:CountNumBuildings(iUB) > 0 or pPlayer:CountNumBuildings(iPressureDummy) > 0 then
		for pCity in pPlayer:Cities() do
			-- UU
			local pGarrison = pCity:GetGarrisonedUnit()
			if pGarrison then
				if pGarrison:GetUnitType() == iUU then
					pGarrison:ChangeDamage(-15)
					pCity:SetNumRealBuilding(iHappinessDummy, 1)
				else
					pCity:SetNumRealBuilding(iHappinessDummy, 0)
				end
			else
				pCity:SetNumRealBuilding(iHappinessDummy, 0)
			end
			
			-- UA
			if tLeaders[pPlayer:GetLeaderType()] and bReligion then
				local iPressure = pCity:GetPressurePerTurn(iReligion)
				pCity:SetNumRealBuilding(iFoodModDummy, math.floor(iPressure / 20))
			else
				pCity:SetNumRealBuilding(iFoodModDummy, 0)
			end
			
			-- UB
			if pCity:IsHasBuilding(iUB) then
				if pCity:GetNumSpecialistsInBuilding(iUB) > 0 then
					pCity:SetNumRealBuilding(iPressureDummy, 1)
				else
					pCity:SetNumRealBuilding(iPressureDummy, 0)
				end
			else
				pCity:SetNumRealBuilding(iPressureDummy, 0)
			end
		end
	end
end

GameEvents.PlayerDoTurn.Add(C15_Senshi_Pakistan_DoTurn)

function C15_Senshi_Pakistan_OnCityConvert(pCity, iX, iY, iOldReligion)
	local pPlot = Map.GetPlot(iX, iY)
	local iOwner = pCity:GetOwner()
	local tMigrationTargets = {}
	for pIterPlot in PlotAreaSpiralIterator(pPlot, iHowNearIsNearby) do
		if pIterPlot then
			local pIterCity = pIterPlot:GetPlotCity()
			if pIterCity then
				local iterOwnerID = pIterCity:GetOwner()
				if iterOwnerID ~= iOwner then
					if pIterCity:IsHasBuilding(iUB) then
						pIterCity:ChangeWeLoveTheKingDayCounter(iShortWLTKD)
					end
					local pOtherOwner = Players[iterOwnerID]
					
					if tLeaders[pOtherOwner:GetLeaderType()] then
						local iOtherReligion = C15_YourReligion(pOtherOwner)
						
						if iOldReligion == iOtherReligion then
							local iIterX, iIterY = pIterPlot:GetX(), pIterPlot:GetY()
							tMigrationTargets[#tMigrationTargets+1] = {PlayerID = iterOwnerID, City = pIterCity, X = iIterX, Y = iIterY, Distance = Map.PlotDistance(iX, iY, iIterX, iIterY), Religion = iOtherReligion}
							print(pIterCity:GetName(), Map.PlotDistance(iX, iY, iIterX, iIterY))
						end
					end
				end
			end
		end
	end
	
	table.sort(tMigrationTargets, function(a,b) return a.Distance < b.Distance end)
		
	if tMigrationTargets[1] then
		local pIterCity = tMigrationTargets[1].City
		local iIterX, iIterY = pIterCity:GetX(), pIterCity:GetY()
		local iterCityID = pIterCity:GetID()
		local tCityTable = tCities[iX][iY]
		local iOtherReligion = tMigrationTargets[1].iReligion
		local iCurrentFollowers = pCity:GetNumFollowers(iOtherReligion)
		--local iMigrants = (tCityTable.Count - iCurrentFollowers) / 2
		-- I don't wanna do maths, and 2 pop is already like a broken effect so /shrug
		local iMigrants = 2
		if pCity:GetPopulation() - iMigrants <= 1 then
			iMigrants = pCity:GetPopulation() - 1
		end
		pCity:ChangePopulation(-iMigrants, true) -- I guess the fear is that this could cause iOtherReligion to grow in followers, depending on how the game decides to redistribute them
		pIterCity:ChangePopulation(iMigrants, true)
		
		-- 	I don't know how the fuck you're meant to take the tiles fuck you
		local iNumCityPlots = pCity:GetNumCityPlots() - 1
		--local iNumToTake = math.min(math.ceil(iNumCityPlots / 9), 3)
		local iNumTakenSoFar = 0
		local tPlots = {}
		for i = iNumCityPlots, 1, -1 do
			local pVictimPlot = pCity:GetCityIndexPlot(i)
			if pVictimPlot and pVictimPlot:GetOwner() == iOwner and pVictimPlot:GetWorkingCity() == pCity then
				tPlots[#tPlots+1] = {Plot = pVictimPlot, Distance = Map.PlotDistance(iIterX, iIterY, pVictimPlot:GetX(), pVictimPlot:GetY())}
			end
		end
		
		table.sort(tPlots, function(a,b) return a.Distance < b.Distance end)
		
		local iNumToTake = math.min(math.ceil(#tPlots / 9), 3)

		for i = 1, iNumToTake do
			local tPlotInfo = tPlots[i]
			if tPlotInfo then
				tPlotInfo.Plot:SetOwner(tMigrationTargets[1].PlayerID, iterCityID)
			else
				break
			end
		end
		if Game.GetActivePlayer() == pIterCity:GetOwner() then
			Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_SENSHI_PAKISTAN_MIGRATION_TEXT", pCity:GetName(), pIterCity:GetName()))
		end
	end
end

function C15_Senshi_Pakistan_ReligionChange(playerID, iReligion, iX, iY) -- Fires each time a Citizen changes their Religion, including adoption, and gives no indication as to the prior Religion
	local pPlot = Map.GetPlot(iX, iY)
	if pPlot then
		local pCity = pPlot:GetPlotCity()
		if pCity then
			local iMajority = pCity:GetReligiousMajority()
			if not tCities[iX] then
				tCities[iX] = {}
			end
			if tCities[iX][iY] then
				if iMajority ~= tCities[iX][iY].iReligion then
					local iOldReligion = tCities[iX][iY].iReligion
					tCities[iX][iY] = {iReligion = iMajority, Count = pCity:GetNumFollowers(iMajority)}
					C15_Senshi_Pakistan_OnCityConvert(pCity, iX, iY, iOldReligion)
				end
			else
				tCities[iX][iY] = {iReligion = iMajority, Count = pCity:GetNumFollowers(iMajority)}
				C15_Senshi_Pakistan_OnCityConvert(pCity, iX, iY, -1)
				
			end
		elseif tCities[iX] then
			tCities[iX][iY] = nil
		end
	end
end

GameEvents.CityConvertsReligion.Add(C15_Senshi_Pakistan_ReligionChange)

-- And now we're gonna pray to fucking god that this event fires before cityconvertsreligion because it's the only way to discern a city settled on a razed city I fucking hate this game
function C15_Senshi_Pakistan_Resettle(playerID, iX, iY)
	if tCities[iX] then
		if tCities[iX][iY] then
			tCities[iX][iY] = nil
		end
	end
end

GameEvents.PlayerCityFounded.Add(C15_Senshi_Pakistan_Resettle)