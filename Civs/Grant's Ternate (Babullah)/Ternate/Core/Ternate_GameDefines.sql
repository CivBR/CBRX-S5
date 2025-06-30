--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
-- Civilizations
--------------------------------		
INSERT INTO Civilizations 
		(Type, 							Description, 							ShortDescription,							Adjective,										CivilopediaTag,										DefaultPlayerColor,			ArtDefineTag,	ArtStyleType,	ArtStyleSuffix,	ArtStylePrefix,	PortraitIndex,	IconAtlas,				AlphaIconAtlas,				SoundtrackTag, 		MapImage,			DawnOfManQuote,							DawnOfManImage)
SELECT	('CIVILIZATION_GT_TERNATE'), 	('TXT_KEY_CIVILIZATION_GT_TERNATE'), 	('TXT_KEY_CIVILIZATION_GT_TERNATE_SHORT'),	('TXT_KEY_CIVILIZATION_GT_TERNATE_ADJECTIVE'),	('TXT_KEY_CIVILOPEDIA_CIVILIZATIONS_GT_TERNATE'),	('PLAYERCOLOR_GT_TERNATE'),	ArtDefineTag,	'ARTSTYLE_POLYNESIAN',	'_MED',	ArtStylePrefix,	0,				('GT_TERNATE_ATLAS'),	('GT_TERNATE_ALPHA_ATLAS'),	('Indonesia'), 		('Ternate_Map.dds'),	('TXT_KEY_CIV5_DAWN_GT_TERNATE_TEXT'),	('Ternate_DoM.dds')
FROM Civilizations WHERE (Type = 'CIVILIZATION_INDONESIA');
--------------------------------	
-- Civilization_CityNames
--------------------------------	
INSERT INTO Civilization_CityNames
        (CivilizationType,				CityName)
VALUES	('CIVILIZATION_GT_TERNATE',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_TERNATE_1'),
        ('CIVILIZATION_GT_TERNATE',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_TERNATE_2'),
        ('CIVILIZATION_GT_TERNATE',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_TERNATE_3'),
        ('CIVILIZATION_GT_TERNATE',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_TERNATE_4'),
        ('CIVILIZATION_GT_TERNATE',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_TERNATE_5'),
        ('CIVILIZATION_GT_TERNATE',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_TERNATE_6'),
        ('CIVILIZATION_GT_TERNATE',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_TERNATE_7'),
        ('CIVILIZATION_GT_TERNATE',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_TERNATE_8'),
        ('CIVILIZATION_GT_TERNATE',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_TERNATE_9'),
        ('CIVILIZATION_GT_TERNATE',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_TERNATE_10'),
        ('CIVILIZATION_GT_TERNATE',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_TERNATE_11'),
        ('CIVILIZATION_GT_TERNATE',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_TERNATE_12'),
        ('CIVILIZATION_GT_TERNATE',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_TERNATE_13'),
        ('CIVILIZATION_GT_TERNATE',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_TERNATE_14'),
        ('CIVILIZATION_GT_TERNATE',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_TERNATE_15'),
        ('CIVILIZATION_GT_TERNATE',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_TERNATE_16'),
        ('CIVILIZATION_GT_TERNATE',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_TERNATE_17'),
        ('CIVILIZATION_GT_TERNATE',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_TERNATE_18'),
        ('CIVILIZATION_GT_TERNATE',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_TERNATE_19'),
        ('CIVILIZATION_GT_TERNATE',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_TERNATE_20'),
        ('CIVILIZATION_GT_TERNATE',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_TERNATE_21'),
        ('CIVILIZATION_GT_TERNATE',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_TERNATE_22'),
        ('CIVILIZATION_GT_TERNATE',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_TERNATE_23'),
        ('CIVILIZATION_GT_TERNATE',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_TERNATE_24'),
        ('CIVILIZATION_GT_TERNATE',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_TERNATE_25'),
        ('CIVILIZATION_GT_TERNATE',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_TERNATE_26'),
        ('CIVILIZATION_GT_TERNATE',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_TERNATE_27'),
        ('CIVILIZATION_GT_TERNATE',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_TERNATE_28'),
        ('CIVILIZATION_GT_TERNATE',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_TERNATE_29'),
        ('CIVILIZATION_GT_TERNATE',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_TERNATE_30'),
        ('CIVILIZATION_GT_TERNATE',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_TERNATE_31'),
        ('CIVILIZATION_GT_TERNATE',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_TERNATE_32'),
        ('CIVILIZATION_GT_TERNATE',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_TERNATE_33'),
        ('CIVILIZATION_GT_TERNATE',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_TERNATE_34'),
        ('CIVILIZATION_GT_TERNATE',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_TERNATE_35'),
        ('CIVILIZATION_GT_TERNATE',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_TERNATE_36'),
        ('CIVILIZATION_GT_TERNATE',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_TERNATE_37'),
        ('CIVILIZATION_GT_TERNATE',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_TERNATE_38'),
        ('CIVILIZATION_GT_TERNATE',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_TERNATE_39'),
        ('CIVILIZATION_GT_TERNATE',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_TERNATE_40');		
--------------------------------	
-- Civilization_FreeBuildingClasses
--------------------------------			
INSERT INTO Civilization_FreeBuildingClasses 
		(CivilizationType, 					BuildingClassType)
SELECT	('CIVILIZATION_GT_TERNATE'),	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE (CivilizationType = 'CIVILIZATION_INDONESIA');
--------------------------------	
-- Civilization_FreeTechs
--------------------------------		
INSERT INTO Civilization_FreeTechs 
		(CivilizationType, 					TechType)
SELECT	('CIVILIZATION_GT_TERNATE'),	TechType
FROM Civilization_FreeTechs WHERE (CivilizationType = 'CIVILIZATION_INDONESIA');
--------------------------------	
-- Civilization_FreeUnits
--------------------------------		
INSERT INTO Civilization_FreeUnits 
		(CivilizationType, 			UnitClassType, Count, UnitAIType)
SELECT	('CIVILIZATION_GT_TERNATE'),	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE (CivilizationType = 'CIVILIZATION_INDONESIA');
--------------------------------	
-- Civilization_Leaders
--------------------------------
INSERT INTO Civilization_Leaders 
		(CivilizationType, 				LeaderheadType)
VALUES	('CIVILIZATION_GT_TERNATE',	'LEADER_GT_BABULLAH');
--------------------------------	
-- Civilization_Religions
--------------------------------
INSERT INTO Civilization_Religions
		(CivilizationType, 				ReligionType)
VALUES	('CIVILIZATION_GT_TERNATE',	'RELIGION_ISLAM');
--------------------------------	
-- Civilization_UnitClassOverrides 
--------------------------------
INSERT INTO Civilization_UnitClassOverrides 
		(CivilizationType, 			UnitClassType, 				UnitType)
VALUES	('CIVILIZATION_GT_TERNATE', 'UNITCLASS_CARGO_SHIP',		'UNIT_GT_ARUMBAI');
--------------------------------	
-- Civilization_BuildingClassOverrides 
--------------------------------
INSERT INTO Civilization_BuildingClassOverrides 
		(CivilizationType, 				BuildingClassType, 					BuildingType)
VALUES	('CIVILIZATION_GT_TERNATE', 	'BUILDINGCLASS_CONSTABLE',		'BUILDING_GT_NGARAH_LAMO');
--------------------------------	
-- Civilization_SpyNames
--------------------------------
INSERT INTO Civilization_SpyNames 
		(CivilizationType, 				SpyName)
VALUES	('CIVILIZATION_GT_TERNATE', 	'TXT_KEY_SPY_NAME_GT_TERNATE_0'),	
		('CIVILIZATION_GT_TERNATE', 	'TXT_KEY_SPY_NAME_GT_TERNATE_1'),
		('CIVILIZATION_GT_TERNATE', 	'TXT_KEY_SPY_NAME_GT_TERNATE_2'),
		('CIVILIZATION_GT_TERNATE', 	'TXT_KEY_SPY_NAME_GT_TERNATE_3'),
		('CIVILIZATION_GT_TERNATE', 	'TXT_KEY_SPY_NAME_GT_TERNATE_4'),
		('CIVILIZATION_GT_TERNATE', 	'TXT_KEY_SPY_NAME_GT_TERNATE_5'),
		('CIVILIZATION_GT_TERNATE', 	'TXT_KEY_SPY_NAME_GT_TERNATE_6'),
		('CIVILIZATION_GT_TERNATE', 	'TXT_KEY_SPY_NAME_GT_TERNATE_7'),
		('CIVILIZATION_GT_TERNATE', 	'TXT_KEY_SPY_NAME_GT_TERNATE_8'),
		('CIVILIZATION_GT_TERNATE', 	'TXT_KEY_SPY_NAME_GT_TERNATE_9');
--------------------------------	
-- Civilization_Start_Region_Priority
--------------------------------	
INSERT INTO Civilization_Start_Region_Priority 
		(CivilizationType, 				RegionType)
VALUES	('CIVILIZATION_GT_TERNATE',	'REGION_JUNGLE'),
		('CIVILIZATION_GT_TERNATE',	'REGION_HILLS');
--------------------------------	
-- Civilization_Start_Along_Ocean
--------------------------------	
INSERT INTO Civilization_Start_Along_Ocean
		(CivilizationType,				StartAlongOcean)
VALUES	('CIVILIZATION_GT_TERNATE',	1);
--------------------------------	
-- Civilization_Start_Region_Avoid
--------------------------------	
INSERT INTO Civilization_Start_Region_Avoid 
		(CivilizationType, 				RegionType)
VALUES	('CIVILIZATION_GT_TERNATE',	'REGION_TUNDRA');
--==========================================================================================================================	
-- LEADERS
--==========================================================================================================================	
-- Leaders
--------------------------------			
INSERT INTO Leaders 
		(Type, 						Description, 						Civilopedia, 							CivilopediaTag, 						ArtDefineTag, 		VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 		DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 				PortraitIndex)
VALUES	('LEADER_GT_BABULLAH', 	'TXT_KEY_LEADER_GT_BABULLAH', 	'TXT_KEY_LEADER_GT_BABULLAH_PEDIA', 	'TXT_KEY_CIVILOPEDIA_LEADERS_GT_BABULLAH',	'Babullah_Diplo.xml',	4, 						6, 						7, 							6, 				8, 				5, 				5, 						8, 				7, 			4, 			6, 				4, 			2, 			'GT_TERNATE_ATLAS',		1);
--------------------------------		
-- Leader_MajorCivApproachBiases
--------------------------------						
INSERT INTO Leader_MajorCivApproachBiases 
		(LeaderType, 					MajorCivApproachType, 				Bias)
VALUES	('LEADER_GT_BABULLAH', 		'MAJOR_CIV_APPROACH_WAR', 			5),
		('LEADER_GT_BABULLAH', 		'MAJOR_CIV_APPROACH_HOSTILE', 		4),
		('LEADER_GT_BABULLAH', 		'MAJOR_CIV_APPROACH_DECEPTIVE', 	3),
		('LEADER_GT_BABULLAH', 		'MAJOR_CIV_APPROACH_GUARDED', 		8),
		('LEADER_GT_BABULLAH', 		'MAJOR_CIV_APPROACH_AFRAID', 		4),
		('LEADER_GT_BABULLAH', 		'MAJOR_CIV_APPROACH_FRIENDLY', 		5),
		('LEADER_GT_BABULLAH', 		'MAJOR_CIV_APPROACH_NEUTRAL', 		4);
--------------------------------	
-- Leader_MinorCivApproachBiases
--------------------------------							
INSERT INTO Leader_MinorCivApproachBiases 
		(LeaderType, 						MinorCivApproachType, 			Bias)
VALUES	('LEADER_GT_BABULLAH', 		'MINOR_CIV_APPROACH_IGNORE', 		1),
		('LEADER_GT_BABULLAH', 		'MINOR_CIV_APPROACH_FRIENDLY', 		9),
		('LEADER_GT_BABULLAH', 		'MINOR_CIV_APPROACH_PROTECTIVE', 	4),
		('LEADER_GT_BABULLAH', 		'MINOR_CIV_APPROACH_CONQUEST', 		8),
		('LEADER_GT_BABULLAH', 		'MINOR_CIV_APPROACH_BULLY', 		3);
--------------------------------	
-- Leader_Flavors
--------------------------------							
INSERT INTO Leader_Flavors 
		(LeaderType, 						FlavorType, 						Flavor)
VALUES	('LEADER_GT_BABULLAH', 		'FLAVOR_OFFENSE', 					6),
		('LEADER_GT_BABULLAH', 		'FLAVOR_DEFENSE', 					7),
		('LEADER_GT_BABULLAH', 		'FLAVOR_CITY_DEFENSE', 				6),
		('LEADER_GT_BABULLAH', 		'FLAVOR_MILITARY_TRAINING', 		7),
		('LEADER_GT_BABULLAH', 		'FLAVOR_RECON', 					9),
		('LEADER_GT_BABULLAH', 		'FLAVOR_RANGED', 					6),
		('LEADER_GT_BABULLAH', 		'FLAVOR_MOBILE', 					6),
		('LEADER_GT_BABULLAH', 		'FLAVOR_NAVAL', 					10),
		('LEADER_GT_BABULLAH', 		'FLAVOR_NAVAL_RECON', 				11),
		('LEADER_GT_BABULLAH', 		'FLAVOR_NAVAL_GROWTH', 				9),
		('LEADER_GT_BABULLAH', 		'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	6),
		('LEADER_GT_BABULLAH', 		'FLAVOR_AIR', 						5),
		('LEADER_GT_BABULLAH', 		'FLAVOR_EXPANSION', 				7),
		('LEADER_GT_BABULLAH', 		'FLAVOR_GROWTH', 					7),
		('LEADER_GT_BABULLAH', 		'FLAVOR_TILE_IMPROVEMENT', 			5),
		('LEADER_GT_BABULLAH', 		'FLAVOR_INFRASTRUCTURE', 			7),
		('LEADER_GT_BABULLAH', 		'FLAVOR_PRODUCTION', 				6),
		('LEADER_GT_BABULLAH', 		'FLAVOR_GOLD', 						6),
		('LEADER_GT_BABULLAH', 		'FLAVOR_SCIENCE', 					3),
		('LEADER_GT_BABULLAH', 		'FLAVOR_CULTURE', 					5),
		('LEADER_GT_BABULLAH', 		'FLAVOR_HAPPINESS', 				5),
		('LEADER_GT_BABULLAH', 		'FLAVOR_GREAT_PEOPLE', 				8),
		('LEADER_GT_BABULLAH', 		'FLAVOR_WONDER', 					7),
		('LEADER_GT_BABULLAH', 		'FLAVOR_RELIGION', 					8),
		('LEADER_GT_BABULLAH', 		'FLAVOR_DIPLOMACY', 				8),
		('LEADER_GT_BABULLAH', 		'FLAVOR_SPACESHIP', 				4),
		('LEADER_GT_BABULLAH', 		'FLAVOR_WATER_CONNECTION', 			7),
		('LEADER_GT_BABULLAH', 		'FLAVOR_NUKE', 						5),
		('LEADER_GT_BABULLAH', 		'FLAVOR_USE_NUKE', 					2),
		('LEADER_GT_BABULLAH', 		'FLAVOR_ESPIONAGE', 				9),
		('LEADER_GT_BABULLAH', 		'FLAVOR_AIRLIFT', 					7),
		('LEADER_GT_BABULLAH', 		'FLAVOR_I_TRADE_DESTINATION', 		8),
		('LEADER_GT_BABULLAH', 		'FLAVOR_I_TRADE_ORIGIN', 			5),
		('LEADER_GT_BABULLAH', 		'FLAVOR_I_SEA_TRADE_ROUTE', 		9),
		('LEADER_GT_BABULLAH', 		'FLAVOR_I_LAND_TRADE_ROUTE', 		2),
		('LEADER_GT_BABULLAH', 		'FLAVOR_ARCHAEOLOGY', 				1),
		('LEADER_GT_BABULLAH', 		'FLAVOR_AIR_CARRIER', 				5);
--------------------------------	
-- Leader_Traits
--------------------------------	
INSERT INTO Leader_Traits 
		(LeaderType, 					TraitType)
VALUES	('LEADER_GT_BABULLAH', 		'TRAIT_GT_SEVENTY_TWO_ISLANDS');
--==========================================================================================================================    
-- DIPLOMACY
--==========================================================================================================================    
-- Diplomacy_Responses
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Diplomacy_Responses
        (LeaderType,                 ResponseType,                              Response,                                                     	Bias)
VALUES  ('LEADER_GT_BABULLAH',     'RESPONSE_AI_DOF_BACKSTAB',                'TXT_KEY_LEADER_GT_BABULLAH_DENOUNCE_FRIEND%',                500),
        ('LEADER_GT_BABULLAH',     'RESPONSE_ATTACKED_HOSTILE',               'TXT_KEY_LEADER_GT_BABULLAH_ATTACKED_HOSTILE%',               500),
        ('LEADER_GT_BABULLAH',     'RESPONSE_DEFEATED',                       'TXT_KEY_LEADER_GT_BABULLAH_DEFEATED%',                       500),
        ('LEADER_GT_BABULLAH',     'RESPONSE_DOW_GENERIC',                    'TXT_KEY_LEADER_GT_BABULLAH_DOW_GENERIC%',                    500),
        ('LEADER_GT_BABULLAH',     'RESPONSE_FIRST_GREETING',                 'TXT_KEY_LEADER_GT_BABULLAH_FIRSTGREETING%',                  500),
        ('LEADER_GT_BABULLAH',     'RESPONSE_RESPONSE_TO_BEING_DENOUNCED',    'TXT_KEY_LEADER_GT_BABULLAH_RESPONSE_TO_BEING_DENOUNCED%',    500),
        ('LEADER_GT_BABULLAH',     'RESPONSE_WORK_AGAINST_SOMEONE',           'TXT_KEY_LEADER_GT_BABULLAH_DENOUNCE%',                       500),
        ('LEADER_GT_BABULLAH',     'RESPONSE_WORK_WITH_US',                   'TXT_KEY_LEADER_GT_BABULLAH_DEC_FRIENDSHIP%',                 500);
--==========================================================================================================================	
-- TRAITS
--==========================================================================================================================	
-- Traits
--------------------------------	
INSERT INTO Traits 
		(Type, 									Description, 								ShortDescription)
VALUES	('TRAIT_GT_SEVENTY_TWO_ISLANDS', 	'TXT_KEY_TRAIT_GT_SEVENTY_TWO_ISLANDS',	'TXT_KEY_TRAIT_GT_SEVENTY_TWO_ISLANDS_SHORT');
--==========================================================================================================================	
-- PROMOTIONS
--==========================================================================================================================	
-- UnitPromotions
--------------------------------
INSERT INTO UnitPromotions 
		(Type, 										Description, 									Help, 													Sound, 					CannotBeChosen, MovesChange, 	LostWithUpgrade, PortraitIndex, 	IconAtlas, 			PediaType, 			PediaEntry)
VALUES	('PROMOTION_GT_ARUMBAI', 					'TXT_KEY_PROMOTION_GT_ARUMBAI',					'TXT_KEY_PROMOTION_GT_ARUMBAI_HELP',					'AS2D_IF_LEVELUP', 		1, 				0,				0, 				 59, 				'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_GT_ARUMBAI');
--------------------------------------------------------------------------------------------------------------------------
-- Units
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Units 	
		(Type, 				HurryCostModifier, Trade, Immobile, Moves,	NoMaintenance, Class,	PrereqTech,	Special, Combat, CombatLimit, WorkRate, CivilianAttackPriority, Cost, Moves, MoveRate, CombatClass, Domain, DefaultUnitAI, Description, 				Civilopedia, 								Strategy, 										Help, 										MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, AdvancedStartCost, GoodyHutUpgradeUnitClass, CombatLimit, XPValueAttack, XPValueDefense, Conscription, UnitArtInfo, 						UnitFlagAtlas, 							UnitFlagIconOffset, PortraitIndex,	IconAtlas)
SELECT	'UNIT_GT_ARUMBAI', 	HurryCostModifier, Trade, Immobile,	Moves,	NoMaintenance, Class,	PrereqTech, Special, Combat, CombatLimit, WorkRate, CivilianAttackPriority, Cost, Moves, MoveRate, CombatClass, Domain,	DefaultUnitAI, 'TXT_KEY_UNIT_GT_ARUMBAI', 	'TXT_KEY_CIV5_GT_ARUMBAI_TEXT',		'TXT_KEY_UNIT_GT_ARUMBAI_STRATEGY', 	'TXT_KEY_UNIT_GT_ARUMBAI_HELP',		MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, AdvancedStartCost, GoodyHutUpgradeUnitClass, CombatLimit, XPValueAttack, XPValueDefense, Conscription, 'ART_DEF_UNIT_GT_ARUMBAI', 	'GT_ARUMBAI_FLAG_ATLAS',	0,					2,				'GT_TERNATE_ATLAS'
FROM Units WHERE Type = 'UNIT_CARGO_SHIP';
--------------------------------------------------------------------------------------------------------------------------
-- UnitGameplay2DScripts
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 					SelectionSound, FirstSelectionSound)
SELECT	'UNIT_GT_ARUMBAI',		SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_FRIGATE';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_AITypes
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_AITypes 	
		(UnitType, 					UnitAIType)
SELECT	'UNIT_GT_ARUMBAI',		UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_FRIGATE';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_Flavors
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_Flavors 	
		(UnitType, 					FlavorType, Flavor)
SELECT	'UNIT_GT_ARUMBAI',		FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_CARGO_SHIP';
------------------------------------------------------------------------------------------------------------------------
-- Unit_ClassUpgrades
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 					UnitClassType)
SELECT	'UNIT_GT_ARUMBAI',		UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_FRIGATE';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_FreePromotions
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_FreePromotions 	
		(UnitType, 					PromotionType)
SELECT	'UNIT_GT_ARUMBAI',		PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_CARGO_SHIP';

INSERT INTO Unit_FreePromotions 	
		(UnitType, 					PromotionType)
VALUES	('UNIT_GT_ARUMBAI',	'PROMOTION_GT_ARUMBAI');
--=======================================================================================================================
-- BUILDINGCLASSES
--=======================================================================================================================
-- BuildingClasses
------------------------------	
INSERT INTO BuildingClasses 	
			(Type, 						 		 DefaultBuilding, 						Description)
VALUES		('BUILDINGCLASS_GT_TERNATE', 		'BUILDING_GT_SEVENTY_TWO_SLOTS', 	'TXT_KEY_BUILDING_GT_TERNATE');
--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
-- Buildings
------------------------------	
INSERT INTO Buildings 	
			(Type, 							BuildingClass, Cost, GoldMaintenance, PrereqTech, Description, 							Civilopedia, 							Help, 										Strategy,								 	 ArtDefineTag, 	MinAreaSize, NeverCapture, Espionage, EspionageModifier, HurryCostModifier, PortraitIndex, 	IconAtlas)
SELECT		('BUILDING_GT_NGARAH_LAMO'),	BuildingClass, Cost-45, GoldMaintenance, PrereqTech, ('TXT_KEY_BUILDING_GT_NGARAH_LAMO'), 	('TXT_KEY_CIV5_GT_NGARAH_LAMO_TEXT'), 	('TXT_KEY_BUILDING_GT_NGARAH_LAMO_HELP'), 	('TXT_KEY_BUILDING_GT_NGARAH_LAMO_STRATEGY'), ArtDefineTag,	MinAreaSize, NeverCapture, Espionage, EspionageModifier, HurryCostModifier, 3, 				('GT_TERNATE_ATLAS')
FROM Buildings WHERE (Type = 'BUILDING_CONSTABLE');	

INSERT INTO Buildings		
		(Type, 									BuildingClass, 			  		Cost, 	FaithCost,			GreatWorkCount,			Description, 								Help,													NeverCapture)
VALUES	('BUILDING_GT_SEVENTY_TWO_SLOTS', 		'BUILDINGCLASS_GT_TERNATE', 	-1,				-1, 					-1,			'TXT_KEY_BUILDING_GT_SEVENTY_TWO_SLOTS', 	'TXT_KEY_BUILDING_GT_SEVENTY_TWO_SLOTS_HELP',			1),
		('BUILDING_GT_SEVENTY_TWO_MOSQUES', 	'BUILDINGCLASS_GT_TERNATE', 	-1,				-1, 					-1,			'TXT_KEY_BUILDING_GT_SEVENTY_TWO_MOSQUES', 	'TXT_KEY_BUILDING_GT_SEVENTY_TWO_MOSQUES_HELP',			1),
		('BUILDING_GT_SEVENTY_TWO_ISLANDS', 	'BUILDINGCLASS_GT_TERNATE', 	-1,				-1, 					-1,			'TXT_KEY_BUILDING_GT_SEVENTY_TWO_ISLANDS', 	'TXT_KEY_BUILDING_GT_SEVENTY_TWO_ISLANDS_HELP',			1),
		('BUILDING_GT_ARUMBAI_PRESSURE', 		'BUILDINGCLASS_GT_TERNATE', 	-1,				-1, 					-1,			'TXT_KEY_BUILDING_GT_ARUMBAI_PRESSURE', 	'TXT_KEY_BUILDING_GT_ARUMBAI_PRESSURE_HELP',				1),
		('BUILDING_GT_ARUMBAI_CULTURE', 		'BUILDINGCLASS_GT_TERNATE', 	-1,				-1, 					-1,			'TXT_KEY_BUILDING_GT_ARUMBAI_CULTURE', 	'TXT_KEY_BUILDING_GT_ARUMBAI_CULTURE_HELP',				1),
		('BUILDING_GT_ARUMBAI_GOLD', 		'BUILDINGCLASS_GT_TERNATE', 	-1,				-1, 					-1,			'TXT_KEY_BUILDING_GT_ARUMBAI_GOLD', 	'TXT_KEY_BUILDING_GT_ARUMBAI_GOLD_HELP',				1),
		('BUILDING_GT_ARUMBAI_PRODUCTION', 		'BUILDINGCLASS_GT_TERNATE', 	-1,				-1, 					-1,			'TXT_KEY_BUILDING_GT_ARUMBAI_PRODUCTION', 	'TXT_KEY_BUILDING_GT_ARUMBAI_PRODUCTION_HELP',				1),
		('BUILDING_GT_ARUMBAI_SCIENCE', 		'BUILDINGCLASS_GT_TERNATE', 	-1,				-1, 					-1,			'TXT_KEY_BUILDING_GT_ARUMBAI_SCIENCE', 	'TXT_KEY_BUILDING_GT_ARUMBAI_SCIENCE_HELP',				1),
		('BUILDING_GT_ARUMBAI_FAITH', 		'BUILDINGCLASS_GT_TERNATE', 	-1,				-1, 					-1,			'TXT_KEY_BUILDING_GT_ARUMBAI_FAITH', 	'TXT_KEY_BUILDING_GT_ARUMBAI_FAITH_HELP',				1),
		('BUILDING_GT_NGARAH_LAMO_HAPPINESS', 	'BUILDINGCLASS_GT_TERNATE', 	-1,				-1, 					-1,			'TXT_KEY_BUILDING_GT_NGARAH_LAMO_HAPPINESS', 	'TXT_KEY_BUILDING_GT_NGARAH_LAMO_HAPPINESS_HELP',		1);
		
UPDATE Buildings
SET ReligiousPressureModifier = 10
WHERE (Type = 'BUILDING_GT_ARUMBAI_PRESSURE');
UPDATE Buildings
SET Happiness = 1
WHERE (Type = 'BUILDING_GT_NGARAH_LAMO_HAPPINESS');
------------------------------------------------------------------------------------------------------------------------	
-- Building_CityToolTipYieldFromOther
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Building_CityToolTipYieldFromOther (BuildingType, YieldType, Yield);
INSERT INTO Building_CityToolTipYieldFromOther
		(BuildingType, 							YieldType,			Yield)
VALUES	('BUILDING_GT_NGARAH_LAMO_HAPPINESS',	'YIELD_HAPPINESS',	1);
------------------------------	
-- Building_Flavors
------------------------------		
INSERT INTO Building_Flavors 	
			(BuildingType, 					FlavorType,				Flavor)
SELECT		('BUILDING_GT_NGARAH_LAMO'),		FlavorType,				Flavor
FROM Building_Flavors WHERE (BuildingType = 'BUILDING_CONSTABLE');	

INSERT INTO Building_Flavors 	
			(BuildingType, 					FlavorType,							Flavor)
VALUES		('BUILDING_GT_NGARAH_LAMO',		'FLAVOR_I_TRADE_DESTINATION',	50),
			('BUILDING_GT_NGARAH_LAMO',		'FLAVOR_CITY_DEFENSE',				20);
--==========================================================================================================================
--==========================================================================================================================