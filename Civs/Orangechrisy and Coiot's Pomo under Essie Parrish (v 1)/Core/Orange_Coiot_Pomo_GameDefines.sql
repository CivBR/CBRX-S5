--==========================================================================================================================
-- GAME DEFINES
--==========================================================================================================================
--==========================================================================================================================
-- PlayerColors
--==========================================================================================================================
INSERT INTO PlayerColors
		(Type, 							PrimaryColor, 						SecondaryColor, 							TextColor)
VALUES	('PLAYERCOLOR_ORG_COIOT_POMO',	'COLOR_PLAYER_ORG_COIOT_POMO_ICON',	'COLOR_PLAYER_ORG_COIOT_POMO_BACKGROUND',	'COLOR_PLAYER_WHITE_TEXT');
--==========================================================================================================================
-- Colors
--==========================================================================================================================		
INSERT INTO Colors
		(Type, 										Red, 	Green, 	Blue,	Alpha)
VALUES	('COLOR_PLAYER_ORG_COIOT_POMO_ICON', 		0,		0,		0,		1), -- 0, 0, 0
		('COLOR_PLAYER_ORG_COIOT_POMO_BACKGROUND',	0.839,	0.407,	0.247,	1); -- 214, 104, 63
--==========================================================================================================================
-- Civilizations
--==========================================================================================================================
INSERT INTO Civilizations
		(Type, 							Description, 						ShortDescription, 							Adjective, 								Civilopedia, 							CivilopediaTag, 				DefaultPlayerColor, 			ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas,				AlphaIconAtlas,					PortraitIndex,	SoundtrackTag, 	MapImage, 		DawnOfManQuote, 						DawnOfManImage)
SELECT	'CIVILIZATION_ORG_COIOT_POMO',	'TXT_KEY_CIV_ORG_COIOT_POMO_DESC',	'TXT_KEY_CIV_ORG_COIOT_POMO_SHORT_DESC', 	'TXT_KEY_CIV_ORG_COIOT_POMO_ADJECTIVE',	'TXT_KEY_CIV_ORG_COIOT_POMO_PEDIA', 	'TXT_KEY_CIV_ORG_COIOT_POMO',	'PLAYERCOLOR_ORG_COIOT_POMO',	ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, 'ORG_COIOT_POMO_ATLAS',	'ORG_COIOT_POMO_ALPHA_ATLAS',	1, 				SoundtrackTag, 	'PomoMap.dds', 	'TXT_KEY_CIV5_DOM_ORG_COIOT_POMO_TEXT', 'PomoDoM.dds'
FROM Civilizations WHERE Type = 'CIVILIZATION_IROQUOIS';
--==========================================================================================================================
-- Civilization_BuildingClassOverrides
--==========================================================================================================================
INSERT INTO Civilization_BuildingClassOverrides
		(CivilizationType, 				BuildingClassType, 				BuildingType)
VALUES	('CIVILIZATION_ORG_COIOT_POMO',	'BUILDINGCLASS_TEMPLE',			'BUILDING_ORG_COIOT_ROUNDHOUSE');
--==========================================================================================================================
-- Civilization_UnitClassOverrides
--==========================================================================================================================
INSERT INTO Civilization_UnitClassOverrides
		(CivilizationType, 				UnitClassType, 		UnitType)
VALUES	('CIVILIZATION_ORG_COIOT_POMO',	'UNITCLASS_ARTIST',	'UNIT_ORG_COIOT_BASKET_WEAVER');
--==========================================================================================================================
-- Civilization_CityNames
--==========================================================================================================================
INSERT INTO Civilization_CityNames
		(CivilizationType, 					CityName)
VALUES	('CIVILIZATION_ORG_COIOT_POMO', 	'TXT_KEY_CITY_NAME_ORG_COIOT_POMO_01'),
		('CIVILIZATION_ORG_COIOT_POMO', 	'TXT_KEY_CITY_NAME_ORG_COIOT_POMO_02'),
		('CIVILIZATION_ORG_COIOT_POMO', 	'TXT_KEY_CITY_NAME_ORG_COIOT_POMO_03'),
		('CIVILIZATION_ORG_COIOT_POMO', 	'TXT_KEY_CITY_NAME_ORG_COIOT_POMO_04'),
		('CIVILIZATION_ORG_COIOT_POMO', 	'TXT_KEY_CITY_NAME_ORG_COIOT_POMO_05'),
		('CIVILIZATION_ORG_COIOT_POMO', 	'TXT_KEY_CITY_NAME_ORG_COIOT_POMO_06'),
		('CIVILIZATION_ORG_COIOT_POMO', 	'TXT_KEY_CITY_NAME_ORG_COIOT_POMO_07'),
		('CIVILIZATION_ORG_COIOT_POMO', 	'TXT_KEY_CITY_NAME_ORG_COIOT_POMO_08'),
		('CIVILIZATION_ORG_COIOT_POMO', 	'TXT_KEY_CITY_NAME_ORG_COIOT_POMO_09'),
		('CIVILIZATION_ORG_COIOT_POMO', 	'TXT_KEY_CITY_NAME_ORG_COIOT_POMO_10'),
		('CIVILIZATION_ORG_COIOT_POMO', 	'TXT_KEY_CITY_NAME_ORG_COIOT_POMO_11'),
		('CIVILIZATION_ORG_COIOT_POMO', 	'TXT_KEY_CITY_NAME_ORG_COIOT_POMO_12'),
		('CIVILIZATION_ORG_COIOT_POMO', 	'TXT_KEY_CITY_NAME_ORG_COIOT_POMO_13'),
		('CIVILIZATION_ORG_COIOT_POMO', 	'TXT_KEY_CITY_NAME_ORG_COIOT_POMO_14'),
		('CIVILIZATION_ORG_COIOT_POMO', 	'TXT_KEY_CITY_NAME_ORG_COIOT_POMO_15'),
		('CIVILIZATION_ORG_COIOT_POMO', 	'TXT_KEY_CITY_NAME_ORG_COIOT_POMO_16'),
		('CIVILIZATION_ORG_COIOT_POMO', 	'TXT_KEY_CITY_NAME_ORG_COIOT_POMO_17'),
		('CIVILIZATION_ORG_COIOT_POMO', 	'TXT_KEY_CITY_NAME_ORG_COIOT_POMO_18'),
		('CIVILIZATION_ORG_COIOT_POMO', 	'TXT_KEY_CITY_NAME_ORG_COIOT_POMO_19'),
		('CIVILIZATION_ORG_COIOT_POMO', 	'TXT_KEY_CITY_NAME_ORG_COIOT_POMO_20'),
		('CIVILIZATION_ORG_COIOT_POMO', 	'TXT_KEY_CITY_NAME_ORG_COIOT_POMO_21'),
		('CIVILIZATION_ORG_COIOT_POMO', 	'TXT_KEY_CITY_NAME_ORG_COIOT_POMO_22'),
		('CIVILIZATION_ORG_COIOT_POMO', 	'TXT_KEY_CITY_NAME_ORG_COIOT_POMO_23'),
		('CIVILIZATION_ORG_COIOT_POMO', 	'TXT_KEY_CITY_NAME_ORG_COIOT_POMO_24'),
		('CIVILIZATION_ORG_COIOT_POMO', 	'TXT_KEY_CITY_NAME_ORG_COIOT_POMO_25'),
		('CIVILIZATION_ORG_COIOT_POMO', 	'TXT_KEY_CITY_NAME_ORG_COIOT_POMO_26'),
		('CIVILIZATION_ORG_COIOT_POMO', 	'TXT_KEY_CITY_NAME_ORG_COIOT_POMO_27'),
		('CIVILIZATION_ORG_COIOT_POMO', 	'TXT_KEY_CITY_NAME_ORG_COIOT_POMO_28'),
		('CIVILIZATION_ORG_COIOT_POMO', 	'TXT_KEY_CITY_NAME_ORG_COIOT_POMO_29'),
		('CIVILIZATION_ORG_COIOT_POMO', 	'TXT_KEY_CITY_NAME_ORG_COIOT_POMO_30'),
		('CIVILIZATION_ORG_COIOT_POMO', 	'TXT_KEY_CITY_NAME_ORG_COIOT_POMO_31'),
		('CIVILIZATION_ORG_COIOT_POMO', 	'TXT_KEY_CITY_NAME_ORG_COIOT_POMO_32'),
		('CIVILIZATION_ORG_COIOT_POMO', 	'TXT_KEY_CITY_NAME_ORG_COIOT_POMO_33'),
		('CIVILIZATION_ORG_COIOT_POMO', 	'TXT_KEY_CITY_NAME_ORG_COIOT_POMO_34'),
		('CIVILIZATION_ORG_COIOT_POMO', 	'TXT_KEY_CITY_NAME_ORG_COIOT_POMO_35'),
		('CIVILIZATION_ORG_COIOT_POMO', 	'TXT_KEY_CITY_NAME_ORG_COIOT_POMO_36'),
		('CIVILIZATION_ORG_COIOT_POMO', 	'TXT_KEY_CITY_NAME_ORG_COIOT_POMO_37'),
		('CIVILIZATION_ORG_COIOT_POMO', 	'TXT_KEY_CITY_NAME_ORG_COIOT_POMO_38'),
		('CIVILIZATION_ORG_COIOT_POMO', 	'TXT_KEY_CITY_NAME_ORG_COIOT_POMO_39'),
		('CIVILIZATION_ORG_COIOT_POMO', 	'TXT_KEY_CITY_NAME_ORG_COIOT_POMO_40'),
		('CIVILIZATION_ORG_COIOT_POMO', 	'TXT_KEY_CITY_NAME_ORG_COIOT_POMO_41'),
		('CIVILIZATION_ORG_COIOT_POMO', 	'TXT_KEY_CITY_NAME_ORG_COIOT_POMO_42'),
		('CIVILIZATION_ORG_COIOT_POMO', 	'TXT_KEY_CITY_NAME_ORG_COIOT_POMO_43'),
		('CIVILIZATION_ORG_COIOT_POMO', 	'TXT_KEY_CITY_NAME_ORG_COIOT_POMO_44'),
		('CIVILIZATION_ORG_COIOT_POMO', 	'TXT_KEY_CITY_NAME_ORG_COIOT_POMO_45'),
		('CIVILIZATION_ORG_COIOT_POMO', 	'TXT_KEY_CITY_NAME_ORG_COIOT_POMO_46'),
		('CIVILIZATION_ORG_COIOT_POMO', 	'TXT_KEY_CITY_NAME_ORG_COIOT_POMO_47'),
		('CIVILIZATION_ORG_COIOT_POMO', 	'TXT_KEY_CITY_NAME_ORG_COIOT_POMO_48'),
		('CIVILIZATION_ORG_COIOT_POMO', 	'TXT_KEY_CITY_NAME_ORG_COIOT_POMO_49'),
		('CIVILIZATION_ORG_COIOT_POMO', 	'TXT_KEY_CITY_NAME_ORG_COIOT_POMO_50');
--==========================================================================================================================
-- Civilization_FreeBuildingClasses
--==========================================================================================================================
INSERT INTO Civilization_FreeBuildingClasses
		(CivilizationType, 				BuildingClassType)
SELECT	'CIVILIZATION_ORG_COIOT_POMO',	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE CivilizationType = 'CIVILIZATION_IROQUOIS';
--==========================================================================================================================
-- Civilization_FreeTechs
--==========================================================================================================================
INSERT INTO Civilization_FreeTechs
		(CivilizationType, 				TechType)
SELECT	'CIVILIZATION_ORG_COIOT_POMO',	TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_IROQUOIS';
--==========================================================================================================================
-- Civilization_FreeUnits
--==========================================================================================================================
INSERT INTO Civilization_FreeUnits
		(CivilizationType, 				UnitClassType, Count, UnitAIType)
SELECT	'CIVILIZATION_ORG_COIOT_POMO',	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_IROQUOIS';
--==========================================================================================================================
-- Civilization_Leaders
--==========================================================================================================================
INSERT INTO Civilization_Leaders
		(CivilizationType, 				LeaderheadType)
VALUES	('CIVILIZATION_ORG_COIOT_POMO',	'LEADER_ORG_COIOT_ESSIE');
--==========================================================================================================================
-- Civilization_Religions
--==========================================================================================================================
INSERT INTO Civilization_Religions
		(CivilizationType, 				ReligionType)
VALUES	('CIVILIZATION_ORG_COIOT_POMO',	'RELIGION_PROTESTANTISM'); -- use the California Religions mod pls ;-;
--==========================================================================================================================
-- Civilization_SpyNames
--==========================================================================================================================
INSERT INTO Civilization_SpyNames
		(CivilizationType, 					SpyName)
VALUES	('CIVILIZATION_ORG_COIOT_POMO', 	'TXT_KEY_SPY_NAME_ORG_COIOT_POMO_0'),
		('CIVILIZATION_ORG_COIOT_POMO', 	'TXT_KEY_SPY_NAME_ORG_COIOT_POMO_1'),
		('CIVILIZATION_ORG_COIOT_POMO', 	'TXT_KEY_SPY_NAME_ORG_COIOT_POMO_2'),
		('CIVILIZATION_ORG_COIOT_POMO', 	'TXT_KEY_SPY_NAME_ORG_COIOT_POMO_3'),
		('CIVILIZATION_ORG_COIOT_POMO', 	'TXT_KEY_SPY_NAME_ORG_COIOT_POMO_4'),
		('CIVILIZATION_ORG_COIOT_POMO', 	'TXT_KEY_SPY_NAME_ORG_COIOT_POMO_5'),
		('CIVILIZATION_ORG_COIOT_POMO', 	'TXT_KEY_SPY_NAME_ORG_COIOT_POMO_6'),
		('CIVILIZATION_ORG_COIOT_POMO', 	'TXT_KEY_SPY_NAME_ORG_COIOT_POMO_7'),
		('CIVILIZATION_ORG_COIOT_POMO', 	'TXT_KEY_SPY_NAME_ORG_COIOT_POMO_8'),
		('CIVILIZATION_ORG_COIOT_POMO', 	'TXT_KEY_SPY_NAME_ORG_COIOT_POMO_9');
--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
--==========================================================================================================================	
-- BuildingClasses
--==========================================================================================================================	
INSERT INTO BuildingClasses
		(Type, 										DefaultBuilding, 						Description,								NoLimit)
VALUES	('BUILDINGCLASS_ORG_COIOT_RH_FAITH', 		'BUILDING_ORG_COIOT_RH_FAITH',			'TXT_KEY_BUILDING_ORG_COIOT_RH_FAITH',		0),
		('BUILDINGCLASS_ORG_COIOT_RH_PRESSURE',		'BUILDING_ORG_COIOT_RH_PRESSURE', 		'TXT_KEY_BUILDING_ORG_COIOT_RH_PRESSURE',	0),
		('BUILDINGCLASS_POMO_CONVERT_MARKER_DUMMY',	'BUILDING_POMO_CONVERT_MARKER_DUMMY',	'TXT_KEY_POMO_CONVERT_MARKER_DUMMY',		0),
		('BUILDINGCLASS_ORG_COIOT_EAST',			'BUILDING_ORG_COIOT_EAST',				'TXT_KEY_BUILDING_ORG_COIOT_EAST',			0),
		('BUILDINGCLASS_ORG_COIOT_WEST',			'BUILDING_ORG_COIOT_WEST',				'TXT_KEY_BUILDING_ORG_COIOT_WEST',			1),
		('BUILDINGCLASS_ORG_COIOT_BW_NORTH',		'BUILDING_ORG_COIOT_BW_NORTH',			'TXT_KEY_BUILDING_ORG_COIOT_BW_NORTH',		1),
		('BUILDINGCLASS_ORG_COIOT_BW_SOUTH',		'BUILDING_ORG_COIOT_BW_SOUTH',			'TXT_KEY_BUILDING_ORG_COIOT_BW_SOUTH',		1),
		('BUILDINGCLASS_ORG_COIOT_BW_EAST',			'BUILDING_ORG_COIOT_BW_EAST',			'TXT_KEY_BUILDING_ORG_COIOT_BW_EAST',		1),
		('BUILDINGCLASS_ORG_COIOT_BW_WEST',			'BUILDING_ORG_COIOT_BW_WEST',			'TXT_KEY_BUILDING_ORG_COIOT_BW_WEST',		1);
--==========================================================================================================================	
-- Buildings
--==========================================================================================================================
INSERT INTO Buildings
		(Type, 							 	GreatWorkSlotType, 				GreatWorkCount, Cost, FaithCost, PrereqTech, BuildingClass,	PrereqTech,	FreeStartEra, GoldMaintenance, MinAreaSize, SpecialistCount, SpecialistType, MutuallyExclusiveGroup, DisplayPosition, ArtDefineTag, ArtInfoEraVariation, NeverCapture,	Description, 								Help, 											Strategy,											Civilopedia, 								ArtDefineTag,	PortraitIndex,	IconAtlas)
SELECT	 'BUILDING_ORG_COIOT_ROUNDHOUSE',	'GREAT_WORK_SLOT_ART_ARTIFACT', 1, 				Cost, FaithCost, PrereqTech, BuildingClass,	PrereqTech,	FreeStartEra, GoldMaintenance, MinAreaSize, SpecialistCount, SpecialistType, MutuallyExclusiveGroup, DisplayPosition, ArtDefineTag, ArtInfoEraVariation, 1,				'TXT_KEY_BUILDING_ORG_COIOT_ROUNDHOUSE', 	'TXT_KEY_BUILDING_ORG_COIOT_ROUNDHOUSE_HELP',	'TXT_KEY_BUILDING_ORG_COIOT_ROUNDHOUSE_STRATEGY',	'TXT_KEY_CIV5_ORG_COIOT_ROUNDHOUSE_TEXT',	ArtDefineTag,	2, 				'ORG_COIOT_POMO_ATLAS'
FROM Buildings WHERE Type = 'BUILDING_TEMPLE';

INSERT INTO Buildings
		(Type,								BuildingClass,							ReligiousPressureModifier,	GlobalGreatPeopleRateModifier,	Cost,	FaithCost,	NeverCapture,	PrereqTech, Description,								Help,											PortraitIndex,	IconAtlas)	
VALUES	('BUILDING_ORG_COIOT_RH_FAITH',		'BUILDINGCLASS_ORG_COIOT_RH_FAITH',		0,							0,								-1,		-1,			1,				null,		'TXT_KEY_BUILDING_ORG_COIOT_RH_FAITH',		'TXT_KEY_BUILDING_ORG_COIOT_RH_FAITH_HELP',		2,				'ORG_COIOT_POMO_ATLAS'),
		('BUILDING_ORG_COIOT_RH_PRESSURE',	'BUILDINGCLASS_ORG_COIOT_RH_PRESSURE',	10,							0,								-1,		-1,			1,				null,		'TXT_KEY_BUILDING_ORG_COIOT_RH_PRESSURE',	'TXT_KEY_BUILDING_ORG_COIOT_RH_PRESSURE_HELP',	2,				'ORG_COIOT_POMO_ATLAS'),
		('BUILDING_ORG_COIOT_EAST',			'BUILDINGCLASS_ORG_COIOT_EAST',			0,							20,								-1,		-1,			1,				null,		'TXT_KEY_BUILDING_ORG_COIOT_EAST',			'TXT_KEY_BUILDING_ORG_COIOT_EAST_HELP',			1,				'ORG_COIOT_POMO_ATLAS'),
		('BUILDING_ORG_COIOT_WEST',			'BUILDINGCLASS_ORG_COIOT_WEST',			0,							0,								-1,		-1,			1,				null,		'TXT_KEY_BUILDING_ORG_COIOT_WEST',			'TXT_KEY_BUILDING_ORG_COIOT_WEST_HELP',			1,				'ORG_COIOT_POMO_ATLAS'),
		('BUILDING_ORG_COIOT_BW_NORTH',		'BUILDINGCLASS_ORG_COIOT_BW_NORTH',		0,							0,								-1,		-1,			1,				null,		'TXT_KEY_BUILDING_ORG_COIOT_BW_NORTH',		'TXT_KEY_BUILDING_ORG_COIOT_BW_NORTH_HELP',		4,				'ORG_COIOT_POMO_ATLAS'),
		('BUILDING_ORG_COIOT_BW_SOUTH',		'BUILDINGCLASS_ORG_COIOT_BW_SOUTH',		0,							0,								-1,		-1,			1,				null,		'TXT_KEY_BUILDING_ORG_COIOT_BW_SOUTH',		'TXT_KEY_BUILDING_ORG_COIOT_BW_SOUTH_HELP',		4,				'ORG_COIOT_POMO_ATLAS'),
		('BUILDING_ORG_COIOT_BW_EAST',		'BUILDINGCLASS_ORG_COIOT_BW_EAST',		0,							0,								-1,		-1,			1,				null,		'TXT_KEY_BUILDING_ORG_COIOT_BW_EAST',		'TXT_KEY_BUILDING_ORG_COIOT_BW_EAST_HELP',		4,				'ORG_COIOT_POMO_ATLAS'),
		('BUILDING_ORG_COIOT_BW_WEST',		'BUILDINGCLASS_ORG_COIOT_BW_WEST',		0,							0,								-1,		-1,			1,				null,		'TXT_KEY_BUILDING_ORG_COIOT_BW_WEST',		'TXT_KEY_BUILDING_ORG_COIOT_BW_WEST_HELP',		4,				'ORG_COIOT_POMO_ATLAS');

INSERT INTO Buildings		
		(Type, 									BuildingClass, 			  					Cost,  FaithCost, GreatWorkCount,	NeverCapture,	Description, 									Help)
VALUES	('BUILDING_POMO_CONVERT_MARKER_DUMMY',	'BUILDINGCLASS_POMO_CONVERT_MARKER_DUMMY',	-1,    -1,		  -1,				1,				'TXT_KEY_BUILDING_POMO_CONVERT_MARKER_DUMMY',	'TXT_KEY_BUILDING_POMO_CONVERT_MARKER_DUMMY_HELP');
--==========================================================================================================================	
-- Building_ClassesNeededInCity
--==========================================================================================================================
INSERT INTO Building_ClassesNeededInCity
		(BuildingType, 						BuildingClassType)
SELECT	'BUILDING_ORG_COIOT_ROUNDHOUSE',	BuildingClassType
FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_TEMPLE';
--==========================================================================================================================	
-- Building_YieldChanges
--==========================================================================================================================
INSERT INTO Building_YieldChanges
		(BuildingType, 					YieldType,			Yield)
VALUES	('BUILDING_ORG_COIOT_RH_FAITH',	'YIELD_FAITH',		1),
		('BUILDING_ORG_COIOT_BW_NORTH',	'YIELD_FOOD',		4),
		('BUILDING_ORG_COIOT_BW_SOUTH',	'YIELD_FAITH',		4),
		('BUILDING_ORG_COIOT_BW_EAST',	'YIELD_CULTURE',	4),
		('BUILDING_ORG_COIOT_BW_WEST',	'YIELD_GOLD',		4);
--==========================================================================================================================
-- Building_YieldModifiers
--==========================================================================================================================
INSERT INTO Building_YieldModifiers
		(BuildingType,				YieldType,		Yield)
VALUES	('BUILDING_ORG_COIOT_WEST',	'YIELD_FOOD',	5);
--==========================================================================================================================	
-- Building_Flavors
--==========================================================================================================================
INSERT INTO Building_Flavors
		(BuildingType, 						FlavorType,			Flavor)
VALUES	('BUILDING_ORG_COIOT_ROUNDHOUSE',	'FLAVOR_RELIGION',	60);
--==========================================================================================================================	
-- UNITS
--==========================================================================================================================	
-- Units
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Units
		(Type, 							Class, Cost,  Moves, CivilianAttackPriority, Special, Domain, DefaultUnitAI, WorkRate, CombatLimit, GoldenAgeTurns, MoveRate, 	Description, 							Civilopedia, 									Strategy,											Help,											MilitarySupport, MilitaryProduction, Pillage, AdvancedStartCost, CombatLimit,	UnitArtInfo, 							UnitFlagIconOffset, UnitFlagAtlas,								PortraitIndex, 	IconAtlas)
SELECT	'UNIT_ORG_COIOT_BASKET_WEAVER',	Class, Cost,  Moves, CivilianAttackPriority, Special, Domain, DefaultUnitAI, WorkRate, CombatLimit, GoldenAgeTurns,	MoveRate,	'TXT_KEY_UNIT_ORG_COIOT_BASKET_WEAVER',	'TXT_KEY_CIV5_ORG_COIOT_BASKET_WEAVER_TEXT',	'TXT_KEY_UNIT_ORG_COIOT_BASKET_WEAVER_STRATEGY',	'TXT_KEY_UNIT_ORG_COIOT_BASKET_WEAVER_HELP',  	MilitarySupport, MilitaryProduction, Pillage, AdvancedStartCost, CombatLimit, 	'ART_DEF_UNIT_ORG_COIOT_BASKET_WEAVER',	0, 					'ORG_COIOT_UNIT_FLAG_BASKET_WEAVER_ATLAS',	4, 				'ORG_COIOT_POMO_ATLAS'
FROM Units WHERE Type = 'UNIT_ARTIST';
--------------------------------
-- UnitGameplay2DScripts
--------------------------------
INSERT INTO UnitGameplay2DScripts
		(UnitType, 						SelectionSound, FirstSelectionSound)
SELECT	'UNIT_ORG_COIOT_BASKET_WEAVER',	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_ARTIST';
--------------------------------
-- Unit_AITypes
--------------------------------
INSERT INTO Unit_AITypes
		(UnitType, 							UnitAIType)
VALUES	('UNIT_ORG_COIOT_BASKET_WEAVER', 	'UNITAI_ARTIST');
--------------------------------
-- Unit_Flavors
--------------------------------
INSERT INTO Unit_Flavors
		(UnitType, 						FlavorType,	 Flavor)
SELECT	'UNIT_ORG_COIOT_BASKET_WEAVER',	FlavorType,	 Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_ARTIST';
--==========================================================================================================================
-- UnitPromotions
--==========================================================================================================================
INSERT INTO UnitPromotions
		(Type,							Description,							Help,                                       Sound,				EnemyHealChange,    NeutralHealChange,	FriendlyHealChange,	MovesChange,	CannotBeChosen, PortraitIndex,	IconAtlas,			PediaType,          PediaEntry)
VALUES	('PROMOTION_ORG_COIOT_SOUTH',   'TXT_KEY_PROMOTION_ORG_COIOT_SOUTH',	'TXT_KEY_PROMOTION_ORG_COIOT_SOUTH_HELP',	'AS2D_IF_LEVELUP',  10,					10,					10,					0,				1,              58,				'ABILITY_ATLAS',	'PEDIA_ATTRIBUTES',	'TXT_KEY_PROMOTION_ORG_COIOT_SOUTH'),
		('PROMOTION_ORG_COIOT_NORTH',   'TXT_KEY_PROMOTION_ORG_COIOT_NORTH',	'TXT_KEY_PROMOTION_ORG_COIOT_NORTH_HELP',	'AS2D_IF_LEVELUP',  0,					0,					0,					1,				1,              58,				'ABILITY_ATLAS',	'PEDIA_ATTRIBUTES',	'TXT_KEY_PROMOTION_ORG_COIOT_NORTH');
--==========================================================================================================================
-- GreatWorks
--==========================================================================================================================
-- Besides the couple people that have generic images, these are all images of baskets those specific people made. Most of the people and images I got from Remember Your Relations: The Elsie Allen Baskets, Family and Friends by Suzanne Abel-Vidor, Dot Brovarney, and Susan Billy. Susan Billy herself is a weaver on this list.
-- Most museums and collections fail to properly identify the creators of baskets, merely describing them as a Pomo basket, sometimes specifying its use, and often describing its size. 
INSERT INTO GreatWorks
		(Type,									Description,									GreatWorkClassType,	Image,						Audio,						 ArchaeologyOnly)
VALUES	('GREAT_WORK_ORG_COIOT_BASKET_1',		'TXT_KEY_GREAT_WORK_ORG_COIOT_BASKET_S',		'GREAT_WORK_ART',	'essieparrish.dds',			'AS2D_GREAT_ARTIST_ARTWORK', 0), -- essie parrish
		('GREAT_WORK_ORG_COIOT_BASKET_2',		'TXT_KEY_GREAT_WORK_ORG_COIOT_BASKET_MINI',		'GREAT_WORK_ART',	'susanbilly.dds',			'AS2D_GREAT_ARTIST_ARTWORK', 0), -- susan billy
		('GREAT_WORK_ORG_COIOT_BASKET_3',		'TXT_KEY_GREAT_WORK_ORG_COIOT_BASKET',			'GREAT_WORK_ART',	'mabelmckay.dds',			'AS2D_GREAT_ARTIST_ARTWORK', 0), -- mabel mckay
		('GREAT_WORK_ORG_COIOT_BASKET_4',		'TXT_KEY_GREAT_WORK_ORG_COIOT_BASKET_FEATHER',	'GREAT_WORK_ART',	'juliafparker.dds',			'AS2D_GREAT_ARTIST_ARTWORK', 0), -- julia f parker
		('GREAT_WORK_ORG_COIOT_BASKET_5',		'TXT_KEY_GREAT_WORK_ORG_COIOT_BASKET_S',		'GREAT_WORK_ART',	'elsieallen.dds',			'AS2D_GREAT_ARTIST_ARTWORK', 0), -- elsie allen
		('GREAT_WORK_ORG_COIOT_BASKET_6',		'TXT_KEY_GREAT_WORK_ORG_COIOT_BASKET',			'GREAT_WORK_ART',	'williambenson.dds',		'AS2D_GREAT_ARTIST_ARTWORK', 0), -- william benson (the image was actually made by both william and mary, cause i couldn't find one that credited only him besides a pair of earrings)
		('GREAT_WORK_ORG_COIOT_BASKET_7',		'TXT_KEY_GREAT_WORK_ORG_COIOT_BASKET',			'GREAT_WORK_ART',	'marybenson.dds',			'AS2D_GREAT_ARTIST_ARTWORK', 0), -- mary knight benson
		('GREAT_WORK_ORG_COIOT_BASKET_8',		'TXT_KEY_GREAT_WORK_ORG_COIOT_BASKET_CRADLE',	'GREAT_WORK_ART',	'luwanaquitiquit.dds',		'AS2D_GREAT_ARTIST_ARTWORK', 0), -- luwana quitiquit
		('GREAT_WORK_ORG_COIOT_BASKET_9', 		'TXT_KEY_GREAT_WORK_ORG_COIOT_BASKET_MINI_S',	'GREAT_WORK_ART',	'laurasomersal.dds', 		'AS2D_GREAT_ARTIST_ARTWORK', 0), -- laura somersal
		('GREAT_WORK_ORG_COIOT_BASKET_10',		'TXT_KEY_GREAT_WORK_ORG_COIOT_BASKET_S',		'GREAT_WORK_ART',	'annielake.dds',			'AS2D_GREAT_ARTIST_ARTWORK', 0), -- annie burke lake
		('GREAT_WORK_ORG_COIOT_BASKET_11',		'TXT_KEY_GREAT_WORK_ORG_COIOT_BASKET',			'GREAT_WORK_ART',	'maryarnold.dds',			'AS2D_GREAT_ARTIST_ARTWORK', 0), -- mary arnold
		('GREAT_WORK_ORG_COIOT_BASKET_12',		'TXT_KEY_GREAT_WORK_ORG_COIOT_BASKET_UNKNOWN',	'GREAT_WORK_ART',	'genericbasket.dds',		'AS2D_GREAT_ARTIST_ARTWORK', 0), -- gunsissie (generic basket from art institute of chicago)
		('GREAT_WORK_ORG_COIOT_BASKET_13',		'TXT_KEY_GREAT_WORK_ORG_COIOT_BASKET_FEATHER',	'GREAT_WORK_ART',	'susiesantiagobilly.dds',	'AS2D_GREAT_ARTIST_ARTWORK', 0), -- susie santiago billy
		('GREAT_WORK_ORG_COIOT_BASKET_14',		'TXT_KEY_GREAT_WORK_ORG_COIOT_BASKET',			'GREAT_WORK_ART',	'nellieburke.dds',			'AS2D_GREAT_ARTIST_ARTWORK', 0), -- nellie burke
		('GREAT_WORK_ORG_COIOT_BASKET_15',		'TXT_KEY_GREAT_WORK_ORG_COIOT_BASKET_FEATHER',	'GREAT_WORK_ART',	'clintmckay.dds',			'AS2D_GREAT_ARTIST_ARTWORK', 0), -- clint mckay
		('GREAT_WORK_ORG_COIOT_BASKET_16',		'TXT_KEY_GREAT_WORK_ORG_COIOT_BASKET',			'GREAT_WORK_ART',	'corinepearce.dds',			'AS2D_GREAT_ARTIST_ARTWORK', 0), -- corine pearce
		('GREAT_WORK_ORG_COIOT_BASKET_17',		'TXT_KEY_GREAT_WORK_ORG_COIOT_BASKET',			'GREAT_WORK_ART',	'lorrainelockhart.dds',		'AS2D_GREAT_ARTIST_ARTWORK', 0), -- lorraine lockhart (well, not sure if hers, but it's next to her in an image of her and annie burke)
		('GREAT_WORK_ORG_COIOT_BASKET_18', 		'TXT_KEY_GREAT_WORK_ORG_COIOT_BASKET_UNKNOWN',	'GREAT_WORK_ART',	'genericbasket.dds',		'AS2D_GREAT_ARTIST_ARTWORK', 0), -- myrtle mccoy (generic basket from art institute of chicago)
		('GREAT_WORK_ORG_COIOT_BASKET_19',		'TXT_KEY_GREAT_WORK_ORG_COIOT_BASKET_UNKNOWN',	'GREAT_WORK_ART',	'genericbasket.dds',		'AS2D_GREAT_ARTIST_ARTWORK', 0), -- belle viriol (generic basket from art institute of chicago)
		('GREAT_WORK_ORG_COIOT_BASKET_20',		'TXT_KEY_GREAT_WORK_ORG_COIOT_BASKET_UNKNOWN',	'GREAT_WORK_ART',	'genericbasket.dds',		'AS2D_GREAT_ARTIST_ARTWORK', 0), -- mary smith (generic basket from art institute of chicago)
		('GREAT_WORK_ORG_COIOT_BASKET_21',		'TXT_KEY_GREAT_WORK_ORG_COIOT_BASKET',			'GREAT_WORK_ART',	'agnessantana.dds',			'AS2D_GREAT_ARTIST_ARTWORK', 0), -- agnes santana
		('GREAT_WORK_ORG_COIOT_BASKET_22',		'TXT_KEY_GREAT_WORK_ORG_COIOT_BASKET',			'GREAT_WORK_ART',	'laurawilbell.dds',			'AS2D_GREAT_ARTIST_ARTWORK', 0), -- laura wilbell
		('GREAT_WORK_ORG_COIOT_BASKET_23',		'TXT_KEY_GREAT_WORK_ORG_COIOT_BASKET',			'GREAT_WORK_ART',	'mowshaedwards.dds',		'AS2D_GREAT_ARTIST_ARTWORK', 0), -- mow-sha edwards
		('GREAT_WORK_ORG_COIOT_BASKET_24',		'TXT_KEY_GREAT_WORK_ORG_COIOT_BASKET',			'GREAT_WORK_ART',	'rhodaknight.dds',			'AS2D_GREAT_ARTIST_ARTWORK', 0), -- rhoda knight
		('GREAT_WORK_ORG_COIOT_BASKET_25',		'TXT_KEY_GREAT_WORK_ORG_COIOT_BASKET',			'GREAT_WORK_ART',	'ethelburke.dds',			'AS2D_GREAT_ARTIST_ARTWORK', 0), -- ethel burke
		('GREAT_WORK_ORG_COIOT_BASKET_26',		'TXT_KEY_GREAT_WORK_ORG_COIOT_BASKET_MINI_S',	'GREAT_WORK_ART',	'gladyslockhart.dds',		'AS2D_GREAT_ARTIST_ARTWORK', 0), -- gladys lockhart
		('GREAT_WORK_ORG_COIOT_BASKET_27',		'TXT_KEY_GREAT_WORK_ORG_COIOT_BASKET',			'GREAT_WORK_ART',	'myrtlechavez.dds',			'AS2D_GREAT_ARTIST_ARTWORK', 0), -- myrtle mckay chavez
		('GREAT_WORK_ORG_COIOT_BASKET_28',		'TXT_KEY_GREAT_WORK_ORG_COIOT_BASKET',			'GREAT_WORK_ART',	'molliejackson.dds',		'AS2D_GREAT_ARTIST_ARTWORK', 0), -- mollie jackson
		('GREAT_WORK_ORG_COIOT_BASKET_29',		'TXT_KEY_GREAT_WORK_ORG_COIOT_BASKET',			'GREAT_WORK_ART',	'aliceelliott.dds',			'AS2D_GREAT_ARTIST_ARTWORK', 0), -- alice elliott
		('GREAT_WORK_ORG_COIOT_BASKET_30',		'TXT_KEY_GREAT_WORK_ORG_COIOT_BASKET_FEATHER',	'GREAT_WORK_ART',	'suzanneholder.dds',		'AS2D_GREAT_ARTIST_ARTWORK', 0), -- suzanne holder
		('GREAT_WORK_ORG_COIOT_BASKET_31',		'TXT_KEY_GREAT_WORK_ORG_COIOT_BASKET',			'GREAT_WORK_ART',	'lydiafaught.dds',			'AS2D_GREAT_ARTIST_ARTWORK', 0), -- lydia faught
		('GREAT_WORK_ORG_COIOT_BASKET_32',		'TXT_KEY_GREAT_WORK_ORG_COIOT_BASKET_FEATHER',	'GREAT_WORK_ART',	'annieboone.dds',			'AS2D_GREAT_ARTIST_ARTWORK', 0), -- annie boone
		('GREAT_WORK_ORG_COIOT_BASKET_33',		'TXT_KEY_GREAT_WORK_ORG_COIOT_BASKET',			'GREAT_WORK_ART',	'noracooper.dds',			'AS2D_GREAT_ARTIST_ARTWORK', 0), -- nora cooper
		('GREAT_WORK_ORG_COIOT_BASKET_34',		'TXT_KEY_GREAT_WORK_ORG_COIOT_BASKET',			'GREAT_WORK_ART',	'walawala.dds',				'AS2D_GREAT_ARTIST_ARTWORK', 0), -- wala wala
		('GREAT_WORK_ORG_COIOT_BASKET_35',		'TXT_KEY_GREAT_WORK_ORG_COIOT_BASKET',			'GREAT_WORK_ART',	'salomealcantra.dds',		'AS2D_GREAT_ARTIST_ARTWORK', 0), -- salome alcantra
		('GREAT_WORK_ORG_COIOT_BASKET_36',		'TXT_KEY_GREAT_WORK_ORG_COIOT_BASKET',			'GREAT_WORK_ART',	'maudescott.dds',			'AS2D_GREAT_ARTIST_ARTWORK', 0), -- maude scott
		('GREAT_WORK_ORG_COIOT_BASKET_37',		'TXT_KEY_GREAT_WORK_ORG_COIOT_BASKET_S',		'GREAT_WORK_ART',	'annieburke.dds',			'AS2D_GREAT_ARTIST_ARTWORK', 0), -- annie burke
		('GREAT_WORK_ORG_COIOT_BASKET_38',		'TXT_KEY_GREAT_WORK_ORG_COIOT_BASKET',			'GREAT_WORK_ART',	'mrskyman.dds',				'AS2D_GREAT_ARTIST_ARTWORK', 0), -- mrs kyman
		('GREAT_WORK_ORG_COIOT_BASKET_39',		'TXT_KEY_GREAT_WORK_ORG_COIOT_BASKET_MINI',		'GREAT_WORK_ART',	'evelynlake.dds',			'AS2D_GREAT_ARTIST_ARTWORK', 0), -- evelyn lake
		('GREAT_WORK_ORG_COIOT_BASKET_40',		'TXT_KEY_GREAT_WORK_ORG_COIOT_BASKET',			'GREAT_WORK_ART',	'sarahknight.dds',			'AS2D_GREAT_ARTIST_ARTWORK', 0); -- sarah knight
--------------------------------
-- Unit_UniqueNames
--------------------------------
INSERT INTO Unit_UniqueNames
		(UnitType,							UniqueName,								GreatWorkType)
VALUES	('UNIT_ORG_COIOT_BASKET_WEAVER',	'TXT_KEY_ORG_COIOT_BASKET_WEAVER_1',	'GREAT_WORK_ORG_COIOT_BASKET_1'),
		('UNIT_ORG_COIOT_BASKET_WEAVER',	'TXT_KEY_ORG_COIOT_BASKET_WEAVER_2',	'GREAT_WORK_ORG_COIOT_BASKET_2'),
		('UNIT_ORG_COIOT_BASKET_WEAVER',	'TXT_KEY_ORG_COIOT_BASKET_WEAVER_3',	'GREAT_WORK_ORG_COIOT_BASKET_3'),
		('UNIT_ORG_COIOT_BASKET_WEAVER',	'TXT_KEY_ORG_COIOT_BASKET_WEAVER_4',	'GREAT_WORK_ORG_COIOT_BASKET_4'),
		('UNIT_ORG_COIOT_BASKET_WEAVER',	'TXT_KEY_ORG_COIOT_BASKET_WEAVER_5',	'GREAT_WORK_ORG_COIOT_BASKET_5'),
		('UNIT_ORG_COIOT_BASKET_WEAVER',	'TXT_KEY_ORG_COIOT_BASKET_WEAVER_6',	'GREAT_WORK_ORG_COIOT_BASKET_6'),
		('UNIT_ORG_COIOT_BASKET_WEAVER',	'TXT_KEY_ORG_COIOT_BASKET_WEAVER_7',	'GREAT_WORK_ORG_COIOT_BASKET_7'),
		('UNIT_ORG_COIOT_BASKET_WEAVER',	'TXT_KEY_ORG_COIOT_BASKET_WEAVER_8',	'GREAT_WORK_ORG_COIOT_BASKET_8'),
		('UNIT_ORG_COIOT_BASKET_WEAVER',	'TXT_KEY_ORG_COIOT_BASKET_WEAVER_9', 	'GREAT_WORK_ORG_COIOT_BASKET_9'),
		('UNIT_ORG_COIOT_BASKET_WEAVER',	'TXT_KEY_ORG_COIOT_BASKET_WEAVER_10', 	'GREAT_WORK_ORG_COIOT_BASKET_10'),
		('UNIT_ORG_COIOT_BASKET_WEAVER', 	'TXT_KEY_ORG_COIOT_BASKET_WEAVER_11', 	'GREAT_WORK_ORG_COIOT_BASKET_11'),
		('UNIT_ORG_COIOT_BASKET_WEAVER', 	'TXT_KEY_ORG_COIOT_BASKET_WEAVER_12',	'GREAT_WORK_ORG_COIOT_BASKET_12'),
		('UNIT_ORG_COIOT_BASKET_WEAVER', 	'TXT_KEY_ORG_COIOT_BASKET_WEAVER_13',	'GREAT_WORK_ORG_COIOT_BASKET_13'),
		('UNIT_ORG_COIOT_BASKET_WEAVER', 	'TXT_KEY_ORG_COIOT_BASKET_WEAVER_14',	'GREAT_WORK_ORG_COIOT_BASKET_14'),
		('UNIT_ORG_COIOT_BASKET_WEAVER', 	'TXT_KEY_ORG_COIOT_BASKET_WEAVER_15',	'GREAT_WORK_ORG_COIOT_BASKET_15'),
		('UNIT_ORG_COIOT_BASKET_WEAVER', 	'TXT_KEY_ORG_COIOT_BASKET_WEAVER_16',	'GREAT_WORK_ORG_COIOT_BASKET_16'),
		('UNIT_ORG_COIOT_BASKET_WEAVER', 	'TXT_KEY_ORG_COIOT_BASKET_WEAVER_17',	'GREAT_WORK_ORG_COIOT_BASKET_17'),
		('UNIT_ORG_COIOT_BASKET_WEAVER', 	'TXT_KEY_ORG_COIOT_BASKET_WEAVER_18', 	'GREAT_WORK_ORG_COIOT_BASKET_18'),
		('UNIT_ORG_COIOT_BASKET_WEAVER', 	'TXT_KEY_ORG_COIOT_BASKET_WEAVER_19', 	'GREAT_WORK_ORG_COIOT_BASKET_19'),
		('UNIT_ORG_COIOT_BASKET_WEAVER', 	'TXT_KEY_ORG_COIOT_BASKET_WEAVER_20', 	'GREAT_WORK_ORG_COIOT_BASKET_20'),
		('UNIT_ORG_COIOT_BASKET_WEAVER', 	'TXT_KEY_ORG_COIOT_BASKET_WEAVER_21',	'GREAT_WORK_ORG_COIOT_BASKET_21'),
		('UNIT_ORG_COIOT_BASKET_WEAVER',	'TXT_KEY_ORG_COIOT_BASKET_WEAVER_22',	'GREAT_WORK_ORG_COIOT_BASKET_22'),
		('UNIT_ORG_COIOT_BASKET_WEAVER',	'TXT_KEY_ORG_COIOT_BASKET_WEAVER_23',	'GREAT_WORK_ORG_COIOT_BASKET_23'),
		('UNIT_ORG_COIOT_BASKET_WEAVER',	'TXT_KEY_ORG_COIOT_BASKET_WEAVER_24',	'GREAT_WORK_ORG_COIOT_BASKET_24'),
		('UNIT_ORG_COIOT_BASKET_WEAVER',	'TXT_KEY_ORG_COIOT_BASKET_WEAVER_25',	'GREAT_WORK_ORG_COIOT_BASKET_25'),
		('UNIT_ORG_COIOT_BASKET_WEAVER',	'TXT_KEY_ORG_COIOT_BASKET_WEAVER_26',	'GREAT_WORK_ORG_COIOT_BASKET_26'),
		('UNIT_ORG_COIOT_BASKET_WEAVER',	'TXT_KEY_ORG_COIOT_BASKET_WEAVER_27',	'GREAT_WORK_ORG_COIOT_BASKET_27'),
		('UNIT_ORG_COIOT_BASKET_WEAVER',	'TXT_KEY_ORG_COIOT_BASKET_WEAVER_28',	'GREAT_WORK_ORG_COIOT_BASKET_28'),
		('UNIT_ORG_COIOT_BASKET_WEAVER',	'TXT_KEY_ORG_COIOT_BASKET_WEAVER_29',	'GREAT_WORK_ORG_COIOT_BASKET_29'),
		('UNIT_ORG_COIOT_BASKET_WEAVER',	'TXT_KEY_ORG_COIOT_BASKET_WEAVER_30',	'GREAT_WORK_ORG_COIOT_BASKET_30'),
		('UNIT_ORG_COIOT_BASKET_WEAVER',	'TXT_KEY_ORG_COIOT_BASKET_WEAVER_31',	'GREAT_WORK_ORG_COIOT_BASKET_31'),
		('UNIT_ORG_COIOT_BASKET_WEAVER',	'TXT_KEY_ORG_COIOT_BASKET_WEAVER_32',	'GREAT_WORK_ORG_COIOT_BASKET_32'),
		('UNIT_ORG_COIOT_BASKET_WEAVER',	'TXT_KEY_ORG_COIOT_BASKET_WEAVER_33',	'GREAT_WORK_ORG_COIOT_BASKET_33'),
		('UNIT_ORG_COIOT_BASKET_WEAVER',	'TXT_KEY_ORG_COIOT_BASKET_WEAVER_34',	'GREAT_WORK_ORG_COIOT_BASKET_34'),
		('UNIT_ORG_COIOT_BASKET_WEAVER',	'TXT_KEY_ORG_COIOT_BASKET_WEAVER_35',	'GREAT_WORK_ORG_COIOT_BASKET_35'),
		('UNIT_ORG_COIOT_BASKET_WEAVER',	'TXT_KEY_ORG_COIOT_BASKET_WEAVER_36',	'GREAT_WORK_ORG_COIOT_BASKET_36'),
		('UNIT_ORG_COIOT_BASKET_WEAVER',	'TXT_KEY_ORG_COIOT_BASKET_WEAVER_37',	'GREAT_WORK_ORG_COIOT_BASKET_37'),
		('UNIT_ORG_COIOT_BASKET_WEAVER',	'TXT_KEY_ORG_COIOT_BASKET_WEAVER_38',	'GREAT_WORK_ORG_COIOT_BASKET_38'),
		('UNIT_ORG_COIOT_BASKET_WEAVER',	'TXT_KEY_ORG_COIOT_BASKET_WEAVER_39',	'GREAT_WORK_ORG_COIOT_BASKET_39'),
		('UNIT_ORG_COIOT_BASKET_WEAVER',	'TXT_KEY_ORG_COIOT_BASKET_WEAVER_40',	'GREAT_WORK_ORG_COIOT_BASKET_40');
--==========================================================================================================================
-- LEADERS
--==========================================================================================================================
-- Leaders
--------------------------------
INSERT INTO Leaders
		(Type, 						Description, 						Civilopedia, 							CivilopediaTag, 								ArtDefineTag, 		VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 				PortraitIndex)
VALUES	('LEADER_ORG_COIOT_ESSIE', 	'TXT_KEY_LEADER_ORG_COIOT_ESSIE',	'TXT_KEY_LEADER_ORG_COIOT_ESSIE_PEDIA',	'TXT_KEY_CIVILOPEDIA_LEADERS_ORG_COIOT_ESSIE', 	'Essie_Scene.xml',	7, 						5, 						3, 							7, 			6, 				9, 				8, 						7, 				4, 			3, 			2, 				5, 			5, 			'ORG_COIOT_POMO_ATLAS',	0);
--------------------------------
-- Leader_MajorCivApproachBiases
--------------------------------
INSERT INTO Leader_MajorCivApproachBiases
		(LeaderType, 				MajorCivApproachType, 				Bias)
VALUES	('LEADER_ORG_COIOT_ESSIE', 	'MAJOR_CIV_APPROACH_WAR', 			6),
		('LEADER_ORG_COIOT_ESSIE', 	'MAJOR_CIV_APPROACH_HOSTILE', 		7),
		('LEADER_ORG_COIOT_ESSIE', 	'MAJOR_CIV_APPROACH_DECEPTIVE', 	3),
		('LEADER_ORG_COIOT_ESSIE', 	'MAJOR_CIV_APPROACH_GUARDED', 		8),
		('LEADER_ORG_COIOT_ESSIE', 	'MAJOR_CIV_APPROACH_AFRAID', 		4),
		('LEADER_ORG_COIOT_ESSIE', 	'MAJOR_CIV_APPROACH_FRIENDLY', 		8),
		('LEADER_ORG_COIOT_ESSIE', 	'MAJOR_CIV_APPROACH_NEUTRAL', 		2);
--------------------------------
-- Leader_MinorCivApproachBiases
--------------------------------
INSERT INTO Leader_MinorCivApproachBiases
		(LeaderType, 				MinorCivApproachType, 				Bias)
VALUES	('LEADER_ORG_COIOT_ESSIE', 	'MINOR_CIV_APPROACH_IGNORE', 		7),
		('LEADER_ORG_COIOT_ESSIE', 	'MINOR_CIV_APPROACH_FRIENDLY', 		5),
		('LEADER_ORG_COIOT_ESSIE', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	4),
		('LEADER_ORG_COIOT_ESSIE', 	'MINOR_CIV_APPROACH_CONQUEST', 		4),
		('LEADER_ORG_COIOT_ESSIE', 	'MINOR_CIV_APPROACH_BULLY', 		3);
--------------------------------
-- Leader_Flavors
--------------------------------
INSERT INTO Leader_Flavors
		(LeaderType, 				FlavorType, 						Flavor)
VALUES	('LEADER_ORG_COIOT_ESSIE', 	'FLAVOR_OFFENSE', 					6),
		('LEADER_ORG_COIOT_ESSIE', 	'FLAVOR_DEFENSE', 					5),
		('LEADER_ORG_COIOT_ESSIE', 	'FLAVOR_CITY_DEFENSE', 				7),
		('LEADER_ORG_COIOT_ESSIE', 	'FLAVOR_MILITARY_TRAINING', 		7),
		('LEADER_ORG_COIOT_ESSIE', 	'FLAVOR_RECON', 					4),
		('LEADER_ORG_COIOT_ESSIE', 	'FLAVOR_RANGED', 					6),
		('LEADER_ORG_COIOT_ESSIE', 	'FLAVOR_MOBILE', 					5),
		('LEADER_ORG_COIOT_ESSIE', 	'FLAVOR_NAVAL', 					7),
		('LEADER_ORG_COIOT_ESSIE', 	'FLAVOR_NAVAL_RECON', 				5),
		('LEADER_ORG_COIOT_ESSIE', 	'FLAVOR_NAVAL_GROWTH', 				5),
		('LEADER_ORG_COIOT_ESSIE', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	5),
		('LEADER_ORG_COIOT_ESSIE', 	'FLAVOR_AIR', 						4),
		('LEADER_ORG_COIOT_ESSIE', 	'FLAVOR_EXPANSION', 				8),
		('LEADER_ORG_COIOT_ESSIE', 	'FLAVOR_GROWTH', 					5),
		('LEADER_ORG_COIOT_ESSIE', 	'FLAVOR_TILE_IMPROVEMENT', 			5),
		('LEADER_ORG_COIOT_ESSIE', 	'FLAVOR_INFRASTRUCTURE', 			5),
		('LEADER_ORG_COIOT_ESSIE', 	'FLAVOR_PRODUCTION', 				5),
		('LEADER_ORG_COIOT_ESSIE', 	'FLAVOR_GOLD', 						6),
		('LEADER_ORG_COIOT_ESSIE', 	'FLAVOR_SCIENCE', 					4),
		('LEADER_ORG_COIOT_ESSIE', 	'FLAVOR_CULTURE', 					9),
		('LEADER_ORG_COIOT_ESSIE', 	'FLAVOR_HAPPINESS', 				6),
		('LEADER_ORG_COIOT_ESSIE', 	'FLAVOR_GREAT_PEOPLE', 				9),
		('LEADER_ORG_COIOT_ESSIE', 	'FLAVOR_WONDER', 					6),
		('LEADER_ORG_COIOT_ESSIE', 	'FLAVOR_RELIGION', 					10),
		('LEADER_ORG_COIOT_ESSIE', 	'FLAVOR_DIPLOMACY', 				7),
		('LEADER_ORG_COIOT_ESSIE', 	'FLAVOR_SPACESHIP', 				3),
		('LEADER_ORG_COIOT_ESSIE', 	'FLAVOR_WATER_CONNECTION', 			3),
		('LEADER_ORG_COIOT_ESSIE', 	'FLAVOR_NUKE', 						4),
		('LEADER_ORG_COIOT_ESSIE', 	'FLAVOR_USE_NUKE', 					3),
		('LEADER_ORG_COIOT_ESSIE', 	'FLAVOR_ESPIONAGE', 				5),
		('LEADER_ORG_COIOT_ESSIE', 	'FLAVOR_AIRLIFT', 					3),
		('LEADER_ORG_COIOT_ESSIE', 	'FLAVOR_I_TRADE_DESTINATION', 		7),
		('LEADER_ORG_COIOT_ESSIE', 	'FLAVOR_I_TRADE_ORIGIN', 			7),
		('LEADER_ORG_COIOT_ESSIE', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		6),
		('LEADER_ORG_COIOT_ESSIE', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		6),
		('LEADER_ORG_COIOT_ESSIE', 	'FLAVOR_ARCHAEOLOGY', 				7),
		('LEADER_ORG_COIOT_ESSIE', 	'FLAVOR_AIR_CARRIER', 				2);
--------------------------------
-- Leader_Traits
--------------------------------
INSERT INTO Leader_Traits
		(LeaderType, 				TraitType)
VALUES	('LEADER_ORG_COIOT_ESSIE',	'TRAIT_ORG_COIOT_POMO');
--==========================================================================================================================
-- TRAITS
--==========================================================================================================================
-- Traits
----------------------------------------------------------------------------------------------------------------------------
INSERT INTO Traits
		(Type, 						Description, 					ShortDescription)
VALUES	('TRAIT_ORG_COIOT_POMO',	'TXT_KEY_TRAIT_ORG_COIOT_POMO',	'TXT_KEY_TRAIT_ORG_COIOT_POMO_SHORT');
--==========================================================================================================================
-- Diplomacy Responses
--==========================================================================================================================
-- Diplomacy_Responses
----------------------------------------------------------------------------------------------------------------------------
INSERT INTO Diplomacy_Responses
		(LeaderType,				ResponseType,					Response,												Bias)
VALUES	('LEADER_ORG_COIOT_ESSIE',	'RESPONSE_INFLUENTIAL_ON_AI',	'TXT_KEY_LEADER_ORG_COIOT_ESSIE_INFLUENTIAL_ON_AI%',	500);