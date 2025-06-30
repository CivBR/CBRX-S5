WARN_NOT_SHARED = false; include( "SaveUtils" ); MY_MOD_NAME = "tcmJoaoII";
include("PlotIterators")
include("InfoTooltipInclude.lua")
--==========================================================================================================================
--==========================================================================================================================
-- Turns Experience from naval units into Gold
--==========================================================================================================================
function experienceToGold(playerID)
	local player = Players[playerID]
	if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_TCM_AVIS_PORTUGAL"] then
		local totalGoldAwarded = 0
		for unit in player:Units() do 
			if unit:GetDomainType() == DomainTypes["DOMAIN_SEA"] then
				local savedExp = load(unit, "PortugalNavalExperience")
				local exp = unit:GetExperience()
				if savedExp == nil then
					savedExp = 0
				end
				if exp > savedExp then
					local expToGold = exp - savedExp
					totalGoldAwarded = totalGoldAwarded + expToGold
					player:ChangeGold(expToGold)
					save(unit, "PortugalNavalExperience", exp)
				end
			end
		end
		if totalGoldAwarded > 0 then
			if player:IsHuman() then
				Events.GameplayAlertMessage(Locale.ConvertTextKey(totalGoldAwarded) .. " [ICON_GOLD] Gold was gained from the experience of Naval units last turn.")
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(experienceToGold)
--==========================================================================================================================
function portugalExperienceClean(unitOwnerId, unitId, unitType, unitX, unitY, bDelay, eKillingPlayer)
	if bDelay then
		local player = Players[unitOwnerId]
		if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_TCM_AVIS_PORTUGAL"] then
			local unit = player:GetUnitByID(unitId)
			if unit:GetDomainType() == DomainTypes["DOMAIN_SEA"] then
				save(unit, "PortugalNavalExperience", nil)
				save(unit, "tcmTravellingBoat", nil)
			end
		end
	end
end
function portugalExperienceUpgrade(playerId, unitId, newUnitId, bGoodyHut)
	local player = Players[playerId]
	if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_TCM_AVIS_PORTUGAL"] then
		local unit = player:GetUnitByID(unitId)
		if unit:GetDomainType() == DomainTypes["DOMAIN_SEA"] then
			local newUnit = player:GetUnitByID(newUnitId)
			local savedExp = load(unit, "PortugalNavalExperience")
			save(newUnit, "PortugalNavalExperience", savedExp)
			save(unit, "PortugalNavalExperience", nil)
			save(unit, "tcmTravellingBoat", nil)
		end
	end
end
GameEvents.UnitPrekill.Add(portugalExperienceClean)
GameEvents.UnitUpgraded.Add(portugalExperienceUpgrade)
--==========================================================================================================================
-- Yields Culture for purchasing buildings
--==========================================================================================================================
function cultureFromPurchases(ownerId, cityId, buildingType, bGold, bFaithOrCulture)
	if bGold then
		local player = Players[ownerId]
		if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_TCM_AVIS_PORTUGAL"] then
			local city = player:GetCityByID(cityId)
			local plot = city:Plot()
			local building = GameInfo.Buildings[buildingType].Description
			if load(plot, "tcmPortugalPlotHasBuildingEver" .. building) ~= true then
				local culture = math.ceil(GameInfo.Buildings[buildingType].Cost * 0.25)
				player:ChangeJONSCulture(culture)
				if player:IsHuman() then
					Events.GameplayAlertMessage(Locale.ConvertTextKey(culture) .. " [ICON_CULTURE] Culture was gained for purchasing a building")
				end
				save(plot, "tcmPortugalPlotHasBuildingEver" .. building, true) 
			end
		end
	end
end
GameEvents.CityConstructed.Add(cultureFromPurchases)
--==========================================================================================================================
-- Yields experience for researching technologies
--==========================================================================================================================
function experienceFromResearch(eTeam, eTech, iChange)
	local team = Teams[eTeam]
	local playerID = team:GetLeaderID()
	local player = Players[playerID]
	if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_TCM_AVIS_PORTUGAL"] then
		for techFlavor in GameInfo.Technology_Flavors() do
			if GameInfoTypes[techFlavor.TechType] == eTech then
				if techFlavor.FlavorType == "FLAVOR_NAVAL" then
					for unit in player:Units() do
						if unit:GetDomainType() == DomainTypes["DOMAIN_SEA"] and unit:IsCombatUnit() then
							unit:ChangeExperience(10)
						end
					end
					break
				end
			end
		end
	end
end
GameEvents.TeamTechResearched.Add(experienceFromResearch)
--==========================================================================================================================
-- Yields experience for exploring
--==========================================================================================================================
function experienceFromExploring(playerID, unitID, unitX, unitY)
	local player = Players[playerID]
	if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_TCM_AVIS_PORTUGAL"] then
		local unit = player:GetUnitByID(unitID)
		if unit:GetDomainType() == DomainTypes["DOMAIN_SEA"] and unit:IsCombatUnit() then
			local plot = unit:GetPlot()
			if plot then
				if load(plot, "tcmPortugalHasExploredThisPlot?") ~= true then
					if load(unit, "tcmTravellingBoat") == nil then
						save(unit, "tcmTravellingBoat", 1)
					elseif load(unit, "tcmTravellingBoat") == 1 then
						unit:ChangeExperience(1)
						save(unit, "tcmTravellingBoat", nil)
					end
					save(plot, "tcmPortugalHasExploredThisPlot?", true)
				end
			end
		end
	end
end
GameEvents.UnitSetXY.Add(experienceFromExploring)
--==========================================================================================================================
--==========================================================================================================================
--Nau movement share
--==========================================================================================================================
function nauMovementShare(playerID)
	local player = Players[playerID]
	local unitClass = GameInfo.Units["UNIT_PORTUGUESE_NAU"].Class
	if player:GetUnitClassCount(GameInfoTypes[unitClass]) > 0 then
		for unit in player:Units() do
			if unit:GetUnitType() == GameInfoTypes["UNIT_PORTUGUESE_NAU"] then
				local plot = unit:GetPlot()
				local iNumUnits = plot:GetNumUnits()
				for iVal = 0,(iNumUnits - 1) do
					local otherUnit = plot:GetUnit(iVal)
					if otherUnit ~= unit and otherUnit:IsEmbarked() then
						local moves = unit:GetMoves()
						local theirMoves = otherUnit:GetMoves()
						if moves > theirMoves then
							otherUnit:SetMoves(moves)
						end
					end
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(nauMovementShare)
--==========================================================================================================================
-- Nau heal in city-state territory
--==========================================================================================================================
function nauHealInCityState(playerID, unitID, unitX, unitY)
	local player = Players[playerID]
	local unit = player:GetUnitByID(unitID)
	if unit:GetUnitType() == GameInfoTypes["UNIT_PORTUGUESE_NAU"] then
		local plot = unit:GetPlot()
		if plot then
			local otherPlayerID = plot:GetOwner()
			if otherPlayerID then
				local otherPlayer = Players[otherPlayerID]
				if otherPlayer and otherPlayer:IsMinorCiv() then
					unit:SetHasPromotion(GameInfoTypes["PROMOTION_TCM_HEAL_ON_CITY_STATE"], true)
				else
					unit:SetHasPromotion(GameInfoTypes["PROMOTION_TCM_HEAL_ON_CITY_STATE"], false)
				end
			end
		end
	end
end
GameEvents.UnitSetXY.Add(nauHealInCityState)
--==========================================================================================================================
--==========================================================================================================================
--Feitoria garrisoned unit bonus
--==========================================================================================================================
function garrisonedOnFeitoria(playerID)
	local player = Players[playerID]
	if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_TCM_AVIS_PORTUGAL"] then
		local requiredTech = GameInfo.Builds["BUILD_FEITORIA"].PrereqTech
		local teamTechs = Teams[player:GetTeam()]:GetTeamTechs()
		if teamTechs:HasTech(GameInfoTypes[requiredTech]) then
			local totalGarrisonedUnits = 0
			for unit in player:Units() do
				if unit:GetDomainType() == DomainTypes["DOMAIN_LAND"] and unit:IsCombatUnit() then
					local plot = unit:GetPlot()
					if plot and plot:GetImprovementType() == GameInfoTypes["IMPROVEMENT_FEITORIA"] then
						totalGarrisonedUnits = totalGarrisonedUnits + 1
						unit:SetHasPromotion(GameInfoTypes["PROMOTION_TCM_ENTER_CITY_STATE"], true)
					elseif plot then
						unit:SetHasPromotion(GameInfoTypes["PROMOTION_TCM_ENTER_CITY_STATE"], false)
					end
				end
			end
			local capital = player:GetCapitalCity()
			if capital then
				capital:SetNumRealBuilding(GameInfoTypes["BUILDING_TCM_AVIS_PORTUGAL_FEITORIA_GOLD"], totalGarrisonedUnits)
			end
			for city in player:Cities() do
				city:SetNumRealBuilding(GameInfoTypes["BUILDING_TCM_AVIS_PORTUGAL_FEITORIA_EXP"], totalGarrisonedUnits)
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(garrisonedOnFeitoria)

function feitoriaApplyPromotionSameTurn(playerID, unitID, unitX, unitY)
	local player = Players[playerID]
	local unit = player:GetUnitByID(unitID)
	if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_TCM_AVIS_PORTUGAL"] then
		if unit:GetDomainType() == DomainTypes["DOMAIN_LAND"] and unit:IsCombatUnit() then
			local requiredTech = GameInfo.Builds["BUILD_FEITORIA"].PrereqTech
			local teamTechs = Teams[player:GetTeam()]:GetTeamTechs()
			if teamTechs:HasTech(GameInfoTypes[requiredTech]) then
				local plot = unit:GetPlot()
				if plot and plot:GetImprovementType() == GameInfoTypes["IMPROVEMENT_FEITORIA"] then
					unit:SetHasPromotion(GameInfoTypes["PROMOTION_TCM_ENTER_CITY_STATE"], true)
				elseif plot then
					unit:SetHasPromotion(GameInfoTypes["PROMOTION_TCM_ENTER_CITY_STATE"], false)
				end
			end
		end
	end
end
GameEvents.UnitSetXY.Add(feitoriaApplyPromotionSameTurn)
--==========================================================================================================================
--==========================================================================================================================
function spawnWine(ownerId, cityId, buildingType, bGold, bFaithOrCulture)
	local player = Players[ownerId]
	local building = GameInfo.Buildings[buildingType].Description
	if building == 'TXT_KEY_BUILDING_TCM_WINERY' then 
		if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_PORTUGAL"] then
			local city = player:GetCityByID(cityId)
			local plot = city:Plot()
			if load(plot, "tcmPortugalBrazilPlotHasBuildingEver" .. building) ~= true then
				local newPlot
				for loopPlot in PlotAreaSweepIterator(plot, 3, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
					if not(loopPlot:GetTerrainType() == GameInfoTypes["TERRAIN_COAST"]) and not(loopPlot:GetTerrainType() == GameInfoTypes["TERRAIN_OCEAN"]) and not(loopPlot:GetTerrainType() == GameInfoTypes["TERRAIN_MOUNTAIN"]) then
						if loopPlot:GetResourceType() == -1 and loopPlot:GetImprovementType() == -1 and loopPlot:GetOwner() == ownerId and not(loopPlot:IsCity()) then
							newPlot = loopPlot
							break
						end
					end
				end
				if not(newPlot) then
					for loopPlot in PlotAreaSweepIterator(plot, 3, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
						if not(loopPlot:GetTerrainType() == GameInfoTypes["TERRAIN_COAST"]) and not(loopPlot:GetTerrainType() == GameInfoTypes["TERRAIN_OCEAN"]) and not(loopPlot:GetTerrainType() == GameInfoTypes["TERRAIN_MOUNTAIN"]) then
							if loopPlot:GetResourceType() == -1 and loopPlot:GetOwner() == ownerId and not(loopPlot:IsCity()) then
								newPlot = loopPlot
								break
							end
						end
					end
				end
				if newPlot then
					newPlot:SetResourceType(GameInfoTypes["RESOURCE_WINE"], 1)
					if not(newPlot:GetImprovementType() == GameInfoTypes["IMPROVEMENT_CITADEL"]) and not(newPlot:GetImprovementType() == GameInfoTypes["IMPROVEMENT_ACADEMY"]) and not(newPlot:GetImprovementType() == GameInfoTypes["IMPROVEMENT_CUSTOMS_HOUSE"]) and not(newPlot:GetImprovementType() == GameInfoTypes["IMPROVEMENT_MANUFACTORY"]) and not(newPlot:GetImprovementType() == GameInfoTypes["IMPROVEMENT_LANDMARK"]) and not(newPlot:GetImprovementType() == GameInfoTypes["IMPROVEMENT_HOLY_SITE"]) then
						newPlot:SetImprovementType(GameInfoTypes["IMPROVEMENT_PLANTATION"])
					end
				end
				save(plot, "tcmPortugalBrazilPlotHasBuildingEver" .. building, true) 
			end
		end
	end
end
GameEvents.CityConstructed.Add(spawnWine)

function extraWine(playerID)
	local player = Players[playerID]
	if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_PORTUGAL"] then
		if Teams[player:GetTeam()]:GetDefensivePactCount() > 0 then
			for city in player:Cities() do
				if city:IsHasBuilding(GameInfoTypes["BUILDING_TCM_WINERY"]) then
					local plot = city:Plot()
					if load(plot, "tcmCityHasSpanwedWine") ~= true then
						local newPlot
						for loopPlot in PlotAreaSweepIterator(plot, 3, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
							if not(loopPlot:GetTerrainType() == GameInfoTypes["TERRAIN_COAST"]) and not(loopPlot:GetTerrainType() == GameInfoTypes["TERRAIN_OCEAN"]) and not(loopPlot:GetTerrainType() == GameInfoTypes["TERRAIN_MOUNTAIN"]) then
								if loopPlot:GetResourceType() == -1 and loopPlot:GetImprovementType() == -1 and loopPlot:GetOwner() == playerID and not(loopPlot:IsCity()) then
									newPlot = loopPlot
									break
								end
							end
						end
						if not(newPlot) then
							for loopPlot in PlotAreaSweepIterator(plot, 3, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
								if not(loopPlot:GetTerrainType() == GameInfoTypes["TERRAIN_COAST"]) and not(loopPlot:GetTerrainType() == GameInfoTypes["TERRAIN_OCEAN"]) and not(loopPlot:GetTerrainType() == GameInfoTypes["TERRAIN_MOUNTAIN"]) then
									if loopPlot:GetResourceType() == -1 and loopPlot:GetOwner() == playerID and not(loopPlot:IsCity()) then
										newPlot = loopPlot
										break
									end
								end
							end
						end
						if newPlot then
							newPlot:SetResourceType(GameInfoTypes["RESOURCE_WINE"], 1)
							if not(newPlot:GetImprovementType() == GameInfoTypes["IMPROVEMENT_CITADEL"]) and not(newPlot:GetImprovementType() == GameInfoTypes["IMPROVEMENT_ACADEMY"]) and not(newPlot:GetImprovementType() == GameInfoTypes["IMPROVEMENT_CUSTOMS_HOUSE"]) and not(newPlot:GetImprovementType() == GameInfoTypes["IMPROVEMENT_MANUFACTORY"]) and not(newPlot:GetImprovementType() == GameInfoTypes["IMPROVEMENT_LANDMARK"]) and not(newPlot:GetImprovementType() == GameInfoTypes["IMPROVEMENT_HOLY_SITE"]) then
								newPlot:SetImprovementType(GameInfoTypes["IMPROVEMENT_PLANTATION"])
							end
						end
						save(plot, "tcmCityHasSpanwedWine", true)
					end
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(extraWine)
--==========================================================================================================================
local promotionID = GameInfoTypes["PROMOTION_TCM_DOUBLE_XP"]

function unit1(playerID)
	local player = Players[playerID]
	local unitClass = GameInfo.Units["UNIT_TCM_CACADOR"].Class
	if load(player, "tcmDoThisUBITCH") == true and player:GetUnitClassCount(GameInfoTypes[unitClass]) > 0 then
		for unit in player:Units() do
			if unit:IsHasPromotion(promotionID) then
				unit:SetHasPromotion(promotionID, false)
			end
			if unit:GetUnitType() == GameInfoTypes["UNIT_TCM_CACADOR"] then
				local plot = unit:GetPlot()
				unit:SetHasPromotion(promotionID, false)
				for loopPlot in PlotAreaSweepIterator(plot, 2, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
					for i = 0, loopPlot:GetNumUnits() - 1, 1 do  
						local otherUnit = loopPlot:GetUnit(i)
						if otherUnit and otherUnit:GetOwner() ~= playerID and otherUnit:IsHasPromotion(GameInfoTypes["PROMOTION_GREAT_GENERAL"]) then
							if player:IsDoF(otherUnit:GetOwner()) then
								unit:SetHasPromotion(promotionID, true)
								break
							end
						end
					end
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(unit1)

function unit2(playerID, unitID, unitX, unitY)
	local player = Players[playerID]
	local unit = player:GetUnitByID(unitID)
	if unit:GetUnitType() == GameInfoTypes["UNIT_TCM_CACADOR"] then
		save(player, "tcmDoThisUBITCH", true)
		local plot = unit:GetPlot()
		unit:SetHasPromotion(promotionID, false)
		for loopPlot in PlotAreaSweepIterator(plot, 2, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
			for i = 0, loopPlot:GetNumUnits() - 1, 1 do  
				local otherUnit = loopPlot:GetUnit(i)
				if otherUnit and otherUnit:GetOwner() ~= playerID and otherUnit:IsHasPromotion(GameInfoTypes["PROMOTION_GREAT_GENERAL"]) then
					if player:IsDoF(otherUnit:GetOwner()) then
						unit:SetHasPromotion(promotionID, true)
						break
					end
				end
			end
		end
	end
end
GameEvents.UnitSetXY.Add(unit2)
--==========================================================================================================================
local happyDummy = GameInfoTypes["BUILDING_TCM_PORTUGAL_HAPPY_DUMMY"]
local foodDummy = GameInfoTypes["BUILDING_TCM_PORTUGAL_FOOD_DUMY"]

function continentHappiness(playerID)
	local player = Players[playerID]
	if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_PORTUGAL"] then
		local capital = player:GetCapitalCity()
		local capitalPlot = capital:Plot()
		if load(player,"getOriginalContinent") == nil then
			save(player,"getOriginalContinent", (capitalPlot:GetContinentArtType()))
		end
		for city in player:Cities() do
			if not(city:IsCapital()) then
				local plot = city:Plot()
				if plot:GetContinentArtType() == capitalPlot:GetContinentArtType() then
					city:SetNumRealBuilding(happyDummy, 1)
				end
			else
				if load(player,"tcmLastCapitalSize") then
					if city:GetPopulation() >= load(player,"tcmLastCapitalSize") then
						city:SetNumRealBuilding(foodDummy, 0)
					end
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(continentHappiness)
--==========================================================================================================================
-- UI FUNCTIONS
-- This code was adapted from JFD's Sardinia-Piedmont, thus it has his name all around.
--==========================================================================================================================
local isCityViewOpen = false
----------------------------------------------------------------------------------------------------------------------------
-- JFD_UpdatePurchaseOptions
----------------------------------------------------------------------------------------------------------------------------
function JFD_UpdatePurchaseOptions()
	Controls.UnitBackground:SetHide(true)
	Controls.UnitButton:SetDisabled(true)
	Controls.UnitButton:LocalizeAndSetToolTip(nil)
	local city = UI.GetHeadSelectedCity()
	if city then
		local playerID = city:GetOwner()
		local player = Players[playerID]
		if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_PORTUGAL"] then
			local plot = city:Plot()
			local originalContinent = load(player,"getOriginalContinent")
			if originalContinent then
				if city:IsOriginalCapital() or plot:GetContinentArtType() ~= originalContinent then
					if not(city:IsCapital()) then
						local unitButtonText = Locale.ConvertTextKey("TXT_KEY_TCM_CLICK_TO_CHANGE_CAPITAL")
						local toolTip = Locale.ConvertTextKey("TXT_KEY_TCM_CHANGE_CAPITAL_TOOLTIP")
						Controls.UnitButton:SetDisabled(false)
						Controls.UnitButton:SetText(unitButtonText)
						Controls.UnitBackground:SetHide(false)
						Controls.UnitButton:LocalizeAndSetToolTip(toolTip)
					end
				end
			end
		end
	end
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_OnPurchase
----------------------------------------------------------------------------------------------------------------------------
function JFD_OnClick()
	local city = UI.GetHeadSelectedCity();
	if city then
		local player = Players[city:GetOwner()]
		local oldCapital = player:GetCapitalCity()
		local pop = oldCapital:GetPopulation()
		save(player,"tcmLastCapitalSize", pop)
		oldCapital:SetNumRealBuilding(GameInfoTypes["BUILDING_TCM_PORTUGAL_FOOD_DUMY"], 0)

		local greatWorkIndex = oldCapital:GetBuildingGreatWork(GameInfoTypes["BUILDINGCLASS_PALACE"], 0)
		local tempArtClassID = GameInfoTypes.BUILDINGCLASS_TCM_TEMP_ART_HOLDER
		local tempArtID = GameInfoTypes.BUILDING_TCM_TEMP_ART_HOLDER
		local bSwap = false
		if (greatWorkIndex > -1) then
			city:SetNumRealBuilding(tempArtID, 1)
			Network.SendMoveGreatWorks((city:GetOwner()), oldCapital:GetID(), GameInfoTypes["BUILDINGCLASS_PALACE"], 0, city:GetID(), tempArtClassID, 0)
			bSwap = true
		end

		oldCapital:SetNumRealBuilding(GameInfoTypes["BUILDING_PALACE"], 0)
		city:SetNumRealBuilding(GameInfoTypes["BUILDING_PALACE"], 1)

		if bSwap then
			Network.SendMoveGreatWorks((city:GetOwner()), city:GetID(), tempArtClassID, 0, city:GetID(), GameInfoTypes["BUILDINGCLASS_PALACE"], 0)
			city:SetNumRealBuilding(tempArtID, 0)
		end

		if pop > city:GetPopulation() then
			city:SetNumRealBuilding(GameInfoTypes["BUILDING_TCM_PORTUGAL_FOOD_DUMY"], 1)
		end
	end
	JFD_UpdatePurchaseOptions()
end
Controls.UnitButton:RegisterCallback(Mouse.eLClick, JFD_OnClick)
----------------------------------------------------------------------------------------------------------------------------
-- JFD_OnEnterCityScreen
----------------------------------------------------------------------------------------------------------------------------
function JFD_OnEnterCityScreen()
	isCityViewOpen = true
	JFD_UpdatePurchaseOptions()
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_OnExitCityScreen
----------------------------------------------------------------------------------------------------------------------------
function JFD_OnExitCityScreen()
	isCityViewOpen = false
	JFD_UpdatePurchaseOptions()
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_OnNextCityScren
----------------------------------------------------------------------------------------------------------------------------
function JFD_OnNextCityScren()
	if isCityViewOpen then
		JFD_UpdatePurchaseOptions()
	end
end
Events.SerialEventEnterCityScreen.Add(JFD_OnEnterCityScreen)
Events.SerialEventExitCityScreen.Add(JFD_OnExitCityScreen)
Events.SerialEventCityScreenDirty.Add(JFD_OnNextCityScren)
--==========================================================================================================================
--==========================================================================================================================
function scienceForBuilding(ownerId, cityId, buildingType, bGold, bFaithOrCulture)
	local player = Players[ownerId]
	if player:HasPolicy(GameInfoTypes["POLICY_TCM_PORTUGAL_BRAZIL_PREFAB"]) then
		local tech = player:GetCurrentResearch()
		if tech then
			local pTeamTechs = Teams[player:GetTeam()]:GetTeamTechs()
			if not(pTeamTechs:HasTech(tech)) then 
				local science = math.ceil(7 * (player:GetCurrentEra() + 1))
				pTeamTechs:ChangeResearchProgress(tech, science, ownerId)
			end
		end
	end
end
GameEvents.CityConstructed.Add(scienceForBuilding)