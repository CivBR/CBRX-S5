-- Game Defines for the Lanfang Republic by PorkBean
--==========================================================================================================================
-- CIVILIZATIONS
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Civilizations
		(Type,						Description,					ShortDescription,						Adjective,							Civilopedia,						CivilopediaTag,				DefaultPlayerColor,			ArtDefineTag,	ArtStyleType,  ArtStyleSuffix,	ArtStylePrefix,	IconAtlas,					PortraitIndex,	AlphaIconAtlas,				SoundtrackTag,	MapImage,			DawnOfManQuote,					DawnOfManImage)
SELECT	'CIVILIZATION_PB_LANFANG',	'TXT_KEY_CIV_PB_LANFANG_DESC',	'TXT_KEY_CIV_PB_LANFANG_SHORT_DESC',	'TXT_KEY_CIV_PB_LANFANG_ADJECTIVE',	'TXT_KEY_PEDIA_PB_LANFANG_TEXT',	'TXT_KEY_PEDIA_PB_LANFANG',	'PLAYERCOLOR_PB_LANFANG',	ArtDefineTag,	ArtStyleType,  ArtStyleSuffix,	ArtStylePrefix,	'PB_LANFANG_ICON_ATLAS',	0,				'PB_LANFANG_ALPHA_ATLAS',	SoundtrackTag,	'LanfangMap.dds',	'TXT_KEY_DAWN_PB_LANFANG_TEXT',	'Lanfang_DOM.dds'
FROM Civilizations WHERE Type = 'CIVILIZATION_CHINA';
--------------------------------------------------------------------------------------------------------------------------
-- Civilization_CityNames
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Civilization_CityNames
          (CivilizationType,			CityName)
VALUES    ('CIVILIZATION_PB_LANFANG',	'TXT_KEY_CITY_NAME_PB_LANFANG_1'),
          ('CIVILIZATION_PB_LANFANG',	'TXT_KEY_CITY_NAME_PB_LANFANG_2'),
          ('CIVILIZATION_PB_LANFANG',	'TXT_KEY_CITY_NAME_PB_LANFANG_3'),
          ('CIVILIZATION_PB_LANFANG',	'TXT_KEY_CITY_NAME_PB_LANFANG_4'),
          ('CIVILIZATION_PB_LANFANG',	'TXT_KEY_CITY_NAME_PB_LANFANG_5'),
          ('CIVILIZATION_PB_LANFANG',	'TXT_KEY_CITY_NAME_PB_LANFANG_6'),
          ('CIVILIZATION_PB_LANFANG',	'TXT_KEY_CITY_NAME_PB_LANFANG_7'),
          ('CIVILIZATION_PB_LANFANG',	'TXT_KEY_CITY_NAME_PB_LANFANG_8'),
          ('CIVILIZATION_PB_LANFANG',	'TXT_KEY_CITY_NAME_PB_LANFANG_9'),
          ('CIVILIZATION_PB_LANFANG',	'TXT_KEY_CITY_NAME_PB_LANFANG_10'),
          ('CIVILIZATION_PB_LANFANG',	'TXT_KEY_CITY_NAME_PB_LANFANG_11'),
          ('CIVILIZATION_PB_LANFANG',	'TXT_KEY_CITY_NAME_PB_LANFANG_12'),
          ('CIVILIZATION_PB_LANFANG',	'TXT_KEY_CITY_NAME_PB_LANFANG_13'),
          ('CIVILIZATION_PB_LANFANG',	'TXT_KEY_CITY_NAME_PB_LANFANG_14'),
          ('CIVILIZATION_PB_LANFANG',	'TXT_KEY_CITY_NAME_PB_LANFANG_15'),
          ('CIVILIZATION_PB_LANFANG',	'TXT_KEY_CITY_NAME_PB_LANFANG_16'),
          ('CIVILIZATION_PB_LANFANG',	'TXT_KEY_CITY_NAME_PB_LANFANG_17'),
          ('CIVILIZATION_PB_LANFANG',	'TXT_KEY_CITY_NAME_PB_LANFANG_18'),
          ('CIVILIZATION_PB_LANFANG',	'TXT_KEY_CITY_NAME_PB_LANFANG_19'),
          ('CIVILIZATION_PB_LANFANG',	'TXT_KEY_CITY_NAME_PB_LANFANG_20');
--------------------------------------------------------------------------------------------------------------------------
-- Civilization_FreeBuildingClasses
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Civilization_FreeBuildingClasses
		(CivilizationType,			BuildingClassType)
SELECT	'CIVILIZATION_PB_LANFANG',	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE CivilizationType = 'CIVILIZATION_CHINA';
--------------------------------------------------------------------------------------------------------------------------
-- Civilization_FreeTechs
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Civilization_FreeTechs
		(CivilizationType,			TechType)
SELECT	'CIVILIZATION_PB_LANFANG',	TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_CHINA';
--------------------------------------------------------------------------------------------------------------------------
-- Civilization_FreeUnits
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Civilization_FreeUnits
		(CivilizationType,			UnitClassType,	Count,	UnitAIType)
SELECT	'CIVILIZATION_PB_LANFANG',	UnitClassType,	Count,	UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_CHINA';
--------------------------------------------------------------------------------------------------------------------------
-- Civilization_Leaders
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Civilization_Leaders
       (CivilizationType,			LeaderheadType)
VALUES ('CIVILIZATION_PB_LANFANG',	'LEADER_PB_LUO_FANGBO');
--------------------------------------------------------------------------------------------------------------------------
-- Civilization_UnitClassOverrides
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Civilization_UnitClassOverrides
		(CivilizationType,			UnitClassType,		UnitType)
VALUES	('CIVILIZATION_PB_LANFANG',	'UNITCLASS_SCOUT',	'UNIT_PB_LANSAAI');
--------------------------------------------------------------------------------------------------------------------------
-- Civilization_BuildingClassOverrides
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Civilization_BuildingClassOverrides
		(CivilizationType,			BuildingClassType,		BuildingType)
VALUES	('CIVILIZATION_PB_LANFANG',	'BUILDINGCLASS_MINT',	'BUILDING_PB_ZONGTING');
--------------------------------------------------------------------------------------------------------------------------
-- Civilization_Religions
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Civilization_Religions
		(CivilizationType,			ReligionType)
VALUES	('CIVILIZATION_PB_LANFANG',	'RELIGION_CONFUCIANISM');
--------------------------------------------------------------------------------------------------------------------------
-- Civilization_Start_Region_Priority
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Civilization_Start_Region_Priority
		(CivilizationType,			RegionType)
VALUES	('CIVILIZATION_PB_LANFANG',	'REGION_JUNGLE');
--------------------------------------------------------------------------------------------------------------------------
-- Civilization_SpyNames
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Civilization_SpyNames
		(CivilizationType,			SpyName)
VALUES	('CIVILIZATION_PB_LANFANG',	'TXT_KEY_SPY_NAME_PB_LANFANG_1'),
		('CIVILIZATION_PB_LANFANG',	'TXT_KEY_SPY_NAME_PB_LANFANG_2'),
		('CIVILIZATION_PB_LANFANG',	'TXT_KEY_SPY_NAME_PB_LANFANG_3'),
		('CIVILIZATION_PB_LANFANG',	'TXT_KEY_SPY_NAME_PB_LANFANG_4'),
		('CIVILIZATION_PB_LANFANG',	'TXT_KEY_SPY_NAME_PB_LANFANG_5'),
		('CIVILIZATION_PB_LANFANG',	'TXT_KEY_SPY_NAME_PB_LANFANG_6'),
		('CIVILIZATION_PB_LANFANG',	'TXT_KEY_SPY_NAME_PB_LANFANG_7'),
		('CIVILIZATION_PB_LANFANG',	'TXT_KEY_SPY_NAME_PB_LANFANG_8'),
		('CIVILIZATION_PB_LANFANG',	'TXT_KEY_SPY_NAME_PB_LANFANG_9'),
		('CIVILIZATION_PB_LANFANG',	'TXT_KEY_SPY_NAME_PB_LANFANG_10');
--==========================================================================================================================
-- LEADERS
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
-- Leaders
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Leaders
		(Type,						Description,					Civilopedia,								CivilopediaTag,							ArtDefineTag,		VictoryCompetitiveness,	WonderCompetitiveness,	MinorCivCompetitiveness,	Boldness,	DiploBalance,	WarmongerHate,	DenounceWillingness,	DoFWillingness,	Loyalty,	Neediness,	Forgiveness,	Chattiness,	Meanness,	IconAtlas,					PortraitIndex)
VALUES	('LEADER_PB_LUO_FANGBO',	'TXT_KEY_LEADER_PB_LUO_FANGBO',	'TXT_KEY_LEADER_PB_LUO_FANGBO_PEDIA_TEXT',	'TXT_KEY_LEADER_PB_LUO_FANGBO_PEDIA',	'Fangbo_Scene.xml',	5,						4,						8,							6,			7,				8,				5,						6,				6,			4,			6,				6,			5,			'PB_LANFANG_ICON_ATLAS',	1);
--------------------------------------------------------------------------------------------------------------------------
-- Leader_MajorCivApproachBiases
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Leader_MajorCivApproachBiases
		(LeaderType,				MajorCivApproachType,			Bias)
VALUES	('LEADER_PB_LUO_FANGBO',	'MAJOR_CIV_APPROACH_WAR',		5),
		('LEADER_PB_LUO_FANGBO',	'MAJOR_CIV_APPROACH_HOSTILE',	4),
		('LEADER_PB_LUO_FANGBO',	'MAJOR_CIV_APPROACH_DECEPTIVE',	4),
		('LEADER_PB_LUO_FANGBO',	'MAJOR_CIV_APPROACH_GUARDED',	7),
		('LEADER_PB_LUO_FANGBO',	'MAJOR_CIV_APPROACH_AFRAID',	4),
		('LEADER_PB_LUO_FANGBO',	'MAJOR_CIV_APPROACH_FRIENDLY',	7),
		('LEADER_PB_LUO_FANGBO',	'MAJOR_CIV_APPROACH_NEUTRAL',	5);
--------------------------------------------------------------------------------------------------------------------------
-- Leader_MinorCivApproachBiases
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Leader_MinorCivApproachBiases
		(LeaderType,				MinorCivApproachType,				Bias)
VALUES	('LEADER_PB_LUO_FANGBO',	'MINOR_CIV_APPROACH_IGNORE',		2),
		('LEADER_PB_LUO_FANGBO',	'MINOR_CIV_APPROACH_FRIENDLY',		8),
		('LEADER_PB_LUO_FANGBO',	'MINOR_CIV_APPROACH_PROTECTIVE',	7),
		('LEADER_PB_LUO_FANGBO',	'MINOR_CIV_APPROACH_CONQUEST',		6),
		('LEADER_PB_LUO_FANGBO',	'MINOR_CIV_APPROACH_BULLY',			6);
--------------------------------------------------------------------------------------------------------------------------
-- Leader_Flavors
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Leader_Flavors
		(LeaderType,				FlavorType,							Flavor)
VALUES	('LEADER_PB_LUO_FANGBO',	'FLAVOR_OFFENSE',					7),
		('LEADER_PB_LUO_FANGBO',	'FLAVOR_DEFENSE',					8),
		('LEADER_PB_LUO_FANGBO',	'FLAVOR_CITY_DEFENSE',				5),
		('LEADER_PB_LUO_FANGBO',	'FLAVOR_MILITARY_TRAINING',			4),
		('LEADER_PB_LUO_FANGBO',	'FLAVOR_RECON',						6),
		('LEADER_PB_LUO_FANGBO',	'FLAVOR_RANGED',					5),
		('LEADER_PB_LUO_FANGBO',	'FLAVOR_MOBILE',					5),
		('LEADER_PB_LUO_FANGBO',	'FLAVOR_NAVAL',						6),
		('LEADER_PB_LUO_FANGBO',	'FLAVOR_NAVAL_RECON',				5),
		('LEADER_PB_LUO_FANGBO',	'FLAVOR_NAVAL_GROWTH',				6),
		('LEADER_PB_LUO_FANGBO',	'FLAVOR_NAVAL_TILE_IMPROVEMENT',	4),
		('LEADER_PB_LUO_FANGBO',	'FLAVOR_AIR',                       4),
		('LEADER_PB_LUO_FANGBO',	'FLAVOR_EXPANSION',                 8),
		('LEADER_PB_LUO_FANGBO',	'FLAVOR_GROWTH',                    6),
		('LEADER_PB_LUO_FANGBO',	'FLAVOR_TILE_IMPROVEMENT',          8),
		('LEADER_PB_LUO_FANGBO',	'FLAVOR_INFRASTRUCTURE',            6),
		('LEADER_PB_LUO_FANGBO',	'FLAVOR_PRODUCTION',                8),
		('LEADER_PB_LUO_FANGBO',	'FLAVOR_GOLD',                      7),
		('LEADER_PB_LUO_FANGBO',	'FLAVOR_SCIENCE',                   6),
		('LEADER_PB_LUO_FANGBO',	'FLAVOR_CULTURE',                   5),
		('LEADER_PB_LUO_FANGBO',	'FLAVOR_HAPPINESS',                 6),
		('LEADER_PB_LUO_FANGBO',	'FLAVOR_GREAT_PEOPLE',              4),
		('LEADER_PB_LUO_FANGBO',	'FLAVOR_WONDER',                    4),
		('LEADER_PB_LUO_FANGBO',	'FLAVOR_RELIGION',                  4),
		('LEADER_PB_LUO_FANGBO',	'FLAVOR_DIPLOMACY',                 8),
		('LEADER_PB_LUO_FANGBO',	'FLAVOR_SPACESHIP',                 7),
		('LEADER_PB_LUO_FANGBO',	'FLAVOR_WATER_CONNECTION',          6),
		('LEADER_PB_LUO_FANGBO',	'FLAVOR_NUKE',                      7),
		('LEADER_PB_LUO_FANGBO',	'FLAVOR_USE_NUKE',                  4),
		('LEADER_PB_LUO_FANGBO',	'FLAVOR_ESPIONAGE',                 7),
		('LEADER_PB_LUO_FANGBO',	'FLAVOR_ANTIAIR',                   5),
		('LEADER_PB_LUO_FANGBO',	'FLAVOR_AIRLIFT',                   5),
		('LEADER_PB_LUO_FANGBO',	'FLAVOR_I_TRADE_DESTINATION',       7),
		('LEADER_PB_LUO_FANGBO',	'FLAVOR_I_TRADE_ORIGIN',            7),
		('LEADER_PB_LUO_FANGBO',	'FLAVOR_I_SEA_TRADE_ROUTE',         5),
		('LEADER_PB_LUO_FANGBO',	'FLAVOR_I_LAND_TRADE_ROUTE',        8),
		('LEADER_PB_LUO_FANGBO',	'FLAVOR_ARCHAEOLOGY',               5),
		('LEADER_PB_LUO_FANGBO',	'FLAVOR_AIR_CARRIER',               3);
--------------------------------------------------------------------------------------------------------------------------
-- Leader_Traits
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Leader_Traits
		(LeaderType,				TraitType)
VALUES	('LEADER_PB_LUO_FANGBO',	'TRAIT_PB_KONGSI_FEDERATION');
--==========================================================================================================================
-- TRAITS
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
-- Traits
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Traits
		(Type,							Description,							ShortDescription)
VALUES	('TRAIT_PB_KONGSI_FEDERATION',	'TXT_KEY_TRAIT_PB_KONGSI_FEDERATION',	'TXT_KEY_TRAIT_PB_KONGSI_FEDERATION_SHORT');
--==========================================================================================================================
-- UNITS
--==========================================================================================================================
INSERT OR REPLACE INTO UnitClasses 	
		(Type,							DefaultUnit,	Description)
VALUES	('UNITCLASS_PB_NOTIFICATION',	null,			null);
--------------------------------------------------------------------------------------------------------------------------
-- Units
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Units
		(Type,				Description,				Civilopedia,					Strategy,							Help,							Requirements,	Combat,			RangedCombat,	Cost,	FaithCost,	RequiresFaithPurchaseEnabled,	PurchaseOnly,	MoveAfterPurchase,	Moves,	Immobile,	Range,	BaseSightRange,	Class,	Special,	Capture,	CombatClass,	Domain,	CivilianAttackPriority,	DefaultUnitAI,	Food,	NoBadGoodies,	RivalTerritory,	MilitarySupport,	MilitaryProduction,	Pillage,	PillagePrereqTech,	Found,	FoundAbroad,	CultureBombRadius,	GoldenAgeTurns,	FreePolicies,	OneShotTourism,	OneShotTourismPercentOthers,	IgnoreBuildingDefense,	PrereqResources,	Mechanized,	Suicide,	CaptureWhileEmbarked,	PrereqTech,	ObsoleteTech,	GoodyHutUpgradeUnitClass,	HurryCostModifier,	AdvancedStartCost,	MinAreaSize,	AirInterceptRange,	AirUnitCap,	NukeDamageLevel,	WorkRate,	NumFreeTechs,	BaseBeakersTurnsToCount,	BaseCultureTurnsToCount,	RushBuilding,	BaseHurry,	HurryMultiplier,	BaseGold,	NumGoldPerEra,	SpreadReligion,	RemoveHeresy,	ReligionSpreads,	ReligiousStrength,	FoundReligion,	RequiresEnhancedReligion,	ProhibitsSpread,	CanBuyCityState,	CombatLimit,	RangeAttackOnlyInDomain,	RangeAttackIgnoreLOS,	Trade,	NumExoticGoods,	PolicyType,	RangedCombatLimit,	XPValueAttack,	XPValueDefense,	SpecialCargo,	DomainCargo,	Conscription,	ExtraMaintenanceCost,	NoMaintenance,	Unhappiness,	UnitArtInfo,				UnitArtInfoCulturalVariation,	UnitArtInfoEraVariation,	ProjectPrereq,	SpaceshipProject,	LeaderPromotion,	LeaderExperience,	DontShowYields,	ShowInPedia,	MoveRate,	UnitFlagIconOffset,	PortraitIndex,	IconAtlas,					UnitFlagAtlas)
SELECT	'UNIT_PB_LANSAAI',	'TXT_KEY_UNIT_PB_LANSAAI',	'TXT_KEY_UNIT_PB_LANSAAI_TEXT',	'TXT_KEY_UNIT_PB_LANSAAI_STRATEGY',	'TXT_KEY_UNIT_PB_LANSAAI_HELP',	Requirements,	Combat*1.40,	RangedCombat,	Cost,	FaithCost,	RequiresFaithPurchaseEnabled,	PurchaseOnly,	MoveAfterPurchase,	Moves,	Immobile,	Range,	BaseSightRange,	Class,	Special,	Capture,	CombatClass,	Domain,	CivilianAttackPriority,	DefaultUnitAI,	Food,	NoBadGoodies,	RivalTerritory,	MilitarySupport,	MilitaryProduction,	Pillage,	PillagePrereqTech,	Found,	FoundAbroad,	CultureBombRadius,	GoldenAgeTurns,	FreePolicies,	OneShotTourism,	OneShotTourismPercentOthers,	IgnoreBuildingDefense,	PrereqResources,	Mechanized,	Suicide,	CaptureWhileEmbarked,	PrereqTech,	ObsoleteTech,	'UNITCLASS_SWORDSMAN',		HurryCostModifier,	AdvancedStartCost,	MinAreaSize,	AirInterceptRange,	AirUnitCap,	NukeDamageLevel,	WorkRate,	NumFreeTechs,	BaseBeakersTurnsToCount,	BaseCultureTurnsToCount,	RushBuilding,	BaseHurry,	HurryMultiplier,	BaseGold,	NumGoldPerEra,	SpreadReligion,	RemoveHeresy,	ReligionSpreads,	ReligiousStrength,	FoundReligion,	RequiresEnhancedReligion,	ProhibitsSpread,	CanBuyCityState,	CombatLimit,	RangeAttackOnlyInDomain,	RangeAttackIgnoreLOS,	Trade,	NumExoticGoods,	PolicyType,	RangedCombatLimit,	XPValueAttack,	XPValueDefense,	SpecialCargo,	DomainCargo,	Conscription,	ExtraMaintenanceCost,	NoMaintenance,	Unhappiness,	'ART_DEF_UNIT_PB_LANSAAI',	UnitArtInfoCulturalVariation,	UnitArtInfoEraVariation,	ProjectPrereq,	SpaceshipProject,	LeaderPromotion,	LeaderExperience,	DontShowYields,	ShowInPedia,	MoveRate,	0,					2,				'PB_LANFANG_ICON_ATLAS',	'PB_LANFANG_LANSAAI_FLAG'
FROM Units WHERE Type = 'UNIT_SCOUT';

INSERT INTO Units 	
		(Type, 								Class,							ShowInPedia,  Cost,	 FaithCost,  Description, 									PortraitIndex,	IconAtlas)									
VALUES	('UNIT_PB_LANFANG_NOTIFICATION',	'UNITCLASS_PB_NOTIFICATION',	0,			  -1,	 -1,		 'TXT_KEY_TRAIT_PB_KONGSI_FEDERATION_SHORT',	0,				'PB_LANFANG_ICON_ATLAS');
--------------------------------------------------------------------------------------------------------------------------
-- UnitGameplay2DScripts
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO UnitGameplay2DScripts 	
		(UnitType,			SelectionSound,	FirstSelectionSound)
SELECT	'UNIT_PB_LANSAAI',	SelectionSound,	FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_SCOUT';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_AITypes
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_AITypes 	
		(UnitType,			UnitAIType)
SELECT	'UNIT_PB_LANSAAI',	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_SCOUT';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_Flavors
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_Flavors 	
		(UnitType,			FlavorType,	Flavor)
SELECT	'UNIT_PB_LANSAAI',	FlavorType,	Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_SCOUT';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_FreePromotions
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_FreePromotions 	
		(UnitType,			PromotionType)
SELECT	'UNIT_PB_LANSAAI',	PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_SCOUT';

INSERT INTO Unit_FreePromotions
		(UnitType,			PromotionType)
VALUES	('UNIT_PB_LANSAAI',	'PROMOTION_PB_LANSAAI');
--------------------------------------------------------------------------------------------------------------------------
-- Unit_ClassUpgrades
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_ClassUpgrades 	
		(UnitType,			UnitClassType)
SELECT	'UNIT_PB_LANSAAI',	UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_SCOUT';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_Builds
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_Builds
		(UnitType,		BuildType)
VALUES	('UNIT_WORKER',	'BUILD_PB_LANFANG_MINE');
--==========================================================================================================================
-- UNIT PROMOTIONS
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
-- UnitPromotions
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO UnitPromotions
		(Type,						Description,						Help,									Sound,				CannotBeChosen,	LostWithUpgrade,	HPHealedIfDestroyEnemy,	PortraitIndex,	IconAtlas,			PediaType,			PediaEntry)
VALUES	('PROMOTION_PB_LANSAAI',	'TXT_KEY_PROMOTION_PB_LANSAAI',		'TXT_KEY_PROMOTION_PB_LANSAAI_HELP',	'AS2D_IF_LEVELUP',	1,				0,					100,					59,				'ABILITY_ATLAS',	'PEDIA_ATTRIBUTES',	'TXT_KEY_PROMOTION_PB_LANSAAI');
--------------------------------------------------------------------------------------------------------------------------
-- UnitPromotions_Terrains
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO UnitPromotions_Terrains
		(PromotionType,				TerrainType,	DoubleMove)
VALUES	('PROMOTION_PB_LANSAAI',	'TERRAIN_HILL',	1);
--------------------------------------------------------------------------------------------------------------------------
-- UnitPromotions_Features
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO UnitPromotions_Features
		(PromotionType,				FeatureType,		DoubleMove)
VALUES	('PROMOTION_PB_LANSAAI',	'FEATURE_JUNGLE',	1),
		('PROMOTION_PB_LANSAAI',	'FEATURE_FOREST',	1);
--==========================================================================================================================
-- BUILDINGS
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
-- BuildingClasses
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BuildingClasses
		(Type,										DefaultBuilding,					Description)
VALUES	('BUILDINGCLASS_PB_ZONGTING_GOLD_DUMMY',	'BUILDING_PB_ZONGTING_GOLD_DUMMY',	'TXT_KEY_BUILDING_PB_ZONGTING_GOLD_DUMMY'),
		('BUILDINGCLASS_PB_LANFANG_UA_MARKER',		'BUILDING_PB_LANFANG_UA_MARKER',	'TXT_KEY_BUILDING_PB_LANFANG_UA_MARKER');
--------------------------------------------------------------------------------------------------------------------------
-- Buildings
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Buildings
		(Type,					Description,					Civilopedia,							Strategy,									Help,									ThemingBonusHelp,	Quote,	GoldMaintenance,	MutuallyExclusiveGroup,	TeamShare,	Water,	River,	FreshWater,	Mountain,	NearbyMountainRequired,	Hill,	Flat,	FoundsReligion,	IsReligious,	BorderObstacle,	PlayerBorderObstacle,	Capital,	GoldenAge,	MapCentering,	NeverCapture,	NukeImmune,	AllowsWaterRoutes,	ExtraLuxuries,	DiplomaticVoting,	AffectSpiesNow,	NullifyInfluenceModifier,	Cost,	FaithCost,	LeagueCost,	UnlockedByBelief,	UnlockedByLeague,	HolyCity,	NumCityCostMod,	HurryCostModifier,	MinAreaSize,	ConquestProb,	CitiesPrereq,	LevelPrereq,	CultureRateModifier,	GlobalCultureRateModifier,	GreatPeopleRateModifier,	GlobalGreatPeopleRateModifier,	GreatGeneralRateModifier,	GreatPersonExpendGold,	GoldenAgeModifier,	UnitUpgradeCostMod,	Experience,	GlobalExperience,	FoodKept,	Airlift,	AirModifier,	NukeModifier,	NukeExplosionRand,	HealRateChange,	Happiness,	UnmoddedHappiness,	UnhappinessModifier,	HappinessPerCity,	HappinessPerXPolicies,	CityCountUnhappinessMod,	NoOccupiedUnhappiness,	WorkerSpeedModifier,	MilitaryProductionModifier,	SpaceProductionModifier,	GlobalSpaceProductionModifier,	BuildingProductionModifier,	WonderProductionModifier,	CityConnectionTradeRouteModifier,	CapturePlunderModifier,	PolicyCostModifier,	PlotCultureCostModifier,	GlobalPlotCultureCostModifier,	PlotBuyCostModifier,	GlobalPlotBuyCostModifier,	GlobalPopulationChange,	TechShare,	FreeTechs,	FreePolicies,	FreeGreatPeople,	MedianTechPercentChange,	Gold,	AllowsRangeStrike,	Espionage,	AllowsFoodTradeRoutes,	AllowsProductionTradeRoutes,	Defense,	ExtraCityHitPoints,		GlobalDefenseMod,	MinorFriendshipChange,	VictoryPoints,	ExtraMissionarySpreads,	ReligiousPressureModifier,	EspionageModifier,	GlobalEspionageModifier,	ExtraSpies,	SpyRankChange,	InstantSpyRankChange,	TradeRouteRecipientBonus,	TradeRouteTargetBonus,	NumTradeRouteBonus,	LandmarksTourismPercent,	InstantMilitaryIncrease,	GreatWorksTourismModifier,	XBuiltTriggersIdeologyChoice,	TradeRouteSeaDistanceModifier,	TradeRouteSeaGoldBonus,	TradeRouteLandDistanceModifier,	TradeRouteLandGoldBonus,	CityStateTradeRouteProductionModifier,	GreatScientistBeakerModifier,	BuildingClass,	ArtDefineTag,	NearbyTerrainRequired,	ProhibitedCityTerrain,	VictoryPrereq,	FreeStartEra,	MaxStartEra,	ObsoleteTech,	EnhancedYieldTech,	TechEnhancedTourism,	FreeBuilding,	FreeBuildingThisCity,	FreePromotion,	TrainedFreePromotion,	FreePromotionRemoved,	ReplacementBuildingClass,	PrereqTech,				PolicyBranchType,	SpecialistType,	SpecialistCount,	GreatWorkSlotType,	FreeGreatWork,	GreatWorkCount,	SpecialistExtraCulture,	GreatPeopleRateChange,	ExtraLeagueVotes,	CityWall,	DisplayPosition,	PortraitIndex,	WonderSplashImage,	WonderSplashAnchor,	WonderSplashAudio,	IconAtlas,					ArtInfoCulturalVariation,	ArtInfoEraVariation,	ArtInfoRandomVariation)
SELECT	'BUILDING_PB_ZONGTING',	'TXT_KEY_BUILDING_PB_ZONGTING',	'TXT_KEY_BUILDING_PB_ZONGTING_TEXT',	'TXT_KEY_BUILDING_PB_ZONGTING_STRATEGY',	'TXT_KEY_BUILDING_PB_ZONGTING_HELP',	ThemingBonusHelp,	Quote,	GoldMaintenance,	MutuallyExclusiveGroup,	TeamShare,	Water,	River,	FreshWater,	Mountain,	NearbyMountainRequired,	Hill,	Flat,	FoundsReligion,	IsReligious,	BorderObstacle,	PlayerBorderObstacle,	Capital,	GoldenAge,	MapCentering,	1,				NukeImmune,	AllowsWaterRoutes,	ExtraLuxuries,	DiplomaticVoting,	AffectSpiesNow,	NullifyInfluenceModifier,	Cost,	FaithCost,	LeagueCost,	UnlockedByBelief,	UnlockedByLeague,	HolyCity,	NumCityCostMod,	HurryCostModifier,	MinAreaSize,	ConquestProb,	CitiesPrereq,	LevelPrereq,	CultureRateModifier,	GlobalCultureRateModifier,	GreatPeopleRateModifier,	GlobalGreatPeopleRateModifier,	GreatGeneralRateModifier,	GreatPersonExpendGold,	GoldenAgeModifier,	UnitUpgradeCostMod,	Experience,	GlobalExperience,	FoodKept,	Airlift,	AirModifier,	NukeModifier,	NukeExplosionRand,	HealRateChange,	Happiness,	UnmoddedHappiness,	UnhappinessModifier,	HappinessPerCity,	HappinessPerXPolicies,	CityCountUnhappinessMod,	NoOccupiedUnhappiness,	WorkerSpeedModifier,	MilitaryProductionModifier,	SpaceProductionModifier,	GlobalSpaceProductionModifier,	BuildingProductionModifier,	WonderProductionModifier,	CityConnectionTradeRouteModifier,	CapturePlunderModifier,	PolicyCostModifier,	PlotCultureCostModifier,	GlobalPlotCultureCostModifier,	PlotBuyCostModifier,	GlobalPlotBuyCostModifier,	GlobalPopulationChange,	TechShare,	FreeTechs,	FreePolicies,	FreeGreatPeople,	MedianTechPercentChange,	Gold,	AllowsRangeStrike,	Espionage,	AllowsFoodTradeRoutes,	AllowsProductionTradeRoutes,	Defense,	ExtraCityHitPoints,		GlobalDefenseMod,	MinorFriendshipChange,	VictoryPoints,	ExtraMissionarySpreads,	ReligiousPressureModifier,	EspionageModifier,	GlobalEspionageModifier,	ExtraSpies,	SpyRankChange,	InstantSpyRankChange,	TradeRouteRecipientBonus,	TradeRouteTargetBonus,	NumTradeRouteBonus,	LandmarksTourismPercent,	InstantMilitaryIncrease,	GreatWorksTourismModifier,	XBuiltTriggersIdeologyChoice,	TradeRouteSeaDistanceModifier,	TradeRouteSeaGoldBonus,	TradeRouteLandDistanceModifier,	TradeRouteLandGoldBonus,	CityStateTradeRouteProductionModifier,	GreatScientistBeakerModifier,	BuildingClass,	ArtDefineTag,	NearbyTerrainRequired,	ProhibitedCityTerrain,	VictoryPrereq,	FreeStartEra,	MaxStartEra,	ObsoleteTech,	EnhancedYieldTech,	TechEnhancedTourism,	FreeBuilding,	FreeBuildingThisCity,	FreePromotion,	TrainedFreePromotion,	FreePromotionRemoved,	ReplacementBuildingClass,	'TECH_IRON_WORKING',	PolicyBranchType,	SpecialistType,	SpecialistCount,	GreatWorkSlotType,	FreeGreatWork,	GreatWorkCount,	SpecialistExtraCulture,	GreatPeopleRateChange,	ExtraLeagueVotes,	CityWall,	DisplayPosition,	3,				WonderSplashImage,	WonderSplashAnchor,	WonderSplashAudio,	'PB_LANFANG_ICON_ATLAS',	ArtInfoCulturalVariation,	ArtInfoEraVariation,	ArtInfoRandomVariation
FROM Buildings WHERE Type = 'BUILDING_MINT';

INSERT INTO Buildings		
		(Type,									BuildingClass,								Cost,	FaithCost,	GreatWorkCount,	NeverCapture,	ConquestProb,	Description,								Help)
VALUES	('BUILDING_PB_ZONGTING_GOLD_DUMMY',		'BUILDINGCLASS_PB_ZONGTING_GOLD_DUMMY',		-1,		-1,			-1,				1,				0,				'TXT_KEY_BUILDING_PB_ZONGTING_GOLD_DUMMY',	'TXT_KEY_BUILDING_PB_ZONGTING_GOLD_DUMMY_HELP'),
		('BUILDING_PB_LANFANG_UA_MARKER',		'BUILDINGCLASS_PB_LANFANG_UA_MARKER',		-1,		-1,			-1,				0,				100,			'TXT_KEY_BUILDING_PB_LANFANG_UA_MARKER',	'TXT_KEY_BUILDING_PB_LANFANG_UA_MARKER_HELP');
--------------------------------------------------------------------------------------------------------------------------
-- Building_Flavors
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_Flavors
		(BuildingType,				FlavorType,				Flavor)
VALUES	('BUILDING_PB_ZONGTING',	'FLAVOR_PRODUCTION',	100);
--------------------------------------------------------------------------------------------------------------------------
-- Building_DomainProductionModifiers
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_DomainProductionModifiers
		(BuildingType,			DomainType,	Modifier)
SELECT	'BUILDING_PB_ZONGTING',	DomainType,	Modifier
FROM Building_DomainProductionModifiers WHERE BuildingType = 'BUILDING_MINT';
--------------------------------------------------------------------------------------------------------------------------
-- Building_LocalResourceAnds
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_LocalResourceAnds
		(BuildingType,				ResourceType)
VALUES	('BUILDING_PB_ZONGTING',	'RESOURCE_GOLD');
--------------------------------------------------------------------------------------------------------------------------
-- Building_ResourceYieldChanges
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_ResourceYieldChanges
		(BuildingType,			ResourceType,	YieldType,	Yield)
SELECT	'BUILDING_PB_ZONGTING',	ResourceType,	YieldType,	Yield
FROM Building_ResourceYieldChanges WHERE BuildingType = 'BUILDING_MINT';

INSERT INTO Building_ResourceYieldChanges 	
		(BuildingType,						ResourceType,		YieldType,			Yield)
VALUES	('BUILDING_PB_ZONGTING_GOLD_DUMMY',	'RESOURCE_GOLD',	'YIELD_PRODUCTION',	1);
--==========================================================================================================================
-- Builds
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
-- Builds
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Builds
		(Type,						Description,	Help,	DisabledHelp,	Recommendation,	HotKey,	HotKeyAlt,	HotKeyPriority,	HotKeyPriorityAlt,	OrderPriority,	AltDown,	AltDownAlt,	ShiftDown,	ShiftDownAlt,	CtrlDown,	CtrlDownAlt,	Time,	Cost,	CostIncreasePerImprovement,	"Kill",	Repair,	RemoveRoute,	PrereqTech,	ImprovementType,				RouteType,	EntityEvent,	IconIndex,	IconAtlas,	ShowInPedia,	ShowInTechTree)
SELECT	'BUILD_PB_LANFANG_MINE',	Description,	Help,	DisabledHelp,	Recommendation,	HotKey,	HotKeyAlt,	HotKeyPriority,	HotKeyPriorityAlt,	OrderPriority,	AltDown,	AltDownAlt,	ShiftDown,	ShiftDownAlt,	CtrlDown,	CtrlDownAlt,	Time,	Cost,	CostIncreasePerImprovement,	"Kill",	Repair,	RemoveRoute,	PrereqTech,	'IMPROVEMENT_PB_LANFANG_MINE',	RouteType,	EntityEvent,	IconIndex,	IconAtlas,	0,				0
FROM Builds WHERE Type = 'BUILD_MINE';
--------------------------------------------------------------------------------------------------------------------------
-- BuildFeatures
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BuildFeatures
		(BuildType,					FeatureType,	PrereqTech,	Time,	Production,	Cost,	Remove)
SELECT	'BUILD_PB_LANFANG_MINE',	FeatureType,	PrereqTech,	Time,	Production,	Cost,	Remove
FROM BuildFeatures WHERE BuildType = 'BUILD_MINE' AND FeatureType NOT IN ('FEATURE_FOREST', 'FEATURE_JUNGLE');
--==========================================================================================================================
-- Improvements
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
-- Improvements
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Improvements
		(Type,							Description,	Civilopedia,	Help,	ArtDefineTag,	WorldSoundscapeAudioScript,	ImprovementPillage,	ImprovementUpgrade,	SpecificCivRequired,	CivilizationType,			HillsMakesValid,	FreshWaterMakesValid,	RiverSideMakesValid,	NoFreshWater,	RequiresFlatlands,	RequiresFlatlandsOrFreshWater,	RequiresFeature,	RequiresImprovement,	RemovesResource,	PromptWhenComplete,	Coastal,	Water,	DestroyedWhenPillaged,	DisplacePillager,	BuildableOnResources,	BarbarianCamp,	Goody,	Permanent,	OutsideBorders,	InAdjacentFriendly,	IgnoreOwnership,	OnlyCityStateTerritory,	GraphicalOnly,	CreatedByGreatPerson,	NoTwoAdjacent,	AdjacentLuxury,	AllowsWalkWater,	CultureAdjacentSameType,	TilesPerGoody,	GoodyRange,	FeatureGrowth,	UpgradeTime,	RiverSideUpgradeMod,	CoastalLandUpgradeMod,	HillsUpgradeMod,	FreshWaterUpgradeMod,	DefenseModifier,	NearbyEnemyDamage,	PillageGold,	ResourceExtractionMod,	LuxuryCopiesSiphonedFromMinor,	GoldMaintenance,	CultureBombRadius,	RequiresXAdjacentLand,	PortraitIndex,	IconAtlas)
SELECT	'IMPROVEMENT_PB_LANFANG_MINE',	Description,	Civilopedia,	Help,	ArtDefineTag,	WorldSoundscapeAudioScript,	ImprovementPillage,	ImprovementUpgrade,	1,						'CIVILIZATION_PB_LANFANG',	0,					FreshWaterMakesValid,	RiverSideMakesValid,	NoFreshWater,	1,					RequiresFlatlandsOrFreshWater,	RequiresFeature,	RequiresImprovement,	RemovesResource,	PromptWhenComplete,	Coastal,	Water,	DestroyedWhenPillaged,	DisplacePillager,	BuildableOnResources,	BarbarianCamp,	Goody,	Permanent,	OutsideBorders,	InAdjacentFriendly,	IgnoreOwnership,	OnlyCityStateTerritory,	GraphicalOnly,	CreatedByGreatPerson,	NoTwoAdjacent,	AdjacentLuxury,	AllowsWalkWater,	CultureAdjacentSameType,	TilesPerGoody,	GoodyRange,	FeatureGrowth,	UpgradeTime,	RiverSideUpgradeMod,	CoastalLandUpgradeMod,	HillsUpgradeMod,	FreshWaterUpgradeMod,	DefenseModifier,	NearbyEnemyDamage,	PillageGold,	ResourceExtractionMod,	LuxuryCopiesSiphonedFromMinor,	GoldMaintenance,	CultureBombRadius,	RequiresXAdjacentLand,	PortraitIndex,	IconAtlas
FROM Improvements WHERE Type = 'IMPROVEMENT_MINE';
--------------------------------------------------------------------------------------------------------------------------
-- Improvement_Yields
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Improvement_Yields
		(ImprovementType,				YieldType,	Yield)
SELECT	'IMPROVEMENT_PB_LANFANG_MINE',	YieldType,	Yield
FROM Improvement_Yields WHERE ImprovementType = 'IMPROVEMENT_MINE';
--------------------------------------------------------------------------------------------------------------------------
-- Improvement_HillsYields
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Improvement_HillsYields
		(ImprovementType,				YieldType,	Yield)
SELECT	'IMPROVEMENT_PB_LANFANG_MINE',	YieldType,	Yield
FROM Improvement_HillsYields WHERE ImprovementType = 'IMPROVEMENT_MINE';
--------------------------------------------------------------------------------------------------------------------------
-- Improvement_ValidTerrains
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Improvement_ValidTerrains
		(ImprovementType,				TerrainType)
SELECT	'IMPROVEMENT_PB_LANFANG_MINE',	TerrainType
FROM Improvement_ValidTerrains WHERE ImprovementType = 'IMPROVEMENT_FORT';
--------------------------------------------------------------------------------------------------------------------------
-- Improvement_ResourceTypes
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Improvement_ResourceTypes
		(ImprovementType,				ResourceType,	ResourceMakesValid,	ResourceTrade,	DiscoveryRand,	QuantityRequirement)
SELECT	'IMPROVEMENT_PB_LANFANG_MINE',	ResourceType,	0,					ResourceTrade,	DiscoveryRand,	QuantityRequirement
FROM Improvement_ResourceTypes WHERE ImprovementType = 'IMPROVEMENT_MINE';
--------------------------------------------------------------------------------------------------------------------------
-- Improvement_ResourceType_Yields
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Improvement_ResourceType_Yields
			(ImprovementType,			ResourceType,	YieldType,	Yield)
SELECT	'IMPROVEMENT_PB_LANFANG_MINE',	ResourceType,	YieldType,	Yield
FROM Improvement_ResourceType_Yields WHERE ImprovementType = 'IMPROVEMENT_MINE';
--------------------------------------------------------------------------------------------------------------------------
-- Belief_ImprovementYieldChanges
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Belief_ImprovementYieldChanges
		(BeliefType,	ImprovementType,				YieldType,	Yield)
SELECT	BeliefType,		'IMPROVEMENT_PB_LANFANG_MINE',	YieldType,	Yield
FROM Belief_ImprovementYieldChanges WHERE ImprovementType = 'IMPROVEMENT_MINE';

--------------------------------------------------------------------------------------------------------------------------
-- Improvement_TechYieldChanges
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Improvement_TechYieldChanges
		(ImprovementType,				TechType,	YieldType,	Yield)
SELECT	'IMPROVEMENT_PB_LANFANG_MINE',	TechType,	YieldType,	Yield
FROM Improvement_TechYieldChanges WHERE ImprovementType = 'IMPROVEMENT_MINE';

CREATE TRIGGER Porklad_Lanfang_Improvement_TechYieldChanges
AFTER INSERT ON Improvement_TechYieldChanges
WHEN NEW.ImprovementType = 'IMPROVEMENT_MINE'
BEGIN
	INSERT INTO Improvement_TechYieldChanges
			(ImprovementType,		TechType,		YieldType,	Yield)
	VALUES	('IMPROVEMENT_PB_LANFANG_MINE',	NEW.TechType,	NEW.YieldType,	NEW.Yield);
END;

--------------------------------------------------------------------------------------------------------------------------
-- Policy_ImprovementYieldChanges
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Policy_ImprovementYieldChanges
		(PolicyType,	ImprovementType,				YieldType,	Yield)
SELECT	PolicyType,		'IMPROVEMENT_PB_LANFANG_MINE',	YieldType,	Yield
FROM Policy_ImprovementYieldChanges WHERE ImprovementType = 'IMPROVEMENT_MINE';

CREATE TRIGGER Porklad_Lanfang_Policy_ImprovementYieldChanges
AFTER INSERT ON Policy_ImprovementYieldChanges
WHEN NEW.ImprovementType = 'IMPROVEMENT_MINE'
BEGIN
	INSERT INTO Policy_ImprovementYieldChanges
			(PolicyType,		ImprovementType,				YieldType,	Yield)
	VALUES	(NEW.PolicyType,	'IMPROVEMENT_PB_LANFANG_MINE',	NEW.YieldType,	NEW.Yield);
END;
--------------------------------------------------------------------------------------------------------------------------
-- Policy_ImprovementCultureChanges
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Policy_ImprovementCultureChanges
		(PolicyType,	ImprovementType,				CultureChange)
SELECT	PolicyType,		'IMPROVEMENT_PB_LANFANG_MINE',	CultureChange
FROM Policy_ImprovementCultureChanges WHERE ImprovementType = 'IMPROVEMENT_MINE';

CREATE TRIGGER Porklad_Lanfang_Policy_ImprovementCultureChanges
AFTER INSERT ON Policy_ImprovementCultureChanges
WHEN NEW.ImprovementType = 'IMPROVEMENT_MINE'
BEGIN
	INSERT INTO Policy_ImprovementCultureChanges
			(PolicyType,		ImprovementType,				CultureChange)
	VALUES	(NEW.PolicyType,	'IMPROVEMENT_PB_LANFANG_MINE',	NEW.CultureChange);
END;
