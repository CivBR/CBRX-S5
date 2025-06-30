--==========================================
-- Kingdom of Pegu under Shin Sawbu
-- EmeraldRange
--==========================================
-- Mod Supports:
--		JFDLC JUL 2019: Cultural Diversity, 
--		Historical Religions, Community Patch, 
--		Englightenment Era, YnAEMP
--		Unique Cultural Influence
--==========================================
INSERT INTO Colors (Type,                   Red,  Green, Blue,  Alpha)
VALUES ('COLOR_PLAYER_ER_PEGU_BACKGROUND',  0.698, 0.106, 0.137, 1.0),
       ('COLOR_PLAYER_ER_PEGU_ICON',        0.933, 0.890, 0.611, 1.0);

INSERT INTO PlayerColors (Type,	PrimaryColor,					SecondaryColor,						TextColor)
VALUES ('PLAYERCOLOR_ER_PEGU', 	'COLOR_PLAYER_ER_PEGU_ICON',	'COLOR_PLAYER_ER_PEGU_BACKGROUND', 	'COLOR_PLAYER_WHITE_TEXT');
--==========================================================================================================================	
-- CIVILIZATION BASE DEFINES
--==========================================================================================================================	
INSERT INTO Civilizations	--UNFINISHED																																																		
		(Type, 					 Description, 					ShortDescription, 					Adjective, 							Civilopedia,				CivilopediaTag, 				DefaultPlayerColor, 	ArtDefineTag, 					ArtStyleType, 		ArtStyleSuffix, ArtStylePrefix, PortraitIndex, 	IconAtlas, 			AlphaIconAtlas, 		MapImage, 				DawnOfManQuote, 					DawnOfManImage,			DawnOfManAudio,				SoundtrackTag)					 
VALUES	('CIVILIZATION_ER_PEGU', 'TXT_KEY_CIV_ER_PEGU_DESC', 	'TXT_KEY_CIV_ER_PEGU_SHORT_DESC',	'TXT_KEY_CIV_ER_PEGU_ADJECTIVE', 	'TXT_KEY_ER_PEGU_PEDIA',	'TXT_KEY_CIVILOPEDIA_ER_PEGU', 	'PLAYERCOLOR_ER_PEGU', 	'ART_DEF_CIVILIZATION_SIAM', 	'ARTSTYLE_ASIAN', 	'_ASIA', 		'ASIAN',		0, 				'ER_PEGU_ATLAS', 	'ER_ALPHA_PEGU_ATLAS', 	'Pegu_Cartography.dds', 'TXT_KEY_CIV_DAWN_ER_PEGU_TEXT', 	'Pegu_DOM.dds', 	'AS2D_DOM_SPEECH_ER_PEGU', 'Siam');

-- Free Techs, Units and Buildings
INSERT INTO Civilization_FreeTechs(CivilizationType, TechType)
VALUES(					     'CIVILIZATION_ER_PEGU', 'TECH_AGRICULTURE');
INSERT INTO Civilization_FreeUnits 
		(CivilizationType, 				UnitClassType, Count, UnitAIType)
SELECT	'CIVILIZATION_ER_PEGU',			UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_SIAM';
INSERT INTO Civilization_FreeBuildingClasses(CivilizationType, 	BuildingClassType)
VALUES(								   	'CIVILIZATION_ER_PEGU',	'BUILDINGCLASS_PALACE');

-- Civ Biases 
INSERT INTO Civilization_Start_Along_Ocean (CivilizationType, 		StartAlongOcean)
VALUES									 ('CIVILIZATION_ER_PEGU', 	1);
INSERT INTO Civilization_Religions(CivilizationType, ReligionType)
VALUES					    ('CIVILIZATION_ER_PEGU', 'RELIGION_BUDDHISM');

--==========================================================================================================================	
-- LEADER
--==========================================================================================================================
INSERT INTO Leaders(Type, 					Description, 						 Civilopedia, 							CivilopediaTag, 				ArtDefineTag, 		PortraitIndex, IconAtlas, 	VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, Boldness,  Diplobalance,	WarmongerHate,  DenounceWillingness, 	DoFWillingness, Loyalty, Neediness, Forgiveness, Chattiness, Meanness,  WorkAgainstWillingness, WorkWithWillingness)
VALUES			   ('LEADER_ER_SHIN_SAWBU', 'TXT_KEY_LEADER_ER_SHIN_SAWBU_DESC', 'TXT_KEY_LEADER_ER_SHIN_SAWBU_PEDIA', 	'TXT_KEY_LEADER_ER_SHIN_SAWBU', 'Sawbu_scene.xml', 	3, 	  	  'ER_PEGU_ATLAS', 	4, 						7, 						8, 						 3, 		6, 			 	5, 				4, 						7, 				5, 		 6, 		6, 			 6,			 3, 	   	8,						5);

INSERT INTO Civilization_Leaders
VALUES ('CIVILIZATION_ER_PEGU', 'LEADER_ER_SHIN_SAWBU');

INSERT INTO Leader_MajorCivApproachBiases
		(LeaderType, 				MajorCivApproachType, 			Bias)
VALUES	('LEADER_ER_SHIN_SAWBU', 	'MAJOR_CIV_APPROACH_WAR', 		5),
		('LEADER_ER_SHIN_SAWBU', 	'MAJOR_CIV_APPROACH_HOSTILE',	2),
		('LEADER_ER_SHIN_SAWBU', 	'MAJOR_CIV_APPROACH_DECEPTIVE', 6),
		('LEADER_ER_SHIN_SAWBU', 	'MAJOR_CIV_APPROACH_GUARDED', 	8),
		('LEADER_ER_SHIN_SAWBU', 	'MAJOR_CIV_APPROACH_AFRAID', 	4),
		('LEADER_ER_SHIN_SAWBU', 	'MAJOR_CIV_APPROACH_FRIENDLY', 	6),
		('LEADER_ER_SHIN_SAWBU', 	'MAJOR_CIV_APPROACH_NEUTRAL', 	6);
		
INSERT INTO Leader_MinorCivApproachBiases
		(LeaderType, 			MinorCivApproachType, 			Bias)
VALUES 	('LEADER_ER_SHIN_SAWBU', 	'MINOR_CIV_APPROACH_IGNORE', 	3),
		('LEADER_ER_SHIN_SAWBU', 	'MINOR_CIV_APPROACH_FRIENDLY',  8),
		('LEADER_ER_SHIN_SAWBU', 	'MINOR_CIV_APPROACH_PROTECTIVE',7),
		('LEADER_ER_SHIN_SAWBU', 	'MINOR_CIV_APPROACH_CONQUEST',  4);
		
INSERT INTO Leader_Flavors
		(LeaderType, 			FlavorType, 					Flavor)
VALUES  ('LEADER_ER_SHIN_SAWBU',	'FLAVOR_OFFENSE',				5),
		('LEADER_ER_SHIN_SAWBU',	'FLAVOR_DEFENSE', 				6),
		('LEADER_ER_SHIN_SAWBU',	'FLAVOR_CITY_DEFENSE', 	 		6),
		('LEADER_ER_SHIN_SAWBU',	'FLAVOR_MILITARY_TRAINING',		4),
		('LEADER_ER_SHIN_SAWBU',	'FLAVOR_RECON', 				6),
		('LEADER_ER_SHIN_SAWBU',	'FLAVOR_RANGED',				4),
		('LEADER_ER_SHIN_SAWBU',	'FLAVOR_MOBILE',				5),
		('LEADER_ER_SHIN_SAWBU',	'FLAVOR_NAVAL',					8),
		('LEADER_ER_SHIN_SAWBU',	'FLAVOR_NAVAL_RECON',			8),
		('LEADER_ER_SHIN_SAWBU',	'FLAVOR_NAVAL_GROWTH',			7),
		('LEADER_ER_SHIN_SAWBU',	'FLAVOR_NAVAL_TILE_IMPROVEMENT',7),
		('LEADER_ER_SHIN_SAWBU',	'FLAVOR_AIR', 					6),
		('LEADER_ER_SHIN_SAWBU',	'FLAVOR_EXPANSION', 			6),
		('LEADER_ER_SHIN_SAWBU',	'FLAVOR_GROWTH', 				4),
		('LEADER_ER_SHIN_SAWBU',	'FLAVOR_TILE_IMPROVEMENT',		3),
		('LEADER_ER_SHIN_SAWBU',	'FLAVOR_INFRASTRUCTURE',		4),
		('LEADER_ER_SHIN_SAWBU',	'FLAVOR_PRODUCTION',			5),
		('LEADER_ER_SHIN_SAWBU',	'FLAVOR_GOLD',					7),
		('LEADER_ER_SHIN_SAWBU',	'FLAVOR_SCIENCE',				7),
		('LEADER_ER_SHIN_SAWBU',	'FLAVOR_CULTURE',				5),
		('LEADER_ER_SHIN_SAWBU',	'FLAVOR_HAPPINESS',				5),
		('LEADER_ER_SHIN_SAWBU',	'FLAVOR_GREAT_PEOPLE',			6),
		('LEADER_ER_SHIN_SAWBU',	'FLAVOR_WONDER',				7),
		('LEADER_ER_SHIN_SAWBU',	'FLAVOR_RELIGION',				8),
		('LEADER_ER_SHIN_SAWBU',	'FLAVOR_DIPLOMACY',				6),
		('LEADER_ER_SHIN_SAWBU',	'FLAVOR_SPACESHIP',				7),
		('LEADER_ER_SHIN_SAWBU',	'FLAVOR_WATER_CONNECTION', 		7),
		('LEADER_ER_SHIN_SAWBU',	'FLAVOR_NUKE',					2),
		('LEADER_ER_SHIN_SAWBU',	'FLAVOR_USE_NUKE',				4),
		('LEADER_ER_SHIN_SAWBU',	'FLAVOR_ESPIONAGE',				7),
		('LEADER_ER_SHIN_SAWBU',	'FLAVOR_ANTIAIR',				5),
		('LEADER_ER_SHIN_SAWBU',	'FLAVOR_AIR_CARRIER',			8),
		('LEADER_ER_SHIN_SAWBU',	'FLAVOR_ARCHAEOLOGY',			5),
		('LEADER_ER_SHIN_SAWBU',	'FLAVOR_I_LAND_TRADE_ROUTE', 	5),
		('LEADER_ER_SHIN_SAWBU',	'FLAVOR_I_SEA_TRADE_ROUTE',		10),
		('LEADER_ER_SHIN_SAWBU',	'FLAVOR_I_TRADE_ORIGIN', 		6),
		('LEADER_ER_SHIN_SAWBU',	'FLAVOR_I_TRADE_DESTINATION',	8),
		('LEADER_ER_SHIN_SAWBU',	'FLAVOR_AIRLIFT',				7);
		
INSERT INTO Diplomacy_Responses
		(LeaderType,				ResponseType,							Response,									 Bias)
VALUES	('LEADER_ER_SHIN_SAWBU',	'RESPONSE_FIRST_GREETING',				'TXT_KEY_LEADER_ER_SHIN_SAWBU_FIRSTGREETING%',	1),
		('LEADER_ER_SHIN_SAWBU',	'RESPONSE_DEFEATED',					'TXT_KEY_LEADER_ER_SHIN_SAWBU_DEFEATED%',		1),
		('LEADER_ER_SHIN_SAWBU',	'RESPONSE_DOW_LEADER_ER_SHIN_SAWBU',	'TXT_KEY_LEADER_ER_SHIN_SAWBU_DECLAREWAR%',		1),
		('LEADER_ER_SHIN_SAWBU',	'RESPONSE_ATTACKED_BETRAYED',			'TXT_KEY_LEADER_ER_SHIN_SAWBU_ATTACKED%',		1),
		('LEADER_ER_SHIN_SAWBU',	'RESPONSE_ATTACKED_STRONG_HOSTILE',		'TXT_KEY_LEADER_ER_SHIN_SAWBU_ATTACKED%',		1),
		('LEADER_ER_SHIN_SAWBU',	'RESPONSE_ATTACKED_WEAK_HOSTILE',		'TXT_KEY_LEADER_ER_SHIN_SAWBU_ATTACKED%',		1),
		('LEADER_ER_SHIN_SAWBU',	'RESPONSE_ATTACKED_HOSTILE',			'TXT_KEY_LEADER_ER_SHIN_SAWBU_ATTACKED%',		1);
--==========================================================================================================================	
-- Unique Ability: Vector of Civilisation
--==========================================================================================================================
INSERT INTO Traits 
		(Type, 					Description, 						ShortDescription)
VALUES	('TRAIT_ER_VECTOR_CIV',	'TXT_KEY_TRAIT_ER_VECTOR_CIV_DESC', 'TXT_KEY_TRAIT_ER_VECTOR_CIV');	

INSERT INTO Leader_Traits(LeaderType, 		TraitType)
VALUES			 ('LEADER_ER_SHIN_SAWBU',	'TRAIT_ER_VECTOR_CIV');


--DUMMY
INSERT INTO BuildingClasses
		(Type, 						  	DefaultBuilding, 				Description,							NoLimit)
VALUES	('BUILDINGCLASS_ER_PEGU_DUMMY',	'BUILDING_ER_PEGU_15GOLDDUMMY',	'TXT_KEY_BUILDING_ER_PEGU_15GOLDDUMMY',	1);

INSERT INTO Buildings		
		(Type, 							BuildingClass, 					Cost, 	FaithCost,	PrereqTech,	GreatWorkCount,	PlotCultureCostModifier, PortraitIndex, IconAtlas,	Description, 						Help,								NeverCapture,	NukeImmune)
VALUES	('BUILDING_ER_PEGU_UADUMMY',	'BUILDINGCLASS_ER_PEGU_DUMMY',	-1,		-1,			null, 			-1,				0,						 19,		 'BW_ATLAS_1',	'TXT_KEY_BUILDING_ER_PEGU_UADUMMY',	'TXT_KEY_BUILDING_ER_PEGU_UADUMMY_HELP',	1,			 1);

INSERT INTO Building_YieldModifiers
		(BuildingType, 					YieldType, 		Yield)
VALUES 	('BUILDING_ER_PEGU_UADUMMY', 	'YIELD_SCIENCE', 	5);
--==========================================================================================================================	
-- Unique Building: Cetiya
--==========================================================================================================================	
INSERT INTO Buildings (Type, 	BuildingClass, 	Cost, 	PrereqTech, Help, 								Description,					  Civilopedia, 								Strategy, 								ArtDefineTag, 	MinAreaSize, 	HurryCostModifier, GoldMaintenance,	FreeStartEra,	IconAtlas,	PortraitIndex,	Defense,	ConquestProb,	ArtInfoCulturalVariation,	ReligiousPressureModifier)
SELECT 'BUILDING_ER_CETIYA',  	BuildingClass, 	Cost, 	PrereqTech, 'TXT_KEY_BUILDING_ER_CETIYA_HELP', 'TXT_KEY_BUILDING_ER_CETIYA_DESC', 'TXT_KEY_CIV5_BUILDING_ER_CETIYA_TEXT', 	'TXT_KEY_BUILDING_ER_CETIYA_STRATEGY', 	ArtDefineTag, 	MinAreaSize,	HurryCostModifier, 0,				FreeStartEra,	'ER_PEGU_ATLAS', 		1,	Defense,	90,				0,							100						
FROM Buildings WHERE (Type = 'BUILDING_TEMPLE');

INSERT INTO Building_Flavors
		(BuildingType, 			FlavorType, 				 Flavor)
VALUES	('BUILDING_ER_CETIYA',	'FLAVOR_RELIGION',			 40),
		('BUILDING_ER_CETIYA',	'FLAVOR_GOLD',				 45),
		('BUILDING_ER_CETIYA', 	'FLAVOR_I_SEA_TRADE_ROUTE',  15),
		('BUILDING_ER_CETIYA',	'FLAVOR_I_TRADE_DESTINATION',25);

INSERT INTO Building_ClassesNeededInCity
		(BuildingType,			BuildingClassType)
VALUES	('BUILDING_ER_CETIYA',	'BUILDINGCLASS_SHRINE');

INSERT INTO Building_YieldChanges
		(BuildingType,	YieldType,		Yield)
VALUES	('BUILDING_ER_CETIYA',	'YIELD_FAITH',	2);

--DUMMY
INSERT INTO Buildings		
		(Type, 								BuildingClass, 					Cost, 	FaithCost,	GreatWorkCount,	PlotCultureCostModifier, PortraitIndex, IconAtlas,	Description, 							Help,								NeverCapture,	NukeImmune)
VALUES	('BUILDING_ER_PEGU_15GOLDDUMMY',	'BUILDINGCLASS_ER_PEGU_DUMMY',	-1,		-1,			-1,				0,						 19,		 'BW_ATLAS_1',	'TXT_KEY_BUILDING_ER_PEGU_15GOLDDUMMY',	'TXT_KEY_BUILDING_ER_PEGU_15GOLDDUMMY_HELP',	1,			 1),
		('BUILDING_ER_PEGU_5GOLDDUMMY',		'BUILDINGCLASS_ER_PEGU_DUMMY',	-1,		-1,			-1,				0,						 19,		 'BW_ATLAS_1',	'TXT_KEY_BUILDING_ER_PEGU_5GOLDDUMMY',	'TXT_KEY_BUILDING_ER_PEGU_5GOLDDUMMY_HELP',		1,			 1);
INSERT INTO Building_YieldModifiers
		(BuildingType, 						YieldType,		Yield)
VALUES 	('BUILDING_ER_PEGU_15GOLDDUMMY', 	'YIELD_GOLD',	15),
		('BUILDING_ER_PEGU_5GOLDDUMMY', 	'YIELD_GOLD',	5);

INSERT INTO Civilization_BuildingClassOverrides
		(CivilizationType,		  BuildingClassType, 	 	BuildingType)
VALUES 	('CIVILIZATION_ER_PEGU',  'BUILDINGCLASS_TEMPLE', 	'BUILDING_ER_CETIYA');
--==========================================================================================================================	
-- Unique Unit: Kbbang
--==========================================================================================================================	
INSERT INTO Units
(Type, 						Class, Cost, Combat, CombatClass, Moves, MoveRate, BaseSightRange, PrereqTech, 		ObsoleteTech, GoodyHutUpgradeUnitClass, ShowinPedia, Special, Domain, DefaultUnitAI, WorkRate, MilitarySupport, MilitaryProduction, Pillage, Mechanized, CombatLimit, XPValueAttack, XPValueDefense, AdvancedStartCost, WorkRate, MinAreaSize, MoveRate, Description, 				Civilopedia, 				 	Strategy,				 		 	Help,					 		AdvancedStartCost,	UnitArtInfo,				UnitArtInfoEraVariation, UnitFlagIconOffset, UnitFlagAtlas,	PortraitIndex, 	IconAtlas)
SELECT	'UNIT_ER_KBBANG',	Class, Cost, Combat, CombatClass, Moves, MoveRate, BaseSightRange, 'TECH_COMPASS',	ObsoleteTech, GoodyHutUpgradeUnitClass, ShowinPedia, Special, Domain, DefaultUnitAI, WorkRate, MilitarySupport, MilitaryProduction, Pillage, Mechanized, CombatLimit, XPValueAttack, XPValueDefense, AdvancedStartCost, WorkRate, MinAreaSize, MoveRate, 'TXT_KEY_UNIT_ER_KBBANG', 'TXT_KEY_CIV5_UNIT_ER_KBBANG',  'TXT_KEY_UNIT_ER_KBBANG_STRATEGY', 	'TXT_KEY_UNIT_ER_KBBANG_HELP', 	AdvancedStartCost,	'ART_DEF_UNIT_ER_KBBANG',	UnitArtInfoEraVariation, 0,					'ER_KBBANG_FLAG', 2,			'ER_PEGU_ATLAS'
FROM Units WHERE (Type = 'UNIT_CARAVEL');

INSERT INTO UnitGameplay2DScripts
		(UnitType, 			SelectionSound,	FirstSelectionSound)
SELECT	'UNIT_ER_KBBANG',	SelectionSound,	FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_CARAVEL');
INSERT INTO Unit_Builds
		(UnitType,			BuildType)
SELECT 	'UNIT_ER_KBBANG',	BuildType
FROM Unit_Builds WHERE (UnitType = 'UNIT_CARAVEL');
INSERT INTO Unit_AITypes
		(UnitType,				UnitAIType)
SELECT	'UNIT_ER_KBBANG', 	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_CARAVEL';
INSERT INTO Unit_Flavors
		(UnitType, 			FlavorType,			Flavor)
VALUES	('UNIT_ER_KBBANG',	'FLAVOR_NAVAL', 		7),
		('UNIT_ER_KBBANG',	'FLAVOR_NAVAL_RECON', 	12);
INSERT INTO Unit_ClassUpgrades
			(UnitType,		UnitClassType)
SELECT 'UNIT_ER_KBBANG',	UnitClassType
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_CARAVEL');
		
INSERT INTO UnitPromotions 
		(Type, 								Description, 								Help,											Sound,		PortraitIndex,	LostWithUpgrade,	IconAtlas,	PediaType,			PediaEntry,									CannotBeChosen, 	DefenseMod,  RangedDefenseMod)
VALUES	('PROMOTION_ER_KBBANG_MONSAILORS',	'TXT_KEY_PROMOTION_ER_KBBANG_MONSAILORS',	'TXT_KEY_PROMOTION_ER_KBBANG_MONSAILORS_HELP',	'AS2D_IF_LEVELUP',	59,		0,			  'ABILITY_ATLAS',	'PEDIA_ATTRIBUTES',	'TXT_KEY_PROMOTION_ER_KBBANG_MONSAILORS_HELP',	 	 	 1,		50,						   0),
		('PROMOTION_ER_KBBANG_CAMPHORWOOD',	'TXT_KEY_PROMOTION_ER_KBBANG_CAMPHORWOOD',	'TXT_KEY_PROMOTION_ER_KBBANG_CAMPHORWOOD_HELP',	'AS2D_IF_LEVELUP',	59,		0,			  'ABILITY_ATLAS',	'PEDIA_ATTRIBUTES',	'TXT_KEY_PROMOTION_ER_KBBANG_CAMPHORWOOD_HELP',			 1,		 0,						  25);

INSERT INTO Unit_FreePromotions(UnitType, PromotionType)
VALUES(				 	    'UNIT_ER_KBBANG', 'PROMOTION_ER_KBBANG_CAMPHORWOOD'),
	  (					    'UNIT_ER_KBBANG', 'PROMOTION_ER_KBBANG_MONSAILORS');

INSERT INTO Civilization_UnitClassOverrides
		(CivilizationType, 		  UnitClassType,		UnitType)
VALUES	('CIVILIZATION_ER_PEGU', 'UNITCLASS_CARAVEL', 	'UNIT_ER_KBBANG');
--==========================================================================================================================

INSERT INTO Civilization_CityNames 
		(CivilizationType, 		 CityName)
VALUES  ('CIVILIZATION_ER_PEGU', 'TXT_KEY_CITY_NAME_ER_PEGU_HONGSAWATOI'),
        ('CIVILIZATION_ER_PEGU', 'TXT_KEY_CITY_NAME_ER_PEGU_LAGON'),
        ('CIVILIZATION_ER_PEGU', 'TXT_KEY_CITY_NAME_ER_PEGU_MUTTMA'),
        ('CIVILIZATION_ER_PEGU', 'TXT_KEY_CITY_NAME_ER_PEGU_SADHUIM'),
        ('CIVILIZATION_ER_PEGU', 'TXT_KEY_CITY_NAME_ER_PEGU_REW'),
        ('CIVILIZATION_ER_PEGU', 'TXT_KEY_CITY_NAME_ER_PEGU_MAT_MALUIM'),
        ('CIVILIZATION_ER_PEGU', 'TXT_KEY_CITY_NAME_ER_PEGU_KUSIMA'),
        ('CIVILIZATION_ER_PEGU', 'TXT_KEY_CITY_NAME_ER_PEGU_LAGANPAHUN'),
        ('CIVILIZATION_ER_PEGU', 'TXT_KEY_CITY_NAME_ER_PEGU_TNANGSI'),
        ('CIVILIZATION_ER_PEGU', 'TXT_KEY_CITY_NAME_ER_PEGU_VAAN'),
        ('CIVILIZATION_ER_PEGU', 'TXT_KEY_CITY_NAME_ER_PEGU_BIK'),
        ('CIVILIZATION_ER_PEGU', 'TXT_KEY_CITY_NAME_ER_PEGU_KYAIK_HTO'),
        ('CIVILIZATION_ER_PEGU', 'TXT_KEY_CITY_NAME_ER_PEGU_WAW'),
        ('CIVILIZATION_ER_PEGU', 'TXT_KEY_CITY_NAME_ER_PEGU_DALA'),
        ('CIVILIZATION_ER_PEGU', 'TXT_KEY_CITY_NAME_ER_PEGU_IBUIP'),
        ('CIVILIZATION_ER_PEGU', 'TXT_KEY_CITY_NAME_ER_PEGU_TAMOA'),
        ('CIVILIZATION_ER_PEGU', 'TXT_KEY_CITY_NAME_ER_PEGU_TUIK_GALA'),
        ('CIVILIZATION_ER_PEGU', 'TXT_KEY_CITY_NAME_ER_PEGU_MUHSMA'),
        ('CIVILIZATION_ER_PEGU', 'TXT_KEY_CITY_NAME_ER_PEGU_GU_HTUT'),		
        ('CIVILIZATION_ER_PEGU', 'TXT_KEY_CITY_NAME_ER_PEGU_YAN_TMIM'),
        ('CIVILIZATION_ER_PEGU', 'TXT_KEY_CITY_NAME_ER_PEGU_KYAIK_PARO'),
        ('CIVILIZATION_ER_PEGU', 'TXT_KEY_CITY_NAME_ER_PEGU_JRA'),
        ('CIVILIZATION_ER_PEGU', 'TXT_KEY_CITY_NAME_ER_PEGU_HTAWAAI'),
        ('CIVILIZATION_ER_PEGU', 'TXT_KEY_CITY_NAME_ER_PEGU_LMAIN'),
        ('CIVILIZATION_ER_PEGU', 'TXT_KEY_CITY_NAME_ER_PEGU_PAUNG'),
        ('CIVILIZATION_ER_PEGU', 'TXT_KEY_CITY_NAME_ER_PEGU_BRAWATI'),
        ('CIVILIZATION_ER_PEGU', 'TXT_KEY_CITY_NAME_ER_PEGU_DUWOP'),
        ('CIVILIZATION_ER_PEGU', 'TXT_KEY_CITY_NAME_ER_PEGU_SEANG'),
        ('CIVILIZATION_ER_PEGU', 'TXT_KEY_CITY_NAME_ER_PEGU_BIKALEANG'),
        ('CIVILIZATION_ER_PEGU', 'TXT_KEY_CITY_NAME_ER_PEGU_MUDEUNG'),
        ('CIVILIZATION_ER_PEGU', 'TXT_KEY_CITY_NAME_ER_PEGU_DANOK'),
        ('CIVILIZATION_ER_PEGU', 'TXT_KEY_CITY_NAME_ER_PEGU_KYAIK_KAMI'),
        ('CIVILIZATION_ER_PEGU', 'TXT_KEY_CITY_NAME_ER_PEGU_HARIPHUNJAYA'),
        ('CIVILIZATION_ER_PEGU', 'TXT_KEY_CITY_NAME_ER_PEGU_KYAIK_KATHA'),
        ('CIVILIZATION_ER_PEGU', 'TXT_KEY_CITY_NAME_ER_PEGU_LAWAPURA'),
        ('CIVILIZATION_ER_PEGU', 'TXT_KEY_CITY_NAME_ER_PEGU_HENZADA'),
        ('CIVILIZATION_ER_PEGU', 'TXT_KEY_CITY_NAME_ER_PEGU_KISSERAING'),
        ('CIVILIZATION_ER_PEGU', 'TXT_KEY_CITY_NAME_ER_PEGU_SUPHABURI'),
        ('CIVILIZATION_ER_PEGU', 'TXT_KEY_CITY_NAME_ER_PEGU_U_THONG');		
		
INSERT INTO Civilization_SpyNames 
		(CivilizationType, 			SpyName)
VALUES	('CIVILIZATION_ER_PEGU',	'TXT_KEY_SPY_NAME_ER_PEGU_0'),
		('CIVILIZATION_ER_PEGU',	'TXT_KEY_SPY_NAME_ER_PEGU_1'),
		('CIVILIZATION_ER_PEGU',	'TXT_KEY_SPY_NAME_ER_PEGU_2'),
		('CIVILIZATION_ER_PEGU',	'TXT_KEY_SPY_NAME_ER_PEGU_3'),
		('CIVILIZATION_ER_PEGU',	'TXT_KEY_SPY_NAME_ER_PEGU_4'),
		('CIVILIZATION_ER_PEGU',	'TXT_KEY_SPY_NAME_ER_PEGU_5'),
		('CIVILIZATION_ER_PEGU',	'TXT_KEY_SPY_NAME_ER_PEGU_6'),
		('CIVILIZATION_ER_PEGU',	'TXT_KEY_SPY_NAME_ER_PEGU_7'),
		('CIVILIZATION_ER_PEGU',	'TXT_KEY_SPY_NAME_ER_PEGU_8'),
		('CIVILIZATION_ER_PEGU',	'TXT_KEY_SPY_NAME_ER_PEGU_9');
