
local sAlgaTrait = "TRAIT_AGLA_HANSE_WULLENWEVER"

local tDummies = { -- Each gives a respective number of Trade Routes
GameInfoTypes.BUILDING_ALGA_HANSE_TRADE_1,
GameInfoTypes.BUILDING_ALGA_HANSE_TRADE_2,
GameInfoTypes.BUILDING_ALGA_HANSE_TRADE_4,
GameInfoTypes.BUILDING_ALGA_HANSE_TRADE_8,
GameInfoTypes.BUILDING_ALGA_HANSE_TRADE_16}

local tLeaders = {}
for row in DB.Query("SELECT ID FROM Leaders WHERE Type IN (SELECT LeaderType FROM Leader_Traits WHERE TraitType = ?)", sAlgaTrait) do
	tLeaders[row.ID] = true
end

local tTradeUnits = {}
for row in DB.Query("SELECT ID FROM Units WHERE Trade = 1") do
	tTradeUnits[row.ID] = true
end

function DMS_toBits(iNum)
    local tBits={}
    while iNum > 0 do
        local iRest = math.fmod(iNum, 2)
        tBits[#tBits + 1] = iRest
        iNum = (iNum - iRest) / 2
    end
    return tBits
end

function C15_GetNumTradeRoutesCityStates(pPlayer)
	local tRoutes = pPlayer:GetTradeRoutes()
	local iCount = 0
	for k, v in pairs(tRoutes) do
		local pToPlayer = Players[v.ToID]
		if pToPlayer and pToPlayer:IsMinorCiv() then
			iCount = iCount + 1
		end
	end
	
	return iCount
end

function C15_ResetDummyCity(pCity, iCount)
	local tBits = DMS_toBits(iCount)
	for i = 1, #tDummies do
		pCity:SetNumRealBuilding(tDummies[i], tBits[i] or 0)
	end
end

function C15_ResetDummies(pPlayer, iCount)
	for pCity in pPlayer:Cities() do
		if pCity:IsCapital() then
			C15_ResetDummyCity(pCity, iCount)
		else
			C15_ResetDummyCity(pCity, 0)
		end
	end
end

function Alga_Hanse_TradeOffset(playerID)
	local pPlayer = Players[playerID]
	if tLeaders[pPlayer:GetLeaderType()] then
		local iCount = math.floor(C15_GetNumTradeRoutesCityStates(pPlayer) / 2)
		if pPlayer:CountNumBuildings(iRouteDummy) ~= iCount then
			C15_ResetDummies(pPlayer, iCount)
		end
	end
end

GameEvents.PlayerDoTurn.Add(Alga_Hanse_TradeOffset)

function Alga_Hanse_CityCapture(oldID, bCap, iX, iY, newID)
	local pPlot = Map.GetPlot(iX, iY)
	local pCity = pPlot:GetPlotCity()
	if bCap then -- bCap returns true when oldID loses their Capital
		Alga_Hanse_TradeOffset(oldID)
	end
	
	if pCity:IsCapital() then -- City.IsCapital returns true when newID reclaims their Capital
		Alga_Hanse_TradeOffset(newID)
	end
end

GameEvents.CityCaptureComplete.Add(Alga_Hanse_CityCapture)

function Alga_Hanse_UnitCreated(playerID, unitID, someTable, unitType)
	if tTradeUnits[unitType] then
		Alga_Hanse_TradeOffset(playerID)
	end
end

Events.SerialEventUnitCreated.Add(Alga_Hanse_UnitCreated)

-- Derived from FrankiPatank
function Alga_Hanse_CanSave(playerID, unitID)
	local pPlayer = Players[playerID]
	local pUnit = pPlayer:GetUnitByID(unitID)
	if tTradeUnits[pUnit:GetUnitType()] then
		Alga_Hanse_TradeOffset(playerID)
	end
	
	return false
end

GameEvents.CanSaveUnit.Add(Alga_Hanse_CanSave)