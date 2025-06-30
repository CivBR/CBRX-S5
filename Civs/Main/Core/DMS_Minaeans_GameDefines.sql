--=======================================================================================================================
-- BUILDINGCLASSES
--=======================================================================================================================
-- BuildingClasses
------------------------------	
INSERT OR REPLACE INTO BuildingClasses 
		(DefaultBuilding, 							Type, 											Description)
VALUES	('BUILDING_DMS_MINAEANS_WADD_AB_FAITH',		'BUILDINGCLASS_DMS_MINAEANS_WADD_AB_FAITH',		'TXT_KEY_BUILDING_DMS_MINAEANS_WADD_AB_FAITH'),
		('BUILDING_DMS_MINAEANS_HAWTAH_DISTANCE',	'BUILDINGCLASS_DMS_MINAEANS_HAWTAH_DISTANCE',	'TXT_KEY_BUILDING_DMS_MINAEANS_HAWTAH_DISTANCE');
--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
-- Buildings
------------------------------	
INSERT INTO Buildings 	
		(Type, 						BuildingClass,	Cost,	FreeStartEra,	MaxStartEra,	GoldMaintenance,	HurryCostModifier,	PrereqTech,	Description, 						Civilopedia, 						Help, 									Strategy,									ArtDefineTag,	MinAreaSize,	PortraitIndex, 	IconAtlas)
SELECT	('BUILDING_DMS_HAWTAH'),	BuildingClass,	Cost,	FreeStartEra,	MaxStartEra,	GoldMaintenance,	HurryCostModifier,	PrereqTech,	('TXT_KEY_BUILDING_DMS_HAWTAH'),	('TXT_KEY_CIV5_DMS_HAWTAH_TEXT'),	('TXT_KEY_BUILDING_DMS_HAWTAH_HELP'),	('TXT_KEY_BUILDING_DMS_HAWTAH_STRATEGY'),	ArtDefineTag,	MinAreaSize,	3,			 	('DMS_MINAEANS_ATLAS')
FROM Buildings WHERE (Type = 'BUILDING_SHRINE');

update Buildings set GreatWorkSlotType = 'GREAT_WORK_SLOT_LITERATURE', GreatWorkCount = 1, ConquestProb = 100 where Type = 'BUILDING_DMS_HAWTAH';

INSERT INTO Buildings 	
		(Type, 						 				BuildingClass, 									Cost,	FaithCost,	GreatWorkCount,	PrereqTech,	MinAreaSize,	Description, 									Help)
VALUES	('BUILDING_DMS_MINAEANS_WADD_AB_FAITH',		'BUILDINGCLASS_DMS_MINAEANS_WADD_AB_FAITH',		-1,		-1,			-1,				null,		-1,				'TXT_KEY_BUILDING_DMS_MINAEANS_WADD_AB_FAITH',	'TXT_KEY_BUILDING_DMS_MINAEANS_WADD_AB_FAITH_HELP'),
		('BUILDING_DMS_MINAEANS_HAWTAH_DISTANCE',	'BUILDINGCLASS_DMS_MINAEANS_HAWTAH_DISTANCE',	-1,		-1,			-1,				null,		-1,				'TXT_KEY_BUILDING_DMS_MINAEANS_HAWTAH_DISTANCE','TXT_KEY_BUILDING_DMS_MINAEANS_HAWTAH_DISTANCE_HELP');

update Buildings set TradeRouteLandDistanceModifier = 10, TradeRouteSeaDistanceModifier = 10 where Type = 'BUILDING_DMS_MINAEANS_HAWTAH_DISTANCE';
------------------------------	
-- Building_Flavors
------------------------------		
INSERT INTO Building_Flavors 	
		(BuildingType, 				FlavorType,		Flavor)
SELECT	('BUILDING_DMS_HAWTAH'),	FlavorType,		Flavor
FROM Building_Flavors WHERE (BuildingType = 'BUILDING_SHRINE');

INSERT INTO Building_Flavors
		(BuildingType, 			FlavorType,				Flavor)
VALUES	('BUILDING_DMS_HAWTAH',	'FLAVOR_GREAT_PEOPLE',	8),
		('BUILDING_DMS_HAWTAH',	'FLAVOR_GOLD',			20);
------------------------------	
-- Building_YieldChanges
------------------------------		
INSERT INTO Building_YieldChanges 	
		(BuildingType, 				YieldType,		Yield)
SELECT	('BUILDING_DMS_HAWTAH'),	YieldType,		Yield
FROM Building_YieldChanges WHERE (BuildingType = 'BUILDING_SHRINE');
------------------------------	
-- Building_YieldChanges
------------------------------		
INSERT INTO Building_YieldChanges 	
		(BuildingType, 								YieldType,		Yield)
VALUES	('BUILDING_DMS_MINAEANS_WADD_AB_FAITH',		'YIELD_FAITH',	2);
--==========================================================================================================================
-- UNITS
--==========================================================================================================================
-- Units
--------------------------------
INSERT INTO Units 	
		(Type, 					Class, 	Cost,	Moves,	CivilianAttackPriority,	Special,	Domain,	DefaultUnitAI,	Description, 				Civilopedia, 					Strategy, 							Help, 							AdvancedStartCost, WorkRate, CombatLimit, BaseGold, NumGoldPerEra, MoveRate,	UnitArtInfo, 				UnitFlagIconOffset, UnitFlagAtlas,					PortraitIndex, 	IconAtlas)
SELECT	('UNIT_DMS_KABIR'),		Class,	Cost,	Moves,	CivilianAttackPriority,	Special,	Domain,	DefaultUnitAI,	('TXT_KEY_UNIT_DMS_KABIR'),	('TXT_KEY_CIV5_DMS_KABIR_TEXT'),('TXT_KEY_UNIT_DMS_KABIR_STRATEGY'),('TXT_KEY_UNIT_DMS_KABIR_HELP'),AdvancedStartCost, WorkRate, CombatLimit, BaseGold, NumGoldPerEra, MoveRate,	('ART_DEF_UNIT_DMS_KABIR'),	0,					('DMS_KABIR_FLAG_ART_ATLAS'),	2, 				('DMS_MINAEANS_ATLAS')
FROM Units WHERE (Type = 'UNIT_MERCHANT');
--------------------------------
-- UnitGameplay2DScripts
--------------------------------	
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 				SelectionSound, FirstSelectionSound)
SELECT	('UNIT_DMS_KABIR'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_MERCHANT');	
--------------------------------
-- Unit_AITypes
--------------------------------	
INSERT INTO Unit_AITypes 	
		(UnitType, 				UnitAIType)
SELECT	('UNIT_DMS_KABIR'), 	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_MERCHANT');
--------------------------------
-- Unit_Flavors
--------------------------------	
INSERT INTO Unit_Flavors 	
		(UnitType, 				FlavorType,			Flavor)
SELECT	('UNIT_DMS_KABIR'), 	FlavorType,			Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_MERCHANT');
--------------------------------
-- Unit_FreePromotions
--------------------------------
INSERT INTO Unit_FreePromotions 	
		(UnitType, 			PromotionType)
SELECT	('UNIT_DMS_KABIR'),	PromotionType
FROM Unit_FreePromotions WHERE (UnitType = 'UNIT_MERCHANT');
--------------------------------
-- Unit_Builds
--------------------------------	
INSERT INTO Unit_Builds 	
		(UnitType, 			BuildType)
SELECT	('UNIT_DMS_KABIR'),	BuildType
FROM Unit_Builds WHERE (UnitType = 'UNIT_MERCHANT');
--==========================================================================================================================	
-- LEADERS
--==========================================================================================================================	
-- Leaders
--------------------------------			
INSERT INTO Leaders 
		(Type, 							Description, 							Civilopedia, 									CivilopediaTag, 									ArtDefineTag, 					VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness,		Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 				PortraitIndex)
VALUES	('LEADER_DMS_WAQAH_IL_SADIQ_I', 'TXT_KEY_LEADER_DMS_WAQAH_IL_SADIQ_I', 	'TXT_KEY_LEADER_DMS_WAQAH_IL_SADIQ_I_PEDIA',	'TXT_KEY_CIVILOPEDIA_LEADERS_DMS_WAQAH_IL_SADIQ_I', 'DMS_waqah_il_sadiq_scene.xml',	6, 						3, 						7, 							5, 			10, 			3, 				3, 						10, 				5, 			5, 			10, 			5, 			8, 			'DMS_MINAEANS_ATLAS',	1);
--------------------------------		
-- Leader_MajorCivApproachBiases
--------------------------------						
INSERT INTO Leader_MajorCivApproachBiases 
		(LeaderType, 							MajorCivApproachType, 				Bias)
VALUES	('LEADER_DMS_WAQAH_IL_SADIQ_I', 		'MAJOR_CIV_APPROACH_WAR', 			4),
		('LEADER_DMS_WAQAH_IL_SADIQ_I', 		'MAJOR_CIV_APPROACH_HOSTILE', 		4),
		('LEADER_DMS_WAQAH_IL_SADIQ_I', 		'MAJOR_CIV_APPROACH_DECEPTIVE', 	5),
		('LEADER_DMS_WAQAH_IL_SADIQ_I', 		'MAJOR_CIV_APPROACH_GUARDED', 		5),
		('LEADER_DMS_WAQAH_IL_SADIQ_I', 		'MAJOR_CIV_APPROACH_AFRAID', 		4),
		('LEADER_DMS_WAQAH_IL_SADIQ_I', 		'MAJOR_CIV_APPROACH_FRIENDLY', 		5),
		('LEADER_DMS_WAQAH_IL_SADIQ_I', 		'MAJOR_CIV_APPROACH_NEUTRAL', 		6);
--------------------------------	
-- Leader_MajorCivApproachBiases
--------------------------------							
INSERT INTO Leader_MinorCivApproachBiases 
		(LeaderType, 							MinorCivApproachType, 				Bias)
VALUES	('LEADER_DMS_WAQAH_IL_SADIQ_I', 		'MINOR_CIV_APPROACH_IGNORE', 		3),
		('LEADER_DMS_WAQAH_IL_SADIQ_I', 		'MINOR_CIV_APPROACH_FRIENDLY', 		8),
		('LEADER_DMS_WAQAH_IL_SADIQ_I', 		'MINOR_CIV_APPROACH_PROTECTIVE', 	3),
		('LEADER_DMS_WAQAH_IL_SADIQ_I', 		'MINOR_CIV_APPROACH_CONQUEST', 		5),
		('LEADER_DMS_WAQAH_IL_SADIQ_I', 		'MINOR_CIV_APPROACH_BULLY', 		5);
--------------------------------	
-- Leader_Flavors
--------------------------------							
INSERT INTO Leader_Flavors 
		(LeaderType, 							FlavorType, 						Flavor)
VALUES	('LEADER_DMS_WAQAH_IL_SADIQ_I', 		'FLAVOR_OFFENSE', 					5),
		('LEADER_DMS_WAQAH_IL_SADIQ_I', 		'FLAVOR_DEFENSE', 					5),
		('LEADER_DMS_WAQAH_IL_SADIQ_I', 		'FLAVOR_CITY_DEFENSE', 				5),
		('LEADER_DMS_WAQAH_IL_SADIQ_I', 		'FLAVOR_MILITARY_TRAINING', 		5),
		('LEADER_DMS_WAQAH_IL_SADIQ_I', 		'FLAVOR_RECON', 					8),
		('LEADER_DMS_WAQAH_IL_SADIQ_I', 		'FLAVOR_RANGED', 					6),
		('LEADER_DMS_WAQAH_IL_SADIQ_I', 		'FLAVOR_MOBILE', 					5),
		('LEADER_DMS_WAQAH_IL_SADIQ_I', 		'FLAVOR_NAVAL', 					4),
		('LEADER_DMS_WAQAH_IL_SADIQ_I', 		'FLAVOR_NAVAL_RECON', 				6),
		('LEADER_DMS_WAQAH_IL_SADIQ_I', 		'FLAVOR_NAVAL_GROWTH', 				5),
		('LEADER_DMS_WAQAH_IL_SADIQ_I', 		'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	5),
		('LEADER_DMS_WAQAH_IL_SADIQ_I', 		'FLAVOR_AIR', 						5),
		('LEADER_DMS_WAQAH_IL_SADIQ_I', 		'FLAVOR_EXPANSION', 				5),
		('LEADER_DMS_WAQAH_IL_SADIQ_I', 		'FLAVOR_GROWTH', 					6),
		('LEADER_DMS_WAQAH_IL_SADIQ_I', 		'FLAVOR_TILE_IMPROVEMENT', 			5),
		('LEADER_DMS_WAQAH_IL_SADIQ_I', 		'FLAVOR_INFRASTRUCTURE', 			8),
		('LEADER_DMS_WAQAH_IL_SADIQ_I', 		'FLAVOR_PRODUCTION', 				6),
		('LEADER_DMS_WAQAH_IL_SADIQ_I', 		'FLAVOR_GOLD', 						9),
		('LEADER_DMS_WAQAH_IL_SADIQ_I', 		'FLAVOR_SCIENCE', 					5),
		('LEADER_DMS_WAQAH_IL_SADIQ_I', 		'FLAVOR_CULTURE', 					4),
		('LEADER_DMS_WAQAH_IL_SADIQ_I', 		'FLAVOR_HAPPINESS', 				8),
		('LEADER_DMS_WAQAH_IL_SADIQ_I', 		'FLAVOR_GREAT_PEOPLE', 				8),
		('LEADER_DMS_WAQAH_IL_SADIQ_I', 		'FLAVOR_WONDER', 					2),
		('LEADER_DMS_WAQAH_IL_SADIQ_I', 		'FLAVOR_RELIGION', 					7),
		('LEADER_DMS_WAQAH_IL_SADIQ_I', 		'FLAVOR_DIPLOMACY', 				9),
		('LEADER_DMS_WAQAH_IL_SADIQ_I', 		'FLAVOR_SPACESHIP', 				4),
		('LEADER_DMS_WAQAH_IL_SADIQ_I', 		'FLAVOR_WATER_CONNECTION', 			3),
		('LEADER_DMS_WAQAH_IL_SADIQ_I', 		'FLAVOR_NUKE', 						5),
		('LEADER_DMS_WAQAH_IL_SADIQ_I', 		'FLAVOR_USE_NUKE', 					5),
		('LEADER_DMS_WAQAH_IL_SADIQ_I', 		'FLAVOR_ESPIONAGE', 				7),
		('LEADER_DMS_WAQAH_IL_SADIQ_I', 		'FLAVOR_AIRLIFT', 					5),
		('LEADER_DMS_WAQAH_IL_SADIQ_I', 		'FLAVOR_I_TRADE_DESTINATION', 		5),
		('LEADER_DMS_WAQAH_IL_SADIQ_I', 		'FLAVOR_I_TRADE_ORIGIN', 			5),
		('LEADER_DMS_WAQAH_IL_SADIQ_I', 		'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
		('LEADER_DMS_WAQAH_IL_SADIQ_I', 		'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
		('LEADER_DMS_WAQAH_IL_SADIQ_I', 		'FLAVOR_ARCHAEOLOGY', 				9),
		('LEADER_DMS_WAQAH_IL_SADIQ_I', 		'FLAVOR_AIR_CARRIER', 				5);
--------------------------------	
-- Leader_Traits
--------------------------------	
INSERT INTO Leader_Traits 
		(LeaderType, 					TraitType)
VALUES	('LEADER_DMS_WAQAH_IL_SADIQ_I', 'TRAIT_DMS_WADD_AB');
--==========================================================================================================================	
-- TRAITS
--==========================================================================================================================	
-- Traits
--------------------------------	
INSERT INTO Traits 
		(Type, 					Description, 					ShortDescription)
VALUES	('TRAIT_DMS_WADD_AB', 	'TXT_KEY_TRAIT_DMS_WADD_AB', 	'TXT_KEY_TRAIT_DMS_WADD_AB_SHORT');	
--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
-- Civilizations
--------------------------------		
INSERT INTO Civilizations 
		(Type, 							Description, 							ShortDescription,							Adjective,											CivilopediaTag,										DefaultPlayerColor,				ArtDefineTag,	ArtStyleType,	ArtStyleSuffix,	ArtStylePrefix,	PortraitIndex,	IconAtlas,				AlphaIconAtlas,					SoundtrackTag, 	MapImage,					DawnOfManQuote,								DawnOfManImage)
SELECT	('CIVILIZATION_DMS_MINAEANS'),	('TXT_KEY_CIVILIZATION_DMS_MINAEANS'), ('TXT_KEY_CIVILIZATION_DMS_MINAEANS_SHORT'),	('TXT_KEY_CIVILIZATION_DMS_MINAEANS_ADJECTIVE'),	('TXT_KEY_CIVILOPEDIA_CIVILIZATIONS_DMS_MINAEANS'),	('PLAYERCOLOR_DMS_MINAEANS'),	ArtDefineTag,	ArtStyleType,	ArtStyleSuffix,	ArtStylePrefix,	0,				('DMS_MINAEANS_ATLAS'),	('DMS_MINAEANS_ALPHA_ATLAS'),	('Arabia'), 	('DMS_MinaeansMap512.dds'),	('TXT_KEY_CIV5_DAWN_DMS_MINAEANS_TEXT'),	('DMS_waqah_il_sadiq_dom.dds')
FROM Civilizations WHERE (Type = 'CIVILIZATION_ASSYRIA');
--------------------------------	
-- Civilization_CityNames
--------------------------------	
INSERT INTO Civilization_CityNames
        (CivilizationType,			CityName)
VALUES	('CIVILIZATION_DMS_MINAEANS',	'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_MINAEANS_1'),
        ('CIVILIZATION_DMS_MINAEANS',  'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_MINAEANS_2'),
        ('CIVILIZATION_DMS_MINAEANS',  'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_MINAEANS_3'),
        ('CIVILIZATION_DMS_MINAEANS',  'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_MINAEANS_4'),
        ('CIVILIZATION_DMS_MINAEANS',  'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_MINAEANS_5'),
        ('CIVILIZATION_DMS_MINAEANS',  'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_MINAEANS_6'),
        ('CIVILIZATION_DMS_MINAEANS',  'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_MINAEANS_7'),
        ('CIVILIZATION_DMS_MINAEANS',  'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_MINAEANS_8'),
        ('CIVILIZATION_DMS_MINAEANS',  'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_MINAEANS_9'),
        ('CIVILIZATION_DMS_MINAEANS',  'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_MINAEANS_10'),
        ('CIVILIZATION_DMS_MINAEANS',  'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_MINAEANS_11'),
        ('CIVILIZATION_DMS_MINAEANS',  'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_MINAEANS_12'),
        ('CIVILIZATION_DMS_MINAEANS',  'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_MINAEANS_13'),
        ('CIVILIZATION_DMS_MINAEANS',  'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_MINAEANS_14'),
        ('CIVILIZATION_DMS_MINAEANS',  'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_MINAEANS_15'),
        ('CIVILIZATION_DMS_MINAEANS',  'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_MINAEANS_16'),
        ('CIVILIZATION_DMS_MINAEANS',  'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_MINAEANS_17'),
        ('CIVILIZATION_DMS_MINAEANS',  'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_MINAEANS_18'),
        ('CIVILIZATION_DMS_MINAEANS',  'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_MINAEANS_19'),
        ('CIVILIZATION_DMS_MINAEANS',  'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_MINAEANS_20'),
        ('CIVILIZATION_DMS_MINAEANS',  'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_MINAEANS_21'),
        ('CIVILIZATION_DMS_MINAEANS',  'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_MINAEANS_22'),
        ('CIVILIZATION_DMS_MINAEANS',  'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_MINAEANS_23'),
        ('CIVILIZATION_DMS_MINAEANS',  'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_MINAEANS_24'),
        ('CIVILIZATION_DMS_MINAEANS',  'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_MINAEANS_25'),
        ('CIVILIZATION_DMS_MINAEANS',  'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_MINAEANS_26');			
--------------------------------	
-- Civilization_FreeBuildingClasses
--------------------------------			
INSERT INTO Civilization_FreeBuildingClasses 
		(CivilizationType, 				BuildingClassType)
SELECT	('CIVILIZATION_DMS_MINAEANS'),	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE (CivilizationType = 'CIVILIZATION_ASSYRIA');
--------------------------------	
-- Civilization_FreeTechs
--------------------------------		
INSERT INTO Civilization_FreeTechs 
		(CivilizationType, 				TechType)
SELECT	('CIVILIZATION_DMS_MINAEANS'),	TechType
FROM Civilization_FreeTechs WHERE (CivilizationType = 'CIVILIZATION_ASSYRIA');
--------------------------------	
-- Civilization_FreeUnits
--------------------------------		
INSERT INTO Civilization_FreeUnits 
		(CivilizationType, 				UnitClassType, Count, UnitAIType)
SELECT	('CIVILIZATION_DMS_MINAEANS'),	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE (CivilizationType = 'CIVILIZATION_ASSYRIA');
--------------------------------	
-- Civilization_Leaders
--------------------------------
INSERT INTO Civilization_Leaders 
		(CivilizationType, 				LeaderheadType)
VALUES	('CIVILIZATION_DMS_MINAEANS',	'LEADER_DMS_WAQAH_IL_SADIQ_I');
--------------------------------	
-- Civilization_UnitClassOverrides 
--------------------------------
INSERT INTO Civilization_UnitClassOverrides 
		(CivilizationType, 				UnitClassType, 			UnitType)
VALUES	('CIVILIZATION_DMS_MINAEANS', 	'UNITCLASS_MERCHANT',	'UNIT_DMS_KABIR');
--------------------------------	
-- Civilization_BuildingClassOverrides 
--------------------------------
INSERT INTO Civilization_BuildingClassOverrides 
		(CivilizationType, 				BuildingClassType, 			BuildingType)
VALUES	('CIVILIZATION_DMS_MINAEANS', 	'BUILDINGCLASS_SHRINE', 	'BUILDING_DMS_HAWTAH');
--------------------------------	
-- Civilization_Religions
--------------------------------		
INSERT INTO Civilization_Religions 
		(CivilizationType, 				ReligionType)
SELECT	('CIVILIZATION_DMS_MINAEANS'),	ReligionType
FROM Civilization_Religions WHERE (CivilizationType = 'CIVILIZATION_ASSYRIA');
--------------------------------	
-- Civilization_SpyNames
--------------------------------
INSERT INTO Civilization_SpyNames 
		(CivilizationType, 					SpyName)
VALUES	('CIVILIZATION_DMS_MINAEANS', 		'TXT_KEY_SPY_NAME_DMS_MINAEANS_0'),	
		('CIVILIZATION_DMS_MINAEANS', 		'TXT_KEY_SPY_NAME_DMS_MINAEANS_1'),
		('CIVILIZATION_DMS_MINAEANS', 		'TXT_KEY_SPY_NAME_DMS_MINAEANS_2'),
		('CIVILIZATION_DMS_MINAEANS', 		'TXT_KEY_SPY_NAME_DMS_MINAEANS_3'),
		('CIVILIZATION_DMS_MINAEANS', 		'TXT_KEY_SPY_NAME_DMS_MINAEANS_4'),
		('CIVILIZATION_DMS_MINAEANS', 		'TXT_KEY_SPY_NAME_DMS_MINAEANS_5'),
		('CIVILIZATION_DMS_MINAEANS', 		'TXT_KEY_SPY_NAME_DMS_MINAEANS_6'),
		('CIVILIZATION_DMS_MINAEANS', 		'TXT_KEY_SPY_NAME_DMS_MINAEANS_7'),
		('CIVILIZATION_DMS_MINAEANS', 		'TXT_KEY_SPY_NAME_DMS_MINAEANS_8'),
		('CIVILIZATION_DMS_MINAEANS', 		'TXT_KEY_SPY_NAME_DMS_MINAEANS_9');
--==========================================================================================================================
-- Civilization_Start_Region_Priority
--==========================================================================================================================	
INSERT INTO Civilization_Start_Region_Priority 
		(CivilizationType, 				RegionType)
VALUES	('CIVILIZATION_DMS_MINAEANS', 	'REGION_DESERT');
--==========================================================================================================================
--==========================================================================================================================