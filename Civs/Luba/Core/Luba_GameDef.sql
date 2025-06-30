-- Luba
-- ======================================================================================================
-- CIVILIZATIONS
-- ======================================================================================================
-- Civilizations
----------------
INSERT INTO Civilizations
       (Type,                         Description,                       ShortDescription,                          Adjective,                          Civilopedia,                         CivilopediaTag,      DefaultPlayerColor,       ArtDefineTag,   ArtStyleType,  ArtStyleSuffix, ArtStylePrefix,                  IconAtlas,        PortraitIndex,  AlphaIconAtlas,               SoundtrackTag,   MapImage,                   DawnOfManQuote,                   DawnOfManImage)
SELECT 'CIVILIZATION_THP_LUBA', 'TXT_KEY_CIV_THP_LUBA_DESC',  'TXT_KEY_CIV_THP_LUBA_SHORT_DESC',   'TXT_KEY_CIV_THP_LUBA_ADJECTIVE',    'TXT_KEY_PEDIA_THP_LUBA_TEXT',  'TXT_KEY_PEDIA_THP_LUBA', 'PLAYERCOLOR_THP_LUBA',     ArtDefineTag,   ArtStyleType,  ArtStyleSuffix, ArtStylePrefix,    'THP_LUBA_ATLAS',   0,             'THP_LUBA_ALPHA_ATLAS',   SoundtrackTag,  'Map_Luba.dds',  'TXT_KEY_CIV5_DAWN_THP_LUBA_TEXT',   'IlungaSungu_DOM.dds'
FROM Civilizations WHERE Type = 'CIVILIZATION_ZULU';
-------------------------
-- Civilization_CityNames
-------------------------
INSERT INTO Civilization_CityNames
        (CivilizationType,             CityName)
VALUES  ('CIVILIZATION_THP_LUBA',     'TXT_KEY_CITY_NAME_THP_LUBA_1'),
        ('CIVILIZATION_THP_LUBA',     'TXT_KEY_CITY_NAME_THP_LUBA_2'),
        ('CIVILIZATION_THP_LUBA',     'TXT_KEY_CITY_NAME_THP_LUBA_3'),
        ('CIVILIZATION_THP_LUBA',     'TXT_KEY_CITY_NAME_THP_LUBA_4'),
        ('CIVILIZATION_THP_LUBA',     'TXT_KEY_CITY_NAME_THP_LUBA_5'),
        ('CIVILIZATION_THP_LUBA',     'TXT_KEY_CITY_NAME_THP_LUBA_6'),
        ('CIVILIZATION_THP_LUBA',     'TXT_KEY_CITY_NAME_THP_LUBA_7'),
        ('CIVILIZATION_THP_LUBA',     'TXT_KEY_CITY_NAME_THP_LUBA_8'),
        ('CIVILIZATION_THP_LUBA',     'TXT_KEY_CITY_NAME_THP_LUBA_9'),
        ('CIVILIZATION_THP_LUBA',     'TXT_KEY_CITY_NAME_THP_LUBA_10'),
        ('CIVILIZATION_THP_LUBA',     'TXT_KEY_CITY_NAME_THP_LUBA_11'),
        ('CIVILIZATION_THP_LUBA',     'TXT_KEY_CITY_NAME_THP_LUBA_12'),
        ('CIVILIZATION_THP_LUBA',     'TXT_KEY_CITY_NAME_THP_LUBA_13'),
        ('CIVILIZATION_THP_LUBA',     'TXT_KEY_CITY_NAME_THP_LUBA_14'),
        ('CIVILIZATION_THP_LUBA',     'TXT_KEY_CITY_NAME_THP_LUBA_15'),
        ('CIVILIZATION_THP_LUBA',     'TXT_KEY_CITY_NAME_THP_LUBA_16'),
        ('CIVILIZATION_THP_LUBA',     'TXT_KEY_CITY_NAME_THP_LUBA_17'),
        ('CIVILIZATION_THP_LUBA',     'TXT_KEY_CITY_NAME_THP_LUBA_18'),
        ('CIVILIZATION_THP_LUBA',     'TXT_KEY_CITY_NAME_THP_LUBA_19'),
        ('CIVILIZATION_THP_LUBA',     'TXT_KEY_CITY_NAME_THP_LUBA_20'),
        ('CIVILIZATION_THP_LUBA',     'TXT_KEY_CITY_NAME_THP_LUBA_21'),
        ('CIVILIZATION_THP_LUBA',     'TXT_KEY_CITY_NAME_THP_LUBA_22'),
        ('CIVILIZATION_THP_LUBA',     'TXT_KEY_CITY_NAME_THP_LUBA_23'),
        ('CIVILIZATION_THP_LUBA',     'TXT_KEY_CITY_NAME_THP_LUBA_24'),
        ('CIVILIZATION_THP_LUBA',     'TXT_KEY_CITY_NAME_THP_LUBA_25'),
        ('CIVILIZATION_THP_LUBA',     'TXT_KEY_CITY_NAME_THP_LUBA_26'),
        ('CIVILIZATION_THP_LUBA',     'TXT_KEY_CITY_NAME_THP_LUBA_27'),
        ('CIVILIZATION_THP_LUBA',     'TXT_KEY_CITY_NAME_THP_LUBA_28'),
        ('CIVILIZATION_THP_LUBA',     'TXT_KEY_CITY_NAME_THP_LUBA_29'),
        ('CIVILIZATION_THP_LUBA',     'TXT_KEY_CITY_NAME_THP_LUBA_30'),
        ('CIVILIZATION_THP_LUBA',     'TXT_KEY_CITY_NAME_THP_LUBA_31'),
        ('CIVILIZATION_THP_LUBA',     'TXT_KEY_CITY_NAME_THP_LUBA_32'),
        ('CIVILIZATION_THP_LUBA',     'TXT_KEY_CITY_NAME_THP_LUBA_33'),
        ('CIVILIZATION_THP_LUBA',     'TXT_KEY_CITY_NAME_THP_LUBA_34'),
        ('CIVILIZATION_THP_LUBA',     'TXT_KEY_CITY_NAME_THP_LUBA_35'),
        ('CIVILIZATION_THP_LUBA',     'TXT_KEY_CITY_NAME_THP_LUBA_36'),
        ('CIVILIZATION_THP_LUBA',     'TXT_KEY_CITY_NAME_THP_LUBA_37');
-----------------------------------
-- Civilization_FreeBuildingClasses
-----------------------------------
INSERT INTO Civilization_FreeBuildingClasses
          (CivilizationType,           BuildingClassType)
SELECT    'CIVILIZATION_THP_LUBA',     BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE CivilizationType = 'CIVILIZATION_ZULU';
-------------------------
-- Civilization_FreeTechs
-------------------------
INSERT INTO Civilization_FreeTechs
          (CivilizationType,           TechType)
SELECT    'CIVILIZATION_THP_LUBA',     TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_ZULU';
-------------------------
-- Civilization_FreeUnits
-------------------------
INSERT INTO Civilization_FreeUnits
          (CivilizationType,           UnitClassType, Count, UnitAIType)
SELECT    'CIVILIZATION_THP_LUBA',     UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_ZULU';
-----------------------
-- Civilization_Leaders
-----------------------
INSERT INTO Civilization_Leaders
       (CivilizationType,         LeaderheadType)
VALUES ('CIVILIZATION_THP_LUBA', 'LEADER_THP_ILUNGA_SUNGU');
--------------------------------------
-- Civilization_BuildingClassOverrides
--------------------------------------
INSERT INTO Civilization_BuildingClassOverrides
       (CivilizationType,         BuildingClassType,      BuildingType)
VALUES ('CIVILIZATION_THP_LUBA', 'BUILDINGCLASS_CASTLE', 'BUILDING_THP_MBUDYE_LODGE');
----------------------------------
-- Civilization_UnitClassOverrides
----------------------------------
INSERT INTO Civilization_UnitClassOverrides
       (CivilizationType,         UnitClassType,         UnitType)
VALUES ('CIVILIZATION_THP_LUBA', 'UNITCLASS_SWORDSMAN', 'UNIT_THP_NZAPPA_ZAP');
-------------------------
-- Civilization_Religions
-------------------------
INSERT INTO Civilization_Religions
       (CivilizationType,         ReligionType)
VALUES ('CIVILIZATION_THP_LUBA', 'RELIGION_PROTESTANTISM');
------------------------
-- Civilization_SpyNames
------------------------
INSERT INTO Civilization_SpyNames
          (CivilizationType,             SpyName)
VALUES    ('CIVILIZATION_THP_LUBA',     'TXT_KEY_SPY_NAME_THP_LUBA_0'),
          ('CIVILIZATION_THP_LUBA',     'TXT_KEY_SPY_NAME_THP_LUBA_1'),
          ('CIVILIZATION_THP_LUBA',     'TXT_KEY_SPY_NAME_THP_LUBA_2'),
          ('CIVILIZATION_THP_LUBA',     'TXT_KEY_SPY_NAME_THP_LUBA_3'),
          ('CIVILIZATION_THP_LUBA',     'TXT_KEY_SPY_NAME_THP_LUBA_4'),
          ('CIVILIZATION_THP_LUBA',     'TXT_KEY_SPY_NAME_THP_LUBA_5'),
          ('CIVILIZATION_THP_LUBA',     'TXT_KEY_SPY_NAME_THP_LUBA_6'),
          ('CIVILIZATION_THP_LUBA',     'TXT_KEY_SPY_NAME_THP_LUBA_7'),
          ('CIVILIZATION_THP_LUBA',     'TXT_KEY_SPY_NAME_THP_LUBA_8'),
          ('CIVILIZATION_THP_LUBA',     'TXT_KEY_SPY_NAME_THP_LUBA_9');
-- ======================================================================================================
-- LEADERS
-- ======================================================================================================
-- Leaders
----------
INSERT INTO Leaders
(Type,              Description,                    Civilopedia,                               CivilopediaTag,     ArtDefineTag,              VictoryCompetitiveness,     WonderCompetitiveness,     MinorCivCompetitiveness,     Boldness,     DiploBalance,   WarmongerHate,     DenounceWillingness,     DoFWillingness, Loyalty,     Neediness,    Forgiveness,     Chattiness, Meanness,     IconAtlas,             PortraitIndex)
VALUES    ('LEADER_THP_ILUNGA_SUNGU',     'TXT_KEY_LEADER_THP_ILUNGA_SUNGU',    'TXT_KEY_LEADER_THP_ILUNGA_SUNGU_PEDIA_TEXT',  'TXT_KEY_LEADER_THP_ILUNGA_SUNGU_PEDIA', 'Leaderhead_IlungaSungu.xml',    8,                          5,                         6,                           5,                 7,             6,                 6,                       5,              4,           5,            6,               6,          4,           'THP_LUBA_ATLAS',   1);
--------------------------------
-- Leader_MajorCivApproachBiases
--------------------------------
INSERT INTO Leader_MajorCivApproachBiases
          (LeaderType,                     MajorCivApproachType,              Bias)
VALUES    ('LEADER_THP_ILUNGA_SUNGU',     'MAJOR_CIV_APPROACH_WAR',           6),
          ('LEADER_THP_ILUNGA_SUNGU',     'MAJOR_CIV_APPROACH_HOSTILE',       5),
          ('LEADER_THP_ILUNGA_SUNGU',     'MAJOR_CIV_APPROACH_DECEPTIVE',     5),
          ('LEADER_THP_ILUNGA_SUNGU',     'MAJOR_CIV_APPROACH_GUARDED',       3),
          ('LEADER_THP_ILUNGA_SUNGU',     'MAJOR_CIV_APPROACH_AFRAID',        4),
          ('LEADER_THP_ILUNGA_SUNGU',     'MAJOR_CIV_APPROACH_FRIENDLY',      8),
          ('LEADER_THP_ILUNGA_SUNGU',     'MAJOR_CIV_APPROACH_NEUTRAL',       7);
--------------------------------
-- Leader_MinorCivApproachBiases
--------------------------------
INSERT INTO Leader_MinorCivApproachBiases
          (LeaderType,                     MinorCivApproachType,              Bias)
VALUES    ('LEADER_THP_ILUNGA_SUNGU',     'MINOR_CIV_APPROACH_IGNORE',        3),
          ('LEADER_THP_ILUNGA_SUNGU',     'MINOR_CIV_APPROACH_FRIENDLY',      5),
          ('LEADER_THP_ILUNGA_SUNGU',     'MINOR_CIV_APPROACH_PROTECTIVE',    6),
          ('LEADER_THP_ILUNGA_SUNGU',     'MINOR_CIV_APPROACH_CONQUEST',      6),
          ('LEADER_THP_ILUNGA_SUNGU',     'MINOR_CIV_APPROACH_BULLY',         8);
-----------------
-- Leader_Flavors
-----------------
INSERT INTO Leader_Flavors
          (LeaderType,                     FlavorType,                        Flavor)
VALUES    ('LEADER_THP_ILUNGA_SUNGU',     'FLAVOR_OFFENSE',                   6),
          ('LEADER_THP_ILUNGA_SUNGU',     'FLAVOR_DEFENSE',                   7),
          ('LEADER_THP_ILUNGA_SUNGU',     'FLAVOR_CITY_DEFENSE',              5),
          ('LEADER_THP_ILUNGA_SUNGU',     'FLAVOR_MILITARY_TRAINING',         7),
          ('LEADER_THP_ILUNGA_SUNGU',     'FLAVOR_RECON',                     5),
          ('LEADER_THP_ILUNGA_SUNGU',     'FLAVOR_RANGED',                    4),
          ('LEADER_THP_ILUNGA_SUNGU',     'FLAVOR_MOBILE',                    3),
          ('LEADER_THP_ILUNGA_SUNGU',     'FLAVOR_NAVAL',                     4),
          ('LEADER_THP_ILUNGA_SUNGU',     'FLAVOR_NAVAL_RECON',               5),
          ('LEADER_THP_ILUNGA_SUNGU',     'FLAVOR_NAVAL_GROWTH',              5),
          ('LEADER_THP_ILUNGA_SUNGU',     'FLAVOR_NAVAL_TILE_IMPROVEMENT',    5),
          ('LEADER_THP_ILUNGA_SUNGU',     'FLAVOR_AIR',                       4),
          ('LEADER_THP_ILUNGA_SUNGU',     'FLAVOR_EXPANSION',                 6),
          ('LEADER_THP_ILUNGA_SUNGU',     'FLAVOR_GROWTH',                    6),
          ('LEADER_THP_ILUNGA_SUNGU',     'FLAVOR_TILE_IMPROVEMENT',          6),
          ('LEADER_THP_ILUNGA_SUNGU',     'FLAVOR_INFRASTRUCTURE',            5),
          ('LEADER_THP_ILUNGA_SUNGU',     'FLAVOR_PRODUCTION',                6),
          ('LEADER_THP_ILUNGA_SUNGU',     'FLAVOR_GOLD',                      4),
          ('LEADER_THP_ILUNGA_SUNGU',     'FLAVOR_SCIENCE',                   3),
          ('LEADER_THP_ILUNGA_SUNGU',     'FLAVOR_CULTURE',                   9),
          ('LEADER_THP_ILUNGA_SUNGU',     'FLAVOR_HAPPINESS',                 7),
          ('LEADER_THP_ILUNGA_SUNGU',     'FLAVOR_GREAT_PEOPLE',              7),
          ('LEADER_THP_ILUNGA_SUNGU',     'FLAVOR_WONDER',                    5),
          ('LEADER_THP_ILUNGA_SUNGU',     'FLAVOR_RELIGION',                  5),
          ('LEADER_THP_ILUNGA_SUNGU',     'FLAVOR_DIPLOMACY',                 4),
          ('LEADER_THP_ILUNGA_SUNGU',     'FLAVOR_SPACESHIP',                 4),
          ('LEADER_THP_ILUNGA_SUNGU',     'FLAVOR_WATER_CONNECTION',          3),
          ('LEADER_THP_ILUNGA_SUNGU',     'FLAVOR_NUKE',                      3),
          ('LEADER_THP_ILUNGA_SUNGU',     'FLAVOR_USE_NUKE',                  2),
          ('LEADER_THP_ILUNGA_SUNGU',     'FLAVOR_ESPIONAGE',                 5),
          ('LEADER_THP_ILUNGA_SUNGU',     'FLAVOR_ANTIAIR',                   6),
          ('LEADER_THP_ILUNGA_SUNGU',     'FLAVOR_AIRLIFT',                   4),
          ('LEADER_THP_ILUNGA_SUNGU',     'FLAVOR_I_TRADE_DESTINATION',       6),
          ('LEADER_THP_ILUNGA_SUNGU',     'FLAVOR_I_TRADE_ORIGIN',            4),
          ('LEADER_THP_ILUNGA_SUNGU',     'FLAVOR_I_SEA_TRADE_ROUTE',         3),
          ('LEADER_THP_ILUNGA_SUNGU',     'FLAVOR_I_LAND_TRADE_ROUTE',        5),
          ('LEADER_THP_ILUNGA_SUNGU',     'FLAVOR_ARCHAEOLOGY',               8),
          ('LEADER_THP_ILUNGA_SUNGU',     'FLAVOR_AIR_CARRIER',               4);
----------------
-- Leader_Traits
----------------
INSERT INTO Leader_Traits
       (LeaderType,                   TraitType)
VALUES ('LEADER_THP_ILUNGA_SUNGU',   'TRAIT_THP_LUBA');
-- ======================================================================================================
-- TRAITS
-- ======================================================================================================
-- Traits
---------
INSERT INTO Traits
       (Type,                 Description,                ShortDescription)
VALUES ('TRAIT_THP_LUBA',    'TXT_KEY_TRAIT_THP_LUBA',   'TXT_KEY_TRAIT_THP_LUBA_SHORT');
-- ======================================================================================================
-- BUILDINGS
-- ======================================================================================================
-- BuildingClasses
------------------
INSERT INTO BuildingClasses
        (Type,                               DefaultBuilding,                    Description)
VALUES  ('BUILDINGCLASS_THP_LUBA_FOOD_DUMMY',  'BUILDING_THP_LUBA_FOOD_DUMMY',   'TXT_KEY_BLDG_THP_LUBA_FOOD_DUMMY');
------------
-- Buildings
------------
INSERT INTO Buildings
(Type,                              BuildingClass,    Cost, FaithCost, UnlockedByBelief, SpecialistType, SpecialistCount, GoldMaintenance, PrereqTech,   FreeStartEra,  EspionageModifier, Espionage, AllowsRangeStrike, Defense, ExtraCityHitPoints,    Description,                         Help,                               Civilopedia,                                                    Strategy,                  ArtDefineTag, MinAreaSize, NeverCapture, ConquestProb,   HurryCostModifier, GreatWorkSlotType, GreatWorkCount, ThemingBonusHelp,  PortraitIndex, IconAtlas)
SELECT    'BUILDING_THP_MBUDYE_LODGE',    BuildingClass,   Cost, FaithCost, UnlockedByBelief, SpecialistType, SpecialistCount, GoldMaintenance,  PrereqTech,  FreeStartEra,  EspionageModifier, Espionage, AllowsRangeStrike, Defense, ExtraCityHitPoints,  'TXT_KEY_BLDG_THP_MBUDYE_LODGE',    'TXT_KEY_BLDG_THP_MBUDYE_LODGE_HELP',    'TXT_KEY_BLDG_THP_MBUDYE_LODGE_TEXT',    'TXT_KEY_BLDG_THP_MBUDYE_LODGE_STRATEGY',  ArtDefineTag, MinAreaSize, NeverCapture, ConquestProb,   HurryCostModifier, 'GREAT_WORK_SLOT_ART_ARTIFACT', 2, 'TXT_KEY_THP_MBUDYE_LODGE_THEMING_HELP',  3,            'THP_LUBA_ATLAS'
FROM Buildings WHERE Type = 'BUILDING_CASTLE';

INSERT INTO Buildings
(Type,                                 BuildingClass,                          SpecialistCount, GreatWorkCount, Cost, FaithCost, Description,                         Help,                                  NeverCapture)
VALUES    ('BUILDING_THP_LUBA_FOOD_DUMMY', 'BUILDINGCLASS_THP_LUBA_FOOD_DUMMY',       0,              -1,   -1,   -1,       'TXT_KEY_BLDG_THP_LUBA_FOOD_DUMMY',   'TXT_KEY_BLDG_THP_LUBA_FOOD_DUMMY',   1);
-------------------------------
-- Building_ClassesNeededInCity
-------------------------------
INSERT INTO Building_ClassesNeededInCity
        (BuildingType,               BuildingClassType)
SELECT  'BUILDING_THP_MBUDYE_LODGE', BuildingClassType
FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_CASTLE';
-------------------
-- Building_Flavors
-------------------
INSERT INTO Building_Flavors
          (BuildingType,                  FlavorType,    Flavor)
SELECT    'BUILDING_THP_MBUDYE_LODGE',    FlavorType,    Flavor
FROM Building_Flavors WHERE BuildingType = 'BUILDING_CASTLE';

INSERT OR REPLACE INTO Building_Flavors
        (BuildingType,                    FlavorType,               Flavor)
VALUES  ('BUILDING_THP_MBUDYE_LODGE',    'FLAVOR_GROWTH',           15),
        ('BUILDING_THP_MBUDYE_LODGE',    'FLAVOR_CULTURE',          20),
        ('BUILDING_THP_MBUDYE_LODGE',    'FLAVOR_GREAT_PEOPLE',     20);
--------------------------
-- Building_ThemingBonuses
---------------------------
INSERT INTO Building_ThemingBonuses 
	(BuildingType, 			Description,					Bonus,	RequiresAnyButOwner,	AIPriority)
VALUES	('BUILDING_THP_MBUDYE_LODGE', 	'TXT_KEY_THP_THEMING_BONUS_MBUDYE_LODGE', 	2, 	1,			2);
--------------------------
-- Building_YieldModifiers
--------------------------
INSERT INTO Building_YieldModifiers
        (BuildingType,                       YieldType,     Yield)
VALUES  ('BUILDING_THP_LUBA_FOOD_DUMMY',    'YIELD_FOOD',   5);
-- ======================================================================================================
-- UNITS
-- ======================================================================================================
-- UnitPromotions
-----------------
INSERT INTO UnitPromotions
(Type,                                         Description,                             Help,                                        Sound,             CannotBeChosen, PortraitIndex,   IconAtlas,             PediaType,          PediaEntry)
VALUES    ('PROMOTION_THP_NZAPPA_ZAP',         'TXT_KEY_PROMOTION_THP_NZAPPA_ZAP',     'TXT_KEY_PROMOTION_THP_NZAPPA_ZAP_HELP',     'AS2D_IF_LEVELUP',  1,              59,             'PROMOTION_ATLAS',     'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_THP_NZAPPA_ZAP');
--------
-- Units
--------
INSERT INTO Units
(Type,                             Class,    CombatClass, WorkRate, PrereqTech, Combat, RangedCombat, Range, FaithCost, RequiresFaithPurchaseEnabled, Cost, Moves, Domain, DefaultUnitAI, CivilianAttackPriority, Special,  Description,                                                         Help,                                       Strategy,                                    Civilopedia,                      MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, IgnoreBuildingDefense, AdvancedStartCost, MinAreaSize, GoodyHutUpgradeUnitClass, CombatLimit, XPValueAttack, XPValueDefense, Conscription,             UnitArtInfo,               UnitFlagAtlas,                 UnitFlagIconOffset,    IconAtlas,          PortraitIndex,  MoveRate)
SELECT    'UNIT_THP_NZAPPA_ZAP',   Class,    CombatClass, WorkRate, PrereqTech, Combat, RangedCombat, Range, FaithCost, RequiresFaithPurchaseEnabled, Cost, Moves, Domain, DefaultUnitAI, CivilianAttackPriority, Special, 'TXT_KEY_UNIT_THP_NZAPPA_ZAP',    'TXT_KEY_UNIT_THP_NZAPPA_ZAP_HELP',    'TXT_KEY_UNIT_THP_NZAPPA_ZAP_STRATEGY',      'TXT_KEY_UNIT_THP_NZAPPA_ZAP_TEXT',    MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, IgnoreBuildingDefense, AdvancedStartCost, MinAreaSize, GoodyHutUpgradeUnitClass, CombatLimit, XPValueAttack, XPValueDefense, Conscription, 'ART_DEF_UNIT_THP_NZAPPA_ZAP', 'THP_UNIT_NZAPPA_ZAP_FLAG_ATLAS',    0,                    'THP_LUBA_ATLAS',   2,              MoveRate
FROM Units WHERE Type = 'UNIT_SWORDSMAN';
------------------------
-- UnitGameplay2DScripts
------------------------
INSERT INTO UnitGameplay2DScripts
       (UnitType,              SelectionSound, FirstSelectionSound)
SELECT 'UNIT_THP_NZAPPA_ZAP',  SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_SWORDSMAN';
---------------
-- Unit_AITypes
---------------
INSERT INTO Unit_AITypes
          (UnitType,                UnitAIType)
SELECT    'UNIT_THP_NZAPPA_ZAP',    UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_SWORDSMAN';
---------------
-- Unit_Flavors
---------------
INSERT INTO Unit_Flavors
       (UnitType,              FlavorType, Flavor)
SELECT 'UNIT_THP_NZAPPA_ZAP',  FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_SWORDSMAN';
----------------------
-- Unit_FreePromotions
----------------------
INSERT INTO Unit_FreePromotions
        (UnitType,              PromotionType)
SELECT  'UNIT_THP_NZAPPA_ZAP',  PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_SWORDSMAN';

INSERT INTO Unit_FreePromotions
        (UnitType,               PromotionType)
VALUES  ('UNIT_THP_NZAPPA_ZAP', 'PROMOTION_THP_NZAPPA_ZAP');
---------------------
-- Unit_ClassUpgrades
---------------------
INSERT INTO Unit_ClassUpgrades
        (UnitType,              UnitClassType)
SELECT  'UNIT_THP_NZAPPA_ZAP',  UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_SWORDSMAN';
------------------------------------
-- Unit_ResourceQuantityRequirements
------------------------------------
INSERT INTO Unit_ResourceQuantityRequirements
        (UnitType,              ResourceType)
SELECT  'UNIT_THP_NZAPPA_ZAP',  ResourceType
FROM Unit_ResourceQuantityRequirements WHERE UnitType = 'UNIT_SWORDSMAN';
-- ======================================================================================================
-- DIPLOMACY
-- ======================================================================================================
INSERT INTO Diplomacy_Responses
(LeaderType,             ResponseType,                                     Response,                                                             Bias)
VALUES     ('LEADER_THP_ILUNGA_SUNGU',     'RESPONSE_ATTACKED_HOSTILE',                     'TXT_KEY_LEADER_THP_ILUNGA_SUNGU_ATTACKED_GENERIC%',                     500),
('LEADER_THP_ILUNGA_SUNGU',     'RESPONSE_DEFEATED',                             'TXT_KEY_LEADER_THP_ILUNGA_SUNGU_DEFEATED%',                             500),
('LEADER_THP_ILUNGA_SUNGU',     'RESPONSE_DOW_GENERIC',                         'TXT_KEY_LEADER_THP_ILUNGA_SUNGU_DOW_GENERIC%',                             500),
('LEADER_THP_ILUNGA_SUNGU',     'RESPONSE_EXPANSION_SERIOUS_WARNING',             'TXT_KEY_LEADER_THP_ILUNGA_SUNGU_EXPANSION_SERIOUS_WARNING%',             500),
('LEADER_THP_ILUNGA_SUNGU',     'RESPONSE_FIRST_GREETING',                         'TXT_KEY_LEADER_THP_ILUNGA_SUNGU_FIRSTGREETING%',                         500),
('LEADER_THP_ILUNGA_SUNGU',     'RESPONSE_GREETING_AT_WAR_HOSTILE',             'TXT_KEY_LEADER_THP_ILUNGA_SUNGU_GREETING_AT_WAR_HOSTILE%',                 500),
('LEADER_THP_ILUNGA_SUNGU',     'RESPONSE_GREETING_POLITE_HELLO',                 'TXT_KEY_LEADER_THP_ILUNGA_SUNGU_GREETING_POLITE_HELLO%',                 500),
('LEADER_THP_ILUNGA_SUNGU',     'RESPONSE_GREETING_NEUTRAL_HELLO',                 'TXT_KEY_LEADER_THP_ILUNGA_SUNGU_GREETING_NEUTRAL_HELLO%',                 500),
('LEADER_THP_ILUNGA_SUNGU',     'RESPONSE_GREETING_HOSTILE_HELLO',                 'TXT_KEY_LEADER_THP_ILUNGA_SUNGU_GREETING_HOSTILE_HELLO%',                 500),
('LEADER_THP_ILUNGA_SUNGU',     'RESPONSE_HOSTILE_AGGRESSIVE_MILITARY_WARNING', 'TXT_KEY_LEADER_THP_ILUNGA_SUNGU_HOSTILE_AGGRESSIVE_MILITARY_WARNING%',     500),
('LEADER_THP_ILUNGA_SUNGU',     'RESPONSE_INFLUENTIAL_ON_AI',                     'TXT_KEY_LEADER_THP_ILUNGA_SUNGU_INFLUENTIAL_ON_AI%',                     500),
('LEADER_THP_ILUNGA_SUNGU',     'RESPONSE_INFLUENTIAL_ON_HUMAN',                 'TXT_KEY_LEADER_THP_ILUNGA_SUNGU_INFLUENTIAL_ON_HUMAN%',                 500),
('LEADER_THP_ILUNGA_SUNGU',     'RESPONSE_LETS_HEAR_IT',                         'TXT_KEY_LEADER_THP_ILUNGA_SUNGU_LETS_HEAR_IT%',                         500),
('LEADER_THP_ILUNGA_SUNGU',     'RESPONSE_LUXURY_TRADE',                         'TXT_KEY_LEADER_THP_ILUNGA_SUNGU_LUXURY_TRADE%',                         500),
('LEADER_THP_ILUNGA_SUNGU',     'RESPONSE_NO_PEACE',                             'TXT_KEY_LEADER_THP_ILUNGA_SUNGU_NO_PEACE%',                             500),
('LEADER_THP_ILUNGA_SUNGU',     'RESPONSE_OPEN_BORDERS_EXCHANGE',                 'TXT_KEY_LEADER_THP_ILUNGA_SUNGU_OPEN_BORDERS_EXCHANGE%',                 500),
('LEADER_THP_ILUNGA_SUNGU',     'RESPONSE_PEACE_MADE_BY_HUMAN_GRACIOUS',         'TXT_KEY_LEADER_THP_ILUNGA_SUNGU_LOSEWAR%',                                 500),
('LEADER_THP_ILUNGA_SUNGU',     'RESPONSE_REPEAT_NO',                             'TXT_KEY_LEADER_THP_ILUNGA_SUNGU_REPEAT_NO%',                             500),
('LEADER_THP_ILUNGA_SUNGU',     'RESPONSE_RESPONSE_REQUEST',                     'TXT_KEY_LEADER_THP_ILUNGA_SUNGU_RESPONSE_REQUEST%',                     500),
('LEADER_THP_ILUNGA_SUNGU',     'RESPONSE_RESPONSE_TO_BEING_DENOUNCED',         'TXT_KEY_LEADER_THP_ILUNGA_SUNGU_RESPONSE_TO_BEING_DENOUNCED%',             500),
('LEADER_THP_ILUNGA_SUNGU',     'RESPONSE_TOO_SOON_NO_PEACE',                     'TXT_KEY_LEADER_THP_ILUNGA_SUNGU_TOO_SOON_NO_PEACE_1%',                     500),
('LEADER_THP_ILUNGA_SUNGU',     'RESPONSE_WINNER_PEACE_OFFER',                     'TXT_KEY_LEADER_THP_ILUNGA_SUNGU_WINWAR%',                                 500),
('LEADER_THP_ILUNGA_SUNGU',     'RESPONSE_WORK_AGAINST_SOMEONE',                 'TXT_KEY_LEADER_THP_ILUNGA_SUNGU_DENOUNCE%',                             500),
('LEADER_THP_ILUNGA_SUNGU',     'RESPONSE_WORK_WITH_US',                         'TXT_KEY_LEADER_THP_ILUNGA_SUNGU_DEC_FRIENDSHIP%',                         500);
-- ======================================================================================================
-- ======================================================================================================
