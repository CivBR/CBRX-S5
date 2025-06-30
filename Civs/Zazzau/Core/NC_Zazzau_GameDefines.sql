--=======================================================================================================================
-- MASTER TABLES
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS CustomModOptions(Name Text, Value INTEGER, Class INTEGER, DbUpdates INTEGER);
CREATE TABLE IF NOT EXISTS JFD_GlobalUserSettings (Type text, Value integer default 1);
--=======================================================================================================================
-- GAME DEFINES
--=======================================================================================================================
--==========================================================================================================================	
--DUMMY BUILDINGS 
--==========================================================================================================================
------------------------------------------------------------------------------------------------------------------------
-- BuildingClasses
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO BuildingClasses
		(Type, 											DefaultBuilding)
VALUES	('BUILDINGCLASS_DUMMY_NC_ZAZZAU', 	'BUILDING_DUMMY_NC_ZAZZAU_1');
------------------------------------------------------------------------------------------------------------------------
-- BuildingClasses
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO BuildingClasses
		(Type, 											DefaultBuilding, 						Description)
VALUES	('BUILDINGCLASS_NC_GANUWAR_DUMMY',			'BUILDING_NC_GANUWAR_DUMMY',		'TXT_KEY_BUILDING_NC_GANUWAR_DUMMY'),
		('BUILDINGCLASS_NC_GANUWAR_TRACKER',			'BUILDING_NC_GANUWAR_TRACKER',		'TXT_KEY_BUILDING_NC_GANUWAR_TRACKER'),
		('BUILDINGCLASS_NC_ZAZZAU_GOLD_DUMMY',			'BUILDING_NC_ZAZZAU_GOLD_DUMMY',		'TXT_KEY_BUILDING_NC_ZAZZAU_GOLD_DUMMY');
--------------------------------------------------------------------------------------------------------------------------
-- Buildings
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Buildings 	
		(Type, 						 					BuildingClass, 							GreatWorkCount, Cost, FaithCost, PrereqTech, NeverCapture,	Description, 											Help, TradeRouteRecipientBonus, TradeRouteTargetBonus,	Defense,	Happiness)
VALUES	('BUILDING_NC_GANUWAR_DUMMY', 		'BUILDINGCLASS_NC_GANUWAR_DUMMY', 	-1, 			-1,   -1, 		 null, 		 1,				'TXT_KEY_BUILDING_NC_GANUWAR_DUMMY',			'TXT_KEY_BUILDING_NC_GANUWAR_DUMMY_HELP',	0,	0,	200,	1),
		('BUILDING_NC_ZAZZAU_GOLD_DUMMY', 		'BUILDINGCLASS_NC_ZAZZAU_GOLD_DUMMY', 	-1, 			-1,   -1, 		 null, 		 1,				'TXT_KEY_BUILDING_NC_ZAZZAU_GOLD_DUMMY',			'TXT_KEY_BUILDING_NC_ZAZZAU_GOLD_DUMMY_HELP',	1,	1,	0,	0);

INSERT INTO Buildings 	
		(Type, 						 					BuildingClass, 							GreatWorkCount, Cost, FaithCost, PrereqTech, ConquestProb,	Description, 											Help)
VALUES	('BUILDING_NC_GANUWAR_TRACKER', 		'BUILDINGCLASS_NC_GANUWAR_TRACKER', 	-1, 			-1,   -1, 		 null, 		 100,				'TXT_KEY_BUILDING_NC_GANUWAR_TRACKER',			'TXT_KEY_BUILDING_NC_GANUWAR_TRACKER_HELP');
--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================		
------------------------------------------------------------------------------------------------------------------------	
-- Buildings
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Buildings 	
		(Type, 								BuildingClass,	FreeStartEra,	Cost,	GoldMaintenance,	PrereqTech,	Description,								Civilopedia,										Help,											Strategy,											ArtDefineTag,	SpecialistType,	SpecialistCount,	MinAreaSize,	ConquestProb,	HurryCostModifier,	Happiness,	Water,	AllowsRangeStrike,	Defense,	ExtraCityHitPoints,	CityWall,	NeverCapture,	AllowsWaterRoutes, TradeRouteSeaDistanceModifier, TradeRouteSeaGoldBonus,	IconAtlas,				PortraitIndex)
SELECT	('BUILDING_NC_GANUWAR'),	BuildingClass,	FreeStartEra,	Cost,	GoldMaintenance,	PrereqTech,	('TXT_KEY_BUILDING_NC_GANUWAR'),	('TXT_KEY_BUILDING_NC_GANUWAR_TEXT'),	('TXT_KEY_BUILDING_NC_GANUWAR_HELP'),	('TXT_KEY_BUILDING_NC_GANUWAR_STRATEGY'),	ArtDefineTag,	SpecialistType,	SpecialistCount,	MinAreaSize,	0,				HurryCostModifier,	Happiness,	Water,	AllowsRangeStrike,	Defense,	ExtraCityHitPoints,	CityWall,	NeverCapture,	AllowsWaterRoutes, TradeRouteSeaDistanceModifier, TradeRouteSeaGoldBonus,	'NC_ZAZZAU_ICON_ATLAS',		3
FROM Buildings WHERE (Type = 'BUILDING_WALLS');
------------------------------------------------------------------------------------------------------------------------	
-- Building_Flavors
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_Flavors 	
		(BuildingType, 					FlavorType,		Flavor)
SELECT	'BUILDING_NC_GANUWAR',	FlavorType,		Flavor
FROM Building_Flavors WHERE BuildingType = 'BUILDING_WALLS';

------------------------------------------------------------------------------------------------------------------------	
-- Building_ResourceYieldChanges
------------------------------------------------------------------------------------------------------------------------					
INSERT INTO Building_YieldChanges 	
		(BuildingType, 					YieldType,	Yield)
SELECT	'BUILDING_NC_GANUWAR',	YieldType,	Yield
FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_WALLS';	
------------------------------------------------------------------------------------------------------------------------	
-- Building_ResourceYieldModifiers
------------------------------------------------------------------------------------------------------------------------					
INSERT INTO Building_ResourceYieldModifiers 	
		(BuildingType, 					YieldType,	Yield)
SELECT	'BUILDING_NC_GANUWAR',	YieldType,	Yield
FROM Building_ResourceYieldModifiers WHERE BuildingType = 'BUILDING_WALLS';	
--------------------------------------------------------------------------------------------------------------------------	
-- Building_ClassesNeededInCity
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Building_ClassesNeededInCity 	
		(BuildingType, 					BuildingClassType)
SELECT	'BUILDING_NC_GANUWAR',	BuildingClassType
FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_WALLS';	
--=======================================================================================================================
-- UNITS
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------
-- Units
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Units
		(Type,						Description,						Civilopedia,								Strategy,										Help,										Combat,	Cost,	Moves,	BaseSightRange,	Class,	CombatClass,	Special,	Domain,	DefaultUnitAI,	MilitarySupport,	MilitaryProduction,	Pillage,	Mechanized,	MinAreaSize,	MoveRate,	PortraitIndex,	IconAtlas,				UnitFlagIconOffset,	UnitFlagAtlas,			UnitArtInfo,					XPValueAttack,	XPValueDefense,	CombatLimit,	PrereqTech,	ObsoleteTech,	BaseHurry,	HurryMultiplier)
SELECT	'UNIT_NC_YAN_LIFIDA',		'TXT_KEY_UNIT_NC_YAN_LIFIDA',		'TXT_KEY_UNIT_NC_YAN_LIFIDA_TEXT',			'TXT_KEY_UNIT_NC_YAN_LIFIDA_STRATEGY',			'TXT_KEY_UNIT_NC_YAN_LIFIDA_HELP',			Combat,	Cost,	Moves,	BaseSightRange,	Class,	CombatClass,	Special,	Domain,	DefaultUnitAI,	MilitarySupport,	MilitaryProduction,	Pillage,	Mechanized,	MinAreaSize,	MoveRate,	2,				'NC_ZAZZAU_ICON_ATLAS',	0,					'NC_ZAZZAU_UNIT_FLAG_ATLAS',	'ART_DEF_UNIT_NC_YAN_LIFIDA',	XPValueAttack,	XPValueDefense,	CombatLimit,	PrereqTech,	ObsoleteTech,	BaseHurry,	HurryMultiplier
FROM Units WHERE (Type = 'UNIT_KNIGHT');
------------------------------------------------------------------------------------------------------------------------
-- Unit_AITypes
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_AITypes 	
		(UnitType, 						UnitAIType)
SELECT	'UNIT_NC_YAN_LIFIDA',	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_KNIGHT';
------------------------------------------------------------------------------------------------------------------------	
-- Unit_ClassUpgrades
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 						UnitClassType)
SELECT	'UNIT_NC_YAN_LIFIDA',	UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_KNIGHT';
------------------------------------------------------------------------------------------------------------------------
-- Unit_Flavors
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_Flavors
		(UnitType, 						FlavorType, Flavor)
SELECT	'UNIT_NC_YAN_LIFIDA',	FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_KNIGHT';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_ResourceQuantityRequirements
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_ResourceQuantityRequirements
		(UnitType, 						ResourceType, Cost)
SELECT	'UNIT_NC_YAN_LIFIDA',			ResourceType, Cost
FROM Unit_ResourceQuantityRequirements WHERE UnitType = 'UNIT_KNIGHT';
------------------------------------------------------------------------------------------------------------------------
-- UnitPromotions
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO UnitPromotions 
		(Type, 							LostWithUpgrade,  Description, 							Help, 										Sound, 				CannotBeChosen, HasPostCombatPromotions, PortraitIndex, 	IconAtlas, 			PediaType, 			 PediaEntry)
VALUES	('PROMOTION_NC_ZAZZAU_YAN_LIFIDA',	0,				  'TXT_KEY_PROMOTION_NC_ZAZZAU_YAN_LIFIDA',	'TXT_KEY_PROMOTION_NC_ZAZZAU_YAN_LIFIDA_HELP', 	'AS2D_IF_LEVELUP', 	1, 0, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES',  'TXT_KEY_PROMOTION_NC_ZAZZAU_YAN_LIFIDA'),	
		('PROMOTION_NC_ZAZZAU_YAN_LIFIDA_BONUS',	0,				  'TXT_KEY_PROMOTION_NC_ZAZZAU_YAN_LIFIDA_BONUS',	'TXT_KEY_PROMOTION_NC_ZAZZAU_YAN_LIFIDA_BONUS_HELP', 	'AS2D_IF_LEVELUP', 	1, 0, 				58, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES',  'TXT_KEY_PROMOTION_NC_ZAZZAU_YAN_LIFIDA_BONUS'),
		('PROMOTION_NC_WEAPONS_RESHARPENED',	0,				  'TXT_KEY_PROMOTION_NC_WEAPONS_RESHARPENED',	'TXT_KEY_PROMOTION_NC_WEAPONS_RESHARPENED_HELP', 	'AS2D_IF_LEVELUP', 	1, 0, 				58, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES',  'TXT_KEY_PROMOTION_NC_WEAPONS_RESHARPENED');

UPDATE UnitPromotions
SET ExperiencePercent = 50
WHERE (Type = 'PROMOTION_NC_ZAZZAU_YAN_LIFIDA_BONUS'); -- TODO: Does this even work
------------------------------------------------------------------------------------------------------------------------
-- Unit_FreePromotions
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_FreePromotions
		(UnitType,			PromotionType)
VALUES		('UNIT_NC_YAN_LIFIDA',	'PROMOTION_CAN_MOVE_AFTER_ATTACKING'),
			('UNIT_NC_YAN_LIFIDA',	'PROMOTION_SMALL_CITY_PENALTY'),
			('UNIT_NC_YAN_LIFIDA',	'PROMOTION_NC_ZAZZAU_YAN_LIFIDA');
------------------------------------------------------------------------------------------------------------------------
-- UnitGameplay2DScripts
------------------------------------------------------------------------------------------------------------------------
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 						SelectionSound, FirstSelectionSound)
SELECT	'UNIT_NC_YAN_LIFIDA',	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_KNIGHT';	
--=======================================================================================================================	
-- LEADERS
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- Leaders
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Leaders 
		(Type, 					Description, 				Civilopedia, 							CivilopediaTag, 							ArtDefineTag, 	IconAtlas, 				   PortraitIndex)
VALUES	('LEADER_NC_ZAZZAU', 	'TXT_KEY_LEADER_NC_ZAZZAU',	'TXT_KEY_CIVILOPEDIA_CIVS_NC_ZAZZAU', 	'TXT_KEY_CIVILOPEDIA_LEADERS_NC_ZAZZAU', 	'amina_ls.xml',	'NC_ZAZZAU_ICON_ATLAS',    1);

UPDATE Leaders
SET VictoryCompetitiveness = 7,
WonderCompetitiveness = 4,
MinorCivCompetitiveness = 4,
Boldness = 10,
DiploBalance = 4,
WarmongerHate = 3,
DenounceWillingness = 9,
DoFWillingness = 3,
Loyalty = 2,
Neediness = 2,
Forgiveness = 3,
Chattiness = 8,
Meanness = 5
WHERE Type = 'LEADER_NC_ZAZZAU';
------------------------------------------------------------------------------------------------------------------------
-- Leader_MajorCivApproachBiases
------------------------------------------------------------------------------------------------------------------------				
INSERT INTO Leader_MajorCivApproachBiases 
		(LeaderType, 						MajorCivApproachType, 				Bias)
VALUES	('LEADER_NC_ZAZZAU', 	'MAJOR_CIV_APPROACH_WAR', 			10),
		('LEADER_NC_ZAZZAU', 	'MAJOR_CIV_APPROACH_HOSTILE', 		8),
		('LEADER_NC_ZAZZAU', 	'MAJOR_CIV_APPROACH_DECEPTIVE', 	5),
		('LEADER_NC_ZAZZAU', 	'MAJOR_CIV_APPROACH_GUARDED', 		4),
		('LEADER_NC_ZAZZAU', 	'MAJOR_CIV_APPROACH_AFRAID', 		2),
		('LEADER_NC_ZAZZAU', 	'MAJOR_CIV_APPROACH_FRIENDLY', 		3),
		('LEADER_NC_ZAZZAU', 	'MAJOR_CIV_APPROACH_NEUTRAL', 		4);
------------------------------------------------------------------------------------------------------------------------
-- Leader_MajorCivApproachBiases
------------------------------------------------------------------------------------------------------------------------ 				
INSERT INTO Leader_MinorCivApproachBiases 
		(LeaderType, 						MinorCivApproachType, 				Bias)
VALUES	('LEADER_NC_ZAZZAU', 	'MINOR_CIV_APPROACH_IGNORE', 		2),
		('LEADER_NC_ZAZZAU', 	'MINOR_CIV_APPROACH_FRIENDLY', 		3),
		('LEADER_NC_ZAZZAU', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	5),
		('LEADER_NC_ZAZZAU', 	'MINOR_CIV_APPROACH_CONQUEST', 		10),
		('LEADER_NC_ZAZZAU', 	'MINOR_CIV_APPROACH_BULLY', 		8);
------------------------------------------------------------------------------------------------------------------------ 
-- Leader_Flavors
------------------------------------------------------------------------------------------------------------------------				
INSERT INTO Leader_Flavors 
		(LeaderType, 						FlavorType, 						Flavor)
VALUES	('LEADER_NC_ZAZZAU', 	'FLAVOR_OFFENSE', 					11),
		('LEADER_NC_ZAZZAU', 	'FLAVOR_DEFENSE', 					4),
		('LEADER_NC_ZAZZAU', 	'FLAVOR_CITY_DEFENSE', 				7),
		('LEADER_NC_ZAZZAU', 	'FLAVOR_MILITARY_TRAINING', 		5),
		('LEADER_NC_ZAZZAU', 	'FLAVOR_RECON', 					2),
		('LEADER_NC_ZAZZAU', 	'FLAVOR_RANGED', 					5),
		('LEADER_NC_ZAZZAU', 	'FLAVOR_MOBILE', 					9),
		('LEADER_NC_ZAZZAU', 	'FLAVOR_NAVAL', 					4),
		('LEADER_NC_ZAZZAU', 	'FLAVOR_NAVAL_RECON', 				2),
		('LEADER_NC_ZAZZAU', 	'FLAVOR_NAVAL_GROWTH', 				3),
		('LEADER_NC_ZAZZAU', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	3),
		('LEADER_NC_ZAZZAU', 	'FLAVOR_AIR', 						5),
		('LEADER_NC_ZAZZAU', 	'FLAVOR_EXPANSION', 				9),
		('LEADER_NC_ZAZZAU', 	'FLAVOR_GROWTH', 					6),
		('LEADER_NC_ZAZZAU', 	'FLAVOR_TILE_IMPROVEMENT', 			5),
		('LEADER_NC_ZAZZAU', 	'FLAVOR_INFRASTRUCTURE', 			5),
		('LEADER_NC_ZAZZAU', 	'FLAVOR_PRODUCTION', 				6),
		('LEADER_NC_ZAZZAU', 	'FLAVOR_GOLD', 						5),
		('LEADER_NC_ZAZZAU', 	'FLAVOR_SCIENCE', 					6),
		('LEADER_NC_ZAZZAU', 	'FLAVOR_CULTURE', 					4),
		('LEADER_NC_ZAZZAU', 	'FLAVOR_HAPPINESS', 				5),
		('LEADER_NC_ZAZZAU', 	'FLAVOR_GREAT_PEOPLE', 				3),
		('LEADER_NC_ZAZZAU', 	'FLAVOR_WONDER', 					4),
		('LEADER_NC_ZAZZAU', 	'FLAVOR_RELIGION', 					2),
		('LEADER_NC_ZAZZAU', 	'FLAVOR_DIPLOMACY', 				2),
		('LEADER_NC_ZAZZAU', 	'FLAVOR_SPACESHIP', 				2),
		('LEADER_NC_ZAZZAU', 	'FLAVOR_WATER_CONNECTION', 			2),
		('LEADER_NC_ZAZZAU', 	'FLAVOR_NUKE', 						6),
		('LEADER_NC_ZAZZAU', 	'FLAVOR_USE_NUKE', 					6),
		('LEADER_NC_ZAZZAU', 	'FLAVOR_ESPIONAGE', 				5),
		('LEADER_NC_ZAZZAU', 	'FLAVOR_AIRLIFT', 					5),
		('LEADER_NC_ZAZZAU', 	'FLAVOR_I_TRADE_DESTINATION', 		5),
		('LEADER_NC_ZAZZAU', 	'FLAVOR_I_TRADE_ORIGIN', 			8),
		('LEADER_NC_ZAZZAU', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
		('LEADER_NC_ZAZZAU', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
		('LEADER_NC_ZAZZAU', 	'FLAVOR_ARCHAEOLOGY', 				5),
		('LEADER_NC_ZAZZAU', 	'FLAVOR_AIR_CARRIER', 				5);
--------------------------------------------------------------------------------------------------------------------------
-- Diplomacy_Responses
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Diplomacy_Responses
		(LeaderType, 						ResponseType, 							 			Response, 																			Bias)
VALUES 	('LEADER_NC_ZAZZAU',	'RESPONSE_AI_DOF_BACKSTAB', 			 			'TXT_KEY_LEADER_NC_ZAZZAU_DENOUNCE_FRIEND%', 			 				500),
		('LEADER_NC_ZAZZAU',	'RESPONSE_ATTACKED_HOSTILE', 			 			'TXT_KEY_LEADER_NC_ZAZZAU_ATTACKED_HOSTILE%', 			 				500),
		('LEADER_NC_ZAZZAU',	'RESPONSE_ATTACKED_STRONG_HOSTILE', 				'TXT_KEY_LEADER_NC_ZAZZAU_ATTACKED_HOSTILE%', 			 				500),
		('LEADER_NC_ZAZZAU',	'RESPONSE_DEFEATED', 					 			'TXT_KEY_LEADER_NC_ZAZZAU_DEFEATED%', 					 				500),
		('LEADER_NC_ZAZZAU',	'RESPONSE_DOW_GENERIC', 				 			'TXT_KEY_LEADER_NC_ZAZZAU_DOW_GENERIC%', 				 				500),
		('LEADER_NC_ZAZZAU',	'RESPONSE_FIRST_GREETING', 				 			'TXT_KEY_LEADER_NC_ZAZZAU_FIRSTGREETING%', 				 			500),
		('LEADER_NC_ZAZZAU',	'RESPONSE_GREETING_HOSTILE_HELLO', 					'TXT_KEY_LEADER_NC_ZAZZAU_GREETING_HOSTILE_HELLO%', 		 			500),
		('LEADER_NC_ZAZZAU',	'RESPONSE_GREETING_NEUTRAL_HELLO', 					'TXT_KEY_LEADER_NC_ZAZZAU_GREETING_NEUTRAL_HELLO%', 		 			500),
		('LEADER_NC_ZAZZAU',	'RESPONSE_LUXURY_TRADE', 							'TXT_KEY_LEADER_NC_ZAZZAU_LUXURY_TRADE%', 		  						500),
		('LEADER_NC_ZAZZAU',	'RESPONSE_RESPONSE_TO_BEING_DENOUNCED',  			'TXT_KEY_LEADER_NC_ZAZZAU_RESPONSE_TO_BEING_DENOUNCED%',   			500),
		('LEADER_NC_ZAZZAU',	'RESPONSE_WORK_AGAINST_SOMEONE', 		 			'TXT_KEY_LEADER_NC_ZAZZAU_DENOUNCE%', 					  				500),
		('LEADER_NC_ZAZZAU',	'RESPONSE_PEACE_OFFER', 		 			'TXT_KEY_LEADER_NC_ZAZZAU_PEACE_OFFER%', 					  				500),
		('LEADER_NC_ZAZZAU',	'RESPONSE_TRADE_ACCEPT_GENEROUS', 		 			'TXT_KEY_LEADER_NC_ZAZZAU_TRADE_ACCEPT_GENEROUS%', 					  				500),
		('LEADER_NC_ZAZZAU',	'RESPONSE_TRADE_REJECT_INSULTING', 		 			'TXT_KEY_LEADER_NC_ZAZZAU_TRADE_REJECT_INSULTING%', 					  				500),
		('LEADER_NC_ZAZZAU',	'RESPONSE_TRADE_NO_DEAL_POSSIBLE', 		 			'TXT_KEY_LEADER_NC_ZAZZAU_TRADE_NO_DEAL_POSSIBLE%', 					  				500),
		('LEADER_NC_ZAZZAU',	'RESPONSE_INFLUENTIAL_ON_AI', 		 			'TXT_KEY_LEADER_NC_ZAZZAU_INFLUENTIAL_ON_AI%', 					  				500),
		('LEADER_NC_ZAZZAU',	'RESPONSE_INFLUENTIAL_ON_HUMAN', 		 			'TXT_KEY_LEADER_NC_ZAZZAU_INFLUENTIAL_ON_HUMAN%', 					  				500),
		('LEADER_NC_ZAZZAU',	'RESPONSE_WORK_WITH_US', 				 			'TXT_KEY_LEADER_NC_ZAZZAU_DEC_FRIENDSHIP%', 			  	  			500);
------------------------------------------------------------------------------------------------------------------------ 
-- Leader_Traits
------------------------------------------------------------------------------------------------------------------------ 
INSERT INTO Leader_Traits 
		(LeaderType, 						TraitType)
VALUES	('LEADER_NC_ZAZZAU',		'TRAIT_NC_ZAZZAU');
------------------------------------------------------------------------------------------------------------------------ 
-- Traits
------------------------------------------------------------------------------------------------------------------------ 
INSERT INTO Traits 
		(Type, 								Description, 							ShortDescription)
VALUES	('TRAIT_NC_ZAZZAU', 		'TXT_KEY_TRAIT_NC_ZAZZAU',	'TXT_KEY_TRAIT_NC_ZAZZAU_SHORT');
--=======================================================================================================================	
-- CIVILIZATIONS
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------ 
-- Civilizations
------------------------------------------------------------------------------------------------------------------------ 	
INSERT INTO Civilizations 	
		(Type, 									DerivativeCiv,						SoundtrackTag,  MapImage, 							DawnOfManQuote, 								DawnOfManImage,					Description,								ShortDescription,								Adjective,										Civilopedia,												CivilopediaTag,										DefaultPlayerColor,						ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas,							PortraitIndex,	AlphaIconAtlas)
SELECT	'CIVILIZATION_NC_ZAZZAU',	'TXT_KEY_CIV_TAL_NC_ZAZZAU_DESC',	'Venice', 		'zaz_smol.dds',	'TXT_KEY_CIV_DAWN_NC_ZAZZAU_TEXT',	'zazdom.dds',	'TXT_KEY_CIV_NC_ZAZZAU_DESC', 	'TXT_KEY_CIV_NC_ZAZZAU_SHORT_DESC',	'TXT_KEY_CIV_NC_ZAZZAU_ADJECTIVE',	'TXT_KEY_CIVILOPEDIA_CIVS_NC_ZAZZAU_TEXT_1',		'TXT_KEY_CIVILOPEDIA_CIVS_NC_ZAZZAU',	'PLAYERCOLOR_NC_ZAZZAU',		ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, 'NC_ZAZZAU_ICON_ATLAS',	0,				'NC_ZAZZAU_ALPHA_ATLAS'
FROM Civilizations WHERE Type = 'CIVILIZATION_SONGHAI';
------------------------------------------------------------------------------------------------------------------------ 
-- Civilization_CityNames
------------------------------------------------------------------------------------------------------------------------ 	
INSERT INTO Civilization_CityNames 
		(CivilizationType, 						CityName)
VALUES	('CIVILIZATION_NC_ZAZZAU',	'TXT_KEY_CITY_NAME_NC_ZAZZAU_01'),
		('CIVILIZATION_NC_ZAZZAU',	'TXT_KEY_CITY_NAME_NC_ZAZZAU_02'),
		('CIVILIZATION_NC_ZAZZAU',	'TXT_KEY_CITY_NAME_NC_ZAZZAU_03'),
		('CIVILIZATION_NC_ZAZZAU',	'TXT_KEY_CITY_NAME_NC_ZAZZAU_04'),
		('CIVILIZATION_NC_ZAZZAU',	'TXT_KEY_CITY_NAME_NC_ZAZZAU_05'),
		('CIVILIZATION_NC_ZAZZAU',	'TXT_KEY_CITY_NAME_NC_ZAZZAU_06'),
		('CIVILIZATION_NC_ZAZZAU',	'TXT_KEY_CITY_NAME_NC_ZAZZAU_07'),
		('CIVILIZATION_NC_ZAZZAU',	'TXT_KEY_CITY_NAME_NC_ZAZZAU_08'),
		('CIVILIZATION_NC_ZAZZAU',	'TXT_KEY_CITY_NAME_NC_ZAZZAU_09'),
		('CIVILIZATION_NC_ZAZZAU',	'TXT_KEY_CITY_NAME_NC_ZAZZAU_10'),
		('CIVILIZATION_NC_ZAZZAU',	'TXT_KEY_CITY_NAME_NC_ZAZZAU_11'),
		('CIVILIZATION_NC_ZAZZAU',	'TXT_KEY_CITY_NAME_NC_ZAZZAU_12'),
		('CIVILIZATION_NC_ZAZZAU',	'TXT_KEY_CITY_NAME_NC_ZAZZAU_13'),
		('CIVILIZATION_NC_ZAZZAU',	'TXT_KEY_CITY_NAME_NC_ZAZZAU_14'),
		('CIVILIZATION_NC_ZAZZAU',	'TXT_KEY_CITY_NAME_NC_ZAZZAU_15'),
		('CIVILIZATION_NC_ZAZZAU',	'TXT_KEY_CITY_NAME_NC_ZAZZAU_16'),
		('CIVILIZATION_NC_ZAZZAU',	'TXT_KEY_CITY_NAME_NC_ZAZZAU_17'),
		('CIVILIZATION_NC_ZAZZAU',	'TXT_KEY_CITY_NAME_NC_ZAZZAU_18'),
		('CIVILIZATION_NC_ZAZZAU',	'TXT_KEY_CITY_NAME_NC_ZAZZAU_19'),
		('CIVILIZATION_NC_ZAZZAU',	'TXT_KEY_CITY_NAME_NC_ZAZZAU_20'),
		('CIVILIZATION_NC_ZAZZAU',	'TXT_KEY_CITY_NAME_NC_ZAZZAU_21'),
		('CIVILIZATION_NC_ZAZZAU',	'TXT_KEY_CITY_NAME_NC_ZAZZAU_22'),
		('CIVILIZATION_NC_ZAZZAU',	'TXT_KEY_CITY_NAME_NC_ZAZZAU_23'),
		('CIVILIZATION_NC_ZAZZAU',	'TXT_KEY_CITY_NAME_NC_ZAZZAU_24'),
		('CIVILIZATION_NC_ZAZZAU',	'TXT_KEY_CITY_NAME_NC_ZAZZAU_25'),
		('CIVILIZATION_NC_ZAZZAU',	'TXT_KEY_CITY_NAME_NC_ZAZZAU_26'),
		('CIVILIZATION_NC_ZAZZAU',	'TXT_KEY_CITY_NAME_NC_ZAZZAU_27'),
		('CIVILIZATION_NC_ZAZZAU',	'TXT_KEY_CITY_NAME_NC_ZAZZAU_28'),
		('CIVILIZATION_NC_ZAZZAU',	'TXT_KEY_CITY_NAME_NC_ZAZZAU_29'),
		('CIVILIZATION_NC_ZAZZAU',	'TXT_KEY_CITY_NAME_NC_ZAZZAU_30'),
		('CIVILIZATION_NC_ZAZZAU',	'TXT_KEY_CITY_NAME_NC_ZAZZAU_31'),
		('CIVILIZATION_NC_ZAZZAU',	'TXT_KEY_CITY_NAME_NC_ZAZZAU_32'),
		('CIVILIZATION_NC_ZAZZAU',	'TXT_KEY_CITY_NAME_NC_ZAZZAU_33'),
		('CIVILIZATION_NC_ZAZZAU',	'TXT_KEY_CITY_NAME_NC_ZAZZAU_34'),
		('CIVILIZATION_NC_ZAZZAU',	'TXT_KEY_CITY_NAME_NC_ZAZZAU_35'),
		('CIVILIZATION_NC_ZAZZAU',	'TXT_KEY_CITY_NAME_NC_ZAZZAU_36'),
		('CIVILIZATION_NC_ZAZZAU',	'TXT_KEY_CITY_NAME_NC_ZAZZAU_37'),
		('CIVILIZATION_NC_ZAZZAU',	'TXT_KEY_CITY_NAME_NC_ZAZZAU_38'),
		('CIVILIZATION_NC_ZAZZAU',	'TXT_KEY_CITY_NAME_NC_ZAZZAU_39'),
		('CIVILIZATION_NC_ZAZZAU',	'TXT_KEY_CITY_NAME_NC_ZAZZAU_40'),
		('CIVILIZATION_NC_ZAZZAU',	'TXT_KEY_CITY_NAME_NC_ZAZZAU_41'),
		('CIVILIZATION_NC_ZAZZAU',	'TXT_KEY_CITY_NAME_NC_ZAZZAU_42'),
		('CIVILIZATION_NC_ZAZZAU',	'TXT_KEY_CITY_NAME_NC_ZAZZAU_43'),
		('CIVILIZATION_NC_ZAZZAU',	'TXT_KEY_CITY_NAME_NC_ZAZZAU_44'),
		('CIVILIZATION_NC_ZAZZAU',	'TXT_KEY_CITY_NAME_NC_ZAZZAU_45');
------------------------------------------------------------------------------------------------------------------------ 
-- Civilization_FreeBuildingClasses
------------------------------------------------------------------------------------------------------------------------ 		
INSERT INTO Civilization_FreeBuildingClasses 
		(CivilizationType, 						BuildingClassType)
SELECT	'CIVILIZATION_NC_ZAZZAU', 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE CivilizationType = 'CIVILIZATION_SONGHAI';
------------------------------------------------------------------------------------------------------------------------ 
-- Civilization_FreeTechs
------------------------------------------------------------------------------------------------------------------------ 	
INSERT INTO Civilization_FreeTechs 
		(CivilizationType, 						TechType)
SELECT	'CIVILIZATION_NC_ZAZZAU', 	TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_SONGHAI';
------------------------------------------------------------------------------------------------------------------------ 
-- Civilization_FreeUnits
------------------------------------------------------------------------------------------------------------------------ 	
INSERT INTO Civilization_FreeUnits 
		(CivilizationType, 						UnitClassType, Count, UnitAIType)
SELECT	'CIVILIZATION_NC_ZAZZAU', 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_SONGHAI';
------------------------------------------------------------------------------------------------------------------------ 
-- Civilization_Leaders
------------------------------------------------------------------------------------------------------------------------ 		
INSERT INTO Civilization_Leaders 
		(CivilizationType, 						LeaderheadType)
VALUES	('CIVILIZATION_NC_ZAZZAU',	'LEADER_NC_ZAZZAU');
------------------------------------------------------------------------------------------------------------------------ 
-- Civilization_BuildingClassOverrides 
------------------------------------------------------------------------------------------------------------------------ 	
INSERT INTO Civilization_BuildingClassOverrides 
		(CivilizationType, 						BuildingClassType, 			BuildingType)
VALUES	('CIVILIZATION_NC_ZAZZAU',	'BUILDINGCLASS_WALLS', 	'BUILDING_NC_GANUWAR');
------------------------------------------------------------------------------------------------------------------------ 
-- Civilization_UnitClassOverrides 
------------------------------------------------------------------------------------------------------------------------ 	
INSERT INTO Civilization_UnitClassOverrides 
		(CivilizationType, 						UnitClassType, 				UnitType)
VALUES	('CIVILIZATION_NC_ZAZZAU',	'UNITCLASS_KNIGHT', 	'UNIT_NC_YAN_LIFIDA');
------------------------------------------------------------------------------------------------------------------------ 
-- Civilization_Religions
------------------------------------------------------------------------------------------------------------------------ 	
INSERT INTO Civilization_Religions 
		(CivilizationType, 						ReligionType)
VALUES	('CIVILIZATION_NC_ZAZZAU',	'RELIGION_ISLAM');
------------------------------------------------------------------------------------------------------------------------ 
-- Civilization_SpyNames
------------------------------------------------------------------------------------------------------------------------ 	
INSERT INTO Civilization_SpyNames 
		(CivilizationType, 						SpyName)
VALUES	('CIVILIZATION_NC_ZAZZAU',	'TXT_KEY_SPY_NAME_NC_ZAZZAU_0'),	
		('CIVILIZATION_NC_ZAZZAU',	'TXT_KEY_SPY_NAME_NC_ZAZZAU_1'),
		('CIVILIZATION_NC_ZAZZAU',	'TXT_KEY_SPY_NAME_NC_ZAZZAU_2'),
		('CIVILIZATION_NC_ZAZZAU',	'TXT_KEY_SPY_NAME_NC_ZAZZAU_3'),
		('CIVILIZATION_NC_ZAZZAU',	'TXT_KEY_SPY_NAME_NC_ZAZZAU_4'),
		('CIVILIZATION_NC_ZAZZAU',	'TXT_KEY_SPY_NAME_NC_ZAZZAU_5'),
		('CIVILIZATION_NC_ZAZZAU',	'TXT_KEY_SPY_NAME_NC_ZAZZAU_6'),
		('CIVILIZATION_NC_ZAZZAU',	'TXT_KEY_SPY_NAME_NC_ZAZZAU_7'),
		('CIVILIZATION_NC_ZAZZAU',	'TXT_KEY_SPY_NAME_NC_ZAZZAU_8'),
		('CIVILIZATION_NC_ZAZZAU',	'TXT_KEY_SPY_NAME_NC_ZAZZAU_9');
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_Start_Region_Priority
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Civilization_Start_Region_Priority
		(CivilizationType, 							RegionType)
VALUES	('CIVILIZATION_NC_ZAZZAU',	'REGION_PLAINS');
--=======================================================================================================================
--=======================================================================================================================