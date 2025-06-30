--=======================================================================================================================
-- MASTER TABLES
--=======================================================================================================================
-------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS CustomModOptions(Name Text, Value INTEGER, Class INTEGER, DbUpdates INTEGER);
--=======================================================================================================================	
-- IMPROVEMENTS
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------
-- Improvements
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Improvements
		(Type,						Water,	RequiresXAdjacentLand,	SpecificCivRequired,	UpgradeTime,	CivilizationType,			GoldMaintenance,	NoTwoAdjacent,	Description,							Civilopedia,								ArtDefineTag,						BuildableOnResources,	DestroyedWhenPillaged,	PillageGold,	PortraitIndex,	IconAtlas)
VALUES	('IMPROVEMENT_NC_BARANGAY',	1,		1,						1,						50,				'CIVILIZATION_NC_CEBU',		0,					1,				'TXT_KEY_IMPROVEMENT_NC_BARANGAY',		'TXT_KEY_IMPROVEMENT_NC_BARANGAY_TEXT',		'ART_DEF_IMPROVEMENT_NC_BARANGAY', 	0,						1,						2,			3,				'NC_CEBU_ICON_ATLAS');
------------------------------------------------------------------------------------------------------------------------
-- Improvement_ValidTerrains
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Improvement_ValidTerrains
			(ImprovementType,				TerrainType)
VALUES		('IMPROVEMENT_NC_BARANGAY',	'TERRAIN_COAST');
------------------------------------------------------------------------------------------------------------------------
-- Improvement_Yields
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Improvement_Yields
		(ImprovementType,			YieldType,		Yield)
VALUES	('IMPROVEMENT_NC_BARANGAY',	'YIELD_FOOD',	1),
		('IMPROVEMENT_NC_BARANGAY',	'YIELD_GOLD',	1);
------------------------------------------------------------------------------------------------------------------------
-- Builds
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Builds
		(Type,					PrereqTech,		Water,	CanBeEmbarked, 	Kill, 	ImprovementType, 			HotKey, EntityEvent,		 	CtrlDown, OrderPriority,	Time, Description,						Help,								Recommendation,						IconIndex,  IconAtlas)
VALUES	('BUILD_NC_BARANGAY',	'TECH_OPTICS',	1,		1,				0, 		'IMPROVEMENT_NC_BARANGAY',	'K',	'ENTITY_EVENT_BUILD', 	1,		  96,				700, 'TXT_KEY_BUILD_NC_BARANGAY',		'TXT_KEY_BUILD_NC_BARANGAY_HELP',	'TXT_KEY_BUILD_NC_BARANGAY_REC',	4,			'NC_CEBU_ICON_ATLAS');

------------------------------------------------------------------------------------------------------------------------
-- Unit_Builds
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Unit_Builds
			(UnitType,					BuildType)
VALUES		('UNIT_WORKER',				'BUILD_NC_BARANGAY');
--------------------------------------------------------------------------------------------------------------------------
--=======================================================================================================================	
-- UNITS
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------
-- UnitPromotions
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO UnitPromotions 
		(Type, 									LostWithUpgrade,  Description, 								Help, 											Sound, 				CannotBeChosen, PortraitIndex, 	IconAtlas, 			PediaType, 			 PediaEntry)
VALUES	('PROMOTION_NC_TIMAWA',		0,				  'TXT_KEY_PROMOTION_NC_TIMAWA',	'TXT_KEY_PROMOTION_NC_TIMAWA_HELP', 	'AS2D_IF_LEVELUP', 	1, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES',  'TXT_KEY_PROMOTION_NC_TIMAWA');	
------------------------------------------------------------------------------------------------------------------------
-- Units
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Units 	
		(Type, 								Class, PrereqTech, Combat, Cost, FaithCost, RequiresFaithPurchaseEnabled, Moves, CombatClass, Domain, DefaultUnitAI, MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, IgnoreBuildingDefense, GoodyHutUpgradeUnitClass, AdvancedStartCost, XPValueAttack, XPValueDefense, MoveRate, Description, 							Help, 										Strategy, 										Civilopedia, 								UnitArtInfo, 							UnitFlagAtlas,								UnitFlagIconOffset,		IconAtlas,								PortraitIndex)
SELECT	'UNIT_NC_TIMAWA',			Class, PrereqTech, Combat, Cost, FaithCost, RequiresFaithPurchaseEnabled, Moves, CombatClass, Domain, DefaultUnitAI, MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, IgnoreBuildingDefense, GoodyHutUpgradeUnitClass, AdvancedStartCost, XPValueAttack, XPValueDefense, MoveRate, 'TXT_KEY_UNIT_NC_TIMAWA',	'TXT_KEY_UNIT_NC_TIMAWA_HELP',	'TXT_KEY_UNIT_NC_TIMAWA_STRATEGY', 	'TXT_KEY_UNIT_NC_TIMAWA_TEXT',	'ART_DEF_UNIT_NC_TIMAWA',		'NC_CEBU_UNIT_FLAG_ATLAS',		0,						'NC_CEBU_ICON_ATLAS',		2
FROM Units WHERE Type = 'UNIT_PIKEMAN';
------------------------------------------------------------------------------------------------------------------------		
-- Unit_AITypes
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Unit_AITypes 	
		(UnitType, 						UnitAIType)
SELECT	'UNIT_NC_TIMAWA', 	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_PIKEMAN';
------------------------------------------------------------------------------------------------------------------------	
-- Unit_ClassUpgrades
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 						UnitClassType)
SELECT	'UNIT_NC_TIMAWA', 	UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_PIKEMAN';
------------------------------------------------------------------------------------------------------------------------	
-- Unit_Flavors
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Unit_Flavors 	
		(UnitType, 						FlavorType, Flavor)
SELECT	'UNIT_NC_TIMAWA',		FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_PIKEMAN';

INSERT INTO Unit_Flavors 	
		(UnitType, 						FlavorType, Flavor)
VALUES	('UNIT_NC_TIMAWA',		'FLAVOR_NAVAL', 15);
------------------------------------------------------------------------------------------------------------------------	
-- Unit_FreePromotions
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Unit_FreePromotions 	
		(UnitType, 						PromotionType)
SELECT	'UNIT_NC_TIMAWA', 	PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_PIKEMAN';

INSERT INTO Unit_FreePromotions 	
		(UnitType, 						PromotionType)
VALUES	('UNIT_NC_TIMAWA', 	'PROMOTION_NC_TIMAWA'),
		('UNIT_NC_TIMAWA', 	'PROMOTION_AMPHIBIOUS');
------------------------------------------------------------------------------------------------------------------------	
-- UnitGameplay2DScripts
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 						SelectionSound,	FirstSelectionSound)
SELECT	'UNIT_NC_TIMAWA',		SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_PIKEMAN';		
--=======================================================================================================================	
-- LEADERS
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- Leaders
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Leaders 
		(Type, 				ArtDefineTag, 						Description, 					Civilopedia, 						CivilopediaTag, 							IconAtlas, 							PortraitIndex)
VALUES	('LEADER_NC_CEBU', 	'NC_Cebu_Scene.xml',		'TXT_KEY_LEADER_NC_CEBU',		'TXT_KEY_LEADER_NC_CEBU_PEDIA',		'TXT_KEY_CIVILOPEDIA_LEADERS_NC_CEBU',		'NC_CEBU_ICON_ATLAS', 	1);

UPDATE Leaders
SET VictoryCompetitiveness = 4,
WonderCompetitiveness = 6,
MinorCivCompetitiveness = 7,
Boldness = 5,
DiploBalance = 8,
WarmongerHate = 8,
DenounceWillingness = 6,
DoFWillingness = 6,
Loyalty = 4,
Neediness = 4,
Forgiveness = 6,
Chattiness = 3,
Meanness = 5
WHERE Type = 'LEADER_NC_CEBU';	
------------------------------------------------------------------------------------------------------------------------		
-- Leader_MajorCivApproachBiases
------------------------------------------------------------------------------------------------------------------------						
INSERT INTO Leader_MajorCivApproachBiases 
		(LeaderType, 					MajorCivApproachType, 				Bias)
VALUES	('LEADER_NC_CEBU', 	'MAJOR_CIV_APPROACH_WAR', 			4),
		('LEADER_NC_CEBU', 	'MAJOR_CIV_APPROACH_HOSTILE', 		4),
		('LEADER_NC_CEBU', 	'MAJOR_CIV_APPROACH_DECEPTIVE',		6),
		('LEADER_NC_CEBU', 	'MAJOR_CIV_APPROACH_GUARDED', 		6),
		('LEADER_NC_CEBU', 	'MAJOR_CIV_APPROACH_AFRAID', 		5),
		('LEADER_NC_CEBU', 	'MAJOR_CIV_APPROACH_FRIENDLY', 		7),
		('LEADER_NC_CEBU', 	'MAJOR_CIV_APPROACH_NEUTRAL', 		6);
------------------------------------------------------------------------------------------------------------------------	
-- Leader_MajorCivApproachBiases
------------------------------------------------------------------------------------------------------------------------							
INSERT INTO Leader_MinorCivApproachBiases 
		(LeaderType, 					MinorCivApproachType, 				Bias)
VALUES	('LEADER_NC_CEBU', 	'MINOR_CIV_APPROACH_IGNORE', 		4),
		('LEADER_NC_CEBU', 	'MINOR_CIV_APPROACH_FRIENDLY', 		6),
		('LEADER_NC_CEBU', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	6),
		('LEADER_NC_CEBU', 	'MINOR_CIV_APPROACH_CONQUEST', 		4),
		('LEADER_NC_CEBU', 	'MINOR_CIV_APPROACH_BULLY', 		6);
------------------------------------------------------------------------------------------------------------------------	
-- Leader_Flavors
------------------------------------------------------------------------------------------------------------------------							
INSERT INTO Leader_Flavors 
		(LeaderType, 					FlavorType, 						Flavor)
VALUES	('LEADER_NC_CEBU', 	'FLAVOR_OFFENSE', 					5),
		('LEADER_NC_CEBU', 	'FLAVOR_DEFENSE', 					5),
		('LEADER_NC_CEBU', 	'FLAVOR_CITY_DEFENSE', 				6),
		('LEADER_NC_CEBU', 	'FLAVOR_MILITARY_TRAINING', 		5),
		('LEADER_NC_CEBU', 	'FLAVOR_RECON', 					6),
		('LEADER_NC_CEBU', 	'FLAVOR_RANGED', 					5),
		('LEADER_NC_CEBU', 	'FLAVOR_MOBILE', 					5),
		('LEADER_NC_CEBU', 	'FLAVOR_NAVAL', 					8),
		('LEADER_NC_CEBU', 	'FLAVOR_NAVAL_RECON', 				8),
		('LEADER_NC_CEBU', 	'FLAVOR_NAVAL_GROWTH', 				8),
		('LEADER_NC_CEBU', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	10),
		('LEADER_NC_CEBU', 	'FLAVOR_AIR', 						4),
		('LEADER_NC_CEBU', 	'FLAVOR_EXPANSION', 				5),
		('LEADER_NC_CEBU', 	'FLAVOR_GROWTH', 					8),
		('LEADER_NC_CEBU', 	'FLAVOR_TILE_IMPROVEMENT', 			9),
		('LEADER_NC_CEBU', 	'FLAVOR_INFRASTRUCTURE', 			4),
		('LEADER_NC_CEBU', 	'FLAVOR_PRODUCTION', 				5),
		('LEADER_NC_CEBU', 	'FLAVOR_GOLD', 						7),
		('LEADER_NC_CEBU', 	'FLAVOR_SCIENCE', 					5),
		('LEADER_NC_CEBU', 	'FLAVOR_CULTURE', 					7),
		('LEADER_NC_CEBU', 	'FLAVOR_HAPPINESS', 				7),
		('LEADER_NC_CEBU', 	'FLAVOR_GREAT_PEOPLE', 				6),
		('LEADER_NC_CEBU', 	'FLAVOR_WONDER', 					6),
		('LEADER_NC_CEBU', 	'FLAVOR_RELIGION', 					6),
		('LEADER_NC_CEBU', 	'FLAVOR_DIPLOMACY', 				4),
		('LEADER_NC_CEBU', 	'FLAVOR_SPACESHIP', 				4),
		('LEADER_NC_CEBU', 	'FLAVOR_WATER_CONNECTION', 			9),
		('LEADER_NC_CEBU', 	'FLAVOR_NUKE', 						2),
		('LEADER_NC_CEBU', 	'FLAVOR_USE_NUKE', 					9),
		('LEADER_NC_CEBU', 	'FLAVOR_ESPIONAGE', 				5),
		('LEADER_NC_CEBU', 	'FLAVOR_AIRLIFT', 					2),
		('LEADER_NC_CEBU', 	'FLAVOR_I_TRADE_DESTINATION', 		7),
		('LEADER_NC_CEBU', 	'FLAVOR_I_TRADE_ORIGIN', 			7),
		('LEADER_NC_CEBU', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		7),
		('LEADER_NC_CEBU', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
		('LEADER_NC_CEBU', 	'FLAVOR_ARCHAEOLOGY', 				5),
		('LEADER_NC_CEBU', 	'FLAVOR_AIR_CARRIER', 				5);
--------------------------------------------------------------------------------------------------------------------------
-- Diplomacy_Responses
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Diplomacy_Responses
		(LeaderType, 					ResponseType, 							 			Response, 																		Bias)
VALUES 	('LEADER_NC_CEBU',	'RESPONSE_AI_DOF_BACKSTAB', 			 			'TXT_KEY_LEADER_NC_CEBU_DENOUNCE_FRIEND%', 			 				500),
		('LEADER_NC_CEBU',	'RESPONSE_ATTACKED_HOSTILE', 			 			'TXT_KEY_LEADER_NC_CEBU_ATTACKED_HOSTILE%', 			 			500),
		('LEADER_NC_CEBU',	'RESPONSE_ATTACKED_STRONG_HOSTILE', 			 	'TXT_KEY_LEADER_NC_CEBU_ATTACKED_HOSTILE%', 			 			500),
		('LEADER_NC_CEBU',	'RESPONSE_DEFEATED', 					 			'TXT_KEY_LEADER_NC_CEBU_DEFEATED%', 					 			500),
		('LEADER_NC_CEBU',	'RESPONSE_DOW_GENERIC', 				 			'TXT_KEY_LEADER_NC_CEBU_DOW_GENERIC%', 				 				500),
		('LEADER_NC_CEBU',	'RESPONSE_EXPANSION_SERIOUS_WARNING', 				'TXT_KEY_LEADER_NC_CEBU_EXPANSION_SERIOUS_WARNING%', 	 			500),
		('LEADER_NC_CEBU',	'RESPONSE_FIRST_GREETING', 				 			'TXT_KEY_LEADER_NC_CEBU_FIRSTGREETING%', 				 			500),
		('LEADER_NC_CEBU',	'RESPONSE_GREETING_HOSTILE_HELLO', 					'TXT_KEY_LEADER_NC_CEBU_GREETING_HOSTILE_HELLO%', 		 			500),
		('LEADER_NC_CEBU',	'RESPONSE_GREETING_NEUTRAL_HELLO', 					'TXT_KEY_LEADER_NC_CEBU_GREETING_NEUTRAL_HELLO%', 		 			500),
		('LEADER_NC_CEBU',	'RESPONSE_GREETING_POLITE_HELLO', 					'TXT_KEY_LEADER_NC_CEBU_GREETING_POLITE_HELLO%', 		 			500),
		('LEADER_NC_CEBU',	'RESPONSE_HOSTILE_AGGRESSIVE_MILITARY_WARNING', 	'TXT_KEY_LEADER_NC_CEBU_HOSTILE_AGGRESSIVE_MILITARY_WARNING%',		500),
		('LEADER_NC_CEBU',	'RESPONSE_LUXURY_TRADE', 							'TXT_KEY_LEADER_NC_CEBU_LUXURY_TRADE%', 		  					500),
		('LEADER_NC_CEBU',	'RESPONSE_OPEN_BORDERS_EXCHANGE', 					'TXT_KEY_LEADER_NC_CEBU_OPEN_BORDERS_EXCHANGE%', 		  			500),
		('LEADER_NC_CEBU',	'RESPONSE_PLOT_BUYING_SERIOUS_WARNING', 			'TXT_KEY_LEADER_NC_CEBU_PLOT_BUYING_SERIOUS_WARNING%', 				500),
		('LEADER_NC_CEBU',	'RESPONSE_REQUEST', 								'TXT_KEY_LEADER_NC_CEBU_REQUEST%', 		  							500),
		('LEADER_NC_CEBU',	'RESPONSE_RESPONSE_TO_BEING_DENOUNCED',  			'TXT_KEY_LEADER_NC_CEBU_RESPONSE_TO_BEING_DENOUNCED%',   			500),
		('LEADER_NC_CEBU',	'RESPONSE_TOO_SOON_FOR_DOF', 						'TXT_KEY_LEADER_NC_CEBU_TOO_SOON_FOR_DOF%', 						500),
		('LEADER_NC_CEBU',	'RESPONSE_TOO_SOON_NO_PEACE', 			 			'TXT_KEY_LEADER_NC_CEBU_TOO_SOON_NO_PEACE%', 			  			500),
		('LEADER_NC_CEBU',	'RESPONSE_WORK_AGAINST_SOMEONE', 		 			'TXT_KEY_LEADER_NC_CEBU_DENOUNCE%', 					  			500),
		('LEADER_NC_CEBU',	'RESPONSE_WORK_WITH_US', 				 			'TXT_KEY_LEADER_NC_CEBU_DEC_FRIENDSHIP%', 			  	  			500);
------------------------------------------------------------------------------------------------------------------------	
-- Leader_Traits
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Leader_Traits 
		(LeaderType, 					TraitType)
VALUES	('LEADER_NC_CEBU', 	'TRAIT_NC_CEBU');
------------------------------------------------------------------------------------------------------------------------
-- Traits
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Traits 
		(Type, 							Description, 							ShortDescription)
VALUES	('TRAIT_NC_CEBU', 	'TXT_KEY_TRAIT_NC_CEBU',	'TXT_KEY_TRAIT_NC_CEBU_SHORT');
------------------------------------------------------------------------------------------------------------------------
-- BuildingClasses
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO BuildingClasses
		(Type, 											DefaultBuilding, 						Description)
VALUES	('BUILDINGCLASS_DUMMY_NC_CEBU_GOLD',		'BUILDING_DUMMY_NC_CEBU_GOLD',	'TXT_KEY_BUILDING_DUMMY_NC_CEBU_GOLD'),
		('BUILDINGCLASS_DUMMY_NC_CEBU_HAS_TRADED',		'BUILDING_DUMMY_NC_CEBU_HAS_TRADED',	'TXT_KEY_BUILDING_DUMMY_NC_CEBU_HAS_TRADED'),
		('BUILDINGCLASS_DUMMY_NC_CEBU_PORCELAIN',		'BUILDING_DUMMY_NC_CEBU_PORCELAIN',	'TXT_KEY_BUILDING_DUMMY_NC_CEBU_PORCELAIN'),
		('BUILDINGCLASS_DUMMY_NC_CEBU_JEWELRY',		'BUILDING_DUMMY_NC_CEBU_JEWELRY',	'TXT_KEY_BUILDING_DUMMY_NC_CEBU_JEWELRY');
--------------------------------------------------------------------------------------------------------------------------
-- Buildings
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Buildings 	
		(Type, 										BuildingClass, 									UnmoddedHappiness,	GreatWorkCount,		Cost, FaithCost,   PrereqTech,   NeverCapture,	Description, 									Help)
VALUES	('BUILDING_DUMMY_NC_CEBU_GOLD',		'BUILDINGCLASS_DUMMY_NC_CEBU_GOLD', 		1,					-1, 				-1,   -1, 		   null, 		 1,				'TXT_KEY_BUILDING_DUMMY_NC_CEBU_GOLD',	'TXT_KEY_BUILDING_DUMMY_NC_CEBU_GOLD_HELP'),
		('BUILDING_DUMMY_NC_CEBU_PORCELAIN', 	'BUILDINGCLASS_DUMMY_NC_CEBU_PORCELAIN', 		0,					-1, 				-1,   -1, 		   null, 		 1,				'TXT_KEY_BUILDING_DUMMY_NC_CEBU_PORCELAIN',	'TXT_KEY_BUILDING_DUMMY_NC_CEBU_PORCELAIN_HELP'),
		('BUILDING_DUMMY_NC_CEBU_JEWELRY', 	'BUILDINGCLASS_DUMMY_NC_CEBU_JEWELRY', 		0,					-1, 				-1,   -1, 		   null, 		 1,				'TXT_KEY_BUILDING_DUMMY_NC_CEBU_JEWELRY',	'TXT_KEY_BUILDING_DUMMY_NC_CEBU_JEWELRY_HELP');

INSERT INTO Buildings 	
		(Type, 										BuildingClass, 									UnmoddedHappiness,	GreatWorkCount,		Cost, FaithCost,   PrereqTech,   ConquestProb,	Description, 									Help)
VALUES	('BUILDING_DUMMY_NC_CEBU_HAS_TRADED', 	'BUILDINGCLASS_DUMMY_NC_CEBU_HAS_TRADED', 		0,					-1, 				-1,   -1, 		   null, 		 100,				'TXT_KEY_BUILDING_DUMMY_NC_CEBU_HAS_TRADED',	'TXT_KEY_BUILDING_DUMMY_NC_CEBU_HAS_TRADED_HELP');
--------------------------------------------------------------------------------------------------------------------------
-- Building_ResourceQuantity
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_ResourceQuantity 	
		(BuildingType,				ResourceType,			Quantity)
VALUES	('BUILDING_DUMMY_NC_CEBU_PORCELAIN',	'RESOURCE_PORCELAIN',	1),
		('BUILDING_DUMMY_NC_CEBU_JEWELRY',	'RESOURCE_JEWELRY',	1);
--------------------------------------------------------------------------------------------------------------------------
-- Building_YieldChanges
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Building_YieldChanges 	
		(BuildingType,						YieldType,			Yield)
VALUES	('BUILDING_DUMMY_NC_CEBU_GOLD',	'YIELD_GOLD',	1);
--=======================================================================================================================	
-- CIVILIZATIONS
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- Civilizations
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilizations 	
		(Type, 									DerivativeCiv,				SoundtrackTag,  MapImage, 							DawnOfManQuote, 								DawnOfManImage,						Description,								ShortDescription,								Adjective,										Civilopedia,												CivilopediaTag,										DefaultPlayerColor,						ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas,							PortraitIndex,	AlphaIconAtlas)
SELECT	'CIVILIZATION_NC_CEBU',		'TXT_KEY_NC_TAL_CEBU',	'Indonesia', 		'NC_MapCebu512.dds',		'TXT_KEY_CIV_DAWN_NC_CEBU_TEXT',	'NC_DOM_Cebu.dds',		'TXT_KEY_CIV_NC_CEBU_DESC',		'TXT_KEY_CIV_NC_CEBU_SHORT_DESC',	'TXT_KEY_CIV_NC_CEBU_ADJECTIVE',	'TXT_KEY_CIVILOPEDIA_CIVS_NC_CEBU_TEXT_1',		'TXT_KEY_CIVILOPEDIA_CIVS_NC_CEBU',		'PLAYERCOLOR_NC_CEBU',		ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, 'NC_CEBU_ICON_ATLAS',	0,				'NC_CEBU_ALPHA_ATLAS'
FROM Civilizations WHERE Type = 'CIVILIZATION_INDONESIA';
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_CityNames
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilization_CityNames 
		(CivilizationType, 						CityName)
VALUES	('CIVILIZATION_NC_CEBU',	'TXT_KEY_CITY_NAME_NC_CEBU_1'),
		('CIVILIZATION_NC_CEBU',	'TXT_KEY_CITY_NAME_NC_CEBU_2'),
		('CIVILIZATION_NC_CEBU',	'TXT_KEY_CITY_NAME_NC_CEBU_3'),
		('CIVILIZATION_NC_CEBU',	'TXT_KEY_CITY_NAME_NC_CEBU_4'),
		('CIVILIZATION_NC_CEBU',	'TXT_KEY_CITY_NAME_NC_CEBU_5'),
		('CIVILIZATION_NC_CEBU',	'TXT_KEY_CITY_NAME_NC_CEBU_6'),
		('CIVILIZATION_NC_CEBU',	'TXT_KEY_CITY_NAME_NC_CEBU_7'),
		('CIVILIZATION_NC_CEBU',	'TXT_KEY_CITY_NAME_NC_CEBU_8'),
		('CIVILIZATION_NC_CEBU',	'TXT_KEY_CITY_NAME_NC_CEBU_9'),
		('CIVILIZATION_NC_CEBU',	'TXT_KEY_CITY_NAME_NC_CEBU_10'),
		('CIVILIZATION_NC_CEBU',	'TXT_KEY_CITY_NAME_NC_CEBU_11'),
		('CIVILIZATION_NC_CEBU',	'TXT_KEY_CITY_NAME_NC_CEBU_12'),
		('CIVILIZATION_NC_CEBU',	'TXT_KEY_CITY_NAME_NC_CEBU_13'),
		('CIVILIZATION_NC_CEBU',	'TXT_KEY_CITY_NAME_NC_CEBU_14'),
		('CIVILIZATION_NC_CEBU',	'TXT_KEY_CITY_NAME_NC_CEBU_15'),
		('CIVILIZATION_NC_CEBU',	'TXT_KEY_CITY_NAME_NC_CEBU_16'),
		('CIVILIZATION_NC_CEBU',	'TXT_KEY_CITY_NAME_NC_CEBU_17'),
		('CIVILIZATION_NC_CEBU',	'TXT_KEY_CITY_NAME_NC_CEBU_18'),
		('CIVILIZATION_NC_CEBU',	'TXT_KEY_CITY_NAME_NC_CEBU_19'),
		('CIVILIZATION_NC_CEBU',	'TXT_KEY_CITY_NAME_NC_CEBU_20'),
		('CIVILIZATION_NC_CEBU',	'TXT_KEY_CITY_NAME_NC_CEBU_21'),
		('CIVILIZATION_NC_CEBU',	'TXT_KEY_CITY_NAME_NC_CEBU_22'),
		('CIVILIZATION_NC_CEBU',	'TXT_KEY_CITY_NAME_NC_CEBU_23'),
		('CIVILIZATION_NC_CEBU',	'TXT_KEY_CITY_NAME_NC_CEBU_24'),
		('CIVILIZATION_NC_CEBU',	'TXT_KEY_CITY_NAME_NC_CEBU_25'),
		('CIVILIZATION_NC_CEBU',	'TXT_KEY_CITY_NAME_NC_CEBU_26');
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_FreeBuildingClasses
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Civilization_FreeBuildingClasses 
		(CivilizationType, 						BuildingClassType)
SELECT	'CIVILIZATION_NC_CEBU', 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE CivilizationType = 'CIVILIZATION_INDONESIA';
------------------------------------------------------------------------------------------------------------------------		
-- Civilization_FreeTechs
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Civilization_FreeTechs 
		(CivilizationType, 						TechType)
SELECT	'CIVILIZATION_NC_CEBU', 	TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_INDONESIA';
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_FreeUnits
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_FreeUnits 
		(CivilizationType, 						UnitClassType, Count, UnitAIType)
SELECT	'CIVILIZATION_NC_CEBU', 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_INDONESIA';
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_Leaders
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_Leaders 
		(CivilizationType, 						LeaderheadType)
VALUES	('CIVILIZATION_NC_CEBU',	'LEADER_NC_CEBU');
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_UnitClassOverrides 
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_UnitClassOverrides 
		(CivilizationType, 						UnitClassType, 				UnitType)
VALUES	('CIVILIZATION_NC_CEBU',	'UNITCLASS_PIKEMAN',		'UNIT_NC_TIMAWA');
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_Religions
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Civilization_Religions 
		(CivilizationType, 						ReligionType)
VALUES	('CIVILIZATION_NC_CEBU',	'RELIGION_CHRISTIANITY');
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_SpyNames
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilization_SpyNames 
		(CivilizationType, 						SpyName)
VALUES	('CIVILIZATION_NC_CEBU',	'TXT_KEY_SPY_NAME_NC_CEBU_0'),
		('CIVILIZATION_NC_CEBU',	'TXT_KEY_SPY_NAME_NC_CEBU_1'),
		('CIVILIZATION_NC_CEBU',	'TXT_KEY_SPY_NAME_NC_CEBU_2'),
		('CIVILIZATION_NC_CEBU',	'TXT_KEY_SPY_NAME_NC_CEBU_3'),
		('CIVILIZATION_NC_CEBU',	'TXT_KEY_SPY_NAME_NC_CEBU_4'),
		('CIVILIZATION_NC_CEBU',	'TXT_KEY_SPY_NAME_NC_CEBU_5'),
		('CIVILIZATION_NC_CEBU',	'TXT_KEY_SPY_NAME_NC_CEBU_6'),
		('CIVILIZATION_NC_CEBU',	'TXT_KEY_SPY_NAME_NC_CEBU_7'),
		('CIVILIZATION_NC_CEBU',	'TXT_KEY_SPY_NAME_NC_CEBU_8'),
		('CIVILIZATION_NC_CEBU',	'TXT_KEY_SPY_NAME_NC_CEBU_9');
--==========================================================================================================================
-- Civilization_Start_Along_Ocean 
--==========================================================================================================================
INSERT INTO Civilization_Start_Along_Ocean 
		(CivilizationType, 					StartAlongOcean)
VALUES	('CIVILIZATION_NC_CEBU', 	1);
--==========================================================================================================================
-- Civilization_Start_Place_First_Along_Ocean
--==========================================================================================================================
INSERT INTO Civilization_Start_Place_First_Along_Ocean 
		(CivilizationType, 					PlaceFirst)
VALUES	('CIVILIZATION_NC_CEBU', 	1);
--=======================================================================================================================
--=======================================================================================================================