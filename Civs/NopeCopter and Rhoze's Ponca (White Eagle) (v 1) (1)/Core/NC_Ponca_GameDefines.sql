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
		(Type, 					BuildingClass, PrereqTech, Cost, SpecialistType, SpecialistCount, FaithCost, UnlockedByBelief, GoldMaintenance,  MinAreaSize, AllowsRangeStrike, Defense, ExtraCityHitPoints, HurryCostModifier, NeverCapture, Description, 					Help, 								Strategy,								Civilopedia, 						 ArtDefineTag, PortraitIndex, IconAtlas)
SELECT	'BUILDING_NC_MAITHI',	BuildingClass, PrereqTech, Cost, SpecialistType, SpecialistCount, FaithCost, UnlockedByBelief, GoldMaintenance,	 MinAreaSize, AllowsRangeStrike, Defense, ExtraCityHitPoints, HurryCostModifier, 1,			   'TXT_KEY_BUILDING_NC_MAITHI', 	'TXT_KEY_BUILDING_NC_MAITHI_HELP', 	'TXT_KEY_BUILDING_NC_MAITHI_STRATEGY',	'TXT_KEY_BUILDING_NC_MAITHI_TEXT',   ArtDefineTag, 3, 			 'NC_PONCA_ICON_ATLAS'
FROM Buildings WHERE Type = 'BUILDING_WALLS';	
------------------------------------------------------------------------------------------------------------------------	
-- Building_YieldChanges
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_YieldChanges 		
		(BuildingType, 						YieldType, Yield)
SELECT	'BUILDING_NC_MAITHI',	YieldType, Yield
FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_WALLS';	
------------------------------------------------------------------------------------------------------------------------	
-- Building_FeatureYieldChanges
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_FeatureYieldChanges 	
		(BuildingType, 						FeatureType, YieldType, Yield)
SELECT	'BUILDING_NC_MAITHI',	FeatureType, YieldType, Yield
FROM Building_FeatureYieldChanges WHERE BuildingType = 'BUILDING_WALLS';	
------------------------------------------------------------------------------------------------------------------------	
-- Building_ResourceYieldChanges
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_ResourceYieldChanges 	
		(BuildingType, 						ResourceType, YieldType, Yield)
SELECT	'BUILDING_NC_MAITHI',	ResourceType, YieldType, Yield
FROM Building_ResourceYieldChanges WHERE BuildingType = 'BUILDING_WALLS';	
------------------------------------------------------------------------------------------------------------------------	
-- Building_ClassesNeededInCity
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_ClassesNeededInCity 	
		(BuildingType, 						BuildingClassType)
SELECT	'BUILDING_NC_MAITHI',	BuildingClassType
FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_WALLS';	
------------------------------------------------------------------------------------------------------------------------	
-- Building_Flavors
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_Flavors 	
		(BuildingType, 						FlavorType, Flavor)
SELECT	'BUILDING_NC_MAITHI',	FlavorType, Flavor
FROM Building_Flavors WHERE BuildingType = 'BUILDING_WALLS';

INSERT INTO Building_Flavors 	
		(BuildingType, 						FlavorType,			Flavor)
VALUES	('BUILDING_NC_MAITHI',	'FLAVOR_RELIGION',  50);
--=======================================================================================================================	
-- UNITS
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------
-- UnitPromotions
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO UnitPromotions 
		(Type, 							LostWithUpgrade,  Description, 							Help, 										Sound, 				CannotBeChosen, HasPostCombatPromotions, PortraitIndex, 	IconAtlas, 			PediaType, 			 PediaEntry)
VALUES	('PROMOTION_NC_WASHABE_PRE',	0,				  'TXT_KEY_PROMOTION_NC_WASHABE_PRE',	'TXT_KEY_PROMOTION_NC_WASHABE_HELP', 	'AS2D_IF_LEVELUP', 	1, 1, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES',  'TXT_KEY_PROMOTION_NC_WASHABE_PRE'),	
		('PROMOTION_NC_WASHABE_1',	0,				  'TXT_KEY_PROMOTION_NC_WASHABE_1',	'TXT_KEY_PROMOTION_NC_WASHABE_HELP', 	'AS2D_IF_LEVELUP', 	1, 1, 				58, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES',  'TXT_KEY_PROMOTION_NC_WASHABE_1'),	
		('PROMOTION_NC_WASHABE_1_FAKE',	0,				  'TXT_KEY_PROMOTION_NC_WASHABE_1_FAKE',	'TXT_KEY_PROMOTION_NC_WASHABE_HELP', 	'AS2D_IF_LEVELUP', 	1, 0, 				58, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES',  'TXT_KEY_PROMOTION_NC_WASHABE_1_FAKE'),	
		('PROMOTION_NC_WASHABE_2',	0,				  'TXT_KEY_PROMOTION_NC_WASHABE_2',	'TXT_KEY_PROMOTION_NC_WASHABE_HELP', 	'AS2D_IF_LEVELUP', 	1, 1, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES',  'TXT_KEY_PROMOTION_NC_WASHABE_2'),	
		('PROMOTION_NC_WASHABE_2_FAKE',	0,				  'TXT_KEY_PROMOTION_NC_WASHABE_2_FAKE',	'TXT_KEY_PROMOTION_NC_WASHABE_HELP', 	'AS2D_IF_LEVELUP', 	1, 0, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES',  'TXT_KEY_PROMOTION_NC_WASHABE_2_FAKE'),
		('PROMOTION_NC_WASHABE_3',	0,				  'TXT_KEY_PROMOTION_NC_WASHABE_3',	'TXT_KEY_PROMOTION_NC_WASHABE_HELP', 	'AS2D_IF_LEVELUP', 	1, 1, 				58, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES',  'TXT_KEY_PROMOTION_NC_WASHABE_3'),
		('PROMOTION_NC_WASHABE_3_FAKE',	0,				  'TXT_KEY_PROMOTION_NC_WASHABE_3_FAKE',	'TXT_KEY_PROMOTION_NC_WASHABE_HELP', 	'AS2D_IF_LEVELUP', 	1, 0, 				58, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES',  'TXT_KEY_PROMOTION_NC_WASHABE_3_FAKE'),
		('PROMOTION_NC_WASHABE_BONUS',	0,				  'TXT_KEY_PROMOTION_NC_WASHABE_BONUS',	'TXT_KEY_PROMOTION_NC_WASHABE_BONUS_HELP', 	'AS2D_IF_LEVELUP', 	1, 0, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES',  'TXT_KEY_PROMOTION_NC_WASHABE_BONUS');

UPDATE UnitPromotions
SET NearbyEnemyCombatMod = -10
WHERE (Type = 'PROMOTION_NC_WASHABE_BONUS');

UPDATE UnitPromotions
SET NearbyEnemyCombatRange = 2
WHERE (Type = 'PROMOTION_NC_WASHABE_BONUS');

UPDATE UnitPromotions
SET MovesChange = 1
WHERE (Type = 'PROMOTION_NC_WASHABE_BONUS'); -- I assume this works?

INSERT INTO UnitPromotions_PostCombatRandomPromotion
          (PromotionType,                    NewPromotion)
VALUES    ('PROMOTION_NC_WASHABE_PRE',     'PROMOTION_NC_WASHABE_1_FAKE'),
		  ('PROMOTION_NC_WASHABE_1',     'PROMOTION_NC_WASHABE_2_FAKE'),
		  ('PROMOTION_NC_WASHABE_2',     'PROMOTION_NC_WASHABE_3_FAKE'),
		  ('PROMOTION_NC_WASHABE_3',     'PROMOTION_NC_WASHABE_BONUS');
------------------------------------------------------------------------------------------------------------------------
-- Units
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Units
(Type, 									Class, Cost, Range, PrereqTech, Combat,	RangedCombat, Moves, FaithCost,	RequiresFaithPurchaseEnabled, CombatClass, MilitarySupport, MilitaryProduction, Domain, Pillage, IgnoreBuildingDefense, ObsoleteTech, GoodyHutUpgradeUnitClass, XPValueAttack, XPValueDefense, Conscription,  DefaultUnitAI, Description, 						Civilopedia, 							Help, 									Strategy,									AdvancedStartCost,	UnitArtInfo, 					  UnitFlagIconOffset,	UnitFlagAtlas,						PortraitIndex, 	IconAtlas)
SELECT		('UNIT_NC_WASHABE'),		Class, Cost, Range, PrereqTech, Combat, RangedCombat, Moves, FaithCost,	RequiresFaithPurchaseEnabled, CombatClass, MilitarySupport, MilitaryProduction,	Domain, Pillage, IgnoreBuildingDefense, ObsoleteTech, GoodyHutUpgradeUnitClass, XPValueAttack, XPValueDefense, Conscription,  DefaultUnitAI, ('TXT_KEY_UNIT_NC_WASHABE'),	('TXT_KEY_UNIT_NC_WASHABE_TEXT'), 	('TXT_KEY_UNIT_NC_WASHABE_HELP'), 	('TXT_KEY_UNIT_NC_WASHABE_STRATEGY'),	AdvancedStartCost, 	('ART_DEF_UNIT_NC_WASHABE'),  0,					('NC_PONCA_UNIT_FLAG_ATLAS'),	2, 				('NC_PONCA_ICON_ATLAS')
FROM Units WHERE (Type = 'UNIT_CROSSBOWMAN');

/* UPDATE Units
SET Class = 'UNIT_CROSSBOWMAN'
WHERE Type = 'UNIT_NC_WASHABE'; */
------------------------------------------------------------------------------------------------------------------------		
-- Unit_AITypes
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Unit_AITypes 	
		(UnitType, 					UnitAIType)
SELECT	'UNIT_NC_WASHABE',		UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_CROSSBOWMAN';
------------------------------------------------------------------------------------------------------------------------	
-- Unit_ClassUpgrades
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 					UnitClassType)
SELECT	'UNIT_NC_WASHABE',		UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_CROSSBOWMAN';
------------------------------------------------------------------------------------------------------------------------	
-- Unit_Flavors
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Unit_Flavors 	
		(UnitType, 					FlavorType, Flavor)
SELECT	'UNIT_NC_WASHABE',		FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_CROSSBOWMAN';
------------------------------------------------------------------------------------------------------------------------	
-- Unit_FreePromotions
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Unit_FreePromotions 	
		(UnitType, 					PromotionType)
SELECT	'UNIT_NC_WASHABE', 		PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_CROSSBOWMAN';

INSERT INTO Unit_FreePromotions 	
		(UnitType, 					PromotionType)
VALUES	('UNIT_NC_WASHABE', 	'PROMOTION_NC_WASHABE_PRE'),
		('UNIT_NC_WASHABE', 	'PROMOTION_COVER_1');
------------------------------------------------------------------------------------------------------------------------	
-- UnitGameplay2DScripts
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 					SelectionSound,	FirstSelectionSound)
SELECT	'UNIT_NC_WASHABE',		SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_CROSSBOWMAN';		
--=======================================================================================================================	
-- LEADERS
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- Leaders
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Leaders 
		(Type, 							ArtDefineTag, 						Description, 								Civilopedia, 									CivilopediaTag, 										IconAtlas, 							PortraitIndex)
VALUES	('LEADER_NC_PONCA', 	'PoncaLS_Scene.xml',		'TXT_KEY_LEADER_NC_PONCA',		'TXT_KEY_LEADER_NC_PONCA_PEDIA',		'TXT_KEY_CIVILOPEDIA_LEADERS_NC_PONCA',		'NC_PONCA_ICON_ATLAS', 	1);

UPDATE Leaders
SET VictoryCompetitiveness = 5,
WonderCompetitiveness = 6,
MinorCivCompetitiveness = 3,
Boldness = 7,
DiploBalance = 8,
WarmongerHate = 7,
DenounceWillingness = 9,
DoFWillingness = 8,
Loyalty = 7,
Neediness = 7,
Forgiveness = 6,
Chattiness = 4,
Meanness = 5
WHERE Type = 'LEADER_NC_PONCA';	
------------------------------------------------------------------------------------------------------------------------		
-- Leader_MajorCivApproachBiases
------------------------------------------------------------------------------------------------------------------------						
INSERT INTO Leader_MajorCivApproachBiases 
		(LeaderType, 					MajorCivApproachType, 				Bias)
VALUES	('LEADER_NC_PONCA', 	'MAJOR_CIV_APPROACH_WAR', 			4),
		('LEADER_NC_PONCA', 	'MAJOR_CIV_APPROACH_HOSTILE', 		3),
		('LEADER_NC_PONCA', 	'MAJOR_CIV_APPROACH_DECEPTIVE',		3),
		('LEADER_NC_PONCA', 	'MAJOR_CIV_APPROACH_GUARDED', 		7),
		('LEADER_NC_PONCA', 	'MAJOR_CIV_APPROACH_AFRAID', 		3),
		('LEADER_NC_PONCA', 	'MAJOR_CIV_APPROACH_FRIENDLY', 		5),
		('LEADER_NC_PONCA', 	'MAJOR_CIV_APPROACH_NEUTRAL', 		5);
------------------------------------------------------------------------------------------------------------------------	
-- Leader_MajorCivApproachBiases
------------------------------------------------------------------------------------------------------------------------							
INSERT INTO Leader_MinorCivApproachBiases 
		(LeaderType, 					MinorCivApproachType, 				Bias)
VALUES	('LEADER_NC_PONCA', 	'MINOR_CIV_APPROACH_IGNORE', 		6),
		('LEADER_NC_PONCA', 	'MINOR_CIV_APPROACH_FRIENDLY', 		6),
		('LEADER_NC_PONCA', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	5),
		('LEADER_NC_PONCA', 	'MINOR_CIV_APPROACH_CONQUEST', 		4),
		('LEADER_NC_PONCA', 	'MINOR_CIV_APPROACH_BULLY', 		4);
------------------------------------------------------------------------------------------------------------------------	
-- Leader_Flavors
------------------------------------------------------------------------------------------------------------------------							
INSERT INTO Leader_Flavors 
		(LeaderType, 					FlavorType, 						Flavor)
VALUES	('LEADER_NC_PONCA', 	'FLAVOR_OFFENSE', 					4),
		('LEADER_NC_PONCA', 	'FLAVOR_DEFENSE', 					8),
		('LEADER_NC_PONCA', 	'FLAVOR_MILITARY_TRAINING', 		8),
		('LEADER_NC_PONCA', 	'FLAVOR_RECON', 					5),
		('LEADER_NC_PONCA', 	'FLAVOR_RANGED', 					7),
		('LEADER_NC_PONCA', 	'FLAVOR_MOBILE', 					5),
		('LEADER_NC_PONCA', 	'FLAVOR_NAVAL', 					4),
		('LEADER_NC_PONCA', 	'FLAVOR_NAVAL_RECON', 				4),
		('LEADER_NC_PONCA', 	'FLAVOR_NAVAL_GROWTH', 				4),
		('LEADER_NC_PONCA', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	4),
		('LEADER_NC_PONCA', 	'FLAVOR_AIR', 						4),
		('LEADER_NC_PONCA', 	'FLAVOR_EXPANSION', 				5),
		('LEADER_NC_PONCA', 	'FLAVOR_GROWTH', 					8),
		('LEADER_NC_PONCA', 	'FLAVOR_TILE_IMPROVEMENT', 			6),
		('LEADER_NC_PONCA', 	'FLAVOR_INFRASTRUCTURE', 			5),
		('LEADER_NC_PONCA', 	'FLAVOR_PRODUCTION', 				6),
		('LEADER_NC_PONCA', 	'FLAVOR_GOLD', 						5),
		('LEADER_NC_PONCA', 	'FLAVOR_SCIENCE', 					6),
		('LEADER_NC_PONCA', 	'FLAVOR_CULTURE', 					7),
		('LEADER_NC_PONCA', 	'FLAVOR_HAPPINESS', 				6),
		('LEADER_NC_PONCA', 	'FLAVOR_GREAT_PEOPLE', 				4),
		('LEADER_NC_PONCA', 	'FLAVOR_WONDER', 					5),
		('LEADER_NC_PONCA', 	'FLAVOR_RELIGION', 					7),
		('LEADER_NC_PONCA', 	'FLAVOR_DIPLOMACY', 				5),
		('LEADER_NC_PONCA', 	'FLAVOR_SPACESHIP', 				5),
		('LEADER_NC_PONCA', 	'FLAVOR_WATER_CONNECTION', 			4),
		('LEADER_NC_PONCA', 	'FLAVOR_NUKE', 						2),
		('LEADER_NC_PONCA', 	'FLAVOR_USE_NUKE', 					2),
		('LEADER_NC_PONCA', 	'FLAVOR_ESPIONAGE', 				5),
		('LEADER_NC_PONCA', 	'FLAVOR_AIRLIFT', 					5),
		('LEADER_NC_PONCA', 	'FLAVOR_I_TRADE_DESTINATION', 		5),
		('LEADER_NC_PONCA', 	'FLAVOR_I_TRADE_ORIGIN', 			5),
		('LEADER_NC_PONCA', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
		('LEADER_NC_PONCA', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
		('LEADER_NC_PONCA', 	'FLAVOR_ARCHAEOLOGY', 				5),
		('LEADER_NC_PONCA', 	'FLAVOR_AIR_CARRIER', 				5);
--------------------------------------------------------------------------------------------------------------------------
-- Diplomacy_Responses
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Diplomacy_Responses
		(LeaderType, 					ResponseType, 							 			Response, 																	Bias)
VALUES 	('LEADER_NC_PONCA',	'RESPONSE_AI_DOF_BACKSTAB', 			 			'TXT_KEY_LEADER_NC_PONCA_DENOUNCE_FRIEND%', 			 			500),
		('LEADER_NC_PONCA',	'RESPONSE_ATTACKED_HOSTILE', 			 			'TXT_KEY_LEADER_NC_PONCA_ATTACKED_HOSTILE%', 			 			500),
		('LEADER_NC_PONCA',	'RESPONSE_ATTACKED_STRONG_HOSTILE', 			 	'TXT_KEY_LEADER_NC_PONCA_ATTACKED_HOSTILE%', 			 			500),
		('LEADER_NC_PONCA',	'RESPONSE_DEFEATED', 					 			'TXT_KEY_LEADER_NC_PONCA_DEFEATED%', 					 			500),
		('LEADER_NC_PONCA',	'RESPONSE_DOW_GENERIC', 				 			'TXT_KEY_LEADER_NC_PONCA_DOW_GENERIC%', 				 			500),
		('LEADER_NC_PONCA',	'RESPONSE_EXPANSION_SERIOUS_WARNING', 				'TXT_KEY_LEADER_NC_PONCA_EXPANSION_SERIOUS_WARNING%', 	 		500),
		('LEADER_NC_PONCA',	'RESPONSE_FIRST_GREETING', 				 			'TXT_KEY_LEADER_NC_PONCA_FIRSTGREETING%', 				 		500),
		('LEADER_NC_PONCA',	'RESPONSE_GREETING_HOSTILE_HELLO', 					'TXT_KEY_LEADER_NC_PONCA_GREETING_HOSTILE_HELLO%', 		 		500),
		('LEADER_NC_PONCA',	'RESPONSE_GREETING_NEUTRAL_HELLO', 					'TXT_KEY_LEADER_NC_PONCA_GREETING_NEUTRAL_HELLO%', 		 		500),
		('LEADER_NC_PONCA',	'RESPONSE_GREETING_POLITE_HELLO', 					'TXT_KEY_LEADER_NC_PONCA_GREETING_POLITE_HELLO%', 		 		500),
		('LEADER_NC_PONCA',	'RESPONSE_HOSTILE_AGGRESSIVE_MILITARY_WARNING', 	'TXT_KEY_LEADER_NC_PONCA_HOSTILE_AGGRESSIVE_MILITARY_WARNING%',	500),
		('LEADER_NC_PONCA',	'RESPONSE_PLOT_BUYING_SERIOUS_WARNING', 			'TXT_KEY_LEADER_NC_PONCA_PLOT_BUYING_SERIOUS_WARNING%', 			500),
		('LEADER_NC_PONCA',	'RESPONSE_RESPONSE_TO_BEING_DENOUNCED',  			'TXT_KEY_LEADER_NC_PONCA_RESPONSE_TO_BEING_DENOUNCED%',   		500),
		('LEADER_NC_PONCA',	'RESPONSE_WORK_AGAINST_SOMEONE', 		 			'TXT_KEY_LEADER_NC_PONCA_DENOUNCE%', 					  			500),
		('LEADER_NC_PONCA',	'RESPONSE_WORK_WITH_US', 				 			'TXT_KEY_LEADER_NC_PONCA_DEC_FRIENDSHIP%', 			  	  		500);
------------------------------------------------------------------------------------------------------------------------	
-- Leader_Traits
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Leader_Traits 
		(LeaderType, 					TraitType)
VALUES	('LEADER_NC_PONCA', 	'TRAIT_NC_PONCA');
------------------------------------------------------------------------------------------------------------------------
-- Traits
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Traits 
		(Type, 							Description, 							ShortDescription)
VALUES	('TRAIT_NC_PONCA', 	'TXT_KEY_TRAIT_NC_PONCA',		'TXT_KEY_TRAIT_NC_PONCA_SHORT');
------------------------------------------------------------------------------------------------------------------------
-- BuildingClasses
------------------------------------------------------------------------------------------------------------------------
-- For the dummies!	
INSERT INTO BuildingClasses
		(Type, 											DefaultBuilding, 						Description)
VALUES	('BUILDINGCLASS_DUMMY_NC_PONCA_PEACE',		'BUILDING_DUMMY_NC_PONCA_PEACE',	'TXT_KEY_BUILDING_DUMMY_NC_PONCA_PEACE');
--------------------------------------------------------------------------------------------------------------------------
-- Buildings
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Buildings 	
		(Type, 											BuildingClass, 								 GreatWorkCount,	Cost, FaithCost,   PrereqTech,   ConquestProb,	Description, 									Help)
VALUES	('BUILDING_DUMMY_NC_PONCA_PEACE',		'BUILDINGCLASS_DUMMY_NC_PONCA_PEACE', 	 -1, 				-1,   -1, 		   null, 		 100,				'TXT_KEY_BUILDING_DUMMY_NC_PONCA_PEACE',	'TXT_KEY_BUILDING_DUMMY_NC_PONCA_PEACE_HELP');
-- TODO: Should these not get destroyed because I could still use the civ's original capital to track their peace turns, or destroy them because they'd stop counting when the civ lost their capital?
-- Change back to NeverCapture, 1 if need be
--=======================================================================================================================	
-- CIVILIZATIONS
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- Civilizations
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilizations 	
		(Type, 									DerivativeCiv,				SoundtrackTag,  MapImage, 							DawnOfManQuote, 								DawnOfManImage,						Description,								ShortDescription,								Adjective,										Civilopedia,												CivilopediaTag,										DefaultPlayerColor,						ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas,							PortraitIndex,	AlphaIconAtlas)
SELECT	'CIVILIZATION_NC_PONCA',		'TXT_KEY_NC_TAL_PONCA',	'Shoshone', 		'PoncaMap.dds',		'TXT_KEY_CIV_DAWN_NC_PONCA_TEXT',		'PoncaDOM.dds',		'TXT_KEY_CIV_NC_PONCA_DESC',		'TXT_KEY_CIV_NC_PONCA_SHORT_DESC',	'TXT_KEY_CIV_NC_PONCA_ADJECTIVE',		'TXT_KEY_CIVILOPEDIA_CIVS_NC_PONCA_TEXT_1',		'TXT_KEY_CIVILOPEDIA_CIVS_NC_PONCA',		'PLAYERCOLOR_NC_PONCA',		ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, 'NC_PONCA_ICON_ATLAS',	0,				'NC_PONCA_ALPHA_ATLAS'
FROM Civilizations WHERE Type = 'CIVILIZATION_SHOSHONE';
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_CityNames
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilization_CityNames 
		(CivilizationType, 						CityName)
VALUES	('CIVILIZATION_NC_PONCA',		'TXT_KEY_CITY_NAME_NC_PONCA_1'),
		('CIVILIZATION_NC_PONCA',		'TXT_KEY_CITY_NAME_NC_PONCA_2'),
		('CIVILIZATION_NC_PONCA',		'TXT_KEY_CITY_NAME_NC_PONCA_3'),
		('CIVILIZATION_NC_PONCA',		'TXT_KEY_CITY_NAME_NC_PONCA_4'),
		('CIVILIZATION_NC_PONCA',		'TXT_KEY_CITY_NAME_NC_PONCA_5'),
		('CIVILIZATION_NC_PONCA',		'TXT_KEY_CITY_NAME_NC_PONCA_6'),
		('CIVILIZATION_NC_PONCA',		'TXT_KEY_CITY_NAME_NC_PONCA_7'),
		('CIVILIZATION_NC_PONCA',		'TXT_KEY_CITY_NAME_NC_PONCA_8'),
		('CIVILIZATION_NC_PONCA',		'TXT_KEY_CITY_NAME_NC_PONCA_9'),
		('CIVILIZATION_NC_PONCA',		'TXT_KEY_CITY_NAME_NC_PONCA_10'),
		('CIVILIZATION_NC_PONCA',		'TXT_KEY_CITY_NAME_NC_PONCA_11'),
		('CIVILIZATION_NC_PONCA',		'TXT_KEY_CITY_NAME_NC_PONCA_12'),
		('CIVILIZATION_NC_PONCA',		'TXT_KEY_CITY_NAME_NC_PONCA_13'),
		('CIVILIZATION_NC_PONCA',		'TXT_KEY_CITY_NAME_NC_PONCA_14'),
		('CIVILIZATION_NC_PONCA',		'TXT_KEY_CITY_NAME_NC_PONCA_15'),
		('CIVILIZATION_NC_PONCA',		'TXT_KEY_CITY_NAME_NC_PONCA_16'),
		('CIVILIZATION_NC_PONCA',		'TXT_KEY_CITY_NAME_NC_PONCA_17'),
		('CIVILIZATION_NC_PONCA',		'TXT_KEY_CITY_NAME_NC_PONCA_18'),
		('CIVILIZATION_NC_PONCA',		'TXT_KEY_CITY_NAME_NC_PONCA_19'),
		('CIVILIZATION_NC_PONCA',		'TXT_KEY_CITY_NAME_NC_PONCA_20'),
		('CIVILIZATION_NC_PONCA',		'TXT_KEY_CITY_NAME_NC_PONCA_21'),
		('CIVILIZATION_NC_PONCA',		'TXT_KEY_CITY_NAME_NC_PONCA_22'),
		('CIVILIZATION_NC_PONCA',		'TXT_KEY_CITY_NAME_NC_PONCA_23'),
		('CIVILIZATION_NC_PONCA',		'TXT_KEY_CITY_NAME_NC_PONCA_24'),
		('CIVILIZATION_NC_PONCA',		'TXT_KEY_CITY_NAME_NC_PONCA_25'),
		('CIVILIZATION_NC_PONCA',		'TXT_KEY_CITY_NAME_NC_PONCA_26'),
		('CIVILIZATION_NC_PONCA',		'TXT_KEY_CITY_NAME_NC_PONCA_27'),
		('CIVILIZATION_NC_PONCA',		'TXT_KEY_CITY_NAME_NC_PONCA_28'),
		('CIVILIZATION_NC_PONCA',		'TXT_KEY_CITY_NAME_NC_PONCA_29'),
		('CIVILIZATION_NC_PONCA',		'TXT_KEY_CITY_NAME_NC_PONCA_30'),
		('CIVILIZATION_NC_PONCA',		'TXT_KEY_CITY_NAME_NC_PONCA_31'),
		('CIVILIZATION_NC_PONCA',		'TXT_KEY_CITY_NAME_NC_PONCA_32'),
		('CIVILIZATION_NC_PONCA',		'TXT_KEY_CITY_NAME_NC_PONCA_33'),
		('CIVILIZATION_NC_PONCA',		'TXT_KEY_CITY_NAME_NC_PONCA_34'),
		('CIVILIZATION_NC_PONCA',		'TXT_KEY_CITY_NAME_NC_PONCA_35'),
		('CIVILIZATION_NC_PONCA',		'TXT_KEY_CITY_NAME_NC_PONCA_36'),
		('CIVILIZATION_NC_PONCA',		'TXT_KEY_CITY_NAME_NC_PONCA_37'),
		('CIVILIZATION_NC_PONCA',		'TXT_KEY_CITY_NAME_NC_PONCA_38');
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_FreeBuildingClasses
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Civilization_FreeBuildingClasses 
		(CivilizationType, 						BuildingClassType)
SELECT	'CIVILIZATION_NC_PONCA', 		BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE CivilizationType = 'CIVILIZATION_SHOSHONE';
------------------------------------------------------------------------------------------------------------------------		
-- Civilization_FreeTechs
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Civilization_FreeTechs 
		(CivilizationType, 						TechType)
SELECT	'CIVILIZATION_NC_PONCA', 		TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_SHOSHONE';
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_FreeUnits
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_FreeUnits 
		(CivilizationType, 						UnitClassType, Count, UnitAIType)
SELECT	'CIVILIZATION_NC_PONCA',		UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_SHOSHONE';
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_Leaders
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_Leaders 
		(CivilizationType, 						LeaderheadType)
VALUES	('CIVILIZATION_NC_PONCA',		'LEADER_NC_PONCA');
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_BuildingClassOverrides 
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_BuildingClassOverrides 
		(CivilizationType, 						BuildingClassType, 				BuildingType)
VALUES	('CIVILIZATION_NC_PONCA',		'BUILDINGCLASS_WALLS',		'BUILDING_NC_MAITHI');
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_UnitClassOverrides 
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_UnitClassOverrides 
		(CivilizationType, 						UnitClassType, 			UnitType)
VALUES	('CIVILIZATION_NC_PONCA',		'UNITCLASS_CROSSBOWMAN',		'UNIT_NC_WASHABE');
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_Religions
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Civilization_Religions 
		(CivilizationType, 						ReligionType)
VALUES	('CIVILIZATION_NC_PONCA',		'RELIGION_PROTESTANTISM');
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_SpyNames
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilization_SpyNames 
		(CivilizationType, 						SpyName)
VALUES	('CIVILIZATION_NC_PONCA',		'TXT_KEY_SPY_NAME_NC_PONCA_0'),
		('CIVILIZATION_NC_PONCA',		'TXT_KEY_SPY_NAME_NC_PONCA_1'),
		('CIVILIZATION_NC_PONCA',		'TXT_KEY_SPY_NAME_NC_PONCA_2'),
		('CIVILIZATION_NC_PONCA',		'TXT_KEY_SPY_NAME_NC_PONCA_3'),
		('CIVILIZATION_NC_PONCA',		'TXT_KEY_SPY_NAME_NC_PONCA_4'),
		('CIVILIZATION_NC_PONCA',		'TXT_KEY_SPY_NAME_NC_PONCA_5'),
		('CIVILIZATION_NC_PONCA',		'TXT_KEY_SPY_NAME_NC_PONCA_6'),
		('CIVILIZATION_NC_PONCA',		'TXT_KEY_SPY_NAME_NC_PONCA_7'),
		('CIVILIZATION_NC_PONCA',		'TXT_KEY_SPY_NAME_NC_PONCA_8'),
		('CIVILIZATION_NC_PONCA',		'TXT_KEY_SPY_NAME_NC_PONCA_9');
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_Start_Region_Priority
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Civilization_Start_Region_Priority
		(CivilizationType, 							RegionType)
VALUES	('CIVILIZATION_NC_PONCA',	'REGION_PLAINS');
--=======================================================================================================================
--=======================================================================================================================