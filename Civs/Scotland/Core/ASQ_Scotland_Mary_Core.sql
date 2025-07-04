
-----

--Leader

INSERT INTO Leaders
		(Type,					       Description,						           Civilopedia,							             CivilopediaTag,					   ArtDefineTag,				VictoryCompetitiveness,	WonderCompetitiveness,	MinorCivCompetitiveness,	Boldness,	DiploBalance,	WarmongerHate,	WorkAgainstWillingness,	WorkWithWillingness,	DenounceWillingness,	DoFWillingness,	Loyalty,	Neediness,	Forgiveness,	Chattiness,	Meanness,	PortraitIndex,	IconAtlas)
VALUES	('LEADER_ASQ_MARY_SCOTS',		'TXT_KEY_LEADER_ASQ_MARY_SCOTS',			'TXT_KEY_LEADER_ASQ_MARY_SCOTS_PEDIA',			'TXT_KEY_PEDIA_ASQ_MARY_SCOTS', 'MaryScots_Scene.xml',		         8,						4,						5,							5,			6,				8,				9,						6,						6,						3,				7,			6,			3,				6,			5,			1,	            'ATLAS_ASQ_MARY_SCOTS');

-----

INSERT INTO Leader_MajorCivApproachBiases
		(LeaderType,			MajorCivApproachType,			Bias)
VALUES	('LEADER_ASQ_MARY_SCOTS',	'MAJOR_CIV_APPROACH_WAR',		6),
		('LEADER_ASQ_MARY_SCOTS',	'MAJOR_CIV_APPROACH_HOSTILE',	6),
		('LEADER_ASQ_MARY_SCOTS',	'MAJOR_CIV_APPROACH_DECEPTIVE',	9),
		('LEADER_ASQ_MARY_SCOTS',	'MAJOR_CIV_APPROACH_GUARDED',	7),
		('LEADER_ASQ_MARY_SCOTS',	'MAJOR_CIV_APPROACH_FRIENDLY',	5),
		('LEADER_ASQ_MARY_SCOTS',	'MAJOR_CIV_APPROACH_AFRAID',	4),
		('LEADER_ASQ_MARY_SCOTS',	'MAJOR_CIV_APPROACH_NEUTRAL',	6);
		
-----

INSERT INTO Leader_MinorCivApproachBiases
		(LeaderType,			MinorCivApproachType,				Bias)
VALUES	('LEADER_ASQ_MARY_SCOTS',	'MINOR_CIV_APPROACH_IGNORE',		6),
		('LEADER_ASQ_MARY_SCOTS',	'MINOR_CIV_APPROACH_FRIENDLY',		6),
		('LEADER_ASQ_MARY_SCOTS',	'MINOR_CIV_APPROACH_PROTECTIVE',	5),
		('LEADER_ASQ_MARY_SCOTS',	'MINOR_CIV_APPROACH_CONQUEST',		4),
		('LEADER_ASQ_MARY_SCOTS',	'MINOR_CIV_APPROACH_BULLY',			4);
		
-----

INSERT INTO Leader_Flavors
		(LeaderType, 			FlavorType,							Flavor)
VALUES	('LEADER_ASQ_MARY_SCOTS',	'FLAVOR_OFFENSE',					6),
		('LEADER_ASQ_MARY_SCOTS',	'FLAVOR_DEFENSE',					9),
		('LEADER_ASQ_MARY_SCOTS',	'FLAVOR_CITY_DEFENSE',				5),
		('LEADER_ASQ_MARY_SCOTS',	'FLAVOR_MILITARY_TRAINING',			5),
		('LEADER_ASQ_MARY_SCOTS',	'FLAVOR_RECON',						6),
		('LEADER_ASQ_MARY_SCOTS',	'FLAVOR_RANGED',					7),
		('LEADER_ASQ_MARY_SCOTS',	'FLAVOR_MOBILE',					5),
		('LEADER_ASQ_MARY_SCOTS',	'FLAVOR_NAVAL',						7),
		('LEADER_ASQ_MARY_SCOTS',	'FLAVOR_NAVAL_RECON',				1),
		('LEADER_ASQ_MARY_SCOTS',	'FLAVOR_NAVAL_GROWTH',				5),
		('LEADER_ASQ_MARY_SCOTS',	'FLAVOR_NAVAL_TILE_IMPROVEMENT',	4),
		('LEADER_ASQ_MARY_SCOTS',	'FLAVOR_AIR',						3),
		('LEADER_ASQ_MARY_SCOTS',	'FLAVOR_EXPANSION',					5),
		('LEADER_ASQ_MARY_SCOTS',	'FLAVOR_GROWTH',					9),
		('LEADER_ASQ_MARY_SCOTS',	'FLAVOR_TILE_IMPROVEMENT',			4),
		('LEADER_ASQ_MARY_SCOTS',	'FLAVOR_INFRASTRUCTURE',			4),
		('LEADER_ASQ_MARY_SCOTS',	'FLAVOR_PRODUCTION',				5),
		('LEADER_ASQ_MARY_SCOTS',	'FLAVOR_GOLD',						4),
		('LEADER_ASQ_MARY_SCOTS',	'FLAVOR_SCIENCE',					5),
		('LEADER_ASQ_MARY_SCOTS',	'FLAVOR_CULTURE',					6),
		('LEADER_ASQ_MARY_SCOTS',	'FLAVOR_HAPPINESS',					3),
		('LEADER_ASQ_MARY_SCOTS',	'FLAVOR_GREAT_PEOPLE',				5),
		('LEADER_ASQ_MARY_SCOTS',	'FLAVOR_WONDER',					5),
		('LEADER_ASQ_MARY_SCOTS',	'FLAVOR_RELIGION',					8),
		('LEADER_ASQ_MARY_SCOTS',	'FLAVOR_DIPLOMACY',					7),
		('LEADER_ASQ_MARY_SCOTS',	'FLAVOR_SPACESHIP',					2),
		('LEADER_ASQ_MARY_SCOTS',	'FLAVOR_WATER_CONNECTION',			7),
		('LEADER_ASQ_MARY_SCOTS',	'FLAVOR_NUKE',						4),
		('LEADER_ASQ_MARY_SCOTS',	'FLAVOR_USE_NUKE',					4),
		('LEADER_ASQ_MARY_SCOTS',	'FLAVOR_ESPIONAGE',					12),
		('LEADER_ASQ_MARY_SCOTS',	'FLAVOR_ANTIAIR',					4),
		('LEADER_ASQ_MARY_SCOTS',	'FLAVOR_AIR_CARRIER',				4),
		('LEADER_ASQ_MARY_SCOTS',	'FLAVOR_I_LAND_TRADE_ROUTE',		4),
		('LEADER_ASQ_MARY_SCOTS',	'FLAVOR_I_SEA_TRADE_ROUTE',			5),
		('LEADER_ASQ_MARY_SCOTS',	'FLAVOR_ARCHAEOLOGY',				4),
		('LEADER_ASQ_MARY_SCOTS',	'FLAVOR_I_TRADE_ORIGIN',			5),
		('LEADER_ASQ_MARY_SCOTS',	'FLAVOR_I_TRADE_DESTINATION',		5),
		('LEADER_ASQ_MARY_SCOTS',	'FLAVOR_AIRLIFT',					4);
		
-----

INSERT INTO Traits
		(Type,					Description,				ShortDescription)
VALUES	('TRAIT_ASQ_MARY_SCOTS',	'TXT_KEY_TRAIT_ASQ_MARY_SCOTS',	'TXT_KEY_TRAIT_ASQ_MARY_SCOTS_SHORT');

-----

INSERT INTO Leader_Traits
		(LeaderType,			TraitType)
VALUES	('LEADER_ASQ_MARY_SCOTS',	'TRAIT_ASQ_MARY_SCOTS');

--Civilization

INSERT INTO Civilizations
		(Type,						Description,							CivilopediaTag,				ShortDescription,						Adjective,								DefaultPlayerColor,		ArtDefineTag,			ArtStyleType,			ArtStyleSuffix,	ArtStylePrefix,		PortraitIndex,	IconAtlas,			AlphaIconAtlas,			MapImage,		DawnOfManQuote,							DawnOfManImage)
SELECT	'CIVILIZATION_ASQ_SCOTLAND_MARY',	'TXT_KEY_CIVILIZATION_ASQ_SCOTLAND_MARY',		'TXT_KEY_PEDIA_ASQ_SCOTLAND_MARY',	'TXT_KEY_CIVILIZATION_ASQ_SCOTLAND_MARY_SHORT',	'TXT_KEY_CIVILIZATION_ASQ_SCOTLAND_MARY_ADJ',	'PLAYERCOLOR_ASQ_SCOTLAND_MARY',	'ART_DEF_ASQ_SCOTLAND_MARY',		ArtStyleType,		ArtStyleSuffix,	ArtStylePrefix,			0,				'ATLAS_ASQ_MARY_SCOTS',	'ALPHA_ASQ_SCOTLAND_MARY',		'maryScotsMap.dds',	'TXT_KEY_CIVILIZATION_ASQ_SCOTLAND_MARY_DOM',	'maryScotsDOM.dds'
FROM Civilizations WHERE (Type = 'CIVILIZATION_CELTS');

-----

INSERT INTO Civilization_Start_Along_Ocean
		(CivilizationType, 			StartAlongOcean)
VALUES	('CIVILIZATION_ASQ_SCOTLAND_MARY', 	1);


INSERT INTO Civilization_CityNames
		(CivilizationType,				CityName)
VALUES	('CIVILIZATION_ASQ_SCOTLAND_MARY',	'TXT_KEY_CIVILIZATION_ASQ_SCOTLAND_MARY_CITY_1'),
		('CIVILIZATION_ASQ_SCOTLAND_MARY',	'TXT_KEY_CIVILIZATION_ASQ_SCOTLAND_MARY_CITY_2'),
		('CIVILIZATION_ASQ_SCOTLAND_MARY',	'TXT_KEY_CIVILIZATION_ASQ_SCOTLAND_MARY_CITY_3'),
		('CIVILIZATION_ASQ_SCOTLAND_MARY',	'TXT_KEY_CIVILIZATION_ASQ_SCOTLAND_MARY_CITY_4'),
		('CIVILIZATION_ASQ_SCOTLAND_MARY',	'TXT_KEY_CIVILIZATION_ASQ_SCOTLAND_MARY_CITY_5'),
		('CIVILIZATION_ASQ_SCOTLAND_MARY',	'TXT_KEY_CIVILIZATION_ASQ_SCOTLAND_MARY_CITY_6'),
		('CIVILIZATION_ASQ_SCOTLAND_MARY',	'TXT_KEY_CIVILIZATION_ASQ_SCOTLAND_MARY_CITY_7'),
		('CIVILIZATION_ASQ_SCOTLAND_MARY',	'TXT_KEY_CIVILIZATION_ASQ_SCOTLAND_MARY_CITY_8'),
		('CIVILIZATION_ASQ_SCOTLAND_MARY',	'TXT_KEY_CIVILIZATION_ASQ_SCOTLAND_MARY_CITY_9'),
		('CIVILIZATION_ASQ_SCOTLAND_MARY',	'TXT_KEY_CIVILIZATION_ASQ_SCOTLAND_MARY_CITY_10'),
		('CIVILIZATION_ASQ_SCOTLAND_MARY',	'TXT_KEY_CIVILIZATION_ASQ_SCOTLAND_MARY_CITY_11'),
		('CIVILIZATION_ASQ_SCOTLAND_MARY',	'TXT_KEY_CIVILIZATION_ASQ_SCOTLAND_MARY_CITY_12'),
		('CIVILIZATION_ASQ_SCOTLAND_MARY',	'TXT_KEY_CIVILIZATION_ASQ_SCOTLAND_MARY_CITY_13'),
		('CIVILIZATION_ASQ_SCOTLAND_MARY',	'TXT_KEY_CIVILIZATION_ASQ_SCOTLAND_MARY_CITY_14'),
		('CIVILIZATION_ASQ_SCOTLAND_MARY',	'TXT_KEY_CIVILIZATION_ASQ_SCOTLAND_MARY_CITY_15'),
		('CIVILIZATION_ASQ_SCOTLAND_MARY',	'TXT_KEY_CIVILIZATION_ASQ_SCOTLAND_MARY_CITY_16'),
		('CIVILIZATION_ASQ_SCOTLAND_MARY',	'TXT_KEY_CIVILIZATION_ASQ_SCOTLAND_MARY_CITY_17'),
		('CIVILIZATION_ASQ_SCOTLAND_MARY',	'TXT_KEY_CIVILIZATION_ASQ_SCOTLAND_MARY_CITY_18'),
		('CIVILIZATION_ASQ_SCOTLAND_MARY',	'TXT_KEY_CIVILIZATION_ASQ_SCOTLAND_MARY_CITY_19'),
		('CIVILIZATION_ASQ_SCOTLAND_MARY',	'TXT_KEY_CIVILIZATION_ASQ_SCOTLAND_MARY_CITY_20')
		;


--==========================================================================================================================	
-- Diplomacy_Responses
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Diplomacy_Responses
		(LeaderType, 					ResponseType, 							 			Response, 																	 	Bias)
VALUES 	('LEADER_ASQ_MARY_SCOTS',	'RESPONSE_FIRST_GREETING', 			 			'TXT_KEY_LEADER_ASQ_MARY_SCOTS_FIRSTGREETING%', 			 				500),
		('LEADER_ASQ_MARY_SCOTS',	'RESPONSE_DEFEATED', 			 			'TXT_KEY_LEADER_ASQ_MARY_SCOTS_DEFEATED%', 			 				500),
		('LEADER_ASQ_MARY_SCOTS',	'RESPONSE_DOW_GENERIC', 			 			'TXT_KEY_LEADER_ASQ_MARY_SCOTS_DOW_GENERIC%', 			 				500),
		('LEADER_ASQ_MARY_SCOTS',	'RESPONSE_ATTACKED_HOSTILE', 			 			'TXT_KEY_LEADER_ASQ_MARY_SCOTS_ATTACKED_HOSTILE%', 			 				500),
		('LEADER_ASQ_MARY_SCOTS',	'RESPONSE_WORK_WITH_US', 			 			'TXT_KEY_LEADER_ASQ_MARY_SCOTS_DEC_FRIENDSHIP%', 			 				500),
		('LEADER_ASQ_MARY_SCOTS',	'RESPONSE_WORK_AGAINST_SOMEONE', 			 			'TXT_KEY_LEADER_ASQ_MARY_SCOTS_DENOUNCE%', 			 				500),
		('LEADER_ASQ_MARY_SCOTS',	'RESPONSE_AI_DOF_BACKSTAB', 			 			'TXT_KEY_LEADER_ASQ_MARY_SCOTS_DENOUNCE_FRIEND%', 			 				500),
		('LEADER_ASQ_MARY_SCOTS',	'RESPONSE_RESPONSE_TO_BEING_DENOUNCED', 'TXT_KEY_LEADER_ASQ_MARY_SCOTS_RESPONSE_TO_BEING_DENOUNCED%', 500),
		('LEADER_ASQ_MARY_SCOTS',	'RESPONSE_INFLUENTIAL_ON_AI', 'TXT_KEY_LEADER_ASQ_MARY_SCOTS_INFLUENTIAL_ON_AI%', 500),
		('LEADER_ASQ_MARY_SCOTS',	'RESPONSE_INFLUENTIAL_ON_HUMAN', 'TXT_KEY_LEADER_ASQ_MARY_SCOTS_INFLUENTIAL_ON_HUMAN%', 500)
		;

--Units

INSERT INTO Units
		(Type,					Description,					Civilopedia,							Strategy,									Help,									Combat,	Cost,	Moves,	BaseSightRange,	Class,	CombatClass,	Special,	Domain,	DefaultUnitAI,	MilitarySupport,	MilitaryProduction,	Pillage,	Mechanized,	MinAreaSize,	MoveRate,	PortraitIndex,	IconAtlas,			UnitFlagIconOffset,	UnitFlagAtlas,	UnitArtInfo,	XPValueAttack,	XPValueDefense,	CombatLimit,	PrereqTech,	ObsoleteTech)
SELECT	'UNIT_ASQ_HACKBUTTER',	'TXT_KEY_UNIT_ASQ_HACKBUTTER',	'TXT_KEY_UNIT_ASQ_HACKBUTTER_PEDIA',		'TXT_KEY_UNIT_ASQ_HACKBUTTER_STRATEGY',		'TXT_KEY_UNIT_ASQ_HACKBUTTER_HELP',		Combat,	Cost,	Moves,	BaseSightRange,	Class,	CombatClass,	Special,	Domain,	DefaultUnitAI,	MilitarySupport,	MilitaryProduction,	Pillage,	Mechanized,	MinAreaSize,	MoveRate,	2,				'ATLAS_ASQ_MARY_SCOTS',	0,					'ALPHA_ASQ_HACKBUTTER',	'ART_DEF_UNIT_ASQ_HACKBUTTER',	XPValueAttack,	XPValueDefense,	CombatLimit,	PrereqTech,	ObsoleteTech
FROM Units WHERE (Type = 'UNIT_MUSKETMAN');

-----

INSERT INTO Unit_ClassUpgrades
		(UnitType,			UnitClassType)
SELECT	'UNIT_ASQ_HACKBUTTER',	UnitClassType
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_MUSKETMAN');

-----

INSERT INTO Unit_Flavors
		(UnitType,
						FlavorType,	Flavor)
SELECT	'UNIT_ASQ_HACKBUTTER',	FlavorType,	Flavor + 3
FROM Unit_Flavors WHERE (UnitType = 'UNIT_MUSKETMAN');

INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 			 SelectionSound, FirstSelectionSound)
SELECT	'UNIT_ASQ_HACKBUTTER',	 SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_MUSKETMAN';
-----

--Buildings

INSERT INTO Buildings
		(Type,						Description,						Civilopedia,										Strategy,										Help,										Cost,	HurryCostModifier,	MinAreaSize,	Happiness,	BuildingClass,	ArtDefineTag,	PrereqTech,	PortraitIndex,	IconAtlas)
SELECT	'BUILDING_ASQ_KIRK',	'TXT_KEY_BUILDING_ASQ_KIRK',	'TXT_KEY_BUILDING_ASQ_KIRK_PEDIA',	'TXT_KEY_BUILDING_ASQ_KIRK_STRATEGY',	'TXT_KEY_BUILDING_ASQ_KIRK_HELP',	Cost,	HurryCostModifier,	MinAreaSize,	Happiness,	BuildingClass,	ArtDefineTag,	PrereqTech,	3,				'ATLAS_ASQ_MARY_SCOTS'
FROM Buildings WHERE (Type = 'BUILDING_TEMPLE');

INSERT INTO Buildings 
		(Type, 												BuildingClass,					Happiness, Cost, 	FaithCost,	 			GreatWorkSlotType,	GreatWorkCount,	GoldMaintenance,	PrereqTech, NeverCapture,	Description, 												Help)
VALUES	('BUILDING_ASQ_KIRK_HAPPINESS_DUMMY', 			'BUILDINGCLASS_ASQ_KIRK_HAPPINESS_DUMMY',   2,			-1, 	-1,			NULL,				-1,				0,					NULL,		1,				'TXT_KEY_BUILDING_ASQ_KIRK_DUMMY',				'TXT_KEY_BUILDING_ASQ_KIRK_DUMMY'),
		('BUILDING_ASQ_SCOTLAND_PLOTCOUNT', 			'BUILDINGCLASS_ASQ_SCOTLAND_PLOTCOUNT',     0,			-1, 	-1,			NULL,				-1,				0,					NULL,		1,				'TXT_KEY_BUILDING_ASQ_PLOTCOUNT_DUMMY',				'TXT_KEY_BUILDING_ASQ_PLOTCOUNT_DUMMY'),
		('BUILDING_ASQ_SCOTLAND_PLOT_COOLDOWN', 			'BUILDINGCLASS_ASQ_SCOTLAND_PLOT_COOLDOWN', 0,			-1, 	-1,			NULL,				-1,				0,					NULL,		1,				'TXT_KEY_BUILDING_ASQ_PLOTCOOL_DUMMY',				'TXT_KEY_BUILDING_ASQ_PLOTCOOL_DUMMY'),
		('BUILDING_ASQ_SCOTLAND_FAITH_DUMMY', 			'BUILDINGCLASS_ASQ_SCOTLAND_FAITH_DUMMY', 0,			-1, 	-1,			NULL,				-1,				0,					NULL,		1,				'TXT_KEY_BUILDING_ASQ_PLOTCOOL_DUMMY',				'TXT_KEY_BUILDING_ASQ_PLOTCOOL_DUMMY');

-----

INSERT INTO BuildingClasses 
		(DefaultBuilding, 										Type, 													Description)
VALUES	('BUILDING_ASQ_KIRK_HAPPINESS_DUMMY',				'BUILDINGCLASS_ASQ_KIRK_HAPPINESS_DUMMY', 			'TXT_KEY_BUILDING_ASQ_KIRK_DUMMY'),
		('BUILDING_ASQ_SCOTLAND_PLOTCOUNT',				    'BUILDINGCLASS_ASQ_SCOTLAND_PLOTCOUNT', 			'TXT_KEY_CIVILIZATION_ASQ_SCOTLAND_MARY'),
		('BUILDING_ASQ_SCOTLAND_PLOT_COOLDOWN',				'BUILDINGCLASS_ASQ_SCOTLAND_PLOT_COOLDOWN', 		'TXT_KEY_CIVILIZATION_ASQ_SCOTLAND_MARY'),
		('BUILDING_ASQ_SCOTLAND_FAITH_DUMMY',				'BUILDINGCLASS_ASQ_SCOTLAND_FAITH_DUMMY', 		'TXT_KEY_CIVILIZATION_ASQ_SCOTLAND_MARY');

-----

INSERT INTO Building_Flavors
		(BuildingType,				FlavorType,	Flavor)
SELECT	'BUILDING_ASQ_KIRK',	FlavorType,	Flavor + 5
FROM Building_Flavors WHERE (BuildingType = 'BUILDING_TEMPLE');

-----

INSERT INTO Building_YieldChanges 	
			(BuildingType, 							YieldType, 		Yield)
VALUES		('BUILDING_ASQ_SCOTLAND_FAITH_DUMMY',	'YIELD_FAITH', 	1);
		
--Defines

INSERT INTO Civilization_FreeUnits 
		(CivilizationType, 					UnitClassType, Count, UnitAIType)
SELECT	'CIVILIZATION_ASQ_SCOTLAND_MARY', 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_CELTS';
-----

INSERT INTO Civilization_FreeBuildingClasses 
		(CivilizationType, 					BuildingClassType)
SELECT	'CIVILIZATION_ASQ_SCOTLAND_MARY', 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE CivilizationType = 'CIVILIZATION_CELTS';

-----

INSERT INTO Civilization_FreeTechs 
		(CivilizationType, 					TechType)
SELECT	'CIVILIZATION_ASQ_SCOTLAND_MARY', 	TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_CELTS';

-----

INSERT INTO Civilization_Leaders
		(CivilizationType,			LeaderheadType)
VALUES	('CIVILIZATION_ASQ_SCOTLAND_MARY',	'LEADER_ASQ_MARY_SCOTS');

-----

INSERT INTO Civilization_Religions
		(CivilizationType,			ReligionType)
VALUES	('CIVILIZATION_ASQ_SCOTLAND_MARY',	'RELIGION_CHRISTIANITY');

-----

INSERT INTO Civilization_SpyNames
		(CivilizationType,			SpyName)
VALUES	('CIVILIZATION_ASQ_SCOTLAND_MARY',	'TXT_KEY_CIVILIZATION_ASQ_SCOTLAND_MARY_SPY_1'),
		('CIVILIZATION_ASQ_SCOTLAND_MARY',	'TXT_KEY_CIVILIZATION_ASQ_SCOTLAND_MARY_SPY_2'),
		('CIVILIZATION_ASQ_SCOTLAND_MARY',	'TXT_KEY_CIVILIZATION_ASQ_SCOTLAND_MARY_SPY_3'),
		('CIVILIZATION_ASQ_SCOTLAND_MARY',	'TXT_KEY_CIVILIZATION_ASQ_SCOTLAND_MARY_SPY_4'),
		('CIVILIZATION_ASQ_SCOTLAND_MARY',	'TXT_KEY_CIVILIZATION_ASQ_SCOTLAND_MARY_SPY_5'),
		('CIVILIZATION_ASQ_SCOTLAND_MARY',	'TXT_KEY_CIVILIZATION_ASQ_SCOTLAND_MARY_SPY_6'),
		('CIVILIZATION_ASQ_SCOTLAND_MARY',	'TXT_KEY_CIVILIZATION_ASQ_SCOTLAND_MARY_SPY_7'),
		('CIVILIZATION_ASQ_SCOTLAND_MARY',	'TXT_KEY_CIVILIZATION_ASQ_SCOTLAND_MARY_SPY_8'),
		('CIVILIZATION_ASQ_SCOTLAND_MARY',	'TXT_KEY_CIVILIZATION_ASQ_SCOTLAND_MARY_SPY_9');

-----

INSERT INTO Civilization_UnitClassOverrides
		(CivilizationType,				UnitClassType,					UnitType)
VALUES	('CIVILIZATION_ASQ_SCOTLAND_MARY',	'UNITCLASS_MUSKETMAN',	'UNIT_ASQ_HACKBUTTER');

-----

INSERT INTO Civilization_BuildingClassOverrides
		(CivilizationType,				BuildingClassType,			BuildingType)
VALUES	('CIVILIZATION_ASQ_SCOTLAND_MARY',	'BUILDINGCLASS_TEMPLE',	'BUILDING_ASQ_KIRK');

-----

INSERT INTO UnitPromotions 
		(Type,									Description,								Help,											PediaType,			PediaEntry,						CannotBeChosen, HasPostCombatPromotions, CombatPercent,	IconAtlas,			PortraitIndex) 
VALUES	('PROMOTION_ASQ_SCOTLAND_HACKBUTTER_BONUS',		'TXT_KEY_PROMOTION_ASQ_SCOTLAND_HACKBUTTER_BONUS',	'TXT_KEY_PROMOTION_ASQ_SCOTLAND_HACKBUTTER_BONUS_HELP',	'PEDIA_ATTRIBUTES',	'TXT_KEY_PROMOTION_ASQ_SCOTLAND_HACKBUTTER_BONUS', 1, 0, 25,			'ABILITY_ATLAS',	59);


