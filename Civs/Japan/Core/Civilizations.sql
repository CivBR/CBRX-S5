--==========================================================================================================================	
-- Civilizations
--==========================================================================================================================				
INSERT INTO Civilizations 	
			(Type, 									Description, 								ShortDescription, 									Adjective, 													Civilopedia, 		CivilopediaTag, 		DefaultPlayerColor, 					ArtDefineTag, ArtStyleType,		ArtStyleSuffix, ArtStylePrefix, IconAtlas, 					PortraitIndex, 	AlphaIconAtlas, 					SoundtrackTag, 	MapImage, 					DawnOfManQuote, 						DawnOfManImage,		DawnOfManAudio)
SELECT		('CIVILIZATION_SENSHI_HIDEYOSHI'), 		('TXT_KEY_CIV_SENSHI_HIDEYOSHI_DESC'), 		('TXT_KEY_CIV_SENSHI_HIDEYOSHI_SHORT_DESC'),		('TXT_KEY_CIV_SENSHI_HIDEYOSHI_ADJECTIVE'), 		Civilopedia, 		CivilopediaTag, 		('PLAYERCOLOR_SENSHI_HIDEYOSHI'), 		ArtDefineTag, ArtStyleType,		ArtStyleSuffix,	ArtStylePrefix,	('SENSHI_HIDEYOSHI_ATLAS'), 		0, 				('SENSHI_HIDEYOSHI_ALPHA_ATLAS'), 	SoundtrackTag, 	('HideyoshiMap412.dds'), 	('TXT_KEY_CIV5_DOM_SENSHI_HIDEYOSHI_TEXT'), 	('HideyoshiDoM.dds'),	('AS2D_DOM_SPEECH_SENSHI_HIDEYOSHI')
FROM Civilizations WHERE (Type = 'CIVILIZATION_JAPAN');

UPDATE Civilizations 
SET ArtStyleSuffix = (CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = '_JAPAN' )
	THEN '_JAPAN'
	ELSE '_ASIA' END) 
WHERE Type = 'CIVILIZATION_SENSHI_HIDEYOSHI';
--==========================================================================================================================	
-- Civilization_CityNames
--==========================================================================================================================			
INSERT INTO Civilization_CityNames 
			(CivilizationType, 			 CityName)
VALUES		('CIVILIZATION_SENSHI_HIDEYOSHI', 	'TXT_KEY_CITY_NAME_SENSHI_HIDEYOSHI_01'),
			('CIVILIZATION_SENSHI_HIDEYOSHI', 	'TXT_KEY_CITY_NAME_SENSHI_HIDEYOSHI_02'),
			('CIVILIZATION_SENSHI_HIDEYOSHI', 	'TXT_KEY_CITY_NAME_SENSHI_HIDEYOSHI_03'),
			('CIVILIZATION_SENSHI_HIDEYOSHI', 	'TXT_KEY_CITY_NAME_SENSHI_HIDEYOSHI_04'),
			('CIVILIZATION_SENSHI_HIDEYOSHI', 	'TXT_KEY_CITY_NAME_SENSHI_HIDEYOSHI_05'),
			('CIVILIZATION_SENSHI_HIDEYOSHI', 	'TXT_KEY_CITY_NAME_SENSHI_HIDEYOSHI_06'),
			('CIVILIZATION_SENSHI_HIDEYOSHI', 	'TXT_KEY_CITY_NAME_SENSHI_HIDEYOSHI_07'),
			('CIVILIZATION_SENSHI_HIDEYOSHI', 	'TXT_KEY_CITY_NAME_SENSHI_HIDEYOSHI_08'),
			('CIVILIZATION_SENSHI_HIDEYOSHI', 	'TXT_KEY_CITY_NAME_SENSHI_HIDEYOSHI_09'),
			('CIVILIZATION_SENSHI_HIDEYOSHI', 	'TXT_KEY_CITY_NAME_SENSHI_HIDEYOSHI_10'),
			('CIVILIZATION_SENSHI_HIDEYOSHI', 	'TXT_KEY_CITY_NAME_SENSHI_HIDEYOSHI_11'),
			('CIVILIZATION_SENSHI_HIDEYOSHI', 	'TXT_KEY_CITY_NAME_SENSHI_HIDEYOSHI_12'),
			('CIVILIZATION_SENSHI_HIDEYOSHI', 	'TXT_KEY_CITY_NAME_SENSHI_HIDEYOSHI_13'),
			('CIVILIZATION_SENSHI_HIDEYOSHI', 	'TXT_KEY_CITY_NAME_SENSHI_HIDEYOSHI_14'),
			('CIVILIZATION_SENSHI_HIDEYOSHI', 	'TXT_KEY_CITY_NAME_SENSHI_HIDEYOSHI_15'),
			('CIVILIZATION_SENSHI_HIDEYOSHI', 	'TXT_KEY_CITY_NAME_SENSHI_HIDEYOSHI_16'),
			('CIVILIZATION_SENSHI_HIDEYOSHI', 	'TXT_KEY_CITY_NAME_SENSHI_HIDEYOSHI_17'),
			('CIVILIZATION_SENSHI_HIDEYOSHI', 	'TXT_KEY_CITY_NAME_SENSHI_HIDEYOSHI_18'),
			('CIVILIZATION_SENSHI_HIDEYOSHI', 	'TXT_KEY_CITY_NAME_SENSHI_HIDEYOSHI_19'),
			('CIVILIZATION_SENSHI_HIDEYOSHI', 	'TXT_KEY_CITY_NAME_SENSHI_HIDEYOSHI_20'),
			('CIVILIZATION_SENSHI_HIDEYOSHI', 	'TXT_KEY_CITY_NAME_SENSHI_HIDEYOSHI_21'),
			('CIVILIZATION_SENSHI_HIDEYOSHI', 	'TXT_KEY_CITY_NAME_SENSHI_HIDEYOSHI_22'),
			('CIVILIZATION_SENSHI_HIDEYOSHI', 	'TXT_KEY_CITY_NAME_SENSHI_HIDEYOSHI_23'),
			('CIVILIZATION_SENSHI_HIDEYOSHI', 	'TXT_KEY_CITY_NAME_SENSHI_HIDEYOSHI_24'),
			('CIVILIZATION_SENSHI_HIDEYOSHI', 	'TXT_KEY_CITY_NAME_SENSHI_HIDEYOSHI_25'),
			('CIVILIZATION_SENSHI_HIDEYOSHI', 	'TXT_KEY_CITY_NAME_SENSHI_HIDEYOSHI_26'),
			('CIVILIZATION_SENSHI_HIDEYOSHI', 	'TXT_KEY_CITY_NAME_SENSHI_HIDEYOSHI_27'),
			('CIVILIZATION_SENSHI_HIDEYOSHI', 	'TXT_KEY_CITY_NAME_SENSHI_HIDEYOSHI_28'),
			('CIVILIZATION_SENSHI_HIDEYOSHI', 	'TXT_KEY_CITY_NAME_SENSHI_HIDEYOSHI_29'),
			('CIVILIZATION_SENSHI_HIDEYOSHI', 	'TXT_KEY_CITY_NAME_SENSHI_HIDEYOSHI_30'),
			('CIVILIZATION_SENSHI_HIDEYOSHI', 	'TXT_KEY_CITY_NAME_SENSHI_HIDEYOSHI_31');
--==========================================================================================================================	
-- Civilization_FreeBuildingClasses
--==========================================================================================================================			
INSERT INTO Civilization_FreeBuildingClasses 
			(CivilizationType, 					BuildingClassType)
SELECT		('CIVILIZATION_SENSHI_HIDEYOSHI'), 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE (CivilizationType = 'CIVILIZATION_JAPAN');
--==========================================================================================================================	
-- Civilization_FreeTechs
--==========================================================================================================================		
INSERT INTO Civilization_FreeTechs 
			(CivilizationType, 					TechType)
SELECT		('CIVILIZATION_SENSHI_HIDEYOSHI'), 	TechType
FROM Civilization_FreeTechs WHERE (CivilizationType = 'CIVILIZATION_JAPAN');
--==========================================================================================================================	
-- Civilization_FreeUnits
--==========================================================================================================================		
INSERT INTO Civilization_FreeUnits 
			(CivilizationType, 					UnitClassType, Count, UnitAIType)
SELECT		('CIVILIZATION_SENSHI_HIDEYOSHI'), 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE (CivilizationType = 'CIVILIZATION_JAPAN');
--==========================================================================================================================	
-- Civilization_Start_Region_Avoid
--==========================================================================================================================			
INSERT INTO Civilization_Start_Region_Avoid
			(CivilizationType, 					RegionType)
VALUES		('CIVILIZATION_SENSHI_HIDEYOSHI', 	'REGION_DESERT');	
--==========================================================================================================================	
-- Civilization_Leaders
--==========================================================================================================================			
INSERT INTO Civilization_Leaders 
			(CivilizationType, 					LeaderheadType)
VALUES		('CIVILIZATION_SENSHI_HIDEYOSHI', 	'LEADER_SENSHI_HIDEYOSHI');	
--==========================================================================================================================	
-- Civilization_UnitClassOverrides 
--==========================================================================================================================		
INSERT INTO Civilization_UnitClassOverrides 
			(CivilizationType, 					UnitClassType, 				UnitType)
VALUES		('CIVILIZATION_SENSHI_HIDEYOSHI', 	'UNITCLASS_PIKEMAN',	'UNIT_SENSHI_ASHIGARU');
--==========================================================================================================================	
-- Civilization_BuildingClassOverrides 
--==========================================================================================================================		
INSERT INTO Civilization_BuildingClassOverrides 
			(CivilizationType, 					BuildingClassType, 			BuildingType)
VALUES		('CIVILIZATION_SENSHI_HIDEYOSHI', 	'BUILDINGCLASS_CASTLE',		'BUILDING_SENSHI_WAJO');
--==========================================================================================================================	
-- Civilization_Religions
--==========================================================================================================================		
INSERT INTO Civilization_Religions 
			(CivilizationType, 					ReligionType)
SELECT		'CIVILIZATION_SENSHI_HIDEYOSHI', 	ReligionType
FROM Civilization_Religions WHERE (CivilizationType = 'CIVILIZATION_JAPAN');
--==========================================================================================================================	
-- Civilization_SpyNames
--==========================================================================================================================		
INSERT INTO Civilization_SpyNames 
			(CivilizationType, 					SpyName)
VALUES		('CIVILIZATION_SENSHI_HIDEYOSHI', 	'TXT_KEY_SPY_NAME_SENSHI_HIDEYOSHI_0'),	
			('CIVILIZATION_SENSHI_HIDEYOSHI', 	'TXT_KEY_SPY_NAME_SENSHI_HIDEYOSHI_1'),
			('CIVILIZATION_SENSHI_HIDEYOSHI', 	'TXT_KEY_SPY_NAME_SENSHI_HIDEYOSHI_2'),
			('CIVILIZATION_SENSHI_HIDEYOSHI', 	'TXT_KEY_SPY_NAME_SENSHI_HIDEYOSHI_3'),
			('CIVILIZATION_SENSHI_HIDEYOSHI', 	'TXT_KEY_SPY_NAME_SENSHI_HIDEYOSHI_4'),
			('CIVILIZATION_SENSHI_HIDEYOSHI', 	'TXT_KEY_SPY_NAME_SENSHI_HIDEYOSHI_5'),
			('CIVILIZATION_SENSHI_HIDEYOSHI', 	'TXT_KEY_SPY_NAME_SENSHI_HIDEYOSHI_6'),
			('CIVILIZATION_SENSHI_HIDEYOSHI', 	'TXT_KEY_SPY_NAME_SENSHI_HIDEYOSHI_7'),
			('CIVILIZATION_SENSHI_HIDEYOSHI', 	'TXT_KEY_SPY_NAME_SENSHI_HIDEYOSHI_8'),
			('CIVILIZATION_SENSHI_HIDEYOSHI', 	'TXT_KEY_SPY_NAME_SENSHI_HIDEYOSHI_9');
--==========================================================================================================================		
--==========================================================================================================================						
			
			

