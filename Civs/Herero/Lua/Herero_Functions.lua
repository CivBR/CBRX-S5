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
include("PlotIterators.lua")

local iCiv = GameInfoTypes["CIVILIZATION_THP_HERERO"]
local bIsActive = JFD_IsCivilisationActive(iCiv)

-- ================================ --
-- UA: NEW UNITS GET XP PER PASTURE --
-- ================================ --

local iPasture = GameInfoTypes["IMPROVEMENT_PASTURE"]
local iPerPastureXP = 4

function Herero_NewUnitXP(playerID, cityID, unitID)
	local pPlayer = Players[playerID]
	if pPlayer:GetCivilizationType() == iCiv then
		local pUnit = pPlayer:GetUnitByID(unitID)
		local pCityPlot = pPlayer:GetCityByID(cityID):Plot()
		local iNumPastures = 0
		for pPlot in PlotAreaSpiralIterator(pCityPlot, 3, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
			if pPlot and (pPlot:GetImprovementType() == iPasture) then
				iNumPastures = iNumPastures + 1
			end
		end
		pUnit:ChangeExperience(iPerPastureXP * iNumPastures)
		if isAAActive and (iNumPastures > 3) then -- AA support
			HereroAA(pPlayer)
		end
	end
end

if bIsActive then
	GameEvents.CityTrained.Add(Herero_NewUnitXP)
end

-- ========================================= --
--     UA:  FAITH FROM MOUNTED GARRISONS     --
-- UB: PROD PER MELEE/MOUNTED PER CITY FAITH --
-- ========================================= --

local iFaithDummy = GameInfoTypes["BUILDING_THP_HERERO_FAITH_DUMMY"]
local iFaithYield = GameInfoTypes["YIELD_FAITH"]
local iMountedClass = GameInfoTypes["UNITCOMBAT_MOUNTED"]
local iOkuruuo = GameInfoTypes["BUILDING_THP_OKURUUO"]
local iProdDummy = GameInfoTypes["BUILDING_THP_HERERO_PROD_DUMMY"]

function Herero_CheckGarrisonsAndFaith(playerID)
	local pPlayer = Players[playerID]
	if pPlayer:GetCivilizationType() == iCiv then
		for pCity in pPlayer:Cities() do
			local pGarrison = pCity:GetGarrisonedUnit()
			if pGarrison and (pGarrison:GetUnitCombatType() == iMountedClass) then
				pCity:SetNumRealBuilding(iFaithDummy, 1)
			else
				pCity:SetNumRealBuilding(iFaithDummy, 0)
			end
		end
	end
	if pPlayer:CountNumBuildings(iOkuruuo) > 0 then
		for pCity in pPlayer:Cities() do
			if pCity:IsHasBuilding(iOkuruuo) then
				local iCityFaith = pCity:GetFaithPerTurn()
				local iNumDummies = math.min(iCityFaith, 10)
				pCity:SetNumRealBuilding(iProdDummy, iNumDummies)
			elseif pCity:IsHasBuilding(iProdDummy) then
				pCity:SetNumRealBuilding(iProdDummy, 0)
			end
		end
	elseif pPlayer:CountNumBuildings(iProdDummy) > 0 then
		for pCity in pPlayer:Cities() do
			pCity:SetNumRealBuilding(iProdDummy, 0)
		end
	end
end

if bIsActive then
	GameEvents.PlayerDoTurn.Add(Herero_CheckGarrisonsAndFaith)
end

-- ======================================= --
-- UU: SPAWN CATTLE WHEN PROMO'D ON DESERT --
-- ======================================= --

local iCattle = GameInfoTypes["RESOURCE_COW"]
local iDesert = GameInfoTypes["TERRAIN_DESERT"]
local iOxRider = GameInfoTypes["UNIT_THP_HERERO_OX_RIDER"]
local iOxRiderFreshPromo = GameInfoTypes["PROMOTION_THP_HERERO_OX_FRESH"]
local iOxRiderUsedPromo = GameInfoTypes["PROMOTION_THP_HERERO_OX_USED"]

local tMaybeInvisibleResources = {}
for row in DB.Query("SELECT * FROM Resources WHERE TechReveal IS NOT NULL") do
	tMaybeInvisibleResources[row.ID] = GameInfoTypes[row.TechReveal]
end

function Herero_AssignCattle(pPlot, pUnit, pPlayer)
	pPlot:SetResourceType(iCattle)
	pUnit:SetHasPromotion(iOxRiderFreshPromo, false)
	pUnit:SetHasPromotion(iOxRiderUsedPromo, true)
	if pPlayer:IsHuman() then
		local sMessage = "Found [ICON_RES_COW] Cattle!"
		Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(pPlot:GetX(), pPlot:GetY()))), sMessage, 0)
	end
end

function Herero_UnitPromoted(playerID, unitID, promotionID)
	local pPlayer = Players[playerID]
	local pUnit = pPlayer:GetUnitByID(unitID)
	if (pUnit:GetUnitType() == iOxRider) and pUnit:IsHasPromotion(iOxRiderFreshPromo) then
		local pPlot = pUnit:GetPlot()
		if (pPlot:GetTerrainType() == iDesert) and (not pPlot:IsCity()) then
			local iRes = pPlot:GetResourceType()
			if iRes == -1 then
				Herero_AssignCattle(pPlot, pUnit, pPlayer)
			else
				-- ability can overwrite undiscovered resources
				local iResTech = tMaybeInvisibleResources[iRes]
				if iResTech then
					local pTeam = Teams[pPlayer:GetTeam()]
					if not pTeam:IsHasTech(iResTech) then
						Herero_AssignCattle(pPlot, pUnit, pPlayer)
					end
				end
			end
		end
	end
end

if bIsActive then
	GameEvents.UnitPromoted.Add(Herero_UnitPromoted)
end

-- ========== --
-- AA SUPPORT --
-- ========== --

-- all the salient checks are within the underlying function so this just has the barebones AA stuff
function HereroAA(pPlayer)
	if IsAAUnlocked('AA_THP_HERERO_SPECIAL') then return end
	UnlockAA('AA_THP_HERERO_SPECIAL')
end
