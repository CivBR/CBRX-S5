
--[[
CIVILIZATION_SENSHI_BANGLADESH/TRAIT_SENSHI_BANGLADESH
Golden Age Points from all sources are increased by 20% for the duration of a Peace Treaty. -- Tick
During a Golden Age, each Citizen in the Capital provides +2 Culture. -- Tick

UNIT_SENSHI_MUKTI_BAHINI
> Burst of Production (mebbe +75) towards this Unit whenever a Citizen is born in a city (after discovering Ballistics ofc) -- Tick?
> +1 Golden Age Points when Garrisoned in a City. -- Tick
> Automatically attacks enemy units which Paradrop within two tiles of this unit.* (If this is unfeasible which it probably is, mebbe enemy units with a promotion where DropRange > 0 take 20HP when beginning within two tiles of the unit) -- TICK!

BUILDING_SENSHI_MONUMENT_OF_MARTYRS
> Begins a 10-turn WLTKD upon signing a Peace Treaty. -- Tick
> Permanent +1 Happiness for each WLTKD beginning after the Building was constructed. -- Tick
]]

include("PlotIterators.lua")
include("C15_IteratorPack_v4.lua")

local iUU = GameInfoTypes["UNIT_SENSHI_MUKTI_BAHINI"]
local iUB = GameInfoTypes["BUILDING_SENSHI_MONUMENT_OF_MARTYRS"]
local sTrait = "TRAIT_SENSHI_BANGLADESH"
local iHappinessDummy = GameInfoTypes["BUILDING_SENSHI_BANGLADESH_HAPPINESS"] -- +1 Happiness, NeverCapture
local iCultureDummy = GameInfoTypes["BUILDING_SENSHI_BANGLADESH_CULTURE"] -- NeverCapture, +2 Culture per Citizen, Library's table, if it doesn't work for Culture then I'mma kill a pig
local iPopProduction = 100 -- You gave me a number I'm fuckin using it -- Haha well I fucking changed it <3 Senshi

local iYieldGoldenAge = YieldTypes.YIELD_GOLDEN_AGE_POINTS

local sYourUnitKilledByUU = "TXT_KEY_SENSHI_MUKTI_BAHINI_KILLED_YOU" -- Expects parameter for Unit Name
local sYourUnitDamagedByUU = "TXT_KEY_SENSHI_MUKTI_BAHINI_DAMAGED_YOU" -- Expects parameters for Unit Name, Damage Taken
local sYourUUKilledAUnit = "TXT_KEY_SENSHI_MUKTI_BAHINI_KILLED_SOMETHING" -- Expects parameter for killed Unit Name
local sYourUUDamagedAUnit = "TXT_KEY_SENSHI_MUKTI_BAHINI_DAMAGED_SOMETHING" -- Expects parameters for Attacked Unit Name, Damage Dealt
local sYourUUKilledAUnitButDied = "TXT_KEY_SENSHI_MUKTI_BAHINI_KILLED_ITSELF" -- Expects parameter for killed Unit Name
local sYourUUDamagedAUnitButDied = "TXT_KEY_SENSHI_MUKTI_BAHINI_DAMAGED_ITSELF" -- Expects parameters for Attacked Unit Name, Damage Dealt

local sPeaceWLTKD = "TXT_KEY_SENSHI_BANGLADESH_PEACE_WLTKD" -- Expects parameter for City Name
local sGAPAdded = "TXT_KEY_SENSHI_BANGLADESH_GAP" -- Expects parameter for bonus Golden Age Points added in the turn (from both UU and UA)

local tLeaders = {}
for row in DB.Query("SELECT ID FROM Leaders WHERE Type IN (SELECT LeaderType FROM Leader_Traits WHERE TraitType = '" .. sTrait .. "')") do
	tLeaders[row.ID] = true
end

local tCities = {}

local tTeamPlayers = {}
function C15_Teams_LoadScreen()
    for k, v in pairs(Players) do
        if v and v:IsEverAlive() then -- Find relevant Civs
			
			tCities[k] = {}
			for pCity in v:Cities() do
				if pCity:IsHasBuilding(iUB) then
					tCities[k][pCity:GetID()] = pCity:GetWeLoveTheKingDayCounter() > 0
				end
			end
			
            local iTeam = v:GetTeam()
            if tTeamPlayers[iTeam] then -- Add Teams with Leaders starring in tLeaders to table as keys, with their values being the relevant Players on said Team tabulated
                table.insert(tTeamPlayers[iTeam], k) -- As we all know table.insert is slower than tTeamPlayers[#tTeamPlayers+1] but fuku
            else
                tTeamPlayers[iTeam] = {k}
            end
        end
    end
end

Events.LoadScreenClose.Add(C15_Teams_LoadScreen) -- Event fires when DoM is closed

function C15_IsPeaceTreaty(pTeam)
	for k, v in pairs(Teams) do
		if pTeam:IsForcePeace(k) then -- I changed this <3 Senshi
			return true
		end
	end
	
	return false
end
		
function C15_WLTKDHandler(pCity) -- For some reason I've decided that I'm not doing safety checks for this, so ONLY call after WLTKD turns have been added AND you know that the City is in the table (i.e. the UB is present)
	local playerID, cityID = pCity:GetOwner(), pCity:GetID()
	if not tCities[playerID][cityID] then
		pCity:SetNumRealBuilding(iHappinessDummy, pCity:GetNumRealBuilding(iHappinessDummy) + 1)
		tCities[playerID][cityID] = true
	end
end

local maxUnitHitPoints = GameDefines["MAX_HIT_POINTS"];
function C15_UnitvsUnitCombatProcess(pAttacker, pDefender)
	-- Yeah, this is just copied from EnemyUnitPanel.lua
	local iMyPlayer = pAttacker:GetOwner();
	local iTheirPlayer = pDefender:GetOwner();
	local pMyPlayer = Players[iMyPlayer];
	local pTheirPlayer = Players[iTheirPlayer];
	
	local iMyStrength = 0;
	local iTheirStrength = 0;
	local bRanged = false;
	local iNumVisibleAAUnits = 0;
	local bInterceptPossible = false;
	
	local pFromPlot = pAttacker:GetPlot();
	local pToPlot = pDefender:GetPlot();
	
	-- Ranged Unit
	if (pAttacker:GetBaseRangedCombatStrength() > 0) then
		iMyStrength = pAttacker:GetMaxRangedCombatStrength(pDefender, nil, true, true);
		bRanged = true;
			
	-- Melee Unit
	else
		iMyStrength = pAttacker:GetMaxAttackStrength(pFromPlot, pToPlot, pDefender);
	end
	
	if (iMyStrength > 0) then
		
		-- Start with logic of combat estimation
		local iMyDamageInflicted = 0;
		local iTheirDamageInflicted = 0;
		local iTheirFireSupportCombatDamage = 0;
		
		-- Ranged Strike
		if (bRanged) then
			
			iMyDamageInflicted = pAttacker:GetRangeCombatDamage(pDefender, nil, false);
			
			if (pDefender:IsEmbarked()) then
				iTheirStrength = pDefender:GetEmbarkedUnitDefense();
			else
				iTheirStrength = pDefender:GetMaxRangedCombatStrength(pAttacker, nil, false, true);
			end
			
			if (iTheirStrength == 0 or pDefender:GetDomainType() == DomainTypes.DOMAIN_SEA or pDefender:IsRangedSupportFire()) then
				iTheirStrength = pDefender:GetMaxDefenseStrength(pToPlot, pAttacker, true);
			end
			
			if (pAttacker:GetDomainType() == DomainTypes.DOMAIN_AIR) then
				iTheirDamageInflicted = pDefender:GetAirStrikeDefenseDamage(pAttacker, false);				
				iNumVisibleAAUnits = pAttacker:GetInterceptorCount(pToPlot, pDefender, true, true);		
				bInterceptPossible = true;
			end
			
		-- Normal Melee Combat
		else
			
			iTheirStrength = pDefender:GetMaxDefenseStrength(pToPlot, pAttacker);
			
			local pFireSupportUnit = pAttacker:GetFireSupportUnit(pDefender:GetOwner(), pToPlot:GetX(), pToPlot:GetY());
			if (pFireSupportUnit ~= nil) then
				iTheirFireSupportCombatDamage = pFireSupportUnit:GetRangeCombatDamage(pAttacker, nil, false);
			end
			
			iMyDamageInflicted = pAttacker:GetCombatDamage(iMyStrength, iTheirStrength, pAttacker:GetDamage() + iTheirFireSupportCombatDamage, false, false, false);
			iTheirDamageInflicted = pDefender:GetCombatDamage(iTheirStrength, iMyStrength, pDefender:GetDamage(), false, false, false);
			iTheirDamageInflicted = iTheirDamageInflicted + iTheirFireSupportCombatDamage;
			
		end
		
		-- Don't give numbers greater than a Unit's max HP
		if (iMyDamageInflicted > maxUnitHitPoints) then
			iMyDamageInflicted = maxUnitHitPoints;
		end
		if (iTheirDamageInflicted > maxUnitHitPoints) then
			iTheirDamageInflicted = maxUnitHitPoints;
		end
		
		return iMyDamageInflicted, iTheirDamageInflicted
	end
	
	return 0, 0
end

function C15_Senshi_Banga_OnParadrop(playerID, unitID, iFromX, iFromY, iToX, iToY)
	local pPlayer = Players[playerID]
	local pTeam = Teams[pPlayer:GetTeam()]
	local pUnit = pPlayer:GetUnitByID(unitID)
	local pPlot = Map.GetPlot(iToX, iToY)
	local iActive = Game.GetActivePlayer()
	for pIterPlot in PlotAreaSpiralIterator(pPlot, 2) do
		if pIterPlot then
			for pIterUnit in C15_PlotUnitsIterator(pIterPlot) do
				if pIterUnit and pIterUnit:GetUnitType() == iUU then
					local iOwner = pIterUnit:GetOwner()
					local iOpponentTeam = Players[iOwner]:GetTeam()
					if pTeam:IsAtWar(iOpponentTeam) then
						local iAttackDamage, iRecoil = C15_UnitvsUnitCombatProcess(pIterUnit, pUnit)
						if iAttackDamage > 0 then
							pUnit:ChangeDamage(iAttackDamage)
							if iRecoil > 0 then
								pIterUnit:ChangeDamage(iRecoil)
							end
							if iActive == playerID then
								if pUnit:IsDead() then
									Events.GameplayAlertMessage(Locale.ConvertTextKey(sYourUnitKilledByUU, pUnit:GetName()))
								else
									Events.GameplayAlertMessage(Locale.ConvertTextKey(sYourUnitDamagedByUU, pUnit:GetName(), iAttackDamage))
								end
							elseif iActive == iOwner then
								if pIterUnit:IsDead() then
									if pUnit:IsDead() then
										Events.GameplayAlertMessage(Locale.ConvertTextKey(sYourUUKilledAUnitButDied, pUnit:GetName()))
									else
										Events.GameplayAlertMessage(Locale.ConvertTextKey(sYourUUDamagedAUnitButDied, pUnit:GetName(), iAttackDamage))
									end
								else
									if pUnit:IsDead() then
										Events.GameplayAlertMessage(Locale.ConvertTextKey(sYourUUKilledAUnit, pUnit:GetName()))
									else
										Events.GameplayAlertMessage(Locale.ConvertTextKey(sYourUUDamagedAUnit, pUnit:GetName(), iAttackDamage))
									end
								end
							end
						end
					end
				end
			end
		end
	end
end

GameEvents.ParadropAt.Add(C15_Senshi_Banga_OnParadrop)

function C15_Senshi_Banga_OnPeace(fromTeamID, toTeamID)
	local iActive = Game.GetActivePlayer()
	local tLocal = {fromTeamID, toTeamID}
	for k, teamID in ipairs(tLocal) do
		if tTeamPlayers[teamID] then
			for k2, playerID in ipairs(tTeamPlayers[teamID]) do 
				local pPlayer = Players[playerID]
				if pPlayer:CountNumBuildings(iUB) > 0 then
					for pCity in pPlayer:Cities() do
						if pCity:IsHasBuilding(iUB) then
							pCity:ChangeWeLoveTheKingDayCounter(10)
							C15_WLTKDHandler(pCity)
							if playerID == iActive then
								Events.GameplayAlertMessage(Locale.ConvertTextKey(sPeaceWLTKD, pCity:GetName()))
							end
						end
					end
				end
			end
		end
	end
end

GameEvents.MakePeace.Add(C15_Senshi_Banga_OnPeace)

function C15_Senshi_Banga_Construct(playerID, cityID, buildingID)
	if buildingID == iUB then
		local pPlayer = Players[playerID]
		local pCity = pPlayer:GetCityByID(cityID)
		tCities[playerID][cityID] = pCity:GetWeLoveTheKingDayCounter() > 0
	end
end

GameEvents.CityConstructed.Add(C15_Senshi_Banga_Construct)

function C15_Senshi_Banga_Sold(playerID, cityID, buildingID)
	if buildingID == iUB then
		tCities[playerID][cityID] = nil
	end
end

GameEvents.CitySoldBuilding.Add(C15_Senshi_Banga_Sold)

function C15_Senshi_Banga_DoTurn(playerID)
	local pPlayer = Players[playerID]
	if tCities[playerID] then
		for k, v in pairs(tCities[playerID]) do
			local pCity = pPlayer:GetCityByID(k) -- Hopefully this is nil if City has been reposessed
			if pCity then
				if pCity:IsHasBuilding(iUB) then
					if pCity:GetWeLoveTheKingDayCounter() > 0 then
						if not v then
							C15_WLTKDHandler(pCity)
						end
					elseif v then
						tCities[playerID][cityID] = false
					end
				else
					tCities[playerID][cityID] = nil
				end
			else
				tCities[playerID][cityID] = nil
			end
		end
	end
	
	if tLeaders[pPlayer:GetLeaderType()] then
		local pTeam = Teams[pPlayer:GetTeam()]
		local bPeaceTreaty = C15_IsPeaceTreaty(pTeam)
		local bIsGoldenAge = pPlayer:IsGoldenAge()
		
		for pCity in pPlayer:Cities() do
			if bIsGoldenAge then
				if pCity:IsCapital() then
					iCityPop = pCity:GetPopulation()
					pCity:SetNumRealBuilding(iCultureDummy, iCityPop)
				end
			else
				pCity:SetNumRealBuilding(iCultureDummy, 0)
			end
		end
		if not bIsGoldenAge then
			local iGAPToAdd = 0
			local iGAPToAddDuringTreaty = 0  -- this next bit is really janky cause I changed it without telling Chrisy :happysperm:
			local iHappiness = pPlayer:GetExcessHappiness()
			if iHappiness > 0 then
				iGAPToAddDuringTreaty = iHappiness
			end
			
			for pCity in pPlayer:Cities() do
				local pUnit = pCity:GetGarrisonedUnit()
				if pUnit and pUnit:GetUnitType() == iUU then
					iGAPToAdd = iGAPToAdd + 1
				end
				if iYieldGoldenAge then
					iGAPToAddDuringTreaty = iGAPToAddDuringTreaty + pCity:GetYieldRate(iYieldGoldenAge)
				end
			end
			
			if bPeaceTreaty then
				iGAPToAdd = iGAPToAdd * 2
				iGAPToAdd = iGAPToAdd + iGAPToAddDuringTreaty
			end
			
			iGAPToAdd = math.floor(iGAPToAdd)
			
			pPlayer:ChangeGoldenAgeProgressMeter(iGAPToAdd)
			
			if Game.GetActivePlayer() == playerID then
				if iGAPToAdd > 0 then
					Events.GameplayAlertMessage(Locale.ConvertTextKey(sGAPAdded, iGAPToAdd))
				end
			end
		end
	end
end

GameEvents.PlayerDoTurn.Add(C15_Senshi_Banga_DoTurn)

function C15_Senshi_Banga_Conquer(oldID, bCap, iX, iY, newID)
	local tLocal = {oldID, newID}
	for k, playerID in ipairs(tLocal) do
		local pPlayer = Players[playerID]
		if tLeaders[pPlayer:GetLeaderType()] then
			if pPlayer:IsGoldenAge() then
				for pCity in pPlayer:Cities() do
					if pCity:IsCapital() then
						iCityPop = pCity:GetPopulation()
						pCity:SetNumRealBuilding(iCultureDummy, iCityPop)
					else
						pCity:SetNumRealBuilding(iCultureDummy, 0)
					end
				end
			end
		end
	end
end

GameEvents.CityCaptureComplete.Add(C15_Senshi_Banga_Conquer)

function C15_Senshi_Banga_Population(iX, iY, iOld, iNew)
	if iNew > iOld then
		local pPlot = Map.GetPlot(iX, iY)
		if pPlot then
			local pCity = pPlot:GetPlotCity()
			if pCity then
				if pCity:CanTrain(iUU) then -- I don't think I need any other arguments but I don't rememberrrrrrrrrr
					local iNeeded = pCity:GetUnitProductionNeeded(iUU)
					if iNeeded > 0 then
						pCity:ChangeUnitProduction(iUU, math.min(iPopProduction, iNeeded))
					end
				end
			end
		end
	end
end

GameEvents.SetPopulation.Add(C15_Senshi_Banga_Population)
					