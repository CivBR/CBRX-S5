--------------------------------------------------------------
-- User Settings
--------------------------------------------------------------
-- Set the maximum percent of combat bonus to up to 25%.
local iPercentModiferMax = 20

-- Sets how many international trade routes until you see an additional combat bonus. (Set to 1 for every international trade route to result in an additional combat bonus. Set to 0.5 for two combat strength for every international trade route. Set to 69 or some other absurd number to disable, unless you want to divide by zero.)
local iInterCivTradeRequirement = 1

-- Sets additional combat bonus for trade routes ending in your territory. (Set to 0 to disable)
local iEndAtHome = 1

-- Count city-states as international (true or false only).
local bCityStateBonus = True

-- Sets the maximum gold precent bonus for roads and luxury resources.
local iGoldBonusMax = 20

-- Gold percent bonus from city connections (0 to disable).
local iCapitalConnectedBonus = 1

-- Gold percent bonus from luxury resources (0 to disable).
local iLuxesOwnedBonus = 1

--------------------------------------------------------------
-- Globals
--------------------------------------------------------------
local iSusquehannock = GameInfoTypes["CIVILIZATION_TG_SUSQUEHANNOCK"]

local iUADummy = GameInfoTypes["BUILDING_TG_SUSQUEHANNOCK_UADUMMY"]

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

local bIsActive = JFD_IsCivilisationActive(iSusquehannock)
--------------------------------------------------------------
-- Great Minquas Path UA (Trade Routes)
--------------------------------------------------------------

local iUATradePromo1 = GameInfoTypes["PROMOTION_TG_TRADE_ROUTE_PROMOTION_1"]
local iUATradePromo2 = GameInfoTypes["PROMOTION_TG_TRADE_ROUTE_PROMOTION_2"]
local iUATradePromo3 = GameInfoTypes["PROMOTION_TG_TRADE_ROUTE_PROMOTION_3"]
local iUATradePromo4 = GameInfoTypes["PROMOTION_TG_TRADE_ROUTE_PROMOTION_4"]
local iUATradePromo5 = GameInfoTypes["PROMOTION_TG_TRADE_ROUTE_PROMOTION_5"]
local iUATradePromo6 = GameInfoTypes["PROMOTION_TG_TRADE_ROUTE_PROMOTION_6"]
local iUATradePromo7 = GameInfoTypes["PROMOTION_TG_TRADE_ROUTE_PROMOTION_7"]
local iUATradePromo8 = GameInfoTypes["PROMOTION_TG_TRADE_ROUTE_PROMOTION_8"]
local iUATradePromo9 = GameInfoTypes["PROMOTION_TG_TRADE_ROUTE_PROMOTION_9"]
local iUATradePromo10 = GameInfoTypes["PROMOTION_TG_TRADE_ROUTE_PROMOTION_10"]
local iUATradePromo11 = GameInfoTypes["PROMOTION_TG_TRADE_ROUTE_PROMOTION_11"]
local iUATradePromo12 = GameInfoTypes["PROMOTION_TG_TRADE_ROUTE_PROMOTION_12"]
local iUATradePromo13 = GameInfoTypes["PROMOTION_TG_TRADE_ROUTE_PROMOTION_13"]
local iUATradePromo14 = GameInfoTypes["PROMOTION_TG_TRADE_ROUTE_PROMOTION_14"]
local iUATradePromo15 = GameInfoTypes["PROMOTION_TG_TRADE_ROUTE_PROMOTION_15"]
local iUATradePromo16 = GameInfoTypes["PROMOTION_TG_TRADE_ROUTE_PROMOTION_16"]
local iUATradePromo17 = GameInfoTypes["PROMOTION_TG_TRADE_ROUTE_PROMOTION_17"]
local iUATradePromo18 = GameInfoTypes["PROMOTION_TG_TRADE_ROUTE_PROMOTION_18"]
local iUATradePromo19 = GameInfoTypes["PROMOTION_TG_TRADE_ROUTE_PROMOTION_19"]
local iUATradePromo20 = GameInfoTypes["PROMOTION_TG_TRADE_ROUTE_PROMOTION_20"]
local iUATradePromo21 = GameInfoTypes["PROMOTION_TG_TRADE_ROUTE_PROMOTION_21"]
local iUATradePromo22 = GameInfoTypes["PROMOTION_TG_TRADE_ROUTE_PROMOTION_22"]
local iUATradePromo23 = GameInfoTypes["PROMOTION_TG_TRADE_ROUTE_PROMOTION_23"]
local iUATradePromo24 = GameInfoTypes["PROMOTION_TG_TRADE_ROUTE_PROMOTION_24"]
local iUATradePromo25 = GameInfoTypes["PROMOTION_TG_TRADE_ROUTE_PROMOTION_25"]

local tTradePromos = {iUATradePromo1,iUATradePromo2,iUATradePromo3,iUATradePromo4,iUATradePromo5,iUATradePromo6,iUATradePromo7,iUATradePromo8,iUATradePromo9,iUATradePromo10iUATradePromo11,iUATradePromo12,iUATradePromo13,iUATradePromo14,iUATradePromo15,iUATradePromo16,iUATradePromo17,iUATradePromo18,iUATradePromo19,iUATradePromo20,iUATradePromo21,iUATradePromo22,iUATradePromo23,iUATradePromo24,iUATradePromo25}

function Susquehanna_TradePromo(playerID)
	local pPlayer = Players[playerID]
	if pPlayer:GetCivilizationType() ~= iSusquehannock then return end
	local iTradeRouteCount = 0
	local iInterTradeRoutes = 0
	-- print("TradePromoStart")
	for k, v in pairs(pPlayer:GetTradeRoutes()) do
	-- print("TradeRoutesCounted")
		if v.ToCivilizationType ~= iSusquehannock and ((not Players[v.ToID]:IsMinorCiv()) or bCityStateBonus) then
				iInterTradeRoutes = iInterTradeRoutes + 1
		end
		iTradeRouteCount = iTradeRouteCount + 1
	end
	for k, v in pairs(pPlayer:GetTradeRoutesToYou()) do
	-- print("TradeRoutesToYouCounted")
		iTradeRouteCount = iTradeRouteCount + iEndAtHome + 1
		iInterTradeRoutes = iInterTradeRoutes + 1
	end
	iTradeRouteCount = iTradeRouteCount + math.floor(iInterTradeRoutes / iInterCivTradeRequirement)
	iTradeRouteCount = math.min(iTradeRouteCount,iPercentModiferMax)
	-- print("TradeRouteCount: " .. iTradeRouteCount)
	for pUnit in pPlayer:Units() do
		if pUnit:IsCombatUnit() then
			pUnit:SetHasPromotion(iUATradePromo1,false)
			pUnit:SetHasPromotion(iUATradePromo2,false)
			pUnit:SetHasPromotion(iUATradePromo3,false)
			pUnit:SetHasPromotion(iUATradePromo4,false)
			pUnit:SetHasPromotion(iUATradePromo5,false)
			pUnit:SetHasPromotion(iUATradePromo6,false)
			pUnit:SetHasPromotion(iUATradePromo7,false)
			pUnit:SetHasPromotion(iUATradePromo8,false)
			pUnit:SetHasPromotion(iUATradePromo9,false)
			pUnit:SetHasPromotion(iUATradePromo10,false)
			pUnit:SetHasPromotion(iUATradePromo11,false)
			pUnit:SetHasPromotion(iUATradePromo12,false)
			pUnit:SetHasPromotion(iUATradePromo13,false)
			pUnit:SetHasPromotion(iUATradePromo14,false)
			pUnit:SetHasPromotion(iUATradePromo15,false)
			pUnit:SetHasPromotion(iUATradePromo16,false)
			pUnit:SetHasPromotion(iUATradePromo17,false)
			pUnit:SetHasPromotion(iUATradePromo18,false)
			pUnit:SetHasPromotion(iUATradePromo19,false)
			pUnit:SetHasPromotion(iUATradePromo20,false)
			pUnit:SetHasPromotion(iUATradePromo21,false)
			pUnit:SetHasPromotion(iUATradePromo22,false)
			pUnit:SetHasPromotion(iUATradePromo23,false)
			pUnit:SetHasPromotion(iUATradePromo24,false)
			pUnit:SetHasPromotion(iUATradePromo25,false)
			if iTradeRouteCount > 0 then
				pUnit:SetHasPromotion(tTradePromos[iTradeRouteCount],true)
			end
		end
	end
end

--GetTradeRoutes

if bIsActive then
	GameEvents.PlayerDoTurn.Add(Susquehanna_TradePromo)
end
--------------------------------------------------------------
-- Great Minquas Path UA (Connections & Unique Luxury Resources)
--------------------------------------------------------------
local tLuxes = {}
for row in DB.Query("SELECT * FROM Resources WHERE ResourceClassType = 'RESOURCECLASS_LUXURY'") do
	tLuxes[row.ID] = true
end

function Susquehanna_LuxCityBonus(playerID)
	local pPlayer = Players[playerID]
	if pPlayer:GetCivilizationType() ~= iSusquehannock then return end
	local iLuxConnectCount = 0
	for pCity in pPlayer:Cities() do
		if pPlayer:IsCapitalConnectedToCity(pCity) and not pCity:IsCapital() then 
			iLuxConnectCount = iLuxConnectCount + iCapitalConnectedBonus
		end
	end
	-- print("Connected cities to capital: " .. iLuxConnectCount)
	for k, v in pairs(tLuxes) do
		if pPlayer:GetNumResourceTotal(k) > 0 then
			iLuxConnectCount = iLuxConnectCount + iLuxesOwnedBonus
		end
	end
	-- print("Luxuries owned: " .. iLuxConnectCount)
	iLuxConnectCount = math.min(iLuxConnectCount,iGoldBonusMax)
	for pCity in pPlayer:Cities() do
		pCity:SetNumRealBuilding(iUADummy,iLuxConnectCount)
	end
	-- print("UA gold bonus & dummy buildings: " .. iLuxConnectCount)
end

if bIsActive then
	GameEvents.PlayerDoTurn.Add(Susquehanna_LuxCityBonus)
end