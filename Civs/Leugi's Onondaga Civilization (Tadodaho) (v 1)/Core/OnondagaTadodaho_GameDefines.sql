--=======================================================================================================================
-- MASTER TABLES
--=======================================================================================================================
-------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS CustomModOptions(Name Text, Value INTEGER, Class INTEGER, DbUpdates INTEGER);
--=======================================================================================================================	
-- BUILDINGS
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- Buildings
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Buildings 	
		(Type, 							BuildingClass, PrereqTech, Cost, FaithCost, GoldMaintenance, MinAreaSize, ConquestProb, NeverCapture,	Description, 							Help, 										Strategy,										Civilopedia, 								ArtDefineTag, PortraitIndex, IconAtlas)
SELECT	'BUILDING_LEU_WAMPUM_HOUSE',	BuildingClass, PrereqTech, Cost, FaithCost, GoldMaintenance, MinAreaSize, ConquestProb, 1, 				'TXT_KEY_BUILDING_LEU_WAMPUM_HOUSE', 	'TXT_KEY_BUILDING_LEU_WAMPUM_HOUSE_HELP',    'TXT_KEY_BUILDING_LEU_WAMPUM_HOUSE_STRATEGY',	'TXT_KEY_BUILDING_LEU_WAMPUM_HOUSE_TEXT',	ArtDefineTag, 3, 			 'LEU_ONONDAGA_TADODAHO_ICON_ATLAS'
FROM Buildings WHERE Type = 'BUILDING_TEMPLE';	
------------------------------------------------------------------------------------------------------------------------	
-- Building_YieldModifiers
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_YieldChanges 	
		(BuildingType, 					YieldType, 	Yield)
SELECT	'BUILDING_LEU_WAMPUM_HOUSE',	YieldType, 	Yield
FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_TEMPLE';
------------------------------------------------------------------------------------------------------------------------	
-- Building_Flavors
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_Flavors 	
		(BuildingType, 					FlavorType, Flavor)
SELECT	'BUILDING_LEU_WAMPUM_HOUSE',	FlavorType, Flavor
FROM Building_Flavors WHERE BuildingType = 'BUILDING_TEMPLE';
------------------------------------------------------------------------------------------------------------------------
-- BuildingClasses
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO BuildingClasses 	
		(Type, 						 				DefaultBuilding, 					Description)
VALUES	('BUILDINGCLASS_DUMMY_LEU_WAMPUM_HOUSE',	'BUILDING_DUMMY_LEU_WAMPUM_HOUSE',	'TXT_KEY_BUILDING_LEU_WAMPUM_HOUSE_ALLY');
------------------------------------------------------------------------------------------------------------------------	
-- Buildings
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Buildings 	
		(Type, 									 BuildingClass, 							GoldenAgeModifier,	GreatWorkCount, Cost,	FaithCost,	PrereqTech,	NeverCapture,	Description)
VALUES	('BUILDING_DUMMY_LEU_WAMPUM_HOUSE_1',	 'BUILDINGCLASS_DUMMY_LEU_WAMPUM_HOUSE',	0,					-1, 			-1,		-1, 		null,		1,				'TXT_KEY_BUILDING_LEU_WAMPUM_HOUSE_ALLY'),
		('BUILDING_DUMMY_LEU_WAMPUM_HOUSE_2',	 'BUILDINGCLASS_DUMMY_LEU_WAMPUM_HOUSE',	25,					-1, 			-1,		-1, 		null,		1,				'TXT_KEY_BUILDING_LEU_WAMPUM_HOUSE_ALL_WAMPUM');
------------------------------------------------------------------------------------------------------------------------								
-- Building_BuildingClassYieldChanges																																	
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Building_BuildingClassYieldChanges
		(BuildingType,								BuildingClassType,		 YieldType,			YieldChange)
VALUES	('BUILDING_DUMMY_LEU_WAMPUM_HOUSE_1',		'BUILDINGCLASS_TEMPLE',	 'YIELD_FAITH',		1),
		('BUILDING_DUMMY_LEU_WAMPUM_HOUSE_1',		'BUILDINGCLASS_TEMPLE',	 'YIELD_CULTURE',	1);
--==========================================================================================================================
--==========================================================================================================================
------------------------------------------------------------------------------------------------------------------------
-- UnitPromotions
------------------------------------------------------------------------------------------------------------------------
INSERT INTO UnitPromotions 
		(Type, 							TradeMissionGoldModifier,	TradeMissionInfluenceModifier,	LostWithUpgrade,	Description, 						Help, 										Sound, 				CannotBeChosen,  PortraitIndex, 	IconAtlas, 			PediaType, 				PediaEntry)
VALUES	('PROMOTION_LEU_FIREKEEPER', 	-100,						0,								1, 					'TXT_KEY_PROMOTION_LEU_FIREKEEPER',	'TXT_KEY_PROMOTION_LEU_FIREKEEPER_HELP',	'AS2D_IF_LEVELUP', 	1, 				 59, 				'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES',		'TXT_KEY_PROMOTION_LEU_FIREKEEPER');
------------------------------------------------------------------------------------------------------------------------
-- Units
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Units 	
		(Type, 					BaseGold, NumGoldPerEra,	ShowInPedia, Class, Cost, Moves, FaithCost,	Capture, CivilianAttackPriority, Special, Domain, DefaultUnitAI, Description, 						Help, 									Strategy,									Civilopedia, 							AdvancedStartCost,	WorkRate, CombatLimit, DontShowYields, UnitArtInfoEraVariation, UnitArtInfo, 					 UnitFlagIconOffset,	UnitFlagAtlas,								MoveRate, PortraitIndex, 	IconAtlas)
SELECT	'UNIT_LEU_FIREKEEPER',	300,	  100,				ShowInPedia, Class, Cost, Moves, FaithCost, Capture, CivilianAttackPriority, Special, Domain, DefaultUnitAI, 'TXT_KEY_UNIT_LEU_FIREKEEPER',		'TXT_KEY_UNIT_LEU_FIREKEEPER_HELP', 	'TXT_KEY_UNIT_LEU_FIREKEEPER_STRATEGY',		'TXT_KEY_UNIT_LEU_FIREKEEPER_TEXT', 	AdvancedStartCost, 	WorkRate, CombatLimit, DontShowYields, 0,						'ART_DEF_UNIT_LEU_FIREKEEPER',   0,						'LEU_ONONDAGA_TADODAHO_UNIT_FLAG_ATLAS',	MoveRate, 2, 				'LEU_ONONDAGA_TADODAHO_ICON_ATLAS'
FROM Units WHERE Type = 'UNIT_GREAT_GENERAL';	
------------------------------------------------------------------------------------------------------------------------		
-- Unit_AITypes
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Unit_AITypes 	
		(UnitType, 				UnitAIType)
SELECT	'UNIT_LEU_FIREKEEPER',	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_GREAT_GENERAL';
------------------------------------------------------------------------------------------------------------------------	
-- Unit_ClassUpgrades
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 				UnitClassType)
SELECT	'UNIT_LEU_FIREKEEPER',	UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_GREAT_GENERAL';	
------------------------------------------------------------------------------------------------------------------------	
-- Unit_Builds
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Unit_Builds 	
		(UnitType, 				BuildType)
SELECT	'UNIT_LEU_FIREKEEPER',	BuildType
FROM Unit_Builds WHERE UnitType = 'UNIT_GREAT_GENERAL';
------------------------------------------------------------------------------------------------------------------------	
-- Unit_Flavors
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Unit_Flavors 	
		(UnitType, 				FlavorType, Flavor)
SELECT	'UNIT_LEU_FIREKEEPER',	FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_GREAT_GENERAL';
------------------------------------------------------------------------------------------------------------------------	
-- Unit_FreePromotions
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Unit_FreePromotions 	
		(UnitType, 				PromotionType)
SELECT	'UNIT_LEU_FIREKEEPER',	PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_GREAT_GENERAL';

INSERT INTO Unit_FreePromotions 	
		(UnitType, 				PromotionType)
VALUES	('UNIT_LEU_FIREKEEPER', 'PROMOTION_LEU_FIREKEEPER');
------------------------------------------------------------------------------------------------------------------------	
-- UnitGameplay2DScripts
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 				SelectionSound,	FirstSelectionSound)
SELECT	'UNIT_LEU_FIREKEEPER',	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_GREAT_GENERAL';
--=======================================================================================================================	
-- LEADERS
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- Leaders
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Leaders 
		(Type, 									ArtDefineTag, 							Description, 									Civilopedia, 										CivilopediaTag, 											IconAtlas, 									PortraitIndex)
VALUES	('LEADER_LEU_ONONDAGA_TADODAHO', 	'Tadodaho_Scene.xml',	'TXT_KEY_LEADER_LEU_ONONDAGA_TADODAHO',	'TXT_KEY_LEADER_LEU_ONONDAGA_TADODAHO_PEDIA', 'TXT_KEY_CIVILOPEDIA_LEADERS_LEU_ONONDAGA_TADODAHO',	'LEU_ONONDAGA_TADODAHO_ICON_ATLAS', 	1);

UPDATE Leaders
SET VictoryCompetitiveness = 8,
WonderCompetitiveness = 2,
MinorCivCompetitiveness = 9,
Boldness = 10,
DiploBalance = 8,
WarmongerHate = 1,
DenounceWillingness = 1,
DoFWillingness = 4,
Loyalty = 10,
Neediness = 1,
Forgiveness = 10,
Chattiness = 9,
Meanness = 10
WHERE Type = 'LEADER_LEU_ONONDAGA_TADODAHO';
------------------------------------------------------------------------------------------------------------------------		
-- Leader_MajorCivApproachBiases
------------------------------------------------------------------------------------------------------------------------						
INSERT INTO Leader_MajorCivApproachBiases 
        (LeaderType,                             MajorCivApproachType,                 Bias)
VALUES  ('LEADER_LEU_ONONDAGA_TADODAHO',    'MAJOR_CIV_APPROACH_WAR',             5),
        ('LEADER_LEU_ONONDAGA_TADODAHO',    'MAJOR_CIV_APPROACH_HOSTILE',         9),
        ('LEADER_LEU_ONONDAGA_TADODAHO',    'MAJOR_CIV_APPROACH_DECEPTIVE',       1),
        ('LEADER_LEU_ONONDAGA_TADODAHO',    'MAJOR_CIV_APPROACH_GUARDED',         9),
        ('LEADER_LEU_ONONDAGA_TADODAHO',    'MAJOR_CIV_APPROACH_AFRAID',          0),
        ('LEADER_LEU_ONONDAGA_TADODAHO',    'MAJOR_CIV_APPROACH_FRIENDLY',        5),
        ('LEADER_LEU_ONONDAGA_TADODAHO',    'MAJOR_CIV_APPROACH_NEUTRAL',         0);
------------------------------------------------------------------------------------------------------------------------	
-- Leader_MajorCivApproachBiases
------------------------------------------------------------------------------------------------------------------------							
INSERT INTO Leader_MinorCivApproachBiases 
        (LeaderType,                             MinorCivApproachType,                 Bias)
VALUES  ('LEADER_LEU_ONONDAGA_TADODAHO',    'MINOR_CIV_APPROACH_IGNORE',          1),
        ('LEADER_LEU_ONONDAGA_TADODAHO',    'MINOR_CIV_APPROACH_FRIENDLY',        9),
        ('LEADER_LEU_ONONDAGA_TADODAHO',    'MINOR_CIV_APPROACH_PROTECTIVE',      9),
        ('LEADER_LEU_ONONDAGA_TADODAHO',    'MINOR_CIV_APPROACH_CONQUEST',        1),
        ('LEADER_LEU_ONONDAGA_TADODAHO',    'MINOR_CIV_APPROACH_BULLY',           10);
------------------------------------------------------------------------------------------------------------------------	
-- Leader_Flavors
------------------------------------------------------------------------------------------------------------------------							
INSERT INTO Leader_Flavors 
        (LeaderType,                             FlavorType,                           Flavor)
VALUES  ('LEADER_LEU_ONONDAGA_TADODAHO',    'FLAVOR_OFFENSE',                     1),
        ('LEADER_LEU_ONONDAGA_TADODAHO',    'FLAVOR_DEFENSE',                     9),
        ('LEADER_LEU_ONONDAGA_TADODAHO',    'FLAVOR_CITY_DEFENSE',                7),
        ('LEADER_LEU_ONONDAGA_TADODAHO',    'FLAVOR_MILITARY_TRAINING',           9),
        ('LEADER_LEU_ONONDAGA_TADODAHO',    'FLAVOR_RECON',                       5),
        ('LEADER_LEU_ONONDAGA_TADODAHO',    'FLAVOR_RANGED',                      1),
        ('LEADER_LEU_ONONDAGA_TADODAHO',    'FLAVOR_MOBILE',                      9),
        ('LEADER_LEU_ONONDAGA_TADODAHO',    'FLAVOR_NAVAL',                       1),
        ('LEADER_LEU_ONONDAGA_TADODAHO',    'FLAVOR_NAVAL_RECON',                 1),
        ('LEADER_LEU_ONONDAGA_TADODAHO',    'FLAVOR_NAVAL_GROWTH',                1),
        ('LEADER_LEU_ONONDAGA_TADODAHO',    'FLAVOR_NAVAL_TILE_IMPROVEMENT',      5),
        ('LEADER_LEU_ONONDAGA_TADODAHO',    'FLAVOR_AIR',                         1),
        ('LEADER_LEU_ONONDAGA_TADODAHO',    'FLAVOR_EXPANSION',                   5),
        ('LEADER_LEU_ONONDAGA_TADODAHO',    'FLAVOR_GROWTH',                      8),
        ('LEADER_LEU_ONONDAGA_TADODAHO',    'FLAVOR_TILE_IMPROVEMENT',            7),
        ('LEADER_LEU_ONONDAGA_TADODAHO',    'FLAVOR_INFRASTRUCTURE',              5),
        ('LEADER_LEU_ONONDAGA_TADODAHO',    'FLAVOR_PRODUCTION',                  7),
        ('LEADER_LEU_ONONDAGA_TADODAHO',    'FLAVOR_GOLD',                        3),
        ('LEADER_LEU_ONONDAGA_TADODAHO',    'FLAVOR_SCIENCE',                     3),
		('LEADER_LEU_ONONDAGA_TADODAHO',    'FLAVOR_CULTURE',                     9),
        ('LEADER_LEU_ONONDAGA_TADODAHO',    'FLAVOR_HAPPINESS',                   7),
        ('LEADER_LEU_ONONDAGA_TADODAHO',    'FLAVOR_GREAT_PEOPLE',                5),
        ('LEADER_LEU_ONONDAGA_TADODAHO',    'FLAVOR_WONDER',                      3),
        ('LEADER_LEU_ONONDAGA_TADODAHO',    'FLAVOR_RELIGION',                    9),
        ('LEADER_LEU_ONONDAGA_TADODAHO',    'FLAVOR_DIPLOMACY',                   9),
        ('LEADER_LEU_ONONDAGA_TADODAHO',    'FLAVOR_SPACESHIP',                   2),
        ('LEADER_LEU_ONONDAGA_TADODAHO',    'FLAVOR_WATER_CONNECTION',            3),
        ('LEADER_LEU_ONONDAGA_TADODAHO',    'FLAVOR_NUKE',                        10),
        ('LEADER_LEU_ONONDAGA_TADODAHO',    'FLAVOR_USE_NUKE',                    10),
        ('LEADER_LEU_ONONDAGA_TADODAHO',    'FLAVOR_ESPIONAGE',                   9),
        ('LEADER_LEU_ONONDAGA_TADODAHO',    'FLAVOR_AIRLIFT',                     1),
        ('LEADER_LEU_ONONDAGA_TADODAHO',    'FLAVOR_I_TRADE_DESTINATION',         5),
        ('LEADER_LEU_ONONDAGA_TADODAHO',    'FLAVOR_I_TRADE_ORIGIN',              5),
        ('LEADER_LEU_ONONDAGA_TADODAHO',    'FLAVOR_I_SEA_TRADE_ROUTE',           5),
        ('LEADER_LEU_ONONDAGA_TADODAHO',    'FLAVOR_I_LAND_TRADE_ROUTE',          7),
        ('LEADER_LEU_ONONDAGA_TADODAHO',    'FLAVOR_ARCHAEOLOGY',                 4),
        ('LEADER_LEU_ONONDAGA_TADODAHO',    'FLAVOR_AIR_CARRIER',                 3);
--------------------------------------------------------------------------------------------------------------------------
-- Diplomacy_Responses
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Diplomacy_Responses
		(LeaderType, 						ResponseType, 										Response, 																Bias)
VALUES 	('LEADER_LEU_ONONDAGA_TADODAHO',	'RESPONSE_DEFEATED', 								'TXT_KEY_LEADER_LEU_ONONDAGA_TADODAHO_DEFEATED%', 						500),
		('LEADER_LEU_ONONDAGA_TADODAHO',	'RESPONSE_FIRST_GREETING', 							'TXT_KEY_LEADER_LEU_ONONDAGA_TADODAHO_FIRSTGREETING%', 					500),
		--Other Dialogues because I'm obsessive with personality
		--ATTACKED
		('LEADER_LEU_ONONDAGA_TADODAHO',	'RESPONSE_ATTACKED_HOSTILE', 						'TXT_KEY_LEADER_LEU_ONONDAGA_TADODAHO_ATTACKED_HOSTILE%',			500),
		('LEADER_LEU_ONONDAGA_TADODAHO',	'RESPONSE_ATTACKED_WEAK_HOSTILE',					'TXT_KEY_LEADER_LEU_ONONDAGA_TADODAHO_ATTACKED_HOSTILE%',			500),
		('LEADER_LEU_ONONDAGA_TADODAHO',	'RESPONSE_ATTACKED_STRONG_HOSTILE',					'TXT_KEY_LEADER_LEU_ONONDAGA_TADODAHO_ATTACKED_HOSTILE%',			500),
		('LEADER_LEU_ONONDAGA_TADODAHO',	'RESPONSE_ATTACKED_EXCITED',						'TXT_KEY_LEADER_LEU_ONONDAGA_TADODAHO_ATTACKED_EXCITED%',			500),
		('LEADER_LEU_ONONDAGA_TADODAHO',	'RESPONSE_ATTACKED_WEAK_EXCITED', 					'TXT_KEY_LEADER_LEU_ONONDAGA_TADODAHO_ATTACKED_EXCITED%',			500),
		('LEADER_LEU_ONONDAGA_TADODAHO',	'RESPONSE_ATTACKED_STRONG_EXCITED',					'TXT_KEY_LEADER_LEU_ONONDAGA_TADODAHO_ATTACKED_EXCITED%',			500),
		('LEADER_LEU_ONONDAGA_TADODAHO',	'RESPONSE_ATTACKED_SAD', 							'TXT_KEY_LEADER_LEU_ONONDAGA_TADODAHO_ATTACKED_BETRAYAL%',			500),
		('LEADER_LEU_ONONDAGA_TADODAHO',	'RESPONSE_ATTACKED_BETRAYED', 						'TXT_KEY_LEADER_LEU_ONONDAGA_TADODAHO_ATTACKED_BETRAYAL%',			500),
		('LEADER_LEU_ONONDAGA_TADODAHO',	'RESPONSE_ATTACKED_MILITARY_PROMISE_BROKEN', 		'TXT_KEY_LEADER_LEU_ONONDAGA_TADODAHO_ATTACKED_BETRAYAL%',			500),
		--Declare War
		('LEADER_LEU_ONONDAGA_TADODAHO',	'RESPONSE_DOW_LAND', 				'TXT_KEY_LEADER_LEU_ONONDAGA_TADODAHO_DECLAREWAR_CONQUEST%',			500),
		('LEADER_LEU_ONONDAGA_TADODAHO',	'RESPONSE_DOW_WORLD_CONQUEST', 		'TXT_KEY_LEADER_LEU_ONONDAGA_TADODAHO_DECLAREWAR_CONQUEST%',			500),
		('LEADER_LEU_ONONDAGA_TADODAHO',	'RESPONSE_DOW_OPPORTUNITY', 		'TXT_KEY_LEADER_LEU_ONONDAGA_TADODAHO_DECLAREWAR_CONQUEST%',			500),
		('LEADER_LEU_ONONDAGA_TADODAHO',	'RESPONSE_DOW_DESPERATE', 			'TXT_KEY_LEADER_LEU_ONONDAGA_TADODAHO_DECLAREWAR_NOCHOICE%',			500),
		('LEADER_LEU_ONONDAGA_TADODAHO',	'RESPONSE_DOW_BETRAYAL',			'TXT_KEY_LEADER_LEU_ONONDAGA_TADODAHO_DECLAREWAR_BETRAYAL%',			500),
		('LEADER_LEU_ONONDAGA_TADODAHO',	'RESPONSE_DOW_WEAK_BETRAYAL', 		'TXT_KEY_LEADER_LEU_ONONDAGA_TADODAHO_DECLAREWAR_BETRAYAL%',			500),
		('LEADER_LEU_ONONDAGA_TADODAHO',	'RESPONSE_DOW_REGRET', 				'TXT_KEY_LEADER_LEU_ONONDAGA_TADODAHO_DECLAREWAR_NOCHOICE%',			500),
		--Wants Peace
		('LEADER_LEU_ONONDAGA_TADODAHO',	'RESPONSE_GREETING_AT_WAR_WANTS_PEACE', 	'TXT_KEY_LEADER_LEU_ONONDAGA_TADODAHO_WANTS_PEACE_1%',			500);
------------------------------------------------------------------------------------------------------------------------	
-- Leader_Traits
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Leader_Traits 
		(LeaderType, 						TraitType)
VALUES	('LEADER_LEU_ONONDAGA_TADODAHO', 	'TRAIT_LEU_ONONDAGA_TADODAHO');
------------------------------------------------------------------------------------------------------------------------
-- Traits
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Traits 
		(Type, 									Description, 							ShortDescription)
VALUES	('TRAIT_LEU_ONONDAGA_TADODAHO', 		'TXT_KEY_TRAIT_LEU_ONONDAGA_TADODAHO',	'TXT_KEY_TRAIT_LEU_ONONDAGA_TADODAHO_SHORT');
--------------------------------------------------------------------------------------------------------------------------
-- UnitPromotions
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO UnitPromotions 
		(Type, 									ExperiencePercent,	LostWithUpgrade,	Description, 									Help, 													Sound, 				CannotBeChosen,  PortraitIndex, 	IconAtlas, 			PediaType, 				PediaEntry)
VALUES	('PROMOTION_LEU_ONONDAGA_TADODAHO', 	10,					0, 					'TXT_KEY_PROMOTION_LEU_ONONDAGA_TADODAHO',		'TXT_KEY_PROMOTION_LEU_ONONDAGA_TADODAHO_HELP',			'AS2D_IF_LEVELUP', 	1, 				 0, 				'EXPANSION2_PROMOTION_ATLAS', 	'PEDIA_ATTRIBUTES',		'TXT_KEY_PROMOTION_LEU_ONONDAGA_TADODAHO'),
		('PROMOTION_LEU_ONONDAGA_TADODAHO_A', 	25,					0, 					'TXT_KEY_PROMOTION_LEU_ONONDAGA_TADODAHO_A',	'TXT_KEY_PROMOTION_LEU_ONONDAGA_TADODAHO_A_HELP',		'AS2D_IF_LEVELUP', 	1, 				 0, 				'EXPANSION2_PROMOTION_ATLAS', 	'PEDIA_ATTRIBUTES',		'TXT_KEY_PROMOTION_LEU_ONONDAGA_TADODAHO');
------------------------------------------------------------------------------------------------------------------------	
-- JFD_Civilopedia_HideFromPedia
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS JFD_Civilopedia_HideFromPedia (Type text default null);
INSERT INTO JFD_Civilopedia_HideFromPedia
		(Type)
VALUES	('PROMOTION_LEU_ONONDAGA_TADODAHO');
--------------------------------------------------------------------------------------------------------------------------
-- UnitPromotions_Terrains
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO UnitPromotions_Terrains 	
		(PromotionType, 						TerrainType,		Attack, Defense)
VALUES	('PROMOTION_LEU_ONONDAGA_TADODAHO',		'TERRAIN_HILL',		15,		15),
		('PROMOTION_LEU_ONONDAGA_TADODAHO_A',	'TERRAIN_HILL',		15,		15);
------------------------------------------------------------------------------------------------------------------------
-- UnitPromotions_UnitCombats
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO UnitPromotions_UnitCombats 
		(PromotionType, 						UnitCombatType)
VALUES	('PROMOTION_LEU_ONONDAGA_TADODAHO', 	'UNITCOMBAT_MELEE');
------------------------------------------------------------------------------------------------------------------------
-- Trait_FreePromotionUnitCombats
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Trait_FreePromotionUnitCombats 	
		(TraitType, 						UnitCombatType,			PromotionType)
VALUES	('TRAIT_LEU_ONONDAGA_TADODAHO',		'UNITCOMBAT_MELEE',		'PROMOTION_LEU_ONONDAGA_TADODAHO');
------------------------------------------------------------------------------------------------------------------------
-- BuildingClasses
------------------------------------------------------------------------------------------------------------------------	
--INSERT INTO BuildingClasses 	
--		(Type, 						 						DefaultBuilding, 							Description)
--VALUES	('BUILDINGCLASS_DUMMY_TRANQ_LESOTHO_MOSHOESHOE',	'BUILDING_DUMMY_TRANQ_LESOTHO_MOSHOESHOE',	'TXT_KEY_BUILDING_DUMMY_TRANQ_LESOTHO_MOSHOESHOE');
------------------------------------------------------------------------------------------------------------------------	
-- Buildings
------------------------------------------------------------------------------------------------------------------------		
--INSERT INTO Buildings 	
--		(Type, 												BuildingClass, 									GreatWorkCount, Cost,	FaithCost,	PrereqTech,	NeverCapture,	ConquestProb,	Description, 												Help)
--VALUES	('BUILDING_DUMMY_TRANQ_LESOTHO_MOSHOESHOE_PROD',	'BUILDINGCLASS_DUMMY_TRANQ_LESOTHO_MOSHOESHOE',	-1, 			-1,		-1, 		null,		1,				0,				'TXT_KEY_BUILDING_DUMMY_TRANQ_LESOTHO_MOSHOESHOE_PROD', 	'TXT_KEY_BUILDING_DUMMY_TRANQ_LESOTHO_MOSHOESHOE_ARTIST_HELP'),
--		('BUILDING_DUMMY_TRANQ_LESOTHO_MOSHOESHOE_SCI',		'BUILDINGCLASS_DUMMY_TRANQ_LESOTHO_MOSHOESHOE',	-1, 			-1,		-1, 		null,		1,				0,				'TXT_KEY_BUILDING_DUMMY_TRANQ_LESOTHO_MOSHOESHOE_SCI',		'TXT_KEY_BUILDING_DUMMY_TRANQ_LESOTHO_MOSHOESHOE_ARTIST_HELP');

--UPDATE Buildings
--SET BuildingProductionModifier = 5
--WHERE Type IN ('BUILDING_DUMMY_TRANQ_LESOTHO_MOSHOESHOE_PROD');
------------------------------------------------------------------------------------------------------------------------								
-- Building_YieldChanges																																	
------------------------------------------------------------------------------------------------------------------------		
--INSERT INTO Building_YieldModifiers
--		(BuildingType, 									YieldType,			Yield)
--VALUES	('BUILDING_DUMMY_TRANQ_LESOTHO_MOSHOESHOE_SCI',	'YIELD_SCIENCE',  	5);
--=======================================================================================================================	
-- CIVILIZATIONS
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- Civilizations
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilizations 	
		(Type, 									SoundtrackTag,  MapImage, 				DawnOfManQuote, 								DawnOfManImage,		Description,								ShortDescription,								Adjective,										Civilopedia,												CivilopediaTag,										 DefaultPlayerColor,					 ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas,								PortraitIndex,	AlphaIconAtlas)
SELECT	'CIVILIZATION_LEU_ONONDAGA_TADODAHO',	'Iroquois', 	'OnondagaMapSmall.dds',	'TXT_KEY_CIV_DAWN_LEU_ONONDAGA_TADODAHO_TEXT',	'TADODADOM.dds',	'TXT_KEY_CIV_LEU_ONONDAGA_TADODAHO_DESC', 	'TXT_KEY_CIV_LEU_ONONDAGA_TADODAHO_SHORT_DESC',	'TXT_KEY_CIV_LEU_ONONDAGA_TADODAHO_ADJECTIVE',	'TXT_KEY_CIVILOPEDIA_CIVS_LEU_ONONDAGA_TADODAHO_TEXT_1',	'TXT_KEY_CIVILOPEDIA_CIVS_LEU_ONONDAGA_TADODAHO',	 'PLAYERCOLOR_LEU_ONONDAGA_TADODAHO',	 ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, 'LEU_ONONDAGA_TADODAHO_ICON_ATLAS',	0,				'LEU_ONONDAGA_TADODAHO_ALPHA_ATLAS'
FROM Civilizations WHERE Type = 'CIVILIZATION_IROQUOIS';
------------------------------------------------------------------------------------------------------------------------
-- Civilization_Start_Region_Priority
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_Start_Region_Priority
		(CivilizationType,						RegionType)
VALUES	('CIVILIZATION_LEU_ONONDAGA_TADODAHO',	'REGION_HILLS');

------------------------------------------------------------------------------------------------------------------------	
-- Civilization_CityNames
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilization_CityNames 
		(CivilizationType, 							CityName)
VALUES	('CIVILIZATION_LEU_ONONDAGA_TADODAHO',	'TXT_KEY_CITY_NAME_LEU_ONONDAGA_TADODAHO_01'),
		('CIVILIZATION_LEU_ONONDAGA_TADODAHO',	'TXT_KEY_CITY_NAME_LEU_ONONDAGA_TADODAHO_02'),
		('CIVILIZATION_LEU_ONONDAGA_TADODAHO',	'TXT_KEY_CITY_NAME_LEU_ONONDAGA_TADODAHO_03'),
		('CIVILIZATION_LEU_ONONDAGA_TADODAHO',	'TXT_KEY_CITY_NAME_LEU_ONONDAGA_TADODAHO_04'),
		('CIVILIZATION_LEU_ONONDAGA_TADODAHO',	'TXT_KEY_CITY_NAME_LEU_ONONDAGA_TADODAHO_05'),
		('CIVILIZATION_LEU_ONONDAGA_TADODAHO',	'TXT_KEY_CITY_NAME_LEU_ONONDAGA_TADODAHO_06'),
		('CIVILIZATION_LEU_ONONDAGA_TADODAHO',	'TXT_KEY_CITY_NAME_LEU_ONONDAGA_TADODAHO_07'),
		('CIVILIZATION_LEU_ONONDAGA_TADODAHO',	'TXT_KEY_CITY_NAME_LEU_ONONDAGA_TADODAHO_08'),
		('CIVILIZATION_LEU_ONONDAGA_TADODAHO',	'TXT_KEY_CITY_NAME_LEU_ONONDAGA_TADODAHO_09'),
		('CIVILIZATION_LEU_ONONDAGA_TADODAHO',	'TXT_KEY_CITY_NAME_LEU_ONONDAGA_TADODAHO_10'),
		('CIVILIZATION_LEU_ONONDAGA_TADODAHO',	'TXT_KEY_CITY_NAME_LEU_ONONDAGA_TADODAHO_11'),
		('CIVILIZATION_LEU_ONONDAGA_TADODAHO',	'TXT_KEY_CITY_NAME_LEU_ONONDAGA_TADODAHO_12'),
		('CIVILIZATION_LEU_ONONDAGA_TADODAHO',	'TXT_KEY_CITY_NAME_LEU_ONONDAGA_TADODAHO_13'),
		('CIVILIZATION_LEU_ONONDAGA_TADODAHO',	'TXT_KEY_CITY_NAME_LEU_ONONDAGA_TADODAHO_14'),
		('CIVILIZATION_LEU_ONONDAGA_TADODAHO',	'TXT_KEY_CITY_NAME_LEU_ONONDAGA_TADODAHO_15'),
		('CIVILIZATION_LEU_ONONDAGA_TADODAHO',	'TXT_KEY_CITY_NAME_LEU_ONONDAGA_TADODAHO_16'),
		('CIVILIZATION_LEU_ONONDAGA_TADODAHO',	'TXT_KEY_CITY_NAME_LEU_ONONDAGA_TADODAHO_17'),
		('CIVILIZATION_LEU_ONONDAGA_TADODAHO',	'TXT_KEY_CITY_NAME_LEU_ONONDAGA_TADODAHO_18'),
		('CIVILIZATION_LEU_ONONDAGA_TADODAHO',	'TXT_KEY_CITY_NAME_LEU_ONONDAGA_TADODAHO_19'),
		('CIVILIZATION_LEU_ONONDAGA_TADODAHO',	'TXT_KEY_CITY_NAME_LEU_ONONDAGA_TADODAHO_20'),
		('CIVILIZATION_LEU_ONONDAGA_TADODAHO',	'TXT_KEY_CITY_NAME_LEU_ONONDAGA_TADODAHO_21'),
		('CIVILIZATION_LEU_ONONDAGA_TADODAHO',	'TXT_KEY_CITY_NAME_LEU_ONONDAGA_TADODAHO_22'),
		('CIVILIZATION_LEU_ONONDAGA_TADODAHO',	'TXT_KEY_CITY_NAME_LEU_ONONDAGA_TADODAHO_23'),
		('CIVILIZATION_LEU_ONONDAGA_TADODAHO',	'TXT_KEY_CITY_NAME_LEU_ONONDAGA_TADODAHO_24'),
		('CIVILIZATION_LEU_ONONDAGA_TADODAHO',	'TXT_KEY_CITY_NAME_LEU_ONONDAGA_TADODAHO_25'),
		('CIVILIZATION_LEU_ONONDAGA_TADODAHO',	'TXT_KEY_CITY_NAME_LEU_ONONDAGA_TADODAHO_26'),
		('CIVILIZATION_LEU_ONONDAGA_TADODAHO',	'TXT_KEY_CITY_NAME_LEU_ONONDAGA_TADODAHO_27'),
		('CIVILIZATION_LEU_ONONDAGA_TADODAHO',	'TXT_KEY_CITY_NAME_LEU_ONONDAGA_TADODAHO_28'),
		('CIVILIZATION_LEU_ONONDAGA_TADODAHO',	'TXT_KEY_CITY_NAME_LEU_ONONDAGA_TADODAHO_29'),
		('CIVILIZATION_LEU_ONONDAGA_TADODAHO',	'TXT_KEY_CITY_NAME_LEU_ONONDAGA_TADODAHO_30'),
		('CIVILIZATION_LEU_ONONDAGA_TADODAHO',	'TXT_KEY_CITY_NAME_LEU_ONONDAGA_TADODAHO_31');
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_FreeBuildingClasses
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Civilization_FreeBuildingClasses 
		(CivilizationType, 						BuildingClassType)
SELECT	'CIVILIZATION_LEU_ONONDAGA_TADODAHO', 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE CivilizationType = 'CIVILIZATION_IROQUOIS';
------------------------------------------------------------------------------------------------------------------------		
-- Civilization_FreeTechs
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Civilization_FreeTechs 
		(CivilizationType, 						TechType)
SELECT	'CIVILIZATION_LEU_ONONDAGA_TADODAHO', 	TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_IROQUOIS';
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_FreeUnits
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_FreeUnits 
		(CivilizationType, 						UnitClassType, Count, UnitAIType)
SELECT	'CIVILIZATION_LEU_ONONDAGA_TADODAHO', 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_IROQUOIS';
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_Leaders
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_Leaders 
		(CivilizationType, 						LeaderheadType)
VALUES	('CIVILIZATION_LEU_ONONDAGA_TADODAHO',	'LEADER_LEU_ONONDAGA_TADODAHO');
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_BuildingClassOverrides 
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_BuildingClassOverrides 
		(CivilizationType, 						BuildingClassType, 				BuildingType)
VALUES	('CIVILIZATION_LEU_ONONDAGA_TADODAHO',	'BUILDINGCLASS_TEMPLE',			'BUILDING_LEU_WAMPUM_HOUSE');
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_UnitClassOverrides 
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_UnitClassOverrides 
		(CivilizationType, 						UnitClassType, 					UnitType)
VALUES	('CIVILIZATION_LEU_ONONDAGA_TADODAHO',	'UNITCLASS_GREAT_GENERAL',		'UNIT_LEU_FIREKEEPER');
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_Religions
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Civilization_Religions 
		(CivilizationType, 						ReligionType)
VALUES	('CIVILIZATION_LEU_ONONDAGA_TADODAHO',	'RELIGION_PROTESTANTISM');
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_SpyNames
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilization_SpyNames 
		(CivilizationType, 						SpyName)
VALUES	('CIVILIZATION_LEU_ONONDAGA_TADODAHO',	'TXT_KEY_SPY_NAME_LEU_ONONDAGA_TADODAHO_0'),
		('CIVILIZATION_LEU_ONONDAGA_TADODAHO',	'TXT_KEY_SPY_NAME_LEU_ONONDAGA_TADODAHO_1'),
		('CIVILIZATION_LEU_ONONDAGA_TADODAHO',	'TXT_KEY_SPY_NAME_LEU_ONONDAGA_TADODAHO_2'),
		('CIVILIZATION_LEU_ONONDAGA_TADODAHO',	'TXT_KEY_SPY_NAME_LEU_ONONDAGA_TADODAHO_3'),
		('CIVILIZATION_LEU_ONONDAGA_TADODAHO',	'TXT_KEY_SPY_NAME_LEU_ONONDAGA_TADODAHO_4'),
		('CIVILIZATION_LEU_ONONDAGA_TADODAHO',	'TXT_KEY_SPY_NAME_LEU_ONONDAGA_TADODAHO_5'),
		('CIVILIZATION_LEU_ONONDAGA_TADODAHO',	'TXT_KEY_SPY_NAME_LEU_ONONDAGA_TADODAHO_6'),
		('CIVILIZATION_LEU_ONONDAGA_TADODAHO',	'TXT_KEY_SPY_NAME_LEU_ONONDAGA_TADODAHO_7'),
		('CIVILIZATION_LEU_ONONDAGA_TADODAHO',	'TXT_KEY_SPY_NAME_LEU_ONONDAGA_TADODAHO_8'),
		('CIVILIZATION_LEU_ONONDAGA_TADODAHO',	'TXT_KEY_SPY_NAME_LEU_ONONDAGA_TADODAHO_9');
--=======================================================================================================================
--=======================================================================================================================