--------------------------------------
--  PEOPLE OF THE TIDES             --
--------------------------------------
print("Tlingit Lua loaded")
--------DJS's code--------------------
include("FLuaVector")

local BuildingTable = {}
 
for row in GameInfo.BuildingClasses() do
    if row.MaxPlayerInstances == -1 and row.MaxGlobalInstances == -1 and row.DefaultBuilding then
		local building = GameInfo.Buildings[row.DefaultBuilding]
		if building then
			BuildingTable[building.ID] = Locale.Lookup(building.Type);
		end
    end
end
 
function Tlingit_BuildingCheck(player, buildingID)
    local numBuilding = 0
    for city in player:Cities() do
        if city:GetNumRealBuilding(buildingID) > 0 then
            numBuilding = numBuilding + 1
        end
    end
 
    return numBuilding
end
 
function Tlingit_BuildingBoost(playerID, cityX, cityY)
    local player = Players[playerID]
    if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_CL_TLINGIT"] and player:IsAlive() then
        local plot = Map.GetPlot(cityX, cityY)
        local city = plot:GetPlotCity()
        local numOtherCities = player:GetNumCities() - 1
        if city:IsCoastal() then
            for iBuilding in pairs(BuildingTable) do
                local buildingID = GameInfo.Buildings[iBuilding].ID
                if Tlingit_BuildingCheck(player, buildingID) == numOtherCities then
                    local boost = math.floor((GameInfo.Buildings[iBuilding].Cost) * 0.30)
                    city:ChangeBuildingProduction(buildingID, boost)
                end
            end
        end
    end
end
GameEvents.PlayerCityFounded.Add(Tlingit_BuildingBoost)
 
 
 function IsHasCoastalCity(pPlayer)
    for pCity in pPlayer:Cities() do
        if pCity:IsCoastal() then
            return true
        end
    end
    return false
end
 
function CL_Tlingit_DoubleTradeRoute(playerId)
    local pPlayer = Players[playerId]
    if pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_CL_TLINGIT then
        local routes = pPlayer:GetTradeRoutes()
        for pCity in pPlayer:Cities() do
            local totalSci = 0
            local totalGold = 0
            local pPlot = pCity:Plot()
            for i,v in ipairs(routes) do
                if pCity == v.FromCity then
                    if v.FromCity:IsCoastal() then
                        local targetId = v.ToCity:GetOwner()
                        if targetId ~= playerId then
                            local pTarget = Players[targetId]
                            if IsHasCoastalCity(pTarget) == false then
                                local DTGold = math.ceil((v.FromGPT / 100) - 0.5)
                                pPlayer:ChangeGold(DTGold)
                                totalGold = totalGold + DTGold
                                if pPlayer:GetCurrentResearch() ~= nil then
                                    local TeamTechs = Teams[pPlayer:GetTeam()]:GetTeamTechs()
                                    local DTSci = math.ceil((v.FromScience / 100) - 0.5)
                                    totalSci = totalSci + DTSci
                                    TeamTechs:ChangeResearchProgress(pPlayer:GetCurrentResearch(), DTSci, playerId) --what if resdearch is nil?
                                end
                            end
                        end
                    end
                end
            end
            if totalGold > 0 then
                if playerId == Game.GetActivePlayer() then
                    if totalSci > 0 then
                        Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(pPlot:GetX(), pPlot:GetY()))), "People of the Tides:[NEWLINE][COLOR_RESEARCH_STORED]+"..totalSci.." [ICON_RESEARCH] Science[ENDCOLOR][NEWLINE][COLOR_YIELD_GOLD]+ "..totalGold.." [ICON_GOLD] Gold[ENDCOLOR]", 0)
                    else
                        Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(pPlot:GetX(), pPlot:GetY()))), "People of the Tides:[NEWLINE][COLOR_YIELD_GOLD]+ "..totalGold.." [ICON_GOLD] Gold[ENDCOLOR]", 0)
                    end
                end
            end
        end
    end
end
GameEvents.PlayerDoTurn.Add(CL_Tlingit_DoubleTradeRoute)
 
--------------------------------------
--  XAA                             --
--------------------------------------
-- This part was not managed by Kaduseon, and is taken from
-- the original source as written by Neirai
 
local function YaaCulturePower(pPlayer, pUnit, CoastOnly)
    local distance = 9999
    local closest = false
    for pCity in pPlayer:Cities() do
        if (CoastOnly == true and pCity:IsCoastal()) or CoastOnly == false then
            local pPlot = pCity:Plot()
            local pUnitPlot = pUnit:GetPlot()
            local between = Map.PlotDistance(pPlot:GetX(), pPlot:GetY(), pUnitPlot:GetX(), pUnitPlot:GetY())
            if between < distance then
                distance = between
                closest = pCity
            end
        end
    end
    if CoastOnly == false and distance <= 3 then
        return false
    else
        return closest
    end
end
 
function CL_Tlingit_ListenSEUSD(playerId, unitId, newDamage, oldDamage)
    if newDamage > oldDamage then --filter out heals
        local pPlayer = Players[playerId]
        for pUnit in pPlayer:Units() do
            if pUnit:GetID() == unitId then --if the unit is null, it died. WHich is what we want.
                --we only want this to trigger on not-dead enemies
                --to find and reset CLFBYAADO to CLFBYAA so that CL_Tlingit_ListenPT never triggers.
                if not pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_CLFBYAADO) then -- this is a possible target
                    local pPlot = pUnit:GetPlot()
                    for i = 0, 5 do
                        local pAdj = Map.PlotDirection(pPlot:GetX(), pPlot:GetY(), i);
                        if pAdj ~= nil then
                            if pAdj:GetNumUnits() > 0 then
                                for i = 0, pAdj:GetNumUnits() - 1 do
                                    local pSH = pAdj:GetUnit(i)
                                    if pSH:IsHasPromotion(GameInfoTypes.PROMOTION_CLFBYAADO) then
                                        pSH:SetHasPromotion(GameInfoTypes.PROMOTION_CLFBYAADO, false)
                                        pSH:SetHasPromotion(GameInfoTypes.PROMOTION_CLFBYAA, true)
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
Events.SerialEventUnitSetDamage.Add(CL_Tlingit_ListenSEUSD)
 
function CL_Tlingit_ListenPT(playerId) -- all else has failed, we'll do this on the next turn
    local pPlayer = Players[playerId]
    if pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_CL_TLINGIT then
        for pUnit in pPlayer:Units() do
            if pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_CLFBYAADO) then -- unit killed someone
                pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_CLFBYAADO, false)
                pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_CLFBYAA, true)
                local YaaCity = YaaCulturePower(pPlayer, pUnit, true)
                if YaaCity ~= false then
                    YaaCity:ChangeJONSCultureStored(42)
                end
            end
        end
    end
    return --this event expects a return, so it perfoms better if you give it one
end
GameEvents.PlayerDoTurn.Add(CL_Tlingit_ListenPT)
 
 
 function CL_Tlingit_YaaMovePower(playerId, unitId)
    local pPlayer = Players[playerId]
    if pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_CL_TLINGIT then
        local pUnit = pPlayer:GetUnitByID(unitId)
        local pPlot = pUnit:GetPlot()
        if (pPlot ~= nil) and (pPlot:IsCoastalLand()) then
            if pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_CLFBYAAMOVE) then
                if pUnit:GetMoves() == 0 then
                    if Game.Rand(100, 'Beachcoming') < 33 then --fixed lower case r
                        pUnit:SetMoves(60)
                        if playerId == Game.GetActivePlayer() then
                            Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(pPlot:GetX(), pPlot:GetY()))), "+1[ICON_MOVES]", 0)
                            Events.SerialEventUnitInfoDirty()
                        end
                    end
                end
            end
        end
    end
end
GameEvents.UnitSetXY.Add(CL_Tlingit_YaaMovePower)
 
 
--------------------------------------
--  NOOW                            --
--------------------------------------
-- This part was not managed by Kaduseon, and is taken from
-- the original source as written by Neirai
function CL_Tlingit_NoowUniqueImprovement(playerId)
    local pPlayer = Players[playerId]
    if pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_CL_TLINGIT then
        for plotLoop = 0, Map.GetNumPlots() - 1, 1 do
            local pPlot = Map.GetPlotByIndex(plotLoop)
            if pPlot ~= nil then
                if pPlot:GetImprovementType() == GameInfoTypes.IMPROVEMENT_CLFB_NOOW then
                    if not pPlot:IsImprovementPillaged() then
                        for i = 0, pPlot:GetNumUnits() - 1 do
                            local pUnit = pPlot:GetUnit(i)
                            if pUnit ~= nil then
                                if pPlot:GetOwner() == -1 then
                                    pPlot:SetOwner(pUnit:GetOwner(), pPlayer:GetCapitalCity())
                                end
 
                                pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_CLFBNOOW, true) --fix extra space
                                local pOwner = Players[pPlot:GetOwner()]
                                local NoowCity = YaaCulturePower(pOwner, pUnit, false)
                                if NoowCity ~= false then
                                    local NWords = "Noow: "
                                    local NFood = pPlot:GetYield(YieldTypes.YIELD_FOOD)
                                    local NCult = pPlot:GetYield(YieldTypes.YIELD_CULTURE)
                                    local NFaith = pPlot:GetYield(YieldTypes.YIELD_FAITH)
                                    local NGold = pPlot:GetYield(YieldTypes.YIELD_GOLD)
                                    local NProd = pPlot:GetYield(YieldTypes.YIELD_PRODUCTION)
                                    local NSci = pPlot:GetYield(YieldTypes.YIELD_SCIENCE)
                                    if NFood ~= 0 then
                                        NoowCity:ChangeFood(NFood)
                                        NWords = NWords.."[COLOR_POSITIVE_TEXT] +"..NFood.."[ICON_FOOD] Food[NEWLINE][ENDCOLOR]"
                                    end
                                    if NCult ~= 0 then
                                        pOwner:ChangeJONSCulture(NCult)
                                        NWords = NWords.."[COLOR_CULTURE_STORED] +"..NCult.." [ICON_CULTURE] Culture[NEWLINE][ENDCOLOR]"
                                    end
                                    if NFaith ~= 0 then
                                        pOwner:ChangeFaith(NFaith)
                                        NWords = NWords.." +"..NFaith.." [ICON_PEACE] Faith[NEWLINE]"
                                    end
                                    if NGold ~= 0 then
                                        pOwner:ChangeGold(NGold)
                                        NWords = NWords.."[COLOR_YIELD_GOLD] +"..NGold.." [ICON_GOLD] Gold[NEWLINE][ENDCOLOR]"
                                    end
                                    if NProd ~= 0 then
                                        NoowCity:ChangeProduction(NProd)
                                        NWords = NWords.."[COLOR_YIELD_FOOD] +"..NProd.." [ICON_PRODUCTION] Production[NEWLINE][ENDCOLOR]"
                                    end
                                    if NSci ~= 0 then
                                        local TeamTechs = Teams[pPlayer:GetTeam()]:GetTeamTechs()
                                        TeamTechs:ChangeResearchProgress(pPlayer:GetCurrentResearch(), NSci, playerId) --what if resdearch is nil?
                                        NWords = NWords.."[COLOR_RESEARCH_STORED] +"..NSci.." [ICON_RESEARCH] Science[NEWLINE][ENDCOLOR]"
                                    end
                                    if NWords ~= "Noow: " then
                                        if playerId == Game.GetActivePlayer() then
                                            Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(pPlot:GetX(), pPlot:GetY()))), NWords, 0)
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
GameEvents.PlayerDoTurn.Add(CL_Tlingit_NoowUniqueImprovement)
 
function CL_Tlingit_NoowPromoReset(playerId)
    local pPlayer = Players[playerId]
    for pUnit in pPlayer:Units() do
        if pUnit:GetPlot():GetImprovementType() ~= GameInfoTypes.IMPROVEMENT_CLFB_NOOW then
            pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_CLFBNOOW, false)
        end
    end
end
GameEvents.PlayerDoTurn.Add(CL_Tlingit_NoowPromoReset)
 
-- This part was managed by Kaduseon.
function CL_Tlingit_NoowBuildUniqueImprovement(playerID, plotX, plotY, improvementID)
    -- this method just sets ownership of the tile
    if (improvementID == GameInfoTypes["IMPROVEMENT_CLFB_NOOW"]) then
        local pPlayer = Players[playerID]
        local plot = Map.GetPlot(plotX, plotY)
 
        plot:SetOwner(playerID, pPlayer:GetCapitalCity())
    end
end
GameEvents.BuildFinished.Add(CL_Tlingit_NoowBuildUniqueImprovement)