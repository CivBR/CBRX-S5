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

-- ======= --
-- DEFINES --
-- ======= --

include("FLuaVector.lua")
include("PlotIterators.lua")

local iCiv = GameInfoTypes["CIVILIZATION_SENSHI_BUNUBA"]
local bIsActive = JFD_IsCivilisationActive(iCiv)

-- ================================================ --
-- UA: EXPEND RELIG. UNITS TO DAMAGE ENEMIES/CITIES --
-- ================================================ --

local tReligUnits = {}
for row in DB.Query("SELECT * FROM Units WHERE ReligiousStrength > 0") do
	tReligUnits[row.ID] = true
end

local bValidDeath = true
function Bunuba_MissionaryDamageAOE(playerID, unitID, unitType, iX, iY, bDelay, killerID)
	if not tReligUnits[unitType] then return end
	local pPlayer = Players[playerID]
	if pPlayer:GetCivilizationType() ~= iCiv then return end
	
	if bDelay then
		if (killerID > -1) and (killerID ~= playerID) then
			bValidDeath = false
		end
	else
		if bValidDeath then
			local pBasePlot = Map.GetPlot(iX, iY)
			for pPlot in PlotAreaSweepIterator(pBasePlot, 2, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
				if pPlot then
					for i = 0, pPlot:GetNumUnits() - 1, 1 do
						local pUnit = pPlot:GetUnit(i)
						if pUnit:GetOwner() ~= playerID then
							pUnit:ChangeDamage(15)
						else
							pUnit:ChangeDamage(-15)
						end
					end
					
					if pPlot:IsCity() then
						local pCity = pPlot:GetPlotCity()
						if pCity:GetOwner() ~= playerID then
							pCity:ChangeDamage(40)
						else
							pCity:ChangeDamage(-40)
						end
					end
				end
			end
		else
			bValidDeath = true
		end
	end
end

if bIsActive then
	GameEvents.UnitPrekill.Add(Bunuba_MissionaryDamageAOE)
end

-- =============================================== --
-- UU: MOVEMENT REPLENISHED WHEN ADJACENT FOES DIE --
-- =============================================== --

local iJilamani = GameInfoTypes["UNIT_SENSHI_JILAMANA"]

function Bunuba_JilamaniNearDeadUnit(playerID, unitID, unitType, iX, iY, bDelay, killerID)
	if bDelay then
		local pOwningTeam = Teams[Players[playerID]:GetTeam()]
		local pBasePlot = Map.GetPlot(iX, iY)
		for pPlot in PlotRingIterator(pBasePlot, 1, SECTOR_NORTH, DIRECTION_CLOCKWISE) do
			if pPlot then
				local pUnit = pPlot:GetUnit(0)
				if pUnit and pUnit:GetUnitType() == iJilamani then
					local iUnitTeam = Players[pUnit:GetOwner()]:GetTeam()
					if pOwningTeam:IsAtWar(iUnitTeam) then
						pUnit:SetMoves(pUnit:MaxMoves())
					end
				end
			end
		end
	end
end

if bIsActive then
	GameEvents.UnitPrekill.Add(Bunuba_JilamaniNearDeadUnit)
end

-- ===================================== --
-- UA: XP AND FAITH FOR ADJACENT ENEMIES --
--     UGP:  FRIGHTEN NEARBY ENEMIES     --
-- ===================================== --

local iFearPromo = GameInfoTypes["PROMOTION_SENSHI_BUNUBA_FRIGHTENED"]
local iJalgangurru = GameInfoTypes["UNIT_SENSHI_JALGANGURRU"]
local iProphetClass = GameInfoTypes["UNITCLASS_PROPHET"]
local iProphetID = GameInfoTypes["UNIT_PROPHET"]
local tFrightenedUnits = {}

local iFaithVal = 1
local iXPVal = 2

--Henlo lad, nicked this bit from Jifford's work on Greenland - Senshi
function Senshi_Bunuba_SerialEventUnitCreated(playerID, unitID)
    local player = Players[playerID]
	local playerTeam = Teams[player:GetTeam()]
	if (not player:IsAlive()) then return end
	local unit = player:GetUnitByID(unitID)
	
	if (player:GetCivilizationType() == iCiv) and unit and (unit:GetUnitType() == iProphetID) then
		unit:Kill(-1)
		player:InitUnit(iJalgangurru, unit:GetX(), unit:GetY())
	end
end
Events.SerialEventUnitCreated.Add(Senshi_Bunuba_SerialEventUnitCreated)

function PlotHasEnemyUnit(pPlot, pTeam, playerID)
	if not pPlot then return false end
	local pUnit = pPlot:GetUnit(0)
	if pUnit then
		local iOwner = pUnit:GetOwner()
		if iOwner == playerID then return false end
		local iOwningTeam = Players[iOwner]:GetTeam()
		return (pTeam:IsAtWar(iOwningTeam))
	end
end

function Bunuba_TabulateFrightenedUnitsAtGameStart()
	local bNeedsIteration = false
	for k, v in pairs(Players) do
		if v:GetCivilizationType() == iCiv and v:HasUnitOfClassType(iProphetClass) then
			bNeedsIteration = true
			break
		end
	end
	
	if bNeedsIteration then
		for playerID, pPlayer in pairs(Players) do
			for pUnit in pPlayer:Units() do
				if pUnit:IsHasPromotion(iFearPromo) then
					local iVal = #tFrightenedUnits or 0
					tFrightenedUnits[iVal + 1] = {Player=playerID, Unit=pUnit:GetID()}
				end
			end
		end
	end
end

-- this is a somewhat situational function
-- specifically, it only works as intended if there's exactly one Bunuba player in the game
-- and a non-Bunuba player doesn't get a Jalgangurru
-- but for the purpose of keeping the iteration within somewhat sane bounds, i think this is an acceptable compromise
function Bunuba_EffectsForBeingNearUnits(playerID)
	local pPlayer = Players[playerID]
	if pPlayer:GetCivilizationType() == iCiv then
		-- reset existing frightened units
		for k, v in pairs(tFrightenedUnits) do
			local pFrightenedUnit = Players[v.Player]:GetUnitByID(v.Unit)
			if pFrightenedUnit then
				pFrightenedUnit:SetHasPromotion(iFearPromo, false)
			end
		end
		tFrightenedUnits = {}
		
		-- process new frightened units and adjacency bonuses
		local pTeam = Teams[pPlayer:GetTeam()]
		for pUnit in pPlayer:Units() do
			-- faith and XP for adjacent enemy units
			local iFaithAmt = 0
			local iXPAmt = 0
			local pUnitPlot = pUnit:GetPlot()
			for pPlot in PlotRingIterator(pUnitPlot, 1, SECTOR_NORTH, DIRECTION_CLOCKWISE) do
				if PlotHasEnemyUnit(pPlot, pTeam, playerID) then
					iFaithAmt = iFaithAmt + iFaithVal
					iXPAmt = iXPAmt + iXPVal
				end
			end
			pPlayer:ChangeFaith(iFaithAmt)
			pUnit:ChangeExperience(iXPAmt)
			if pPlayer:IsHuman() and (iFaithAmt > 0) then
				local iX, iY = pUnit:GetX(), pUnit:GetY()
				local sMessage = "+" .. iFaithAmt .. " [ICON_PEACE]"
				Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(iX, iY))), sMessage, 0)
			end
			
			-- jalgangurru frightens nearby units
			if pUnit:GetUnitType() == iJalgangurru then
				for pPlot in PlotAreaSweepIterator(pUnitPlot, 2, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
					if PlotHasEnemyUnit(pPlot, pTeam, playerID) then
						local pUnit = pPlot:GetUnit(0)
						pUnit:SetHasPromotion(iFearPromo, true)
						local iVal = #tFrightenedUnits or 0
						tFrightenedUnits[iVal + 1] = {Player=pUnit:GetOwner(), Unit=pUnit:GetID()}
					end
				end
			end
		end
	end
end

if bIsActive then
	Events.SequenceGameInitComplete.Add(Bunuba_TabulateFrightenedUnitsAtGameStart)
	GameEvents.PlayerDoTurn.Add(Bunuba_EffectsForBeingNearUnits)
end

-- =============================================================== --
-- UGP: AIRDROP ALLOWED BETWEEN THE CAPITAL AND JALGANGURRU CITIES --
-- =============================================================== --

local iAirdropDummy = GameInfoTypes["BUILDING_SENSHI_BUNUBA_AIRPORT"]

function Bunuba_AirdropBetweenProphetCities(playerID)
	local pPlayer = Players[playerID]
	if pPlayer:HasUnitOfClassType(iProphetClass) then
		local bHasAnyDummies = false
		for pCity in pPlayer:Cities() do
			local iNumDummiesDeserved = 0
			local pPlot = pCity:Plot()
			for i = 0, pPlot:GetNumUnits() - 1, 1 do
				local pUnit = pPlot:GetUnit(i)
				if pUnit:GetUnitType() == iJalgangurru then
					iNumDummiesDeserved = 1
					bHasAnyDummies = true
					break
				end
			end
			pCity:SetNumRealBuilding(iAirdropDummy, iNumDummiesDeserved)
		end
		
		if bHasAnyDummies then
			pPlayer:GetCapitalCity():SetNumRealBuilding(iAirdropDummy, 1)
		end
	elseif (pPlayer:CountNumBuildings(iAirdropDummy) > 0) then
		for pCity in pPlayer:Cities() do
			pCity:SetNumRealBuilding(iAirdropDummy, 0)
		end
	end
end

if bIsActive then
	GameEvents.PlayerDoTurn.Add(Bunuba_AirdropBetweenProphetCities)
end
