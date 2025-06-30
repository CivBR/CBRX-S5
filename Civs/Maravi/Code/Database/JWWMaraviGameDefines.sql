-------------------------------------------
--Unit (Nyau Cultist)
-------------------------------------------
INSERT INTO Units
		(Type,						Description,						Civilopedia,								Strategy,									Help,									Cost,	FaithCost,	RequiresFaithPurchaseEnabled,	Moves,	BaseSightRange,	Class,	Capture,	Domain,		CivilianAttackPriority,	DefaultUnitAI,		AdvancedStartCost,	MinAreaSize,	NukeDamageLevel,	SpreadReligion,	ReligionSpreads,	ReligiousStrength,	XPValueDefense, UnitArtInfo,						ShowInPedia,	MoveRate,	UnitFlagIconOffset,	PortraitIndex,	IconAtlas,					UnitFlagAtlas)
SELECT	'UNIT_JWW_NYAU_CULTIST',	'TXT_KEY_UNIT_JWW_NYAU_CULTIST',	'TXT_KEY_CIV5_UNIT_JWW_NYAU_CULTIST_TEXT',	'TXT_KEY_UNIT_JWW_NYAU_CULTIST_STRATEGY',	'TXT_KEY_UNIT_HELP_JWW_NYAU_CULTIST',	Cost,	0,			0,								Moves,	BaseSightRange,	Class,	Capture,	Domain,		CivilianAttackPriority,	DefaultUnitAI,		AdvancedStartCost,	MinAreaSize,	NukeDamageLevel,	SpreadReligion,	ReligionSpreads,	ReligiousStrength,	XPValueDefense,	'ART_DEF_UNIT_JWW_NYAU_CULTIST',	ShowInPedia,	MoveRate,	0,					4,				'JWW_MARAVI_COLOR_ATLAS',	'JWW_MARAVI_UNIT_ALPHA_ATLAS_2'
FROM Units WHERE Type = 'UNIT_MISSIONARY';

INSERT INTO UnitGameplay2DScripts
		(UnitType,					SelectionSound,		FirstSelectionSound)
SELECT	'UNIT_JWW_NYAU_CULTIST',	SelectionSound,		FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_MISSIONARY';

INSERT INTO Unit_AITypes
		(UnitType,					UnitAIType)
SELECT	'UNIT_JWW_NYAU_CULTIST',	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_MISSIONARY';

INSERT INTO Unit_FreePromotions
		(UnitType,					PromotionType)
SELECT	'UNIT_JWW_NYAU_CULTIST',	PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_MISSIONARY';

INSERT INTO UnitPromotions
		(Type,							Description,						Help,										Invisible,				Sound,				CannotBeChosen,	PortraitIndex,	IconAtlas,			PediaType,			PediaEntry)
VALUES	('PROMOTION_JWW_NYAU_INVIS',	'TXT_KEY_PROMOTION_JWW_NYAU_INVIS',	'TXT_KEY_PROMOTION_JWW_NYAU_INVIS_HELP',	'INVISIBLE_SUBMARINE',	'AS2D_IF_LEVELUP',	1,				43,				'PROMOTION_ATLAS',	'PEDIA_ATTRIBUTES',	'TXT_KEY_PROMOTION_JWW_NYAU_INVIS');
-------------------------------------------
--Unit (Zimba Marauder)
-------------------------------------------
INSERT INTO Units
		(Type,						Description,						Civilopedia,									Strategy,									Help,									Combat,	Cost,	FaithCost,	RequiresFaithPurchaseEnabled,	Moves,	BaseSightRange,	Class,	CombatClass,	Domain,		DefaultUnitAI,		MilitarySupport,	MilitaryProduction,	Pillage,	IgnoreBuildingDefense,	PrereqTech,	ObsoleteTech,	GoodyHutUpgradeUnitClass,	HurryCostModifier,	AdvancedStartCost,	MinAreaSize,	NukeDamageLevel,	CombatLimit,	XPValueAttack,	XPValueDefense,	Conscription,	UnitArtInfo,						ShowInPedia,	MoveRate,	UnitFlagIconOffset,	PortraitIndex,	IconAtlas,					UnitFlagAtlas)
SELECT	'UNIT_JWW_ZIMBA_MARAUDER',	'TXT_KEY_UNIT_JWW_ZIMBA_MARAUDER',	'TXT_KEY_CIV5_UNIT_JWW_ZIMBA_MARAUDER_TEXT',	'TXT_KEY_UNIT_JWW_ZIMBA_MARAUDER_STRATEGY',	'TXT_KEY_UNIT_HELP_JWW_ZIMBA_MARAUDER', Combat,	Cost,	FaithCost,	RequiresFaithPurchaseEnabled,	Moves,	BaseSightRange,	Class,	CombatClass,	Domain,		DefaultUnitAI,		MilitarySupport,	MilitaryProduction,	0,			IgnoreBuildingDefense,	PrereqTech,	ObsoleteTech,	GoodyHutUpgradeUnitClass,	HurryCostModifier,	AdvancedStartCost,	MinAreaSize,	NukeDamageLevel,	CombatLimit,	XPValueAttack,	XPValueDefense,	Conscription,	'ART_DEF_UNIT_JWW_ZIMBA_MARAUDER',	ShowInPedia,	MoveRate,	0,					2,				'JWW_MARAVI_COLOR_ATLAS',	'JWW_MARAVI_UNIT_ALPHA_ATLAS'
FROM Units WHERE Type = 'UNIT_PIKEMAN';

INSERT INTO UnitGameplay2DScripts
		(UnitType,					SelectionSound,		FirstSelectionSound)
SELECT	'UNIT_JWW_ZIMBA_MARAUDER',	SelectionSound,		FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_PIKEMAN';

INSERT INTO Unit_AITypes
		(UnitType,					UnitAIType)
SELECT	'UNIT_JWW_ZIMBA_MARAUDER',	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_PIKEMAN';

INSERT INTO Unit_Flavors
		(UnitType,					FlavorType,			Flavor)
SELECT	'UNIT_JWW_ZIMBA_MARAUDER',	FlavorType,			Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_PIKEMAN';

INSERT INTO Unit_ClassUpgrades
		(UnitType,					UnitClassType)
SELECT	'UNIT_JWW_ZIMBA_MARAUDER',	UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_PIKEMAN';

INSERT INTO Unit_ResourceQuantityRequirements
		(UnitType,					ResourceType,	Cost)
SELECT	'UNIT_JWW_ZIMBA_MARAUDER',	ResourceType,	Cost
FROM Unit_ResourceQuantityRequirements WHERE UnitType = 'UNIT_PIKEMAN';
-------------------------------------------
--Leader (Kalonga Mazula)
-------------------------------------------
INSERT INTO Leaders
		(Type,							Description,							Civilopedia,								CivilopediaTag,										ArtDefineTag,					VictoryCompetitiveness,	WonderCompetitiveness,	MinorCivCompetitiveness,	Boldness,	DiploBalance,	WarmongerHate,	WorkAgainstWillingness,	WorkWithWillingness,	DenounceWillingness,	DoFWillingness,	Loyalty,	Neediness,	Forgiveness,	Chattiness,	Meanness,	PortraitIndex,	IconAtlas)
VALUES	('LEADER_JWW_KALONGA_MAZULA',	'TXT_KEY_LEADER_JWW_KALONGA_MAZULA',	'TXT_KEY_LEADER_JWW_KALONGA_MAZULA_PEDIA',	'TXT_KEY_CIVILOPEDIA_LEADERS_JWW_KALONGA_MAZULA',	'JWWKalongaMazulaScene.xml',	8,						5,						7,							8,			2,				2,				7,						7,						3,						5,				2,			6,			2,				0,			10,			0,				'JWW_MARAVI_COLOR_ATLAS');

INSERT INTO Leader_MajorCivApproachBiases
		(LeaderType,					MajorCivApproachType,				Bias)
VALUES	('LEADER_JWW_KALONGA_MAZULA',	'MAJOR_CIV_APPROACH_WAR',			9),
		('LEADER_JWW_KALONGA_MAZULA',	'MAJOR_CIV_APPROACH_HOSTILE',		10),
		('LEADER_JWW_KALONGA_MAZULA',	'MAJOR_CIV_APPROACH_DECEPTIVE',		7),
		('LEADER_JWW_KALONGA_MAZULA',	'MAJOR_CIV_APPROACH_GUARDED',		3),
		('LEADER_JWW_KALONGA_MAZULA',	'MAJOR_CIV_APPROACH_AFRAID',		1),
		('LEADER_JWW_KALONGA_MAZULA',	'MAJOR_CIV_APPROACH_FRIENDLY',		3),
		('LEADER_JWW_KALONGA_MAZULA',	'MAJOR_CIV_APPROACH_NEUTRAL',		4);

INSERT INTO Leader_MinorCivApproachBiases
		(LeaderType,					MinorCivApproachType,				Bias)
VALUES	('LEADER_JWW_KALONGA_MAZULA',	'MINOR_CIV_APPROACH_IGNORE',		2),
		('LEADER_JWW_KALONGA_MAZULA',	'MINOR_CIV_APPROACH_FRIENDLY',		1),
		('LEADER_JWW_KALONGA_MAZULA',	'MINOR_CIV_APPROACH_PROTECTIVE',	2),
		('LEADER_JWW_KALONGA_MAZULA',	'MINOR_CIV_APPROACH_CONQUEST',		9),
		('LEADER_JWW_KALONGA_MAZULA',	'MINOR_CIV_APPROACH_BULLY',			10);

INSERT INTO	Leader_Flavors
		(LeaderType,					FlavorType,							Flavor)
VALUES	('LEADER_JWW_KALONGA_MAZULA',	'FLAVOR_OFFENSE',					9),
		('LEADER_JWW_KALONGA_MAZULA',	'FLAVOR_DEFENSE',					2),
		('LEADER_JWW_KALONGA_MAZULA',	'FLAVOR_CITY_DEFENSE',				1),
		('LEADER_JWW_KALONGA_MAZULA',	'FLAVOR_MILITARY_TRAINING',			9),
		('LEADER_JWW_KALONGA_MAZULA',	'FLAVOR_RECON',						9),
		('LEADER_JWW_KALONGA_MAZULA',	'FLAVOR_RANGED',					3),
		('LEADER_JWW_KALONGA_MAZULA',	'FLAVOR_MOBILE',					4),
		('LEADER_JWW_KALONGA_MAZULA',	'FLAVOR_NAVAL',						2),
		('LEADER_JWW_KALONGA_MAZULA',	'FLAVOR_NAVAL_RECON',				1),
		('LEADER_JWW_KALONGA_MAZULA',	'FLAVOR_NAVAL_GROWTH',				1),
		('LEADER_JWW_KALONGA_MAZULA',	'FLAVOR_NAVAL_TILE_IMPROVEMENT',	3),
		('LEADER_JWW_KALONGA_MAZULA',	'FLAVOR_AIR',						6),
		('LEADER_JWW_KALONGA_MAZULA',	'FLAVOR_EXPANSION',					8),
		('LEADER_JWW_KALONGA_MAZULA',	'FLAVOR_GROWTH',					8),
		('LEADER_JWW_KALONGA_MAZULA',	'FLAVOR_TILE_IMPROVEMENT',			5),
		('LEADER_JWW_KALONGA_MAZULA',	'FLAVOR_INFRASTRUCTURE',			6),
		('LEADER_JWW_KALONGA_MAZULA',	'FLAVOR_PRODUCTION',				8),
		('LEADER_JWW_KALONGA_MAZULA',	'FLAVOR_GOLD',						9),
		('LEADER_JWW_KALONGA_MAZULA',	'FLAVOR_SCIENCE',					2),
		('LEADER_JWW_KALONGA_MAZULA',	'FLAVOR_CULTURE',					6),
		('LEADER_JWW_KALONGA_MAZULA',	'FLAVOR_HAPPINESS',					1),
		('LEADER_JWW_KALONGA_MAZULA',	'FLAVOR_GREAT_PEOPLE',				2),
		('LEADER_JWW_KALONGA_MAZULA',	'FLAVOR_WONDER',					6),
		('LEADER_JWW_KALONGA_MAZULA',	'FLAVOR_RELIGION',					10),
		('LEADER_JWW_KALONGA_MAZULA',	'FLAVOR_DIPLOMACY',					2),
		('LEADER_JWW_KALONGA_MAZULA',	'FLAVOR_SPACESHIP',					1),
		('LEADER_JWW_KALONGA_MAZULA',	'FLAVOR_WATER_CONNECTION',			2),
		('LEADER_JWW_KALONGA_MAZULA',	'FLAVOR_NUKE',						6),
		('LEADER_JWW_KALONGA_MAZULA',	'FLAVOR_USE_NUKE',					8),
		('LEADER_JWW_KALONGA_MAZULA',	'FLAVOR_ESPIONAGE',					10),
		('LEADER_JWW_KALONGA_MAZULA',	'FLAVOR_ANTIAIR',					6),
		('LEADER_JWW_KALONGA_MAZULA',	'FLAVOR_AIR_CARRIER',				2),
		('LEADER_JWW_KALONGA_MAZULA',	'FLAVOR_ARCHAEOLOGY',				8),
		('LEADER_JWW_KALONGA_MAZULA',	'FLAVOR_I_LAND_TRADE_ROUTE',		9),
		('LEADER_JWW_KALONGA_MAZULA',	'FLAVOR_I_SEA_TRADE_ROUTE',			2),
		('LEADER_JWW_KALONGA_MAZULA',	'FLAVOR_I_TRADE_ORIGIN',			7),
		('LEADER_JWW_KALONGA_MAZULA',	'FLAVOR_I_TRADE_DESTINATION',		8),
		('LEADER_JWW_KALONGA_MAZULA',	'FLAVOR_AIRLIFT',					5);

INSERT INTO Leader_Traits
		(LeaderType,					TraitType)
VALUES	('LEADER_JWW_KALONGA_MAZULA',	'TRAIT_JWW_PROPHECY_OF_CHAUTA');
-------------------------------------------
--Trait (Prophecy of Chauta)
-------------------------------------------
INSERT INTO Traits
		(Type,								Description,							ShortDescription)
VALUES	('TRAIT_JWW_PROPHECY_OF_CHAUTA',	'TXT_KEY_TRAIT_JWW_PROPHECY_OF_CHAUTA',	'TXT_KEY_TRAIT_JWW_PROPHECY_OF_CHAUTA_SHORT');

INSERT INTO BuildingClasses
		(Type, 											DefaultBuilding, 								Description)
VALUES	('BUILDINGCLASS_JWW_MARAVI_UA_DUMMY', 			'BUILDING_JWW_MARAVI_UA_DUMMY', 			'TXT_KEY_BUILDING_JWW_MARAVI_UA_DUMMY');

INSERT INTO Buildings      
        (TYPE,										BuildingClass,									 Cost,  FaithCost, GreatWorkCount,   NeverCapture,  Description)
VALUES  ('BUILDING_JWW_MARAVI_UA_DUMMY',			'BUILDINGCLASS_JWW_MARAVI_UA_DUMMY',			 -1,    -1,        -1,               1,             'TXT_KEY_BUILDING_JWW_MARAVI_UA_DUMMY');

INSERT INTO Building_UnitCombatFreeExperiences  
        (BuildingType,						 UnitCombatType,							 Experience)
VALUES  ('BUILDING_JWW_MARAVI_UA_DUMMY',	 'UNITCOMBAT_MELEE',                        3),
        ('BUILDING_JWW_MARAVI_UA_DUMMY',	 'UNITCOMBAT_RECON',                        3),
        ('BUILDING_JWW_MARAVI_UA_DUMMY',	 'UNITCOMBAT_ARCHER',                       3),
        ('BUILDING_JWW_MARAVI_UA_DUMMY',	 'UNITCOMBAT_MOUNTED',                      3),
        ('BUILDING_JWW_MARAVI_UA_DUMMY',	 'UNITCOMBAT_SIEGE',                        3),
        ('BUILDING_JWW_MARAVI_UA_DUMMY',     'UNITCOMBAT_GUN',							3),
        ('BUILDING_JWW_MARAVI_UA_DUMMY',     'UNITCOMBAT_ARMOR',                        3),
        ('BUILDING_JWW_MARAVI_UA_DUMMY',     'UNITCOMBAT_HELICOPTER',                   3),
        ('BUILDING_JWW_MARAVI_UA_DUMMY',     'UNITCOMBAT_NAVALRANGED',                  3),
        ('BUILDING_JWW_MARAVI_UA_DUMMY',     'UNITCOMBAT_FIGHTER',                      3),
        ('BUILDING_JWW_MARAVI_UA_DUMMY',     'UNITCOMBAT_BOMBER',                       3),
        ('BUILDING_JWW_MARAVI_UA_DUMMY',     'UNITCOMBAT_NAVALMELEE',                   3);
-------------------------------------------
--Religion (Nyau)
-------------------------------------------
INSERT INTO Religions
		(Type,						Description,					Civilopedia,							IconAtlas,						PortraitIndex,	IconString)
VALUES	('RELIGION_JWW_NYAU',	'TXT_KEY_RELIGION_JWW_NYAU',	'TXT_KEY_RELIGION_JWW_NYAU_PEDIA',	'JWW_MARAVI_RELIGION_ATLAS',	0,				'[ICON_RELIGION_JWW_NYAU]');
-------------------------------------------
--Diplomacy Responses
-------------------------------------------
INSERT INTO Diplomacy_Responses
		(LeaderType,					  ResponseType,									   Response,																	Bias)
VALUES	('LEADER_JWW_KALONGA_MAZULA',     'RESPONSE_ATTACKED_HOSTILE',                     'TXT_KEY_LEADER_JWW_KALONGA_MAZULA_ATTACKED_GENERIC%',						500),
		('LEADER_JWW_KALONGA_MAZULA',     'RESPONSE_DEFEATED',                             'TXT_KEY_LEADER_JWW_KALONGA_MAZULA_DEFEATED%',								500),
		('LEADER_JWW_KALONGA_MAZULA',     'RESPONSE_DOW_GENERIC',                          'TXT_KEY_LEADER_JWW_KALONGA_MAZULA_DOW_GENERIC%',							500),
		('LEADER_JWW_KALONGA_MAZULA',     'RESPONSE_EXPANSION_SERIOUS_WARNING',            'TXT_KEY_LEADER_JWW_KALONGA_MAZULA_EXPANSION_SERIOUS_WARNING%',				500),
		('LEADER_JWW_KALONGA_MAZULA',     'RESPONSE_FIRST_GREETING',                       'TXT_KEY_LEADER_JWW_KALONGA_MAZULA_FIRSTGREETING%',							500),
		('LEADER_JWW_KALONGA_MAZULA',     'RESPONSE_GREETING_AT_WAR_HOSTILE',			   'TXT_KEY_LEADER_JWW_KALONGA_MAZULA_GREETING_AT_WAR_HOSTILE%',				500),
		('LEADER_JWW_KALONGA_MAZULA',     'RESPONSE_GREETING_POLITE_HELLO',                'TXT_KEY_LEADER_JWW_KALONGA_MAZULA_GREETING_POLITE_HELLO%',					500),
		('LEADER_JWW_KALONGA_MAZULA',     'RESPONSE_GREETING_NEUTRAL_HELLO',               'TXT_KEY_LEADER_JWW_KALONGA_MAZULA_GREETING_NEUTRAL_HELLO%',					500),
		('LEADER_JWW_KALONGA_MAZULA',     'RESPONSE_GREETING_HOSTILE_HELLO',               'TXT_KEY_LEADER_JWW_KALONGA_MAZULA_GREETING_HOSTILE_HELLO%',					500),
		('LEADER_JWW_KALONGA_MAZULA',     'RESPONSE_HOSTILE_AGGRESSIVE_MILITARY_WARNING',  'TXT_KEY_LEADER_JWW_KALONGA_MAZULA_HOSTILE_AGGRESSIVE_MILITARY_WARNING%',	500),
		('LEADER_JWW_KALONGA_MAZULA',     'RESPONSE_INFLUENTIAL_ON_AI',                    'TXT_KEY_LEADER_JWW_KALONGA_MAZULA_INFLUENTIAL_ON_AI%',						500),
		('LEADER_JWW_KALONGA_MAZULA',     'RESPONSE_INFLUENTIAL_ON_HUMAN',                 'TXT_KEY_LEADER_JWW_KALONGA_MAZULA_INFLUENTIAL_ON_HUMAN%',					500),	
		('LEADER_JWW_KALONGA_MAZULA',     'RESPONSE_LETS_HEAR_IT',                         'TXT_KEY_LEADER_JWW_KALONGA_MAZULA_LETS_HEAR_IT%',							500),
		('LEADER_JWW_KALONGA_MAZULA',     'RESPONSE_LUXURY_TRADE',                         'TXT_KEY_LEADER_JWW_KALONGA_MAZULA_LUXURY_TRADE%',							500),
		('LEADER_JWW_KALONGA_MAZULA',     'RESPONSE_NO_PEACE',                             'TXT_KEY_LEADER_JWW_KALONGA_MAZULA_NO_PEACE%',								500),
		('LEADER_JWW_KALONGA_MAZULA',     'RESPONSE_OPEN_BORDERS_EXCHANGE',                'TXT_KEY_LEADER_JWW_KALONGA_MAZULA_OPEN_BORDERS_EXCHANGE%',					500),
		('LEADER_JWW_KALONGA_MAZULA',     'RESPONSE_PEACE_MADE_BY_HUMAN_GRACIOUS',         'TXT_KEY_LEADER_JWW_KALONGA_MAZULA_LOSEWAR%',								500),
		('LEADER_JWW_KALONGA_MAZULA',     'RESPONSE_REPEAT_NO',                            'TXT_KEY_LEADER_JWW_KALONGA_MAZULA_REPEAT_NO%',								500),
		('LEADER_JWW_KALONGA_MAZULA',     'RESPONSE_RESPONSE_REQUEST',                     'TXT_KEY_LEADER_JWW_KALONGA_MAZULA_RESPONSE_REQUEST%',						500),
		('LEADER_JWW_KALONGA_MAZULA',     'RESPONSE_RESPONSE_TO_BEING_DENOUNCED',		   'TXT_KEY_LEADER_JWW_KALONGA_MAZULA_RESPONSE_TO_BEING_DENOUNCED%',			500),
		('LEADER_JWW_KALONGA_MAZULA',     'RESPONSE_TOO_SOON_NO_PEACE',                    'TXT_KEY_LEADER_JWW_KALONGA_MAZULA_TOO_SOON_NO_PEACE_1%',					500),
		('LEADER_JWW_KALONGA_MAZULA',     'RESPONSE_WINNER_PEACE_OFFER',                   'TXT_KEY_LEADER_JWW_KALONGA_MAZULA_WINWAR%',									500),
		('LEADER_JWW_KALONGA_MAZULA',     'RESPONSE_WORK_AGAINST_SOMEONE',                 'TXT_KEY_LEADER_JWW_KALONGA_MAZULA_DENOUNCE%',								500),
		('LEADER_JWW_KALONGA_MAZULA',     'RESPONSE_WORK_WITH_US',                         'TXT_KEY_LEADER_JWW_KALONGA_MAZULA_DEC_FRIENDSHIP%',							500);
-------------------------------------------
--Civilization (Maravi)
-------------------------------------------
INSERT INTO Civilizations
		(Type,						Description,					Civilopedia,					CivilopediaTag,				Playable,	AIPlayable,		ShortDescription,							Adjective,							DefaultPlayerColor,			ArtDefineTag,					ArtStyleType,			ArtStyleSuffix,		ArtStylePrefix,		PortraitIndex,	IconAtlas,					AlphaIconAtlas,				MapImage,			DawnOfManQuote,							DawnOfManImage,				SoundtrackTag)
VALUES	('CIVILIZATION_JWW_MARAVI',	'TXT_KEY_CIV_JWW_MARAVI_DESC',	'TXT_KEY_CIV_JWW_MARAVI_PEDIA',	'TXT_KEY_CIV5_JWW_MARAVI',	1,			1,				'TXT_KEY_CIV_JWW_MARAVI_SHORT_DESC',		'TXT_KEY_CIV_JWW_MARAVI_ADJECTIVE',	'PLAYERCOLOR_JWW_MARAVI',	'ART_DEF_CIVILIZATION_ZULU',	'ARTSTYLE_MIDDLE_EAST',	'_AFRI',			'AFRICAN',			1,				'JWW_MARAVI_COLOR_ATLAS',	'JWW_MARAVI_ALPHA_ATLAS',	'JWWMaraviMap.dds',	'TXT_KEY_CIV5_DAWN_JWW_MARAVI_TEXT',	'JWWKalongaMazulaDOM.dds',	'Zulu');

INSERT INTO Civilization_Leaders
		(CivilizationType,			LeaderheadType)
VALUES	('CIVILIZATION_JWW_MARAVI',	'LEADER_JWW_KALONGA_MAZULA');

INSERT INTO Civilization_UnitClassOverrides
		(CivilizationType,			UnitClassType,				UnitType)
VALUES	('CIVILIZATION_JWW_MARAVI',	'UNITCLASS_PIKEMAN',		'UNIT_JWW_ZIMBA_MARAUDER'),
		('CIVILIZATION_JWW_MARAVI',	'UNITCLASS_MISSIONARY',		'UNIT_JWW_NYAU_CULTIST');

INSERT INTO Civilization_FreeBuildingClasses
		(CivilizationType,			BuildingClassType)
VALUES	('CIVILIZATION_JWW_MARAVI',	'BUILDINGCLASS_PALACE');

INSERT INTO Civilization_FreeTechs
		(CivilizationType,			TechType)
VALUES	('CIVILIZATION_JWW_MARAVI',	'TECH_AGRICULTURE');

INSERT INTO Civilization_FreeUnits
		(CivilizationType,			UnitClassType,			UnitAIType,			Count)
VALUES	('CIVILIZATION_JWW_MARAVI',	'UNITCLASS_SETTLER',	'UNITAI_SETTLE',	1);

INSERT INTO Civilization_Religions
		(CivilizationType,			ReligionType)
VALUES	('CIVILIZATION_JWW_MARAVI',	'RELIGION_JWW_NYAU');

INSERT INTO	Civilization_CityNames
		(CivilizationType,			CityName)
VALUES	('CIVILIZATION_JWW_MARAVI',	'TXT_KEY_CITY_NAME_JWW_MARAVI_0'),
		('CIVILIZATION_JWW_MARAVI',	'TXT_KEY_CITY_NAME_JWW_MARAVI_1'),
		('CIVILIZATION_JWW_MARAVI',	'TXT_KEY_CITY_NAME_JWW_MARAVI_2'),
		('CIVILIZATION_JWW_MARAVI',	'TXT_KEY_CITY_NAME_JWW_MARAVI_3'),
		('CIVILIZATION_JWW_MARAVI',	'TXT_KEY_CITY_NAME_JWW_MARAVI_4'),
		('CIVILIZATION_JWW_MARAVI',	'TXT_KEY_CITY_NAME_JWW_MARAVI_5'),
		('CIVILIZATION_JWW_MARAVI',	'TXT_KEY_CITY_NAME_JWW_MARAVI_6'),
		('CIVILIZATION_JWW_MARAVI',	'TXT_KEY_CITY_NAME_JWW_MARAVI_7'),
		('CIVILIZATION_JWW_MARAVI',	'TXT_KEY_CITY_NAME_JWW_MARAVI_8'),
		('CIVILIZATION_JWW_MARAVI',	'TXT_KEY_CITY_NAME_JWW_MARAVI_9'),
		('CIVILIZATION_JWW_MARAVI',	'TXT_KEY_CITY_NAME_JWW_MARAVI_10'),
		('CIVILIZATION_JWW_MARAVI',	'TXT_KEY_CITY_NAME_JWW_MARAVI_11'),
		('CIVILIZATION_JWW_MARAVI',	'TXT_KEY_CITY_NAME_JWW_MARAVI_12'),
		('CIVILIZATION_JWW_MARAVI',	'TXT_KEY_CITY_NAME_JWW_MARAVI_13'),
		('CIVILIZATION_JWW_MARAVI',	'TXT_KEY_CITY_NAME_JWW_MARAVI_14'),
		('CIVILIZATION_JWW_MARAVI',	'TXT_KEY_CITY_NAME_JWW_MARAVI_15'),
		('CIVILIZATION_JWW_MARAVI',	'TXT_KEY_CITY_NAME_JWW_MARAVI_16'),
		('CIVILIZATION_JWW_MARAVI',	'TXT_KEY_CITY_NAME_JWW_MARAVI_17'),
		('CIVILIZATION_JWW_MARAVI',	'TXT_KEY_CITY_NAME_JWW_MARAVI_18'),
		('CIVILIZATION_JWW_MARAVI',	'TXT_KEY_CITY_NAME_JWW_MARAVI_19'),
		('CIVILIZATION_JWW_MARAVI',	'TXT_KEY_CITY_NAME_JWW_MARAVI_20'),
		('CIVILIZATION_JWW_MARAVI',	'TXT_KEY_CITY_NAME_JWW_MARAVI_21'),
		('CIVILIZATION_JWW_MARAVI',	'TXT_KEY_CITY_NAME_JWW_MARAVI_22'),
		('CIVILIZATION_JWW_MARAVI',	'TXT_KEY_CITY_NAME_JWW_MARAVI_23'),
		('CIVILIZATION_JWW_MARAVI',	'TXT_KEY_CITY_NAME_JWW_MARAVI_24'),
		('CIVILIZATION_JWW_MARAVI',	'TXT_KEY_CITY_NAME_JWW_MARAVI_25'),
		('CIVILIZATION_JWW_MARAVI',	'TXT_KEY_CITY_NAME_JWW_MARAVI_26'),
		('CIVILIZATION_JWW_MARAVI',	'TXT_KEY_CITY_NAME_JWW_MARAVI_27'),
		('CIVILIZATION_JWW_MARAVI',	'TXT_KEY_CITY_NAME_JWW_MARAVI_28'),
		('CIVILIZATION_JWW_MARAVI',	'TXT_KEY_CITY_NAME_JWW_MARAVI_29'),
		('CIVILIZATION_JWW_MARAVI',	'TXT_KEY_CITY_NAME_JWW_MARAVI_30'),
		('CIVILIZATION_JWW_MARAVI',	'TXT_KEY_CITY_NAME_JWW_MARAVI_31');
				
INSERT INTO Civilization_SpyNames
		(CivilizationType,				SpyName)
VALUES	('CIVILIZATION_JWW_MARAVI',		'TXT_KEY_SPY_NAME_JWW_MARAVI_0'),
		('CIVILIZATION_JWW_MARAVI',		'TXT_KEY_SPY_NAME_JWW_MARAVI_1'),
		('CIVILIZATION_JWW_MARAVI',		'TXT_KEY_SPY_NAME_JWW_MARAVI_2'),
		('CIVILIZATION_JWW_MARAVI',		'TXT_KEY_SPY_NAME_JWW_MARAVI_3'),
		('CIVILIZATION_JWW_MARAVI',		'TXT_KEY_SPY_NAME_JWW_MARAVI_4'),
		('CIVILIZATION_JWW_MARAVI',		'TXT_KEY_SPY_NAME_JWW_MARAVI_5'),
		('CIVILIZATION_JWW_MARAVI',		'TXT_KEY_SPY_NAME_JWW_MARAVI_6'),
		('CIVILIZATION_JWW_MARAVI',		'TXT_KEY_SPY_NAME_JWW_MARAVI_7'),
		('CIVILIZATION_JWW_MARAVI',		'TXT_KEY_SPY_NAME_JWW_MARAVI_8'),
		('CIVILIZATION_JWW_MARAVI',		'TXT_KEY_SPY_NAME_JWW_MARAVI_9');
--================================================================
--================================================================
