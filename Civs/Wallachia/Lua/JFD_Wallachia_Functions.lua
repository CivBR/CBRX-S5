-- JFD_Wallachia_Functions
-- Author: JFD
-- DateCreated: 2/21/2014 12:13:46 AM
--==========================================================================================================================
-- INCLUDES
--==========================================================================================================================
include("PlotIterators")
--==========================================================================================================================
-- UTILITY FUNCTIONS
--==========================================================================================================================
-- GLOBALS
----------------------------------------------------------------------------------------------------------------------------
--IsCPDLL
function IsCPDLL()
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if mod.ID == "d1b6328c-ff44-4b0d-aad7-c657f83610cd" then
			return true
		end
	end
	return false
end
local isCPDLL = IsCPDLL()

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
----------------------------------------------------------------------------------------------------------------------------
-- UNIQUE 
----------------------------------------------------------------------------------------------------------------------------
--JFD_Wallachia_GetNumPillagedTiles
function JFD_Wallachia_GetNumPillagedTiles(playerID, city)
	local numPillagedTiles = 0
	local plot = Map.GetPlot(city:GetX(), city:GetY())
	for loopPlot in PlotAreaSpiralIterator(plot, 3, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
		if (loopPlot:GetOwner() == playerID and loopPlot:IsImprovementPillaged() or loopPlot:IsRoutePillaged()) then
			numPillagedTiles = numPillagedTiles + 1
		end
	end
	return numPillagedTiles
end
--==========================================================================================================================
-- UNIQUE FUNCTIONS
--==========================================================================================================================
-- GLOBAL
----------------------------------------------------------------------------------------------------------------------------
local traitWallachiaID = GameInfoTypes["TRAIT_JFD_WALLACHIA"]
----------------------------------------------------------------------------------------------------------------------------
-- HOUSE OF DRACUL
----------------------------------------------------------------------------------------------------------------------------
--JFD_Wallachia_HouseOfDracul_PlayerDoTurn
local buildingWallachiaID = GameInfoTypes["BUILDING_JFD_WALLACHIA"]
function JFD_Wallachia_HouseOfDracul_PlayerDoTurn(playerID)
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	if (not HasTrait(player, traitWallachiaID)) then return end
	for city in player:Cities() do
		local plot = Map.GetPlot(city:GetX(), city:GetY())
		local numPillagedTiles = JFD_Wallachia_GetNumPillagedTiles(playerID, city)
		if city:GetResistanceTurns() > 0 then
			city:ChangeResistanceTurns(-numPillagedTiles)
		end
		if city:IsRazing() then
			city:ChangeRazingTurns(-numPillagedTiles)
		end
		local unitProduction = city:GetProductionUnit()
		if unitProduction > -1 then
			for row in GameInfo.Trait_YieldChangesFromPillagedTiles("TraitType = 'TRAIT_JFD_WALLACHIA'") do
				numPillagedTiles = numPillagedTiles * row.Yield
			end
		else
			numPillagedTiles = 0
		end	
		city:SetNumRealBuilding(buildingWallachiaID, numPillagedTiles)
	end
end 
GameEvents.PlayerDoTurn.Add(JFD_Wallachia_HouseOfDracul_PlayerDoTurn)

--JFD_Wallachia_HouseOfDracul_CityTrained
function JFD_Wallachia_HouseOfDracul_CityTrained(playerID, cityID, unitID)
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	if (not HasTrait(player, traitWallachiaID)) then return end
	local unit = player:GetUnitByID(unitID)
	if (not unit:IsCombatUnit()) then return end
	local city = player:GetCityByID(cityID)
	local numPillagedTiles = (JFD_Wallachia_GetNumPillagedTiles(playerID, city)*2)
	unit:ChangeExperience(numPillagedTiles)
end
GameEvents.CityTrained.Add(JFD_Wallachia_HouseOfDracul_CityTrained)
----------------------------------------------------------------------------------------------------------------------------
-- FORTIFIED CHURCH
----------------------------------------------------------------------------------------------------------------------------	
--JFD_Wallachia_FortifiedChurch_playerDoTurn
local buildingFortifiedChurchID  = GameInfoTypes["BUILDING_JFD_FORTIFIED_CHURCH"]
local promotionFortifiedChurchID = GameInfoTypes["PROMOTION_JFD_FORTIFIED_CHURCH"]
function JFD_Wallachia_FortifiedChurch_playerDoTurn(playerID)
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	for unit in player:Units() do
		local plot = Map.GetPlot(unit:GetX(), unit:GetY())
		if (plot and plot:IsCityRadius() and plot:GetOwner() > -1 and plot:GetOwner() ~= playerID and unit:IsCombatUnit()) then
			local isValidPromotion = false
			if HasTrait(Players[plot:GetOwner()], traitWallachiaID) then
				for loopPlot in PlotAreaSpiralIterator(plot, 2, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
					if (loopPlot:GetPlotCity() and loopPlot:GetPlotCity():IsHasBuilding(buildingFortifiedChurchID)) then
						isValidPromotion = true
					end
				end
			end
			if isValidPromotion then
				if (not unit:IsHasPromotion(promotionFortifiedChurchID)) then
					unit:SetHasPromotion(promotionFortifiedChurchID, true)
				end
			else
				if unit:IsHasPromotion(promotionFortifiedChurchID) then
					unit:SetHasPromotion(promotionFortifiedChurchID, false)
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(JFD_Wallachia_FortifiedChurch_playerDoTurn)
----------------------------------------------------------------------------------------------------------------------------
-- LEFEGII
----------------------------------------------------------------------------------------------------------------------------
--JFD_Wallacahia_Lefegii_PlayerDoTurn
local improvementFarmID				 = GameInfoTypes["IMPROVEMENT_FARM"] or 0
local improvementTownID				 = GameInfoTypes["IMPROVEMENT_JFD_TOWN"] or 0
local improvementTradingPostID		 = GameInfoTypes["IMPROVEMENT_TRADING_POST"] or 0
local improvementTradingPost2ID		 = GameInfoTypes["IMPROVEMENT_JFD_TRADING_POST"] or 0
local improvementVillageID			 = GameInfoTypes["IMPROVEMENT_JFD_VILLAGE"] or 0
local promotionLefegiiHealID		 = GameInfoTypes["PROMOTION_JFD_LEFEGII_HEAL"]
local promotionLefegiiHealActiveID	 = GameInfoTypes["PROMOTION_JFD_LEFEGII_HEAL_ACTIVE"]
local improvements	= {improvementFarmID, improvementTownID, improvementTradingPostID, improvementTradingPost2ID, improvementVillageID}
function JFD_Wallacahia_Lefegii_PlayerDoTurn(playerID)
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	for unit in player:Units() do
		if (unit:IsHasPromotion(promotionLefegiiHealID) or unit:IsHasPromotion(promotionLefegiiHealActiveID)) then
			local isOnValidImprovement = false
			local plot = Map.GetPlot(unit:GetX(), unit:GetY()) 
			if (plot:IsImprovementPillaged() and plot:GetImprovementType() > -1) then
				for _, improvementID in pairs(improvements) do
					if (improvementID and plot:GetImprovementType() == improvementID) then
						isOnValidImprovement = true
						break
					end
				end
			end
			if isOnValidImprovement then
				if unit:IsHasPromotion(promotionLefegiiHealID) then
					unit:SetHasPromotion(promotionLefegiiHealID, false)
					unit:SetHasPromotion(promotionLefegiiHealActiveID, true)
					unit:ChangeDamage(-10)
				end
			else
				if unit:IsHasPromotion(promotionLefegiiHealActiveID) then
					unit:SetHasPromotion(promotionLefegiiHealID, true)
					unit:SetHasPromotion(promotionLefegiiHealActiveID, false)
				end
			end
		end
	end
end 
GameEvents.PlayerDoTurn.Add(JFD_Wallacahia_Lefegii_PlayerDoTurn)
--==========================================================================================================================
--==========================================================================================================================	






