--==========================================================================================================================	
-- Civilizations
--==========================================================================================================================				
INSERT INTO Civilizations 	
			(Type, 									Description, 								ShortDescription, 									Adjective, 											Civilopedia, 									CivilopediaTag, 						DefaultPlayerColor, 	ArtDefineTag, ArtStyleType,		ArtStyleSuffix, ArtStylePrefix, IconAtlas, 					PortraitIndex, 	AlphaIconAtlas, 					SoundtrackTag, 	MapImage, 					DawnOfManQuote, 						DawnOfManImage,		DawnOfManAudio)
SELECT		('CIVILIZATION_SENSHI_BUNUBA'), 		('TXT_KEY_CIV_SENSHI_BUNUBA_DESC'), 		('TXT_KEY_CIV_SENSHI_BUNUBA_SHORT_DESC'),		('TXT_KEY_CIV_SENSHI_BUNUBA_ADJECTIVE'), 		('TXT_KEY_CIV5_SENSHI_BUNUBA_TEXT_1'), 		('TXT_KEY_CIV5_SENSHI_BUNUBA'), 		('PLAYERCOLOR_SENSHI_BUNUBA'), 		ArtDefineTag, ArtStyleType,		('_AFRI'),		ArtStylePrefix,	('SENSHI_BUNUBA_ATLAS'), 		0, 				('SENSHI_BUNUBA_ALPHA_ATLAS'), 	('POLYNESIA'), 	('JandamarraMap412.dds'), 	('TXT_KEY_CIV5_DOM_SENSHI_JANDAMARRA_TEXT'), 	('JandamarraDoM.dds'),	('AS2D_DOM_SPEECH_SENSHI_JANDAMARRA')
FROM Civilizations WHERE (Type = 'CIVILIZATION_POLYNESIA');

UPDATE Civilizations 
SET ArtStyleSuffix = (CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = '_POLYNESIA' )
	THEN '_POLYNESIA'
	ELSE '_AFRI' END) 
WHERE Type = 'CIVILIZATION_SENSHI_BUNUBA';
--==========================================================================================================================	
-- Civilization_CityNames
--==========================================================================================================================			
INSERT INTO Civilization_CityNames 
			(CivilizationType, 			 CityName)
VALUES		('CIVILIZATION_SENSHI_BUNUBA', 	'TXT_KEY_CITY_NAME_SENSHI_BUNUBA_01'),
			('CIVILIZATION_SENSHI_BUNUBA', 	'TXT_KEY_CITY_NAME_SENSHI_BUNUBA_02'),
			('CIVILIZATION_SENSHI_BUNUBA', 	'TXT_KEY_CITY_NAME_SENSHI_BUNUBA_03'),
			('CIVILIZATION_SENSHI_BUNUBA', 	'TXT_KEY_CITY_NAME_SENSHI_BUNUBA_04'),
			('CIVILIZATION_SENSHI_BUNUBA', 	'TXT_KEY_CITY_NAME_SENSHI_BUNUBA_05'),
			('CIVILIZATION_SENSHI_BUNUBA', 	'TXT_KEY_CITY_NAME_SENSHI_BUNUBA_06'),
			('CIVILIZATION_SENSHI_BUNUBA', 	'TXT_KEY_CITY_NAME_SENSHI_BUNUBA_07'),
			('CIVILIZATION_SENSHI_BUNUBA', 	'TXT_KEY_CITY_NAME_SENSHI_BUNUBA_08'),
			('CIVILIZATION_SENSHI_BUNUBA', 	'TXT_KEY_CITY_NAME_SENSHI_BUNUBA_09'),
			('CIVILIZATION_SENSHI_BUNUBA', 	'TXT_KEY_CITY_NAME_SENSHI_BUNUBA_10'),
			('CIVILIZATION_SENSHI_BUNUBA', 	'TXT_KEY_CITY_NAME_SENSHI_BUNUBA_11'),
			('CIVILIZATION_SENSHI_BUNUBA', 	'TXT_KEY_CITY_NAME_SENSHI_BUNUBA_12'),
			('CIVILIZATION_SENSHI_BUNUBA', 	'TXT_KEY_CITY_NAME_SENSHI_BUNUBA_13'),
			('CIVILIZATION_SENSHI_BUNUBA', 	'TXT_KEY_CITY_NAME_SENSHI_BUNUBA_14'),
			('CIVILIZATION_SENSHI_BUNUBA', 	'TXT_KEY_CITY_NAME_SENSHI_BUNUBA_15'),
			('CIVILIZATION_SENSHI_BUNUBA', 	'TXT_KEY_CITY_NAME_SENSHI_BUNUBA_16'),
			('CIVILIZATION_SENSHI_BUNUBA', 	'TXT_KEY_CITY_NAME_SENSHI_BUNUBA_17'),
			('CIVILIZATION_SENSHI_BUNUBA', 	'TXT_KEY_CITY_NAME_SENSHI_BUNUBA_18'),
			('CIVILIZATION_SENSHI_BUNUBA', 	'TXT_KEY_CITY_NAME_SENSHI_BUNUBA_19'),
			('CIVILIZATION_SENSHI_BUNUBA', 	'TXT_KEY_CITY_NAME_SENSHI_BUNUBA_20'),
			('CIVILIZATION_SENSHI_BUNUBA', 	'TXT_KEY_CITY_NAME_SENSHI_BUNUBA_21'),
			('CIVILIZATION_SENSHI_BUNUBA', 	'TXT_KEY_CITY_NAME_SENSHI_BUNUBA_22');
--==========================================================================================================================	
-- Civilization_FreeBuildingClasses
--==========================================================================================================================			
INSERT INTO Civilization_FreeBuildingClasses 
			(CivilizationType, 					BuildingClassType)
SELECT		('CIVILIZATION_SENSHI_BUNUBA'), 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE (CivilizationType = 'CIVILIZATION_POLYNESIA');
--==========================================================================================================================	
-- Civilization_FreeTechs
--==========================================================================================================================		
INSERT INTO Civilization_FreeTechs 
			(CivilizationType, 					TechType)
SELECT		('CIVILIZATION_SENSHI_BUNUBA'), 	TechType
FROM Civilization_FreeTechs WHERE (CivilizationType = 'CIVILIZATION_POLYNESIA');
--==========================================================================================================================	
-- Civilization_FreeUnits
--==========================================================================================================================		
INSERT INTO Civilization_FreeUnits 
			(CivilizationType, 					UnitClassType, Count, UnitAIType)
SELECT		('CIVILIZATION_SENSHI_BUNUBA'), 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE (CivilizationType = 'CIVILIZATION_POLYNESIA');
--==========================================================================================================================	
-- Civilization_Start_Region_Priority
--==========================================================================================================================			
INSERT INTO Civilization_Start_Region_Priority 
			(CivilizationType, 					RegionType)
VALUES		('CIVILIZATION_SENSHI_BUNUBA', 		'REGION_HILLS');
--==========================================================================================================================	
-- Civilization_Leaders
--==========================================================================================================================			
INSERT INTO Civilization_Leaders 
			(CivilizationType, 					LeaderheadType)
VALUES		('CIVILIZATION_SENSHI_BUNUBA', 	'LEADER_SENSHI_JANDAMARRA');	
--==========================================================================================================================	
-- Civilization_UnitClassOverrides 
--==========================================================================================================================		
INSERT INTO Civilization_UnitClassOverrides 
			(CivilizationType, 				UnitClassType, 			UnitType)
VALUES		('CIVILIZATION_SENSHI_BUNUBA', 	'UNITCLASS_RIFLEMAN',	'UNIT_SENSHI_JILAMANA'),
			('CIVILIZATION_SENSHI_BUNUBA', 	'UNITCLASS_PROPHET',	'UNIT_SENSHI_JALGANGURRU');
--==========================================================================================================================	
-- Civilization_Religions
--==========================================================================================================================		
INSERT INTO Civilization_Religions 
			(CivilizationType, 				ReligionType)
SELECT		'CIVILIZATION_SENSHI_BUNUBA', 	ReligionType
FROM Civilization_Religions WHERE (CivilizationType = 'CIVILIZATION_POLYNESIA');
--==========================================================================================================================	
-- Civilization_SpyNames
--==========================================================================================================================		
INSERT INTO Civilization_SpyNames 
			(CivilizationType, 					SpyName)
VALUES		('CIVILIZATION_SENSHI_BUNUBA', 	'TXT_KEY_SPY_NAME_SENSHI_BUNUBA_0'),	
			('CIVILIZATION_SENSHI_BUNUBA', 	'TXT_KEY_SPY_NAME_SENSHI_BUNUBA_1'),
			('CIVILIZATION_SENSHI_BUNUBA', 	'TXT_KEY_SPY_NAME_SENSHI_BUNUBA_2'),
			('CIVILIZATION_SENSHI_BUNUBA', 	'TXT_KEY_SPY_NAME_SENSHI_BUNUBA_3'),
			('CIVILIZATION_SENSHI_BUNUBA', 	'TXT_KEY_SPY_NAME_SENSHI_BUNUBA_4'),
			('CIVILIZATION_SENSHI_BUNUBA', 	'TXT_KEY_SPY_NAME_SENSHI_BUNUBA_5'),
			('CIVILIZATION_SENSHI_BUNUBA', 	'TXT_KEY_SPY_NAME_SENSHI_BUNUBA_6'),
			('CIVILIZATION_SENSHI_BUNUBA', 	'TXT_KEY_SPY_NAME_SENSHI_BUNUBA_7'),
			('CIVILIZATION_SENSHI_BUNUBA', 	'TXT_KEY_SPY_NAME_SENSHI_BUNUBA_8'),
			('CIVILIZATION_SENSHI_BUNUBA', 	'TXT_KEY_SPY_NAME_SENSHI_BUNUBA_9');
--==========================================================================================================================		
--==========================================================================================================================						
			
			

