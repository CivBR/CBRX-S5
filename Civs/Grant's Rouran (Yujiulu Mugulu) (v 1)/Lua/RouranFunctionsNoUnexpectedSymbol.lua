
include("FLuaVector.lua")
include("IconSupport")
include("PlotIterators.lua")
--==========================================================================================================================
-- GLOBALS
--==========================================================================================================================
----------------------------------------------------------------------------------------------------------------------------
local g_ConvertTextKey  = Locale.ConvertTextKey
local g_MapGetDistance	= Map.GetDistance
local g_MapGetPlot		= Map.GetPlot
local g_MathCeil		= math.ceil
local g_MathFloor		= math.floor
local g_MathMax			= math.max
local g_MathMin			= math.min
				
local Players 			= Players
local HexToWorld 		= HexToWorld
local ToHexFromGrid 	= ToHexFromGrid
local Teams 			= Teams

local activePlayerID	= Game.GetActivePlayer()
local activePlayer		= Players[activePlayerID]
local activeTeamID		= activePlayer:GetTeam()
local activeTeam		= Teams[activeTeamID]
--==========================================================================================================================
-- UTILITIES
--==========================================================================================================================
-- CORE UTILITIES
----------------------------------------------------------------------------------------------------------------------------
--Game_IsCPActive
function Game_IsCPActive()
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if mod.ID == "d1b6328c-ff44-4b0d-aad7-c657f83610cd" then
			return true
		end
	end
	return false
end
local g_IsCPActive = Game_IsCPActive()
----------------------------------------------------------------------------------------------------------------------------
--HasTrait
function HasTrait(player, traitID)
	if Player.HasTrait then 
		return player:HasTrait(traitID)
	else
		local leaderType = GameInfo.Leaders[player:GetLeaderType()].Type
		local traitType  = GameInfo.Traits[traitID].Type
		for row in GameInfo.Leader_Traits("LeaderType = '" .. leaderType .. "' AND TraitType = '" .. traitType .. "'") do
			return true
		end
	end
	return false
end
-------------------------------------------------------------------------------------------------------------------------
-- JFD_IsCivilisationActive
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
-------------------------------------------------------------------------------------------------------------------------
-- UNIQUE UTILITIES
-------------------------------------------------------------------------------------------------------------------------
-- GetNearestCity
function GetNearestCity(player, plot)
    local distance = 9999
    for city in player:Cities() do
        local cityPlot = city:Plot()
        local between = Map.PlotDistance(cityPlot:GetX(), cityPlot:GetY(), plot:GetX(), plot:GetY())
        if between < distance then
            distance = between
            closestCity = city
        end
    end
    return closestCity
end
--=======================================================================================================================
-- MOD USE
--=======================================================================================================================
-- MODS
-------------------------------------------------------------------------------------------------------------------------
--Game_IsAAActive
function Game_IsAAActive()
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if mod.ID == "432bc547-eb05-4189-9e46-232dbde8f09f" then
			return true
		end
	end
	return false
end
local isAAActive = Game_IsAAActive()
--==========================================================================================================================
-- GAME DEFINES
--==========================================================================================================================
----------------------------------------------------------------------------------------------------------------------------
local defineMaxMajorCivs = GameDefines["MAX_MAJOR_CIVS"]
local defineMaxMinorCivs = GameDefines["MAX_MINOR_CIVS"]
--==========================================================================================================================
-- GLOBALS
--==========================================================================================================================
local civilizationID = GameInfoTypes["CIVILIZATION_GT_ROURAN"]
local traitRouranID = GameInfoTypes["TRAIT_GT_ROURAN"]
local traitMongolID = GameInfoTypes["TRAIT_TERROR"]
local unitWrigglingRiderID = GameInfoTypes["UNIT_GT_WRIGGLING_RIDER"]
local unitKhanID = GameInfoTypes["UNIT_MONGOLIAN_KHAN"]
local unitNonorID = GameInfoTypes["UNIT_GT_NONOR"]
local improvementOrtegeID = GameInfoTypes["IMPROVEMENT_GT_ORTEGE"]
local isRouranActive = activePlayer:GetCivilizationType() == civilizationID
--==========================================================================================================================
-- FUNCTIONS
--==========================================================================================================================
--------------------------------
-- EMPIRE OF THE HIDDEN RIVER --
--------------------------------
local promotionInvisibilityID = GameInfoTypes["PROMOTION_GT_ROURAN"]
local unitCombatMounted = GameInfoTypes["UNITCOMBAT_MOUNTED"]
local terrainDesertID = GameInfoTypes["TERRAIN_DESERT"]
function GT_Rouran_EmpireOfTheHiddenRiver_UnitSetXY(playerID, unitID, unitX, unitY)
	local player = Players[playerID]
	if not HasTrait(player, traitRouranID) then return end
	local unit = player:GetUnitByID(unitID)
	local plot = unit:GetPlot()
	if plot and plot:GetOwner() > -1 then
		local nearestCity = GetNearestCity(player, plot)
		if plot:GetTerrainType() == terrainDesertID then
			for adjacentPlot in PlotAreaSpiralIterator(plot, 2, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
				if adjacentPlot:IsFreshWater() then
					unit:SetHasPromotion(promotionInvisibilityID, true)
					for ID = 0, defineMaxMajorCivs -1, 1 do
						local majorEnemy = Players[ID]
						local majorTeam = Teams[majorEnemy:GetTeam()]
						local playerTeam = Teams[player:GetTeam()]
						if playerTeam:IsAtWar(majorTeam) then
							plot:SetRevealed(majorTeam, false)
							plot:UpdateFog()
						end
					end
				end
			end
		end
		if Players[plot:GetOwner()]:IsMinorCiv() then
			if unit:GetUnitCombatType() == unitCombatMounted then
				local minorCiv = Players[plot:GetOwner()]
				if player:GetMinorCivFriendshipWithMajor() < 0 then
					plot:SetOwner(playerID, nearestCity:GetID())
				end
			end
		end
	end
end
GameEvents.UnitSetXY.Add(GT_Rouran_EmpireOfTheHiddenRiver_UnitSetXY)
---------------------
-- WRIGGLING RIDER --
---------------------
function GT_WrigglingRider_UnitSetXY(playerID, unitID, unitX, unitY)
	local player = Players[playerID]
	local unit = player:GetUnitByID(unitID)
	local plot = unit:GetPlot()
	if not unit:GetUnitType() == unitWrigglingRiderID then return end
	if HasTrait(player, traitRouranID) then
		for adjacentPlot in PlotAreaSpiralIterator(plot, 1, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
			local adjacentUnit = adjacentPlot:GetUnit()
			if (adjacentUnit and (adjacentUnit:IsBarbarian())) or (plot:IsFreshWater())  then
				unit:ChangeMoves(300)
			end
		end
	end
end
GameEvents.UnitSetXY.Add(GT_WrigglingRider_UnitSetXY)

local improvementAquiferID = GameInfoTypes["IMPROVEMENT_GT_AQUIFER"]
function GT_WrigglingRider_AquifierBuildFinished(playerID, x, y, improvementType)
	if improvementType == improvementAquiferID then
		local player = Players[playerID]
		local plot = Map.GetPlot(x,	y)
		local ownerID = plot:GetOwner()
		if ownerID > -1 then
			local owner = Players[ownerID]
			local city = plot:GetWorkingCity()
			if not city then city = GetNearestCity(player, plot) end
			for row in GameInfo.Building_ProvidesAccesstoFreshWater() do
				local buildingID = GameInfo.Buildings[row.BuildingType].ID
				if not city:IsHasBuilding(buildingID) then
					city:SetNumRealBuilding(buildingID, 1)
				end
			end
		end
	end
end
GameEvents.BuildFinished.Add(GT_WrigglingRider_AquifierBuildFinished)
-----------
-- NONOR --
-----------
local promotionOnlyDefensive = GameInfoTypes["PROMOTION_ONLY_DEFENSIVE"]
function GT_Nonor_UnitSetXY(playerID, unitID, unitX, unitY)
	local player = Players[playerID]
	local unit = player:GetUnitByID(unitID)
	local plot = unit:GetPlot()
	if not unit:GetUnitType() == unitNonorID then return end
	if HasTrait(player, traitRouranID) then
		for adjacentPlot in PlotAreaSpiralIterator(plot, 4, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
			local adjacentUnit = adjacentPlot:GetUnit()
			if adjacentUnit then
				if (adjacentUnit:GetUnitType() == unitNonorID or adjacentUnit:GetUnitType() == unitKhanID) then
					unit:SetHasPromotion(promotionOnlyDefensive, false)
				else
					unit:SetHasPromotion(promotionOnlyDefensive, true)
				end
			end
		end
	end
end
GameEvents.UnitSetXY.Add(GT_Nonor_UnitSetXY)

local unitGreatGeneralID = GameInfoTypes["UNIT_GREAT_GENERAL"]
local unitClassGreatGeneralID = GameInfoTypes["UNITCLASS_GREAT_GENERAL"]
local buttonNonor = Controls.NonorButton
local selectedUnit;
local buttonHasntBeenChecked = true
local correctUnitHighlighted = false
local stack = "/InGame/WorldView/UnitPanel/PrimaryStack"
local stretchStack = "/InGame/WorldView/UnitPanel/PrimaryStretchy"
local isStretchActive = false

function IsButtonPossible(unit)
	if unit:GetUnitType() == unitNonorID then
		if unit:IsHasPromotion(promotionNonorID) then
			return true
		end
	end
	return false
end

local changeAmount = 38
function RecheckStackSize(changeMultiplier)
	if stack then
		ContextPtr:LookUpControl(stack):CalculateSize()
		ContextPtr:LookUpControl(stack):ReprocessAnchoring()
	end
	if isStretchActive then
		local stackHeight = ContextPtr:LookUpControl(stretchStack):GetSizeY()
		ContextPtr:LookUpControl(stretchStack):SetSizeY(stackHeight + changeMultiplier * changeAmount)
	end
end

function DoButtonEffect()
	if selectedUnit then
		local plot = selectedUnit:GetPlot()
		player:InitUnit(unitKhanID, plot:GetX(), plot:GetY())
		selectedUnit:Kill()
		local unit = plot:GetUnit()
		if unit and unit:GetUnitType() == unitKhanID then
			unit:SetHasPromotion(promotionRouranKhanID, true)
			unit:SetHasPromotion(promotionOnlyDefensive, true)
			unit:SetBaseCombatStrength(13)
		end
	end
end

function VisualizeButton(shouldItDisable)
	buttonNonor:SetHide(false)
	buttonNonor:SetDisabled(shouldItDisable)
	buttonNonor:LocalizeAndSetToolTip(Locale.ConvertTextKey("[COLOR_POSITIVE_TEXT]Glory of Kushnavaz[ENDCOLOR][NEWLINE][NEWLINE]Expend this unit to form a stronger Asbarobido from the adjacent one.") )
	if not shouldItDisable then
		Controls.NonorButtonImage:SetAlpha(1)
	else
		Controls.NonorButtonImage:SetAlpha(0.25)
	end
end

function GT_Rouran_NonorSelection(playerID, unitID, x, y, a5, bool)
	selectedUnit = nil
	if bool then
		buttonNonor:SetHide(true)
		local player = Players[playerID]
		local unit = player:GetUnitByID(unitID);
		if IsButtonPossible(unit) then
			if buttonHasntBeenChecked then
				buttonHasntBeenChecked = false
				if ContextPtr:LookUpControl(stack) then
					buttonNonor:ChangeParent(ContextPtr:LookUpControl(stack))
					if ContextPtr:LookUpControl(stretchStack) then
						isStretchActive = true;
					end
				else
					buttonNonor:ChangeParent(ContextPtr:LookUpControl("/InGame/WorldView/UnitPanel"))
					buttonNonor:SetAnchor("L,B")
					buttonNonor:SetOffsetVal(55, 80)
				end
			end
			selectedUnit = unit
			if unit:GetMoves() > 0 then
				VisualizeButton(false)
				if not correctUnitHighlighted then
					correctUnitHighlighted = true
					RecheckStackSize(1)
				end
			end
		else
			selectedUnit = nil;
			if correctUnitHighlighted then
				RecheckStackSize(-1)
			end
			correctUnitHighlighted = false
		end
	else
		selectedUnit = nil;
	end
end
Events.UnitSelectionChanged.Add(GT_Rouran_NonorSelection)

function UpdateButtonOnMove(playerID, unitID, iX, iY)
	local player = Players[playerID]
	local unit = player:GetUnitByID(unitID)
	if unit == selectedUnit then
		local shouldButtonDisable = not IsButtonPossible(unit)
		VisualizeButton(shouldButtonDisable)
	else
		buttonNonor:SetHide(true)
	end
end

if isRouranActive then
	GameEvents.PlayerDoTurn.Add(GT_Rouran_Nonor_DoTurn)
	GameEvents.UnitSetXY.Add(UpdateButtonOnMove)
	IconHookup(18, 45, "UNIT_ACTION_ATLAS", Controls.NonorButtonImage)
	buttonNonor:RegisterCallback(Mouse.eLClick, DoButtonEffect)
	buttonNonor:SetHide(true)
end

local promotionNonorID = GameInfoTypes["PROMOTION_GT_NONOR"]
function GT_Nonor_UnitPreKill(capturedPlayerID, unitID, unitType, iX, iY, isDelay, capturingPlayerID)
	if capturingPlayerID == -1 then return end
	if capturedPlayerID == -1 then return end
	if not isDelay then
		local capturingPlayer = Players[capturingPlayerID]
		local capturedPlayer = Players[capturedPlayerID]
		if not HasTrait(capturingPlayer, traitRouranID) then return end
		local unit = capturedPlayer:GetUnitByID(unitID)
		if unit and not unit:IsCombatUnit() then
			if not unit:GetUnitClassType() == unitClassGreatGeneralID then return end
			for ID = 0,(plot:GetNumUnits() - 1) do
				local plotUnit = plot:GetUnit(ID)
				if plotUnit and plotUnit:GetUnitType() == unitNonorID then
					unit:SetHasPromotion(promotionNonorID, true)
				end
			end
		end
	end
end
GameEvents.UnitPrekill.Add(GT_Nonor_UnitPreKill)

function GT_Rouran_Nonor_CityCaptureComplete(oldOwnerID, capital, plotX, plotY, newOwnerID, isConquest)
	if not isConquest then return end
	local player = Players[newOwnerID]
	if not HasTrait(player, traitRouranID) then return end
	local plot = g_MapGetPlot(plotX, plotY)
	local city = plot:GetPlotCity()
	local unit = plot:GetUnit()
	if unit and unit:GetUnitType() == unitNonorID then
		unit:SetHasPromotion(promotionNonorID, true)
	end
end
GameEvents.CityCaptureComplete.Add(GT_Rouran_Nonor_CityCaptureComplete)
-----------
-- KHAN --
-----------
function GT_Khan_UnitSetXY(playerID, unitID, unitX, unitY)
	local player = Players[playerID]
	local unit = player:GetUnitByID(unitID)
	local plot = unit:GetPlot()
	if not unit:GetUnitType() == unitKhanID then return end
	if HasTrait(player, traitRouranID) and plot then
		local owner = plot:GetOwner()
		if owner ~= playerID and owner > -1 then
			player:ChangeGoldenAgeProgressMeter(5)
			local playerTeam = Teams[player:GetTeam()]
			local ownerTeam = Teams[Players[owner]:GetTeam()]
			if playerTeam:IsAtWar(ownerTeam) then
				player:ChangeGoldenAgeProgressMeter(5)
				for ID = 0,(plot:GetNumUnits() - 1) do
					local plotUnit = plot:GetUnit(ID)
					if plotUnit and plotUnit:IsCombatUnit() then
						player:ChangeGoldenAgeProgressMeter(5)
					end
				end
			end
		end
	end
end
GameEvents.UnitSetXY.Add(GT_Khan_UnitSetXY)
------------
-- ORTEGE --
------------
local promotionOrtegeID = GameInfoTypes["PROMOTION_GT_ORTEGE"]
function GT_Ortege_UnitSetXY(playerID, unitID, unitX, unitY)
	local player = Players[playerID]
	local unit = player:GetUnitByID(unitID)
	local plot = unit:GetPlot()
	if not player:IsGoldenAge() then return end
	if HasTrait(player, traitMongolID) then
		if plot:GetImprovementType() == improvementOrtegeID then
			if (unit:GetUnitCombatType() == unitCombatMounted) and (not unit:IsHasPromotion(promotionOrtegeID)) then
				unit:ChangeMoves((unit:GetMoves() / 2))
				if unit:IsHurt() then
					unit:ChangeDamage(-(unit:GetDamage() / 2))
				end
				unit:SetHasPromotion(promotionOrtegeID, true)
			end
		end
	end
end
GameEvents.UnitSetXY.Add(GT_Ortege_UnitSetXY)

local improvementPasture = GameInfoTypes["IMPROVEMENT_PASTURE"]
function GT_Ortege_PlayerDoTurn(playerID)
	local player = Players[playerID]
	local numGold = 0
	if not HasTrait(player, traitMongolID) then return end
	local playerTeam = Teams[player:GetTeam()]
	local playerTeamTech = playerTeam:GetTeamTechs()
	if playerTeamTech:HasTech(techCurrencyID) then return end
	for city in player:Cities() do
		for ID = 0, city:GetNumCityPlots()-1, 1 do
			local plot = city:GetCityIndexPlot(ID)
			if plot:GetImprovementType() == improvementOrtegeID then
				for adjacentPlot in PlotAreaSpiralIterator(plot, 1, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
					if (adjacentPlot:IsTradeRoute()) or (adjacentPlot:GetImprovementType() == improvementPasture) then
						numGold = numGold + 3
					end
				end
			end
		end
	end
	player:ChangeGold(numGold)
end
GameEvents.PlayerDoTurn.Add(GT_Ortege_PlayerDoTurn)
--==========================================================================================================================			
--==========================================================================================================================
