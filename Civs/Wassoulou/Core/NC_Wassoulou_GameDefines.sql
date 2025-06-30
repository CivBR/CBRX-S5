--=======================================================================================================================
-- MASTER TABLES
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS CustomModOptions(Name Text, Value INTEGER, Class INTEGER, DbUpdates INTEGER);
CREATE TABLE IF NOT EXISTS JFD_GlobalUserSettings (Type text, Value integer default 1);
--=======================================================================================================================
-- GAME DEFINES
--=======================================================================================================================
--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================		
------------------------------------------------------------------------------------------------------------------------	
-- Buildings
------------------------------------------------------------------------------------------------------------------------	

INSERT INTO Buildings 	
		(Type, 								BuildingClass, PrereqTech, Cost, FaithCost, GoldMaintenance, MinAreaSize, ConquestProb, NeverCapture, Description, 								Help, 											Strategy,								 			Civilopedia, 									ArtDefineTag, IconAtlas,							PortraitIndex)
SELECT	'BUILDING_NC_DYULA_GUNSMITH',	BuildingClass, PrereqTech, Cost, FaithCost, GoldMaintenance, MinAreaSize, ConquestProb, 1, 			  'TXT_KEY_BUILDING_NC_DYULA_GUNSMITH', 	'TXT_KEY_BUILDING_NC_DYULA_GUNSMITH_HELP',	'TXT_KEY_BUILDING_NC_DYULA_GUNSMITH_STRATEGY',	'TXT_KEY_BUILDING_NC_DYULA_GUNSMITH_TEXT',	ArtDefineTag, 'NC_WASSOULOU_ICON_ATLAS',  3
FROM Buildings WHERE Type = 'BUILDING_ARMORY';	
------------------------------------------------------------------------------------------------------------------------	
-- Building_Flavors
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_Flavors 	
		(BuildingType, 					FlavorType,		Flavor)
SELECT	'BUILDING_NC_DYULA_GUNSMITH',	FlavorType,		Flavor
FROM Building_Flavors WHERE BuildingType = 'BUILDING_ARMORY';

INSERT INTO Building_Flavors 										 
		(BuildingType, 					FlavorType,					 Flavor)
VALUES	('BUILDING_NC_DYULA_GUNSMITH',	'FLAVOR_PRODUCTION',				 10),
		('BUILDING_NC_DYULA_GUNSMITH',	'FLAVOR_I_TRADE_ORIGIN',	 20);		
-------------------------------------------------------------------------------------------------------------------------	                                                                                                                 				
-- Building_ClassesNeededInCity
-------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Building_ClassesNeededInCity 	
		(BuildingType, 						BuildingClassType)
SELECT	'BUILDING_NC_DYULA_GUNSMITH',	BuildingClassType
FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_ARMORY';
-------------------------------------------------------------------------------------------------------------------------	
-- Building_DomainFreeExperiences
-------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_DomainFreeExperiences 	
		(BuildingType, 						DomainType,		Experience)
SELECT	'BUILDING_NC_DYULA_GUNSMITH',	DomainType,		Experience-5
FROM Building_DomainFreeExperiences WHERE BuildingType = 'BUILDING_ARMORY';
------------------------------------------------------------------------------------------------------------------------
-- BuildingClasses
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO BuildingClasses
		(Type, 											DefaultBuilding, 						Description)
VALUES	('BUILDINGCLASS_NC_WASSOULOU_TRADE_ROUTE_DUMMY',			'BUILDING_NC_WASSOULOU_TRADE_ROUTE_DUMMY',		'TXT_KEY_BUILDING_NC_WASSOULOU_TRADE_ROUTE_DUMMY'),
		('BUILDINGCLASS_NC_WASSOULOU_XP_DUMMY',			'BUILDING_NC_WASSOULOU_XP_DUMMY',		'TXT_KEY_BUILDING_NC_WASSOULOU_XP_DUMMY'),
		('BUILDINGCLASS_NC_WASSOULOU_SPY_MARKER',			'BUILDING_NC_WASSOULOU_SPY_MARKER',		'TXT_KEY_BUILDING_NC_WASSOULOU_SPY_MARKER');
--------------------------------------------------------------------------------------------------------------------------
-- Buildings
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Buildings 	
		(Type, 						 					BuildingClass, 										GreatWorkCount, Cost, FaithCost, PrereqTech, NumTradeRouteBonus,	NeverCapture,	Description, 											Help)
VALUES	('BUILDING_NC_WASSOULOU_TRADE_ROUTE_DUMMY', 	'BUILDINGCLASS_NC_WASSOULOU_TRADE_ROUTE_DUMMY', 	-1, 			-1,   -1, 		 null, 		1,		 1,				'TXT_KEY_BUILDING_NC_WASSOULOU_TRADE_ROUTE_DUMMY',			'TXT_KEY_BUILDING_NC_WASSOULOU_TRADE_ROUTE_DUMMY_HELP'),
		('BUILDING_NC_WASSOULOU_XP_DUMMY', 				'BUILDINGCLASS_NC_WASSOULOU_XP_DUMMY', 				-1, 			-1,   -1, 		 null,	0, 		 1, 				'TXT_KEY_BUILDING_NC_WASSOULOU_XP_DUMMY',			'TXT_KEY_BUILDING_NC_WASSOULOU_XP_DUMMY_HELP'),
		('BUILDING_NC_WASSOULOU_SPY_MARKER', 			'BUILDINGCLASS_NC_WASSOULOU_SPY_MARKER', 			-1, 			-1,   -1,		null,	0,		 1,				'TXT_KEY_BUILDING_NC_WASSOULOU_SPY_MARKER',			'TXT_KEY_BUILDING_NC_WASSOULOU_SPY_MARKER_HELP');
------------------------------------------------------------------------------------------------------------------------
-- Building_DomainFreeExperiences
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_DomainFreeExperiences
		(BuildingType,	DomainType,	Experience)
VALUES	('BUILDING_NC_WASSOULOU_XP_DUMMY',	'DOMAIN_LAND',	5);
--=======================================================================================================================
-- UNITS
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------
-- UnitPromotions
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO UnitPromotions 
		(Type, 							LostWithUpgrade,  Description, 							Help, 										Sound, 				CannotBeChosen, PortraitIndex, 	IconAtlas, 			PediaType, 			 PediaEntry)
VALUES	('PROMOTION_NC_WASSOULOU_BOLO',	0,				  'TXT_KEY_PROMOTION_NC_WASSOULOU_BOLO',	'TXT_KEY_PROMOTION_NC_WASSOULOU_BOLO_HELP', 	'AS2D_IF_LEVELUP', 	1, 59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES',  'TXT_KEY_PROMOTION_NC_WASSOULOU_BOLO');

INSERT INTO UnitPromotions
(Type,                                               Description,                                             Help,                                              Sound,                CannotBeChosen, PortraitIndex,     IconAtlas,            PediaType,          PediaEntry)
VALUES    ('PROMOTION_NC_WASSOULOU_SPY_ADJACENCY',         'TXT_KEY_PROMOTION_NC_WASSOULOU_SPY_ADJACENCY',     'TXT_KEY_PROMOTION_NC_WASSOULOU_SPY_ADJACENCY_HELP',     'AS2D_IF_LEVELUP',     1,              59,             'ABILITY_ATLAS',     'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_NC_WASSOULOU_SPY_ADJACENCY');

INSERT INTO UnitPromotions
(Type,                                               Description,                                             Help,                                              Sound,                ExperiencePercent,	CannotBeChosen,    PortraitIndex,     IconAtlas,            PediaType,          PediaEntry)
VALUES    ('PROMOTION_NC_WASSOULOU_SPY_ADJACENCY_ACTIVE',         'TXT_KEY_PROMOTION_NC_WASSOULOU_SPY_ADJACENCY_ACTIVE',     'TXT_KEY_PROMOTION_NC_WASSOULOU_SPY_ADJACENCY_HELP',     'AS2D_IF_LEVELUP',	100,     1,  59,             'ABILITY_ATLAS',     'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_NC_WASSOULOU_SPY_ADJACENCY');

INSERT INTO UnitPromotions 
		(Type, 									LostWithUpgrade,  Description, 									Help, 												Sound, 				CannotBeChosen, HasPostCombatPromotions, MovesChange,	PortraitIndex, 	IconAtlas, 			PediaType, 			 PediaEntry)
VALUES	('PROMOTION_NC_WASSOULOU_MOVEMENT_1',	0,				  'TXT_KEY_PROMOTION_NC_WASSOULOU_MOVEMENT',	'TXT_KEY_PROMOTION_NC_WASSOULOU_MOVEMENT_HELP', 	'AS2D_IF_LEVELUP', 	1, 0, 	1,			59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES',  'TXT_KEY_PROMOTION_NC_WASSOULOU_MOVEMENT'),	
		('PROMOTION_NC_WASSOULOU_MOVEMENT_2',	0,				  'TXT_KEY_PROMOTION_NC_WASSOULOU_MOVEMENT',	'TXT_KEY_PROMOTION_NC_WASSOULOU_MOVEMENT_HELP', 	'AS2D_IF_LEVELUP', 	1, 0, 	1,			58, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES',  'TXT_KEY_PROMOTION_NC_WASSOULOU_MOVEMENT'),
		('PROMOTION_NC_WASSOULOU_MOVEMENT_3',	0,				  'TXT_KEY_PROMOTION_NC_WASSOULOU_MOVEMENT',	'TXT_KEY_PROMOTION_NC_WASSOULOU_MOVEMENT_HELP', 	'AS2D_IF_LEVELUP', 	1, 0, 	1,			58, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES',  'TXT_KEY_PROMOTION_NC_WASSOULOU_MOVEMENT'),	
		('PROMOTION_NC_WASSOULOU_MOVEMENT_4',	0,				  'TXT_KEY_PROMOTION_NC_WASSOULOU_MOVEMENT',	'TXT_KEY_PROMOTION_NC_WASSOULOU_MOVEMENT_HELP', 	'AS2D_IF_LEVELUP', 	1, 0, 	1,			59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES',  'TXT_KEY_PROMOTION_NC_WASSOULOU_MOVEMENT'),	
		('PROMOTION_NC_WASSOULOU_MOVEMENT_5',	0,				  'TXT_KEY_PROMOTION_NC_WASSOULOU_MOVEMENT',	'TXT_KEY_PROMOTION_NC_WASSOULOU_MOVEMENT_HELP', 	'AS2D_IF_LEVELUP', 	1, 0, 	1,			58, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES',  'TXT_KEY_PROMOTION_NC_WASSOULOU_MOVEMENT'),
		('PROMOTION_NC_WASSOULOU_MOVEMENT_6',	0,				  'TXT_KEY_PROMOTION_NC_WASSOULOU_MOVEMENT',	'TXT_KEY_PROMOTION_NC_WASSOULOU_MOVEMENT_HELP', 	'AS2D_IF_LEVELUP', 	1, 0, 	1,			59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES',  'TXT_KEY_PROMOTION_NC_WASSOULOU_MOVEMENT'),
		('PROMOTION_NC_WASSOULOU_MOVEMENT_7',	0,				  'TXT_KEY_PROMOTION_NC_WASSOULOU_MOVEMENT',	'TXT_KEY_PROMOTION_NC_WASSOULOU_MOVEMENT_HELP', 	'AS2D_IF_LEVELUP', 	1, 0, 	1,			59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES',  'TXT_KEY_PROMOTION_NC_WASSOULOU_MOVEMENT'),
		('PROMOTION_NC_WASSOULOU_MOVEMENT_8',	0,				  'TXT_KEY_PROMOTION_NC_WASSOULOU_MOVEMENT',	'TXT_KEY_PROMOTION_NC_WASSOULOU_MOVEMENT_HELP', 	'AS2D_IF_LEVELUP', 	1, 0, 	1,			59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES',  'TXT_KEY_PROMOTION_NC_WASSOULOU_MOVEMENT'),	
		('PROMOTION_NC_WASSOULOU_MOVEMENT_9',	0,				  'TXT_KEY_PROMOTION_NC_WASSOULOU_MOVEMENT',	'TXT_KEY_PROMOTION_NC_WASSOULOU_MOVEMENT_HELP', 	'AS2D_IF_LEVELUP', 	1, 0, 	1,			58, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES',  'TXT_KEY_PROMOTION_NC_WASSOULOU_MOVEMENT'),
		('PROMOTION_NC_WASSOULOU_MOVEMENT_10',	0,				  'TXT_KEY_PROMOTION_NC_WASSOULOU_MOVEMENT',	'TXT_KEY_PROMOTION_NC_WASSOULOU_MOVEMENT_HELP', 	'AS2D_IF_LEVELUP', 	1, 0, 	1,			58, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES',  'TXT_KEY_PROMOTION_NC_WASSOULOU_MOVEMENT');
------------------------------------------------------------------------------------------------------------------------
-- Units
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Units 	
		(Type, 							Class, PrereqTech, Combat, RangedCombat, Cost, FaithCost, RequiresFaithPurchaseEnabled, Moves, CombatClass, Domain, DefaultUnitAI, MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, IgnoreBuildingDefense, GoodyHutUpgradeUnitClass, AdvancedStartCost, XPValueAttack, XPValueDefense, MoveRate, Description, 								Help, 											Strategy, 											Civilopedia, 								UnitArtInfo, 							UnitFlagAtlas,							  UnitFlagIconOffset,	 IconAtlas,							 PortraitIndex)
SELECT	'UNIT_NC_BOLO',	Class, PrereqTech, Combat, RangedCombat, Cost, FaithCost, RequiresFaithPurchaseEnabled, Moves, CombatClass, Domain, DefaultUnitAI, MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, IgnoreBuildingDefense, GoodyHutUpgradeUnitClass, AdvancedStartCost, XPValueAttack, XPValueDefense, MoveRate, 'TXT_KEY_UNIT_NC_BOLO',	'TXT_KEY_UNIT_NC_BOLO_HELP', 	'TXT_KEY_UNIT_NC_BOLO_STRATEGY', 	'TXT_KEY_UNIT_NC_BOLO_TEXT',	'ART_DEF_UNIT_NC_BOLO',	'NC_WASSOULOU_UNIT_FLAG_ATLAS',   0,					 'NC_WASSOULOU_ICON_ATLAS',	 3
FROM Units WHERE Type = 'UNIT_MUSKETMAN';	
------------------------------------------------------------------------------------------------------------------------
-- Unit_AITypes
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_AITypes 	
		(UnitType, 						UnitAIType)
SELECT	'UNIT_NC_BOLO',	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_MUSKETMAN';
------------------------------------------------------------------------------------------------------------------------	
-- Unit_ClassUpgrades
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 						UnitClassType)
SELECT	'UNIT_NC_BOLO',	UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_MUSKETMAN';
------------------------------------------------------------------------------------------------------------------------
-- Unit_Flavors
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_Flavors
		(UnitType, 						FlavorType, Flavor)
SELECT	'UNIT_NC_BOLO',	FlavorType, Flavor + 5
FROM Unit_Flavors WHERE UnitType = 'UNIT_MUSKETMAN';
------------------------------------------------------------------------------------------------------------------------
-- Unit_FreePromotions
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_FreePromotions 	
		(UnitType, 						PromotionType)
SELECT	'UNIT_NC_BOLO',	PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_MUSKETMAN';	

INSERT INTO Unit_FreePromotions 	
		(UnitType, 						PromotionType)
VALUES	('UNIT_NC_BOLO',	'PROMOTION_NC_WASSOULOU_BOLO');
------------------------------------------------------------------------------------------------------------------------
-- UnitGameplay2DScripts
------------------------------------------------------------------------------------------------------------------------
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 						SelectionSound, FirstSelectionSound)
SELECT	'UNIT_NC_BOLO',	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_MUSKETMAN';	

--=======================================================================================================================	
-- LEADERS
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- Leaders
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Leaders 
		(Type, 								Description, 								Civilopedia, 									CivilopediaTag, 										ArtDefineTag, 						IconAtlas, 								PortraitIndex)
VALUES	('LEADER_NC_WASSOULOU', 	'TXT_KEY_LEADER_NC_WASSOULOU',	'TXT_KEY_LEADER_NC_WASSOULOU_PEDIA', 	'TXT_KEY_CIVILOPEDIA_LEADERS_NC_WASSOULOU', 	'NC_Wassoulou_Scene.xml',	'NC_WASSOULOU_ICON_ATLAS',    1);

UPDATE Leaders
SET VictoryCompetitiveness = 9,
WonderCompetitiveness = 6,
MinorCivCompetitiveness = 8,
Boldness = 10,
DiploBalance = 4,
WarmongerHate = 6,
DenounceWillingness = 7,
DoFWillingness = 7,
Loyalty = 3,
Neediness = 5,
Forgiveness = 7,
Chattiness = 3,
Meanness = 10
WHERE Type = 'LEADER_NC_WASSOULOU';
------------------------------------------------------------------------------------------------------------------------
-- Leader_MajorCivApproachBiases
------------------------------------------------------------------------------------------------------------------------				
INSERT INTO Leader_MajorCivApproachBiases 
		(LeaderType, 						MajorCivApproachType, 				Bias)
VALUES	('LEADER_NC_WASSOULOU', 	'MAJOR_CIV_APPROACH_WAR', 			8),
		('LEADER_NC_WASSOULOU', 	'MAJOR_CIV_APPROACH_HOSTILE', 		7),
		('LEADER_NC_WASSOULOU', 	'MAJOR_CIV_APPROACH_DECEPTIVE', 	10),
		('LEADER_NC_WASSOULOU', 	'MAJOR_CIV_APPROACH_GUARDED', 		5),
		('LEADER_NC_WASSOULOU', 	'MAJOR_CIV_APPROACH_AFRAID', 		4),
		('LEADER_NC_WASSOULOU', 	'MAJOR_CIV_APPROACH_FRIENDLY', 		6),
		('LEADER_NC_WASSOULOU', 	'MAJOR_CIV_APPROACH_NEUTRAL', 		5);
------------------------------------------------------------------------------------------------------------------------
-- Leader_MajorCivApproachBiases
------------------------------------------------------------------------------------------------------------------------ 				
INSERT INTO Leader_MinorCivApproachBiases 
		(LeaderType, 						MinorCivApproachType, 				Bias)
VALUES	('LEADER_NC_WASSOULOU', 	'MINOR_CIV_APPROACH_IGNORE', 		3),
		('LEADER_NC_WASSOULOU', 	'MINOR_CIV_APPROACH_FRIENDLY', 		5),
		('LEADER_NC_WASSOULOU', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	4),
		('LEADER_NC_WASSOULOU', 	'MINOR_CIV_APPROACH_CONQUEST', 		10),
		('LEADER_NC_WASSOULOU', 	'MINOR_CIV_APPROACH_BULLY', 		9);
------------------------------------------------------------------------------------------------------------------------ 
-- Leader_Flavors
------------------------------------------------------------------------------------------------------------------------				
INSERT INTO Leader_Flavors 
		(LeaderType, 						FlavorType, 						Flavor)
VALUES	('LEADER_NC_WASSOULOU', 	'FLAVOR_OFFENSE', 					10),
		('LEADER_NC_WASSOULOU', 	'FLAVOR_DEFENSE', 					5),
		('LEADER_NC_WASSOULOU', 	'FLAVOR_CITY_DEFENSE', 				4),
		('LEADER_NC_WASSOULOU', 	'FLAVOR_MILITARY_TRAINING', 		6),
		('LEADER_NC_WASSOULOU', 	'FLAVOR_RECON', 					6),
		('LEADER_NC_WASSOULOU', 	'FLAVOR_RANGED', 					5),
		('LEADER_NC_WASSOULOU', 	'FLAVOR_MOBILE', 					5),
		('LEADER_NC_WASSOULOU', 	'FLAVOR_NAVAL', 					3),
		('LEADER_NC_WASSOULOU', 	'FLAVOR_NAVAL_RECON', 				4),
		('LEADER_NC_WASSOULOU', 	'FLAVOR_NAVAL_GROWTH', 				3),
		('LEADER_NC_WASSOULOU', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	3),
		('LEADER_NC_WASSOULOU', 	'FLAVOR_AIR', 						5),
		('LEADER_NC_WASSOULOU', 	'FLAVOR_EXPANSION', 				10),
		('LEADER_NC_WASSOULOU', 	'FLAVOR_GROWTH', 					4),
		('LEADER_NC_WASSOULOU', 	'FLAVOR_TILE_IMPROVEMENT', 			3),
		('LEADER_NC_WASSOULOU', 	'FLAVOR_INFRASTRUCTURE', 			5),
		('LEADER_NC_WASSOULOU', 	'FLAVOR_PRODUCTION', 				7),
		('LEADER_NC_WASSOULOU', 	'FLAVOR_GOLD', 						7),
		('LEADER_NC_WASSOULOU', 	'FLAVOR_SCIENCE', 					7),
		('LEADER_NC_WASSOULOU', 	'FLAVOR_CULTURE', 					4),
		('LEADER_NC_WASSOULOU', 	'FLAVOR_HAPPINESS', 				5),
		('LEADER_NC_WASSOULOU', 	'FLAVOR_GREAT_PEOPLE', 				4),
		('LEADER_NC_WASSOULOU', 	'FLAVOR_WONDER', 					3),
		('LEADER_NC_WASSOULOU', 	'FLAVOR_RELIGION', 					4),
		('LEADER_NC_WASSOULOU', 	'FLAVOR_DIPLOMACY', 				2),
		('LEADER_NC_WASSOULOU', 	'FLAVOR_SPACESHIP', 				5),
		('LEADER_NC_WASSOULOU', 	'FLAVOR_WATER_CONNECTION', 			3),
		('LEADER_NC_WASSOULOU', 	'FLAVOR_NUKE', 						8),
		('LEADER_NC_WASSOULOU', 	'FLAVOR_USE_NUKE', 					8),
		('LEADER_NC_WASSOULOU', 	'FLAVOR_ESPIONAGE', 				7),
		('LEADER_NC_WASSOULOU', 	'FLAVOR_AIRLIFT', 					5),
		('LEADER_NC_WASSOULOU', 	'FLAVOR_I_TRADE_DESTINATION', 		5),
		('LEADER_NC_WASSOULOU', 	'FLAVOR_I_TRADE_ORIGIN', 			7),
		('LEADER_NC_WASSOULOU', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
		('LEADER_NC_WASSOULOU', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		7),
		('LEADER_NC_WASSOULOU', 	'FLAVOR_ARCHAEOLOGY', 				5),
		('LEADER_NC_WASSOULOU', 	'FLAVOR_AIR_CARRIER', 				5);
--------------------------------------------------------------------------------------------------------------------------
-- Diplomacy_Responses
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Diplomacy_Responses
		(LeaderType, 						ResponseType, 							 			Response, 																			Bias)
VALUES 	('LEADER_NC_WASSOULOU',	'RESPONSE_AI_DOF_BACKSTAB', 			 			'TXT_KEY_LEADER_NC_WASSOULOU_DENOUNCE_FRIEND%', 			 				500),
		('LEADER_NC_WASSOULOU',	'RESPONSE_ATTACKED_HOSTILE', 			 			'TXT_KEY_LEADER_NC_WASSOULOU_ATTACKED_HOSTILE%', 			 				500),
		('LEADER_NC_WASSOULOU',	'RESPONSE_ATTACKED_STRONG_HOSTILE', 				'TXT_KEY_LEADER_NC_WASSOULOU_ATTACKED_HOSTILE%', 			 				500),
		('LEADER_NC_WASSOULOU',	'RESPONSE_DEFEATED', 					 			'TXT_KEY_LEADER_NC_WASSOULOU_DEFEATED%', 					 				500),
		('LEADER_NC_WASSOULOU',	'RESPONSE_DOW_GENERIC', 				 			'TXT_KEY_LEADER_NC_WASSOULOU_DOW_GENERIC%', 				 				500),
		('LEADER_NC_WASSOULOU',	'RESPONSE_EXPANSION_SERIOUS_WARNING', 				'TXT_KEY_LEADER_NC_WASSOULOU_EXPANSION_SERIOUS_WARNING%', 	 			500),
		('LEADER_NC_WASSOULOU',	'RESPONSE_FIRST_GREETING', 				 			'TXT_KEY_LEADER_NC_WASSOULOU_FIRSTGREETING%', 				 			500),
		('LEADER_NC_WASSOULOU',	'RESPONSE_GREETING_HOSTILE_HELLO', 					'TXT_KEY_LEADER_NC_WASSOULOU_GREETING_HOSTILE_HELLO%', 		 			500),
		('LEADER_NC_WASSOULOU',	'RESPONSE_GREETING_NEUTRAL_HELLO', 					'TXT_KEY_LEADER_NC_WASSOULOU_GREETING_NEUTRAL_HELLO%', 		 			500),
		('LEADER_NC_WASSOULOU',	'RESPONSE_GREETING_POLITE_HELLO', 					'TXT_KEY_LEADER_NC_WASSOULOU_GREETING_POLITE_HELLO%', 		 			500),
		('LEADER_NC_WASSOULOU',	'RESPONSE_HOSTILE_AGGRESSIVE_MILITARY_WARNING', 	'TXT_KEY_LEADER_NC_WASSOULOU_HOSTILE_AGGRESSIVE_MILITARY_WARNING%', 		500),
		('LEADER_NC_WASSOULOU',	'RESPONSE_LUXURY_TRADE', 							'TXT_KEY_LEADER_NC_WASSOULOU_LUXURY_TRADE%', 		  						500),
		('LEADER_NC_WASSOULOU',	'RESPONSE_OPEN_BORDERS_EXCHANGE', 					'TXT_KEY_LEADER_NC_WASSOULOU_OPEN_BORDERS_EXCHANGE%', 		  			500),
		('LEADER_NC_WASSOULOU',	'RESPONSE_PLOT_BUYING_SERIOUS_WARNING', 			'TXT_KEY_LEADER_NC_WASSOULOU_PLOT_BUYING_SERIOUS_WARNING%', 				500),
		('LEADER_NC_WASSOULOU',	'RESPONSE_REQUEST', 								'TXT_KEY_LEADER_NC_WASSOULOU_REQUEST%', 		  							500),
		('LEADER_NC_WASSOULOU',	'RESPONSE_TOO_SOON_FOR_DOF', 						'TXT_KEY_LEADER_NC_WASSOULOU_TOO_SOON_FOR_DOF%', 							500),
		('LEADER_NC_WASSOULOU',	'RESPONSE_TOO_SOON_NO_PEACE', 			 			'TXT_KEY_LEADER_NC_WASSOULOU_TOO_SOON_NO_PEACE%', 			  			500),
		('LEADER_NC_WASSOULOU',	'RESPONSE_RESPONSE_TO_BEING_DENOUNCED',  			'TXT_KEY_LEADER_NC_WASSOULOU_RESPONSE_TO_BEING_DENOUNCED%',   			500),
		('LEADER_NC_WASSOULOU',	'RESPONSE_WORK_AGAINST_SOMEONE', 		 			'TXT_KEY_LEADER_NC_WASSOULOU_DENOUNCE%', 					  				500),
		('LEADER_NC_WASSOULOU',	'RESPONSE_WORK_WITH_US', 				 			'TXT_KEY_LEADER_NC_WASSOULOU_DEC_FRIENDSHIP%', 			  	  			500);
------------------------------------------------------------------------------------------------------------------------ 
-- Leader_Traits
------------------------------------------------------------------------------------------------------------------------ 
INSERT INTO Leader_Traits 
		(LeaderType, 						TraitType)
VALUES	('LEADER_NC_WASSOULOU',		'TRAIT_NC_WASSOULOU');
------------------------------------------------------------------------------------------------------------------------ 
-- Traits
------------------------------------------------------------------------------------------------------------------------ 
INSERT INTO Traits 
		(Type, 								Description, 							ShortDescription)
VALUES	('TRAIT_NC_WASSOULOU', 		'TXT_KEY_TRAIT_NC_WASSOULOU',	'TXT_KEY_TRAIT_NC_WASSOULOU_SHORT');
--=======================================================================================================================	
-- CIVILIZATIONS
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------ 
-- Civilizations
------------------------------------------------------------------------------------------------------------------------ 	
INSERT INTO Civilizations 	
		(Type, 									DerivativeCiv,						SoundtrackTag,  MapImage, 							DawnOfManQuote, 								DawnOfManImage,					Description,								ShortDescription,								Adjective,										Civilopedia,												CivilopediaTag,										DefaultPlayerColor,						ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas,							PortraitIndex,	AlphaIconAtlas)
SELECT	'CIVILIZATION_NC_WASSOULOU',	'TXT_KEY_CIV_TAL_NC_WASSOULOU_DESC',	'Songhai', 		'NC_MapWassoulou512.dds',	'TXT_KEY_CIV_DAWN_NC_WASSOULOU_TEXT',	'NC_DOM_Wassoulou.dds',	'TXT_KEY_CIV_NC_WASSOULOU_DESC', 	'TXT_KEY_CIV_NC_WASSOULOU_SHORT_DESC',	'TXT_KEY_CIV_NC_WASSOULOU_ADJECTIVE',	'TXT_KEY_CIVILOPEDIA_CIVS_NC_WASSOULOU_TEXT_1',		'TXT_KEY_CIVILOPEDIA_CIVS_NC_WASSOULOU',	'PLAYERCOLOR_NC_WASSOULOU',		ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, 'NC_WASSOULOU_ICON_ATLAS',	0,				'NC_WASSOULOU_ALPHA_ATLAS'
FROM Civilizations WHERE Type = 'CIVILIZATION_SONGHAI';
------------------------------------------------------------------------------------------------------------------------ 
-- Civilization_CityNames
------------------------------------------------------------------------------------------------------------------------ 	
INSERT INTO Civilization_CityNames 
		(CivilizationType, 						CityName)
VALUES	('CIVILIZATION_NC_WASSOULOU',	'TXT_KEY_CITY_NAME_NC_WASSOULOU_01'),
		('CIVILIZATION_NC_WASSOULOU',	'TXT_KEY_CITY_NAME_NC_WASSOULOU_02'),
		('CIVILIZATION_NC_WASSOULOU',	'TXT_KEY_CITY_NAME_NC_WASSOULOU_03'),
		('CIVILIZATION_NC_WASSOULOU',	'TXT_KEY_CITY_NAME_NC_WASSOULOU_04'),
		('CIVILIZATION_NC_WASSOULOU',	'TXT_KEY_CITY_NAME_NC_WASSOULOU_05'),
		('CIVILIZATION_NC_WASSOULOU',	'TXT_KEY_CITY_NAME_NC_WASSOULOU_06'),
		('CIVILIZATION_NC_WASSOULOU',	'TXT_KEY_CITY_NAME_NC_WASSOULOU_07'),
		('CIVILIZATION_NC_WASSOULOU',	'TXT_KEY_CITY_NAME_NC_WASSOULOU_08'),
		('CIVILIZATION_NC_WASSOULOU',	'TXT_KEY_CITY_NAME_NC_WASSOULOU_09'),
		('CIVILIZATION_NC_WASSOULOU',	'TXT_KEY_CITY_NAME_NC_WASSOULOU_10'),
		('CIVILIZATION_NC_WASSOULOU',	'TXT_KEY_CITY_NAME_NC_WASSOULOU_11'),
		('CIVILIZATION_NC_WASSOULOU',	'TXT_KEY_CITY_NAME_NC_WASSOULOU_12'),
		('CIVILIZATION_NC_WASSOULOU',	'TXT_KEY_CITY_NAME_NC_WASSOULOU_13'),
		('CIVILIZATION_NC_WASSOULOU',	'TXT_KEY_CITY_NAME_NC_WASSOULOU_14'),
		('CIVILIZATION_NC_WASSOULOU',	'TXT_KEY_CITY_NAME_NC_WASSOULOU_15'),
		('CIVILIZATION_NC_WASSOULOU',	'TXT_KEY_CITY_NAME_NC_WASSOULOU_16'),
		('CIVILIZATION_NC_WASSOULOU',	'TXT_KEY_CITY_NAME_NC_WASSOULOU_17'),
		('CIVILIZATION_NC_WASSOULOU',	'TXT_KEY_CITY_NAME_NC_WASSOULOU_18'),
		('CIVILIZATION_NC_WASSOULOU',	'TXT_KEY_CITY_NAME_NC_WASSOULOU_19'),
		('CIVILIZATION_NC_WASSOULOU',	'TXT_KEY_CITY_NAME_NC_WASSOULOU_20'),
		('CIVILIZATION_NC_WASSOULOU',	'TXT_KEY_CITY_NAME_NC_WASSOULOU_21'),
		('CIVILIZATION_NC_WASSOULOU',	'TXT_KEY_CITY_NAME_NC_WASSOULOU_22'),
		('CIVILIZATION_NC_WASSOULOU',	'TXT_KEY_CITY_NAME_NC_WASSOULOU_23'),
		('CIVILIZATION_NC_WASSOULOU',	'TXT_KEY_CITY_NAME_NC_WASSOULOU_24'),
		('CIVILIZATION_NC_WASSOULOU',	'TXT_KEY_CITY_NAME_NC_WASSOULOU_25'),
		('CIVILIZATION_NC_WASSOULOU',	'TXT_KEY_CITY_NAME_NC_WASSOULOU_26'),
		('CIVILIZATION_NC_WASSOULOU',	'TXT_KEY_CITY_NAME_NC_WASSOULOU_27'),
		('CIVILIZATION_NC_WASSOULOU',	'TXT_KEY_CITY_NAME_NC_WASSOULOU_28'),
		('CIVILIZATION_NC_WASSOULOU',	'TXT_KEY_CITY_NAME_NC_WASSOULOU_29'),
		('CIVILIZATION_NC_WASSOULOU',	'TXT_KEY_CITY_NAME_NC_WASSOULOU_30'),
		('CIVILIZATION_NC_WASSOULOU',	'TXT_KEY_CITY_NAME_NC_WASSOULOU_31'),
		('CIVILIZATION_NC_WASSOULOU',	'TXT_KEY_CITY_NAME_NC_WASSOULOU_32'),
		('CIVILIZATION_NC_WASSOULOU',	'TXT_KEY_CITY_NAME_NC_WASSOULOU_33'),
		('CIVILIZATION_NC_WASSOULOU',	'TXT_KEY_CITY_NAME_NC_WASSOULOU_34'),
		('CIVILIZATION_NC_WASSOULOU',	'TXT_KEY_CITY_NAME_NC_WASSOULOU_35'),
		('CIVILIZATION_NC_WASSOULOU',	'TXT_KEY_CITY_NAME_NC_WASSOULOU_36');
------------------------------------------------------------------------------------------------------------------------ 
-- Civilization_FreeBuildingClasses
------------------------------------------------------------------------------------------------------------------------ 		
INSERT INTO Civilization_FreeBuildingClasses 
		(CivilizationType, 						BuildingClassType)
SELECT	'CIVILIZATION_NC_WASSOULOU', 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE CivilizationType = 'CIVILIZATION_SONGHAI';
------------------------------------------------------------------------------------------------------------------------ 
-- Civilization_FreeTechs
------------------------------------------------------------------------------------------------------------------------ 	
INSERT INTO Civilization_FreeTechs 
		(CivilizationType, 						TechType)
SELECT	'CIVILIZATION_NC_WASSOULOU', 	TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_SONGHAI';
------------------------------------------------------------------------------------------------------------------------ 
-- Civilization_FreeUnits
------------------------------------------------------------------------------------------------------------------------ 	
INSERT INTO Civilization_FreeUnits 
		(CivilizationType, 						UnitClassType, Count, UnitAIType)
SELECT	'CIVILIZATION_NC_WASSOULOU', 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_SONGHAI';
------------------------------------------------------------------------------------------------------------------------ 
-- Civilization_Leaders
------------------------------------------------------------------------------------------------------------------------ 		
INSERT INTO Civilization_Leaders 
		(CivilizationType, 						LeaderheadType)
VALUES	('CIVILIZATION_NC_WASSOULOU',	'LEADER_NC_WASSOULOU');
------------------------------------------------------------------------------------------------------------------------ 
-- Civilization_BuildingClassOverrides 
------------------------------------------------------------------------------------------------------------------------ 	
INSERT INTO Civilization_BuildingClassOverrides 
		(CivilizationType, 						BuildingClassType, 			BuildingType)
VALUES	('CIVILIZATION_NC_WASSOULOU',	'BUILDINGCLASS_ARMORY', 	'BUILDING_NC_DYULA_GUNSMITH');
------------------------------------------------------------------------------------------------------------------------ 
-- Civilization_UnitClassOverrides 
------------------------------------------------------------------------------------------------------------------------ 	
INSERT INTO Civilization_UnitClassOverrides 
		(CivilizationType, 						UnitClassType, 				UnitType)
VALUES	('CIVILIZATION_NC_WASSOULOU',	'UNITCLASS_MUSKETMAN', 	'UNIT_NC_BOLO');
------------------------------------------------------------------------------------------------------------------------ 
-- Civilization_Religions
------------------------------------------------------------------------------------------------------------------------ 	
INSERT INTO Civilization_Religions 
		(CivilizationType, 						ReligionType)
VALUES	('CIVILIZATION_NC_WASSOULOU',	'RELIGION_ISLAM');
------------------------------------------------------------------------------------------------------------------------ 
-- Civilization_SpyNames
------------------------------------------------------------------------------------------------------------------------ 	
INSERT INTO Civilization_SpyNames 
		(CivilizationType, 						SpyName)
VALUES	('CIVILIZATION_NC_WASSOULOU',	'TXT_KEY_SPY_NAME_NC_WASSOULOU_0'),	
		('CIVILIZATION_NC_WASSOULOU',	'TXT_KEY_SPY_NAME_NC_WASSOULOU_1'),
		('CIVILIZATION_NC_WASSOULOU',	'TXT_KEY_SPY_NAME_NC_WASSOULOU_2'),
		('CIVILIZATION_NC_WASSOULOU',	'TXT_KEY_SPY_NAME_NC_WASSOULOU_3'),
		('CIVILIZATION_NC_WASSOULOU',	'TXT_KEY_SPY_NAME_NC_WASSOULOU_4'),
		('CIVILIZATION_NC_WASSOULOU',	'TXT_KEY_SPY_NAME_NC_WASSOULOU_5'),
		('CIVILIZATION_NC_WASSOULOU',	'TXT_KEY_SPY_NAME_NC_WASSOULOU_6'),
		('CIVILIZATION_NC_WASSOULOU',	'TXT_KEY_SPY_NAME_NC_WASSOULOU_7'),
		('CIVILIZATION_NC_WASSOULOU',	'TXT_KEY_SPY_NAME_NC_WASSOULOU_8'),
		('CIVILIZATION_NC_WASSOULOU',	'TXT_KEY_SPY_NAME_NC_WASSOULOU_9');
------------------------------------------------------------------------------------------------------------------------ 
-- Civilization_Start_Region_Priority
------------------------------------------------------------------------------------------------------------------------ 	
INSERT INTO Civilization_Start_Region_Priority 
		(CivilizationType, 						RegionType)
VALUES	('CIVILIZATION_NC_WASSOULOU', 'REGION_PLAINS');
--=======================================================================================================================
--=======================================================================================================================