--=======================================================================================================================
-- Zharques's Teotihuacan
-- Lua by PorkBean
--=======================================================================================================================
include("FLuaVector.lua")
local iTeotihuacanCiv = GameInfoTypes.CIVILIZATION_ZRQ_TEO_SPEAROWL;

------------------------------------------------------------------------------------------------------------------------
-- JFD_IsCivilisationActive
------------------------------------------------------------------------------------------------------------------------
function JFD_IsCivilisationActive(civilisationID)
	for iSlot = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
		local slotStatus = PreGame.GetSlotStatus(iSlot)
		if (slotStatus == SlotStatus["SS_TAKEN"] or slotStatus == SlotStatus["SS_COMPUTER"]) then
			if PreGame.GetCivilization(iSlot) == civilisationID then
				return true
			end
		end
	end

	return false
end

local isTeotihuacanCivActive = JFD_IsCivilisationActive(iTeotihuacanCiv);

--========================================================================================================================
-- UNIQUE ABILITY: Where Men Become Gods
--========================================================================================================================

local tWonders = {}

for row in DB.Query("SELECT ID id FROM Buildings WHERE Quote IS NOT NULL") do
	table.insert(tWonders, row.id)
end

local iWonderProdDummy = GameInfoTypes.BUILDING_ZRQ_WONDER_DUMMY --building that gives +2% building production

------------------------------------------------------------------------------------------------------------------------
-- GetNearestWonderCity
------------------------------------------------------------------------------------------------------------------------
function GetNearestWonderCity(pPlot, pPlayer)
	local iShortestDistance = 99999
	local pNearestCity = nil

	local iX, iY = pPlot:GetX(), pPlot:GetY()

	for pCity in pPlayer:Cities() do
		local iDist = Map.PlotDistance(pCity:GetX(), pCity:GetY(), iX, iY)
		local bIsBuildingWonder = false
		for i, v in pairs(tWonders) do
			if v == pCity:GetProductionBuilding() then
				bIsBuildingWonder = true
				break;
			end
		end
		if bIsBuildingWonder then
			if pCity:GetNumRealBuilding(iWonderProdDummy) < 7 then
				if (iDist < iShortestDistance) then
					iShortestDistance = iDist
					pNearestCity = pCity
				end
			end
		end
	end
	return pNearestCity
end

------------------------------------------------------------------------------------------------------------------------
-- DoBoostWonders
------------------------------------------------------------------------------------------------------------------------
function DoBoostWonders(pPlayer, pCity)
	pCity:SetNumRealBuilding(iWonderProdDummy, pCity:GetNumRealBuilding(iWonderProdDummy)+1)
	--print("teotihuacan city received wonder boost, current", pCity:GetNumRealBuilding(iWonderProdDummy))
	if pPlayer:IsHuman() then
		Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(pCity:GetX(), pCity:GetY()))), Locale.ConvertTextKey("+2%[ICON_PRODUCTION]"), 0)
	end
end

------------------------------------------------------------------------------------------------------------------------
-- ProductionBonusFromKills
------------------------------------------------------------------------------------------------------------------------
function ProductionBonusFromKills(iPlayer, iUnit, iUnitType, iX, iY, bDelay, iByPlayer)
	if bDelay then
		if iByPlayer ~= -1 then
			local pByPlayer = Players[iByPlayer]
			if pByPlayer:GetCivilizationType() == iTeotihuacanCiv then
				--print("detected teotihuacan killing a unit")
				local pPlot = Map.GetPlot(iX, iY)
				local pCity = GetNearestWonderCity(pPlot, pByPlayer)
				if pCity then
					DoBoostWonders(pByPlayer, pCity)
				end
			end
		end
	end
end

------------------------------------------------------------------------------------------------------------------------
-- RemoveDummiesWonderCompleted
------------------------------------------------------------------------------------------------------------------------
function RemoveDummiesWonderCompleted(iPlayer, iCity, iBuilding, bGold, bFaithOrCulture)
	local pPlayer = Players[iPlayer]
	if pPlayer:GetCivilizationType() == iTeotihuacanCiv then
		local bRemove = false
		for i, v in pairs(tWonders) do
			if v == iBuilding then
				bRemove = true
				break;
			end
		end
		if bRemove then
			pCity:SetNumRealBuilding(iWonderProdDummy, 0)
			--print("teotihuacan completed a wonder, removed dummies")
		end
	end
end

------------------------------------------------------------------------------------------------------------------------
-- RemoveDummiesDoTurn
------------------------------------------------------------------------------------------------------------------------
function RemoveDummiesDoTurn(iPlayer)
	local pPlayer = Players[iPlayer]
	if pPlayer:GetCivilizationType() == iTeotihuacanCiv then
		for pCity in pPlayer:Cities() do
			local bRemove = true
			for i, v in pairs(tWonders) do
				if v == pCity:GetProductionBuilding() then
					bRemove = false
					break;
				end
			end
			if bRemove then
				pCity:SetNumRealBuilding(iWonderProdDummy, 0)
				--print("teotihuacan stopped building a wonder, removed dummies")
			end
		end
	end
end


------------------------------------------------------------------------------------------------------------------------
-- TradeRouteSlotAfterFirstDoW
------------------------------------------------------------------------------------------------------------------------
local iTradeDummy = GameInfoTypes.BUILDING_ZRQ_TRADE_DUMMY -- building with +1 TR slot

function TradeRouteSlotAfterFirstDoW(iTeam, iOtherTeam)
	local pTeam = Teams[iTeam]
	local pOtherTeam = Teams[iOtherTeam]
	local iAttacker = pTeam:GetLeaderID()
	local pAttacker = Players[iAttacker]
	local iDefender = pOtherTeam:GetLeaderID()
	local pDefender = Players[iDefender]
	if pAttacker:GetCivilizationType() == iTeotihuacanCiv and not pDefender:IsMinorCiv() then
		local bHasDummy = false
		for pCity in pAttacker:Cities() do
			if pCity:IsHasBuilding(iTradeDummy) then
				bHasDummy = true
				break;
			end
		end
		if bHasDummy == false then
			local pCapital = pAttacker:GetCapitalCity()
			pCapital:SetNumRealBuilding(iTradeDummy, 1)
			--print("teotihuacan was given trade dummy")
		end
	end
end

if isTeotihuacanCivActive then
	GameEvents.UnitPrekill.Add(ProductionBonusFromKills)
	GameEvents.CityConstructed.Add(RemoveDummiesWonderCompleted)
	GameEvents.PlayerDoTurn.Add(RemoveDummiesDoTurn)
	GameEvents.DeclareWar.Add(TradeRouteSlotAfterFirstDoW)
end

--========================================================================================================================
-- UNIQUE UNIT: Canine Warrior
--========================================================================================================================
local iDrillPromotion = GameInfoTypes.PROMOTION_DRILL_2
local iCaninePromotion = GameInfoTypes.PROMOTION_ZRQ_CANINE
local iCityCombatPromotion = GameInfoTypes.PROMOTION_ZRQ_CANINE_CITY_BONUS
local iCanineWarrior = GameInfoTypes.UNIT_ZRQ_CANINE

------------------------------------------------------------------------------------------------------------------------
-- DrillIfWonder
------------------------------------------------------------------------------------------------------------------------
function DrillIfWonder(iPlayer, iCity, iUnit)
	local pPlayer = Players[iPlayer]
	local pCity = pPlayer:GetCityByID(iCity)
	local pUnit = pPlayer:GetUnitByID(iUnit)
	if pPlayer:GetCivilizationType() == iTeotihuacanCiv then
		if pUnit:GetUnitType() == iCanineWarrior then
			local bWonder = false
			for i, v in pairs(tWonders) do
				if pCity:IsHasBuilding(v) then
					bWonder = true
					break;
				end
			end
			if bWonder then
				pUnit:SetHasPromotion(iDrillPromotion, true)
			end
		end
	end
end

------------------------------------------------------------------------------------------------------------------------
-- ExtraVsCitiesIfOccupying
------------------------------------------------------------------------------------------------------------------------
function ExtraVsCitiesIfOccupying(iPlayer, iUnit, iX, iY)
	local pPlayer = Players[iPlayer]
	local pUnit = pPlayer:GetUnitByID(iUnit)
	if pUnit:IsHasPromotion(iCaninePromotion) then
		local bDoPromotion = false
		local pPlot = Map.GetPlot(iX, iY)
		if pPlot and pPlot:IsOwned() then
			if pPlot:GetOwner() ~= iPlayer then
				local pTeam = Teams[pPlayer:GetTeam()]
				local iOtherPlayer = pPlot:GetOwner()
				local pOtherPlayer = Players[iOtherPlayer]
				local iOtherTeam = pOtherPlayer:GetTeam()
				if pTeam:IsAtWar(iOtherTeam) then
					for pCity in pPlayer:Cities() do
						if pCity:GetOriginalOwner () == iOtherPlayer then
							bDoPromotion = true
							break;
						end
					end
				end
			end
		end
		pUnit:SetHasPromotion(iCityCombatPromotion, bDoPromotion)
	end
end

GameEvents.CityTrained.Add(DrillIfWonder)
GameEvents.UnitSetXY.Add(ExtraVsCitiesIfOccupying)


--========================================================================================================================
-- UNIQUE BUILDING: Obsidian Workshop
--========================================================================================================================
local iObsidianWorkshop = GameInfoTypes.BUILDING_ZRQ_OBSIDIAN_WORKSHOP
local iGiveWorkerDummy = GameInfoTypes.BUILDING_ZRQ_WORKER_DUMMY
local iCaravansaryClass = GameInfoTypes.BUILDINGCLASS_CARAVANSARY
local iWorker = GameInfoTypes.UNIT_WORKER

------------------------------------------------------------------------------------------------------------------------
-- WorkerIfCompleteTradeRoute
------------------------------------------------------------------------------------------------------------------------
function WorkerIfCompleteTradeRoute(iPlayer)
	local pPlayer = Players[iPlayer]
	for pCity in pPlayer:Cities() do
		if pCity:IsHasBuilding(iGiveWorkerDummy) then			
			pPlayer:InitUnit(iWorker, pCity:GetX(), pCity:GetY())
			pCity:SetNumRealBuilding(iGiveWorkerDummy, 0)
		end
	end
	local tTradeRoutes = pPlayer:GetTradeRoutes()
	for i, v in pairs(tTradeRoutes) do
		local pTradeCity = v.ToCity
		if pTradeCity:IsHasBuilding(iObsidianWorkshop) then
			if pTradeCity:GetNumGreatWorksInBuilding(iCaravansaryClass) >= 1 then
				--print("Trade Route Turns Left", v.TurnsLeft)
				if v.TurnsLeft == 2 then
					pTradeCity:SetNumRealBuilding(iGiveWorkerDummy, 1)
				end
			end
		end
	end
end

if isTeotihuacanCivActive then
	GameEvents.PlayerDoTurn.Add(WorkerIfCompleteTradeRoute)
end