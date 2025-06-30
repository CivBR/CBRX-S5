include("PlotIterators.lua")
include("FLuaVector.lua")

local civilizationID = GameInfoTypes["CIVILIZATION_RHO_CHONO"]
local unitDalca = GameInfoTypes["UNIT_RHO_DALCA"]
local unitWalt = GameInfoTypes["UNIT_RHO_WALT"]
local resIron = GameInfoTypes["RESOURCE_IRON"]
local promFoodsac = GameInfoTypes["PROMOTION_RHO_DALCASCOUT"]
local unitScout = GameInfoTypes["UNIT_SCOUT"]
local impMine = GameInfoTypes["IMPROVEMENT_MINE"]
local featForest = GameInfoTypes["FEATURE_FOREST"]
local impBoat = GameInfoTypes["IMPROVEMENT_FISHING_BOATS"]
local impWell = GameInfoTypes["IMPROVEMENT_OFFSHORE_PLATFORM"]
local promLost = GameInfoTypes["PROMOTION_RHO_MARKLOST"]
local dumLost = GameInfoTypes["BUILDING_RHO_CHONOMARK_DUMMY"]
local done = 0

--PDT: UA:Count unused strategics and grant gold.
--		Walt:Gain 1 Movement and XP for each foreign unit adjacent.
--TeamMeet:UA:Show locations of all met players units, and give 2 culture for all freshwater tiles in own territory.
--Prekill:Dalca:give production to nearest city for each adjacent Forest/Mine, then spawn a scout with promo.
--		spawned scout: give food if killed on city.
local iPracticalNumCivs = (GameDefines.MAX_MAJOR_CIVS - 1)
function JFD_IsCivilisationActive(civID)
	for iSlot = 0, iPracticalNumCivs, 1 do
		local slotStatus = PreGame.GetSlotStatus(iSlot)
		if (slotStatus == SlotStatus["SS_TAKEN"] or slotStatus == SlotStatus["SS_COMPUTER"]) then
			if PreGame.GetCivilization(iSlot) == civID then
				return true
			end
		end
	end
	return false
end
local bIsActive = JFD_IsCivilisationActive(civilizationID)

function ChonoPDT (playerID)
	local player = Players[playerID]
	if not player:IsAlive() then return end
	if player:GetCivilizationType() ~= civilizationID then return end
	--mmm ripping apart ui guts
	local nUnused = 0
	for pResource in GameInfo.Resources() do
		local iResourceLoop = pResource.ID
		if (Game.GetResourceUsageType(iResourceLoop) == ResourceUsageTypes.RESOURCEUSAGE_STRATEGIC) then
			local add = player:GetNumResourceAvailable(iResourceLoop, true)
			if iResourceLoop == resIron then
				add = 2*add
			end
			nUnused = nUnused + add
		end
	end
	player:ChangeGold(nUnused/2)
	if player:IsHuman() and nUnused > 0 then
		Events.GameplayAlertMessage(Locale.ConvertTextKey("Your unused Strategic Resources have been converted into {1_Num} [ICON_GOLD] Gold.", nUnused/2))
	end
	for pUnit in player:Units() do
		if pUnit:GetUnitType() == unitWalt then
			local nAdj = 0
			local pPlot = pUnit:GetPlot()
			for pnear in PlotAreaSweepIterator(pPlot, 1, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
				if pnear:IsUnit() then
					for i = 0, pnear:GetNumUnits() - 1, 1 do
						local aUnit = pnear:GetUnit(i)
						if aUnit and aUnit:GetOwner() ~= playerID then
							nAdj = nAdj + 1
							aUnit:SetHasPromotion(promLost, true)
							if Players[aUnit:GetOwner()]:GetCapitalCity() then
								Players[aUnit:GetOwner()]:GetCapitalCity():SetNumRealBuilding(dumLost, 1)
							end
						end
					end
				end
			end
			pUnit:ChangeMoves(60*nAdj)
			pUnit:ChangeExperience(nAdj)
		end
	end
end
if bIsActive then
	GameEvents.PlayerDoTurn.Add(ChonoPDT)
end

function ChonoPrekill (playerID, iUnit, unitType, iPlotX, iPlotY, bDelay, iByPlayer)
	local player = Players[playerID]
	if not player:IsAlive() then return end
	if player:GetCivilizationType() ~= civilizationID then return end
	if not bDelay then return end
	local plot = Map.GetPlot(iPlotX, iPlotY)
	local unit = player:GetUnitByID(iUnit)
	if unitType == unitScout and unit:IsHasPromotion(promFoodsac) and plot:IsCity() then
		local city = plot:GetPlotCity()
		city:ChangeFood(40)
	end
end
if bIsActive then
	GameEvents.UnitPrekill.Add(ChonoPrekill)
end

function ChonoMeet (playerMetID, playerID)
	local player = Players[playerID]
	if not player:IsAlive() then return end
	if player:GetCivilizationType() ~= civilizationID then return end
	local playerMet = Players[playerMetID]
	local team = player:GetTeam()
	for pMetUnit in playerMet:Units() do
		local plot = pMetUnit:GetPlot()
		plot:SetRevealed(team, true)
		if Game.GetActivePlayer() == playerID then
			unitlvl = pMetUnit:GetLevel()
			unitname = pMetUnit:GetName()
			local sMessage = "Lvl" .. unitlvl .. " " .. unitname .. ""
			Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(plot:GetX(), plot:GetY()))), sMessage, 0)
		end
	end
	local CheckedPlots = {}
	local rewardplots = 0
	for pCity in player:Cities() do
		for i = 0, pCity:GetNumCityPlots()-1, 1 do
			local pPlot = pCity:GetCityIndexPlot(i)
			if pPlot and (pPlot:IsFreshWater() or pPlot:IsLake()) and (not CheckedPlots[pPlot:GetPlotIndex()]) and pPlot:GetOwner() == playerID then
				CheckedPlots[pPlot:GetPlotIndex()] = 1
				rewardplots = rewardplots + 1
			end
		end
	end
	player:ChangeJONSCulture(10*rewardplots)
	if player:IsHuman() then
		Events.GameplayAlertMessage(Locale.ConvertTextKey("You receive {1_Num} [ICON_CULTURE] Culture from meeting another power.", (10*rewardplots)))
	end
end
if bIsActive then
	GameEvents.TeamMeet.Add(ChonoMeet)
end

function ChonoImproved (playerID, x, y, improvementID)
	local player = Players[playerID]
	if not player:IsAlive() then return end
	if player:GetCivilizationType() ~= civilizationID then return end
	local plot = Map.GetPlot(x, y)
	if done == 0 then
		if (improvementID == impBoat or improvementID == impWell) then
			done = 1
			local nAdj = 0
			local bScout = 0
			for pnear in PlotAreaSweepIterator(plot, 1, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
				if pnear:GetImprovementType() == impMine or pnear:GetFeatureType() == featForest then
					nAdj = nAdj + 1
					if bScout == 0 then
						bScout = 1
						player:InitUnit(unitScout, pnear:GetX(), pnear:GetY())
						for i = 0, pnear:GetNumUnits() - 1, 1 do
							local aUnit = pnear:GetUnit(i)
							if aUnit:GetUnitType() == unitScout then
								aUnit:SetHasPromotion(promFoodsac, true)
							end
						end
					end
				end
			end
			local reward = nAdj*20*(1+Teams[player:GetTeam()]:GetCurrentEra())
			player:ChangeJONSCulture(reward)
			if player:IsHuman() then
				Events.GameplayAlertMessage(Locale.ConvertTextKey("Your Dalca's improvement provides {1_Num} [ICON_CULTURE] Culture.", reward))
			end
		end
	else
		done = 0
	end
end
if bIsActive then
	GameEvents.BuildFinished.Add(ChonoImproved)
end

function ChonoMoveReductionPDT (playerID)
	local player = Players[playerID]
	if not player:IsAlive() then return end
	local capital = player:GetCapitalCity()
	if capital then
		if capital:IsHasBuilding(dumLost) then
			capital:SetNumRealBuilding(dumLost, 0)
			for unit in player:Units() do
				if unit:IsHasPromotion(promLost) then
					unit:SetHasPromotion(promLost, false)
					unit:ChangeMoves(-60)
				end
			end
		end
	end
end
if bIsActive then
	GameEvents.PlayerDoTurn.Add(ChonoMoveReductionPDT)
end

--extreme edge case but stuff will get broke otherwise
function ChonoCapitalLostMovement (oldPlayerID, bCap, iX, iY, newOwnerID)
	local player = Players[oldPlayerID]
	if not player:IsAlive() then return end
	if not bCap then return end
	local plot = Map.GetPlot(iX, iY)
	local city = plot:GetPlotCity()
	if city:IsHasBuilding(dumLost) then
		local nCap = player:GetCapitalCity()
		nCap:SetNumRealBuilding(dumLost, 1)
		city:SetNumRealBuilding(dumLost, 0)
	end
end
if bIsActive then
	GameEvents.CityCaptureComplete.Add(ChonoCapitalLostMovement)
end