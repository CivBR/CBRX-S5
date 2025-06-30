--==========================================================================================================================
-- Buildings
--==========================================================================================================================
INSERT INTO Buildings 	
		(Type, 								BuildingClass,	FreeStartEra,	Cost,	GoldMaintenance,	PrereqTech,	Description,								Civilopedia,									Help,											Strategy,											FaithCost,	UnlockedByBelief,	Defense,	ExtraCityHitPoints,		ArtDefineTag,	SpecialistType,	SpecialistCount,	MinAreaSize,	ConquestProb,	HurryCostModifier,	Water,	AllowsWaterRoutes, TradeRouteSeaDistanceModifier, TradeRouteSeaGoldBonus,	AllowsFoodTradeRoutes,	IconAtlas,				PortraitIndex)
SELECT	('BUILDING_MC_YANOMAMI_SHABONO'),	BuildingClass,	FreeStartEra,	Cost,	GoldMaintenance,	PrereqTech,	('TXT_KEY_BUILDING_MC_YANOMAMI_SHABONO'),	('TXT_KEY_BUILDING_MC_YANOMAMI_SHABONO_PEDIA'),	('TXT_KEY_BUILDING_MC_YANOMAMI_SHABONO_HELP'),	('TXT_KEY_BUILDING_MC_YANOMAMI_SHABONO_STRATEGY'),	FaithCost,	UnlockedByBelief,	Defense,	ExtraCityHitPoints,		ArtDefineTag,	SpecialistType,	SpecialistCount,	MinAreaSize,	0,				HurryCostModifier,	Water,	AllowsWaterRoutes, TradeRouteSeaDistanceModifier, TradeRouteSeaGoldBonus,	AllowsFoodTradeRoutes,	'MC_YANOMAMI_ATLAS',		3
FROM Buildings WHERE (Type = 'BUILDING_GRANARY');

--Dummy Building
INSERT INTO Buildings		
		(Type,									BuildingClass,								Cost, 	FaithCost,	GreatWorkCount,  	CultureRateModifier,	EnhancedYieldTech,	TechEnhancedTourism,	Description,											NeverCapture)
VALUES	('BUILDING_MC_WONDER_CULTURE_DUMMY_1',	'BUILDINGCLASS_MC_WONDER_CULTURE_DUMMY_1',	-1,		-1,			-1,					50,						null,				0,						'TXT_KEY_BUILDING_MC_YANOMAMI_WONDER_CULTURE_DUMMY_1',	1),
		('BUILDING_MC_WONDER_CULTURE_DUMMY_2',	'BUILDINGCLASS_MC_WONDER_CULTURE_DUMMY_2',	-1,		-1,			-1,					40,						null,				0,						'TXT_KEY_BUILDING_MC_YANOMAMI_WONDER_CULTURE_DUMMY_2',	1),
		('BUILDING_MC_WONDER_CULTURE_DUMMY_3',	'BUILDINGCLASS_MC_WONDER_CULTURE_DUMMY_3',	-1,		-1,			-1,					30,						null,				0,						'TXT_KEY_BUILDING_MC_YANOMAMI_WONDER_CULTURE_DUMMY_3',	1),
		('BUILDING_MC_WONDER_CULTURE_DUMMY_4',	'BUILDINGCLASS_MC_WONDER_CULTURE_DUMMY_4',	-1,		-1,			-1,					20,						null,				0,						'TXT_KEY_BUILDING_MC_YANOMAMI_WONDER_CULTURE_DUMMY_4',	1),
		('BUILDING_MC_WONDER_CULTURE_DUMMY_5',	'BUILDINGCLASS_MC_WONDER_CULTURE_DUMMY_5',	-1,		-1,			-1,					10,						null,				0,						'TXT_KEY_BUILDING_MC_YANOMAMI_WONDER_CULTURE_DUMMY_5',	1),
		('BUILDING_MC_FAITH_DUMMY',				'BUILDINGCLASS_MC_FAITH_DUMMY',				-1,		-1,			-1,					0,						null,				0,						'TXT_KEY_BUILDING_MC_YANOMAMI_FAITH_DUMMY',				1),
		('BUILDING_MC_FOOD_DUMMY',				'BUILDINGCLASS_MC_FOOD_DUMMY',				-1,		-1,			-1,					0,						null,				0,						'TXT_KEY_BUILDING_MC_YANOMAMI_FOOD_DUMMY',				1),
		('BUILDING_MC_TOURISM_DUMMY_1',			'BUILDINGCLASS_MC_TOURISM_DUMMY_1',			-1,		-1,			-1,					0,						'TECH_AGRICULTURE',	1,						'TXT_KEY_BUILDING_MC_YANOMAMI_TOURISM_DUMMY_1',			1),
		('BUILDING_MC_TOURISM_DUMMY_2',			'BUILDINGCLASS_MC_TOURISM_DUMMY_2',			-1,		-1,			-1,					0,						'TECH_AGRICULTURE',	2,						'TXT_KEY_BUILDING_MC_YANOMAMI_TOURISM_DUMMY_2',			1),
		('BUILDING_MC_TOURISM_DUMMY_4',			'BUILDINGCLASS_MC_TOURISM_DUMMY_4',			-1,		-1,			-1,					0,						'TECH_AGRICULTURE',	4,						'TXT_KEY_BUILDING_MC_YANOMAMI_TOURISM_DUMMY_4',			1),
		('BUILDING_MC_TOURISM_DUMMY_8',			'BUILDINGCLASS_MC_TOURISM_DUMMY_8',			-1,		-1,			-1,					0,						'TECH_AGRICULTURE',	8,						'TXT_KEY_BUILDING_MC_YANOMAMI_TOURISM_DUMMY_8',			1),
		('BUILDING_MC_TOURISM_DUMMY_16',		'BUILDINGCLASS_MC_TOURISM_DUMMY_16',		-1,		-1,			-1,					0,						'TECH_AGRICULTURE',	16,						'TXT_KEY_BUILDING_MC_YANOMAMI_TOURISM_DUMMY_16',		1),
		('BUILDING_MC_TOURISM_DUMMY_32',		'BUILDINGCLASS_MC_TOURISM_DUMMY_32',		-1,		-1,			-1,					0,						'TECH_AGRICULTURE',	32,						'TXT_KEY_BUILDING_MC_YANOMAMI_TOURISM_DUMMY_32',		1),
		('BUILDING_MC_TOURISM_DUMMY_64',		'BUILDINGCLASS_MC_TOURISM_DUMMY_64',		-1,		-1,			-1,					0,						'TECH_AGRICULTURE',	64,						'TXT_KEY_BUILDING_MC_YANOMAMI_TOURISM_DUMMY_64',		1),
		('BUILDING_MC_TOURISM_DUMMY_128',		'BUILDINGCLASS_MC_TOURISM_DUMMY_128',		-1,		-1,			-1,					0,						'TECH_AGRICULTURE',	128,					'TXT_KEY_BUILDING_MC_YANOMAMI_TOURISM_DUMMY_128',		1);

--==========================================================================================================================
-- BuildingClasses
--==========================================================================================================================
INSERT INTO BuildingClasses 	
		(Type,										DefaultBuilding,						Description)
VALUES	('BUILDINGCLASS_MC_WONDER_CULTURE_DUMMY_1',	'BUILDING_MC_WONDER_CULTURE_DUMMY_1',	'TXT_KEY_BUILDING_MC_WONDER_CULTURE_DUMMY_1'),
		('BUILDINGCLASS_MC_WONDER_CULTURE_DUMMY_2',	'BUILDING_MC_WONDER_CULTURE_DUMMY_2',	'TXT_KEY_BUILDING_MC_WONDER_CULTURE_DUMMY_2'),
		('BUILDINGCLASS_MC_WONDER_CULTURE_DUMMY_3',	'BUILDING_MC_WONDER_CULTURE_DUMMY_3',	'TXT_KEY_BUILDING_MC_WONDER_CULTURE_DUMMY_3'),
		('BUILDINGCLASS_MC_WONDER_CULTURE_DUMMY_4',	'BUILDING_MC_WONDER_CULTURE_DUMMY_4',	'TXT_KEY_BUILDING_MC_WONDER_CULTURE_DUMMY_4'),
		('BUILDINGCLASS_MC_WONDER_CULTURE_DUMMY_5',	'BUILDING_MC_WONDER_CULTURE_DUMMY_5',	'TXT_KEY_BUILDING_MC_WONDER_CULTURE_DUMMY_5'),
		('BUILDINGCLASS_MC_FAITH_DUMMY',			'BUILDING_MC_FAITH_DUMMY',				'TXT_KEY_BUILDING_MC_FAITH_DUMMY'),
		('BUILDINGCLASS_MC_FOOD_DUMMY',				'BUILDING_MC_FOOD_DUMMY',				'TXT_KEY_BUILDING_MC_FOOD_DUMMY'),
		('BUILDINGCLASS_MC_TOURISM_DUMMY_1',		'BUILDING_MC_TOURISM_DUMMY_1',			'TXT_KEY_BUILDING_MC_TOURISM_DUMMY_1'),
		('BUILDINGCLASS_MC_TOURISM_DUMMY_2',		'BUILDING_MC_TOURISM_DUMMY_2',			'TXT_KEY_BUILDING_MC_TOURISM_DUMMY_2'),
		('BUILDINGCLASS_MC_TOURISM_DUMMY_4',		'BUILDING_MC_TOURISM_DUMMY_4',			'TXT_KEY_BUILDING_MC_TOURISM_DUMMY_4'),
		('BUILDINGCLASS_MC_TOURISM_DUMMY_8',		'BUILDING_MC_TOURISM_DUMMY_8',			'TXT_KEY_BUILDING_MC_TOURISM_DUMMY_8'),
		('BUILDINGCLASS_MC_TOURISM_DUMMY_16',		'BUILDING_MC_TOURISM_DUMMY_16',			'TXT_KEY_BUILDING_MC_TOURISM_DUMMY_16'),
		('BUILDINGCLASS_MC_TOURISM_DUMMY_32',		'BUILDING_MC_TOURISM_DUMMY_32',			'TXT_KEY_BUILDING_MC_TOURISM_DUMMY_32'),
		('BUILDINGCLASS_MC_TOURISM_DUMMY_64',		'BUILDING_MC_TOURISM_DUMMY_64',			'TXT_KEY_BUILDING_MC_TOURISM_DUMMY_64'),
		('BUILDINGCLASS_MC_TOURISM_DUMMY_128',		'BUILDING_MC_TOURISM_DUMMY_128',		'TXT_KEY_BUILDING_MC_TOURISM_DUMMY_128');

--==========================================================================================================================
-- Building_YieldChanges
--==========================================================================================================================
INSERT INTO Building_YieldChanges
		(BuildingType,					YieldType,		Yield)
SELECT	'BUILDING_MC_YANOMAMI_SHABONO',	YieldType,		Yield
FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_GRANARY';

INSERT INTO Building_YieldChanges
		(BuildingType,					YieldType,			Yield)
VALUES	('BUILDING_MC_FOOD_DUMMY',		'YIELD_FOOD',		4);

--==========================================================================================================================
-- Building_YieldModifiers
--==========================================================================================================================
INSERT INTO Building_YieldModifiers 	
		(BuildingType,						YieldType,		Yield)
SELECT	('BUILDING_MC_YANOMAMI_SHABONO'),	YieldType,		Yield
FROM Building_YieldModifiers WHERE (BuildingType ='BUILDING_GRANARY');

--==========================================================================================================================
-- Building_FeatureYieldChanges
--==========================================================================================================================
INSERT INTO Building_FeatureYieldChanges
		(BuildingType,						FeatureType,		YieldType,			Yield)
VALUES	('BUILDING_MC_FAITH_DUMMY',			'FEATURE_JUNGLE',	'YIELD_FAITH',		1),
		('BUILDING_MC_YANOMAMI_SHABONO',	'FEATURE_JUNGLE',	'YIELD_CULTURE',	1);

--==========================================================================================================================
-- Building_Flavors
--==========================================================================================================================
INSERT INTO Building_Flavors 	
		(BuildingType, 						FlavorType,						Flavor)
VALUES	('BUILDING_MC_YANOMAMI_SHABONO',	'FLAVOR_GROWTH',				50),
		('BUILDING_MC_YANOMAMI_SHABONO',	'FLAVOR_SCIENCE',				5),
		('BUILDING_MC_YANOMAMI_SHABONO',	'FLAVOR_CULTURE',				5),
		('BUILDING_MC_YANOMAMI_SHABONO',	'FLAVOR_PRODUCTION',			5),
		('BUILDING_MC_YANOMAMI_SHABONO',	'FLAVOR_EXPANSION',				5),
		('BUILDING_MC_YANOMAMI_SHABONO',	'FLAVOR_I_LAND_TRADE_ROUTE',	5),
		('BUILDING_MC_YANOMAMI_SHABONO',	'FLAVOR_I_SEA_TRADE_ROUTE',		5);
		

