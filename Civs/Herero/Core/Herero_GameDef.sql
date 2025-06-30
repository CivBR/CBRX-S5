-- Herero
-- ======================================================================================================
-- CIVILIZATIONS
-- ======================================================================================================
-- Civilizations
----------------
INSERT INTO Civilizations
       (Type,                         Description,                       ShortDescription,                          Adjective,                          Civilopedia,                         CivilopediaTag,      DefaultPlayerColor,       ArtDefineTag,   ArtStyleType,  ArtStyleSuffix, ArtStylePrefix,                  IconAtlas,        PortraitIndex,  AlphaIconAtlas,               SoundtrackTag,   MapImage,                   DawnOfManQuote,                   DawnOfManImage)
SELECT 'CIVILIZATION_THP_HERERO', 'TXT_KEY_CIV_THP_HERERO_DESC',  'TXT_KEY_CIV_THP_HERERO_SHORT_DESC',   'TXT_KEY_CIV_THP_HERERO_ADJECTIVE',    'TXT_KEY_PEDIA_THP_HERERO_TEXT',  'TXT_KEY_PEDIA_THP_HERERO', 'PLAYERCOLOR_THP_HERERO',     ArtDefineTag,   ArtStyleType,  ArtStyleSuffix, ArtStylePrefix,    'THP_HERERO_ATLAS',   0,             'THP_HERERO_ALPHA_ATLAS',   SoundtrackTag,  'Map_Herero.dds',  'TXT_KEY_CIV5_DAWN_THP_HERERO_TEXT',   'JacobMorenga_DOM.dds'
FROM Civilizations WHERE Type = 'CIVILIZATION_ZULU';
-------------------------
-- Civilization_CityNames
-------------------------
INSERT INTO Civilization_CityNames
        (CivilizationType,               CityName)
VALUES  ('CIVILIZATION_THP_HERERO',     'TXT_KEY_CITY_NAME_THP_HERERO_1'),
        ('CIVILIZATION_THP_HERERO',     'TXT_KEY_CITY_NAME_THP_HERERO_2'),
        ('CIVILIZATION_THP_HERERO',     'TXT_KEY_CITY_NAME_THP_HERERO_3'),
        ('CIVILIZATION_THP_HERERO',     'TXT_KEY_CITY_NAME_THP_HERERO_4'),
        ('CIVILIZATION_THP_HERERO',     'TXT_KEY_CITY_NAME_THP_HERERO_5'),
        ('CIVILIZATION_THP_HERERO',     'TXT_KEY_CITY_NAME_THP_HERERO_6'),
        ('CIVILIZATION_THP_HERERO',     'TXT_KEY_CITY_NAME_THP_HERERO_7'),
        ('CIVILIZATION_THP_HERERO',     'TXT_KEY_CITY_NAME_THP_HERERO_8'),
        ('CIVILIZATION_THP_HERERO',     'TXT_KEY_CITY_NAME_THP_HERERO_9'),
        ('CIVILIZATION_THP_HERERO',     'TXT_KEY_CITY_NAME_THP_HERERO_10'),
        ('CIVILIZATION_THP_HERERO',     'TXT_KEY_CITY_NAME_THP_HERERO_11'),
        ('CIVILIZATION_THP_HERERO',     'TXT_KEY_CITY_NAME_THP_HERERO_12'),
        ('CIVILIZATION_THP_HERERO',     'TXT_KEY_CITY_NAME_THP_HERERO_13'),
        ('CIVILIZATION_THP_HERERO',     'TXT_KEY_CITY_NAME_THP_HERERO_14'),
        ('CIVILIZATION_THP_HERERO',     'TXT_KEY_CITY_NAME_THP_HERERO_15'),
        ('CIVILIZATION_THP_HERERO',     'TXT_KEY_CITY_NAME_THP_HERERO_16'),
        ('CIVILIZATION_THP_HERERO',     'TXT_KEY_CITY_NAME_THP_HERERO_17'),
        ('CIVILIZATION_THP_HERERO',     'TXT_KEY_CITY_NAME_THP_HERERO_18'),
        ('CIVILIZATION_THP_HERERO',     'TXT_KEY_CITY_NAME_THP_HERERO_19'),
        ('CIVILIZATION_THP_HERERO',     'TXT_KEY_CITY_NAME_THP_HERERO_20'),
        ('CIVILIZATION_THP_HERERO',     'TXT_KEY_CITY_NAME_THP_HERERO_21'),
        ('CIVILIZATION_THP_HERERO',     'TXT_KEY_CITY_NAME_THP_HERERO_22'),
        ('CIVILIZATION_THP_HERERO',     'TXT_KEY_CITY_NAME_THP_HERERO_23'),
        ('CIVILIZATION_THP_HERERO',     'TXT_KEY_CITY_NAME_THP_HERERO_24'),
        ('CIVILIZATION_THP_HERERO',     'TXT_KEY_CITY_NAME_THP_HERERO_25'),
        ('CIVILIZATION_THP_HERERO',     'TXT_KEY_CITY_NAME_THP_HERERO_26'),
        ('CIVILIZATION_THP_HERERO',     'TXT_KEY_CITY_NAME_THP_HERERO_27'),
        ('CIVILIZATION_THP_HERERO',     'TXT_KEY_CITY_NAME_THP_HERERO_28');
-----------------------------------
-- Civilization_FreeBuildingClasses
-----------------------------------
INSERT INTO Civilization_FreeBuildingClasses
          (CivilizationType,             BuildingClassType)
SELECT    'CIVILIZATION_THP_HERERO',     BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE CivilizationType = 'CIVILIZATION_ZULU';
-------------------------
-- Civilization_FreeTechs
-------------------------
INSERT INTO Civilization_FreeTechs
          (CivilizationType,             TechType)
SELECT    'CIVILIZATION_THP_HERERO',     TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_ZULU';
-------------------------
-- Civilization_FreeUnits
-------------------------
INSERT INTO Civilization_FreeUnits
          (CivilizationType,             UnitClassType, Count, UnitAIType)
SELECT    'CIVILIZATION_THP_HERERO',     UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_ZULU';
-----------------------
-- Civilization_Leaders
-----------------------
INSERT INTO Civilization_Leaders
       (CivilizationType,           LeaderheadType)
VALUES ('CIVILIZATION_THP_HERERO', 'LEADER_THP_JACOB_MORENGA');
--------------------------------------
-- Civilization_BuildingClassOverrides
--------------------------------------
INSERT INTO Civilization_BuildingClassOverrides
       (CivilizationType,           BuildingClassType,      BuildingType)
VALUES ('CIVILIZATION_THP_HERERO', 'BUILDINGCLASS_SHRINE', 'BUILDING_THP_OKURUUO');
----------------------------------
-- Civilization_UnitClassOverrides
----------------------------------
INSERT INTO Civilization_UnitClassOverrides
       (CivilizationType,             UnitClassType,        UnitType)
VALUES ('CIVILIZATION_THP_HERERO', 'UNITCLASS_CAVALRY', 'UNIT_THP_HERERO_OX_RIDER');
-------------------------
-- Civilization_Religions
-------------------------
INSERT INTO Civilization_Religions
       (CivilizationType,           ReligionType)
VALUES ('CIVILIZATION_THP_HERERO', 'RELIGION_PROTESTANTISM');
------------------------
-- Civilization_SpyNames
------------------------
INSERT INTO Civilization_SpyNames
          (CivilizationType,               SpyName)
VALUES    ('CIVILIZATION_THP_HERERO',     'TXT_KEY_SPY_NAME_THP_HERERO_0'),
          ('CIVILIZATION_THP_HERERO',     'TXT_KEY_SPY_NAME_THP_HERERO_1'),
          ('CIVILIZATION_THP_HERERO',     'TXT_KEY_SPY_NAME_THP_HERERO_2'),
          ('CIVILIZATION_THP_HERERO',     'TXT_KEY_SPY_NAME_THP_HERERO_3'),
          ('CIVILIZATION_THP_HERERO',     'TXT_KEY_SPY_NAME_THP_HERERO_4'),
          ('CIVILIZATION_THP_HERERO',     'TXT_KEY_SPY_NAME_THP_HERERO_5'),
          ('CIVILIZATION_THP_HERERO',     'TXT_KEY_SPY_NAME_THP_HERERO_6'),
          ('CIVILIZATION_THP_HERERO',     'TXT_KEY_SPY_NAME_THP_HERERO_7'),
          ('CIVILIZATION_THP_HERERO',     'TXT_KEY_SPY_NAME_THP_HERERO_8'),
          ('CIVILIZATION_THP_HERERO',     'TXT_KEY_SPY_NAME_THP_HERERO_9'),
          ('CIVILIZATION_THP_HERERO',     'TXT_KEY_SPY_NAME_THP_HERERO_10');
-------------------------------------
-- Civilization_Start_Region_Priority
-------------------------------------
INSERT INTO Civilization_Start_Region_Priority
	(CivilizationType,		RegionType)
VALUES	('CIVILIZATION_THP_HERERO',	'REGION_DESERT');
-- ======================================================================================================
-- LEADERS
-- ======================================================================================================
-- Leaders
----------
INSERT INTO Leaders
(Type,                                     Description,                                             Civilopedia,        CivilopediaTag,         ArtDefineTag,               VictoryCompetitiveness,     WonderCompetitiveness,     MinorCivCompetitiveness,     Boldness,     DiploBalance,   WarmongerHate,     DenounceWillingness,     DoFWillingness, Loyalty,     Neediness,    Forgiveness,     Chattiness, Meanness,     IconAtlas,             PortraitIndex)
VALUES    ('LEADER_THP_JACOB_MORENGA',     'TXT_KEY_LEADER_THP_JACOB_MORENGA',    'TXT_KEY_LEADER_THP_JACOB_MORENGA_PEDIA_TEXT',  'TXT_KEY_LEADER_THP_JACOB_MORENGA_PEDIA', 'Leaderhead_Morenga.xml',    7,                          3,                          6,                           9,            6,             8,                 7,                       5,                 5,           5,            3,               3,          6,           'THP_HERERO_ATLAS',   1);
--------------------------------
-- Leader_MajorCivApproachBiases
--------------------------------
INSERT INTO Leader_MajorCivApproachBiases
          (LeaderType,                      MajorCivApproachType,              Bias)
VALUES    ('LEADER_THP_JACOB_MORENGA',     'MAJOR_CIV_APPROACH_WAR',           7),
          ('LEADER_THP_JACOB_MORENGA',     'MAJOR_CIV_APPROACH_HOSTILE',       6),
          ('LEADER_THP_JACOB_MORENGA',     'MAJOR_CIV_APPROACH_DECEPTIVE',     5),
          ('LEADER_THP_JACOB_MORENGA',     'MAJOR_CIV_APPROACH_GUARDED',       8),
          ('LEADER_THP_JACOB_MORENGA',     'MAJOR_CIV_APPROACH_AFRAID',        5),
          ('LEADER_THP_JACOB_MORENGA',     'MAJOR_CIV_APPROACH_FRIENDLY',      3),
          ('LEADER_THP_JACOB_MORENGA',     'MAJOR_CIV_APPROACH_NEUTRAL',       3);
--------------------------------
-- Leader_MinorCivApproachBiases
--------------------------------
INSERT INTO Leader_MinorCivApproachBiases
          (LeaderType,                      MinorCivApproachType,              Bias)
VALUES    ('LEADER_THP_JACOB_MORENGA',     'MINOR_CIV_APPROACH_IGNORE',        6),
          ('LEADER_THP_JACOB_MORENGA',     'MINOR_CIV_APPROACH_FRIENDLY',      4),
          ('LEADER_THP_JACOB_MORENGA',     'MINOR_CIV_APPROACH_PROTECTIVE',    7),
          ('LEADER_THP_JACOB_MORENGA',     'MINOR_CIV_APPROACH_CONQUEST',      3),
          ('LEADER_THP_JACOB_MORENGA',     'MINOR_CIV_APPROACH_BULLY',         3);
-----------------
-- Leader_Flavors
-----------------
INSERT INTO Leader_Flavors
          (LeaderType,                      FlavorType,                        Flavor)
VALUES    ('LEADER_THP_JACOB_MORENGA',     'FLAVOR_OFFENSE',                   8),
          ('LEADER_THP_JACOB_MORENGA',     'FLAVOR_DEFENSE',                   5),
          ('LEADER_THP_JACOB_MORENGA',     'FLAVOR_CITY_DEFENSE',              4),
          ('LEADER_THP_JACOB_MORENGA',     'FLAVOR_MILITARY_TRAINING',         6),
          ('LEADER_THP_JACOB_MORENGA',     'FLAVOR_RECON',                     5),
          ('LEADER_THP_JACOB_MORENGA',     'FLAVOR_RANGED',                    3),
          ('LEADER_THP_JACOB_MORENGA',     'FLAVOR_MOBILE',                    9),
          ('LEADER_THP_JACOB_MORENGA',     'FLAVOR_NAVAL',                     2),
          ('LEADER_THP_JACOB_MORENGA',     'FLAVOR_NAVAL_RECON',               3),
          ('LEADER_THP_JACOB_MORENGA',     'FLAVOR_NAVAL_GROWTH',              2),
          ('LEADER_THP_JACOB_MORENGA',     'FLAVOR_NAVAL_TILE_IMPROVEMENT',    3),
          ('LEADER_THP_JACOB_MORENGA',     'FLAVOR_AIR',                       5),
          ('LEADER_THP_JACOB_MORENGA',     'FLAVOR_EXPANSION',                 6),
          ('LEADER_THP_JACOB_MORENGA',     'FLAVOR_GROWTH',                    5),
          ('LEADER_THP_JACOB_MORENGA',     'FLAVOR_TILE_IMPROVEMENT',          9),
          ('LEADER_THP_JACOB_MORENGA',     'FLAVOR_INFRASTRUCTURE',            7),
          ('LEADER_THP_JACOB_MORENGA',     'FLAVOR_PRODUCTION',                7),
          ('LEADER_THP_JACOB_MORENGA',     'FLAVOR_GOLD',                      5),
          ('LEADER_THP_JACOB_MORENGA',     'FLAVOR_SCIENCE',                   3),
          ('LEADER_THP_JACOB_MORENGA',     'FLAVOR_CULTURE',                   4),
          ('LEADER_THP_JACOB_MORENGA',     'FLAVOR_HAPPINESS',                 4),
          ('LEADER_THP_JACOB_MORENGA',     'FLAVOR_GREAT_PEOPLE',              2),
          ('LEADER_THP_JACOB_MORENGA',     'FLAVOR_WONDER',                    3),
          ('LEADER_THP_JACOB_MORENGA',     'FLAVOR_RELIGION',                  7),
          ('LEADER_THP_JACOB_MORENGA',     'FLAVOR_DIPLOMACY',                 7),
          ('LEADER_THP_JACOB_MORENGA',     'FLAVOR_SPACESHIP',                 2),
          ('LEADER_THP_JACOB_MORENGA',     'FLAVOR_WATER_CONNECTION',          2),
          ('LEADER_THP_JACOB_MORENGA',     'FLAVOR_NUKE',                      6),
          ('LEADER_THP_JACOB_MORENGA',     'FLAVOR_USE_NUKE',                  3),
          ('LEADER_THP_JACOB_MORENGA',     'FLAVOR_ESPIONAGE',                 6),
          ('LEADER_THP_JACOB_MORENGA',     'FLAVOR_ANTIAIR',                   8),
          ('LEADER_THP_JACOB_MORENGA',     'FLAVOR_AIRLIFT',                   7),
          ('LEADER_THP_JACOB_MORENGA',     'FLAVOR_I_TRADE_DESTINATION',       5),
          ('LEADER_THP_JACOB_MORENGA',     'FLAVOR_I_TRADE_ORIGIN',            5),
          ('LEADER_THP_JACOB_MORENGA',     'FLAVOR_I_SEA_TRADE_ROUTE',         4),
          ('LEADER_THP_JACOB_MORENGA',     'FLAVOR_I_LAND_TRADE_ROUTE',        6),
          ('LEADER_THP_JACOB_MORENGA',     'FLAVOR_ARCHAEOLOGY',               3),
          ('LEADER_THP_JACOB_MORENGA',     'FLAVOR_AIR_CARRIER',               3);
----------------
-- Leader_Traits
----------------
INSERT INTO Leader_Traits
       (LeaderType,                    TraitType)
VALUES ('LEADER_THP_JACOB_MORENGA',   'TRAIT_THP_HERERO');
-- ======================================================================================================
-- TRAITS
-- ======================================================================================================
-- Traits
---------
INSERT INTO Traits
       (Type,                   Description,                  ShortDescription)
VALUES ('TRAIT_THP_HERERO',    'TXT_KEY_TRAIT_THP_HERERO',   'TXT_KEY_TRAIT_THP_HERERO_SHORT');
-- ======================================================================================================
-- BUILDINGS
-- ======================================================================================================
-- BuildingClasses
------------------
INSERT INTO BuildingClasses
        (Type,                               DefaultBuilding,                    Description)
VALUES  ('BUILDINGCLASS_THP_HERERO_FAITH_DUMMY',  'BUILDING_THP_HERERO_FAITH_DUMMY',   'TXT_KEY_BLDG_THP_HERERO_FAITH_DUMMY'),
('BUILDINGCLASS_THP_HERERO_PROD_DUMMY',  'BUILDING_THP_HERERO_PROD_DUMMY',   'TXT_KEY_BLDG_THP_HERERO_PROD_DUMMY');
------------
-- Buildings
------------
INSERT INTO Buildings
(Type,                                 BuildingClass,    Cost, FaithCost, UnlockedByBelief, SpecialistType, SpecialistCount, GoldMaintenance, PrereqTech,   FreeStartEra,    Description,                         Help,                               Civilopedia,                                                    Strategy,                             ArtDefineTag, MinAreaSize, NeverCapture, ConquestProb,   HurryCostModifier,  PortraitIndex, IconAtlas)
SELECT    'BUILDING_THP_OKURUUO',    BuildingClass,   Cost, FaithCost, UnlockedByBelief, SpecialistType, SpecialistCount, GoldMaintenance,  PrereqTech,  FreeStartEra,   'TXT_KEY_BLDG_THP_OKURUUO',    'TXT_KEY_BLDG_THP_OKURUUO_HELP',    'TXT_KEY_BLDG_THP_OKURUUO_TEXT',    'TXT_KEY_BLDG_THP_OKURUUO_STRATEGY',  ArtDefineTag, MinAreaSize, NeverCapture, ConquestProb,   HurryCostModifier,  3,            'THP_HERERO_ATLAS'
FROM Buildings WHERE Type = 'BUILDING_SHRINE';

INSERT INTO Buildings
(Type,                                       BuildingClass,                            SpecialistCount, GreatWorkCount, Cost, FaithCost, Description,                         Help,                                  NeverCapture)
VALUES    ('BUILDING_THP_HERERO_FAITH_DUMMY', 'BUILDINGCLASS_THP_HERERO_FAITH_DUMMY',       0,              -1,   -1,   -1,       'TXT_KEY_BLDG_THP_HERERO_FAITH_DUMMY',   'TXT_KEY_BLDG_THP_HERERO_FAITH_DUMMY',   1),
          ('BUILDING_THP_HERERO_PROD_DUMMY',  'BUILDINGCLASS_THP_HERERO_PROD_DUMMY',        0,              -1,   -1,   -1,       'TXT_KEY_BLDG_THP_HERERO_PROD_DUMMY',    'TXT_KEY_BLDG_THP_HERERO_PROD_DUMMY',    1);
-------------------------------
-- Building_ClassesNeededInCity
-------------------------------
INSERT INTO Building_ClassesNeededInCity
        (BuildingType,          BuildingClassType)
SELECT  'BUILDING_THP_OKURUUO', BuildingClassType
FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_SHRINE';
-------------------
-- Building_Flavors
-------------------
INSERT INTO Building_Flavors
        (BuildingType,          FlavorType, Flavor)
SELECT  'BUILDING_THP_OKURUUO', FlavorType, Flavor
FROM Building_Flavors WHERE BuildingType = 'BUILDING_SHRINE';

INSERT OR REPLACE INTO Building_Flavors
        (BuildingType,               FlavorType,            Flavor)
VALUES  ('BUILDING_THP_OKURUUO',    'FLAVOR_PRODUCTION',    10),
        ('BUILDING_THP_OKURUUO',    'FLAVOR_OFFENSE',       5),
        ('BUILDING_THP_OKURUUO',    'FLAVOR_MOBILE',        5);
-----------------------------------------
-- Building_UnitCombatProductionModifiers
-----------------------------------------
INSERT INTO Building_UnitCombatProductionModifiers
        (BuildingType,                       UnitCombatType,        Modifier)
VALUES  ('BUILDING_THP_HERERO_PROD_DUMMY',  'UNITCOMBAT_MELEE',     5),
        ('BUILDING_THP_HERERO_PROD_DUMMY',  'UNITCOMBAT_MOUNTED',   5);
------------------------
-- Building_YieldChanges
------------------------
INSERT INTO Building_YieldChanges
        (BuildingType,          YieldType,  Yield)
SELECT  'BUILDING_THP_OKURUUO', YieldType,  Yield
FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_SHRINE';

INSERT OR REPLACE INTO Building_YieldChanges
        (BuildingType,                       YieldType,      Yield)
VALUES  ('BUILDING_THP_HERERO_FAITH_DUMMY', 'YIELD_FAITH',   1);
-- ======================================================================================================
-- UNITS
-- ======================================================================================================
-- UnitPromotions
-----------------
INSERT INTO UnitPromotions
(Type,                                       Description,                                              Help,                     Sound,  CannotBeChosen, PortraitIndex,     IconAtlas,            PediaType,          PediaEntry, LostWithUpgrade)
VALUES  ('PROMOTION_THP_HERERO_OX_FRESH',         'TXT_KEY_PROMOTION_THP_HERERO_OX_FRESH',     'TXT_KEY_PROMOTION_THP_HERERO_OX_FRESH_HELP',     'AS2D_IF_LEVELUP',  1,              59,             'PROMOTION_ATLAS',     'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_THP_HERERO_OX_FRESH', 1),
        ('PROMOTION_THP_HERERO_OX_USED',          'TXT_KEY_PROMOTION_THP_HERERO_OX_USED',      'TXT_KEY_PROMOTION_THP_HERERO_OX_USED_HELP',      'AS2D_IF_LEVELUP',  1,              59,             'PROMOTION_ATLAS',     'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_THP_HERERO_OX_USED', 1);
--------
-- Units
--------
INSERT INTO Units
(Type,                        Class,    CombatClass, WorkRate, PrereqTech, Combat, RangedCombat, Range, FaithCost, RequiresFaithPurchaseEnabled, Cost, Moves, Domain, DefaultUnitAI, CivilianAttackPriority, Special,  Description,                                                         Help,                                       Strategy,                                    Civilopedia,                      MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, IgnoreBuildingDefense, AdvancedStartCost, MinAreaSize, GoodyHutUpgradeUnitClass, CombatLimit, XPValueAttack, XPValueDefense, Conscription,             UnitArtInfo,               UnitFlagAtlas,                 UnitFlagIconOffset,    IconAtlas,          PortraitIndex,  MoveRate)
SELECT    'UNIT_THP_HERERO_OX_RIDER',   Class,    CombatClass, WorkRate, PrereqTech, Combat, RangedCombat, Range, FaithCost, RequiresFaithPurchaseEnabled, Cost, Moves, Domain, DefaultUnitAI, CivilianAttackPriority, Special, 'TXT_KEY_UNIT_THP_HERERO_OX_RIDER',    'TXT_KEY_UNIT_THP_HERERO_OX_RIDER_HELP',    'TXT_KEY_UNIT_THP_HERERO_OX_RIDER_STRATEGY',      'TXT_KEY_UNIT_THP_HERERO_OX_RIDER_TEXT',    MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, IgnoreBuildingDefense, AdvancedStartCost, MinAreaSize, GoodyHutUpgradeUnitClass, CombatLimit, XPValueAttack, XPValueDefense, Conscription, 'ART_DEF_UNIT_THP_HERERO_OX_RIDER', 'THP_UNIT_HERERO_OX_RIDER_FLAG_ATLAS',    0,                    'THP_HERERO_ATLAS',   2,              MoveRate
FROM Units WHERE Type = 'UNIT_CAVALRY';
------------------------
-- UnitGameplay2DScripts
------------------------
INSERT INTO UnitGameplay2DScripts
       (UnitType,                   SelectionSound, FirstSelectionSound)
SELECT 'UNIT_THP_HERERO_OX_RIDER',  SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_CAVALRY';
---------------
-- Unit_AITypes
---------------
INSERT INTO Unit_AITypes
          (UnitType,                     UnitAIType)
SELECT    'UNIT_THP_HERERO_OX_RIDER',    UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_CAVALRY';
---------------
-- Unit_Flavors
---------------
INSERT INTO Unit_Flavors
       (UnitType,                   FlavorType, Flavor)
SELECT 'UNIT_THP_HERERO_OX_RIDER',  FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_CAVALRY';
----------------------
-- Unit_FreePromotions
----------------------
INSERT INTO Unit_FreePromotions
        (UnitType,                   PromotionType)
SELECT  'UNIT_THP_HERERO_OX_RIDER',  PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_CAVALRY';

INSERT INTO Unit_FreePromotions
        (UnitType,               PromotionType)
VALUES  ('UNIT_THP_HERERO_OX_RIDER', 'PROMOTION_THP_HERERO_OX_FRESH');
---------------------
-- Unit_ClassUpgrades
---------------------
INSERT INTO Unit_ClassUpgrades
        (UnitType,                   UnitClassType)
SELECT  'UNIT_THP_HERERO_OX_RIDER',  UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_CAVALRY';
------------------------------------
-- Unit_ResourceQuantityRequirements
------------------------------------
-- no horses required by UU
-- ======================================================================================================
-- DIPLOMACY
-- ======================================================================================================
INSERT INTO Diplomacy_Responses
(LeaderType,             ResponseType,                                     Response,                                                             Bias)
VALUES     ('LEADER_THP_JACOB_MORENGA',     'RESPONSE_ATTACKED_HOSTILE',                     'TXT_KEY_LEADER_THP_JACOB_MORENGA_ATTACKED_GENERIC%',                     500),
('LEADER_THP_JACOB_MORENGA',     'RESPONSE_DEFEATED',                             'TXT_KEY_LEADER_THP_JACOB_MORENGA_DEFEATED%',                             500),
('LEADER_THP_JACOB_MORENGA',     'RESPONSE_DOW_GENERIC',                         'TXT_KEY_LEADER_THP_JACOB_MORENGA_DOW_GENERIC%',                             500),
('LEADER_THP_JACOB_MORENGA',     'RESPONSE_EXPANSION_SERIOUS_WARNING',             'TXT_KEY_LEADER_THP_JACOB_MORENGA_EXPANSION_SERIOUS_WARNING%',             500),
('LEADER_THP_JACOB_MORENGA',     'RESPONSE_FIRST_GREETING',                         'TXT_KEY_LEADER_THP_JACOB_MORENGA_FIRSTGREETING%',                         500),
('LEADER_THP_JACOB_MORENGA',     'RESPONSE_GREETING_AT_WAR_HOSTILE',             'TXT_KEY_LEADER_THP_JACOB_MORENGA_GREETING_AT_WAR_HOSTILE%',                 500),
('LEADER_THP_JACOB_MORENGA',     'RESPONSE_GREETING_POLITE_HELLO',                 'TXT_KEY_LEADER_THP_JACOB_MORENGA_GREETING_POLITE_HELLO%',                 500),
('LEADER_THP_JACOB_MORENGA',     'RESPONSE_GREETING_NEUTRAL_HELLO',                 'TXT_KEY_LEADER_THP_JACOB_MORENGA_GREETING_NEUTRAL_HELLO%',                 500),
('LEADER_THP_JACOB_MORENGA',     'RESPONSE_GREETING_HOSTILE_HELLO',                 'TXT_KEY_LEADER_THP_JACOB_MORENGA_GREETING_HOSTILE_HELLO%',                 500),
('LEADER_THP_JACOB_MORENGA',     'RESPONSE_HOSTILE_AGGRESSIVE_MILITARY_WARNING', 'TXT_KEY_LEADER_THP_JACOB_MORENGA_HOSTILE_AGGRESSIVE_MILITARY_WARNING%',     500),
('LEADER_THP_JACOB_MORENGA',     'RESPONSE_INFLUENTIAL_ON_AI',                     'TXT_KEY_LEADER_THP_JACOB_MORENGA_INFLUENTIAL_ON_AI%',                     500),
('LEADER_THP_JACOB_MORENGA',     'RESPONSE_INFLUENTIAL_ON_HUMAN',                 'TXT_KEY_LEADER_THP_JACOB_MORENGA_INFLUENTIAL_ON_HUMAN%',                 500),
('LEADER_THP_JACOB_MORENGA',     'RESPONSE_LETS_HEAR_IT',                         'TXT_KEY_LEADER_THP_JACOB_MORENGA_LETS_HEAR_IT%',                         500),
('LEADER_THP_JACOB_MORENGA',     'RESPONSE_LUXURY_TRADE',                         'TXT_KEY_LEADER_THP_JACOB_MORENGA_LUXURY_TRADE%',                         500),
('LEADER_THP_JACOB_MORENGA',     'RESPONSE_NO_PEACE',                             'TXT_KEY_LEADER_THP_JACOB_MORENGA_NO_PEACE%',                             500),
('LEADER_THP_JACOB_MORENGA',     'RESPONSE_OPEN_BORDERS_EXCHANGE',                 'TXT_KEY_LEADER_THP_JACOB_MORENGA_OPEN_BORDERS_EXCHANGE%',                 500),
('LEADER_THP_JACOB_MORENGA',     'RESPONSE_PEACE_MADE_BY_HUMAN_GRACIOUS',         'TXT_KEY_LEADER_THP_JACOB_MORENGA_LOSEWAR%',                                 500),
('LEADER_THP_JACOB_MORENGA',     'RESPONSE_REPEAT_NO',                             'TXT_KEY_LEADER_THP_JACOB_MORENGA_REPEAT_NO%',                             500),
('LEADER_THP_JACOB_MORENGA',     'RESPONSE_RESPONSE_REQUEST',                     'TXT_KEY_LEADER_THP_JACOB_MORENGA_RESPONSE_REQUEST%',                     500),
('LEADER_THP_JACOB_MORENGA',     'RESPONSE_RESPONSE_TO_BEING_DENOUNCED',         'TXT_KEY_LEADER_THP_JACOB_MORENGA_RESPONSE_TO_BEING_DENOUNCED%',             500),
('LEADER_THP_JACOB_MORENGA',     'RESPONSE_TOO_SOON_NO_PEACE',                     'TXT_KEY_LEADER_THP_JACOB_MORENGA_TOO_SOON_NO_PEACE_1%',                     500),
('LEADER_THP_JACOB_MORENGA',     'RESPONSE_WINNER_PEACE_OFFER',                     'TXT_KEY_LEADER_THP_JACOB_MORENGA_WINWAR%',                                 500),
('LEADER_THP_JACOB_MORENGA',     'RESPONSE_WORK_AGAINST_SOMEONE',                 'TXT_KEY_LEADER_THP_JACOB_MORENGA_DENOUNCE%',                             500),
('LEADER_THP_JACOB_MORENGA',     'RESPONSE_WORK_WITH_US',                         'TXT_KEY_LEADER_THP_JACOB_MORENGA_DEC_FRIENDSHIP%',                         500);
-- ======================================================================================================
-- ======================================================================================================
