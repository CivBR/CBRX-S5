-- FutureLua
-- Author: Bouncymischa
-- CBRX Edit Version: Limaeus + Coiot
--------------------------------------------------------------

print("Future Worlds code is loading")

include("MischaIteratingPlotsFunctions")
include("CityNearbyMapDatasV4")

----------------------------------------------------------------------------------------------------------------------------
-- GLOBAL
----------------------------------------------------------------------------------------------------------------------------

-- Improvements
local improvementAcademy = GameInfoTypes["IMPROVEMENT_ACADEMY"]
local improvementDome = GameInfoTypes["IMPROVEMENT_FW_HYDROPONICS_DOME"]
local improvementFarm = GameInfoTypes["IMPROVEMENT_FARM"]
local improvementFungus = GameInfoTypes["IMPROVEMENT_FW_FUNGAL_GROWTH"]
local improvementGenerator = GameInfoTypes["IMPROVEMENT_FW_GENERATOR"]
local improvementHERC = GameInfoTypes["IMPROVEMENT_FW_HERC"]
local improvementPlantation = GameInfoTypes["IMPROVEMENT_PLANTATION"]
local improvementPreserve = GameInfoTypes["IMPROVEMENT_FW_PRESERVE"]

-- Terrain
local terrainGrasslands = GameInfoTypes["TERRAIN_GRASS"]
local terrainPlains = GameInfoTypes["TERRAIN_PLAINS"]

-- Buildings
local buildingAutoPlantDummy = GameInfoTypes["BUILDING_FW_AUTOPLANT_DUMMY"]
local buildingAutoplant = GameInfoTypes["BUILDING_FW_AUTOPLANT"]
local buildingBrainUploading = GameInfoTypes["BUILDING_FW_BRAIN_UPLOADING"]
local buildingBrainUploadingDummy = GameInfoTypes["BUILDING_FW_BRAIN_UPLOADING_DUMMY_1"]
local buildingDroneHive = GameInfoTypes["BUILDING_FW_DRONE_HIVE"]
local buildingDroneHiveDummy_1 = GameInfoTypes["BUILDING_FW_DRONE_HIVE_DUMMY_1"]
local buildingBiofactory = GameInfoTypes["BUILDING_FW_BIOFACTORY"]
local buildingEctogenesisPod = GameInfoTypes["BUILDING_FW_ECTOGENESIS_POD"]
local buildingGeneJackFacility = GameInfoTypes["BUILDING_FW_GENEJACK_FACILITY"]
local buildingGeneLab = GameInfoTypes["BUILDING_FW_GENE_LAB"]
local buildingGeneLabDummy = GameInfoTypes["BUILDING_FW_GENE_LAB_DUMMY"]
local buildingMycoproteinVats = GameInfoTypes["BUILDING_FW_MYCOPROTEIN_VATS"]
local buildingOrbitalHabitat = GameInfoTypes["BUILDING_FW_ORBITAL_HABITAT"]
local buildingOrbitalHabitatDummy = GameInfoTypes["BUILDING_FW_ORBITAL_HABITAT_DUMMY"]
local buildingSanctuary = GameInfoTypes["BUILDING_FW_SANCTUARY"]
local buildingSanctuaryDummy = GameInfoTypes["BUILDING_FW_SANCTUARY_DUMMY"]
local buildingSolarPlant = GameInfoTypes["BUILDING_SOLAR_PLANT"]
local buildingNetworkBackbone = GameInfoTypes["BUILDING_FW_NETWORK_BACKBONE"]
local buildingTelepresenceHub = GameInfoTypes["BUILDING_FW_TELEPRESENCE_HUB"]
local buildingSimulationServer = GameInfoTypes["BUILDING_FW_SIMULATION_SERVER"]
local buildingFeedsiteHub = GameInfoTypes["BUILDING_FW_FEEDSITE_HUB"]
local buildingDistributionHub = GameInfoTypes["BUILDING_FW_DISTRIBUTION_HUB"]
local buildingMetroplexHub = GameInfoTypes["BUILDING_FW_METROPLEX_HUB"]
local buildingUtilityFog = GameInfoTypes["BUILDING_FW_UTILITY_FOG"]
local buildingVerticalFarm = GameInfoTypes["BUILDING_FW_VERTICAL_FARM"]
local buildingVerticalFarmDummy = GameInfoTypes["BUILDING_FW_VERTICAL_FARM_DUMMY"]
local buildingMenagerie = GameInfoTypes["BUILDING_EE_MENAGERIE"]
local buildingClassServerHub = GameInfoTypes["BUILDINGCLASS_FW_SERVER_HUB"]

-- Wonders
local wonderAccelerator = GameInfoTypes["BUILDING_FW_ACCELERATOR"]
local wonderAngelnet = GameInfoTypes["BUILDING_FW_ANGELNET"]
local wonderAngelnetDummy = GameInfoTypes["BUILDING_FW_ANGELNET_DUMMY"]
local wonderBionicTower = GameInfoTypes["BUILDING_FW_BIONICTOWER"]
local wonderBorehole = GameInfoTypes["BUILDING_FW_BOREHOLE"]
local wonderBuenosAiresForum = GameInfoTypes["BUILDING_FW_BUENOSAIRESFORUM"]
local wonderDataHaven = GameInfoTypes["BUILDING_FW_DATA_HAVEN"]
local wonderDataHavenDummy = GameInfoTypes["BUILDING_FW_DATA_HAVEN_DUMMY"]
local wonderGeneVault = GameInfoTypes["BUILDING_FW_GENE_VAULT"]
local wonderHelios = GameInfoTypes["BUILDING_FW_HELIOS"]
local wonderMnesmosyne = GameInfoTypes["BUILDING_FW_MNEMOSYNE"]
local wonderNephilim = GameInfoTypes["BUILDING_FW_NEPHILIM_GENE_TEMPLATE"]
local wonderNephilimDummy = GameInfoTypes["BUILDING_FW_NEPHILIMGENETEMPLATE_DUMMY"]
local wonderPholusMutagen = GameInfoTypes["BUILDING_FW_PHOLUS_MUTAGEN"]
local wonderShimizu = GameInfoTypes["BUILDING_FW_SHIMIZUMCP"]
local wonderShimizuDummy = GameInfoTypes["BUILDING_FW_SHIMIZUMCP_DUMMY"]
local wonderSkynet = GameInfoTypes["BUILDING_FW_SKYNET"]
local wonderJurassicPark = GameInfoTypes["BUILDING_FW_JURASSIC_PARK"]

-- Wonder Classes
local wonderClassAccelerator = GameInfoTypes["BUILDINGCLASS_FW_ACCELERATOR"]
local wonderClassAngelnet = GameInfoTypes["BUILDINGCLASS_FW_ANGELNET"]
local wonderClassBionicTower = GameInfoTypes["BUILDINGCLASS_FW_BIONICTOWER"]
local wonderClassBorehole = GameInfoTypes["BUILDINGCLASS_FW_BOREHOLE"]
local wonderClassBuenosAiresForum = GameInfoTypes["BUILDINGCLASS_FW_BUENOSAIRESFORUM"]
local wonderClassDataHaven = GameInfoTypes["BUILDINGCLASS_FW_DATA_HAVEN"]
local wonderClassGeneVault = GameInfoTypes["BUILDINGCLASS_FW_GENE_VAULT"]
local wonderClassHelios = GameInfoTypes["BUILDINGCLASS_FW_HELIOS"]
local wonderClassMnemosyne = GameInfoTypes["BUILDINGCLASS_FW_MNEMOSYNE"]
local wonderClassNephilim = GameInfoTypes["BUILDINGCLASS_FW_NEPHILIM_GENE_TEMPLATE"]
local wonderClassPholusMutagen = GameInfoTypes["BUILDINGCLASS_FW_PHOLUS_MUTAGEN"]
local wonderClassShimizu = GameInfoTypes["BUILDINGCLASS_FW_SHIMIZUMCP"]
local wonderClassSkynet = GameInfoTypes["BUILDINGCLASS_FW_SKYNET"]
local wonderClassJurassicPark = GameInfoTypes["BUILDINGCLASS_FW_JURASSIC_PARK"]

-- PreReq Techs
local techGengineering = GameInfoTypes["TECH_GENGINEERING"]

-- Promotions
local promotionBiomods = GameInfoTypes["PROMOTION_FW_BIOMODS"]
local promotionBoostMod = GameInfoTypes["PROMOTION_FW_BOOST_MOD"]
local promotionBoostModEmpty = GameInfoTypes["PROMOTION_FW_BOOST_MOD_EMPTY"]
local promotionBoostMod_1 = GameInfoTypes["PROMOTION_FW_BOOST_MOD_EFFECT_1"]
local promotionBoostMod_2 = GameInfoTypes["PROMOTION_FW_BOOST_MOD_EFFECT_2"]
local promotionBoostMod_3 = GameInfoTypes["PROMOTION_FW_BOOST_MOD_EFFECT_3"]
local promotionEmbarkation_1 = GameInfoTypes["PROMOTION_EMBARKATION"]
local promotionEmbarkation_2 = GameInfoTypes["PROMOTION_DEFENSIVE_EMBARKATION"]
local promotionEmbarkation_3 = GameInfoTypes["PROMOTION_ALLWATER_EMBARKATION"]
local promotionGengineered = GameInfoTypes["PROMOTION_FW_GENGINEERED"]
local promotionStimMod = GameInfoTypes["PROMOTION_FW_STIM_MOD"]
local promotionStimModEmpty = GameInfoTypes["PROMOTION_FW_STIM_MOD_EMPTY"]

-- Units
local unitHydra = GameInfoTypes["UNIT_FW_HYDRA"]
local unitBioTrooper = GameInfoTypes["UNIT_FW_BIOTROOPER"]
local unitSwarm = GameInfoTypes["UNIT_FW_CHIMERA"]
local unitPowerArmor = GameInfoTypes["UNIT_FUTURE_SOLDIER"]
local unitBattlesuit = GameInfoTypes["UNIT_FW_BATTLESUIT"]
local unitGDR = GameInfoTypes["UNIT_MECH"]
local unitTRex = GameInfoTypes["UNIT_FW_TREX"]
local unitRobotInfantry = GameInfoTypes["UNIT_FW_ROBOT_INFANTRY"]

-- Policies
local poBionicTower = GameInfoTypes["POLICY_BIONIC_TOWER"]
local poBionicTowerDummy = GameInfoTypes["POLICY_BIONIC_TOWER_DUMMY"]
local poBorehole = GameInfoTypes["POLICY_BOREHOLE"]
local poBoreholeDummy = GameInfoTypes["POLICY_BOREHOLE_DUMMY"]
local poGeneVault = GameInfoTypes["POLICY_GENE_VAULT"]
local poGeneVaultDummy = GameInfoTypes["POLICY_GENE_VAULT_DUMMY"]
local poHelios = GameInfoTypes["POLICY_HELIOS"]
local poHeliosDummy = GameInfoTypes["POLICY_HELIOS_DUMMY"]

-- Constants
local iAdjacentFungusModifier = 1
local iChanceForFungus = 4
local iChanceDinos = 15

--------------------------------------------------------------------------------------------------------------------------
-- JFD_GetRandom
--------------------------------------------------------------------------------------------------------------------------
function JFD_GetRandom(lower, upper)
	return Game.Rand((upper + 1) - lower, "") + lower
end

----------------------------------------------------------------------------------------------------------------------------
-- Future Worlds Functions
----------------------------------------------------------------------------------------------------------------------------
function CityBuiltTest(iPlayer, iCity, iBuilding, bGold, bFaithOrCulture)
	local player = Players[iPlayer]

	if not player:IsAlive() or not (player:GetCurrentEra() > 5) then
		return
	end

	if iBuilding == wonderAccelerator then
		for pCity in player:Cities() do
			for i = 0, pCity:GetNumCityPlots() - 1, 1 do
				local pPlot = pCity:GetCityIndexPlot(i)
				if pPlot and pPlot:GetOwner() == pCity:GetOwner() and pPlot:GetImprovementType() == improvementAcademy then
					pPlot:SetImprovementType(improvementHERC)
				end
			end
		end
	end

	if iBuilding == buildingBrainUploading then
		local pCity = player:GetCityByID(iCity)
		if pCity:GetNumRealBuilding(buildingBrainUploadingDummy) == 0 then
			local iCityPop = pCity:GetPopulation()
			local iUploadedCitizens = math.floor(iCityPop / 4)
			pCity:ChangePopulation((-1 * iUploadedCitizens), true)
			pCity:SetNumRealBuilding(buildingBrainUploadingDummy, iUploadedCitizens)
		end
	end
end

GameEvents.CityConstructed.Add(CityBuiltTest)

function CheckUploading(iPlotX, iPlotY, iOldPop, iNewPop)
	local pCity = Map.GetPlot(iPlotX, iPlotY):GetPlotCity()

	if pCity:GetNumRealBuilding(buildingBrainUploading) > 0 and iNewPop > 3 and iNewPop > iOldPop then
		if JFD_GetRandom(1, 100) < 25 then
			local iUploadedCitizens = pCity:GetNumRealBuilding(buildingBrainUploadingDummy)
			pCity:ChangePopulation(-1, true)
			iUploadedCitizens = iUploadedCitizens + 1
			pCity:SetNumRealBuilding(buildingBrainUploadingDummy, iUploadedCitizens)
		end
	end
end

GameEvents.SetPopulation.Add(CheckUploading)

function CheckImprovements(iHexX, iHexY, iContinent1, iContinent2)
	local pPlot = Map.GetPlot(ToGridFromHex(iHexX, iHexY))
	local ImpID = pPlot:GetImprovementType()
	local Owner = pPlot:GetOwner()
	local player = Players[Owner]

	if player and ImpID == improvementAcademy and player:GetBuildingClassCount(wonderClassAccelerator) > 0 then
		pPlot:SetImprovementType(improvementHERC)
	end
end

Events.SerialEventImprovementCreated.Add(CheckImprovements)

function FWBuildingImprovementBonuses(iPlayer)
	local player = Players[iPlayer]

	if not player:IsAlive() or not (player:GetCurrentEra() > 5) then
		return
	end

	for pCity in player:Cities() do
		if pCity ~= nil then
			local tNearbyDatas = GetCityMapDatas(pCity)

			if pCity:IsHasBuilding(buildingGeneLab) then
				local iNumFarms = GetNumCityWorkingImprovementPlots(tNearbyDatas, improvementFarm)
				pCity:SetNumRealBuilding(buildingGeneLabDummy, iNumFarms)
			else
				pCity:SetNumRealBuilding(buildingGeneLabDummy, 0)
			end

			if pCity:IsHasBuilding(buildingSanctuary) then
				local iNumPreserves = GetNumCityWorkingImprovementPlots(tNearbyDatas, improvementPreserve)
				pCity:SetNumRealBuilding(buildingSanctuaryDummy, iNumPreserves)
			else
				pCity:SetNumRealBuilding(buildingSanctuaryDummy, 0)
			end

			if pCity:IsHasBuilding(buildingDroneHive) then
				local tGeneratorPlots = GetCityImprovementPlots(tNearbyDatas, improvementGenerator, "Plots")
				local iNumGenerators = #tGeneratorPlots
				pCity:SetNumRealBuilding(buildingDroneHiveDummy_1, iNumGenerators)
			else
				pCity:SetNumRealBuilding(buildingDroneHiveDummy_1, 0)
			end

			if pCity:IsHasBuilding(buildingVerticalFarm) then
				local iNumDomes = GetNumCityWorkingImprovementPlots(tNearbyDatas, improvementDome)
				pCity:SetNumRealBuilding(buildingVerticalFarmDummy, iNumDomes)
			else
				pCity:SetNumRealBuilding(buildingVerticalFarmDummy, 0)
			end
		end
	end
end

GameEvents.PlayerDoTurn.Add(FWBuildingImprovementBonuses)


function FutureTurnBonuses(iPlayer)
	local player = Players[iPlayer]

	if not player:IsAlive() or not (player:GetCurrentEra() > 5) then
		return
	end

	for pCity in player:Cities() do
		-- Autoplant Building
		if pCity:IsHasBuilding(buildingAutoplant) then
			local iNumECommerceServers = math.min(10, player:GetBuildingClassCount(buildingClassECommerceServer))
			pCity:SetNumRealBuilding(buildingAutoPlantDummy, iNumECommerceServers)
		else
			pCity:SetNumRealBuilding(buildingAutoPlantDummy, 0)
		end

		-- Orbital Habitat building
		if pCity:IsHasBuilding(buildingOrbitalHabitat) then
			pCity:SetNumRealBuilding(buildingOrbitalHabitatDummy, 10)
		else
			pCity:SetNumRealBuilding(buildingOrbitalHabitatDummy, 0)
		end
	end
end

GameEvents.PlayerDoTurn.Add(FutureTurnBonuses)


-- CoreHealing, CrawlerEffects, BioModEffects

function FutureTurnUnitEffects(iPlayer)
	local player = Players[iPlayer]

	if not player:IsAlive() or not (player:GetCurrentEra() > 5) then
		return
	end

	for pUnit in player:Units() do
		-- Bio Mod effects
		if pUnit:IsHasPromotion(promotionBoostMod_1) then
			pUnit:SetHasPromotion(promotionBoostMod_1, false)
		end

		if pUnit:IsHasPromotion(promotionBoostMod_2) then
			pUnit:SetHasPromotion(promotionBoostMod_2, false)
			pUnit:SetHasPromotion(promotionBoostMod_1, true)
		end

		if pUnit:IsHasPromotion(promotionBoostMod_3) then
			pUnit:SetHasPromotion(promotionBoostMod_3, false)
			pUnit:SetHasPromotion(promotionBoostMod_2, true)
		end

		if pUnit:IsHasPromotion(promotionBoostMod) then
			if pUnit:GetDamage() > 50 then
				pUnit:SetHasPromotion(promotionBoostMod_1, false)
				pUnit:SetHasPromotion(promotionBoostMod_2, false)
				pUnit:SetHasPromotion(promotionBoostMod_3, true)
				pUnit:SetHasPromotion(promotionBoostMod, false)
				pUnit:SetHasPromotion(promotionBoostModEmpty, true)
			end
		end

		if pUnit:IsHasPromotion(promotionStimMod) then
			if pUnit:GetDamage() > 50 then
				pUnit:ChangeDamage(-40)
				pUnit:SetHasPromotion(promotionStimMod, false)
				pUnit:SetHasPromotion(promotionStimModEmpty, true)
			end
		end

		if pUnit:IsHasPromotion(promotionStimModEmpty) or pUnit:IsHasPromotion(promotionBoostModEmpty) then
			local pPlot = pUnit:GetPlot()
			if pPlot:IsCity() then
				local pCity = pPlot:GetWorkingCity()
				if pCity:IsHasBuilding(iBioModTank) then
					if pUnit:IsHasPromotion(promotionStimModEmpty) then
						pUnit:SetHasPromotion(promotionStimModEmpty, false)
						pUnit:SetHasPromotion(promotionStimMod, true)
					end

					if pUnit:IsHasPromotion(promotionBoostModEmpty) then
						pUnit:SetHasPromotion(promotionBoostModEmpty, false)
						pUnit:SetHasPromotion(promotionBoostMod, true)
					end
				end
			end
		end
	end
end

GameEvents.PlayerDoTurn.Add(FutureTurnUnitEffects)



function BioModReload(iPlayer, iUnit, ePromotion)
	local player = Players[iPlayer]

	if not player:IsAlive() or not (player:GetCurrentEra() > 5) then
		return
	end

	local pUnit = player:GetUnitByID(iUnit)

	if pUnit:IsHasPromotion(promotionStimMod) then
		pUnit:SetHasPromotion(promotionStimModEmpty, false)
	end

	if pUnit:IsHasPromotion(promotionBoostMod) then
		pUnit:SetHasPromotion(promotionBoostModEmpty, false)
	end
end

GameEvents.UnitPromoted.Add(BioModReload)


--==========================================================================================================================
-- WONDERS
--==========================================================================================================================
-- Utility Functions
----------------------------------------------------------------------------------------------------------------------------

function WonderPolicyUtility(playerID, buildingClass, policy, policyDummy)
	local player = Players[playerID]

	if not player:IsAlive() then
		return
	end

	local hasBuilding = player:GetBuildingClassCount(buildingClass) > 0
	local hasPolicy = player:HasPolicy(policy)

	if hasBuilding and not hasPolicy then
		if not player:HasPolicy(policyDummy) then
			player:SetNumFreePolicies(1)
			player:SetNumFreePolicies(0)
		else
			player:SetHasPolicy(policyDummy, false)
		end
		player:SetHasPolicy(policy, true)
	end

	if not hasBuilding and hasPolicy then
		player:SetHasPolicy(policy, false)
		player:SetHasPolicy(policyDummy, true)
	end
end

----------------------------------------------------------------------------------------------------------------------------
-- City Trained Events
----------------------------------------------------------------------------------------------------------------------------
function MnemosyneCityTrained(iPlayer, iCity, iUnitID)
	local player = Players[iPlayer]
	local pUnit = player:GetUnitByID(iUnitID)

	local pCity = player:GetCityByID(iCity)
	if pCity == nil then
		return
	end

	if pCity:IsHasBuilding(wonderMnesmosyne) and pUnit:IsCombatUnit() then
		local iHighestUnitLevel = player:GetHighestUnitLevel()
		local maxXPPerLevel = 15
		local maxXP = 80
		local iNewXP = math.min(maxXP, iHighestUnitLevel * maxXPPerLevel)
		pUnit:ChangeExperience(iNewXP)
	end
end

----------------------------------------------------------------------------------------------------------------------------
-- City Captured Events
----------------------------------------------------------------------------------------------------------------------------
function GeneVaultCityCaptured(iOldOwner, bIsCapital, iX, iY, iNewOwner, iPop, bConquest)
	local pCity = Map.GetPlot(iX, iY):GetPlotCity()
	if pCity:IsHasBuilding(wonderGeneVault) then
		WonderPolicyUtility(iOldOwner, wonderClassGeneVault, poGeneVault, poGeneVaultDummy)
		WonderPolicyUtility(iNewOwner, wonderClassGeneVault, poGeneVault, poGeneVaultDummy)
	end
end

function BionicTowerCityCaptured(iOldOwner, bIsCapital, iX, iY, iNewOwner, iPop, bConquest)
	local pCity = Map.GetPlot(iX, iY):GetPlotCity()
	if pCity:IsHasBuilding(wonderBionicTower) then
		WonderPolicyUtility(iOldOwner, wonderClassBionicTower, poBionicTower, poBionicTowerDummy)
		WonderPolicyUtility(iNewOwner, wonderClassBionicTower, poBionicTower, poBionicTowerDummy)
	end
end

function HeliosCityCaptured(iOldOwner, bIsCapital, iX, iY, iNewOwner, iPop, bConquest)
	local pCity = Map.GetPlot(iX, iY):GetPlotCity()
	if pCity:IsHasBuilding(wonderHelios) then
		WonderPolicyUtility(iOldOwner, wonderClassHelios, poHelios, poHeliosDummy)
		WonderPolicyUtility(iNewOwner, wonderClassHelios, poHelios, poHeliosDummy)
	end
end

function BoreholeCityCaptured(iOldOwner, bIsCapital, iX, iY, iNewOwner, iPop, bConquest)
	local pCity = Map.GetPlot(iX, iY):GetPlotCity()
	if pCity:IsHasBuilding(wonderBorehole) then
		WonderPolicyUtility(iOldOwner, wonderClassBorehole, poBorehole, poBoreholeDummy)
		-- don't do the new owner because this is a national wonder
	end
end

function NephilimCityCaptured(iOldOwner, bIsCapital, iX, iY, iNewOwner, iPop, bConquest)
	local pCity = Map.GetPlot(iX, iY):GetPlotCity()
	if pCity:IsHasBuilding(wonderNephilim) then
		local oldOwner = Players[iOldOwner]
		for city in oldOwner:Cities() do
			city:SetNumRealBuilding(wonderNephilimDummy, 0)
		end
		local newOwner = Players[iNewOwner]
		for city in newOwner:Cities() do
			city:SetNumRealBuilding(wonderNephilimDummy, 1)
		end
	end
end

function AngelnetCityCaptured(iOldOwner, bIsCapital, iX, iY, iNewOwner, iPop, bConquest)
	local pCity = Map.GetPlot(iX, iY):GetPlotCity()
	if pCity:IsHasBuilding(wonderAngelnet) then
		local oldOwner = Players[iOldOwner]
		for city in oldOwner:Cities() do
			city:SetNumRealBuilding(wonderAngelnetDummy, 0)
		end
		local newOwner = Players[iNewOwner]
		for city in newOwner:Cities() do
			if city:IsHasBuilding(buildingUtilityFog) then
				city:SetNumRealBuilding(wonderAngelnetDummy, 1)
			else
				city:SetNumRealBuilding(wonderAngelnetDummy, 0)
			end
		end
	end
end

function DataHavenCityCaptured(iOldOwner, bIsCapital, iX, iY, iNewOwner, iPop, bConquest)
	local pCity = Map.GetPlot(iX, iY):GetPlotCity()
	if pCity:IsHasBuilding(wonderDataHaven) then
		local oldOwner = Players[iOldOwner]
		for city in oldOwner:Cities() do
			city:SetNumRealBuilding(wonderDataHavenDummy, 0)
		end
		local newOwner = Players[iNewOwner]
		for city in newOwner:Cities() do
			if city:IsHasBuilding(wonderDataHaven) then
				local iNumServers = player:GetBuildingClassCount(buildingClassServerHub)
				city:SetNumRealBuilding(wonderDataHavenDummy, iNumServers)
			else
				city:SetNumRealBuilding(wonderDataHavenDummy, 0)
			end
		end
	end
end

function ShimizuCityCaptured(iOldOwner, bIsCapital, iX, iY, iNewOwner, iPop, bConquest)
	local pCity = Map.GetPlot(iX, iY):GetPlotCity()
	if pCity:IsHasBuilding(wonderShimizu) then
		local iBuildingMaintenance = pCity:GetTotalBaseBuildingMaintenance()
		pCity:SetNumRealBuilding(wonderShimizuDummy, iBuildingMaintenance)
	end
end

function SkynetCityCaptured(iOldOwner, bIsCapital, iX, iY, iNewOwner, iPop, bConquest)
	local pCity = Map.GetPlot(iX, iY):GetPlotCity()
	if pCity:IsHasBuilding(wonderSkynet) then
		local oldOwner = Players[iOldOwner]
		local newOwner = Players[iNewOwner]
		for pUnit in oldOwner:Units() do
			if pUnit:GetUnitType() == unitRobotInfantry then
				local iDMG = pUnit:GetDamage()
				local iX = pUnit:GetX()
				local iY = pUnit:GetY()
				pUnit:Kill()
				local nUnit = newOwner:InitUnit(unitRobotInfantry, iX, iY)
				nUnit:SetDamage(iDMG)
			end
		end
	end
end

----------------------------------------------------------------------------------------------------------------------------
-- Player Do Turn Events
----------------------------------------------------------------------------------------------------------------------------
function JurassicParkDoTurn(iPlayer)
	local player = Players[iPlayer]
	if (player:GetBuildingClassCount(wonderClassJurassicPark) > 0) then
		local iCheckForDinos = JFD_GetRandom(1, 50)
		if (iCheckForDinos < iChanceDinos) then
			local tPlots = {}
			for pCity in player:Cities() do
				if pCity:IsHasBuilding(buildingMenagerie) then
					local pCentralPlot = pCity:Plot()
					for pPlot in PlotAreaSpiralIterator(pCentralPlot, 3, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
						local iTerrain = pPlot:GetTerrainType()
						local iOwner = pPlot:GetOwner()
						if (((iTerrain == terrainPlains) or (iTerrain == terrainGrasslands)) and (iOwner == iPlayer) and (pPlot:GetNumUnits() == 0) and not (pPlot:IsMountain())) then
							table.insert(tPlots, pPlot)
						end
					end
				end
			end
			if #tPlots > 0 then
				local randomNumber = JFD_GetRandom(1, #tPlots)
				local tPlot = tPlots[randomNumber]
				local iDinoType = unitTRex
				local teamID = player:GetTeam()
				local pTeam = Teams[teamID]
				if not (pTeam:IsHasTech(techGengineering)) then
					Players[63]:InitUnit(iDinoType, tPlot:GetX(), tPlot:GetY())
				end
			end
		end
	end
end

function PholusMutagenDoTurn(iPlayer)
	local player = Players[iPlayer]
	if player:GetBuildingClassCount(wonderClassPholusMutagen) > 0 then
		for pCity in player:Cities() do
			for i = 0, pCity:GetNumCityPlots() - 1, 1 do
				local pPlot = pCity:GetCityIndexPlot(i)
				if pPlot then
					if pPlot:GetOwner() == pCity:GetOwner() then
						local iImprovement = pPlot:GetImprovementType()
						local iTerrain = pPlot:GetTerrainType()
						if ((iImprovement == improvementFarm) or (iImprovement == improvementPlantation) or (iImprovement == improvementPreserve) or (iImprovement == -1)) and (((iTerrain == terrainPlains) or (iTerrain == terrainGrasslands)) and not (pPlot:IsMountain()) and not (pPlot:IsCity())) then
							local iCheckForFungus = JFD_GetRandom(1, 50)
							local iAdjacentFungusBonus = 0
							local iLocalChanceForFungus = iChanceForFungus

							for loopPlot in PlotAreaSweepIterator(pPlot, 1, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
								if loopPlot then
									if loopPlot:GetImprovementType() == improvementFungus then
										iAdjacentFungusBonus = iAdjacentFungusBonus + iAdjacentFungusModifier
									end
								end
							end

							if iAdjacentFungusBonus > 3 then iAdjacentFungusBonus = 3 end
							iLocalChanceForFungus = iLocalChanceForFungus + iAdjacentFungusBonus

							if (iCheckForFungus < iLocalChanceForFungus) then
								pPlot:SetImprovementType(improvementFungus)
							end
						end
					end
				end
			end
		end
	end
end

function HeliosDoTurn(iPlayer)
	local player = Players[iPlayer]
	if player:GetBuildingClassCount(wonderClassHelios) > 0 then
		local teamID = player:GetTeam()
		local pPlayerTeam = Teams[teamID]
		for pCity in player:Cities() do
			if pCity:GetNumRealBuilding(buildingSolarPlant) > 0 then
				local plot = Map.GetPlot(pCity:GetX(), pCity:GetY())
				for loopPlot in PlotAreaSweepIterator(plot, 1, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
					if loopPlot then
						for iVal = 0, (loopPlot:GetNumUnits() - 1) do
							local loopUnit = loopPlot:GetUnit(iVal)
							if loopUnit:GetOwner() ~= iPlayer then
								local otherTeamID = Players[loopUnit:GetOwner()]:GetTeam()
								if pPlayerTeam:IsAtWar(otherTeamID) then
									loopUnit:ChangeDamage(20)
								end
							end
						end
					end
				end
			end
		end
	end
end

function DataHavenDoTurn(playerID)
	local player = Players[playerID]
	if not player:IsAlive() then return end

	for city in player:Cities() do
		if city:IsHasBuilding(wonderDataHaven) then
			local iNumServers = player:GetBuildingClassCount(buildingClassServerHub)
			city:SetNumRealBuilding(wonderDataHavenDummy, iNumServers)
		else
			city:SetNumRealBuilding(wonderDataHavenDummy, 0)
		end
	end
end

function BuenosAiresForumDoTurn(playerID)
	local player = Players[playerID]
	if not player:IsAlive() then return end
	if player:GetBuildingClassCount(wonderClassBuenosAiresForum) == 0 then return end

	for city in player:Cities() do
		if city:IsHasBuilding(wonderBuenosAiresForum) then
			player:ChangeGoldenAgeProgressMeter(city:GetPopulation())
		end
	end
end

function ShimizuDoTurn(playerID)
	local player = Players[playerID]
	if not player:IsAlive() then return end
	if player:GetBuildingClassCount(wonderClassShimizu) == 0 then return end

	for city in player:Cities() do
		if city:IsHasBuilding(wonderShimizu) then
			local iBuildingMaintenance = city:GetTotalBaseBuildingMaintenance()
			city:SetNumRealBuilding(wonderShimizuDummy, iBuildingMaintenance)
		end
	end
end

----------------------------------------------------------------------------------------------------------------------------
-- Construction Completion Events
----------------------------------------------------------------------------------------------------------------------------
function GeneVaultCompleted(ownerId, cityId, buildingType, bGold, bFaithOrCulture)
	if buildingType == wonderGeneVault then
		WonderPolicyUtility(ownerId, wonderClassGeneVault, poGeneVault, poGeneVaultDummy)
		GameEvents.CityCaptureComplete.Add(GeneVaultCityCaptured)
	end
end

function BionicTowerCompleted(ownerId, cityId, buildingType, bGold, bFaithOrCulture)
	if buildingType == wonderBionicTower then
		WonderPolicyUtility(ownerId, wonderClassBionicTower, poBionicTower, poBionicTowerDummy)
		GameEvents.CityCaptureComplete.Add(BionicTowerCityCaptured)
	end
end

function HeliosCompleted(ownerId, cityId, buildingType, bGold, bFaithOrCulture)
	if buildingType == wonderHelios then
		WonderPolicyUtility(ownerId, wonderClassHelios, poHelios, poHeliosDummy)
		GameEvents.CityCaptureComplete.Add(HeliosCityCaptured)
		GameEvents.PlayerDoTurn.Add(HeliosDoTurn)
	end
end

function BoreholeCompleted(ownerId, cityId, buildingType, bGold, bFaithOrCulture)
	if buildingType == wonderBorehole then
		WonderPolicyUtility(ownerId, wonderClassBorehole, poBorehole, poBoreholeDummy)
		GameEvents.CityCaptureComplete.Add(BoreholeCityCaptured)
	end
end

GameEvents.CityConstructed.Add(BoreholeCompleted) -- national wonder, so need for special world checking

function JurassicParkCompleted(ownerId, cityId, buildingType, bGold, bFaithOrCulture)
	if buildingType == wonderJurassicPark then
		GameEvents.PlayerDoTurn.Add(JurassicParkDoTurn)
	end
end

function MnemosyneCompleted(ownerId, cityId, buildingType, bGold, bFaithOrCulture)
	if buildingType == wonderMnesmosyne then
		GameEvents.CityTrained.Add(MnemosyneCityTrained)
	end
end

function PholusMutagenCompleted(ownerId, cityId, buildingType, bGold, bFaithOrCulture)
	if buildingType == wonderPholusMutagen then
		GameEvents.PlayerDoTurn.Add(PholusMutagenDoTurn)
	end
end

function NephilimCompleted(ownerId, cityId, buildingType, bGold, bFaithOrCulture)
	if buildingType == wonderNephilim then
		local owner = Players[ownerId]
		for city in owner:Cities() do
			city:SetNumRealBuilding(wonderNephilimDummy, 1)
		end
		GameEvents.CityCaptureComplete.Add(NephilimCityCaptured)
	end
end

function AngelnetCompleted(ownerId, cityId, buildingType, bGold, bFaithOrCulture)
	if buildingType == wonderAngelnet then
		local owner = Players[ownerId]
		for city in owner:Cities() do
			if city:IsHasBuilding(buildingUtilityFog) then
				city:SetNumRealBuilding(wonderAngelnetDummy, 1)
			end
		end
		GameEvents.CityCaptureComplete.Add(AngelnetCityCaptured)
	elseif buildingType == buildingUtilityFog then
		local owner = Players[ownerId]
		if owner:GetBuildingClassCount(wonderClassAngelnet) == 0 then return end
		local city = player:GetCityByID(cityId)
		city:SetNumRealBuilding(wonderAngelnetDummy, 1)
	end
end

function DataHavenCompleted(ownerId, cityId, buildingType, bGold, bFaithOrCulture)
	if buildingType == wonderDataHaven then
		local owner = Players[ownerId]
		for city in owner:Cities() do
			if city:IsHasBuilding(wonderDataHaven) then
				local iNumServers = player:GetBuildingClassCount(buildingClassServerHub)
				city:SetNumRealBuilding(wonderDataHavenDummy, iNumServers)
			else
				city:SetNumRealBuilding(wonderDataHavenDummy, 0)
			end
		end
		GameEvents.CityCaptureComplete.Add(DataHavenCityCaptured)
		GameEvents.PlayerDoTurn.Add(DataHavenDoTurn)
	end
end

function BuenosAiresForumCompleted(ownerId, cityId, buildingType, bGold, bFaithOrCulture)
	if buildingType == wonderBuenosAiresForum then
		local player = Players[ownerId]
		local city = player:GetCityByID(cityId)
		player:ChangeGoldenAgeProgressMeter(city:GetPopulation())
		GameEvents.PlayerDoTurn.Add(BuenosAiresForumDoTurn)
	end
end

function ShimizuCompleted(ownerId, cityId, buildingType, bGold, bFaithOrCulture)
	if buildingType == wonderShimizu then
		local owner = Players[ownerId]
		GameEvents.CityCaptureComplete.Add(ShimizuCityCaptured)
		GameEvents.PlayerDoTurn.Add(ShimizuDoTurn)
	end
end

function SkynetCompleted(ownerId, cityId, buildingType, bGold, bFaithOrCulture)
	if buildingType == wonderSkynet then
		GameEvents.CityCaptureComplete.Add(SkynetCityCaptured)
	end
end

----------------------------------------------------------------------------------------------------------------------------
-- Smart Event Hooks
----------------------------------------------------------------------------------------------------------------------------
function CheckAndAddEvent(buildingClass, cityCapturedEvent, cityConstructedEvent, doTurnEvent)
	local completed = false
	for iPlayer = 0, GameDefines.MAX_MAJOR_CIVS - 1 do
		local player = Players[iPlayer]
		if player:IsAlive() then
			if player:GetBuildingClassCount(buildingClass) > 0 then
				GameEvents.CityCaptureComplete.Add(cityCapturedEvent)
				completed = true
			end
		end
	end
	if not completed then
		GameEvents.CityConstructed.Add(cityConstructedEvent)
		GameEvents.PlayerDoTurn.Add(doTurnEvent)
	end
end

CheckAndAddEvent(wonderClassGeneVault, GeneVaultCityCaptured, GeneVaultCompleted, nil)
CheckAndAddEvent(wonderClassBionicTower, BionicTowerCityCaptured, BionicTowerCompleted, nil)
CheckAndAddEvent(wonderClassHelios, HeliosCityCaptured, HeliosCompleted, HeliosDoTurn)
CheckAndAddEvent(wonderClassMnemosyne, MnemosyneCityTrained, MnemosyneCompleted, nil)
CheckAndAddEvent(wonderClassPholusMutagen, PholusMutagenDoTurn, PholusMutagenCompleted, nil)
CheckAndAddEvent(wonderClassJurassicPark, JurassicParkDoTurn, JurassicParkCompleted, nil)
CheckAndAddEvent(wonderClassBorehole, BoreholeCityCaptured, BoreholeCompleted, nil)
CheckAndAddEvent(wonderClassNephilim, NephilimCityCaptured, NephilimCompleted, nil)
CheckAndAddEvent(wonderClassAngelnet, AngelnetCityCaptured, AngelnetCompleted, nil)
CheckAndAddEvent(wonderClassDataHaven, DataHavenCityCaptured, DataHavenCompleted, DataHavenDoTurn)
CheckAndAddEvent(wonderClassBuenosAiresForum, nil, BuenosAiresForumCompleted, BuenosAiresForumDoTurn)
CheckAndAddEvent(wonderClassShimizu, nil, ShimizuCompleted, ShimizuDoTurn)
CheckAndAddEvent(wonderClassSkynet, SkynetCityCaptured, SkynetCompleted, nil)



--==========================================================================================================================
-- MISC
--==========================================================================================================================
-- Requirements and Restrictions
----------------------------------------------------------------------------------------------------------------------------

function CheckUnitRestrictions(iPlayer, iCity, iUnit)
	local player = Players[iPlayer]

	if player:IsAlive() and player:GetCurrentEra() > 5 then
		if iUnit == unitSwarm then
			return player:GetBuildingClassCount(wonderClassPholusMutagen) > 0
		elseif iUnit == unitHydra then
			return player:GetBuildingClassCount(wonderClassPholusMutagen) > 0
		elseif iUnit == unitBioTrooper then
			return player:GetBuildingClassCount(wonderClassPholusMutagen) > 0
		elseif iUnit == unitPowerArmor then
			return player:GetBuildingClassCount(wonderClassMnemosyne) > 0
		elseif iUnit == unitGDR then
			return player:GetBuildingClassCount(wonderClassPholusMutagen) < 1
		elseif iUnit == unitBattlesuit then
			return player:GetBuildingClassCount(wonderClassPholusMutagen) < 1
		elseif iUnit == unitTRex then
			return player:GetBuildingClassCount(wonderClassJurassicPark) > 0
		elseif iUnit == unitRobotInfantry then
			return player:GetBuildingClassCount(wonderClassSkynet) > 0
		end
		return true
	end
	return true
end

GameEvents.CityCanTrain.Add(CheckUnitRestrictions)


function AffinityRestrictedBuildings(iPlayer, iCity, iBuilding)
	local player = Players[iPlayer]
	local pCity = player:GetCityByID(iCity)

	local function hasAnyBuildingFromList(buildingList)
		for _, building in ipairs(buildingList) do
			if pCity:IsHasBuilding(building) then
				return true
			end
		end
		return false
	end

	local function hasAnyAffinityBuilding(buildingList)
		for _, building in ipairs(buildingList) do
			if iBuilding == building then
				return true
			end
		end
		return false
	end

	local verticalFarmList = { buildingVerticalFarm, buildingMycoproteinVats, buildingOrbitalHabitat }
	local biofactoryList = { buildingBiofactory, buildingEctogenesisPod, buildingGeneJackFacility }
	local networkBackboneList = { buildingNetworkBackbone, buildingTelepresenceHub, buildingSimulationServer }
	local feedsiteHubList = { buildingFeedsiteHub, buildingDistributionHub, buildingMetroplexHub }

	if hasAnyAffinityBuilding(verticalFarmList) and hasAnyBuildingFromList(verticalFarmList) then
		return false
	end

	if hasAnyAffinityBuilding(biofactoryList) and hasAnyBuildingFromList(biofactoryList) then
		return false
	end

	if hasAnyAffinityBuilding(networkBackboneList) and hasAnyBuildingFromList(networkBackboneList) then
		return false
	end

	if hasAnyAffinityBuilding(feedsiteHubList) and hasAnyBuildingFromList(feedsiteHubList) then
		return false
	end

	return true
end

GameEvents.CityCanConstruct.Add(AffinityRestrictedBuildings)


----------------------------------------------------------------------------------------------------------------------------
-- Removing Extra Promotions for Nexus
----------------------------------------------------------------------------------------------------------------------------

local uNexus = GameInfoTypes.UNIT_FW_NEXUS

function RemoveUnwantedPromotions(iPlayer, iUnit)
	local player = Players[iPlayer]
	if player then
		local pUnit = player:GetUnitByID(iUnit)
		if pUnit then
			local iUnitType = pUnit:GetUnitType()
			if iUnitType == uNexus then
				pUnit:SetHasPromotion(promotionEmbarkation_1, false)
				pUnit:SetHasPromotion(promotionEmbarkation_2, false)
				pUnit:SetHasPromotion(promotionEmbarkation_3, false)
			elseif iUnitType == unitRobotInfantry then
				pUnit:SetHasPromotion(promotionGengineered, false)
				pUnit:SetHasPromotion(promotionBiomods, false)
			end
		end
	end
end

Events.SerialEventUnitCreated.Add(RemoveUnwantedPromotions)

function RemoveUnwantedPromotions2(iPlayer, iUnit, iX, iY)
	local plot = Map.GetPlot(iX, iY)
	if plot then
		local player = Players[iPlayer]
		local pUnit = player:GetUnitByID(iUnit)
		if pUnit then
			local iUnitType = pUnit:GetUnitType()
			if iUnitType == uNexus then
				pUnit:SetHasPromotion(promotionEmbarkation_1, false)
				pUnit:SetHasPromotion(promotionEmbarkation_2, false)
				pUnit:SetHasPromotion(promotionEmbarkation_3, false)
			elseif iUnitType == unitRobotInfantry then
				pUnit:SetHasPromotion(promotionGengineered, false)
				pUnit:SetHasPromotion(promotionBiomods, false)
			end
		end
	end
end

GameEvents.UnitSetXY.Add(RemoveUnwantedPromotions2)


print("Future Worlds code loaded successfully")
