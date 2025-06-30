-- ========= --
-- UTILITIES --
-- ========= --

local iPracticalNumCivs = (GameDefines.MAX_MAJOR_CIVS - 1)

function JFD_IsCivilisationActive(civilizationID)
	for iSlot = 0, iPracticalNumCivs, 1 do
		local slotStatus = PreGame.GetSlotStatus(iSlot)
		if (slotStatus == SlotStatus["SS_TAKEN"] or slotStatus == SlotStatus["SS_COMPUTER"]) then
			if PreGame.GetCivilization(iSlot) == civilizationID then
				return true
			end
		end
	end
	return false
end

function JFDGame_IsAAActive()
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if mod.ID == "432bc547-eb05-4189-9e46-232dbde8f09f" then
			return true
		end
	end
	return false
end
local isAAActive = JFDGame_IsAAActive()

function JFD_GetRandom(lower, upper)
	return Game.Rand((upper + 1) - lower, "") + lower
end

-- ======= --
-- DEFINES --
-- ======= --

include("AdditionalAchievementsUtility.lua")
include("FLuaVector.lua")

local iCiv = GameInfoTypes["CIVILIZATION_THP_GUAYCURU"]
local bIsActive = JFD_IsCivilisationActive(iCiv)

-- ======================= --
-- BARBARIAN CAMP TRACKING --
-- ======================= --

-- this section heavily derived from the lua for JFD's Hungary

local tBarbCamps = {}
local iBarbCamp = GameInfoTypes["IMPROVEMENT_BARBARIAN_CAMP"]

function Guaycuru_CountCampsAtGameStart()
	for i = 0, Map.GetNumPlots() - 1, 1 do
		local pPlot = Map.GetPlotByIndex(i)
		if pPlot:GetImprovementType() == iBarbCamp then
			tBarbCamps[pPlot] = true
		end
	end
end

function Guaycuru_UpdateCampsPerTurn(playerID)
	local pPlayer = Players[playerID]
	if pPlayer:IsBarbarian() then
		for pUnit in pPlayer:Units() do
			local pPlot = pUnit:GetPlot()
			if pPlot and (pPlot:GetImprovementType() == iBarbCamp) then
				if not tBarbCamps[pPlot] then
					tBarbCamps[pPlot] = true
				end
			end
		end
	end
end

if bIsActive then
	Events.SequenceGameInitComplete.Add(Guaycuru_CountCampsAtGameStart)
	GameEvents.PlayerDoTurn.Add(Guaycuru_UpdateCampsPerTurn)
end

-- ================================ --
-- UA: FOOD & MOVEMENT FOR SR UNITS --
-- ================================ --

local iFastPromo = GameInfoTypes["PROMOTION_THP_GUAYCURU_SPEED"]

local tSRUnits = {}
for row in DB.Query("SELECT * FROM Units WHERE Type IN (SELECT UnitType FROM Unit_ResourceQuantityRequirements)") do
	local iCombat = row.Combat
	if iCombat == 0 then
		iCombat = row.RangedCombat
	end
	tSRUnits[row.ID] = iCombat
end

function Guaycuru_ResourceUnitTrained(playerID, cityID, unitID)
	local pPlayer = Players[playerID]
	if pPlayer:GetCivilizationType() == iCiv then
		local pUnit = pPlayer:GetUnitByID(unitID)
		local iCombat = tSRUnits[pUnit:GetUnitType()]
		if iCombat then
			pUnit:SetHasPromotion(iFastPromo, true)
			pUnit:SetMoves(pUnit:MaxMoves())
            
			local iFoodChange = math.ceil(iCombat / 3)
			local pCity = pPlayer:GetCityByID(cityID)
			pCity:ChangeFood(iFoodChange)
			
			if pPlayer:IsHuman() then
				local iX, iY = pCity:GetX(), pCity:GetY()
				local sMessage = "+" .. iFoodChange .. " [ICON_FOOD]"
				Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(iX, iY))), sMessage, 0)
			end
		end
	end
end

function Guaycuru_UpdatePromoOnSetDamage(playerID, unitID, newDamage, oldDamage)
	local pPlayer = Players[playerID]
	if pPlayer and (pPlayer:GetNumUnits() > 0) and (pPlayer:GetCivilizationType() == iCiv) then
		local pUnit = pPlayer:GetUnitByID(unitID)
		if pUnit and tSRUnits[pUnit:GetUnitType()] then
			local bDeservesPromo = (newDamage == 0)
			pUnit:SetHasPromotion(iFastPromo, bDeservesPromo)
		end
	end
end

if bIsActive then
	GameEvents.CityTrained.Add(Guaycuru_ResourceUnitTrained)
	Events.SerialEventUnitSetDamage.Add(Guaycuru_UpdatePromoOnSetDamage)
end

-- ===================================== --
-- UA: GAIN STRAT.RES. FROM CITY CAPTURE --
-- ===================================== --

-- antiquity sites are RESOURCECLASS_RUSH, so we have to rule em out
local tAntiquities = {
	[GameInfoTypes["RESOURCE_ARTIFACTS"]] = true,
	[GameInfoTypes["RESOURCE_HIDDEN_ARTIFACTS"]] = true
	}

local tStratRes = {}
local tStratResSimple = {}
local iSRTableVal = 1
for row in DB.Query("SELECT * FROM Resources WHERE ResourceClassType = 'RESOURCECLASS_RUSH' OR ResourceClassType = 'RESOURCECLASS_MODERN'") do
	if not tAntiquities[row.ID] then
		tStratResSimple[row.ID] = true
		tStratRes[iSRTableVal] = {Resource=row.ID, Tech=GameInfoTypes[row.TechReveal], Building=GameInfoTypes["BUILDING_THP_GUAYCURU_"..row.Type], Name=Locale.ConvertTextKey(row.Description), HillOK=row.Hills, FlatOK=row.Flatlands}
		iSRTableVal = iSRTableVal + 1
	end
end

local iDefaultDummy = GameInfoTypes["BUILDING_THP_GUAYCURU_RESOURCE_HORSE"]

function Guaycuru_GetEligibleResources(pPlayer, pPlot)
	local pTeam = Teams[pPlayer:GetTeam()]
	local tEligibleRes = {}
	local iVal = 1
 
	local iPlotCategory = 0
	if not pPlot:IsCity() then
		if pPlot:IsHills() then
			iPlotCategory = 2
		else
			iPlotCategory = 1
		end
	end
	
	for k, v in pairs(tStratRes) do
		if pTeam:IsHasTech(v.Tech) then
			if (iPlotCategory == 2) then
				if (v.HillOK == 1) then
					tEligibleRes[iVal] = {Resource=v.Resource, Building=v.Building, Name=v.Name}
					iVal = iVal + 1
				end
			elseif (iPlotCategory == 1) then
				if (v.FlatOK == 1) then
					tEligibleRes[iVal] = {Resource=v.Resource, Building=v.Building, Name=v.Name}
					iVal = iVal + 1
				end
			else
				tEligibleRes[iVal] = {Resource=v.Resource, Building=v.Building, Name=v.Name}
				iVal = iVal + 1
			end
		end
	end
	return tEligibleRes
end

function Guaycuru_CaptureStrategicResource(oldPlayerID, bCapital, iX, iY, newPlayerID)
	local pPlayer = Players[newPlayerID]
	if pPlayer:GetCivilizationType() == iCiv then
		local pCity = Map.GetPlot(iX, iY):GetPlotCity()
		if pCity then
			local tResChoices = Guaycuru_GetEligibleResources(pPlayer, pCity:Plot())
			local sName = "TEXT ERROR"
			if #tResChoices > 0 then
				local iRand = JFD_GetRandom(1, #tResChoices)
				local iBuilding = tResChoices[iRand].Building
				pCity:SetNumRealBuilding(iBuilding, 1)
				sName = tResChoices[iRand].Name
			else
				pCity:SetNumRealBuilding(iDefaultDummy, 1)
				sName = "Horses"
			end
			
			if pPlayer:IsHuman() then
				Events.GameplayAlertMessage("You discovered " .. sName .. " in the captured city!")
			end
		end
	end
end

if bIsActive then
	GameEvents.CityCaptureComplete.Add(Guaycuru_CaptureStrategicResource)
end

-- =================================== --
-- UU: RESTORE ADJACENT MOVES ON KILLS --
-- =================================== --

local iHaliaganek = GameInfoTypes["UNIT_THP_HALIAGANEK"]
local iNumDirections = DirectionTypes.NUM_DIRECTION_TYPES - 1

function Guaycuru_RestoreMoves(pUnit)
	local pPlot, iX, iY = pUnit:GetPlot(), pUnit:GetX(), pUnit:GetY()
	local iOwner = pUnit:GetOwner()
	for iDir = 0, iNumDirections, 1 do
		local pAdjPlot = Map.PlotDirection(iX, iY, iDir)
		if pAdjPlot then
			for iSlot = 0, pAdjPlot:GetNumUnits() - 1, 1 do
				local pAdjUnit = pAdjPlot:GetUnit(iSlot)
				if pAdjUnit and pAdjUnit:GetOwner() == iOwner then
					local iMax = pAdjUnit:MaxMoves()
					pAdjUnit:SetMoves(iMax)
				end
			end
		end
	end
	if pPlot:GetNumUnits() > 1 then
		for iSlot = 1, pPlot:GetNumUnits() - 1, 1 do
			local pStackedUnit = pPlot:GetUnit(iSlot)
			if pStackedUnit and pStackedUnit:GetOwner() == iOwner then
				local iMax = pStackedUnit:MaxMoves()
				pStackedUnit:SetMoves(iMax)
			end
		end
	end
end

local pKiller;

function Guaycuru_HaliaganekKill(playerID, unitID, unitType, iX, iY, bDelay, killerID)
	if bDelay then
		if killerID == -1 then return end
		pKiller = Players[killerID]
	elseif pKiller then
		local pPlot = Map.GetPlot(iX, iY)
		local pUnit = pPlot:GetUnit(0)
		if pUnit:GetUnitType() == iHaliaganek then
			Guaycuru_RestoreMoves(pUnit)
		end
		pKiller = nil
	end
end

if bIsActive then
	GameEvents.UnitPrekill.Add(Guaycuru_HaliaganekKill)
end

-- ================================================ --
-- UA & UU: TRIGGER EFFECTS ON CLEARING ENCAMPMENTS --
-- ================================================ --

local iHorse = GameInfoTypes["RESOURCE_HORSE"]

function Guaycuru_EncampmentXY(playerID, unitID, iX, iY)
	local pPlot = Map.GetPlot(iX, iY)
	if pPlot and tBarbCamps[pPlot] then
		local pPlayer = Players[playerID]
		if pPlayer:IsBarbarian() then return end
		tBarbCamps[pPlot] = false
		
		if pPlayer:GetCivilizationType() == iCiv then
			local tResChoices = Guaycuru_GetEligibleResources(pPlayer, pPlot)
			local sName = "TEXT ERROR"
			
			if #tResChoices > 0 then
				local iRand = JFD_GetRandom(1, #tResChoices)
				local iRes = tResChoices[iRand].Resource
				pPlot:SetFeatureType(-1)
				pPlot:SetResourceType(iRes, 2)
				sName = tResChoices[iRand].Name
			else
				pPlot:SetFeatureType(-1)
				pPlot:SetResourceType(iHorse, 2)
				sName = "Horses"
			end
			
			if pPlayer:IsHuman() then
				local sMessage = sName .. " discovered"
				Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(iX, iY))), sMessage, 0)
				
				if isAAActive then
					Guaycuru_CheckAA(pPlayer, sName)
				end
			end
		end
		
		local pUnit = pPlayer:GetUnitByID(unitID)
		if pUnit:GetUnitType() == iHaliaganek then
			Guaycuru_RestoreMoves(pUnit)
		end
	end
end

if bIsActive then
	GameEvents.UnitSetXY.Add(Guaycuru_EncampmentXY)
end

-- ================================ --
-- UB: REQUIRES A WORKED STRAT.RES. --
-- ================================ --

local iNemachaqa = GameInfoTypes["BUILDING_THP_NEMACHAQA"]

function Guaycuru_CanBuildUB(playerID, cityID, buildingType)
	if buildingType == iNemachaqa then
		local pPlayer = Players[playerID]
		local pCity = pPlayer:GetCityByID(cityID)
		-- first, a condition to check for the resource-granting dummy building
		if pCity:GetOriginalOwner() ~= playerID then
			for k, v in pairs(tStratRes) do
				if pCity:IsHasBuilding(v.Building) then return true end
			end
		end
		-- if that hasn't thrown true then we start checking plots
		local pTeam = Teams[pPlayer:GetTeam()]
		for i = 0, pCity:GetNumCityPlots() - 1, 1 do
			local pPlot = pCity:GetCityIndexPlot(i)
			if pPlot then
				local iPlotRes = pPlot:GetResourceType()
				if tStratResSimple[iPlotRes] then
					-- we use GetNumResourceTotal as a lazy way to ensure the resource is unlocked
					if pCity:IsWorkingPlot(pPlot) and (pPlayer:GetNumResourceTotal(iPlotRes) > 0) then
						return true
					end
				end
			end
		end
		return false
	end
	return true
end

if bIsActive then
	GameEvents.CityCanConstruct.Add(Guaycuru_CanBuildUB)
end

-- ========== --
-- AA SUPPORT --
-- ========== --

if isAAActive then
	local tValidRes = {}
	tValidRes["Oil"] = true
	tValidRes["Uranium"] = true
	
	function Guaycuru_CheckAA(pPlayer, sResName)
		-- no IsHuman check b/c the function call happens within an IsHuman check
		-- same deal with the GetCivilizationType check
		if IsAAUnlocked('AA_THP_GUAYCURU_SPECIAL') then return end
		if tValidRes[sResName] then
			UnlockAA('AA_THP_GUAYCURU_SPECIAL')
		end
	end
end
