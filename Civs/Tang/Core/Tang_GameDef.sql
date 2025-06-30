-- Tang Dynasty
-- ======================================================================================================
-- CIVILIZATIONS
-- ======================================================================================================
-- Civilizations
----------------
INSERT INTO Civilizations
       (Type,                         Description,                       ShortDescription,                          Adjective,                          Civilopedia,                         CivilopediaTag,      DefaultPlayerColor,       ArtDefineTag,   ArtStyleType,  ArtStyleSuffix, ArtStylePrefix,                  IconAtlas,        PortraitIndex,  AlphaIconAtlas,               SoundtrackTag,   MapImage,                   DawnOfManQuote,                   DawnOfManImage)
SELECT 'CIVILIZATION_THP_TANG', 'TXT_KEY_CIV_THP_TANG_DESC',  'TXT_KEY_CIV_THP_TANG_SHORT_DESC',   'TXT_KEY_CIV_THP_TANG_ADJECTIVE',    'TXT_KEY_PEDIA_THP_TANG_TEXT',  'TXT_KEY_PEDIA_THP_TANG', 'PLAYERCOLOR_THP_TANG',     ArtDefineTag,   ArtStyleType,  ArtStyleSuffix, ArtStylePrefix,    'THP_TANG_ATLAS',   0,             'THP_TANG_ALPHA_ATLAS',   SoundtrackTag,  'Map_Tang.dds',  'TXT_KEY_CIV5_DAWN_THP_TANG_TEXT',   'Taizong_DOM.dds'
FROM Civilizations WHERE Type = 'CIVILIZATION_CHINA';
-------------------------
-- Civilization_CityNames
-------------------------
INSERT INTO Civilization_CityNames
        (CivilizationType,             CityName)
VALUES  ('CIVILIZATION_THP_TANG',     'TXT_KEY_CITY_NAME_THP_TANG_1'),
        ('CIVILIZATION_THP_TANG',     'TXT_KEY_CITY_NAME_THP_TANG_2'),
        ('CIVILIZATION_THP_TANG',     'TXT_KEY_CITY_NAME_THP_TANG_3'),
        ('CIVILIZATION_THP_TANG',     'TXT_KEY_CITY_NAME_THP_TANG_4'),
        ('CIVILIZATION_THP_TANG',     'TXT_KEY_CITY_NAME_THP_TANG_5'),
        ('CIVILIZATION_THP_TANG',     'TXT_KEY_CITY_NAME_THP_TANG_6'),
        ('CIVILIZATION_THP_TANG',     'TXT_KEY_CITY_NAME_THP_TANG_7'),
        ('CIVILIZATION_THP_TANG',     'TXT_KEY_CITY_NAME_THP_TANG_8'),
        ('CIVILIZATION_THP_TANG',     'TXT_KEY_CITY_NAME_THP_TANG_9'),
        ('CIVILIZATION_THP_TANG',     'TXT_KEY_CITY_NAME_THP_TANG_10'),
        ('CIVILIZATION_THP_TANG',     'TXT_KEY_CITY_NAME_THP_TANG_11'),
        ('CIVILIZATION_THP_TANG',     'TXT_KEY_CITY_NAME_THP_TANG_12'),
        ('CIVILIZATION_THP_TANG',     'TXT_KEY_CITY_NAME_THP_TANG_13'),
        ('CIVILIZATION_THP_TANG',     'TXT_KEY_CITY_NAME_THP_TANG_14'),
        ('CIVILIZATION_THP_TANG',     'TXT_KEY_CITY_NAME_THP_TANG_15'),
        ('CIVILIZATION_THP_TANG',     'TXT_KEY_CITY_NAME_THP_TANG_16'),
        ('CIVILIZATION_THP_TANG',     'TXT_KEY_CITY_NAME_THP_TANG_17'),
        ('CIVILIZATION_THP_TANG',     'TXT_KEY_CITY_NAME_THP_TANG_18'),
        ('CIVILIZATION_THP_TANG',     'TXT_KEY_CITY_NAME_THP_TANG_19'),
        ('CIVILIZATION_THP_TANG',     'TXT_KEY_CITY_NAME_THP_TANG_20'),
        ('CIVILIZATION_THP_TANG',     'TXT_KEY_CITY_NAME_THP_TANG_21'),
        ('CIVILIZATION_THP_TANG',     'TXT_KEY_CITY_NAME_THP_TANG_22'),
        ('CIVILIZATION_THP_TANG',     'TXT_KEY_CITY_NAME_THP_TANG_23'),
        ('CIVILIZATION_THP_TANG',     'TXT_KEY_CITY_NAME_THP_TANG_24'),
        ('CIVILIZATION_THP_TANG',     'TXT_KEY_CITY_NAME_THP_TANG_25'),
        ('CIVILIZATION_THP_TANG',     'TXT_KEY_CITY_NAME_THP_TANG_26'),
        ('CIVILIZATION_THP_TANG',     'TXT_KEY_CITY_NAME_THP_TANG_27'),
        ('CIVILIZATION_THP_TANG',     'TXT_KEY_CITY_NAME_THP_TANG_28'),
        ('CIVILIZATION_THP_TANG',     'TXT_KEY_CITY_NAME_THP_TANG_29'),
        ('CIVILIZATION_THP_TANG',     'TXT_KEY_CITY_NAME_THP_TANG_30'),
        ('CIVILIZATION_THP_TANG',     'TXT_KEY_CITY_NAME_THP_TANG_31'),
        ('CIVILIZATION_THP_TANG',     'TXT_KEY_CITY_NAME_THP_TANG_32'),
        ('CIVILIZATION_THP_TANG',     'TXT_KEY_CITY_NAME_THP_TANG_33'),
        ('CIVILIZATION_THP_TANG',     'TXT_KEY_CITY_NAME_THP_TANG_34'),
        ('CIVILIZATION_THP_TANG',     'TXT_KEY_CITY_NAME_THP_TANG_35'),
        ('CIVILIZATION_THP_TANG',     'TXT_KEY_CITY_NAME_THP_TANG_36');
-----------------------------------
-- Civilization_FreeBuildingClasses
-----------------------------------
INSERT INTO Civilization_FreeBuildingClasses
          (CivilizationType,           BuildingClassType)
SELECT    'CIVILIZATION_THP_TANG',     BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE CivilizationType = 'CIVILIZATION_CHINA';
-------------------------
-- Civilization_FreeTechs
-------------------------
INSERT INTO Civilization_FreeTechs
          (CivilizationType,           TechType)
SELECT    'CIVILIZATION_THP_TANG',     TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_CHINA';
-------------------------
-- Civilization_FreeUnits
-------------------------
INSERT INTO Civilization_FreeUnits
          (CivilizationType,           UnitClassType, Count, UnitAIType)
SELECT    'CIVILIZATION_THP_TANG',     UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_CHINA';
-----------------------
-- Civilization_Leaders
-----------------------
INSERT INTO Civilization_Leaders
       (CivilizationType,         LeaderheadType)
VALUES ('CIVILIZATION_THP_TANG', 'LEADER_THP_TAIZONG');
--------------------------------------
-- Civilization_BuildingClassOverrides
--------------------------------------
INSERT INTO Civilization_BuildingClassOverrides
(CivilizationType,                BuildingClassType,          BuildingType)
VALUES ('CIVILIZATION_THP_TANG', 'BUILDINGCLASS_UNIVERSITY', 'BUILDING_THP_SHUYUAN');
----------------------------------
-- Civilization_UnitClassOverrides
----------------------------------
INSERT INTO Civilization_UnitClassOverrides
       (CivilizationType,         UnitClassType,                UnitType)
VALUES ('CIVILIZATION_THP_TANG', 'UNITCLASS_COMPOSITE_BOWMAN', 'UNIT_THP_FORBIDDENGUARD');
-------------------------
-- Civilization_Religions
-------------------------
INSERT INTO Civilization_Religions
       (CivilizationType,         ReligionType)
VALUES ('CIVILIZATION_THP_TANG', 'RELIGION_TAOISM');
------------------------
-- Civilization_SpyNames
------------------------
INSERT INTO Civilization_SpyNames
          (CivilizationType,             SpyName)
VALUES    ('CIVILIZATION_THP_TANG',     'TXT_KEY_SPY_NAME_THP_TANG_0'),
          ('CIVILIZATION_THP_TANG',     'TXT_KEY_SPY_NAME_THP_TANG_1'),
          ('CIVILIZATION_THP_TANG',     'TXT_KEY_SPY_NAME_THP_TANG_2'),
          ('CIVILIZATION_THP_TANG',     'TXT_KEY_SPY_NAME_THP_TANG_3'),
          ('CIVILIZATION_THP_TANG',     'TXT_KEY_SPY_NAME_THP_TANG_4'),
          ('CIVILIZATION_THP_TANG',     'TXT_KEY_SPY_NAME_THP_TANG_5'),
          ('CIVILIZATION_THP_TANG',     'TXT_KEY_SPY_NAME_THP_TANG_6'),
          ('CIVILIZATION_THP_TANG',     'TXT_KEY_SPY_NAME_THP_TANG_7'),
          ('CIVILIZATION_THP_TANG',     'TXT_KEY_SPY_NAME_THP_TANG_8'),
          ('CIVILIZATION_THP_TANG',     'TXT_KEY_SPY_NAME_THP_TANG_9');
-- ======================================================================================================
-- LEADERS
-- ======================================================================================================
-- Leaders
----------
INSERT INTO Leaders
(Type,                                     Description,                                             Civilopedia,                               CivilopediaTag,                     ArtDefineTag,                 VictoryCompetitiveness,     WonderCompetitiveness,     MinorCivCompetitiveness,     Boldness,     DiploBalance,   WarmongerHate,     DenounceWillingness,     DoFWillingness, Loyalty,     Neediness,    Forgiveness,     Chattiness, Meanness,     IconAtlas,             PortraitIndex)
VALUES    ('LEADER_THP_TAIZONG',     'TXT_KEY_LEADER_THP_TAIZONG',    'TXT_KEY_LEADER_THP_TAIZONG_PEDIA_TEXT',  'TXT_KEY_LEADER_THP_TAIZONG_PEDIA', 'Taizong_Leaderhead.xml',    9,                          5,                         6,                           9,                     3,              4,                 6,                       5,              6,           2,            4,               6,          6,           'THP_TANG_ATLAS',   1);
--------------------------------
-- Leader_MajorCivApproachBiases
--------------------------------
INSERT INTO Leader_MajorCivApproachBiases
          (LeaderType,                MajorCivApproachType,              Bias)
VALUES    ('LEADER_THP_TAIZONG',     'MAJOR_CIV_APPROACH_WAR',           7),
          ('LEADER_THP_TAIZONG',     'MAJOR_CIV_APPROACH_HOSTILE',       7),
          ('LEADER_THP_TAIZONG',     'MAJOR_CIV_APPROACH_DECEPTIVE',     3),
          ('LEADER_THP_TAIZONG',     'MAJOR_CIV_APPROACH_GUARDED',       5),
          ('LEADER_THP_TAIZONG',     'MAJOR_CIV_APPROACH_AFRAID',        2),
          ('LEADER_THP_TAIZONG',     'MAJOR_CIV_APPROACH_FRIENDLY',      5),
          ('LEADER_THP_TAIZONG',     'MAJOR_CIV_APPROACH_NEUTRAL',       7);
--------------------------------
-- Leader_MinorCivApproachBiases
--------------------------------
INSERT INTO Leader_MinorCivApproachBiases
          (LeaderType,                MinorCivApproachType,              Bias)
VALUES    ('LEADER_THP_TAIZONG',     'MINOR_CIV_APPROACH_IGNORE',        4),
          ('LEADER_THP_TAIZONG',     'MINOR_CIV_APPROACH_FRIENDLY',      2),
          ('LEADER_THP_TAIZONG',     'MINOR_CIV_APPROACH_PROTECTIVE',    6),
          ('LEADER_THP_TAIZONG',     'MINOR_CIV_APPROACH_CONQUEST',      10),
          ('LEADER_THP_TAIZONG',     'MINOR_CIV_APPROACH_BULLY',         6);
-----------------
-- Leader_Flavors
-----------------
INSERT INTO Leader_Flavors
          (LeaderType,                FlavorType,                        Flavor)
VALUES    ('LEADER_THP_TAIZONG',     'FLAVOR_OFFENSE',                   8),
          ('LEADER_THP_TAIZONG',     'FLAVOR_DEFENSE',                   6),
          ('LEADER_THP_TAIZONG',     'FLAVOR_CITY_DEFENSE',              6),
          ('LEADER_THP_TAIZONG',     'FLAVOR_MILITARY_TRAINING',         9),
          ('LEADER_THP_TAIZONG',     'FLAVOR_RECON',                     5),
          ('LEADER_THP_TAIZONG',     'FLAVOR_RANGED',                    7),
          ('LEADER_THP_TAIZONG',     'FLAVOR_MOBILE',                    5),
          ('LEADER_THP_TAIZONG',     'FLAVOR_NAVAL',                     4),
          ('LEADER_THP_TAIZONG',     'FLAVOR_NAVAL_RECON',               3),
          ('LEADER_THP_TAIZONG',     'FLAVOR_NAVAL_GROWTH',              5),
          ('LEADER_THP_TAIZONG',     'FLAVOR_NAVAL_TILE_IMPROVEMENT',    5),
          ('LEADER_THP_TAIZONG',     'FLAVOR_AIR',                       7),
          ('LEADER_THP_TAIZONG',     'FLAVOR_EXPANSION',                 8),
          ('LEADER_THP_TAIZONG',     'FLAVOR_GROWTH',                    7),
          ('LEADER_THP_TAIZONG',     'FLAVOR_TILE_IMPROVEMENT',          9),
          ('LEADER_THP_TAIZONG',     'FLAVOR_INFRASTRUCTURE',            7),
          ('LEADER_THP_TAIZONG',     'FLAVOR_PRODUCTION',                6),
          ('LEADER_THP_TAIZONG',     'FLAVOR_GOLD',                      7),
          ('LEADER_THP_TAIZONG',     'FLAVOR_SCIENCE',                   9),
          ('LEADER_THP_TAIZONG',     'FLAVOR_CULTURE',                   6),
          ('LEADER_THP_TAIZONG',     'FLAVOR_HAPPINESS',                 2),
          ('LEADER_THP_TAIZONG',     'FLAVOR_GREAT_PEOPLE',              4),
          ('LEADER_THP_TAIZONG',     'FLAVOR_WONDER',                    3),
          ('LEADER_THP_TAIZONG',     'FLAVOR_RELIGION',                  1),
          ('LEADER_THP_TAIZONG',     'FLAVOR_DIPLOMACY',                 4),
          ('LEADER_THP_TAIZONG',     'FLAVOR_SPACESHIP',                 8),
          ('LEADER_THP_TAIZONG',     'FLAVOR_WATER_CONNECTION',          4),
          ('LEADER_THP_TAIZONG',     'FLAVOR_NUKE',                      9),
          ('LEADER_THP_TAIZONG',     'FLAVOR_USE_NUKE',                  7),
          ('LEADER_THP_TAIZONG',     'FLAVOR_ESPIONAGE',                 6),
          ('LEADER_THP_TAIZONG',     'FLAVOR_ANTIAIR',                   6),
          ('LEADER_THP_TAIZONG',     'FLAVOR_AIRLIFT',                   6),
          ('LEADER_THP_TAIZONG',     'FLAVOR_I_TRADE_DESTINATION',       9),
          ('LEADER_THP_TAIZONG',     'FLAVOR_I_TRADE_ORIGIN',            8),
          ('LEADER_THP_TAIZONG',     'FLAVOR_I_SEA_TRADE_ROUTE',         5),
          ('LEADER_THP_TAIZONG',     'FLAVOR_I_LAND_TRADE_ROUTE',        8),
          ('LEADER_THP_TAIZONG',     'FLAVOR_ARCHAEOLOGY',               3),
          ('LEADER_THP_TAIZONG',     'FLAVOR_AIR_CARRIER',               5);
----------------
-- Leader_Traits
----------------
INSERT INTO Leader_Traits
       (LeaderType,              TraitType)
VALUES ('LEADER_THP_TAIZONG',   'TRAIT_THP_TANG');
-- ======================================================================================================
-- TRAITS
-- ======================================================================================================
-- Traits
---------
INSERT INTO Traits
       (Type,                 Description,                ShortDescription)
VALUES ('TRAIT_THP_TANG',    'TXT_KEY_TRAIT_THP_TANG',   'TXT_KEY_TRAIT_THP_TANG_SHORT');
-----------
-- Policies
-----------
INSERT INTO Policies
        (Type,                       Description,                        Help)
VALUES  ('POLICY_THP_TANG_TRAIT',   'TXT_KEY_POLICY_THP_TANG_TRAIT',    'TXT_KEY_POLICY_THP_TANG_TRAIT');
-----------------------------------
-- Policy_BuildingClassYieldChanges
-----------------------------------
INSERT INTO Policy_BuildingClassYieldChanges
        (PolicyType,                 BuildingClassType,          YieldType,         YieldChange)
VALUES  ('POLICY_THP_TANG_TRAIT',   'BUILDINGCLASS_COURTHOUSE', 'YIELD_SCIENCE',    1);
-- ======================================================================================================
-- BUILDINGS
-- ======================================================================================================
-- BuildingClasses
------------------
INSERT INTO BuildingClasses
        (Type,                               DefaultBuilding,                    Description)
VALUES  ('BUILDINGCLASS_THP_TANG_HAPPINESS',  'BUILDING_THP_TANG_HAPPINESS',   'TXT_KEY_BLDG_THP_TANG_HAPPINESS'),
('BUILDINGCLASS_THP_TANG_FORBIDDEN',  'BUILDING_THP_TANG_FORBIDDEN',   'TXT_KEY_BLDG_THP_TANG_FORBIDDEN');
------------
-- Buildings
------------
INSERT INTO Buildings
(Type,                              BuildingClass,    Cost, FaithCost, UnlockedByBelief, SpecialistType, SpecialistCount, GoldMaintenance, PrereqTech,   FreeStartEra,    Description,                         Help,                               Civilopedia,                                                    Strategy,                             ArtDefineTag, MinAreaSize, NeverCapture, ConquestProb,   HurryCostModifier,  PortraitIndex, IconAtlas)
SELECT    'BUILDING_THP_SHUYUAN',    BuildingClass,   Cost, FaithCost, UnlockedByBelief, SpecialistType, SpecialistCount, GoldMaintenance,  PrereqTech,  FreeStartEra,   'TXT_KEY_BLDG_THP_SHUYUAN',    'TXT_KEY_BLDG_THP_SHUYUAN_HELP',    'TXT_KEY_BLDG_THP_SHUYUAN_TEXT',    'TXT_KEY_BLDG_THP_SHUYUAN_STRATEGY',  ArtDefineTag, MinAreaSize, NeverCapture, ConquestProb,   HurryCostModifier,  3,            'THP_TANG_ATLAS'
FROM Buildings WHERE Type = 'BUILDING_UNIVERSITY';

INSERT INTO Buildings
(Type,                                     BuildingClass,                     Happiness, SpecialistCount, GreatWorkCount, Cost, FaithCost, Description,                         Help,                                  NeverCapture)
VALUES    ('BUILDING_THP_TANG_HAPPINESS', 'BUILDINGCLASS_THP_TANG_HAPPINESS', 2,         0,                -1,             -1,   -1,       'TXT_KEY_BLDG_THP_TANG_HAPPINESS',   'TXT_KEY_BLDG_THP_TANG_HAPPINESS',   1),
('BUILDING_THP_TANG_FORBIDDEN',           'BUILDINGCLASS_THP_TANG_FORBIDDEN', 0,         0,                -1,             -1,   -1,       'TXT_KEY_BLDG_THP_TANG_FORBIDDEN',   'TXT_KEY_BLDG_THP_TANG_FORBIDDEN',   1);
-------------------------------
-- Building_ClassesNeededInCity
-------------------------------
INSERT INTO Building_ClassesNeededInCity
        (BuildingType,          BuildingClassType)
SELECT  'BUILDING_THP_SHUYUAN', BuildingClassType
FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_UNIVERSITY';
-------------------
-- Building_Flavors
-------------------
INSERT INTO Building_Flavors
          (BuildingType,             FlavorType,    Flavor)
SELECT    'BUILDING_THP_SHUYUAN',    FlavorType,    Flavor
FROM Building_Flavors WHERE BuildingType = 'BUILDING_UNIVERSITY';

INSERT INTO Building_Flavors
        (BuildingType,               FlavorType,                Flavor)
VALUES  ('BUILDING_THP_SHUYUAN',    'FLAVOR_HAPPINESS',         5),
        ('BUILDING_THP_SHUYUAN',    'FLAVOR_I_TRADE_ORIGIN',    10);
-------------------------------
-- Building_FeatureYieldChanges
-------------------------------
INSERT INTO Building_FeatureYieldChanges
        (BuildingType,          FeatureType,    YieldType,  Yield)
SELECT  'BUILDING_THP_SHUYUAN', FeatureType,    YieldType,  Yield
FROM Building_FeatureYieldChanges WHERE BuildingType = 'BUILDING_UNIVERSITY';
--------------------------
-- Building_YieldModifiers
--------------------------
INSERT INTO Building_YieldModifiers
        (BuildingType,          YieldType,  Yield)
SELECT  'BUILDING_THP_SHUYUAN', YieldType,  Yield
FROM Building_YieldModifiers WHERE BuildingType = 'BUILDING_UNIVERSITY';

INSERT INTO Building_YieldModifiers
        (BuildingType,                   YieldType,     Yield)
VALUES  ('BUILDING_THP_TANG_FORBIDDEN', 'YIELD_FOOD',   10);
-- ======================================================================================================
-- UNITS
-- ======================================================================================================
-- UnitPromotions
-----------------
INSERT INTO UnitPromotions
(Type,                                         Description,                                              Help,                                        Sound,                CannotBeChosen, PortraitIndex,     IconAtlas,            PediaType,          PediaEntry)
VALUES    ('PROMOTION_THP_FORBIDDEN',         'TXT_KEY_PROMOTION_THP_FORBIDDEN',     'TXT_KEY_PROMOTION_THP_FORBIDDEN_HELP',     'AS2D_IF_LEVELUP',     1,              59,             'ABILITY_ATLAS',     'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_THP_FORBIDDEN');
--------
-- Units
--------
INSERT INTO Units
(Type,                                 Class,    CombatClass, WorkRate, PrereqTech, Combat, RangedCombat, Range, FaithCost, RequiresFaithPurchaseEnabled, Cost, Moves, Domain, DefaultUnitAI, CivilianAttackPriority, Special, Description,                                                         Help,                                       Strategy,                                    Civilopedia,                      MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, AdvancedStartCost, MinAreaSize, GoodyHutUpgradeUnitClass, CombatLimit, XPValueAttack, XPValueDefense, Conscription,             UnitArtInfo,               UnitFlagAtlas,                 UnitFlagIconOffset,    IconAtlas,          PortraitIndex,  MoveRate)
SELECT    'UNIT_THP_FORBIDDENGUARD',   Class,    CombatClass, WorkRate, PrereqTech, Combat, RangedCombat, Range, FaithCost, RequiresFaithPurchaseEnabled, Cost, Moves, Domain, DefaultUnitAI, CivilianAttackPriority, Special, 'TXT_KEY_UNIT_THP_FORBIDDENGUARD',    'TXT_KEY_UNIT_THP_FORBIDDENGUARD_HELP',    'TXT_KEY_UNIT_THP_FORBIDDENGUARD_STRATEGY',      'TXT_KEY_UNIT_THP_FORBIDDENGUARD_TEXT',    MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, AdvancedStartCost, MinAreaSize, GoodyHutUpgradeUnitClass, CombatLimit, XPValueAttack, XPValueDefense, Conscription, 'ART_DEF_UNIT_THP_FORBIDDENGUARD', 'THP_UNIT_FORBIDDENGUARD_FLAG_ATLAS',    0,                    'THP_TANG_ATLAS',   2,              MoveRate
FROM Units WHERE Type = 'UNIT_COMPOSITE_BOWMAN';
------------------------
-- UnitGameplay2DScripts
------------------------
INSERT INTO UnitGameplay2DScripts
       (UnitType,                  SelectionSound, FirstSelectionSound)
SELECT 'UNIT_THP_FORBIDDENGUARD',  SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_COMPOSITE_BOWMAN';
---------------
-- Unit_Flavors
---------------
INSERT INTO Unit_Flavors
       (UnitType,                  FlavorType, Flavor)
SELECT 'UNIT_THP_FORBIDDENGUARD',  FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_COMPOSITE_BOWMAN';

INSERT INTO Unit_Flavors
        (UnitType,                   FlavorType,        Flavor)
VALUES  ('UNIT_THP_FORBIDDENGUARD', 'FLAVOR_GROWTH',    5);
----------------------
-- Unit_FreePromotions
----------------------
INSERT INTO Unit_FreePromotions
        (UnitType,                  PromotionType)
SELECT  'UNIT_THP_FORBIDDENGUARD',  PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_COMPOSITE_BOWMAN';

INSERT INTO Unit_FreePromotions
        (UnitType,                   PromotionType)
VALUES  ('UNIT_THP_FORBIDDENGUARD', 'PROMOTION_THP_FORBIDDEN');
---------------------
-- Unit_ClassUpgrades
---------------------
INSERT INTO Unit_ClassUpgrades
        (UnitType,                  UnitClassType)
SELECT  'UNIT_THP_FORBIDDENGUARD',  UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_COMPOSITE_BOWMAN';
-- ======================================================================================================
-- DIPLOMACY
-- ======================================================================================================
INSERT INTO Diplomacy_Responses
(LeaderType,             ResponseType,                                     Response,                                                             Bias)
VALUES     ('LEADER_THP_TAIZONG',     'RESPONSE_ATTACKED_HOSTILE',                     'TXT_KEY_LEADER_THP_TAIZONG_ATTACKED_GENERIC%',                     500),
('LEADER_THP_TAIZONG',     'RESPONSE_DEFEATED',                             'TXT_KEY_LEADER_THP_TAIZONG_DEFEATED%',                             500),
('LEADER_THP_TAIZONG',     'RESPONSE_DOW_GENERIC',                         'TXT_KEY_LEADER_THP_TAIZONG_DOW_GENERIC%',                             500),
('LEADER_THP_TAIZONG',     'RESPONSE_EXPANSION_SERIOUS_WARNING',             'TXT_KEY_LEADER_THP_TAIZONG_EXPANSION_SERIOUS_WARNING%',             500),
('LEADER_THP_TAIZONG',     'RESPONSE_FIRST_GREETING',                         'TXT_KEY_LEADER_THP_TAIZONG_FIRSTGREETING%',                         500),
('LEADER_THP_TAIZONG',     'RESPONSE_GREETING_AT_WAR_HOSTILE',             'TXT_KEY_LEADER_THP_TAIZONG_GREETING_AT_WAR_HOSTILE%',                 500),
('LEADER_THP_TAIZONG',     'RESPONSE_GREETING_POLITE_HELLO',                 'TXT_KEY_LEADER_THP_TAIZONG_GREETING_POLITE_HELLO%',                 500),
('LEADER_THP_TAIZONG',     'RESPONSE_GREETING_NEUTRAL_HELLO',                 'TXT_KEY_LEADER_THP_TAIZONG_GREETING_NEUTRAL_HELLO%',                 500),
('LEADER_THP_TAIZONG',     'RESPONSE_GREETING_HOSTILE_HELLO',                 'TXT_KEY_LEADER_THP_TAIZONG_GREETING_HOSTILE_HELLO%',                 500),
('LEADER_THP_TAIZONG',     'RESPONSE_HOSTILE_AGGRESSIVE_MILITARY_WARNING', 'TXT_KEY_LEADER_THP_TAIZONG_HOSTILE_AGGRESSIVE_MILITARY_WARNING%',     500),
('LEADER_THP_TAIZONG',     'RESPONSE_INFLUENTIAL_ON_AI',                     'TXT_KEY_LEADER_THP_TAIZONG_INFLUENTIAL_ON_AI%',                     500),
('LEADER_THP_TAIZONG',     'RESPONSE_INFLUENTIAL_ON_HUMAN',                 'TXT_KEY_LEADER_THP_TAIZONG_INFLUENTIAL_ON_HUMAN%',                 500),
('LEADER_THP_TAIZONG',     'RESPONSE_LETS_HEAR_IT',                         'TXT_KEY_LEADER_THP_TAIZONG_LETS_HEAR_IT%',                         500),
('LEADER_THP_TAIZONG',     'RESPONSE_LUXURY_TRADE',                         'TXT_KEY_LEADER_THP_TAIZONG_LUXURY_TRADE%',                         500),
('LEADER_THP_TAIZONG',     'RESPONSE_NO_PEACE',                             'TXT_KEY_LEADER_THP_TAIZONG_NO_PEACE%',                             500),
('LEADER_THP_TAIZONG',     'RESPONSE_OPEN_BORDERS_EXCHANGE',                 'TXT_KEY_LEADER_THP_TAIZONG_OPEN_BORDERS_EXCHANGE%',                 500),
('LEADER_THP_TAIZONG',     'RESPONSE_PEACE_MADE_BY_HUMAN_GRACIOUS',         'TXT_KEY_LEADER_THP_TAIZONG_LOSEWAR%',                                 500),
('LEADER_THP_TAIZONG',     'RESPONSE_REPEAT_NO',                             'TXT_KEY_LEADER_THP_TAIZONG_REPEAT_NO%',                             500),
('LEADER_THP_TAIZONG',     'RESPONSE_RESPONSE_REQUEST',                     'TXT_KEY_LEADER_THP_TAIZONG_RESPONSE_REQUEST%',                     500),
('LEADER_THP_TAIZONG',     'RESPONSE_RESPONSE_TO_BEING_DENOUNCED',         'TXT_KEY_LEADER_THP_TAIZONG_RESPONSE_TO_BEING_DENOUNCED%',             500),
('LEADER_THP_TAIZONG',     'RESPONSE_TOO_SOON_NO_PEACE',                     'TXT_KEY_LEADER_THP_TAIZONG_TOO_SOON_NO_PEACE_1%',                     500),
('LEADER_THP_TAIZONG',     'RESPONSE_WINNER_PEACE_OFFER',                     'TXT_KEY_LEADER_THP_TAIZONG_WINWAR%',                                 500),
('LEADER_THP_TAIZONG',     'RESPONSE_WORK_AGAINST_SOMEONE',                 'TXT_KEY_LEADER_THP_TAIZONG_DENOUNCE%',                             500),
('LEADER_THP_TAIZONG',     'RESPONSE_WORK_WITH_US',                         'TXT_KEY_LEADER_THP_TAIZONG_DEC_FRIENDSHIP%',                         500);
-- ======================================================================================================
-- ======================================================================================================
