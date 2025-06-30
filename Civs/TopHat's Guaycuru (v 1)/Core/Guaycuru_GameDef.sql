-- Guaycuru
-- ======================================================================================================
-- CIVILIZATIONS
-- ======================================================================================================
-- Civilizations
----------------
INSERT INTO Civilizations
       (Type,                         Description,                       ShortDescription,                          Adjective,                          Civilopedia,                         CivilopediaTag,      DefaultPlayerColor,       ArtDefineTag,   ArtStyleType,  ArtStyleSuffix, ArtStylePrefix,                  IconAtlas,        PortraitIndex,  AlphaIconAtlas,               SoundtrackTag,   MapImage,                   DawnOfManQuote,                   DawnOfManImage)
SELECT 'CIVILIZATION_THP_GUAYCURU', 'TXT_KEY_CIV_THP_GUAYCURU_DESC',  'TXT_KEY_CIV_THP_GUAYCURU_SHORT_DESC',   'TXT_KEY_CIV_THP_GUAYCURU_ADJECTIVE',    'TXT_KEY_PEDIA_THP_GUAYCURU_TEXT',  'TXT_KEY_PEDIA_THP_GUAYCURU', 'PLAYERCOLOR_THP_GUAYCURU',     ArtDefineTag,   ArtStyleType,  ArtStyleSuffix, ArtStylePrefix,    'THP_GUAYCURU_ATLAS',   0,             'THP_GUAYCURU_ALPHA_ATLAS',   SoundtrackTag,  'Map_Guaycuru.dds',  'TXT_KEY_CIV5_DAWN_THP_GUAYCURU_TEXT',   'Eso_DOM.dds'
FROM Civilizations WHERE Type = 'CIVILIZATION_SHOSHONE';
-------------------------
-- Civilization_CityNames
-------------------------
INSERT INTO Civilization_CityNames
        (CivilizationType,                 CityName)
VALUES  ('CIVILIZATION_THP_GUAYCURU',     'TXT_KEY_CITY_NAME_THP_GUAYCURU_1'),
        ('CIVILIZATION_THP_GUAYCURU',     'TXT_KEY_CITY_NAME_THP_GUAYCURU_2'),
        ('CIVILIZATION_THP_GUAYCURU',     'TXT_KEY_CITY_NAME_THP_GUAYCURU_3'),
        ('CIVILIZATION_THP_GUAYCURU',     'TXT_KEY_CITY_NAME_THP_GUAYCURU_4'),
        ('CIVILIZATION_THP_GUAYCURU',     'TXT_KEY_CITY_NAME_THP_GUAYCURU_5'),
        ('CIVILIZATION_THP_GUAYCURU',     'TXT_KEY_CITY_NAME_THP_GUAYCURU_6'),
        ('CIVILIZATION_THP_GUAYCURU',     'TXT_KEY_CITY_NAME_THP_GUAYCURU_7'),
        ('CIVILIZATION_THP_GUAYCURU',     'TXT_KEY_CITY_NAME_THP_GUAYCURU_8'),
        ('CIVILIZATION_THP_GUAYCURU',     'TXT_KEY_CITY_NAME_THP_GUAYCURU_9'),
        ('CIVILIZATION_THP_GUAYCURU',     'TXT_KEY_CITY_NAME_THP_GUAYCURU_10'),
        ('CIVILIZATION_THP_GUAYCURU',     'TXT_KEY_CITY_NAME_THP_GUAYCURU_11'),
        ('CIVILIZATION_THP_GUAYCURU',     'TXT_KEY_CITY_NAME_THP_GUAYCURU_12'),
        ('CIVILIZATION_THP_GUAYCURU',     'TXT_KEY_CITY_NAME_THP_GUAYCURU_13'),
        ('CIVILIZATION_THP_GUAYCURU',     'TXT_KEY_CITY_NAME_THP_GUAYCURU_14'),
        ('CIVILIZATION_THP_GUAYCURU',     'TXT_KEY_CITY_NAME_THP_GUAYCURU_15'),
        ('CIVILIZATION_THP_GUAYCURU',     'TXT_KEY_CITY_NAME_THP_GUAYCURU_16'),
        ('CIVILIZATION_THP_GUAYCURU',     'TXT_KEY_CITY_NAME_THP_GUAYCURU_17'),
        ('CIVILIZATION_THP_GUAYCURU',     'TXT_KEY_CITY_NAME_THP_GUAYCURU_18'),
        ('CIVILIZATION_THP_GUAYCURU',     'TXT_KEY_CITY_NAME_THP_GUAYCURU_19'),
        ('CIVILIZATION_THP_GUAYCURU',     'TXT_KEY_CITY_NAME_THP_GUAYCURU_20'),
        ('CIVILIZATION_THP_GUAYCURU',     'TXT_KEY_CITY_NAME_THP_GUAYCURU_21'),
        ('CIVILIZATION_THP_GUAYCURU',     'TXT_KEY_CITY_NAME_THP_GUAYCURU_22'),
        ('CIVILIZATION_THP_GUAYCURU',     'TXT_KEY_CITY_NAME_THP_GUAYCURU_23'),
        ('CIVILIZATION_THP_GUAYCURU',     'TXT_KEY_CITY_NAME_THP_GUAYCURU_24'),
        ('CIVILIZATION_THP_GUAYCURU',     'TXT_KEY_CITY_NAME_THP_GUAYCURU_25'),
        ('CIVILIZATION_THP_GUAYCURU',     'TXT_KEY_CITY_NAME_THP_GUAYCURU_26'),
        ('CIVILIZATION_THP_GUAYCURU',     'TXT_KEY_CITY_NAME_THP_GUAYCURU_27'),
        ('CIVILIZATION_THP_GUAYCURU',     'TXT_KEY_CITY_NAME_THP_GUAYCURU_28'),
        ('CIVILIZATION_THP_GUAYCURU',     'TXT_KEY_CITY_NAME_THP_GUAYCURU_29'),
        ('CIVILIZATION_THP_GUAYCURU',     'TXT_KEY_CITY_NAME_THP_GUAYCURU_30');
-----------------------------------
-- Civilization_FreeBuildingClasses
-----------------------------------
INSERT INTO Civilization_FreeBuildingClasses
          (CivilizationType,               BuildingClassType)
SELECT    'CIVILIZATION_THP_GUAYCURU',     BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE CivilizationType = 'CIVILIZATION_SHOSHONE';
-------------------------
-- Civilization_FreeTechs
-------------------------
INSERT INTO Civilization_FreeTechs
          (CivilizationType,               TechType)
SELECT    'CIVILIZATION_THP_GUAYCURU',     TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_SHOSHONE';
-------------------------
-- Civilization_FreeUnits
-------------------------
INSERT INTO Civilization_FreeUnits
          (CivilizationType,               UnitClassType, Count, UnitAIType)
SELECT    'CIVILIZATION_THP_GUAYCURU',     UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_SHOSHONE';
-----------------------
-- Civilization_Leaders
-----------------------
INSERT INTO Civilization_Leaders
       (CivilizationType,             LeaderheadType)
VALUES ('CIVILIZATION_THP_GUAYCURU', 'LEADER_THP_ESO');
--------------------------------------
-- Civilization_BuildingClassOverrides
--------------------------------------
INSERT INTO Civilization_BuildingClassOverrides
       (CivilizationType,             BuildingClassType,      BuildingType)
VALUES ('CIVILIZATION_THP_GUAYCURU', 'BUILDINGCLASS_GARDEN', 'BUILDING_THP_NEMACHAQA');
----------------------------------
-- Civilization_UnitClassOverrides
----------------------------------
INSERT INTO Civilization_UnitClassOverrides
       (CivilizationType,             UnitClassType,        UnitType)
VALUES ('CIVILIZATION_THP_GUAYCURU', 'UNITCLASS_HORSEMAN', 'UNIT_THP_HALIAGANEK');
-------------------------
-- Civilization_Religions
-------------------------
INSERT INTO Civilization_Religions
       (CivilizationType,             ReligionType)
VALUES ('CIVILIZATION_THP_GUAYCURU', 'RELIGION_CHRISTIANITY');
------------------------
-- Civilization_SpyNames
------------------------
INSERT INTO Civilization_SpyNames
          (CivilizationType,                 SpyName)
VALUES    ('CIVILIZATION_THP_GUAYCURU',     'TXT_KEY_SPY_NAME_THP_GUAYCURU_0'),
          ('CIVILIZATION_THP_GUAYCURU',     'TXT_KEY_SPY_NAME_THP_GUAYCURU_1'),
          ('CIVILIZATION_THP_GUAYCURU',     'TXT_KEY_SPY_NAME_THP_GUAYCURU_2'),
          ('CIVILIZATION_THP_GUAYCURU',     'TXT_KEY_SPY_NAME_THP_GUAYCURU_3'),
          ('CIVILIZATION_THP_GUAYCURU',     'TXT_KEY_SPY_NAME_THP_GUAYCURU_4'),
          ('CIVILIZATION_THP_GUAYCURU',     'TXT_KEY_SPY_NAME_THP_GUAYCURU_5'),
          ('CIVILIZATION_THP_GUAYCURU',     'TXT_KEY_SPY_NAME_THP_GUAYCURU_6'),
          ('CIVILIZATION_THP_GUAYCURU',     'TXT_KEY_SPY_NAME_THP_GUAYCURU_7'),
          ('CIVILIZATION_THP_GUAYCURU',     'TXT_KEY_SPY_NAME_THP_GUAYCURU_8'),
          ('CIVILIZATION_THP_GUAYCURU',     'TXT_KEY_SPY_NAME_THP_GUAYCURU_9');
-- ======================================================================================================
-- LEADERS
-- ======================================================================================================
-- Leaders
----------
INSERT INTO Leaders
(Type,                                     Description,                                             Civilopedia,        CivilopediaTag,         ArtDefineTag,               VictoryCompetitiveness,     WonderCompetitiveness,     MinorCivCompetitiveness,     Boldness,     DiploBalance,   WarmongerHate,     DenounceWillingness,     DoFWillingness, Loyalty,     Neediness,    Forgiveness,     Chattiness, Meanness,     IconAtlas,             PortraitIndex)
VALUES    ('LEADER_THP_ESO',     'TXT_KEY_LEADER_THP_ESO',    'TXT_KEY_LEADER_THP_ESO_PEDIA_TEXT',  'TXT_KEY_LEADER_THP_ESO_PEDIA', 'Leaderhead_Eso.xml',    6,                          2,                          6,                           8,            3,              3,                 5,                       4,                 3,           4,            3,               6,          9,           'THP_GUAYCURU_ATLAS',   1);
--------------------------------
-- Leader_MajorCivApproachBiases
--------------------------------
INSERT INTO Leader_MajorCivApproachBiases
          (LeaderType,            MajorCivApproachType,              Bias)
VALUES    ('LEADER_THP_ESO',     'MAJOR_CIV_APPROACH_WAR',           8),
          ('LEADER_THP_ESO',     'MAJOR_CIV_APPROACH_HOSTILE',       8),
          ('LEADER_THP_ESO',     'MAJOR_CIV_APPROACH_DECEPTIVE',     5),
          ('LEADER_THP_ESO',     'MAJOR_CIV_APPROACH_GUARDED',       5),
          ('LEADER_THP_ESO',     'MAJOR_CIV_APPROACH_AFRAID',        2),
          ('LEADER_THP_ESO',     'MAJOR_CIV_APPROACH_FRIENDLY',      4),
          ('LEADER_THP_ESO',     'MAJOR_CIV_APPROACH_NEUTRAL',       6);
--------------------------------
-- Leader_MinorCivApproachBiases
--------------------------------
INSERT INTO Leader_MinorCivApproachBiases
          (LeaderType,            MinorCivApproachType,              Bias)
VALUES    ('LEADER_THP_ESO',     'MINOR_CIV_APPROACH_IGNORE',        7),
          ('LEADER_THP_ESO',     'MINOR_CIV_APPROACH_FRIENDLY',      3),
          ('LEADER_THP_ESO',     'MINOR_CIV_APPROACH_PROTECTIVE',    1),
          ('LEADER_THP_ESO',     'MINOR_CIV_APPROACH_CONQUEST',      6),
          ('LEADER_THP_ESO',     'MINOR_CIV_APPROACH_BULLY',         8);
-----------------
-- Leader_Flavors
-----------------
INSERT INTO Leader_Flavors
          (LeaderType,            FlavorType,                        Flavor)
VALUES    ('LEADER_THP_ESO',     'FLAVOR_OFFENSE',                   9),
          ('LEADER_THP_ESO',     'FLAVOR_DEFENSE',                   4),
          ('LEADER_THP_ESO',     'FLAVOR_CITY_DEFENSE',              4),
          ('LEADER_THP_ESO',     'FLAVOR_MILITARY_TRAINING',         6),
          ('LEADER_THP_ESO',     'FLAVOR_RECON',                     9),
          ('LEADER_THP_ESO',     'FLAVOR_RANGED',                    5),
          ('LEADER_THP_ESO',     'FLAVOR_MOBILE',                    10),
          ('LEADER_THP_ESO',     'FLAVOR_NAVAL',                     3),
          ('LEADER_THP_ESO',     'FLAVOR_NAVAL_RECON',               4),
          ('LEADER_THP_ESO',     'FLAVOR_NAVAL_GROWTH',              1),
          ('LEADER_THP_ESO',     'FLAVOR_NAVAL_TILE_IMPROVEMENT',    1),
          ('LEADER_THP_ESO',     'FLAVOR_AIR',                       6),
          ('LEADER_THP_ESO',     'FLAVOR_EXPANSION',                 7),
          ('LEADER_THP_ESO',     'FLAVOR_GROWTH',                    8),
          ('LEADER_THP_ESO',     'FLAVOR_TILE_IMPROVEMENT',          8),
          ('LEADER_THP_ESO',     'FLAVOR_INFRASTRUCTURE',            5),
          ('LEADER_THP_ESO',     'FLAVOR_PRODUCTION',                6),
          ('LEADER_THP_ESO',     'FLAVOR_GOLD',                      5),
          ('LEADER_THP_ESO',     'FLAVOR_SCIENCE',                   4),
          ('LEADER_THP_ESO',     'FLAVOR_CULTURE',                   2),
          ('LEADER_THP_ESO',     'FLAVOR_HAPPINESS',                 4),
          ('LEADER_THP_ESO',     'FLAVOR_GREAT_PEOPLE',              2),
          ('LEADER_THP_ESO',     'FLAVOR_WONDER',                    1),
          ('LEADER_THP_ESO',     'FLAVOR_RELIGION',                  5),
          ('LEADER_THP_ESO',     'FLAVOR_DIPLOMACY',                 4),
          ('LEADER_THP_ESO',     'FLAVOR_SPACESHIP',                 4),
          ('LEADER_THP_ESO',     'FLAVOR_WATER_CONNECTION',          5),
          ('LEADER_THP_ESO',     'FLAVOR_NUKE',                      6),
          ('LEADER_THP_ESO',     'FLAVOR_USE_NUKE',                  8),
          ('LEADER_THP_ESO',     'FLAVOR_ESPIONAGE',                 5),
          ('LEADER_THP_ESO',     'FLAVOR_ANTIAIR',                   5),
          ('LEADER_THP_ESO',     'FLAVOR_AIRLIFT',                   4),
          ('LEADER_THP_ESO',     'FLAVOR_I_TRADE_DESTINATION',       5),
          ('LEADER_THP_ESO',     'FLAVOR_I_TRADE_ORIGIN',            5),
          ('LEADER_THP_ESO',     'FLAVOR_I_SEA_TRADE_ROUTE',         3),
          ('LEADER_THP_ESO',     'FLAVOR_I_LAND_TRADE_ROUTE',        6),
          ('LEADER_THP_ESO',     'FLAVOR_ARCHAEOLOGY',               2),
          ('LEADER_THP_ESO',     'FLAVOR_AIR_CARRIER',               4);
----------------
-- Leader_Traits
----------------
INSERT INTO Leader_Traits
       (LeaderType,          TraitType)
VALUES ('LEADER_THP_ESO',   'TRAIT_THP_GUAYCURU');
-- ======================================================================================================
-- TRAITS
-- ======================================================================================================
-- Traits
---------
INSERT INTO Traits
       (Type,                     Description,                    ShortDescription)
VALUES ('TRAIT_THP_GUAYCURU',    'TXT_KEY_TRAIT_THP_GUAYCURU',   'TXT_KEY_TRAIT_THP_GUAYCURU_SHORT');
-- ======================================================================================================
-- DUMMY BUILDINGS
-- ======================================================================================================
INSERT INTO BuildingClasses
(Type, DefaultBuilding, Description)
SELECT  'BUILDINGCLASS_THP_GUAYCURU_'||Type,    'BUILDING_THP_GUAYCURU_'||Type, 'TXT_KEY_BLDG_THP_GUAYCURU_DUMMY'
FROM Resources WHERE (ResourceClassType = 'RESOURCECLASS_RUSH' OR ResourceClassType = 'RESOURCECLASS_MODERN');

INSERT INTO Buildings
(Type, BuildingClass, SpecialistCount, GreatWorkCount, Cost, FaithCost, Description, Help, NeverCapture)
SELECT    'BUILDING_THP_GUAYCURU_'||Type, 'BUILDINGCLASS_THP_GUAYCURU_'||Type,       0,              -1,   -1,   -1,       'TXT_KEY_BLDG_THP_GUAYCURU_DUMMY',   'TXT_KEY_BLDG_THP_GUAYCURU_DUMMY',   1
FROM Resources WHERE (ResourceClassType = 'RESOURCECLASS_RUSH' OR ResourceClassType = 'RESOURCECLASS_MODERN');

INSERT INTO Building_ResourceQuantity
        (BuildingType,                  ResourceType,   Quantity)
SELECT  'BUILDING_THP_GUAYCURU_'||Type, Type,           2
FROM Resources WHERE (ResourceClassType = 'RESOURCECLASS_RUSH' OR ResourceClassType = 'RESOURCECLASS_MODERN');

--

CREATE TRIGGER IF NOT EXISTS TopHat_GuaycuruDummyBuilding_Insert
AFTER INSERT ON Resources
WHEN (NEW.ResourceClassType = 'RESOURCECLASS_RUSH' OR NEW.ResourceClassType = 'RESOURCECLASS_MODERN')
BEGIN
INSERT INTO BuildingClasses
(Type, DefaultBuilding, Description)
VALUES  ('BUILDINGCLASS_THP_GUAYCURU_'||NEW.Type,    'BUILDING_THP_GUAYCURU_'||NEW.Type, 'TXT_KEY_BLDG_THP_GUAYCURU_DUMMY');

INSERT INTO Buildings
(Type, BuildingClass, SpecialistCount, GreatWorkCount, Cost, FaithCost, Description, Help, NeverCapture)
VALUES  ('BUILDING_THP_GUAYCURU_'||NEW.Type, 'BUILDINGCLASS_THP_GUAYCURU_'||NEW.Type,       0,              -1,   -1,   -1,       'TXT_KEY_BLDG_THP_GUAYCURU_DUMMY',   'TXT_KEY_BLDG_THP_GUAYCURU_DUMMY',   1);

INSERT INTO Building_ResourceQuantity
        (BuildingType,                          ResourceType,       Quantity)
VALUES  ('BUILDING_THP_GUAYCURU_'||NEW.Type,    NEW.Type,           2);
END;
-- ======================================================================================================
-- BUILDINGS
-- ======================================================================================================
-- Buildings
------------
INSERT INTO Buildings
(Type,                                 BuildingClass,    Cost, FaithCost, UnlockedByBelief, SpecialistType, SpecialistCount, GoldMaintenance, PrereqTech,   FreeStartEra,    Description,                         Help,                               Civilopedia,                                                    Strategy,                             ArtDefineTag, MinAreaSize, NeverCapture, ConquestProb,   HurryCostModifier,  PortraitIndex, IconAtlas)
SELECT    'BUILDING_THP_NEMACHAQA',    BuildingClass,   Cost, FaithCost, UnlockedByBelief, SpecialistType, SpecialistCount, GoldMaintenance,  PrereqTech,  FreeStartEra,   'TXT_KEY_BLDG_THP_NEMACHAQA',    'TXT_KEY_BLDG_THP_NEMACHAQA_HELP',    'TXT_KEY_BLDG_THP_NEMACHAQA_TEXT',    'TXT_KEY_BLDG_THP_NEMACHAQA_STRATEGY',  ArtDefineTag, MinAreaSize, NeverCapture, ConquestProb,   HurryCostModifier,  3,            'THP_GUAYCURU_ATLAS'
FROM Buildings WHERE Type = 'BUILDING_GARDEN';
-------------------------------
-- Building_ClassesNeededInCity
-------------------------------
INSERT INTO Building_ClassesNeededInCity
        (BuildingType,            BuildingClassType)
SELECT  'BUILDING_THP_NEMACHAQA', BuildingClassType
FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_GARDEN';
-------------------
-- Building_Flavors
-------------------
INSERT OR REPLACE INTO Building_Flavors
        (BuildingType,                 FlavorType,                Flavor)
VALUES  ('BUILDING_THP_NEMACHAQA',    'FLAVOR_GROWTH',            30),
        ('BUILDING_THP_NEMACHAQA',    'FLAVOR_SCIENCE',           5),
        ('BUILDING_THP_NEMACHAQA',    'FLAVOR_MILITARY_TRAINING', 20);
---------------------------------
-- Building_DomainFreeExperiences
---------------------------------
INSERT INTO Building_DomainFreeExperiences
        (BuildingType,               DomainType,    Experience)
VALUES  ('BUILDING_THP_NEMACHAQA',  'DOMAIN_LAND',  10),
        ('BUILDING_THP_NEMACHAQA',  'DOMAIN_SEA',   10),
        ('BUILDING_THP_NEMACHAQA',  'DOMAIN_AIR',   10);
------------------------
-- Building_YieldChanges
------------------------
INSERT INTO Building_YieldChanges
        (BuildingType,               YieldType,     Yield)
VALUES  ('BUILDING_THP_NEMACHAQA',  'YIELD_FOOD',   2);
-- ======================================================================================================
-- UNITS
-- ======================================================================================================
-- UnitPromotions
-----------------
INSERT INTO UnitPromotions
(Type,                                       Description,                                              Help,                     Sound,  CannotBeChosen, PortraitIndex,     IconAtlas,            PediaType,          PediaEntry)
VALUES  ('PROMOTION_THP_GUAYCURU_SPEED',         'TXT_KEY_PROMOTION_THP_GUAYCURU_SPEED',     'TXT_KEY_PROMOTION_THP_GUAYCURU_SPEED_HELP',     'AS2D_IF_LEVELUP',  1,              33,             'PROMOTION_ATLAS',     'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_THP_GUAYCURU_SPEED'),
('PROMOTION_THP_HALIAGANEK',         'TXT_KEY_PROMOTION_THP_HALIAGANEK',     'TXT_KEY_PROMOTION_THP_HALIAGANEK_HELP',     'AS2D_IF_LEVELUP',  1,              33,             'PROMOTION_ATLAS',     'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_THP_HALIAGANEK');

UPDATE UnitPromotions
SET MovesChange = 1
WHERE (Type = 'PROMOTION_THP_GUAYCURU_SPEED');
--------
-- Units
--------
INSERT INTO Units
(Type,                        Class,    CombatClass, WorkRate, PrereqTech, Combat, RangedCombat, Range, FaithCost, RequiresFaithPurchaseEnabled, Cost, Moves, Domain, DefaultUnitAI, CivilianAttackPriority, Special,  Description,                                                         Help,                                       Strategy,                                    Civilopedia,                      MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, IgnoreBuildingDefense, AdvancedStartCost, MinAreaSize, GoodyHutUpgradeUnitClass, CombatLimit, XPValueAttack, XPValueDefense, Conscription,             UnitArtInfo,               UnitFlagAtlas,                 UnitFlagIconOffset,    IconAtlas,          PortraitIndex,  MoveRate)
SELECT    'UNIT_THP_HALIAGANEK',   Class,    CombatClass, WorkRate, PrereqTech, Combat, RangedCombat, Range, FaithCost, RequiresFaithPurchaseEnabled, Cost, Moves, Domain, DefaultUnitAI, CivilianAttackPriority, Special, 'TXT_KEY_UNIT_THP_HALIAGANEK',    'TXT_KEY_UNIT_THP_HALIAGANEK_HELP',    'TXT_KEY_UNIT_THP_HALIAGANEK_STRATEGY',      'TXT_KEY_UNIT_THP_HALIAGANEK_TEXT',    MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, IgnoreBuildingDefense, AdvancedStartCost, MinAreaSize, GoodyHutUpgradeUnitClass, CombatLimit, XPValueAttack, XPValueDefense, Conscription, 'ART_DEF_UNIT_THP_HALIAGANEK', 'THP_UNIT_HALIAGANEK_FLAG_ATLAS',    0,                    'THP_GUAYCURU_ATLAS',   2,              MoveRate
FROM Units WHERE Type = 'UNIT_HORSEMAN';
------------------------
-- UnitGameplay2DScripts
------------------------
INSERT INTO UnitGameplay2DScripts
       (UnitType,              SelectionSound, FirstSelectionSound)
SELECT 'UNIT_THP_HALIAGANEK',  SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_HORSEMAN';
---------------
-- Unit_AITypes
---------------
INSERT INTO Unit_AITypes
          (UnitType,                UnitAIType)
SELECT    'UNIT_THP_HALIAGANEK',    UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_HORSEMAN';
---------------
-- Unit_Flavors
---------------
INSERT INTO Unit_Flavors
       (UnitType,              FlavorType, Flavor)
SELECT 'UNIT_THP_HALIAGANEK',  FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_HORSEMAN';
----------------------
-- Unit_FreePromotions
----------------------
INSERT INTO Unit_FreePromotions
        (UnitType,              PromotionType)
SELECT  'UNIT_THP_HALIAGANEK',  PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_HORSEMAN';

INSERT INTO Unit_FreePromotions
        (UnitType,               PromotionType)
VALUES  ('UNIT_THP_HALIAGANEK', 'PROMOTION_THP_HALIAGANEK');
---------------------
-- Unit_ClassUpgrades
---------------------
INSERT INTO Unit_ClassUpgrades
        (UnitType,              UnitClassType)
SELECT  'UNIT_THP_HALIAGANEK',  UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_HORSEMAN';
------------------------------------
-- Unit_ResourceQuantityRequirements
------------------------------------
INSERT INTO Unit_ResourceQuantityRequirements
       (UnitType,              ResourceType)
SELECT 'UNIT_THP_HALIAGANEK',  ResourceType
FROM Unit_ResourceQuantityRequirements WHERE UnitType = 'UNIT_HORSEMAN';
-- ======================================================================================================
-- DIPLOMACY
-- ======================================================================================================
INSERT INTO Diplomacy_Responses
(LeaderType,             ResponseType,                                     Response,                                                             Bias)
VALUES     ('LEADER_THP_ESO',     'RESPONSE_ATTACKED_HOSTILE',                     'TXT_KEY_LEADER_THP_ESO_ATTACKED_GENERIC%',                     500),
('LEADER_THP_ESO',     'RESPONSE_DEFEATED',                             'TXT_KEY_LEADER_THP_ESO_DEFEATED%',                             500),
('LEADER_THP_ESO',     'RESPONSE_DOW_GENERIC',                         'TXT_KEY_LEADER_THP_ESO_DOW_GENERIC%',                             500),
('LEADER_THP_ESO',     'RESPONSE_EXPANSION_SERIOUS_WARNING',             'TXT_KEY_LEADER_THP_ESO_EXPANSION_SERIOUS_WARNING%',             500),
('LEADER_THP_ESO',     'RESPONSE_FIRST_GREETING',                         'TXT_KEY_LEADER_THP_ESO_FIRSTGREETING%',                         500),
('LEADER_THP_ESO',     'RESPONSE_GREETING_AT_WAR_HOSTILE',             'TXT_KEY_LEADER_THP_ESO_GREETING_AT_WAR_HOSTILE%',                 500),
('LEADER_THP_ESO',     'RESPONSE_GREETING_POLITE_HELLO',                 'TXT_KEY_LEADER_THP_ESO_GREETING_POLITE_HELLO%',                 500),
('LEADER_THP_ESO',     'RESPONSE_GREETING_NEUTRAL_HELLO',                 'TXT_KEY_LEADER_THP_ESO_GREETING_NEUTRAL_HELLO%',                 500),
('LEADER_THP_ESO',     'RESPONSE_GREETING_HOSTILE_HELLO',                 'TXT_KEY_LEADER_THP_ESO_GREETING_HOSTILE_HELLO%',                 500),
('LEADER_THP_ESO',     'RESPONSE_HOSTILE_AGGRESSIVE_MILITARY_WARNING', 'TXT_KEY_LEADER_THP_ESO_HOSTILE_AGGRESSIVE_MILITARY_WARNING%',     500),
('LEADER_THP_ESO',     'RESPONSE_INFLUENTIAL_ON_AI',                     'TXT_KEY_LEADER_THP_ESO_INFLUENTIAL_ON_AI%',                     500),
('LEADER_THP_ESO',     'RESPONSE_INFLUENTIAL_ON_HUMAN',                 'TXT_KEY_LEADER_THP_ESO_INFLUENTIAL_ON_HUMAN%',                 500),
('LEADER_THP_ESO',     'RESPONSE_LETS_HEAR_IT',                         'TXT_KEY_LEADER_THP_ESO_LETS_HEAR_IT%',                         500),
('LEADER_THP_ESO',     'RESPONSE_LUXURY_TRADE',                         'TXT_KEY_LEADER_THP_ESO_LUXURY_TRADE%',                         500),
('LEADER_THP_ESO',     'RESPONSE_NO_PEACE',                             'TXT_KEY_LEADER_THP_ESO_NO_PEACE%',                             500),
('LEADER_THP_ESO',     'RESPONSE_OPEN_BORDERS_EXCHANGE',                 'TXT_KEY_LEADER_THP_ESO_OPEN_BORDERS_EXCHANGE%',                 500),
('LEADER_THP_ESO',     'RESPONSE_PEACE_MADE_BY_HUMAN_GRACIOUS',         'TXT_KEY_LEADER_THP_ESO_LOSEWAR%',                                 500),
('LEADER_THP_ESO',     'RESPONSE_REPEAT_NO',                             'TXT_KEY_LEADER_THP_ESO_REPEAT_NO%',                             500),
('LEADER_THP_ESO',     'RESPONSE_RESPONSE_REQUEST',                     'TXT_KEY_LEADER_THP_ESO_RESPONSE_REQUEST%',                     500),
('LEADER_THP_ESO',     'RESPONSE_RESPONSE_TO_BEING_DENOUNCED',         'TXT_KEY_LEADER_THP_ESO_RESPONSE_TO_BEING_DENOUNCED%',             500),
('LEADER_THP_ESO',     'RESPONSE_TOO_SOON_NO_PEACE',                     'TXT_KEY_LEADER_THP_ESO_TOO_SOON_NO_PEACE_1%',                     500),
('LEADER_THP_ESO',     'RESPONSE_WINNER_PEACE_OFFER',                     'TXT_KEY_LEADER_THP_ESO_WINWAR%',                                 500),
('LEADER_THP_ESO',     'RESPONSE_WORK_AGAINST_SOMEONE',                 'TXT_KEY_LEADER_THP_ESO_DENOUNCE%',                             500),
('LEADER_THP_ESO',     'RESPONSE_WORK_WITH_US',                         'TXT_KEY_LEADER_THP_ESO_DEC_FRIENDSHIP%',                         500);
-- ======================================================================================================
-- ======================================================================================================
