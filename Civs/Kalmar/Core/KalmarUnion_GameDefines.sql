--=======================================================================================================================
-- BUILDINGCLASSES
--=======================================================================================================================
-- BuildingClasses
------------------------------	
INSERT INTO BuildingClasses 	
		(Type, 						 			DefaultBuilding, 							Description)
VALUES	('BUILDINGCLASS_JFD_KALMAR_UNION',		'BUILDING_JFD_KALMAR_UNION_TRADE_ROUTE',	'TXT_KEY_BUILDING_JFD_KOBSTAD_GP');
--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
-- Buildings
------------------------------	
INSERT INTO Buildings 	
		(Type, 										BuildingClass,	SpecialistCount, SpecialistType, TradeRouteRecipientBonus,	TradeRouteTargetBonus,	PrereqTech, Cost,		FaithCost,	GreatWorkCount,	GoldMaintenance, MinAreaSize,	NeverCapture,	Description, 					 Help, 									Strategy,									Civilopedia, 						ArtDefineTag, PortraitIndex, IconAtlas)
SELECT	'BUILDING_JFD_KOBSTAD',						BuildingClass,	SpecialistCount, SpecialistType, TradeRouteRecipientBonus,	TradeRouteTargetBonus,	PrereqTech, Cost+20,	-1,			0,				GoldMaintenance, MinAreaSize,	1,				'TXT_KEY_BUILDING_JFD_KOBSTAD',	 'TXT_KEY_BUILDING_JFD_KOBSTAD_HELP',	'TXT_KEY_BUILDING_JFD_KOBSTAD_STRATEGY',	'TXT_KEY_CIV5_JFD_KOBSTAD_TEXT',	ArtDefineTag, 3, 			 'JFD_KALMAR_UNION_ATLAS'
FROM Buildings WHERE Type = 'BUILDING_MARKET';	

INSERT INTO Buildings 		
		(Type, 						 				BuildingClass, 						NumTradeRouteBonus,		TradeRouteLandDistanceModifier,		TradeRouteSeaDistanceModifier,		NoOccupiedUnhappiness,	SpecialistCount, SpecialistType, TradeRouteRecipientBonus,	TradeRouteTargetBonus,	PrereqTech, Cost,		FaithCost,	GreatWorkCount,	GoldMaintenance, MinAreaSize,	NeverCapture,	Description, 										Help, 													Strategy,										Civilopedia, 							ArtDefineTag, PortraitIndex, IconAtlas)
VALUES	('BUILDING_JFD_KALMAR_UNION', 				'BUILDINGCLASS_JFD_KALMAR_UNION',	0,						0,									0,									0,						0,				 null,			 0,							0,						null,		-1,			-1,			-1,				0,				 0,				1,				'TXT_KEY_BUILDING_JFD_KALMAR_UNION',				'TXT_KEY_BUILDING_JFD_KALMAR_UNION_HELP',				null,											null,									null,		  0, 			 'JFD_KALMAR_UNION_ATLAS'),
		('BUILDING_JFD_KALMAR_UNION_TRADE_LENGTH', 	'BUILDINGCLASS_JFD_KALMAR_UNION',	0,						100,								100,								0,						0,				 null,			 0,							0,						null,		-1,			-1,			-1,				0,				 0,				1,				'TXT_KEY_BUILDING_JFD_KALMAR_UNION_TRADE_LENGTH',	'TXT_KEY_BUILDING_JFD_KALMAR_UNION_TRADE_LENGTH_HELP',	null,											null,									null,		  0, 			 'JFD_KALMAR_UNION_ATLAS'),
		('BUILDING_JFD_KALMAR_UNION_TRADE_ROUTE', 	'BUILDINGCLASS_JFD_KALMAR_UNION',	1,						0,									0,									0,						0,				 null,			 0,							0,						null,		-1,			-1,			-1,				0,				 0,				1,				'TXT_KEY_BUILDING_JFD_KALMAR_UNION_TRADE_ROUTE',	'TXT_KEY_BUILDING_JFD_KALMAR_UNION_TRADE_ROUTE_HELP',	null,											null,									null,		  0, 			 'JFD_KALMAR_UNION_ATLAS'),
		('BUILDING_JFD_KALMAR_UNION_COURTHOUSE', 	'BUILDINGCLASS_JFD_KALMAR_UNION',	0,						0,									0,									1,						0,				 null,			 0,							0,						null,		-1,			-1,			-1,				0,				 0,				1,				'TXT_KEY_BUILDING_JFD_KALMAR_UNION_COURTHOUSE',		'TXT_KEY_BUILDING_JFD_KALMAR_UNION_COURTHOUSE_HELP',	null,											null,									null,		  0, 			 'JFD_KALMAR_UNION_ATLAS'),
		('BUILDING_JFD_KOBSTAD_GOLD', 				'BUILDINGCLASS_JFD_KALMAR_UNION',	0,						0,									0,									0,						0,				 null,			 0,							0,						null,		-1,			-1,			-1,				0,				 0,				1,				'TXT_KEY_BUILDING_JFD_KOBSTAD_GOLD',				'TXT_KEY_BUILDING_JFD_KOBSTAD_GOLD_HELP',				null,											null,									null,		  3, 			 'JFD_KALMAR_UNION_ATLAS');
------------------------------	
-- Building_YieldChanges
------------------------------	
INSERT INTO Building_YieldChanges 	
		(BuildingType, 					YieldType,			Yield)
SELECT	'BUILDING_JFD_KOBSTAD',			YieldType,			Yield
FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_MARKET';

INSERT INTO Building_YieldChanges 	
		(BuildingType, 					YieldType,			Yield)
VALUES	('BUILDING_JFD_KOBSTAD',		'YIELD_CULTURE',	1),
		('BUILDING_JFD_KOBSTAD_GOLD',	'YIELD_GOLD',		1);
------------------------------	
-- Building_YieldModifiers
------------------------------	
INSERT INTO Building_YieldModifiers 	
		(BuildingType, 					YieldType,		Yield)
SELECT	'BUILDING_JFD_KOBSTAD',			YieldType,		Yield
FROM Building_YieldModifiers WHERE BuildingType = 'BUILDING_MARKET';
------------------------------	
-- Building_Flavors
------------------------------	
INSERT INTO Building_Flavors 	
		(BuildingType, 					FlavorType,		Flavor)
SELECT	'BUILDING_JFD_KOBSTAD',			FlavorType,		Flavor
FROM Building_Flavors WHERE BuildingType = 'BUILDING_MARKET';
--==========================================================================================================================	
-- PROMOTIONS
--==========================================================================================================================	
-- UnitPromotions
------------------------------
INSERT INTO UnitPromotions 
		(Type, 							Description, 							Help, 										Sound, 				CannotBeChosen, PortraitIndex, 	IconAtlas, 			PediaType, 			PediaEntry)
VALUES	('PROMOTION_JFD_GUN_HOLK', 		'TXT_KEY_PROMOTION_JFD_GUN_HOLK',		'TXT_KEY_PROMOTION_JFD_GUN_HOLK_HELP', 		'AS2D_IF_LEVELUP', 	1, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_GUN_HOLK');
--------------------------------
-- UnitPromotions_Terrains
--------------------------------
INSERT INTO UnitPromotions_Terrains 	
		(PromotionType, 				TerrainType,		DoubleMove)
VALUES	('PROMOTION_JFD_GUN_HOLK',		'TERRAIN_COAST',	1);
--==========================================================================================================================
-- UNITS
--==========================================================================================================================
-- Units
--------------------------------
INSERT INTO Units 	
		(Type, 						PrereqTech,		Class, Combat,	 RangedCombat,	 CombatClass, Cost, Moves, Range, Domain, DefaultUnitAI, Description, 					Civilopedia, 						Strategy, 								Help, 								Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, AdvancedStartCost, RangedCombatLimit, CombatLimit, XPValueDefense, UnitArtInfo, 				 UnitFlagIconOffset, UnitFlagAtlas,						PortraitIndex, 	IconAtlas,					MoveRate)
SELECT	'UNIT_JFD_GUN_HOLK',		'TECH_GUILDS',	Class, Combat-2, RangedCombat-2, CombatClass, Cost, Moves, Range, Domain, DefaultUnitAI, 'TXT_KEY_UNIT_JFD_GUN_HOLK', 	'TXT_KEY_UNIT_JFD_GUN_HOLK_TEXT', 	'TXT_KEY_UNIT_JFD_GUN_HOLK_STRATEGY', 	'TXT_KEY_UNIT_HELP_JFD_GUN_HOLK', 	Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, AdvancedStartCost, RangedCombatLimit, CombatLimit, XPValueDefense, 'ART_DEF_UNIT_JFD_GUN_HOLK', 0,					 'JFD_UNIT_FLAG_GUN_HULK_ATLAS',	4, 				'JFD_KALMAR_UNION_ATLAS',	MoveRate
FROM Units WHERE Type = 'UNIT_GALLEASS';
--------------------------------
-- UnitGameplay2DScripts
--------------------------------
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 					SelectionSound, FirstSelectionSound)
SELECT	'UNIT_JFD_GUN_HOLK', 		SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_GALLEASS';	
--------------------------------
-- Unit_AITypes
--------------------------------
INSERT INTO Unit_AITypes 	
		(UnitType, 					UnitAIType)
SELECT	'UNIT_JFD_GUN_HOLK', 		UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_GALLEASS';
--------------------------------	
-- Unit_ResourceQuantityRequirements
--------------------------------	
INSERT INTO Unit_ResourceQuantityRequirements 	
		(UnitType, 					ResourceType)
SELECT	'UNIT_JFD_GUN_HOLK', 		ResourceType
FROM Unit_ResourceQuantityRequirements WHERE UnitType = 'UNIT_GALLEASS';
--------------------------------
-- Unit_ClassUpgrades
--------------------------------	
INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 					UnitClassType)
SELECT	'UNIT_JFD_GUN_HOLK', 		UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_GALLEASS';
--------------------------------
-- Unit_Flavors
--------------------------------
INSERT INTO Unit_Flavors 	
		(UnitType, 					FlavorType, Flavor)
SELECT	'UNIT_JFD_GUN_HOLK', 		FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_GALLEASS';
--------------------------------
-- Unit_FreePromotions
--------------------------------
INSERT INTO Unit_FreePromotions 	
		(UnitType, 					PromotionType)
SELECT	'UNIT_JFD_GUN_HOLK', 		PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_GALLEASS';

INSERT INTO Unit_FreePromotions 	
		(UnitType, 					PromotionType)
VALUES	('UNIT_JFD_GUN_HOLK', 		'PROMOTION_JFD_GUN_HOLK');
--==========================================================================================================================	
-- LEADERS
--==========================================================================================================================	
-- Leaders
--------------------------------			
INSERT INTO Leaders 
		(Type, 						Description, 						Civilopedia, 							CivilopediaTag, 								ArtDefineTag, 				VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 					PortraitIndex)
VALUES	('LEADER_JFD_MARGARETHE', 	'TXT_KEY_LEADER_JFD_MARGARETHE',	'TXT_KEY_LEADER_JFD_MARGARETHE_PEDIA',	'TXT_KEY_CIVILOPEDIA_LEADERS_JFD_MARGARETHE', 	'MargaretheI_Scene.xml',	5, 						4, 						9, 							9, 			5, 				8, 				7, 						3, 				4, 			6, 			5, 				5, 			6, 			'JFD_KALMAR_UNION_ATLAS', 	1);
--------------------------------		
-- Leader_MajorCivApproachBiases
--------------------------------						
INSERT INTO Leader_MajorCivApproachBiases 
		(LeaderType, 				MajorCivApproachType, 				Bias)
VALUES	('LEADER_JFD_MARGARETHE', 	'MAJOR_CIV_APPROACH_WAR', 			5),
		('LEADER_JFD_MARGARETHE', 	'MAJOR_CIV_APPROACH_HOSTILE', 		7),
		('LEADER_JFD_MARGARETHE', 	'MAJOR_CIV_APPROACH_DECEPTIVE', 	4),
		('LEADER_JFD_MARGARETHE', 	'MAJOR_CIV_APPROACH_GUARDED', 		8),
		('LEADER_JFD_MARGARETHE', 	'MAJOR_CIV_APPROACH_AFRAID', 		5),
		('LEADER_JFD_MARGARETHE', 	'MAJOR_CIV_APPROACH_FRIENDLY', 		6),
		('LEADER_JFD_MARGARETHE', 	'MAJOR_CIV_APPROACH_NEUTRAL', 		5);
--------------------------------	
-- Leader_MinorCivApproachBiases
--------------------------------							
INSERT INTO Leader_MinorCivApproachBiases 
		(LeaderType, 				MinorCivApproachType, 				Bias)
VALUES	('LEADER_JFD_MARGARETHE', 	'MINOR_CIV_APPROACH_IGNORE', 		2),
		('LEADER_JFD_MARGARETHE', 	'MINOR_CIV_APPROACH_FRIENDLY', 		9),
		('LEADER_JFD_MARGARETHE', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	8),
		('LEADER_JFD_MARGARETHE', 	'MINOR_CIV_APPROACH_CONQUEST', 		0),
		('LEADER_JFD_MARGARETHE', 	'MINOR_CIV_APPROACH_BULLY', 		0);
--------------------------------	
-- Leader_Flavors
--------------------------------							
INSERT INTO Leader_Flavors 
		(LeaderType, 				FlavorType, 						Flavor)
VALUES	('LEADER_JFD_MARGARETHE', 	'FLAVOR_OFFENSE', 					5),
		('LEADER_JFD_MARGARETHE', 	'FLAVOR_DEFENSE', 					5),
		('LEADER_JFD_MARGARETHE', 	'FLAVOR_CITY_DEFENSE', 				5),
		('LEADER_JFD_MARGARETHE', 	'FLAVOR_MILITARY_TRAINING', 		5),
		('LEADER_JFD_MARGARETHE', 	'FLAVOR_RECON', 					5),
		('LEADER_JFD_MARGARETHE', 	'FLAVOR_RANGED', 					5),
		('LEADER_JFD_MARGARETHE', 	'FLAVOR_MOBILE', 					3),
		('LEADER_JFD_MARGARETHE', 	'FLAVOR_NAVAL', 					8),
		('LEADER_JFD_MARGARETHE', 	'FLAVOR_NAVAL_RECON', 				7),
		('LEADER_JFD_MARGARETHE', 	'FLAVOR_NAVAL_GROWTH', 				7),
		('LEADER_JFD_MARGARETHE', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	7),
		('LEADER_JFD_MARGARETHE', 	'FLAVOR_AIR', 						2),
		('LEADER_JFD_MARGARETHE', 	'FLAVOR_EXPANSION', 				5),
		('LEADER_JFD_MARGARETHE', 	'FLAVOR_GROWTH', 					5),
		('LEADER_JFD_MARGARETHE', 	'FLAVOR_TILE_IMPROVEMENT', 			4),
		('LEADER_JFD_MARGARETHE', 	'FLAVOR_INFRASTRUCTURE', 			6),
		('LEADER_JFD_MARGARETHE', 	'FLAVOR_PRODUCTION', 				5),
		('LEADER_JFD_MARGARETHE', 	'FLAVOR_GOLD', 						8),
		('LEADER_JFD_MARGARETHE', 	'FLAVOR_SCIENCE', 					4),
		('LEADER_JFD_MARGARETHE', 	'FLAVOR_CULTURE', 					6),
		('LEADER_JFD_MARGARETHE', 	'FLAVOR_HAPPINESS', 				6),
		('LEADER_JFD_MARGARETHE', 	'FLAVOR_GREAT_PEOPLE', 				5),
		('LEADER_JFD_MARGARETHE', 	'FLAVOR_WONDER', 					4),
		('LEADER_JFD_MARGARETHE', 	'FLAVOR_RELIGION', 					3),
		('LEADER_JFD_MARGARETHE', 	'FLAVOR_DIPLOMACY', 				9),
		('LEADER_JFD_MARGARETHE', 	'FLAVOR_SPACESHIP', 				2),
		('LEADER_JFD_MARGARETHE', 	'FLAVOR_WATER_CONNECTION', 			8),
		('LEADER_JFD_MARGARETHE', 	'FLAVOR_NUKE', 						3),
		('LEADER_JFD_MARGARETHE', 	'FLAVOR_USE_NUKE', 					3),
		('LEADER_JFD_MARGARETHE', 	'FLAVOR_ESPIONAGE', 				5),
		('LEADER_JFD_MARGARETHE', 	'FLAVOR_AIRLIFT', 					2),
		('LEADER_JFD_MARGARETHE', 	'FLAVOR_I_TRADE_DESTINATION', 		5),
		('LEADER_JFD_MARGARETHE', 	'FLAVOR_I_TRADE_ORIGIN', 			5),
		('LEADER_JFD_MARGARETHE', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		8),
		('LEADER_JFD_MARGARETHE', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		8),
		('LEADER_JFD_MARGARETHE', 	'FLAVOR_ARCHAEOLOGY', 				5),
		('LEADER_JFD_MARGARETHE', 	'FLAVOR_AIR_CARRIER', 				5);
--------------------------------	
-- Leader_Traits
--------------------------------	
INSERT INTO Leader_Traits 
		(LeaderType, 					TraitType)
VALUES	('LEADER_JFD_MARGARETHE', 		'TRAIT_JFD_KALMAR_UNION');
--==========================================================================================================================	
-- TRAITS
--==========================================================================================================================	
-- Traits
--------------------------------	
INSERT INTO Traits 
		(Type, 							Description, 								ShortDescription)
VALUES	('TRAIT_JFD_KALMAR_UNION',		'TXT_KEY_TRAIT_JFD_KALMAR_UNION', 			'TXT_KEY_TRAIT_JFD_KALMAR_UNION_SHORT');
--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
-- Civilizations
--------------------------------		
INSERT INTO Civilizations 	
		(Type, 									Description,							ShortDescription,							Adjective,									Civilopedia,							CivilopediaTag,					 DefaultPlayerColor,				ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas,					 PortraitIndex,	AlphaIconAtlas,					SoundtrackTag,  MapImage, 							DawnOfManQuote, 							DawnOfManImage)
SELECT	'CIVILIZATION_JFD_KALMAR_UNION',		'TXT_KEY_CIV_JFD_KALMAR_UNION_DESC',	'TXT_KEY_CIV_JFD_KALMAR_UNION_SHORT_DESC',	'TXT_KEY_CIV_JFD_KALMAR_UNION_ADJECTIVE',	'TXT_KEY_CIV5_JFD_KALMAR_UNION_TEXT_1', 'TXT_KEY_CIV5_JFD_KALMAR_UNION', 'PLAYERCOLOR_JFD_KALMAR_UNION',	ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, 'JFD_KALMAR_UNION_ATLAS',	 0,				'JFD_KALMAR_UNION_ALPHA_ATLAS',	'England', 		'Viregel_MapKalmarUnion512.dds',	'TXT_KEY_CIV5_DAWN_JFD_KALMAR_UNION_TEXT',	'Janboruta_KalmarUnion_DOM.dds'
FROM Civilizations WHERE Type = 'CIVILIZATION_DENMARK';

UPDATE Civilizations
SET DerivativeCiv = 'CIVILIZATION_DENMARK'
WHERE Type = 'CIVILIZATION_JFD_KALMAR_UNION'
AND EXISTS (SELECT Type FROM Civilizations WHERE Type = 'CIVILIZATION_DENMARK');
--------------------------------	
-- Civilization_CityNames
--------------------------------	
INSERT INTO Civilization_CityNames 
		(CivilizationType, 						CityName)
VALUES	('CIVILIZATION_JFD_KALMAR_UNION', 		'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_KALMAR_UNION_1'),
		('CIVILIZATION_JFD_KALMAR_UNION', 		'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_KALMAR_UNION_2'),
		('CIVILIZATION_JFD_KALMAR_UNION', 		'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_KALMAR_UNION_3'),
		('CIVILIZATION_JFD_KALMAR_UNION', 		'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_KALMAR_UNION_4'),
		('CIVILIZATION_JFD_KALMAR_UNION', 		'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_KALMAR_UNION_5'),
		('CIVILIZATION_JFD_KALMAR_UNION', 		'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_KALMAR_UNION_6'),
		('CIVILIZATION_JFD_KALMAR_UNION', 		'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_KALMAR_UNION_7'),
		('CIVILIZATION_JFD_KALMAR_UNION', 		'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_KALMAR_UNION_8'),
		('CIVILIZATION_JFD_KALMAR_UNION', 		'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_KALMAR_UNION_9'),
		('CIVILIZATION_JFD_KALMAR_UNION', 		'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_KALMAR_UNION_10'),
		('CIVILIZATION_JFD_KALMAR_UNION', 		'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_KALMAR_UNION_11'),
		('CIVILIZATION_JFD_KALMAR_UNION', 		'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_KALMAR_UNION_12'),
		('CIVILIZATION_JFD_KALMAR_UNION', 		'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_KALMAR_UNION_13'),
		('CIVILIZATION_JFD_KALMAR_UNION', 		'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_KALMAR_UNION_14'),
		('CIVILIZATION_JFD_KALMAR_UNION', 		'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_KALMAR_UNION_15'),
		('CIVILIZATION_JFD_KALMAR_UNION', 		'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_KALMAR_UNION_16'),
		('CIVILIZATION_JFD_KALMAR_UNION', 		'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_KALMAR_UNION_17'),
		('CIVILIZATION_JFD_KALMAR_UNION', 		'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_KALMAR_UNION_18'),
		('CIVILIZATION_JFD_KALMAR_UNION', 		'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_KALMAR_UNION_19'),
		('CIVILIZATION_JFD_KALMAR_UNION', 		'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_KALMAR_UNION_20'),
		('CIVILIZATION_JFD_KALMAR_UNION', 		'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_KALMAR_UNION_21'),
		('CIVILIZATION_JFD_KALMAR_UNION', 		'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_KALMAR_UNION_22'),
		('CIVILIZATION_JFD_KALMAR_UNION', 		'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_KALMAR_UNION_23'),
		('CIVILIZATION_JFD_KALMAR_UNION', 		'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_KALMAR_UNION_24'),
		('CIVILIZATION_JFD_KALMAR_UNION', 		'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_KALMAR_UNION_25'),
		('CIVILIZATION_JFD_KALMAR_UNION', 		'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_KALMAR_UNION_26'),
		('CIVILIZATION_JFD_KALMAR_UNION', 		'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_KALMAR_UNION_27'),
		('CIVILIZATION_JFD_KALMAR_UNION', 		'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_KALMAR_UNION_28'),
		('CIVILIZATION_JFD_KALMAR_UNION', 		'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_KALMAR_UNION_29'),
		('CIVILIZATION_JFD_KALMAR_UNION', 		'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_KALMAR_UNION_30'),
		('CIVILIZATION_JFD_KALMAR_UNION', 		'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_KALMAR_UNION_31'),
		('CIVILIZATION_JFD_KALMAR_UNION', 		'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_KALMAR_UNION_32'),
		('CIVILIZATION_JFD_KALMAR_UNION', 		'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_KALMAR_UNION_33'),
		('CIVILIZATION_JFD_KALMAR_UNION', 		'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_KALMAR_UNION_34');
--------------------------------	
-- Civilization_FreeBuildingClasses
--------------------------------			
INSERT INTO Civilization_FreeBuildingClasses 
		(CivilizationType, 						BuildingClassType)
SELECT	'CIVILIZATION_JFD_KALMAR_UNION',		BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE CivilizationType = 'CIVILIZATION_ENGLAND';
--------------------------------		
-- Civilization_FreeTechs
--------------------------------			
INSERT INTO Civilization_FreeTechs 
		(CivilizationType, 						TechType)
SELECT	'CIVILIZATION_JFD_KALMAR_UNION',		TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_ENGLAND';
--------------------------------	
-- Civilization_FreeUnits
--------------------------------		
INSERT INTO Civilization_FreeUnits 
		(CivilizationType, 						UnitClassType, Count, UnitAIType)
SELECT	'CIVILIZATION_JFD_KALMAR_UNION',		UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_ENGLAND';
--------------------------------	
-- Civilization_Leaders
--------------------------------		
INSERT INTO Civilization_Leaders 
		(CivilizationType, 						LeaderheadType)
VALUES	('CIVILIZATION_JFD_KALMAR_UNION',		'LEADER_JFD_MARGARETHE');
--------------------------------	
-- Civilization_BuildingClassOverrides 
--------------------------------		
INSERT INTO Civilization_BuildingClassOverrides 
		(CivilizationType, 						BuildingClassType, 				BuildingType)
VALUES	('CIVILIZATION_JFD_KALMAR_UNION',		'BUILDINGCLASS_MARKET',			'BUILDING_JFD_KOBSTAD');
--------------------------------	
-- Civilization_UnitClassOverrides 
--------------------------------		
INSERT INTO Civilization_UnitClassOverrides 
		(CivilizationType, 						UnitClassType, 					UnitType)
VALUES	('CIVILIZATION_JFD_KALMAR_UNION', 		'UNITCLASS_GALLEASS',			'UNIT_JFD_GUN_HOLK');
--------------------------------	
-- Civilization_Religions
--------------------------------			
INSERT INTO Civilization_Religions 
		(CivilizationType, 						ReligionType)
VALUES	('CIVILIZATION_JFD_KALMAR_UNION', 		'RELIGION_PROTESTANTISM');
--------------------------------	
-- Civilization_SpyNames
--------------------------------	
INSERT INTO Civilization_SpyNames 
		(CivilizationType, 						SpyName)
VALUES	('CIVILIZATION_JFD_KALMAR_UNION', 		'TXT_KEY_SPY_NAME_CIVILIZATION_JFD_KALMAR_UNION_1'),
		('CIVILIZATION_JFD_KALMAR_UNION', 		'TXT_KEY_SPY_NAME_CIVILIZATION_JFD_KALMAR_UNION_2'),
		('CIVILIZATION_JFD_KALMAR_UNION', 		'TXT_KEY_SPY_NAME_CIVILIZATION_JFD_KALMAR_UNION_3'),
		('CIVILIZATION_JFD_KALMAR_UNION', 		'TXT_KEY_SPY_NAME_CIVILIZATION_JFD_KALMAR_UNION_4'),
		('CIVILIZATION_JFD_KALMAR_UNION', 		'TXT_KEY_SPY_NAME_CIVILIZATION_JFD_KALMAR_UNION_5'),
		('CIVILIZATION_JFD_KALMAR_UNION', 		'TXT_KEY_SPY_NAME_CIVILIZATION_JFD_KALMAR_UNION_6'),
		('CIVILIZATION_JFD_KALMAR_UNION', 		'TXT_KEY_SPY_NAME_CIVILIZATION_JFD_KALMAR_UNION_7'),
		('CIVILIZATION_JFD_KALMAR_UNION', 		'TXT_KEY_SPY_NAME_CIVILIZATION_JFD_KALMAR_UNION_8'),
		('CIVILIZATION_JFD_KALMAR_UNION', 		'TXT_KEY_SPY_NAME_CIVILIZATION_JFD_KALMAR_UNION_9'),
		('CIVILIZATION_JFD_KALMAR_UNION', 		'TXT_KEY_SPY_NAME_CIVILIZATION_JFD_KALMAR_UNION_10');
--------------------------------	
-- Civilization_Start_Along_Ocean
--------------------------------			
INSERT INTO Civilization_Start_Along_Ocean
		(CivilizationType, 						StartAlongOcean)
VALUES	('CIVILIZATION_JFD_KALMAR_UNION', 		1);
--==========================================================================================================================
--==========================================================================================================================