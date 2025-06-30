--==========================================================================================================================	
-- Civilizations
--==========================================================================================================================				
INSERT INTO Civilizations 	
			(Type, 									Description, 								ShortDescription, 									Adjective, 									Civilopedia, 								CivilopediaTag, 					DefaultPlayerColor, 				ArtDefineTag, ArtStyleType,		ArtStyleSuffix, ArtStylePrefix, IconAtlas, 					PortraitIndex, 	AlphaIconAtlas, 					SoundtrackTag, 	MapImage, 					DawnOfManQuote, 						DawnOfManImage,		DawnOfManAudio)
SELECT		('CIVILIZATION_SENSHI_BANGLADESH'), 		('TXT_KEY_CIV_SENSHI_BANGLADESH_DESC'), 		('TXT_KEY_CIV_SENSHI_BANGLADESH_SHORT_DESC'),		('TXT_KEY_CIV_SENSHI_BANGLADESH_ADJECTIVE'), 		('TXT_KEY_CIV5_SENSHI_BANGLADESH_TEXT_1'), 		('TXT_KEY_CIV5_SENSHI_BANGLADESH'),		('PLAYERCOLOR_SENSHI_BANGLADESH'), 		ArtDefineTag, ArtStyleType,		ArtStyleSuffix,	ArtStylePrefix,	('SENSHI_BANGLADESH_ATLAS'), 		0, 				('SENSHI_BANGLADESH_ALPHA_ATLAS'), 	SoundtrackTag, 	('BangladeshMap.dds'), 	('TXT_KEY_CIV5_DOM_SENSHI_BANGLADESH_TEXT'), 	('BangladeshDoM.dds'),	('AS2D_DOM_SPEECH_SENSHI_BANGLADESH')
FROM Civilizations WHERE (Type = 'CIVILIZATION_ARABIA');

UPDATE Civilizations 
SET ArtStyleSuffix = (CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = '_INDIA' )
	THEN '_INDIA'
	ELSE '_ASIA' END) 
WHERE Type = 'CIVILIZATION_SENSHI_BANGLADESH';
--==========================================================================================================================	
-- Civilization_CityNames
--==========================================================================================================================			
INSERT INTO Civilization_CityNames 
			(CivilizationType, 			 CityName)
VALUES		('CIVILIZATION_SENSHI_BANGLADESH', 	'TXT_KEY_CITY_NAME_SENSHI_BANGLADESH_01'),
			('CIVILIZATION_SENSHI_BANGLADESH', 	'TXT_KEY_CITY_NAME_SENSHI_BANGLADESH_02'),
			('CIVILIZATION_SENSHI_BANGLADESH', 	'TXT_KEY_CITY_NAME_SENSHI_BANGLADESH_03'),
			('CIVILIZATION_SENSHI_BANGLADESH', 	'TXT_KEY_CITY_NAME_SENSHI_BANGLADESH_04'),
			('CIVILIZATION_SENSHI_BANGLADESH', 	'TXT_KEY_CITY_NAME_SENSHI_BANGLADESH_05'),
			('CIVILIZATION_SENSHI_BANGLADESH', 	'TXT_KEY_CITY_NAME_SENSHI_BANGLADESH_06'),
			('CIVILIZATION_SENSHI_BANGLADESH', 	'TXT_KEY_CITY_NAME_SENSHI_BANGLADESH_07'),
			('CIVILIZATION_SENSHI_BANGLADESH', 	'TXT_KEY_CITY_NAME_SENSHI_BANGLADESH_08'),
			('CIVILIZATION_SENSHI_BANGLADESH', 	'TXT_KEY_CITY_NAME_SENSHI_BANGLADESH_09'),
			('CIVILIZATION_SENSHI_BANGLADESH', 	'TXT_KEY_CITY_NAME_SENSHI_BANGLADESH_10'),
			('CIVILIZATION_SENSHI_BANGLADESH', 	'TXT_KEY_CITY_NAME_SENSHI_BANGLADESH_11'),
			('CIVILIZATION_SENSHI_BANGLADESH', 	'TXT_KEY_CITY_NAME_SENSHI_BANGLADESH_12'),
			('CIVILIZATION_SENSHI_BANGLADESH', 	'TXT_KEY_CITY_NAME_SENSHI_BANGLADESH_13'),
			('CIVILIZATION_SENSHI_BANGLADESH', 	'TXT_KEY_CITY_NAME_SENSHI_BANGLADESH_14'),
			('CIVILIZATION_SENSHI_BANGLADESH', 	'TXT_KEY_CITY_NAME_SENSHI_BANGLADESH_15'),
			('CIVILIZATION_SENSHI_BANGLADESH', 	'TXT_KEY_CITY_NAME_SENSHI_BANGLADESH_16'),
			('CIVILIZATION_SENSHI_BANGLADESH', 	'TXT_KEY_CITY_NAME_SENSHI_BANGLADESH_17'),
			('CIVILIZATION_SENSHI_BANGLADESH', 	'TXT_KEY_CITY_NAME_SENSHI_BANGLADESH_18'),
			('CIVILIZATION_SENSHI_BANGLADESH', 	'TXT_KEY_CITY_NAME_SENSHI_BANGLADESH_19'),
			('CIVILIZATION_SENSHI_BANGLADESH', 	'TXT_KEY_CITY_NAME_SENSHI_BANGLADESH_20'),
			('CIVILIZATION_SENSHI_BANGLADESH', 	'TXT_KEY_CITY_NAME_SENSHI_BANGLADESH_21'),
			('CIVILIZATION_SENSHI_BANGLADESH', 	'TXT_KEY_CITY_NAME_SENSHI_BANGLADESH_22'),
			('CIVILIZATION_SENSHI_BANGLADESH', 	'TXT_KEY_CITY_NAME_SENSHI_BANGLADESH_23'),
			('CIVILIZATION_SENSHI_BANGLADESH', 	'TXT_KEY_CITY_NAME_SENSHI_BANGLADESH_24'),
			('CIVILIZATION_SENSHI_BANGLADESH', 	'TXT_KEY_CITY_NAME_SENSHI_BANGLADESH_25'),
			('CIVILIZATION_SENSHI_BANGLADESH', 	'TXT_KEY_CITY_NAME_SENSHI_BANGLADESH_26'),
			('CIVILIZATION_SENSHI_BANGLADESH', 	'TXT_KEY_CITY_NAME_SENSHI_BANGLADESH_27'),
			('CIVILIZATION_SENSHI_BANGLADESH', 	'TXT_KEY_CITY_NAME_SENSHI_BANGLADESH_28'),
			('CIVILIZATION_SENSHI_BANGLADESH', 	'TXT_KEY_CITY_NAME_SENSHI_BANGLADESH_29'),
			('CIVILIZATION_SENSHI_BANGLADESH', 	'TXT_KEY_CITY_NAME_SENSHI_BANGLADESH_30'),
			('CIVILIZATION_SENSHI_BANGLADESH', 	'TXT_KEY_CITY_NAME_SENSHI_BANGLADESH_31'),
			('CIVILIZATION_SENSHI_BANGLADESH', 	'TXT_KEY_CITY_NAME_SENSHI_BANGLADESH_32'),
			('CIVILIZATION_SENSHI_BANGLADESH', 	'TXT_KEY_CITY_NAME_SENSHI_BANGLADESH_33'),
			('CIVILIZATION_SENSHI_BANGLADESH', 	'TXT_KEY_CITY_NAME_SENSHI_BANGLADESH_34');
--==========================================================================================================================	
-- Civilization_FreeBuildingClasses
--==========================================================================================================================			
INSERT INTO Civilization_FreeBuildingClasses 
			(CivilizationType, 					BuildingClassType)
SELECT		('CIVILIZATION_SENSHI_BANGLADESH'), 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE (CivilizationType = 'CIVILIZATION_INDIA');
--==========================================================================================================================	
-- Civilization_FreeTechs
--==========================================================================================================================		
INSERT INTO Civilization_FreeTechs 
			(CivilizationType, 					TechType)
SELECT		('CIVILIZATION_SENSHI_BANGLADESH'), 	TechType
FROM Civilization_FreeTechs WHERE (CivilizationType = 'CIVILIZATION_INDIA');
--==========================================================================================================================	
-- Civilization_FreeUnits
--==========================================================================================================================		
INSERT INTO Civilization_FreeUnits 
			(CivilizationType, 					UnitClassType, Count, UnitAIType)
SELECT		('CIVILIZATION_SENSHI_BANGLADESH'), 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE (CivilizationType = 'CIVILIZATION_INDIA');
--==========================================================================================================================	
-- Civilization_Start_Along_River
--==========================================================================================================================			
INSERT INTO Civilization_Start_Along_River
			(CivilizationType, 					StartAlongRiver)
VALUES		('CIVILIZATION_SENSHI_BANGLADESH', 	1);	
--==========================================================================================================================	
-- Civilization_Leaders
--==========================================================================================================================			
INSERT INTO Civilization_Leaders 
			(CivilizationType, 					LeaderheadType)
VALUES		('CIVILIZATION_SENSHI_BANGLADESH', 	'LEADER_SENSHI_MUJIBUR_RAHMAN');	
--==========================================================================================================================	
-- Civilization_UnitClassOverrides 
--==========================================================================================================================		
INSERT INTO Civilization_UnitClassOverrides 
			(CivilizationType, 				UnitClassType, 				UnitType)
VALUES		('CIVILIZATION_SENSHI_BANGLADESH', 	'UNITCLASS_MACHINE_GUN',	'UNIT_SENSHI_MUKTI_BAHINI');
--==========================================================================================================================	
-- Civilization_BuildingClassOverrides 
--==========================================================================================================================		
INSERT INTO Civilization_BuildingClassOverrides 
			(CivilizationType, 					BuildingClassType, 			BuildingType)
VALUES		('CIVILIZATION_SENSHI_BANGLADESH', 	'BUILDINGCLASS_CONSTABLE',	'BUILDING_SENSHI_MONUMENT_OF_MARTYRS');
--==========================================================================================================================	
-- Civilization_Religions
--==========================================================================================================================		
INSERT INTO Civilization_Religions 
			(CivilizationType, 					ReligionType)
SELECT		'CIVILIZATION_SENSHI_BANGLADESH', 	ReligionType
FROM Civilization_Religions WHERE (CivilizationType = 'CIVILIZATION_ARABIA');
--==========================================================================================================================	
-- Civilization_SpyNames
--==========================================================================================================================		
INSERT INTO Civilization_SpyNames 
			(CivilizationType, 					SpyName)
VALUES		('CIVILIZATION_SENSHI_BANGLADESH', 	'TXT_KEY_SPY_NAME_SENSHI_BANGLADESH_0'),	
			('CIVILIZATION_SENSHI_BANGLADESH', 	'TXT_KEY_SPY_NAME_SENSHI_BANGLADESH_1'),
			('CIVILIZATION_SENSHI_BANGLADESH', 	'TXT_KEY_SPY_NAME_SENSHI_BANGLADESH_2'),
			('CIVILIZATION_SENSHI_BANGLADESH', 	'TXT_KEY_SPY_NAME_SENSHI_BANGLADESH_3'),
			('CIVILIZATION_SENSHI_BANGLADESH', 	'TXT_KEY_SPY_NAME_SENSHI_BANGLADESH_4'),
			('CIVILIZATION_SENSHI_BANGLADESH', 	'TXT_KEY_SPY_NAME_SENSHI_BANGLADESH_5'),
			('CIVILIZATION_SENSHI_BANGLADESH', 	'TXT_KEY_SPY_NAME_SENSHI_BANGLADESH_6'),
			('CIVILIZATION_SENSHI_BANGLADESH', 	'TXT_KEY_SPY_NAME_SENSHI_BANGLADESH_7'),
			('CIVILIZATION_SENSHI_BANGLADESH', 	'TXT_KEY_SPY_NAME_SENSHI_BANGLADESH_8'),
			('CIVILIZATION_SENSHI_BANGLADESH', 	'TXT_KEY_SPY_NAME_SENSHI_BANGLADESH_9');
--==========================================================================================================================		
--==========================================================================================================================						
			
			

