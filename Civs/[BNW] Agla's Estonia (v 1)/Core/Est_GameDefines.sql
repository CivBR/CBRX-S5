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
		(Type, 						BuildingClass, PrereqTech,	   Cost, GreatWorkSlotType,			GreatWorkCount, SpecialistType, SpecialistCount, FaithCost, UnlockedByBelief, GoldMaintenance, MinAreaSize, ConquestProb, NeverCapture, 	Description, 						Help, 									Strategy,									Civilopedia, 								ArtDefineTag, PortraitIndex, IconAtlas)
SELECT	'BUILDING_AGLA_LAULUVALJAK',	BuildingClass, PrereqTech, Cost, 'GREAT_WORK_SLOT_MUSIC',	1,				SpecialistType, SpecialistCount, FaithCost, UnlockedByBelief, GoldMaintenance, MinAreaSize, ConquestProb, 1, 				'TXT_KEY_BUILDING_AGLA_LAULUVALJAK', 	'TXT_KEY_BUILDING_AGLA_LAULUVALJAK_HELP',	'TXT_KEY_BUILDING_AGLA_LAULUVALJAK_STRATEGY',	'TXT_KEY_BUILDING_AGLA_LAULUVALJAK_TEXT',  	ArtDefineTag, 3, 			 'AGLA_ESTONIA_ICON_ATLAS'
FROM Buildings WHERE Type = 'BUILDING_STADIUM';

INSERT INTO Buildings 		
		(Type, 											BuildingClass,	 GreatWorkCount,	Cost, FaithCost, PrereqTech, Description,											Help, 														NeverCapture)
VALUES	('BUILDING_AGLA_LAULUVALJAK_GREAT_PEOPLE',	'BUILDINGCLASS_MONUMENT', 						  -1,				-1,   -1,		 null,		 'TXT_KEY_BUILDING_AGLA_LAULUVALJAK_GREAT_PEOPLE',	'TXT_KEY_BUILDING_AGLA_LAULUVALJAK_GREAT_PEOPLE_HELP',	1);

------------------------------------------------------------------------------------------------------------------------	
-- Building_ClassesNeededInCity
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_ClassesNeededInCity 	
		(BuildingType, 				BuildingClassType)
SELECT	'BUILDING_AGLA_LAULUVALJAK',	BuildingClassType
FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_STADIUM';	
------------------------------------------------------------------------------------------------------------------------	
-- Building_Flavors
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_Flavors 	
		(BuildingType, 				FlavorType, Flavor)
SELECT	'BUILDING_AGLA_LAULUVALJAK',	FlavorType, Flavor
FROM Building_Flavors WHERE BuildingType = 'BUILDING_STADIUM';

INSERT INTO Building_Flavors 	
		(BuildingType, 				FlavorType,		  		Flavor)
VALUES	('BUILDING_AGLA_LAULUVALJAK', 'FLAVOR_GREAT_PEOPLE',  50);
------------------------------------------------------------------------------------------------------------------------	
-- Building_YieldChanges
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_YieldChanges 	 
		(BuildingType, 				YieldType, Yield)
SELECT	'BUILDING_AGLA_LAULUVALJAK',	YieldType, Yield
FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_STADIUM';

-- Building_SpecialistYieldChanges
------------------------------	
INSERT INTO Building_SpecialistYieldChanges 	
		(BuildingType, 						SpecialistType,				YieldType,		Yield)
VALUES	('BUILDING_AGLA_LAULUVALJAK',		'SPECIALIST_WRITER',		'YIELD_PRODUCTION',	1),
		('BUILDING_AGLA_LAULUVALJAK',		'SPECIALIST_ARTIST',		'YIELD_PRODUCTION',	1),
		('BUILDING_AGLA_LAULUVALJAK',		'SPECIALIST_MUSICIAN',		'YIELD_PRODUCTION',	1),
		('BUILDING_AGLA_LAULUVALJAK',		'SPECIALIST_SCIENTIST',		'YIELD_GOLD',	1),
		('BUILDING_AGLA_LAULUVALJAK',		'SPECIALIST_MERCHANT',		'YIELD_CULTURE',	1),
		('BUILDING_AGLA_LAULUVALJAK',		'SPECIALIST_ENGINEER',		'YIELD_GOLD',	1);	
	

--=======================================================================================================================	
-- UNITS
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------
-- UnitPromotions
--------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
-- Units
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Units 	
		(Type, 							Class, PrereqTech, Combat, Cost, FaithCost, RequiresFaithPurchaseEnabled, Moves, CombatClass, Domain, DefaultUnitAI, MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, IgnoreBuildingDefense, GoodyHutUpgradeUnitClass, AdvancedStartCost, XPValueAttack, XPValueDefense, MoveRate, Description, 								Help, 											Strategy, 											Civilopedia, 									UnitArtInfo, 								UnitFlagAtlas,								UnitFlagIconOffset,	IconAtlas,							PortraitIndex)
SELECT	'UNIT_AGLA_FBROTHER',	Class, PrereqTech, Combat, Cost, FaithCost, RequiresFaithPurchaseEnabled, Moves, CombatClass, Domain, DefaultUnitAI, MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, IgnoreBuildingDefense, GoodyHutUpgradeUnitClass, AdvancedStartCost, XPValueAttack, XPValueDefense, MoveRate, 'TXT_KEY_UNIT_AGLA_FBROTHER',	'TXT_KEY_UNIT_AGLA_FBROTHER_HELP',		'TXT_KEY_UNIT_AGLA_FBROTHER_STRATEGY', 	'TXT_KEY_UNIT_AGLA_FBROTHER_TEXT',		'ART_DEF_UNIT_AGLA_FBROTHER',		'AGLA_ESTONIA_UNIT_FLAG_ATLAS',	0,					'AGLA_ESTONIA_ICON_ATLAS',	2
FROM Units WHERE Type = 'UNIT_MARINE';	
------------------------------------------------------------------------------------------------------------------------		
-- Unit_AITypes
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Unit_AITypes 	
		(UnitType, 						UnitAIType)
SELECT	'UNIT_AGLA_FBROTHER', 	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_MARINE';
------------------------------------------------------------------------------------------------------------------------	
-- Unit_ClassUpgrades
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 						UnitClassType)
SELECT	'UNIT_AGLA_FBROTHER', 	UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_MARINE';
------------------------------------------------------------------------------------------------------------------------	
-- Unit_Flavors
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Unit_Flavors 	
		(UnitType, 						FlavorType, Flavor)
SELECT	'UNIT_AGLA_FBROTHER', 	FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_MARINE';
------------------------------------------------------------------------------------------------------------------------	
-- Unit_FreePromotions
------------------------------------------------------------------------------------------------------------------------	
-- UnitPromotions
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO UnitPromotions 
		(Type, 							LostWithUpgrade, IgnoreZOC, Description, 							 Help, 										 Sound, 			 CannotBeChosen, PortraitIndex, IconAtlas, 		 PediaType, 		 PediaEntry)
VALUES	('PROMOTION_AGLA_FBROTHER', 	0,				1,			 'TXT_KEY_PROMOTION_AGLA_FBROTHER',	 'TXT_KEY_PROMOTION_AGLA_FBROTHER_HELP',  'AS2D_IF_LEVELUP',  1, 			 59, 			'ABILITY_ATLAS', 'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_AGLA_FBROTHER');

UPDATE UnitPromotions
SET EnemyRoute = 1
WHERE Type = 'PROMOTION_AGLA_FBROTHER';

INSERT INTO Unit_FreePromotions 	
		(UnitType, 						PromotionType)
SELECT	'UNIT_AGLA_FBROTHER', 	PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_MARINE';

INSERT INTO Unit_FreePromotions 	
		(UnitType, 					PromotionType)
VALUES	('UNIT_AGLA_FBROTHER',	'PROMOTION_AGLA_FBROTHER'),
		('UNIT_AGLA_FBROTHER',	'PROMOTION_WOODSMAN');

------------------------------------------------------------------------------------------------------------------------	
-- UnitGameplay2DScripts
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 						SelectionSound,	FirstSelectionSound)
SELECT	'UNIT_AGLA_FBROTHER', 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_MARINE';	
--=======================================================================================================================	
-- LEADERS
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- Leaders
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Leaders 
		(Type, 								ArtDefineTag, 						Description, 							Civilopedia, 									CivilopediaTag, 										IconAtlas, 								PortraitIndex)
VALUES	('LEADER_AGLA_ESTONIA', 	'Agla_Estonia_Scene.xml',	'TXT_KEY_LEADER_AGLA_ESTONIA',	'TXT_KEY_LEADER_AGLA_ESTONIA_PEDIA',	'TXT_KEY_CIVILOPEDIA_LEADERS_AGLA_ESTONIA',	'AGLA_ESTONIA_ICON_ATLAS', 	1);

UPDATE Leaders
SET VictoryCompetitiveness = 5,
WonderCompetitiveness = 8,
MinorCivCompetitiveness = 4,
Boldness = 5,
DiploBalance = 4,
WarmongerHate = 4,
DenounceWillingness = 4,
DoFWillingness = 3,
Loyalty = 4,
Neediness = 3,
Forgiveness = 5,
Chattiness = 6,
Meanness = 8
WHERE Type = 'LEADER_AGLA_ESTONIA';	
------------------------------------------------------------------------------------------------------------------------		
-- Leader_MajorCivApproachBiases
------------------------------------------------------------------------------------------------------------------------						
INSERT INTO Leader_MajorCivApproachBiases 
		(LeaderType, 						MajorCivApproachType, 				Bias)
VALUES	('LEADER_AGLA_ESTONIA', 	'MAJOR_CIV_APPROACH_WAR', 			3),
		('LEADER_AGLA_ESTONIA', 	'MAJOR_CIV_APPROACH_HOSTILE', 		3),
		('LEADER_AGLA_ESTONIA', 	'MAJOR_CIV_APPROACH_DECEPTIVE',		4),
		('LEADER_AGLA_ESTONIA', 	'MAJOR_CIV_APPROACH_GUARDED', 		5),
		('LEADER_AGLA_ESTONIA', 	'MAJOR_CIV_APPROACH_AFRAID', 		5),
		('LEADER_AGLA_ESTONIA', 	'MAJOR_CIV_APPROACH_FRIENDLY', 		4),
		('LEADER_AGLA_ESTONIA', 	'MAJOR_CIV_APPROACH_NEUTRAL', 		6);
------------------------------------------------------------------------------------------------------------------------	
-- Leader_MajorCivApproachBiases
------------------------------------------------------------------------------------------------------------------------							
INSERT INTO Leader_MinorCivApproachBiases 
		(LeaderType, 						MinorCivApproachType, 				Bias)
VALUES	('LEADER_AGLA_ESTONIA', 	'MINOR_CIV_APPROACH_IGNORE', 		5),
		('LEADER_AGLA_ESTONIA', 	'MINOR_CIV_APPROACH_FRIENDLY', 		4),
		('LEADER_AGLA_ESTONIA', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	2),
		('LEADER_AGLA_ESTONIA', 	'MINOR_CIV_APPROACH_CONQUEST', 		2),
		('LEADER_AGLA_ESTONIA', 	'MINOR_CIV_APPROACH_BULLY', 		2);
------------------------------------------------------------------------------------------------------------------------	
-- Leader_Flavors
------------------------------------------------------------------------------------------------------------------------							
INSERT INTO Leader_Flavors 
		(LeaderType, 						FlavorType, 						Flavor)
VALUES	('LEADER_AGLA_ESTONIA', 	'FLAVOR_OFFENSE', 					5),
		('LEADER_AGLA_ESTONIA', 	'FLAVOR_DEFENSE', 					4),
		('LEADER_AGLA_ESTONIA', 	'FLAVOR_CITY_DEFENSE', 				3),
		('LEADER_AGLA_ESTONIA', 	'FLAVOR_MILITARY_TRAINING', 		5),
		('LEADER_AGLA_ESTONIA', 	'FLAVOR_RECON', 					4),
		('LEADER_AGLA_ESTONIA', 	'FLAVOR_RANGED', 					4),
		('LEADER_AGLA_ESTONIA', 	'FLAVOR_MOBILE', 					3),
		('LEADER_AGLA_ESTONIA', 	'FLAVOR_NAVAL', 					3),
		('LEADER_AGLA_ESTONIA', 	'FLAVOR_NAVAL_RECON', 				3),
		('LEADER_AGLA_ESTONIA', 	'FLAVOR_NAVAL_GROWTH', 				3),
		('LEADER_AGLA_ESTONIA', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	3),
		('LEADER_AGLA_ESTONIA', 	'FLAVOR_AIR', 						2),
		('LEADER_AGLA_ESTONIA', 	'FLAVOR_EXPANSION', 				5),
		('LEADER_AGLA_ESTONIA', 	'FLAVOR_GROWTH', 					3),
		('LEADER_AGLA_ESTONIA', 	'FLAVOR_TILE_IMPROVEMENT', 			8),
		('LEADER_AGLA_ESTONIA', 	'FLAVOR_INFRASTRUCTURE', 			3),
		('LEADER_AGLA_ESTONIA', 	'FLAVOR_PRODUCTION', 				9),
		('LEADER_AGLA_ESTONIA', 	'FLAVOR_GOLD', 						4),
		('LEADER_AGLA_ESTONIA', 	'FLAVOR_SCIENCE', 					3),
		('LEADER_AGLA_ESTONIA', 	'FLAVOR_CULTURE', 					4),
		('LEADER_AGLA_ESTONIA', 	'FLAVOR_HAPPINESS', 				9),
		('LEADER_AGLA_ESTONIA', 	'FLAVOR_GREAT_PEOPLE', 				8),
		('LEADER_AGLA_ESTONIA', 	'FLAVOR_WONDER', 					8),
		('LEADER_AGLA_ESTONIA', 	'FLAVOR_RELIGION', 					4),
		('LEADER_AGLA_ESTONIA', 	'FLAVOR_DIPLOMACY', 				2),
		('LEADER_AGLA_ESTONIA', 	'FLAVOR_SPACESHIP', 				2),
		('LEADER_AGLA_ESTONIA', 	'FLAVOR_WATER_CONNECTION', 			5),
		('LEADER_AGLA_ESTONIA', 	'FLAVOR_NUKE', 						3),
		('LEADER_AGLA_ESTONIA', 	'FLAVOR_USE_NUKE', 					2),
		('LEADER_AGLA_ESTONIA', 	'FLAVOR_ESPIONAGE', 				2),
		('LEADER_AGLA_ESTONIA', 	'FLAVOR_AIRLIFT', 					2),
		('LEADER_AGLA_ESTONIA', 	'FLAVOR_I_TRADE_DESTINATION', 		5),
		('LEADER_AGLA_ESTONIA', 	'FLAVOR_I_TRADE_ORIGIN', 			5),
		('LEADER_AGLA_ESTONIA', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
		('LEADER_AGLA_ESTONIA', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
		('LEADER_AGLA_ESTONIA', 	'FLAVOR_ARCHAEOLOGY', 				5),
		('LEADER_AGLA_ESTONIA', 	'FLAVOR_AIR_CARRIER', 				5);
--------------------------------------------------------------------------------------------------------------------------
-- Diplomacy_Responses
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Diplomacy_Responses
		(LeaderType, 						ResponseType, 							 			Response, 																	 	Bias)
VALUES 	('LEADER_AGLA_ESTONIA',	'RESPONSE_AI_DOF_BACKSTAB', 			 			'TXT_KEY_LEADER_AGLA_ESTONIA_DENOUNCE_FRIEND%', 			 			500),
		('LEADER_AGLA_ESTONIA',	'RESPONSE_ATTACKED_HOSTILE', 			 			'TXT_KEY_LEADER_AGLA_ESTONIA_ATTACKED_HOSTILE%', 			 			500),
		('LEADER_AGLA_ESTONIA',	'RESPONSE_DEFEATED', 					 			'TXT_KEY_LEADER_AGLA_ESTONIA_DEFEATED%', 					 			500),
		('LEADER_AGLA_ESTONIA',	'RESPONSE_DOW_GENERIC', 				 			'TXT_KEY_LEADER_AGLA_ESTONIA_DOW_GENERIC%', 				 			500),
		('LEADER_AGLA_ESTONIA',	'RESPONSE_EXPANSION_SERIOUS_WARNING', 				'TXT_KEY_LEADER_AGLA_ESTONIA_EXPANSION_SERIOUS_WARNING%', 	 			500),
		('LEADER_AGLA_ESTONIA',	'RESPONSE_FIRST_GREETING', 				 			'TXT_KEY_LEADER_AGLA_ESTONIA_FIRSTGREETING%', 				 			500),
		('LEADER_AGLA_ESTONIA',	'RESPONSE_GREETING_HOSTILE_HELLO', 					'TXT_KEY_LEADER_AGLA_ESTONIA_GREETING_HOSTILE_HELLO%', 		 		500),
		('LEADER_AGLA_ESTONIA',	'RESPONSE_GREETING_NEUTRAL_HELLO', 					'TXT_KEY_LEADER_AGLA_ESTONIA_GREETING_NEUTRAL_HELLO%', 		 		500),
		('LEADER_AGLA_ESTONIA',	'RESPONSE_GREETING_POLITE_HELLO', 					'TXT_KEY_LEADER_AGLA_ESTONIA_GREETING_POLITE_HELLO%', 		 			500),
		('LEADER_AGLA_ESTONIA',	'RESPONSE_HOSTILE_AGGRESSIVE_MILITARY_WARNING', 	'TXT_KEY_LEADER_AGLA_ESTONIA_HOSTILE_AGGRESSIVE_MILITARY_WARNING%', 	500),
		('LEADER_AGLA_ESTONIA',	'RESPONSE_LUXURY_TRADE', 							'TXT_KEY_LEADER_AGLA_ESTONIA_LUXURY_TRADE%', 		  					500),
		('LEADER_AGLA_ESTONIA',	'RESPONSE_OPEN_BORDERS_EXCHANGE', 					'TXT_KEY_LEADER_AGLA_ESTONIA_OPEN_BORDERS_EXCHANGE%', 		  			500),
		('LEADER_AGLA_ESTONIA',	'RESPONSE_REQUEST', 								'TXT_KEY_LEADER_AGLA_ESTONIA_REQUEST%', 		  						500),
		('LEADER_AGLA_ESTONIA',	'RESPONSE_TOO_SOON_NO_PEACE', 			 			'TXT_KEY_LEADER_AGLA_ESTONIA_TOO_SOON_NO_PEACE%', 			  			500),
		('LEADER_AGLA_ESTONIA',	'RESPONSE_RESPONSE_TO_BEING_DENOUNCED',  			'TXT_KEY_LEADER_AGLA_ESTONIA_RESPONSE_TO_BEING_DENOUNCED%',   			500),
		('LEADER_AGLA_ESTONIA',	'RESPONSE_WINWAR', 		 							'TXT_KEY_LEADER_AGLA_ESTONIA_WINWAR%', 					  			500),
		('LEADER_AGLA_ESTONIA',	'RESPONSE_WORK_AGAINST_SOMEONE', 		 			'TXT_KEY_LEADER_AGLA_ESTONIA_DENOUNCE%', 					  			500),
		('LEADER_AGLA_ESTONIA',	'RESPONSE_WORK_WITH_US', 				 			'TXT_KEY_LEADER_AGLA_ESTONIA_DEC_FRIENDSHIP%', 			  	  		500);
------------------------------------------------------------------------------------------------------------------------	
-- Leader_Traits
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Leader_Traits 
		(LeaderType, 						TraitType)
VALUES	('LEADER_AGLA_ESTONIA', 	'TRAIT_AGLA_ESTONIA');
------------------------------------------------------------------------------------------------------------------------
-- Traits
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Traits 
		(Type, 								Description, 							ShortDescription)
VALUES	('TRAIT_AGLA_ESTONIA', 	'TXT_KEY_TRAIT_AGLA_ESTONIA',	'TXT_KEY_TRAIT_AGLA_ESTONIA_SHORT');

-- BuildingClasses
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO BuildingClasses
		(Type, 											DefaultBuilding, 							Description)
VALUES	('BUILDINGCLASS_DUMMY_AGLA_ESTONIA',	'BUILDING_DUMMY_AGLA_ESTONIA',		'TXT_KEY_BUILDING_DUMMY_AGLA_ESTONIA');
--------------------------------------------------------------------------------------------------------------------------
-- Buildings
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Buildings 	
		(Type, 						 				BuildingClass, 									GreatPeopleRateModifier,	GreatWorkCount, Cost, FaithCost, PrereqTech, NeverCapture,	Description, 										Help)
VALUES	('BUILDING_DUMMY_AGLA_ESTONIA', 	'BUILDINGCLASS_DUMMY_AGLA_ESTONIA', 	5,					-1, 			-1,   -1, 		 null, 		 1,				'TXT_KEY_BUILDING_DUMMY_AGLA_ESTONIA',		'TXT_KEY_BUILDING_DUMMY_AGLA_ESTONIA_HELP');

-- ======================================================================================================
-- BuildingClasses
------------------
INSERT INTO BuildingClasses
        (Type,                              DefaultBuilding,              Description)
VALUES  ('BUILDINGCLASS_AGLA_ESTONIA_MUSIC',  'BUILDING_AGLA_ESTONIA_MUSIC',   'TXT_KEY_BLDG_AGLA_ESTONIA_MUSIC');
------------
-- Buildings
------------
INSERT INTO Buildings
(Type,                                     BuildingClass,						 Defense, 	SpecialistCount, GreatWorkCount, Cost, FaithCost, Description,                         Help,                                  NeverCapture)
VALUES    ('BUILDING_AGLA_ESTONIA_MUSIC', 'BUILDINGCLASS_AGLA_ESTONIA_MUSIC',    500,   0,                -1,             -1,   -1,       'TXT_KEY_BLDG_AGLA_ESTONIA_MUSIC',   'TXT_KEY_BLDG_AGLA_ESTONIA_MUSIC',   1);
-------------------------------
--------------------------

--=======================================================================================================================	
-- CIVILIZATIONS
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- Civilizations
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilizations 	
		(Type, 									DerivativeCiv,				SoundtrackTag,  MapImage, 							DawnOfManQuote, 								DawnOfManImage,					Description,								ShortDescription,								Adjective,										Civilopedia,												CivilopediaTag,										DefaultPlayerColor,						ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas,							PortraitIndex,	AlphaIconAtlas)
SELECT	'CIVILIZATION_AGLA_ESTONIA',	'CIVILIZATION_GERMANY',		'Poland', 		'Agla_MapEstonia512.dds',	'TXT_KEY_CIV_DAWN_AGLA_ESTONIA_TEXT',	'Agla_DOMEstonia.dds',	'TXT_KEY_CIV_AGLA_ESTONIA_DESC', 	'TXT_KEY_CIV_AGLA_ESTONIA_SHORT_DESC',	'TXT_KEY_CIV_AGLA_ESTONIA_ADJECTIVE',	'TXT_KEY_CIVILOPEDIA_CIVS_AGLA_ESTONIA_TEXT_1',	'TXT_KEY_CIVILOPEDIA_CIVS_AGLA_ESTONIA',	'PLAYERCOLOR_AGLA_ESTONIA',	ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, 'AGLA_ESTONIA_ICON_ATLAS',	   0,				'AGLA_ESTONIA_ALPHA_ATLAS'
FROM Civilizations WHERE Type = 'CIVILIZATION_GERMANY';
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_CityNames
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilization_CityNames 
		(CivilizationType, 									CityName)
VALUES	('CIVILIZATION_AGLA_ESTONIA',	'TXT_KEY_CITY_NAME_AGLA_ESTONIA_1'),
		('CIVILIZATION_AGLA_ESTONIA',	'TXT_KEY_CITY_NAME_AGLA_ESTONIA_2'),
		('CIVILIZATION_AGLA_ESTONIA',	'TXT_KEY_CITY_NAME_AGLA_ESTONIA_3'),
		('CIVILIZATION_AGLA_ESTONIA',	'TXT_KEY_CITY_NAME_AGLA_ESTONIA_4'),
		('CIVILIZATION_AGLA_ESTONIA',	'TXT_KEY_CITY_NAME_AGLA_ESTONIA_5'),
		('CIVILIZATION_AGLA_ESTONIA',	'TXT_KEY_CITY_NAME_AGLA_ESTONIA_6'),
		('CIVILIZATION_AGLA_ESTONIA',	'TXT_KEY_CITY_NAME_AGLA_ESTONIA_7'),
		('CIVILIZATION_AGLA_ESTONIA',	'TXT_KEY_CITY_NAME_AGLA_ESTONIA_8'),
		('CIVILIZATION_AGLA_ESTONIA',	'TXT_KEY_CITY_NAME_AGLA_ESTONIA_9'),
		('CIVILIZATION_AGLA_ESTONIA',	'TXT_KEY_CITY_NAME_AGLA_ESTONIA_10'),
		('CIVILIZATION_AGLA_ESTONIA',	'TXT_KEY_CITY_NAME_AGLA_ESTONIA_11'),
		('CIVILIZATION_AGLA_ESTONIA',	'TXT_KEY_CITY_NAME_AGLA_ESTONIA_12'),
		('CIVILIZATION_AGLA_ESTONIA',	'TXT_KEY_CITY_NAME_AGLA_ESTONIA_13'),
		('CIVILIZATION_AGLA_ESTONIA',	'TXT_KEY_CITY_NAME_AGLA_ESTONIA_14'),
		('CIVILIZATION_AGLA_ESTONIA',	'TXT_KEY_CITY_NAME_AGLA_ESTONIA_15'),
		('CIVILIZATION_AGLA_ESTONIA',	'TXT_KEY_CITY_NAME_AGLA_ESTONIA_16'),
		('CIVILIZATION_AGLA_ESTONIA',	'TXT_KEY_CITY_NAME_AGLA_ESTONIA_17'),
		('CIVILIZATION_AGLA_ESTONIA',	'TXT_KEY_CITY_NAME_AGLA_ESTONIA_18'),
		('CIVILIZATION_AGLA_ESTONIA',	'TXT_KEY_CITY_NAME_AGLA_ESTONIA_19'),
		('CIVILIZATION_AGLA_ESTONIA',	'TXT_KEY_CITY_NAME_AGLA_ESTONIA_20');
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_FreeBuildingClasses
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Civilization_FreeBuildingClasses 
		(CivilizationType, 						BuildingClassType)
SELECT	'CIVILIZATION_AGLA_ESTONIA', 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE CivilizationType = 'CIVILIZATION_GERMANY';
------------------------------------------------------------------------------------------------------------------------		
-- Civilization_FreeTechs
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Civilization_FreeTechs 
		(CivilizationType, 						TechType)
SELECT	'CIVILIZATION_AGLA_ESTONIA', 	TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_GERMANY';
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_FreeUnits
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_FreeUnits 
		(CivilizationType, 						UnitClassType, Count, UnitAIType)
SELECT	'CIVILIZATION_AGLA_ESTONIA', 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_GERMANY';
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_Leaders
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_Leaders 
		(CivilizationType, 						LeaderheadType)
VALUES	('CIVILIZATION_AGLA_ESTONIA',	'LEADER_AGLA_ESTONIA');
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_UnitClassOverrides 
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_BuildingClassOverrides 
		(CivilizationType, 						BuildingClassType, 				BuildingType)
VALUES	('CIVILIZATION_AGLA_ESTONIA', 	'BUILDINGCLASS_STADIUM',	'BUILDING_AGLA_LAULUVALJAK');
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_UnitClassOverrides 
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_UnitClassOverrides 
		(CivilizationType, 						UnitClassType, 			UnitType)
VALUES	('CIVILIZATION_AGLA_ESTONIA',	'UNITCLASS_MARINE',	'UNIT_AGLA_FBROTHER');
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_Religions
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Civilization_Religions 
		(CivilizationType, 						ReligionType)
VALUES	('CIVILIZATION_AGLA_ESTONIA',	'RELIGION_CHRISTIANITY');
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_SpyNames
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilization_SpyNames 
		(CivilizationType, 						SpyName)
VALUES	('CIVILIZATION_AGLA_ESTONIA',	'TXT_KEY_SPY_NAME_AGLA_ESTONIA_0'),
		('CIVILIZATION_AGLA_ESTONIA',	'TXT_KEY_SPY_NAME_AGLA_ESTONIA_1'),
		('CIVILIZATION_AGLA_ESTONIA',	'TXT_KEY_SPY_NAME_AGLA_ESTONIA_2'),
		('CIVILIZATION_AGLA_ESTONIA',	'TXT_KEY_SPY_NAME_AGLA_ESTONIA_3'),
		('CIVILIZATION_AGLA_ESTONIA',	'TXT_KEY_SPY_NAME_AGLA_ESTONIA_4'),
		('CIVILIZATION_AGLA_ESTONIA',	'TXT_KEY_SPY_NAME_AGLA_ESTONIA_5'),
		('CIVILIZATION_AGLA_ESTONIA',	'TXT_KEY_SPY_NAME_AGLA_ESTONIA_6'),
		('CIVILIZATION_AGLA_ESTONIA',	'TXT_KEY_SPY_NAME_AGLA_ESTONIA_7'),
		('CIVILIZATION_AGLA_ESTONIA',	'TXT_KEY_SPY_NAME_AGLA_ESTONIA_8'),
		('CIVILIZATION_AGLA_ESTONIA',	'TXT_KEY_SPY_NAME_AGLA_ESTONIA_9');

--=======================================================================================================================
--=======================================================================================================================