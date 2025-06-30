--------------------------------------------------------------------------------------------------------------------------
-- Units
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Units 	
		(Type, 					Class,	CombatClass, PrereqTech, Cost, Combat, RangedCombat, Range, FaithCost, RequiresFaithPurchaseEnabled, Pillage, Moves, CivilianAttackPriority, Special, Domain, DefaultUnitAI,	Description, 			 Help, 							 Strategy, 							Civilopedia, 					ShowInPedia, OneShotTourism, OneShotTourismPercentOthers, AdvancedStartCost, WorkRate, ObsoleteTech, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, CombatLimit,  GoldenAgeTurns,  XPValueAttack, XPValueDefense, Conscription, MoveRate, UnitArtInfo, 			 UnitFlagAtlas, 				UnitFlagIconOffset, IconAtlas,					PortraitIndex)
SELECT	'UNIT_SAS_ZENATAHORSEMAN',		Class,	CombatClass, PrereqTech, Cost, Combat, RangedCombat, Range, FaithCost, RequiresFaithPurchaseEnabled, Pillage, Moves, CivilianAttackPriority, Special, Domain, DefaultUnitAI,	'TXT_KEY_UNIT_SAS_ZENATAHORSEMAN', 'TXT_KEY_UNIT_SAS_ZENATAHORSEMAN_HELP', 	 'TXT_KEY_UNIT_SAS_ZENATAHORSEMAN_STRATEGY',  'TXT_KEY_CIVILOPEDIA_SAS_ZENATAHORSEMAN_TEXT',	ShowInPedia, OneShotTourism, OneShotTourismPercentOthers, AdvancedStartCost, WorkRate, ObsoleteTech, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, CombatLimit,  GoldenAgeTurns,  XPValueAttack, XPValueDefense, Conscription, MoveRate, 'ART_DEF_UNIT_SAS_ZENATAHORSEMAN',	 'SAS_ZENATAHORSEMAN_ATLAS',	0,					'SAS_AURES_ICON_ATLAS',	2
FROM Units WHERE Type = 'UNIT_HORSEMAN';   	
--------------------------------------------------------------------------------------------------------------------------
-- UnitGameplay2DScripts
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 				SelectionSound, FirstSelectionSound)
SELECT	'UNIT_SAS_ZENATAHORSEMAN',		SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_HORSEMAN';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_AITypes
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_AITypes 	
		(UnitType, 				UnitAIType)
SELECT	'UNIT_SAS_ZENATAHORSEMAN',		UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_HORSEMAN';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_Flavors
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_Flavors 	
		(UnitType, 				FlavorType, Flavor)
SELECT	'UNIT_SAS_ZENATAHORSEMAN',		FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_HORSEMAN';
------------------------------------------------------------------------------------------------------------------------
-- Unit_ClassUpgrades
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 				UnitClassType)
SELECT	'UNIT_SAS_ZENATAHORSEMAN',		UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_HORSEMAN';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_ResourceQuantityRequirements
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_ResourceQuantityRequirements
		(UnitType, 				ResourceType, Cost)
SELECT	'UNIT_SAS_ZENATAHORSEMAN',	ResourceType, Cost
FROM Unit_ResourceQuantityRequirements WHERE UnitType = 'UNIT_HORSEMAN';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_FreePromotions
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_FreePromotions 	
		(UnitType, 				PromotionType)
SELECT	'UNIT_SAS_ZENATAHORSEMAN',		PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_HORSEMAN';

INSERT INTO Unit_FreePromotions 	
			(UnitType, 				 PromotionType)
VALUES		('UNIT_SAS_ZENATAHORSEMAN', 'PROMOTION_FREE_PILLAGE_MOVES');
--==========================================================================================================================	
-- Buildings
--==========================================================================================================================	
INSERT INTO Buildings 	
			(Type, 						 HurryCostModifier, FreeStartEra, BuildingClass, PrereqTech, Cost, FaithCost, ConquestProb,	Defense,	ExtraCityHitPoints,		GreatWorkCount,	GreatWorkSlotType, SpecialistType, SpecialistCount, MinAreaSize, GoldMaintenance,	Happiness,	ArtDefineTag,	ArtInfoCulturalVariation,	DisplayPosition, Description, 							Civilopedia, 							Help, 										Strategy,				PortraitIndex,	IconAtlas)
SELECT		('BUILDING_SAS_KSOUR'),	HurryCostModifier, FreeStartEra, BuildingClass, PrereqTech, Cost, FaithCost, 0,	200,	15,	GreatWorkCount,	GreatWorkSlotType, SpecialistType, SpecialistCount, MinAreaSize, GoldMaintenance,	Happiness,	ArtDefineTag,	ArtInfoCulturalVariation,	DisplayPosition, ('TXT_KEY_BUILDING_SAS_KSOUR'),	('TXT_KEY_BUILDING_SAS_KSOUR_PEDIA'),	('TXT_KEY_BUILDING_SAS_KSOUR_HELP'),	('TXT_KEY_BUILDING_SAS_KSOUR_STRATEGY'),	3, 				('SAS_AURES_ICON_ATLAS')
FROM Buildings WHERE Type = 'BUILDING_GRANARY';

UPDATE Buildings
SET	
	PrereqTech	= 	(SELECT PrereqTech FROM Buildings WHERE Type = 'BUILDING_GRANARY'), 
	Cost 		= 	(SELECT Cost FROM Buildings WHERE Type = 'BUILDING_GRANARY'), 
	FaithCost 	= 	(SELECT FaithCost FROM Buildings WHERE Type = 'BUILDING_GRANARY')
WHERE Type = 'BUILDING_SAS_KSOUR';
--==========================================================================================================================	
-- Building_ClassesNeededInCity
--==========================================================================================================================	
INSERT INTO Building_ClassesNeededInCity 	
			(BuildingType, 				BuildingClassType)
SELECT		('BUILDING_SAS_KSOUR'),	BuildingClassType
FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_GRANARY';	
--==========================================================================================================================	
-- Building_YieldChanges
--==========================================================================================================================	
INSERT INTO Building_YieldChanges
			(BuildingType, 				YieldType, Yield)
SELECT		('BUILDING_SAS_KSOUR'),	YieldType, Yield
FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_GRANARY';
--==========================================================================================================================	
-- Building_ResourceYieldChanges
--==========================================================================================================================
INSERT INTO Building_ResourceYieldChanges
			(BuildingType, 						ResourceType, YieldType,		Yield)
SELECT		('BUILDING_SAS_KSOUR'),	ResourceType, YieldType,	Yield
FROM Building_ResourceYieldChanges WHERE BuildingType = 'BUILDING_GRANARY';
--==========================================================================================================================	
-- Building_TerrainYieldChanges
--==========================================================================================================================	
INSERT INTO Building_FeatureYieldChanges
			(BuildingType, 				FeatureType,	YieldType, 			Yield)
VALUES		('BUILDING_SAS_KSOUR',		'FEATURE_OASIS',	'YIELD_FOOD',		1),
			('BUILDING_SAS_KSOUR',		'FEATURE_OASIS',	'YIELD_FAITH',		1);
--==========================================================================================================================	
-- LEADERS
--==========================================================================================================================	
----------------------------------------------------------------------------------------------------------------------------
-- Leaders
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Leaders 
		(Type, 							 Description, 							 Civilopedia, 								CivilopediaTag, 	ArtDefineTag, 								VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 						PortraitIndex)
VALUES	('LEADER_SAS_DIHYA',	 'TXT_KEY_LEADER_SAS_DIHYA',	'TXT_KEY_LEADER_SAS_DIHYA_PEDIA',	'TXT_KEY_CIVILOPEDIA_LEADERS_SAS_DIHYA',	'Sas_Dihya_Scene.xml',	8, 						5, 						7, 							9, 			4, 				5, 				6, 						5, 				5, 			4, 			3, 				4, 			8, 			'SAS_AURES_ICON_ATLAS', 1);
--------------------------------------------------------------------------------------------------------------------------		
-- Leader_MajorCivApproachBiases
--------------------------------------------------------------------------------------------------------------------------						
INSERT INTO Leader_MajorCivApproachBiases 
		(LeaderType, 					 MajorCivApproachType, 				Bias)
VALUES	('LEADER_SAS_DIHYA',	'MAJOR_CIV_APPROACH_WAR', 			7),
		('LEADER_SAS_DIHYA',	'MAJOR_CIV_APPROACH_HOSTILE', 		6),
		('LEADER_SAS_DIHYA',	'MAJOR_CIV_APPROACH_DECEPTIVE', 	7),
		('LEADER_SAS_DIHYA',	'MAJOR_CIV_APPROACH_GUARDED', 		8),
		('LEADER_SAS_DIHYA',	'MAJOR_CIV_APPROACH_AFRAID', 		3),
		('LEADER_SAS_DIHYA',	'MAJOR_CIV_APPROACH_FRIENDLY', 		6),
		('LEADER_SAS_DIHYA',	'MAJOR_CIV_APPROACH_NEUTRAL', 		8);
--------------------------------------------------------------------------------------------------------------------------	
-- Leader_MajorCivApproachBiases
--------------------------------------------------------------------------------------------------------------------------							
INSERT INTO Leader_MinorCivApproachBiases 
		(LeaderType, 					 MinorCivApproachType, 				Bias)
VALUES	('LEADER_SAS_DIHYA',	'MINOR_CIV_APPROACH_IGNORE', 		6),
		('LEADER_SAS_DIHYA',	'MINOR_CIV_APPROACH_FRIENDLY', 		6),
		('LEADER_SAS_DIHYA',	'MINOR_CIV_APPROACH_PROTECTIVE', 	8),
		('LEADER_SAS_DIHYA',	'MINOR_CIV_APPROACH_CONQUEST', 		3),
		('LEADER_SAS_DIHYA',	'MINOR_CIV_APPROACH_BULLY', 		5);
--------------------------------------------------------------------------------------------------------------------------	
-- Leader_Flavors
--------------------------------------------------------------------------------------------------------------------------							
INSERT INTO Leader_Flavors 
		(LeaderType, 					 FlavorType, 						Flavor)
VALUES	('LEADER_SAS_DIHYA',	'FLAVOR_OFFENSE', 					6),
		('LEADER_SAS_DIHYA',	'FLAVOR_DEFENSE', 					6),
		('LEADER_SAS_DIHYA',	'FLAVOR_CITY_DEFENSE', 				7),
		('LEADER_SAS_DIHYA',	'FLAVOR_MILITARY_TRAINING', 		6),
		('LEADER_SAS_DIHYA',	'FLAVOR_RECON', 					5),
		('LEADER_SAS_DIHYA',	'FLAVOR_RANGED', 					7),
		('LEADER_SAS_DIHYA',	'FLAVOR_MOBILE', 					8),
		('LEADER_SAS_DIHYA',	'FLAVOR_NAVAL', 					7),
		('LEADER_SAS_DIHYA',	'FLAVOR_NAVAL_RECON', 				6),
		('LEADER_SAS_DIHYA',	'FLAVOR_NAVAL_GROWTH', 				5),
		('LEADER_SAS_DIHYA',	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	5),
		('LEADER_SAS_DIHYA',	'FLAVOR_AIR', 						8),
		('LEADER_SAS_DIHYA',	'FLAVOR_EXPANSION', 				8),
		('LEADER_SAS_DIHYA',	'FLAVOR_GROWTH', 					8),
		('LEADER_SAS_DIHYA',	'FLAVOR_TILE_IMPROVEMENT', 			8),
		('LEADER_SAS_DIHYA',	'FLAVOR_INFRASTRUCTURE', 			7),
		('LEADER_SAS_DIHYA',	'FLAVOR_PRODUCTION', 				6),
		('LEADER_SAS_DIHYA',	'FLAVOR_GOLD', 						5),
		('LEADER_SAS_DIHYA',	'FLAVOR_SCIENCE', 					6),
		('LEADER_SAS_DIHYA',	'FLAVOR_CULTURE', 					5),
		('LEADER_SAS_DIHYA',	'FLAVOR_HAPPINESS', 				6),
		('LEADER_SAS_DIHYA',	'FLAVOR_GREAT_PEOPLE', 				6),
		('LEADER_SAS_DIHYA',	'FLAVOR_WONDER', 					5),
		('LEADER_SAS_DIHYA',	'FLAVOR_RELIGION', 					8),
		('LEADER_SAS_DIHYA',	'FLAVOR_DIPLOMACY', 				6),
		('LEADER_SAS_DIHYA',	'FLAVOR_SPACESHIP', 				5),
		('LEADER_SAS_DIHYA',	'FLAVOR_WATER_CONNECTION', 			6),
		('LEADER_SAS_DIHYA',	'FLAVOR_NUKE', 						11),
		('LEADER_SAS_DIHYA',	'FLAVOR_USE_NUKE', 					11),
		('LEADER_SAS_DIHYA',	'FLAVOR_ESPIONAGE', 				6),
		('LEADER_SAS_DIHYA',	'FLAVOR_AIRLIFT', 					9),
		('LEADER_SAS_DIHYA',	'FLAVOR_I_TRADE_DESTINATION', 		5),
		('LEADER_SAS_DIHYA',	'FLAVOR_I_TRADE_ORIGIN', 			7),
		('LEADER_SAS_DIHYA',	'FLAVOR_I_SEA_TRADE_ROUTE', 		6),
		('LEADER_SAS_DIHYA',	'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
		('LEADER_SAS_DIHYA',	'FLAVOR_ARCHAEOLOGY', 				3),
		('LEADER_SAS_DIHYA',	'FLAVOR_AIR_CARRIER', 				3);
--------------------------------------------------------------------------------------------------------------------------	
-- Leader_Traits
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Leader_Traits 
		(LeaderType, 					TraitType)
VALUES	('LEADER_SAS_DIHYA',	'TRAIT_SAS_DIHYA');
--==========================================================================================================================	
-- TRAITS
--==========================================================================================================================	
----------------------------------------------------------------------------------------------------------------------------
-- Traits
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Traits 
		(Type, 						 Description, 						 ShortDescription)
VALUES	('TRAIT_SAS_DIHYA',  'TXT_KEY_TRAIT_SAS_DIHYA',	 'TXT_KEY_TRAIT_SAS_DIHYA_SHORT');
--==========================================================================================================================	
-- DIPLOMACY
--==========================================================================================================================	
----------------------------------------------------------------------------------------------------------------------------
-- Diplomacy_Responses
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Diplomacy_Responses
		(LeaderType, 					ResponseType, 								Response, 															Bias)
VALUES	('LEADER_SAS_DIHYA',	'RESPONSE_DEFEATED', 						'TXT_KEY_LEADER_SAS_DIHYA_DEFEATED%', 						500),
		('LEADER_SAS_DIHYA',	'RESPONSE_FIRST_GREETING', 					'TXT_KEY_LEADER_SAS_DIHYA_FIRSTGREETING%', 					500);
--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
----------------------------------------------------------------------------------------------------------------------------
-- Civilizations
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilizations 	
		(Type, 									SoundtrackTag,  MapImage, 							DawnOfManQuote, 								DawnOfManImage,					Description,								ShortDescription,								Adjective,										Civilopedia,												CivilopediaTag,										DefaultPlayerColor,					ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas,							PortraitIndex,	AlphaIconAtlas)
SELECT	'CIVILIZATION_SAS_AURES',		SoundtrackTag, 		'SasAures412.dds',		'TXT_KEY_CIV_DAWN_SAS_AURES_TEXT',	'Sas_Dihya_DOM.dds',	'TXT_KEY_CIV_SAS_AURES_DESC', 	'TXT_KEY_CIV_SAS_AURES_SHORT_DESC',	'TXT_KEY_CIV_SAS_AURES_ADJECTIVE',	'TXT_KEY_CIV5_SAS_AURES_HEADING_1',		'TXT_KEY_CIV5_SAS_AURES',		'PLAYERCOLOR_SAS_AURES',	ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, 'SAS_AURES_ICON_ATLAS',	0,				'SAS_AURES_ALPHA_ATLAS'
FROM Civilizations WHERE Type = 'CIVILIZATION_SONGHAI';
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_SpyNames
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilization_SpyNames 
		(CivilizationType, 					SpyName)
VALUES	('CIVILIZATION_SAS_AURES',	'TXT_KEY_SPY_NAME_CIV_SAS_AURES_0'),
		('CIVILIZATION_SAS_AURES',	'TXT_KEY_SPY_NAME_CIV_SAS_AURES_1'),
		('CIVILIZATION_SAS_AURES',	'TXT_KEY_SPY_NAME_CIV_SAS_AURES_2'),
		('CIVILIZATION_SAS_AURES',	'TXT_KEY_SPY_NAME_CIV_SAS_AURES_3'),
		('CIVILIZATION_SAS_AURES',	'TXT_KEY_SPY_NAME_CIV_SAS_AURES_4'),
		('CIVILIZATION_SAS_AURES',	'TXT_KEY_SPY_NAME_CIV_SAS_AURES_5'),
		('CIVILIZATION_SAS_AURES',	'TXT_KEY_SPY_NAME_CIV_SAS_AURES_6'),
		('CIVILIZATION_SAS_AURES',	'TXT_KEY_SPY_NAME_CIV_SAS_AURES_7'),
		('CIVILIZATION_SAS_AURES',	'TXT_KEY_SPY_NAME_CIV_SAS_AURES_8'),
		('CIVILIZATION_SAS_AURES',	'TXT_KEY_SPY_NAME_CIV_SAS_AURES_9');
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_CityNames
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilization_CityNames 
		(CivilizationType, 						CityName)
VALUES	('CIVILIZATION_SAS_AURES',	'TXT_KEY_CITY_NAME_SAS_AURES_1'),
		('CIVILIZATION_SAS_AURES',	'TXT_KEY_CITY_NAME_SAS_AURES_2'),
		('CIVILIZATION_SAS_AURES',	'TXT_KEY_CITY_NAME_SAS_AURES_3'),
		('CIVILIZATION_SAS_AURES',	'TXT_KEY_CITY_NAME_SAS_AURES_4'),
		('CIVILIZATION_SAS_AURES',	'TXT_KEY_CITY_NAME_SAS_AURES_5'),
		('CIVILIZATION_SAS_AURES',	'TXT_KEY_CITY_NAME_SAS_AURES_6'),
		('CIVILIZATION_SAS_AURES',	'TXT_KEY_CITY_NAME_SAS_AURES_7'),
		('CIVILIZATION_SAS_AURES',	'TXT_KEY_CITY_NAME_SAS_AURES_8'),
		('CIVILIZATION_SAS_AURES',	'TXT_KEY_CITY_NAME_SAS_AURES_9'),
		('CIVILIZATION_SAS_AURES',	'TXT_KEY_CITY_NAME_SAS_AURES_10'),
		('CIVILIZATION_SAS_AURES',	'TXT_KEY_CITY_NAME_SAS_AURES_11'),
		('CIVILIZATION_SAS_AURES',	'TXT_KEY_CITY_NAME_SAS_AURES_12'),
		('CIVILIZATION_SAS_AURES',	'TXT_KEY_CITY_NAME_SAS_AURES_13'),
		('CIVILIZATION_SAS_AURES',	'TXT_KEY_CITY_NAME_SAS_AURES_14'),
		('CIVILIZATION_SAS_AURES',	'TXT_KEY_CITY_NAME_SAS_AURES_15'),
		('CIVILIZATION_SAS_AURES',	'TXT_KEY_CITY_NAME_SAS_AURES_16'),
		('CIVILIZATION_SAS_AURES',	'TXT_KEY_CITY_NAME_SAS_AURES_17'),
		('CIVILIZATION_SAS_AURES',	'TXT_KEY_CITY_NAME_SAS_AURES_18'),
		('CIVILIZATION_SAS_AURES',	'TXT_KEY_CITY_NAME_SAS_AURES_19'),
		('CIVILIZATION_SAS_AURES',	'TXT_KEY_CITY_NAME_SAS_AURES_20'),
		('CIVILIZATION_SAS_AURES',	'TXT_KEY_CITY_NAME_SAS_AURES_21'),
		('CIVILIZATION_SAS_AURES',	'TXT_KEY_CITY_NAME_SAS_AURES_22'),
		('CIVILIZATION_SAS_AURES',	'TXT_KEY_CITY_NAME_SAS_AURES_23'),
		('CIVILIZATION_SAS_AURES',	'TXT_KEY_CITY_NAME_SAS_AURES_24'),
		('CIVILIZATION_SAS_AURES',	'TXT_KEY_CITY_NAME_SAS_AURES_25'),
		('CIVILIZATION_SAS_AURES',	'TXT_KEY_CITY_NAME_SAS_AURES_26');
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_FreeBuildingClasses
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Civilization_FreeBuildingClasses 
		(CivilizationType, 					BuildingClassType)
SELECT	'CIVILIZATION_SAS_AURES', 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE CivilizationType = 'CIVILIZATION_SONGHAI';
--------------------------------------------------------------------------------------------------------------------------		
-- Civilization_FreeTechs
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Civilization_FreeTechs 
		(CivilizationType, 					TechType)
SELECT	'CIVILIZATION_SAS_AURES', 	TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_SONGHAI';
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_FreeUnits
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_FreeUnits 
		(CivilizationType, 					UnitClassType, Count, UnitAIType)
SELECT	'CIVILIZATION_SAS_AURES', 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_SONGHAI';
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_Leaders
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_Leaders 
		(CivilizationType, 					LeaderheadType)
VALUES	('CIVILIZATION_SAS_AURES',	'LEADER_SAS_DIHYA');
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_UnitClassOverrides 
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_UnitClassOverrides 
		(CivilizationType, 					UnitClassType, 				UnitType)
VALUES	('CIVILIZATION_SAS_AURES', 	'UNITCLASS_HORSEMAN',			'UNIT_SAS_ZENATAHORSEMAN');
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_BuildingClassOverrides 
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_BuildingClassOverrides 
		(CivilizationType, 					BuildingClassType, 			BuildingType)
VALUES	('CIVILIZATION_SAS_AURES', 	'BUILDINGCLASS_GRANARY',	'BUILDING_SAS_KSOUR');
--------------------------------	
-- Civilization_Start_Region_Priority
--------------------------------	
INSERT INTO Civilization_Start_Region_Priority 
		(CivilizationType, 				RegionType)
VALUES	('CIVILIZATION_SAS_AURES',	'REGION_DESERT');