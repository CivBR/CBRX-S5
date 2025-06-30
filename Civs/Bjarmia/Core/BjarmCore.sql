INSERT INTO Buildings
(Type,                                 BuildingClass,    Cost, Espionage, EspionageModifier, SpecialistType, SpecialistCount, GoldMaintenance, PrereqTech,    Description,                                              Help,                                     Civilopedia,                                              Strategy,                                 ArtDefineTag, MinAreaSize, NeverCapture, Espionage, EspionageModifier, UnmoddedHappiness, HurryCostModifier, TradeRouteLandDistanceModifier, TradeRouteLandGoldBonus, PortraitIndex, IconAtlas, AllowsRangeStrike, Defense, ExtraCityHitPoints, CapturePlunderModifier)
SELECT    'BUILDING_RHO_JOMALI',    BuildingClass,    Cost, Espionage, EspionageModifier, SpecialistType, SpecialistCount, GoldMaintenance,  PrereqTech,   'TXT_KEY_BUILDING_RHO_JOMALI',    'TXT_KEY_BUILDING_RHO_JOMALI_HELP',    'TXT_KEY_BUILDING_RHO_JOMALI_TEXT',    'TXT_KEY_BUILDING_RHO_JOMALI_STRATEGY',    ArtDefineTag, MinAreaSize, NeverCapture, Espionage, EspionageModifier, UnmoddedHappiness, HurryCostModifier, TradeRouteLandDistanceModifier,											TradeRouteLandGoldBonus,	3,         'ATLAS_RHO_BJARMIA', AllowsRangeStrike, Defense, ExtraCityHitPoints, 100
FROM Buildings WHERE Type = 'BUILDING_TEMPLE';

INSERT INTO Building_YieldChanges
(BuildingType,YieldType,Yield)
SELECT  'BUILDING_RHO_JOMALI',YieldType, Yield
FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_TEMPLE';

INSERT INTO Building_Flavors
          (BuildingType,               FlavorType,    Flavor)
SELECT    'BUILDING_RHO_JOMALI',    FlavorType,    Flavor
FROM Building_Flavors WHERE BuildingType = 'BUILDING_TEMPLE';
--Buildings
--Dummies:


-- Resources


--Units
--Promotions
INSERT INTO UnitPromotions
       (Type,					Description,					Help,								Sound,						PortraitIndex, IconAtlas, CannotBeChosen, PediaType, PediaEntry, CombatPercent, RangeChange)
VALUES ('PROMOTION_RHO_ASHSLAYERA','TXT_KEY_PROMOTION_RHO_ASHSLAYERA','TXT_KEY_PROMOTION_RHO_ASHSLAYERA_HELP','AS2D_IF_LEVELUP', 						59, 'ABILITY_ATLAS',		1, 'PEDIA_ATTRIBUTES','TXT_KEY_PEDIA_PROMOTION_ASHSLAYERA', 0, 1),
('PROMOTION_RHO_ASHSLAYERB','TXT_KEY_PROMOTION_RHO_ASHSLAYERB','TXT_KEY_PROMOTION_RHO_ASHSLAYERB_HELP','AS2D_IF_LEVELUP', 						59, 'ABILITY_ATLAS',		1, 'PEDIA_ATTRIBUTES','TXT_KEY_PEDIA_PROMOTION_ASHSLAYERB', 0, 2),
('PROMOTION_RHO_ASHSLAYERC','TXT_KEY_PROMOTION_RHO_ASHSLAYERC','TXT_KEY_PROMOTION_RHO_ASHSLAYERC_HELP','AS2D_IF_LEVELUP', 						59, 'ABILITY_ATLAS',		1, 'PEDIA_ATTRIBUTES','TXT_KEY_PEDIA_PROMOTION_ASHSLAYERC', 0, 3);


INSERT INTO Units
		(Type, Class, PrereqTech, Combat, RangedCombat, Range, Cost, FaithCost, RequiresFaithPurchaseEnabled, Moves, CombatClass, Domain, DefaultUnitAI, MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, IgnoreBuildingDefense, GoodyHutUpgradeUnitClass, AdvancedStartCost, CombatLimit, Conscription, XPValueAttack, XPValueDefense, Description, Help, Strategy, Civilopedia, ShowInPedia,	MoveRate, UnitArtInfo, UnitFlagAtlas, UnitFlagIconOffset, IconAtlas, PortraitIndex)
SELECT	'UNIT_RHO_ASHSLAYER', Class, PrereqTech, Combat, RangedCombat, Range, Cost, FaithCost, RequiresFaithPurchaseEnabled, Moves, CombatClass, Domain, DefaultUnitAI, MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, IgnoreBuildingDefense, GoodyHutUpgradeUnitClass, AdvancedStartCost, CombatLimit, Conscription, XPValueAttack, XPValueDefense, 'TXT_KEY_UNIT_RHO_ASHSLAYER',	'TXT_KEY_UNIT_RHO_ASHSLAYER_HELP', 	'TXT_KEY_UNIT_RHO_ASHSLAYER_STRATEGY', 	'TXT_KEY_UNIT_RHO_ASHSLAYER_TEXT',	ShowInPedia, MoveRate, 'ART_DEF_UNIT_RHO_ASHSLAYER',	'ALPHA_RHO_ASHSLAYER', 0, 'ATLAS_RHO_BJARMIA', 2
FROM Units WHERE Type = 'UNIT_COMPOSITE_BOWMAN';

INSERT INTO Unit_AITypes 	
		(UnitType, 				UnitAIType)
SELECT	'UNIT_RHO_ASHSLAYER', 	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_COMPOSITE_BOWMAN';

INSERT INTO UnitGameplay2DScripts
       (UnitType,           SelectionSound, FirstSelectionSound)
SELECT 'UNIT_RHO_ASHSLAYER',  SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_COMPOSITE_BOWMAN';

INSERT INTO Unit_Flavors
       (UnitType,           FlavorType, Flavor)
SELECT 'UNIT_RHO_ASHSLAYER',  FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_COMPOSITE_BOWMAN';

INSERT INTO Unit_FreePromotions
       (UnitType,           PromotionType)
SELECT 'UNIT_RHO_ASHSLAYER',  PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_COMPOSITE_BOWMAN';
INSERT INTO Unit_FreePromotions
       (UnitType,           PromotionType)
VALUES ('UNIT_RHO_ASHSLAYER', 'PROMOTION_GOLDEN_AGE_POINTS');

INSERT INTO Unit_ClassUpgrades
       (UnitType,           UnitClassType)
SELECT 'UNIT_RHO_ASHSLAYER',  UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_COMPOSITE_BOWMAN';


INSERT INTO Civilization_UnitClassOverrides
       (CivilizationType, UnitClassType, UnitType)
VALUES ('CIVILIZATION_RHO_BJARMIA', 'UNITCLASS_COMPOSITE_BOWMAN', 'UNIT_RHO_ASHSLAYER');



--Diplo
--Audio

--Leader

INSERT INTO Leaders
		(Type,					Description,					Civilopedia,						CivilopediaTag,				ArtDefineTag,										VictoryCompetitiveness,	WonderCompetitiveness,	MinorCivCompetitiveness,	Boldness,	DiploBalance,	WarmongerHate,	WorkAgainstWillingness,	WorkWithWillingness,	DenounceWillingness,	DoFWillingness,	Loyalty,	Neediness,	Forgiveness,	Chattiness,	Meanness,	PortraitIndex,	IconAtlas)
		VALUES	('LEADER_RHO_HAREKR',	'TXT_KEY_LEADER_RHO_HAREKR',		'TXT_KEY_LEADER_RHO_HAREKR_PEDIA',	'TXT_KEY_LEADER_RHO_HAREKR_PEDIA',	'bjarm_LS.xml',	4,						4,						3,							6,			5,				8,				9,						6,						3,						5,				5,			4,			5,				1,			4,			1,				'ATLAS_RHO_BJARMIA');

INSERT INTO Leader_MajorCivApproachBiases
		(LeaderType,			MajorCivApproachType,			Bias)
VALUES	('LEADER_RHO_HAREKR',	'MAJOR_CIV_APPROACH_WAR',		6),
		('LEADER_RHO_HAREKR',	'MAJOR_CIV_APPROACH_HOSTILE',	8),
		('LEADER_RHO_HAREKR',	'MAJOR_CIV_APPROACH_DECEPTIVE',	5),
		('LEADER_RHO_HAREKR',	'MAJOR_CIV_APPROACH_GUARDED',	7),
		('LEADER_RHO_HAREKR',	'MAJOR_CIV_APPROACH_FRIENDLY',	6),
		('LEADER_RHO_HAREKR',	'MAJOR_CIV_APPROACH_AFRAID',	4),
		('LEADER_RHO_HAREKR',	'MAJOR_CIV_APPROACH_NEUTRAL',	3);
		


INSERT INTO Leader_MinorCivApproachBiases
		(LeaderType,			MinorCivApproachType,				Bias)
VALUES	('LEADER_RHO_HAREKR',	'MINOR_CIV_APPROACH_IGNORE',		6),
		('LEADER_RHO_HAREKR',	'MINOR_CIV_APPROACH_FRIENDLY',		7),
		('LEADER_RHO_HAREKR',	'MINOR_CIV_APPROACH_PROTECTIVE',	3),
		('LEADER_RHO_HAREKR',	'MINOR_CIV_APPROACH_CONQUEST',		3),
		('LEADER_RHO_HAREKR',	'MINOR_CIV_APPROACH_BULLY',			3);

INSERT INTO Leader_Flavors
		(LeaderType, 			FlavorType,							Flavor)
VALUES	('LEADER_RHO_HAREKR',	'FLAVOR_OFFENSE',					4),
		('LEADER_RHO_HAREKR',	'FLAVOR_DEFENSE',					8),
		('LEADER_RHO_HAREKR',	'FLAVOR_CITY_DEFENSE',				9),
		('LEADER_RHO_HAREKR',	'FLAVOR_MILITARY_TRAINING',			4),
		('LEADER_RHO_HAREKR',	'FLAVOR_RECON',						3),
		('LEADER_RHO_HAREKR',	'FLAVOR_RANGED',					8),
		('LEADER_RHO_HAREKR',	'FLAVOR_MOBILE',					3),
		('LEADER_RHO_HAREKR',	'FLAVOR_NAVAL',						6),
		('LEADER_RHO_HAREKR',	'FLAVOR_NAVAL_RECON',				6),
		('LEADER_RHO_HAREKR',	'FLAVOR_NAVAL_GROWTH',				7),
		('LEADER_RHO_HAREKR',	'FLAVOR_NAVAL_TILE_IMPROVEMENT',	4),
		('LEADER_RHO_HAREKR',	'FLAVOR_AIR',						9),
		('LEADER_RHO_HAREKR',	'FLAVOR_EXPANSION',					6),
		('LEADER_RHO_HAREKR',	'FLAVOR_GROWTH',					3),
		('LEADER_RHO_HAREKR',	'FLAVOR_TILE_IMPROVEMENT',			4),
		('LEADER_RHO_HAREKR',	'FLAVOR_INFRASTRUCTURE',			5),
		('LEADER_RHO_HAREKR',	'FLAVOR_PRODUCTION',				4),
		('LEADER_RHO_HAREKR',	'FLAVOR_GOLD',						11),
		('LEADER_RHO_HAREKR',	'FLAVOR_SCIENCE',					3),
		('LEADER_RHO_HAREKR',	'FLAVOR_CULTURE',					5),
		('LEADER_RHO_HAREKR',	'FLAVOR_HAPPINESS',					4),
		('LEADER_RHO_HAREKR',	'FLAVOR_GREAT_PEOPLE',				3),
		('LEADER_RHO_HAREKR',	'FLAVOR_WONDER',					5),
		('LEADER_RHO_HAREKR',	'FLAVOR_RELIGION',					7),
		('LEADER_RHO_HAREKR',	'FLAVOR_DIPLOMACY',					6),
		('LEADER_RHO_HAREKR',	'FLAVOR_SPACESHIP',					8),
		('LEADER_RHO_HAREKR',	'FLAVOR_WATER_CONNECTION',			6),
		('LEADER_RHO_HAREKR',	'FLAVOR_NUKE',						6),
		('LEADER_RHO_HAREKR',	'FLAVOR_USE_NUKE',					8),
		('LEADER_RHO_HAREKR',	'FLAVOR_ESPIONAGE',					6),
		('LEADER_RHO_HAREKR',	'FLAVOR_ANTIAIR',					3),
		('LEADER_RHO_HAREKR',	'FLAVOR_AIR_CARRIER',				3),
		('LEADER_RHO_HAREKR',	'FLAVOR_I_LAND_TRADE_ROUTE',		5),
		('LEADER_RHO_HAREKR',	'FLAVOR_I_SEA_TRADE_ROUTE',			5),
		('LEADER_RHO_HAREKR',	'FLAVOR_ARCHAEOLOGY',				5),
		('LEADER_RHO_HAREKR',	'FLAVOR_I_TRADE_ORIGIN',			7),
		('LEADER_RHO_HAREKR',	'FLAVOR_I_TRADE_DESTINATION',		7),
		('LEADER_RHO_HAREKR',	'FLAVOR_AIRLIFT',					3);

INSERT INTO Traits
		(Type,				Description,				ShortDescription)
VALUES	('TRAIT_RHO_SEA_OF_SERPENTS',	'TXT_KEY_TRAIT_RHO_SEA_OF_SERPENTS',	'TXT_KEY_TRAIT_RHO_SEA_OF_SERPENTS_SHORT');

-----

INSERT INTO Leader_Traits
		(LeaderType,			TraitType)
VALUES	('LEADER_RHO_HAREKR',	'TRAIT_RHO_SEA_OF_SERPENTS');

--Civilization

INSERT INTO Civilizations
		(Type,						Description,						CivilopediaTag,					ShortDescription,							Adjective,								DefaultPlayerColor,				ArtDefineTag,			ArtStyleType,		ArtStyleSuffix,	ArtStylePrefix,	PortraitIndex,	IconAtlas,				AlphaIconAtlas,			MapImage,		DawnOfManQuote,							DawnOfManImage)
VALUES	('CIVILIZATION_RHO_BJARMIA',	'TXT_KEY_CIVILIZATION_RHO_BJARMIA',	'TXT_KEY_PEDIA_RHO_BJARMIA',	'TXT_KEY_CIVILIZATION_RHO_BJARMIA_SHORT',	'TXT_KEY_CIVILIZATION_RHO_BJARMIA_ADJ',	'PLAYERCOLOR_RHO_BJARMIA',	'ART_DEF_CIVILIZATION_ENGLAND',	'ARTSTYLE_EUROPEAN',	'_EURO',		'EUROPEAN',		0,				'ATLAS_RHO_BJARMIA',	'ALPHA_RHO_BJARMIA',	'bjarmia_map.dds',	'TXT_KEY_CIV5_DAWN_RHO_BJARMIA_TEXT',	'bjarm_dom.dds');

INSERT INTO Civilization_CityNames
		(CivilizationType,				CityName)
VALUES	('CIVILIZATION_RHO_BJARMIA',	'TXT_KEY_CITY_NAME_RHO_BJARMIA_1'),
		('CIVILIZATION_RHO_BJARMIA',	'TXT_KEY_CITY_NAME_RHO_BJARMIA_2'),
		('CIVILIZATION_RHO_BJARMIA',	'TXT_KEY_CITY_NAME_RHO_BJARMIA_3'),
		('CIVILIZATION_RHO_BJARMIA',	'TXT_KEY_CITY_NAME_RHO_BJARMIA_4'),
		('CIVILIZATION_RHO_BJARMIA',	'TXT_KEY_CITY_NAME_RHO_BJARMIA_5'),
		('CIVILIZATION_RHO_BJARMIA',	'TXT_KEY_CITY_NAME_RHO_BJARMIA_6'),
		('CIVILIZATION_RHO_BJARMIA',	'TXT_KEY_CITY_NAME_RHO_BJARMIA_7'),
		('CIVILIZATION_RHO_BJARMIA',	'TXT_KEY_CITY_NAME_RHO_BJARMIA_8'),
		('CIVILIZATION_RHO_BJARMIA',	'TXT_KEY_CITY_NAME_RHO_BJARMIA_9'),
		('CIVILIZATION_RHO_BJARMIA',	'TXT_KEY_CITY_NAME_RHO_BJARMIA_10'),
		('CIVILIZATION_RHO_BJARMIA',	'TXT_KEY_CITY_NAME_RHO_BJARMIA_11'),
		('CIVILIZATION_RHO_BJARMIA',	'TXT_KEY_CITY_NAME_RHO_BJARMIA_12'),
		('CIVILIZATION_RHO_BJARMIA',	'TXT_KEY_CITY_NAME_RHO_BJARMIA_13'),
		('CIVILIZATION_RHO_BJARMIA',	'TXT_KEY_CITY_NAME_RHO_BJARMIA_14'),
		('CIVILIZATION_RHO_BJARMIA',	'TXT_KEY_CITY_NAME_RHO_BJARMIA_15'),
		('CIVILIZATION_RHO_BJARMIA',	'TXT_KEY_CITY_NAME_RHO_BJARMIA_16'),
		('CIVILIZATION_RHO_BJARMIA',	'TXT_KEY_CITY_NAME_RHO_BJARMIA_17'),
		('CIVILIZATION_RHO_BJARMIA',	'TXT_KEY_CITY_NAME_RHO_BJARMIA_18'),
		('CIVILIZATION_RHO_BJARMIA',	'TXT_KEY_CITY_NAME_RHO_BJARMIA_19'),
		('CIVILIZATION_RHO_BJARMIA',	'TXT_KEY_CITY_NAME_RHO_BJARMIA_20'),
		('CIVILIZATION_RHO_BJARMIA',	'TXT_KEY_CITY_NAME_RHO_BJARMIA_21')
		;

INSERT INTO Civilization_FreeBuildingClasses
          (CivilizationType,              BuildingClassType)
SELECT    'CIVILIZATION_RHO_BJARMIA',     BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE CivilizationType = 'CIVILIZATION_ZULU';

INSERT INTO Civilization_FreeTechs
          (CivilizationType,              TechType)
SELECT    'CIVILIZATION_RHO_BJARMIA',     TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_ZULU';

INSERT INTO Civilization_FreeUnits
          (CivilizationType,              UnitClassType, Count, UnitAIType)
SELECT    'CIVILIZATION_RHO_BJARMIA',     UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_ZULU';

INSERT INTO Civilization_Leaders
       (CivilizationType,            LeaderheadType)
VALUES ('CIVILIZATION_RHO_BJARMIA', 'LEADER_RHO_HAREKR');

INSERT INTO Civilization_BuildingClassOverrides
       (CivilizationType,            BuildingClassType,      BuildingType)
VALUES ('CIVILIZATION_RHO_BJARMIA', 'BUILDINGCLASS_TEMPLE', 'BUILDING_RHO_JOMALI');



INSERT INTO Civilization_Religions
       (CivilizationType,            ReligionType)
SELECT    'CIVILIZATION_RHO_BJARMIA',     ReligionType
FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_DENMARK';

INSERT INTO Civilization_SpyNames
          (CivilizationType,                SpyName)
VALUES    ('CIVILIZATION_RHO_BJARMIA',     'TXT_KEY_SPY_NAME_RHO_BJARMIA_0'),
          ('CIVILIZATION_RHO_BJARMIA',     'TXT_KEY_SPY_NAME_RHO_BJARMIA_1'),
          ('CIVILIZATION_RHO_BJARMIA',     'TXT_KEY_SPY_NAME_RHO_BJARMIA_2'),
          ('CIVILIZATION_RHO_BJARMIA',     'TXT_KEY_SPY_NAME_RHO_BJARMIA_3'),
          ('CIVILIZATION_RHO_BJARMIA',     'TXT_KEY_SPY_NAME_RHO_BJARMIA_4'),
          ('CIVILIZATION_RHO_BJARMIA',     'TXT_KEY_SPY_NAME_RHO_BJARMIA_5'),
          ('CIVILIZATION_RHO_BJARMIA',     'TXT_KEY_SPY_NAME_RHO_BJARMIA_6'),
          ('CIVILIZATION_RHO_BJARMIA',     'TXT_KEY_SPY_NAME_RHO_BJARMIA_7'),
          ('CIVILIZATION_RHO_BJARMIA',     'TXT_KEY_SPY_NAME_RHO_BJARMIA_8'),
          ('CIVILIZATION_RHO_BJARMIA',     'TXT_KEY_SPY_NAME_RHO_BJARMIA_9');

INSERT INTO Civilization_Start_Along_Ocean 
		(CivilizationType, 						StartAlongOcean)
VALUES	('CIVILIZATION_RHO_BJARMIA', 		1);

--bg:3c1e3d, icon:bcbed8
INSERT INTO Colors
(Type,                                        Red,     Green,    Blue,     Alpha)
VALUES    ('COLOR_PLAYER_RHO_BJARMIA_ICON',   0.737,   0.745,    0.847,    1),
('COLOR_PLAYER_RHO_BJARMIA_BACKGROUND',       0.235,   0.118,    0.239,    1);

INSERT INTO PlayerColors
          (Type,                              PrimaryColor,                                        SecondaryColor,                   TextColor)
VALUES    ('PLAYERCOLOR_RHO_BJARMIA',        'COLOR_PLAYER_RHO_BJARMIA_ICON',     'COLOR_PLAYER_RHO_BJARMIA_BACKGROUND',     'COLOR_PLAYER_WHITE_TEXT');

INSERT INTO Diplomacy_Responses
		(LeaderType, 					ResponseType, 							 			Response, 														Bias)
VALUES 	('LEADER_RHO_HAREKR',	'RESPONSE_FIRST_GREETING', 			 			'TXT_KEY_LEADER_RHO_HAREKR_FIRSTGREETING%', 			 				500),
('LEADER_RHO_HAREKR',	'RESPONSE_DOW_GENERIC', 			 			'TXT_KEY_LEADER_RHO_HAREKR_DOWGENERIC%', 			 				500),
('LEADER_RHO_HAREKR',	'RESPONSE_ATTACKED_HOSTILE', 			 			'TXT_KEY_LEADER_RHO_HAREKR_ATTACKEDHOSTILE%', 			 				500),
('LEADER_RHO_HAREKR',	'RESPONSE_DEFEATED', 			 			'TXT_KEY_LEADER_RHO_HAREKR_DEFEATED%', 			 				500),
('LEADER_RHO_HAREKR','RESPONSE_WORK_WITH_US',											'TXT_KEY_LEADER_RHO_HAREKR_DEC_FRIENDSHIP%',500),
('LEADER_RHO_HAREKR',	'RESPONSE_LUXURY_TRADE', 			 			'TXT_KEY_LEADER_RHO_HAREKR_LUXURYTRADE%', 			 				500),
('LEADER_RHO_HAREKR','RESPONSE_HOSTILE_AGGRESSIVE_MILITARY_WARNING',					'TXT_KEY_LEADER_RHO_HAREKR_HOSTILE_AGGRESSIVE_MILITARY_WARNING%',500);