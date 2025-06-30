--==========================================================================================================================
-- GAME DEFINES
--==========================================================================================================================
--==========================================================================================================================
-- PlayerColors
--==========================================================================================================================
INSERT INTO PlayerColors
		(Type, 							PrimaryColor, 						SecondaryColor, 							TextColor)
VALUES	('PLAYERCOLOR_ASQ_XARAGUA',	'COLOR_PLAYER_ASQ_XARAGUA_ICON',	'COLOR_PLAYER_ASQ_XARAGUA_BACKGROUND',	'COLOR_PLAYER_WHITE_TEXT');
--==========================================================================================================================
-- Colors
--==========================================================================================================================		
INSERT INTO Colors
		(Type, 										Red, 	Green, 	Blue,	Alpha)
VALUES	('COLOR_PLAYER_ASQ_XARAGUA_ICON', 		0.710,		0.855,		0.263,		1), -- 0, 0, 0
		('COLOR_PLAYER_ASQ_XARAGUA_BACKGROUND',	0.537,	0.071,	0.314,	1); -- 214, 104, 63
--==========================================================================================================================
-- Civilizations
--==========================================================================================================================
INSERT INTO Civilizations
		(Type, 							Description, 						ShortDescription, 							Adjective, 								Civilopedia, 							CivilopediaTag, 	DefaultPlayerColor, ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas,				AlphaIconAtlas,				PortraitIndex,	SoundtrackTag, 	MapImage, 	DawnOfManQuote, 						DawnOfManImage)
SELECT	'CIVILIZATION_ASQ_XARAGUA',	'TXT_KEY_CIV_ASQ_XARAGUA_DESC',	'TXT_KEY_CIV_ASQ_XARAGUA_SHORT_DESC', 	'TXT_KEY_CIV_ASQ_XARAGUA_ADJECTIVE',	'TXT_KEY_CIVILOPEDIA_CIVS_ASQ_XARAGUA_TEXT_1', 	'TXT_KEY_CIVILOPEDIA_CIVS_ASQ_XARAGUA',	'PLAYERCOLOR_ASQ_XARAGUA',	ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, 'ASQ_XARAGUA_ATLAS',	'ASQ_XARAGUA_ALPHA_ATLAS',	0, 				SoundtrackTag, 	'xaragua_map_small.dds', 	'TXT_KEY_CIV5_DOM_ASQ_XARAGUA_TEXT', 'xaragua_dom.dds'
FROM Civilizations WHERE Type = 'CIVILIZATION_IROQUOIS';
--==========================================================================================================================
-- Civilization_BuildingClassOverrides
--==========================================================================================================================
INSERT INTO Civilization_BuildingClassOverrides
		(CivilizationType, 				BuildingClassType, 				BuildingType)
VALUES	('CIVILIZATION_ASQ_XARAGUA',	'BUILDINGCLASS_COLOSSEUM',			'BUILDING_ASQ_BATEY');
--==========================================================================================================================
-- Civilization_UnitClassOverrides
--==========================================================================================================================
INSERT INTO Civilization_UnitClassOverrides
		(CivilizationType, 				UnitClassType, 		UnitType)
VALUES	('CIVILIZATION_ASQ_XARAGUA',	'UNITCLASS_MUSICIAN',	'UNIT_ASQ_TEKINA');
--==========================================================================================================================
-- Civilization_CityNames
--==========================================================================================================================
INSERT INTO Civilization_CityNames
		(CivilizationType, 					CityName)
VALUES	('CIVILIZATION_ASQ_XARAGUA', 	'TXT_KEY_CITY_NAME_ASQ_XARAGUA_01'),
		('CIVILIZATION_ASQ_XARAGUA', 	'TXT_KEY_CITY_NAME_ASQ_XARAGUA_02'),
		('CIVILIZATION_ASQ_XARAGUA', 	'TXT_KEY_CITY_NAME_ASQ_XARAGUA_03'),
		('CIVILIZATION_ASQ_XARAGUA', 	'TXT_KEY_CITY_NAME_ASQ_XARAGUA_04'),
		('CIVILIZATION_ASQ_XARAGUA', 	'TXT_KEY_CITY_NAME_ASQ_XARAGUA_05'),
		('CIVILIZATION_ASQ_XARAGUA', 	'TXT_KEY_CITY_NAME_ASQ_XARAGUA_06'),
		('CIVILIZATION_ASQ_XARAGUA', 	'TXT_KEY_CITY_NAME_ASQ_XARAGUA_07'),
		('CIVILIZATION_ASQ_XARAGUA', 	'TXT_KEY_CITY_NAME_ASQ_XARAGUA_08'),
		('CIVILIZATION_ASQ_XARAGUA', 	'TXT_KEY_CITY_NAME_ASQ_XARAGUA_09'),
		('CIVILIZATION_ASQ_XARAGUA', 	'TXT_KEY_CITY_NAME_ASQ_XARAGUA_10'),
		('CIVILIZATION_ASQ_XARAGUA', 	'TXT_KEY_CITY_NAME_ASQ_XARAGUA_11'),
		('CIVILIZATION_ASQ_XARAGUA', 	'TXT_KEY_CITY_NAME_ASQ_XARAGUA_12'),
		('CIVILIZATION_ASQ_XARAGUA', 	'TXT_KEY_CITY_NAME_ASQ_XARAGUA_13'),
		('CIVILIZATION_ASQ_XARAGUA', 	'TXT_KEY_CITY_NAME_ASQ_XARAGUA_14'),
		('CIVILIZATION_ASQ_XARAGUA', 	'TXT_KEY_CITY_NAME_ASQ_XARAGUA_15'),
		('CIVILIZATION_ASQ_XARAGUA', 	'TXT_KEY_CITY_NAME_ASQ_XARAGUA_16'),
		('CIVILIZATION_ASQ_XARAGUA', 	'TXT_KEY_CITY_NAME_ASQ_XARAGUA_17'),
		('CIVILIZATION_ASQ_XARAGUA', 	'TXT_KEY_CITY_NAME_ASQ_XARAGUA_18'),
		('CIVILIZATION_ASQ_XARAGUA', 	'TXT_KEY_CITY_NAME_ASQ_XARAGUA_19'),
		('CIVILIZATION_ASQ_XARAGUA', 	'TXT_KEY_CITY_NAME_ASQ_XARAGUA_20'),
		('CIVILIZATION_ASQ_XARAGUA', 	'TXT_KEY_CITY_NAME_ASQ_XARAGUA_21'),
		('CIVILIZATION_ASQ_XARAGUA', 	'TXT_KEY_CITY_NAME_ASQ_XARAGUA_22'),
		('CIVILIZATION_ASQ_XARAGUA', 	'TXT_KEY_CITY_NAME_ASQ_XARAGUA_23');
--==========================================================================================================================
-- Civilization_FreeBuildingClasses
--==========================================================================================================================
INSERT INTO Civilization_FreeBuildingClasses
		(CivilizationType, 				BuildingClassType)
SELECT	'CIVILIZATION_ASQ_XARAGUA',	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE CivilizationType = 'CIVILIZATION_IROQUOIS';
--==========================================================================================================================
-- Civilization_FreeTechs
--==========================================================================================================================
INSERT INTO Civilization_FreeTechs
		(CivilizationType, 				TechType)
SELECT	'CIVILIZATION_ASQ_XARAGUA',	TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_IROQUOIS';
--==========================================================================================================================
-- Civilization_FreeUnits
--==========================================================================================================================
INSERT INTO Civilization_FreeUnits
		(CivilizationType, 				UnitClassType, Count, UnitAIType)
SELECT	'CIVILIZATION_ASQ_XARAGUA',	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_IROQUOIS';
--==========================================================================================================================
-- Civilization_Leaders
--==========================================================================================================================
INSERT INTO Civilization_Leaders
		(CivilizationType, 				LeaderheadType)
VALUES	('CIVILIZATION_ASQ_XARAGUA',	'LEADER_ASQ_ANACAONA');
--==========================================================================================================================
-- Civilization_Religions
--==========================================================================================================================
INSERT INTO Civilization_Religions
		(CivilizationType, 				ReligionType)
VALUES	('CIVILIZATION_ASQ_XARAGUA',	'RELIGION_CHRISTIANITY'); -- use the California Religions mod pls ;-;
--==========================================================================================================================
-- Civilization_SpyNames
--==========================================================================================================================
INSERT INTO Civilization_SpyNames
		(CivilizationType, 					SpyName)
VALUES	('CIVILIZATION_ASQ_XARAGUA', 	'TXT_KEY_SPY_NAME_ASQ_XARAGUA_0'),
		('CIVILIZATION_ASQ_XARAGUA', 	'TXT_KEY_SPY_NAME_ASQ_XARAGUA_1'),
		('CIVILIZATION_ASQ_XARAGUA', 	'TXT_KEY_SPY_NAME_ASQ_XARAGUA_2'),
		('CIVILIZATION_ASQ_XARAGUA', 	'TXT_KEY_SPY_NAME_ASQ_XARAGUA_3'),
		('CIVILIZATION_ASQ_XARAGUA', 	'TXT_KEY_SPY_NAME_ASQ_XARAGUA_4'),
		('CIVILIZATION_ASQ_XARAGUA', 	'TXT_KEY_SPY_NAME_ASQ_XARAGUA_5'),
		('CIVILIZATION_ASQ_XARAGUA', 	'TXT_KEY_SPY_NAME_ASQ_XARAGUA_6'),
		('CIVILIZATION_ASQ_XARAGUA', 	'TXT_KEY_SPY_NAME_ASQ_XARAGUA_7'),
		('CIVILIZATION_ASQ_XARAGUA', 	'TXT_KEY_SPY_NAME_ASQ_XARAGUA_8'),
		('CIVILIZATION_ASQ_XARAGUA', 	'TXT_KEY_SPY_NAME_ASQ_XARAGUA_9');
--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
--==========================================================================================================================	
-- BuildingClasses
--==========================================================================================================================	
INSERT INTO BuildingClasses
		(Type, 										DefaultBuilding, 						Description,								NoLimit)
VALUES	('BUILDINGCLASS_ASQ_AREITO_BONUS_COUNT', 		'BUILDING_ASQ_AREITO_BONUS_COUNT',			'TXT_KEY_BUILDING_ORG_COIOT_RH_FAITH',		1),
		('BUILDINGCLASS_ASQ_AREITO_DUMMY',		'BUILDING_ASQ_AREITO_DUMMY', 		'TXT_KEY_BUILDING_ORG_COIOT_RH_PRESSURE',	1),
		('BUILDINGCLASS_ASQ_AREITO_BONUS_DUMMY',			'BUILDING_ASQ_AREITO_BONUS_DUMMY',				'TXT_KEY_BUILDING_ORG_COIOT_EAST',			1),
		('BUILDINGCLASS_ASQ_BATEY_DUMMY',			'BUILDING_ASQ_BATEY_DUMMY',				'TXT_KEY_BUILDING_ORG_COIOT_WEST',			1);
--==========================================================================================================================	
-- Buildings
--==========================================================================================================================

INSERT INTO Buildings
		(Type,						Description,						Civilopedia,							Strategy,									Help,									ThemingBonusHelp,	Quote,	GoldMaintenance,	MutuallyExclusiveGroup,	TeamShare,	Water,	River,	FreshWater,	Mountain,	NearbyMountainRequired,	Hill,	Flat,	FoundsReligion,	IsReligious,	BorderObstacle,	PlayerBorderObstacle,	Capital,	GoldenAge,	MapCentering,	NeverCapture,	NukeImmune,	AllowsWaterRoutes,	ExtraLuxuries,	DiplomaticVoting,	AffectSpiesNow,	NullifyInfluenceModifier,	Cost,	FaithCost,	LeagueCost,	UnlockedByBelief,	UnlockedByLeague,	HolyCity,	NumCityCostMod,	HurryCostModifier,	MinAreaSize,	ConquestProb,	CitiesPrereq,	LevelPrereq,	CultureRateModifier,	GlobalCultureRateModifier,	GreatPeopleRateModifier,	GlobalGreatPeopleRateModifier,	GreatGeneralRateModifier,	GreatPersonExpendGold,	GoldenAgeModifier,	UnitUpgradeCostMod,	Experience,	GlobalExperience,	FoodKept,	Airlift,	AirModifier,	NukeModifier,	NukeExplosionRand,	HealRateChange,	Happiness,	UnmoddedHappiness,	UnhappinessModifier,	HappinessPerCity,	HappinessPerXPolicies,	CityCountUnhappinessMod,	NoOccupiedUnhappiness,	WorkerSpeedModifier,	MilitaryProductionModifier,	SpaceProductionModifier,	GlobalSpaceProductionModifier,	BuildingProductionModifier,	WonderProductionModifier,	CityConnectionTradeRouteModifier,	CapturePlunderModifier,	PolicyCostModifier,	PlotCultureCostModifier,	GlobalPlotCultureCostModifier,	PlotBuyCostModifier,	GlobalPlotBuyCostModifier,	GlobalPopulationChange,	TechShare,	FreeTechs,	FreePolicies,	FreeGreatPeople,	MedianTechPercentChange,	Gold,	AllowsRangeStrike,	Espionage,	AllowsFoodTradeRoutes,	AllowsProductionTradeRoutes,	Defense,	ExtraCityHitPoints,		GlobalDefenseMod,	MinorFriendshipChange,	VictoryPoints,	ExtraMissionarySpreads,	ReligiousPressureModifier,	EspionageModifier,	GlobalEspionageModifier,	ExtraSpies,	SpyRankChange,	InstantSpyRankChange,	TradeRouteRecipientBonus,	TradeRouteTargetBonus,	NumTradeRouteBonus,	LandmarksTourismPercent,	InstantMilitaryIncrease,	GreatWorksTourismModifier,	XBuiltTriggersIdeologyChoice,	TradeRouteSeaDistanceModifier,	TradeRouteSeaGoldBonus,	TradeRouteLandDistanceModifier,	TradeRouteLandGoldBonus,	CityStateTradeRouteProductionModifier,	GreatScientistBeakerModifier,	BuildingClass,	ArtDefineTag,	NearbyTerrainRequired,	ProhibitedCityTerrain,	VictoryPrereq,	FreeStartEra,	MaxStartEra,	ObsoleteTech,	EnhancedYieldTech,	TechEnhancedTourism,	FreeBuilding,	FreeBuildingThisCity,	FreePromotion,	TrainedFreePromotion,	FreePromotionRemoved,	ReplacementBuildingClass,	PrereqTech,	PolicyBranchType,	SpecialistType,	SpecialistCount,	GreatWorkSlotType,	FreeGreatWork,	GreatWorkCount,	SpecialistExtraCulture,	GreatPeopleRateChange,	ExtraLeagueVotes,	CityWall,	DisplayPosition,	PortraitIndex,	WonderSplashImage,	WonderSplashAnchor,	WonderSplashAudio,	IconAtlas,	PortraitIndex,	ArtInfoCulturalVariation,	ArtInfoEraVariation,	ArtInfoRandomVariation)
SELECT	'BUILDING_ASQ_BATEY',	'TXT_KEY_BUILDING_ASQ_BATEY',	'TXT_KEY_CIV5_ASQ_BATEY_TEXT',	'TXT_KEY_BUILDING_ASQ_BATEY_STRATEGY',	'TXT_KEY_BUILDING_ASQ_BATEY_HELP',	ThemingBonusHelp,	Quote,	GoldMaintenance,	MutuallyExclusiveGroup,	TeamShare,	Water,	River,	FreshWater,	Mountain,	NearbyMountainRequired,	Hill,	Flat,	FoundsReligion,	IsReligious,	BorderObstacle,	PlayerBorderObstacle,	Capital,	GoldenAge,	MapCentering,	1,				NukeImmune,	AllowsWaterRoutes,	ExtraLuxuries,	DiplomaticVoting,	AffectSpiesNow,	NullifyInfluenceModifier,	Cost,	FaithCost,	LeagueCost,	UnlockedByBelief,	UnlockedByLeague,	HolyCity,	NumCityCostMod,	HurryCostModifier,	MinAreaSize,	ConquestProb,	CitiesPrereq,	LevelPrereq,	CultureRateModifier,	GlobalCultureRateModifier,	GreatPeopleRateModifier,	GlobalGreatPeopleRateModifier,	GreatGeneralRateModifier,	GreatPersonExpendGold,	GoldenAgeModifier,	UnitUpgradeCostMod,	Experience,	GlobalExperience,	FoodKept,	Airlift,	AirModifier,	NukeModifier,	NukeExplosionRand,	HealRateChange,	Happiness,	UnmoddedHappiness,	UnhappinessModifier,	HappinessPerCity,	HappinessPerXPolicies,	CityCountUnhappinessMod,	NoOccupiedUnhappiness,	WorkerSpeedModifier,	MilitaryProductionModifier,	SpaceProductionModifier,	GlobalSpaceProductionModifier,	BuildingProductionModifier,	WonderProductionModifier,	CityConnectionTradeRouteModifier,	CapturePlunderModifier,	PolicyCostModifier,	PlotCultureCostModifier,	GlobalPlotCultureCostModifier,	PlotBuyCostModifier,	GlobalPlotBuyCostModifier,	GlobalPopulationChange,	TechShare,	FreeTechs,	FreePolicies,	FreeGreatPeople,	MedianTechPercentChange,	Gold,	AllowsRangeStrike,	Espionage,	AllowsFoodTradeRoutes,	AllowsProductionTradeRoutes,	Defense,	ExtraCityHitPoints,		GlobalDefenseMod,	MinorFriendshipChange,	VictoryPoints,	ExtraMissionarySpreads,	ReligiousPressureModifier,	EspionageModifier,	GlobalEspionageModifier,	ExtraSpies,	SpyRankChange,	InstantSpyRankChange,	TradeRouteRecipientBonus,	TradeRouteTargetBonus,	NumTradeRouteBonus,	LandmarksTourismPercent,	InstantMilitaryIncrease,	GreatWorksTourismModifier,	XBuiltTriggersIdeologyChoice,	TradeRouteSeaDistanceModifier,	TradeRouteSeaGoldBonus,	TradeRouteLandDistanceModifier,	TradeRouteLandGoldBonus,	CityStateTradeRouteProductionModifier,	GreatScientistBeakerModifier,	BuildingClass,	ArtDefineTag,	NearbyTerrainRequired,	ProhibitedCityTerrain,	VictoryPrereq,	FreeStartEra,	MaxStartEra,	ObsoleteTech,	EnhancedYieldTech,	TechEnhancedTourism,	FreeBuilding,	FreeBuildingThisCity,	FreePromotion,	TrainedFreePromotion,	FreePromotionRemoved,	ReplacementBuildingClass,	PrereqTech,	PolicyBranchType,	SpecialistType,	SpecialistCount,	'GREAT_WORK_SLOT_MUSIC',	FreeGreatWork,	1,	SpecialistExtraCulture,	GreatPeopleRateChange,	ExtraLeagueVotes,	CityWall,	DisplayPosition,	3,				WonderSplashImage,	WonderSplashAnchor,	WonderSplashAudio,	'ASQ_XARAGUA_ATLAS',	3,	ArtInfoCulturalVariation,	ArtInfoEraVariation,	ArtInfoRandomVariation
FROM Buildings WHERE Type = 'BUILDING_COLOSSEUM';

INSERT INTO Buildings
		(Type,								BuildingClass,									ReligiousPressureModifier,	GlobalGreatPeopleRateModifier,	Cost,	FaithCost,	NeverCapture,	PrereqTech, Description,								Help,											PortraitIndex,	IconAtlas)	
VALUES	('BUILDING_ASQ_AREITO_BONUS_COUNT',		'BUILDINGCLASS_ASQ_AREITO_BONUS_COUNT',		0,							0,								-1,		-1,			1,				null,		'TXT_KEY_BUILDING_ASQ_AREITO_BONUS_COUNT',		'TXT_KEY_BUILDING_ASQ_AREITO_BONUS_COUNT_HELP',		3,				'ASQ_XARAGUA_ATLAS'),
		('BUILDING_ASQ_AREITO_DUMMY',	'BUILDINGCLASS_ASQ_AREITO_DUMMY',					0,							0,								-1,		-1,			1,				null,		'TXT_KEY_BUILDING_ASQ_AREITO_DUMMY',	'TXT_KEY_BUILDING_ASQ_AREITO_DUMMY_HELP',	3,				'ASQ_XARAGUA_ATLAS'),
		('BUILDING_ASQ_AREITO_BONUS_DUMMY',			'BUILDINGCLASS_ASQ_AREITO_BONUS_DUMMY',	0,							0,								-1,		-1,			1,				null,		'TXT_KEY_BUILDING_ASQ_AREITO_BONUS_DUMMY',			'TXT_KEY_BUILDING_ASQ_AREITO_BONUS_DUMMY_HELP',			3,				'ASQ_XARAGUA_ATLAS'),
		('BUILDING_ASQ_BATEY_DUMMY',			'BUILDINGCLASS_ASQ_BATEY_DUMMY',			0,							0,								-1,		-1,			1,				null,		'TXT_KEY_BUILDING_ASQ_BATEY_DUMMY',			'TXT_KEY_BUILDING_ASQ_BATEY_DUMMY_HELP',			3,				'ASQ_XARAGUA_ATLAS');
--==========================================================================================================================	
-- Building_ClassesNeededInCity
--==========================================================================================================================
INSERT INTO Building_ClassesNeededInCity
		(BuildingType, 						BuildingClassType)
SELECT	'BUILDING_ASQ_BATEY',	BuildingClassType
FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_COLOSSEUM';
--==========================================================================================================================	
-- Building_YieldChanges
--==========================================================================================================================
INSERT INTO Building_YieldChanges
		(BuildingType, 					YieldType,			Yield)
VALUES	('BUILDING_ASQ_AREITO_DUMMY',	'YIELD_FAITH',		2),
		('BUILDING_ASQ_AREITO_DUMMY',	'YIELD_CULTURE',	2),
		('BUILDING_ASQ_AREITO_BONUS_DUMMY',	'YIELD_FAITH',		1),
		('BUILDING_ASQ_AREITO_BONUS_DUMMY',	'YIELD_CULTURE',	1),
		('BUILDING_ASQ_BATEY_DUMMY',	'YIELD_CULTURE',		1);
--==========================================================================================================================	
-- Building_Flavors
--==========================================================================================================================
INSERT INTO Building_Flavors
		(BuildingType,				FlavorType,	Flavor)
SELECT	'BUILDING_ASQ_BATEY',	FlavorType,	Flavor
FROM Building_Flavors WHERE BuildingType = 'BUILDING_COLOSSEUM';

INSERT INTO Building_Flavors
		(BuildingType, 						FlavorType,			Flavor)
VALUES	('BUILDING_ASQ_BATEY',	'FLAVOR_RELIGION',	50);
--==========================================================================================================================	
-- UNITS
--==========================================================================================================================	
-- Units
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Units
		(Type, 							Class, Cost,  Moves, CivilianAttackPriority, Special, Domain, DefaultUnitAI, WorkRate, CombatLimit, GoldenAgeTurns, MoveRate, 	Description, 							Civilopedia, 									Strategy,											Help,											MilitarySupport, MilitaryProduction, Pillage, AdvancedStartCost, CombatLimit,	UnitArtInfo, 							UnitFlagAtlas,	UnitFlagIconOffset, IconAtlas,	PortraitIndex)
SELECT	'UNIT_ASQ_TEKINA',	Class, Cost,  Moves, CivilianAttackPriority, Special, Domain, DefaultUnitAI, WorkRate, CombatLimit, GoldenAgeTurns,	MoveRate,	'TXT_KEY_UNIT_ASQ_TEKINA',	'TXT_KEY_CIV5_ASQ_TEKINA_TEXT',	'TXT_KEY_UNIT_ASQ_TEKINA_STRATEGY',	'TXT_KEY_UNIT_ASQ_TEKINA_HELP',  	MilitarySupport, MilitaryProduction, Pillage, AdvancedStartCost, CombatLimit, 	'ART_DEF_UNIT_ASQ_TEKINA',	'ASQ_UNIT_FLAG_TEKINA_ATLAS',	0, 					'ASQ_XARAGUA_ATLAS',	2
FROM Units WHERE Type = 'UNIT_MUSICIAN';
--------------------------------
-- UnitGameplay2DScripts
--------------------------------
INSERT INTO UnitGameplay2DScripts
		(UnitType, 						SelectionSound, FirstSelectionSound)
SELECT	'UNIT_ASQ_TEKINA',	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_MUSICIAN';
--------------------------------
-- Unit_AITypes
--------------------------------
INSERT INTO Unit_AITypes
		(UnitType, 							UnitAIType)
VALUES	('UNIT_ASQ_TEKINA', 	'UNITAI_MUSICIAN');
--------------------------------
-- Unit_Flavors
--------------------------------
INSERT INTO Unit_Flavors
		(UnitType, 						FlavorType,	 Flavor)
SELECT	'UNIT_ASQ_TEKINA',	FlavorType,	 Flavor + 5
FROM Unit_Flavors WHERE UnitType = 'UNIT_MUSICIAN';

INSERT INTO Unit_Flavors
		(UnitType, 	FlavorType,	 Flavor)
VALUES	('UNIT_ASQ_TEKINA',		'FLAVOR_RELIGION',	20);
--==========================================================================================================================
-- GreatWorks
--==========================================================================================================================
-- Besides the couple people that have generic images, these are all images of baskets those specific people made. Most of the people and images I got from Remember Your Relations: The Elsie Allen Baskets, Family and Friends by Suzanne Abel-Vidor, Dot Brovarney, and Susan Billy. Susan Billy herself is a weaver on this list.
-- Most museums and collections fail to properly identify the creators of baskets, merely describing them as a Pomo basket, sometimes specifying its use, and often describing its size. 
INSERT INTO GreatWorks
		(Type,									Description,					GreatWorkClassType,	Image,						Audio)
VALUES	('GREAT_WORK_ASQ_AREITO_1',		'TXT_KEY_GREAT_WORK_ASQ_AREITO',		'GREAT_WORK_MUSIC',	'areito_image.dds',			'AS2D_GREAT_WORK_ASQ_AREITO'), -- essie parrish
		('GREAT_WORK_ASQ_AREITO_2',		'TXT_KEY_GREAT_WORK_ASQ_AREITO',		'GREAT_WORK_MUSIC',	'areito_image.dds',			'AS2D_GREAT_WORK_ASQ_AREITO'), -- susan billy
		('GREAT_WORK_ASQ_AREITO_3',		'TXT_KEY_GREAT_WORK_ASQ_AREITO',			'GREAT_WORK_MUSIC',	'areito_image.dds',			'AS2D_GREAT_WORK_ASQ_AREITO'), -- mabel mckay
		('GREAT_WORK_ASQ_AREITO_4',		'TXT_KEY_GREAT_WORK_ASQ_AREITO',	'GREAT_WORK_MUSIC',	'areito_image.dds',			'AS2D_GREAT_WORK_ASQ_AREITO'), -- julia f parker
		('GREAT_WORK_ASQ_AREITO_5',		'TXT_KEY_GREAT_WORK_ASQ_AREITO',		'GREAT_WORK_MUSIC',	'areito_image.dds',			'AS2D_GREAT_WORK_ASQ_AREITO'), -- elsie allen
		('GREAT_WORK_ASQ_AREITO_6',		'TXT_KEY_GREAT_WORK_ASQ_AREITO',			'GREAT_WORK_MUSIC',	'areito_image.dds',		'AS2D_GREAT_WORK_ASQ_AREITO'), -- william benson (the image was actually made by both william and mary, cause i couldn't find one that credited only him besides a pair of earrings)
		('GREAT_WORK_ASQ_AREITO_7',		'TXT_KEY_GREAT_WORK_ASQ_AREITO',			'GREAT_WORK_MUSIC',	'areito_image.dds',			'AS2D_GREAT_WORK_ASQ_AREITO'), -- mary knight benson
		('GREAT_WORK_ASQ_AREITO_8',		'TXT_KEY_GREAT_WORK_ASQ_AREITO',	'GREAT_WORK_MUSIC',	'areito_image.dds',		'AS2D_GREAT_WORK_ASQ_AREITO'), -- luwana quitiquit
		('GREAT_WORK_ASQ_AREITO_9', 		'TXT_KEY_GREAT_WORK_ASQ_AREITO',	'GREAT_WORK_MUSIC',	'areito_image.dds', 		'AS2D_GREAT_WORK_ASQ_AREITO'), -- laura somersal
		('GREAT_WORK_ASQ_AREITO_10',		'TXT_KEY_GREAT_WORK_ASQ_AREITO',		'GREAT_WORK_MUSIC',	'areito_image.dds',			'AS2D_GREAT_WORK_ASQ_AREITO'), -- annie burke lake
		('GREAT_WORK_ASQ_AREITO_11',		'TXT_KEY_GREAT_WORK_ASQ_AREITO',			'GREAT_WORK_MUSIC',	'areito_image.dds',			'AS2D_GREAT_WORK_ASQ_AREITO'), -- mary arnold
		('GREAT_WORK_ASQ_AREITO_12',		'TXT_KEY_GREAT_WORK_ASQ_AREITO',	'GREAT_WORK_MUSIC',	'areito_image.dds',		'AS2D_GREAT_WORK_ASQ_AREITO'), -- gunsissie (generic basket from art institute of chicago)
		('GREAT_WORK_ASQ_AREITO_13',		'TXT_KEY_GREAT_WORK_ASQ_AREITO',	'GREAT_WORK_MUSIC',	'areito_image.dds',	'AS2D_GREAT_WORK_ASQ_AREITO'), -- susie santiago billy
		('GREAT_WORK_ASQ_AREITO_14',		'TXT_KEY_GREAT_WORK_ASQ_AREITO',			'GREAT_WORK_MUSIC',	'areito_image.dds',			'AS2D_GREAT_WORK_ASQ_AREITO'), -- nellie burke
		('GREAT_WORK_ASQ_AREITO_15',		'TXT_KEY_GREAT_WORK_ASQ_AREITO',	'GREAT_WORK_MUSIC',	'areito_image.dds',			'AS2D_GREAT_WORK_ASQ_AREITO'), -- clint mckay
		('GREAT_WORK_ASQ_AREITO_16',		'TXT_KEY_GREAT_WORK_ASQ_AREITO',			'GREAT_WORK_MUSIC',	'areito_image.dds',			'AS2D_GREAT_WORK_ASQ_AREITO'), -- corine pearce
		('GREAT_WORK_ASQ_AREITO_17',		'TXT_KEY_GREAT_WORK_ASQ_AREITO',			'GREAT_WORK_MUSIC',	'areito_image.dds',		'AS2D_GREAT_WORK_ASQ_AREITO'), -- lorraine lockhart (well, not sure if hers, but it's next to her in an image of her and annie burke)
		('GREAT_WORK_ASQ_AREITO_18', 		'TXT_KEY_GREAT_WORK_ASQ_AREITO',	'GREAT_WORK_MUSIC',	'areito_image.dds',		'AS2D_GREAT_WORK_ASQ_AREITO'), -- myrtle mccoy (generic basket from art institute of chicago)
		('GREAT_WORK_ASQ_AREITO_19',		'TXT_KEY_GREAT_WORK_ASQ_AREITO',	'GREAT_WORK_MUSIC',	'areito_image.dds',		'AS2D_GREAT_WORK_ASQ_AREITO'), -- belle viriol (generic basket from art institute of chicago)
		('GREAT_WORK_ASQ_AREITO_20',		'TXT_KEY_GREAT_WORK_ASQ_AREITO',	'GREAT_WORK_MUSIC',	'areito_image.dds',		'AS2D_GREAT_WORK_ASQ_AREITO'), -- mary smith (generic basket from art institute of chicago)
		('GREAT_WORK_ASQ_AREITO_21',		'TXT_KEY_GREAT_WORK_ASQ_AREITO',			'GREAT_WORK_MUSIC',	'areito_image.dds',			'AS2D_GREAT_WORK_ASQ_AREITO'), -- agnes santana
		('GREAT_WORK_ASQ_AREITO_22',		'TXT_KEY_GREAT_WORK_ASQ_AREITO',			'GREAT_WORK_MUSIC',	'areito_image.dds',			'AS2D_GREAT_WORK_ASQ_AREITO'), -- laura wilbell
		('GREAT_WORK_ASQ_AREITO_23',		'TXT_KEY_GREAT_WORK_ASQ_AREITO',			'GREAT_WORK_MUSIC',	'areito_image.dds',		'AS2D_GREAT_WORK_ASQ_AREITO'), -- mow-sha edwards
		('GREAT_WORK_ASQ_AREITO_24',		'TXT_KEY_GREAT_WORK_ASQ_AREITO',			'GREAT_WORK_MUSIC',	'areito_image.dds',			'AS2D_GREAT_WORK_ASQ_AREITO'), -- rhoda knight
		('GREAT_WORK_ASQ_AREITO_25',		'TXT_KEY_GREAT_WORK_ASQ_AREITO',			'GREAT_WORK_MUSIC',	'areito_image.dds',			'AS2D_GREAT_WORK_ASQ_AREITO'), -- ethel burke
		('GREAT_WORK_ASQ_AREITO_26',		'TXT_KEY_GREAT_WORK_ASQ_AREITO',	'GREAT_WORK_MUSIC',	'areito_image.dds',		'AS2D_GREAT_WORK_ASQ_AREITO'), -- gladys lockhart
		('GREAT_WORK_ASQ_AREITO_27',		'TXT_KEY_GREAT_WORK_ASQ_AREITO',			'GREAT_WORK_MUSIC',	'areito_image.dds',			'AS2D_GREAT_WORK_ASQ_AREITO'), -- myrtle mckay chavez
		('GREAT_WORK_ASQ_AREITO_28',		'TXT_KEY_GREAT_WORK_ASQ_AREITO',			'GREAT_WORK_MUSIC',	'areito_image.dds',		'AS2D_GREAT_WORK_ASQ_AREITO'), -- mollie jackson
		('GREAT_WORK_ASQ_AREITO_29',		'TXT_KEY_GREAT_WORK_ASQ_AREITO',			'GREAT_WORK_MUSIC',	'areito_image.dds',			'AS2D_GREAT_WORK_ASQ_AREITO'), -- alice elliott
		('GREAT_WORK_ASQ_AREITO_30',		'TXT_KEY_GREAT_WORK_ASQ_AREITO',	'GREAT_WORK_MUSIC',	'areito_image.dds',		'AS2D_GREAT_WORK_ASQ_AREITO'), -- suzanne holder
		('GREAT_WORK_ASQ_AREITO_31',		'TXT_KEY_GREAT_WORK_ASQ_AREITO',			'GREAT_WORK_MUSIC',	'areito_image.dds',			'AS2D_GREAT_WORK_ASQ_AREITO'), -- lydia faught
		('GREAT_WORK_ASQ_AREITO_32',		'TXT_KEY_GREAT_WORK_ASQ_AREITO',	'GREAT_WORK_MUSIC',	'areito_image.dds',			'AS2D_GREAT_WORK_ASQ_AREITO'), -- annie boone
		('GREAT_WORK_ASQ_AREITO_33',		'TXT_KEY_GREAT_WORK_ASQ_AREITO',			'GREAT_WORK_MUSIC',	'areito_image.dds',			'AS2D_GREAT_WORK_ASQ_AREITO'), -- nora cooper
		('GREAT_WORK_ASQ_AREITO_34',		'TXT_KEY_GREAT_WORK_ASQ_AREITO',			'GREAT_WORK_MUSIC',	'areito_image.dds',				'AS2D_GREAT_WORK_ASQ_AREITO'), -- wala wala
		('GREAT_WORK_ASQ_AREITO_35',		'TXT_KEY_GREAT_WORK_ASQ_AREITO',			'GREAT_WORK_MUSIC',	'areito_image.dds',		'AS2D_GREAT_WORK_ASQ_AREITO'), -- salome alcantra
		('GREAT_WORK_ASQ_AREITO_36',		'TXT_KEY_GREAT_WORK_ASQ_AREITO',			'GREAT_WORK_MUSIC',	'areito_image.dds',			'AS2D_GREAT_WORK_ASQ_AREITO'), -- maude scott
		('GREAT_WORK_ASQ_AREITO_37',		'TXT_KEY_GREAT_WORK_ASQ_AREITO',		'GREAT_WORK_MUSIC',	'areito_image.dds',			'AS2D_GREAT_WORK_ASQ_AREITO'), -- annie burke
		('GREAT_WORK_ASQ_AREITO_38',		'TXT_KEY_GREAT_WORK_ASQ_AREITO',			'GREAT_WORK_MUSIC',	'areito_image.dds',				'AS2D_GREAT_WORK_ASQ_AREITO'), -- mrs kyman
		('GREAT_WORK_ASQ_AREITO_39',		'TXT_KEY_GREAT_WORK_ASQ_AREITO',		'GREAT_WORK_MUSIC',	'areito_image.dds',			'AS2D_GREAT_WORK_ASQ_AREITO'), -- evelyn lake
		('GREAT_WORK_ASQ_AREITO_40',		'TXT_KEY_GREAT_WORK_ASQ_AREITO',			'GREAT_WORK_MUSIC',	'areito_image.dds',			'AS2D_GREAT_WORK_ASQ_AREITO'); -- sarah knight
--------------------------------
-- Unit_UniqueNames
--------------------------------
INSERT INTO Unit_UniqueNames
		(UnitType,							UniqueName,								GreatWorkType)
VALUES	('UNIT_ASQ_TEKINA',	'TXT_KEY_ASQ_TEKINA_1',	'GREAT_WORK_ASQ_AREITO_1'),
		('UNIT_ASQ_TEKINA',	'TXT_KEY_ASQ_TEKINA_2',	'GREAT_WORK_ASQ_AREITO_2'),
		('UNIT_ASQ_TEKINA',	'TXT_KEY_ASQ_TEKINA_3',	'GREAT_WORK_ASQ_AREITO_3'),
		('UNIT_ASQ_TEKINA',	'TXT_KEY_ASQ_TEKINA_4',	'GREAT_WORK_ASQ_AREITO_4'),
		('UNIT_ASQ_TEKINA',	'TXT_KEY_ASQ_TEKINA_5',	'GREAT_WORK_ASQ_AREITO_5'),
		('UNIT_ASQ_TEKINA',	'TXT_KEY_ASQ_TEKINA_6',	'GREAT_WORK_ASQ_AREITO_6'),
		('UNIT_ASQ_TEKINA',	'TXT_KEY_ASQ_TEKINA_7',	'GREAT_WORK_ASQ_AREITO_7'),
		('UNIT_ASQ_TEKINA',	'TXT_KEY_ASQ_TEKINA_8',	'GREAT_WORK_ASQ_AREITO_8'),
		('UNIT_ASQ_TEKINA',	'TXT_KEY_ASQ_TEKINA_9', 	'GREAT_WORK_ASQ_AREITO_9'),
		('UNIT_ASQ_TEKINA',	'TXT_KEY_ASQ_TEKINA_10', 	'GREAT_WORK_ASQ_AREITO_10'),
		('UNIT_ASQ_TEKINA', 	'TXT_KEY_ASQ_TEKINA_11', 	'GREAT_WORK_ASQ_AREITO_11'),
		('UNIT_ASQ_TEKINA', 	'TXT_KEY_ASQ_TEKINA_12',	'GREAT_WORK_ASQ_AREITO_12'),
		('UNIT_ASQ_TEKINA', 	'TXT_KEY_ASQ_TEKINA_13',	'GREAT_WORK_ASQ_AREITO_13'),
		('UNIT_ASQ_TEKINA', 	'TXT_KEY_ASQ_TEKINA_14',	'GREAT_WORK_ASQ_AREITO_14'),
		('UNIT_ASQ_TEKINA', 	'TXT_KEY_ASQ_TEKINA_15',	'GREAT_WORK_ASQ_AREITO_15'),
		('UNIT_ASQ_TEKINA', 	'TXT_KEY_ASQ_TEKINA_16',	'GREAT_WORK_ASQ_AREITO_16'),
		('UNIT_ASQ_TEKINA', 	'TXT_KEY_ASQ_TEKINA_17',	'GREAT_WORK_ASQ_AREITO_17'),
		('UNIT_ASQ_TEKINA', 	'TXT_KEY_ASQ_TEKINA_18', 	'GREAT_WORK_ASQ_AREITO_18'),
		('UNIT_ASQ_TEKINA', 	'TXT_KEY_ASQ_TEKINA_19', 	'GREAT_WORK_ASQ_AREITO_19'),
		('UNIT_ASQ_TEKINA', 	'TXT_KEY_ASQ_TEKINA_20', 	'GREAT_WORK_ASQ_AREITO_20'),
		('UNIT_ASQ_TEKINA', 	'TXT_KEY_ASQ_TEKINA_21',	'GREAT_WORK_ASQ_AREITO_21'),
		('UNIT_ASQ_TEKINA',	'TXT_KEY_ASQ_TEKINA_22',	'GREAT_WORK_ASQ_AREITO_22'),
		('UNIT_ASQ_TEKINA',	'TXT_KEY_ASQ_TEKINA_23',	'GREAT_WORK_ASQ_AREITO_23'),
		('UNIT_ASQ_TEKINA',	'TXT_KEY_ASQ_TEKINA_24',	'GREAT_WORK_ASQ_AREITO_24'),
		('UNIT_ASQ_TEKINA',	'TXT_KEY_ASQ_TEKINA_25',	'GREAT_WORK_ASQ_AREITO_25'),
		('UNIT_ASQ_TEKINA',	'TXT_KEY_ASQ_TEKINA_26',	'GREAT_WORK_ASQ_AREITO_26'),
		('UNIT_ASQ_TEKINA',	'TXT_KEY_ASQ_TEKINA_27',	'GREAT_WORK_ASQ_AREITO_27'),
		('UNIT_ASQ_TEKINA',	'TXT_KEY_ASQ_TEKINA_28',	'GREAT_WORK_ASQ_AREITO_28'),
		('UNIT_ASQ_TEKINA',	'TXT_KEY_ASQ_TEKINA_29',	'GREAT_WORK_ASQ_AREITO_29'),
		('UNIT_ASQ_TEKINA',	'TXT_KEY_ASQ_TEKINA_30',	'GREAT_WORK_ASQ_AREITO_30'),
		('UNIT_ASQ_TEKINA',	'TXT_KEY_ASQ_TEKINA_31',	'GREAT_WORK_ASQ_AREITO_31'),
		('UNIT_ASQ_TEKINA',	'TXT_KEY_ASQ_TEKINA_32',	'GREAT_WORK_ASQ_AREITO_32'),
		('UNIT_ASQ_TEKINA',	'TXT_KEY_ASQ_TEKINA_33',	'GREAT_WORK_ASQ_AREITO_33'),
		('UNIT_ASQ_TEKINA',	'TXT_KEY_ASQ_TEKINA_34',	'GREAT_WORK_ASQ_AREITO_34'),
		('UNIT_ASQ_TEKINA',	'TXT_KEY_ASQ_TEKINA_35',	'GREAT_WORK_ASQ_AREITO_35'),
		('UNIT_ASQ_TEKINA',	'TXT_KEY_ASQ_TEKINA_36',	'GREAT_WORK_ASQ_AREITO_36'),
		('UNIT_ASQ_TEKINA',	'TXT_KEY_ASQ_TEKINA_37',	'GREAT_WORK_ASQ_AREITO_37'),
		('UNIT_ASQ_TEKINA',	'TXT_KEY_ASQ_TEKINA_38',	'GREAT_WORK_ASQ_AREITO_38'),
		('UNIT_ASQ_TEKINA',	'TXT_KEY_ASQ_TEKINA_39',	'GREAT_WORK_ASQ_AREITO_39'),
		('UNIT_ASQ_TEKINA',	'TXT_KEY_ASQ_TEKINA_40',	'GREAT_WORK_ASQ_AREITO_40');
--==========================================================================================================================
-- LEADERS
--==========================================================================================================================
-- Leaders
--------------------------------
INSERT INTO Leaders
		(Type, 						Description, 						Civilopedia, 							CivilopediaTag, 							ArtDefineTag, 	VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 				PortraitIndex)
SELECT	'LEADER_ASQ_ANACAONA', 	'TXT_KEY_LEADER_ASQ_ANACAONA',	'TXT_KEY_LEADER_ASQ_ANACAONA_PEDIA',	'TXT_KEY_CIVILOPEDIA_LEADERS_ASQ_ANACAONA', 	'anacaona_ls.xml',	7, 						7, 						6, 							4, 			7, 				9, 				6, 						8, 				5, 			3, 			2, 				4, 			4, 			'ASQ_XARAGUA_ATLAS',	1
FROM Leaders Where Type = 'LEADER_HIAWATHA';
--------------------------------
-- Leader_MajorCivApproachBiases
--------------------------------
INSERT INTO Leader_MajorCivApproachBiases
		(LeaderType, 				MajorCivApproachType, 				Bias)
VALUES	('LEADER_ASQ_ANACAONA', 	'MAJOR_CIV_APPROACH_WAR', 			2),
		('LEADER_ASQ_ANACAONA', 	'MAJOR_CIV_APPROACH_HOSTILE', 		3),
		('LEADER_ASQ_ANACAONA', 	'MAJOR_CIV_APPROACH_DECEPTIVE', 	2),
		('LEADER_ASQ_ANACAONA', 	'MAJOR_CIV_APPROACH_GUARDED', 		6),
		('LEADER_ASQ_ANACAONA', 	'MAJOR_CIV_APPROACH_AFRAID', 		5),
		('LEADER_ASQ_ANACAONA', 	'MAJOR_CIV_APPROACH_FRIENDLY', 		9),
		('LEADER_ASQ_ANACAONA', 	'MAJOR_CIV_APPROACH_NEUTRAL', 		5);
--------------------------------
-- Leader_MinorCivApproachBiases
--------------------------------
INSERT INTO Leader_MinorCivApproachBiases
		(LeaderType, 				MinorCivApproachType, 				Bias)
VALUES	('LEADER_ASQ_ANACAONA', 	'MINOR_CIV_APPROACH_IGNORE', 		6),
		('LEADER_ASQ_ANACAONA', 	'MINOR_CIV_APPROACH_FRIENDLY', 		7),
		('LEADER_ASQ_ANACAONA', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	4),
		('LEADER_ASQ_ANACAONA', 	'MINOR_CIV_APPROACH_CONQUEST', 		4),
		('LEADER_ASQ_ANACAONA', 	'MINOR_CIV_APPROACH_BULLY', 		3);
--------------------------------
-- Leader_Flavors
--------------------------------
INSERT INTO Leader_Flavors
		(LeaderType, 				FlavorType, 						Flavor)
VALUES	('LEADER_ASQ_ANACAONA', 	'FLAVOR_OFFENSE', 					4),
		('LEADER_ASQ_ANACAONA', 	'FLAVOR_DEFENSE', 					4),
		('LEADER_ASQ_ANACAONA', 	'FLAVOR_CITY_DEFENSE', 				6),
		('LEADER_ASQ_ANACAONA', 	'FLAVOR_MILITARY_TRAINING', 		2),
		('LEADER_ASQ_ANACAONA', 	'FLAVOR_RECON', 					5),
		('LEADER_ASQ_ANACAONA', 	'FLAVOR_RANGED', 					6),
		('LEADER_ASQ_ANACAONA', 	'FLAVOR_MOBILE', 					4),
		('LEADER_ASQ_ANACAONA', 	'FLAVOR_NAVAL', 					7),
		('LEADER_ASQ_ANACAONA', 	'FLAVOR_NAVAL_RECON', 				7),
		('LEADER_ASQ_ANACAONA', 	'FLAVOR_NAVAL_GROWTH', 				9),
		('LEADER_ASQ_ANACAONA', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	7),
		('LEADER_ASQ_ANACAONA', 	'FLAVOR_AIR', 						2),
		('LEADER_ASQ_ANACAONA', 	'FLAVOR_EXPANSION', 				6),
		('LEADER_ASQ_ANACAONA', 	'FLAVOR_GROWTH', 					9),
		('LEADER_ASQ_ANACAONA', 	'FLAVOR_TILE_IMPROVEMENT', 			6),
		('LEADER_ASQ_ANACAONA', 	'FLAVOR_INFRASTRUCTURE', 			3),
		('LEADER_ASQ_ANACAONA', 	'FLAVOR_PRODUCTION', 				5),
		('LEADER_ASQ_ANACAONA', 	'FLAVOR_GOLD', 						5),
		('LEADER_ASQ_ANACAONA', 	'FLAVOR_SCIENCE', 					5),
		('LEADER_ASQ_ANACAONA', 	'FLAVOR_CULTURE', 					10),
		('LEADER_ASQ_ANACAONA', 	'FLAVOR_HAPPINESS', 				9),
		('LEADER_ASQ_ANACAONA', 	'FLAVOR_GREAT_PEOPLE', 				10),
		('LEADER_ASQ_ANACAONA', 	'FLAVOR_WONDER', 					6),
		('LEADER_ASQ_ANACAONA', 	'FLAVOR_RELIGION', 					10),
		('LEADER_ASQ_ANACAONA', 	'FLAVOR_DIPLOMACY', 				5),
		('LEADER_ASQ_ANACAONA', 	'FLAVOR_SPACESHIP', 				3),
		('LEADER_ASQ_ANACAONA', 	'FLAVOR_WATER_CONNECTION', 			5),
		('LEADER_ASQ_ANACAONA', 	'FLAVOR_NUKE', 						2),
		('LEADER_ASQ_ANACAONA', 	'FLAVOR_USE_NUKE', 					2),
		('LEADER_ASQ_ANACAONA', 	'FLAVOR_ESPIONAGE', 				5),
		('LEADER_ASQ_ANACAONA', 	'FLAVOR_AIRLIFT', 					5),
		('LEADER_ASQ_ANACAONA', 	'FLAVOR_I_TRADE_DESTINATION', 		5),
		('LEADER_ASQ_ANACAONA', 	'FLAVOR_I_TRADE_ORIGIN', 			5),
		('LEADER_ASQ_ANACAONA', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		6),
		('LEADER_ASQ_ANACAONA', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
		('LEADER_ASQ_ANACAONA', 	'FLAVOR_ARCHAEOLOGY', 				7),
		('LEADER_ASQ_ANACAONA', 	'FLAVOR_AIR_CARRIER', 				5);
--------------------------------
-- Leader_Traits
--------------------------------
INSERT INTO Leader_Traits
		(LeaderType, 				TraitType)
VALUES	('LEADER_ASQ_ANACAONA',	'TRAIT_ASQ_XARAGUA');
--------------------------------------------------------------------------------------------------------------------------
-- Diplomacy_Responses
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Diplomacy_Responses
		(LeaderType, 					ResponseType, 							 			Response, 																		Bias)
VALUES 	('LEADER_ASQ_ANACAONA',	'RESPONSE_AI_DOF_BACKSTAB', 			 			'TXT_KEY_LEADER_ASQ_ANACAONA_DENOUNCE_FRIEND%', 			 				500),
		('LEADER_ASQ_ANACAONA',	'RESPONSE_ATTACKED_HOSTILE', 			 			'TXT_KEY_LEADER_ASQ_ANACAONA_ATTACKED_HOSTILE%', 			 			500),
		('LEADER_ASQ_ANACAONA',	'RESPONSE_ATTACKED_STRONG_HOSTILE', 			 	'TXT_KEY_LEADER_ASQ_ANACAONA_ATTACKED_HOSTILE%', 			 			500),
		('LEADER_ASQ_ANACAONA',	'RESPONSE_DEFEATED', 					 			'TXT_KEY_LEADER_ASQ_ANACAONA_DEFEATED%', 					 			500),
		('LEADER_ASQ_ANACAONA',	'RESPONSE_DOW_GENERIC', 				 			'TXT_KEY_LEADER_ASQ_ANACAONA_DOW_GENERIC%', 				 				500),
		('LEADER_ASQ_ANACAONA',	'RESPONSE_FIRST_GREETING', 				 			'TXT_KEY_LEADER_ASQ_ANACAONA_FIRSTGREETING%', 				 			500),
		('LEADER_ASQ_ANACAONA',	'RESPONSE_HOSTILE_AGGRESSIVE_MILITARY_WARNING', 			'TXT_KEY_LEADER_ASQ_ANACAONA_HOSTILE_AGGRESSIVE_MILITARY_WARNING%', 				 				500),
		('LEADER_ASQ_ANACAONA',	'RESPONSE_EXPANSION_SERIOUS_WARNING', 				 			'TXT_KEY_LEADER_ASQ_ANACAONA_EXPANSION_SERIOUS_WARNING%', 				 			500),
		('LEADER_ASQ_ANACAONA',	'RESPONSE_GREETING_HOSTILE_HELLO', 					'TXT_KEY_LEADER_ASQ_ANACAONA_GREETING_HOSTILE_HELLO%', 		 			500),
		('LEADER_ASQ_ANACAONA',	'RESPONSE_GREETING_NEUTRAL_HELLO', 					'TXT_KEY_LEADER_ASQ_ANACAONA_GREETING_NEUTRAL_HELLO%', 		 			500),
		('LEADER_ASQ_ANACAONA',	'RESPONSE_GREETING_POLITE_HELLO', 					'TXT_KEY_LEADER_ASQ_ANACAONA_GREETING_POLITE_HELLO%', 		 			500),
		('LEADER_ASQ_ANACAONA',	'RESPONSE_OPEN_BORDERS_EXCHANGE', 					'TXT_KEY_LEADER_ASQ_ANACAONA_OPEN_BORDERS_EXCHANGE%', 		  			500),
		('LEADER_ASQ_ANACAONA',	'RESPONSE_REQUEST', 								'TXT_KEY_LEADER_ASQ_ANACAONA_REQUEST%', 		  							500),
		('LEADER_ASQ_ANACAONA',	'RESPONSE_RESPONSE_TO_BEING_DENOUNCED',  			'TXT_KEY_LEADER_ASQ_ANACAONA_RESPONSE_TO_BEING_DENOUNCED%',   			500),
		('LEADER_ASQ_ANACAONA',	'RESPONSE_WORK_AGAINST_SOMEONE', 		 			'TXT_KEY_LEADER_ASQ_ANACAONA_DENOUNCE%', 					  			500),
		('LEADER_ASQ_ANACAONA',	'RESPONSE_WORK_WITH_US', 				 			'TXT_KEY_LEADER_ASQ_ANACAONA_DEC_FRIENDSHIP%', 			  	  			500),
		('LEADER_ASQ_ANACAONA',	'RESPONSE_INFLUENTIAL_ON_AI', 		 				'TXT_KEY_LEADER_ASQ_ANACAONA_INFLUENTIAL_ON_AI%', 					  				500),
		('LEADER_ASQ_ANACAONA',	'RESPONSE_INFLUENTIAL_ON_HUMAN', 		 			'TXT_KEY_LEADER_ASQ_ANACAONA_INFLUENTIAL_ON_HUMAN%', 					  				500);
--==========================================================================================================================
-- TRAITS
--==========================================================================================================================
-- Traits
----------------------------------------------------------------------------------------------------------------------------
INSERT INTO Traits
		(Type, 						Description, 					ShortDescription)
VALUES	('TRAIT_ASQ_XARAGUA',	'TXT_KEY_TRAIT_ASQ_XARAGUA',	'TXT_KEY_TRAIT_ASQ_XARAGUA_SHORT');
------------------------------------------------------------------------------------------------------------------------ 
-- Civilization_Start_Along_Ocean
------------------------------------------------------------------------------------------------------------------------ 	
INSERT INTO Civilization_Start_Along_Ocean 
		(CivilizationType, 						StartAlongOcean)
VALUES	('CIVILIZATION_ASQ_XARAGUA', 1);
