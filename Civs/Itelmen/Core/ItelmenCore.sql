

INSERT INTO Buildings
(Type,                                 BuildingClass,    Cost, Espionage, EspionageModifier, GreatPeopleRateModifier, SpecialistType, SpecialistCount, GoldMaintenance, PrereqTech,    Description,                                              Help,                                     Civilopedia,                Strategy,   ArtDefineTag, MinAreaSize, AllowsFoodTradeRoutes, NeverCapture, Espionage, EspionageModifier, Happiness, HurryCostModifier, PortraitIndex, IconAtlas, GreatWorkSlotType, GreatWorkCount)
SELECT    'BUILDING_RHO_PEHMY',    BuildingClass,    Cost, Espionage, EspionageModifier, GreatPeopleRateModifier, SpecialistType, SpecialistCount, GoldMaintenance,  PrereqTech,   'TXT_KEY_BUILDING_RHO_PEHMY',    'TXT_KEY_BUILDING_RHO_PEHMY_HELP',    'TXT_KEY_BUILDING_RHO_PEHMY_TEXT',    'TXT_KEY_BUILDING_RHO_PEHMY_STRATEGY',    ArtDefineTag, MinAreaSize, AllowsFoodTradeRoutes, NeverCapture, Espionage, EspionageModifier, Happiness, HurryCostModifier, 4, 'ATLAS_RHO_ITELMEN', GreatWorkSlotType, GreatWorkCount
FROM Buildings WHERE Type = 'BUILDING_GRANARY';

INSERT INTO Building_ResourceYieldChanges
          (BuildingType,               ResourceType,YieldType,Yield)
VALUES    ('BUILDING_RHO_PEHMY',    'RESOURCE_DEER','YIELD_FOOD',1),
('BUILDING_RHO_PEHMY',    'RESOURCE_WHEAT','YIELD_FOOD',1),
('BUILDING_RHO_PEHMY',    'RESOURCE_SALT','YIELD_FOOD',1),
('BUILDING_RHO_PEHMY',    'RESOURCE_FISH','YIELD_FOOD',1);


INSERT INTO Building_Flavors
          (BuildingType,               FlavorType,    Flavor)
SELECT    'BUILDING_RHO_PEHMY',    FlavorType,    Flavor
FROM Building_Flavors WHERE BuildingType = 'BUILDING_GRANARY';

--Buildings
--Dummies:
INSERT INTO BuildingClasses 	
		(Type, 						 	DefaultBuilding, 				Description)
VALUES ('BUILDINGCLASS_RHO_KIST', 	null, 	'TXT_KEY_BUILDING_RHO_KIST'),
('BUILDINGCLASS_RHO_PEHMYPROD_DUMMY', 	'BUILDING_RHO_PEHMYPROD_DUMMY', 	'TXT_KEY_BUILDING_RHO_PEHMYPROD_DUMMY');

INSERT INTO Buildings 	
		(Type, 						 	BuildingClass, 			 			GreatWorkCount, UnmoddedHappiness,			Cost, FaithCost, PrereqTech,						 Description, 							Help, FoodKept, Happiness, PlotCultureCostModifier)
VALUES	('BUILDING_RHO_PEHMYPROD_DUMMY', 	'BUILDINGCLASS_RHO_PEHMYPROD_DUMMY',	-1, 	0,					-1,   -1, 		 null, 		 'TXT_KEY_TRAIT_RHO_COUNTLESS_CHILDREN_SHORT', 	'TXT_KEY_TRAIT_RHO_COUNTLESS_CHILDREN_SHORT', 0, 0, 0);

INSERT INTO Buildings
(Type,                                 BuildingClass,    Cost, Espionage, EspionageModifier, GreatPeopleRateModifier, SpecialistType, SpecialistCount, GoldMaintenance, PrereqTech,    Description,                                              Help,                                     Civilopedia,                Strategy,   ArtDefineTag, MinAreaSize, AllowsFoodTradeRoutes, NeverCapture, Espionage, EspionageModifier, Happiness, HurryCostModifier, PortraitIndex, IconAtlas, GreatWorkSlotType, GreatWorkCount, FoodKept)
SELECT    'BUILDING_RHO_KIST',    'BUILDINGCLASS_RHO_KIST',    Cost, Espionage, EspionageModifier, GreatPeopleRateModifier, SpecialistType, SpecialistCount, GoldMaintenance,  null,   'TXT_KEY_BUILDING_RHO_KIST',    'TXT_KEY_BUILDING_RHO_KIST_HELP',    'TXT_KEY_BUILDING_RHO_KIST_TEXT',    'TXT_KEY_BUILDING_RHO_KIST_STRATEGY',    ArtDefineTag, MinAreaSize, AllowsFoodTradeRoutes, NeverCapture, Espionage, EspionageModifier, Happiness, HurryCostModifier, 5, 'ATLAS_RHO_ITELMEN', GreatWorkSlotType, GreatWorkCount, 20
FROM Buildings WHERE Type = 'BUILDING_GRANARY';

INSERT INTO Building_YieldChanges
(BuildingType, YieldType, Yield)
VALUES ('BUILDING_RHO_PEHMYPROD_DUMMY', 'YIELD_PRODUCTION', 1),
('BUILDING_RHO_KIST', 'YIELD_FOOD', 2),
('BUILDING_RHO_KIST', 'YIELD_CULTURE', 1),
('BUILDING_RHO_PEHMY', 'YIELD_FOOD', 2);

INSERT INTO Building_ClassesNeededInCity
(BuildingType, BuildingClassType)
VALUES ('BUILDING_RHO_KIST', 'BUILDINGCLASS_GRANARY');

--Units
--Promotions
INSERT INTO UnitPromotions
       (Type,					Description,					Help,								Sound,				AttackMod,	HasPostCombatPromotions,	PortraitIndex, IconAtlas, CannotBeChosen, PediaType, PediaEntry)
VALUES ('PROMOTION_RHO_KAMMAMARK','TXT_KEY_PROMOTION_RHO_KAMMAMARK','TXT_KEY_PROMOTION_RHO_KAMMAMARK_HELP','AS2D_IF_LEVELUP', 	0,	0,				59, 'ABILITY_ATLAS',		1, 'PEDIA_ATTRIBUTES','TXT_KEY_PEDIA_PROMOTION_KAMMAMARK');


INSERT INTO Units
		(Type,						Class, PrereqTech, Combat, RangedCombat, Range, Cost, FaithCost, RequiresFaithPurchaseEnabled, Moves, CombatClass, Domain, DefaultUnitAI, MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, IgnoreBuildingDefense, GoodyHutUpgradeUnitClass, AdvancedStartCost, CombatLimit, Conscription, XPValueAttack, XPValueDefense, Description, Help, Strategy, Civilopedia, ShowInPedia,	MoveRate, UnitArtInfo, UnitFlagAtlas, UnitFlagIconOffset, IconAtlas, PortraitIndex)
SELECT	'UNIT_RHO_KAMMA', Class, PrereqTech,	Combat, RangedCombat, Range, Cost, FaithCost, RequiresFaithPurchaseEnabled, Moves, CombatClass, Domain, DefaultUnitAI, MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, IgnoreBuildingDefense, GoodyHutUpgradeUnitClass, AdvancedStartCost, CombatLimit, Conscription, XPValueAttack, XPValueDefense, 'TXT_KEY_UNIT_RHO_KAMMA',	'TXT_KEY_UNIT_RHO_KAMMA_HELP', 	'TXT_KEY_UNIT_RHO_KAMMA_STRATEGY', 	'TXT_KEY_UNIT_RHO_KAMMA_TEXT',	ShowInPedia, MoveRate, 'ART_DEF_UNIT_RHO_KAMMA',	'ALPHA_RHO_KAMMA', 0, 'ATLAS_RHO_ITELMEN', 3
FROM Units WHERE Type = 'UNIT_CROSSBOWMAN';

INSERT INTO Unit_AITypes 	
		(UnitType, 				UnitAIType)
SELECT	'UNIT_RHO_KAMMA', 	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_CROSSBOWMAN';

INSERT INTO UnitGameplay2DScripts
       (UnitType,           SelectionSound, FirstSelectionSound)
SELECT 'UNIT_RHO_KAMMA',  SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_CROSSBOWMAN';

INSERT INTO Unit_Flavors
       (UnitType,           FlavorType, Flavor)
SELECT 'UNIT_RHO_KAMMA',  FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_CROSSBOWMAN';

INSERT INTO Unit_FreePromotions
       (UnitType,           PromotionType)
SELECT 'UNIT_RHO_KAMMA',  PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_CROSSBOWMAN';
INSERT INTO Unit_FreePromotions
       (UnitType,           PromotionType)
VALUES ('UNIT_RHO_KAMMA', 'PROMOTION_WOODSMAN');

INSERT INTO Unit_YieldFromKills
	(UnitType, YieldType, Yield)
VALUES ('UNIT_RHO_KAMMA', 'YIELD_FAITH', 50);

INSERT INTO Unit_ClassUpgrades
       (UnitType,           UnitClassType)
SELECT 'UNIT_RHO_KAMMA',  UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_CROSSBOWMAN';


INSERT INTO Civilization_UnitClassOverrides
       (CivilizationType, UnitClassType, UnitType)
VALUES ('CIVILIZATION_RHO_ITELMEN', 'UNITCLASS_CROSSBOWMAN', 'UNIT_RHO_KAMMA');

--Leader

INSERT INTO Leaders
		(Type,					Description,					Civilopedia,						CivilopediaTag,				ArtDefineTag,								VictoryCompetitiveness,	WonderCompetitiveness,	MinorCivCompetitiveness,	Boldness,	DiploBalance,	WarmongerHate,	WorkAgainstWillingness,	WorkWithWillingness,	DenounceWillingness,	DoFWillingness,	Loyalty,	Neediness,	Forgiveness,	Chattiness,	Meanness,	PortraitIndex,	IconAtlas)
		VALUES	('LEADER_RHO_HARCHIN',	'TXT_KEY_LEADER_RHO_HARCHIN',		'TXT_KEY_LEADER_RHO_HARCHIN_PEDIA',	'TXT_KEY_PEDIA_RHO_HARCHIN',	'harchin_LS.xml',	9,						3,						4,						7,			5,				8,				7,						5,						6,						5,				3,			2,			3,				8,			4,			1,				'ATLAS_RHO_ITELMEN');

INSERT INTO Leader_MajorCivApproachBiases
		(LeaderType,			MajorCivApproachType,			Bias)
VALUES	('LEADER_RHO_HARCHIN',	'MAJOR_CIV_APPROACH_WAR',		8),
		('LEADER_RHO_HARCHIN',	'MAJOR_CIV_APPROACH_HOSTILE',	7),
		('LEADER_RHO_HARCHIN',	'MAJOR_CIV_APPROACH_DECEPTIVE',	6),
		('LEADER_RHO_HARCHIN',	'MAJOR_CIV_APPROACH_GUARDED',	4),
		('LEADER_RHO_HARCHIN',	'MAJOR_CIV_APPROACH_FRIENDLY',	4),
		('LEADER_RHO_HARCHIN',	'MAJOR_CIV_APPROACH_AFRAID',	3),
		('LEADER_RHO_HARCHIN',	'MAJOR_CIV_APPROACH_NEUTRAL',	6);
		


INSERT INTO Leader_MinorCivApproachBiases
		(LeaderType,			MinorCivApproachType,				Bias)
VALUES	('LEADER_RHO_HARCHIN',	'MINOR_CIV_APPROACH_IGNORE',		9),
		('LEADER_RHO_HARCHIN',	'MINOR_CIV_APPROACH_FRIENDLY',		7),
		('LEADER_RHO_HARCHIN',	'MINOR_CIV_APPROACH_PROTECTIVE',	3),
		('LEADER_RHO_HARCHIN',	'MINOR_CIV_APPROACH_CONQUEST',		5),
		('LEADER_RHO_HARCHIN',	'MINOR_CIV_APPROACH_BULLY',			4);

INSERT INTO Leader_Flavors
		(LeaderType, 			FlavorType,							Flavor)
VALUES	('LEADER_RHO_HARCHIN',	'FLAVOR_OFFENSE',					7),
		('LEADER_RHO_HARCHIN',	'FLAVOR_DEFENSE',					7),
		('LEADER_RHO_HARCHIN',	'FLAVOR_CITY_DEFENSE',				6),
		('LEADER_RHO_HARCHIN',	'FLAVOR_MILITARY_TRAINING',			5),
		('LEADER_RHO_HARCHIN',	'FLAVOR_RECON',						4),
		('LEADER_RHO_HARCHIN',	'FLAVOR_RANGED',					9),
		('LEADER_RHO_HARCHIN',	'FLAVOR_MOBILE',					5),
		('LEADER_RHO_HARCHIN',	'FLAVOR_NAVAL',						6),
		('LEADER_RHO_HARCHIN',	'FLAVOR_NAVAL_RECON',				3),
		('LEADER_RHO_HARCHIN',	'FLAVOR_NAVAL_GROWTH',				5),
		('LEADER_RHO_HARCHIN',	'FLAVOR_NAVAL_TILE_IMPROVEMENT',	3),
		('LEADER_RHO_HARCHIN',	'FLAVOR_AIR',						4),
		('LEADER_RHO_HARCHIN',	'FLAVOR_EXPANSION',					10),
		('LEADER_RHO_HARCHIN',	'FLAVOR_GROWTH',					11),
		('LEADER_RHO_HARCHIN',	'FLAVOR_TILE_IMPROVEMENT',			6),
		('LEADER_RHO_HARCHIN',	'FLAVOR_INFRASTRUCTURE',			5),
		('LEADER_RHO_HARCHIN',	'FLAVOR_PRODUCTION',				6),
		('LEADER_RHO_HARCHIN',	'FLAVOR_GOLD',						7),
		('LEADER_RHO_HARCHIN',	'FLAVOR_SCIENCE',					6),
		('LEADER_RHO_HARCHIN',	'FLAVOR_CULTURE',					5),
		('LEADER_RHO_HARCHIN',	'FLAVOR_HAPPINESS',					7),
		('LEADER_RHO_HARCHIN',	'FLAVOR_GREAT_PEOPLE',				6),
		('LEADER_RHO_HARCHIN',	'FLAVOR_WONDER',					6),
		('LEADER_RHO_HARCHIN',	'FLAVOR_RELIGION',					4),
		('LEADER_RHO_HARCHIN',	'FLAVOR_DIPLOMACY',					4),
		('LEADER_RHO_HARCHIN',	'FLAVOR_SPACESHIP',					5),
		('LEADER_RHO_HARCHIN',	'FLAVOR_WATER_CONNECTION',			6),
		('LEADER_RHO_HARCHIN',	'FLAVOR_NUKE',						7),
		('LEADER_RHO_HARCHIN',	'FLAVOR_USE_NUKE',					4),
		('LEADER_RHO_HARCHIN',	'FLAVOR_ESPIONAGE',					5),
		('LEADER_RHO_HARCHIN',	'FLAVOR_ANTIAIR',					5),
		('LEADER_RHO_HARCHIN',	'FLAVOR_AIR_CARRIER',				3),
		('LEADER_RHO_HARCHIN',	'FLAVOR_I_LAND_TRADE_ROUTE',		5),
		('LEADER_RHO_HARCHIN',	'FLAVOR_I_SEA_TRADE_ROUTE',			5),
		('LEADER_RHO_HARCHIN',	'FLAVOR_ARCHAEOLOGY',				5),
		('LEADER_RHO_HARCHIN',	'FLAVOR_I_TRADE_ORIGIN',			5),
		('LEADER_RHO_HARCHIN',	'FLAVOR_I_TRADE_DESTINATION',		5),
		('LEADER_RHO_HARCHIN',	'FLAVOR_AIRLIFT',					5);

INSERT INTO Traits
		(Type,				Description,				ShortDescription)
VALUES	('TRAIT_RHO_COUNTLESS_CHILDREN',	'TXT_KEY_TRAIT_RHO_COUNTLESS_CHILDREN',	'TXT_KEY_TRAIT_RHO_COUNTLESS_CHILDREN_SHORT');

-----

INSERT INTO Leader_Traits
		(LeaderType,			TraitType)
VALUES	('LEADER_RHO_HARCHIN',	'TRAIT_RHO_COUNTLESS_CHILDREN');

--Civilization

INSERT INTO Civilizations
		(Type,						Description,						CivilopediaTag,					ShortDescription,							Adjective,								DefaultPlayerColor,				ArtDefineTag,			ArtStyleType,		ArtStyleSuffix,	ArtStylePrefix,	PortraitIndex,	IconAtlas,				AlphaIconAtlas,			MapImage,		DawnOfManQuote,							DawnOfManImage)
VALUES	('CIVILIZATION_RHO_ITELMEN',	'TXT_KEY_CIVILIZATION_RHO_ITELMEN',	'TXT_KEY_PEDIA_RHO_ITELMEN',	'TXT_KEY_CIVILIZATION_RHO_ITELMEN_SHORT',	'TXT_KEY_CIVILIZATION_RHO_ITELMEN_ADJ',	'PLAYERCOLOR_RHO_ITELMEN',	'ART_DEF_CIVILIZATION_JAPAN',	'ARTSTYLE_ASIAN',	'_ASIA',		'ASIAN',		0,		'ATLAS_RHO_ITELMEN',	'ALPHA_RHO_ITELMEN',	'itelmen_map_small.dds',	'TXT_KEY_CIV5_DAWN_RHO_ITELMEN_TEXT',	'itelmen_dom.dds');

INSERT INTO Civilization_CityNames
		(CivilizationType,				CityName)
VALUES	('CIVILIZATION_RHO_ITELMEN',	'TXT_KEY_CITY_NAME_RHO_ITELMEN_1'),
		('CIVILIZATION_RHO_ITELMEN',	'TXT_KEY_CITY_NAME_RHO_ITELMEN_2'),
		('CIVILIZATION_RHO_ITELMEN',	'TXT_KEY_CITY_NAME_RHO_ITELMEN_3'),
		('CIVILIZATION_RHO_ITELMEN',	'TXT_KEY_CITY_NAME_RHO_ITELMEN_4'),
		('CIVILIZATION_RHO_ITELMEN',	'TXT_KEY_CITY_NAME_RHO_ITELMEN_5'),
		('CIVILIZATION_RHO_ITELMEN',	'TXT_KEY_CITY_NAME_RHO_ITELMEN_6'),
		('CIVILIZATION_RHO_ITELMEN',	'TXT_KEY_CITY_NAME_RHO_ITELMEN_7'),
		('CIVILIZATION_RHO_ITELMEN',	'TXT_KEY_CITY_NAME_RHO_ITELMEN_8'),
		('CIVILIZATION_RHO_ITELMEN',	'TXT_KEY_CITY_NAME_RHO_ITELMEN_9'),
		('CIVILIZATION_RHO_ITELMEN',	'TXT_KEY_CITY_NAME_RHO_ITELMEN_10'),
		('CIVILIZATION_RHO_ITELMEN',	'TXT_KEY_CITY_NAME_RHO_ITELMEN_11'),
		('CIVILIZATION_RHO_ITELMEN',	'TXT_KEY_CITY_NAME_RHO_ITELMEN_12'),
		('CIVILIZATION_RHO_ITELMEN',	'TXT_KEY_CITY_NAME_RHO_ITELMEN_13'),
		('CIVILIZATION_RHO_ITELMEN',	'TXT_KEY_CITY_NAME_RHO_ITELMEN_14'),
		('CIVILIZATION_RHO_ITELMEN',	'TXT_KEY_CITY_NAME_RHO_ITELMEN_15'),
		('CIVILIZATION_RHO_ITELMEN',	'TXT_KEY_CITY_NAME_RHO_ITELMEN_16'),
		('CIVILIZATION_RHO_ITELMEN',	'TXT_KEY_CITY_NAME_RHO_ITELMEN_17'),
		('CIVILIZATION_RHO_ITELMEN',	'TXT_KEY_CITY_NAME_RHO_ITELMEN_18'),
		('CIVILIZATION_RHO_ITELMEN',	'TXT_KEY_CITY_NAME_RHO_ITELMEN_19'),
		('CIVILIZATION_RHO_ITELMEN',	'TXT_KEY_CITY_NAME_RHO_ITELMEN_20'),
		('CIVILIZATION_RHO_ITELMEN',	'TXT_KEY_CITY_NAME_RHO_ITELMEN_21'),
		('CIVILIZATION_RHO_ITELMEN',	'TXT_KEY_CITY_NAME_RHO_ITELMEN_22'),
		('CIVILIZATION_RHO_ITELMEN',	'TXT_KEY_CITY_NAME_RHO_ITELMEN_23'),
		('CIVILIZATION_RHO_ITELMEN',	'TXT_KEY_CITY_NAME_RHO_ITELMEN_24'),
		('CIVILIZATION_RHO_ITELMEN',	'TXT_KEY_CITY_NAME_RHO_ITELMEN_25'),
		('CIVILIZATION_RHO_ITELMEN',	'TXT_KEY_CITY_NAME_RHO_ITELMEN_26'),
		('CIVILIZATION_RHO_ITELMEN',	'TXT_KEY_CITY_NAME_RHO_ITELMEN_27'),
		('CIVILIZATION_RHO_ITELMEN',	'TXT_KEY_CITY_NAME_RHO_ITELMEN_28'),
		('CIVILIZATION_RHO_ITELMEN',	'TXT_KEY_CITY_NAME_RHO_ITELMEN_29'),
		('CIVILIZATION_RHO_ITELMEN',	'TXT_KEY_CITY_NAME_RHO_ITELMEN_30'),
		('CIVILIZATION_RHO_ITELMEN',	'TXT_KEY_CITY_NAME_RHO_ITELMEN_31'),
		('CIVILIZATION_RHO_ITELMEN',	'TXT_KEY_CITY_NAME_RHO_ITELMEN_32'),
		('CIVILIZATION_RHO_ITELMEN',	'TXT_KEY_CITY_NAME_RHO_ITELMEN_33'),
		('CIVILIZATION_RHO_ITELMEN',	'TXT_KEY_CITY_NAME_RHO_ITELMEN_34'),
		('CIVILIZATION_RHO_ITELMEN',	'TXT_KEY_CITY_NAME_RHO_ITELMEN_35'),
		('CIVILIZATION_RHO_ITELMEN',	'TXT_KEY_CITY_NAME_RHO_ITELMEN_36'),
		('CIVILIZATION_RHO_ITELMEN',	'TXT_KEY_CITY_NAME_RHO_ITELMEN_37'),
		('CIVILIZATION_RHO_ITELMEN',	'TXT_KEY_CITY_NAME_RHO_ITELMEN_38'),
		('CIVILIZATION_RHO_ITELMEN',	'TXT_KEY_CITY_NAME_RHO_ITELMEN_39'),
		('CIVILIZATION_RHO_ITELMEN',	'TXT_KEY_CITY_NAME_RHO_ITELMEN_40'),
		('CIVILIZATION_RHO_ITELMEN',	'TXT_KEY_CITY_NAME_RHO_ITELMEN_41'),
		('CIVILIZATION_RHO_ITELMEN',	'TXT_KEY_CITY_NAME_RHO_ITELMEN_42'),
		('CIVILIZATION_RHO_ITELMEN',	'TXT_KEY_CITY_NAME_RHO_ITELMEN_43'),
		('CIVILIZATION_RHO_ITELMEN',	'TXT_KEY_CITY_NAME_RHO_ITELMEN_44'),
		('CIVILIZATION_RHO_ITELMEN',	'TXT_KEY_CITY_NAME_RHO_ITELMEN_45'),
		('CIVILIZATION_RHO_ITELMEN',	'TXT_KEY_CITY_NAME_RHO_ITELMEN_46'),
		('CIVILIZATION_RHO_ITELMEN',	'TXT_KEY_CITY_NAME_RHO_ITELMEN_47'),
		('CIVILIZATION_RHO_ITELMEN',	'TXT_KEY_CITY_NAME_RHO_ITELMEN_48'),
		('CIVILIZATION_RHO_ITELMEN',	'TXT_KEY_CITY_NAME_RHO_ITELMEN_49'),
		('CIVILIZATION_RHO_ITELMEN',	'TXT_KEY_CITY_NAME_RHO_ITELMEN_50'),
		('CIVILIZATION_RHO_ITELMEN',	'TXT_KEY_CITY_NAME_RHO_ITELMEN_51'),
		('CIVILIZATION_RHO_ITELMEN',	'TXT_KEY_CITY_NAME_RHO_ITELMEN_52'),
		('CIVILIZATION_RHO_ITELMEN',	'TXT_KEY_CITY_NAME_RHO_ITELMEN_53'),
		('CIVILIZATION_RHO_ITELMEN',	'TXT_KEY_CITY_NAME_RHO_ITELMEN_54'),
		('CIVILIZATION_RHO_ITELMEN',	'TXT_KEY_CITY_NAME_RHO_ITELMEN_55'),
		('CIVILIZATION_RHO_ITELMEN',	'TXT_KEY_CITY_NAME_RHO_ITELMEN_56'),
		('CIVILIZATION_RHO_ITELMEN',	'TXT_KEY_CITY_NAME_RHO_ITELMEN_57'),
		('CIVILIZATION_RHO_ITELMEN',	'TXT_KEY_CITY_NAME_RHO_ITELMEN_58'),
		('CIVILIZATION_RHO_ITELMEN',	'TXT_KEY_CITY_NAME_RHO_ITELMEN_59'),
		('CIVILIZATION_RHO_ITELMEN',	'TXT_KEY_CITY_NAME_RHO_ITELMEN_60'),
		('CIVILIZATION_RHO_ITELMEN',	'TXT_KEY_CITY_NAME_RHO_ITELMEN_61'),
		('CIVILIZATION_RHO_ITELMEN',	'TXT_KEY_CITY_NAME_RHO_ITELMEN_62'),
		('CIVILIZATION_RHO_ITELMEN',	'TXT_KEY_CITY_NAME_RHO_ITELMEN_63'),
		('CIVILIZATION_RHO_ITELMEN',	'TXT_KEY_CITY_NAME_RHO_ITELMEN_64'),
		('CIVILIZATION_RHO_ITELMEN',	'TXT_KEY_CITY_NAME_RHO_ITELMEN_65'),
		('CIVILIZATION_RHO_ITELMEN',	'TXT_KEY_CITY_NAME_RHO_ITELMEN_66'),
		('CIVILIZATION_RHO_ITELMEN',	'TXT_KEY_CITY_NAME_RHO_ITELMEN_67')
		;

INSERT INTO Civilization_FreeBuildingClasses
          (CivilizationType,              BuildingClassType)
SELECT    'CIVILIZATION_RHO_ITELMEN',     BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE CivilizationType = 'CIVILIZATION_ZULU';

INSERT INTO Civilization_FreeTechs
          (CivilizationType,              TechType)
SELECT    'CIVILIZATION_RHO_ITELMEN',     TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_ZULU';

INSERT INTO Civilization_FreeUnits
          (CivilizationType,              UnitClassType, Count, UnitAIType)
SELECT    'CIVILIZATION_RHO_ITELMEN',     UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_ZULU';

INSERT INTO Civilization_Leaders
       (CivilizationType,            LeaderheadType)
VALUES ('CIVILIZATION_RHO_ITELMEN', 'LEADER_RHO_HARCHIN');

INSERT INTO Civilization_BuildingClassOverrides
       (CivilizationType,            BuildingClassType,      BuildingType)
VALUES ('CIVILIZATION_RHO_ITELMEN', 'BUILDINGCLASS_GRANARY', 'BUILDING_RHO_PEHMY'),
('CIVILIZATION_RHO_ITELMEN', 'BUILDINGCLASS_RHO_KIST', 'BUILDING_RHO_KIST');



INSERT INTO Civilization_Religions
       (CivilizationType,            ReligionType)
SELECT    'CIVILIZATION_RHO_ITELMEN',     ReligionType
FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_JAPAN';

INSERT INTO Civilization_SpyNames
          (CivilizationType,                SpyName)
VALUES    ('CIVILIZATION_RHO_ITELMEN',     'TXT_KEY_SPY_NAME_RHO_ITELMEN_0'),
          ('CIVILIZATION_RHO_ITELMEN',     'TXT_KEY_SPY_NAME_RHO_ITELMEN_1'),
          ('CIVILIZATION_RHO_ITELMEN',     'TXT_KEY_SPY_NAME_RHO_ITELMEN_2'),
          ('CIVILIZATION_RHO_ITELMEN',     'TXT_KEY_SPY_NAME_RHO_ITELMEN_3'),
          ('CIVILIZATION_RHO_ITELMEN',     'TXT_KEY_SPY_NAME_RHO_ITELMEN_4'),
          ('CIVILIZATION_RHO_ITELMEN',     'TXT_KEY_SPY_NAME_RHO_ITELMEN_5'),
          ('CIVILIZATION_RHO_ITELMEN',     'TXT_KEY_SPY_NAME_RHO_ITELMEN_6'),
          ('CIVILIZATION_RHO_ITELMEN',     'TXT_KEY_SPY_NAME_RHO_ITELMEN_7'),
          ('CIVILIZATION_RHO_ITELMEN',     'TXT_KEY_SPY_NAME_RHO_ITELMEN_8'),
          ('CIVILIZATION_RHO_ITELMEN',     'TXT_KEY_SPY_NAME_RHO_ITELMEN_9');

INSERT INTO Civilization_Start_Along_River 
		(CivilizationType, 						StartAlongRiver)
VALUES	('CIVILIZATION_RHO_ITELMEN', 		1);

INSERT INTO Colors
(Type,                                        Red,     Green,    Blue,     Alpha)
VALUES    ('COLOR_PLAYER_RHO_ITELMEN_ICON',   0.137,   0.059,    0.082,    1),
('COLOR_PLAYER_RHO_ITELMEN_BACKGROUND',       0.620,   0.843,    0.780,    1);

INSERT INTO PlayerColors
          (Type,                              PrimaryColor,                                        SecondaryColor,                   TextColor)
VALUES    ('PLAYERCOLOR_RHO_ITELMEN',        'COLOR_PLAYER_RHO_ITELMEN_ICON',     'COLOR_PLAYER_RHO_ITELMEN_BACKGROUND',     'COLOR_PLAYER_WHITE_TEXT');

INSERT INTO Diplomacy_Responses
		(LeaderType, 					ResponseType, 							 			Response, 														Bias)
VALUES 	('LEADER_RHO_HARCHIN',	'RESPONSE_FIRST_GREETING', 			 			'TXT_KEY_LEADER_RHO_HARCHIN_FIRSTGREETING%', 			 				500),
('LEADER_RHO_HARCHIN',	'RESPONSE_DOW_GENERIC', 			 			'TXT_KEY_LEADER_RHO_HARCHIN_DOWGENERIC%', 			 				500),
('LEADER_RHO_HARCHIN',	'RESPONSE_ATTACKED_HOSTILE', 			 			'TXT_KEY_LEADER_RHO_HARCHIN_ATTACKEDHOSTILE%', 			 				500),
('LEADER_RHO_HARCHIN',	'RESPONSE_DEFEATED', 			 			'TXT_KEY_LEADER_RHO_HARCHIN_DEFEATED%', 			 				500),
('LEADER_RHO_HARCHIN','RESPONSE_WORK_AGAINST_SOMEONE',									'TXT_KEY_LEADER_RHO_HARCHIN_DENOUNCE%',500);