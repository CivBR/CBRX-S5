--=======================================================================================================================
-- MASTER TABLES
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS CustomModOptions(Name Text, Value INTEGER, Class INTEGER, DbUpdates INTEGER);
CREATE TABLE IF NOT EXISTS JFD_GlobalUserSettings (Type text, Value integer default 1);
--=======================================================================================================================
-- GAME DEFINES
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------
-- BuildingClasses
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO BuildingClasses
		(Type, 							DefaultBuilding)
VALUES	('BUILDINGCLASS_JFD_CHAPEL_1', 	'BUILDING_JFD_CHAPEL_1'),
		('BUILDINGCLASS_JFD_CHAPEL_2', 	'BUILDING_JFD_CHAPEL_2');

UPDATE BuildingClasses
SET Description = 'TXT_KEY_' || DefaultBuilding
WHERE DefaultBuilding IN ('BUILDING_JFD_CHAPEL_1', 'BUILDING_JFD_CHAPEL_2');
--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================		
------------------------------------------------------------------------------------------------------------------------	
-- Buildings
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Buildings 	
		(Type, 						BuildingClass, PrereqTech, Cost, FaithCost, GoldMaintenance, MinAreaSize, NeverCapture, Description, 					Help, 								Strategy,								Civilopedia, 						ArtDefineTag, PortraitIndex, IconAtlas)
SELECT	'BUILDING_JFD_CHAPEL',		BuildingClass, PrereqTech, Cost, FaithCost, GoldMaintenance, MinAreaSize, 1, 			'TXT_KEY_BUILDING_JFD_CHAPEL', 	'TXT_KEY_BUILDING_JFD_CHAPEL_HELP', 'TXT_KEY_BUILDING_JFD_CHAPEL_STRATEGY',	'TXT_KEY_BUILDING_JFD_CHAPEL_TEXT', ArtDefineTag, 3, 			 'JFD_PAPAL_STATES_JULIUS_II_ICON_ATLAS'
FROM Buildings WHERE Type = 'BUILDING_TEMPLE';		

UPDATE Buildings
SET GreatWorkCount = 1, GreatWorkSlotType = 'GREAT_WORK_SLOT_ART_ARTIFACT'
WHERE Type = 'BUILDING_JFD_CHAPEL';

INSERT INTO Buildings 	
		(Type, 						BuildingClass,				  PrereqTech, Cost, FaithCost, GoldMaintenance, MinAreaSize, NeverCapture, Description, 					Help, 								Strategy,								Civilopedia, 						ArtDefineTag, PortraitIndex, IconAtlas)
SELECT	'BUILDING_JFD_CHAPEL_1',	'BUILDINGCLASS_JFD_CHAPEL_1', PrereqTech, Cost, FaithCost, GoldMaintenance, MinAreaSize, 1, 			'TXT_KEY_BUILDING_JFD_CHAPEL', 	'TXT_KEY_BUILDING_JFD_CHAPEL_HELP', 'TXT_KEY_BUILDING_JFD_CHAPEL_STRATEGY',	'TXT_KEY_BUILDING_JFD_CHAPEL_TEXT', ArtDefineTag, 3, 			 'JFD_PAPAL_STATES_JULIUS_II_ICON_ATLAS'
FROM Buildings WHERE Type = 'BUILDING_TEMPLE';		

UPDATE Buildings
SET GreatWorkCount = 1, GreatWorkSlotType = 'GREAT_WORK_SLOT_MUSIC', PrereqTech = null
WHERE Type = 'BUILDING_JFD_CHAPEL_1';

INSERT INTO Buildings 	
		(Type, 						BuildingClass,				  PrereqTech, Cost, FaithCost, GoldMaintenance, MinAreaSize, NeverCapture, Description, 					Help, 								Strategy,								Civilopedia, 						ArtDefineTag, PortraitIndex, IconAtlas)
SELECT	'BUILDING_JFD_CHAPEL_2',	'BUILDINGCLASS_JFD_CHAPEL_2', PrereqTech, Cost, FaithCost, GoldMaintenance, MinAreaSize, 1, 			'TXT_KEY_BUILDING_JFD_CHAPEL', 	'TXT_KEY_BUILDING_JFD_CHAPEL_HELP', 'TXT_KEY_BUILDING_JFD_CHAPEL_STRATEGY',	'TXT_KEY_BUILDING_JFD_CHAPEL_TEXT', ArtDefineTag, 3, 			 'JFD_PAPAL_STATES_JULIUS_II_ICON_ATLAS'
FROM Buildings WHERE Type = 'BUILDING_TEMPLE';	

UPDATE Buildings
SET GreatWorkCount = 1, GreatWorkSlotType = 'GREAT_WORK_SLOT_LITERATURE', PrereqTech = null
WHERE Type = 'BUILDING_JFD_CHAPEL_2';
------------------------------------------------------------------------------------------------------------------------	
-- Building_YieldChanges
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_YieldChanges 	
		(BuildingType, 				YieldType, Yield)
SELECT	'BUILDING_JFD_CHAPEL',		YieldType, Yield
FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_TEMPLE';	

INSERT INTO Building_YieldChanges 	
		(BuildingType, 				YieldType, Yield)
SELECT	'BUILDING_JFD_CHAPEL_1',	YieldType, Yield
FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_TEMPLE';	

INSERT INTO Building_YieldChanges 	
		(BuildingType, 				YieldType, Yield)
SELECT	'BUILDING_JFD_CHAPEL_2',	YieldType, Yield
FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_TEMPLE';	
------------------------------------------------------------------------------------------------------------------------	
-- Building_ClassesNeededInCity
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_ClassesNeededInCity 	
		(BuildingType, 				BuildingClassType)
SELECT	'BUILDING_JFD_CHAPEL',		BuildingClassType
FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_TEMPLE';	

INSERT INTO Building_ClassesNeededInCity 	
		(BuildingType, 				BuildingClassType)
SELECT	'BUILDING_JFD_CHAPEL_1',	BuildingClassType
FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_TEMPLE';	

INSERT INTO Building_ClassesNeededInCity 	
		(BuildingType, 				BuildingClassType)
SELECT	'BUILDING_JFD_CHAPEL_2',	BuildingClassType
FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_TEMPLE';	
------------------------------------------------------------------------------------------------------------------------	
-- Building_Flavors
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_Flavors 	
		(BuildingType, 				FlavorType, Flavor)
SELECT	'BUILDING_JFD_CHAPEL',		FlavorType, Flavor
FROM Building_Flavors WHERE BuildingType = 'BUILDING_TEMPLE';

INSERT INTO Building_Flavors 	
		(BuildingType, 				FlavorType, Flavor)
SELECT	'BUILDING_JFD_CHAPEL_1',	FlavorType, Flavor
FROM Building_Flavors WHERE BuildingType = 'BUILDING_TEMPLE';

INSERT INTO Building_Flavors 	
		(BuildingType, 				FlavorType, Flavor)
SELECT	'BUILDING_JFD_CHAPEL_2',	FlavorType, Flavor
FROM Building_Flavors WHERE BuildingType = 'BUILDING_TEMPLE';

INSERT INTO Building_Flavors 	
		(BuildingType, 				FlavorType, 			Flavor)
VALUES	('BUILDING_JFD_CHAPEL',		'FLAVOR_CULTURE',		10),
		('BUILDING_JFD_CHAPEL',		'FLAVOR_GREAT_PEOPLE',	10),
		('BUILDING_JFD_CHAPEL_1',	'FLAVOR_CULTURE',		10),
		('BUILDING_JFD_CHAPEL_1',	'FLAVOR_GREAT_PEOPLE',	10),
		('BUILDING_JFD_CHAPEL_2',	'FLAVOR_CULTURE',		10),
		('BUILDING_JFD_CHAPEL_2',	'FLAVOR_GREAT_PEOPLE',	10);
--=======================================================================================================================
-- UNITS
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------
-- UnitPromotions
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO UnitPromotions 
		(Type, 									LostWithUpgrade,  Description, 							Help, 										Sound, 				 CannotBeChosen,  PortraitIndex, IconAtlas, 		 PediaType, 		 PediaEntry)
VALUES	('PROMOTION_JFD_SWISS_GUARD_ACTIVE', 	0,				  'TXT_KEY_PROMOTION_JFD_SWISS_GUARD',	'TXT_KEY_PROMOTION_JFD_SWISS_GUARD_HELP',	'AS2D_IF_LEVELUP',   1, 			  59, 			 'ABILITY_ATLAS',    'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_SWISS_GUARD'),
		('PROMOTION_JFD_SWISS_GUARD_INACTIVE', 	0,				  'TXT_KEY_PROMOTION_JFD_SWISS_GUARD',	'TXT_KEY_PROMOTION_JFD_SWISS_GUARD_HELP',	'AS2D_IF_LEVELUP',   1, 			  59, 			 'ABILITY_ATLAS',    'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_SWISS_GUARD');

UPDATE UnitPromotions
SET HPHealedIfDestroyEnemy = 50
WHERE Type = 'PROMOTION_JFD_SWISS_GUARD_ACTIVE';
----------------------------------------------------------------------------------------------------------------------------
-- JFD_Civilopedia_HideFromPedia
----------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS JFD_Civilopedia_HideFromPedia(Type text);
INSERT INTO JFD_Civilopedia_HideFromPedia
		(Type)
VALUES	('PROMOTION_JFD_SWISS_GUARD_INACTIVE');
------------------------------------------------------------------------------------------------------------------------	
-- Units
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Units 	
		(Type, 					Class, PrereqTech, Combat, Range, RangedCombat, Cost,    FaithCost, RequiresFaithPurchaseEnabled, PurchaseOnly, MoveAfterPurchase, Moves, CombatClass, Domain, DefaultUnitAI, MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, IgnoreBuildingDefense, GoodyHutUpgradeUnitClass, AdvancedStartCost, XPValueAttack, XPValueDefense, MoveRate, WorkRate, Description, 					  Help, 								Strategy, 								 Civilopedia, 						  UnitArtInfo, 					  UnitFlagAtlas,								UnitFlagIconOffset,	 IconAtlas,									PortraitIndex)
SELECT	'UNIT_JFD_SWISS_GUARD',	Class, PrereqTech, Combat, Range, RangedCombat, Cost+20, Cost*2,	1,						      PurchaseOnly, MoveAfterPurchase, Moves, CombatClass, Domain, DefaultUnitAI, MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, IgnoreBuildingDefense, GoodyHutUpgradeUnitClass, AdvancedStartCost, XPValueAttack, XPValueDefense, MoveRate, WorkRate, 'TXT_KEY_UNIT_JFD_SWISS_GUARD', 'TXT_KEY_UNIT_JFD_SWISS_GUARD_HELP',  'TXT_KEY_UNIT_JFD_SWISS_GUARD_STRATEGY', 'TXT_KEY_UNIT_JFD_SWISS_GUARD_TEXT', 'ART_DEF_UNIT_JFD_SWISS_GUARD', 'JFD_PAPAL_STATES_JULIUS_II_UNIT_FLAG_ATLAS',	0,					 'JFD_PAPAL_STATES_JULIUS_II_ICON_ATLAS',	2
FROM Units WHERE Type = 'UNIT_GERMAN_LANDSKNECHT';	

UPDATE Units
SET PrereqTech = 'TECH_CIVIL_SERVICE'
WHERE Type = 'UNIT_JFD_SWISS_GUARD';
------------------------------------------------------------------------------------------------------------------------
-- Unit_AITypes
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_AITypes 	
		(UnitType, 				 UnitAIType)
SELECT	'UNIT_JFD_SWISS_GUARD',	 UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_GERMAN_LANDSKNECHT';
------------------------------------------------------------------------------------------------------------------------	
-- Unit_ClassUpgrades
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 				 UnitClassType)
SELECT	'UNIT_JFD_SWISS_GUARD',  UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_GERMAN_LANDSKNECHT';
------------------------------------------------------------------------------------------------------------------------
-- Unit_Flavors
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_Flavors
		(UnitType, 				 FlavorType, Flavor)
SELECT	'UNIT_JFD_SWISS_GUARD',	 FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_GERMAN_LANDSKNECHT';
------------------------------------------------------------------------------------------------------------------------
-- Unit_FreePromotions
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_FreePromotions 
		(UnitType, 				 PromotionType)
VALUES	('UNIT_JFD_SWISS_GUARD', 'PROMOTION_ANTI_MOUNTED_I'),
		('UNIT_JFD_SWISS_GUARD', 'PROMOTION_JFD_SWISS_GUARD_INACTIVE');
------------------------------------------------------------------------------------------------------------------------
-- UnitGameplay2DScripts
------------------------------------------------------------------------------------------------------------------------
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 				 SelectionSound, FirstSelectionSound)
SELECT	'UNIT_JFD_SWISS_GUARD',  SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_GERMAN_LANDSKNECHT';	
--=======================================================================================================================	
-- LEADERS
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- Leaders
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Leaders 
		(Type, 									Description, 									Civilopedia, 										CivilopediaTag, 											ArtDefineTag, 							IconAtlas, 									PortraitIndex)
VALUES	('LEADER_JFD_PAPAL_STATES_JULIUS_II', 	'TXT_KEY_LEADER_JFD_PAPAL_STATES_JULIUS_II',	'TXT_KEY_LEADER_JFD_PAPAL_STATES_JULIUS_II_PEDIA', 	'TXT_KEY_CIVILOPEDIA_LEADERS_JFD_PAPAL_STATES_JULIUS_II', 	'JFD_PapalStatesJuliusII_Scene.xml',	'JFD_PAPAL_STATES_JULIUS_II_ICON_ATLAS',    1);

UPDATE Leaders
SET VictoryCompetitiveness = 9,
WonderCompetitiveness = 4,
MinorCivCompetitiveness = 6,
Boldness = 8,
DiploBalance = 4,
WarmongerHate = 6,
DenounceWillingness = 7,
DoFWillingness = 3,
Loyalty = 3,
Neediness = 6,
Forgiveness = 5,
Chattiness = 4,
Meanness = 6
WHERE Type = 'LEADER_JFD_PAPAL_STATES_JULIUS_II';
------------------------------------------------------------------------------------------------------------------------
-- Leader_MajorCivApproachBiases
------------------------------------------------------------------------------------------------------------------------				
INSERT INTO Leader_MajorCivApproachBiases 
		(LeaderType, 							MajorCivApproachType, 				Bias)
VALUES	('LEADER_JFD_PAPAL_STATES_JULIUS_II', 	'MAJOR_CIV_APPROACH_WAR', 			7),
		('LEADER_JFD_PAPAL_STATES_JULIUS_II', 	'MAJOR_CIV_APPROACH_HOSTILE', 		6),
		('LEADER_JFD_PAPAL_STATES_JULIUS_II', 	'MAJOR_CIV_APPROACH_DECEPTIVE', 	7),
		('LEADER_JFD_PAPAL_STATES_JULIUS_II', 	'MAJOR_CIV_APPROACH_GUARDED', 		5),
		('LEADER_JFD_PAPAL_STATES_JULIUS_II', 	'MAJOR_CIV_APPROACH_AFRAID', 		5),
		('LEADER_JFD_PAPAL_STATES_JULIUS_II', 	'MAJOR_CIV_APPROACH_FRIENDLY', 		4),
		('LEADER_JFD_PAPAL_STATES_JULIUS_II', 	'MAJOR_CIV_APPROACH_NEUTRAL', 		4);
------------------------------------------------------------------------------------------------------------------------
-- Leader_MajorCivApproachBiases
------------------------------------------------------------------------------------------------------------------------ 				
INSERT INTO Leader_MinorCivApproachBiases 
		(LeaderType, 							MinorCivApproachType, 				Bias)
VALUES	('LEADER_JFD_PAPAL_STATES_JULIUS_II', 	'MINOR_CIV_APPROACH_IGNORE', 		4),
		('LEADER_JFD_PAPAL_STATES_JULIUS_II', 	'MINOR_CIV_APPROACH_FRIENDLY', 		4),
		('LEADER_JFD_PAPAL_STATES_JULIUS_II', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	5),
		('LEADER_JFD_PAPAL_STATES_JULIUS_II', 	'MINOR_CIV_APPROACH_CONQUEST', 		7),
		('LEADER_JFD_PAPAL_STATES_JULIUS_II', 	'MINOR_CIV_APPROACH_BULLY', 		7);
------------------------------------------------------------------------------------------------------------------------ 
-- Leader_Flavors
------------------------------------------------------------------------------------------------------------------------				
INSERT INTO Leader_Flavors 
		(LeaderType, 							FlavorType, 						Flavor)
VALUES	('LEADER_JFD_PAPAL_STATES_JULIUS_II', 	'FLAVOR_OFFENSE', 					7),
		('LEADER_JFD_PAPAL_STATES_JULIUS_II', 	'FLAVOR_DEFENSE', 					7),
		('LEADER_JFD_PAPAL_STATES_JULIUS_II', 	'FLAVOR_CITY_DEFENSE', 				5),
		('LEADER_JFD_PAPAL_STATES_JULIUS_II', 	'FLAVOR_MILITARY_TRAINING', 		6),
		('LEADER_JFD_PAPAL_STATES_JULIUS_II', 	'FLAVOR_RECON', 					5),
		('LEADER_JFD_PAPAL_STATES_JULIUS_II', 	'FLAVOR_RANGED', 					5),
		('LEADER_JFD_PAPAL_STATES_JULIUS_II', 	'FLAVOR_MOBILE', 					5),
		('LEADER_JFD_PAPAL_STATES_JULIUS_II', 	'FLAVOR_NAVAL', 					4),
		('LEADER_JFD_PAPAL_STATES_JULIUS_II', 	'FLAVOR_NAVAL_RECON', 				4),
		('LEADER_JFD_PAPAL_STATES_JULIUS_II', 	'FLAVOR_NAVAL_GROWTH', 				4),
		('LEADER_JFD_PAPAL_STATES_JULIUS_II', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	4),
		('LEADER_JFD_PAPAL_STATES_JULIUS_II', 	'FLAVOR_AIR', 						5),
		('LEADER_JFD_PAPAL_STATES_JULIUS_II', 	'FLAVOR_EXPANSION', 				8),
		('LEADER_JFD_PAPAL_STATES_JULIUS_II', 	'FLAVOR_GROWTH', 					5),
		('LEADER_JFD_PAPAL_STATES_JULIUS_II', 	'FLAVOR_TILE_IMPROVEMENT', 			5),
		('LEADER_JFD_PAPAL_STATES_JULIUS_II', 	'FLAVOR_INFRASTRUCTURE', 			6),
		('LEADER_JFD_PAPAL_STATES_JULIUS_II', 	'FLAVOR_PRODUCTION', 				5),
		('LEADER_JFD_PAPAL_STATES_JULIUS_II', 	'FLAVOR_GOLD', 						7),
		('LEADER_JFD_PAPAL_STATES_JULIUS_II', 	'FLAVOR_SCIENCE', 					4),
		('LEADER_JFD_PAPAL_STATES_JULIUS_II', 	'FLAVOR_CULTURE', 					7),
		('LEADER_JFD_PAPAL_STATES_JULIUS_II', 	'FLAVOR_HAPPINESS', 				4),
		('LEADER_JFD_PAPAL_STATES_JULIUS_II', 	'FLAVOR_GREAT_PEOPLE', 				7),
		('LEADER_JFD_PAPAL_STATES_JULIUS_II', 	'FLAVOR_WONDER', 					6),
		('LEADER_JFD_PAPAL_STATES_JULIUS_II', 	'FLAVOR_RELIGION', 					9),
		('LEADER_JFD_PAPAL_STATES_JULIUS_II', 	'FLAVOR_DIPLOMACY', 				5),
		('LEADER_JFD_PAPAL_STATES_JULIUS_II', 	'FLAVOR_SPACESHIP', 				3),
		('LEADER_JFD_PAPAL_STATES_JULIUS_II', 	'FLAVOR_WATER_CONNECTION', 			4),
		('LEADER_JFD_PAPAL_STATES_JULIUS_II', 	'FLAVOR_NUKE', 						5),
		('LEADER_JFD_PAPAL_STATES_JULIUS_II', 	'FLAVOR_USE_NUKE', 					5),
		('LEADER_JFD_PAPAL_STATES_JULIUS_II', 	'FLAVOR_ESPIONAGE', 				7),
		('LEADER_JFD_PAPAL_STATES_JULIUS_II', 	'FLAVOR_AIRLIFT', 					5),
		('LEADER_JFD_PAPAL_STATES_JULIUS_II', 	'FLAVOR_I_TRADE_DESTINATION', 		5),
		('LEADER_JFD_PAPAL_STATES_JULIUS_II', 	'FLAVOR_I_TRADE_ORIGIN', 			5),
		('LEADER_JFD_PAPAL_STATES_JULIUS_II', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
		('LEADER_JFD_PAPAL_STATES_JULIUS_II', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
		('LEADER_JFD_PAPAL_STATES_JULIUS_II', 	'FLAVOR_ARCHAEOLOGY', 				5),
		('LEADER_JFD_PAPAL_STATES_JULIUS_II', 	'FLAVOR_AIR_CARRIER', 				5);
--------------------------------------------------------------------------------------------------------------------------
-- Diplomacy_Responses
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Diplomacy_Responses
		(LeaderType, 							ResponseType, 							 			Response, 																				Bias)
VALUES 	('LEADER_JFD_PAPAL_STATES_JULIUS_II',	'RESPONSE_AI_DOF_BACKSTAB', 			 			'TXT_KEY_LEADER_JFD_PAPAL_STATES_JULIUS_II_DENOUNCE_FRIEND%', 			 				500),
		('LEADER_JFD_PAPAL_STATES_JULIUS_II',	'RESPONSE_ATTACKED_HOSTILE', 			 			'TXT_KEY_LEADER_JFD_PAPAL_STATES_JULIUS_II_ATTACKED_HOSTILE%', 			 				500),
		('LEADER_JFD_PAPAL_STATES_JULIUS_II',	'RESPONSE_ATTACKED_STRONG_HOSTILE', 				'TXT_KEY_LEADER_JFD_PAPAL_STATES_JULIUS_II_ATTACKED_HOSTILE%', 			 				500),
		('LEADER_JFD_PAPAL_STATES_JULIUS_II',	'RESPONSE_DEFEATED', 					 			'TXT_KEY_LEADER_JFD_PAPAL_STATES_JULIUS_II_DEFEATED%', 					 				500),
		('LEADER_JFD_PAPAL_STATES_JULIUS_II',	'RESPONSE_DOW_GENERIC', 				 			'TXT_KEY_LEADER_JFD_PAPAL_STATES_JULIUS_II_DOW_GENERIC%', 				 				500),
		('LEADER_JFD_PAPAL_STATES_JULIUS_II',	'RESPONSE_EXPANSION_SERIOUS_WARNING', 				'TXT_KEY_LEADER_JFD_PAPAL_STATES_JULIUS_II_EXPANSION_SERIOUS_WARNING%', 	 			500),
		('LEADER_JFD_PAPAL_STATES_JULIUS_II',	'RESPONSE_FIRST_GREETING', 				 			'TXT_KEY_LEADER_JFD_PAPAL_STATES_JULIUS_II_FIRSTGREETING%', 				 			500),
		('LEADER_JFD_PAPAL_STATES_JULIUS_II',	'RESPONSE_GREETING_HOSTILE_HELLO', 					'TXT_KEY_LEADER_JFD_PAPAL_STATES_JULIUS_II_GREETING_HOSTILE_HELLO%', 		 			500),
		('LEADER_JFD_PAPAL_STATES_JULIUS_II',	'RESPONSE_GREETING_NEUTRAL_HELLO', 					'TXT_KEY_LEADER_JFD_PAPAL_STATES_JULIUS_II_GREETING_NEUTRAL_HELLO%', 		 			500),
		('LEADER_JFD_PAPAL_STATES_JULIUS_II',	'RESPONSE_GREETING_POLITE_HELLO', 					'TXT_KEY_LEADER_JFD_PAPAL_STATES_JULIUS_II_GREETING_POLITE_HELLO%', 		 			500),
		('LEADER_JFD_PAPAL_STATES_JULIUS_II',	'RESPONSE_HOSTILE_AGGRESSIVE_MILITARY_WARNING', 	'TXT_KEY_LEADER_JFD_PAPAL_STATES_JULIUS_II_HOSTILE_AGGRESSIVE_MILITARY_WARNING%', 		500),
		('LEADER_JFD_PAPAL_STATES_JULIUS_II',	'RESPONSE_LUXURY_TRADE', 							'TXT_KEY_LEADER_JFD_PAPAL_STATES_JULIUS_II_LUXURY_TRADE%', 		  						500),
		('LEADER_JFD_PAPAL_STATES_JULIUS_II',	'RESPONSE_OPEN_BORDERS_EXCHANGE', 					'TXT_KEY_LEADER_JFD_PAPAL_STATES_JULIUS_II_OPEN_BORDERS_EXCHANGE%', 		  			500),
		('LEADER_JFD_PAPAL_STATES_JULIUS_II',	'RESPONSE_PLOT_BUYING_SERIOUS_WARNING', 			'TXT_KEY_LEADER_JFD_PAPAL_STATES_JULIUS_II_PLOT_BUYING_SERIOUS_WARNING%', 				500),
		('LEADER_JFD_PAPAL_STATES_JULIUS_II',	'RESPONSE_REQUEST', 								'TXT_KEY_LEADER_JFD_PAPAL_STATES_JULIUS_II_REQUEST%', 		  							500),
		('LEADER_JFD_PAPAL_STATES_JULIUS_II',	'RESPONSE_TOO_SOON_FOR_DOF', 						'TXT_KEY_LEADER_JFD_PAPAL_STATES_JULIUS_II_TOO_SOON_FOR_DOF%', 							500),
		('LEADER_JFD_PAPAL_STATES_JULIUS_II',	'RESPONSE_TOO_SOON_NO_PEACE', 			 			'TXT_KEY_LEADER_JFD_PAPAL_STATES_JULIUS_II_TOO_SOON_NO_PEACE%', 			  			500),
		('LEADER_JFD_PAPAL_STATES_JULIUS_II',	'RESPONSE_RESPONSE_TO_BEING_DENOUNCED',  			'TXT_KEY_LEADER_JFD_PAPAL_STATES_JULIUS_II_RESPONSE_TO_BEING_DENOUNCED%',   			500),
		('LEADER_JFD_PAPAL_STATES_JULIUS_II',	'RESPONSE_WORK_AGAINST_SOMEONE', 		 			'TXT_KEY_LEADER_JFD_PAPAL_STATES_JULIUS_II_DENOUNCE%', 					  				500),
		('LEADER_JFD_PAPAL_STATES_JULIUS_II',	'RESPONSE_WORK_WITH_US', 				 			'TXT_KEY_LEADER_JFD_PAPAL_STATES_JULIUS_II_DEC_FRIENDSHIP%', 			  	  			500);
------------------------------------------------------------------------------------------------------------------------ 
-- Leader_Traits
------------------------------------------------------------------------------------------------------------------------ 
INSERT INTO Leader_Traits 
		(LeaderType, 							TraitType)
VALUES	('LEADER_JFD_PAPAL_STATES_JULIUS_II',	'TRAIT_JFD_PAPAL_STATES_JULIUS_II');
------------------------------------------------------------------------------------------------------------------------ 
-- Traits
------------------------------------------------------------------------------------------------------------------------ 
INSERT INTO Traits 
		(Type, 									Description, 								ShortDescription)
VALUES	('TRAIT_JFD_PAPAL_STATES_JULIUS_II', 	'TXT_KEY_TRAIT_JFD_PAPAL_STATES_JULIUS_II',	'TXT_KEY_TRAIT_JFD_PAPAL_STATES_JULIUS_II_SHORT');
----------------------------------------------------------------------------------------------------------------------------
-- UnitPromotions
----------------------------------------------------------------------------------------------------------------------------
INSERT INTO UnitPromotions 
		(Type, 												Description, 												Help, 															Sound, 				CannotBeChosen, PortraitIndex, 	IconAtlas, 			PediaType, 			PediaEntry)
VALUES	('PROMOTION_JFD_PAPAL_STATES_JULIUS_II_1', 			'TXT_KEY_PROMOTION_JFD_PAPAL_STATES_JULIUS_II_1', 			'TXT_KEY_PROMOTION_JFD_PAPAL_STATES_JULIUS_II_1_HELP', 			'AS2D_IF_LEVELUP', 	1, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_PAPAL_STATES_JULIUS_II_1'),
		('PROMOTION_JFD_PAPAL_STATES_JULIUS_II_1_OTHER', 	'TXT_KEY_PROMOTION_JFD_PAPAL_STATES_JULIUS_II_1_OTHER', 	'TXT_KEY_PROMOTION_JFD_PAPAL_STATES_JULIUS_II_1_OTHER_HELP', 	'AS2D_IF_LEVELUP', 	1, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_PAPAL_STATES_JULIUS_II_1_OTHER'),
		('PROMOTION_JFD_PAPAL_STATES_JULIUS_II_2', 			'TXT_KEY_PROMOTION_JFD_PAPAL_STATES_JULIUS_II_2', 			'TXT_KEY_PROMOTION_JFD_PAPAL_STATES_JULIUS_II_2_HELP', 			'AS2D_IF_LEVELUP', 	1, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_PAPAL_STATES_JULIUS_II_2'),
		('PROMOTION_JFD_PAPAL_STATES_JULIUS_II_3', 			'TXT_KEY_PROMOTION_JFD_PAPAL_STATES_JULIUS_II_3', 			'TXT_KEY_PROMOTION_JFD_PAPAL_STATES_JULIUS_II_3_HELP', 			'AS2D_IF_LEVELUP', 	1, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_PAPAL_STATES_JULIUS_II_3'),
		('PROMOTION_JFD_PAPAL_STATES_JULIUS_II_4', 			'TXT_KEY_PROMOTION_JFD_PAPAL_STATES_JULIUS_II_4', 			'TXT_KEY_PROMOTION_JFD_PAPAL_STATES_JULIUS_II_4_HELP', 			'AS2D_IF_LEVELUP', 	1, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_PAPAL_STATES_JULIUS_II_4'),
		('PROMOTION_JFD_PAPAL_STATES_JULIUS_II_4_OTHER', 	'TXT_KEY_PROMOTION_JFD_PAPAL_STATES_JULIUS_II_4_OTHER', 	'TXT_KEY_PROMOTION_JFD_PAPAL_STATES_JULIUS_II_4_OTHER_HELP', 	'AS2D_IF_LEVELUP', 	1, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_PAPAL_STATES_JULIUS_II_4_OTHER');
		
UPDATE UnitPromotions
SET CityAttack = 30
WHERe Type = 'PROMOTION_JFD_PAPAL_STATES_JULIUS_II_1_OTHER';

UPDATE UnitPromotions
SET SameTileHealChange = 5, AdjacentTileHealChange = 5
WHERe Type = 'PROMOTION_JFD_PAPAL_STATES_JULIUS_II_2';

UPDATE UnitPromotions
SET NearbyEnemyCombatMod = -5, NearbyEnemyCombatRange = 1
WHERe Type = 'PROMOTION_JFD_PAPAL_STATES_JULIUS_II_3';

UPDATE UnitPromotions
SET IgnoreZOC = 1
WHERe Type = 'PROMOTION_JFD_PAPAL_STATES_JULIUS_II_4';

UPDATE UnitPromotions
SET IgnoreZOC = 1
WHERe Type = 'PROMOTION_JFD_PAPAL_STATES_JULIUS_II_4_OTHER';
--=======================================================================================================================	
-- CIVILIZATIONS
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------ 
-- Civilizations
------------------------------------------------------------------------------------------------------------------------ 	
INSERT INTO Civilizations 	
		(Type, 										DerivativeCiv,							  SoundtrackTag,  MapImage, 							 DawnOfManQuote, 										DawnOfManImage,						Description,									ShortDescription,										Adjective,											Civilopedia,													CivilopediaTag,											DefaultPlayerColor,							ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas,									PortraitIndex,	AlphaIconAtlas)
SELECT	'CIVILIZATION_JFD_PAPAL_STATES_JULIUS_II',	'TXT_KEY_CIV_TAL_JFD_PAPAL_STATES_DESC',  'Rome', 		  'JFD_MapPapalStatesJuliusII512.dds',	 'TXT_KEY_CIV_DAWN_JFD_PAPAL_STATES_JULIUS_II_TEXT',	'JFD_DOM_PapalStatesJuliusII.dds',	'TXT_KEY_CIV_JFD_PAPAL_STATES_JULIUS_II_DESC', 	'TXT_KEY_CIV_JFD_PAPAL_STATES_JULIUS_II_SHORT_DESC',	'TXT_KEY_CIV_JFD_PAPAL_STATES_JULIUS_II_ADJECTIVE',	'TXT_KEY_CIVILOPEDIA_CIVS_JFD_PAPAL_STATES_JULIUS_II_TEXT_1',	'TXT_KEY_CIVILOPEDIA_CIVS_JFD_PAPAL_STATES_JULIUS_II',	'PLAYERCOLOR_JFD_PAPAL_STATES_JULIUS_II',	ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, 'JFD_PAPAL_STATES_JULIUS_II_ICON_ATLAS',	0,				'JFD_PAPAL_STATES_JULIUS_II_ALPHA_ATLAS'
FROM Civilizations WHERE Type = 'CIVILIZATION_ROME';
------------------------------------------------------------------------------------------------------------------------ 
-- Civilization_CityNames
------------------------------------------------------------------------------------------------------------------------ 	
INSERT INTO Civilization_CityNames 
		(CivilizationType, 							CityName)
VALUES	('CIVILIZATION_JFD_PAPAL_STATES_JULIUS_II', 'TXT_KEY_CITY_NAME_JFD_PAPAL_STATES_JULIUS_II_01'),
		('CIVILIZATION_JFD_PAPAL_STATES_JULIUS_II', 'TXT_KEY_CITY_NAME_JFD_PAPAL_STATES_JULIUS_II_02'),
		('CIVILIZATION_JFD_PAPAL_STATES_JULIUS_II', 'TXT_KEY_CITY_NAME_JFD_PAPAL_STATES_JULIUS_II_03'),
		('CIVILIZATION_JFD_PAPAL_STATES_JULIUS_II', 'TXT_KEY_CITY_NAME_JFD_PAPAL_STATES_JULIUS_II_04'),
		('CIVILIZATION_JFD_PAPAL_STATES_JULIUS_II', 'TXT_KEY_CITY_NAME_JFD_PAPAL_STATES_JULIUS_II_05'),
		('CIVILIZATION_JFD_PAPAL_STATES_JULIUS_II', 'TXT_KEY_CITY_NAME_JFD_PAPAL_STATES_JULIUS_II_06'),
		('CIVILIZATION_JFD_PAPAL_STATES_JULIUS_II', 'TXT_KEY_CITY_NAME_JFD_PAPAL_STATES_JULIUS_II_07'),
		('CIVILIZATION_JFD_PAPAL_STATES_JULIUS_II', 'TXT_KEY_CITY_NAME_JFD_PAPAL_STATES_JULIUS_II_08'),
		('CIVILIZATION_JFD_PAPAL_STATES_JULIUS_II', 'TXT_KEY_CITY_NAME_JFD_PAPAL_STATES_JULIUS_II_09'),
		('CIVILIZATION_JFD_PAPAL_STATES_JULIUS_II', 'TXT_KEY_CITY_NAME_JFD_PAPAL_STATES_JULIUS_II_10'),
		('CIVILIZATION_JFD_PAPAL_STATES_JULIUS_II', 'TXT_KEY_CITY_NAME_JFD_PAPAL_STATES_JULIUS_II_11'),
		('CIVILIZATION_JFD_PAPAL_STATES_JULIUS_II', 'TXT_KEY_CITY_NAME_JFD_PAPAL_STATES_JULIUS_II_12'),
		('CIVILIZATION_JFD_PAPAL_STATES_JULIUS_II', 'TXT_KEY_CITY_NAME_JFD_PAPAL_STATES_JULIUS_II_13'),
		('CIVILIZATION_JFD_PAPAL_STATES_JULIUS_II', 'TXT_KEY_CITY_NAME_JFD_PAPAL_STATES_JULIUS_II_14'),
		('CIVILIZATION_JFD_PAPAL_STATES_JULIUS_II', 'TXT_KEY_CITY_NAME_JFD_PAPAL_STATES_JULIUS_II_15'),
		('CIVILIZATION_JFD_PAPAL_STATES_JULIUS_II', 'TXT_KEY_CITY_NAME_JFD_PAPAL_STATES_JULIUS_II_16'),
		('CIVILIZATION_JFD_PAPAL_STATES_JULIUS_II', 'TXT_KEY_CITY_NAME_JFD_PAPAL_STATES_JULIUS_II_17'),
		('CIVILIZATION_JFD_PAPAL_STATES_JULIUS_II', 'TXT_KEY_CITY_NAME_JFD_PAPAL_STATES_JULIUS_II_18'),
		('CIVILIZATION_JFD_PAPAL_STATES_JULIUS_II', 'TXT_KEY_CITY_NAME_JFD_PAPAL_STATES_JULIUS_II_19'),
		('CIVILIZATION_JFD_PAPAL_STATES_JULIUS_II', 'TXT_KEY_CITY_NAME_JFD_PAPAL_STATES_JULIUS_II_20'),
		('CIVILIZATION_JFD_PAPAL_STATES_JULIUS_II', 'TXT_KEY_CITY_NAME_JFD_PAPAL_STATES_JULIUS_II_21'),
		('CIVILIZATION_JFD_PAPAL_STATES_JULIUS_II', 'TXT_KEY_CITY_NAME_JFD_PAPAL_STATES_JULIUS_II_22'),
		('CIVILIZATION_JFD_PAPAL_STATES_JULIUS_II', 'TXT_KEY_CITY_NAME_JFD_PAPAL_STATES_JULIUS_II_23'),
		('CIVILIZATION_JFD_PAPAL_STATES_JULIUS_II', 'TXT_KEY_CITY_NAME_JFD_PAPAL_STATES_JULIUS_II_24');
------------------------------------------------------------------------------------------------------------------------ 
-- Civilization_FreeBuildingClasses
------------------------------------------------------------------------------------------------------------------------ 		
INSERT INTO Civilization_FreeBuildingClasses 
		(CivilizationType, 							BuildingClassType)
SELECT	'CIVILIZATION_JFD_PAPAL_STATES_JULIUS_II', 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE CivilizationType = 'CIVILIZATION_ROME';
------------------------------------------------------------------------------------------------------------------------ 
-- Civilization_FreeTechs
------------------------------------------------------------------------------------------------------------------------ 	
INSERT INTO Civilization_FreeTechs 
		(CivilizationType, 							TechType)
SELECT	'CIVILIZATION_JFD_PAPAL_STATES_JULIUS_II', 	TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_ROME';
------------------------------------------------------------------------------------------------------------------------ 
-- Civilization_FreeUnits
------------------------------------------------------------------------------------------------------------------------ 	
INSERT INTO Civilization_FreeUnits	
		(CivilizationType, 							UnitClassType, Count, UnitAIType)
SELECT	'CIVILIZATION_JFD_PAPAL_STATES_JULIUS_II', 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_ROME';
------------------------------------------------------------------------------------------------------------------------ 
-- Civilization_Leaders
------------------------------------------------------------------------------------------------------------------------ 		
INSERT INTO Civilization_Leaders 
		(CivilizationType, 							LeaderheadType)
VALUES	('CIVILIZATION_JFD_PAPAL_STATES_JULIUS_II', 'LEADER_JFD_PAPAL_STATES_JULIUS_II');
------------------------------------------------------------------------------------------------------------------------ 
-- Civilization_BuildingClassOverrides 
------------------------------------------------------------------------------------------------------------------------ 	
INSERT INTO Civilization_BuildingClassOverrides 
		(CivilizationType, 							BuildingClassType, 			BuildingType)
VALUES	('CIVILIZATION_JFD_PAPAL_STATES_JULIUS_II', 'BUILDINGCLASS_TEMPLE',		'BUILDING_JFD_CHAPEL');
------------------------------------------------------------------------------------------------------------------------ 
-- Civilization_UnitClassOverrides 
------------------------------------------------------------------------------------------------------------------------ 	
INSERT INTO Civilization_UnitClassOverrides 
		(CivilizationType, 							UnitClassType, 				UnitType)
VALUES	('CIVILIZATION_JFD_PAPAL_STATES_JULIUS_II', 'UNITCLASS_LANDSKNECHT', 	'UNIT_JFD_SWISS_GUARD');
------------------------------------------------------------------------------------------------------------------------ 
-- Civilization_Religions
------------------------------------------------------------------------------------------------------------------------ 	
INSERT INTO Civilization_Religions 
		(CivilizationType, 							ReligionType)
VALUES	('CIVILIZATION_JFD_PAPAL_STATES_JULIUS_II', 'RELIGION_CHRISTIANITY');
------------------------------------------------------------------------------------------------------------------------ 
-- Civilization_SpyNames
------------------------------------------------------------------------------------------------------------------------ 	
INSERT INTO Civilization_SpyNames 
		(CivilizationType, 							SpyName)
VALUES	('CIVILIZATION_JFD_PAPAL_STATES_JULIUS_II', 'TXT_KEY_SPY_NAME_JFD_PAPAL_STATES_JULIUS_II_0'),	
		('CIVILIZATION_JFD_PAPAL_STATES_JULIUS_II', 'TXT_KEY_SPY_NAME_JFD_PAPAL_STATES_JULIUS_II_1'),
		('CIVILIZATION_JFD_PAPAL_STATES_JULIUS_II', 'TXT_KEY_SPY_NAME_JFD_PAPAL_STATES_JULIUS_II_2'),
		('CIVILIZATION_JFD_PAPAL_STATES_JULIUS_II', 'TXT_KEY_SPY_NAME_JFD_PAPAL_STATES_JULIUS_II_3'),
		('CIVILIZATION_JFD_PAPAL_STATES_JULIUS_II', 'TXT_KEY_SPY_NAME_JFD_PAPAL_STATES_JULIUS_II_4'),
		('CIVILIZATION_JFD_PAPAL_STATES_JULIUS_II', 'TXT_KEY_SPY_NAME_JFD_PAPAL_STATES_JULIUS_II_5'),
		('CIVILIZATION_JFD_PAPAL_STATES_JULIUS_II', 'TXT_KEY_SPY_NAME_JFD_PAPAL_STATES_JULIUS_II_6'),
		('CIVILIZATION_JFD_PAPAL_STATES_JULIUS_II', 'TXT_KEY_SPY_NAME_JFD_PAPAL_STATES_JULIUS_II_7'),
		('CIVILIZATION_JFD_PAPAL_STATES_JULIUS_II', 'TXT_KEY_SPY_NAME_JFD_PAPAL_STATES_JULIUS_II_8'),
		('CIVILIZATION_JFD_PAPAL_STATES_JULIUS_II', 'TXT_KEY_SPY_NAME_JFD_PAPAL_STATES_JULIUS_II_9');
--=======================================================================================================================
--=======================================================================================================================