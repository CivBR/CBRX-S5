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
SELECT	'BUILDING_AGLA_LITERACY_CLUB',	BuildingClass, PrereqTech, Cost, 'GREAT_WORK_SLOT_ART_ARTIFACT',	2,				SpecialistType, SpecialistCount, FaithCost, UnlockedByBelief, GoldMaintenance, MinAreaSize, ConquestProb, 1, 				'TXT_KEY_BUILDING_AGLA_LITERACY_CLUB', 	'TXT_KEY_BUILDING_AGLA_LITERACY_CLUB_HELP',	'TXT_KEY_BUILDING_AGLA_LITERACY_CLUB_STRATEGY',	'TXT_KEY_BUILDING_AGLA_LITERACY_CLUB_TEXT',  	ArtDefineTag, 3, 			 'AGLA_ZELENY_KLYN_ICON_ATLAS'
FROM Buildings WHERE Type = 'BUILDING_MUSEUM';

------------------------------------------------------------------------------------------------------------------------	
-- Building_ClassesNeededInCity
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_ClassesNeededInCity 	
		(BuildingType, 				BuildingClassType)
SELECT	'BUILDING_AGLA_LITERACY_CLUB',	BuildingClassType
FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_MUSEUM';	
------------------------------------------------------------------------------------------------------------------------	
-- Building_Flavors
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_Flavors 	
		(BuildingType, 				FlavorType, Flavor)
SELECT	'BUILDING_AGLA_LITERACY_CLUB',	FlavorType, Flavor
FROM Building_Flavors WHERE BuildingType = 'BUILDING_MUSEUM';

INSERT INTO Building_Flavors 	
		(BuildingType, 				FlavorType,		  		Flavor)
VALUES	('BUILDING_AGLA_LITERACY_CLUB', 'FLAVOR_GREAT_PEOPLE',  50);

--==========================================================================================================================	
--==========================================================================================================================
-- Building_RemoteGreatPeoplePoints
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Building_RemoteGreatPeoplePoints	(
	BuildingType text,
	SpecialistType text,
	RateChange integer default 0,
	Modified boolean default 1,
	Capital boolean default 1);


INSERT INTO Building_RemoteGreatPeoplePoints 	
			(BuildingType, 						SpecialistType, 		RateChange,		Modified,	Capital)
VALUES		('BUILDING_AGLA_LITERACY_CLUB',		'SPECIALIST_WRITER', 	3,				1,			1);
--==========================================================================================================================	
------------------------------------------------------------------------------------------------------------------------	

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
		(Type, 						Class,	CombatClass, PrereqTech, Cost, Combat, RangedCombat, Range,	FaithCost, RequiresFaithPurchaseEnabled, Moves, CivilianAttackPriority, Special, Capture, Domain, DefaultUnitAI,	Description, 					Help, 								Strategy, 									Civilopedia, 						MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, ShowInPedia, OneShotTourism, OneShotTourismPercentOthers, AdvancedStartCost, WorkRate, ObsoleteTech, Mechanized, CombatLimit,  GoldenAgeTurns,  XPValueAttack, XPValueDefense, Conscription, MoveRate, SpreadReligion, ReligionSpreads, ReligiousStrength, FoundReligion, UnitArtInfo, 					UnitFlagAtlas, 						UnitFlagIconOffset, IconAtlas,						PortraitIndex)
SELECT	'UNIT_AGLA_YESAUL',		Class,	CombatClass, PrereqTech, Cost, Combat, RangedCombat, Range,	FaithCost, RequiresFaithPurchaseEnabled, Moves, CivilianAttackPriority, Special, Capture, Domain, DefaultUnitAI,	'TXT_KEY_UNIT_AGLA_YESAUL',	'TXT_KEY_UNIT_AGLA_YESAUL_HELP', 'TXT_KEY_UNIT_AGLA_YESAUL_STRATEGY',   'TXT_KEY_UNIT_AGLA_YESAUL_TEXT',	MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, ShowInPedia, OneShotTourism, OneShotTourismPercentOthers, AdvancedStartCost, WorkRate, ObsoleteTech, Mechanized, CombatLimit,  GoldenAgeTurns,  XPValueAttack, XPValueDefense, Conscription, MoveRate, SpreadReligion, ReligionSpreads, ReligiousStrength, '0', 'ART_DEF_UNIT_AGLA_YESAUL',	'AGLA_ZELENY_KLYN_UNIT_FLAG_ATLAS',	0,					'AGLA_ZELENY_KLYN_ICON_ATLAS',	2
FROM Units WHERE Type = 'UNIT_GREAT_GENERAL';  	
------------------------------------------------------------------------------------------------------------------------		
-- Unit_AITypes
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Unit_AITypes 	
		(UnitType, 						UnitAIType)
SELECT	'UNIT_AGLA_YESAUL', 	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_GREAT_GENERAL';
------------------------------------------------------------------------------------------------------------------------	
-- Unit_ClassUpgrades
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 						UnitClassType)
SELECT	'UNIT_AGLA_YESAUL', 	UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_GREAT_GENERAL';
------------------------------------------------------------------------------------------------------------------------	
-- Unit_Flavors
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Unit_Flavors 	
		(UnitType, 						FlavorType, Flavor)
SELECT	'UNIT_AGLA_YESAUL', 	FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_GREAT_GENERAL';
------------------------------------------------------------------------------------------------------------------------	
-- UnitPromotions
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO UnitPromotions 
		(Type, 						Description, 					 Help, 									Sound, 				CannotBeChosen, LostWithUpgrade,	CityAttack, CityAttackPlunderModifier,  PortraitIndex, 	IconAtlas, 			PediaType, 			PediaEntry)
VALUES	('PROMOTION_AGLA_YESAUL', 	'TXT_KEY_UNIT_AGLA_YESAUL',	 'TXT_KEY_UNIT_AGLA_YESAUL_HELP', 	'AS2D_IF_LEVELUP', 	1, 				0,					0,			0,							59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_AGLA_YESAUL');

-- Unit_FreePromotions
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_FreePromotions 	
		(UnitType, 			PromotionType)
SELECT	'UNIT_AGLA_YESAUL', 	PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_GREAT_GENERAL';

INSERT INTO Unit_FreePromotions 	
		(UnitType, 			PromotionType)
VALUES	('UNIT_AGLA_YESAUL', 'PROMOTION_AGLA_YESAUL');

INSERT INTO Unit_Builds 
		(UnitType,						BuildType)
SELECT 'UNIT_AGLA_YESAUL',				 BuildType
FROM Unit_Builds WHERE UnitType = 'UNIT_GREAT_GENERAL';

-- BuildingClasses
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO BuildingClasses
		(Type, 												DefaultBuilding, 								Description)
VALUES	('BUILDINGCLASS_DUMMY_AGLA_YESAUL',	'BUILDING_DUMMY_AGLA_YESAUL',		'TXT_KEY_BUILDING_DUMMY_AGLA_YESAUL');
------------------------------------------------------------------------------------------------------------------------	
-- Buildings
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Buildings 		
		(Type, 											BuildingClass,						GreatWorksTourismModifier,		GreatWorkCount,	Cost, FaithCost, PrereqTech, NeverCapture,	Description,										Help)
VALUES	('BUILDING_DUMMY_AGLA_YESAUL',		'BUILDINGCLASS_DUMMY_AGLA_YESAUL',		10,				-1,				-1,   -1,		 null,		 1,				'TXT_KEY_BUILDING_DUMMY_AGLA_YESAUL',	'TXT_KEY_BUILDING_DUMMY_AGLA_YESAUL_HELP');

------------------------------------------------------------------------------------------------------------------------	
-- UnitGameplay2DScripts
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 						SelectionSound,	FirstSelectionSound)
SELECT	'UNIT_AGLA_YESAUL', 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_GREAT_GENERAL';	
--=======================================================================================================================	
-- LEADERS
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- Leaders
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Leaders 
		(Type, 								ArtDefineTag, 						Description, 							Civilopedia, 									CivilopediaTag, 										IconAtlas, 								PortraitIndex)
VALUES	('LEADER_AGLA_ZELENY_KLYN', 	'Agla_Green_Scene.xml',	'TXT_KEY_LEADER_AGLA_ZELENY_KLYN',	'TXT_KEY_LEADER_AGLA_ZELENY_KLYN_PEDIA',	'TXT_KEY_CIVILOPEDIA_LEADERS_AGLA_ZELENY_KLYN',	'AGLA_ZELENY_KLYN_ICON_ATLAS', 	1);

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
WHERE Type = 'LEADER_AGLA_ZELENY_KLYN';	
------------------------------------------------------------------------------------------------------------------------		
-- Leader_MajorCivApproachBiases
------------------------------------------------------------------------------------------------------------------------						
INSERT INTO Leader_MajorCivApproachBiases 
		(LeaderType, 						MajorCivApproachType, 				Bias)
VALUES	('LEADER_AGLA_ZELENY_KLYN', 	'MAJOR_CIV_APPROACH_WAR', 			3),
		('LEADER_AGLA_ZELENY_KLYN', 	'MAJOR_CIV_APPROACH_HOSTILE', 		3),
		('LEADER_AGLA_ZELENY_KLYN', 	'MAJOR_CIV_APPROACH_DECEPTIVE',		4),
		('LEADER_AGLA_ZELENY_KLYN', 	'MAJOR_CIV_APPROACH_GUARDED', 		5),
		('LEADER_AGLA_ZELENY_KLYN', 	'MAJOR_CIV_APPROACH_AFRAID', 		5),
		('LEADER_AGLA_ZELENY_KLYN', 	'MAJOR_CIV_APPROACH_FRIENDLY', 		4),
		('LEADER_AGLA_ZELENY_KLYN', 	'MAJOR_CIV_APPROACH_NEUTRAL', 		6);
------------------------------------------------------------------------------------------------------------------------	
-- Leader_MajorCivApproachBiases
------------------------------------------------------------------------------------------------------------------------							
INSERT INTO Leader_MinorCivApproachBiases 
		(LeaderType, 						MinorCivApproachType, 				Bias)
VALUES	('LEADER_AGLA_ZELENY_KLYN', 	'MINOR_CIV_APPROACH_IGNORE', 		5),
		('LEADER_AGLA_ZELENY_KLYN', 	'MINOR_CIV_APPROACH_FRIENDLY', 		4),
		('LEADER_AGLA_ZELENY_KLYN', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	2),
		('LEADER_AGLA_ZELENY_KLYN', 	'MINOR_CIV_APPROACH_CONQUEST', 		2),
		('LEADER_AGLA_ZELENY_KLYN', 	'MINOR_CIV_APPROACH_BULLY', 		2);
------------------------------------------------------------------------------------------------------------------------	
-- Leader_Flavors
------------------------------------------------------------------------------------------------------------------------							
INSERT INTO Leader_Flavors 
		(LeaderType, 						FlavorType, 						Flavor)
VALUES	('LEADER_AGLA_ZELENY_KLYN', 	'FLAVOR_OFFENSE', 					5),
		('LEADER_AGLA_ZELENY_KLYN', 	'FLAVOR_DEFENSE', 					4),
		('LEADER_AGLA_ZELENY_KLYN', 	'FLAVOR_CITY_DEFENSE', 				3),
		('LEADER_AGLA_ZELENY_KLYN', 	'FLAVOR_MILITARY_TRAINING', 		5),
		('LEADER_AGLA_ZELENY_KLYN', 	'FLAVOR_RECON', 					4),
		('LEADER_AGLA_ZELENY_KLYN', 	'FLAVOR_RANGED', 					4),
		('LEADER_AGLA_ZELENY_KLYN', 	'FLAVOR_MOBILE', 					3),
		('LEADER_AGLA_ZELENY_KLYN', 	'FLAVOR_NAVAL', 					3),
		('LEADER_AGLA_ZELENY_KLYN', 	'FLAVOR_NAVAL_RECON', 				3),
		('LEADER_AGLA_ZELENY_KLYN', 	'FLAVOR_NAVAL_GROWTH', 				3),
		('LEADER_AGLA_ZELENY_KLYN', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	3),
		('LEADER_AGLA_ZELENY_KLYN', 	'FLAVOR_AIR', 						2),
		('LEADER_AGLA_ZELENY_KLYN', 	'FLAVOR_EXPANSION', 				5),
		('LEADER_AGLA_ZELENY_KLYN', 	'FLAVOR_GROWTH', 					3),
		('LEADER_AGLA_ZELENY_KLYN', 	'FLAVOR_TILE_IMPROVEMENT', 			8),
		('LEADER_AGLA_ZELENY_KLYN', 	'FLAVOR_INFRASTRUCTURE', 			3),
		('LEADER_AGLA_ZELENY_KLYN', 	'FLAVOR_PRODUCTION', 				9),
		('LEADER_AGLA_ZELENY_KLYN', 	'FLAVOR_GOLD', 						4),
		('LEADER_AGLA_ZELENY_KLYN', 	'FLAVOR_SCIENCE', 					3),
		('LEADER_AGLA_ZELENY_KLYN', 	'FLAVOR_CULTURE', 					4),
		('LEADER_AGLA_ZELENY_KLYN', 	'FLAVOR_HAPPINESS', 				9),
		('LEADER_AGLA_ZELENY_KLYN', 	'FLAVOR_GREAT_PEOPLE', 				8),
		('LEADER_AGLA_ZELENY_KLYN', 	'FLAVOR_WONDER', 					8),
		('LEADER_AGLA_ZELENY_KLYN', 	'FLAVOR_RELIGION', 					4),
		('LEADER_AGLA_ZELENY_KLYN', 	'FLAVOR_DIPLOMACY', 				2),
		('LEADER_AGLA_ZELENY_KLYN', 	'FLAVOR_SPACESHIP', 				2),
		('LEADER_AGLA_ZELENY_KLYN', 	'FLAVOR_WATER_CONNECTION', 			5),
		('LEADER_AGLA_ZELENY_KLYN', 	'FLAVOR_NUKE', 						3),
		('LEADER_AGLA_ZELENY_KLYN', 	'FLAVOR_USE_NUKE', 					2),
		('LEADER_AGLA_ZELENY_KLYN', 	'FLAVOR_ESPIONAGE', 				2),
		('LEADER_AGLA_ZELENY_KLYN', 	'FLAVOR_AIRLIFT', 					2),
		('LEADER_AGLA_ZELENY_KLYN', 	'FLAVOR_I_TRADE_DESTINATION', 		5),
		('LEADER_AGLA_ZELENY_KLYN', 	'FLAVOR_I_TRADE_ORIGIN', 			5),
		('LEADER_AGLA_ZELENY_KLYN', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
		('LEADER_AGLA_ZELENY_KLYN', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
		('LEADER_AGLA_ZELENY_KLYN', 	'FLAVOR_ARCHAEOLOGY', 				5),
		('LEADER_AGLA_ZELENY_KLYN', 	'FLAVOR_AIR_CARRIER', 				5);
--------------------------------------------------------------------------------------------------------------------------
-- Diplomacy_Responses
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Diplomacy_Responses
		(LeaderType, 						ResponseType, 							 			Response, 																	 	Bias)
VALUES 	('LEADER_AGLA_ZELENY_KLYN',	'RESPONSE_AI_DOF_BACKSTAB', 			 			'TXT_KEY_LEADER_AGLA_ZELENY_KLYN_DENOUNCE_FRIEND%', 			 			500),
		('LEADER_AGLA_ZELENY_KLYN',	'RESPONSE_ATTACKED_HOSTILE', 			 			'TXT_KEY_LEADER_AGLA_ZELENY_KLYN_ATTACKED_HOSTILE%', 			 			500),
		('LEADER_AGLA_ZELENY_KLYN',	'RESPONSE_DEFEATED', 					 			'TXT_KEY_LEADER_AGLA_ZELENY_KLYN_DEFEATED%', 					 			500),
		('LEADER_AGLA_ZELENY_KLYN',	'RESPONSE_DOW_GENERIC', 				 			'TXT_KEY_LEADER_AGLA_ZELENY_KLYN_DOW_GENERIC%', 				 			500),
		('LEADER_AGLA_ZELENY_KLYN',	'RESPONSE_EXPANSION_SERIOUS_WARNING', 				'TXT_KEY_LEADER_AGLA_ZELENY_KLYN_EXPANSION_SERIOUS_WARNING%', 	 			500),
		('LEADER_AGLA_ZELENY_KLYN',	'RESPONSE_FIRST_GREETING', 				 			'TXT_KEY_LEADER_AGLA_ZELENY_KLYN_FIRSTGREETING%', 				 			500),
		('LEADER_AGLA_ZELENY_KLYN',	'RESPONSE_GREETING_HOSTILE_HELLO', 					'TXT_KEY_LEADER_AGLA_ZELENY_KLYN_GREETING_HOSTILE_HELLO%', 		 		500),
		('LEADER_AGLA_ZELENY_KLYN',	'RESPONSE_GREETING_NEUTRAL_HELLO', 					'TXT_KEY_LEADER_AGLA_ZELENY_KLYN_GREETING_NEUTRAL_HELLO%', 		 		500),
		('LEADER_AGLA_ZELENY_KLYN',	'RESPONSE_GREETING_POLITE_HELLO', 					'TXT_KEY_LEADER_AGLA_ZELENY_KLYN_GREETING_POLITE_HELLO%', 		 			500),
		('LEADER_AGLA_ZELENY_KLYN',	'RESPONSE_HOSTILE_AGGRESSIVE_MILITARY_WARNING', 	'TXT_KEY_LEADER_AGLA_ZELENY_KLYN_HOSTILE_AGGRESSIVE_MILITARY_WARNING%', 	500),
		('LEADER_AGLA_ZELENY_KLYN',	'RESPONSE_LUXURY_TRADE', 							'TXT_KEY_LEADER_AGLA_ZELENY_KLYN_LUXURY_TRADE%', 		  					500),
		('LEADER_AGLA_ZELENY_KLYN',	'RESPONSE_OPEN_BORDERS_EXCHANGE', 					'TXT_KEY_LEADER_AGLA_ZELENY_KLYN_OPEN_BORDERS_EXCHANGE%', 		  			500),
		('LEADER_AGLA_ZELENY_KLYN',	'RESPONSE_REQUEST', 								'TXT_KEY_LEADER_AGLA_ZELENY_KLYN_REQUEST%', 		  						500),
		('LEADER_AGLA_ZELENY_KLYN',	'RESPONSE_TOO_SOON_NO_PEACE', 			 			'TXT_KEY_LEADER_AGLA_ZELENY_KLYN_TOO_SOON_NO_PEACE%', 			  			500),
		('LEADER_AGLA_ZELENY_KLYN',	'RESPONSE_RESPONSE_TO_BEING_DENOUNCED',  			'TXT_KEY_LEADER_AGLA_ZELENY_KLYN_RESPONSE_TO_BEING_DENOUNCED%',   			500),
		('LEADER_AGLA_ZELENY_KLYN',	'RESPONSE_WINWAR', 		 							'TXT_KEY_LEADER_AGLA_ZELENY_KLYN_WINWAR%', 					  			500),
		('LEADER_AGLA_ZELENY_KLYN',	'RESPONSE_WORK_AGAINST_SOMEONE', 		 			'TXT_KEY_LEADER_AGLA_ZELENY_KLYN_DENOUNCE%', 					  			500),
		('LEADER_AGLA_ZELENY_KLYN',	'RESPONSE_WORK_WITH_US', 				 			'TXT_KEY_LEADER_AGLA_ZELENY_KLYN_DEC_FRIENDSHIP%', 			  	  		500);
------------------------------------------------------------------------------------------------------------------------	
-- Leader_Traits
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Leader_Traits 
		(LeaderType, 						TraitType)
VALUES	('LEADER_AGLA_ZELENY_KLYN', 	'TRAIT_AGLA_ZELENY_KLYN');
------------------------------------------------------------------------------------------------------------------------
-- Traits
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Traits 
		(Type, 								Description, 							ShortDescription)
VALUES	('TRAIT_AGLA_ZELENY_KLYN', 	'TXT_KEY_TRAIT_AGLA_ZELENY_KLYN',	'TXT_KEY_TRAIT_AGLA_ZELENY_KLYN_SHORT');

-- BuildingClasses
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO BuildingClasses
		(Type, 												DefaultBuilding, 								Description)
VALUES	('BUILDINGCLASS_DUMMY_AGLA_ZELENY_KLYN',	'BUILDING_DUMMY_AGLA_ZELENY_KLYN',		'TXT_KEY_TRAIT_AGLA_ZELENY_KLYN');
------------------------------------------------------------------------------------------------------------------------	
-- Buildings
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Buildings 		
		(Type, 											BuildingClass,						FoodKept,		GreatWorkCount,	Cost, FaithCost, PrereqTech, NeverCapture,	Description,										Help)
VALUES	('BUILDING_DUMMY_AGLA_ZELENY_KLYN',		'BUILDINGCLASS_DUMMY_AGLA_ZELENY_KLYN',		2,				-1,				-1,   -1,		 null,		 1,				'TXT_KEY_BUILDING_DUMMY_AGLA_ZELENY_KLYN',	'TXT_KEY_BUILDING_DUMMY_AGLA_ZELENY_KLYN_HELP');


-- BuildingClasses
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO BuildingClasses
		(Type, 								DefaultBuilding, 							Description)
VALUES	('BUILDINGCLASS_AGLA_ZELENY_KLYN_1',	'BUILDING_AGLA_ZELENY_KLYN_TRADE_ROUTE_1',	'TXT_KEY_BUILDING_AGLA_ZELENY_KLYN'),
		('BUILDINGCLASS_AGLA_ZELENY_KLYN_2',	'BUILDING_AGLA_ZELENY_KLYN_TRADE_ROUTE_2',	'TXT_KEY_BUILDING_AGLA_ZELENY_KLYN'),
		('BUILDINGCLASS_AGLA_ZELENY_KLYN_3',	'BUILDING_AGLA_ZELENY_KLYN_TRADE_ROUTE_3',	'TXT_KEY_BUILDING_AGLA_ZELENY_KLYN');

-- Buildings
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Buildings 		
		(Type, 										BuildingClass,						GlobalPlotCultureCostModifier,	MilitaryProductionModifier,	GreatWorkCount,	Cost, FaithCost, PrereqTech, Description,										Help, 													NeverCapture)
VALUES	('BUILDING_AGLA_ZELENY_KLYN_TRADE_ROUTE_1',	'BUILDINGCLASS_AGLA_ZELENY_KLYN_1',	-5,					0,							-1,				-1,   -1,		 null,		 'TXT_KEY_TRAIT_AGLA_ZELENY_KLYN',	'TXT_KEY_TRAIT_AGLA_ZELENY_KLYN',	1),
		('BUILDING_AGLA_ZELENY_KLYN_TRADE_ROUTE_2',	'BUILDINGCLASS_AGLA_ZELENY_KLYN_2',	-5,					0,							-1,				-1,   -1,		 null,		 'TXT_KEY_TRAIT_AGLA_ZELENY_KLYN',	'TXT_KEY_TRAIT_AGLA_ZELENY_KLYN',	1),
		('BUILDING_AGLA_ZELENY_KLYN_TRADE_ROUTE_3',	'BUILDINGCLASS_AGLA_ZELENY_KLYN_3',	-5,					0,							-1,				-1,   -1,		 null,		 'TXT_KEY_TRAIT_AGLA_ZELENY_KLYN',	'TXT_KEY_TRAIT_AGLA_ZELENY_KLYN',	1);


--=======================================================================================================================	
-- CIVILIZATIONS
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- Civilizations
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilizations 	
		(Type, 									DerivativeCiv,				SoundtrackTag,  MapImage, 							DawnOfManQuote, 								DawnOfManImage,					Description,								ShortDescription,								Adjective,										Civilopedia,												CivilopediaTag,										DefaultPlayerColor,						ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas,							PortraitIndex,	AlphaIconAtlas)
SELECT	'CIVILIZATION_AGLA_ZELENY_KLYN',	'CIVILIZATION_GERMANY',		'Poland', 		'Agla_MapGreen512.dds',	'TXT_KEY_CIV_DAWN_AGLA_ZELENY_KLYN_TEXT',	'Agla_DOMGreen.dds',	'TXT_KEY_CIV_AGLA_ZELENY_KLYN_DESC', 	'TXT_KEY_CIV_AGLA_ZELENY_KLYN_SHORT_DESC',	'TXT_KEY_CIV_AGLA_ZELENY_KLYN_ADJECTIVE',	'TXT_KEY_CIVILOPEDIA_CIVS_AGLA_ZELENY_KLYN_TEXT_1',	'TXT_KEY_CIVILOPEDIA_CIVS_AGLA_ZELENY_KLYN',	'PLAYERCOLOR_AGLA_ZELENY_KLYN',	ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, 'AGLA_ZELENY_KLYN_ICON_ATLAS',	   0,				'AGLA_ZELENY_KLYN_ALPHA_ATLAS'
FROM Civilizations WHERE Type = 'CIVILIZATION_GERMANY';
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_CityNames
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilization_CityNames 
		(CivilizationType, 									CityName)
VALUES	('CIVILIZATION_AGLA_ZELENY_KLYN',	'TXT_KEY_CITY_NAME_AGLA_ZELENY_KLYN_1'),
		('CIVILIZATION_AGLA_ZELENY_KLYN',	'TXT_KEY_CITY_NAME_AGLA_ZELENY_KLYN_2'),
		('CIVILIZATION_AGLA_ZELENY_KLYN',	'TXT_KEY_CITY_NAME_AGLA_ZELENY_KLYN_3'),
		('CIVILIZATION_AGLA_ZELENY_KLYN',	'TXT_KEY_CITY_NAME_AGLA_ZELENY_KLYN_4'),
		('CIVILIZATION_AGLA_ZELENY_KLYN',	'TXT_KEY_CITY_NAME_AGLA_ZELENY_KLYN_5'),
		('CIVILIZATION_AGLA_ZELENY_KLYN',	'TXT_KEY_CITY_NAME_AGLA_ZELENY_KLYN_6'),
		('CIVILIZATION_AGLA_ZELENY_KLYN',	'TXT_KEY_CITY_NAME_AGLA_ZELENY_KLYN_7'),
		('CIVILIZATION_AGLA_ZELENY_KLYN',	'TXT_KEY_CITY_NAME_AGLA_ZELENY_KLYN_8'),
		('CIVILIZATION_AGLA_ZELENY_KLYN',	'TXT_KEY_CITY_NAME_AGLA_ZELENY_KLYN_9'),
		('CIVILIZATION_AGLA_ZELENY_KLYN',	'TXT_KEY_CITY_NAME_AGLA_ZELENY_KLYN_10'),
		('CIVILIZATION_AGLA_ZELENY_KLYN',	'TXT_KEY_CITY_NAME_AGLA_ZELENY_KLYN_11'),
		('CIVILIZATION_AGLA_ZELENY_KLYN',	'TXT_KEY_CITY_NAME_AGLA_ZELENY_KLYN_12'),
		('CIVILIZATION_AGLA_ZELENY_KLYN',	'TXT_KEY_CITY_NAME_AGLA_ZELENY_KLYN_13'),
		('CIVILIZATION_AGLA_ZELENY_KLYN',	'TXT_KEY_CITY_NAME_AGLA_ZELENY_KLYN_14'),
		('CIVILIZATION_AGLA_ZELENY_KLYN',	'TXT_KEY_CITY_NAME_AGLA_ZELENY_KLYN_15'),
		('CIVILIZATION_AGLA_ZELENY_KLYN',	'TXT_KEY_CITY_NAME_AGLA_ZELENY_KLYN_16'),
		('CIVILIZATION_AGLA_ZELENY_KLYN',	'TXT_KEY_CITY_NAME_AGLA_ZELENY_KLYN_17'),
		('CIVILIZATION_AGLA_ZELENY_KLYN',	'TXT_KEY_CITY_NAME_AGLA_ZELENY_KLYN_18'),
		('CIVILIZATION_AGLA_ZELENY_KLYN',	'TXT_KEY_CITY_NAME_AGLA_ZELENY_KLYN_19'),
		('CIVILIZATION_AGLA_ZELENY_KLYN',	'TXT_KEY_CITY_NAME_AGLA_ZELENY_KLYN_20');
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_FreeBuildingClasses
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Civilization_FreeBuildingClasses 
		(CivilizationType, 						BuildingClassType)
SELECT	'CIVILIZATION_AGLA_ZELENY_KLYN', 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE CivilizationType = 'CIVILIZATION_GERMANY';
------------------------------------------------------------------------------------------------------------------------		
-- Civilization_FreeTechs
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Civilization_FreeTechs 
		(CivilizationType, 						TechType)
SELECT	'CIVILIZATION_AGLA_ZELENY_KLYN', 	TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_GERMANY';
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_FreeUnits
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_FreeUnits 
		(CivilizationType, 						UnitClassType, Count, UnitAIType)
SELECT	'CIVILIZATION_AGLA_ZELENY_KLYN', 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_GERMANY';
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_Leaders
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_Leaders 
		(CivilizationType, 						LeaderheadType)
VALUES	('CIVILIZATION_AGLA_ZELENY_KLYN',	'LEADER_AGLA_ZELENY_KLYN');
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_UnitClassOverrides 
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_BuildingClassOverrides 
		(CivilizationType, 						BuildingClassType, 				BuildingType)
VALUES	('CIVILIZATION_AGLA_ZELENY_KLYN', 	'BUILDINGCLASS_MUSEUM',	'BUILDING_AGLA_LITERACY_CLUB');
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_UnitClassOverrides 
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_UnitClassOverrides 
		(CivilizationType, 						UnitClassType, 			UnitType)
VALUES	('CIVILIZATION_AGLA_ZELENY_KLYN',	'UNITCLASS_GREAT_GENERAL',	'UNIT_AGLA_YESAUL');
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_Religions
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Civilization_Religions 
		(CivilizationType, 						ReligionType)
VALUES	('CIVILIZATION_AGLA_ZELENY_KLYN',	'RELIGION_CHRISTIANITY');
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_SpyNames
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilization_SpyNames 
		(CivilizationType, 						SpyName)
VALUES	('CIVILIZATION_AGLA_ZELENY_KLYN',	'TXT_KEY_SPY_NAME_AGLA_ZELENY_KLYN_0'),
		('CIVILIZATION_AGLA_ZELENY_KLYN',	'TXT_KEY_SPY_NAME_AGLA_ZELENY_KLYN_1'),
		('CIVILIZATION_AGLA_ZELENY_KLYN',	'TXT_KEY_SPY_NAME_AGLA_ZELENY_KLYN_2'),
		('CIVILIZATION_AGLA_ZELENY_KLYN',	'TXT_KEY_SPY_NAME_AGLA_ZELENY_KLYN_3'),
		('CIVILIZATION_AGLA_ZELENY_KLYN',	'TXT_KEY_SPY_NAME_AGLA_ZELENY_KLYN_4'),
		('CIVILIZATION_AGLA_ZELENY_KLYN',	'TXT_KEY_SPY_NAME_AGLA_ZELENY_KLYN_5'),
		('CIVILIZATION_AGLA_ZELENY_KLYN',	'TXT_KEY_SPY_NAME_AGLA_ZELENY_KLYN_6'),
		('CIVILIZATION_AGLA_ZELENY_KLYN',	'TXT_KEY_SPY_NAME_AGLA_ZELENY_KLYN_7'),
		('CIVILIZATION_AGLA_ZELENY_KLYN',	'TXT_KEY_SPY_NAME_AGLA_ZELENY_KLYN_8'),
		('CIVILIZATION_AGLA_ZELENY_KLYN',	'TXT_KEY_SPY_NAME_AGLA_ZELENY_KLYN_9');

--=======================================================================================================================
--=======================================================================================================================