
-----

--Leader

INSERT INTO Leaders
		(Type,					       Description,						           Civilopedia,							             CivilopediaTag,					   ArtDefineTag,				VictoryCompetitiveness,	WonderCompetitiveness,	MinorCivCompetitiveness,	Boldness,	DiploBalance,	WarmongerHate,	WorkAgainstWillingness,	WorkWithWillingness,	DenounceWillingness,	DoFWillingness,	Loyalty,	Neediness,	Forgiveness,	Chattiness,	Meanness,	PortraitIndex,	IconAtlas)
VALUES	('LEADER_ASQ_GRACEOMALLEY',		'TXT_KEY_LEADER_ASQ_GRACEOMALLEY',			'TXT_KEY_LEADER_ASQ_GRACEOMALLEY_PEDIA',			'TXT_KEY_PEDIA_ASQ_GRACEOMALLEY', 'GraceOMalley_Scene.xml',		7,						2,						6,							8,			4,				3,				8,						5,						8,						3,				2,			3,			1,				8,			8,			1,	            'ATLAS_ASQ_GRACEOMALLEY');

-----

INSERT INTO Leader_MajorCivApproachBiases
		(LeaderType,			MajorCivApproachType,			Bias)
VALUES	('LEADER_ASQ_GRACEOMALLEY',	'MAJOR_CIV_APPROACH_WAR',		8),
		('LEADER_ASQ_GRACEOMALLEY',	'MAJOR_CIV_APPROACH_HOSTILE',	6),
		('LEADER_ASQ_GRACEOMALLEY',	'MAJOR_CIV_APPROACH_DECEPTIVE',	8),
		('LEADER_ASQ_GRACEOMALLEY',	'MAJOR_CIV_APPROACH_GUARDED',	6),
		('LEADER_ASQ_GRACEOMALLEY',	'MAJOR_CIV_APPROACH_FRIENDLY',	4),
		('LEADER_ASQ_GRACEOMALLEY',	'MAJOR_CIV_APPROACH_AFRAID',	3),
		('LEADER_ASQ_GRACEOMALLEY',	'MAJOR_CIV_APPROACH_NEUTRAL',	6);
		
-----

INSERT INTO Leader_MinorCivApproachBiases
		(LeaderType,			MinorCivApproachType,				Bias)
VALUES	('LEADER_ASQ_GRACEOMALLEY',	'MINOR_CIV_APPROACH_IGNORE',		4),
		('LEADER_ASQ_GRACEOMALLEY',	'MINOR_CIV_APPROACH_FRIENDLY',		4),
		('LEADER_ASQ_GRACEOMALLEY',	'MINOR_CIV_APPROACH_PROTECTIVE',	9),
		('LEADER_ASQ_GRACEOMALLEY',	'MINOR_CIV_APPROACH_CONQUEST',		7),
		('LEADER_ASQ_GRACEOMALLEY',	'MINOR_CIV_APPROACH_BULLY',			10);
		
-----

INSERT INTO Leader_Flavors
		(LeaderType, 			FlavorType,							Flavor)
VALUES	('LEADER_ASQ_GRACEOMALLEY',	'FLAVOR_OFFENSE',					11),
		('LEADER_ASQ_GRACEOMALLEY',	'FLAVOR_DEFENSE',					7),
		('LEADER_ASQ_GRACEOMALLEY',	'FLAVOR_CITY_DEFENSE',				4),
		('LEADER_ASQ_GRACEOMALLEY',	'FLAVOR_MILITARY_TRAINING',			8),
		('LEADER_ASQ_GRACEOMALLEY',	'FLAVOR_RECON',						8),
		('LEADER_ASQ_GRACEOMALLEY',	'FLAVOR_RANGED',					6),
		('LEADER_ASQ_GRACEOMALLEY',	'FLAVOR_MOBILE',					5),
		('LEADER_ASQ_GRACEOMALLEY',	'FLAVOR_NAVAL',						12),
		('LEADER_ASQ_GRACEOMALLEY',	'FLAVOR_NAVAL_RECON',				2),
		('LEADER_ASQ_GRACEOMALLEY',	'FLAVOR_NAVAL_GROWTH',				6),
		('LEADER_ASQ_GRACEOMALLEY',	'FLAVOR_NAVAL_TILE_IMPROVEMENT',	3),
		('LEADER_ASQ_GRACEOMALLEY',	'FLAVOR_AIR',						6),
		('LEADER_ASQ_GRACEOMALLEY',	'FLAVOR_EXPANSION',					8),
		('LEADER_ASQ_GRACEOMALLEY',	'FLAVOR_GROWTH',					5),
		('LEADER_ASQ_GRACEOMALLEY',	'FLAVOR_TILE_IMPROVEMENT',			4),
		('LEADER_ASQ_GRACEOMALLEY',	'FLAVOR_INFRASTRUCTURE',			4),
		('LEADER_ASQ_GRACEOMALLEY',	'FLAVOR_PRODUCTION',				7),
		('LEADER_ASQ_GRACEOMALLEY',	'FLAVOR_GOLD',						9),
		('LEADER_ASQ_GRACEOMALLEY',	'FLAVOR_SCIENCE',					6),
		('LEADER_ASQ_GRACEOMALLEY',	'FLAVOR_CULTURE',					3),
		('LEADER_ASQ_GRACEOMALLEY',	'FLAVOR_HAPPINESS',					4),
		('LEADER_ASQ_GRACEOMALLEY',	'FLAVOR_GREAT_PEOPLE',				2),
		('LEADER_ASQ_GRACEOMALLEY',	'FLAVOR_WONDER',					2),
		('LEADER_ASQ_GRACEOMALLEY',	'FLAVOR_RELIGION',					4),
		('LEADER_ASQ_GRACEOMALLEY',	'FLAVOR_DIPLOMACY',					6),
		('LEADER_ASQ_GRACEOMALLEY',	'FLAVOR_SPACESHIP',					2),
		('LEADER_ASQ_GRACEOMALLEY',	'FLAVOR_WATER_CONNECTION',			8),
		('LEADER_ASQ_GRACEOMALLEY',	'FLAVOR_NUKE',						7),
		('LEADER_ASQ_GRACEOMALLEY',	'FLAVOR_USE_NUKE',					10),
		('LEADER_ASQ_GRACEOMALLEY',	'FLAVOR_ESPIONAGE',					3),
		('LEADER_ASQ_GRACEOMALLEY',	'FLAVOR_ANTIAIR',					4),
		('LEADER_ASQ_GRACEOMALLEY',	'FLAVOR_AIR_CARRIER',				4),
		('LEADER_ASQ_GRACEOMALLEY',	'FLAVOR_I_LAND_TRADE_ROUTE',		2),
		('LEADER_ASQ_GRACEOMALLEY',	'FLAVOR_I_SEA_TRADE_ROUTE',			9),
		('LEADER_ASQ_GRACEOMALLEY',	'FLAVOR_ARCHAEOLOGY',				1),
		('LEADER_ASQ_GRACEOMALLEY',	'FLAVOR_I_TRADE_ORIGIN',			5),
		('LEADER_ASQ_GRACEOMALLEY',	'FLAVOR_I_TRADE_DESTINATION',		5),
		('LEADER_ASQ_GRACEOMALLEY',	'FLAVOR_AIRLIFT',					4);
		
-----

INSERT INTO Traits
		(Type,					Description,				ShortDescription)
VALUES	('TRAIT_ASQ_GRACEOMALLEY',	'TXT_KEY_TRAIT_ASQ_GRACEOMALLEY',	'TXT_KEY_TRAIT_ASQ_GRACEOMALLEY_SHORT');

-----

INSERT INTO Leader_Traits
		(LeaderType,			TraitType)
VALUES	('LEADER_ASQ_GRACEOMALLEY',	'TRAIT_ASQ_GRACEOMALLEY');

--Civilization

INSERT INTO Civilizations
		(Type,						Description,							CivilopediaTag,				ShortDescription,						Adjective,								DefaultPlayerColor,		ArtDefineTag,			ArtStyleType,			ArtStyleSuffix,	ArtStylePrefix,		PortraitIndex,	IconAtlas,			AlphaIconAtlas,			MapImage,		DawnOfManQuote,							DawnOfManImage)
SELECT	'CIVILIZATION_ASQ_UMHAILL',	'TXT_KEY_CIVILIZATION_ASQ_UMHAILL',		'TXT_KEY_PEDIA_ASQ_UMHAILL',	'TXT_KEY_CIVILIZATION_ASQ_UMHAILL_SHORT',	'TXT_KEY_CIVILIZATION_ASQ_UMHAILL_ADJ',	'PLAYERCOLOR_ASQ_UMHAILL',	'ART_DEF_ASQ_UMHAILL',		ArtStyleType,		ArtStyleSuffix,	ArtStylePrefix,			0,				'ATLAS_ASQ_GRACEOMALLEY',	'ALPHA_ASQ_UMHAILL',		'umhaillMap.dds',	'TXT_KEY_CIVILIZATION_ASQ_UMHAILL_DOM',	'umhaillDOM.dds'
FROM Civilizations WHERE (Type = 'CIVILIZATION_CELTS');

-----

INSERT INTO Civilization_Start_Along_Ocean
		(CivilizationType, 			StartAlongOcean)
VALUES	('CIVILIZATION_ASQ_UMHAILL', 	1);


INSERT INTO Civilization_CityNames
		(CivilizationType,				CityName)
VALUES	('CIVILIZATION_ASQ_UMHAILL',	'TXT_KEY_CIVILIZATION_ASQ_UMHAILL_CITY_1'),
		('CIVILIZATION_ASQ_UMHAILL',	'TXT_KEY_CIVILIZATION_ASQ_UMHAILL_CITY_2'),
		('CIVILIZATION_ASQ_UMHAILL',	'TXT_KEY_CIVILIZATION_ASQ_UMHAILL_CITY_3'),
		('CIVILIZATION_ASQ_UMHAILL',	'TXT_KEY_CIVILIZATION_ASQ_UMHAILL_CITY_4'),
		('CIVILIZATION_ASQ_UMHAILL',	'TXT_KEY_CIVILIZATION_ASQ_UMHAILL_CITY_5'),
		('CIVILIZATION_ASQ_UMHAILL',	'TXT_KEY_CIVILIZATION_ASQ_UMHAILL_CITY_6'),
		('CIVILIZATION_ASQ_UMHAILL',	'TXT_KEY_CIVILIZATION_ASQ_UMHAILL_CITY_7'),
		('CIVILIZATION_ASQ_UMHAILL',	'TXT_KEY_CIVILIZATION_ASQ_UMHAILL_CITY_8'),
		('CIVILIZATION_ASQ_UMHAILL',	'TXT_KEY_CIVILIZATION_ASQ_UMHAILL_CITY_9'),
		('CIVILIZATION_ASQ_UMHAILL',	'TXT_KEY_CIVILIZATION_ASQ_UMHAILL_CITY_10'),
		('CIVILIZATION_ASQ_UMHAILL',	'TXT_KEY_CIVILIZATION_ASQ_UMHAILL_CITY_11'),
		('CIVILIZATION_ASQ_UMHAILL',	'TXT_KEY_CIVILIZATION_ASQ_UMHAILL_CITY_12'),
		('CIVILIZATION_ASQ_UMHAILL',	'TXT_KEY_CIVILIZATION_ASQ_UMHAILL_CITY_13'),
		('CIVILIZATION_ASQ_UMHAILL',	'TXT_KEY_CIVILIZATION_ASQ_UMHAILL_CITY_14'),
		('CIVILIZATION_ASQ_UMHAILL',	'TXT_KEY_CIVILIZATION_ASQ_UMHAILL_CITY_15'),
		('CIVILIZATION_ASQ_UMHAILL',	'TXT_KEY_CIVILIZATION_ASQ_UMHAILL_CITY_16'),
		('CIVILIZATION_ASQ_UMHAILL',	'TXT_KEY_CIVILIZATION_ASQ_UMHAILL_CITY_17'),
		('CIVILIZATION_ASQ_UMHAILL',	'TXT_KEY_CIVILIZATION_ASQ_UMHAILL_CITY_18'),
		('CIVILIZATION_ASQ_UMHAILL',	'TXT_KEY_CIVILIZATION_ASQ_UMHAILL_CITY_19'),
		('CIVILIZATION_ASQ_UMHAILL',	'TXT_KEY_CIVILIZATION_ASQ_UMHAILL_CITY_20'),
		('CIVILIZATION_ASQ_UMHAILL',	'TXT_KEY_CIVILIZATION_ASQ_UMHAILL_CITY_21'),
		('CIVILIZATION_ASQ_UMHAILL',	'TXT_KEY_CIVILIZATION_ASQ_UMHAILL_CITY_22'),
		('CIVILIZATION_ASQ_UMHAILL',	'TXT_KEY_CIVILIZATION_ASQ_UMHAILL_CITY_23'),
		('CIVILIZATION_ASQ_UMHAILL',	'TXT_KEY_CIVILIZATION_ASQ_UMHAILL_CITY_24'),
		('CIVILIZATION_ASQ_UMHAILL',	'TXT_KEY_CIVILIZATION_ASQ_UMHAILL_CITY_25')
		;


--==========================================================================================================================	
-- Diplomacy_Responses
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Diplomacy_Responses
		(LeaderType, 					ResponseType, 							 			Response, 																	 	Bias)
VALUES 	('LEADER_ASQ_GRACEOMALLEY',	'RESPONSE_FIRST_GREETING', 			 			'TXT_KEY_LEADER_ASQ_GRACEOMALLEY_FIRSTGREETING%', 			 				500),
		('LEADER_ASQ_GRACEOMALLEY',	'RESPONSE_DEFEATED', 			 			'TXT_KEY_LEADER_ASQ_GRACEOMALLEY_DEFEATED%', 			 				500),
		('LEADER_ASQ_GRACEOMALLEY',	'RESPONSE_DOW_GENERIC', 			 			'TXT_KEY_LEADER_ASQ_GRACEOMALLEY_DOW_GENERIC%', 			 				500),
		('LEADER_ASQ_GRACEOMALLEY',	'RESPONSE_ATTACKED_HOSTILE', 			 			'TXT_KEY_LEADER_ASQ_GRACEOMALLEY_ATTACKED_HOSTILE%', 			 				500),
		('LEADER_ASQ_GRACEOMALLEY',	'RESPONSE_WORK_WITH_US', 			 			'TXT_KEY_LEADER_ASQ_GRACEOMALLEY_DEC_FRIENDSHIP%', 			 				500),
		('LEADER_ASQ_GRACEOMALLEY',	'RESPONSE_WORK_AGAINST_SOMEONE', 			 			'TXT_KEY_LEADER_ASQ_GRACEOMALLEY_DENOUNCE%', 			 				500),
		('LEADER_ASQ_GRACEOMALLEY',	'RESPONSE_AI_DOF_BACKSTAB', 			 			'TXT_KEY_LEADER_ASQ_GRACEOMALLEY_DENOUNCE_FRIEND%', 			 				500),
		('LEADER_ASQ_GRACEOMALLEY',	'RESPONSE_RESPONSE_TO_BEING_DENOUNCED', 'TXT_KEY_LEADER_ASQ_GRACEOMALLEY_RESPONSE_TO_BEING_DENOUNCED%', 500),
		('LEADER_ASQ_GRACEOMALLEY',	'RESPONSE_INFLUENTIAL_ON_AI', 'TXT_KEY_LEADER_ASQ_GRACEOMALLEY_INFLUENTIAL_ON_AI%', 500),
		('LEADER_ASQ_GRACEOMALLEY',	'RESPONSE_INFLUENTIAL_ON_HUMAN', 'TXT_KEY_LEADER_ASQ_GRACEOMALLEY_INFLUENTIAL_ON_HUMAN%', 500)
		;

--Units

INSERT INTO Units
		(Type,					Description,					Civilopedia,							Strategy,									Help,									Combat,	Cost,	Moves,	BaseSightRange,	Class,	CombatClass,	Special,	Domain,	DefaultUnitAI,	MilitarySupport,	MilitaryProduction,	Pillage,	Mechanized,	MinAreaSize,	MoveRate,	PortraitIndex,	IconAtlas,			UnitFlagIconOffset,	UnitFlagAtlas,	UnitArtInfo,	XPValueAttack,	XPValueDefense,	CombatLimit,	PrereqTech,	ObsoleteTech)
SELECT	'UNIT_ASQ_LONGAFADA',	'TXT_KEY_UNIT_ASQ_LONGAFADA',	'TXT_KEY_UNIT_ASQ_LONGAFADA_PEDIA',		'TXT_KEY_UNIT_ASQ_LONGAFADA_STRATEGY',		'TXT_KEY_UNIT_ASQ_LONGAFADA_HELP',		Combat-5,	Cost,	Moves+1,	BaseSightRange,	Class,	CombatClass,	Special,	Domain,	DefaultUnitAI,	MilitarySupport,	MilitaryProduction,	Pillage,	Mechanized,	MinAreaSize,	MoveRate,	2,				'ATLAS_ASQ_GRACEOMALLEY',	0,					'ALPHA_ASQ_LONGAFADA',	'ART_DEF_UNIT_ASQ_LONGAFADA',	XPValueAttack,	XPValueDefense,	CombatLimit,	PrereqTech,	ObsoleteTech
FROM Units WHERE (Type = 'UNIT_CARAVEL');

-----

INSERT INTO Unit_ClassUpgrades
		(UnitType,			UnitClassType)
SELECT	'UNIT_ASQ_LONGAFADA',	UnitClassType
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_CARAVEL');

-----
	
INSERT INTO Unit_Flavors
		(UnitType,
						FlavorType,	Flavor)
SELECT	'UNIT_ASQ_LONGAFADA',	FlavorType,	Flavor + 3
FROM Unit_Flavors WHERE (UnitType = 'UNIT_CARAVEL');

INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 			 SelectionSound, FirstSelectionSound)
SELECT	'UNIT_ASQ_LONGAFADA',	 SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_CARAVEL';
-----

--Buildings

INSERT INTO Buildings 	
		(Type, 					BuildingClass, PrereqTech, Cost, MinAreaSize, AllowsRangeStrike, Defense, ExtraCityHitPoints, HurryCostModifier, ArtInfoCulturalVariation, NeverCapture,  Description, 					Help, 							 Strategy,							Civilopedia, 					 ArtDefineTag, PortraitIndex, IconAtlas)
SELECT	'BUILDING_ASQ_TOWERHOUSE',	BuildingClass, PrereqTech, Cost, MinAreaSize, AllowsRangeStrike, Defense, ExtraCityHitPoints, HurryCostModifier, ArtInfoCulturalVariation, 1, 			  'TXT_KEY_BUILDING_ASQ_TOWERHOUSE', 	'TXT_KEY_BUILDING_ASQ_TOWERHOUSE_HELP',   'TXT_KEY_BUILDING_ASQ_TOWERHOUSE_STRATEGY',	'TXT_KEY_BUILDING_ASQ_TOWERHOUSE_PEDIA',   ArtDefineTag, 3, 			  'ATLAS_ASQ_GRACEOMALLEY'
FROM Buildings WHERE Type = 'BUILDING_CASTLE';	

-----

INSERT INTO Building_Flavors
		(BuildingType,				FlavorType,	Flavor)
SELECT	'BUILDING_ASQ_TOWERHOUSE',	FlavorType,	Flavor + 5
FROM Building_Flavors WHERE (BuildingType = 'BUILDING_CASTLE');

-----

INSERT INTO Civilization_BuildingClassOverrides
       (CivilizationType,           BuildingClassType,       BuildingType)
VALUES ('CIVILIZATION_ASQ_UMHAILL', 'BUILDINGCLASS_CASTLE', 'BUILDING_ASQ_TOWERHOUSE');

------------------------------------------------------------------------------------------------------------------------	
-- Building_YieldChanges
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Building_YieldChanges 	
		(BuildingType, 					YieldType,	Yield)
SELECT	'BUILDING_ASQ_TOWERHOUSE',		YieldType,	Yield
FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_CASTLE';
------------------------------------------------------------------------------------------------------------------------	                                                                                                                 				
-- Building_ClassesNeededInCity
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Building_ClassesNeededInCity 	
		(BuildingType, 					BuildingClassType)
SELECT	'BUILDING_ASQ_TOWERHOUSE',		BuildingClassType
FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_CASTLE';
------------------------------------------------------------------------------------------------------------------------	
-- Building_YieldModifiers
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Building_YieldModifiers 	
		(BuildingType, 					YieldType,	Yield)
SELECT	'BUILDING_ASQ_TOWERHOUSE',		YieldType,	Yield
FROM Building_YieldModifiers WHERE BuildingType = 'BUILDING_CASTLE';
	
--Defines

INSERT INTO Civilization_FreeUnits 
		(CivilizationType, 					UnitClassType, Count, UnitAIType)
SELECT	'CIVILIZATION_ASQ_UMHAILL', 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_CELTS';
-----

INSERT INTO Civilization_FreeBuildingClasses 
		(CivilizationType, 					BuildingClassType)
SELECT	'CIVILIZATION_ASQ_UMHAILL', 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE CivilizationType = 'CIVILIZATION_CELTS';

-----

INSERT INTO Civilization_FreeTechs 
		(CivilizationType, 					TechType)
SELECT	'CIVILIZATION_ASQ_UMHAILL', 	TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_CELTS';

-----

INSERT INTO Civilization_Leaders
		(CivilizationType,			LeaderheadType)
VALUES	('CIVILIZATION_ASQ_UMHAILL',	'LEADER_ASQ_GRACEOMALLEY');

-----

INSERT INTO Civilization_Religions
		(CivilizationType,			ReligionType)
VALUES	('CIVILIZATION_ASQ_UMHAILL',	'RELIGION_CHRISTIANITY');

-----

INSERT INTO Civilization_SpyNames
		(CivilizationType,			SpyName)
VALUES	('CIVILIZATION_ASQ_UMHAILL',	'TXT_KEY_CIVILIZATION_ASQ_UMHAILL_SPY_1'),
		('CIVILIZATION_ASQ_UMHAILL',	'TXT_KEY_CIVILIZATION_ASQ_UMHAILL_SPY_2'),
		('CIVILIZATION_ASQ_UMHAILL',	'TXT_KEY_CIVILIZATION_ASQ_UMHAILL_SPY_3'),
		('CIVILIZATION_ASQ_UMHAILL',	'TXT_KEY_CIVILIZATION_ASQ_UMHAILL_SPY_4'),
		('CIVILIZATION_ASQ_UMHAILL',	'TXT_KEY_CIVILIZATION_ASQ_UMHAILL_SPY_5'),
		('CIVILIZATION_ASQ_UMHAILL',	'TXT_KEY_CIVILIZATION_ASQ_UMHAILL_SPY_6'),
		('CIVILIZATION_ASQ_UMHAILL',	'TXT_KEY_CIVILIZATION_ASQ_UMHAILL_SPY_7'),
		('CIVILIZATION_ASQ_UMHAILL',	'TXT_KEY_CIVILIZATION_ASQ_UMHAILL_SPY_8'),
		('CIVILIZATION_ASQ_UMHAILL',	'TXT_KEY_CIVILIZATION_ASQ_UMHAILL_SPY_9');

-----

INSERT INTO Civilization_UnitClassOverrides
		(CivilizationType,				UnitClassType,					UnitType)
VALUES	('CIVILIZATION_ASQ_UMHAILL',	'UNITCLASS_CARAVEL',	'UNIT_ASQ_LONGAFADA');

-----

INSERT INTO Civilization_BuildingClassOverrides
		(CivilizationType,				BuildingClassType,			BuildingType)
VALUES	('CIVILIZATION_ASQ_UMHAILL',	'BUILDINGCLASS_CASTLE',	'BUILDING_ASQ_TOWERHOUSE');
