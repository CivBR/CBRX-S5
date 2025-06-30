--==========================================================================================================================
-- GAME DEFINES
--==========================================================================================================================
--==========================================================================================================================
-- PlayerColors
--==========================================================================================================================
INSERT INTO PlayerColors(Type,				PrimaryColor,							SecondaryColor,									TextColor)
VALUES ('PLAYERCOLOR_TG_SUSQUEHANNOCK', 	'COLOR_PLAYER_TG_SUSQUEHANNOCK_ICON',	'COLOR_PLAYER_TG_SUSQUEHANNOCK_BACKGROUND', 	'COLOR_PLAYER_WHITE_TEXT');
--==========================================================================================================================
-- Colors
--==========================================================================================================================
INSERT INTO Colors (Type,							Red,  Green, Blue,  Alpha)
VALUES ('COLOR_PLAYER_TG_SUSQUEHANNOCK_BACKGROUND',	0.847, 0.776, 0.867, 1.0), -- 216,198,221
	   ('COLOR_PLAYER_TG_SUSQUEHANNOCK_ICON',		0.318, 0.027, 0.059, 1.0); -- 81,7,15
--==========================================================================================================================
-- Civilizations
--==========================================================================================================================	
INSERT INTO Civilizations																																							
		(Type, 								Description, 							ShortDescription, 							Adjective, 									Civilopedia,							CivilopediaTag, 					DefaultPlayerColor, 				ArtDefineTag, 	ArtStyleType, 	ArtStyleSuffix, ArtStylePrefix, PortraitIndex, 	IconAtlas, 						AlphaIconAtlas, 						MapImage, 					DawnOfManQuote, 								DawnOfManImage,			SoundtrackTag)					 
SELECT 	'CIVILIZATION_TG_SUSQUEHANNOCK',	'TXT_KEY_CIV_TG_SUSQUEHANNOCK_DESC',	'TXT_KEY_CIV_TG_SUSQUEHANNOCK_SHORT_DESC',	'TXT_KEY_CIV_TG_SUSQUEHANNOCK_ADJECTIVE',	'TXT_KEY_CIV_TG_SUSQUEHANNOCK_PEDIA',	'TXT_KEY_CIV5_TG_SUSQUEHANNOCK', 	'PLAYERCOLOR_TG_SUSQUEHANNOCK', 	ArtDefineTag, 	ArtStyleType, 	ArtStyleSuffix, ArtStylePrefix,	1, 				'CIV_ATLAS_TG_SUSQUEHANNOCK',	'CIV_ALPHA_ATLAS_TG_SUSQUEHANNOCK', 	'SusquehannockMap.dds', 	'TXT_KEY_CIV5_DOM_TG_SUSQUEHANNOCK_TEXT',		'Charquin_DOM.dds', 	SoundtrackTag
FROM Civilizations WHERE Type = 'CIVILIZATION_IROQUOIS';
--==========================================================================================================================
-- Civilization_BuildingClassOverrides
--==========================================================================================================================
--==========================================================================================================================
-- Civilization_UnitClassOverrides
--==========================================================================================================================
INSERT INTO Civilization_UnitClassOverrides
		(CivilizationType,					UnitClassType,			UnitType)
VALUES	('CIVILIZATION_TG_SUSQUEHANNOCK',	'UNITCLASS_MUSKETMAN', 	'UNIT_TG_ITAEAETSIN');
--==========================================================================================================================
-- Civilization_CityNames
--==========================================================================================================================
INSERT INTO Civilization_CityNames 
			(CivilizationType, 						CityName)
VALUES		('CIVILIZATION_TG_SUSQUEHANNOCK', 		'TXT_KEY_CITY_NAME_TG_SUSQUEHANNOCK_0'),
			('CIVILIZATION_TG_SUSQUEHANNOCK', 		'TXT_KEY_CITY_NAME_TG_SUSQUEHANNOCK_1'),
			('CIVILIZATION_TG_SUSQUEHANNOCK', 		'TXT_KEY_CITY_NAME_TG_SUSQUEHANNOCK_2'),
			('CIVILIZATION_TG_SUSQUEHANNOCK', 		'TXT_KEY_CITY_NAME_TG_SUSQUEHANNOCK_3'),
			('CIVILIZATION_TG_SUSQUEHANNOCK', 		'TXT_KEY_CITY_NAME_TG_SUSQUEHANNOCK_4'),
			('CIVILIZATION_TG_SUSQUEHANNOCK', 		'TXT_KEY_CITY_NAME_TG_SUSQUEHANNOCK_5'),
			('CIVILIZATION_TG_SUSQUEHANNOCK', 		'TXT_KEY_CITY_NAME_TG_SUSQUEHANNOCK_6'),
			('CIVILIZATION_TG_SUSQUEHANNOCK', 		'TXT_KEY_CITY_NAME_TG_SUSQUEHANNOCK_7'),
			('CIVILIZATION_TG_SUSQUEHANNOCK', 		'TXT_KEY_CITY_NAME_TG_SUSQUEHANNOCK_8'),
			('CIVILIZATION_TG_SUSQUEHANNOCK', 		'TXT_KEY_CITY_NAME_TG_SUSQUEHANNOCK_9'),
			('CIVILIZATION_TG_SUSQUEHANNOCK', 		'TXT_KEY_CITY_NAME_TG_SUSQUEHANNOCK_10'),
			('CIVILIZATION_TG_SUSQUEHANNOCK', 		'TXT_KEY_CITY_NAME_TG_SUSQUEHANNOCK_11'),
			('CIVILIZATION_TG_SUSQUEHANNOCK', 		'TXT_KEY_CITY_NAME_TG_SUSQUEHANNOCK_12'),
			('CIVILIZATION_TG_SUSQUEHANNOCK', 		'TXT_KEY_CITY_NAME_TG_SUSQUEHANNOCK_13'),
			('CIVILIZATION_TG_SUSQUEHANNOCK', 		'TXT_KEY_CITY_NAME_TG_SUSQUEHANNOCK_14'),
			('CIVILIZATION_TG_SUSQUEHANNOCK', 		'TXT_KEY_CITY_NAME_TG_SUSQUEHANNOCK_15'),
			('CIVILIZATION_TG_SUSQUEHANNOCK', 		'TXT_KEY_CITY_NAME_TG_SUSQUEHANNOCK_16'),
			('CIVILIZATION_TG_SUSQUEHANNOCK', 		'TXT_KEY_CITY_NAME_TG_SUSQUEHANNOCK_17'),
			('CIVILIZATION_TG_SUSQUEHANNOCK', 		'TXT_KEY_CITY_NAME_TG_SUSQUEHANNOCK_18'),
			('CIVILIZATION_TG_SUSQUEHANNOCK', 		'TXT_KEY_CITY_NAME_TG_SUSQUEHANNOCK_19'),
			('CIVILIZATION_TG_SUSQUEHANNOCK', 		'TXT_KEY_CITY_NAME_TG_SUSQUEHANNOCK_20'),
			('CIVILIZATION_TG_SUSQUEHANNOCK', 		'TXT_KEY_CITY_NAME_TG_SUSQUEHANNOCK_21'),
			('CIVILIZATION_TG_SUSQUEHANNOCK', 		'TXT_KEY_CITY_NAME_TG_SUSQUEHANNOCK_22'),
			('CIVILIZATION_TG_SUSQUEHANNOCK', 		'TXT_KEY_CITY_NAME_TG_SUSQUEHANNOCK_23'),
			('CIVILIZATION_TG_SUSQUEHANNOCK', 		'TXT_KEY_CITY_NAME_TG_SUSQUEHANNOCK_24'),
			('CIVILIZATION_TG_SUSQUEHANNOCK', 		'TXT_KEY_CITY_NAME_TG_SUSQUEHANNOCK_25'),
			('CIVILIZATION_TG_SUSQUEHANNOCK', 		'TXT_KEY_CITY_NAME_TG_SUSQUEHANNOCK_26'),
			('CIVILIZATION_TG_SUSQUEHANNOCK', 		'TXT_KEY_CITY_NAME_TG_SUSQUEHANNOCK_27'),
			('CIVILIZATION_TG_SUSQUEHANNOCK', 		'TXT_KEY_CITY_NAME_TG_SUSQUEHANNOCK_28'),
			('CIVILIZATION_TG_SUSQUEHANNOCK', 		'TXT_KEY_CITY_NAME_TG_SUSQUEHANNOCK_29'),
			('CIVILIZATION_TG_SUSQUEHANNOCK', 		'TXT_KEY_CITY_NAME_TG_SUSQUEHANNOCK_30'),
			('CIVILIZATION_TG_SUSQUEHANNOCK', 		'TXT_KEY_CITY_NAME_TG_SUSQUEHANNOCK_31'),
			('CIVILIZATION_TG_SUSQUEHANNOCK', 		'TXT_KEY_CITY_NAME_TG_SUSQUEHANNOCK_32'),
			('CIVILIZATION_TG_SUSQUEHANNOCK', 		'TXT_KEY_CITY_NAME_TG_SUSQUEHANNOCK_33'),
			('CIVILIZATION_TG_SUSQUEHANNOCK', 		'TXT_KEY_CITY_NAME_TG_SUSQUEHANNOCK_34'),
			('CIVILIZATION_TG_SUSQUEHANNOCK', 		'TXT_KEY_CITY_NAME_TG_SUSQUEHANNOCK_35'),
			('CIVILIZATION_TG_SUSQUEHANNOCK', 		'TXT_KEY_CITY_NAME_TG_SUSQUEHANNOCK_36');
--==========================================================================================================================
-- Civilization_FreeBuildingClasses
--==========================================================================================================================
INSERT INTO Civilization_FreeBuildingClasses(CivilizationType, BuildingClassType)
SELECT								 'CIVILIZATION_TG_SUSQUEHANNOCK', BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE CivilizationType = 'CIVILIZATION_IROQUOIS';
--==========================================================================================================================
-- Civilization_FreeTechs
--==========================================================================================================================
INSERT INTO Civilization_FreeTechs(CivilizationType, TechType)
SELECT							  'CIVILIZATION_TG_SUSQUEHANNOCK',TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_IROQUOIS';
--==========================================================================================================================
-- Civilization_FreeUnits
--==========================================================================================================================
INSERT INTO Civilization_FreeUnits 
		(CivilizationType, 				 UnitClassType, Count, UnitAIType)
SELECT	'CIVILIZATION_TG_SUSQUEHANNOCK', UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_IROQUOIS';
--==========================================================================================================================
-- Civilization_Leaders
--==========================================================================================================================
INSERT INTO Civilization_Leaders 
			(CivilizationType, 					LeaderheadType)
VALUES		('CIVILIZATION_TG_SUSQUEHANNOCK', 	'LEADER_TG_SHEEHAYS');
--==========================================================================================================================
-- Civilization_Religions
--==========================================================================================================================	
INSERT INTO Civilization_Religions 
			(CivilizationType, 					ReligionType)
SELECT		'CIVILIZATION_TG_SUSQUEHANNOCK', 	ReligionType
FROM Civilization_Religions WHERE (CivilizationType = 'CIVILIZATION_IROQUOIS');

--INSERT INTO Civilization_Religions 
--				(CivilizationType, 					ReligionType)
--VALUES		('CIVILIZATION_TG_SUSQUEHANNOCK', 	'RELIGION_CHRISTIANITY');
--==========================================================================================================================
-- Civilization_Start_Along_River
--==========================================================================================================================
INSERT INTO Civilization_Start_Along_River
		(CivilizationType, 					StartAlongRiver)
VALUES	('CIVILIZATION_TG_SUSQUEHANNOCK', 	1);
--==========================================================================================================================
-- Civilization_Start_Region_Priority 
--==========================================================================================================================
INSERT INTO Civilization_Start_Region_Priority
		(CivilizationType,			RegionType)
SELECT	'CIVILIZATION_TG_SUSQUEHANNOCK',	RegionType
FROM Civilization_Start_Region_Priority WHERE CivilizationType = 'CIVILIZATION_CELTS';
--==========================================================================================================================
-- Civilization_Start_Place_First_Along_Ocean
--==========================================================================================================================
INSERT INTO Civilization_Start_Place_First_Along_Ocean 
		(CivilizationType, 					PlaceFirst)
VALUES	('CIVILIZATION_TG_SUSQUEHANNOCK', 	1);
--==========================================================================================================================
-- Civilization_SpyNames
--==========================================================================================================================	
INSERT INTO Civilization_SpyNames 
		(CivilizationType, 				SpyName)
VALUES	('CIVILIZATION_TG_SUSQUEHANNOCK', 	'TXT_KEY_SPY_NAME_TG_SUSQUEHANNOCK_0'),	
		('CIVILIZATION_TG_SUSQUEHANNOCK', 	'TXT_KEY_SPY_NAME_TG_SUSQUEHANNOCK_1'),
		('CIVILIZATION_TG_SUSQUEHANNOCK', 	'TXT_KEY_SPY_NAME_TG_SUSQUEHANNOCK_2'),
		('CIVILIZATION_TG_SUSQUEHANNOCK', 	'TXT_KEY_SPY_NAME_TG_SUSQUEHANNOCK_3'),
		('CIVILIZATION_TG_SUSQUEHANNOCK', 	'TXT_KEY_SPY_NAME_TG_SUSQUEHANNOCK_4'),
		('CIVILIZATION_TG_SUSQUEHANNOCK', 	'TXT_KEY_SPY_NAME_TG_SUSQUEHANNOCK_5'),
		('CIVILIZATION_TG_SUSQUEHANNOCK', 	'TXT_KEY_SPY_NAME_TG_SUSQUEHANNOCK_6'),
		('CIVILIZATION_TG_SUSQUEHANNOCK', 	'TXT_KEY_SPY_NAME_TG_SUSQUEHANNOCK_7'),
		('CIVILIZATION_TG_SUSQUEHANNOCK', 	'TXT_KEY_SPY_NAME_TG_SUSQUEHANNOCK_8'),
		('CIVILIZATION_TG_SUSQUEHANNOCK', 	'TXT_KEY_SPY_NAME_TG_SUSQUEHANNOCK_9');
--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================
--==========================================================================================================================	
-- BuildingClasses
--==========================================================================================================================
INSERT INTO BuildingClasses
		(Type, 										DefaultBuilding, 						Description,						NoLimit)
VALUES	('BUILDINGCLASS_TG_SUSQUEHANNOCK_UADUMMY',	'BUILDING_TG_SUSQUEHANNOCK_UADUMMY',	'TXT_KEY_TG_SUSQUEHANNOCK_UADUMMY', 1);
--==========================================================================================================================	
-- Buildings
--==========================================================================================================================
INSERT INTO Buildings 		
		(Type, 									BuildingClass,								Cost, FaithCost,	PrereqTech, Description,								NeverCapture,	Help,										PortraitIndex,	IconAtlas)
VALUES	('BUILDING_TG_SUSQUEHANNOCK_UADUMMY',	'BUILDINGCLASS_TG_SUSQUEHANNOCK_UADUMMY',	-1,   -1,			null,		'TXT_KEY_TG_SUSQUEHANNOCK_UADUMMY_DESC',	1,				'TXT_KEY_TG_SUSQUEHANNOCK_UADUMMY_HELP',	19,				'BW_ATLAS_1');
--==========================================================================================================================	
-- Building_ClassesNeededInCity
--==========================================================================================================================
--==========================================================================================================================
-- Building_YieldModifiers
--==========================================================================================================================
INSERT INTO Building_YieldModifiers	
		(BuildingType, 							YieldType,		Yield)
VALUES	('BUILDING_TG_SUSQUEHANNOCK_UADUMMY',	'YIELD_GOLD',	1);
--==========================================================================================================================	
-- Building_Flavors
--==========================================================================================================================
--==========================================================================================================================
-- UNITS
--==========================================================================================================================
--==========================================================================================================================
-- Units
--==========================================================================================================================
INSERT INTO Units
			(Type, 					Combat,	Class, Cost,	FaithCost, RequiresFaithPurchaseEnabled, CombatClass, Moves,   Range, RangedCombat, CivilianAttackPriority, Special, PrereqTech, Domain, Pillage, DefaultUnitAI, ObsoleteTech, WorkRate, CombatLimit, DontShowYields, WorkRate, MoveRate, Description, 				   Civilopedia, 							Strategy,				 			   Help,								AdvancedStartCost,	UnitArtInfo,								UnitArtInfoEraVariation,	UnitFlagIconOffset, UnitFlagAtlas,								PortraitIndex, 	IconAtlas)
SELECT		'UNIT_TG_ITAEAETSIN',	Combat,	Class, Cost*.8, FaithCost, RequiresFaithPurchaseEnabled, CombatClass, Moves+1, Range, RangedCombat, CivilianAttackPriority, Special, PrereqTech, Domain, Pillage, DefaultUnitAI, ObsoleteTech, WorkRate, CombatLimit, DontShowYields, WorkRate, MoveRate, 'TXT_KEY_UNIT_TG_ITAEAETSIN', 'TXT_KEY_CIV5_UNIT_TG_ITAEAETSIN',		'TXT_KEY_UNIT_TG_ITAEAETSIN_STRATEGY', 'TXT_KEY_UNIT_TG_ITAEAETSIN_HELP',	AdvancedStartCost,	'ART_DEF_UNIT_TG_SUSQUEHANNOCK_ITAEAETSIN',	1,							0,					'CIV_ATLAS_TG_SUSQUEHANNOCK_ITAEAETSIN',	2, 				'CIV_ATLAS_TG_SUSQUEHANNOCK'
FROM Units WHERE Type = 'UNIT_MUSKETMAN';
--==========================================================================================================================
-- UnitGameplay2DScripts
--==========================================================================================================================
INSERT INTO UnitGameplay2DScripts
		(UnitType, 			  SelectionSound,	FirstSelectionSound)
SELECT	'UNIT_TG_ITAEAETSIN', SelectionSound,	FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_MUSKETMAN';
--==========================================================================================================================
-- Unit_AITypes
--==========================================================================================================================
INSERT INTO Unit_AITypes
		(UnitType,				UnitAIType)
SELECT	'UNIT_TG_ITAEAETSIN', 	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_MUSKETMAN';
--==========================================================================================================================
-- Unit_ClassUpgrades
--==========================================================================================================================
INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 			UnitClassType)
SELECT	'UNIT_TG_ITAEAETSIN', 	UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_MUSKETMAN';
--==========================================================================================================================
-- Unit_Flavors
--==========================================================================================================================
INSERT INTO Unit_Flavors 	
		(UnitType, 			FlavorType,	Flavor)
SELECT	'UNIT_TG_ITAEAETSIN', 	FlavorType,	Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_MUSKETMAN';

UPDATE Unit_Flavors
SET Flavor = 12 WHERE UnitType = 'UNIT_TG_ITAEAETSIN' AND FlavorType = 'FLAVOR_OFFENSE';

UPDATE Unit_Flavors
SET Flavor = 12 WHERE UnitType = 'UNIT_TG_ITAEAETSIN' AND FlavorType = 'FLAVOR_DEFENSE';
--==========================================================================================================================
-- Unit_ResourceQuantityRequirements
--==========================================================================================================================
--==========================================================================================================================
-- Unit_FreePromotions
--==========================================================================================================================
INSERT INTO Unit_FreePromotions
		(UnitType,	PromotionType)
SELECT 'UNIT_TG_ITAEAETSIN',	PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_MUSKETMAN';

INSERT INTO Unit_FreePromotions
		(UnitType,	PromotionType)
VALUES ('UNIT_TG_ITAEAETSIN', 'PROMOTION_FREE_PILLAGE_MOVES');
--==========================================================================================================================
-- UnitPromotions
--==========================================================================================================================
INSERT INTO UnitPromotions
        (Type,										Description,										Help,													Sound,                CombatPercent,     LostWithUpgrade,	OrderPriority,	CannotBeChosen,   PortraitIndex,     IconAtlas,						PediaType,          PediaEntry)
VALUES  ('PROMOTION_TG_TRADE_ROUTE_PROMOTION_1',    'TXT_KEY_PROMOTION_TG_TRADE_ROUTE_PROMOTION_1',		'TXT_KEY_PROMOTION_TG_TRADE_ROUTE_PROMOTION_1_HELP',    'AS2D_IF_LEVELUP',    1,                 0,					0,              1,                11,                'EXPANSION2_PROMOTION_ATLAS',	'PEDIA_ATTRIBUTES',	'TXT_KEY_PROMOTION_TG_TRADE_ROUTE_PROMOTION_1_HELP'),
		('PROMOTION_TG_TRADE_ROUTE_PROMOTION_2',    'TXT_KEY_PROMOTION_TG_TRADE_ROUTE_PROMOTION_2',		'TXT_KEY_PROMOTION_TG_TRADE_ROUTE_PROMOTION_2_HELP',    'AS2D_IF_LEVELUP',    2,                 0,					0,              1,                11,                'EXPANSION2_PROMOTION_ATLAS',	'PEDIA_ATTRIBUTES',	'TXT_KEY_PROMOTION_TG_TRADE_ROUTE_PROMOTION_2_HELP'),
		('PROMOTION_TG_TRADE_ROUTE_PROMOTION_3',    'TXT_KEY_PROMOTION_TG_TRADE_ROUTE_PROMOTION_3',		'TXT_KEY_PROMOTION_TG_TRADE_ROUTE_PROMOTION_3_HELP',    'AS2D_IF_LEVELUP',    3,                 0,					0,              1,                11,                'EXPANSION2_PROMOTION_ATLAS',	'PEDIA_ATTRIBUTES',	'TXT_KEY_PROMOTION_TG_TRADE_ROUTE_PROMOTION_3_HELP'),
		('PROMOTION_TG_TRADE_ROUTE_PROMOTION_4',    'TXT_KEY_PROMOTION_TG_TRADE_ROUTE_PROMOTION_4',		'TXT_KEY_PROMOTION_TG_TRADE_ROUTE_PROMOTION_4_HELP',    'AS2D_IF_LEVELUP',    4,                 0,					0,              1,                11,                'EXPANSION2_PROMOTION_ATLAS',	'PEDIA_ATTRIBUTES',	'TXT_KEY_PROMOTION_TG_TRADE_ROUTE_PROMOTION_4_HELP'),
		('PROMOTION_TG_TRADE_ROUTE_PROMOTION_5',    'TXT_KEY_PROMOTION_TG_TRADE_ROUTE_PROMOTION_5',		'TXT_KEY_PROMOTION_TG_TRADE_ROUTE_PROMOTION_5_HELP',    'AS2D_IF_LEVELUP',    5,                 0,					0,              1,                11,                'EXPANSION2_PROMOTION_ATLAS',	'PEDIA_ATTRIBUTES',	'TXT_KEY_PROMOTION_TG_TRADE_ROUTE_PROMOTION_5_HELP'),
		('PROMOTION_TG_TRADE_ROUTE_PROMOTION_6',    'TXT_KEY_PROMOTION_TG_TRADE_ROUTE_PROMOTION_6',		'TXT_KEY_PROMOTION_TG_TRADE_ROUTE_PROMOTION_6_HELP',    'AS2D_IF_LEVELUP',    6,                 0,					0,              1,                11,                'EXPANSION2_PROMOTION_ATLAS',	'PEDIA_ATTRIBUTES',	'TXT_KEY_PROMOTION_TG_TRADE_ROUTE_PROMOTION_6_HELP'),
		('PROMOTION_TG_TRADE_ROUTE_PROMOTION_7',    'TXT_KEY_PROMOTION_TG_TRADE_ROUTE_PROMOTION_7',		'TXT_KEY_PROMOTION_TG_TRADE_ROUTE_PROMOTION_7_HELP',    'AS2D_IF_LEVELUP',    7,                 0,					0,              1,                11,                'EXPANSION2_PROMOTION_ATLAS',	'PEDIA_ATTRIBUTES',	'TXT_KEY_PROMOTION_TG_TRADE_ROUTE_PROMOTION_7_HELP'),
		('PROMOTION_TG_TRADE_ROUTE_PROMOTION_8',    'TXT_KEY_PROMOTION_TG_TRADE_ROUTE_PROMOTION_8',		'TXT_KEY_PROMOTION_TG_TRADE_ROUTE_PROMOTION_8_HELP',    'AS2D_IF_LEVELUP',    8,                 0,					0,              1,                11,                'EXPANSION2_PROMOTION_ATLAS',	'PEDIA_ATTRIBUTES',	'TXT_KEY_PROMOTION_TG_TRADE_ROUTE_PROMOTION_8_HELP'),
		('PROMOTION_TG_TRADE_ROUTE_PROMOTION_9',    'TXT_KEY_PROMOTION_TG_TRADE_ROUTE_PROMOTION_9',		'TXT_KEY_PROMOTION_TG_TRADE_ROUTE_PROMOTION_9_HELP',    'AS2D_IF_LEVELUP',    9,                 0,					0,              1,                11,                'EXPANSION2_PROMOTION_ATLAS',	'PEDIA_ATTRIBUTES',	'TXT_KEY_PROMOTION_TG_TRADE_ROUTE_PROMOTION_9_HELP'),
		('PROMOTION_TG_TRADE_ROUTE_PROMOTION_10',   'TXT_KEY_PROMOTION_TG_TRADE_ROUTE_PROMOTION_10',	'TXT_KEY_PROMOTION_TG_TRADE_ROUTE_PROMOTION_10_HELP',   'AS2D_IF_LEVELUP',    10,                0,					0,              1,                11,                'EXPANSION2_PROMOTION_ATLAS',	'PEDIA_ATTRIBUTES',	'TXT_KEY_PROMOTION_TG_TRADE_ROUTE_PROMOTION_10_HELP'),
		('PROMOTION_TG_TRADE_ROUTE_PROMOTION_11',   'TXT_KEY_PROMOTION_TG_TRADE_ROUTE_PROMOTION_11',	'TXT_KEY_PROMOTION_TG_TRADE_ROUTE_PROMOTION_11_HELP',   'AS2D_IF_LEVELUP',    11,                0,					0,              1,                11,                'EXPANSION2_PROMOTION_ATLAS',	'PEDIA_ATTRIBUTES',	'TXT_KEY_PROMOTION_TG_TRADE_ROUTE_PROMOTION_11_HELP'),
		('PROMOTION_TG_TRADE_ROUTE_PROMOTION_12',   'TXT_KEY_PROMOTION_TG_TRADE_ROUTE_PROMOTION_12',	'TXT_KEY_PROMOTION_TG_TRADE_ROUTE_PROMOTION_12_HELP',   'AS2D_IF_LEVELUP',    12,                0,					0,              1,                11,                'EXPANSION2_PROMOTION_ATLAS',	'PEDIA_ATTRIBUTES',	'TXT_KEY_PROMOTION_TG_TRADE_ROUTE_PROMOTION_12_HELP'),
		('PROMOTION_TG_TRADE_ROUTE_PROMOTION_13',   'TXT_KEY_PROMOTION_TG_TRADE_ROUTE_PROMOTION_13',	'TXT_KEY_PROMOTION_TG_TRADE_ROUTE_PROMOTION_13_HELP',   'AS2D_IF_LEVELUP',    13,                0,					0,              1,                11,                'EXPANSION2_PROMOTION_ATLAS',	'PEDIA_ATTRIBUTES',	'TXT_KEY_PROMOTION_TG_TRADE_ROUTE_PROMOTION_13_HELP'),
		('PROMOTION_TG_TRADE_ROUTE_PROMOTION_14',   'TXT_KEY_PROMOTION_TG_TRADE_ROUTE_PROMOTION_14',	'TXT_KEY_PROMOTION_TG_TRADE_ROUTE_PROMOTION_14_HELP',   'AS2D_IF_LEVELUP',    14,                0,					0,              1,                11,                'EXPANSION2_PROMOTION_ATLAS',	'PEDIA_ATTRIBUTES',	'TXT_KEY_PROMOTION_TG_TRADE_ROUTE_PROMOTION_14_HELP'),
		('PROMOTION_TG_TRADE_ROUTE_PROMOTION_15',   'TXT_KEY_PROMOTION_TG_TRADE_ROUTE_PROMOTION_15',	'TXT_KEY_PROMOTION_TG_TRADE_ROUTE_PROMOTION_15_HELP',   'AS2D_IF_LEVELUP',    15,                0,					0,              1,                11,                'EXPANSION2_PROMOTION_ATLAS',	'PEDIA_ATTRIBUTES',	'TXT_KEY_PROMOTION_TG_TRADE_ROUTE_PROMOTION_15_HELP'),
		('PROMOTION_TG_TRADE_ROUTE_PROMOTION_16',   'TXT_KEY_PROMOTION_TG_TRADE_ROUTE_PROMOTION_16',	'TXT_KEY_PROMOTION_TG_TRADE_ROUTE_PROMOTION_16_HELP',   'AS2D_IF_LEVELUP',    16,                0,					0,              1,                11,                'EXPANSION2_PROMOTION_ATLAS',	'PEDIA_ATTRIBUTES',	'TXT_KEY_PROMOTION_TG_TRADE_ROUTE_PROMOTION_16_HELP'),
		('PROMOTION_TG_TRADE_ROUTE_PROMOTION_17',   'TXT_KEY_PROMOTION_TG_TRADE_ROUTE_PROMOTION_17',	'TXT_KEY_PROMOTION_TG_TRADE_ROUTE_PROMOTION_17_HELP',   'AS2D_IF_LEVELUP',    17,                0,					0,              1,                11,                'EXPANSION2_PROMOTION_ATLAS',	'PEDIA_ATTRIBUTES',	'TXT_KEY_PROMOTION_TG_TRADE_ROUTE_PROMOTION_17_HELP'),
		('PROMOTION_TG_TRADE_ROUTE_PROMOTION_18',   'TXT_KEY_PROMOTION_TG_TRADE_ROUTE_PROMOTION_18',	'TXT_KEY_PROMOTION_TG_TRADE_ROUTE_PROMOTION_18_HELP',   'AS2D_IF_LEVELUP',    18,                0,					0,              1,                11,                'EXPANSION2_PROMOTION_ATLAS',	'PEDIA_ATTRIBUTES',	'TXT_KEY_PROMOTION_TG_TRADE_ROUTE_PROMOTION_18_HELP'),
		('PROMOTION_TG_TRADE_ROUTE_PROMOTION_19',   'TXT_KEY_PROMOTION_TG_TRADE_ROUTE_PROMOTION_19',	'TXT_KEY_PROMOTION_TG_TRADE_ROUTE_PROMOTION_19_HELP',   'AS2D_IF_LEVELUP',    19,                0,					0,              1,                11,                'EXPANSION2_PROMOTION_ATLAS',	'PEDIA_ATTRIBUTES',	'TXT_KEY_PROMOTION_TG_TRADE_ROUTE_PROMOTION_19_HELP'),
		('PROMOTION_TG_TRADE_ROUTE_PROMOTION_20',   'TXT_KEY_PROMOTION_TG_TRADE_ROUTE_PROMOTION_20',	'TXT_KEY_PROMOTION_TG_TRADE_ROUTE_PROMOTION_20_HELP',    'AS2D_IF_LEVELUP',   20,                0,					0,              1,                11,                'EXPANSION2_PROMOTION_ATLAS',	'PEDIA_ATTRIBUTES',	'TXT_KEY_PROMOTION_TG_TRADE_ROUTE_PROMOTION_20_HELP'),
		('PROMOTION_TG_TRADE_ROUTE_PROMOTION_21',   'TXT_KEY_PROMOTION_TG_TRADE_ROUTE_PROMOTION_21',	'TXT_KEY_PROMOTION_TG_TRADE_ROUTE_PROMOTION_21_HELP',    'AS2D_IF_LEVELUP',   21,                0,					0,              1,                11,                'EXPANSION2_PROMOTION_ATLAS',	'PEDIA_ATTRIBUTES',	'TXT_KEY_PROMOTION_TG_TRADE_ROUTE_PROMOTION_21_HELP'),
		('PROMOTION_TG_TRADE_ROUTE_PROMOTION_22',   'TXT_KEY_PROMOTION_TG_TRADE_ROUTE_PROMOTION_22',	'TXT_KEY_PROMOTION_TG_TRADE_ROUTE_PROMOTION_22_HELP',    'AS2D_IF_LEVELUP',   22,                0,					0,              1,                11,                'EXPANSION2_PROMOTION_ATLAS',	'PEDIA_ATTRIBUTES',	'TXT_KEY_PROMOTION_TG_TRADE_ROUTE_PROMOTION_22_HELP'),
		('PROMOTION_TG_TRADE_ROUTE_PROMOTION_23',   'TXT_KEY_PROMOTION_TG_TRADE_ROUTE_PROMOTION_23',	'TXT_KEY_PROMOTION_TG_TRADE_ROUTE_PROMOTION_23_HELP',    'AS2D_IF_LEVELUP',   23,                0,					0,              1,                11,                'EXPANSION2_PROMOTION_ATLAS',	'PEDIA_ATTRIBUTES',	'TXT_KEY_PROMOTION_TG_TRADE_ROUTE_PROMOTION_23_HELP'),
		('PROMOTION_TG_TRADE_ROUTE_PROMOTION_24',   'TXT_KEY_PROMOTION_TG_TRADE_ROUTE_PROMOTION_24',	'TXT_KEY_PROMOTION_TG_TRADE_ROUTE_PROMOTION_24_HELP',    'AS2D_IF_LEVELUP',   24,                0,					0,              1,                11,                'EXPANSION2_PROMOTION_ATLAS',	'PEDIA_ATTRIBUTES',	'TXT_KEY_PROMOTION_TG_TRADE_ROUTE_PROMOTION_24_HELP'),
		('PROMOTION_TG_TRADE_ROUTE_PROMOTION_25',   'TXT_KEY_PROMOTION_TG_TRADE_ROUTE_PROMOTION_25',	'TXT_KEY_PROMOTION_TG_TRADE_ROUTE_PROMOTION_25_HELP',    'AS2D_IF_LEVELUP',   25,                0,					0,              1,                11,                'EXPANSION2_PROMOTION_ATLAS',	'PEDIA_ATTRIBUTES',	'TXT_KEY_PROMOTION_TG_TRADE_ROUTE_PROMOTION_25_HELP');
--==========================================================================================================================
-- IMPROVEMENTS
--==========================================================================================================================
--==========================================================================================================================
-- Improvements
--==========================================================================================================================
INSERT INTO Improvements
		(Type,						Description,						Civilopedia,								Help,									ArtDefineTag,						SpecificCivRequired,	CivilizationType,					PortraitIndex,	IconAtlas,						DefenseModifier,	PillageGold)
VALUES	('IMPROVEMENT_TG_PALISADE',	'TXT_KEY_IMPROVEMENT_TG_PALISADE',	'TXT_KEY_IMPROVEMENT_TG_PALISADE_PEDIA',	'TXT_KEY_IMPROVEMENT_TG_PALISADE_HELP',	'ART_DEF_IMPROVEMENT_TG_PALISADE',	1,						'CIVILIZATION_TG_SUSQUEHANNOCK',	4,				'CIV_ATLAS_TG_SUSQUEHANNOCK',	40,					10);
--==========================================================================================================================
-- Improvement_Yields
--==========================================================================================================================
INSERT INTO Improvement_Yields
		(ImprovementType,			YieldType,			Yield)
VALUES	('IMPROVEMENT_TG_PALISADE',	'YIELD_PRODUCTION',	1);
--==========================================================================================================================
-- Improvement_TechYieldChanges
--==========================================================================================================================
INSERT INTO Improvement_TechNoFreshWaterYieldChanges
		(ImprovementType,			TechType,			  YieldType,		Yield)
VALUES	('IMPROVEMENT_TG_PALISADE',	'TECH_FERTILIZER',	  'YIELD_FOOD',		1);

INSERT INTO Improvement_TechFreshWaterYieldChanges
		(ImprovementType,			TechType,			  YieldType,		Yield)
VALUES	('IMPROVEMENT_TG_PALISADE',	'TECH_CIVIL_SERVICE', 'YIELD_FOOD',		1);
--==========================================================================================================================
-- Improvement_ValidTerrains
--==========================================================================================================================
INSERT INTO Improvement_ValidTerrains
		(ImprovementType, TerrainType)
VALUES	('IMPROVEMENT_TG_PALISADE',	'TERRAIN_PLAINS'),
		('IMPROVEMENT_TG_PALISADE',	'TERRAIN_GRASS'),
		('IMPROVEMENT_TG_PALISADE',	'TERRAIN_DESERT'),
		('IMPROVEMENT_TG_PALISADE',	'TERRAIN_SNOW'),
		('IMPROVEMENT_TG_PALISADE',	'TERRAIN_TUNDRA');
--==========================================================================================================================
-- Builds
--==========================================================================================================================
INSERT INTO Builds
		(Type,					Description,					Help,							Recommendation,						HotKey,	OrderPriority,	PrereqTech,				ImprovementType,				EntityEvent,		IconIndex,	IconAtlas,							ShowInPedia,	ShowInTechTree,	Time)
VALUES	('BUILD_TG_PALISADE',	'TXT_KEY_BUILD_TG_PALISADE',	'TXT_KEY_BUILD_TG_PALISADE',	'TXT_KEY_BUILD_TG_PALISADE_REC',	'KB_Z',	98,				'TECH_CONSTRUCTION',	'IMPROVEMENT_TG_PALISADE',	'ENTITY_EVENT_BUILD',	5,			'CIV_ATLAS_TG_SUSQUEHANNOCK',		0,				1,				600);
--==========================================================================================================================
-- BuildFeatures
--==========================================================================================================================
INSERT INTO BuildFeatures
		(BuildType,				FeatureType,		PrereqTech,				Time,	Remove)
VALUES	('BUILD_TG_PALISADE',	'FEATURE_JUNGLE',	'TECH_BRONZE_WORKING',	700,	1),
		('BUILD_TG_PALISADE',	'FEATURE_FOREST',	'TECH_MINING',			400,	1),
		('BUILD_TG_PALISADE',	'FEATURE_MARSH',	'TECH_MASONRY',			600,	1);
--==========================================================================================================================
-- Unit_Builds
--==========================================================================================================================
INSERT INTO Unit_Builds
		(UnitType,		BuildType)
VALUES	('UNIT_WORKER',	'BUILD_TG_PALISADE');
--==========================================================================================================================
-- LEADERS
--==========================================================================================================================
--==========================================================================================================================
-- Leaders
--==========================================================================================================================
INSERT INTO Leaders(Type, 					Description, 					Civilopedia, 							CivilopediaTag, 	  						ArtDefineTag, 			PortraitIndex,	IconAtlas, 						VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, Boldness,  Diplobalance,	WarmongerHate,  DenounceWillingness, 	DoFWillingness, Loyalty, Neediness, Forgiveness, Chattiness, Meanness,  WorkAgainstWillingness, WorkWithWillingness)
VALUES			   ('LEADER_TG_SHEEHAYS',	'TXT_KEY_LEADER_TG_SHEEHAYS',	 'TXT_KEY_LEADER_TG_SHEEHAYS_PEDIA',	'TXT_KEY_CIVILOPEDIA_LEADERS_TG_SHEEHAYS',	'Charquin_Scene.xml',	0,				'CIV_ATLAS_TG_SUSQUEHANNOCK',	8, 						6, 						7, 						 8, 		6, 			 	4, 				6, 						4, 				6, 		 5, 		4, 			 4,			 5, 	   	5,						4);
--==========================================================================================================================
-- Leader_MajorCivApproachBiases
--==========================================================================================================================
INSERT INTO Leader_MajorCivApproachBiases 
		(LeaderType, 			MajorCivApproachType, 				Bias)
VALUES	('LEADER_TG_SHEEHAYS', 	'MAJOR_CIV_APPROACH_WAR', 			9),
		('LEADER_TG_SHEEHAYS', 	'MAJOR_CIV_APPROACH_HOSTILE', 		7),
		('LEADER_TG_SHEEHAYS', 	'MAJOR_CIV_APPROACH_DECEPTIVE', 	9),
		('LEADER_TG_SHEEHAYS', 	'MAJOR_CIV_APPROACH_GUARDED', 		9),
		('LEADER_TG_SHEEHAYS', 	'MAJOR_CIV_APPROACH_AFRAID', 		4),
		('LEADER_TG_SHEEHAYS', 	'MAJOR_CIV_APPROACH_FRIENDLY', 		6),
		('LEADER_TG_SHEEHAYS', 	'MAJOR_CIV_APPROACH_NEUTRAL', 		5);
--==========================================================================================================================
-- Leader_MinorCivApproachBiases
--==========================================================================================================================
INSERT INTO Leader_MinorCivApproachBiases 
		(LeaderType, 			MinorCivApproachType, 				Bias)
VALUES	('LEADER_TG_SHEEHAYS', 	'MINOR_CIV_APPROACH_IGNORE', 		5),
		('LEADER_TG_SHEEHAYS', 	'MINOR_CIV_APPROACH_FRIENDLY', 		9),
		('LEADER_TG_SHEEHAYS', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	8),
		('LEADER_TG_SHEEHAYS', 	'MINOR_CIV_APPROACH_CONQUEST', 		2),
		('LEADER_TG_SHEEHAYS', 	'MINOR_CIV_APPROACH_BULLY', 		5);
--==========================================================================================================================
-- Leader_Flavors
--==========================================================================================================================
INSERT INTO Leader_Flavors 
		(LeaderType, 			FlavorType, 						Flavor)
VALUES	('LEADER_TG_SHEEHAYS', 	'FLAVOR_OFFENSE', 					9),
		('LEADER_TG_SHEEHAYS', 	'FLAVOR_DEFENSE', 					6),
		('LEADER_TG_SHEEHAYS', 	'FLAVOR_CITY_DEFENSE', 				5),
		('LEADER_TG_SHEEHAYS', 	'FLAVOR_MILITARY_TRAINING', 		5),
		('LEADER_TG_SHEEHAYS', 	'FLAVOR_RECON', 					5),
		('LEADER_TG_SHEEHAYS', 	'FLAVOR_RANGED', 					5),
		('LEADER_TG_SHEEHAYS', 	'FLAVOR_MOBILE', 					5),
		('LEADER_TG_SHEEHAYS', 	'FLAVOR_NAVAL', 					6),
		('LEADER_TG_SHEEHAYS', 	'FLAVOR_NAVAL_RECON', 				6),
		('LEADER_TG_SHEEHAYS', 	'FLAVOR_NAVAL_GROWTH', 				9),
		('LEADER_TG_SHEEHAYS', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	7),
		('LEADER_TG_SHEEHAYS', 	'FLAVOR_AIR', 						7),
		('LEADER_TG_SHEEHAYS', 	'FLAVOR_EXPANSION', 				9),
		('LEADER_TG_SHEEHAYS', 	'FLAVOR_GROWTH', 					9),
		('LEADER_TG_SHEEHAYS', 	'FLAVOR_TILE_IMPROVEMENT', 			8),
		('LEADER_TG_SHEEHAYS', 	'FLAVOR_INFRASTRUCTURE', 			7),
		('LEADER_TG_SHEEHAYS', 	'FLAVOR_PRODUCTION', 				5),
		('LEADER_TG_SHEEHAYS', 	'FLAVOR_GOLD', 						8),
		('LEADER_TG_SHEEHAYS', 	'FLAVOR_SCIENCE', 					5),
		('LEADER_TG_SHEEHAYS', 	'FLAVOR_CULTURE', 					4),
		('LEADER_TG_SHEEHAYS', 	'FLAVOR_HAPPINESS', 				6),
		('LEADER_TG_SHEEHAYS', 	'FLAVOR_GREAT_PEOPLE', 				4),
		('LEADER_TG_SHEEHAYS', 	'FLAVOR_WONDER', 					5),
		('LEADER_TG_SHEEHAYS', 	'FLAVOR_RELIGION', 					5),
		('LEADER_TG_SHEEHAYS', 	'FLAVOR_DIPLOMACY', 				6),
		('LEADER_TG_SHEEHAYS', 	'FLAVOR_SPACESHIP', 				6),
		('LEADER_TG_SHEEHAYS', 	'FLAVOR_WATER_CONNECTION', 			8),
		('LEADER_TG_SHEEHAYS', 	'FLAVOR_NUKE', 						8),
		('LEADER_TG_SHEEHAYS', 	'FLAVOR_USE_NUKE', 					6),
		('LEADER_TG_SHEEHAYS', 	'FLAVOR_ESPIONAGE', 				12),
		('LEADER_TG_SHEEHAYS', 	'FLAVOR_AIRLIFT', 					5),
		('LEADER_TG_SHEEHAYS', 	'FLAVOR_I_TRADE_DESTINATION', 		9),
		('LEADER_TG_SHEEHAYS', 	'FLAVOR_I_TRADE_ORIGIN', 			9),
		('LEADER_TG_SHEEHAYS', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		9),
		('LEADER_TG_SHEEHAYS', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		9),
		('LEADER_TG_SHEEHAYS', 	'FLAVOR_ARCHAEOLOGY', 				6),
		('LEADER_TG_SHEEHAYS', 	'FLAVOR_AIR_CARRIER', 				4);
--==========================================================================================================================
-- Leader_Traits
--==========================================================================================================================
INSERT INTO Leader_Traits
		(LeaderType, 			TraitType)
VALUES	('LEADER_TG_SHEEHAYS',	'TRAIT_TG_MINQUAS_PATH');
--==========================================================================================================================	
-- TRAITS
--==========================================================================================================================
--==========================================================================================================================	
-- Traits
--==========================================================================================================================
INSERT INTO Traits 
		(Type, 						Description, 						ShortDescription)
VALUES	('TRAIT_TG_MINQUAS_PATH',	'TXT_KEY_TRAIT_TG_MINQUAS_PATH', 	'TXT_KEY_TRAIT_TG_MINQUAS_PATH_SHORT');