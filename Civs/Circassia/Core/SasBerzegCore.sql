--------------------------------------------------------------------------------------------------------------------------
-- Units
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Units 	
		(Type, 					Class,	CombatClass, PrereqTech, Cost, Combat, RangedCombat, Range, FaithCost, RequiresFaithPurchaseEnabled, Pillage, Moves, CivilianAttackPriority, Special, Domain, DefaultUnitAI,	Description, 			 Help, 							 Strategy, 							Civilopedia, 					ShowInPedia, OneShotTourism, OneShotTourismPercentOthers, AdvancedStartCost, WorkRate, ObsoleteTech, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, CombatLimit,  GoldenAgeTurns,  XPValueAttack, XPValueDefense, Conscription, MoveRate, UnitArtInfo, 			 UnitFlagAtlas, 				UnitFlagIconOffset, IconAtlas,					PortraitIndex)
SELECT	'UNIT_SAS_DZHIGIT',		Class,	CombatClass, PrereqTech, Cost, Combat, RangedCombat, Range, FaithCost, RequiresFaithPurchaseEnabled, Pillage, Moves, CivilianAttackPriority, Special, Domain, DefaultUnitAI,	'TXT_KEY_UNIT_SAS_DZHIGIT', 'TXT_KEY_UNIT_SAS_DZHIGIT_HELP', 	 'TXT_KEY_UNIT_SAS_DZHIGIT_STRATEGY',  'TXT_KEY_CIVILOPEDIA_SAS_DZHIGIT_TEXT',	ShowInPedia, OneShotTourism, OneShotTourismPercentOthers, AdvancedStartCost, WorkRate, ObsoleteTech, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, CombatLimit,  GoldenAgeTurns,  XPValueAttack, XPValueDefense, Conscription, MoveRate, 'ART_DEF_UNIT_SAS_DZHIGIT',	 'SAS_DZHIGIT_FLAG',	0,					'SAS_BERZEG_ICON_ATLAS',	2
FROM Units WHERE Type = 'UNIT_CAVALRY';   	
--------------------------------------------------------------------------------------------------------------------------
-- UnitGameplay2DScripts
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 				SelectionSound, FirstSelectionSound)
SELECT	'UNIT_SAS_DZHIGIT',		SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_CAVALRY';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_ResourceQuantityRequirements
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_ResourceQuantityRequirements
		(UnitType, 				ResourceType, Cost)
SELECT	'UNIT_SAS_DZHIGIT',	ResourceType, Cost
FROM Unit_ResourceQuantityRequirements WHERE UnitType = 'UNIT_CAVALRY';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_AITypes
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_AITypes 	
		(UnitType, 				UnitAIType)
SELECT	'UNIT_SAS_DZHIGIT',		UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_CAVALRY';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_Flavors
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_Flavors 	
		(UnitType, 				FlavorType, Flavor)
SELECT	'UNIT_SAS_DZHIGIT',		FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_CAVALRY';
------------------------------------------------------------------------------------------------------------------------
-- Unit_ClassUpgrades
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 				UnitClassType)
SELECT	'UNIT_SAS_DZHIGIT',		UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_CAVALRY';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_FreePromotions
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_FreePromotions 	
		(UnitType, 				PromotionType)
SELECT	'UNIT_SAS_DZHIGIT',		PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_CAVALRY';

INSERT INTO Unit_FreePromotions 	
			(UnitType, 				 PromotionType)
VALUES		('UNIT_SAS_DZHIGIT', 'PROMOTION_SAS_CIRCASSIANLION');

INSERT INTO UnitPromotions 
		(Type, 						Description, 						Help, 									Sound,	RangedSupportFire, 				CannotBeChosen, IconAtlas,  PortraitIndex,			PediaType, 			PediaEntry)
VALUES	('PROMOTION_SAS_CIRCASSIANLION',	'TXT_KEY_PROMOTION_SAS_CIRCASSIANLION',	'TXT_KEY_PROMOTION_SAS_CIRCASSIANLION_HELP',	'AS2D_IF_LEVELUP',	1, 	1,	'ABILITY_ATLAS', 				59,	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_SAS_CIRCASSIANLION_HELP');

INSERT INTO UnitPromotions 
		(Type, 						Description, 						Help, 									Sound,	HillsDoubleMove,	CanMoveImpassable,	HoveringUnit, 				CannotBeChosen, IconAtlas,  PortraitIndex,			PediaType, 			PediaEntry)
VALUES	('PROMOTION_SAS_CIRCASSIA_MOVEMENT',	'TXT_KEY_PROMOTION_SAS_CIRCASSIA_MOVEMENT',	'TXT_KEY_PROMOTION_SAS_CIRCASSIA_MOVEMENT_HELP',	'AS2D_IF_LEVELUP',	1,	1,	1, 	1,	'ABILITY_ATLAS', 				59,	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_SAS_CIRCASSIA_MOVEMENT_HELP');

INSERT INTO Unit_YieldFromKills
		(UnitType, 						YieldType, 						 Yield)
VALUES	('UNIT_SAS_DZHIGIT',  'YIELD_FAITH',	 '50');

--==========================================================================================================================	
-- UNIT CLASSES
--==========================================================================================================================	
-- UnitClasses
------------------------------
INSERT INTO UnitClasses 
		(Type)
VALUES	('UNITCLASS_SAS_CIRCASSIAN_ANNEXER');

INSERT INTO Units 	
		(Type, 						Class,	Special, Combat,	CanBuyCityState,	Cost, FaithCost, RequiresFaithPurchaseEnabled, CivilianAttackPriority, Moves, CombatClass, Domain, DefaultUnitAI,	Description, 				Civilopedia, 					Strategy, 							Help, 							WorkRate, AdvancedStartCost, GoodyHutUpgradeUnitClass, CombatLimit, ObsoleteTech, XPValueDefense, DontShowYields, UnitArtInfoEraVariation,	UnitArtInfo, 					UnitFlagIconOffset, UnitFlagAtlas,				PortraitIndex, 	IconAtlas,				MoveRate)
SELECT	'UNIT_SAS_CIRCASSIAN_ANNEXER',			'UNITCLASS_SAS_CIRCASSIAN_ANNEXER',	Special, Combat,	1,	Cost, FaithCost, RequiresFaithPurchaseEnabled, CivilianAttackPriority, Moves, CombatClass, Domain, DefaultUnitAI,	Description,	'TXT_KEY_CIV5_SAS_CIRCASSIAN_ANNEXER_TEXT', 	'TXT_KEY_UNIT_SAS_CIRCASSIAN_ANNEXER_STRATEGY', 	'TXT_KEY_UNIT_SAS_CIRCASSIAN_ANNEXER_HELP', 	WorkRate,	AdvancedStartCost, GoodyHutUpgradeUnitClass, CombatLimit, ObsoleteTech, XPValueDefense, DontShowYields, UnitFlagIconOffset,							UnitFlagAtlas,		0,					'SAS_DZHIGIT_FLAG',	0, 				'SAS_BERZEG_ICON_ATLAS',	MoveRate
FROM Units WHERE Type = 'UNIT_PROPHET';	
--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
--------------------------------------------------------------------------------------------------------------------------
-- Buildings
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Buildings 	
		(Type, 							BuildingClass, Cost,  GoldMaintenance,	Defense,	ExtraCityHitPoints,	CityWall,	AllowsRangeStrike,	PrereqTech, Description,								Help,											Strategy,											Civilopedia,								  ArtDefineTag, MinAreaSize, DisplayPosition, HurryCostModifier, ConquestProb, NeverCapture, FreeStartEra, IconAtlas,				PortraitIndex)
SELECT	'BUILDING_SAS_AUL',	BuildingClass, Cost,  GoldMaintenance,	Defense,	ExtraCityHitPoints,	CityWall,	AllowsRangeStrike,	PrereqTech, 'TXT_KEY_BUILDING_SAS_AUL',	'TXT_KEY_BUILDING_SAS_AUL_HELP', 	'TXT_KEY_BUILDING_SAS_AUL_HELP', 	'TXT_KEY_BUILDING_SAS_AUL_PEDIA',   ArtDefineTag, MinAreaSize, DisplayPosition, HurryCostModifier, '0', 1, FreeStartEra, 'SAS_BERZEG_ICON_ATLAS',	3
FROM Buildings WHERE Type = 'BUILDING_WALLS';
--------------------------------------------------------------------------------------------------------------------------
-- Building_YieldChanges
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_YieldChanges 		
		(BuildingType, 					YieldType, Yield)
SELECT	'BUILDING_SAS_AUL',	YieldType, Yield
FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_WALLS';
--------------------------------------------------------------------------------------------------------------------------
-- Building_YieldModifiers
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_YieldModifiers 		
		(BuildingType, 					YieldType, Yield)
SELECT	'BUILDING_SAS_AUL',	YieldType, Yield
FROM Building_YieldModifiers WHERE BuildingType = 'BUILDING_WALLS';
--------------------------------------------------------------------------------------------------------------------------
-- Building_ResourceYieldChanges
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_ResourceYieldChanges 		
		(BuildingType, 					ResourceType, YieldType, Yield)
SELECT	'BUILDING_SAS_AUL',	ResourceType, YieldType, Yield
FROM Building_ResourceYieldChanges WHERE BuildingType = 'BUILDING_WALLS';
--------------------------------------------------------------------------------------------------------------------------
-- Building_Flavors
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_Flavors 		
		(BuildingType, 					FlavorType, Flavor)
SELECT	'BUILDING_SAS_AUL',	FlavorType, Flavor
FROM Building_Flavors WHERE BuildingType = 'BUILDING_WALLS';

INSERT INTO BuildingClasses 	
		(Type, 						 	 		DefaultBuilding, 				Description,	NoLimit)
VALUES	('BUILDINGCLASS_SAS_CIRCASSIA_FAITH',	'BUILDING_SAS_CIRCASSIA_FAITH',	'TXT_KEY_BUILDING_SAS_CIRCASSIA_FAITH',	1);

INSERT INTO Buildings 	
		(Type, 								 BuildingClass, 							GreatWorkCount, Cost,	FaithCost,	ConquestProb,	NukeImmune,	PrereqTech,	NeverCapture,	Description, 						Help)
VALUES	('BUILDING_SAS_CIRCASSIA_FAITH',	 'BUILDINGCLASS_SAS_CIRCASSIA_FAITH',		-1, 			-1,		-1,	0,	1,	null,		1,				'TXT_KEY_BUILDING_SAS_CIRCASSIA_FAITH',	'TXT_KEY_BUILDING_SAS_CIRCASSIA_FAITH');
--==========================================================================================================================	
-- Building_TerrainYieldChanges
--==========================================================================================================================	
INSERT INTO Building_YieldChanges
			(BuildingType, 				YieldType, 			Yield)
VALUES		('BUILDING_SAS_CIRCASSIA_FAITH',	'YIELD_FAITH',		1);

INSERT INTO BuildingClasses 	
		(Type, 						 	 		DefaultBuilding, 				Description,	NoLimit)
VALUES	('BUILDINGCLASS_SAS_CIRCASSIA_CITY_HP',	'BUILDING_SAS_CIRCASSIA_CITY_HP',	'TXT_KEY_BUILDING_SAS_CIRCASSIA_CITY_HP',	1);

INSERT INTO Buildings 	
		(Type, 								 BuildingClass,	ExtraCityHitPoints,	Defense, 							GreatWorkCount, Cost,	FaithCost,	ConquestProb,	NukeImmune,	PrereqTech,	NeverCapture,	Description, 						Help)
VALUES	('BUILDING_SAS_CIRCASSIA_CITY_HP',	 'BUILDINGCLASS_SAS_CIRCASSIA_CITY_HP',	'10',	'100',		-1, 			-1,		-1,	0,	1,	null,		1,				'TXT_KEY_BUILDING_SAS_CIRCASSIA_CITY_HP',	'TXT_KEY_BUILDING_SAS_CIRCASSIA_CITY_HP');

--==========================================================================================================================	
-- LEADERS
--==========================================================================================================================	
----------------------------------------------------------------------------------------------------------------------------
-- Leaders
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Leaders 
		(Type, 							 Description, 							 Civilopedia, 								CivilopediaTag, 	ArtDefineTag, 								VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 						PortraitIndex)
VALUES	('LEADER_SAS_BERZEG',	 'TXT_KEY_LEADER_SAS_BERZEG',	'TXT_KEY_LEADER_SAS_BERZEG_PEDIA',	'TXT_KEY_CIVILOPEDIA_LEADERS_SAS_BERZEG',	'Sas_Berzeg_Scene.xml',						8, 						4, 						10, 							8, 			6, 				5, 				6, 						7, 				9, 			6, 			2, 				5, 			5, 			'SAS_BERZEG_ICON_ATLAS', 1);
--------------------------------------------------------------------------------------------------------------------------		
-- Leader_MajorCivApproachBiases
--------------------------------------------------------------------------------------------------------------------------						
INSERT INTO Leader_MajorCivApproachBiases 
		(LeaderType, 					 MajorCivApproachType, 				Bias)
VALUES	('LEADER_SAS_BERZEG',	'MAJOR_CIV_APPROACH_WAR', 			5),
		('LEADER_SAS_BERZEG',	'MAJOR_CIV_APPROACH_HOSTILE', 		4),
		('LEADER_SAS_BERZEG',	'MAJOR_CIV_APPROACH_DECEPTIVE', 	5),
		('LEADER_SAS_BERZEG',	'MAJOR_CIV_APPROACH_GUARDED', 		7),
		('LEADER_SAS_BERZEG',	'MAJOR_CIV_APPROACH_AFRAID', 		3),
		('LEADER_SAS_BERZEG',	'MAJOR_CIV_APPROACH_FRIENDLY', 		6),
		('LEADER_SAS_BERZEG',	'MAJOR_CIV_APPROACH_NEUTRAL', 		8);
--------------------------------------------------------------------------------------------------------------------------	
-- Leader_MajorCivApproachBiases
--------------------------------------------------------------------------------------------------------------------------							
INSERT INTO Leader_MinorCivApproachBiases 
		(LeaderType, 					 MinorCivApproachType, 				Bias)
VALUES	('LEADER_SAS_BERZEG',	'MINOR_CIV_APPROACH_IGNORE', 		5),
		('LEADER_SAS_BERZEG',	'MINOR_CIV_APPROACH_FRIENDLY', 		9),
		('LEADER_SAS_BERZEG',	'MINOR_CIV_APPROACH_PROTECTIVE', 	9),
		('LEADER_SAS_BERZEG',	'MINOR_CIV_APPROACH_CONQUEST', 		3),
		('LEADER_SAS_BERZEG',	'MINOR_CIV_APPROACH_BULLY', 		5);
--------------------------------------------------------------------------------------------------------------------------	
-- Leader_Flavors
--------------------------------------------------------------------------------------------------------------------------							
INSERT INTO Leader_Flavors 
		(LeaderType, 					 FlavorType, 						Flavor)
VALUES	('LEADER_SAS_BERZEG',	'FLAVOR_OFFENSE', 					7),
		('LEADER_SAS_BERZEG',	'FLAVOR_DEFENSE', 					9),
		('LEADER_SAS_BERZEG',	'FLAVOR_CITY_DEFENSE', 				7),
		('LEADER_SAS_BERZEG',	'FLAVOR_MILITARY_TRAINING', 		5),
		('LEADER_SAS_BERZEG',	'FLAVOR_RECON', 					5),
		('LEADER_SAS_BERZEG',	'FLAVOR_RANGED', 					7),
		('LEADER_SAS_BERZEG',	'FLAVOR_MOBILE', 					8),
		('LEADER_SAS_BERZEG',	'FLAVOR_NAVAL', 					7),
		('LEADER_SAS_BERZEG',	'FLAVOR_NAVAL_RECON', 				6),
		('LEADER_SAS_BERZEG',	'FLAVOR_NAVAL_GROWTH', 				5),
		('LEADER_SAS_BERZEG',	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	6),
		('LEADER_SAS_BERZEG',	'FLAVOR_AIR', 						9),
		('LEADER_SAS_BERZEG',	'FLAVOR_EXPANSION', 				8),
		('LEADER_SAS_BERZEG',	'FLAVOR_GROWTH', 					7),
		('LEADER_SAS_BERZEG',	'FLAVOR_TILE_IMPROVEMENT', 			7),
		('LEADER_SAS_BERZEG',	'FLAVOR_INFRASTRUCTURE', 			6),
		('LEADER_SAS_BERZEG',	'FLAVOR_PRODUCTION', 				6),
		('LEADER_SAS_BERZEG',	'FLAVOR_GOLD', 						6),
		('LEADER_SAS_BERZEG',	'FLAVOR_SCIENCE', 					7),
		('LEADER_SAS_BERZEG',	'FLAVOR_CULTURE', 					6),
		('LEADER_SAS_BERZEG',	'FLAVOR_HAPPINESS', 				6),
		('LEADER_SAS_BERZEG',	'FLAVOR_GREAT_PEOPLE', 				6),
		('LEADER_SAS_BERZEG',	'FLAVOR_WONDER', 					4),
		('LEADER_SAS_BERZEG',	'FLAVOR_RELIGION', 					9),
		('LEADER_SAS_BERZEG',	'FLAVOR_DIPLOMACY', 				8),
		('LEADER_SAS_BERZEG',	'FLAVOR_SPACESHIP', 				6),
		('LEADER_SAS_BERZEG',	'FLAVOR_WATER_CONNECTION', 			7),
		('LEADER_SAS_BERZEG',	'FLAVOR_NUKE', 						8),
		('LEADER_SAS_BERZEG',	'FLAVOR_USE_NUKE', 					7),
		('LEADER_SAS_BERZEG',	'FLAVOR_ESPIONAGE', 				6),
		('LEADER_SAS_BERZEG',	'FLAVOR_AIRLIFT', 					8),
		('LEADER_SAS_BERZEG',	'FLAVOR_I_TRADE_DESTINATION', 		6),
		('LEADER_SAS_BERZEG',	'FLAVOR_I_TRADE_ORIGIN', 			9),
		('LEADER_SAS_BERZEG',	'FLAVOR_I_SEA_TRADE_ROUTE', 		8),
		('LEADER_SAS_BERZEG',	'FLAVOR_I_LAND_TRADE_ROUTE', 		8),
		('LEADER_SAS_BERZEG',	'FLAVOR_ARCHAEOLOGY', 				4),
		('LEADER_SAS_BERZEG',	'FLAVOR_AIR_CARRIER', 				3);
--------------------------------------------------------------------------------------------------------------------------	
-- Leader_Traits
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Leader_Traits 
		(LeaderType, 					TraitType)
VALUES	('LEADER_SAS_BERZEG',	'TRAIT_SAS_BERZEG');
--==========================================================================================================================	
-- TRAITS
--==========================================================================================================================	
----------------------------------------------------------------------------------------------------------------------------
-- Traits
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Traits 
		(Type, 						 Description, 						 ShortDescription)
VALUES	('TRAIT_SAS_BERZEG',  'TXT_KEY_TRAIT_SAS_BERZEG',	 'TXT_KEY_TRAIT_SAS_BERZEG_SHORT');

-- ======================================================================================================
-- DIPLOMACY
-- ======================================================================================================
INSERT INTO Diplomacy_Responses
		(LeaderType,			ResponseType,							Response,													Bias)
VALUES	('LEADER_SAS_BERZEG',	'RESPONSE_FIRST_GREETING',				'TXT_KEY_LEADER_SAS_BERZEG_FIRSTGREETING%',					500),
		('LEADER_SAS_BERZEG',	'RESPONSE_DEFEATED',					'TXT_KEY_LEADER_SAS_BERZEG_DEFEATED%',						500),
		('LEADER_SAS_BERZEG',	'RESPONSE_AI_DOF_BACKSTAB',				'TXT_KEY_LEADER_SAS_BERZEG_DENOUNCE_FRIEND%',				500),
		('LEADER_SAS_BERZEG',	'RESPONSE_ATTACKED_HOSTILE',			'TXT_KEY_LEADER_SAS_BERZEG_ATTACKED_HOSTILE%',				500),
        ('LEADER_SAS_BERZEG',	'RESPONSE_DOW_GENERIC',					'TXT_KEY_LEADER_SAS_BERZEG_DOW_GENERIC%',					500),
        ('LEADER_SAS_BERZEG',	'RESPONSE_RESPONSE_TO_BEING_DENOUNCED',	'TXT_KEY_LEADER_SAS_BERZEG_RESPONSE_TO_BEING_DENOUNCED%',	500),
        ('LEADER_SAS_BERZEG',	'RESPONSE_WORK_AGAINST_SOMEONE',		'TXT_KEY_LEADER_SAS_BERZEG_DENOUNCE%',						500),
        ('LEADER_SAS_BERZEG',	'RESPONSE_WORK_WITH_US',				'TXT_KEY_LEADER_SAS_BERZEG_DEC_FRIENDSHIP%',				500);
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
SELECT	'CIVILIZATION_SAS_BERZEG',		SoundtrackTag, 		'SasBerzeg412.dds',		'TXT_KEY_CIV_DAWN_SAS_BERZEG_TEXT',	'Sas_Berzeg_DOM.dds',	'TXT_KEY_CIV_SAS_BERZEG_DESC', 	'TXT_KEY_CIV_SAS_BERZEG_SHORT_DESC',	'TXT_KEY_CIV_SAS_BERZEG_ADJECTIVE',	'TXT_KEY_CIV5_SAS_BERZEG_HEADING_1',		'TXT_KEY_CIV5_SAS_BERZEG',		'PLAYERCOLOR_SAS_BERZEG',	ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, 'SAS_BERZEG_ICON_ATLAS',	0,				'SAS_BERZEG_ALPHA_ATLAS'
FROM Civilizations WHERE Type = 'CIVILIZATION_OTTOMAN';
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_SpyNames
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilization_SpyNames 
		(CivilizationType, 					SpyName)
VALUES	('CIVILIZATION_SAS_BERZEG',	'TXT_KEY_SPY_NAME_CIV_SAS_BERZEG_0'),
		('CIVILIZATION_SAS_BERZEG',	'TXT_KEY_SPY_NAME_CIV_SAS_BERZEG_1'),
		('CIVILIZATION_SAS_BERZEG',	'TXT_KEY_SPY_NAME_CIV_SAS_BERZEG_2'),
		('CIVILIZATION_SAS_BERZEG',	'TXT_KEY_SPY_NAME_CIV_SAS_BERZEG_3'),
		('CIVILIZATION_SAS_BERZEG',	'TXT_KEY_SPY_NAME_CIV_SAS_BERZEG_4'),
		('CIVILIZATION_SAS_BERZEG',	'TXT_KEY_SPY_NAME_CIV_SAS_BERZEG_5'),
		('CIVILIZATION_SAS_BERZEG',	'TXT_KEY_SPY_NAME_CIV_SAS_BERZEG_6'),
		('CIVILIZATION_SAS_BERZEG',	'TXT_KEY_SPY_NAME_CIV_SAS_BERZEG_7'),
		('CIVILIZATION_SAS_BERZEG',	'TXT_KEY_SPY_NAME_CIV_SAS_BERZEG_8'),
		('CIVILIZATION_SAS_BERZEG',	'TXT_KEY_SPY_NAME_CIV_SAS_BERZEG_9');
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_CityNames
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilization_CityNames 
		(CivilizationType, 						CityName)
VALUES	('CIVILIZATION_SAS_BERZEG',	'TXT_KEY_CITY_NAME_SAS_BERZEG_1'),
		('CIVILIZATION_SAS_BERZEG',	'TXT_KEY_CITY_NAME_SAS_BERZEG_2'),
		('CIVILIZATION_SAS_BERZEG',	'TXT_KEY_CITY_NAME_SAS_BERZEG_3'),
		('CIVILIZATION_SAS_BERZEG',	'TXT_KEY_CITY_NAME_SAS_BERZEG_4'),
		('CIVILIZATION_SAS_BERZEG',	'TXT_KEY_CITY_NAME_SAS_BERZEG_5'),
		('CIVILIZATION_SAS_BERZEG',	'TXT_KEY_CITY_NAME_SAS_BERZEG_6'),
		('CIVILIZATION_SAS_BERZEG',	'TXT_KEY_CITY_NAME_SAS_BERZEG_7'),
		('CIVILIZATION_SAS_BERZEG',	'TXT_KEY_CITY_NAME_SAS_BERZEG_8'),
		('CIVILIZATION_SAS_BERZEG',	'TXT_KEY_CITY_NAME_SAS_BERZEG_9'),
		('CIVILIZATION_SAS_BERZEG',	'TXT_KEY_CITY_NAME_SAS_BERZEG_10'),
		('CIVILIZATION_SAS_BERZEG',	'TXT_KEY_CITY_NAME_SAS_BERZEG_11'),
		('CIVILIZATION_SAS_BERZEG',	'TXT_KEY_CITY_NAME_SAS_BERZEG_12'),
		('CIVILIZATION_SAS_BERZEG',	'TXT_KEY_CITY_NAME_SAS_BERZEG_13'),
		('CIVILIZATION_SAS_BERZEG',	'TXT_KEY_CITY_NAME_SAS_BERZEG_14'),
		('CIVILIZATION_SAS_BERZEG',	'TXT_KEY_CITY_NAME_SAS_BERZEG_15'),
		('CIVILIZATION_SAS_BERZEG',	'TXT_KEY_CITY_NAME_SAS_BERZEG_16'),
		('CIVILIZATION_SAS_BERZEG',	'TXT_KEY_CITY_NAME_SAS_BERZEG_17'),
		('CIVILIZATION_SAS_BERZEG',	'TXT_KEY_CITY_NAME_SAS_BERZEG_18'),
		('CIVILIZATION_SAS_BERZEG',	'TXT_KEY_CITY_NAME_SAS_BERZEG_19'),
		('CIVILIZATION_SAS_BERZEG',	'TXT_KEY_CITY_NAME_SAS_BERZEG_20'),
		('CIVILIZATION_SAS_BERZEG',	'TXT_KEY_CITY_NAME_SAS_BERZEG_21'),
		('CIVILIZATION_SAS_BERZEG',	'TXT_KEY_CITY_NAME_SAS_BERZEG_22'),
		('CIVILIZATION_SAS_BERZEG',	'TXT_KEY_CITY_NAME_SAS_BERZEG_23'),
		('CIVILIZATION_SAS_BERZEG',	'TXT_KEY_CITY_NAME_SAS_BERZEG_24'),
		('CIVILIZATION_SAS_BERZEG',	'TXT_KEY_CITY_NAME_SAS_BERZEG_25'),
		('CIVILIZATION_SAS_BERZEG',	'TXT_KEY_CITY_NAME_SAS_BERZEG_26'),
		('CIVILIZATION_SAS_BERZEG',	'TXT_KEY_CITY_NAME_SAS_BERZEG_27'),
		('CIVILIZATION_SAS_BERZEG',	'TXT_KEY_CITY_NAME_SAS_BERZEG_28'),
		('CIVILIZATION_SAS_BERZEG',	'TXT_KEY_CITY_NAME_SAS_BERZEG_29'),
		('CIVILIZATION_SAS_BERZEG',	'TXT_KEY_CITY_NAME_SAS_BERZEG_30');
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_FreeBuildingClasses
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Civilization_FreeBuildingClasses 
		(CivilizationType, 					BuildingClassType)
SELECT	'CIVILIZATION_SAS_BERZEG', 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE CivilizationType = 'CIVILIZATION_OTTOMAN';
--------------------------------------------------------------------------------------------------------------------------		
-- Civilization_FreeTechs
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Civilization_FreeTechs 
		(CivilizationType, 					TechType)
SELECT	'CIVILIZATION_SAS_BERZEG', 	TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_OTTOMAN';
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_FreeUnits
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_FreeUnits 
		(CivilizationType, 					UnitClassType, Count, UnitAIType)
SELECT	'CIVILIZATION_SAS_BERZEG', 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_OTTOMAN';
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_Leaders
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_Leaders 
		(CivilizationType, 					LeaderheadType)
VALUES	('CIVILIZATION_SAS_BERZEG',	'LEADER_SAS_BERZEG');
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_UnitClassOverrides 
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_UnitClassOverrides 
		(CivilizationType, 					UnitClassType, 				UnitType)
VALUES	('CIVILIZATION_SAS_BERZEG', 	'UNITCLASS_CAVALRY',			'UNIT_SAS_DZHIGIT');
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_BuildingClassOverrides 
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_BuildingClassOverrides 
		(CivilizationType, 			BuildingClassType, 		 BuildingType)
VALUES	('CIVILIZATION_SAS_BERZEG', 'BUILDINGCLASS_WALLS',	 'BUILDING_SAS_AUL');
--------------------------------------------------------------------------------------------------------------------------
-- Civilization_Start_Region_Priority
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Civilization_Start_Region_Priority
		(CivilizationType,			RegionType)
VALUES	('CIVILIZATION_SAS_BERZEG',	'REGION_HILLS');
--------------------------------------------------------------------------------------------------------------------------
-- Civilization_Religions
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Civilization_Religions
		(CivilizationType,			ReligionType)
VALUES	('CIVILIZATION_SAS_BERZEG',	'RELIGION_ISLAM');
