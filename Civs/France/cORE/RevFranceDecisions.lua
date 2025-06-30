-- RevFranceDecisions.lua
--------------------------------------------------------------
-- local teutonID						= GameInfoTypes.CIVILIZATION_URDNOT_REV_FRANCE -- kek
local civilizationID					= civilizationID
local techTheologyID					= GameInfoTypes["TECH_CHIVALRY"]
local REVFRANCE_SUPREMEID				= GameInfoTypes["POLICY_REVFRANCE_SUPREME"]
--------------------------------------------------------------------------------------------------------------------------------------------------------------
-- REVFRANCE_SUPREME
--------------------------------------------------------------------------------------------------------------------------


local Decisions_RevFrance_Supreme = {}
	Decisions_RevFrance_Supreme.Name = "TXT_KEY_DECISIONS_URDNOT_SUPREME_BEING"
	Decisions_RevFrance_Supreme.Desc = "TXT_KEY_DECISIONS_URDNOT_SUPREME_BEING_DESC"
	HookDecisionCivilizationIcon(Decisions_RevFrance_Supreme, "CIVILIZATION_URDNOT_REV_FRANCE")
	Decisions_RevFrance_Supreme.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationID then return false, false end
		if load(player, "Decisions_RevFrance_Supreme") == true then
			Decisions_RevFrance_Supreme.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_URDNOT_SUPREME_BEING_ENACTED_DESC")
			return false, false, true
		end

		Decisions_RevFrance_Supreme.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_UC_REVFRANCE_SUPREME_DESC")
		local goldCost = 600 *iMod
		Decisions_RevFrance_Supreme.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_URDNOT_SUPREME_BEING_DESC", goldCost)
		if (not GetPlayerMajorityReligion(player))					then return true, false end
		if player:GetNumResourceAvailable(iMagistrate, false) < 1	then return true, false end
		if (not Teams[player:GetTeam()]:IsHasTech(techTheologyID))	then return true, false end		
		if player:GetGold() < goldCost then return true, false end
		if player:GetFaith() < faithCost then return true, false end

		return true, true
	end
	)
		
	
Decisions_RevFrance_Supreme.DoFunc = (
    function(player)
        player:ChangeNumResourceTotal(iMagistrate, -2)
        local goldCost = 600 * iMod
		local faithCost = 200 *iMod
        player:ChangeGold(-goldCost)
		player:ChangeGold(-faithCost)
        player:SetNumFreePolicies(1)
        player:SetNumFreePolicies(0)
        player:SetHasPolicy(REVFRANCE_SUPREMEID, true)
        save(player, "Decisions_RevFrance_Supreme", true)
    end
    )
	
Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_URDNOT_REV_FRANCE, "Decisions_RevFrance_Supreme", Decisions_RevFrance_Supreme)

-- JFD_GetRandom
--------------------------------------------------------------------------------------------------------------------------
function JFD_GetRandom(lower, upper)
    return Game.Rand((upper + 1) - lower, "") + lower
end

--LeeS's Utilities

function ChangeTechProgressAndReturnOverflow(iValue, iTechnology, pTeamTechs, pTeam, iPlayer)
	if iValue <= pTeamTechs:GetResearchLeft(iTechnology) then
		pTeamTechs:ChangeResearchProgress(iTechnology, iValue, iPlayer)
		return 0
	else
		local iChange = iValue - pTeamTechs:GetResearchLeft(iTechnology)
		pTeam:SetHasTech(iTechnology, true)
		return iChange
	end
	return -1
end
function ChangePlayerResearchProgress(iPlayer, iValue, bOnlyCurrentTech)
	local CurrentTechOnly = ((bOnlyCurrentTech ~= nil) and bOnlyCurrentTech or false)
	local pPlayer = Players[iPlayer]
	local iCurrentResearchItem = pPlayer:GetCurrentResearch()
	local pTeam = Teams[pPlayer:GetTeam()]
	local pTeamTechs = pTeam:GetTeamTechs()
	local iChange = iValue
	if (iCurrentResearchItem ~= -1) and (iCurrentResearchItem ~= nil) then
		iChange = ChangeTechProgressAndReturnOverflow(iValue, iTechnology, pTeamTechs, pTeam, iPlayer)
		if CurrentTechOnly or (iChange <= 0) then
			return
		end
	end
	local tTechsNotResearched = {}
	local iLowestGridWithUnResearchedTech = 1000
	local iLargestTechGridX = 0
	local bUnresearchedTechExists = false
	for Tech in GameInfo.Technologies() do
		if not Tech.Disable and not pTeamTechs:HasTech(Tech.ID) then
			bUnresearchedTechExists = true
			if Tech.GridX < iLowestGridWithUnResearchedTech then
				iLowestGridWithUnResearchedTech = Tech.GridX
			end
			if not tTechsNotResearched[Tech.GridX] then
				tTechsNotResearched[Tech.GridX] = {}
			end
			table.insert(tTechsNotResearched[Tech.GridX], {TechID=Tech.ID, Progress=pTeamTechs:GetResearchProgress(Tech.ID)})
		end
		if Tech.GridX > iLargestTechGridX then
			iLargestTechGridX = Tech.GridX
		end
	end
	if bUnresearchedTechExists then
		local iSelection = JFD_GetRandom(1, #tTechsNotResearched[iLowestGridWithUnResearchedTech])
		local iSelectedTech = tTechsNotResearched[iLowestGridWithUnResearchedTech][iSelection].TechID
		ChangeTechProgressAndReturnOverflow(iChange, iSelectedTech, pTeamTechs, pTeam, iPlayer)
	end
end

function SupremeBeingSelling(playerID, cityID, buildingID)
	local player = Players[playerID]
	if (player:IsAlive() and player:GetCivilizationType() == teutonID) then
	if player:HasPolicy() == GameInfoTypes.POLICY_MERKEL_ENERGY then
        local iCity = player:GetCityByID(cityID)
			local tFaithBuildings = {}
			for row in DB.Query("SELECT ID FROM Buildings WHERE Cost > -1 AND FaithCost > -1 AND Type IN (SELECT BuildingType FROM Building_YieldChanges WHERE YieldType = 'YIELD_FAITH') AND Type IN (SELECT DefaultBuilding FROM BuildingClasses WHERE MaxPlayerInstances = -1 AND MaxGlobalInstances = -1 AND MaxTeamInstances = -1)") do
			tFaithBuildings[row.ID] = true
			end
			if buildingID == #tFaithBuildings then
				local prodCost = player:GetBuildingProductionNeeded(buildingID) * iMod
				local base = iCity:GetProduction()
				ChangePlayerResearchProgress(playerID, prodCost + base, true)
			end
        end
    end
end
GameEvents.CitySoldBuilding.Add(SupremeBeingSelling)

function SupremeBeingHappiness(playerID)
	local player = Players[playerID]
	if (player:IsAlive() and player:GetCivilizationType() == teutonID) then
	if player:HasPolicy() == GameInfoTypes.POLICY_MERKEL_ENERGY then
	for city in player:Cities() do
		if not city:IsHasBuilding() == GameInfoTypes.BUILDING_SHRINE and not city:IsHasBuilding() == GameInfoTypes.BUILDING_TEMPLE and not city:IsHasBuilding() == GameInfoTypes.BUILDING_UC_MIT_PROD then
		city:SetNumRealBuilding(GameInfoTypes.BUILDING_UC_MIT_PROD, 1)
		elseif city:IsHasBuilding() == GameInfoTypes.BUILDING_UC_MIT_PROD and (city:IsHasBuilding() == GameInfoTypes.BUILDING_SHRINE and or city:IsHasBuilding() == GameInfoTypes.BUILDING_TEMPLE) then
		city:SetNumRealBuilding(GameInfoTypes.BUILDING_UC_MIT_PROD, 0)
					end
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(SupremeBeingHappiness)
			
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- TO: Ostsiedlung
--------------------------------------------------------------------------------------------------------------------------
local SansCulottesID = GameInfoTypes["POLICY_UC_MERKEL_POLICY"]

local Decisions_SansCulottes = {}
	Decisions_SansCulottes.Name = "TXT_KEY_DECISIONS_UC_OSTSIEDLUNG"
	Decisions_SansCulottes.Desc = "TXT_KEY_DECISIONS_UC_OSTSIEDLUNG_DESC"
	HookDecisionCivilizationIcon(Decisions_SansCulottes, "CIVILIZATION_URDNOT_REV_FRANCE")
	Decisions_SansCulottes.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationID then return false, false end
		if load(player, "Decisions_SansCulottes") == true then
			Decisions_SansCulottes.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_UC_OSTSIEDLUNG_ENACTED_DESC")
			return false, false, true
		end

		Decisions_SansCulottes.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_UC_OSTSIEDLUNG_DESC")
		local goldCost = 800 *iMod
		Decisions_SansCulottes.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_UC_OSTSIEDLUNG_DESC", goldCost)
		if player:GetNumResourceAvailable(iMagistrate, false) < 2	then return true, false end
		if (player:GetCurrentEra() < GameInfoTypes.ERA_MEDIEVAL) then return true, false end		
		if player:GetGold() < goldCost then return true, false end
				
		return true, true
	end
	)
		
	
Decisions_SansCulottes.DoFunc = (
    function(player)
        player:ChangeNumResourceTotal(iMagistrate, -2)
        local goldCost = 800 * iMod
        player:ChangeGold(-goldCost)
        player:SetNumFreePolicies(1)
        player:SetNumFreePolicies(0)
        player:SetHasPolicy(SansCulottesID, true)
        save(player, "Decisions_SansCulottes", true)
		InitUnitFromCity(player:GetCapitalCity(), GameInfoTypes.UNIT_JAPANESE_SAMURAI, 2)
    end
    )
	
Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_URDNOT_REV_FRANCE, "Decisions_SansCulottes", Decisions_SansCulottes)\

function SansCulottesProduction(playerID)
local player = Players[playerID]
	if (player:IsAlive() and player:GetCivilizationType() == teutonID) then
	if player:HasPolicy() == SansCulottesID then
	for city in player:Cities() do
		if city:IsHasBuilding() == GameInfoTypes.BUILDING_MARKET and not city:IsHasBuilding() == GameInfoTypes.BUILDING_UC_MIT_GOLD then
		city:SetNumRealBuilding(GameInfoTypes.BUILDING_UC_MIT_GOLD, 1)
		elseif city:IsHasBuilding() == GameInfoTypes.BUILDING_UC_MIT_GOLD and not city:IsHasBuilding() == GameInfoTypes.BUILDING_MARKET then
		city:SetNumRealBuilding(GameInfoTypes.BUILDING_UC_MIT_PROD, 0)
					end
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(SansCulottesProduction)