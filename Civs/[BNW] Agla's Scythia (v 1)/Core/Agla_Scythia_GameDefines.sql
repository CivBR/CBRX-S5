
CREATE TABLE IF NOT EXISTS CustomModOptions(Name Text, Value INTEGER, Class INTEGER, DbUpdates INTEGER);
CREATE TABLE IF NOT EXISTS JFD_GlobalUserSettings (Type text, Value integer default 1);

INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('EVENTS_BARBARIANS', 1);

INSERT INTO BuildingClasses
		(Type, 										DefaultBuilding, 					 Description)
VALUES	('BUILDINGCLASS_AGLA_SCYTHIA', 	'BUILDING_AGLA_SCYTHIA',	 'TXT_KEY_BUILDING_AGLA_SCYTHIA');
	

-- Units
--------------------------------
INSERT INTO Units 	
		(Type, 						BaseCultureTurnsToCount,	GoldenAgeTurns,	OneShotTourism,	OneShotTourismPercentOthers, ShowInPedia,	Class, Cost, Moves, Capture, CivilianAttackPriority, Special, Domain, DefaultUnitAI,		Description, 				Civilopedia, 					Help, 							Strategy,																		AdvancedStartCost,	WorkRate, CombatLimit, FoundReligion, SpreadReligion, ReligionSpreads, ReligiousStrength, UnitArtInfoEraVariation,	UnitArtInfo, 				UnitFlagIconOffset,	UnitFlagAtlas,					MoveRate, PortraitIndex, IconAtlas)
SELECT	'UNIT_AGLA_ENAREE',			0,							0,				0,				0,							 1,		Class, Cost, Moves, Capture, CivilianAttackPriority, Special, Domain, DefaultUnitAI,		'TXT_KEY_UNIT_AGLA_ENAREE', 	'TXT_KEY_CIV5_AGLA_ENAREE_TEXT', 	'TXT_KEY_UNIT_AGLA_ENAREE_HELP',  'TXT_KEY_UNIT_AGLA_ENAREE_STRATEGY',	AdvancedStartCost, 	WorkRate, CombatLimit, FoundReligion, SpreadReligion, ReligionSpreads, ReligiousStrength, 0,						'ART_DEF_UNIT_AGLA_ENAREE',   0,					'AGLA_SCYTHIA_UNIT2_FLAG_ATLAS',	MoveRate, 2, 			 'AGLA_SCYTHIA_ICON_ATLAS'
FROM Units WHERE Type = 'UNIT_PROPHET';	
--------------------------------
-- UnitGameplay2DScripts
--------------------------------


INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 					SelectionSound, FirstSelectionSound)
SELECT	'UNIT_AGLA_ENAREE',		SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_PROPHET';
--------------------------------
-- Unit_AITypes
--------------------------------

INSERT INTO Unit_AITypes 	
		(UnitType, 					UnitAIType)
SELECT	'UNIT_AGLA_ENAREE', 			UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_PROPHET';
--------------------------------


INSERT INTO Unit_Flavors 	
		(UnitType, 					FlavorType, Flavor)
SELECT	'UNIT_AGLA_ENAREE', 			FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_PROPHET';
--------------------------------
-- Unit_FreePromotions
--------------------------------

INSERT INTO Unit_FreePromotions 	
		(UnitType, 					PromotionType)
SELECT	'UNIT_AGLA_ENAREE', 			PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_PROPHET';

INSERT OR REPLACE INTO BuildingClasses 
		(DefaultBuilding, 										Type, 													Description)
VALUES	('BUILDING_AGLA_WEED_PRIEST',				'BUILDINGCLASS_AGLA_WEED_PRIEST', 			'TXT_KEY_BUILDING_AGLA_WEED_PRIEST');


INSERT INTO Resources 
		(Type,						Description,						Civilopedia, 								ResourceClassType, 		Happiness,  AITradeModifier, 	ResourceUsage,	AIObjective,	'Unique', 	IconString, 				PortraitIndex, 	IconAtlas)
VALUES	('RESOURCE_AGLA_WEED',	'TXT_KEY_RESOURCE_AGLA_WEED',		'TXT_KEY_CIV5_RESOURCE_AGLA_WEED_TEXT',	'RESOURCECLASS_LUXURY',	    4,			10,					2, 				0, 				2, 			'[ICON_RES_AGLA_WEED]',	0, 				'AGLA_SCYTHIA_RES_ATLAS');		

INSERT INTO Buildings 
		(Type, 												BuildingClass,					Cost, 	FaithCost,	 			GreatWorkSlotType,	GreatWorkCount,	GoldMaintenance,	PrereqTech, NeverCapture,	Description, 												Help)
VALUES	('BUILDING_AGLA_WEED_PRIEST', 			'BUILDINGCLASS_AGLA_WEED_PRIEST',			-1, 	-1,			NULL,				-1,				0,					NULL,		1,				'TXT_KEY_BUILDING_AGLA_WEED_PRIEST',				'TXT_KEY_BUILDING_AGLA_WEED_PRIEST_HELP');

-------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_ResourceQuantity 	
		(BuildingType, 					ResourceType, 			 Quantity)
VALUES	('BUILDING_AGLA_WEED_PRIEST',	'RESOURCE_AGLA_WEED',  1);	

INSERT INTO Units 	
		(Type, 						Class, PrereqTech, Combat, RangedCombat, Cost,  FaithCost, RequiresFaithPurchaseEnabled, Moves, Range, CombatClass, Domain, DefaultUnitAI, MilitarySupport, MilitaryProduction, ObsoleteTech, Pillage, IgnoreBuildingDefense, GoodyHutUpgradeUnitClass, AdvancedStartCost, MinAreaSize, XPValueAttack, XPValueDefense, Conscription, MoveRate, Description, 						Help, 									 Strategy, 									 Civilopedia, 							UnitArtInfo, 						UnitFlagAtlas,								 UnitFlagIconOffset,	IconAtlas,								PortraitIndex)
SELECT	'UNIT_AGLA_SUCKERHONS',	Class, PrereqTech, Combat+6, RangedCombat+2, Cost,   	FaithCost, RequiresFaithPurchaseEnabled, Moves, Range, CombatClass, Domain, DefaultUnitAI, MilitarySupport, MilitaryProduction, ObsoleteTech, Pillage, IgnoreBuildingDefense, GoodyHutUpgradeUnitClass, AdvancedStartCost, MinAreaSize, XPValueAttack, XPValueDefense, Conscription, MoveRate, 'TXT_KEY_UNIT_AGLA_SUCKERHONS',	'TXT_KEY_UNIT_AGLA_SUCKERHONS_HELP', 	 'TXT_KEY_UNIT_AGLA_SUCKERHONS_STRATEGY',  'TXT_KEY_UNIT_AGLA_SUCKERHONS_TEXT',	'ART_DEF_UNIT_AGLA_SUCKERHONS',	'AGLA_SCYTHIA_UNIT_FLAG_ATLAS',  0,						'AGLA_SCYTHIA_ICON_ATLAS',	3
FROM Units WHERE Type = 'UNIT_CHARIOT_ARCHER';

INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 				SelectionSound, FirstSelectionSound)
SELECT	'UNIT_AGLA_SUCKERHONS', 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_CHARIOT_ARCHER';	
	
INSERT INTO Unit_AITypes 	
		(UnitType, 				UnitAIType)
SELECT	'UNIT_AGLA_SUCKERHONS', 	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_CHARIOT_ARCHER';	
		
INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 				UnitClassType)
SELECT	'UNIT_AGLA_SUCKERHONS', 	UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_CHARIOT_ARCHER';
	
INSERT INTO Unit_ResourceQuantityRequirements 	
		(UnitType, 				ResourceType)
SELECT	'UNIT_AGLA_SUCKERHONS', 	ResourceType
FROM Unit_ResourceQuantityRequirements WHERE UnitType = 'UNIT_CHARIOT_ARCHER';

INSERT INTO Unit_Flavors 	
		(UnitType, 				FlavorType, Flavor)
SELECT	'UNIT_AGLA_SUCKERHONS',	FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_CHARIOT_ARCHER';

INSERT INTO Unit_FreePromotions 	
		(UnitType, 				PromotionType)
SELECT	'UNIT_AGLA_SUCKERHONS',	PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_CHARIOT_ARCHER';

INSERT INTO Unit_FreePromotions 	
		(UnitType, 				PromotionType)
SELECT	'UNIT_AGLA_ENAREE',		PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_PROPHET';

INSERT INTO Unit_FreePromotions 
		(UnitType, 						PromotionType)
VALUES	('UNIT_AGLA_SUCKERHONS', 	'PROMOTION_AGLA_STEPPE_PROMO_1'),
		('UNIT_AGLA_ENAREE', 		'PROMOTION_AGLA_ENAREE');

INSERT INTO Unit_Builds 
		(UnitType,						BuildType)
SELECT 'UNIT_AGLA_ENAREE',				 BuildType
FROM Unit_Builds WHERE UnitType = 'UNIT_PROPHET';
		
INSERT INTO Leaders 
		(Type, 								Description, 							 Civilopedia, 									CivilopediaTag, 										ArtDefineTag, 						VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 							PortraitIndex)
VALUES	('LEADER_AGLA_SCYTHIA', 	'TXT_KEY_LEADER_AGLA_SCYTHIA',  'TXT_KEY_LEADER_AGLA_SCYTHIA_PEDIA', 	'TXT_KEY_CIVILOPEDIA_LEADERS_AGLA_SCYTHIA', 	'Ateas_Scene.xml', 					6, 						5, 						5, 							7, 			5, 				7, 				5, 						5, 				8, 			4, 			1, 				8, 			3, 			'AGLA_SCYTHIA_ICON_ATLAS',	1);
						
INSERT INTO Leader_MajorCivApproachBiases 
		(LeaderType, 						MajorCivApproachType, 				Bias)
VALUES	('LEADER_AGLA_SCYTHIA', 	'MAJOR_CIV_APPROACH_WAR', 			5),
		('LEADER_AGLA_SCYTHIA', 	'MAJOR_CIV_APPROACH_HOSTILE', 		5),
		('LEADER_AGLA_SCYTHIA', 	'MAJOR_CIV_APPROACH_DECEPTIVE', 	3),
		('LEADER_AGLA_SCYTHIA', 	'MAJOR_CIV_APPROACH_GUARDED', 		8),
		('LEADER_AGLA_SCYTHIA', 	'MAJOR_CIV_APPROACH_AFRAID', 		1),
		('LEADER_AGLA_SCYTHIA', 	'MAJOR_CIV_APPROACH_FRIENDLY', 		5),
		('LEADER_AGLA_SCYTHIA', 	'MAJOR_CIV_APPROACH_NEUTRAL', 		4);
						
INSERT INTO Leader_MinorCivApproachBiases 
		(LeaderType, 						MinorCivApproachType, 				Bias)
VALUES	('LEADER_AGLA_SCYTHIA', 	'MINOR_CIV_APPROACH_IGNORE', 		2),
		('LEADER_AGLA_SCYTHIA', 	'MINOR_CIV_APPROACH_FRIENDLY', 		6),
		('LEADER_AGLA_SCYTHIA', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	8),
		('LEADER_AGLA_SCYTHIA', 	'MINOR_CIV_APPROACH_CONQUEST', 		1),
		('LEADER_AGLA_SCYTHIA', 	'MINOR_CIV_APPROACH_BULLY', 		2);
						
INSERT INTO Leader_Flavors 
		(LeaderType, 						FlavorType, 						Flavor)
VALUES	('LEADER_AGLA_SCYTHIA', 	'FLAVOR_OFFENSE', 					8),
		('LEADER_AGLA_SCYTHIA', 	'FLAVOR_DEFENSE', 					8),
		('LEADER_AGLA_SCYTHIA', 	'FLAVOR_CITY_DEFENSE', 				9),
		('LEADER_AGLA_SCYTHIA', 	'FLAVOR_MILITARY_TRAINING', 		6),
		('LEADER_AGLA_SCYTHIA', 	'FLAVOR_RECON', 					6),
		('LEADER_AGLA_SCYTHIA', 	'FLAVOR_RANGED', 					2),
		('LEADER_AGLA_SCYTHIA', 	'FLAVOR_MOBILE', 					8),
		('LEADER_AGLA_SCYTHIA', 	'FLAVOR_NAVAL', 					4),
		('LEADER_AGLA_SCYTHIA', 	'FLAVOR_NAVAL_RECON', 				4),
		('LEADER_AGLA_SCYTHIA', 	'FLAVOR_NAVAL_GROWTH', 				3),
		('LEADER_AGLA_SCYTHIA', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	3),
		('LEADER_AGLA_SCYTHIA', 	'FLAVOR_AIR', 						3),
		('LEADER_AGLA_SCYTHIA', 	'FLAVOR_EXPANSION', 				6),
		('LEADER_AGLA_SCYTHIA', 	'FLAVOR_GROWTH', 					7),
		('LEADER_AGLA_SCYTHIA', 	'FLAVOR_TILE_IMPROVEMENT', 			6),
		('LEADER_AGLA_SCYTHIA', 	'FLAVOR_INFRASTRUCTURE', 			7),
		('LEADER_AGLA_SCYTHIA', 	'FLAVOR_PRODUCTION', 				6),
		('LEADER_AGLA_SCYTHIA', 	'FLAVOR_GOLD', 						5),
		('LEADER_AGLA_SCYTHIA', 	'FLAVOR_SCIENCE', 					5),
		('LEADER_AGLA_SCYTHIA', 	'FLAVOR_CULTURE', 					4),
		('LEADER_AGLA_SCYTHIA', 	'FLAVOR_HAPPINESS', 				4),
		('LEADER_AGLA_SCYTHIA', 	'FLAVOR_GREAT_PEOPLE', 				4),
		('LEADER_AGLA_SCYTHIA', 	'FLAVOR_WONDER', 					3),
		('LEADER_AGLA_SCYTHIA', 	'FLAVOR_RELIGION', 					8),
		('LEADER_AGLA_SCYTHIA', 	'FLAVOR_DIPLOMACY', 				5),
		('LEADER_AGLA_SCYTHIA', 	'FLAVOR_SPACESHIP', 				4),
		('LEADER_AGLA_SCYTHIA', 	'FLAVOR_WATER_CONNECTION', 			4),
		('LEADER_AGLA_SCYTHIA', 	'FLAVOR_NUKE', 						2),
		('LEADER_AGLA_SCYTHIA', 	'FLAVOR_USE_NUKE', 					2),
		('LEADER_AGLA_SCYTHIA', 	'FLAVOR_ESPIONAGE', 				6),
		('LEADER_AGLA_SCYTHIA', 	'FLAVOR_AIRLIFT', 					5),
		('LEADER_AGLA_SCYTHIA', 	'FLAVOR_I_TRADE_DESTINATION', 		5),
		('LEADER_AGLA_SCYTHIA', 	'FLAVOR_I_TRADE_ORIGIN', 			5),
		('LEADER_AGLA_SCYTHIA', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
		('LEADER_AGLA_SCYTHIA', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
		('LEADER_AGLA_SCYTHIA', 	'FLAVOR_ARCHAEOLOGY', 				5),
		('LEADER_AGLA_SCYTHIA', 	'FLAVOR_AIR_CARRIER', 				5);

					
INSERT INTO Leader_Traits 
		(LeaderType, 						TraitType)
VALUES	('LEADER_AGLA_SCYTHIA', 	'TRAIT_AGLA_SCYTHIA');

INSERT OR REPLACE INTO BuildingClasses 
		(DefaultBuilding, 										Type, 													Description)
VALUES	('BUILDING_SCYTHIAN_PLAINS',				'BUILDINGCLASS_SCYTHIAN_PLAINS', 			'TXT_KEY_BUILDING_SCYTHIAN_PLAINS');


INSERT INTO Buildings 
		(Type, 												BuildingClass,					Cost, 	FaithCost,	 			GreatWorkSlotType,	GreatWorkCount,	GoldMaintenance,	PrereqTech, NeverCapture,	Description, 												Help)
VALUES	('BUILDING_SCYTHIAN_PLAINS', 			'BUILDINGCLASS_SCYTHIAN_PLAINS',			-1, 	-1,			NULL,				-1,				0,					NULL,		1,				'TXT_KEY_BUILDING_SCYTHIAN_PLAINS',				'TXT_KEY_BUILDING_SCYTHIAN_PLAINS_HELP');

INSERT INTO Building_YieldChanges 	
		(BuildingType, 								YieldType,				Yield)
VALUES	('BUILDING_SCYTHIAN_PLAINS',	'YIELD_FAITH',		1);		


-- PROMOTIONS
--==========================================================================================================================	
INSERT INTO UnitPromotions 
		(Type,									Description,								Help,											PediaType,			PediaEntry,						MovesChange,		FreePillageMoves,	CannotBeChosen,	HeavyCharge,	AttackMod,	CombatPercent,	CanMoveAfterAttacking,	ExtraAttacks,	IconAtlas,			PortraitIndex) 
VALUES	('PROMOTION_AGLA_STEPPE_PROMO_1',		'TXT_KEY_PROMOTION_AGLA_STEPPE_PROMO_1',	'TXT_KEY_PROMOTION_AGLA_STEPPE_PROMO_1_HELP',	'PEDIA_ATTRIBUTES',	'TXT_KEY_PROMOTION_AGLA_STEPPE_PROMO_1', 1,	1,		1,				NULL,			NULL,		NULL,			NULL,					NULL,			'ABILITY_ATLAS',	59),
		('PROMOTION_AGLA_STEPPE_PROMO_2',		'TXT_KEY_PROMOTION_AGLA_STEPPE_PROMO_2',	'TXT_KEY_PROMOTION_AGLA_STEPPE_PROMO_2_HELP',	'PEDIA_ATTRIBUTES',	'TXT_KEY_PROMOTION_AGLA_STEPPE_PROMO_2', 1,	0,		1,				1,				NULL,		NULL,			NULL,					NULL,			'ABILITY_ATLAS',	59),
		('PROMOTION_AGLA_ENAREE',				'TXT_KEY_UNIT_AGLA_ENAREE',			'TXT_KEY_UNIT_AGLA_ENAREE_HELP',			'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_AGLA_ENAREE',		 0,	0,		1,				NULL,			NULL,		NULL,			NULL,					NULL,			'ABILITY_ATLAS',	59),
		('PROMOTION_AGLA_PROPHET_ENAREE',		'TXT_KEY_UNIT_AGLA_ENAREE',			'TXT_KEY_UNIT_AGLA_ENAREE_HELP',			'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_AGLA_ENAREE',		 0,	0,		1,				NULL,			NULL,		NULL,			NULL,					NULL,			'ABILITY_ATLAS',	59);

--------------------------------
-- UnitPromotions_UnitCombats
--------------------------------
INSERT INTO UnitPromotions_UnitCombats 
		(PromotionType,									UnitCombatType) 
VALUES	('PROMOTION_AGLA_STEPPE_PROMO_1',						'UNITCOMBAT_MOUNTED'),
		('PROMOTION_AGLA_STEPPE_PROMO_2',			'UNITCOMBAT_MOUNTED');

INSERT INTO Diplomacy_Responses
		(LeaderType, 						ResponseType, 							 Response, 																Bias)
VALUES 	('LEADER_AGLA_SCYTHIA',	'RESPONSE_AI_DOF_BACKSTAB', 			 'TXT_KEY_LEADER_AGLA_SCYTHIA_DENOUNCE_FRIEND%', 				500),
		('LEADER_AGLA_SCYTHIA',	'RESPONSE_ATTACKED_HOSTILE', 			 'TXT_KEY_LEADER_AGLA_SCYTHIA_ATTACKED_HOSTILE%', 				500),
		('LEADER_AGLA_SCYTHIA',	'RESPONSE_DEFEATED', 					 'TXT_KEY_LEADER_AGLA_SCYTHIA_DEFEATED%', 						500),
		('LEADER_AGLA_SCYTHIA',	'RESPONSE_DOW_GENERIC', 				 'TXT_KEY_LEADER_AGLA_SCYTHIA_DOW_GENERIC%', 					500),
		('LEADER_AGLA_SCYTHIA',	'RESPONSE_FIRST_GREETING', 				 'TXT_KEY_LEADER_AGLA_SCYTHIA_FIRSTGREETING%', 				500),
		('LEADER_AGLA_SCYTHIA',	'RESPONSE_RESPONSE_TO_BEING_DENOUNCED',  'TXT_KEY_LEADER_AGLA_SCYTHIA_RESPONSE_TO_BEING_DENOUNCED%',	500),
		('LEADER_AGLA_SCYTHIA',	'RESPONSE_WORK_AGAINST_SOMEONE', 		 'TXT_KEY_LEADER_AGLA_SCYTHIA_DENOUNCE%', 						500),
		('LEADER_AGLA_SCYTHIA',	'RESPONSE_WORK_WITH_US', 				 'TXT_KEY_LEADER_AGLA_SCYTHIA_DEC_FRIENDSHIP%', 				500);
		

INSERT INTO Traits 
		(Type, 								Description, 							ShortDescription)
VALUES	('TRAIT_AGLA_SCYTHIA', 	'TXT_KEY_TRAIT_AGLA_SCYTHIA', 	'TXT_KEY_TRAIT_AGLA_SCYTHIA_SHORT');	

		
INSERT INTO Civilizations 	
		(Type, 									 DerivativeCiv,							Description, 								ShortDescription, 									Adjective, 										Civilopedia, 									CivilopediaTag, 						DefaultPlayerColor, 					ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas, 							 PortraitIndex, 	AlphaIconAtlas, 						SoundtrackTag, 	MapImage, 							DawnOfManQuote, 							 	  DawnOfManImage)
SELECT	'CIVILIZATION_AGLA_SCYTHIA',	 'TXT_KEY_CIV_TAL_JFD_HUNGARY_DESC',	'TXT_KEY_CIV_AGLA_SCYTHIA_DESC',	'TXT_KEY_CIV_AGLA_SCYTHIA_SHORT_DESC',		'TXT_KEY_CIV_AGLA_SCYTHIA_ADJECTIVE',	'TXT_KEY_CIV5_AGLA_SCYTHIA_TEXT_1', 	'TXT_KEY_CIV5_AGLA_SCYTHIA',	'PLAYERCOLOR_AGLA_SCYTHIA', 	ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, 'AGLA_SCYTHIA_ICON_ATLAS',   0, 				'AGLA_SCYTHIA_ALPHA_ATLAS', 	'Poland', 		'Agla_Map_Ateas.dds',    'TXT_KEY_CIV5_DAWN_AGLA_SCYTHIA_TEXT',   'Ateas_DOM.dds'
FROM Civilizations WHERE Type = 'CIVILIZATION_POLAND';
	
INSERT INTO Civilization_CityNames 
		(CivilizationType, 						CityName)
VALUES	('CIVILIZATION_AGLA_SCYTHIA', 	'TXT_KEY_CITY_NAME_AGLA_SCYTHIA_01'),
		('CIVILIZATION_AGLA_SCYTHIA', 	'TXT_KEY_CITY_NAME_AGLA_SCYTHIA_02'),
		('CIVILIZATION_AGLA_SCYTHIA', 	'TXT_KEY_CITY_NAME_AGLA_SCYTHIA_03'),
		('CIVILIZATION_AGLA_SCYTHIA', 	'TXT_KEY_CITY_NAME_AGLA_SCYTHIA_04'),
		('CIVILIZATION_AGLA_SCYTHIA', 	'TXT_KEY_CITY_NAME_AGLA_SCYTHIA_05'),
		('CIVILIZATION_AGLA_SCYTHIA', 	'TXT_KEY_CITY_NAME_AGLA_SCYTHIA_06'),
		('CIVILIZATION_AGLA_SCYTHIA', 	'TXT_KEY_CITY_NAME_AGLA_SCYTHIA_07'),
		('CIVILIZATION_AGLA_SCYTHIA', 	'TXT_KEY_CITY_NAME_AGLA_SCYTHIA_08'),
		('CIVILIZATION_AGLA_SCYTHIA', 	'TXT_KEY_CITY_NAME_AGLA_SCYTHIA_09'),
		('CIVILIZATION_AGLA_SCYTHIA', 	'TXT_KEY_CITY_NAME_AGLA_SCYTHIA_10'),
		('CIVILIZATION_AGLA_SCYTHIA', 	'TXT_KEY_CITY_NAME_AGLA_SCYTHIA_11'),
		('CIVILIZATION_AGLA_SCYTHIA', 	'TXT_KEY_CITY_NAME_AGLA_SCYTHIA_12'),
		('CIVILIZATION_AGLA_SCYTHIA', 	'TXT_KEY_CITY_NAME_AGLA_SCYTHIA_13'),
		('CIVILIZATION_AGLA_SCYTHIA', 	'TXT_KEY_CITY_NAME_AGLA_SCYTHIA_14'),
		('CIVILIZATION_AGLA_SCYTHIA', 	'TXT_KEY_CITY_NAME_AGLA_SCYTHIA_15'),
		('CIVILIZATION_AGLA_SCYTHIA', 	'TXT_KEY_CITY_NAME_AGLA_SCYTHIA_16'),
		('CIVILIZATION_AGLA_SCYTHIA', 	'TXT_KEY_CITY_NAME_AGLA_SCYTHIA_17'),
		('CIVILIZATION_AGLA_SCYTHIA', 	'TXT_KEY_CITY_NAME_AGLA_SCYTHIA_18'),
		('CIVILIZATION_AGLA_SCYTHIA', 	'TXT_KEY_CITY_NAME_AGLA_SCYTHIA_19'),
		('CIVILIZATION_AGLA_SCYTHIA', 	'TXT_KEY_CITY_NAME_AGLA_SCYTHIA_20');
			
INSERT INTO Civilization_FreeBuildingClasses 
		(CivilizationType, 						BuildingClassType)
SELECT	'CIVILIZATION_AGLA_SCYTHIA',	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE CivilizationType = 'CIVILIZATION_POLAND';
		
INSERT INTO Civilization_FreeTechs 
		(CivilizationType, 						TechType)
SELECT	'CIVILIZATION_AGLA_SCYTHIA',	TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_POLAND';
		
INSERT INTO Civilization_FreeUnits 
		(CivilizationType, 						UnitClassType, Count, UnitAIType)
SELECT	'CIVILIZATION_AGLA_SCYTHIA',	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_POLAND';
			
INSERT INTO Civilization_Leaders 
		(CivilizationType, 						LeaderheadType)
VALUES	('CIVILIZATION_AGLA_SCYTHIA',	'LEADER_AGLA_SCYTHIA');
	
INSERT INTO Civilization_UnitClassOverrides 
		(CivilizationType, 						UnitClassType, 				UnitType)
VALUES	('CIVILIZATION_AGLA_SCYTHIA',	'UNITCLASS_CHARIOT_ARCHER', 		'UNIT_AGLA_SUCKERHONS'),
		('CIVILIZATION_AGLA_SCYTHIA',	'UNITCLASS_PROPHET', 		'UNIT_AGLA_ENAREE');
	
INSERT INTO Civilization_Religions 
		(CivilizationType, 						ReligionType)
VALUES	('CIVILIZATION_AGLA_SCYTHIA', 	'RELIGION_CHRISTIANITY');					
	
INSERT INTO Civilization_SpyNames 
		(CivilizationType, 						SpyName)
VALUES	('CIVILIZATION_AGLA_SCYTHIA', 	'TXT_KEY_SPY_NAME_AGLA_SCYTHIA_0'),	
		('CIVILIZATION_AGLA_SCYTHIA', 	'TXT_KEY_SPY_NAME_AGLA_SCYTHIA_1'),
		('CIVILIZATION_AGLA_SCYTHIA', 	'TXT_KEY_SPY_NAME_AGLA_SCYTHIA_2'),
		('CIVILIZATION_AGLA_SCYTHIA', 	'TXT_KEY_SPY_NAME_AGLA_SCYTHIA_3'),
		('CIVILIZATION_AGLA_SCYTHIA', 	'TXT_KEY_SPY_NAME_AGLA_SCYTHIA_4'),
		('CIVILIZATION_AGLA_SCYTHIA', 	'TXT_KEY_SPY_NAME_AGLA_SCYTHIA_5'),
		('CIVILIZATION_AGLA_SCYTHIA', 	'TXT_KEY_SPY_NAME_AGLA_SCYTHIA_6'),
		('CIVILIZATION_AGLA_SCYTHIA', 	'TXT_KEY_SPY_NAME_AGLA_SCYTHIA_7'),
		('CIVILIZATION_AGLA_SCYTHIA', 	'TXT_KEY_SPY_NAME_AGLA_SCYTHIA_8'),
		('CIVILIZATION_AGLA_SCYTHIA', 	'TXT_KEY_SPY_NAME_AGLA_SCYTHIA_9');
