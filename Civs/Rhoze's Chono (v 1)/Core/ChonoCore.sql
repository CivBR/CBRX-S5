--Buildings
--Dummies:
INSERT INTO BuildingClasses 	
		(Type, 						 	DefaultBuilding, 				Description)
VALUES	('BUILDINGCLASS_RHO_CHONOMARK_DUMMY', 	'BUILDING_RHO_CHONOMARK_DUMMY', 	'TXT_KEY_BUILDING_RHO_CHONOMARK_DUMMY');

INSERT INTO Buildings 	
		(Type, 						 	BuildingClass, 			 	GreatWorkCount, Cost, FaithCost, PrereqTech, Description, 							Help, FoodKept, ConquestProb, NukeImmune)
VALUES	('BUILDING_RHO_CHONOMARK_DUMMY', 	'BUILDINGCLASS_RHO_CHONOMARK_DUMMY',	-1, 			-1,   -1, 		 null, 		 'TXT_KEY_TRAIT_RHO_GUIDES_OF_TAITAO_SHORT', 	'TXT_KEY_TRAIT_RHO_GUIDES_OF_TAITAO_SHORT',0, 100, 1);
--Units
--Promotions
INSERT INTO UnitPromotions
       (Type,					Description,					Help,								Sound,				AttackMod,	HasPostCombatPromotions,	PortraitIndex, IconAtlas, CannotBeChosen, PediaType, PediaEntry)
VALUES ('PROMOTION_RHO_DALCASCOUT','TXT_KEY_PROMOTION_RHO_DALCASCOUT','TXT_KEY_PROMOTION_RHO_DALCASCOUT_HELP','AS2D_IF_LEVELUP', 	0,	0,				59, 'ABILITY_ATLAS',		1, 'PEDIA_ATTRIBUTES','TXT_KEY_PEDIA_PROMOTION_DALCASCOUT'),
('PROMOTION_RHO_MARKLOST','TXT_KEY_PROMOTION_RHO_MARKLOST','TXT_KEY_PROMOTION_RHO_MARKLOST_HELP','AS2D_IF_LEVELUP', 	0,	0,				59, 'ABILITY_ATLAS',		1, 'PEDIA_ATTRIBUTES','TXT_KEY_PEDIA_PROMOTION_MARKLOST');

INSERT INTO Units
		(Type, Class, PrereqTech, Combat, RangedCombat, Range, Cost, FaithCost, RequiresFaithPurchaseEnabled, Moves, CombatClass, Domain, DefaultUnitAI, MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, IgnoreBuildingDefense, GoodyHutUpgradeUnitClass, AdvancedStartCost, CombatLimit, Conscription, XPValueAttack, XPValueDefense, Description, Help, Strategy, Civilopedia, ShowInPedia,	MoveRate, UnitArtInfo, UnitFlagAtlas, UnitFlagIconOffset, IconAtlas, PortraitIndex)
SELECT	'UNIT_RHO_WALT', Class, PrereqTech, Combat, RangedCombat, Range, Cost, FaithCost, RequiresFaithPurchaseEnabled, Moves, CombatClass, Domain, DefaultUnitAI, MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, IgnoreBuildingDefense, GoodyHutUpgradeUnitClass, AdvancedStartCost, CombatLimit, Conscription, XPValueAttack, XPValueDefense, 'TXT_KEY_UNIT_RHO_WALT',	'TXT_KEY_UNIT_RHO_WALT_HELP', 	'TXT_KEY_UNIT_RHO_WALT_STRATEGY', 	'TXT_KEY_UNIT_RHO_WALT_TEXT',	ShowInPedia, MoveRate, 'ART_DEF_UNIT_RHO_WALT',	'ALPHA_RHO_WALT', 0, 'ATLAS_RHO_CHONO', 2
FROM Units WHERE Type = 'UNIT_COMPOSITE_BOWMAN';

INSERT INTO Units
		(Type, Class, PrereqTech, Combat, Cost, FaithCost, RequiresFaithPurchaseEnabled, Moves, CombatClass, Domain, DefaultUnitAI, MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, IgnoreBuildingDefense, GoodyHutUpgradeUnitClass, AdvancedStartCost, CombatLimit, Conscription, XPValueAttack, XPValueDefense, Description, Help, Strategy, Civilopedia, ShowInPedia,	MoveRate, UnitArtInfo, UnitFlagAtlas, UnitFlagIconOffset, IconAtlas, PortraitIndex, WorkRate)
SELECT	'UNIT_RHO_DALCA', Class,  PrereqTech, Combat, Cost, FaithCost, RequiresFaithPurchaseEnabled, Moves, CombatClass, Domain, DefaultUnitAI, MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, IgnoreBuildingDefense, GoodyHutUpgradeUnitClass, AdvancedStartCost, CombatLimit, Conscription, XPValueAttack, XPValueDefense, 'TXT_KEY_UNIT_RHO_DALCA',	'TXT_KEY_UNIT_RHO_DALCA_HELP', 	'TXT_KEY_UNIT_RHO_DALCA_STRATEGY', 	'TXT_KEY_UNIT_RHO_DALCA_TEXT',	ShowInPedia, MoveRate, 'ART_DEF_UNIT_RHO_DALCA',	'ALPHA_RHO_DALCA', 0, 'ATLAS_RHO_CHONO', 3, WorkRate
FROM Units WHERE Type = 'UNIT_WORKBOAT';

INSERT INTO Unit_Builds
		(UnitType, 					BuildType)
SELECT 'UNIT_RHO_DALCA', BuildType
FROM Unit_Builds WHERE UnitType = 'UNIT_WORKBOAT';

INSERT INTO Unit_AITypes 	
		(UnitType, 				UnitAIType)
SELECT	'UNIT_RHO_WALT', 	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_COMPOSITE_BOWMAN';

INSERT INTO Unit_AITypes 	
		(UnitType, 				UnitAIType)
SELECT	'UNIT_RHO_DALCA', 	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_WORKBOAT';

INSERT INTO UnitGameplay2DScripts
       (UnitType,           SelectionSound, FirstSelectionSound)
SELECT 'UNIT_RHO_WALT',  SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_COMPOSITE_BOWMAN';

INSERT INTO UnitGameplay2DScripts
       (UnitType,           SelectionSound, FirstSelectionSound)
SELECT 'UNIT_RHO_DALCA',  SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_WORKBOAT';

INSERT INTO Unit_Flavors
       (UnitType,           FlavorType, Flavor)
SELECT 'UNIT_RHO_WALT',  FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_COMPOSITE_BOWMAN';

INSERT INTO Unit_Flavors
       (UnitType,           FlavorType, Flavor)
SELECT 'UNIT_RHO_DALCA',  FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_WORKBOAT';

INSERT INTO Unit_FreePromotions
       (UnitType,           PromotionType)
SELECT 'UNIT_RHO_WALT',  PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_COMPOSITE_BOWMAN';
INSERT INTO Unit_FreePromotions
       (UnitType,           PromotionType)
VALUES ('UNIT_RHO_WALT',  'PROMOTION_SURVIVALISM_1');
 -- ('UNIT_RHO_WALT',  'PROMOTION_RHO_WALTDRAIN');

INSERT INTO Unit_FreePromotions
       (UnitType,           PromotionType)
SELECT 'UNIT_RHO_DALCA',  PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_WORKBOAT';
INSERT INTO Unit_FreePromotions
       (UnitType,           PromotionType)
VALUES ('UNIT_RHO_DALCA',  'PROMOTION_STEAM_POWERED');

INSERT INTO Unit_ClassUpgrades
       (UnitType,           UnitClassType)
SELECT 'UNIT_RHO_WALT',  UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_COMPOSITE_BOWMAN';

INSERT INTO Unit_ClassUpgrades
       (UnitType,           UnitClassType)
SELECT 'UNIT_RHO_DALCA',  UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_WORKBOAT';

INSERT INTO Civilization_UnitClassOverrides
       (CivilizationType, UnitClassType, UnitType)
VALUES ('CIVILIZATION_RHO_CHONO', 'UNITCLASS_COMPOSITE_BOWMAN', 'UNIT_RHO_WALT'),
('CIVILIZATION_RHO_CHONO', 'UNITCLASS_WORKBOAT', 'UNIT_RHO_DALCA');



--Diplo
--Audio

--Leader

INSERT INTO Leaders
		(Type,					Description,					Civilopedia,						CivilopediaTag,				ArtDefineTag,							VictoryCompetitiveness,	WonderCompetitiveness,	MinorCivCompetitiveness,	Boldness,	DiploBalance,	WarmongerHate,	WorkAgainstWillingness,	WorkWithWillingness,	DenounceWillingness,	DoFWillingness,	Loyalty,	Neediness,	Forgiveness,	Chattiness,	Meanness,	PortraitIndex,	IconAtlas)
		VALUES	('LEADER_RHO_OLLETA',	'TXT_KEY_LEADER_RHO_OLLETA',		'TXT_KEY_LEADER_RHO_OLLETA_PEDIA',	'TXT_KEY_PEDIA_RHO_OLLETA',	'Chono_LS.xml',	6,						4,						3,							8,			8,				4,				6,						6,						3,						6,				2,			5,			6,				4,			3,			1,				'ATLAS_RHO_CHONO');

INSERT INTO Leader_MajorCivApproachBiases
		(LeaderType,			MajorCivApproachType,			Bias)
VALUES	('LEADER_RHO_OLLETA',	'MAJOR_CIV_APPROACH_WAR',		3),
		('LEADER_RHO_OLLETA',	'MAJOR_CIV_APPROACH_HOSTILE',	4),
		('LEADER_RHO_OLLETA',	'MAJOR_CIV_APPROACH_DECEPTIVE',	8),
		('LEADER_RHO_OLLETA',	'MAJOR_CIV_APPROACH_GUARDED',	3),
		('LEADER_RHO_OLLETA',	'MAJOR_CIV_APPROACH_FRIENDLY',	6),
		('LEADER_RHO_OLLETA',	'MAJOR_CIV_APPROACH_AFRAID',	3),
		('LEADER_RHO_OLLETA',	'MAJOR_CIV_APPROACH_NEUTRAL',	9);
		


INSERT INTO Leader_MinorCivApproachBiases
		(LeaderType,			MinorCivApproachType,				Bias)
VALUES	('LEADER_RHO_OLLETA',	'MINOR_CIV_APPROACH_IGNORE',		8),
		('LEADER_RHO_OLLETA',	'MINOR_CIV_APPROACH_FRIENDLY',		8),
		('LEADER_RHO_OLLETA',	'MINOR_CIV_APPROACH_PROTECTIVE',	3),
		('LEADER_RHO_OLLETA',	'MINOR_CIV_APPROACH_CONQUEST',		4),
		('LEADER_RHO_OLLETA',	'MINOR_CIV_APPROACH_BULLY',			2);

INSERT INTO Leader_Flavors
		(LeaderType, 			FlavorType,							Flavor)
VALUES	('LEADER_RHO_OLLETA',	'FLAVOR_OFFENSE',					4),
		('LEADER_RHO_OLLETA',	'FLAVOR_DEFENSE',					6),
		('LEADER_RHO_OLLETA',	'FLAVOR_CITY_DEFENSE',				6),
		('LEADER_RHO_OLLETA',	'FLAVOR_MILITARY_TRAINING',			4),
		('LEADER_RHO_OLLETA',	'FLAVOR_RECON',						7),
		('LEADER_RHO_OLLETA',	'FLAVOR_RANGED',					9),
		('LEADER_RHO_OLLETA',	'FLAVOR_MOBILE',					5),
		('LEADER_RHO_OLLETA',	'FLAVOR_NAVAL',						7),
		('LEADER_RHO_OLLETA',	'FLAVOR_NAVAL_RECON',				3),
		('LEADER_RHO_OLLETA',	'FLAVOR_NAVAL_GROWTH',				9),
		('LEADER_RHO_OLLETA',	'FLAVOR_NAVAL_TILE_IMPROVEMENT',	10),
		('LEADER_RHO_OLLETA',	'FLAVOR_AIR',						9),
		('LEADER_RHO_OLLETA',	'FLAVOR_EXPANSION',					7),
		('LEADER_RHO_OLLETA',	'FLAVOR_GROWTH',					6),
		('LEADER_RHO_OLLETA',	'FLAVOR_TILE_IMPROVEMENT',			9),
		('LEADER_RHO_OLLETA',	'FLAVOR_INFRASTRUCTURE',			4),
		('LEADER_RHO_OLLETA',	'FLAVOR_PRODUCTION',				6),
		('LEADER_RHO_OLLETA',	'FLAVOR_GOLD',						8),
		('LEADER_RHO_OLLETA',	'FLAVOR_SCIENCE',					6),
		('LEADER_RHO_OLLETA',	'FLAVOR_CULTURE',					3),
		('LEADER_RHO_OLLETA',	'FLAVOR_HAPPINESS',					6),
		('LEADER_RHO_OLLETA',	'FLAVOR_GREAT_PEOPLE',				2),
		('LEADER_RHO_OLLETA',	'FLAVOR_WONDER',					6),
		('LEADER_RHO_OLLETA',	'FLAVOR_RELIGION',					3),
		('LEADER_RHO_OLLETA',	'FLAVOR_DIPLOMACY',					5),
		('LEADER_RHO_OLLETA',	'FLAVOR_SPACESHIP',					7),
		('LEADER_RHO_OLLETA',	'FLAVOR_WATER_CONNECTION',			8),
		('LEADER_RHO_OLLETA',	'FLAVOR_NUKE',						4),
		('LEADER_RHO_OLLETA',	'FLAVOR_USE_NUKE',					6),
		('LEADER_RHO_OLLETA',	'FLAVOR_ESPIONAGE',					6),
		('LEADER_RHO_OLLETA',	'FLAVOR_ANTIAIR',					3),
		('LEADER_RHO_OLLETA',	'FLAVOR_AIR_CARRIER',				3),
		('LEADER_RHO_OLLETA',	'FLAVOR_I_LAND_TRADE_ROUTE',		4),
		('LEADER_RHO_OLLETA',	'FLAVOR_I_SEA_TRADE_ROUTE',			8),
		('LEADER_RHO_OLLETA',	'FLAVOR_ARCHAEOLOGY',				5),
		('LEADER_RHO_OLLETA',	'FLAVOR_I_TRADE_ORIGIN',			4),
		('LEADER_RHO_OLLETA',	'FLAVOR_I_TRADE_DESTINATION',		4),
		('LEADER_RHO_OLLETA',	'FLAVOR_AIRLIFT',					3);

INSERT INTO Traits
		(Type,				Description,				ShortDescription)
VALUES	('TRAIT_RHO_GUIDES_OF_TAITAO',	'TXT_KEY_TRAIT_RHO_GUIDES_OF_TAITAO',	'TXT_KEY_TRAIT_RHO_GUIDES_OF_TAITAO_SHORT');

-----

INSERT INTO Leader_Traits
		(LeaderType,			TraitType)
VALUES	('LEADER_RHO_OLLETA',	'TRAIT_RHO_GUIDES_OF_TAITAO');

--Civilization

INSERT INTO Civilizations
		(Type,						Description,						CivilopediaTag,					ShortDescription,							Adjective,								DefaultPlayerColor,				ArtDefineTag,			ArtStyleType,		ArtStyleSuffix,	ArtStylePrefix,	PortraitIndex,	IconAtlas,				AlphaIconAtlas,			MapImage,		DawnOfManQuote,							DawnOfManImage)
VALUES	('CIVILIZATION_RHO_CHONO',	'TXT_KEY_CIVILIZATION_RHO_CHONO',	'TXT_KEY_PEDIA_RHO_CHONO',	'TXT_KEY_CIVILIZATION_RHO_CHONO_SHORT',	'TXT_KEY_CIVILIZATION_RHO_CHONO_ADJ',	'PLAYERCOLOR_RHO_CHONO',	'ART_DEF_CIVILIZATION_INCA',	'ARTSTYLE_SOUTH_AMERICA',	'_AMER',		'AMERICAN',		0,				'ATLAS_RHO_CHONO',	'ALPHA_RHO_CHONO',	'ChonoMap.dds',	'TXT_KEY_CIV5_DAWN_RHO_CHONO_TEXT',	'ChonoDOM.dds');

INSERT INTO Civilization_CityNames
		(CivilizationType,				CityName)
VALUES	('CIVILIZATION_RHO_CHONO',	'TXT_KEY_CITY_NAME_RHO_CHONO_1'),
		('CIVILIZATION_RHO_CHONO',	'TXT_KEY_CITY_NAME_RHO_CHONO_2'),
		('CIVILIZATION_RHO_CHONO',	'TXT_KEY_CITY_NAME_RHO_CHONO_3'),
		('CIVILIZATION_RHO_CHONO',	'TXT_KEY_CITY_NAME_RHO_CHONO_4'),
		('CIVILIZATION_RHO_CHONO',	'TXT_KEY_CITY_NAME_RHO_CHONO_5'),
		('CIVILIZATION_RHO_CHONO',	'TXT_KEY_CITY_NAME_RHO_CHONO_6'),
		('CIVILIZATION_RHO_CHONO',	'TXT_KEY_CITY_NAME_RHO_CHONO_7'),
		('CIVILIZATION_RHO_CHONO',	'TXT_KEY_CITY_NAME_RHO_CHONO_8'),
		('CIVILIZATION_RHO_CHONO',	'TXT_KEY_CITY_NAME_RHO_CHONO_9'),
		('CIVILIZATION_RHO_CHONO',	'TXT_KEY_CITY_NAME_RHO_CHONO_10'),
		('CIVILIZATION_RHO_CHONO',	'TXT_KEY_CITY_NAME_RHO_CHONO_11'),
		('CIVILIZATION_RHO_CHONO',	'TXT_KEY_CITY_NAME_RHO_CHONO_12'),
		('CIVILIZATION_RHO_CHONO',	'TXT_KEY_CITY_NAME_RHO_CHONO_13'),
		('CIVILIZATION_RHO_CHONO',	'TXT_KEY_CITY_NAME_RHO_CHONO_14'),
		('CIVILIZATION_RHO_CHONO',	'TXT_KEY_CITY_NAME_RHO_CHONO_15'),
		('CIVILIZATION_RHO_CHONO',	'TXT_KEY_CITY_NAME_RHO_CHONO_16'),
		('CIVILIZATION_RHO_CHONO',	'TXT_KEY_CITY_NAME_RHO_CHONO_17'),
		('CIVILIZATION_RHO_CHONO',	'TXT_KEY_CITY_NAME_RHO_CHONO_18'),
		('CIVILIZATION_RHO_CHONO',	'TXT_KEY_CITY_NAME_RHO_CHONO_19'),
		('CIVILIZATION_RHO_CHONO',	'TXT_KEY_CITY_NAME_RHO_CHONO_20'),
		('CIVILIZATION_RHO_CHONO',	'TXT_KEY_CITY_NAME_RHO_CHONO_21'),
		('CIVILIZATION_RHO_CHONO',	'TXT_KEY_CITY_NAME_RHO_CHONO_22'),
		('CIVILIZATION_RHO_CHONO',	'TXT_KEY_CITY_NAME_RHO_CHONO_23'),
		('CIVILIZATION_RHO_CHONO',	'TXT_KEY_CITY_NAME_RHO_CHONO_24'),
		('CIVILIZATION_RHO_CHONO',	'TXT_KEY_CITY_NAME_RHO_CHONO_25'),
		('CIVILIZATION_RHO_CHONO',	'TXT_KEY_CITY_NAME_RHO_CHONO_26'),
		('CIVILIZATION_RHO_CHONO',	'TXT_KEY_CITY_NAME_RHO_CHONO_27'),
		('CIVILIZATION_RHO_CHONO',	'TXT_KEY_CITY_NAME_RHO_CHONO_28'),
		('CIVILIZATION_RHO_CHONO',	'TXT_KEY_CITY_NAME_RHO_CHONO_29'),
		('CIVILIZATION_RHO_CHONO',	'TXT_KEY_CITY_NAME_RHO_CHONO_30'),
		('CIVILIZATION_RHO_CHONO',	'TXT_KEY_CITY_NAME_RHO_CHONO_31'),
		('CIVILIZATION_RHO_CHONO',	'TXT_KEY_CITY_NAME_RHO_CHONO_32'),
		('CIVILIZATION_RHO_CHONO',	'TXT_KEY_CITY_NAME_RHO_CHONO_33'),
		('CIVILIZATION_RHO_CHONO',	'TXT_KEY_CITY_NAME_RHO_CHONO_34'),
		('CIVILIZATION_RHO_CHONO',	'TXT_KEY_CITY_NAME_RHO_CHONO_35'),
		('CIVILIZATION_RHO_CHONO',	'TXT_KEY_CITY_NAME_RHO_CHONO_36'),
		('CIVILIZATION_RHO_CHONO',	'TXT_KEY_CITY_NAME_RHO_CHONO_37'),
		('CIVILIZATION_RHO_CHONO',	'TXT_KEY_CITY_NAME_RHO_CHONO_38'),
		('CIVILIZATION_RHO_CHONO',	'TXT_KEY_CITY_NAME_RHO_CHONO_39'),
		('CIVILIZATION_RHO_CHONO',	'TXT_KEY_CITY_NAME_RHO_CHONO_40'),
		('CIVILIZATION_RHO_CHONO',	'TXT_KEY_CITY_NAME_RHO_CHONO_41'),
		('CIVILIZATION_RHO_CHONO',	'TXT_KEY_CITY_NAME_RHO_CHONO_42')
		;

INSERT INTO Civilization_FreeBuildingClasses
          (CivilizationType,              BuildingClassType)
SELECT    'CIVILIZATION_RHO_CHONO',     BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE CivilizationType = 'CIVILIZATION_ZULU';

INSERT INTO Civilization_FreeTechs
          (CivilizationType,              TechType)
SELECT    'CIVILIZATION_RHO_CHONO',     TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_ZULU';

INSERT INTO Civilization_FreeUnits
          (CivilizationType,              UnitClassType, Count, UnitAIType)
SELECT    'CIVILIZATION_RHO_CHONO',     UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_ZULU';

INSERT INTO Civilization_Leaders
       (CivilizationType,            LeaderheadType)
VALUES ('CIVILIZATION_RHO_CHONO', 'LEADER_RHO_OLLETA');

INSERT INTO Civilization_Start_Along_Ocean 
		(CivilizationType, 						StartAlongOcean)
VALUES	('CIVILIZATION_RHO_CHONO', 		1);

INSERT INTO Civilization_Religions
       (CivilizationType,            ReligionType)
SELECT    'CIVILIZATION_RHO_CHONO',     ReligionType
FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_MAYA';

INSERT INTO Civilization_SpyNames
          (CivilizationType,                SpyName)
VALUES    ('CIVILIZATION_RHO_CHONO',     'TXT_KEY_SPY_NAME_RHO_CHONO_0'),
          ('CIVILIZATION_RHO_CHONO',     'TXT_KEY_SPY_NAME_RHO_CHONO_1'),
          ('CIVILIZATION_RHO_CHONO',     'TXT_KEY_SPY_NAME_RHO_CHONO_2'),
          ('CIVILIZATION_RHO_CHONO',     'TXT_KEY_SPY_NAME_RHO_CHONO_3'),
          ('CIVILIZATION_RHO_CHONO',     'TXT_KEY_SPY_NAME_RHO_CHONO_4'),
          ('CIVILIZATION_RHO_CHONO',     'TXT_KEY_SPY_NAME_RHO_CHONO_5'),
          ('CIVILIZATION_RHO_CHONO',     'TXT_KEY_SPY_NAME_RHO_CHONO_6'),
          ('CIVILIZATION_RHO_CHONO',     'TXT_KEY_SPY_NAME_RHO_CHONO_7'),
          ('CIVILIZATION_RHO_CHONO',     'TXT_KEY_SPY_NAME_RHO_CHONO_8'),
          ('CIVILIZATION_RHO_CHONO',     'TXT_KEY_SPY_NAME_RHO_CHONO_9');


INSERT INTO Colors
(Type,                                        Red,     Green,    Blue,     Alpha)
VALUES    ('COLOR_PLAYER_RHO_CHONO_ICON',   0.631,   0.863,    0.945,    1),
('COLOR_PLAYER_RHO_CHONO_BACKGROUND',       0.427,   0.188,    0.149,    1);

INSERT INTO PlayerColors
          (Type,                              PrimaryColor,                                        SecondaryColor,                   TextColor)
VALUES    ('PLAYERCOLOR_RHO_CHONO',        'COLOR_PLAYER_RHO_CHONO_ICON',     'COLOR_PLAYER_RHO_CHONO_BACKGROUND',     'COLOR_PLAYER_WHITE_TEXT');

INSERT INTO Diplomacy_Responses
		(LeaderType, 					ResponseType, 							 			Response, 														Bias)
VALUES 	('LEADER_RHO_OLLETA',	'RESPONSE_FIRST_GREETING', 			 			'TXT_KEY_LEADER_RHO_OLLETA_FIRSTGREETING%', 			 				500),
('LEADER_RHO_OLLETA',	'RESPONSE_DOW_GENERIC', 			 			'TXT_KEY_LEADER_RHO_OLLETA_DOWGENERIC%', 			 				500),
('LEADER_RHO_OLLETA',	'RESPONSE_ATTACKED_HOSTILE', 			 			'TXT_KEY_LEADER_RHO_OLLETA_ATTACKEDHOSTILE%', 			 				500),
('LEADER_RHO_OLLETA',	'RESPONSE_DEFEATED', 			 			'TXT_KEY_LEADER_RHO_OLLETA_DEFEATED%', 			 				500),
('LEADER_RHO_OLLETA',	'RESPONSE_LUXURY_TRADE', 			 			'TXT_KEY_LEADER_RHO_OLLETA_LUXURYTRADE%', 			 				500);