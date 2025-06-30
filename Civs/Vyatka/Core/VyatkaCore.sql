--Buildings
INSERT INTO Buildings
(Type,                                 BuildingClass,    Cost, Espionage, EspionageModifier, GreatPeopleRateModifier, SpecialistType, SpecialistCount, GoldMaintenance, PrereqTech,    Description,                                              Help,                                     Civilopedia,                Strategy,   ArtDefineTag, MinAreaSize, AllowsFoodTradeRoutes, NeverCapture, Espionage, EspionageModifier, Happiness, HurryCostModifier, PortraitIndex, IconAtlas, GreatWorkSlotType, GreatWorkCount)
SELECT    'BUILDING_RHO_TOYMAKER',    BuildingClass,    Cost, Espionage, EspionageModifier, GreatPeopleRateModifier, SpecialistType, SpecialistCount, GoldMaintenance,  PrereqTech,   'TXT_KEY_BUILDING_RHO_TOYMAKER',    'TXT_KEY_BUILDING_RHO_TOYMAKER_HELP',    'TXT_KEY_BUILDING_RHO_TOYMAKER_TEXT',    'TXT_KEY_BUILDING_RHO_TOYMAKER_STRATEGY',    ArtDefineTag, MinAreaSize, AllowsFoodTradeRoutes, NeverCapture, Espionage, EspionageModifier, Happiness, HurryCostModifier, 3, 'ATLAS_RHO_VYATKA', GreatWorkSlotType, GreatWorkCount
FROM Buildings WHERE Type = 'BUILDING_THEATRE';

INSERT INTO Building_ResourceYieldChanges
          (BuildingType,               ResourceType,YieldType,Yield)
SELECT    'BUILDING_RHO_TOYMAKER',    ResourceType,YieldType,Yield
FROM Building_ResourceYieldChanges WHERE BuildingType = 'BUILDING_THEATRE';

INSERT INTO Building_UnitCombatProductionModifiers
	(BuildingType, UnitCombatType, Modifier)
SELECT 'BUILDING_RHO_TOYMAKER', UnitCombatType, Modifier
FROM Building_UnitCombatProductionModifiers WHERE BuildingType = 'BUILDING_THEATRE';

INSERT INTO Building_Flavors
          (BuildingType,               FlavorType,    Flavor)
SELECT    'BUILDING_RHO_TOYMAKER',    FlavorType,    Flavor
FROM Building_Flavors WHERE BuildingType = 'BUILDING_THEATRE';
INSERT INTO Building_Flavors
          (BuildingType,               FlavorType,    Flavor)
VALUES ('BUILDING_RHO_TOYMAKER', 'FLAVOR_CULTURE', 25),
('BUILDING_RHO_TOYMAKER', 'FLAVOR_GOLD', 20);

INSERT INTO Civilization_BuildingClassOverrides
       (CivilizationType,            BuildingClassType,      BuildingType)
VALUES ('CIVILIZATION_RHO_VYATKA', 'BUILDINGCLASS_THEATRE', 'BUILDING_RHO_TOYMAKER');
--Dummies:
INSERT INTO BuildingClasses 	
		(Type, 						 	DefaultBuilding, 				Description)
VALUES	('BUILDINGCLASS_RHO_VYATKAMARK_DUMMY', 	'BUILDING_RHO_VYATKAMARK_DUMMY', 	'TXT_KEY_BUILDING_RHO_VYATKAMARK_DUMMY');

INSERT INTO Buildings 	
		(Type, 						 	BuildingClass, 			 			GreatWorkCount, UnmoddedHappiness,			Cost, FaithCost, PrereqTech,						 Description, 							Help, Happiness, Defense)
VALUES	('BUILDING_RHO_VYATKAMARK_DUMMY', 	'BUILDINGCLASS_RHO_VYATKAMARK_DUMMY',	-1, 	0,					-1,   -1, 		 null, 		 'TXT_KEY_TRAIT_RHO_SVISTOPLYASKA_SHORT', 	'TXT_KEY_TRAIT_RHO_SVISTOPLYASKA_SHORT', 0, 0);

--Units
--Promotions
INSERT INTO UnitPromotions
       (Type,					Description,					Help,								Sound,				AttackMod,	HasPostCombatPromotions,	PortraitIndex, IconAtlas, CannotBeChosen, PediaType, PediaEntry, ExperiencePercent, GoldenAgeValueFromKills, CanMoveAfterAttacking)
VALUES ('PROMOTION_RHO_VYATKAUUMARK1','TXT_KEY_PROMOTION_RHO_VYATKAUUMARK1','TXT_KEY_PROMOTION_RHO_VYATKAUUMARK1_HELP','AS2D_IF_LEVELUP', 	0,	0,				59, 'ABILITY_ATLAS',		1, 'PEDIA_ATTRIBUTES','TXT_KEY_PEDIA_PROMOTION_VYATKAUUMARK1', 0, 0, 0),
('PROMOTION_RHO_VYATKAUUMARK2','TXT_KEY_PROMOTION_RHO_VYATKAUUMARK2','TXT_KEY_PROMOTION_RHO_VYATKAUUMARK2_HELP','AS2D_IF_LEVELUP', 	0,	0,				59, 'ABILITY_ATLAS',		1, 'PEDIA_ATTRIBUTES','TXT_KEY_PEDIA_PROMOTION_VYATKAUUMARK2', 0, 0, 0),
('PROMOTION_RHO_VYATKAUUMARK3','TXT_KEY_PROMOTION_RHO_VYATKAUUMARK3','TXT_KEY_PROMOTION_RHO_VYATKAUUMARK3_HELP','AS2D_IF_LEVELUP', 	0,	0,				59, 'ABILITY_ATLAS',		1, 'PEDIA_ATTRIBUTES','TXT_KEY_PEDIA_PROMOTION_VYATKAUUMARK3', 0, 0, 0);

INSERT INTO Units
		(Type, Class, PrereqTech, Combat, Cost, FaithCost, RequiresFaithPurchaseEnabled, PurchaseOnly, MoveAfterPurchase, Special, Moves, BaseSightRange, CombatClass, Domain, DefaultUnitAI, MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, IgnoreBuildingDefense, GoodyHutUpgradeUnitClass, AdvancedStartCost, CombatLimit, Conscription, XPValueAttack, XPValueDefense, Description, Help, Strategy, Civilopedia, ShowInPedia,	MoveRate, UnitArtInfo, UnitFlagAtlas, UnitFlagIconOffset, IconAtlas, PortraitIndex, WorkRate,ReligionSpreads, ReligiousStrength, FoundReligion )
SELECT	'UNIT_RHO_USHKUYNIK', Class,  PrereqTech, Combat, Cost, FaithCost, RequiresFaithPurchaseEnabled, PurchaseOnly, MoveAfterPurchase, Special, Moves,BaseSightRange, CombatClass, Domain, DefaultUnitAI, MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, IgnoreBuildingDefense, GoodyHutUpgradeUnitClass, AdvancedStartCost, CombatLimit, Conscription, XPValueAttack, XPValueDefense, 'TXT_KEY_UNIT_RHO_USHKUYNIK',	'TXT_KEY_UNIT_RHO_USHKUYNIK_HELP', 	'TXT_KEY_UNIT_RHO_USHKUYNIK_STRATEGY', 	'TXT_KEY_UNIT_RHO_USHKUYNIK_TEXT',	ShowInPedia, MoveRate, 'ART_DEF_UNIT_RHO_USHKUYNIK',	'ALPHA_RHO_USHKUYNIK', 0, 'ATLAS_RHO_VYATKA', 2, WorkRate, ReligionSpreads, ReligiousStrength, FoundReligion
FROM Units WHERE Type = 'UNIT_GERMAN_LANDSKNECHT';

INSERT INTO Unit_AITypes 	
		(UnitType, 				UnitAIType)
SELECT	'UNIT_RHO_USHKUYNIK', 	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_GERMAN_LANDSKNECHT';

INSERT INTO UnitGameplay2DScripts
       (UnitType,           SelectionSound, FirstSelectionSound)
SELECT 'UNIT_RHO_USHKUYNIK',  SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_GERMAN_LANDSKNECHT';

INSERT INTO Unit_Flavors
       (UnitType,           FlavorType, Flavor)
SELECT 'UNIT_RHO_USHKUYNIK',  FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_GERMAN_LANDSKNECHT';

INSERT INTO Unit_FreePromotions
       (UnitType,           PromotionType)
SELECT 'UNIT_RHO_USHKUYNIK',  PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_GERMAN_LANDSKNECHT';
INSERT INTO Unit_FreePromotions
       (UnitType,           PromotionType)
VALUES ('UNIT_RHO_USHKUYNIK',  'PROMOTION_RHO_VYATKAUUMARK3'),
('UNIT_RHO_USHKUYNIK',  'PROMOTION_AMPHIBIOUS');

INSERT INTO Unit_ClassUpgrades
       (UnitType,           UnitClassType)
SELECT 'UNIT_RHO_USHKUYNIK',  UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_GERMAN_LANDSKNECHT';

INSERT INTO Civilization_UnitClassOverrides
       (CivilizationType, UnitClassType, UnitType)
VALUES ('CIVILIZATION_RHO_VYATKA', 'UNITCLASS_LANDSKNECHT', 'UNIT_RHO_USHKUYNIK');



--Diplo
--Audio

--Leader

INSERT INTO Leaders
		(Type,					Description,					Civilopedia,						CivilopediaTag,				ArtDefineTag,				VictoryCompetitiveness,	WonderCompetitiveness,	MinorCivCompetitiveness,	Boldness,	DiploBalance,	WarmongerHate,	WorkAgainstWillingness,	WorkWithWillingness,	DenounceWillingness,	DoFWillingness,	Loyalty,	Neediness,	Forgiveness,	Chattiness,	Meanness,	PortraitIndex,	IconAtlas)
		VALUES	('LEADER_RHO_IOANN',	'TXT_KEY_LEADER_RHO_IOANN',		'TXT_KEY_LEADER_RHO_IOANN_PEDIA',	'TXT_KEY_PEDIA_RHO_IOANN',	'vyata_LS.xml',	3,						4,						5,						8,			2,				4,				7,						7,						9,						3,				3,			4,			1,				3,			6,			1,				'ATLAS_RHO_VYATKA');

INSERT INTO Leader_MajorCivApproachBiases
		(LeaderType,			MajorCivApproachType,			Bias)
VALUES	('LEADER_RHO_IOANN',	'MAJOR_CIV_APPROACH_WAR',		10),
		('LEADER_RHO_IOANN',	'MAJOR_CIV_APPROACH_HOSTILE',	6),
		('LEADER_RHO_IOANN',	'MAJOR_CIV_APPROACH_DECEPTIVE',	3),
		('LEADER_RHO_IOANN',	'MAJOR_CIV_APPROACH_GUARDED',	4),
		('LEADER_RHO_IOANN',	'MAJOR_CIV_APPROACH_FRIENDLY',	7),
		('LEADER_RHO_IOANN',	'MAJOR_CIV_APPROACH_AFRAID',	2),
		('LEADER_RHO_IOANN',	'MAJOR_CIV_APPROACH_NEUTRAL',	6);
		


INSERT INTO Leader_MinorCivApproachBiases
		(LeaderType,			MinorCivApproachType,				Bias)
VALUES	('LEADER_RHO_IOANN',	'MINOR_CIV_APPROACH_IGNORE',		5),
		('LEADER_RHO_IOANN',	'MINOR_CIV_APPROACH_FRIENDLY',		4),
		('LEADER_RHO_IOANN',	'MINOR_CIV_APPROACH_PROTECTIVE',	3),
		('LEADER_RHO_IOANN',	'MINOR_CIV_APPROACH_CONQUEST',		7),
		('LEADER_RHO_IOANN',	'MINOR_CIV_APPROACH_BULLY',			9);

INSERT INTO Leader_Flavors
		(LeaderType, 			FlavorType,							Flavor)
VALUES	('LEADER_RHO_IOANN',	'FLAVOR_OFFENSE',					11),
		('LEADER_RHO_IOANN',	'FLAVOR_DEFENSE',					8),
		('LEADER_RHO_IOANN',	'FLAVOR_CITY_DEFENSE',				6),
		('LEADER_RHO_IOANN',	'FLAVOR_MILITARY_TRAINING',			3),
		('LEADER_RHO_IOANN',	'FLAVOR_RECON',						5),
		('LEADER_RHO_IOANN',	'FLAVOR_RANGED',					5),
		('LEADER_RHO_IOANN',	'FLAVOR_MOBILE',					4),
		('LEADER_RHO_IOANN',	'FLAVOR_NAVAL',						7),
		('LEADER_RHO_IOANN',	'FLAVOR_NAVAL_RECON',				6),
		('LEADER_RHO_IOANN',	'FLAVOR_NAVAL_GROWTH',				3),
		('LEADER_RHO_IOANN',	'FLAVOR_NAVAL_TILE_IMPROVEMENT',	2),
		('LEADER_RHO_IOANN',	'FLAVOR_AIR',						4),
		('LEADER_RHO_IOANN',	'FLAVOR_EXPANSION',					9),
		('LEADER_RHO_IOANN',	'FLAVOR_GROWTH',					3),
		('LEADER_RHO_IOANN',	'FLAVOR_TILE_IMPROVEMENT',			4),
		('LEADER_RHO_IOANN',	'FLAVOR_INFRASTRUCTURE',			4),
		('LEADER_RHO_IOANN',	'FLAVOR_PRODUCTION',				3),
		('LEADER_RHO_IOANN',	'FLAVOR_GOLD',						9),
		('LEADER_RHO_IOANN',	'FLAVOR_SCIENCE',					5),
		('LEADER_RHO_IOANN',	'FLAVOR_CULTURE',					8),
		('LEADER_RHO_IOANN',	'FLAVOR_HAPPINESS',					7),
		('LEADER_RHO_IOANN',	'FLAVOR_GREAT_PEOPLE',				4),
		('LEADER_RHO_IOANN',	'FLAVOR_WONDER',					3),
		('LEADER_RHO_IOANN',	'FLAVOR_RELIGION',					5),
		('LEADER_RHO_IOANN',	'FLAVOR_DIPLOMACY',					5),
		('LEADER_RHO_IOANN',	'FLAVOR_SPACESHIP',					8),
		('LEADER_RHO_IOANN',	'FLAVOR_WATER_CONNECTION',			4),
		('LEADER_RHO_IOANN',	'FLAVOR_NUKE',						7),
		('LEADER_RHO_IOANN',	'FLAVOR_USE_NUKE',					9),
		('LEADER_RHO_IOANN',	'FLAVOR_ESPIONAGE',					5),
		('LEADER_RHO_IOANN',	'FLAVOR_ANTIAIR',					4),
		('LEADER_RHO_IOANN',	'FLAVOR_AIR_CARRIER',				5),
		('LEADER_RHO_IOANN',	'FLAVOR_I_LAND_TRADE_ROUTE',		5),
		('LEADER_RHO_IOANN',	'FLAVOR_I_SEA_TRADE_ROUTE',			5),
		('LEADER_RHO_IOANN',	'FLAVOR_ARCHAEOLOGY',				5),
		('LEADER_RHO_IOANN',	'FLAVOR_I_TRADE_ORIGIN',			5),
		('LEADER_RHO_IOANN',	'FLAVOR_I_TRADE_DESTINATION',		5),
		('LEADER_RHO_IOANN',	'FLAVOR_AIRLIFT',					5);

INSERT INTO Traits
		(Type,				Description,				ShortDescription)
VALUES	('TRAIT_RHO_SVISTOPLYASKA',	'TXT_KEY_TRAIT_RHO_SVISTOPLYASKA',	'TXT_KEY_TRAIT_RHO_SVISTOPLYASKA_SHORT');

-----

INSERT INTO Leader_Traits
		(LeaderType,			TraitType)
VALUES	('LEADER_RHO_IOANN',	'TRAIT_RHO_SVISTOPLYASKA');

--Civilization

INSERT INTO Civilizations
		(Type,						Description,						CivilopediaTag,					ShortDescription,							Adjective,								DefaultPlayerColor,				ArtDefineTag,			ArtStyleType,		ArtStyleSuffix,	ArtStylePrefix,	PortraitIndex,	IconAtlas,				AlphaIconAtlas,			MapImage,		DawnOfManQuote,							DawnOfManImage)
VALUES	('CIVILIZATION_RHO_VYATKA',	'TXT_KEY_CIVILIZATION_RHO_VYATKA',	'TXT_KEY_PEDIA_RHO_VYATKA',	'TXT_KEY_CIVILIZATION_RHO_VYATKA_SHORT',	'TXT_KEY_CIVILIZATION_RHO_VYATKA_ADJ',	'PLAYERCOLOR_RHO_VYATKA',	'ART_DEF_CIVILIZATION_RUSSIA',	'ARTSTYLE_EUROPEAN',	'_EURO',		'EUROPEAN',		0,				'ATLAS_RHO_VYATKA',	'ALPHA_RHO_VYATKA',	'vyatka_map_small.dds',	'TXT_KEY_CIV5_DAWN_RHO_VYATKA_TEXT',	'vyatka_dom.dds');

INSERT INTO Civilization_CityNames
		(CivilizationType,				CityName)
VALUES	('CIVILIZATION_RHO_VYATKA',	'TXT_KEY_CITY_NAME_RHO_VYATKA_1'),
		('CIVILIZATION_RHO_VYATKA',	'TXT_KEY_CITY_NAME_RHO_VYATKA_2'),
		('CIVILIZATION_RHO_VYATKA',	'TXT_KEY_CITY_NAME_RHO_VYATKA_3'),
		('CIVILIZATION_RHO_VYATKA',	'TXT_KEY_CITY_NAME_RHO_VYATKA_4'),
		('CIVILIZATION_RHO_VYATKA',	'TXT_KEY_CITY_NAME_RHO_VYATKA_5'),
		('CIVILIZATION_RHO_VYATKA',	'TXT_KEY_CITY_NAME_RHO_VYATKA_6'),
		('CIVILIZATION_RHO_VYATKA',	'TXT_KEY_CITY_NAME_RHO_VYATKA_7'),
		('CIVILIZATION_RHO_VYATKA',	'TXT_KEY_CITY_NAME_RHO_VYATKA_8'),
		('CIVILIZATION_RHO_VYATKA',	'TXT_KEY_CITY_NAME_RHO_VYATKA_9'),
		('CIVILIZATION_RHO_VYATKA',	'TXT_KEY_CITY_NAME_RHO_VYATKA_10'),
		('CIVILIZATION_RHO_VYATKA',	'TXT_KEY_CITY_NAME_RHO_VYATKA_11'),
		('CIVILIZATION_RHO_VYATKA',	'TXT_KEY_CITY_NAME_RHO_VYATKA_12'),
		('CIVILIZATION_RHO_VYATKA',	'TXT_KEY_CITY_NAME_RHO_VYATKA_13'),
		('CIVILIZATION_RHO_VYATKA',	'TXT_KEY_CITY_NAME_RHO_VYATKA_14'),
		('CIVILIZATION_RHO_VYATKA',	'TXT_KEY_CITY_NAME_RHO_VYATKA_15'),
		('CIVILIZATION_RHO_VYATKA',	'TXT_KEY_CITY_NAME_RHO_VYATKA_16'),
		('CIVILIZATION_RHO_VYATKA',	'TXT_KEY_CITY_NAME_RHO_VYATKA_17'),
		('CIVILIZATION_RHO_VYATKA',	'TXT_KEY_CITY_NAME_RHO_VYATKA_18'),
		('CIVILIZATION_RHO_VYATKA',	'TXT_KEY_CITY_NAME_RHO_VYATKA_19'),
		('CIVILIZATION_RHO_VYATKA',	'TXT_KEY_CITY_NAME_RHO_VYATKA_20'),
		('CIVILIZATION_RHO_VYATKA',	'TXT_KEY_CITY_NAME_RHO_VYATKA_21'),
		('CIVILIZATION_RHO_VYATKA',	'TXT_KEY_CITY_NAME_RHO_VYATKA_22'),
		('CIVILIZATION_RHO_VYATKA',	'TXT_KEY_CITY_NAME_RHO_VYATKA_23'),
		('CIVILIZATION_RHO_VYATKA',	'TXT_KEY_CITY_NAME_RHO_VYATKA_24'),
		('CIVILIZATION_RHO_VYATKA',	'TXT_KEY_CITY_NAME_RHO_VYATKA_25'),
		('CIVILIZATION_RHO_VYATKA',	'TXT_KEY_CITY_NAME_RHO_VYATKA_26'),
		('CIVILIZATION_RHO_VYATKA',	'TXT_KEY_CITY_NAME_RHO_VYATKA_27'),
		('CIVILIZATION_RHO_VYATKA',	'TXT_KEY_CITY_NAME_RHO_VYATKA_28'),
		('CIVILIZATION_RHO_VYATKA',	'TXT_KEY_CITY_NAME_RHO_VYATKA_29'),
		('CIVILIZATION_RHO_VYATKA',	'TXT_KEY_CITY_NAME_RHO_VYATKA_30')
		;

INSERT INTO Civilization_FreeBuildingClasses
          (CivilizationType,              BuildingClassType)
SELECT    'CIVILIZATION_RHO_VYATKA',     BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE CivilizationType = 'CIVILIZATION_ZULU';

INSERT INTO Civilization_FreeTechs
          (CivilizationType,              TechType)
SELECT    'CIVILIZATION_RHO_VYATKA',     TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_ZULU';

INSERT INTO Civilization_FreeUnits
          (CivilizationType,              UnitClassType, Count, UnitAIType)
SELECT    'CIVILIZATION_RHO_VYATKA',     UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_ZULU';

INSERT INTO Civilization_Leaders
       (CivilizationType,            LeaderheadType)
VALUES ('CIVILIZATION_RHO_VYATKA', 'LEADER_RHO_IOANN');

INSERT INTO Civilization_Start_Region_Priority
(CivilizationType,RegionType)
VALUES ('CIVILIZATION_RHO_VYATKA','REGION_TUNDRA');

INSERT INTO Civilization_Religions
       (CivilizationType,            ReligionType)
SELECT    'CIVILIZATION_RHO_VYATKA',     ReligionType
FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_ZULU';

INSERT INTO Civilization_SpyNames
          (CivilizationType,                SpyName)
VALUES    ('CIVILIZATION_RHO_VYATKA',     'TXT_KEY_SPY_NAME_RHO_VYATKA_0'),
          ('CIVILIZATION_RHO_VYATKA',     'TXT_KEY_SPY_NAME_RHO_VYATKA_1'),
          ('CIVILIZATION_RHO_VYATKA',     'TXT_KEY_SPY_NAME_RHO_VYATKA_2'),
          ('CIVILIZATION_RHO_VYATKA',     'TXT_KEY_SPY_NAME_RHO_VYATKA_3'),
          ('CIVILIZATION_RHO_VYATKA',     'TXT_KEY_SPY_NAME_RHO_VYATKA_4'),
          ('CIVILIZATION_RHO_VYATKA',     'TXT_KEY_SPY_NAME_RHO_VYATKA_5'),
          ('CIVILIZATION_RHO_VYATKA',     'TXT_KEY_SPY_NAME_RHO_VYATKA_6'),
          ('CIVILIZATION_RHO_VYATKA',     'TXT_KEY_SPY_NAME_RHO_VYATKA_7'),
          ('CIVILIZATION_RHO_VYATKA',     'TXT_KEY_SPY_NAME_RHO_VYATKA_8'),
          ('CIVILIZATION_RHO_VYATKA',     'TXT_KEY_SPY_NAME_RHO_VYATKA_9');


--bg f9dfb1, icon b84300
INSERT INTO Colors
(Type,                                        Red,     Green,    Blue,     Alpha)
VALUES    ('COLOR_PLAYER_RHO_VYATKA_ICON',   0.722,   0.263,    0.000,    1),
('COLOR_PLAYER_RHO_VYATKA_BACKGROUND',       0.976,   0.875,    0.694,    1);

INSERT INTO PlayerColors
          (Type,                              PrimaryColor,                                        SecondaryColor,                   TextColor)
VALUES    ('PLAYERCOLOR_RHO_VYATKA',        'COLOR_PLAYER_RHO_VYATKA_ICON',     'COLOR_PLAYER_RHO_VYATKA_BACKGROUND',     'COLOR_PLAYER_WHITE_TEXT');

INSERT INTO Diplomacy_Responses
		(LeaderType, 					ResponseType, 							 			Response, 														Bias)
VALUES 	('LEADER_RHO_IOANN',	'RESPONSE_FIRST_GREETING', 			 			'TXT_KEY_LEADER_RHO_IOANN_FIRSTGREETING%', 			 				500),
('LEADER_RHO_IOANN',	'RESPONSE_DOW_GENERIC', 			 			'TXT_KEY_LEADER_RHO_IOANN_DOWGENERIC%', 			 				500),
('LEADER_RHO_IOANN',	'RESPONSE_ATTACKED_HOSTILE', 			 			'TXT_KEY_LEADER_RHO_IOANN_ATTACKEDHOSTILE%', 			 				500),
('LEADER_RHO_IOANN',	'RESPONSE_DEFEATED', 			 			'TXT_KEY_LEADER_RHO_IOANN_DEFEATED%', 			 				500),
('LEADER_RHO_IOANN',	'RESPONSE_LUXURY_TRADE', 			 			'TXT_KEY_LEADER_RHO_IOANN_LUXURYTRADE%', 			 				500);