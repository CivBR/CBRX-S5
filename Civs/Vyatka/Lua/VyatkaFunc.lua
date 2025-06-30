--PDT: If UU is on river tile and over 30/10% (smaller) of map width from cap, restore 15HP. reset UU proms to 3. loop cities, if building UB, add prod based on dums.
--prekill: if vyatka is killer, give gold/culture if outside/inside vyatka territory. scale amount from 50% to 300% of killed CS depending of % of map width away. if in vyatka territory (any killer), add a dum to owning city.
--setxy: if uu and has prom and going into river tile, give next prom down + restore 1 mp.
--policyadopt: if landsknecht unlock, spawn 2 UUs at cap. loop cities, give gold in any cities with UB
--citytrained: if gold and city has UB, give culture
--cityconstructed: if gold and city has UB, give culture

include("FLuaVector.lua")

local civilizationID = GameInfoTypes["CIVILIZATION_RHO_VYATKA"]
local unitUshkuynik = GameInfoTypes["UNIT_RHO_USHKUYNIK"]
local buildDymkovo = GameInfoTypes["BUILDING_RHO_TOYMAKER"]
local dumUBkills = GameInfoTypes["BUILDING_RHO_VYATKAMARK_DUMMY"]
local polLands = GameInfoTypes["POLICY_TRADE_UNIONS"]
local yieGold = GameInfoTypes["YIELD_GOLD"]
local tUUproms = {GameInfoTypes["PROMOTION_RHO_VYATKAUUMARK1"], GameInfoTypes["PROMOTION_RHO_VYATKAUUMARK2"], GameInfoTypes["PROMOTION_RHO_VYATKAUUMARK3"]}
local mapwidth, _ = Map.GetGridSize()

function VyatkaUUPDTHealAndReset_UBSpeedUp (playerID)
	local player = Players[playerID]
	if not player:IsAlive() then return end
	if player:GetCivilizationType() ~= civilizationID then return end
	for unit in player:Units() do
		if unit:GetUnitType() == unitUshkuynik then
			unit:SetHasPromotion(tUUproms[1], false)
			unit:SetHasPromotion(tUUproms[2], false)
			unit:SetHasPromotion(tUUproms[3], true)
			local uplot = unit:GetPlot()
			local capital = player:GetCapitalCity()
			if capital and uplot:IsRiver() and Map.PlotDistance(uplot:GetX(), uplot:GetY(), capital:GetX(), capital:GetY()) > math.min(30, math.ceil(mapwidth/10)) then
				unit:ChangeDamage(-15)
			end
		end
	end
	for city in player:Cities() do
		if city:IsHasBuilding(dumUBkills) and city:IsProductionBuilding() and city:GetProductionBuilding() == buildDymkovo then
			city:ChangeBuildingProduction(city:GetProductionBuilding(), city:GetNumRealBuilding(dumUBkills))
		end
	end
end
GameEvents.PlayerDoTurn.Add(VyatkaUUPDTHealAndReset_UBSpeedUp)

function VyatkaUUSetXYFreeRiverMoves (playerID, unitID, x, y)
	local player = Players[playerID]
	if not player:IsAlive() then return end
	if player:GetCivilizationType() ~= civilizationID then return end
	local unit = player:GetUnitByID(unitID)
	if unit:GetUnitType() == unitUshkuynik then
		local plot = Map.GetPlot(x, y)
		if plot:IsRiver() then
			if unit:IsHasPromotion(tUUproms[3]) then
				unit:SetMoves(unit:MaxMoves())
				--if plot:IsRoughGround() then unit:ChangeMoves(60) end
				unit:SetHasPromotion(tUUproms[3], false)
				unit:SetHasPromotion(tUUproms[2], true)
			elseif unit:IsHasPromotion(tUUproms[2]) then
				unit:SetMoves(unit:MaxMoves())
				--if plot:IsRoughGround() then unit:ChangeMoves(60) end
				unit:SetHasPromotion(tUUproms[2], false)
				unit:SetHasPromotion(tUUproms[1], true)
			elseif unit:IsHasPromotion(tUUproms[1]) then
				unit:SetMoves(unit:MaxMoves())
				--if plot:IsRoughGround() then unit:ChangeMoves(60) end
				unit:SetHasPromotion(tUUproms[1], false)
			end
		end
	end
end
GameEvents.UnitSetXY.Add(VyatkaUUSetXYFreeRiverMoves)

function VyatkaPolicyAdoptUBGold_MercenaryBonus (playerID, policyID)
	local player = Players[playerID]
	if not player:IsAlive() then return end
	if player:GetCivilizationType() ~= civilizationID then return end
	if policyID == polLands then
		local capital = player:GetCapitalCity()
		if capital then
			player:InitUnit(unitUshkuynik, capital:GetX(), capital:GetY())
			player:InitUnit(unitUshkuynik, capital:GetX(), capital:GetY())
		end
	end
	for city in player:Cities() do
		if city:IsHasBuilding(buildDymkovo) then
			player:ChangeGold(2*city:GetJONSCulturePerTurn())
			if player:IsHuman() then
				local convertTextKey 	= Locale.ConvertTextKey
				local hex = ToHexFromGrid(Vector2(city:GetX(), city:GetY()))
				Events.AddPopupTextEvent(HexToWorld(hex), convertTextKey("[NEWLINE][NEWLINE]+" .. 2*city:GetJONSCulturePerTurn() .. "[ENDCOLOR] [ICON_GOLD]"), true)
			end
		end
	end
end
GameEvents.PlayerAdoptPolicy.Add(VyatkaPolicyAdoptUBGold_MercenaryBonus)
GameEvents.PlayerAdoptPolicyBranch.Add(VyatkaPolicyAdoptUBGold_MercenaryBonus)

function VyatkaPurchaseUBYields (playerID, cityID, _, bGold, bFaith)
	local player = Players[playerID]
	if not player:IsAlive() then return end
	if player:GetCivilizationType() ~= civilizationID then return end
	if bGold then
		local city = player:GetCityByID(cityID)
		if city:IsHasBuilding(buildDymkovo) then
			player:ChangeJONSCulture(2 * city:GetYieldRate(yieGold))
			if player:IsHuman() then
				local convertTextKey 	= Locale.ConvertTextKey
				local hex = ToHexFromGrid(Vector2(city:GetX(), city:GetY()))
				Events.AddPopupTextEvent(HexToWorld(hex), convertTextKey("[NEWLINE][NEWLINE]+" .. 2*city:GetYieldRate(yieGold) .. "[ENDCOLOR] [ICON_CULTURE]"), true)
			end
		end
	end
end
GameEvents.CityTrained.Add(VyatkaPurchaseUBYields)
GameEvents.CityConstructed.Add(VyatkaPurchaseUBYields)

function VyatkaPrekillUAYields (playerID, iUnit, unitType, iPlotX, iPlotY, bDelay, iByPlayer)
	if bDelay == true then
		local plot = Map.GetPlot(iPlotX, iPlotY)
		if plot:GetOwner() ~= -1 and Players[plot:GetOwner()]:GetCivilizationType() == civilizationID then
			local city = plot:GetWorkingCity()
			if city then
				city:SetNumRealBuilding(dumUBkills, city:GetNumRealBuilding(dumUBkills) + 1)
			end
		end
		local kplayer = Players[iByPlayer]
		if kplayer then
			if not kplayer:IsAlive() then return end
			if kplayer:GetCivilizationType() ~= civilizationID then return end
			local capital = kplayer:GetCapitalCity()
			if capital then
				local bdcs = Players[playerID]:GetUnitByID(iUnit):GetBaseCombatStrength() / 2
				local scale = math.max(1, Map.PlotDistance(iPlotX, iPlotY, capital:GetX(), capital:GetY()) / (mapwidth / 20))
				scale = math.min(scale, 6)
				local reward = math.ceil(bdcs * scale)
				if plot:GetOwner() == iByPlayer then
					kplayer:ChangeJONSCulture(reward)
					if kplayer:IsHuman() then
						local convertTextKey 	= Locale.ConvertTextKey
						local hex = ToHexFromGrid(Vector2(iPlotX, iPlotY))
						Events.AddPopupTextEvent(HexToWorld(hex), convertTextKey("[NEWLINE][NEWLINE]+" .. reward .. "[ENDCOLOR] [ICON_CULTURE]"), true)
					end
				else
					kplayer:ChangeGold(reward)
					if kplayer:IsHuman() then
						local convertTextKey 	= Locale.ConvertTextKey
						local hex = ToHexFromGrid(Vector2(iPlotX, iPlotY))
						Events.AddPopupTextEvent(HexToWorld(hex), convertTextKey("[NEWLINE][NEWLINE]+" .. reward .. "[ENDCOLOR] [ICON_GOLD]"), true)
					end
				end
			end
		end
	end
end
GameEvents.UnitPrekill.Add(VyatkaPrekillUAYields)