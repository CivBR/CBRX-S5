--------------------------------------------------------------------------------------------------------------------------
-- Units
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Units 	
		(Type, 					Class,	CombatClass, PrereqTech, Cost, Combat, RangedCombat, Range, FaithCost, RequiresFaithPurchaseEnabled, Pillage, Moves, CivilianAttackPriority, Special, Domain, DefaultUnitAI,	Description, 			 Help, 							 Strategy, 							Civilopedia, 					ShowInPedia, OneShotTourism, OneShotTourismPercentOthers, AdvancedStartCost, WorkRate, ObsoleteTech, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, CombatLimit,  GoldenAgeTurns,  XPValueAttack, XPValueDefense, Conscription, MoveRate, UnitArtInfo, 			 UnitFlagAtlas, 				UnitFlagIconOffset, IconAtlas,					PortraitIndex)
SELECT	'UNIT_SAS_CHINKUNSHIN',		Class,	CombatClass, 'TECH_ASTRONOMY', Cost, Combat-2, RangedCombat, Range, FaithCost, RequiresFaithPurchaseEnabled, Pillage, Moves, CivilianAttackPriority, Special, Domain, DefaultUnitAI,	'TXT_KEY_UNIT_SAS_CHINKUNSHIN', 'TXT_KEY_UNIT_SAS_CHINKUNSHIN_HELP', 	 'TXT_KEY_UNIT_SAS_CHINKUNSHIN_STRATEGY',  'TXT_KEY_CIVILOPEDIA_SAS_CHINKUNSHIN_TEXT',	ShowInPedia, OneShotTourism, OneShotTourismPercentOthers, AdvancedStartCost, WorkRate, ObsoleteTech, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, CombatLimit,  GoldenAgeTurns,  XPValueAttack, XPValueDefense, Conscription, MoveRate, 'ART_DEF_UNIT_SAS_CHINKUNSHIN',	 'SAS_CHINKUNSHIN_ATLAS',	0,					'SAS_RYUKYU_ICON_ATLAS',	2
FROM Units WHERE Type = 'UNIT_PRIVATEER';   

INSERT INTO Units 	
		(Type, 						Class,	PrereqTech,				Special, Combat,	BaseBeakersTurnsToCount,	Cost, FaithCost, RequiresFaithPurchaseEnabled, CivilianAttackPriority, Moves, CombatClass, Domain, DefaultUnitAI,	Description, 				Civilopedia, 					Strategy, 							Help, 							WorkRate, AdvancedStartCost, GoodyHutUpgradeUnitClass, CombatLimit, ObsoleteTech, XPValueDefense, DontShowYields, UnitArtInfoEraVariation,	UnitArtInfo, 					UnitFlagIconOffset, UnitFlagAtlas,				PortraitIndex, 	IconAtlas,				MoveRate)
SELECT	'UNIT_SAS_YUKATCHU',			Class,	PrereqTech,				Special, Combat,	BaseBeakersTurnsToCount,	Cost, FaithCost, RequiresFaithPurchaseEnabled, CivilianAttackPriority, Moves, CombatClass, Domain, DefaultUnitAI,	'TXT_KEY_UNIT_SAS_YUKATCHU',	'TXT_KEY_CIV5_SAS_YUKATCHU_TEXT', 	'TXT_KEY_UNIT_SAS_YUKATCHU_STRATEGY', 	'TXT_KEY_UNIT_SAS_YUKATCHU_HELP', 	WorkRate,	AdvancedStartCost, GoodyHutUpgradeUnitClass, CombatLimit, ObsoleteTech, XPValueDefense, DontShowYields, 0,							'ART_DEF_UNIT_SAS_YUKATCHU',		0,					'SAS_YUKATCHU_ATLAS',	3, 				'SAS_RYUKYU_ICON_ATLAS',	MoveRate
FROM Units WHERE Type = 'UNIT_SCIENTIST';	
--------------------------------------------------------------------------------------------------------------------------
-- UnitGameplay2DScripts
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 				SelectionSound, FirstSelectionSound)
SELECT	'UNIT_SAS_CHINKUNSHIN',		SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_PRIVATEER';

INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 					SelectionSound, FirstSelectionSound)
SELECT	'UNIT_SAS_YUKATCHU', 			SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_SCIENTIST';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_AITypes
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_AITypes 	
		(UnitType, 				UnitAIType)
SELECT	'UNIT_SAS_CHINKUNSHIN',		UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_PRIVATEER';

INSERT INTO Unit_AITypes 	
		(UnitType, 					UnitAIType)
SELECT	'UNIT_SAS_YUKATCHU', 			UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_SCIENTIST';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_Flavors
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_Flavors 	
		(UnitType, 				FlavorType, Flavor)
SELECT	'UNIT_SAS_CHINKUNSHIN',		FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_PRIVATEER';

INSERT INTO Unit_Flavors 	
		(UnitType, 					FlavorType, Flavor)
SELECT	'UNIT_SAS_YUKATCHU', 			FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_SCIENTIST';
------------------------------------------------------------------------------------------------------------------------
-- Unit_ClassUpgrades
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 				UnitClassType)
SELECT	'UNIT_SAS_CHINKUNSHIN',		UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_PRIVATEER';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_FreePromotions
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_FreePromotions 	
		(UnitType, 				PromotionType)
SELECT	'UNIT_SAS_CHINKUNSHIN',		PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_PRIVATEER';

INSERT INTO Unit_FreePromotions 	
		(UnitType, 					PromotionType)
SELECT	'UNIT_SAS_YUKATCHU', 			PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_SCIENTIST';

--INSERT INTO Unit_FreePromotions 	
--			(UnitType, 				 PromotionType)
--VALUES		('UNIT_SAS_CHINKUNSHIN', 'PROMOTION_SAS_CHINKUNSHIN');
--=======================================================================================================================	
-- IMPROVEMENTS
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------
-- Improvements
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Improvements
		(Type,							CreatedByGreatPerson,	GoldMaintenance,	Coastal,	DefenseModifier,	Description,						Help,								Civilopedia,							ArtDefineTag,						BuildableOnResources,	DestroyedWhenPillaged,	Permanent,	PillageGold,	PortraitIndex,	IconAtlas)
VALUES	('IMPROVEMENT_SAS_GUSUKU',		1,						0,					1,			'50',	'TXT_KEY_IMPROVEMENT_SAS_GUSUKU',	'TXT_KEY_BUILD_SAS_GUSUKU_HELP',	'TXT_KEY_IMPROVEMENT_SAS_GUSUKU_TEXT',	'ART_DEF_IMPROVEMENT_SAS_GUSUKU', 					1,						0,						0,			40,				4,				'SAS_RYUKYU_ICON_ATLAS');
------------------------------------------------------------------------------------------------------------------------
-- Improvement_ResourceTypes
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Improvement_ResourceTypes
		(ImprovementType,				ResourceType)
SELECT	'IMPROVEMENT_SAS_GUSUKU', 		ResourceType
FROM Improvement_ResourceTypes WHERE ImprovementType = 'IMPROVEMENT_ACADEMY';
------------------------------------------------------------------------------------------------------------------------
-- Improvement_Yields
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Improvement_Yields
		(ImprovementType,				YieldType,			Yield)
VALUES	('IMPROVEMENT_SAS_GUSUKU',		'YIELD_CULTURE',	2),
		('IMPROVEMENT_SAS_GUSUKU',		'YIELD_SCIENCE',		6);
------------------------------------------------------------------------------------------------------------------------
-- Improvement_Yields
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Improvement_ValidTerrains
		(ImprovementType,				TerrainType)
SELECT	'IMPROVEMENT_SAS_GUSUKU', 		TerrainType
FROM Improvement_ValidTerrains WHERE ImprovementType = 'IMPROVEMENT_ACADEMY';
------------------------------------------------------------------------------------------------------------------------
-- Improvement_TechYieldChanges
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Improvement_TechYieldChanges
		(ImprovementType,				TechType,				YieldType,			Yield)
VALUES	('IMPROVEMENT_SAS_GUSUKU',		'TECH_ELECTRICITY',		'YIELD_CULTURE',	1),
		('IMPROVEMENT_SAS_GUSUKU',		'TECH_ELECTRICITY',		'YIELD_GOLD',	2),
		('IMPROVEMENT_SAS_GUSUKU',		'TECH_ELECTRICITY',		'YIELD_SCIENCE',	2);
------------------------------------------------------------------------------------------------------------------------
-- Builds
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Builds
		(Type,				ImprovementType, 			HotKey, EntityEvent, Kill, CtrlDown, OrderPriority,	Description,					Help,								Recommendation,						IconIndex,  IconAtlas)
SELECT	'BUILD_SAS_GUSUKU',	'IMPROVEMENT_SAS_GUSUKU',			HotKey,	EntityEvent, Kill, CtrlDown, 1,		'TXT_KEY_BUILD_SAS_GUSUKU',	'TXT_KEY_BUILD_CONSUMED_HELP',	'TXT_KEY_BUILD_SAS_GUSUKU_REC',		5,			'SAS_RYUKYU_ICON_ATLAS'
FROM Builds WHERE Type = 'BUILD_ACADEMY';

------------------------------------------------------------------------------------------------------------------------	
-- BuildFeatures
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO BuildFeatures
		(BuildType, 		FeatureType, PrereqTech, Time, Remove)
SELECT	'BUILD_SAS_GUSUKU',	FeatureType, PrereqTech, Time, Remove
FROM BuildFeatures WHERE BuildType = 'BUILD_ACADEMY';
------------------------------------------------------------------------------------------------------------------------
-- Unit_Builds
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Unit_Builds 	
		(UnitType, 	BuildType)
VALUES	('UNIT_SAS_YUKATCHU',		'BUILD_SAS_GUSUKU');
--------------------------------------------------------------------------------------------------------------------------
--JFD_BosniaTvrtkoI_Unit_Builds
--CREATE TRIGGER Sas_Ryukyu_Unit_Builds
--AFTER INSERT ON Unit_Builds 
--WHEN NEW.BuildType IN ('BUILD_ACADEMY')
--BEGIN
--	INSERT INTO Unit_Builds 	
--			(UnitType, 		BuildType)
--	SELECT	NEW.UnitType,	'BUILD_SAS_GUSUKU'
--	WHERE NOT EXISTS (SELECT BuildType FROM Unit_Builds WHERE BuildType = 'BUILD_SAS_GUSUKU' AND UnitType = NEW.UnitType);
--END;
--==========================================================================================================================	
-- LEADERS
--==========================================================================================================================	
----------------------------------------------------------------------------------------------------------------------------
-- Leaders
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Leaders 
		(Type, 							 Description, 							 Civilopedia, 								CivilopediaTag, 	ArtDefineTag, 								VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 						PortraitIndex)
VALUES	('LEADER_SAS_SHOSHIN',	 'TXT_KEY_LEADER_SAS_SHOSHIN',	'TXT_KEY_LEADER_SAS_SHOSHIN_PEDIA',	'TXT_KEY_CIVILOPEDIA_LEADERS_SAS_RYUKYU',	'Sas_ShoShin_Scene.xml',						6, 						8, 						7, 							6, 			5, 				3, 				5, 						6, 				8, 			6, 			5, 				5, 			5, 			'SAS_RYUKYU_ICON_ATLAS', 1);
--------------------------------------------------------------------------------------------------------------------------		
-- Leader_MajorCivApproachBiases
--------------------------------------------------------------------------------------------------------------------------						
INSERT INTO Leader_MajorCivApproachBiases 
		(LeaderType, 					 MajorCivApproachType, 				Bias)
VALUES	('LEADER_SAS_SHOSHIN',	'MAJOR_CIV_APPROACH_WAR', 			5),
		('LEADER_SAS_SHOSHIN',	'MAJOR_CIV_APPROACH_HOSTILE', 		4),
		('LEADER_SAS_SHOSHIN',	'MAJOR_CIV_APPROACH_DECEPTIVE', 	6),
		('LEADER_SAS_SHOSHIN',	'MAJOR_CIV_APPROACH_GUARDED', 		7),
		('LEADER_SAS_SHOSHIN',	'MAJOR_CIV_APPROACH_AFRAID', 		4),
		('LEADER_SAS_SHOSHIN',	'MAJOR_CIV_APPROACH_FRIENDLY', 		7),
		('LEADER_SAS_SHOSHIN',	'MAJOR_CIV_APPROACH_NEUTRAL', 		8);
--------------------------------------------------------------------------------------------------------------------------	
-- Leader_MajorCivApproachBiases
--------------------------------------------------------------------------------------------------------------------------							
INSERT INTO Leader_MinorCivApproachBiases 
		(LeaderType, 					 MinorCivApproachType, 				Bias)
VALUES	('LEADER_SAS_SHOSHIN',	'MINOR_CIV_APPROACH_IGNORE', 		6),
		('LEADER_SAS_SHOSHIN',	'MINOR_CIV_APPROACH_FRIENDLY', 		7),
		('LEADER_SAS_SHOSHIN',	'MINOR_CIV_APPROACH_PROTECTIVE', 	6),
		('LEADER_SAS_SHOSHIN',	'MINOR_CIV_APPROACH_CONQUEST', 		6),
		('LEADER_SAS_SHOSHIN',	'MINOR_CIV_APPROACH_BULLY', 		6);
--------------------------------------------------------------------------------------------------------------------------	
-- Leader_Flavors
--------------------------------------------------------------------------------------------------------------------------							
INSERT INTO Leader_Flavors 
		(LeaderType, 					 FlavorType, 						Flavor)
VALUES	('LEADER_SAS_SHOSHIN',	'FLAVOR_OFFENSE', 					8),
		('LEADER_SAS_SHOSHIN',	'FLAVOR_DEFENSE', 					7),
		('LEADER_SAS_SHOSHIN',	'FLAVOR_CITY_DEFENSE', 				6),
		('LEADER_SAS_SHOSHIN',	'FLAVOR_MILITARY_TRAINING', 		5),
		('LEADER_SAS_SHOSHIN',	'FLAVOR_RECON', 					5),
		('LEADER_SAS_SHOSHIN',	'FLAVOR_RANGED', 					7),
		('LEADER_SAS_SHOSHIN',	'FLAVOR_MOBILE', 					6),
		('LEADER_SAS_SHOSHIN',	'FLAVOR_NAVAL', 					9),
		('LEADER_SAS_SHOSHIN',	'FLAVOR_NAVAL_RECON', 				6),
		('LEADER_SAS_SHOSHIN',	'FLAVOR_NAVAL_GROWTH', 				5),
		('LEADER_SAS_SHOSHIN',	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	6),
		('LEADER_SAS_SHOSHIN',	'FLAVOR_AIR', 						8),
		('LEADER_SAS_SHOSHIN',	'FLAVOR_EXPANSION', 				8),
		('LEADER_SAS_SHOSHIN',	'FLAVOR_GROWTH', 					8),
		('LEADER_SAS_SHOSHIN',	'FLAVOR_TILE_IMPROVEMENT', 			6),
		('LEADER_SAS_SHOSHIN',	'FLAVOR_INFRASTRUCTURE', 			6),
		('LEADER_SAS_SHOSHIN',	'FLAVOR_PRODUCTION', 				6),
		('LEADER_SAS_SHOSHIN',	'FLAVOR_GOLD', 						5),
		('LEADER_SAS_SHOSHIN',	'FLAVOR_SCIENCE', 					8),
		('LEADER_SAS_SHOSHIN',	'FLAVOR_CULTURE', 					7),
		('LEADER_SAS_SHOSHIN',	'FLAVOR_HAPPINESS', 				6),
		('LEADER_SAS_SHOSHIN',	'FLAVOR_GREAT_PEOPLE', 				9),
		('LEADER_SAS_SHOSHIN',	'FLAVOR_WONDER', 					6),
		('LEADER_SAS_SHOSHIN',	'FLAVOR_RELIGION', 					6),
		('LEADER_SAS_SHOSHIN',	'FLAVOR_DIPLOMACY', 				7),
		('LEADER_SAS_SHOSHIN',	'FLAVOR_SPACESHIP', 				6),
		('LEADER_SAS_SHOSHIN',	'FLAVOR_WATER_CONNECTION', 			9),
		('LEADER_SAS_SHOSHIN',	'FLAVOR_NUKE', 						4),
		('LEADER_SAS_SHOSHIN',	'FLAVOR_USE_NUKE', 					4),
		('LEADER_SAS_SHOSHIN',	'FLAVOR_ESPIONAGE', 				6),
		('LEADER_SAS_SHOSHIN',	'FLAVOR_AIRLIFT', 					8),
		('LEADER_SAS_SHOSHIN',	'FLAVOR_I_TRADE_DESTINATION', 		6),
		('LEADER_SAS_SHOSHIN',	'FLAVOR_I_TRADE_ORIGIN', 			11),
		('LEADER_SAS_SHOSHIN',	'FLAVOR_I_SEA_TRADE_ROUTE', 		9),
		('LEADER_SAS_SHOSHIN',	'FLAVOR_I_LAND_TRADE_ROUTE', 		6),
		('LEADER_SAS_SHOSHIN',	'FLAVOR_ARCHAEOLOGY', 				4),
		('LEADER_SAS_SHOSHIN',	'FLAVOR_AIR_CARRIER', 				3);
--------------------------------------------------------------------------------------------------------------------------	
-- Leader_Traits
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Leader_Traits 
		(LeaderType, 					TraitType)
VALUES	('LEADER_SAS_SHOSHIN',	'TRAIT_SAS_RYUKYU');
--==========================================================================================================================	
-- TRAITS
--==========================================================================================================================	
----------------------------------------------------------------------------------------------------------------------------
-- Traits
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Traits 
		(Type, 						 Description, 						 ShortDescription)
VALUES	('TRAIT_SAS_RYUKYU',  'TXT_KEY_TRAIT_SAS_RYUKYU',	 'TXT_KEY_TRAIT_SAS_RYUKYU_SHORT');
-- ======================================================================================================
-- DIPLOMACY
-- ======================================================================================================
INSERT INTO Diplomacy_Responses
		(LeaderType,			ResponseType,							Response,													Bias)
VALUES	('LEADER_SAS_SHOSHIN',	'RESPONSE_FIRST_GREETING',				'TXT_KEY_LEADER_SAS_SHOSHIN_FIRSTGREETING%',					500),
		('LEADER_SAS_SHOSHIN',	'RESPONSE_DEFEATED',					'TXT_KEY_LEADER_SAS_SHOSHIN_DEFEATED%',						500),
		('LEADER_SAS_SHOSHIN',	'RESPONSE_AI_DOF_BACKSTAB',				'TXT_KEY_LEADER_SAS_SHOSHIN_DENOUNCE_FRIEND%',				500),
		('LEADER_SAS_SHOSHIN',	'RESPONSE_ATTACKED_HOSTILE',			'TXT_KEY_LEADER_SAS_SHOSHIN_ATTACKED_HOSTILE%',				500),
        ('LEADER_SAS_SHOSHIN',	'RESPONSE_DOW_GENERIC',					'TXT_KEY_LEADER_SAS_SHOSHIN_DOW_GENERIC%',					500),
        ('LEADER_SAS_SHOSHIN',	'RESPONSE_RESPONSE_TO_BEING_DENOUNCED',	'TXT_KEY_LEADER_SAS_SHOSHIN_RESPONSE_TO_BEING_DENOUNCED%',	500),
        ('LEADER_SAS_SHOSHIN',	'RESPONSE_WORK_AGAINST_SOMEONE',		'TXT_KEY_LEADER_SAS_SHOSHIN_DENOUNCE%',						500),
        ('LEADER_SAS_SHOSHIN',	'RESPONSE_WORK_WITH_US',				'TXT_KEY_LEADER_SAS_SHOSHIN_DEC_FRIENDSHIP%',				500);
-- ======================================================================================================
-- ======================================================================================================
--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
----------------------------------------------------------------------------------------------------------------------------
-- Civilizations
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilizations 	
		(Type, 									SoundtrackTag,  MapImage, 							DawnOfManQuote, 								DawnOfManImage,					Description,								ShortDescription,								Adjective,										Civilopedia,												CivilopediaTag,										DefaultPlayerColor,					ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas,							PortraitIndex,	AlphaIconAtlas)
SELECT	'CIVILIZATION_SAS_RYUKYU',		SoundtrackTag, 		'SasRyukyu412.dds',		'TXT_KEY_CIV_DAWN_SAS_RYUKYU_TEXT',	'Sas_ShoShin_DOM.dds',	'TXT_KEY_CIV_SAS_RYUKYU_DESC', 	'TXT_KEY_CIV_SAS_RYUKYU_SHORT_DESC',	'TXT_KEY_CIV_SAS_RYUKYU_ADJECTIVE',	'TXT_KEY_CIV5_SAS_RYUKYU_HEADING_1',		'TXT_KEY_CIV5_SAS_RYUKYU',		'PLAYERCOLOR_SAS_RYUKYU',	ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, 'SAS_RYUKYU_ICON_ATLAS',	0,				'SAS_RYUKYU_ALPHA_ATLAS'
FROM Civilizations WHERE Type = 'CIVILIZATION_JAPAN';
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_SpyNames
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilization_SpyNames 
		(CivilizationType, 					SpyName)
VALUES	('CIVILIZATION_SAS_RYUKYU',	'TXT_KEY_SPY_NAME_CIV_SAS_RYUKYU_0'),
		('CIVILIZATION_SAS_RYUKYU',	'TXT_KEY_SPY_NAME_CIV_SAS_RYUKYU_1'),
		('CIVILIZATION_SAS_RYUKYU',	'TXT_KEY_SPY_NAME_CIV_SAS_RYUKYU_2'),
		('CIVILIZATION_SAS_RYUKYU',	'TXT_KEY_SPY_NAME_CIV_SAS_RYUKYU_3'),
		('CIVILIZATION_SAS_RYUKYU',	'TXT_KEY_SPY_NAME_CIV_SAS_RYUKYU_4'),
		('CIVILIZATION_SAS_RYUKYU',	'TXT_KEY_SPY_NAME_CIV_SAS_RYUKYU_5'),
		('CIVILIZATION_SAS_RYUKYU',	'TXT_KEY_SPY_NAME_CIV_SAS_RYUKYU_6'),
		('CIVILIZATION_SAS_RYUKYU',	'TXT_KEY_SPY_NAME_CIV_SAS_RYUKYU_7'),
		('CIVILIZATION_SAS_RYUKYU',	'TXT_KEY_SPY_NAME_CIV_SAS_RYUKYU_8'),
		('CIVILIZATION_SAS_RYUKYU',	'TXT_KEY_SPY_NAME_CIV_SAS_RYUKYU_9');
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_CityNames
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilization_CityNames 
		(CivilizationType, 						CityName)
VALUES	('CIVILIZATION_SAS_RYUKYU',	'TXT_KEY_CITY_NAME_SAS_RYUKYU_1'),
		('CIVILIZATION_SAS_RYUKYU',	'TXT_KEY_CITY_NAME_SAS_RYUKYU_2'),
		('CIVILIZATION_SAS_RYUKYU',	'TXT_KEY_CITY_NAME_SAS_RYUKYU_3'),
		('CIVILIZATION_SAS_RYUKYU',	'TXT_KEY_CITY_NAME_SAS_RYUKYU_4'),
		('CIVILIZATION_SAS_RYUKYU',	'TXT_KEY_CITY_NAME_SAS_RYUKYU_5'),
		('CIVILIZATION_SAS_RYUKYU',	'TXT_KEY_CITY_NAME_SAS_RYUKYU_6'),
		('CIVILIZATION_SAS_RYUKYU',	'TXT_KEY_CITY_NAME_SAS_RYUKYU_7'),
		('CIVILIZATION_SAS_RYUKYU',	'TXT_KEY_CITY_NAME_SAS_RYUKYU_8'),
		('CIVILIZATION_SAS_RYUKYU',	'TXT_KEY_CITY_NAME_SAS_RYUKYU_9'),
		('CIVILIZATION_SAS_RYUKYU',	'TXT_KEY_CITY_NAME_SAS_RYUKYU_10'),
		('CIVILIZATION_SAS_RYUKYU',	'TXT_KEY_CITY_NAME_SAS_RYUKYU_11'),
		('CIVILIZATION_SAS_RYUKYU',	'TXT_KEY_CITY_NAME_SAS_RYUKYU_12'),
		('CIVILIZATION_SAS_RYUKYU',	'TXT_KEY_CITY_NAME_SAS_RYUKYU_13'),
		('CIVILIZATION_SAS_RYUKYU',	'TXT_KEY_CITY_NAME_SAS_RYUKYU_14'),
		('CIVILIZATION_SAS_RYUKYU',	'TXT_KEY_CITY_NAME_SAS_RYUKYU_15'),
		('CIVILIZATION_SAS_RYUKYU',	'TXT_KEY_CITY_NAME_SAS_RYUKYU_16'),
		('CIVILIZATION_SAS_RYUKYU',	'TXT_KEY_CITY_NAME_SAS_RYUKYU_17'),
		('CIVILIZATION_SAS_RYUKYU',	'TXT_KEY_CITY_NAME_SAS_RYUKYU_18'),
		('CIVILIZATION_SAS_RYUKYU',	'TXT_KEY_CITY_NAME_SAS_RYUKYU_19'),
		('CIVILIZATION_SAS_RYUKYU',	'TXT_KEY_CITY_NAME_SAS_RYUKYU_20'),
		('CIVILIZATION_SAS_RYUKYU',	'TXT_KEY_CITY_NAME_SAS_RYUKYU_21'),
		('CIVILIZATION_SAS_RYUKYU',	'TXT_KEY_CITY_NAME_SAS_RYUKYU_22'),
		('CIVILIZATION_SAS_RYUKYU',	'TXT_KEY_CITY_NAME_SAS_RYUKYU_23'),
		('CIVILIZATION_SAS_RYUKYU',	'TXT_KEY_CITY_NAME_SAS_RYUKYU_24'),
		('CIVILIZATION_SAS_RYUKYU',	'TXT_KEY_CITY_NAME_SAS_RYUKYU_25'),
		('CIVILIZATION_SAS_RYUKYU',	'TXT_KEY_CITY_NAME_SAS_RYUKYU_26'),
		('CIVILIZATION_SAS_RYUKYU',	'TXT_KEY_CITY_NAME_SAS_RYUKYU_27'),
		('CIVILIZATION_SAS_RYUKYU',	'TXT_KEY_CITY_NAME_SAS_RYUKYU_28'),
		('CIVILIZATION_SAS_RYUKYU',	'TXT_KEY_CITY_NAME_SAS_RYUKYU_29'),
		('CIVILIZATION_SAS_RYUKYU',	'TXT_KEY_CITY_NAME_SAS_RYUKYU_30'),
		('CIVILIZATION_SAS_RYUKYU',	'TXT_KEY_CITY_NAME_SAS_RYUKYU_31'),
		('CIVILIZATION_SAS_RYUKYU',	'TXT_KEY_CITY_NAME_SAS_RYUKYU_32'),
		('CIVILIZATION_SAS_RYUKYU',	'TXT_KEY_CITY_NAME_SAS_RYUKYU_33'),
		('CIVILIZATION_SAS_RYUKYU',	'TXT_KEY_CITY_NAME_SAS_RYUKYU_34'),
		('CIVILIZATION_SAS_RYUKYU',	'TXT_KEY_CITY_NAME_SAS_RYUKYU_35'),
		('CIVILIZATION_SAS_RYUKYU',	'TXT_KEY_CITY_NAME_SAS_RYUKYU_36'),
		('CIVILIZATION_SAS_RYUKYU',	'TXT_KEY_CITY_NAME_SAS_RYUKYU_37'),
		('CIVILIZATION_SAS_RYUKYU',	'TXT_KEY_CITY_NAME_SAS_RYUKYU_38'),
		('CIVILIZATION_SAS_RYUKYU',	'TXT_KEY_CITY_NAME_SAS_RYUKYU_39');
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_FreeBuildingClasses
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Civilization_FreeBuildingClasses 
		(CivilizationType, 					BuildingClassType)
SELECT	'CIVILIZATION_SAS_RYUKYU', 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE CivilizationType = 'CIVILIZATION_JAPAN';
--------------------------------------------------------------------------------------------------------------------------		
-- Civilization_FreeTechs
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Civilization_FreeTechs 
		(CivilizationType, 					TechType)
SELECT	'CIVILIZATION_SAS_RYUKYU', 	TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_JAPAN';
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_FreeUnits
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_FreeUnits 
		(CivilizationType, 					UnitClassType, Count, UnitAIType)
SELECT	'CIVILIZATION_SAS_RYUKYU', 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_JAPAN';
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_Leaders
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_Leaders 
		(CivilizationType, 					LeaderheadType)
VALUES	('CIVILIZATION_SAS_RYUKYU',	'LEADER_SAS_SHOSHIN');
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_UnitClassOverrides 
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_UnitClassOverrides 
		(CivilizationType, 					UnitClassType, 				UnitType)
VALUES	('CIVILIZATION_SAS_RYUKYU', 	'UNITCLASS_PRIVATEER',			'UNIT_SAS_CHINKUNSHIN'),
		('CIVILIZATION_SAS_RYUKYU', 	'UNITCLASS_SCIENTIST',			'UNIT_SAS_YUKATCHU');
--------------------------------	
-- Civilization_Start_Along_Ocean
--------------------------------			
INSERT INTO Civilization_Start_Along_Ocean
		(CivilizationType, 			StartAlongOcean)
VALUES	('CIVILIZATION_SAS_RYUKYU', 	1);

INSERT INTO BuildingClasses
		(Type,									DefaultBuilding,				Description,	NoLimit)
VALUES	('BUILDINGCLASS_SAS_RYUKYU_GPP_DUMMY',	'BUILDING_SAS_RYUKYU_GPP_DUMMY',	'TXT_KEY_BUILDING_SAS_RYUKYU_GPP_DUMMY',	1);

INSERT INTO Buildings		
		(Type,								BuildingClass,							Cost, 	FaithCost,	GreatWorkCount,  	GreatPeopleRateModifier,	Description,							Help,											NeverCapture,	ConquestProb)
VALUES	('BUILDING_SAS_RYUKYU_GPP_DUMMY',	'BUILDINGCLASS_SAS_RYUKYU_GPP_DUMMY',	-1,		-1,			-1,					'10',			'TXT_KEY_BUILDING_SAS_RYUKYU_GPP_DUMMY',	'TXT_KEY_BUILDING_SAS_RYUKYU_GPP_DUMMY',	1,				0);

INSERT INTO UnitPromotions 
		(Type, 						Description, 						Help, 									Sound,	CannotBeChosen, IconAtlas,  PortraitIndex,			PediaType, 			PediaEntry)
VALUES	('PROMOTION_SAS_CHINKUNSHIN_GOLD',	'TXT_KEY_PROMOTION_SAS_CHINKUNSHIN_GOLD',	'TXT_KEY_PROMOTION_SAS_CHINKUNSHIN_GOLD_HELP',	'AS2D_IF_LEVELUP',	1,	'ABILITY_ATLAS', 				59,	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_SAS_CHINKUNSHIN_GOLD');
INSERT INTO UnitPromotions 
		(Type, 						Description, 						Help, 									Sound,	CannotBeChosen, IconAtlas,  PortraitIndex,	MovesChange,			PediaType, 			PediaEntry)
VALUES	('PROMOTION_SAS_CHINKUNSHIN_MOVES',	'TXT_KEY_PROMOTION_SAS_CHINKUNSHIN_MOVES',	'TXT_KEY_PROMOTION_SAS_CHINKUNSHIN_MOVES_HELP',	'AS2D_IF_LEVELUP',	1,	'ABILITY_ATLAS', 				59,	'1',	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_SAS_CHINKUNSHIN_MOVES');
--------------------------------------------------------------------------------------------------------------------------
-- BuildingClasses
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BuildingClasses 	
		(Type,													DefaultBuilding,								Description)
VALUES	('BUILDINGCLASS_SAS_RYUKYU_CHINKUNSHIN_DUMMY_1',		'BUILDING_SAS_RYUKYU_CHINKUNSHIN_DUMMY_1',		'TXT_KEY_BUILDING_SAS_RYUKYU_CHINKUNSHIN_DUMMY_1'),
		('BUILDINGCLASS_SAS_RYUKYU_CHINKUNSHIN_DUMMY_2',		'BUILDING_SAS_RYUKYU_CHINKUNSHIN_DUMMY_2',		'TXT_KEY_BUILDING_SAS_RYUKYU_CHINKUNSHIN_DUMMY_2'),
		('BUILDINGCLASS_SAS_RYUKYU_CHINKUNSHIN_DUMMY_4',		'BUILDING_SAS_RYUKYU_CHINKUNSHIN_DUMMY_4',		'TXT_KEY_BUILDING_SAS_RYUKYU_CHINKUNSHIN_DUMMY_4'),
		('BUILDINGCLASS_SAS_RYUKYU_CHINKUNSHIN_DUMMY_8',		'BUILDING_SAS_RYUKYU_CHINKUNSHIN_DUMMY_8',		'TXT_KEY_BUILDING_SAS_RYUKYU_CHINKUNSHIN_DUMMY_8'),
		('BUILDINGCLASS_SAS_RYUKYU_CHINKUNSHIN_DUMMY_16',		'BUILDING_SAS_RYUKYU_CHINKUNSHIN_DUMMY_16',		'TXT_KEY_BUILDING_SAS_RYUKYU_CHINKUNSHIN_DUMMY_16'),
		('BUILDINGCLASS_SAS_RYUKYU_CHINKUNSHIN_DUMMY_32',		'BUILDING_SAS_RYUKYU_CHINKUNSHIN_DUMMY_32',		'TXT_KEY_BUILDING_SAS_RYUKYU_CHINKUNSHIN_DUMMY_32'),
		('BUILDINGCLASS_SAS_RYUKYU_CHINKUNSHIN_DUMMY_64',		'BUILDING_SAS_RYUKYU_CHINKUNSHIN_DUMMY_64',		'TXT_KEY_BUILDING_SAS_RYUKYU_CHINKUNSHIN_DUMMY_64'),
		('BUILDINGCLASS_SAS_RYUKYU_CHINKUNSHIN_DUMMY_128',		'BUILDING_SAS_RYUKYU_CHINKUNSHIN_DUMMY_128',	'TXT_KEY_BUILDING_SAS_RYUKYU_CHINKUNSHIN_DUMMY_128');

--------------------------------------------------------------------------------------------------------------------------
-- Buildings
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Buildings		
		(Type,											BuildingClass,									Cost, 		FaithCost,	GreatWorkCount,  	Description,											Help,													NeverCapture)
VALUES	('BUILDING_SAS_RYUKYU_CHINKUNSHIN_DUMMY_1',		'BUILDINGCLASS_SAS_RYUKYU_CHINKUNSHIN_DUMMY_1',		-1,		-1,			-1,					'TXT_KEY_BUILDING_SAS_RYUKYU_CHINKUNSHIN_DUMMY_1',		'TXT_KEY_BUILDING_SAS_RYUKYU_CHINKUNSHIN_DUMMY_HELP',	1),
		('BUILDING_SAS_RYUKYU_CHINKUNSHIN_DUMMY_2',		'BUILDINGCLASS_SAS_RYUKYU_CHINKUNSHIN_DUMMY_2',		-1,		-1,			-1,					'TXT_KEY_BUILDING_SAS_RYUKYU_CHINKUNSHIN_DUMMY_2',		'TXT_KEY_BUILDING_SAS_RYUKYU_CHINKUNSHIN_DUMMY_HELP',	1),
		('BUILDING_SAS_RYUKYU_CHINKUNSHIN_DUMMY_4',		'BUILDINGCLASS_SAS_RYUKYU_CHINKUNSHIN_DUMMY_4',		-1,		-1,			-1,					'TXT_KEY_BUILDING_SAS_RYUKYU_CHINKUNSHIN_DUMMY_4',		'TXT_KEY_BUILDING_SAS_RYUKYU_CHINKUNSHIN_DUMMY_HELP',	1),
		('BUILDING_SAS_RYUKYU_CHINKUNSHIN_DUMMY_8',		'BUILDINGCLASS_SAS_RYUKYU_CHINKUNSHIN_DUMMY_8',		-1,		-1,			-1,					'TXT_KEY_BUILDING_SAS_RYUKYU_CHINKUNSHIN_DUMMY_8',		'TXT_KEY_BUILDING_SAS_RYUKYU_CHINKUNSHIN_DUMMY_HELP',	1),
		('BUILDING_SAS_RYUKYU_CHINKUNSHIN_DUMMY_16',	'BUILDINGCLASS_SAS_RYUKYU_CHINKUNSHIN_DUMMY_16',	-1,		-1,			-1,					'TXT_KEY_BUILDING_SAS_RYUKYU_CHINKUNSHIN_DUMMY_16',		'TXT_KEY_BUILDING_SAS_RYUKYU_CHINKUNSHIN_DUMMY_HELP',	1),
		('BUILDING_SAS_RYUKYU_CHINKUNSHIN_DUMMY_32',	'BUILDINGCLASS_SAS_RYUKYU_CHINKUNSHIN_DUMMY_32',	-1,		-1,			-1,					'TXT_KEY_BUILDING_SAS_RYUKYU_CHINKUNSHIN_DUMMY_32',		'TXT_KEY_BUILDING_SAS_RYUKYU_CHINKUNSHIN_DUMMY_HELP',	1),
		('BUILDING_SAS_RYUKYU_CHINKUNSHIN_DUMMY_64',	'BUILDINGCLASS_SAS_RYUKYU_CHINKUNSHIN_DUMMY_64',	-1,		-1,			-1,					'TXT_KEY_BUILDING_SAS_RYUKYU_CHINKUNSHIN_DUMMY_64',		'TXT_KEY_BUILDING_SAS_RYUKYU_CHINKUNSHIN_DUMMY_HELP',	1),
		('BUILDING_SAS_RYUKYU_CHINKUNSHIN_DUMMY_128',	'BUILDINGCLASS_SAS_RYUKYU_CHINKUNSHIN_DUMMY_128',	-1,		-1,			-1,					'TXT_KEY_BUILDING_SAS_RYUKYU_CHINKUNSHIN_DUMMY_128',	'TXT_KEY_BUILDING_SAS_RYUKYU_CHINKUNSHIN_DUMMY_HELP',	1);

--------------------------------------------------------------------------------------------------------------------------
-- Unit_ProductionModifierBuildings
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_ProductionModifierBuildings
		(UnitType,							BuildingType,									ProductionModifier)
VALUES	('UNIT_SAS_CHINKUNSHIN',			'BUILDING_SAS_RYUKYU_CHINKUNSHIN_DUMMY_1',		1),
		('UNIT_SAS_CHINKUNSHIN',			'BUILDING_SAS_RYUKYU_CHINKUNSHIN_DUMMY_2',		2),
		('UNIT_SAS_CHINKUNSHIN',			'BUILDING_SAS_RYUKYU_CHINKUNSHIN_DUMMY_4',		4),
		('UNIT_SAS_CHINKUNSHIN',			'BUILDING_SAS_RYUKYU_CHINKUNSHIN_DUMMY_8',		8),
		('UNIT_SAS_CHINKUNSHIN',			'BUILDING_SAS_RYUKYU_CHINKUNSHIN_DUMMY_16',		16),
		('UNIT_SAS_CHINKUNSHIN',			'BUILDING_SAS_RYUKYU_CHINKUNSHIN_DUMMY_32',		32),
		('UNIT_SAS_CHINKUNSHIN',			'BUILDING_SAS_RYUKYU_CHINKUNSHIN_DUMMY_64',		64),
		('UNIT_SAS_CHINKUNSHIN',			'BUILDING_SAS_RYUKYU_CHINKUNSHIN_DUMMY_128',	128);