--==========================================================================================================================	
-- UNITS
--==========================================================================================================================		
--------------------------------------------------------------------------------------------------------------------------
-- Units
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Units 	
		(Type, 						Class,	CombatClass, PrereqTech, Cost, Combat, RangedCombat, Range,	FaithCost, RequiresFaithPurchaseEnabled, Moves, CivilianAttackPriority, Special, Capture, Domain, DefaultUnitAI,	Description, 					Help, 								Strategy, 									Civilopedia, 						MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, ShowInPedia, OneShotTourism, OneShotTourismPercentOthers, AdvancedStartCost, WorkRate, ObsoleteTech, Mechanized, CombatLimit,  GoldenAgeTurns,  XPValueAttack, XPValueDefense, Conscription, MoveRate, SpreadReligion, ReligionSpreads, ReligiousStrength, FoundReligion, UnitArtInfo, 					UnitFlagAtlas, 						UnitFlagIconOffset, IconAtlas,						PortraitIndex)
SELECT	'UNIT_SAS_TSAWOROWA',		Class,	CombatClass, PrereqTech, '30', '4', '5', '2',	'60', RequiresFaithPurchaseEnabled, Moves, CivilianAttackPriority, Special, Capture, Domain, DefaultUnitAI,	'TXT_KEY_UNIT_SAS_TSAWOROWA',	'TXT_KEY_UNIT_SAS_TSAWOROWA_HELP', 'TXT_KEY_UNIT_SAS_TSAWOROWA_STRATEGY',   'TXT_KEY_UNIT_SAS_TSAWOROWA_TEXT',	MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, ShowInPedia, OneShotTourism, OneShotTourismPercentOthers, AdvancedStartCost, WorkRate, ObsoleteTech, Mechanized, CombatLimit,  GoldenAgeTurns,  XPValueAttack, XPValueDefense, Conscription, MoveRate, SpreadReligion, ReligionSpreads, ReligiousStrength, FoundReligion, 'ART_DEF_UNIT_SAS_WAZURIWA',	'SAS_TSAWOROWA_FLAG',	0,					'SAS_XAVANTE_ICON_ATLAS',	2
FROM Units WHERE Type = 'UNIT_SCOUT';      
--------------------------------------------------------------------------------------------------------------------------
-- UnitGameplay2DScripts
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 					SelectionSound, FirstSelectionSound)
SELECT	'UNIT_SAS_TSAWOROWA',		SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_SCOUT';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_AITypes
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_AITypes 	
		(UnitType, 				UnitAIType)
SELECT	'UNIT_SAS_TSAWOROWA',		UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_SCOUT';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_Builds
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_Builds 	
		(UnitType, 				BuildType)
SELECT	'UNIT_SAS_TSAWOROWA',		BuildType
FROM Unit_Builds WHERE UnitType = 'UNIT_SCOUT';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_Flavors
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_Flavors 	
		(UnitType, 				FlavorType, Flavor)
SELECT	'UNIT_SAS_TSAWOROWA',		FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_SCOUT';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_ResourceQuantityRequirements
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_ResourceQuantityRequirements
		(UnitType, 					ResourceType, Cost)
SELECT	'UNIT_SAS_TSAWOROWA',		ResourceType, Cost
FROM Unit_ResourceQuantityRequirements WHERE UnitType = 'UNIT_SCOUT';
------------------------------------------------------------------------------------------------------------------------
-- Unit_ClassUpgrades
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 				UnitClassType)
SELECT	'UNIT_SAS_TSAWOROWA',		UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_ARCHER';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_FreePromotions
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_FreePromotions 	
		(UnitType, 				PromotionType)
SELECT	'UNIT_SAS_TSAWOROWA',		PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_SCOUT';

INSERT INTO Unit_FreePromotions 	
		(UnitType, 						 PromotionType)
VALUES	('UNIT_SAS_TSAWOROWA',  'PROMOTION_CAN_MOVE_AFTER_ATTACKING'),
		('UNIT_SAS_TSAWOROWA',  'PROMOTION_ONLY_DEFENSIVE');
--=======================================================================================================================	
-- BUILDINGS
--=======================================================================================================================		
------------------------------------------------------------------------------------------------------------------------ 	
-- Buildings
------------------------------------------------------------------------------------------------------------------------ 	
INSERT INTO Buildings 	
		(Type, 									BuildingClass,  PrereqTech, Cost, GoldMaintenance,	GreatWorkSlotType,	GreatWorkCount, MinAreaSize,	ConquestProb, Happiness, HurryCostModifier, NeverCapture, 	Description, 									Help, 													Strategy,													Civilopedia, 										 ArtDefineTag, PortraitIndex, IconAtlas)
SELECT	'BUILDING_SAS_DZOMORI',	BuildingClass,  PrereqTech, Cost, GoldMaintenance,	'GREAT_WORK_SLOT_MUSIC',	'1', MinAreaSize,	ConquestProb, Happiness, HurryCostModifier, 1, 				'TXT_KEY_BUILDING_SAS_DZOMORI', 	'TXT_KEY_BUILDING_SAS_DZOMORI_HELP', 	'TXT_KEY_BUILDING_SAS_DZOMORI_STRATEGY',		'TXT_KEY_BUILDING_SAS_DZOMORI_PEDIA',  ArtDefineTag, 3, 			  'SAS_XAVANTE_ICON_ATLAS'
FROM Buildings WHERE Type = 'BUILDING_HOSPITAL';	
------------------------------------------------------------------------------------------------------------------------ 	
-- Building_Flavors
------------------------------------------------------------------------------------------------------------------------ 	
INSERT INTO Building_Flavors 	
		(BuildingType, 							FlavorType,		  Flavor)
SELECT	'BUILDING_SAS_DZOMORI',	FlavorType,		  Flavor
FROM Building_Flavors WHERE BuildingType = 'BUILDING_HOSPITAL';

INSERT INTO Building_Flavors 	
		(BuildingType, 							FlavorType,		  Flavor)
VALUES	('BUILDING_SAS_DZOMORI',	'FLAVOR_CULTURE',  25);	
--==========================================================================================================================	
-- Building_ClassesNeededInCity
--==========================================================================================================================	
INSERT INTO Building_ClassesNeededInCity 	
			(BuildingType, 				BuildingClassType)
SELECT		('BUILDING_SAS_DZOMORI'),	BuildingClassType
FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_HOSPITAL';	
--==========================================================================================================================	
-- Building_YieldChanges
--==========================================================================================================================	
INSERT INTO Building_YieldChanges
			(BuildingType, 				YieldType, Yield)
SELECT		('BUILDING_SAS_DZOMORI'),	YieldType, Yield
FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_HOSPITAL';
--==========================================================================================================================	
-- Building_ResourceYieldChanges
--==========================================================================================================================				
INSERT INTO Building_ResourceYieldChanges 
			(BuildingType, 					ResourceType,	YieldType,			Yield)
VALUES		('BUILDING_SAS_DZOMORI', 	'RESOURCE_BANANA',	'YIELD_CULTURE',		1),
			('BUILDING_SAS_DZOMORI', 	'RESOURCE_CITRUS',	'YIELD_CULTURE',		1),
			('BUILDING_SAS_DZOMORI', 	'RESOURCE_DYE',		'YIELD_CULTURE',		1),
			('BUILDING_SAS_DZOMORI', 	'RESOURCE_SPICES',	'YIELD_CULTURE',		1),
			('BUILDING_SAS_DZOMORI', 	'RESOURCE_SILK',	'YIELD_CULTURE',		1),
			('BUILDING_SAS_DZOMORI', 	'RESOURCE_SUGAR',	'YIELD_CULTURE',		1),
			('BUILDING_SAS_DZOMORI', 	'RESOURCE_COTTON',	'YIELD_CULTURE',		1),
			('BUILDING_SAS_DZOMORI', 	'RESOURCE_WINE',	'YIELD_CULTURE',		1),
			('BUILDING_SAS_DZOMORI', 	'RESOURCE_INCENSE',	'YIELD_CULTURE',		1),
			('BUILDING_SAS_DZOMORI', 	'RESOURCE_COCOA',	'YIELD_CULTURE',		1);
--==========================================================================================================================	
-- LEADERS
--==========================================================================================================================	
----------------------------------------------------------------------------------------------------------------------------
-- Leaders
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Leaders 
		(Type, 							 Description, 							 Civilopedia, 								CivilopediaTag, 	ArtDefineTag, 			    VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 						PortraitIndex)
VALUES	('LEADER_SAS_APOENA',	 'TXT_KEY_LEADER_SAS_APOENA',	'TXT_KEY_LEADER_SAS_APOENA_PEDIA',	'TXT_KEY_CIVILOPEDIA_LEADERS_SAS_APOENA',	'Sas_Apoena_Scene.xml',		6, 		5, 			6, 				8, 			6, 				7, 				7, 						7, 				6, 			7, 			5, 				4, 			6, 			'SAS_XAVANTE_ICON_ATLAS', 1);
--------------------------------------------------------------------------------------------------------------------------		
-- Leader_MajorCivApproachBiases
--------------------------------------------------------------------------------------------------------------------------						
INSERT INTO Leader_MajorCivApproachBiases 
		(LeaderType, 					 MajorCivApproachType, 				Bias)
VALUES	('LEADER_SAS_APOENA',	'MAJOR_CIV_APPROACH_WAR', 			5),
		('LEADER_SAS_APOENA',	'MAJOR_CIV_APPROACH_HOSTILE', 		3),
		('LEADER_SAS_APOENA',	'MAJOR_CIV_APPROACH_DECEPTIVE', 	3),
		('LEADER_SAS_APOENA',	'MAJOR_CIV_APPROACH_GUARDED', 		7),
		('LEADER_SAS_APOENA',	'MAJOR_CIV_APPROACH_AFRAID', 		3),
		('LEADER_SAS_APOENA',	'MAJOR_CIV_APPROACH_FRIENDLY', 		7),
		('LEADER_SAS_APOENA',	'MAJOR_CIV_APPROACH_NEUTRAL', 		8);
--------------------------------------------------------------------------------------------------------------------------	
-- Leader_MajorCivApproachBiases
--------------------------------------------------------------------------------------------------------------------------							
INSERT INTO Leader_MinorCivApproachBiases 
		(LeaderType, 					 MinorCivApproachType, 				Bias)
VALUES	('LEADER_SAS_APOENA',	'MINOR_CIV_APPROACH_IGNORE', 		8),
		('LEADER_SAS_APOENA',	'MINOR_CIV_APPROACH_FRIENDLY', 		7),
		('LEADER_SAS_APOENA',	'MINOR_CIV_APPROACH_PROTECTIVE', 	6),
		('LEADER_SAS_APOENA',	'MINOR_CIV_APPROACH_CONQUEST', 		3),
		('LEADER_SAS_APOENA',	'MINOR_CIV_APPROACH_BULLY', 		4);
--------------------------------------------------------------------------------------------------------------------------	
-- Leader_Flavors
--------------------------------------------------------------------------------------------------------------------------							
INSERT INTO Leader_Flavors 
		(LeaderType, 					 FlavorType, 						Flavor)
VALUES	('LEADER_SAS_APOENA',	'FLAVOR_OFFENSE', 					7),
		('LEADER_SAS_APOENA',	'FLAVOR_DEFENSE', 					6),
		('LEADER_SAS_APOENA',	'FLAVOR_CITY_DEFENSE', 				7),
		('LEADER_SAS_APOENA',	'FLAVOR_MILITARY_TRAINING', 		7),
		('LEADER_SAS_APOENA',	'FLAVOR_RECON', 					8),
		('LEADER_SAS_APOENA',	'FLAVOR_RANGED', 					8),
		('LEADER_SAS_APOENA',	'FLAVOR_MOBILE', 					5),
		('LEADER_SAS_APOENA',	'FLAVOR_NAVAL', 					6),
		('LEADER_SAS_APOENA',	'FLAVOR_NAVAL_RECON', 				6),
		('LEADER_SAS_APOENA',	'FLAVOR_NAVAL_GROWTH', 				5),
		('LEADER_SAS_APOENA',	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	5),
		('LEADER_SAS_APOENA',	'FLAVOR_AIR', 						7),
		('LEADER_SAS_APOENA',	'FLAVOR_EXPANSION', 				6),
		('LEADER_SAS_APOENA',	'FLAVOR_GROWTH', 					8),
		('LEADER_SAS_APOENA',	'FLAVOR_TILE_IMPROVEMENT', 			7),
		('LEADER_SAS_APOENA',	'FLAVOR_INFRASTRUCTURE', 			7),
		('LEADER_SAS_APOENA',	'FLAVOR_PRODUCTION', 				8),
		('LEADER_SAS_APOENA',	'FLAVOR_GOLD', 						5),
		('LEADER_SAS_APOENA',	'FLAVOR_SCIENCE', 					7),
		('LEADER_SAS_APOENA',	'FLAVOR_CULTURE', 					8),
		('LEADER_SAS_APOENA',	'FLAVOR_HAPPINESS', 				7),
		('LEADER_SAS_APOENA',	'FLAVOR_GREAT_PEOPLE', 				7),
		('LEADER_SAS_APOENA',	'FLAVOR_WONDER', 					6),
		('LEADER_SAS_APOENA',	'FLAVOR_RELIGION', 					5),
		('LEADER_SAS_APOENA',	'FLAVOR_DIPLOMACY', 				10),
		('LEADER_SAS_APOENA',	'FLAVOR_SPACESHIP', 				8),
		('LEADER_SAS_APOENA',	'FLAVOR_WATER_CONNECTION', 			7),
		('LEADER_SAS_APOENA',	'FLAVOR_NUKE', 						4),
		('LEADER_SAS_APOENA',	'FLAVOR_USE_NUKE', 					4),
		('LEADER_SAS_APOENA',	'FLAVOR_ESPIONAGE', 				7),
		('LEADER_SAS_APOENA',	'FLAVOR_AIRLIFT', 					9),
		('LEADER_SAS_APOENA',	'FLAVOR_I_TRADE_DESTINATION', 		7),
		('LEADER_SAS_APOENA',	'FLAVOR_I_TRADE_ORIGIN', 			7),
		('LEADER_SAS_APOENA',	'FLAVOR_I_SEA_TRADE_ROUTE', 		6),
		('LEADER_SAS_APOENA',	'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
		('LEADER_SAS_APOENA',	'FLAVOR_ARCHAEOLOGY', 				5),
		('LEADER_SAS_APOENA',	'FLAVOR_AIR_CARRIER', 				3);
--------------------------------------------------------------------------------------------------------------------------	
-- Leader_Traits
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Leader_Traits 
		(LeaderType, 					TraitType)
VALUES	('LEADER_SAS_APOENA',	'TRAIT_SAS_XAVANTE');
--==========================================================================================================================	
-- TRAITS
--==========================================================================================================================	
----------------------------------------------------------------------------------------------------------------------------
-- Traits
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Traits 
		(Type, 						 Description, 						 ShortDescription)
VALUES	('TRAIT_SAS_XAVANTE',  'TXT_KEY_TRAIT_SAS_XAVANTE',	 'TXT_KEY_TRAIT_SAS_XAVANTE_SHORT');
--==========================================================================================================================	
-- DIPLOMACY
--==========================================================================================================================	
----------------------------------------------------------------------------------------------------------------------------
-- Diplomacy_Responses
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Diplomacy_Responses
		(LeaderType, 					ResponseType, 								Response, 															Bias)
VALUES 	('LEADER_SAS_APOENA',	'RESPONSE_DEFEATED', 						'TXT_KEY_LEADER_SAS_APOENA_DEFEATED%', 						500),
		('LEADER_SAS_APOENA',	'RESPONSE_FIRST_GREETING', 					'TXT_KEY_LEADER_SAS_APOENA_FIRSTGREETING%', 					500);
--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
----------------------------------------------------------------------------------------------------------------------------
-- Civilizations
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilizations 	
		(Type, 									SoundtrackTag,  MapImage, 							DawnOfManQuote, 								DawnOfManImage,					Description,								ShortDescription,								Adjective,										Civilopedia,												CivilopediaTag,										DefaultPlayerColor,					ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas,							PortraitIndex,	AlphaIconAtlas)
SELECT	'CIVILIZATION_SAS_XAVANTE',		'Aztec', 		'SasXavante412.dds',		'TXT_KEY_CIV_DAWN_SAS_XAVANTE_TEXT',	'Sas_Apoena_DOM.dds',	'TXT_KEY_CIV_SAS_XAVANTE_DESC', 	'TXT_KEY_CIV_SAS_XAVANTE_SHORT_DESC',	'TXT_KEY_CIV_SAS_XAVANTE_ADJECTIVE',	'TXT_KEY_CIV5_SAS_XAVANTE_TEXT_1',		'TXT_KEY_CIV5_SAS_XAVANTE',		'PLAYERCOLOR_SAS_XAVANTE',	ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, 'SAS_XAVANTE_ICON_ATLAS',	0,				'SAS_XAVANTE_ALPHA_ATLAS'
FROM Civilizations WHERE Type = 'CIVILIZATION_AZTEC';
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_SpyNames
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilization_SpyNames 
		(CivilizationType, 					SpyName)
VALUES	('CIVILIZATION_SAS_XAVANTE',	'TXT_KEY_SPY_NAME_CIV_SAS_XAVANTE_0'),
		('CIVILIZATION_SAS_XAVANTE',	'TXT_KEY_SPY_NAME_CIV_SAS_XAVANTE_1'),
		('CIVILIZATION_SAS_XAVANTE',	'TXT_KEY_SPY_NAME_CIV_SAS_XAVANTE_2'),
		('CIVILIZATION_SAS_XAVANTE',	'TXT_KEY_SPY_NAME_CIV_SAS_XAVANTE_3'),
		('CIVILIZATION_SAS_XAVANTE',	'TXT_KEY_SPY_NAME_CIV_SAS_XAVANTE_4'),
		('CIVILIZATION_SAS_XAVANTE',	'TXT_KEY_SPY_NAME_CIV_SAS_XAVANTE_5'),
		('CIVILIZATION_SAS_XAVANTE',	'TXT_KEY_SPY_NAME_CIV_SAS_XAVANTE_6'),
		('CIVILIZATION_SAS_XAVANTE',	'TXT_KEY_SPY_NAME_CIV_SAS_XAVANTE_7'),
		('CIVILIZATION_SAS_XAVANTE',	'TXT_KEY_SPY_NAME_CIV_SAS_XAVANTE_8'),
		('CIVILIZATION_SAS_XAVANTE',	'TXT_KEY_SPY_NAME_CIV_SAS_XAVANTE_9');
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_CityNames
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilization_CityNames 
		(CivilizationType, 						CityName)
VALUES	('CIVILIZATION_SAS_XAVANTE',	'TXT_KEY_CITY_NAME_SAS_XAVANTE_1'),
		('CIVILIZATION_SAS_XAVANTE',	'TXT_KEY_CITY_NAME_SAS_XAVANTE_2'),
		('CIVILIZATION_SAS_XAVANTE',	'TXT_KEY_CITY_NAME_SAS_XAVANTE_3'),
		('CIVILIZATION_SAS_XAVANTE',	'TXT_KEY_CITY_NAME_SAS_XAVANTE_4'),
		('CIVILIZATION_SAS_XAVANTE',	'TXT_KEY_CITY_NAME_SAS_XAVANTE_5'),
		('CIVILIZATION_SAS_XAVANTE',	'TXT_KEY_CITY_NAME_SAS_XAVANTE_6'),
		('CIVILIZATION_SAS_XAVANTE',	'TXT_KEY_CITY_NAME_SAS_XAVANTE_7'),
		('CIVILIZATION_SAS_XAVANTE',	'TXT_KEY_CITY_NAME_SAS_XAVANTE_8'),
		('CIVILIZATION_SAS_XAVANTE',	'TXT_KEY_CITY_NAME_SAS_XAVANTE_9'),
		('CIVILIZATION_SAS_XAVANTE',	'TXT_KEY_CITY_NAME_SAS_XAVANTE_10'),
		('CIVILIZATION_SAS_XAVANTE',	'TXT_KEY_CITY_NAME_SAS_XAVANTE_11'),
		('CIVILIZATION_SAS_XAVANTE',	'TXT_KEY_CITY_NAME_SAS_XAVANTE_12'),
		('CIVILIZATION_SAS_XAVANTE',	'TXT_KEY_CITY_NAME_SAS_XAVANTE_13'),
		('CIVILIZATION_SAS_XAVANTE',	'TXT_KEY_CITY_NAME_SAS_XAVANTE_14'),
		('CIVILIZATION_SAS_XAVANTE',	'TXT_KEY_CITY_NAME_SAS_XAVANTE_15'),
		('CIVILIZATION_SAS_XAVANTE',	'TXT_KEY_CITY_NAME_SAS_XAVANTE_16'),
		('CIVILIZATION_SAS_XAVANTE',	'TXT_KEY_CITY_NAME_SAS_XAVANTE_17'),
		('CIVILIZATION_SAS_XAVANTE',	'TXT_KEY_CITY_NAME_SAS_XAVANTE_18'),
		('CIVILIZATION_SAS_XAVANTE',	'TXT_KEY_CITY_NAME_SAS_XAVANTE_19'),
		('CIVILIZATION_SAS_XAVANTE',	'TXT_KEY_CITY_NAME_SAS_XAVANTE_20'),
		('CIVILIZATION_SAS_XAVANTE',	'TXT_KEY_CITY_NAME_SAS_XAVANTE_21'),
		('CIVILIZATION_SAS_XAVANTE',	'TXT_KEY_CITY_NAME_SAS_XAVANTE_22'),
		('CIVILIZATION_SAS_XAVANTE',	'TXT_KEY_CITY_NAME_SAS_XAVANTE_23'),
		('CIVILIZATION_SAS_XAVANTE',	'TXT_KEY_CITY_NAME_SAS_XAVANTE_24'),
		('CIVILIZATION_SAS_XAVANTE',	'TXT_KEY_CITY_NAME_SAS_XAVANTE_25'),
		('CIVILIZATION_SAS_XAVANTE',	'TXT_KEY_CITY_NAME_SAS_XAVANTE_26'),
		('CIVILIZATION_SAS_XAVANTE',	'TXT_KEY_CITY_NAME_SAS_XAVANTE_27'),
		('CIVILIZATION_SAS_XAVANTE',	'TXT_KEY_CITY_NAME_SAS_XAVANTE_28'),
		('CIVILIZATION_SAS_XAVANTE',	'TXT_KEY_CITY_NAME_SAS_XAVANTE_29'),
		('CIVILIZATION_SAS_XAVANTE',	'TXT_KEY_CITY_NAME_SAS_XAVANTE_30');
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_FreeBuildingClasses
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Civilization_FreeBuildingClasses 
		(CivilizationType, 					BuildingClassType)
SELECT	'CIVILIZATION_SAS_XAVANTE', 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE CivilizationType = 'CIVILIZATION_AZTEC';
--------------------------------------------------------------------------------------------------------------------------		
-- Civilization_FreeTechs
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Civilization_FreeTechs 
		(CivilizationType, 					TechType)
SELECT	'CIVILIZATION_SAS_XAVANTE', 	TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_AZTEC';
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_FreeUnits
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_FreeUnits 
		(CivilizationType, 					UnitClassType, Count, UnitAIType)
SELECT	'CIVILIZATION_SAS_XAVANTE', 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_AZTEC';
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_Leaders
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_Leaders 
		(CivilizationType, 					LeaderheadType)
VALUES	('CIVILIZATION_SAS_XAVANTE',	'LEADER_SAS_APOENA');
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_UnitClassOverrides 
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_UnitClassOverrides 
		(CivilizationType, 					UnitClassType, 				UnitType)
VALUES	('CIVILIZATION_SAS_XAVANTE', 	'UNITCLASS_SCOUT',			'UNIT_SAS_TSAWOROWA');
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_BuildingClassOverrides 
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_BuildingClassOverrides 
		(CivilizationType, 					BuildingClassType, 			BuildingType)
VALUES	('CIVILIZATION_SAS_XAVANTE', 	'BUILDINGCLASS_HOSPITAL',	'BUILDING_SAS_DZOMORI');
--------------------------------	
-- Civilization_Start_Region_Priority
--------------------------------	
INSERT INTO Civilization_Start_Region_Priority 
		(CivilizationType, 				RegionType)
VALUES	('CIVILIZATION_SAS_XAVANTE',	'REGION_JUNGLE');