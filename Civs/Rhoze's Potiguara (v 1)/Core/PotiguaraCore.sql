

INSERT INTO Buildings
(Type,                                 BuildingClass,    Cost, Espionage, EspionageModifier, GreatPeopleRateModifier, SpecialistType, SpecialistCount, GoldMaintenance, PrereqTech,    Description,                                              Help,                                     Civilopedia,                Strategy,   ArtDefineTag, MinAreaSize, AllowsFoodTradeRoutes, NeverCapture, Espionage, EspionageModifier, Happiness, HurryCostModifier, PortraitIndex, IconAtlas, GreatWorkSlotType, GreatWorkCount)
SELECT    'BUILDING_RHO_SHRIMPPOND',    BuildingClass,    Cost, Espionage, EspionageModifier, GreatPeopleRateModifier, SpecialistType, SpecialistCount, GoldMaintenance,  PrereqTech,   'TXT_KEY_BUILDING_RHO_SHRIMPPOND',    'TXT_KEY_BUILDING_RHO_SHRIMPPOND_HELP',    'TXT_KEY_BUILDING_RHO_SHRIMPPOND_TEXT',    'TXT_KEY_BUILDING_RHO_SHRIMPPOND_STRATEGY',    ArtDefineTag, MinAreaSize, AllowsFoodTradeRoutes, NeverCapture, Espionage, EspionageModifier, Happiness, HurryCostModifier, PortraitIndex, IconAtlas, GreatWorkSlotType, GreatWorkCount
FROM Buildings WHERE Type = 'BUILDING_WATERMILL';

INSERT INTO Building_ResourceYieldChanges
          (BuildingType,               ResourceType,YieldType,Yield)
SELECT    'BUILDING_RHO_SHRIMPPOND',    ResourceType,YieldType,Yield
FROM Building_ResourceYieldChanges WHERE BuildingType = 'BUILDING_WATERMILL';

INSERT INTO Building_YieldChanges
(BuildingType,YieldType,Yield)
SELECT  'BUILDING_RHO_SHRIMPPOND',YieldType, Yield
FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_WATERMILL';

INSERT INTO Building_Flavors
          (BuildingType,               FlavorType,    Flavor)
SELECT    'BUILDING_RHO_SHRIMPPOND',    FlavorType,    Flavor
FROM Building_Flavors WHERE BuildingType = 'BUILDING_WATERMILL';

--Buildings
--Dummies:
INSERT INTO BuildingClasses 	
		(Type, 						 	DefaultBuilding, 				Description)
VALUES	('BUILDINGCLASS_RHO_POTIGUARASHRIMPMARK_DUMMY', 	'BUILDING_RHO_POTIGUARASHRIMPMARK_DUMMY', 	'TXT_KEY_BUILDING_RHO_POTIGUARASHRIMPMARK_DUMMY'),
('BUILDINGCLASS_RHO_POTIGUARAPHUSAMARK_DUMMY', 	'BUILDING_RHO_POTIGUARAPHUSAMARK_DUMMY', 	'TXT_KEY_BUILDING_RHO_POTIGUARAPHUSAMARK_DUMMY');

INSERT INTO Buildings 	
		(Type, 						 	BuildingClass, 			 			GreatWorkCount, UnmoddedHappiness,			Cost, FaithCost, PrereqTech,						 Description, 							Help, FoodKept, Happiness, PlotCultureCostModifier)
VALUES	('BUILDING_RHO_POTIGUARASHRIMPMARK_DUMMY', 	'BUILDINGCLASS_RHO_POTIGUARASHRIMPMARK_DUMMY',	-1, 	0,					-1,   -1, 		 null, 		 'TXT_KEY_TRAIT_RHO_DIVINE_LIGHT_SHORT', 	'TXT_KEY_TRAIT_RHO_DIVINE_LIGHT_SHORT', 0, 0, 0),
('BUILDING_RHO_POTIGUARAPHUSAMARK_DUMMY', 	'BUILDINGCLASS_RHO_POTIGUARAPHUSAMARK_DUMMY',	-1, 	0,					-1,   -1, 		 null, 		 'TXT_KEY_TRAIT_RHO_DIVINE_LIGHT_SHORT', 	'TXT_KEY_TRAIT_RHO_DIVINE_LIGHT_SHORT', 0, 0, 0);

--Resource
INSERT INTO Resources
	(Type,							TechCityTrade,	Happiness, Description,					Civilopedia,								ResourceClassType,				ArtDefineTag,	'Unique',				IconString,	PortraitIndex,	IconAtlas)
VALUES	('RESOURCE_RHO_POTISHRIMP',	'TECH_SAILING', 0,		'TXT_KEY_RESOURCE_RHO_POTISHRIMP',	'TXT_KEY_RESOURCE_RHO_POTISHRIMP_TEXT',	'RESOURCECLASS_BONUS',	'ART_DEF_RESOURCE_RHO_POTISHRIMP',	1,	'[ICON_RES_POTISHRIMP]',	0,	'ATLAS_RHO_POTISHRIMP');

INSERT INTO Resource_YieldChanges
	(ResourceType,	YieldType,	Yield)
VALUES	('RESOURCE_RHO_POTISHRIMP',	'YIELD_FOOD',	1),
('RESOURCE_RHO_POTISHRIMP',	'YIELD_CULTURE',	1);

INSERT INTO Resource_Flavors
	(ResourceType,	FlavorType,	Flavor)
VALUES	('RESOURCE_RHO_POTISHRIMP',	'FLAVOR_GROWTH',	15),
('RESOURCE_RHO_POTISHRIMP',	'FLAVOR_GOLD',	15);

INSERT INTO Improvement_ResourceTypes
	(ImprovementType,	ResourceType)
VALUES	('IMPROVEMENT_FISHING_BOATS',	'RESOURCE_RHO_POTISHRIMP');

INSERT INTO Improvement_ResourceType_Yields
	(ImprovementType,	ResourceType, YieldType, Yield)
VALUES	('IMPROVEMENT_FISHING_BOATS',	'RESOURCE_RHO_POTISHRIMP',	'YIELD_GOLD',	1);
--Units
--Promotions
INSERT INTO UnitPromotions
       (Type,					Description,					Help,									Sound,		AttackMod, 	DefenseMod,		PortraitIndex, IconAtlas, CannotBeChosen, PediaType, PediaEntry, EmbarkDefenseModifier, EmbarkExtraVisibility, HealOutsideFriendly, EnemyHealChange, NeutralHealChange)
VALUES ('PROMOTION_RHO_POTIGUARA_PHUSACONVERT','TXT_KEY_PROMOTION_RHO_POTIGUARA_PHUSACONVERT','TXT_KEY_PROMOTION_RHO_POTIGUARA_PHUSACONVERT_HELP','AS2D_IF_LEVELUP', 	0, 0,			59, 'ABILITY_ATLAS',		1, 'PEDIA_ATTRIBUTES','TXT_KEY_PEDIA_PROMOTION_RHO_POTIGUARA_PHUSACONVERT', 0, 0, 0, 0, 0),
('PROMOTION_RHO_POTIGUARA_WEAKMARK','TXT_KEY_PROMOTION_RHO_POTIGUARA_WEAKMARK','TXT_KEY_PROMOTION_RHO_POTIGUARA_WEAKMARK_HELP','AS2D_IF_LEVELUP', 	0, 0,			57, 'ABILITY_ATLAS',		1, 'PEDIA_ATTRIBUTES','TXT_KEY_PEDIA_PROMOTION_RHO_POTIGUARA_WEAKMARK', 0, 0, 0, 0, 0);

INSERT INTO Units
		(Type,						Class, PrereqTech, Combat, RangedCombat, Cost, FaithCost, RequiresFaithPurchaseEnabled, Moves, Range, CombatClass, Domain, DefaultUnitAI, MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, IgnoreBuildingDefense, GoodyHutUpgradeUnitClass, AdvancedStartCost, CombatLimit, Conscription, XPValueAttack, XPValueDefense, Description, Help, Strategy, Civilopedia, ShowInPedia,	MoveRate, UnitArtInfo, UnitFlagAtlas, UnitFlagIconOffset, IconAtlas, PortraitIndex)
SELECT	'UNIT_RHO_PHUSA', Class, PrereqTech,	Combat, RangedCombat, Cost, FaithCost, RequiresFaithPurchaseEnabled, Moves, Range, CombatClass, Domain, DefaultUnitAI, MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, IgnoreBuildingDefense, GoodyHutUpgradeUnitClass, AdvancedStartCost, CombatLimit, Conscription, XPValueAttack, XPValueDefense, 'TXT_KEY_UNIT_RHO_PHUSA',	'TXT_KEY_UNIT_RHO_PHUSA_HELP', 	'TXT_KEY_UNIT_RHO_PHUSA_STRATEGY', 	'TXT_KEY_UNIT_RHO_PHUSA_TEXT',	ShowInPedia, MoveRate, 'ART_DEF_UNIT_RHO_PHUSA',	'ALPHA_RHO_PHUSA', 0, IconAtlas, PortraitIndex
FROM Units WHERE Type = 'UNIT_SPEARMAN';

INSERT INTO Unit_AITypes 	
		(UnitType, 				UnitAIType)
SELECT	'UNIT_RHO_PHUSA', 	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_SPEARMAN';

INSERT INTO UnitGameplay2DScripts
       (UnitType,           SelectionSound, FirstSelectionSound)
SELECT 'UNIT_RHO_PHUSA',  SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_SPEARMAN';

INSERT INTO Unit_Flavors
       (UnitType,           FlavorType, Flavor)
SELECT 'UNIT_RHO_PHUSA',  FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_SPEARMAN';

INSERT INTO Unit_FreePromotions
       (UnitType,           PromotionType)
SELECT 'UNIT_RHO_PHUSA',  PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_SPEARMAN';
INSERT INTO Unit_FreePromotions
       (UnitType,           PromotionType)
VALUES ('UNIT_RHO_PHUSA',  'PROMOTION_RHO_POTIGUARA_PHUSACONVERT'),
('UNIT_RHO_PHUSA',  'PROMOTION_AMPHIBIOUS');

INSERT INTO Unit_ClassUpgrades
       (UnitType,           UnitClassType)
SELECT 'UNIT_RHO_PHUSA',  UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_SPEARMAN';


INSERT INTO Civilization_UnitClassOverrides
       (CivilizationType, UnitClassType, UnitType)
VALUES ('CIVILIZATION_RHO_POTIGUARA', 'UNITCLASS_SPEARMAN', 'UNIT_RHO_PHUSA');

--Leader

INSERT INTO Leaders
		(Type,					Description,					Civilopedia,						CivilopediaTag,				ArtDefineTag,										VictoryCompetitiveness,	WonderCompetitiveness,	MinorCivCompetitiveness,	Boldness,	DiploBalance,	WarmongerHate,	WorkAgainstWillingness,	WorkWithWillingness,	DenounceWillingness,	DoFWillingness,	Loyalty,	Neediness,	Forgiveness,	Chattiness,	Meanness,	PortraitIndex,	IconAtlas)
		VALUES	('LEADER_RHO_INIGUACU',	'TXT_KEY_LEADER_RHO_INIGUACU',		'TXT_KEY_LEADER_RHO_INIGUACU_PEDIA',	'TXT_KEY_PEDIA_RHO_INIGUACU',	'Denmark_Bluetooth_Scene.xml',	8,						6,						4,						8,			3,				6,				6,						5,						8,						8,				7,			4,			3,				4,			6,			0,				'ISABELLA_LEADER_ATLAS');

INSERT INTO Leader_MajorCivApproachBiases
		(LeaderType,			MajorCivApproachType,			Bias)
VALUES	('LEADER_RHO_INIGUACU',	'MAJOR_CIV_APPROACH_WAR',		6),
		('LEADER_RHO_INIGUACU',	'MAJOR_CIV_APPROACH_HOSTILE',	7),
		('LEADER_RHO_INIGUACU',	'MAJOR_CIV_APPROACH_DECEPTIVE',	5),
		('LEADER_RHO_INIGUACU',	'MAJOR_CIV_APPROACH_GUARDED',	8),
		('LEADER_RHO_INIGUACU',	'MAJOR_CIV_APPROACH_FRIENDLY',	6),
		('LEADER_RHO_INIGUACU',	'MAJOR_CIV_APPROACH_AFRAID',	4),
		('LEADER_RHO_INIGUACU',	'MAJOR_CIV_APPROACH_NEUTRAL',	4);
		


INSERT INTO Leader_MinorCivApproachBiases
		(LeaderType,			MinorCivApproachType,				Bias)
VALUES	('LEADER_RHO_INIGUACU',	'MINOR_CIV_APPROACH_IGNORE',		2),
		('LEADER_RHO_INIGUACU',	'MINOR_CIV_APPROACH_FRIENDLY',		4),
		('LEADER_RHO_INIGUACU',	'MINOR_CIV_APPROACH_PROTECTIVE',	2),
		('LEADER_RHO_INIGUACU',	'MINOR_CIV_APPROACH_CONQUEST',		8),
		('LEADER_RHO_INIGUACU',	'MINOR_CIV_APPROACH_BULLY',			4);

INSERT INTO Leader_Flavors
		(LeaderType, 			FlavorType,							Flavor)
VALUES	('LEADER_RHO_INIGUACU',	'FLAVOR_OFFENSE',					6),
		('LEADER_RHO_INIGUACU',	'FLAVOR_DEFENSE',					7),
		('LEADER_RHO_INIGUACU',	'FLAVOR_CITY_DEFENSE',				2),
		('LEADER_RHO_INIGUACU',	'FLAVOR_MILITARY_TRAINING',			4),
		('LEADER_RHO_INIGUACU',	'FLAVOR_RECON',						5),
		('LEADER_RHO_INIGUACU',	'FLAVOR_RANGED',					6),
		('LEADER_RHO_INIGUACU',	'FLAVOR_MOBILE',					4),
		('LEADER_RHO_INIGUACU',	'FLAVOR_NAVAL',						7),
		('LEADER_RHO_INIGUACU',	'FLAVOR_NAVAL_RECON',				6),
		('LEADER_RHO_INIGUACU',	'FLAVOR_NAVAL_GROWTH',				7),
		('LEADER_RHO_INIGUACU',	'FLAVOR_NAVAL_TILE_IMPROVEMENT',	8),
		('LEADER_RHO_INIGUACU',	'FLAVOR_AIR',						7),
		('LEADER_RHO_INIGUACU',	'FLAVOR_EXPANSION',					10),
		('LEADER_RHO_INIGUACU',	'FLAVOR_GROWTH',					7),
		('LEADER_RHO_INIGUACU',	'FLAVOR_TILE_IMPROVEMENT',			5),
		('LEADER_RHO_INIGUACU',	'FLAVOR_INFRASTRUCTURE',			5),
		('LEADER_RHO_INIGUACU',	'FLAVOR_PRODUCTION',				7),
		('LEADER_RHO_INIGUACU',	'FLAVOR_GOLD',						7),
		('LEADER_RHO_INIGUACU',	'FLAVOR_SCIENCE',					5),
		('LEADER_RHO_INIGUACU',	'FLAVOR_CULTURE',					6),
		('LEADER_RHO_INIGUACU',	'FLAVOR_HAPPINESS',					7),
		('LEADER_RHO_INIGUACU',	'FLAVOR_GREAT_PEOPLE',				6),
		('LEADER_RHO_INIGUACU',	'FLAVOR_WONDER',					5),
		('LEADER_RHO_INIGUACU',	'FLAVOR_RELIGION',					4),
		('LEADER_RHO_INIGUACU',	'FLAVOR_DIPLOMACY',					6),
		('LEADER_RHO_INIGUACU',	'FLAVOR_SPACESHIP',					5),
		('LEADER_RHO_INIGUACU',	'FLAVOR_WATER_CONNECTION',			6),
		('LEADER_RHO_INIGUACU',	'FLAVOR_NUKE',						5),
		('LEADER_RHO_INIGUACU',	'FLAVOR_USE_NUKE',					7),
		('LEADER_RHO_INIGUACU',	'FLAVOR_ESPIONAGE',					5),
		('LEADER_RHO_INIGUACU',	'FLAVOR_ANTIAIR',					6),
		('LEADER_RHO_INIGUACU',	'FLAVOR_AIR_CARRIER',				3),
		('LEADER_RHO_INIGUACU',	'FLAVOR_I_LAND_TRADE_ROUTE',		5),
		('LEADER_RHO_INIGUACU',	'FLAVOR_I_SEA_TRADE_ROUTE',			5),
		('LEADER_RHO_INIGUACU',	'FLAVOR_ARCHAEOLOGY',				5),
		('LEADER_RHO_INIGUACU',	'FLAVOR_I_TRADE_ORIGIN',			5),
		('LEADER_RHO_INIGUACU',	'FLAVOR_I_TRADE_DESTINATION',		5),
		('LEADER_RHO_INIGUACU',	'FLAVOR_AIRLIFT',					5);

INSERT INTO Traits
		(Type,				Description,				ShortDescription)
VALUES	('TRAIT_RHO_DIVINE_LIGHT',	'TXT_KEY_TRAIT_RHO_DIVINE_LIGHT',	'TXT_KEY_TRAIT_RHO_DIVINE_LIGHT_SHORT');

-----

INSERT INTO Leader_Traits
		(LeaderType,			TraitType)
VALUES	('LEADER_RHO_INIGUACU',	'TRAIT_RHO_DIVINE_LIGHT');

--Civilization

INSERT INTO Civilizations
		(Type,						Description,						CivilopediaTag,					ShortDescription,							Adjective,								DefaultPlayerColor,				ArtDefineTag,			ArtStyleType,		ArtStyleSuffix,	ArtStylePrefix,	PortraitIndex,	IconAtlas,				AlphaIconAtlas,			MapImage,		DawnOfManQuote,							DawnOfManImage)
VALUES	('CIVILIZATION_RHO_POTIGUARA',	'TXT_KEY_CIVILIZATION_RHO_POTIGUARA',	'TXT_KEY_PEDIA_RHO_POTIGUARA',	'TXT_KEY_CIVILIZATION_RHO_POTIGUARA_SHORT',	'TXT_KEY_CIVILIZATION_RHO_POTIGUARA_ADJ',	'PLAYERCOLOR_RHO_POTIGUARA',	'ART_DEF_CIVILIZATION_JAPAN',	'ARTSTYLE_ASIAN',	'_ASIA',		'ASIAN',		0,				'ATLAS_RHO_POTIGUARA',	'ALPHA_RHO_POTIGUARA',	'PEMON_Map.dds',	'TXT_KEY_CIV5_DAWN_RHO_POTIGUARA_TEXT',	'PEMON_DoM.dds');

INSERT INTO Civilization_CityNames
		(CivilizationType,				CityName)
VALUES	('CIVILIZATION_RHO_POTIGUARA',	'TXT_KEY_CITY_NAME_RHO_POTIGUARA_1'),
		('CIVILIZATION_RHO_POTIGUARA',	'TXT_KEY_CITY_NAME_RHO_POTIGUARA_2'),
		('CIVILIZATION_RHO_POTIGUARA',	'TXT_KEY_CITY_NAME_RHO_POTIGUARA_3'),
		('CIVILIZATION_RHO_POTIGUARA',	'TXT_KEY_CITY_NAME_RHO_POTIGUARA_4'),
		('CIVILIZATION_RHO_POTIGUARA',	'TXT_KEY_CITY_NAME_RHO_POTIGUARA_5'),
		('CIVILIZATION_RHO_POTIGUARA',	'TXT_KEY_CITY_NAME_RHO_POTIGUARA_6'),
		('CIVILIZATION_RHO_POTIGUARA',	'TXT_KEY_CITY_NAME_RHO_POTIGUARA_7'),
		('CIVILIZATION_RHO_POTIGUARA',	'TXT_KEY_CITY_NAME_RHO_POTIGUARA_8'),
		('CIVILIZATION_RHO_POTIGUARA',	'TXT_KEY_CITY_NAME_RHO_POTIGUARA_9'),
		('CIVILIZATION_RHO_POTIGUARA',	'TXT_KEY_CITY_NAME_RHO_POTIGUARA_10'),
		('CIVILIZATION_RHO_POTIGUARA',	'TXT_KEY_CITY_NAME_RHO_POTIGUARA_11'),
		('CIVILIZATION_RHO_POTIGUARA',	'TXT_KEY_CITY_NAME_RHO_POTIGUARA_12'),
		('CIVILIZATION_RHO_POTIGUARA',	'TXT_KEY_CITY_NAME_RHO_POTIGUARA_13'),
		('CIVILIZATION_RHO_POTIGUARA',	'TXT_KEY_CITY_NAME_RHO_POTIGUARA_14'),
		('CIVILIZATION_RHO_POTIGUARA',	'TXT_KEY_CITY_NAME_RHO_POTIGUARA_15'),
		('CIVILIZATION_RHO_POTIGUARA',	'TXT_KEY_CITY_NAME_RHO_POTIGUARA_16'),
		('CIVILIZATION_RHO_POTIGUARA',	'TXT_KEY_CITY_NAME_RHO_POTIGUARA_17'),
		('CIVILIZATION_RHO_POTIGUARA',	'TXT_KEY_CITY_NAME_RHO_POTIGUARA_18'),
		('CIVILIZATION_RHO_POTIGUARA',	'TXT_KEY_CITY_NAME_RHO_POTIGUARA_19'),
		('CIVILIZATION_RHO_POTIGUARA',	'TXT_KEY_CITY_NAME_RHO_POTIGUARA_20'),
		('CIVILIZATION_RHO_POTIGUARA',	'TXT_KEY_CITY_NAME_RHO_POTIGUARA_21'),
		('CIVILIZATION_RHO_POTIGUARA',	'TXT_KEY_CITY_NAME_RHO_POTIGUARA_22'),
		('CIVILIZATION_RHO_POTIGUARA',	'TXT_KEY_CITY_NAME_RHO_POTIGUARA_23'),
		('CIVILIZATION_RHO_POTIGUARA',	'TXT_KEY_CITY_NAME_RHO_POTIGUARA_24'),
		('CIVILIZATION_RHO_POTIGUARA',	'TXT_KEY_CITY_NAME_RHO_POTIGUARA_25'),
		('CIVILIZATION_RHO_POTIGUARA',	'TXT_KEY_CITY_NAME_RHO_POTIGUARA_26'),
		('CIVILIZATION_RHO_POTIGUARA',	'TXT_KEY_CITY_NAME_RHO_POTIGUARA_27'),
		('CIVILIZATION_RHO_POTIGUARA',	'TXT_KEY_CITY_NAME_RHO_POTIGUARA_28'),
		('CIVILIZATION_RHO_POTIGUARA',	'TXT_KEY_CITY_NAME_RHO_POTIGUARA_29'),
		('CIVILIZATION_RHO_POTIGUARA',	'TXT_KEY_CITY_NAME_RHO_POTIGUARA_30'),
		('CIVILIZATION_RHO_POTIGUARA',	'TXT_KEY_CITY_NAME_RHO_POTIGUARA_31'),
		('CIVILIZATION_RHO_POTIGUARA',	'TXT_KEY_CITY_NAME_RHO_POTIGUARA_32'),
		('CIVILIZATION_RHO_POTIGUARA',	'TXT_KEY_CITY_NAME_RHO_POTIGUARA_33'),
		('CIVILIZATION_RHO_POTIGUARA',	'TXT_KEY_CITY_NAME_RHO_POTIGUARA_34'),
		('CIVILIZATION_RHO_POTIGUARA',	'TXT_KEY_CITY_NAME_RHO_POTIGUARA_35'),
		('CIVILIZATION_RHO_POTIGUARA',	'TXT_KEY_CITY_NAME_RHO_POTIGUARA_36'),
		('CIVILIZATION_RHO_POTIGUARA',	'TXT_KEY_CITY_NAME_RHO_POTIGUARA_37')
		;

INSERT INTO Civilization_FreeBuildingClasses
          (CivilizationType,              BuildingClassType)
SELECT    'CIVILIZATION_RHO_POTIGUARA',     BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE CivilizationType = 'CIVILIZATION_ZULU';

INSERT INTO Civilization_FreeTechs
          (CivilizationType,              TechType)
SELECT    'CIVILIZATION_RHO_POTIGUARA',     TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_ZULU';

INSERT INTO Civilization_FreeUnits
          (CivilizationType,              UnitClassType, Count, UnitAIType)
SELECT    'CIVILIZATION_RHO_POTIGUARA',     UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_ZULU';

INSERT INTO Civilization_Leaders
       (CivilizationType,            LeaderheadType)
VALUES ('CIVILIZATION_RHO_POTIGUARA', 'LEADER_RHO_INIGUACU');

INSERT INTO Civilization_BuildingClassOverrides
       (CivilizationType,            BuildingClassType,      BuildingType)
VALUES ('CIVILIZATION_RHO_POTIGUARA', 'BUILDINGCLASS_WATERMILL', 'BUILDING_RHO_SHRIMPPOND');



INSERT INTO Civilization_Religions
       (CivilizationType,            ReligionType)
SELECT    'CIVILIZATION_RHO_POTIGUARA',     ReligionType
FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_BRAZIL';

INSERT INTO Civilization_SpyNames
          (CivilizationType,                SpyName)
VALUES    ('CIVILIZATION_RHO_POTIGUARA',     'TXT_KEY_SPY_NAME_RHO_POTIGUARA_0'),
          ('CIVILIZATION_RHO_POTIGUARA',     'TXT_KEY_SPY_NAME_RHO_POTIGUARA_1'),
          ('CIVILIZATION_RHO_POTIGUARA',     'TXT_KEY_SPY_NAME_RHO_POTIGUARA_2'),
          ('CIVILIZATION_RHO_POTIGUARA',     'TXT_KEY_SPY_NAME_RHO_POTIGUARA_3'),
          ('CIVILIZATION_RHO_POTIGUARA',     'TXT_KEY_SPY_NAME_RHO_POTIGUARA_4'),
          ('CIVILIZATION_RHO_POTIGUARA',     'TXT_KEY_SPY_NAME_RHO_POTIGUARA_5'),
          ('CIVILIZATION_RHO_POTIGUARA',     'TXT_KEY_SPY_NAME_RHO_POTIGUARA_6'),
          ('CIVILIZATION_RHO_POTIGUARA',     'TXT_KEY_SPY_NAME_RHO_POTIGUARA_7'),
          ('CIVILIZATION_RHO_POTIGUARA',     'TXT_KEY_SPY_NAME_RHO_POTIGUARA_8'),
          ('CIVILIZATION_RHO_POTIGUARA',     'TXT_KEY_SPY_NAME_RHO_POTIGUARA_9');

INSERT INTO Civilization_Start_Along_River
		(CivilizationType, 						StartAlongRiver)
VALUES	('CIVILIZATION_RHO_POTIGUARA', 		1);

INSERT INTO Colors
(Type,                                        Red,     Green,    Blue,     Alpha)
VALUES    ('COLOR_PLAYER_RHO_POTIGUARA_ICON',   0.941,   0.443,    0.345,    1),
('COLOR_PLAYER_RHO_POTIGUARA_BACKGROUND',       0.055,   0.165,    0.216,    1);

INSERT INTO PlayerColors
          (Type,                              PrimaryColor,                                        SecondaryColor,                   TextColor)
VALUES    ('PLAYERCOLOR_RHO_POTIGUARA',        'COLOR_PLAYER_RHO_POTIGUARA_ICON',     'COLOR_PLAYER_RHO_POTIGUARA_BACKGROUND',     'COLOR_PLAYER_WHITE_TEXT');