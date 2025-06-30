-- ============= --
-- USER SETTINGS --
-- ============= --

--[[

By default, the Fish-Oil Bowman can poison any type of unit.
Players seeking extra realism, however, can adjust the following setting so that the Fish-Oil Bowman can only poison land units.

true = all unit types can be poisoned
false = only land units can be poisoned

--]]

local bNavalPoison = true

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

-- function IsCPDLL()
	-- for _, mod in pairs(Modding.GetActivatedMods()) do
		-- if mod.ID == "d1b6328c-ff44-4b0d-aad7-c657f83610cd" then
			-- return true
		-- end
	-- end
	-- return false
-- end
-- local isCPDLL = IsCPDLL()
local isCPDLL = false

function Neirai_GetNearestCity(pPlayer, pPlot)
	local distance = 9999
	local cNearestCity = nil
	for cCity in pPlayer:Cities() do
		local pCityPlot = cCity:Plot()
		local between = Map.PlotDistance(pPlot:GetX(), pPlot:GetY(), pCityPlot:GetX(), pCityPlot:GetY())
		if between < distance then
			distance = between
			cNearestCity = cCity
		end
	end
	return cNearestCity
end

function JFD_GetRandom(lower, upper)
    return Game.Rand((upper + 1) - lower, "") + lower
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

-- ======= --
-- DEFINES --
-- ======= --

include("AdditionalAchievementsUtility.lua")
include("FLuaVector.lua")
include("PlotIterators.lua")

local iCiv = GameInfoTypes["CIVILIZATION_THP_KET"]
local bIsActive = JFD_IsCivilisationActive(iCiv)

-- =============================================== --
-- UA: FOOD & FAITH FROM KILLS IN FRIENDLY TERRAIN --
-- =============================================== --

local yFood = GameInfoTypes["YIELD_FOOD"]
local iFaithVal = 15

function Ket_FoodFromHomeKills(playerID, unitID, unitType, iDeathX, iDeathY, isDelay, killerPlayerID)
	if not isDelay then return end
	if (killerPlayerID == -1) or (killerPlayerID == playerID) then return end
	local pPlot = Map.GetPlot(iDeathX, iDeathY)
	if pPlot:IsOwned() then
		local pPlotOwner = Players[pPlot:GetOwner()]
		if pPlotOwner:GetCivilizationType() == iCiv then
			local bDisplayed = false
			local pFoodCity = Neirai_GetNearestCity(pPlotOwner, pPlot)
			local iX, iY = pFoodCity:GetX(), pFoodCity:GetY()
			local iFoodVal = pFoodCity:GetYieldRate(yFood, true)
			local iTotalGain = 2 * iFoodVal
			pFoodCity:ChangeFood(iTotalGain)
			if Players[playerID]:IsBarbarian() then
				pPlotOwner:ChangeFaith(iFaithVal)
				if pPlotOwner:IsHuman() then
					Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(iX, iY))), "+" .. iTotalGain .. " [ICON_FOOD], +" .. iFaithVal .. " [ICON_PEACE]", 1)
					bDisplayed = true
				end
			end
			if pPlotOwner:IsHuman() and (not bDisplayed) then
				Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(iX, iY))), "+" .. iTotalGain .. " [ICON_FOOD]", 1)
			end
		end
	end
end

if bIsActive then
	GameEvents.UnitPrekill.Add(Ket_FoodFromHomeKills)
end

-- ==================================== --
-- UA: DAMAGE UNITS WHEN BORDERS EXPAND --
-- ==================================== --

function Ket_DamageOnExpand(playerID, cityID, iX, iY)
	local pPlayer = Players[playerID]
	if pPlayer:GetCivilizationType() == iCiv then
		local pPlot = Map.GetPlot(iX, iY)
		for pNearPlot in PlotAreaSpiralIterator(pPlot, 1, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_INCLUDE) do
			for i = 0, pNearPlot:GetNumUnits() - 1, 1 do
				local pUnit = pNearPlot:GetLayerUnit(i)
				local pUnitOwner = Players[pUnit:GetOwner()]
				if pUnitOwner ~= pPlayer and (not pUnitOwner:IsFriends(pPlayer)) then
					pUnit:ChangeDamage(25)
				end
			end
		end
	end
end

if bIsActive then
	GameEvents.CityBoughtPlot.Add(Ket_DamageOnExpand)
end

-- ==================================== --
-- UU1: FISH-OIL BOWMAN POISONS ENEMIES --
-- ==================================== --

local iLand = GameInfoTypes["DOMAIN_LAND"]
local promoFishOil = GameInfoTypes["PROMOTION_THP_KET_FISHOIL"]
local promoRandom = GameInfoTypes["PROMOTION_THP_KET_AFTERRANDOM"]
local promoSickened = GameInfoTypes["PROMOTION_THP_KET_UNIT_POISONED"]

-- credit to DMS' Lua for Hoop's Tehuelche, from which I shamelessly ripped this function
--[[ old version in this comment
function Ket_SetPoisonOnDamage(playerID, unitID, newDamage, oldDamage)
	if (newDamage <= oldDamage) then return end
	local pPlayer = Players[playerID]
	if pPlayer and pPlayer:IsAlive() and (pPlayer:GetNumUnits() > 0) then
		for pUnit in pPlayer:Units() do
			if pUnit:GetID() == unitID then
				if (bNavalPoison) or (pUnit:GetDomainType() == iLand) then
					if not pUnit:IsHasPromotion(promoRandom) then
						local pUnitPlot = pUnit:GetPlot()
						if pUnitPlot then
							for plot in PlotAreaSweepIterator(pUnitPlot, 4, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
								local iNumUnits = plot:GetNumUnits()
								if iNumUnits > 0 then
									for i = 0, (iNumUnits - 1) do
										local pPlotUnit = plot:GetUnit(i)
										if pPlotUnit and pPlotUnit:IsHasPromotion(promoRandom) then
											pPlotUnit:SetHasPromotion(promoRandom, false)
											pPlotUnit:SetHasPromotion(promoFishOil, true)
											pUnit:SetHasPromotion(promoSickened, true)
											if isAAActive then
												Ket_SpecialAA(uUnit)
											end
											return
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
end
--]]

function Ket_SetPoisonOnDamage(playerID, unitID, newDamage, oldDamage)
	if (newDamage <= oldDamage) then return end
	local pPlayer = Players[playerID]
	if pPlayer and pPlayer:IsAlive() and (pPlayer:GetNumUnits() > 0) then
		local pUnit = pPlayer:GetUnitByID(unitID)
		if pUnit and (not pUnit:IsHasPromotion(promoRandom)) then
			if (bNavalPoison) or (pUnit:GetDomainType() == iLand) then
				local pUnitPlot = pUnit:GetPlot()	
				if pUnitPlot then
					for pPlot in PlotAreaSweepIterator(pUnitPlot, 4, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
						local iNumUnits = pPlot:GetNumUnits()
						if iNumUnits > 0 then
							for i = 0, (iNumUnits - 1), 1 do
								local pPlotUnit = pPlot:GetUnit(i)
								if pPlotUnit and pPlotUnit:IsHasPromotion(promoRandom) then
									pPlotUnit:SetHasPromotion(promoRandom, false)
									pPlotUnit:SetHasPromotion(promoFishOil, true)
									pUnit:SetHasPromotion(promoSickened, true)
									if isAAActive then
										Ket_SpecialAA(uUnit)
									end
									return
								end
							end
						end
					end
				end
			end
		end
	end
end

function UnitTakesPoisonDamage(playerID, unitID, iX, iY)
	local pPlayer = Players[playerID]
	local pUnit = pPlayer:GetUnitByID(unitID)
	if pUnit and pUnit:IsHasPromotion(promoSickened) and (pUnit:GetDamage() < 99) then
		local iHP = (100 - pUnit:GetDamage())
		local iHalfHP = math.ceil(iHP / 2)
		pUnit:SetHasPromotion(promoSickened, false)
		pUnit:ChangeDamage(iHalfHP)
		if pPlayer:IsHuman() then
			Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(iX, iY))), "[COLOR_FONT_GREEN]Poison: " .. iHalfHP .. " damage[ENDCOLOR]", 1)
		end
	end
end

if bIsActive then
	Events.SerialEventUnitSetDamage.Add(Ket_SetPoisonOnDamage)
	GameEvents.UnitSetXY.Add(UnitTakesPoisonDamage)
end

-- ==================================== --
-- UU2: SENING STRENGTHENS NEARBY UNITS --
-- ==================================== --

local ucMissionary = GameInfoTypes["UNITCLASS_MISSIONARY"]
local iSening = GameInfoTypes["UNIT_THP_SENING"]

local promoSeningDummy = GameInfoTypes["PROMOTION_THP_SENING"]
local promoNearSening = GameInfoTypes["PROMOTION_THP_STRENGTH_NEAR_SENING"]

-- I cribbed a lot of this function from the JFD's Lua for Clemenceau's France
function StrengthToUnitsNearSening(playerID)
	local pPlayer = Players[playerID]
	if pPlayer:IsAlive() and not pPlayer:IsBarbarian() then
		if pPlayer:HasUnitOfClassType(ucMissionary) then
			for pUnit in pPlayer:Units() do
				local bIsSeningNearby = false
				if isCPDLL then
					bIsSeningNearby = pUnit:IsAdjacentToUnitPromotion(promoSeningDummy)
				else
					local pPlot = pUnit:GetPlot()
					if pPlot then
						for pNearPlot in PlotRingIterator(pPlot, 1, SECTOR_NORTH, DIRECTION_CLOCKWISE) do
							local iNearUnits = pNearPlot:GetNumUnits()
							if iNearUnits == 1 then
								local uNearUnit = pNearPlot:GetUnit()
								if uNearUnit:GetUnitType() == iSening and uNearUnit:GetOwner() == playerID then
									bIsSeningNearby = true
									break
								end
							elseif iNearUnits > 1 then
								for i = 0, pNearPlot:GetNumUnits() - 1, 1 do
									local uNearUnit = pNearPlot:GetLayerUnit(i)
									if uNearUnit:GetUnitType() == iSening and uNearUnit:GetOwner() == playerID then
										bIsSeningNearby = true
										break
									end
								end
								if bIsSeningNearby then break end
							end
						end
					end
				end
				if bIsSeningNearby then
					if not pUnit:IsHasPromotion(promoNearSening) then
						pUnit:SetHasPromotion(promoNearSening, true)
					end
				else
					if pUnit:IsHasPromotion(promoNearSening) then
						pUnit:SetHasPromotion(promoNearSening, false)
					end
				end
			end
		end
	end
end

-- Removes the promotion from all units once your last Sening dies
function LastSeningKilled(playerID, unitID, unitType, iX, iY, bDelay)
	if not bDelay then
		if unitType == iSening then
			local pPlayer = Players[playerID]
			if (pPlayer:GetCivilizationType() == iCiv) and (not pPlayer:HasUnitOfClassType(ucMissionary)) then
				for pUnit in pPlayer:Units() do
					pUnit:SetHasPromotion(promoNearSening, false)
				end
			end
		end
	end
end

if bIsActive then
	GameEvents.PlayerDoTurn.Add(StrengthToUnitsNearSening)
	GameEvents.UnitPrekill.Add(LastSeningKilled)
end

-- ====================================== --
-- UU2: SENING CLAIMS TILES WHEN EXPENDED --
-- ====================================== --

function TabulateFreeTiles(pCityPlot)
	local tFreeTiles = {}
	local iTileNum = 1
	for pPlot in PlotAreaSpiralIterator(pCityPlot, 3, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
		if pPlot:GetOwner() == -1 then
			tFreeTiles[iTileNum] = pPlot
			iTileNum = iTileNum + 1
		end
	end
	return tFreeTiles
end

function SeningExpended(playerID, unitID, unitType, iX, iY, isDelay, killerPlayerID)
	if isDelay then return end
	if killerPlayerID ~= -1 then return end
	if unitType == iSening then
		local pDeathPlot = Map.GetPlot(iX, iY)
		local pCity = pDeathPlot:GetPlotCity()
		if pCity and pCity:GetOwner() == playerID then
			local tFreeTiles = TabulateFreeTiles(pDeathPlot)
			if #tFreeTiles > 0 then
				local iRand = JFD_GetRandom(1, #tFreeTiles)
				local pGainPlot = tFreeTiles[iRand]
				pGainPlot:SetOwner(playerID, pCity:GetID())
				if Players[playerID]:IsHuman() then
					Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(pGainPlot:GetX(), pGainPlot:GetY()))), "[COLOR_POPUP_TEXT]Plot claimed by Sening[ENDCOLOR]", 1)
				end
			end
		end
	end
end

if bIsActive then
	GameEvents.UnitPrekill.Add(SeningExpended)
end

-- ========== --
-- AA SUPPORT --
-- ========== --

if isAAActive then
	local iRussia = GameInfoTypes["CIVILIZATION_RUSSIA"]
	local iMissionary = GameInfoTypes["UNIT_MISSIONARY"]
	local iProphet = GameInfoTypes["UNIT_PROPHET"]
	
	function Ket_SpecialAA(pUnit)
		if IsAAUnlocked('AA_THP_KET_SPECIAL') then return end
		local iType = pUnit:GetUnitType()
		if (iType == iMissionary) or (iType == iProphet) then
			local iOwningCiv = Players[pUnit:GetOwner()]:GetCivilizationType()
			if (iOwningCiv == iRussia) or (GameInfo.Civilizations[iOwningCiv].DerivativeCiv == iRussia) then
				UnlockAA('AA_THP_KET_SPECIAL');
			end
		end
	end
end
