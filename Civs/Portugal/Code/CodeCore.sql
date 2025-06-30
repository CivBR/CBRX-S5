--==========================================================================================================================		
--==========================================================================================================================
-- Civilizations
--==========================================================================================================================
INSERT INTO Civilizations 	
			(Type, 									DerivativeCiv, 							Description, 								ShortDescription, 								Adjective, 										Civilopedia, 								CivilopediaTag, 					DefaultPlayerColor,		 	 		ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas,					 AlphaIconAtlas,					PortraitIndex,	SoundtrackTag, 	MapImage, 				DawnOfManQuote, 					   		 DawnOfManImage)
SELECT		('CIVILIZATION_TCM_AVIS_PORTUGAL'), 	('CIVILIZATION_TCM_AVIS_PORTUGAL'),		('TXT_KEY_CIV_TCM_AVIS_PORTUGAL_DESC'), 	('TXT_KEY_CIV_TCM_AVIS_PORTUGAL_SHORT_DESC'), 	('TXT_KEY_CIV_TCM_AVIS_PORTUGAL_ADJECTIVE'), 	('TXT_KEY_CIV5_TCM_AVIS_PORTUGAL_TEXT_1'),	('TXT_KEY_CIV5_TCM_AVIS_PORTUGAL'), ('PLAYERCOLOR_TCM_AVIS_PORTUGAL'),	ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, ('TCM_AVIS_PORTUGAL_ATLAS'), ('TCM_PORTUGAL_AVIS_ALPHA_ATLAS'), 0, 			('PORTUGAL'),	('TCM_JoaoII_Map.dds'), ('TXT_KEY_CIV5_DOM_TCM_AVIS_PORTUGAL_TEXT'), ('TCM_JoaoII_DOM.dds')
FROM Civilizations WHERE Type = 'CIVILIZATION_PORTUGAL';

UPDATE Civilizations
SET IconAtlas = 'TCM_PORTUGAL_BRAZIL_ATLAS', PortraitIndex = 0, AlphaIconAtlas = 'TCM_PORTUGAL_BRAZIL_ALPHA_ATLAS', MapImage = 'TCM_MariaI_Map.dds', DerivativeCiv = 'CIVILIZATION_TCM_AVIS_PORTUGAL', Description = 'TXT_KEY_CIV_TCM_PORTUGAL_BRAZIL_DESC', ShortDescription = 'TXT_KEY_CIV_TCM_PORTUGAL_BRAZIL_SHORT_DESC', Adjective = 'TXT_KEY_CIV_TCM_PORTUGAL_BRAZIL_ADJECTIVE'
WHERE Type = 'CIVILIZATION_PORTUGAL';
--==========================================================================================================================
-- Civilization_CityNames
--==========================================================================================================================	
DELETE FROM Civilization_CityNames WHERE CivilizationType = 'CIVILIZATION_PORTUGAL';
	
INSERT INTO Civilization_CityNames 
			(CivilizationType, 						CityName)
VALUES		('CIVILIZATION_TCM_AVIS_PORTUGAL', 		'TXT_KEY_CITY_NAME_TCM_AVIS_PORTUGAL_01'),
			('CIVILIZATION_TCM_AVIS_PORTUGAL', 		'TXT_KEY_CITY_NAME_TCM_AVIS_PORTUGAL_02'),
			('CIVILIZATION_TCM_AVIS_PORTUGAL', 		'TXT_KEY_CITY_NAME_TCM_AVIS_PORTUGAL_03'),
			('CIVILIZATION_TCM_AVIS_PORTUGAL', 		'TXT_KEY_CITY_NAME_TCM_AVIS_PORTUGAL_04'),
			('CIVILIZATION_TCM_AVIS_PORTUGAL', 		'TXT_KEY_CITY_NAME_TCM_AVIS_PORTUGAL_05'),
			('CIVILIZATION_TCM_AVIS_PORTUGAL', 		'TXT_KEY_CITY_NAME_TCM_AVIS_PORTUGAL_06'),
			('CIVILIZATION_TCM_AVIS_PORTUGAL', 		'TXT_KEY_CITY_NAME_TCM_AVIS_PORTUGAL_07'),
			('CIVILIZATION_TCM_AVIS_PORTUGAL', 		'TXT_KEY_CITY_NAME_TCM_AVIS_PORTUGAL_08'),
			('CIVILIZATION_TCM_AVIS_PORTUGAL', 		'TXT_KEY_CITY_NAME_TCM_AVIS_PORTUGAL_09'),
			('CIVILIZATION_TCM_AVIS_PORTUGAL', 		'TXT_KEY_CITY_NAME_TCM_AVIS_PORTUGAL_10'),
			('CIVILIZATION_TCM_AVIS_PORTUGAL', 		'TXT_KEY_CITY_NAME_TCM_AVIS_PORTUGAL_11'),
			('CIVILIZATION_TCM_AVIS_PORTUGAL', 		'TXT_KEY_CITY_NAME_TCM_AVIS_PORTUGAL_12'),
			('CIVILIZATION_TCM_AVIS_PORTUGAL', 		'TXT_KEY_CITY_NAME_TCM_AVIS_PORTUGAL_13'),
			('CIVILIZATION_TCM_AVIS_PORTUGAL', 		'TXT_KEY_CITY_NAME_TCM_AVIS_PORTUGAL_14'),
			('CIVILIZATION_TCM_AVIS_PORTUGAL', 		'TXT_KEY_CITY_NAME_TCM_AVIS_PORTUGAL_15'),
			('CIVILIZATION_TCM_AVIS_PORTUGAL', 		'TXT_KEY_CITY_NAME_TCM_AVIS_PORTUGAL_16'),
			('CIVILIZATION_TCM_AVIS_PORTUGAL', 		'TXT_KEY_CITY_NAME_TCM_AVIS_PORTUGAL_17'),
			('CIVILIZATION_TCM_AVIS_PORTUGAL', 		'TXT_KEY_CITY_NAME_TCM_AVIS_PORTUGAL_18'),
			('CIVILIZATION_TCM_AVIS_PORTUGAL', 		'TXT_KEY_CITY_NAME_TCM_AVIS_PORTUGAL_19'),
			('CIVILIZATION_TCM_AVIS_PORTUGAL', 		'TXT_KEY_CITY_NAME_TCM_AVIS_PORTUGAL_20'),
			('CIVILIZATION_TCM_AVIS_PORTUGAL', 		'TXT_KEY_CITY_NAME_TCM_AVIS_PORTUGAL_21'),
			('CIVILIZATION_TCM_AVIS_PORTUGAL', 		'TXT_KEY_CITY_NAME_TCM_AVIS_PORTUGAL_22'),
			('CIVILIZATION_TCM_AVIS_PORTUGAL', 		'TXT_KEY_CITY_NAME_TCM_AVIS_PORTUGAL_23'),
			('CIVILIZATION_TCM_AVIS_PORTUGAL', 		'TXT_KEY_CITY_NAME_TCM_AVIS_PORTUGAL_24'),
			('CIVILIZATION_TCM_AVIS_PORTUGAL', 		'TXT_KEY_CITY_NAME_TCM_AVIS_PORTUGAL_25'),
			('CIVILIZATION_TCM_AVIS_PORTUGAL', 		'TXT_KEY_CITY_NAME_TCM_AVIS_PORTUGAL_26'),
			('CIVILIZATION_TCM_AVIS_PORTUGAL', 		'TXT_KEY_CITY_NAME_TCM_AVIS_PORTUGAL_27'),
			('CIVILIZATION_TCM_AVIS_PORTUGAL', 		'TXT_KEY_CITY_NAME_TCM_AVIS_PORTUGAL_28'),
			('CIVILIZATION_TCM_AVIS_PORTUGAL', 		'TXT_KEY_CITY_NAME_TCM_AVIS_PORTUGAL_29'),
			('CIVILIZATION_TCM_AVIS_PORTUGAL', 		'TXT_KEY_CITY_NAME_TCM_AVIS_PORTUGAL_30'),
			('CIVILIZATION_PORTUGAL', 		'TXT_KEY_CITY_NAME_TCM_PORTUGAL_BRAZIL_01'),
			('CIVILIZATION_PORTUGAL', 		'TXT_KEY_CITY_NAME_TCM_PORTUGAL_BRAZIL_02'),
			('CIVILIZATION_PORTUGAL', 		'TXT_KEY_CITY_NAME_TCM_PORTUGAL_BRAZIL_03'),
			('CIVILIZATION_PORTUGAL', 		'TXT_KEY_CITY_NAME_TCM_PORTUGAL_BRAZIL_04'),
			('CIVILIZATION_PORTUGAL', 		'TXT_KEY_CITY_NAME_TCM_PORTUGAL_BRAZIL_05'),
			('CIVILIZATION_PORTUGAL', 		'TXT_KEY_CITY_NAME_TCM_PORTUGAL_BRAZIL_06'),
			('CIVILIZATION_PORTUGAL', 		'TXT_KEY_CITY_NAME_TCM_PORTUGAL_BRAZIL_07'),
			('CIVILIZATION_PORTUGAL', 		'TXT_KEY_CITY_NAME_TCM_PORTUGAL_BRAZIL_08'),
			('CIVILIZATION_PORTUGAL', 		'TXT_KEY_CITY_NAME_TCM_PORTUGAL_BRAZIL_09'),
			('CIVILIZATION_PORTUGAL', 		'TXT_KEY_CITY_NAME_TCM_PORTUGAL_BRAZIL_10'),
			('CIVILIZATION_PORTUGAL', 		'TXT_KEY_CITY_NAME_TCM_PORTUGAL_BRAZIL_11'),
			('CIVILIZATION_PORTUGAL', 		'TXT_KEY_CITY_NAME_TCM_PORTUGAL_BRAZIL_12'),
			('CIVILIZATION_PORTUGAL', 		'TXT_KEY_CITY_NAME_TCM_PORTUGAL_BRAZIL_13'),
			('CIVILIZATION_PORTUGAL', 		'TXT_KEY_CITY_NAME_TCM_PORTUGAL_BRAZIL_14'),
			('CIVILIZATION_PORTUGAL', 		'TXT_KEY_CITY_NAME_TCM_PORTUGAL_BRAZIL_15'),
			('CIVILIZATION_PORTUGAL', 		'TXT_KEY_CITY_NAME_TCM_PORTUGAL_BRAZIL_16'),
			('CIVILIZATION_PORTUGAL', 		'TXT_KEY_CITY_NAME_TCM_PORTUGAL_BRAZIL_17'),
			('CIVILIZATION_PORTUGAL', 		'TXT_KEY_CITY_NAME_TCM_PORTUGAL_BRAZIL_18'),
			('CIVILIZATION_PORTUGAL', 		'TXT_KEY_CITY_NAME_TCM_PORTUGAL_BRAZIL_19'),
			('CIVILIZATION_PORTUGAL', 		'TXT_KEY_CITY_NAME_TCM_PORTUGAL_BRAZIL_20'),
			('CIVILIZATION_PORTUGAL', 		'TXT_KEY_CITY_NAME_TCM_PORTUGAL_BRAZIL_21'),
			('CIVILIZATION_PORTUGAL', 		'TXT_KEY_CITY_NAME_TCM_PORTUGAL_BRAZIL_22'),
			('CIVILIZATION_PORTUGAL', 		'TXT_KEY_CITY_NAME_TCM_PORTUGAL_BRAZIL_23'),
			('CIVILIZATION_PORTUGAL', 		'TXT_KEY_CITY_NAME_TCM_PORTUGAL_BRAZIL_24'),
			('CIVILIZATION_PORTUGAL', 		'TXT_KEY_CITY_NAME_TCM_PORTUGAL_BRAZIL_25'),
			('CIVILIZATION_PORTUGAL', 		'TXT_KEY_CITY_NAME_TCM_PORTUGAL_BRAZIL_26'),
			('CIVILIZATION_PORTUGAL', 		'TXT_KEY_CITY_NAME_TCM_PORTUGAL_BRAZIL_27'),
			('CIVILIZATION_PORTUGAL', 		'TXT_KEY_CITY_NAME_TCM_PORTUGAL_BRAZIL_28'),
			('CIVILIZATION_PORTUGAL', 		'TXT_KEY_CITY_NAME_TCM_PORTUGAL_BRAZIL_29'),
			('CIVILIZATION_PORTUGAL', 		'TXT_KEY_CITY_NAME_TCM_PORTUGAL_BRAZIL_30');
--==========================================================================================================================
-- Civilization_FreeBuildingClasses
--==========================================================================================================================		
INSERT INTO Civilization_FreeBuildingClasses 
			(CivilizationType, 					BuildingClassType)
VALUES		('CIVILIZATION_TCM_AVIS_PORTUGAL', 	'BUILDINGCLASS_PALACE');
--==========================================================================================================================
-- Civilization_FreeTechs
--==========================================================================================================================	
INSERT INTO Civilization_FreeTechs 
			(CivilizationType, 						TechType)
SELECT		('CIVILIZATION_TCM_AVIS_PORTUGAL'), 	TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_PORTUGAL';
--==========================================================================================================================
-- Civilization_FreeUnits
--==========================================================================================================================	
INSERT INTO Civilization_FreeUnits 
			(CivilizationType, 						UnitClassType, Count, UnitAIType)
SELECT		('CIVILIZATION_TCM_AVIS_PORTUGAL'), 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_PORTUGAL';
--==========================================================================================================================
-- Civilization_Leaders
--==========================================================================================================================		
INSERT INTO Civilization_Leaders 
			(CivilizationType, 					LeaderheadType)
VALUES		('CIVILIZATION_TCM_AVIS_PORTUGAL', 	'LEADER_TCM_JOAO_II');
--==========================================================================================================================
-- Civilization_UnitClassOverrides
--==========================================================================================================================	
DELETE FROM Civilization_UnitClassOverrides WHERE CivilizationType = 'CIVILIZATION_PORTUGAL' AND UnitType = 'UNIT_PORTUGUESE_NAU';
INSERT OR REPLACE INTO Civilization_UnitClassOverrides
			(CivilizationType, 					UnitClassType, 				UnitType)
VALUES		('CIVILIZATION_TCM_AVIS_PORTUGAL', 	'UNITCLASS_CARAVEL', 		'UNIT_PORTUGUESE_NAU'),
			('CIVILIZATION_PORTUGAL', 			'UNITCLASS_GATLINGGUN', 	'UNIT_TCM_CACADOR');
--==========================================================================================================================
-- Improvements
--==========================================================================================================================	
UPDATE Improvements
SET CivilizationType = ('CIVILIZATION_TCM_AVIS_PORTUGAL')
WHERE Type = 'IMPROVEMENT_FEITORIA';
--==========================================================================================================================
-- Civilization_BuildingClassOverrides
--==========================================================================================================================	
INSERT INTO Civilization_BuildingClassOverrides 
		(CivilizationType, 			BuildingClassType, 			BuildingType)
VALUES	('CIVILIZATION_PORTUGAL', 	'BUILDINGCLASS_THEATRE', 	'BUILDING_TCM_WINERY');
--==========================================================================================================================
-- Civilization_Religions
--==========================================================================================================================	
INSERT INTO Civilization_Religions 
			(CivilizationType, 					ReligionType)
VALUES		('CIVILIZATION_TCM_AVIS_PORTUGAL', 	'RELIGION_CHRISTIANITY');
--==========================================================================================================================
-- Civilization_SpyNames
--==========================================================================================================================	
INSERT INTO Civilization_SpyNames 
			(CivilizationType, 					SpyName)
VALUES		('CIVILIZATION_TCM_AVIS_PORTUGAL', 	'TXT_KEY_SPY_NAME_TCM_AVIS_PORTUGAL_0'),	
			('CIVILIZATION_TCM_AVIS_PORTUGAL', 	'TXT_KEY_SPY_NAME_TCM_AVIS_PORTUGAL_1'),
			('CIVILIZATION_TCM_AVIS_PORTUGAL', 	'TXT_KEY_SPY_NAME_TCM_AVIS_PORTUGAL_2'),
			('CIVILIZATION_TCM_AVIS_PORTUGAL', 	'TXT_KEY_SPY_NAME_TCM_AVIS_PORTUGAL_3'),
			('CIVILIZATION_TCM_AVIS_PORTUGAL', 	'TXT_KEY_SPY_NAME_TCM_AVIS_PORTUGAL_4'),
			('CIVILIZATION_TCM_AVIS_PORTUGAL', 	'TXT_KEY_SPY_NAME_TCM_AVIS_PORTUGAL_5'),
			('CIVILIZATION_TCM_AVIS_PORTUGAL', 	'TXT_KEY_SPY_NAME_TCM_AVIS_PORTUGAL_6'),
			('CIVILIZATION_TCM_AVIS_PORTUGAL', 	'TXT_KEY_SPY_NAME_TCM_AVIS_PORTUGAL_7'),
			('CIVILIZATION_TCM_AVIS_PORTUGAL', 	'TXT_KEY_SPY_NAME_TCM_AVIS_PORTUGAL_8'),
			('CIVILIZATION_TCM_AVIS_PORTUGAL', 	'TXT_KEY_SPY_NAME_TCM_AVIS_PORTUGAL_9');
--==========================================================================================================================
-- Civilization_Start_Along_Ocean
--==========================================================================================================================	
INSERT INTO Civilization_Start_Along_Ocean 
			(CivilizationType, 					StartAlongOcean)
VALUES		('CIVILIZATION_TCM_AVIS_PORTUGAL', 	1);
--==========================================================================================================================	
-- Colors
--==========================================================================================================================			
INSERT INTO Colors 
			(Type, 											Red, 	Green, 	Blue, 	Alpha)
VALUES		('COLOR_PLAYER_TCM_AVIS_PORTUGAL_ICON',			0,		0.169,	0.475,	1),
			('COLOR_PLAYER_TCM_AVIS_PORTUGAL_BACKGROUND',	0.576,	0.659,	0.184,	1); 
--==========================================================================================================================	
-- PlayerColors
--==========================================================================================================================				
INSERT INTO PlayerColors 
			(Type, 								PrimaryColor, 							SecondaryColor, 								TextColor)
VALUES		('PLAYERCOLOR_TCM_AVIS_PORTUGAL',	'COLOR_PLAYER_TCM_AVIS_PORTUGAL_ICON', 	'COLOR_PLAYER_TCM_AVIS_PORTUGAL_BACKGROUND', 	'COLOR_PLAYER_WHITE_TEXT');
--==========================================================================================================================	
--==========================================================================================================================	
--==========================================================================================================================	
-- Leaders
--==========================================================================================================================			
INSERT INTO Leaders 
			(Type, 					Description, 					Civilopedia, 							CivilopediaTag, 					ArtDefineTag, 			VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, Chattiness, Meanness, 	IconAtlas, 				PortraitIndex)
VALUES		('LEADER_TCM_JOAO_II', 	'TXT_KEY_LEADER_TCM_JOAO_II', 	'TXT_KEY_LEADER_TCM_JOAO_II_PEDIA_TEXT', 'TXT_KEY_LEADER_TCM_JOAO_II_PEDIA', 'tcmJoaoIIScene.xml',	2, 						5, 						0, 							5, 			4, 				7, 				4, 					 7, 			 8, 		7, 			7, 			 6, 		 4, 		'TCM_AVIS_PORTUGAL_ATLAS', 	1);
--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================						
INSERT INTO Leader_MajorCivApproachBiases 
			(LeaderType, 			MajorCivApproachType, 				Bias)
VALUES		('LEADER_TCM_JOAO_II', 	'MAJOR_CIV_APPROACH_WAR', 			2),
			('LEADER_TCM_JOAO_II', 	'MAJOR_CIV_APPROACH_HOSTILE', 		1),
			('LEADER_TCM_JOAO_II', 	'MAJOR_CIV_APPROACH_DECEPTIVE', 	4),
			('LEADER_TCM_JOAO_II', 	'MAJOR_CIV_APPROACH_GUARDED', 		6),
			('LEADER_TCM_JOAO_II', 	'MAJOR_CIV_APPROACH_AFRAID', 		5),
			('LEADER_TCM_JOAO_II', 	'MAJOR_CIV_APPROACH_FRIENDLY', 		6),
			('LEADER_TCM_JOAO_II', 	'MAJOR_CIV_APPROACH_NEUTRAL', 		8);
--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================						
INSERT INTO Leader_MinorCivApproachBiases 
			(LeaderType, 			MinorCivApproachType, 				Bias)
VALUES		('LEADER_TCM_JOAO_II', 	'MINOR_CIV_APPROACH_IGNORE', 		8),
			('LEADER_TCM_JOAO_II', 	'MINOR_CIV_APPROACH_FRIENDLY', 		7),
			('LEADER_TCM_JOAO_II', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	3),
			('LEADER_TCM_JOAO_II', 	'MINOR_CIV_APPROACH_CONQUEST', 		1),
			('LEADER_TCM_JOAO_II', 	'MINOR_CIV_APPROACH_BULLY', 		4);
--==========================================================================================================================	
-- Leader_Flavors
--==========================================================================================================================						
INSERT INTO Leader_Flavors 
			(LeaderType, 			FlavorType, 						Flavor)
VALUES		('LEADER_TCM_JOAO_II', 	'FLAVOR_OFFENSE', 					3),
			('LEADER_TCM_JOAO_II', 	'FLAVOR_DEFENSE', 					5),
			('LEADER_TCM_JOAO_II', 	'FLAVOR_CITY_DEFENSE', 				6),
			('LEADER_TCM_JOAO_II', 	'FLAVOR_MILITARY_TRAINING', 		7),
			('LEADER_TCM_JOAO_II', 	'FLAVOR_RECON', 					6),
			('LEADER_TCM_JOAO_II', 	'FLAVOR_RANGED', 					6),
			('LEADER_TCM_JOAO_II', 	'FLAVOR_MOBILE', 					3),
			('LEADER_TCM_JOAO_II', 	'FLAVOR_NAVAL', 					8),
			('LEADER_TCM_JOAO_II', 	'FLAVOR_NAVAL_RECON', 				8),
			('LEADER_TCM_JOAO_II', 	'FLAVOR_NAVAL_GROWTH', 				8),
			('LEADER_TCM_JOAO_II', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	8),
			('LEADER_TCM_JOAO_II', 	'FLAVOR_AIR', 						5),
			('LEADER_TCM_JOAO_II', 	'FLAVOR_EXPANSION', 				4),
			('LEADER_TCM_JOAO_II', 	'FLAVOR_GROWTH', 					7),
			('LEADER_TCM_JOAO_II', 	'FLAVOR_TILE_IMPROVEMENT', 			7),
			('LEADER_TCM_JOAO_II', 	'FLAVOR_INFRASTRUCTURE', 			6),
			('LEADER_TCM_JOAO_II', 	'FLAVOR_PRODUCTION', 				6),
			('LEADER_TCM_JOAO_II', 	'FLAVOR_GOLD', 						9),
			('LEADER_TCM_JOAO_II', 	'FLAVOR_SCIENCE', 					6),
			('LEADER_TCM_JOAO_II', 	'FLAVOR_CULTURE', 					7),
			('LEADER_TCM_JOAO_II', 	'FLAVOR_HAPPINESS', 				7),
			('LEADER_TCM_JOAO_II', 	'FLAVOR_GREAT_PEOPLE', 				4),
			('LEADER_TCM_JOAO_II', 	'FLAVOR_WONDER', 					6),
			('LEADER_TCM_JOAO_II', 	'FLAVOR_RELIGION', 					6),
			('LEADER_TCM_JOAO_II', 	'FLAVOR_DIPLOMACY', 				5),
			('LEADER_TCM_JOAO_II', 	'FLAVOR_SPACESHIP', 				5),
			('LEADER_TCM_JOAO_II', 	'FLAVOR_WATER_CONNECTION', 			7),
			('LEADER_TCM_JOAO_II', 	'FLAVOR_NUKE', 						2),
			('LEADER_TCM_JOAO_II', 	'FLAVOR_USE_NUKE', 					1),
			('LEADER_TCM_JOAO_II', 	'FLAVOR_ESPIONAGE', 				5),
			('LEADER_TCM_JOAO_II', 	'FLAVOR_AIRLIFT', 					5),
			('LEADER_TCM_JOAO_II', 	'FLAVOR_I_TRADE_DESTINATION', 		7),
			('LEADER_TCM_JOAO_II', 	'FLAVOR_I_TRADE_ORIGIN', 			7),
			('LEADER_TCM_JOAO_II', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		8),
			('LEADER_TCM_JOAO_II', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		4),
			('LEADER_TCM_JOAO_II', 	'FLAVOR_ARCHAEOLOGY', 				5),
			('LEADER_TCM_JOAO_II', 	'FLAVOR_AIR_CARRIER', 				5);
--==========================================================================================================================	
-- Leader_Traits
--==========================================================================================================================
DELETE FROM Leader_Traits WHERE LeaderType = 'LEADER_MARIA_I';	
INSERT INTO Leader_Traits 
			(LeaderType, 			TraitType)
VALUES		('LEADER_TCM_JOAO_II', 	'TRAIT_TCM_JOAO_II_AVIS_PORTUGAL'),
			('LEADER_MARIA_I', 		'TRAIT_TCM_MARIA_PORTUGAL_BRAZIL');
--==========================================================================================================================	
-- Traits
--==========================================================================================================================	
INSERT INTO Traits 
			(Type, 									Description, 								ShortDescription)
VALUES		('TRAIT_TCM_JOAO_II_AVIS_PORTUGAL', 	'TXT_KEY_TRAIT_TCM_JOAO_II_AVIS_PORTUGAL', 	'TXT_KEY_TRAIT_TCM_JOAO_II_AVIS_PORTUGAL_SHORT'),
			('TRAIT_TCM_MARIA_PORTUGAL_BRAZIL', 	'TXT_KEY_TRAIT_TCM_MARIA_PORTUGAL_BRAZIL', 	'TXT_KEY_TRAIT_TCM_MARIA_PORTUGAL_BRAZIL_SHORT');
--==========================================================================================================================
-- AUDIO
--==========================================================================================================================	
-- Audio_Sounds
------------------------------	
INSERT INTO Audio_Sounds 
			(SoundID, 								Filename, 					LoadType)
VALUES		('SND_LEADER_MUSIC_TCM_JOAO_II_PEACE', 	'TCM_AVIS_PORTUGAL_PEACE', 	'DynamicResident'),
			('SND_LEADER_MUSIC_TCM_JOAO_II_WAR',	'TCM_AVIS_PORTUGAL_WAR', 	'DynamicResident');		
------------------------------
-- Audio_2DSounds
------------------------------	
INSERT INTO Audio_2DSounds 
			(ScriptID, 									SoundID, 								SoundType, 		MinVolume, 	MaxVolume,	IsMusic,	Looping)
VALUES		('AS2D_LEADER_MUSIC_TCM_JOAO_II_PEACE', 	'SND_LEADER_MUSIC_TCM_JOAO_II_PEACE', 	'GAME_MUSIC', 	80, 		80, 		1, 			0),
			('AS2D_LEADER_MUSIC_TCM_JOAO_II_WAR', 		'SND_LEADER_MUSIC_TCM_JOAO_II_WAR', 	'GAME_MUSIC', 	80, 		80, 		1,			0);
--==========================================================================================================================	
-- Diplomacy_Responses
--==========================================================================================================================	
INSERT INTO Diplomacy_Responses (LeaderType, ResponseType, Response, Bias) VALUES ('LEADER_TCM_JOAO_II','RESPONSE_FIRST_GREETING','TXT_KEY_LEADER_TCM_JOAO_II_FIRSTGREETING%','1');
INSERT INTO Diplomacy_Responses (LeaderType, ResponseType, Response, Bias) VALUES ('LEADER_TCM_JOAO_II','RESPONSE_DEFEATED',		 'TXT_KEY_LEADER_TCM_JOAO_II_DEFEATED%','1');
--==========================================================================================================================	
-- BuildingClasses
--==========================================================================================================================	
INSERT INTO BuildingClasses 	
			(Type, 						 				DefaultBuilding, 								Description)
VALUES		('BUILDINGCLASS_TCM_AVIS_PORTUGAL_DUMMY', 	'BUILDING_TCM_AVIS_PORTUGAL_FEITORIA_GOLD', 	'TXT_KEY_TRAIT_TCM_JOAO_II_AVIS_PORTUGAL_SHORT');
--==========================================================================================================================	
-- Buildings
--==========================================================================================================================			
INSERT INTO Buildings 	
			(Type, 											BuildingClass,								Happiness,	GreatWorkCount, Cost, FaithCost, NukeImmune, ConquestProb,  PrereqTech,	Description, 										Help,												PortraitIndex, 	IconAtlas)
VALUES		('BUILDING_TCM_AVIS_PORTUGAL_FEITORIA_GOLD',	'BUILDINGCLASS_TCM_AVIS_PORTUGAL_DUMMY', 	0,			-1, 			-1,   -1, 		 1,		 	 0,				NULL, 		'TXT_KEY_TRAIT_TCM_JOAO_II_AVIS_PORTUGAL_SHORT', 	'TXT_KEY_TRAIT_TCM_JOAO_II_AVIS_PORTUGAL_SHORT',	0, 				'TCM_AVIS_PORTUGAL_ATLAS'),
			('BUILDING_TCM_AVIS_PORTUGAL_FEITORIA_EXP',		'BUILDINGCLASS_TCM_AVIS_PORTUGAL_DUMMY', 	0,			-1, 			-1,   -1, 		 1,		 	 0,				NULL, 		'TXT_KEY_TRAIT_TCM_JOAO_II_AVIS_PORTUGAL_SHORT', 	'TXT_KEY_TRAIT_TCM_JOAO_II_AVIS_PORTUGAL_SHORT',	0, 				'TCM_AVIS_PORTUGAL_ATLAS'),
			('BUILDING_TCM_PORTUGAL_FOOD_DUMY',				'BUILDINGCLASS_TCM_AVIS_PORTUGAL_DUMMY', 	0,			-1, 			-1,   -1, 		 1,		 	 0,				NULL, 		'TXT_KEY_TRAIT_TCM_JOAO_II_AVIS_PORTUGAL_SHORT', 	'TXT_KEY_TRAIT_TCM_JOAO_II_AVIS_PORTUGAL_SHORT',	0, 				'TCM_AVIS_PORTUGAL_ATLAS'),
			('BUILDING_TCM_PORTUGAL_HAPPY_DUMMY',			'BUILDINGCLASS_TCM_AVIS_PORTUGAL_DUMMY', 	2,			-1, 			-1,   -1, 		 1,		 	 0,				NULL, 		'TXT_KEY_TRAIT_TCM_JOAO_II_AVIS_PORTUGAL_SHORT', 	'TXT_KEY_TRAIT_TCM_JOAO_II_AVIS_PORTUGAL_SHORT',	0, 				'TCM_AVIS_PORTUGAL_ATLAS');
--==========================================================================================================================	
-- Building_YieldChanges
--==========================================================================================================================	
INSERT INTO Building_YieldChanges 	
			(BuildingType, 						 			YieldType, 		Yield)
VALUES		('BUILDING_TCM_AVIS_PORTUGAL_FEITORIA_GOLD', 	'YIELD_GOLD', 	1);
--==========================================================================================================================	
-- Building_DomainFreeExperiences
--==========================================================================================================================	
INSERT INTO Building_DomainFreeExperiences 	
			(BuildingType, 						 			DomainType, 	Experience)
VALUES		('BUILDING_TCM_AVIS_PORTUGAL_FEITORIA_EXP', 	'DOMAIN_SEA', 	1);
--==========================================================================================================================	
-- Building_YieldModifiers
--==========================================================================================================================	
INSERT INTO Building_YieldModifiers 	
			(BuildingType, 						 	YieldType, 		Yield)
VALUES		('BUILDING_TCM_PORTUGAL_FOOD_DUMY', 	'YIELD_FOOD', 	20);
--==========================================================================================================================	
-- UnitPromotions
--==========================================================================================================================
INSERT INTO UnitPromotions 
			(Type, 									Description, 								Help, 												Sound, 				RivalTerritory, HealOutsideFriendly, LostWithUpgrade,	CannotBeChosen,	PortraitIndex, 	IconAtlas, 			PediaType, 			PediaEntry)
VALUES		('PROMOTION_TCM_HEAL_ON_CITY_STATE',	'TXT_KEY_PROMOTION_TCM_HEAL_ON_CITY_STATE',	'TXT_KEY_PROMOTION_TCM_HEAL_ON_CITY_STATE_HELP',	'AS2D_IF_LEVELUP',	1,				1,					 1,					1,				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_TCM_HEAL_ON_CITY_STATE'),
			('PROMOTION_TCM_ENTER_CITY_STATE',		'TXT_KEY_PROMOTION_TCM_ENTER_CITY_STATE',	'TXT_KEY_PROMOTION_TCM_ENTER_CITY_STATE_HELP',		'AS2D_IF_LEVELUP',	1,				-1,					 -1,				1,				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_TCM_ENTER_CITY_STATE');	

--==========================================================================================================================	
-- Buildings
--==========================================================================================================================			
INSERT INTO Buildings
			(Type, 						BuildingClass, Cost, GoldMaintenance, PrereqTech, NeverCapture, ConquestProb, Happiness,	Description,						Help,									Civilopedia,						Strategy,									ArtDefineTag, MinAreaSize, 	HurryCostModifier, IconAtlas,						PortraitIndex)
SELECT		('BUILDING_TCM_WINERY'),	BuildingClass, Cost, GoldMaintenance, PrereqTech, NeverCapture, ConquestProb, Happiness,	('TXT_KEY_BUILDING_TCM_WINERY'),	('TXT_KEY_BUILDING_TCM_WINERY_HELP'),	('TXT_KEY_CIV5_TCM_WINERY_TEXT'),	('TXT_KEY_BUILDING_TCM_WINERY_STRATEGY'),	ArtDefineTag, MinAreaSize, 	HurryCostModifier, ('TCM_PORTUGAL_BRAZIL_ATLAS'), 	2
FROM Buildings WHERE Type = 'BUILDING_THEATRE';		
--==========================================================================================================================	
-- Building_ClassesNeededInCity
--==========================================================================================================================					
INSERT INTO Building_ClassesNeededInCity 
			(BuildingType, 			BuildingClassType)
VALUES		('BUILDING_TCM_WINERY', 'BUILDINGCLASS_COLOSSEUM');
--==========================================================================================================================	
-- Building_Flavors
--==========================================================================================================================					
INSERT INTO Building_Flavors 
			(BuildingType, 			FlavorType,				Flavor)
VALUES		('BUILDING_TCM_WINERY', 'FLAVOR_EXPANSION',		6),
			('BUILDING_TCM_WINERY', 'FLAVOR_GROWTH',		6),
			('BUILDING_TCM_WINERY', 'FLAVOR_HAPPINESS',		30);
--==========================================================================================================================
--==========================================================================================================================	
-- Units
--==========================================================================================================================		
INSERT INTO Units 	
			(Class, 	Type, 					PrereqTech, Range,   Combat, RangedCombat, Cost, ObsoleteTech, FaithCost, RequiresFaithPurchaseEnabled, Moves, CombatClass, Domain, DefaultUnitAI, Description, 					Civilopedia, 									Strategy, 							  Help, 							 MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, AdvancedStartCost, Mechanized, CombatLimit, MinAreaSize, Pillage, XPValueAttack, XPValueDefense, Conscription, UnitArtInfo, 					UnitFlagIconOffset,	UnitFlagAtlas,					 PortraitIndex, IconAtlas,						MoveRate)
SELECT		Class,		('UNIT_TCM_CACADOR'),   PrereqTech,	2,		 Combat, RangedCombat, Cost, ObsoleteTech, FaithCost, RequiresFaithPurchaseEnabled, Moves, CombatClass, Domain, DefaultUnitAI, ('TXT_KEY_UNIT_TCM_CACADOR'), ('TXT_KEY_CIVILOPEDIA_UNITS_TCM_CACADOR_TEXT'), ('TXT_KEY_UNIT_TCM_CACADOR_STRATEGY'), ('TXT_KEY_UNIT_HELP_TCM_CACADOR'), MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, AdvancedStartCost, Mechanized, CombatLimit, MinAreaSize, Pillage, XPValueAttack, XPValueDefense, Conscription, ('ART_DEF_UNIT_TCM_CACADOR'),	0,					('TCM_UNIT_FLAG_CACADOR_ATLAS'), 1, 			('TCM_PORTUGAL_BRAZIL_ATLAS'),  MoveRate
FROM Units WHERE (Type = 'UNIT_GATLINGGUN');
--==========================================================================================================================	
-- UnitGameplay2DScripts
--==========================================================================================================================		
INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 				SelectionSound, FirstSelectionSound)
SELECT		('UNIT_TCM_CACADOR'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_GATLINGGUN');		
--==========================================================================================================================	
-- Unit_AITypes
--==========================================================================================================================		
INSERT INTO Unit_AITypes 	
			(UnitType, 				UnitAIType)
SELECT		('UNIT_TCM_CACADOR'), 	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_GATLINGGUN');	
--==========================================================================================================================	
-- Unit_ClassUpgrades
--==========================================================================================================================		
INSERT INTO Unit_ClassUpgrades 	
			(UnitType, 					UnitClassType)
VALUES		('UNIT_TCM_CACADOR', 		'UNITCLASS_MACHINE_GUN');
--==========================================================================================================================	
-- Unit_Flavors
--==========================================================================================================================		
INSERT INTO Unit_Flavors 	
			(UnitType, 				FlavorType,				Flavor)
VALUES		('UNIT_TCM_CACADOR', 	'FLAVOR_OFFENSE',		4),
			('UNIT_TCM_CACADOR', 	'FLAVOR_DEFENSE',		4),
			('UNIT_TCM_CACADOR', 	'FLAVOR_RANGED',		9);
--==========================================================================================================================	
-- Unit_FreePromotions
--==========================================================================================================================		
INSERT INTO Unit_FreePromotions 	
			(UnitType, 							PromotionType)
VALUES		('UNIT_TCM_CACADOR', 				'PROMOTION_ONLY_DEFENSIVE'),
			('UNIT_TCM_CACADOR', 				'PROMOTION_IGNORE_TERRAIN_COST');
--==========================================================================================================================	
-- UnitPromotions
--==========================================================================================================================	
INSERT INTO UnitPromotions 
			(Type, 						 Description, 						 Help, 									 Sound, 			ExperiencePercent,  LostWithUpgrade, OrderPriority, CannotBeChosen,	PortraitIndex, 	IconAtlas,			PediaType, 			PediaEntry)
VALUES		('PROMOTION_TCM_DOUBLE_XP',	 'TXT_KEY_PROMOTION_TCM_DOUBLE_XP',  'TXT_KEY_PROMOTION_TCM_DOUBLE_XP_HELP', 'AS2D_IF_LEVELUP',	100,				1, 				 0,				1,				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_TCM_DOUBLE_XP');
--------------------------------------------------------------------------------------------------
--BNW Buildings
--------------------------------------------------------------------------------------------------
INSERT INTO BuildingClasses (Type,			Description,										DefaultBuilding )
SELECT 'BUILDINGCLASS_TCM_TEMP_ART_HOLDER',	'TXT_KEY_TRAIT_TCM_MARIA_PORTUGAL_BRAZIL_SHORT',	'BUILDING_TCM_TEMP_ART_HOLDER';

INSERT INTO Buildings (Type,				BuildingClass,							IconAtlas,						PortraitIndex,	Description,										Cost,	GreatWorkSlotType,				GreatWorkCount) 
SELECT 'BUILDING_TCM_TEMP_ART_HOLDER',		'BUILDINGCLASS_TCM_TEMP_ART_HOLDER',	'TCM_PORTUGAL_BRAZIL_ATLAS',	0,				'TXT_KEY_TRAIT_TCM_MARIA_PORTUGAL_BRAZIL_SHORT',	-1,		'GREAT_WORK_SLOT_ART_ARTIFACT',	1;