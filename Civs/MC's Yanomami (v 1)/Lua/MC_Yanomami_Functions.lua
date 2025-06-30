--=======================================================================================================================
-- Pooky's Yanomami
-- Lua by PorkBean
--=======================================================================================================================
include("PlotIterators")

local iYanomamiCiv = GameInfoTypes.CIVILIZATION_MC_YANOMAMI;

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

local isYanomamiCivActive = JFD_IsCivilisationActive(iYanomamiCiv);

------------------------------------------------------------------------------------------------------------------------
-- DMS_toBits
------------------------------------------------------------------------------------------------------------------------
function DMS_toBits(iNum)
    tBits={}
    while iNum > 0 do
        local iRest = math.fmod(iNum, 2)
        tBits[#tBits + 1] = iRest
        iNum = (iNum - iRest) / 2
    end
    return tBits
end

--========================================================================================================================
-- UNIQUE ABILITY: The Falling Sky
--========================================================================================================================

local iJungle  = GameInfoTypes.FEATURE_JUNGLE
local iModernEra = GameInfoTypes.ERA_MODERN
local iFaithDummy = GameInfoTypes.BUILDING_MC_FAITH_DUMMY
local iFaith = GameInfoTypes.YIELD_FAITH

local tWonders = {}

for row in DB.Query ("SELECT ID featureID FROM Features WHERE NaturalWonder = 1") do
	tWonders[#tWonders+1] = row.featureID
end

local tCultureDummies = {
    [1] = GameInfoTypes.BUILDING_MC_WONDER_CULTURE_DUMMY_1,
    [2] = GameInfoTypes.BUILDING_MC_WONDER_CULTURE_DUMMY_2,
    [3] = GameInfoTypes.BUILDING_MC_WONDER_CULTURE_DUMMY_3,
    [4] = GameInfoTypes.BUILDING_MC_WONDER_CULTURE_DUMMY_4,
	[5] = GameInfoTypes.BUILDING_MC_WONDER_CULTURE_DUMMY_5
}

local tTourismDummies = {
    [1] = GameInfoTypes.BUILDING_MC_TOURISM_DUMMY_1,
    [2] = GameInfoTypes.BUILDING_MC_TOURISM_DUMMY_2,
    [3] = GameInfoTypes.BUILDING_MC_TOURISM_DUMMY_4,
    [4] = GameInfoTypes.BUILDING_MC_TOURISM_DUMMY_8,
	[5] = GameInfoTypes.BUILDING_MC_TOURISM_DUMMY_16,
	[6] = GameInfoTypes.BUILDING_MC_TOURISM_DUMMY_32,
	[7] = GameInfoTypes.BUILDING_MC_TOURISM_DUMMY_64,
	[8] = GameInfoTypes.BUILDING_MC_TOURISM_DUMMY_128
}


------------------------------------------------------------------------------------------------------------------------
-- AddJungleDummies
------------------------------------------------------------------------------------------------------------------------
function AddJungleDummies(iPlayer)
	local pPlayer = Players[iPlayer]
	for pCity in pPlayer:Cities() do
		for i, v in pairs(tTourismDummies) do
			pCity:SetNumRealBuilding(v, 0)
		end
		if pCity:GetReligiousMajority() ~= -1 then
			pCity:SetNumRealBuilding(iFaithDummy, 1)
			if pPlayer:GetCurrentEra() >= iModernEra then
				local iFaithFromTiles = 0
				local pPlot = Map.GetPlot(pCity:GetX(), pCity:GetY());
				for pAdjPlot in PlotAreaSpiralIterator(pPlot, 3, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_INCLUDE) do
					if pAdjPlot and (pAdjPlot:GetOwner() == iPlayer) then
						if pAdjPlot:GetWorkingCity() == pCity then
							iFaithFromTiles = iFaithFromTiles+(pAdjPlot:GetYield(iFaith))
						end
					end
				end
				local tBits = DMS_toBits(math.floor(iFaithFromTiles/2))
				for i = 1, #tTourismDummies do
					pCity:SetNumRealBuilding(tTourismDummies[i], tBits[i] or 0)
				end
			end
		end
	end
end

------------------------------------------------------------------------------------------------------------------------
-- ExtraCultureSettle (trigger)
------------------------------------------------------------------------------------------------------------------------
function ExtraCultureSettle(iPlayer, iX, iY)
	local pPlayer = Players[iPlayer]
	if pPlayer:GetCivilizationType() == iYanomamiCiv then
		local pPlot = Map.GetPlot(iX, iY)
		local pCity = pPlot:GetPlotCity()
		DetectNearbyWonders(pCity, pPlot)
	end
end

------------------------------------------------------------------------------------------------------------------------
-- ExtraCultureCapture (trigger)
------------------------------------------------------------------------------------------------------------------------
function ExtraCultureCapture(iPlayer, bCapital, iX, iY, iNewPlayer)
	local pPlayer = Players[iNewPlayer]
	if pPlayer:GetCivilizationType() == iYanomamiCiv then
		local pPlot = Map.GetPlot(iX, iY)
		local pCity = pPlot:GetPlotCity()
		DetectNearbyWonders(pCity, pPlot)
	end
end

------------------------------------------------------------------------------------------------------------------------
-- DetectNearbyWonders
------------------------------------------------------------------------------------------------------------------------
function DetectNearbyWonders(pCity, pPlot)
	local iClosestWonder = 0
	for i = 1, 5, 1 do
		if iClosestWonder == 0 then
			for pAdjPlot in PlotAreaSpiralIterator(pPlot, i, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
				local bIsWonder = false
				for i, v in pairs(tWonders) do
					if pAdjPlot:GetFeatureType() == v then
						bIsWonder = true
						break;
					end
				end
				if bIsWonder == true then
					--print("detected a wonder at a distance of", i)
					iClosestWonder = i
				end
			end
		end
	end
	--print("iClosestWonder", iClosestWonder)
	if iClosestWonder >= 1 then
		for i, v in pairs(tCultureDummies) do
			if i == iClosestWonder then
				pCity:SetNumRealBuilding(v, 1)
				break;
			end
		end
	end
end

if iYanomamiCiv then
	GameEvents.PlayerDoTurn.Add(AddJungleDummies);
	GameEvents.PlayerCityFounded.Add(ExtraCultureSettle);
	GameEvents.CityCaptureComplete.Add(ExtraCultureCapture);
end

--========================================================================================================================
-- UNIQUE BUILDING: Shabono
--========================================================================================================================

local iShabono = GameInfoTypes.BUILDING_MC_YANOMAMI_SHABONO;
local iFoodDummy = GameInfoTypes.BUILDING_MC_FOOD_DUMMY;

function WondersExtraFood(iPlayer)	
	local pPlayer = Players[iPlayer]
	for pCity in pPlayer:Cities() do
		pCity:SetNumRealBuilding(iFoodDummy, 0)
		local bHasWonder = false
		if pCity:IsHasBuilding(iShabono) then			
			for i = 0, pCity:GetNumCityPlots()-1, 1 do
				local pPlot = pCity:GetCityIndexPlot(i)
				if (pPlot) then
					if pPlot:GetOwner() == iPlayer then
						for i, v in pairs(tWonders) do
							if pPlot:GetFeatureType() == v then
								bHasWonder = true
								break;
							end
						end
					end
				end
			end
			if bHasWonder then
				pCity:SetNumRealBuilding(iFoodDummy, 1)
			end
		end
	end
end

if iYanomamiCiv then
	GameEvents.PlayerDoTurn.Add(WondersExtraFood);
end

--========================================================================================================================
-- UNIQUE UNIT: Dartblower
--========================================================================================================================

local tDartblowerDebuffs = {
    [1] = GameInfoTypes.PROMOTION_MC_DARTBLOWER_COUNT_1,
    [2] = GameInfoTypes.PROMOTION_MC_DARTBLOWER_COUNT_2,
    [3] = GameInfoTypes.PROMOTION_MC_DARTBLOWER_MARKED
}


function DartblowerListener(iPlayer, iUnit, iNewDamage, iOldDamage)
    if iNewDamage > iOldDamage then --filter out heals
        local pPlayer = Players[iPlayer]
		if pPlayer:IsBarbarian() then
        for pUnit in pPlayer:Units() do
            if pUnit:GetID() == iUnit then
                if not pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_MC_YANOMAMI_LISTENER_2) then -- this is a possible the target
                    local pPlot = pUnit:GetPlot()
                    local x = pPlot:GetX()
                    local y = pPlot:GetY()
                    local pPlot = pUnit:GetPlot()
                    for i = 0, 5 do
                        local pAdj = Map.PlotDirection(pPlot:GetX(), pPlot:GetY(), i);
                        if pAdj ~= nil then
                            if pAdj:GetNumUnits() > 0 then
                                for i = 0, pAdj:GetNumUnits() - 1 do
                                    local pDartBlower = pAdj:GetUnit(i)
                                            if pDartBlower:IsHasPromotion(GameInfoTypes.PROMOTION_MC_YANOMAMI_LISTENER_2) then
                                                pDartBlower:SetHasPromotion(GameInfoTypes.PROMOTION_MC_YANOMAMI_LISTENER_2, false) -- do this first so infinite loops don't happen
                                                pDartBlower:SetHasPromotion(GameInfoTypes.PROMOTION_MC_YANOMAMI_LISTENER, true)                                                
                                                pUnit:SetHasPromotion(tDartblowerDebuffs[3], true)
											end
                                        return --don't bother to keep looping if you found the right target
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
    return --this event expects a return, so it perfoms better if you give it one
end

function DartblowerCountDown(iPlayer)
	local pPlayer = Players[iPlayer]
	for pUnit in pPlayer:Units() do
		local currentCount = nil
		local nextCount = nil
		for i, v in pairs(tDartblowerDebuffs) do
			if pUnit:IsHasPromotion(v) then
				currentCount = i
				nextCount = i-1
				break;
			end
		end
		if currentCount then
			pUnit:SetHasPromotion(tDartblowerDebuffs[currentCount], false)
			if nextCount > 0 then
				pUnit:SetHasPromotion(tDartblowerDebuffs[nextCount], true)
			end
		end
	end
end

Events.SerialEventUnitSetDamage.Add(DartblowerListener)
GameEvents.PlayerDoTurn.Add(DartblowerCountDown)