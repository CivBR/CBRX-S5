--=======================================================================================================================
-- MASTER TABLES
--=======================================================================================================================
-------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS CustomModOptions(Name Text, Value INTEGER, Class INTEGER, DbUpdates INTEGER);
--=======================================================================================================================	
-- BUILDINGS
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------	
--=======================================================================================================================	
-- UNITS
--=======================================================================================================================

-- C15 --
------------------------------------------------------------------------------------------------------------------------
-- Units
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Units 	
		(Type, 					Class,	CombatClass, PrereqTech, 		Cost, Combat, RangedCombat, Range, FaithCost, RequiresFaithPurchaseEnabled, Moves, CivilianAttackPriority, Special, Domain, DefaultUnitAI,	Description, 					Help, 									 Strategy, 										Civilopedia, 						ShowInPedia, OneShotTourism, OneShotTourismPercentOthers, AdvancedStartCost, WorkRate, ObsoleteTech, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, CombatLimit,  GoldenAgeTurns,  XPValueAttack, XPValueDefense, Conscription, MoveRate, UnitArtInfo, 					 UnitFlagAtlas, 							UnitFlagIconOffset, IconAtlas,								PortraitIndex,	MinAreaSize,	Pillage,	HurryCostModifier)
SELECT	'UNIT_AGLA_HANSE_COG',	Class,	CombatClass, 'TECH_COMPASS', 	Cost, Combat, RangedCombat, Range, FaithCost, RequiresFaithPurchaseEnabled, Moves, CivilianAttackPriority, Special, Domain, DefaultUnitAI,	'TXT_KEY_UNIT_AGLA_HANSE_COG', 	'TXT_KEY_UNIT_AGLA_HANSE_COG_HELP_EE', 	 'TXT_KEY_UNIT_AGLA_HANSE_COG_STRATEGY_EE', 	'TXT_KEY_UNIT_AGLA_HANSE_COG_TEXT',	ShowInPedia, OneShotTourism, OneShotTourismPercentOthers, AdvancedStartCost, WorkRate, ObsoleteTech, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, CombatLimit,  GoldenAgeTurns,  XPValueAttack, XPValueDefense, Conscription, MoveRate, 'ART_DEF_UNIT_AGLA_HANSE_COG',	 'AGLA_HANSE_WULLENWEVER_UNIT_FLAG_ATLAS',	0,					'AGLA_HANSE_WULLENWEVER_ICON_ATLAS',	2,				MinAreaSize,	Pillage,	HurryCostModifier
FROM Units WHERE Type = 'UNIT_EE_CARRACK';   	
--------------------------------------------------------------------------------------------------------------------------
-- UnitGameplay2DScripts
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 				SelectionSound, FirstSelectionSound)
SELECT	'UNIT_AGLA_HANSE_COG',		SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_EE_CARRACK';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_AITypes
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_AITypes 	
		(UnitType, 				UnitAIType)
SELECT	'UNIT_AGLA_HANSE_COG',		UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_EE_CARRACK';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_Flavors
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_Flavors 	
		(UnitType, 				FlavorType, Flavor)
SELECT	'UNIT_AGLA_HANSE_COG',		FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_EE_CARRACK';
-- Unit_ClassUpgrades
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 				UnitClassType)
SELECT	'UNIT_AGLA_HANSE_COG',		UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_EE_CARRACK';

INSERT INTO Unit_FreePromotions
		(UnitType,				PromotionType)
SELECT	'UNIT_AGLA_HANSE_COG',	PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_EE_CARRACK';
-- /C15 --

------------------------------------------------------------------------------------------------------------------------
-- Units
--------------------------------------------------------------------------------------------------------------------------
-- C15 --
--INSERT INTO Units 	
INSERT OR IGNORE INTO Units 	
-- /C15 --
		(Type, 					Class,	CombatClass, PrereqTech, Cost, Combat, RangedCombat, Range, FaithCost, RequiresFaithPurchaseEnabled, Moves, CivilianAttackPriority, Special, Domain, DefaultUnitAI,	Description, 			 Help, 							 Strategy, 							Civilopedia, 					ShowInPedia, OneShotTourism, OneShotTourismPercentOthers, AdvancedStartCost, WorkRate, ObsoleteTech, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, CombatLimit,  GoldenAgeTurns,  XPValueAttack, XPValueDefense, Conscription, MoveRate, UnitArtInfo, 			 UnitFlagAtlas, 				UnitFlagIconOffset, IconAtlas,					PortraitIndex)
SELECT	'UNIT_AGLA_HANSE_COG',	Class,	CombatClass, 'TECH_COMPASS', Cost, Combat, RangedCombat, Range, FaithCost, RequiresFaithPurchaseEnabled, Moves, CivilianAttackPriority, Special, Domain, DefaultUnitAI,	'TXT_KEY_UNIT_AGLA_HANSE_COG', 'TXT_KEY_UNIT_AGLA_HANSE_COG_HELP', 	 'TXT_KEY_UNIT_AGLA_HANSE_COG_STRATEGY',  'TXT_KEY_UNIT_AGLA_HANSE_COG_TEXT',	ShowInPedia, OneShotTourism, OneShotTourismPercentOthers, AdvancedStartCost, WorkRate, ObsoleteTech, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, CombatLimit,  GoldenAgeTurns,  XPValueAttack, XPValueDefense, Conscription, MoveRate, 'ART_DEF_UNIT_AGLA_HANSE_COG',	 'AGLA_HANSE_WULLENWEVER_UNIT_FLAG_ATLAS',	0,					'AGLA_HANSE_WULLENWEVER_ICON_ATLAS',	2
FROM Units WHERE Type = 'UNIT_CARAVEL';   	
-- C15 --
UPDATE Units SET MinAreaSize = (SELECT MinAreaSize FROM Units WHERE Type = 'UNIT_CARAVEL'), Pillage = (SELECT Pillage FROM Units WHERE Type = 'UNIT_CARAVEL'), HurryCostModifier = (SELECT HurryCostModifier FROM Units WHERE Type = 'UNIT_CARAVEL') WHERE Type = 'UNIT_AGLA_HANSE_COG' AND Class = 'UNITCLASS_CARAVEL';
-- /C15 --
--------------------------------------------------------------------------------------------------------------------------
-- UnitGameplay2DScripts
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 				SelectionSound, FirstSelectionSound)
SELECT	'UNIT_AGLA_HANSE_COG',		SelectionSound, FirstSelectionSound
-- C15 --
--FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_CARAVEL';
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_CARAVEL' AND NOT EXISTS (SELECT 1 FROM Units WHERE Type = 'UNIT_EE_CARRACK');
-- /C15 --
--------------------------------------------------------------------------------------------------------------------------
-- Unit_AITypes
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_AITypes 	
		(UnitType, 				UnitAIType)
SELECT	'UNIT_AGLA_HANSE_COG',		UnitAIType
-- C15 --
--FROM Unit_AITypes WHERE UnitType = 'UNIT_CARAVEL';
FROM Unit_AITypes WHERE UnitType = 'UNIT_CARAVEL' AND NOT EXISTS (SELECT 1 FROM Units WHERE Type = 'UNIT_EE_CARRACK');
-- /C15 --
--------------------------------------------------------------------------------------------------------------------------
-- Unit_Flavors
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_Flavors 	
		(UnitType, 				FlavorType, Flavor)
SELECT	'UNIT_AGLA_HANSE_COG',		FlavorType, Flavor
-- C15 --
--FROM Unit_Flavors WHERE UnitType = 'UNIT_CARAVEL';
FROM Unit_Flavors WHERE UnitType = 'UNIT_CARAVEL' AND NOT EXISTS (SELECT 1 FROM Units WHERE Type = 'UNIT_EE_CARRACK');
-- /C15 --
-- Unit_ClassUpgrades
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 				UnitClassType)
SELECT	'UNIT_AGLA_HANSE_COG',		UnitClassType
-- C15 --
--FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_CARAVEL';
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_CARAVEL' AND NOT EXISTS (SELECT 1 FROM Units WHERE Type = 'UNIT_EE_CARRACK');
-- /C15 --
--------------------------------------------------------------------------------------------------------------------------
-- UnitPromotions
--------------------------------------------------------------------------------------------------------------------------
-- C15 --
/*INSERT INTO UnitPromotions
		(Type,							Description,							Help,										Sound,				CannotBeChosen,	LostWithUpgrade,	CombatPercent,	PortraitIndex,	IconAtlas,						PediaType,			PediaEntry)
VALUES	('PROMOTION_PB_GIVES_MOVEMENT',	'TXT_KEY_PROMOTION_PB_GIVES_MOVEMENT',	'TXT_KEY_PROMOTION_PB_GIVES_MOVEMENT_HELP',	'AS2D_IF_LEVELUP',	1,				1,					0,				11,				'EXPANSION2_PROMOTION_ATLAS',	'PEDIA_ATTRIBUTES',	'TXT_KEY_PROMOTION_PB_GIVES_MOVEMENT'),
		('PROMOTION_HANSE_NO_ASTRONOMY','TXT_KEY_PROMOTION_HANSE_NO_ASTRONOMY',	'TXT_KEY_PROMOTION_HANSE_NO_ASTRONOMY_HELP','AS2D_IF_LEVELUP', 	1,				1,					-20,			57,				'ABILITY_ATLAS', 				'PEDIA_ATTRIBUTES',	'TXT_KEY_PROMOTION_HANSE_NO_ASTRONOMY');*/

INSERT INTO UnitPromotions
		(Type,							Description,							Help,										Sound,				CannotBeChosen,	LostWithUpgrade,	CombatPercent,	PortraitIndex,	IconAtlas,						PediaType,			PediaEntry)
VALUES	('PROMOTION_HANSE_NO_ASTRONOMY','TXT_KEY_PROMOTION_HANSE_NO_ASTRONOMY',	'TXT_KEY_PROMOTION_HANSE_NO_ASTRONOMY_HELP','AS2D_IF_LEVELUP', 	1,				1,					-20,			57,				'ABILITY_ATLAS', 				'PEDIA_ATTRIBUTES',	'TXT_KEY_PROMOTION_HANSE_NO_ASTRONOMY');
-- /C15 --

-- UnitPromotions_Terrains
--==========================================================================================================================
INSERT INTO UnitPromotions_Terrains
			(PromotionType, 						TerrainType,	Impassable)
VALUES		('PROMOTION_HANSE_NO_ASTRONOMY', 	'TERRAIN_OCEAN',	1);

--------------------------------------------------------------------------------------------------------------------------

INSERT INTO Unit_FreePromotions 	
		(UnitType,				PromotionType)
SELECT 	'UNIT_AGLA_HANSE_COG',		PromotionType
-- C15 --
--FROM Unit_FreePromotions WHERE UnitType = 'UNIT_CARAVEL';
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_CARAVEL' AND NOT EXISTS (SELECT 1 FROM Units WHERE Type = 'UNIT_EE_CARRACK');

/*INSERT INTO Unit_FreePromotions 	
		(UnitType, 				PromotionType)
VALUES	('UNIT_AGLA_HANSE_COG',		'PROMOTION_PB_GIVES_MOVEMENT'),
		('UNIT_AGLA_HANSE_COG',		'PROMOTION_HANSE_NO_ASTRONOMY');*/
		
INSERT INTO Unit_FreePromotions
		(UnitType,				PromotionType)
SELECT	'UNIT_AGLA_HANSE_COG',	'PROMOTION_HANSE_NO_ASTRONOMY'
WHERE NOT EXISTS (SELECT 1 FROM Units WHERE Type = 'UNIT_EE_CARRACK');
-- /C15 --

--=======================================================================================================================	
-- LEADERS
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- Leaders
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Leaders 
		(Type, 										ArtDefineTag, 								Description, 										Civilopedia, 											CivilopediaTag, 												IconAtlas, 										PortraitIndex)
VALUES	('LEADER_AGLA_HANSE_WULLENWEVER', 	'AGLA_HANSE_Scene.xml',	'TXT_KEY_LEADER_AGLA_HANSE_WULLENWEVER',	'TXT_KEY_LEADER_AGLA_HANSE_WULLENWEVER_PEDIA',	'TXT_KEY_CIVILOPEDIA_LEADERS_AGLA_HANSE_WULLENWEVER',	'AGLA_HANSE_WULLENWEVER_ICON_ATLAS', 	1);

UPDATE Leaders
SET VictoryCompetitiveness = 6,
WonderCompetitiveness = 9,
MinorCivCompetitiveness = 5,
Boldness = 6,
DiploBalance = 5,
WarmongerHate = 3,
DenounceWillingness = 3,
DoFWillingness = 4,
Loyalty = 3,
Neediness = 3,
Forgiveness = 3,
Chattiness = 4,
Meanness = 4
WHERE Type = 'LEADER_AGLA_HANSE_WULLENWEVER';	
------------------------------------------------------------------------------------------------------------------------		
-- Leader_MajorCivApproachBiases
------------------------------------------------------------------------------------------------------------------------						
INSERT INTO Leader_MajorCivApproachBiases 
		(LeaderType, 								MajorCivApproachType, 				Bias)
VALUES	('LEADER_AGLA_HANSE_WULLENWEVER', 	'MAJOR_CIV_APPROACH_WAR', 			3),
		('LEADER_AGLA_HANSE_WULLENWEVER', 	'MAJOR_CIV_APPROACH_HOSTILE', 		3),
		('LEADER_AGLA_HANSE_WULLENWEVER', 	'MAJOR_CIV_APPROACH_DECEPTIVE',		5),
		('LEADER_AGLA_HANSE_WULLENWEVER', 	'MAJOR_CIV_APPROACH_GUARDED', 		4),
		('LEADER_AGLA_HANSE_WULLENWEVER', 	'MAJOR_CIV_APPROACH_AFRAID', 		3),
		('LEADER_AGLA_HANSE_WULLENWEVER', 	'MAJOR_CIV_APPROACH_FRIENDLY', 		5),
		('LEADER_AGLA_HANSE_WULLENWEVER', 	'MAJOR_CIV_APPROACH_NEUTRAL', 		5);
------------------------------------------------------------------------------------------------------------------------	
-- Leader_MajorCivApproachBiases
------------------------------------------------------------------------------------------------------------------------							
INSERT INTO Leader_MinorCivApproachBiases 
		(LeaderType, 								MinorCivApproachType, 				Bias)
VALUES	('LEADER_AGLA_HANSE_WULLENWEVER', 	'MINOR_CIV_APPROACH_IGNORE', 		4),
		('LEADER_AGLA_HANSE_WULLENWEVER', 	'MINOR_CIV_APPROACH_FRIENDLY', 		5),
		('LEADER_AGLA_HANSE_WULLENWEVER', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	2),
		('LEADER_AGLA_HANSE_WULLENWEVER', 	'MINOR_CIV_APPROACH_CONQUEST', 		2),
		('LEADER_AGLA_HANSE_WULLENWEVER', 	'MINOR_CIV_APPROACH_BULLY', 		3);
------------------------------------------------------------------------------------------------------------------------	
-- Leader_Flavors
------------------------------------------------------------------------------------------------------------------------							
INSERT INTO Leader_Flavors 
		(LeaderType, 								FlavorType, 						Flavor)
VALUES	('LEADER_AGLA_HANSE_WULLENWEVER', 	'FLAVOR_OFFENSE', 					4),
		('LEADER_AGLA_HANSE_WULLENWEVER', 	'FLAVOR_DEFENSE', 					6),
		('LEADER_AGLA_HANSE_WULLENWEVER', 	'FLAVOR_CITY_DEFENSE', 				5),
		('LEADER_AGLA_HANSE_WULLENWEVER', 	'FLAVOR_MILITARY_TRAINING', 		4),
		('LEADER_AGLA_HANSE_WULLENWEVER', 	'FLAVOR_RECON', 					3),
		('LEADER_AGLA_HANSE_WULLENWEVER', 	'FLAVOR_RANGED', 					3),
		('LEADER_AGLA_HANSE_WULLENWEVER', 	'FLAVOR_MOBILE', 					6),
		('LEADER_AGLA_HANSE_WULLENWEVER', 	'FLAVOR_NAVAL', 					2),
		('LEADER_AGLA_HANSE_WULLENWEVER', 	'FLAVOR_NAVAL_RECON', 				2),
		('LEADER_AGLA_HANSE_WULLENWEVER', 	'FLAVOR_NAVAL_GROWTH', 				2),
		('LEADER_AGLA_HANSE_WULLENWEVER', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	2),
		('LEADER_AGLA_HANSE_WULLENWEVER', 	'FLAVOR_AIR', 						2),
		('LEADER_AGLA_HANSE_WULLENWEVER', 	'FLAVOR_EXPANSION', 				2),
		('LEADER_AGLA_HANSE_WULLENWEVER', 	'FLAVOR_GROWTH', 					4),
		('LEADER_AGLA_HANSE_WULLENWEVER', 	'FLAVOR_TILE_IMPROVEMENT', 			4),
		('LEADER_AGLA_HANSE_WULLENWEVER', 	'FLAVOR_INFRASTRUCTURE', 			7),
		('LEADER_AGLA_HANSE_WULLENWEVER', 	'FLAVOR_PRODUCTION', 				6),
		('LEADER_AGLA_HANSE_WULLENWEVER', 	'FLAVOR_GOLD', 						6),
		('LEADER_AGLA_HANSE_WULLENWEVER', 	'FLAVOR_SCIENCE', 					4),
		('LEADER_AGLA_HANSE_WULLENWEVER', 	'FLAVOR_CULTURE', 					7),
		('LEADER_AGLA_HANSE_WULLENWEVER', 	'FLAVOR_HAPPINESS', 				3),
		('LEADER_AGLA_HANSE_WULLENWEVER', 	'FLAVOR_GREAT_PEOPLE', 				7),
		('LEADER_AGLA_HANSE_WULLENWEVER', 	'FLAVOR_WONDER', 					9),
		('LEADER_AGLA_HANSE_WULLENWEVER', 	'FLAVOR_RELIGION', 					3),
		('LEADER_AGLA_HANSE_WULLENWEVER', 	'FLAVOR_DIPLOMACY', 				3),
		('LEADER_AGLA_HANSE_WULLENWEVER', 	'FLAVOR_SPACESHIP', 				2),
		('LEADER_AGLA_HANSE_WULLENWEVER', 	'FLAVOR_WATER_CONNECTION', 			4),
		('LEADER_AGLA_HANSE_WULLENWEVER', 	'FLAVOR_NUKE', 						2),
		('LEADER_AGLA_HANSE_WULLENWEVER', 	'FLAVOR_USE_NUKE', 					2),
		('LEADER_AGLA_HANSE_WULLENWEVER', 	'FLAVOR_ESPIONAGE', 				5),
		('LEADER_AGLA_HANSE_WULLENWEVER', 	'FLAVOR_AIRLIFT', 					2),
		('LEADER_AGLA_HANSE_WULLENWEVER', 	'FLAVOR_I_TRADE_DESTINATION', 		5),
		('LEADER_AGLA_HANSE_WULLENWEVER', 	'FLAVOR_I_TRADE_ORIGIN', 			5),
		('LEADER_AGLA_HANSE_WULLENWEVER', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
		('LEADER_AGLA_HANSE_WULLENWEVER', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
		('LEADER_AGLA_HANSE_WULLENWEVER', 	'FLAVOR_ARCHAEOLOGY', 				5),
		('LEADER_AGLA_HANSE_WULLENWEVER', 	'FLAVOR_AIR_CARRIER', 				5);
--------------------------------------------------------------------------------------------------------------------------
-- Diplomacy_Responses
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Diplomacy_Responses
		(LeaderType, 								ResponseType, 							 			Response, 																	 			Bias)
VALUES 	('LEADER_AGLA_HANSE_WULLENWEVER',	'RESPONSE_AI_DOF_BACKSTAB', 			 			'TXT_KEY_LEADER_AGLA_HANSE_WULLENWEVER_DENOUNCE_FRIEND%', 			 			500),
		('LEADER_AGLA_HANSE_WULLENWEVER',	'RESPONSE_ATTACKED_HOSTILE', 			 			'TXT_KEY_LEADER_AGLA_HANSE_WULLENWEVER_ATTACKED_HOSTILE%', 			 		500),
		('LEADER_AGLA_HANSE_WULLENWEVER',	'RESPONSE_DEFEATED', 					 			'TXT_KEY_LEADER_AGLA_HANSE_WULLENWEVER_DEFEATED%', 					 		500),
		('LEADER_AGLA_HANSE_WULLENWEVER',	'RESPONSE_DOW_GENERIC', 				 			'TXT_KEY_LEADER_AGLA_HANSE_WULLENWEVER_DOW_GENERIC%', 				 			500),
		('LEADER_AGLA_HANSE_WULLENWEVER',	'RESPONSE_EXPANSION_SERIOUS_WARNING', 				'TXT_KEY_LEADER_AGLA_HANSE_WULLENWEVER_EXPANSION_SERIOUS_WARNING%', 	 		500),
		('LEADER_AGLA_HANSE_WULLENWEVER',	'RESPONSE_FIRST_GREETING', 				 			'TXT_KEY_LEADER_AGLA_HANSE_WULLENWEVER_FIRSTGREETING%', 				 		500),
		('LEADER_AGLA_HANSE_WULLENWEVER',	'RESPONSE_GREETING_HOSTILE_HELLO', 					'TXT_KEY_LEADER_AGLA_HANSE_WULLENWEVER_GREETING_HOSTILE_HELLO%', 		 		500),
		('LEADER_AGLA_HANSE_WULLENWEVER',	'RESPONSE_GREETING_NEUTRAL_HELLO', 					'TXT_KEY_LEADER_AGLA_HANSE_WULLENWEVER_GREETING_NEUTRAL_HELLO%', 		 		500),
		('LEADER_AGLA_HANSE_WULLENWEVER',	'RESPONSE_GREETING_POLITE_HELLO', 					'TXT_KEY_LEADER_AGLA_HANSE_WULLENWEVER_GREETING_POLITE_HELLO%', 		 		500),
		('LEADER_AGLA_HANSE_WULLENWEVER',	'RESPONSE_HOSTILE_AGGRESSIVE_MILITARY_WARNING', 	'TXT_KEY_LEADER_AGLA_HANSE_WULLENWEVER_HOSTILE_AGGRESSIVE_MILITARY_WARNING%', 	500),
		('LEADER_AGLA_HANSE_WULLENWEVER',	'RESPONSE_LUXURY_TRADE', 							'TXT_KEY_LEADER_AGLA_HANSE_WULLENWEVER_LUXURY_TRADE%', 		  				500),
		('LEADER_AGLA_HANSE_WULLENWEVER',	'RESPONSE_OPEN_BORDERS_EXCHANGE', 					'TXT_KEY_LEADER_AGLA_HANSE_WULLENWEVER_OPEN_BORDERS_EXCHANGE%', 		  		500),
		('LEADER_AGLA_HANSE_WULLENWEVER',	'RESPONSE_REQUEST', 								'TXT_KEY_LEADER_AGLA_HANSE_WULLENWEVER_REQUEST%', 		  						500),
		('LEADER_AGLA_HANSE_WULLENWEVER',	'RESPONSE_TOO_SOON_NO_PEACE', 			 			'TXT_KEY_LEADER_AGLA_HANSE_WULLENWEVER_TOO_SOON_NO_PEACE%', 			  		500),
		('LEADER_AGLA_HANSE_WULLENWEVER',	'RESPONSE_RESPONSE_TO_BEING_DENOUNCED',  			'TXT_KEY_LEADER_AGLA_HANSE_WULLENWEVER_RESPONSE_TO_BEING_DENOUNCED%',   		500),
		('LEADER_AGLA_HANSE_WULLENWEVER',	'RESPONSE_WINWAR', 		 							'TXT_KEY_LEADER_AGLA_HANSE_WULLENWEVER_WINWAR%', 					  			500),
		('LEADER_AGLA_HANSE_WULLENWEVER',	'RESPONSE_WORK_AGAINST_SOMEONE', 		 			'TXT_KEY_LEADER_AGLA_HANSE_WULLENWEVER_DENOUNCE%', 					  		500),
		('LEADER_AGLA_HANSE_WULLENWEVER',	'RESPONSE_WORK_WITH_US', 				 			'TXT_KEY_LEADER_AGLA_HANSE_WULLENWEVER_DEC_FRIENDSHIP%', 			  	  		500);
------------------------------------------------------------------------------------------------------------------------	
-- Leader_Traits
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Leader_Traits 
		(LeaderType, 								TraitType)
VALUES	('LEADER_AGLA_HANSE_WULLENWEVER', 	'TRAIT_AGLA_HANSE_WULLENWEVER');
------------------------------------------------------------------------------------------------------------------------
-- Traits
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Traits 
		(Type, 										Description, 										ShortDescription)
VALUES	('TRAIT_AGLA_HANSE_WULLENWEVER', 	'TXT_KEY_TRAIT_AGLA_HANSE_WULLENWEVER',	'TXT_KEY_TRAIT_AGLA_HANSE_WULLENWEVER_SHORT');

-- BuildingClasses
------------------
INSERT INTO BuildingClasses
        (Type,                     DefaultBuilding,          			Description)
VALUES  ('BUILDINGCLASS_AGLA_HANSE_WULLENWEVER_1',  'BUILDING_ALGA_HANSE_TRADE_1',   'TXT_KEY_TRAIT_AGLA_HANSE_WULLENWEVER'),
		('BUILDINGCLASS_AGLA_HANSE_WULLENWEVER_2',  'BUILDING_ALGA_HANSE_TRADE_2',   'TXT_KEY_TRAIT_AGLA_HANSE_WULLENWEVER'),  
		('BUILDINGCLASS_AGLA_HANSE_WULLENWEVER_4',  'BUILDING_ALGA_HANSE_TRADE_4',   'TXT_KEY_TRAIT_AGLA_HANSE_WULLENWEVER'), 
		('BUILDINGCLASS_AGLA_HANSE_WULLENWEVER_8',  'BUILDING_ALGA_HANSE_TRADE_8',   'TXT_KEY_TRAIT_AGLA_HANSE_WULLENWEVER'), 
		('BUILDINGCLASS_AGLA_HANSE_WULLENWEVER_16',  'BUILDING_ALGA_HANSE_TRADE_16',   'TXT_KEY_TRAIT_AGLA_HANSE_WULLENWEVER');
INSERT INTO Buildings		
		(Type, 											BuildingClass, 					NumTradeRouteBonus,	  	Cost, 	FaithCost,			GreatWorkCount,			Description, 								Help,												NeverCapture)
VALUES	('BUILDING_ALGA_HANSE_TRADE_1', 		'BUILDINGCLASS_AGLA_HANSE_WULLENWEVER_1', 1, 	-1, 			-1,						-1,			'TXT_KEY_TRAIT_AGLA_HANSE_WULLENWEVER', 		'TXT_KEY_TRAIT_AGLA_HANSE_WULLENWEVER',			1),
		('BUILDING_ALGA_HANSE_TRADE_2', 		'BUILDINGCLASS_AGLA_HANSE_WULLENWEVER_2', 2,	-1, 			-1,						-1,			'TXT_KEY_TRAIT_AGLA_HANSE_WULLENWEVER', 		'TXT_KEY_TRAIT_AGLA_HANSE_WULLENWEVER',			1),
		('BUILDING_ALGA_HANSE_TRADE_4', 		'BUILDINGCLASS_AGLA_HANSE_WULLENWEVER_4', 4,	-1, 			-1,						-1,			'TXT_KEY_TRAIT_AGLA_HANSE_WULLENWEVER', 		'TXT_KEY_TRAIT_AGLA_HANSE_WULLENWEVER',			1),
		('BUILDING_ALGA_HANSE_TRADE_8', 		'BUILDINGCLASS_AGLA_HANSE_WULLENWEVER_8', 8,	-1, 			-1,						-1,			'TXT_KEY_TRAIT_AGLA_HANSE_WULLENWEVER', 		'TXT_KEY_TRAIT_AGLA_HANSE_WULLENWEVER',			1),
		('BUILDING_ALGA_HANSE_TRADE_16', 		'BUILDINGCLASS_AGLA_HANSE_WULLENWEVER_16', 16, 	-1, 			-1,						-1,			'TXT_KEY_TRAIT_AGLA_HANSE_WULLENWEVER', 		'TXT_KEY_TRAIT_AGLA_HANSE_WULLENWEVER',			1);
--=======================================================================================================================	
-- CIVILIZATIONS
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- Civilizations
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilizations 	
		(Type, 											SoundtrackTag,  MapImage, 									DawnOfManQuote, 											DawnOfManImage,								Description,											ShortDescription,											Adjective,													Civilopedia,											CivilopediaTag,									 DefaultPlayerColor,							 ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas,										PortraitIndex,	AlphaIconAtlas)
SELECT	'CIVILIZATION_AGLA_HANSE_WULLENWEVER',			'Germany', 		'AGLA_HANSEMap.dds',	'TXT_KEY_CIV_DAWN_AGLA_HANSE_WULLENWEVER_TEXT',	'AGLA_HANSE_DOM.dds',		'TXT_KEY_CIV_AGLA_HANSE_WULLENWEVER_DESC', 	'TXT_KEY_CIV_AGLA_HANSE_WULLENWEVER_SHORT_DESC',	'TXT_KEY_CIV_AGLA_HANSE_WULLENWEVER_ADJECTIVE',	'TXT_KEY_CIV_AGLA_HANSE_WULLENWEVER_TEXT_1',	'TXT_KEY_CIV_AGLA_HANSE_WULLENWEVER',	 'PLAYERCOLOR_AGLA_HANSE_WULLENWEVER',	 ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, 'AGLA_HANSE_WULLENWEVER_ICON_ATLAS',	0,				'AGLA_HANSE_WULLENWEVER_ALPHA_ATLAS'
FROM Civilizations WHERE Type = 'CIVILIZATION_GERMANY';
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_CityNames
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilization_CityNames 
		(CivilizationType, 									CityName)
VALUES	('CIVILIZATION_AGLA_HANSE_WULLENWEVER',	'TXT_KEY_CITY_NAME_AGLA_HANSE_WULLENWEVER_1'),
		('CIVILIZATION_AGLA_HANSE_WULLENWEVER',	'TXT_KEY_CITY_NAME_AGLA_HANSE_WULLENWEVER_2'),
		('CIVILIZATION_AGLA_HANSE_WULLENWEVER',	'TXT_KEY_CITY_NAME_AGLA_HANSE_WULLENWEVER_3'),
		('CIVILIZATION_AGLA_HANSE_WULLENWEVER',	'TXT_KEY_CITY_NAME_AGLA_HANSE_WULLENWEVER_4'),
		('CIVILIZATION_AGLA_HANSE_WULLENWEVER',	'TXT_KEY_CITY_NAME_AGLA_HANSE_WULLENWEVER_5'),
		('CIVILIZATION_AGLA_HANSE_WULLENWEVER',	'TXT_KEY_CITY_NAME_AGLA_HANSE_WULLENWEVER_6'),
		('CIVILIZATION_AGLA_HANSE_WULLENWEVER',	'TXT_KEY_CITY_NAME_AGLA_HANSE_WULLENWEVER_7'),
		('CIVILIZATION_AGLA_HANSE_WULLENWEVER',	'TXT_KEY_CITY_NAME_AGLA_HANSE_WULLENWEVER_8'),
		('CIVILIZATION_AGLA_HANSE_WULLENWEVER',	'TXT_KEY_CITY_NAME_AGLA_HANSE_WULLENWEVER_9'),
		('CIVILIZATION_AGLA_HANSE_WULLENWEVER',	'TXT_KEY_CITY_NAME_AGLA_HANSE_WULLENWEVER_10'),
		('CIVILIZATION_AGLA_HANSE_WULLENWEVER',	'TXT_KEY_CITY_NAME_AGLA_HANSE_WULLENWEVER_11'),
		('CIVILIZATION_AGLA_HANSE_WULLENWEVER',	'TXT_KEY_CITY_NAME_AGLA_HANSE_WULLENWEVER_12'),
		('CIVILIZATION_AGLA_HANSE_WULLENWEVER',	'TXT_KEY_CITY_NAME_AGLA_HANSE_WULLENWEVER_13'),
		('CIVILIZATION_AGLA_HANSE_WULLENWEVER',	'TXT_KEY_CITY_NAME_AGLA_HANSE_WULLENWEVER_14'),
		('CIVILIZATION_AGLA_HANSE_WULLENWEVER',	'TXT_KEY_CITY_NAME_AGLA_HANSE_WULLENWEVER_15'),
		('CIVILIZATION_AGLA_HANSE_WULLENWEVER',	'TXT_KEY_CITY_NAME_AGLA_HANSE_WULLENWEVER_16'),
		('CIVILIZATION_AGLA_HANSE_WULLENWEVER',	'TXT_KEY_CITY_NAME_AGLA_HANSE_WULLENWEVER_17'),
		('CIVILIZATION_AGLA_HANSE_WULLENWEVER',	'TXT_KEY_CITY_NAME_AGLA_HANSE_WULLENWEVER_18'),
		('CIVILIZATION_AGLA_HANSE_WULLENWEVER',	'TXT_KEY_CITY_NAME_AGLA_HANSE_WULLENWEVER_19'),
		('CIVILIZATION_AGLA_HANSE_WULLENWEVER',	'TXT_KEY_CITY_NAME_AGLA_HANSE_WULLENWEVER_20');
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_FreeBuildingClasses
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Civilization_FreeBuildingClasses 
		(CivilizationType, 									BuildingClassType)
SELECT	'CIVILIZATION_AGLA_HANSE_WULLENWEVER', 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE CivilizationType = 'CIVILIZATION_GERMANY';
------------------------------------------------------------------------------------------------------------------------		
-- Civilization_FreeTechs
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Civilization_FreeTechs 
		(CivilizationType, 									TechType)
SELECT	'CIVILIZATION_AGLA_HANSE_WULLENWEVER', 	TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_GERMANY';
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_FreeUnits
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_FreeUnits 
		(CivilizationType, 									UnitClassType, Count, UnitAIType)
SELECT	'CIVILIZATION_AGLA_HANSE_WULLENWEVER', 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_GERMANY';
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_Leaders
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_Leaders 
		(CivilizationType, 									LeaderheadType)
VALUES	('CIVILIZATION_AGLA_HANSE_WULLENWEVER',	'LEADER_AGLA_HANSE_WULLENWEVER');
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_BuildingClassOverrides 
------------------------------------------------------------------------------------------------------------------------		
DELETE FROM Civilization_BuildingClassOverrides WHERE BuildingType = 'BUILDING_HANSE';	
INSERT INTO Civilization_BuildingClassOverrides 
		(CivilizationType, 									BuildingClassType, 			BuildingType)
VALUES	('CIVILIZATION_AGLA_HANSE_WULLENWEVER',	'BUILDINGCLASS_BANK',		'BUILDING_HANSE');
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_UnitClassOverrides 
------------------------------------------------------------------------------------------------------------------------		
-- C15 --
/*INSERT INTO Civilization_UnitClassOverrides 
		(CivilizationType, 									UnitClassType, 				UnitType)
VALUES	('CIVILIZATION_AGLA_HANSE_WULLENWEVER',	'UNITCLASS_CARAVEL',		'UNIT_AGLA_HANSE_COG');*/
INSERT INTO Civilization_UnitClassOverrides
		(CivilizationType,						UnitClassType,		UnitType)
SELECT	'CIVILIZATION_AGLA_HANSE_WULLENWEVER',	Class,				Type
FROM Units WHERE Type = 'UNIT_AGLA_HANSE_COG';
-- /C15 --
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_Religions
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Civilization_Religions 
		(CivilizationType, 									ReligionType)
VALUES	('CIVILIZATION_AGLA_HANSE_WULLENWEVER',	'RELIGION_PROTESTANTISM');
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_SpyNames
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilization_SpyNames 
		(CivilizationType, 									SpyName)
VALUES	('CIVILIZATION_AGLA_HANSE_WULLENWEVER',	'TXT_KEY_SPY_NAME_AGLA_HANSE_WULLENWEVER_0'),
		('CIVILIZATION_AGLA_HANSE_WULLENWEVER',	'TXT_KEY_SPY_NAME_AGLA_HANSE_WULLENWEVER_1'),
		('CIVILIZATION_AGLA_HANSE_WULLENWEVER',	'TXT_KEY_SPY_NAME_AGLA_HANSE_WULLENWEVER_2'),
		('CIVILIZATION_AGLA_HANSE_WULLENWEVER',	'TXT_KEY_SPY_NAME_AGLA_HANSE_WULLENWEVER_3'),
		('CIVILIZATION_AGLA_HANSE_WULLENWEVER',	'TXT_KEY_SPY_NAME_AGLA_HANSE_WULLENWEVER_4'),
		('CIVILIZATION_AGLA_HANSE_WULLENWEVER',	'TXT_KEY_SPY_NAME_AGLA_HANSE_WULLENWEVER_5'),
		('CIVILIZATION_AGLA_HANSE_WULLENWEVER',	'TXT_KEY_SPY_NAME_AGLA_HANSE_WULLENWEVER_6'),
		('CIVILIZATION_AGLA_HANSE_WULLENWEVER',	'TXT_KEY_SPY_NAME_AGLA_HANSE_WULLENWEVER_7'),
		('CIVILIZATION_AGLA_HANSE_WULLENWEVER',	'TXT_KEY_SPY_NAME_AGLA_HANSE_WULLENWEVER_8'),
		('CIVILIZATION_AGLA_HANSE_WULLENWEVER',	'TXT_KEY_SPY_NAME_AGLA_HANSE_WULLENWEVER_9');

-- Buildings
------------------------------	
INSERT INTO Buildings
		(Type,									BuildingClass,   Cost, MilitaryProductionModifier, XBuiltTriggersIdeologyChoice, FaithCost, UnlockedByBelief, SpecialistType, SpecialistCount, GoldMaintenance, PrereqTech,   FreeStartEra,  Defense,    ExtraCityHitPoints, AllowsRangeStrike, DisplayPosition, GreatWorkCount, GreatWorkSlotType,   Description,                  Help,                              Civilopedia,                       Strategy,                            ArtDefineTag, MinAreaSize, NeverCapture, ConquestProb,   HurryCostModifier,  PortraitIndex, IconAtlas)
SELECT   'BUILDING_AGLA_BISMARCK_KRUPPWERK',    BuildingClass,   Cost,							15,							  3,  FaithCost, UnlockedByBelief, 'SPECIALIST_ENGINEER', 1, GoldMaintenance,  PrereqTech,  FreeStartEra,  Defense,    ExtraCityHitPoints, AllowsRangeStrike, DisplayPosition,  GreatWorkCount, GreatWorkSlotType,  'TXT_KEY_BUILDING_AGLA_KRUPPWERK',    'TXT_KEY_BUILDING_AGLA_KRUPPWERK_HELP',    'TXT_KEY_AGLA_KRUPPWERK_TEXT',    'TXT_KEY_BUILDING_AGLA_KRUPPWERK_STRATEGY',  ArtDefineTag, MinAreaSize, NeverCapture, ConquestProb,   HurryCostModifier,  3,            'AGLA_HANSE_WULLENWEVER_ICON_ATLAS'
FROM Buildings WHERE Type = 'BUILDING_FACTORY';
--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_UnitClassOverrides 
--------------------------------------------------------------------------------------------------------------------------	
DELETE FROM Civilization_BuildingClassOverrides WHERE CivilizationType = 'CIVILIZATION_GERMANY' AND BuildingType IN ('BUILDING_AGLA_BISMARCK_KRUPPWERK');
INSERT INTO Civilization_BuildingClassOverrides 
		(CivilizationType, 			BuildingClassType, 			BuildingType)
VALUES	('CIVILIZATION_GERMANY',	'BUILDINGCLASS_FACTORY', 	'BUILDING_AGLA_BISMARCK_KRUPPWERK');

INSERT INTO Building_ResourceYieldChanges 	
			(BuildingType, 						ResourceType, 			YieldType, 		Yield)
VALUES		('BUILDING_AGLA_BISMARCK_KRUPPWERK', 	'RESOURCE_IRON',		'YIELD_PRODUCTION', 	1),
			('BUILDING_AGLA_BISMARCK_KRUPPWERK', 	'RESOURCE_COAL',		'YIELD_PRODUCTION', 	1);


-- Building_YieldModifiers
--==========================================================================================================================		
INSERT INTO Building_YieldModifiers 	
			(BuildingType, 									YieldType, 		Yield)
VALUES		('BUILDING_AGLA_BISMARCK_KRUPPWERK', 				'YIELD_PRODUCTION', 	10);

-- Building_Flavors
--==========================================================================================================================	
-- Building_ClassesNeededInCity
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Building_ClassesNeededInCity 	
		(BuildingType, 					BuildingClassType)
SELECT	'BUILDING_AGLA_BISMARCK_KRUPPWERK',	BuildingClassType
FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_FACTORY';	

INSERT INTO Building_Flavors 	
			(BuildingType, 						FlavorType, Flavor)
SELECT		('BUILDING_AGLA_BISMARCK_KRUPPWERK'),	FlavorType, Flavor
FROM Building_Flavors WHERE BuildingType = 'BUILDING_FACTORY';

INSERT INTO Building_ResourceQuantityRequirements 	
		(BuildingType, 					ResourceType, Cost)
SELECT	'BUILDING_AGLA_BISMARCK_KRUPPWERK',	ResourceType, Cost
FROM Building_ResourceQuantityRequirements WHERE BuildingType = 'BUILDING_FACTORY';	
--=======================================================================================================================
--=======================================================================================================================

-- C15 --
CREATE TRIGGER IF NOT EXISTS C15_Agla_Hanse_EE_Units
AFTER INSERT ON Units
WHEN NEW.Type = 'UNIT_EE_CARRACK'
BEGIN
	UPDATE Units
	SET Help = 'TXT_KEY_UNIT_AGLA_HANSE_COG_HELP_EE', Strategy = 'TXT_KEY_UNIT_AGLA_HANSE_COG_STRATEGY_EE', Class = NEW.Class, Combat = NEW.Combat, Cost = NEW.Cost, PrereqTech = NEW.PrereqTech, Moves = NEW.Moves, HurryCostModifier = NEW.HurryCostModifier, DefaultUnitAI = NEW.DefaultUnitAI, ObsoleteTech = NEW.ObsoleteTech, AdvancedStartCost = NEW.AdvancedStartCost, MoveRate = NEW.MoveRate
	WHERE Type = 'UNIT_AGLA_HANSE_COG';
	
	UPDATE Civilization_UnitClassOverrides
	SET UnitClassType = NEW.Class
	WHERE UnitType = 'UNIT_AGLA_HANSE_COG';
END;

CREATE TRIGGER IF NOT EXISTS C15_Agla_Hanse_EE_Unit_AITypes
AFTER INSERT ON Unit_AITypes
WHEN NEW.UnitType = 'UNIT_EE_CARRACK'
BEGIN
	DELETE FROM Unit_AITypes WHERE UnitType = 'UNIT_AGLA_HANSE_COG';
	INSERT INTO Unit_AITypes
			(UnitType,				UnitAIType)
	SELECT	'UNIT_AGLA_HANSE_COG',	UnitAIType
	FROM Unit_AITypes WHERE UnitType = NEW.UnitType;
END;

CREATE TRIGGER IF NOT EXISTS C15_Agla_Hanse_EE_Unit_ClassUpgrades
AFTER INSERT ON Unit_AITypes
WHEN NEW.UnitType = 'UNIT_EE_CARRACK'
BEGIN
	DELETE FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_AGLA_HANSE_COG';
	INSERT INTO Unit_ClassUpgrades
			(UnitType,				UnitClassType)
	SELECT	'UNIT_AGLA_HANSE_COG',	UnitClassType
	FROM Unit_ClassUpgrades WHERE UnitType = NEW.UnitType;
END;

CREATE TRIGGER IF NOT EXISTS C15_Agla_Hanse_EE_Unit_Flavors
AFTER INSERT ON Unit_Flavors
WHEN NEW.UnitType = 'UNIT_EE_CARRACK'
BEGIN
	DELETE FROM Unit_Flavors WHERE UnitType = 'UNIT_AGLA_HANSE_COG';
	INSERT INTO Unit_Flavors
			(UnitType,				FlavorType,		Flavor)
	SELECT	'UNIT_AGLA_HANSE_COG',	FlavorType,		Flavor
	FROM Unit_Flavors WHERE UnitType = NEW.UnitType;
END;

CREATE TRIGGER IF NOT EXISTS C15_Agla_Hanse_EE_Unit_FreePromotions
AFTER INSERT ON Unit_FreePromotions
WHEN NEW.UnitType = 'UNIT_EE_CARRACK'
BEGIN
	DELETE FROM Unit_FreePromotions WHERE UnitType = 'UNIT_AGLA_HANSE_COG';
	INSERT INTO Unit_FreePromotions
			(UnitType,				PromotionType)
	SELECT	'UNIT_AGLA_HANSE_COG',	PromotionType
	FROM Unit_FreePromotions WHERE UnitType = NEW.UnitType;
END;

CREATE TABLE IF NOT EXISTS 
Civilization_JFD_CultureTypes(
	CivilizationType 							text 											default null,
	CultureType 								text											default null,
	SubCultureType 								text											default null,
	ArtDefineTag								text											default	null,
	DecisionsTag								text											default null,
	DefeatScreenEarlyTag						text											default	null,
	DefeatScreenMidTag							text											default	null,
	DefeatScreenLateTag							text											default	null,
	IdealsTag									text											default	null,
	SplashScreenTag								text											default	null,
	SoundtrackTag								text											default	null,
	UnitDialogueTag								text											default null);
	
INSERT INTO Civilization_JFD_CultureTypes
		(CivilizationType,						CultureType,			UnitDialogueTag)
VALUES	('CIVILIZATION_AGLA_HANSE_WULLENWEVER',	'CULTURE_JFD_CENTRAL',	'AS2D_SOUND_JFD_GERMAN');

CREATE TABLE IF NOT EXISTS Civilization_JFD_Governments(CivilizationType text, CultureType text, LegislatureName text, OfficeTitle text, GovernmentType text, Weight integer);
INSERT INTO Civilization_JFD_Governments
		(CivilizationType,						GovernmentType,				Weight)
VALUES	('CIVILIZATION_AGLA_HANSE_WULLENWEVER',	'GOVERNMENT_JFD_MERCHANT',	100);
-- /C15 --
		-- Civilization_Start_Along_Ocean
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilization_Start_Along_Ocean 
		(CivilizationType, 						StartAlongOcean)
VALUES	('CIVILIZATION_AGLA_HANSE_WULLENWEVER', 	1);