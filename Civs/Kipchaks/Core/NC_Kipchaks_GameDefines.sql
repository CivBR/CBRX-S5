--=======================================================================================================================
-- MASTER TABLES
--=======================================================================================================================
-------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS CustomModOptions(Name Text, Value INTEGER, Class INTEGER, DbUpdates INTEGER);
--=======================================================================================================================	
-- IMPROVEMENTS
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------
-- Improvements
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Improvements
		(Type,						Water,	SpecificCivRequired,	UpgradeTime,	CivilizationType,			GoldMaintenance,	NoTwoAdjacent,	Description,							Civilopedia,								ArtDefineTag,						BuildableOnResources,	DestroyedWhenPillaged,	PillageGold,	PortraitIndex,	IconAtlas)
VALUES	('IMPROVEMENT_LUNG_BALBALS',	0,		1,						50,				'CIVILIZATION_LUNG_KIPCHAKS',		1,					1,				'TXT_KEY_IMPROVEMENT_LUNG_BALBALS',		'TXT_KEY_IMPROVEMENT_LUNG_BALBALS_TEXT',		'ART_DEF_IMPROVEMENT_LUNG_BALBALS', 	0,						0,						2,			3,				'LUNG_KIPCHAKS_ICON_ATLAS');
------------------------------------------------------------------------------------------------------------------------
-- Improvement_ValidTerrains
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Improvement_ValidTerrains
			(ImprovementType,				TerrainType)
VALUES		('IMPROVEMENT_LUNG_BALBALS',	'TERRAIN_PLAINS'),
			('IMPROVEMENT_LUNG_BALBALS',	'TERRAIN_DESERT');
------------------------------------------------------------------------------------------------------------------------
-- Improvement_Yields
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Improvement_Yields
		(ImprovementType,			YieldType,		Yield)
VALUES	('IMPROVEMENT_LUNG_BALBALS',	'YIELD_CULTURE',	1);
------------------------------------------------------------------------------------------------------------------------
-- Builds
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Builds
		(Type,					PrereqTech,		Water,	CanBeEmbarked, 	Kill, 	ImprovementType, 			HotKey, EntityEvent,		 	CtrlDown, OrderPriority,	Time, Description,						Help,								Recommendation,						IconIndex,  IconAtlas)
VALUES	('BUILD_LUNG_BALBALS',	'TECH_CONSTRUCTION',	0,		0,		0, 		'IMPROVEMENT_LUNG_BALBALS',	'K',	'ENTITY_EVENT_BUILD', 	1,		  96,				700, 'TXT_KEY_BUILD_LUNG_BALBALS',		'TXT_KEY_BUILD_LUNG_BALBALS_HELP',	'TXT_KEY_BUILD_LUNG_BALBALS_REC',	0,			'LUNG_KIPCHAKS_ICON_BUTTON');

------------------------------------------------------------------------------------------------------------------------
-- Unit_Builds
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Unit_Builds
			(UnitType,					BuildType)
VALUES		('UNIT_WORKER',				'BUILD_LUNG_BALBALS');
--------------------------------------------------------------------------------------------------------------------------
--=======================================================================================================================	
-- UNITS
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------
-- UnitPromotions
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO UnitPromotions 
		(Type, 							LostWithUpgrade,  CityAttack,	Description, 								Help, 											Sound, 				CannotBeChosen, PortraitIndex, 	IconAtlas, 			PediaType, 			 PediaEntry)
VALUES	('PROMOTION_LUNG_TARKHAN',		1,				  100,			'TXT_KEY_PROMOTION_LUNG_TARKHAN',	'TXT_KEY_PROMOTION_LUNG_TARKHAN_HELP', 	'AS2D_IF_LEVELUP', 	1, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES',  'TXT_KEY_PROMOTION_LUNG_TARKHAN'),	
		('PROMOTION_LUNG_KIPCHAK_MERCENARY',		0,				  0,			'TXT_KEY_PROMOTION_LUNG_KIPCHAK_MERCENARY',	'TXT_KEY_PROMOTION_LUNG_KIPCHAK_MERCENARY_HELP', 	'AS2D_IF_LEVELUP', 	1, 				3, 			'EXPANSION_PROMOTION_ATLAS', 	'PEDIA_ATTRIBUTES',  'TXT_KEY_PROMOTION_LUNG_KIPCHAK_MERCENARY');	
------------------------------------------------------------------------------------------------------------------------
-- Units
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Units 	
		(Type, 								Class, PrereqTech, Combat, Cost, FaithCost, RequiresFaithPurchaseEnabled, Moves, CombatClass, Domain, DefaultUnitAI, MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, IgnoreBuildingDefense, GoodyHutUpgradeUnitClass, AdvancedStartCost, XPValueAttack, XPValueDefense, MoveRate, Description, 							Help, 										Strategy, 										Civilopedia, 								UnitArtInfo, 							UnitFlagAtlas,								UnitFlagIconOffset,		IconAtlas,								PortraitIndex)
SELECT	'UNIT_LUNG_TARKHAN',			'UNITCLASS_CATAPULT', 'TECH_MATHEMATICS', 7, Cost, FaithCost, RequiresFaithPurchaseEnabled, Moves, CombatClass, Domain, DefaultUnitAI, MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, IgnoreBuildingDefense, GoodyHutUpgradeUnitClass, AdvancedStartCost, XPValueAttack, XPValueDefense, MoveRate, 'TXT_KEY_UNIT_LUNG_TARKHAN',	'TXT_KEY_UNIT_LUNG_TARKHAN_HELP',	'TXT_KEY_UNIT_LUNG_TARKHAN_STRATEGY', 	'TXT_KEY_UNIT_LUNG_TARKHAN_TEXT',	'ART_DEF_UNIT_LUNG_TARKHAN',		'LUNG_KIPCHAKS_UNIT_FLAG_ATLAS',		0,						'LUNG_KIPCHAKS_ICON_ATLAS',		2
FROM Units WHERE Type = 'UNIT_HORSEMAN';
------------------------------------------------------------------------------------------------------------------------		
-- Unit_AITypes
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Unit_AITypes 	
		(UnitType, 						UnitAIType)
SELECT	'UNIT_LUNG_TARKHAN', 	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_HORSEMAN';
------------------------------------------------------------------------------------------------------------------------	
-- Unit_ClassUpgrades
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 						UnitClassType)
SELECT	'UNIT_LUNG_TARKHAN', 	UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_HORSEMAN';
------------------------------------------------------------------------------------------------------------------------	
-- Unit_Flavors
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Unit_Flavors 	
		(UnitType, 						FlavorType, Flavor)
SELECT	'UNIT_LUNG_TARKHAN',		FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_CATAPULT';

INSERT INTO Unit_Flavors 	
		(UnitType, 						FlavorType, Flavor)
VALUES	('UNIT_LUNG_TARKHAN', 	'FLAVOR_MOBILE', 20);
------------------------------------------------------------------------------------------------------------------------	
-- Unit_FreePromotions
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Unit_FreePromotions 	
		(UnitType, 						PromotionType)
VALUES	('UNIT_LUNG_TARKHAN', 	'PROMOTION_FREE_PILLAGE_MOVES'),
		('UNIT_LUNG_TARKHAN', 	'PROMOTION_LUNG_TARKHAN'),
		('UNIT_LUNG_TARKHAN', 	'PROMOTION_NO_DEFENSIVE_BONUSES'),
		('UNIT_LUNG_TARKHAN', 	'PROMOTION_CAN_MOVE_AFTER_ATTACKING');
--------------------------------------------------------------------------------------------------------------------------
-- Unit_ResourceQuantityRequirements
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_ResourceQuantityRequirements
		(UnitType, 						ResourceType, Cost)
SELECT	'UNIT_LUNG_TARKHAN',			ResourceType, Cost
FROM Unit_ResourceQuantityRequirements WHERE UnitType = 'UNIT_HORSEMAN';
------------------------------------------------------------------------------------------------------------------------	
-- UnitGameplay2DScripts
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 						SelectionSound,	FirstSelectionSound)
SELECT	'UNIT_LUNG_TARKHAN',		SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_CATAPULT';		
--=======================================================================================================================	
-- LEADERS
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- Leaders
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Leaders 
		(Type, 				ArtDefineTag, 						Description, 					Civilopedia, 						CivilopediaTag, 							IconAtlas, 							PortraitIndex)
VALUES	('LEADER_LUNG_KIPCHAKS', 	'KipchakLS.xml',		'TXT_KEY_LEADER_LUNG_KIPCHAKS',		'TXT_KEY_LEADER_LUNG_KIPCHAKS_PEDIA',		'TXT_KEY_CIVILOPEDIA_LEADERS_LUNG_KIPCHAKS',		'LUNG_KIPCHAKS_ICON_ATLAS', 	1);

UPDATE Leaders
SET VictoryCompetitiveness = 5,
WonderCompetitiveness = 5,
MinorCivCompetitiveness = 4,
Boldness = 8,
DiploBalance = 10,
WarmongerHate = 4,
DenounceWillingness = 7,
DoFWillingness = 9,
Loyalty = 8,
Neediness = 8,
Forgiveness = 5,
Chattiness = 7,
Meanness = 9
WHERE Type = 'LEADER_LUNG_KIPCHAKS';	
------------------------------------------------------------------------------------------------------------------------		
-- Leader_MajorCivApproachBiases
------------------------------------------------------------------------------------------------------------------------						
INSERT INTO Leader_MajorCivApproachBiases 
		(LeaderType, 					MajorCivApproachType, 				Bias)
VALUES	('LEADER_LUNG_KIPCHAKS', 	'MAJOR_CIV_APPROACH_WAR', 			7),
		('LEADER_LUNG_KIPCHAKS', 	'MAJOR_CIV_APPROACH_HOSTILE', 		8),
		('LEADER_LUNG_KIPCHAKS', 	'MAJOR_CIV_APPROACH_DECEPTIVE',		5),
		('LEADER_LUNG_KIPCHAKS', 	'MAJOR_CIV_APPROACH_GUARDED', 		3),
		('LEADER_LUNG_KIPCHAKS', 	'MAJOR_CIV_APPROACH_AFRAID', 		2),
		('LEADER_LUNG_KIPCHAKS', 	'MAJOR_CIV_APPROACH_FRIENDLY', 		9),
		('LEADER_LUNG_KIPCHAKS', 	'MAJOR_CIV_APPROACH_NEUTRAL', 		3);
------------------------------------------------------------------------------------------------------------------------	
-- Leader_MajorCivApproachBiases
------------------------------------------------------------------------------------------------------------------------							
INSERT INTO Leader_MinorCivApproachBiases 
		(LeaderType, 					MinorCivApproachType, 				Bias)
VALUES	('LEADER_LUNG_KIPCHAKS', 	'MINOR_CIV_APPROACH_IGNORE', 		4),
		('LEADER_LUNG_KIPCHAKS', 	'MINOR_CIV_APPROACH_FRIENDLY', 		6),
		('LEADER_LUNG_KIPCHAKS', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	4),
		('LEADER_LUNG_KIPCHAKS', 	'MINOR_CIV_APPROACH_CONQUEST', 		7),
		('LEADER_LUNG_KIPCHAKS', 	'MINOR_CIV_APPROACH_BULLY', 		6);
------------------------------------------------------------------------------------------------------------------------	
-- Leader_Flavors
------------------------------------------------------------------------------------------------------------------------							
INSERT INTO Leader_Flavors 
		(LeaderType, 					FlavorType, 						Flavor)
VALUES	('LEADER_LUNG_KIPCHAKS', 	'FLAVOR_OFFENSE', 					9),
		('LEADER_LUNG_KIPCHAKS', 	'FLAVOR_DEFENSE', 					3),
		('LEADER_LUNG_KIPCHAKS', 	'FLAVOR_CITY_DEFENSE', 				4),
		('LEADER_LUNG_KIPCHAKS', 	'FLAVOR_MILITARY_TRAINING', 		4),
		('LEADER_LUNG_KIPCHAKS', 	'FLAVOR_RECON', 					6),
		('LEADER_LUNG_KIPCHAKS', 	'FLAVOR_RANGED', 					6),
		('LEADER_LUNG_KIPCHAKS', 	'FLAVOR_MOBILE', 					10),
		('LEADER_LUNG_KIPCHAKS', 	'FLAVOR_NAVAL', 					3),
		('LEADER_LUNG_KIPCHAKS', 	'FLAVOR_NAVAL_RECON', 				3),
		('LEADER_LUNG_KIPCHAKS', 	'FLAVOR_NAVAL_GROWTH', 				3),
		('LEADER_LUNG_KIPCHAKS', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	2),
		('LEADER_LUNG_KIPCHAKS', 	'FLAVOR_AIR', 						6),
		('LEADER_LUNG_KIPCHAKS', 	'FLAVOR_EXPANSION', 				9),
		('LEADER_LUNG_KIPCHAKS', 	'FLAVOR_GROWTH', 					7),
		('LEADER_LUNG_KIPCHAKS', 	'FLAVOR_TILE_IMPROVEMENT', 			7),
		('LEADER_LUNG_KIPCHAKS', 	'FLAVOR_INFRASTRUCTURE', 			4),
		('LEADER_LUNG_KIPCHAKS', 	'FLAVOR_PRODUCTION', 				5),
		('LEADER_LUNG_KIPCHAKS', 	'FLAVOR_GOLD', 						8),
		('LEADER_LUNG_KIPCHAKS', 	'FLAVOR_SCIENCE', 					5),
		('LEADER_LUNG_KIPCHAKS', 	'FLAVOR_CULTURE', 					5),
		('LEADER_LUNG_KIPCHAKS', 	'FLAVOR_HAPPINESS', 				6),
		('LEADER_LUNG_KIPCHAKS', 	'FLAVOR_GREAT_PEOPLE', 				4),
		('LEADER_LUNG_KIPCHAKS', 	'FLAVOR_WONDER', 					4),
		('LEADER_LUNG_KIPCHAKS', 	'FLAVOR_RELIGION', 					3),
		('LEADER_LUNG_KIPCHAKS', 	'FLAVOR_DIPLOMACY', 				6),
		('LEADER_LUNG_KIPCHAKS', 	'FLAVOR_SPACESHIP', 				3),
		('LEADER_LUNG_KIPCHAKS', 	'FLAVOR_WATER_CONNECTION', 			2),
		('LEADER_LUNG_KIPCHAKS', 	'FLAVOR_NUKE', 						5),
		('LEADER_LUNG_KIPCHAKS', 	'FLAVOR_USE_NUKE', 					5),
		('LEADER_LUNG_KIPCHAKS', 	'FLAVOR_ESPIONAGE', 				5),
		('LEADER_LUNG_KIPCHAKS', 	'FLAVOR_AIRLIFT', 					7),
		('LEADER_LUNG_KIPCHAKS', 	'FLAVOR_I_TRADE_DESTINATION', 		5),
		('LEADER_LUNG_KIPCHAKS', 	'FLAVOR_I_TRADE_ORIGIN', 			5),
		('LEADER_LUNG_KIPCHAKS', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
		('LEADER_LUNG_KIPCHAKS', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
		('LEADER_LUNG_KIPCHAKS', 	'FLAVOR_ARCHAEOLOGY', 				5),
		('LEADER_LUNG_KIPCHAKS', 	'FLAVOR_AIR_CARRIER', 				5);
--------------------------------------------------------------------------------------------------------------------------
-- Diplomacy_Responses
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Diplomacy_Responses
		(LeaderType, 					ResponseType, 							 			Response, 																		Bias)
VALUES 	('LEADER_LUNG_KIPCHAKS',	'RESPONSE_AI_DOF_BACKSTAB', 			 			'TXT_KEY_LEADER_LUNG_KIPCHAKS_DENOUNCE_FRIEND%', 			 				500),
		('LEADER_LUNG_KIPCHAKS',	'RESPONSE_ATTACKED_HOSTILE', 			 			'TXT_KEY_LEADER_LUNG_KIPCHAKS_ATTACKED_HOSTILE%', 			 			500),
		('LEADER_LUNG_KIPCHAKS',	'RESPONSE_ATTACKED_STRONG_HOSTILE', 			 	'TXT_KEY_LEADER_LUNG_KIPCHAKS_ATTACKED_HOSTILE%', 			 			500),
		('LEADER_LUNG_KIPCHAKS',	'RESPONSE_DEFEATED', 					 			'TXT_KEY_LEADER_LUNG_KIPCHAKS_DEFEATED%', 					 			500),
		('LEADER_LUNG_KIPCHAKS',	'RESPONSE_DOW_GENERIC', 				 			'TXT_KEY_LEADER_LUNG_KIPCHAKS_DOW_GENERIC%', 				 				500),
		('LEADER_LUNG_KIPCHAKS',	'RESPONSE_FIRST_GREETING', 				 			'TXT_KEY_LEADER_LUNG_KIPCHAKS_FIRSTGREETING%', 				 			500),
		('LEADER_LUNG_KIPCHAKS',	'RESPONSE_GREETING_HOSTILE_HELLO', 					'TXT_KEY_LEADER_LUNG_KIPCHAKS_GREETING_HOSTILE_HELLO%', 		 			500),
		('LEADER_LUNG_KIPCHAKS',	'RESPONSE_GREETING_NEUTRAL_HELLO', 					'TXT_KEY_LEADER_LUNG_KIPCHAKS_GREETING_NEUTRAL_HELLO%', 		 			500),
		('LEADER_LUNG_KIPCHAKS',	'RESPONSE_GREETING_POLITE_HELLO', 					'TXT_KEY_LEADER_LUNG_KIPCHAKS_GREETING_POLITE_HELLO%', 		 			500),
		('LEADER_LUNG_KIPCHAKS',	'RESPONSE_OPEN_BORDERS_EXCHANGE', 					'TXT_KEY_LEADER_LUNG_KIPCHAKS_OPEN_BORDERS_EXCHANGE%', 		  			500),
		('LEADER_LUNG_KIPCHAKS',	'RESPONSE_REQUEST', 								'TXT_KEY_LEADER_LUNG_KIPCHAKS_REQUEST%', 		  							500),
		('LEADER_LUNG_KIPCHAKS',	'RESPONSE_RESPONSE_TO_BEING_DENOUNCED',  			'TXT_KEY_LEADER_LUNG_KIPCHAKS_RESPONSE_TO_BEING_DENOUNCED%',   			500),
		('LEADER_LUNG_KIPCHAKS',	'RESPONSE_TOO_SOON_NO_PEACE', 			 			'TXT_KEY_LEADER_LUNG_KIPCHAKS_TOO_SOON_NO_PEACE%', 			  			500),
		('LEADER_LUNG_KIPCHAKS',	'RESPONSE_WORK_AGAINST_SOMEONE', 		 			'TXT_KEY_LEADER_LUNG_KIPCHAKS_DENOUNCE%', 					  			500),
		('LEADER_LUNG_KIPCHAKS',	'RESPONSE_WORK_WITH_US', 				 			'TXT_KEY_LEADER_LUNG_KIPCHAKS_DEC_FRIENDSHIP%', 			  	  			500),
		('LEADER_LUNG_KIPCHAKS',	'RESPONSE_INFLUENTIAL_ON_AI', 		 				'TXT_KEY_LEADER_LUNG_KIPCHAKS_INFLUENTIAL_ON_AI%', 					  				500),
		('LEADER_LUNG_KIPCHAKS',	'RESPONSE_INFLUENTIAL_ON_HUMAN', 		 			'TXT_KEY_LEADER_LUNG_KIPCHAKS_INFLUENTIAL_ON_HUMAN%', 					  				500);
------------------------------------------------------------------------------------------------------------------------	
-- Leader_Traits
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Leader_Traits 
		(LeaderType, 					TraitType)
VALUES	('LEADER_LUNG_KIPCHAKS', 	'TRAIT_LUNG_KIPCHAKS');
------------------------------------------------------------------------------------------------------------------------
-- Traits
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Traits 
		(Type, 							Description, 							ShortDescription)
VALUES	('TRAIT_LUNG_KIPCHAKS', 	'TXT_KEY_TRAIT_LUNG_KIPCHAKS',	'TXT_KEY_TRAIT_LUNG_KIPCHAKS_SHORT');
------------------------------------------------------------------------------------------------------------------------
-- BuildingClasses
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO BuildingClasses
		(Type, 											DefaultBuilding, 						Description)
VALUES	('BUILDINGCLASS_DUMMY_LUNG_KIPCHAKS_BONUS_HAPPINESS',		'BUILDING_DUMMY_LUNG_KIPCHAKS_BONUS_HAPPINESS',	'TXT_KEY_BUILDING_DUMMY_LUNG_KIPCHAKS_BONUS_HAPPINESS');
--------------------------------------------------------------------------------------------------------------------------
-- Buildings
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Buildings 	
		(Type, 										BuildingClass, 									Happiness,	GreatWorkCount,		Cost, FaithCost,   PrereqTech,   NeverCapture,	Description, 									Help)
VALUES	('BUILDING_DUMMY_LUNG_KIPCHAKS_BONUS_HAPPINESS',		'BUILDINGCLASS_DUMMY_LUNG_KIPCHAKS_BONUS_HAPPINESS', 		1,					-1, 				-1,   -1, 		   null, 		 1,				'TXT_KEY_BUILDING_DUMMY_LUNG_KIPCHAKS_BONUS_HAPPINESS',	'TXT_KEY_BUILDING_DUMMY_LUNG_KIPCHAKS_BONUS_HAPPINESS_HELP');
--=======================================================================================================================	
-- CIVILIZATIONS
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- Civilizations
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilizations 	
		(Type, 									DerivativeCiv,				SoundtrackTag,  MapImage, 							DawnOfManQuote, 								DawnOfManImage,						Description,								ShortDescription,								Adjective,										Civilopedia,												CivilopediaTag,										DefaultPlayerColor,						ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas,							PortraitIndex,	AlphaIconAtlas)
SELECT	'CIVILIZATION_LUNG_KIPCHAKS',		'TXT_KEY_LUNG_TAL_KIPCHAKS',	'Mongol', 		'SasKipchaksMap.dds',		'TXT_KEY_CIV_DAWN_LUNG_KIPCHAKS_TEXT',	'Kipchaks_DOM.dds',		'TXT_KEY_CIV_LUNG_KIPCHAKS_DESC',		'TXT_KEY_CIV_LUNG_KIPCHAKS_SHORT_DESC',	'TXT_KEY_CIV_LUNG_KIPCHAKS_ADJECTIVE',	'TXT_KEY_CIVILOPEDIA_CIVS_LUNG_KIPCHAKS_TEXT_1',		'TXT_KEY_CIVILOPEDIA_CIVS_LUNG_KIPCHAKS',		'PLAYERCOLOR_LUNG_KIPCHAKS',		ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, 'LUNG_KIPCHAKS_ICON_ATLAS',	0,				'LUNG_KIPCHAKS_ALPHA_ATLAS'
FROM Civilizations WHERE Type = 'CIVILIZATION_MONGOL';
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_CityNames
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilization_CityNames 
		(CivilizationType, 						CityName)
VALUES	('CIVILIZATION_LUNG_KIPCHAKS',	'TXT_KEY_CITY_NAME_LUNG_KIPCHAKS_1'),
		('CIVILIZATION_LUNG_KIPCHAKS',	'TXT_KEY_CITY_NAME_LUNG_KIPCHAKS_2'),
		('CIVILIZATION_LUNG_KIPCHAKS',	'TXT_KEY_CITY_NAME_LUNG_KIPCHAKS_3'),
		('CIVILIZATION_LUNG_KIPCHAKS',	'TXT_KEY_CITY_NAME_LUNG_KIPCHAKS_4'),
		('CIVILIZATION_LUNG_KIPCHAKS',	'TXT_KEY_CITY_NAME_LUNG_KIPCHAKS_5'),
		('CIVILIZATION_LUNG_KIPCHAKS',	'TXT_KEY_CITY_NAME_LUNG_KIPCHAKS_6'),
		('CIVILIZATION_LUNG_KIPCHAKS',	'TXT_KEY_CITY_NAME_LUNG_KIPCHAKS_7'),
		('CIVILIZATION_LUNG_KIPCHAKS',	'TXT_KEY_CITY_NAME_LUNG_KIPCHAKS_8'),
		('CIVILIZATION_LUNG_KIPCHAKS',	'TXT_KEY_CITY_NAME_LUNG_KIPCHAKS_9'),
		('CIVILIZATION_LUNG_KIPCHAKS',	'TXT_KEY_CITY_NAME_LUNG_KIPCHAKS_10'),
		('CIVILIZATION_LUNG_KIPCHAKS',	'TXT_KEY_CITY_NAME_LUNG_KIPCHAKS_11'),
		('CIVILIZATION_LUNG_KIPCHAKS',	'TXT_KEY_CITY_NAME_LUNG_KIPCHAKS_12'),
		('CIVILIZATION_LUNG_KIPCHAKS',	'TXT_KEY_CITY_NAME_LUNG_KIPCHAKS_13'),
		('CIVILIZATION_LUNG_KIPCHAKS',	'TXT_KEY_CITY_NAME_LUNG_KIPCHAKS_14'),
		('CIVILIZATION_LUNG_KIPCHAKS',	'TXT_KEY_CITY_NAME_LUNG_KIPCHAKS_15'),
		('CIVILIZATION_LUNG_KIPCHAKS',	'TXT_KEY_CITY_NAME_LUNG_KIPCHAKS_16'),
		('CIVILIZATION_LUNG_KIPCHAKS',	'TXT_KEY_CITY_NAME_LUNG_KIPCHAKS_17'),
		('CIVILIZATION_LUNG_KIPCHAKS',	'TXT_KEY_CITY_NAME_LUNG_KIPCHAKS_18'),
		('CIVILIZATION_LUNG_KIPCHAKS',	'TXT_KEY_CITY_NAME_LUNG_KIPCHAKS_19'),
		('CIVILIZATION_LUNG_KIPCHAKS',	'TXT_KEY_CITY_NAME_LUNG_KIPCHAKS_20'),
		('CIVILIZATION_LUNG_KIPCHAKS',	'TXT_KEY_CITY_NAME_LUNG_KIPCHAKS_21'),
		('CIVILIZATION_LUNG_KIPCHAKS',	'TXT_KEY_CITY_NAME_LUNG_KIPCHAKS_22'),
		('CIVILIZATION_LUNG_KIPCHAKS',	'TXT_KEY_CITY_NAME_LUNG_KIPCHAKS_23'),
		('CIVILIZATION_LUNG_KIPCHAKS',	'TXT_KEY_CITY_NAME_LUNG_KIPCHAKS_24'),
		('CIVILIZATION_LUNG_KIPCHAKS',	'TXT_KEY_CITY_NAME_LUNG_KIPCHAKS_25'),
		('CIVILIZATION_LUNG_KIPCHAKS',	'TXT_KEY_CITY_NAME_LUNG_KIPCHAKS_26');
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_FreeBuildingClasses
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Civilization_FreeBuildingClasses 
		(CivilizationType, 						BuildingClassType)
SELECT	'CIVILIZATION_LUNG_KIPCHAKS', 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE CivilizationType = 'CIVILIZATION_MONGOL';
------------------------------------------------------------------------------------------------------------------------		
-- Civilization_FreeTechs
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Civilization_FreeTechs 
		(CivilizationType, 						TechType)
SELECT	'CIVILIZATION_LUNG_KIPCHAKS', 	TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_MONGOL';
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_FreeUnits
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_FreeUnits 
		(CivilizationType, 						UnitClassType, Count, UnitAIType)
SELECT	'CIVILIZATION_LUNG_KIPCHAKS', 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_MONGOL';
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_Leaders
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_Leaders 
		(CivilizationType, 						LeaderheadType)
VALUES	('CIVILIZATION_LUNG_KIPCHAKS',	'LEADER_LUNG_KIPCHAKS');
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_UnitClassOverrides 
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_UnitClassOverrides 
		(CivilizationType, 						UnitClassType, 				UnitType)
VALUES	('CIVILIZATION_LUNG_KIPCHAKS',	'UNITCLASS_CATAPULT',		'UNIT_LUNG_TARKHAN');
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_Religions
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Civilization_Religions 
		(CivilizationType, 						ReligionType)
VALUES	('CIVILIZATION_LUNG_KIPCHAKS',	'RELIGION_TENGRIISM');
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_SpyNames
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilization_SpyNames 
		(CivilizationType, 						SpyName)
VALUES	('CIVILIZATION_LUNG_KIPCHAKS',	'TXT_KEY_SPY_NAME_LUNG_KIPCHAKS_0'),
		('CIVILIZATION_LUNG_KIPCHAKS',	'TXT_KEY_SPY_NAME_LUNG_KIPCHAKS_1'),
		('CIVILIZATION_LUNG_KIPCHAKS',	'TXT_KEY_SPY_NAME_LUNG_KIPCHAKS_2'),
		('CIVILIZATION_LUNG_KIPCHAKS',	'TXT_KEY_SPY_NAME_LUNG_KIPCHAKS_3'),
		('CIVILIZATION_LUNG_KIPCHAKS',	'TXT_KEY_SPY_NAME_LUNG_KIPCHAKS_4'),
		('CIVILIZATION_LUNG_KIPCHAKS',	'TXT_KEY_SPY_NAME_LUNG_KIPCHAKS_5'),
		('CIVILIZATION_LUNG_KIPCHAKS',	'TXT_KEY_SPY_NAME_LUNG_KIPCHAKS_6'),
		('CIVILIZATION_LUNG_KIPCHAKS',	'TXT_KEY_SPY_NAME_LUNG_KIPCHAKS_7'),
		('CIVILIZATION_LUNG_KIPCHAKS',	'TXT_KEY_SPY_NAME_LUNG_KIPCHAKS_8'),
		('CIVILIZATION_LUNG_KIPCHAKS',	'TXT_KEY_SPY_NAME_LUNG_KIPCHAKS_9');
------------------------------------------------------------------------------------------------------------------------ 
-- Civilization_Start_Region_Priority
------------------------------------------------------------------------------------------------------------------------ 	
INSERT INTO Civilization_Start_Region_Priority 
		(CivilizationType, 						RegionType)
VALUES	('CIVILIZATION_LUNG_KIPCHAKS', 'REGION_PLAINS');