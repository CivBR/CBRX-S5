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

local tTradePromos = {}
for i = 1, 25, 1 do
	tTradePromos[i] = GameInfoTypes["PROMOTION_TG_TRADE_ROUTE_PROMOTION_" .. i]
end

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
			for _, iPromo in pairs(tTradePromos) do
				pUnit:SetHasPromotion(iPromo, false)
			end
			if iTradeRouteCount > 0 then
				local iPromoNum = math.min(iTradeRouteCount, 25)
				pUnit:SetHasPromotion(tTradePromos[iPromoNum],true)
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
