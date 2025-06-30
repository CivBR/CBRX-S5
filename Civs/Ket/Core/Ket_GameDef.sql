-- Ket
-- ======================================================================================================
-- CIVILIZATIONS
-- ======================================================================================================
-- Civilizations
----------------
INSERT INTO Civilizations
       (Type,                         Description,                       ShortDescription,                          Adjective,                          Civilopedia,                         CivilopediaTag,      DefaultPlayerColor,       ArtDefineTag,   ArtStyleType,  ArtStyleSuffix, ArtStylePrefix,                  IconAtlas,        PortraitIndex,  AlphaIconAtlas,               SoundtrackTag,   MapImage,                   DawnOfManQuote,                   DawnOfManImage)
SELECT 'CIVILIZATION_THP_KET', 'TXT_KEY_CIV_THP_KET_DESC',  'TXT_KEY_CIV_THP_KET_SHORT_DESC',   'TXT_KEY_CIV_THP_KET_ADJECTIVE',    'TXT_KEY_PEDIA_THP_KET_TEXT',  'TXT_KEY_PEDIA_THP_KET', 'PLAYERCOLOR_THP_KET',     ArtDefineTag,   ArtStyleType,  ArtStyleSuffix, ArtStylePrefix,    'THP_KET_ATLAS',   0,             'THP_KET_ALPHA_ATLAS',   SoundtrackTag,  'Map_Ket.dds',  'TXT_KEY_CIV5_DAWN_THP_KET_TEXT',   'Olgit_DOM.dds'
FROM Civilizations WHERE Type = 'CIVILIZATION_RUSSIA';
-------------------------
-- Civilization_CityNames
-------------------------
INSERT INTO Civilization_CityNames
        (CivilizationType,            CityName)
VALUES  ('CIVILIZATION_THP_KET',     'TXT_KEY_CITY_NAME_THP_KET_1'),
        ('CIVILIZATION_THP_KET',     'TXT_KEY_CITY_NAME_THP_KET_2'),
        ('CIVILIZATION_THP_KET',     'TXT_KEY_CITY_NAME_THP_KET_3'),
        ('CIVILIZATION_THP_KET',     'TXT_KEY_CITY_NAME_THP_KET_4'),
        ('CIVILIZATION_THP_KET',     'TXT_KEY_CITY_NAME_THP_KET_5'),
        ('CIVILIZATION_THP_KET',     'TXT_KEY_CITY_NAME_THP_KET_6'),
        ('CIVILIZATION_THP_KET',     'TXT_KEY_CITY_NAME_THP_KET_7'),
        ('CIVILIZATION_THP_KET',     'TXT_KEY_CITY_NAME_THP_KET_8'),
        ('CIVILIZATION_THP_KET',     'TXT_KEY_CITY_NAME_THP_KET_9'),
        ('CIVILIZATION_THP_KET',     'TXT_KEY_CITY_NAME_THP_KET_10'),
        ('CIVILIZATION_THP_KET',     'TXT_KEY_CITY_NAME_THP_KET_11'),
        ('CIVILIZATION_THP_KET',     'TXT_KEY_CITY_NAME_THP_KET_12'),
        ('CIVILIZATION_THP_KET',     'TXT_KEY_CITY_NAME_THP_KET_13'),
        ('CIVILIZATION_THP_KET',     'TXT_KEY_CITY_NAME_THP_KET_14'),
        ('CIVILIZATION_THP_KET',     'TXT_KEY_CITY_NAME_THP_KET_15'),
        ('CIVILIZATION_THP_KET',     'TXT_KEY_CITY_NAME_THP_KET_16'),
        ('CIVILIZATION_THP_KET',     'TXT_KEY_CITY_NAME_THP_KET_17'),
        ('CIVILIZATION_THP_KET',     'TXT_KEY_CITY_NAME_THP_KET_18'),
        ('CIVILIZATION_THP_KET',     'TXT_KEY_CITY_NAME_THP_KET_19'),
        ('CIVILIZATION_THP_KET',     'TXT_KEY_CITY_NAME_THP_KET_20'),
        ('CIVILIZATION_THP_KET',     'TXT_KEY_CITY_NAME_THP_KET_21'),
        ('CIVILIZATION_THP_KET',     'TXT_KEY_CITY_NAME_THP_KET_22');
-----------------------------------
-- Civilization_FreeBuildingClasses
-----------------------------------
INSERT INTO Civilization_FreeBuildingClasses
          (CivilizationType,          BuildingClassType)
SELECT    'CIVILIZATION_THP_KET',     BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE CivilizationType = 'CIVILIZATION_RUSSIA';
-------------------------
-- Civilization_FreeTechs
-------------------------
INSERT INTO Civilization_FreeTechs
          (CivilizationType,          TechType)
SELECT    'CIVILIZATION_THP_KET',     TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_RUSSIA';
-------------------------
-- Civilization_FreeUnits
-------------------------
INSERT INTO Civilization_FreeUnits
          (CivilizationType,          UnitClassType, Count, UnitAIType)
SELECT    'CIVILIZATION_THP_KET',     UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_RUSSIA';
-----------------------
-- Civilization_Leaders
-----------------------
INSERT INTO Civilization_Leaders
       (CivilizationType,        LeaderheadType)
VALUES ('CIVILIZATION_THP_KET', 'LEADER_THP_OLGIT');
----------------------------------
-- Civilization_UnitClassOverrides
----------------------------------
INSERT INTO Civilization_UnitClassOverrides
        (CivilizationType,        UnitClassType,             UnitType)
VALUES  ('CIVILIZATION_THP_KET', 'UNITCLASS_ARCHER',        'UNIT_THP_FISHBOWMAN'),
        ('CIVILIZATION_THP_KET', 'UNITCLASS_MISSIONARY',    'UNIT_THP_SENING');
-------------------------
-- Civilization_Religions
-------------------------
INSERT INTO Civilization_Religions
       (CivilizationType,        ReligionType)
VALUES ('CIVILIZATION_THP_KET', 'RELIGION_ORTHODOXY');
------------------------
-- Civilization_SpyNames
------------------------
INSERT INTO Civilization_SpyNames
          (CivilizationType,             SpyName)
VALUES    ('CIVILIZATION_THP_KET',     'TXT_KEY_SPY_NAME_THP_KET_0'),
          ('CIVILIZATION_THP_KET',     'TXT_KEY_SPY_NAME_THP_KET_1'),
          ('CIVILIZATION_THP_KET',     'TXT_KEY_SPY_NAME_THP_KET_2'),
          ('CIVILIZATION_THP_KET',     'TXT_KEY_SPY_NAME_THP_KET_3'),
          ('CIVILIZATION_THP_KET',     'TXT_KEY_SPY_NAME_THP_KET_4'),
          ('CIVILIZATION_THP_KET',     'TXT_KEY_SPY_NAME_THP_KET_5'),
          ('CIVILIZATION_THP_KET',     'TXT_KEY_SPY_NAME_THP_KET_6'),
          ('CIVILIZATION_THP_KET',     'TXT_KEY_SPY_NAME_THP_KET_7'),
          ('CIVILIZATION_THP_KET',     'TXT_KEY_SPY_NAME_THP_KET_8'),
          ('CIVILIZATION_THP_KET',     'TXT_KEY_SPY_NAME_THP_KET_9');
-------------------------------------
-- Civilization_Start_Region_Priority
-------------------------------------
INSERT INTO Civilization_Start_Region_Priority
        (CivilizationType,         RegionType)
VALUES  ('CIVILIZATION_THP_KET',  'REGION_TUNDRA');
-- ======================================================================================================
-- LEADERS
-- ======================================================================================================
-- Leaders
----------
INSERT INTO Leaders
(Type,                              Description,                   Civilopedia,                               CivilopediaTag,                    ArtDefineTag,             VictoryCompetitiveness,  WonderCompetitiveness,     MinorCivCompetitiveness,     Boldness,     DiploBalance,   WarmongerHate,     DenounceWillingness,     DoFWillingness, Loyalty,     Neediness,    Forgiveness,    Chattiness, Meanness,     IconAtlas,             PortraitIndex)
VALUES    ('LEADER_THP_OLGIT',     'TXT_KEY_LEADER_THP_OLGIT',    'TXT_KEY_LEADER_THP_OLGIT_PEDIA_TEXT',  'TXT_KEY_LEADER_THP_OLGIT_PEDIA', 'Leaderhead_Olgit.xml',    4,                          3,                         4,                           5,            8,              10,                 6,                              3,              5,           8,            5,              5,          3,           'THP_KET_ATLAS',   1);
--------------------------------
-- Leader_MajorCivApproachBiases
--------------------------------
INSERT INTO Leader_MajorCivApproachBiases
          (LeaderType,              MajorCivApproachType,              Bias)
VALUES    ('LEADER_THP_OLGIT',     'MAJOR_CIV_APPROACH_WAR',           4),
          ('LEADER_THP_OLGIT',     'MAJOR_CIV_APPROACH_HOSTILE',       5),
          ('LEADER_THP_OLGIT',     'MAJOR_CIV_APPROACH_DECEPTIVE',     6),
          ('LEADER_THP_OLGIT',     'MAJOR_CIV_APPROACH_GUARDED',       8),
          ('LEADER_THP_OLGIT',     'MAJOR_CIV_APPROACH_AFRAID',        8),
          ('LEADER_THP_OLGIT',     'MAJOR_CIV_APPROACH_FRIENDLY',      4),
          ('LEADER_THP_OLGIT',     'MAJOR_CIV_APPROACH_NEUTRAL',       5);
--------------------------------
-- Leader_MinorCivApproachBiases
--------------------------------
INSERT INTO Leader_MinorCivApproachBiases
          (LeaderType,              MinorCivApproachType,              Bias)
VALUES    ('LEADER_THP_OLGIT',     'MINOR_CIV_APPROACH_IGNORE',        8),
          ('LEADER_THP_OLGIT',     'MINOR_CIV_APPROACH_FRIENDLY',      4),
          ('LEADER_THP_OLGIT',     'MINOR_CIV_APPROACH_PROTECTIVE',    6),
          ('LEADER_THP_OLGIT',     'MINOR_CIV_APPROACH_CONQUEST',      2),
          ('LEADER_THP_OLGIT',     'MINOR_CIV_APPROACH_BULLY',         2);
-----------------
-- Leader_Flavors
-----------------
INSERT INTO Leader_Flavors
          (LeaderType,              FlavorType,                        Flavor)
VALUES    ('LEADER_THP_OLGIT',     'FLAVOR_OFFENSE',                   3),
          ('LEADER_THP_OLGIT',     'FLAVOR_DEFENSE',                   7),
          ('LEADER_THP_OLGIT',     'FLAVOR_CITY_DEFENSE',              6),
          ('LEADER_THP_OLGIT',     'FLAVOR_MILITARY_TRAINING',         5),
          ('LEADER_THP_OLGIT',     'FLAVOR_RECON',                     8),
          ('LEADER_THP_OLGIT',     'FLAVOR_RANGED',                    9),
          ('LEADER_THP_OLGIT',     'FLAVOR_MOBILE',                    5),
          ('LEADER_THP_OLGIT',     'FLAVOR_NAVAL',                     5),
          ('LEADER_THP_OLGIT',     'FLAVOR_NAVAL_RECON',               6),
          ('LEADER_THP_OLGIT',     'FLAVOR_NAVAL_GROWTH',              6),
          ('LEADER_THP_OLGIT',     'FLAVOR_NAVAL_TILE_IMPROVEMENT',    5),
          ('LEADER_THP_OLGIT',     'FLAVOR_AIR',                       9),
          ('LEADER_THP_OLGIT',     'FLAVOR_EXPANSION',                 5),
          ('LEADER_THP_OLGIT',     'FLAVOR_GROWTH',                    8),
          ('LEADER_THP_OLGIT',     'FLAVOR_TILE_IMPROVEMENT',          6),
          ('LEADER_THP_OLGIT',     'FLAVOR_INFRASTRUCTURE',            4),
          ('LEADER_THP_OLGIT',     'FLAVOR_PRODUCTION',                5),
          ('LEADER_THP_OLGIT',     'FLAVOR_GOLD',                      2),
          ('LEADER_THP_OLGIT',     'FLAVOR_SCIENCE',                   4),
          ('LEADER_THP_OLGIT',     'FLAVOR_CULTURE',                   7),
          ('LEADER_THP_OLGIT',     'FLAVOR_HAPPINESS',                 5),
          ('LEADER_THP_OLGIT',     'FLAVOR_GREAT_PEOPLE',              2),
          ('LEADER_THP_OLGIT',     'FLAVOR_WONDER',                    3),
          ('LEADER_THP_OLGIT',     'FLAVOR_RELIGION',                  9),
          ('LEADER_THP_OLGIT',     'FLAVOR_DIPLOMACY',                 7),
          ('LEADER_THP_OLGIT',     'FLAVOR_SPACESHIP',                 5),
          ('LEADER_THP_OLGIT',     'FLAVOR_WATER_CONNECTION',          5),
          ('LEADER_THP_OLGIT',     'FLAVOR_NUKE',                      2),
          ('LEADER_THP_OLGIT',     'FLAVOR_USE_NUKE',                  6),
          ('LEADER_THP_OLGIT',     'FLAVOR_ESPIONAGE',                 7),
          ('LEADER_THP_OLGIT',     'FLAVOR_ANTIAIR',                   5),
          ('LEADER_THP_OLGIT',     'FLAVOR_AIRLIFT',                   7),
          ('LEADER_THP_OLGIT',     'FLAVOR_I_TRADE_DESTINATION',       6),
          ('LEADER_THP_OLGIT',     'FLAVOR_I_TRADE_ORIGIN',            3),
          ('LEADER_THP_OLGIT',     'FLAVOR_I_SEA_TRADE_ROUTE',         3),
          ('LEADER_THP_OLGIT',     'FLAVOR_I_LAND_TRADE_ROUTE',        5),
          ('LEADER_THP_OLGIT',     'FLAVOR_ARCHAEOLOGY',               6),
          ('LEADER_THP_OLGIT',     'FLAVOR_AIR_CARRIER',               8);
----------------
-- Leader_Traits
----------------
INSERT INTO Leader_Traits
       (LeaderType,            TraitType)
VALUES ('LEADER_THP_OLGIT',   'TRAIT_THP_KET');
-- ======================================================================================================
-- TRAITS
-- ======================================================================================================
-- Traits
---------
INSERT INTO Traits
       (Type,                Description,               ShortDescription)
VALUES ('TRAIT_THP_KET',    'TXT_KEY_TRAIT_THP_KET',   'TXT_KEY_TRAIT_THP_KET_SHORT');
-- ======================================================================================================
-- PROMOTIONS
-- ======================================================================================================
-- UnitPromotions
-----------------
INSERT INTO UnitPromotions
(Type,                                           Description,                                               Help,                                          Sound,              HasPostCombatPromotions, CombatPercent,                CannotBeChosen, PortraitIndex,     IconAtlas,            PediaType,          PediaEntry)
VALUES    ('PROMOTION_THP_KET_FISHOIL',         'TXT_KEY_PROMOTION_THP_KET_FISHOIL',     'TXT_KEY_PROMOTION_THP_KET_FISHOIL_HELP',     'AS2D_IF_LEVELUP',   1, 0,                                      1,              59,             'ABILITY_ATLAS',     'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_THP_KET_FISHOIL_HELP'),
('PROMOTION_THP_KET_AFTERRANDOM',                   'TXT_KEY_PROMOTION_THP_KET_AFTERRANDOM',     'TXT_KEY_PROMOTION_THP_KET_AFTERRANDOM_HELP',     'AS2D_IF_LEVELUP',   0, 0,                                      1,              59,             'ABILITY_ATLAS',     'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_THP_KET_AFTERRANDOM_HELP'),
('PROMOTION_THP_KET_UNIT_POISONED',                 'TXT_KEY_PROMOTION_THP_KET_UNIT_POISONED',     'TXT_KEY_PROMOTION_THP_KET_UNIT_POISONED_HELP',     'AS2D_IF_LEVELUP',   1, 0,                                     1,              59,             'ABILITY_ATLAS',     'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_THP_KET_UNIT_POISONED_HELP'),
('PROMOTION_THP_SENING',                   'TXT_KEY_PROMOTION_THP_SENING',     'TXT_KEY_PROMOTION_THP_SENING_HELP',     'AS2D_IF_LEVELUP',   0, 0,                                        1,              59,             'ABILITY_ATLAS',     'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_THP_SENING_HELP'),
('PROMOTION_THP_STRENGTH_NEAR_SENING',                   'TXT_KEY_PROMOTION_THP_STRENGTH_NEAR_SENING',     'TXT_KEY_PROMOTION_THP_STRENGTH_NEAR_SENING_HELP',     'AS2D_IF_LEVELUP',   0, 10,                                       1,              59,             'ABILITY_ATLAS',     'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_THP_STRENGTH_NEAR_SENING_HELP');
-------------------------------------------
-- UnitPromotions_PostCombatRandomPromotion
-------------------------------------------
INSERT INTO UnitPromotions_PostCombatRandomPromotion
          (PromotionType,                    NewPromotion)
VALUES    ('PROMOTION_THP_KET_FISHOIL',     'PROMOTION_THP_KET_AFTERRANDOM');
--------------------------------
-- UnitPromotions_UnitCombats
--------------------------------
INSERT INTO UnitPromotions_UnitCombats
        (PromotionType,                      UnitCombatType)
VALUES  ('PROMOTION_THP_KET_FISHOIL',       'UNITCOMBAT_ARCHER'),
        ('PROMOTION_THP_KET_AFTERRANDOM',   'UNITCOMBAT_ARCHER'),
        ('PROMOTION_THP_KET_UNIT_POISONED', 'UNITCOMBAT_RECON'),
        ('PROMOTION_THP_KET_UNIT_POISONED', 'UNITCOMBAT_ARCHER'),
        ('PROMOTION_THP_KET_UNIT_POISONED', 'UNITCOMBAT_MOUNTED'),
        ('PROMOTION_THP_KET_UNIT_POISONED', 'UNITCOMBAT_MELEE'),
        ('PROMOTION_THP_KET_UNIT_POISONED', 'UNITCOMBAT_SIEGE'),
        ('PROMOTION_THP_KET_UNIT_POISONED', 'UNITCOMBAT_GUN'),
        ('PROMOTION_THP_KET_UNIT_POISONED', 'UNITCOMBAT_ARMOR'),
        ('PROMOTION_THP_KET_UNIT_POISONED', 'UNITCOMBAT_HELICOPTER'),
        ('PROMOTION_THP_KET_UNIT_POISONED', 'UNITCOMBAT_NAVALRANGED'),
        ('PROMOTION_THP_KET_UNIT_POISONED', 'UNITCOMBAT_NAVALMELEE');
-- ======================================================================================================
-- UNITS
-- ======================================================================================================
-- Units
--------
INSERT INTO Units
(Type,                             Class,    CombatClass, WorkRate, PrereqTech, Combat, RangedCombat, Range, FaithCost, RequiresFaithPurchaseEnabled, Cost, Moves, Domain, DefaultUnitAI, CivilianAttackPriority, Special, Description,                       Help,                                                     Strategy,                                    Civilopedia,                       MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, AdvancedStartCost, MinAreaSize, GoodyHutUpgradeUnitClass, CombatLimit, XPValueAttack, XPValueDefense, Conscription,  UnitArtInfo,                           UnitFlagAtlas,                      UnitFlagIconOffset,    IconAtlas,        PortraitIndex,  MoveRate)
SELECT    'UNIT_THP_FISHBOWMAN',   Class,    CombatClass, WorkRate, PrereqTech, Combat, RangedCombat, Range, FaithCost, RequiresFaithPurchaseEnabled, Cost, Moves, Domain, DefaultUnitAI, CivilianAttackPriority, Special, 'TXT_KEY_UNIT_THP_FISHBOWMAN',    'TXT_KEY_UNIT_THP_FISHBOWMAN_HELP',    'TXT_KEY_UNIT_THP_FISHBOWMAN_STRATEGY',     'TXT_KEY_UNIT_THP_FISHBOWMAN_TEXT', MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, AdvancedStartCost, MinAreaSize, GoodyHutUpgradeUnitClass, CombatLimit, XPValueAttack, XPValueDefense, Conscription, 'ART_DEF_UNIT_THP_FISHBOWMAN', 'THP_UNIT_FISHBOWMAN_FLAG_ATLAS',   0,                    'THP_KET_ATLAS',   2,              MoveRate
FROM Units WHERE Type = 'UNIT_ARCHER';

INSERT INTO Units
(Class,            Type,                PrereqTech, Combat, Cost, FaithCost, Moves, CombatClass, Domain, DefaultUnitAI, Description,                 Civilopedia,                                                Strategy,                                Help,                              MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, AdvancedStartCost, GoodyHutUpgradeUnitClass, CombatLimit, ObsoleteTech, XPValueDefense, UnitArtInfo,                  UnitFlagIconOffset,     UnitFlagAtlas,                   PortraitIndex,     IconAtlas,        MoveRate,    UnitArtInfoEraVariation,    ReligionSpreads,   ReligiousStrength,    SpreadReligion)
SELECT  Class,    'UNIT_THP_SENING',    PrereqTech, Combat, Cost, 0,         Moves, CombatClass, Domain, DefaultUnitAI, 'TXT_KEY_UNIT_THP_SENING',  'TXT_KEY_UNIT_THP_SENING_TEXT',     'TXT_KEY_UNIT_THP_SENING_STRATEGY',     'TXT_KEY_UNIT_THP_SENING_HELP',     MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, AdvancedStartCost, GoodyHutUpgradeUnitClass, CombatLimit, ObsoleteTech, XPValueDefense, 'ART_DEF_UNIT_THP_SENING',    0,                    'THP_UNIT_SENING_FLAG_ATLAS',    3,                'THP_KET_ATLAS',  MoveRate,    0,                            ReligionSpreads,   ReligiousStrength,    SpreadReligion
FROM Units WHERE Type = 'UNIT_MISSIONARY';
------------------------
-- UnitGameplay2DScripts
------------------------
INSERT INTO UnitGameplay2DScripts
       (UnitType,              SelectionSound, FirstSelectionSound)
SELECT 'UNIT_THP_FISHBOWMAN',  SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_ARCHER';

INSERT INTO UnitGameplay2DScripts
       (UnitType,          SelectionSound, FirstSelectionSound)
SELECT 'UNIT_THP_SENING',  SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_MISSIONARY';
---------------
-- Unit_Flavors
---------------
INSERT INTO Unit_Flavors
       (UnitType,              FlavorType, Flavor)
SELECT 'UNIT_THP_FISHBOWMAN',  FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_ARCHER';

INSERT INTO Unit_Flavors
       (UnitType,          FlavorType, Flavor)
SELECT 'UNIT_THP_SENING',  FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_MISSIONARY';
----------------------
-- Unit_FreePromotions
----------------------
INSERT INTO Unit_FreePromotions
        (UnitType,              PromotionType)
SELECT  'UNIT_THP_FISHBOWMAN',  PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_ARCHER';

INSERT INTO Unit_FreePromotions
	(UnitType,		PromotionType)
SELECT	'UNIT_THP_SENING',	PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_MISSIONARY';

INSERT INTO Unit_FreePromotions
        (UnitType,               PromotionType)
VALUES  ('UNIT_THP_FISHBOWMAN', 'PROMOTION_THP_KET_FISHOIL'),
        ('UNIT_THP_SENING',     'PROMOTION_THP_SENING');
---------------------
-- Unit_ClassUpgrades
---------------------
INSERT INTO Unit_ClassUpgrades
        (UnitType,              UnitClassType)
SELECT  'UNIT_THP_FISHBOWMAN',  UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_ARCHER';
-- ======================================================================================================
-- DIPLOMACY
-- ======================================================================================================
INSERT INTO Diplomacy_Responses
(LeaderType,             ResponseType,                                     Response,                                                             Bias)
VALUES     ('LEADER_THP_OLGIT',     'RESPONSE_ATTACKED_HOSTILE',                     'TXT_KEY_LEADER_THP_OLGIT_ATTACKED_GENERIC%',                     500),
('LEADER_THP_OLGIT',     'RESPONSE_DEFEATED',                             'TXT_KEY_LEADER_THP_OLGIT_DEFEATED%',                             500),
('LEADER_THP_OLGIT',     'RESPONSE_DOW_GENERIC',                         'TXT_KEY_LEADER_THP_OLGIT_DOW_GENERIC%',                             500),
('LEADER_THP_OLGIT',     'RESPONSE_EXPANSION_SERIOUS_WARNING',             'TXT_KEY_LEADER_THP_OLGIT_EXPANSION_SERIOUS_WARNING%',             500),
('LEADER_THP_OLGIT',     'RESPONSE_FIRST_GREETING',                         'TXT_KEY_LEADER_THP_OLGIT_FIRSTGREETING%',                         500),
('LEADER_THP_OLGIT',     'RESPONSE_GREETING_AT_WAR_HOSTILE',             'TXT_KEY_LEADER_THP_OLGIT_GREETING_AT_WAR_HOSTILE%',                 500),
('LEADER_THP_OLGIT',     'RESPONSE_GREETING_POLITE_HELLO',                 'TXT_KEY_LEADER_THP_OLGIT_GREETING_POLITE_HELLO%',                 500),
('LEADER_THP_OLGIT',     'RESPONSE_GREETING_NEUTRAL_HELLO',                 'TXT_KEY_LEADER_THP_OLGIT_GREETING_NEUTRAL_HELLO%',                 500),
('LEADER_THP_OLGIT',     'RESPONSE_GREETING_HOSTILE_HELLO',                 'TXT_KEY_LEADER_THP_OLGIT_GREETING_HOSTILE_HELLO%',                 500),
('LEADER_THP_OLGIT',     'RESPONSE_HOSTILE_AGGRESSIVE_MILITARY_WARNING', 'TXT_KEY_LEADER_THP_OLGIT_HOSTILE_AGGRESSIVE_MILITARY_WARNING%',     500),
('LEADER_THP_OLGIT',     'RESPONSE_INFLUENTIAL_ON_AI',                     'TXT_KEY_LEADER_THP_OLGIT_INFLUENTIAL_ON_AI%',                     500),
('LEADER_THP_OLGIT',     'RESPONSE_INFLUENTIAL_ON_HUMAN',                 'TXT_KEY_LEADER_THP_OLGIT_INFLUENTIAL_ON_HUMAN%',                 500),
('LEADER_THP_OLGIT',     'RESPONSE_LETS_HEAR_IT',                         'TXT_KEY_LEADER_THP_OLGIT_LETS_HEAR_IT%',                         500),
('LEADER_THP_OLGIT',     'RESPONSE_LUXURY_TRADE',                         'TXT_KEY_LEADER_THP_OLGIT_LUXURY_TRADE%',                         500),
('LEADER_THP_OLGIT',     'RESPONSE_NO_PEACE',                             'TXT_KEY_LEADER_THP_OLGIT_NO_PEACE%',                             500),
('LEADER_THP_OLGIT',     'RESPONSE_OPEN_BORDERS_EXCHANGE',                 'TXT_KEY_LEADER_THP_OLGIT_OPEN_BORDERS_EXCHANGE%',                 500),
('LEADER_THP_OLGIT',     'RESPONSE_PEACE_MADE_BY_HUMAN_GRACIOUS',         'TXT_KEY_LEADER_THP_OLGIT_LOSEWAR%',                                 500),
('LEADER_THP_OLGIT',     'RESPONSE_REPEAT_NO',                             'TXT_KEY_LEADER_THP_OLGIT_REPEAT_NO%',                             500),
('LEADER_THP_OLGIT',     'RESPONSE_RESPONSE_REQUEST',                     'TXT_KEY_LEADER_THP_OLGIT_RESPONSE_REQUEST%',                     500),
('LEADER_THP_OLGIT',     'RESPONSE_RESPONSE_TO_BEING_DENOUNCED',         'TXT_KEY_LEADER_THP_OLGIT_RESPONSE_TO_BEING_DENOUNCED%',             500),
('LEADER_THP_OLGIT',     'RESPONSE_TOO_SOON_NO_PEACE',                     'TXT_KEY_LEADER_THP_OLGIT_TOO_SOON_NO_PEACE_1%',                     500),
('LEADER_THP_OLGIT',     'RESPONSE_WINNER_PEACE_OFFER',                     'TXT_KEY_LEADER_THP_OLGIT_WINWAR%',                                 500),
('LEADER_THP_OLGIT',     'RESPONSE_WORK_AGAINST_SOMEONE',                 'TXT_KEY_LEADER_THP_OLGIT_DENOUNCE%',                             500),
('LEADER_THP_OLGIT',     'RESPONSE_WORK_WITH_US',                         'TXT_KEY_LEADER_THP_OLGIT_DEC_FRIENDSHIP%',                         500);
-- ======================================================================================================
-- ======================================================================================================
