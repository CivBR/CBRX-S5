-- Teotihuacan

-- ======================================================================================================
-- CIVILIZATIONS
-- ======================================================================================================
-- Civilizations
----------------
-- !TODO make sure civ pedia tag is present (if non-vanilla alt) or absent (if vanilla alt).
INSERT INTO Civilizations   
       (Type,                                      Description,                             ShortDescription,                          Adjective,                            Civilopedia,                CivilopediaTag,								 DefaultPlayerColor,             ArtDefineTag,   ArtStyleType,  ArtStyleSuffix, ArtStylePrefix,                  IconAtlas,        PortraitIndex,  AlphaIconAtlas,               SoundtrackTag,   MapImage,                   DawnOfManQuote,                   DawnOfManImage)
SELECT 'CIVILIZATION_ZRQ_TEO_SPEAROWL', 'TXT_KEY_CIV_ZRQ_TEO_SPEAROWL_DESC',  'TXT_KEY_CIV_ZRQ_TEO_SPEAROWL_SHORT_DESC',   'TXT_KEY_CIV_ZRQ_TEO_SPEAROWL_ADJECTIVE',    'TXT_KEY_PEDIA_ZRQ_TEO_SPEAROWL_TEXT',  'TXT_KEY_PEDIA_ZRQ_TEO_SPEAROWL',     'PLAYERCOLOR_ZRQ_TEO_SPEAROWL',     ArtDefineTag,   ArtStyleType,  ArtStyleSuffix, ArtStylePrefix,    'ZRQ_TEO_SPEAROWL_ATLAS',   0,             'ZRQ_TEO_SPEAROWL_ALPHA_ATLAS',   SoundtrackTag,  'TeotihuacanMap.dds',  'TXT_KEY_CIV5_DAWN_ZRQ_TEO_SPEAROWL_TEXT',   'TeoDoM.dds'
FROM Civilizations WHERE Type = 'CIVILIZATION_AZTEC';
-------------------------

-------------------------
-- Civilization_CityNames
-------------------------
-- !TODO update based on correct number of cities
INSERT INTO Civilization_CityNames
        (CivilizationType,                CityName)
VALUES  ('CIVILIZATION_ZRQ_TEO_SPEAROWL',     'TXT_KEY_CITY_NAME_ZRQ_TEO_SPEAROWL_1'),
        ('CIVILIZATION_ZRQ_TEO_SPEAROWL',     'TXT_KEY_CITY_NAME_ZRQ_TEO_SPEAROWL_2'),
        ('CIVILIZATION_ZRQ_TEO_SPEAROWL',     'TXT_KEY_CITY_NAME_ZRQ_TEO_SPEAROWL_3'),
        ('CIVILIZATION_ZRQ_TEO_SPEAROWL',     'TXT_KEY_CITY_NAME_ZRQ_TEO_SPEAROWL_4'),
        ('CIVILIZATION_ZRQ_TEO_SPEAROWL',     'TXT_KEY_CITY_NAME_ZRQ_TEO_SPEAROWL_5'),
        ('CIVILIZATION_ZRQ_TEO_SPEAROWL',     'TXT_KEY_CITY_NAME_ZRQ_TEO_SPEAROWL_6'),
        ('CIVILIZATION_ZRQ_TEO_SPEAROWL',     'TXT_KEY_CITY_NAME_ZRQ_TEO_SPEAROWL_7'),
        ('CIVILIZATION_ZRQ_TEO_SPEAROWL',     'TXT_KEY_CITY_NAME_ZRQ_TEO_SPEAROWL_8'),
        ('CIVILIZATION_ZRQ_TEO_SPEAROWL',     'TXT_KEY_CITY_NAME_ZRQ_TEO_SPEAROWL_9'),
        ('CIVILIZATION_ZRQ_TEO_SPEAROWL',     'TXT_KEY_CITY_NAME_ZRQ_TEO_SPEAROWL_10'),
        ('CIVILIZATION_ZRQ_TEO_SPEAROWL',     'TXT_KEY_CITY_NAME_ZRQ_TEO_SPEAROWL_11'),
        ('CIVILIZATION_ZRQ_TEO_SPEAROWL',     'TXT_KEY_CITY_NAME_ZRQ_TEO_SPEAROWL_12'),
        ('CIVILIZATION_ZRQ_TEO_SPEAROWL',     'TXT_KEY_CITY_NAME_ZRQ_TEO_SPEAROWL_13'),
        ('CIVILIZATION_ZRQ_TEO_SPEAROWL',     'TXT_KEY_CITY_NAME_ZRQ_TEO_SPEAROWL_14');

-----------------------------------
-- Civilization_FreeBuildingClasses
-----------------------------------
INSERT INTO Civilization_FreeBuildingClasses
          (CivilizationType,              BuildingClassType)
SELECT    'CIVILIZATION_ZRQ_TEO_SPEAROWL',     BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE CivilizationType = 'CIVILIZATION_AZTEC';
-------------------------
-- Civilization_FreeTechs
-------------------------
INSERT INTO Civilization_FreeTechs
          (CivilizationType,              TechType)
SELECT    'CIVILIZATION_ZRQ_TEO_SPEAROWL',     TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_AZTEC';
-------------------------
-- Civilization_FreeUnits
-------------------------
INSERT INTO Civilization_FreeUnits
          (CivilizationType,              UnitClassType, Count, UnitAIType)
SELECT    'CIVILIZATION_ZRQ_TEO_SPEAROWL',     UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_AZTEC';
-----------------------
-- Civilization_Leaders
-----------------------
INSERT INTO Civilization_Leaders
       (CivilizationType,            LeaderheadType)
VALUES ('CIVILIZATION_ZRQ_TEO_SPEAROWL', 'LEADER_ZRQ_SPEAROWL');
----------------------------------
-- Civilization_UnitClassOverrides
----------------------------------
INSERT INTO Civilization_UnitClassOverrides
       (CivilizationType,            UnitClassType,                  UnitType)
VALUES ('CIVILIZATION_ZRQ_TEO_SPEAROWL', 'UNITCLASS_SPEARMAN', 'UNIT_ZRQ_CANINE');
-------------------------
-- Civilization_Religions
-------------------------
INSERT INTO Civilization_Religions
       (CivilizationType,            ReligionType)
SELECT 'CIVILIZATION_ZRQ_TEO_SPEAROWL', ReligionType
FROM Civilization_Religions WHERE (CivilizationType = 'CIVILIZATION_AZTEC');
------------------------
-- Civilization_SpyNames
------------------------
INSERT INTO Civilization_SpyNames
          (CivilizationType,                SpyName)
VALUES    ('CIVILIZATION_ZRQ_TEO_SPEAROWL',     'TXT_KEY_SPY_NAME_ZRQ_TEO_SPEAROWL_0'),
          ('CIVILIZATION_ZRQ_TEO_SPEAROWL',     'TXT_KEY_SPY_NAME_ZRQ_TEO_SPEAROWL_1'),
          ('CIVILIZATION_ZRQ_TEO_SPEAROWL',     'TXT_KEY_SPY_NAME_ZRQ_TEO_SPEAROWL_2'),
          ('CIVILIZATION_ZRQ_TEO_SPEAROWL',     'TXT_KEY_SPY_NAME_ZRQ_TEO_SPEAROWL_3'),
          ('CIVILIZATION_ZRQ_TEO_SPEAROWL',     'TXT_KEY_SPY_NAME_ZRQ_TEO_SPEAROWL_4'),
          ('CIVILIZATION_ZRQ_TEO_SPEAROWL',     'TXT_KEY_SPY_NAME_ZRQ_TEO_SPEAROWL_5'),
          ('CIVILIZATION_ZRQ_TEO_SPEAROWL',     'TXT_KEY_SPY_NAME_ZRQ_TEO_SPEAROWL_6'),
          ('CIVILIZATION_ZRQ_TEO_SPEAROWL',     'TXT_KEY_SPY_NAME_ZRQ_TEO_SPEAROWL_7'),
          ('CIVILIZATION_ZRQ_TEO_SPEAROWL',     'TXT_KEY_SPY_NAME_ZRQ_TEO_SPEAROWL_8'),
          ('CIVILIZATION_ZRQ_TEO_SPEAROWL',     'TXT_KEY_SPY_NAME_ZRQ_TEO_SPEAROWL_9');

-- ======================================================================================================
-- LEADERS
-- ======================================================================================================
-- Leaders
----------
INSERT INTO Leaders
(Type,                                     Description,                                             Civilopedia,        CivilopediaTag,         ArtDefineTag,               VictoryCompetitiveness,     WonderCompetitiveness,     MinorCivCompetitiveness,     Boldness,     DiploBalance,   WarmongerHate,     DenounceWillingness,     DoFWillingness, Loyalty,     Neediness,    Forgiveness,     Chattiness, Meanness,     IconAtlas,             PortraitIndex)
VALUES    ('LEADER_ZRQ_SPEAROWL',     'TXT_KEY_LEADER_ZRQ_SPEAROWL',    'TXT_KEY_LEADER_ZRQ_SPEAROWL_PEDIA_TEXT',  'TXT_KEY_LEADER_ZRQ_SPEAROWL_PEDIA', 'Leaderhead_SpearOwl.xml',			  6,                          9,                          6,            9,            2,              1,                  7,                     2,                 3,              2,           2,               4,          9,           'ZRQ_TEO_SPEAROWL_ATLAS',   1);
--------------------------------
-- Leader_MajorCivApproachBiases
--------------------------------
INSERT INTO Leader_MajorCivApproachBiases
          (LeaderType,                   MajorCivApproachType,              Bias)
VALUES    ('LEADER_ZRQ_SPEAROWL',     'MAJOR_CIV_APPROACH_WAR',           9),
          ('LEADER_ZRQ_SPEAROWL',     'MAJOR_CIV_APPROACH_HOSTILE',       7),
          ('LEADER_ZRQ_SPEAROWL',     'MAJOR_CIV_APPROACH_DECEPTIVE',     1),
          ('LEADER_ZRQ_SPEAROWL',     'MAJOR_CIV_APPROACH_GUARDED',       5),
          ('LEADER_ZRQ_SPEAROWL',     'MAJOR_CIV_APPROACH_AFRAID',        1),
          ('LEADER_ZRQ_SPEAROWL',     'MAJOR_CIV_APPROACH_FRIENDLY',      4),
          ('LEADER_ZRQ_SPEAROWL',     'MAJOR_CIV_APPROACH_NEUTRAL',       6);
--------------------------------
-- Leader_MinorCivApproachBiases
--------------------------------
INSERT INTO Leader_MinorCivApproachBiases
          (LeaderType,                   MinorCivApproachType,              Bias)
VALUES    ('LEADER_ZRQ_SPEAROWL',     'MINOR_CIV_APPROACH_IGNORE',        4),
          ('LEADER_ZRQ_SPEAROWL',     'MINOR_CIV_APPROACH_FRIENDLY',      2),
          ('LEADER_ZRQ_SPEAROWL',     'MINOR_CIV_APPROACH_PROTECTIVE',    3),
          ('LEADER_ZRQ_SPEAROWL',     'MINOR_CIV_APPROACH_CONQUEST',      9),
          ('LEADER_ZRQ_SPEAROWL',     'MINOR_CIV_APPROACH_BULLY',         7);
-----------------
-- Leader_Flavors
-----------------
INSERT INTO Leader_Flavors
          (LeaderType,                   FlavorType,                        Flavor)
VALUES    ('LEADER_ZRQ_SPEAROWL',     'FLAVOR_OFFENSE',                   9),
          ('LEADER_ZRQ_SPEAROWL',     'FLAVOR_DEFENSE',                   4),
          ('LEADER_ZRQ_SPEAROWL',     'FLAVOR_CITY_DEFENSE',              3),
          ('LEADER_ZRQ_SPEAROWL',     'FLAVOR_MILITARY_TRAINING',         6),
          ('LEADER_ZRQ_SPEAROWL',     'FLAVOR_RECON',                     3),
          ('LEADER_ZRQ_SPEAROWL',     'FLAVOR_RANGED',                    9),
          ('LEADER_ZRQ_SPEAROWL',     'FLAVOR_MOBILE',                    4),
          ('LEADER_ZRQ_SPEAROWL',     'FLAVOR_NAVAL',                     2),
          ('LEADER_ZRQ_SPEAROWL',     'FLAVOR_NAVAL_RECON',               1),
          ('LEADER_ZRQ_SPEAROWL',     'FLAVOR_NAVAL_GROWTH',              3),
          ('LEADER_ZRQ_SPEAROWL',     'FLAVOR_NAVAL_TILE_IMPROVEMENT',    1),
          ('LEADER_ZRQ_SPEAROWL',     'FLAVOR_AIR',                       5),
          ('LEADER_ZRQ_SPEAROWL',     'FLAVOR_EXPANSION',                 10),
          ('LEADER_ZRQ_SPEAROWL',     'FLAVOR_GROWTH',                    5),
          ('LEADER_ZRQ_SPEAROWL',     'FLAVOR_TILE_IMPROVEMENT',          7),
          ('LEADER_ZRQ_SPEAROWL',     'FLAVOR_INFRASTRUCTURE',            4),
          ('LEADER_ZRQ_SPEAROWL',     'FLAVOR_PRODUCTION',                9),
          ('LEADER_ZRQ_SPEAROWL',     'FLAVOR_GOLD',                      4),
          ('LEADER_ZRQ_SPEAROWL',     'FLAVOR_SCIENCE',                   3),
          ('LEADER_ZRQ_SPEAROWL',     'FLAVOR_CULTURE',                   9),
          ('LEADER_ZRQ_SPEAROWL',     'FLAVOR_HAPPINESS',                 6),
          ('LEADER_ZRQ_SPEAROWL',     'FLAVOR_GREAT_PEOPLE',              5),
          ('LEADER_ZRQ_SPEAROWL',     'FLAVOR_WONDER',                    9),
          ('LEADER_ZRQ_SPEAROWL',     'FLAVOR_RELIGION',                  6),
          ('LEADER_ZRQ_SPEAROWL',     'FLAVOR_DIPLOMACY',                 4),
          ('LEADER_ZRQ_SPEAROWL',     'FLAVOR_SPACESHIP',                 3),
          ('LEADER_ZRQ_SPEAROWL',     'FLAVOR_WATER_CONNECTION',          3),
          ('LEADER_ZRQ_SPEAROWL',     'FLAVOR_NUKE',                      5),
          ('LEADER_ZRQ_SPEAROWL',     'FLAVOR_USE_NUKE',                  8),
          ('LEADER_ZRQ_SPEAROWL',     'FLAVOR_ESPIONAGE',                 4),
          ('LEADER_ZRQ_SPEAROWL',     'FLAVOR_ANTIAIR',                   6),
          ('LEADER_ZRQ_SPEAROWL',     'FLAVOR_AIRLIFT',                   5),
          ('LEADER_ZRQ_SPEAROWL',     'FLAVOR_I_TRADE_DESTINATION',       7),
          ('LEADER_ZRQ_SPEAROWL',     'FLAVOR_I_TRADE_ORIGIN',            9),
          ('LEADER_ZRQ_SPEAROWL',     'FLAVOR_I_SEA_TRADE_ROUTE',         2),
          ('LEADER_ZRQ_SPEAROWL',     'FLAVOR_I_LAND_TRADE_ROUTE',        9),
          ('LEADER_ZRQ_SPEAROWL',     'FLAVOR_ARCHAEOLOGY',               5),
          ('LEADER_ZRQ_SPEAROWL',     'FLAVOR_AIR_CARRIER',               3);
----------------
-- Leader_Traits
----------------
INSERT INTO Leader_Traits
       (LeaderType,                 TraitType)
VALUES ('LEADER_ZRQ_SPEAROWL',   'TRAIT_ZRQ_MEN_BECOME_GODS');

--==========================================================================================================================	
-- RESOURCES
--==========================================================================================================================	
-- Resources
------------------------------	
INSERT INTO Resources 
		(Type,						Description,						Civilopedia, 								ResourceClassType, 		Happiness,  AITradeModifier, 	ResourceUsage,	AIObjective,	'Unique', 	IconString, 				PortraitIndex, 	IconAtlas)
VALUES	('RESOURCE_ZRQ_OBSIDIAN',	'TXT_KEY_RESOURCE_ZRQ_OBSIDIAN',		'TXT_KEY_CIV5_RESOURCE_ZRQ_OBSIDIAN_TEXT',	'RESOURCECLASS_LUXURY',	4,			10,					2, 				0, 				2, 			'[ICON_RES_ZRQ_OBSIDIAN]',	2, 				'ZRQ_TEO_SPEAROWL_ATLAS');
-- ======================================================================================================
-- ======================================================================================================
-- UNITS
-- ======================================================================================================
--------
-- Units
--------
INSERT INTO Units
(Type,							   Class,    CombatClass, WorkRate, PrereqTech, Combat, RangedCombat, Range, FaithCost, RequiresFaithPurchaseEnabled, Cost, Moves, Domain, DefaultUnitAI, CivilianAttackPriority, Special,  Description,                                   Help,                                     Strategy,                        Civilopedia,                      MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, IgnoreBuildingDefense, AdvancedStartCost, MinAreaSize, GoodyHutUpgradeUnitClass, CombatLimit, XPValueAttack, XPValueDefense, Conscription,             UnitArtInfo,               UnitFlagAtlas,                 UnitFlagIconOffset,    IconAtlas,          PortraitIndex,  MoveRate)
SELECT    'UNIT_ZRQ_CANINE',   Class,    CombatClass, Workrate, PrereqTech, Combat, RangedCombat, Range, FaithCost, RequiresFaithPurchaseEnabled, Cost, Moves, Domain, DefaultUnitAI, CivilianAttackPriority, Special, 'TXT_KEY_UNIT_ZRQ_CANINE',    'TXT_KEY_UNIT_ZRQ_CANINE_HELP',    'TXT_KEY_UNIT_ZRQ_CANINE_STRATEGY',      'TXT_KEY_UNIT_ZRQ_CANINE_TEXT',    MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, IgnoreBuildingDefense, AdvancedStartCost, MinAreaSize, GoodyHutUpgradeUnitClass, CombatLimit, XPValueAttack, XPValueDefense, Conscription, 'ART_DEF_UNIT_ZRQ_CANINE', 'ZRQ_CANINE_FLAG',    0,                    'ZRQ_TEO_SPEAROWL_ATLAS',   3,              MoveRate
FROM Units WHERE Type = 'UNIT_SPEARMAN';
-----------------
-- UnitPromotions
-----------------
INSERT INTO UnitPromotions  
          (Type,                               Description,                                  Help,                                         Sound,         CannotBeChosen, PortraitIndex,        IconAtlas,             PediaType,             PediaEntry   )
VALUES    ('PROMOTION_ZRQ_CANINE',    'TXT_KEY_PROMOTION_ZRQ_CANINE',    'TXT_KEY_PROMOTION_ZRQ_CANINE_HELP',    'AS2D_IF_LEVELUP',    1,                 59,             'PROMOTION_ATLAS',     'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_ZRQ_CANINE');

INSERT INTO UnitPromotions  
          (Type,                               Description,                                  Help,                                         Sound,         CannotBeChosen, PortraitIndex,        IconAtlas,							   PediaType,             PediaEntry,							CityAttack   )
VALUES    ('PROMOTION_ZRQ_CANINE_CITY_BONUS',    'TXT_KEY_PROMOTION_ZRQ_CANINE_CITY_BONUS',    'TXT_KEY_PROMOTION_ZRQ_CANINE_CITY_BONUS_HELP',    'AS2D_IF_LEVELUP',    1,                 59,             'PROMOTION_ATLAS',     'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_ZRQ_CANINE_CITY_BONUS', 100); 

------------------------
-- UnitGameplay2DScripts
------------------------
INSERT INTO UnitGameplay2DScripts
       (UnitType,                   SelectionSound, FirstSelectionSound)
SELECT 'UNIT_ZRQ_CANINE',  SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_SPEARMAN';
---------------
-- Unit_AITypes
---------------
INSERT INTO Unit_AITypes
          (UnitType,                     UnitAIType)
SELECT    'UNIT_ZRQ_CANINE',    UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_SPEARMAN';
---------------------
-- Unit_ClassUpgrades
---------------------
INSERT INTO Unit_ClassUpgrades
        (UnitType,                   UnitClassType)
SELECT  'UNIT_ZRQ_CANINE',  UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_SPEARMAN';
---------------
-- Unit_Flavors
---------------
INSERT INTO Unit_Flavors
       (UnitType,                   FlavorType, Flavor)
SELECT 'UNIT_ZRQ_CANINE',  FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_SPEARMAN';
----------------------
-- Unit_FreePromotions
----------------------
INSERT INTO Unit_FreePromotions
        (UnitType,                   PromotionType)
SELECT  'UNIT_ZRQ_CANINE',  PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_SPEARMAN';

UPDATE Unit_FreePromotions
SET PromotionType = 'PROMOTION_ZRQ_CANINE'
WHERE UnitType = 'UNIT_ZRQ_CANINE';

-- ======================================================================================================
-- BUILDINGS
-- ======================================================================================================
------------
-- Buildings
------------
INSERT INTO Buildings
(Type,                                             BuildingClass,   Cost, FaithCost, UnlockedByBelief, SpecialistType, SpecialistCount, GoldMaintenance, CultureRateModifier, GreatWorkSlotType, GreatWorkCount, PrereqTech,  FreeStartEra, FreeBuildingThisCity,    Description,                         Help,                               Civilopedia,                                                    Strategy,                                          ArtDefineTag, MinAreaSize, NeverCapture, ConquestProb,   HurryCostModifier, DisplayPosition,  PortraitIndex, IconAtlas)
SELECT    'BUILDING_ZRQ_OBSIDIAN_WORKSHOP',    BuildingClass,   Cost, FaithCost, UnlockedByBelief, SpecialistType, SpecialistCount, GoldMaintenance, CultureRateModifier, 'GREAT_WORK_SLOT_ART_ARTIFACT', 1, PrereqTech,  FreeStartEra, FreeBuildingThisCity,  'TXT_KEY_BLDG_ZRQ_OBSIDIAN_WORKSHOP',    'TXT_KEY_BLDG_ZRQ_OBSIDIAN_WORKSHOP_HELP',    'TXT_KEY_BLDG_ZRQ_OBSIDIAN_WORKSHOP_TEXT',    'TXT_KEY_BLDG_ZRQ_OBSIDIAN_WORKSHOP_STRATEGY',  ArtDefineTag, MinAreaSize, NeverCapture, ConquestProb,   HurryCostModifier, DisplayPosition,  4,            'ZRQ_TEO_SPEAROWL_ATLAS'
FROM Buildings WHERE Type = 'BUILDING_CARAVANSARY';

INSERT INTO Buildings 	
		(Type, 										BuildingClass, 			NumTradeRouteBonus,  GreatWorkCount,		Cost, FaithCost,   PrereqTech,   NeverCapture,	Description, 									Help)
VALUES	('BUILDING_ZRQ_TRADE_DUMMY', 	'BUILDINGCLASS_ZRQ_TRADE_DUMMY', 			1,				-1, 				-1,   -1, 		   null, 		 1,				'TXT_KEY_BUILDING_ZRQ_TRADE_DUMMY',		'TXT_KEY_BUILDING_ZRQ_TRADE_DUMMY_HELP'),
		('BUILDING_ZRQ_WORKER_DUMMY', 	'BUILDINGCLASS_ZRQ_WORKER_DUMMY', 			0,				-1, 				-1,   -1, 		   null, 		 1,				'TXT_KEY_BUILDING_ZRQ_WORKER_DUMMY',	'TXT_KEY_BUILDING_ZRQ_WORKER_DUMMY_HELP'),
		('BUILDING_ZRQ_WONDER_DUMMY', 	'BUILDINGCLASS_ZRQ_WONDER_DUMMY', 	    	0,				-1, 				-1,   -1, 		   null, 		 1,				'TXT_KEY_BUILDING_ZRQ_WONDER_DUMMY',	'TXT_KEY_BUILDING_ZRQ_WONDER_DUMMY_HELP');
-------------------
-- BuildingClasses
-------------------
INSERT INTO BuildingClasses
		(Type, 									DefaultBuilding, 					Description)
VALUES	('BUILDINGCLASS_ZRQ_TRADE_DUMMY',  'BUILDING_ZRQ_TRADE_DUMMY',	'TXT_KEY_BUILDING_ZRQ_TRADE_DUMMY'),
		('BUILDINGCLASS_ZRQ_WORKER_DUMMY',  'BUILDING_ZRQ_WORKER_DUMMY',	'TXT_KEY_BUILDING_ZRQ_WORKER_DUMMY'),
		('BUILDINGCLASS_ZRQ_WONDER_DUMMY',  'BUILDING_ZRQ_WONDER_DUMMY',	'TXT_KEY_BUILDING_ZRQ_WONDER_DUMMY');



------------------------------	
-- Building_ResourceQuantity
------------------------------	
INSERT INTO Building_ResourceQuantity 	
		(BuildingType, 						ResourceType, 			Quantity)
VALUES	('BUILDING_ZRQ_OBSIDIAN_WORKSHOP',	'RESOURCE_ZRQ_OBSIDIAN', 1);	
----------------------------------
-- Civilization_BuildingClassOverrides
----------------------------------
INSERT INTO Civilization_BuildingClassOverrides
       (CivilizationType,            BuildingClassType,                  BuildingType)
VALUES ('CIVILIZATION_ZRQ_TEO_SPEAROWL', 'BUILDINGCLASS_CARAVANSARY', 'BUILDING_ZRQ_OBSIDIAN_WORKSHOP');

-------------------
-- Building_Flavors
-------------------
INSERT OR REPLACE INTO Building_Flavors
        (BuildingType,               FlavorType, Flavor)
SELECT  'BUILDING_ZRQ_OBSIDIAN_WORKSHOP', FlavorType, Flavor
FROM Building_Flavors WHERE BuildingType = 'BUILDING_CARAVANSARY';

------------------------
-- Building_YieldChanges
------------------------
INSERT INTO Building_YieldChanges
        (BuildingType,               YieldType, Yield)
SELECT  'BUILDING_ZRQ_OBSIDIAN_WORKSHOP', YieldType, Yield
FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_CARAVANSARY';


------------------------
-- Building_YieldModifiers
------------------------
INSERT INTO Building_YieldModifiers
	   (BuildingType,               YieldType, Yield)
VALUES ('BUILDING_ZRQ_WONDER_DUMMY',    'YIELD_PRODUCTION',        2);


-- ======================================================================================================
-- TRAITS
-- ======================================================================================================
-- Traits
---------
INSERT INTO Traits
       (Type,                     Description,                    ShortDescription)
VALUES ('TRAIT_ZRQ_MEN_BECOME_GODS',    'TXT_KEY_TRAIT_ZRQ_MEN_BECOME_GODS',   'TXT_KEY_TRAIT_ZRQ_MEN_BECOME_GODS_SHORT');


-- ======================================================================================================
-- DIPLOMACY
-- ======================================================================================================
INSERT INTO Diplomacy_Responses
		(LeaderType,			ResponseType,							Response,													Bias)
VALUES	('LEADER_ZRQ_SPEAROWL',	'RESPONSE_FIRST_GREETING',				'TXT_KEY_LEADER_ZRQ_SPEAROWL_FIRSTGREETING%',					500),
		('LEADER_ZRQ_SPEAROWL',	'RESPONSE_DEFEATED',					'TXT_KEY_LEADER_ZRQ_SPEAROWL_DEFEATED%',						500),
		('LEADER_ZRQ_SPEAROWL',	'RESPONSE_AI_DOF_BACKSTAB',				'TXT_KEY_LEADER_ZRQ_SPEAROWL_DENOUNCE_FRIEND%',				500),
		('LEADER_ZRQ_SPEAROWL',	'RESPONSE_ATTACKED_HOSTILE',			'TXT_KEY_LEADER_ZRQ_SPEAROWL_ATTACKED_HOSTILE%',				500),
        ('LEADER_ZRQ_SPEAROWL',	'RESPONSE_DOW_GENERIC',					'TXT_KEY_LEADER_ZRQ_SPEAROWL_DOW_GENERIC%',					500),
        ('LEADER_ZRQ_SPEAROWL',	'RESPONSE_RESPONSE_TO_BEING_DENOUNCED',	'TXT_KEY_LEADER_ZRQ_SPEAROWL_RESPONSE_TO_BEING_DENOUNCED%',	500),
        ('LEADER_ZRQ_SPEAROWL',	'RESPONSE_WORK_AGAINST_SOMEONE',		'TXT_KEY_LEADER_ZRQ_SPEAROWL_DENOUNCE%',						500),
        ('LEADER_ZRQ_SPEAROWL',	'RESPONSE_WORK_WITH_US',				'TXT_KEY_LEADER_ZRQ_SPEAROWL_DEC_FRIENDSHIP%',				500);
-- ======================================================================================================

