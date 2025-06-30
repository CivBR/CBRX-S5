--=======================================================================================================================
-- BUILDINGCLASSES
--=======================================================================================================================
-- BuildingClasses
------------------------------	
INSERT INTO BuildingClasses
		(Type, 									DefaultBuilding, 				Description)
VALUES	('BUILDINGCLASS_JFD_WALLACHIA', 		'BUILDING_JFD_WALLACHIA', 		'TXT_KEY_BUILDING_JFD_BASHTNIK_DESC');
--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
-- Buildings
------------------------------	
INSERT INTO Buildings 	
		(Type, 									FreeBuildingThisCity,			BuildingClass,	 Cost, FaithCost, PrereqTech,							GoldMaintenance, MinAreaSize,			NeverCapture, 	Description, 								Help, 											Strategy,											Civilopedia, 								ArtDefineTag,	PortraitIndex,	IconAtlas)
SELECT	'BUILDING_JFD_FORTIFIED_CHURCH',		'BUILDINGCLASS_WALLS',			BuildingClass,	 Cost, FaithCost, 'TECH_CONSTRUCTION',					GoldMaintenance, MinAreaSize,			1, 				'TXT_KEY_BUILDING_JFD_FORTIFIED_CHURCH', 	'TXT_KEY_BUILDING_JFD_FORTIFIED_CHURCH_HELP',	'TXT_KEY_BUILDING_JFD_FORTIFIED_CHURCH_STRATEGY',	'TXT_KEY_CIV5_JFD_FORTIFIED_CHURCH_TEXT',	ArtDefineTag,	3, 				'JFD_WALLACHIA_ATLAS'
FROM Buildings WHERE Type = 'BUILDING_TEMPLE';		

INSERT INTO Buildings		
		(Type, 									BuildingClass, 			  		Cost, FaithCost, GreatWorkCount,  Description, 							Help,									NeverCapture)
VALUES	('BUILDING_JFD_WALLACHIA', 				'BUILDINGCLASS_JFD_WALLACHIA', 	-1,   -1,		 -1,			  'TXT_KEY_BUILDING_JFD_WALLACHIA', 	'TXT_KEY_BUILDING_JFD_WALLACHIA_HELP',	1);
--------------------------------	
-- Building_ResourceYieldChanges
--------------------------------	
INSERT INTO Building_ResourceYieldChanges 	
		(BuildingType, 							ResourceType,		YieldType, Yield)
SELECT	'BUILDING_JFD_FORTIFIED_CHURCH',		ResourceType,		YieldType, Yield
FROM Building_ResourceYieldChanges WHERE BuildingType = 'BUILDING_TEMPLE';	
------------------------------	
-- Building_YieldChanges
------------------------------	
INSERT INTO Building_YieldChanges 	
		(BuildingType, 							YieldType,			Yield)
SELECT	'BUILDING_JFD_FORTIFIED_CHURCH',		YieldType,			Yield
FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_TEMPLE';	

INSERT INTO Building_YieldChanges 	
		(BuildingType, 							YieldType, 			Yield)
VALUES	('BUILDING_JFD_WALLACHIA',				'YIELD_PRODUCTION', 1);
------------------------------	
-- Building_Flavors
------------------------------	
INSERT INTO Building_Flavors 	
		(BuildingType, 							FlavorType,			Flavor)
SELECT	'BUILDING_JFD_FORTIFIED_CHURCH',		FlavorType,			Flavor
FROM Building_Flavors WHERE BuildingType = 'BUILDING_TEMPLE';

INSERT INTO Building_Flavors 	
		(BuildingType, 							FlavorType, 		Flavor)
VALUES	('BUILDING_JFD_FORTIFIED_CHURCH',		'FLAVOR_DEFENSE', 	30);
--==========================================================================================================================	
-- PROMOTIONS
--==========================================================================================================================	
-- UnitPromotions
--------------------------------
INSERT INTO UnitPromotions 
		(Type, 									AttackMod,	DefenseMod,	RangedDefenseMod,	Description, 								Help, 												Sound, 				CannotBeChosen, LostWithUpgrade, PortraitIndex, 	IconAtlas, 							PediaType, 			PediaEntry)
VALUES	('PROMOTION_JFD_FORTIFIED_CHURCH', 		-10,		-10,		0,					'TXT_KEY_PROMOTION_JFD_FORTIFIED_CHURCH',	'TXT_KEY_PROMOTION_JFD_FORTIFIED_CHURCH_HELP',		'AS2D_IF_LEVELUP', 	1, 				0, 				 59, 				'ABILITY_ATLAS', 					'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_FORTIFIED_CHURCH'),
		('PROMOTION_JFD_LEFEGII', 				0,			0,			20,					'TXT_KEY_PROMOTION_JFD_LEFEGII',			'TXT_KEY_PROMOTION_JFD_LEFEGII_HELP',				'AS2D_IF_LEVELUP', 	1, 				0, 				 59, 				'ABILITY_ATLAS', 					'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_LEFEGII'),
		('PROMOTION_JFD_LEFEGII_HEAL', 			0,			0,			0,					'TXT_KEY_PROMOTION_JFD_LEFEGII_HEAL',		'TXT_KEY_PROMOTION_JFD_LEFEGII_HEAL_HELP',			'AS2D_IF_LEVELUP', 	1, 				0, 				 59, 				'ABILITY_ATLAS', 					'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_LEFEGII_HEAL'),
		('PROMOTION_JFD_LEFEGII_HEAL_ACTIVE', 	0,			0,			0,					'TXT_KEY_PROMOTION_JFD_LEFEGII_HEAL',		'TXT_KEY_PROMOTION_JFD_LEFEGII_HEAL_ACTIVE_HELP',	'AS2D_IF_LEVELUP', 	1, 				0, 				 0, 				'JFD_WALLACHIA_PROMOTION_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_LEFEGII_HEAL');
--==========================================================================================================================
-- UNITS
--==========================================================================================================================
-- Units
--------------------------------
INSERT INTO Units 	
		(Type, 					Class, Cost, Moves, FaithCost,	RequiresFaithPurchaseEnabled, GoodyHutUpgradeUnitClass, PrereqTech, Combat,	CombatClass, Domain, DefaultUnitAI, ObsoleteTech,	Description, 					Civilopedia, 						Help, 								Strategy,								Pillage, HurryCostModifier, AdvancedStartCost, CombatLimit, UnitArtInfo,				XPValueAttack, XPValueDefense, UnitFlagIconOffset,  UnitFlagAtlas,					MoveRate, PortraitIndex, 	IconAtlas)
SELECT	'UNIT_JFD_LEFEGII',		Class, Cost, Moves, FaithCost,	RequiresFaithPurchaseEnabled, GoodyHutUpgradeUnitClass, PrereqTech, Combat,	CombatClass, Domain, DefaultUnitAI, 'TECH_RIFLING',	'TXT_KEY_UNIT_JFD_LEFEGII', 	'TXT_KEY_CIV5_JFD_LEFEGII_TEXT', 	'TXT_KEY_UNIT_JFD_LEFEGII_HELP', 	'TXT_KEY_UNIT_JFD_LEFEGII_STRATEGY',	Pillage, HurryCostModifier, AdvancedStartCost, CombatLimit, 'ART_DEF_UNIT_JFD_LEFEGII',	XPValueAttack, XPValueDefense, 0,					'JFD_UNIT_FLAG_LEFEGII_ATLAS',	MoveRate, 2, 				'JFD_WALLACHIA_ATLAS'
FROM Units WHERE Type = 'UNIT_LONGSWORDSMAN';	
--------------------------------
-- UnitGameplay2DScripts
--------------------------------
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 				SelectionSound, FirstSelectionSound)
SELECT	'UNIT_JFD_LEFEGII', 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_LONGSWORDSMAN';	
--------------------------------
-- Unit_AITypes
--------------------------------
INSERT INTO Unit_AITypes 	
		(UnitType, 				UnitAIType)
SELECT	'UNIT_JFD_LEFEGII', 	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_LONGSWORDSMAN';
--------------------------------
-- Unit_ClassUpgrades
--------------------------------
INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 				UnitClassType)
SELECT	'UNIT_JFD_LEFEGII', 	UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_LONGSWORDSMAN';
--------------------------------
-- Unit_ResourceQuantityRequirements
--------------------------------
INSERT INTO Unit_ResourceQuantityRequirements 	
		(UnitType, 				ResourceType,	Cost)
SELECT	'UNIT_JFD_LEFEGII', 	ResourceType,	Cost
FROM Unit_ResourceQuantityRequirements WHERE UnitType = 'UNIT_LONGSWORDSMAN';
--------------------------------
-- Unit_Flavors
--------------------------------
INSERT INTO Unit_Flavors 	
		(UnitType, 				FlavorType,		Flavor)
SELECT	'UNIT_JFD_LEFEGII', 	FlavorType,		Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_LONGSWORDSMAN';
--------------------------------
-- Unit_FreePromotions
--------------------------------
INSERT INTO Unit_FreePromotions 	
		(UnitType, 				PromotionType)
VALUES	('UNIT_JFD_LEFEGII',	'PROMOTION_JFD_LEFEGII'),
		('UNIT_JFD_LEFEGII',	'PROMOTION_JFD_LEFEGII_HEAL');
--==========================================================================================================================	
-- LEADERS
--==========================================================================================================================	
-- Leaders
--------------------------------			
INSERT INTO Leaders 
		(Type, 					Description, 				Civilopedia, 						CivilopediaTag, 							ArtDefineTag, 					VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 				PortraitIndex)
VALUES	('LEADER_JFD_VLAD', 	'TXT_KEY_LEADER_JFD_VLAD', 	'TXT_KEY_LEADER_JFD_VLAD_PEDIA', 	'TXT_KEY_CIVILOPEDIA_LEADERS_JFD_VLAD', 	'Janboruta_Vlad_Scene.xml',		6, 						2, 						2, 							12, 		6, 				8, 				9, 						3, 				7, 			6, 			1, 				2, 			9, 			'JFD_WALLACHIA_ATLAS', 	1);
--------------------------------	
-- Leader_MajorCivApproachBiases
--------------------------------						
INSERT INTO Leader_MajorCivApproachBiases 
		(LeaderType, 			MajorCivApproachType, 				Bias)
VALUES	('LEADER_JFD_VLAD', 	'MAJOR_CIV_APPROACH_WAR', 			6),
		('LEADER_JFD_VLAD', 	'MAJOR_CIV_APPROACH_HOSTILE', 		8),
		('LEADER_JFD_VLAD', 	'MAJOR_CIV_APPROACH_DECEPTIVE', 	7),
		('LEADER_JFD_VLAD', 	'MAJOR_CIV_APPROACH_GUARDED', 		8),
		('LEADER_JFD_VLAD', 	'MAJOR_CIV_APPROACH_AFRAID', 		5),
		('LEADER_JFD_VLAD', 	'MAJOR_CIV_APPROACH_FRIENDLY', 		4),
		('LEADER_JFD_VLAD', 	'MAJOR_CIV_APPROACH_NEUTRAL', 		5);
--------------------------------	
-- Leader_MajorCivApproachBiases
--------------------------------						
INSERT INTO Leader_MinorCivApproachBiases 
		(LeaderType, 			MinorCivApproachType, 				Bias)
VALUES	('LEADER_JFD_VLAD', 	'MINOR_CIV_APPROACH_IGNORE', 		5),
		('LEADER_JFD_VLAD', 	'MINOR_CIV_APPROACH_FRIENDLY', 		5),
		('LEADER_JFD_VLAD', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	5),
		('LEADER_JFD_VLAD', 	'MINOR_CIV_APPROACH_CONQUEST', 		7),
		('LEADER_JFD_VLAD', 	'MINOR_CIV_APPROACH_BULLY', 		7);
--------------------------------	
-- Leader_Flavors
--------------------------------						
INSERT INTO Leader_Flavors 
		(LeaderType, 			FlavorType, 						Flavor)
VALUES	('LEADER_JFD_VLAD', 	'FLAVOR_OFFENSE', 					7),
		('LEADER_JFD_VLAD', 	'FLAVOR_DEFENSE', 					7),
		('LEADER_JFD_VLAD', 	'FLAVOR_CITY_DEFENSE', 				7),
		('LEADER_JFD_VLAD', 	'FLAVOR_MILITARY_TRAINING', 		7),
		('LEADER_JFD_VLAD', 	'FLAVOR_RECON', 					4),
		('LEADER_JFD_VLAD', 	'FLAVOR_RANGED', 					4),
		('LEADER_JFD_VLAD', 	'FLAVOR_MOBILE', 					4),
		('LEADER_JFD_VLAD', 	'FLAVOR_NAVAL', 					4),
		('LEADER_JFD_VLAD', 	'FLAVOR_NAVAL_RECON', 				4),
		('LEADER_JFD_VLAD', 	'FLAVOR_NAVAL_GROWTH', 				4),
		('LEADER_JFD_VLAD', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	4),
		('LEADER_JFD_VLAD', 	'FLAVOR_AIR', 						3),
		('LEADER_JFD_VLAD', 	'FLAVOR_EXPANSION', 				6),
		('LEADER_JFD_VLAD', 	'FLAVOR_GROWTH', 					5),
		('LEADER_JFD_VLAD', 	'FLAVOR_TILE_IMPROVEMENT', 			5),
		('LEADER_JFD_VLAD', 	'FLAVOR_INFRASTRUCTURE', 			5),
		('LEADER_JFD_VLAD', 	'FLAVOR_PRODUCTION', 				6),
		('LEADER_JFD_VLAD', 	'FLAVOR_GOLD', 						6),
		('LEADER_JFD_VLAD', 	'FLAVOR_SCIENCE', 					5),
		('LEADER_JFD_VLAD', 	'FLAVOR_CULTURE', 					6),
		('LEADER_JFD_VLAD', 	'FLAVOR_HAPPINESS', 				7),
		('LEADER_JFD_VLAD', 	'FLAVOR_GREAT_PEOPLE', 				5),
		('LEADER_JFD_VLAD', 	'FLAVOR_WONDER', 					4),
		('LEADER_JFD_VLAD', 	'FLAVOR_RELIGION', 					6),
		('LEADER_JFD_VLAD', 	'FLAVOR_DIPLOMACY', 				4),
		('LEADER_JFD_VLAD', 	'FLAVOR_SPACESHIP', 				3),
		('LEADER_JFD_VLAD', 	'FLAVOR_WATER_CONNECTION', 			4),
		('LEADER_JFD_VLAD', 	'FLAVOR_NUKE', 						3),
		('LEADER_JFD_VLAD', 	'FLAVOR_USE_NUKE', 					4),
		('LEADER_JFD_VLAD', 	'FLAVOR_ESPIONAGE', 				6),
		('LEADER_JFD_VLAD', 	'FLAVOR_AIRLIFT', 					2),
		('LEADER_JFD_VLAD', 	'FLAVOR_I_TRADE_DESTINATION', 		5),
		('LEADER_JFD_VLAD', 	'FLAVOR_I_TRADE_ORIGIN', 			5),
		('LEADER_JFD_VLAD', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
		('LEADER_JFD_VLAD', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
		('LEADER_JFD_VLAD', 	'FLAVOR_ARCHAEOLOGY', 				5),
		('LEADER_JFD_VLAD', 	'FLAVOR_AIR_CARRIER', 				5);
--------------------------------	
-- Leader_Traits
--------------------------------	
INSERT INTO Leader_Traits 
		(LeaderType, 			TraitType)
VALUES	('LEADER_JFD_VLAD',		'TRAIT_JFD_WALLACHIA');
--==========================================================================================================================	
-- TRAITS
--==========================================================================================================================	
-- Traits
--------------------------------	
INSERT INTO Traits 
		(Type, 						Description, 					ShortDescription)
VALUES	('TRAIT_JFD_WALLACHIA',		'TXT_KEY_TRAIT_JFD_WALLACHIA', 	'TXT_KEY_TRAIT_JFD_WALLACHIA_SHORT');	
--------------------------------
-- Trait_FreePromotionUnitCombats
--------------------------------
INSERT INTO Trait_FreePromotionUnitCombats 
		(TraitType, 				UnitCombatType, 				PromotionType)
VALUES	('TRAIT_JFD_WALLACHIA',		'UNITCOMBAT_MELEE', 			'PROMOTION_FREE_PILLAGE_MOVES'),
		('TRAIT_JFD_WALLACHIA',		'UNITCOMBAT_GUN',				'PROMOTION_FREE_PILLAGE_MOVES');
--------------------------------
-- Trait_YieldChangesFromPillagedTiles
--------------------------------
CREATE TABLE IF NOT EXISTS 
Trait_YieldChangesFromPillagedTiles (
	TraitType 						text 		REFERENCES Traits(Type)		default null,
	BuildingType					text 		REFERENCES Buildings(Type)	default null,	
	Yieldtype 						text		REFERENCES Yields(Type)		default null,
	Yield							integer									default	0,
	RequiresUnit					boolean									default 0);
	
INSERT INTO Trait_YieldChangesFromPillagedTiles 
		(TraitType, 				BuildingType,				Yieldtype, 				Yield,	RequiresUnit)
VALUES	('TRAIT_JFD_WALLACHIA',		'BUILDING_JFD_WALLACHIA',	'YIELD_PRODUCTION', 	2,		1);
--==========================================================================================================================	
-- MINOR CIVILIZATIONS
--==========================================================================================================================
-- MinorCivilizations
--------------------------------
UPDATE MinorCivilizations
SET Description = 'TXT_KEY_CITYSTATE_JFD_CHISINAU_DESC', ShortDescription = 'TXT_KEY_CITYSTATE_JFD_CHISINAU_SHORT_DESC', Adjective = 'TXT_KEY_CITYSTATE_JFD_CHISINAU_ADJECTIVE', Civilopedia = 'TXT_KEY_CIV5_JFD_CHISINAU_TEXT_1'
WHERE Type = 'MINOR_CIV_BUCHAREST';	
--------------------------------	
-- MinorCivilization_CityNames
--------------------------------	
DELETE FROM MinorCivilization_CityNames WHERE MinorCivType = 'MINOR_CIV_BUCHAREST';
INSERT INTO MinorCivilization_CityNames
		(MinorCivType, 			CityName)
VALUES	('MINOR_CIV_BUCHAREST', 'TXT_KEY_CITYSTATE_JFD_CHISINAU');
--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
-- Civilizations
--------------------------------			
INSERT INTO Civilizations 	
		(Type, 							Description, 						ShortDescription, 							Adjective, 								Civilopedia, 							CivilopediaTag, 				DefaultPlayerColor, 			ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas, 				PortraitIndex, 	AlphaIconAtlas, 				SoundtrackTag, 	MapImage, 							DawnOfManQuote, 						DawnOfManImage)
SELECT	'CIVILIZATION_JFD_WALLACHIA',	'TXT_KEY_CIV_JFD_WALLACHIA_DESC',	'TXT_KEY_CIV_JFD_WALLACHIA_SHORT_DESC', 	'TXT_KEY_CIV_JFD_WALLACHIA_ADJECTIVE',	'TXT_KEY_CIV5_JFD_WALLACHIA_TEXT_1', 	'TXT_KEY_CIV5_JFD_WALLACHIA',	'PLAYERCOLOR_JFD_WALLACHIA', 	ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, 'JFD_WALLACHIA_ATLAS', 	0, 				'JFD_WALLACHIA_ALPHA_ATLAS', 	'Poland', 		'Janboruta_MapWallachia512.dds', 	'TXT_KEY_CIV5_DOM_JFD_VLAD_TEXT', 		'Janboruta_Wallachia_DOM.dds'
FROM Civilizations WHERE Type = 'CIVILIZATION_POLAND';
--------------------------------	
-- Civilization_CityNames
--------------------------------			
INSERT INTO Civilization_CityNames 
		(CivilizationType, 				CityName)
VALUES	('CIVILIZATION_JFD_WALLACHIA', 	'TXT_KEY_CITY_NAME_JFD_WALLACHIA_01'),
		('CIVILIZATION_JFD_WALLACHIA', 	'TXT_KEY_CITY_NAME_JFD_WALLACHIA_02'),
		('CIVILIZATION_JFD_WALLACHIA', 	'TXT_KEY_CITY_NAME_JFD_WALLACHIA_03'),
		('CIVILIZATION_JFD_WALLACHIA', 	'TXT_KEY_CITY_NAME_JFD_WALLACHIA_04'),
		('CIVILIZATION_JFD_WALLACHIA', 	'TXT_KEY_CITY_NAME_JFD_WALLACHIA_05'),
		('CIVILIZATION_JFD_WALLACHIA', 	'TXT_KEY_CITY_NAME_JFD_WALLACHIA_06'),
		('CIVILIZATION_JFD_WALLACHIA', 	'TXT_KEY_CITY_NAME_JFD_WALLACHIA_07'),
		('CIVILIZATION_JFD_WALLACHIA', 	'TXT_KEY_CITY_NAME_JFD_WALLACHIA_08'),
		('CIVILIZATION_JFD_WALLACHIA', 	'TXT_KEY_CITY_NAME_JFD_WALLACHIA_09'),
		('CIVILIZATION_JFD_WALLACHIA', 	'TXT_KEY_CITY_NAME_JFD_WALLACHIA_10'),
		('CIVILIZATION_JFD_WALLACHIA', 	'TXT_KEY_CITY_NAME_JFD_WALLACHIA_11'),
		('CIVILIZATION_JFD_WALLACHIA', 	'TXT_KEY_CITY_NAME_JFD_WALLACHIA_12'),
		('CIVILIZATION_JFD_WALLACHIA', 	'TXT_KEY_CITY_NAME_JFD_WALLACHIA_13'),
		('CIVILIZATION_JFD_WALLACHIA', 	'TXT_KEY_CITY_NAME_JFD_WALLACHIA_14'),
		('CIVILIZATION_JFD_WALLACHIA', 	'TXT_KEY_CITY_NAME_JFD_WALLACHIA_15'),
		('CIVILIZATION_JFD_WALLACHIA', 	'TXT_KEY_CITY_NAME_JFD_WALLACHIA_16'),
		('CIVILIZATION_JFD_WALLACHIA', 	'TXT_KEY_CITY_NAME_JFD_WALLACHIA_17'),
		('CIVILIZATION_JFD_WALLACHIA', 	'TXT_KEY_CITY_NAME_JFD_WALLACHIA_18'),
		('CIVILIZATION_JFD_WALLACHIA', 	'TXT_KEY_CITY_NAME_JFD_WALLACHIA_19'),
		('CIVILIZATION_JFD_WALLACHIA', 	'TXT_KEY_CITY_NAME_JFD_WALLACHIA_20'),
		('CIVILIZATION_JFD_WALLACHIA', 	'TXT_KEY_CITY_NAME_JFD_WALLACHIA_21'),
		('CIVILIZATION_JFD_WALLACHIA', 	'TXT_KEY_CITY_NAME_JFD_WALLACHIA_22'),
		('CIVILIZATION_JFD_WALLACHIA', 	'TXT_KEY_CITY_NAME_JFD_WALLACHIA_23'),
		('CIVILIZATION_JFD_WALLACHIA', 	'TXT_KEY_CITY_NAME_JFD_WALLACHIA_24'),
		('CIVILIZATION_JFD_WALLACHIA', 	'TXT_KEY_CITY_NAME_JFD_WALLACHIA_25'),
		('CIVILIZATION_JFD_WALLACHIA', 	'TXT_KEY_CITY_NAME_JFD_WALLACHIA_26'),
		('CIVILIZATION_JFD_WALLACHIA', 	'TXT_KEY_CITY_NAME_JFD_WALLACHIA_27'),
		('CIVILIZATION_JFD_WALLACHIA', 	'TXT_KEY_CITY_NAME_JFD_WALLACHIA_28'),
		('CIVILIZATION_JFD_WALLACHIA', 	'TXT_KEY_CITY_NAME_JFD_WALLACHIA_29'),
		('CIVILIZATION_JFD_WALLACHIA', 	'TXT_KEY_CITY_NAME_JFD_WALLACHIA_30');
--------------------------------	
-- Civilization_FreeBuildingClasses
--------------------------------			
INSERT INTO Civilization_FreeBuildingClasses 
		(CivilizationType, 				BuildingClassType)
SELECT	'CIVILIZATION_JFD_WALLACHIA',	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE CivilizationType = 'CIVILIZATION_POLAND';
--------------------------------	
-- Civilization_FreeTechs
--------------------------------		
INSERT INTO Civilization_FreeTechs 
		(CivilizationType, 				TechType)
SELECT	'CIVILIZATION_JFD_WALLACHIA',	TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_POLAND';
--------------------------------	
-- Civilization_FreeUnits
--------------------------------		
INSERT INTO Civilization_FreeUnits 
		(CivilizationType, 				UnitClassType, Count, UnitAIType)
SELECT	'CIVILIZATION_JFD_WALLACHIA',	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_RUSSIA';
--------------------------------	
-- Civilization_Leaders
--------------------------------			
INSERT INTO Civilization_Leaders 
		(CivilizationType, 				LeaderheadType)
VALUES	('CIVILIZATION_JFD_WALLACHIA', 	'LEADER_JFD_VLAD');	
--------------------------------	
-- Civilization_UnitClassOverrides 
--------------------------------		
INSERT INTO Civilization_UnitClassOverrides 
		(CivilizationType, 				UnitClassType, 				UnitType)
VALUES	('CIVILIZATION_JFD_WALLACHIA', 	'UNITCLASS_LONGSWORDSMAN', 	'UNIT_JFD_LEFEGII');
--------------------------------	
-- Civilization_BuildingClassOverrides
--------------------------------		
INSERT INTO Civilization_BuildingClassOverrides 
		(CivilizationType, 				BuildingClassType, 			BuildingType)
VALUES	('CIVILIZATION_JFD_WALLACHIA', 	'BUILDINGCLASS_TEMPLE',		'BUILDING_JFD_FORTIFIED_CHURCH');
--------------------------------	
-- Civilization_Religions
--------------------------------		
INSERT INTO Civilization_Religions 
		(CivilizationType, 				ReligionType)
SELECT	'CIVILIZATION_JFD_WALLACHIA',	ReligionType	
FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_POLAND';	
--------------------------------	
-- Civilization_SpyNames
--------------------------------		
INSERT INTO Civilization_SpyNames 
		(CivilizationType, 				SpyName)
VALUES	('CIVILIZATION_JFD_WALLACHIA', 	'TXT_KEY_SPY_NAME_JFD_WALLACHIA_0'),	
		('CIVILIZATION_JFD_WALLACHIA', 	'TXT_KEY_SPY_NAME_JFD_WALLACHIA_1'),
		('CIVILIZATION_JFD_WALLACHIA', 	'TXT_KEY_SPY_NAME_JFD_WALLACHIA_2'),
		('CIVILIZATION_JFD_WALLACHIA', 	'TXT_KEY_SPY_NAME_JFD_WALLACHIA_3'),
		('CIVILIZATION_JFD_WALLACHIA', 	'TXT_KEY_SPY_NAME_JFD_WALLACHIA_4'),
		('CIVILIZATION_JFD_WALLACHIA', 	'TXT_KEY_SPY_NAME_JFD_WALLACHIA_5'),
		('CIVILIZATION_JFD_WALLACHIA', 	'TXT_KEY_SPY_NAME_JFD_WALLACHIA_6'),
		('CIVILIZATION_JFD_WALLACHIA', 	'TXT_KEY_SPY_NAME_JFD_WALLACHIA_7'),
		('CIVILIZATION_JFD_WALLACHIA', 	'TXT_KEY_SPY_NAME_JFD_WALLACHIA_8'),
		('CIVILIZATION_JFD_WALLACHIA', 	'TXT_KEY_SPY_NAME_JFD_WALLACHIA_9');
--==========================================================================================================================
--==========================================================================================================================