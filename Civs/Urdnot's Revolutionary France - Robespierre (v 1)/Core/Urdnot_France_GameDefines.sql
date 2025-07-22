--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
----------------------------------------------------------------------------------------------------------------------------	
-- Buildings
----------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Buildings 	
		(Type, 					BuildingClass, PrereqTech, GreatWorkSlotType, GreatWorkCount, CultureRateModifier, Cost, FaithCost, UnlockedByBelief, GoldMaintenance,  MinAreaSize, NeverCapture,  Description, 					Help, 								Strategy,								Civilopedia, 						ArtDefineTag, FreeStartEra, DisplayPosition, PortraitIndex, IconAtlas)
SELECT	'BUILDING_US_GUILLOTINE',	BuildingClass, PrereqTech, GreatWorkSlotType, GreatWorkCount, CultureRateModifier, Cost, FaithCost, UnlockedByBelief, GoldMaintenance,  MinAreaSize, 1, 			'TXT_KEY_BUILDING_US_GUILLOTINE',	'TXT_KEY_BUILDING_US_GUILLOTINE_HELP', 	'TXT_KEY_BUILDING_US_GUILLOTINE_STRATEGY',	'TXT_KEY_BUILDING_US_GUILLOTINE_TEXT',   ArtDefineTag, FreeStartEra, DisplayPosition, 3, 			'US_FRANCE_ICON_ATLAS'
FROM Buildings WHERE Type = 'BUILDING_THEATRE';	

UPDATE Buildings
SET ConquestProb = 100, NeverCapture = 0
WHERE Type = 'BUILDING_US_GUILLOTINE';
----------------------------------------------------------------------------------------------------------------------------	
-- Building_YieldChanges
----------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_YieldChanges 	
		(BuildingType, 			YieldType, Yield)
SELECT	'BUILDING_US_GUILLOTINE',	YieldType, Yield
FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_MONUMENT';
----------------------------------------------------------------------------------------------------------------------------	
-- Building_Flavors
----------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_Flavors 	
		(BuildingType, 			FlavorType, Flavor)
SELECT	'BUILDING_US_GUILLOTINE',	FlavorType, Flavor
FROM Building_Flavors WHERE BuildingType = 'BUILDING_THEATRE';
--=======================================================================================================================	
-- UNITS
--=======================================================================================================================
--==========================================================================================================================
-- UNITS
--==========================================================================================================================	
-- Units
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Units 	
		(Type, 					Class,	CombatClass, PrereqTech, Cost, Combat,   FaithCost, RequiresFaithPurchaseEnabled, Moves, CivilianAttackPriority, Special, Domain, DefaultUnitAI,	Description, 				 Help, 						Strategy, 					Civilopedia, 						 ShowInPedia, OneShotTourism, OneShotTourismPercentOthers, AdvancedStartCost, WorkRate, CombatLimit,  GoldenAgeTurns,  XPValueAttack, XPValueDefense, Conscription, UnitArtInfo, 				 UnitFlagAtlas, 			UnitFlagIconOffset, IconAtlas,						PortraitIndex,	MoveRate)
SELECT	'UNIT_US_REVOLUTIONARY_GUARD',		Class,	CombatClass, PrereqTech, Cost, Combat,	 FaithCost, RequiresFaithPurchaseEnabled, Moves, CivilianAttackPriority, Special, Domain, DefaultUnitAI,	'TXT_KEY_UNIT_US_REVOLUTIONARY_GUARD', 'TXT_KEY_UNIT_US_REVOLUTIONARY_GUARD_HELP',	'TXT_KEY_UNIT_US_REVOLUTIONARY_GUARD_STRATEGY', 	'TXT_KEY_CIV5_REVOLUTIONARY_GUARD_TEXT',  ShowInPedia, OneShotTourism, OneShotTourismPercentOthers, AdvancedStartCost, WorkRate, CombatLimit,  GoldenAgeTurns,  XPValueAttack, XPValueDefense, Conscription, 'ART_DEF_UNIT_US_REVOLUTIONARY_GUARD',	 'US_FRANCE_FLAG_ATLAS',	0,					'US_FRANCE_ICON_ATLAS',	2,				MoveRate
FROM Units WHERE Type = 'UNIT_MUSKETMAN';    
--------------------------------------------------------------------------------------------------------------------------
-- UnitGameplay2DScripts
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 					SelectionSound, FirstSelectionSound)
SELECT	'UNIT_US_REVOLUTIONARY_GUARD',		SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_MUSKETMAN';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_AITypes
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_AITypes 	
		(UnitType, 					UnitAIType)
SELECT	'UNIT_US_REVOLUTIONARY_GUARD',		UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_MUSKETMAN';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_ResourceQuantityRequirements
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_ResourceQuantityRequirements 	
		(UnitType, 					ResourceType, Cost)
SELECT	'UNIT_US_REVOLUTIONARY_GUARD',		ResourceType, Cost
FROM Unit_ResourceQuantityRequirements WHERE UnitType = 'UNIT_MUSKETMAN';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_Flavors
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_Flavors 	
		(UnitType, 					FlavorType, Flavor)
SELECT	'UNIT_US_REVOLUTIONARY_GUARD',		FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_MUSKETMAN';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_FreePromotions
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_FreePromotions 	
		(UnitType, 					PromotionType)
SELECT	'UNIT_US_REVOLUTIONARY_GUARD',		PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_MUSKETMAN';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_Builds
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_Builds 	
		(UnitType, 					BuildType)
SELECT	'UNIT_US_REVOLUTIONARY_GUARD',		BuildType
FROM Unit_Builds WHERE UnitType = 'UNIT_MUSKETMAN';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_ClassUpgrades
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 					UnitClassType)
SELECT	'UNIT_US_REVOLUTIONARY_GUARD',		UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_MUSKETMAN';
--==========================================================================================================================	
-- LEADERS
--==========================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- Leaders
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Leaders 
		(Type, 						Description, 					Civilopedia, 							CivilopediaTag, 								ArtDefineTag, 			IconAtlas, 					PortraitIndex)
VALUES	('LEADER_US_FRANCE', 		'TXT_KEY_LEADER_US_FRANCE', 	'TXT_KEY_LEADER_US_FRANCE_PEDIA',		'TXT_KEY_CIVILOPEDIA_LEADERS_US_FRANCE', 		'US_France_Diplo.xml',	'US_FRANCE_ICON_ATLAS', 	1);

UPDATE Leaders
SET VictoryCompetitiveness = 10,
WonderCompetitiveness = 4,
MinorCivCompetitiveness = 8,
Boldness = 9,
DiploBalance = 6,
WarmongerHate = 9,
DenounceWillingness = 9,
DoFWillingness = 2,
Loyalty = 2,
Neediness = 3,
Forgiveness = 5,
Chattiness = 5,
Meanness = 9
WHERE Type = 'LEADER_US_FRANCE';	
------------------------------------------------------------------------------------------------------------------------	
-- Leader_MajorCivApproachBiases
------------------------------------------------------------------------------------------------------------------------						
INSERT INTO Leader_MajorCivApproachBiases 
		(LeaderType, 					MajorCivApproachType, 				Bias)
VALUES	('LEADER_US_FRANCE', 		'MAJOR_CIV_APPROACH_WAR', 			10),
		('LEADER_US_FRANCE', 		'MAJOR_CIV_APPROACH_HOSTILE', 		9),
		('LEADER_US_FRANCE', 		'MAJOR_CIV_APPROACH_DECEPTIVE', 	9),
		('LEADER_US_FRANCE', 		'MAJOR_CIV_APPROACH_GUARDED', 		8),
		('LEADER_US_FRANCE', 		'MAJOR_CIV_APPROACH_AFRAID', 		3),
		('LEADER_US_FRANCE', 		'MAJOR_CIV_APPROACH_FRIENDLY', 		5),
		('LEADER_US_FRANCE', 		'MAJOR_CIV_APPROACH_NEUTRAL', 		2);
------------------------------------------------------------------------------------------------------------------------	
-- Leader_MajorCivApproachBiases
------------------------------------------------------------------------------------------------------------------------						
INSERT INTO Leader_MinorCivApproachBiases 
		(LeaderType, 					MinorCivApproachType, 				Bias)
VALUES	('LEADER_US_FRANCE', 		'MINOR_CIV_APPROACH_IGNORE', 		5),
		('LEADER_US_FRANCE', 		'MINOR_CIV_APPROACH_FRIENDLY', 		5),
		('LEADER_US_FRANCE', 		'MINOR_CIV_APPROACH_PROTECTIVE', 	5),
		('LEADER_US_FRANCE', 		'MINOR_CIV_APPROACH_CONQUEST', 		5),
		('LEADER_US_FRANCE', 		'MINOR_CIV_APPROACH_BULLY', 		5);
------------------------------------------------------------------------------------------------------------------------	
-- Leader_Flavors
------------------------------------------------------------------------------------------------------------------------						
INSERT INTO Leader_Flavors 
		(LeaderType, 					FlavorType, 						Flavor)
VALUES	('LEADER_US_FRANCE', 		'FLAVOR_OFFENSE', 					9),
		('LEADER_US_FRANCE', 		'FLAVOR_DEFENSE', 					8),
		('LEADER_US_FRANCE', 		'FLAVOR_CITY_DEFENSE', 				5),
		('LEADER_US_FRANCE', 		'FLAVOR_MILITARY_TRAINING', 		9),
		('LEADER_US_FRANCE', 		'FLAVOR_RECON', 					3),
		('LEADER_US_FRANCE', 		'FLAVOR_RANGED', 					7),
		('LEADER_US_FRANCE', 		'FLAVOR_MOBILE', 					7),
		('LEADER_US_FRANCE', 		'FLAVOR_NAVAL', 					4),
		('LEADER_US_FRANCE', 		'FLAVOR_NAVAL_RECON', 				3),
		('LEADER_US_FRANCE', 		'FLAVOR_NAVAL_GROWTH', 				4),
		('LEADER_US_FRANCE', 		'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	2),
		('LEADER_US_FRANCE', 		'FLAVOR_AIR', 						7),
		('LEADER_US_FRANCE', 		'FLAVOR_EXPANSION', 				10),
		('LEADER_US_FRANCE', 		'FLAVOR_GROWTH', 					5),
		('LEADER_US_FRANCE', 		'FLAVOR_TILE_IMPROVEMENT', 			9),
		('LEADER_US_FRANCE', 		'FLAVOR_INFRASTRUCTURE', 			7),
		('LEADER_US_FRANCE', 		'FLAVOR_PRODUCTION', 				3),
		('LEADER_US_FRANCE', 		'FLAVOR_GOLD', 						2),
		('LEADER_US_FRANCE', 		'FLAVOR_SCIENCE', 					8),
		('LEADER_US_FRANCE', 		'FLAVOR_CULTURE', 					4),
		('LEADER_US_FRANCE', 		'FLAVOR_HAPPINESS', 				3),
		('LEADER_US_FRANCE', 		'FLAVOR_GREAT_PEOPLE', 				6),
		('LEADER_US_FRANCE', 		'FLAVOR_WONDER', 					5),
		('LEADER_US_FRANCE', 		'FLAVOR_RELIGION', 					6),
		('LEADER_US_FRANCE', 		'FLAVOR_DIPLOMACY', 				4),
		('LEADER_US_FRANCE', 		'FLAVOR_SPACESHIP', 				4),
		('LEADER_US_FRANCE', 		'FLAVOR_WATER_CONNECTION', 			2),
		('LEADER_US_FRANCE', 		'FLAVOR_NUKE', 						10),
		('LEADER_US_FRANCE', 		'FLAVOR_USE_NUKE', 					10),
		('LEADER_US_FRANCE', 		'FLAVOR_ESPIONAGE', 				5),
		('LEADER_US_FRANCE', 		'FLAVOR_AIRLIFT', 					5),
		('LEADER_US_FRANCE', 		'FLAVOR_I_TRADE_DESTINATION', 		5),
		('LEADER_US_FRANCE', 		'FLAVOR_I_TRADE_ORIGIN', 			5),
		('LEADER_US_FRANCE', 		'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
		('LEADER_US_FRANCE', 		'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
		('LEADER_US_FRANCE', 		'FLAVOR_ARCHAEOLOGY', 				5),
		('LEADER_US_FRANCE', 		'FLAVOR_AIR_CARRIER', 				5);
--------------------------------------------------------------------------------------------------------------------------
-- Diplomacy_Responses
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Diplomacy_Responses
		(LeaderType, 					ResponseType, 							 			Response, 																Bias)
VALUES 	('LEADER_US_FRANCE',		'RESPONSE_DEFEATED', 					 			'TXT_KEY_LEADER_US_FRANCE_DEFEATED%', 					 			500),
		('LEADER_US_FRANCE',		'RESPONSE_FIRST_GREETING', 				 			'TXT_KEY_LEADER_US_FRANCE_FIRSTGREETING%', 				 		500);
------------------------------------------------------------------------------------------------------------------------	
-- Leader_Traits
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Leader_Traits 
		(LeaderType, 				TraitType)
VALUES	('LEADER_US_FRANCE',		'TRAIT_US_FRANCE');
------------------------------------------------------------------------------------------------------------------------
-- Traits
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Traits 
		(Type, 						Description, 					ShortDescription)
VALUES	('TRAIT_US_FRANCE',		'TXT_KEY_TRAIT_US_FRANCE',		'TXT_KEY_TRAIT_US_FRANCE_SHORT');	
--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- Civilizations
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilizations 	
		(Type, 							DerivativeCiv,					SoundtrackTag,  MapImage, 					DawnOfManQuote, 					DawnOfManImage,			Description,					ShortDescription,					Adjective,							Civilopedia,									CivilopediaTag,							 DefaultPlayerColor,		ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas,				PortraitIndex,	AlphaIconAtlas)
SELECT	'CIVILIZATION_US_FRANCE',		'TXT_KEY_JFD_TAL_FRANCE',		'FRANCE', 		'Urdnot_France_Map.dds',	'TXT_KEY_CIV_DAWN_US_FRANCE_TEXT',	'robey_dom.dds',		'TXT_KEY_CIV_US_FRANCE_DESC', 	'TXT_KEY_CIV_US_FRANCE_SHORT_DESC',	'TXT_KEY_CIV_US_FRANCE_ADJECTIVE',	'TXT_KEY_CIVILOPEDIA_CIVS_US_FRANCE_TEXT_1',   'TXT_KEY_CIVILOPEDIA_CIVS_US_FRANCE',	 'PLAYERCOLOR_US_FRANCE',	ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, 'US_FRANCE_ICON_ATLAS',	0,				'US_FRANCE_ALPHA_ATLAS'
FROM Civilizations WHERE Type = 'CIVILIZATION_FRANCE';
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_CityNames
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilization_CityNames
		(CivilizationType,								 CityName)
VALUES	('CIVILIZATION_US_FRANCE',    'TXT_KEY_CITY_NAME_US_FRANCE_1'),
		('CIVILIZATION_US_FRANCE',    'TXT_KEY_CITY_NAME_US_FRANCE_2'),
		('CIVILIZATION_US_FRANCE',    'TXT_KEY_CITY_NAME_US_FRANCE_3'),
		('CIVILIZATION_US_FRANCE',    'TXT_KEY_CITY_NAME_US_FRANCE_4'),
		('CIVILIZATION_US_FRANCE',    'TXT_KEY_CITY_NAME_US_FRANCE_5'),
		('CIVILIZATION_US_FRANCE',    'TXT_KEY_CITY_NAME_US_FRANCE_6'),
		('CIVILIZATION_US_FRANCE',    'TXT_KEY_CITY_NAME_US_FRANCE_7'),
		('CIVILIZATION_US_FRANCE',    'TXT_KEY_CITY_NAME_US_FRANCE_8'),
		('CIVILIZATION_US_FRANCE',    'TXT_KEY_CITY_NAME_US_FRANCE_9'),
		('CIVILIZATION_US_FRANCE',    'TXT_KEY_CITY_NAME_US_FRANCE_10'),
		('CIVILIZATION_US_FRANCE',    'TXT_KEY_CITY_NAME_US_FRANCE_11'),
		('CIVILIZATION_US_FRANCE',    'TXT_KEY_CITY_NAME_US_FRANCE_12'),
		('CIVILIZATION_US_FRANCE',    'TXT_KEY_CITY_NAME_US_FRANCE_13'),
		('CIVILIZATION_US_FRANCE',    'TXT_KEY_CITY_NAME_US_FRANCE_14'),
		('CIVILIZATION_US_FRANCE',    'TXT_KEY_CITY_NAME_US_FRANCE_15'),
		('CIVILIZATION_US_FRANCE',    'TXT_KEY_CITY_NAME_US_FRANCE_16'),
		('CIVILIZATION_US_FRANCE',    'TXT_KEY_CITY_NAME_US_FRANCE_17'),
		('CIVILIZATION_US_FRANCE',    'TXT_KEY_CITY_NAME_US_FRANCE_18'),
		('CIVILIZATION_US_FRANCE',    'TXT_KEY_CITY_NAME_US_FRANCE_19'),
		('CIVILIZATION_US_FRANCE',    'TXT_KEY_CITY_NAME_US_FRANCE_20'),
		('CIVILIZATION_US_FRANCE',    'TXT_KEY_CITY_NAME_US_FRANCE_21'),
		('CIVILIZATION_US_FRANCE',    'TXT_KEY_CITY_NAME_US_FRANCE_22'),
		('CIVILIZATION_US_FRANCE',    'TXT_KEY_CITY_NAME_US_FRANCE_23'),
		('CIVILIZATION_US_FRANCE',    'TXT_KEY_CITY_NAME_US_FRANCE_24'),
		('CIVILIZATION_US_FRANCE',    'TXT_KEY_CITY_NAME_US_FRANCE_25');
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_FreeBuildingClasses
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Civilization_FreeBuildingClasses 
		(CivilizationType, 				BuildingClassType)
SELECT	'CIVILIZATION_US_FRANCE',		BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE CivilizationType = 'CIVILIZATION_FRANCE';
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_FreeTechs
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_FreeTechs 
		(CivilizationType, 				TechType)
SELECT	'CIVILIZATION_US_FRANCE',		TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_FRANCE';
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_FreeUnits
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_FreeUnits	
		(CivilizationType, 				UnitClassType, Count, UnitAIType)
SELECT	'CIVILIZATION_US_FRANCE',		UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_FRANCE';
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_Leaders
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Civilization_Leaders 
		(CivilizationType, 			LeaderheadType)
VALUES	('CIVILIZATION_US_FRANCE',	'LEADER_US_FRANCE');
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_BuildingClassOverrides 
----------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilization_BuildingClassOverrides 
		(CivilizationType, 			BuildingClassType, 		BuildingType)
VALUES	('CIVILIZATION_US_FRANCE', 	'BUILDINGCLASS_THEATRE', 	'BUILDING_US_GUILLOTINE');
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_UnitClassOverrides 
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_UnitClassOverrides 
		(CivilizationType, 			UnitClassType, 			UnitType)
VALUES	('CIVILIZATION_US_FRANCE',	'UNITCLASS_MUSKETMAN',		'UNIT_US_REVOLUTIONARY_GUARD');
--------------------------------------------------------------------------------------------------------------------------
-- Civilization_Religions
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilization_Religions 
		(CivilizationType, 				ReligionType)
VALUES	('CIVILIZATION_US_FRANCE', 	'RELIGION_CHRISTIANITY');
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_SpyNames
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_SpyNames 
		(CivilizationType, 				SpyName)
VALUES	('CIVILIZATION_US_FRANCE',	'TXT_KEY_SPY_NAME_US_FRANCE_0'),	
		('CIVILIZATION_US_FRANCE',	'TXT_KEY_SPY_NAME_US_FRANCE_1'),
		('CIVILIZATION_US_FRANCE',	'TXT_KEY_SPY_NAME_US_FRANCE_2'),
		('CIVILIZATION_US_FRANCE',	'TXT_KEY_SPY_NAME_US_FRANCE_3'),
		('CIVILIZATION_US_FRANCE',	'TXT_KEY_SPY_NAME_US_FRANCE_4'),
		('CIVILIZATION_US_FRANCE',	'TXT_KEY_SPY_NAME_US_FRANCE_5'),
		('CIVILIZATION_US_FRANCE',	'TXT_KEY_SPY_NAME_US_FRANCE_6'),
		('CIVILIZATION_US_FRANCE',	'TXT_KEY_SPY_NAME_US_FRANCE_7'),
		('CIVILIZATION_US_FRANCE',	'TXT_KEY_SPY_NAME_US_FRANCE_8'),
		('CIVILIZATION_US_FRANCE',	'TXT_KEY_SPY_NAME_US_FRANCE_9');
-------------------------------------------
--Religion
-------------------------------------------
INSERT INTO Religions
		(Type,						Description,						Civilopedia,						IconAtlas,				PortraitIndex,	IconString)
VALUES	('RELIGION_SUPREME_BEING',	'TXT_KEY_RELIGION_SUPREME_BEING',	'TXT_KEY_RELIGION_SUPREME_BEING',	'SUPREME_BEING_ATLAS',	0,				'[ICON_RELIGION_SUPREME_BEING]');
--==========================================================================================================================
--==========================================================================================================================