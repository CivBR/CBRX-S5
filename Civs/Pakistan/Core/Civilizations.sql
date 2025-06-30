--==========================================================================================================================	
-- Civilizations
--==========================================================================================================================				
INSERT INTO Civilizations 	
			(Type, 									Description, 								ShortDescription, 									Adjective, 									Civilopedia, 								CivilopediaTag, 					DefaultPlayerColor, 				ArtDefineTag, ArtStyleType,		ArtStyleSuffix, ArtStylePrefix, IconAtlas, 					PortraitIndex, 	AlphaIconAtlas, 					SoundtrackTag, 	MapImage, 					DawnOfManQuote, 						DawnOfManImage,		DawnOfManAudio)
SELECT		('CIVILIZATION_SENSHI_PAKISTAN'), 		('TXT_KEY_CIV_SENSHI_PAKISTAN_DESC'), 		('TXT_KEY_CIV_SENSHI_PAKISTAN_SHORT_DESC'),		('TXT_KEY_CIV_SENSHI_PAKISTAN_ADJECTIVE'), 		('TXT_KEY_CIV5_SENSHI_PAKISTAN_TEXT_1'), 		('TXT_KEY_CIV5_SENSHI_PAKISTAN'),		('PLAYERCOLOR_SENSHI_PAKISTAN'), 		ArtDefineTag, ArtStyleType,		ArtStyleSuffix,	ArtStylePrefix,	('SENSHI_PAKISTAN_ATLAS'), 		0, 				('SENSHI_PAKISTAN_ALPHA_ATLAS'), 	SoundtrackTag, 	('PakistanMap412.dds'), 	('TXT_KEY_CIV5_DOM_SENSHI_PAKISTAN_TEXT'), 	('JinnahDoM.dds'),	('AS2D_DOM_SPEECH_SENSHI_PAKISTAN')
FROM Civilizations WHERE (Type = 'CIVILIZATION_ARABIA');

UPDATE Civilizations 
SET ArtStyleSuffix = (CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = '_INDIA' )
	THEN '_INDIA'
	ELSE '_ASIA' END) 
WHERE Type = 'CIVILIZATION_SENSHI_PAKISTAN';
--==========================================================================================================================	
-- Civilization_CityNames
--==========================================================================================================================			
INSERT INTO Civilization_CityNames 
			(CivilizationType, 			 CityName)
VALUES		('CIVILIZATION_SENSHI_PAKISTAN', 	'TXT_KEY_CITY_NAME_SENSHI_PAKISTAN_01'),
			('CIVILIZATION_SENSHI_PAKISTAN', 	'TXT_KEY_CITY_NAME_SENSHI_PAKISTAN_02'),
			('CIVILIZATION_SENSHI_PAKISTAN', 	'TXT_KEY_CITY_NAME_SENSHI_PAKISTAN_03'),
			('CIVILIZATION_SENSHI_PAKISTAN', 	'TXT_KEY_CITY_NAME_SENSHI_PAKISTAN_04'),
			('CIVILIZATION_SENSHI_PAKISTAN', 	'TXT_KEY_CITY_NAME_SENSHI_PAKISTAN_05'),
			('CIVILIZATION_SENSHI_PAKISTAN', 	'TXT_KEY_CITY_NAME_SENSHI_PAKISTAN_06'),
			('CIVILIZATION_SENSHI_PAKISTAN', 	'TXT_KEY_CITY_NAME_SENSHI_PAKISTAN_07'),
			('CIVILIZATION_SENSHI_PAKISTAN', 	'TXT_KEY_CITY_NAME_SENSHI_PAKISTAN_08'),
			('CIVILIZATION_SENSHI_PAKISTAN', 	'TXT_KEY_CITY_NAME_SENSHI_PAKISTAN_09'),
			('CIVILIZATION_SENSHI_PAKISTAN', 	'TXT_KEY_CITY_NAME_SENSHI_PAKISTAN_10'),
			('CIVILIZATION_SENSHI_PAKISTAN', 	'TXT_KEY_CITY_NAME_SENSHI_PAKISTAN_11'),
			('CIVILIZATION_SENSHI_PAKISTAN', 	'TXT_KEY_CITY_NAME_SENSHI_PAKISTAN_12'),
			('CIVILIZATION_SENSHI_PAKISTAN', 	'TXT_KEY_CITY_NAME_SENSHI_PAKISTAN_13'),
			('CIVILIZATION_SENSHI_PAKISTAN', 	'TXT_KEY_CITY_NAME_SENSHI_PAKISTAN_14'),
			('CIVILIZATION_SENSHI_PAKISTAN', 	'TXT_KEY_CITY_NAME_SENSHI_PAKISTAN_15'),
			('CIVILIZATION_SENSHI_PAKISTAN', 	'TXT_KEY_CITY_NAME_SENSHI_PAKISTAN_16'),
			('CIVILIZATION_SENSHI_PAKISTAN', 	'TXT_KEY_CITY_NAME_SENSHI_PAKISTAN_17'),
			('CIVILIZATION_SENSHI_PAKISTAN', 	'TXT_KEY_CITY_NAME_SENSHI_PAKISTAN_18'),
			('CIVILIZATION_SENSHI_PAKISTAN', 	'TXT_KEY_CITY_NAME_SENSHI_PAKISTAN_19'),
			('CIVILIZATION_SENSHI_PAKISTAN', 	'TXT_KEY_CITY_NAME_SENSHI_PAKISTAN_20'),
			('CIVILIZATION_SENSHI_PAKISTAN', 	'TXT_KEY_CITY_NAME_SENSHI_PAKISTAN_21'),
			('CIVILIZATION_SENSHI_PAKISTAN', 	'TXT_KEY_CITY_NAME_SENSHI_PAKISTAN_22'),
			('CIVILIZATION_SENSHI_PAKISTAN', 	'TXT_KEY_CITY_NAME_SENSHI_PAKISTAN_23'),
			('CIVILIZATION_SENSHI_PAKISTAN', 	'TXT_KEY_CITY_NAME_SENSHI_PAKISTAN_24'),
			('CIVILIZATION_SENSHI_PAKISTAN', 	'TXT_KEY_CITY_NAME_SENSHI_PAKISTAN_25'),
			('CIVILIZATION_SENSHI_PAKISTAN', 	'TXT_KEY_CITY_NAME_SENSHI_PAKISTAN_26'),
			('CIVILIZATION_SENSHI_PAKISTAN', 	'TXT_KEY_CITY_NAME_SENSHI_PAKISTAN_27'),
			('CIVILIZATION_SENSHI_PAKISTAN', 	'TXT_KEY_CITY_NAME_SENSHI_PAKISTAN_28'),
			('CIVILIZATION_SENSHI_PAKISTAN', 	'TXT_KEY_CITY_NAME_SENSHI_PAKISTAN_29'),
			('CIVILIZATION_SENSHI_PAKISTAN', 	'TXT_KEY_CITY_NAME_SENSHI_PAKISTAN_30'),
			('CIVILIZATION_SENSHI_PAKISTAN', 	'TXT_KEY_CITY_NAME_SENSHI_PAKISTAN_31'),
			('CIVILIZATION_SENSHI_PAKISTAN', 	'TXT_KEY_CITY_NAME_SENSHI_PAKISTAN_32'),
			('CIVILIZATION_SENSHI_PAKISTAN', 	'TXT_KEY_CITY_NAME_SENSHI_PAKISTAN_33'),
			('CIVILIZATION_SENSHI_PAKISTAN', 	'TXT_KEY_CITY_NAME_SENSHI_PAKISTAN_34'),
			('CIVILIZATION_SENSHI_PAKISTAN', 	'TXT_KEY_CITY_NAME_SENSHI_PAKISTAN_35'),
			('CIVILIZATION_SENSHI_PAKISTAN', 	'TXT_KEY_CITY_NAME_SENSHI_PAKISTAN_36'),
			('CIVILIZATION_SENSHI_PAKISTAN', 	'TXT_KEY_CITY_NAME_SENSHI_PAKISTAN_37'),
			('CIVILIZATION_SENSHI_PAKISTAN', 	'TXT_KEY_CITY_NAME_SENSHI_PAKISTAN_38'),
			('CIVILIZATION_SENSHI_PAKISTAN', 	'TXT_KEY_CITY_NAME_SENSHI_PAKISTAN_39'),
			('CIVILIZATION_SENSHI_PAKISTAN', 	'TXT_KEY_CITY_NAME_SENSHI_PAKISTAN_40');
--==========================================================================================================================	
-- Civilization_FreeBuildingClasses
--==========================================================================================================================			
INSERT INTO Civilization_FreeBuildingClasses 
			(CivilizationType, 					BuildingClassType)
SELECT		('CIVILIZATION_SENSHI_PAKISTAN'), 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE (CivilizationType = 'CIVILIZATION_ARABIA');
--==========================================================================================================================	
-- Civilization_FreeTechs
--==========================================================================================================================		
INSERT INTO Civilization_FreeTechs 
			(CivilizationType, 					TechType)
SELECT		('CIVILIZATION_SENSHI_PAKISTAN'), 	TechType
FROM Civilization_FreeTechs WHERE (CivilizationType = 'CIVILIZATION_ARABIA');
--==========================================================================================================================	
-- Civilization_FreeUnits
--==========================================================================================================================		
INSERT INTO Civilization_FreeUnits 
			(CivilizationType, 					UnitClassType, Count, UnitAIType)
SELECT		('CIVILIZATION_SENSHI_PAKISTAN'), 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE (CivilizationType = 'CIVILIZATION_ARABIA');
--==========================================================================================================================	
-- Civilization_Start_Along_River
--==========================================================================================================================			
INSERT INTO Civilization_Start_Along_River
			(CivilizationType, 					StartAlongRiver)
VALUES		('CIVILIZATION_SENSHI_PAKISTAN', 	1);	
--==========================================================================================================================	
-- Civilization_Leaders
--==========================================================================================================================			
INSERT INTO Civilization_Leaders 
			(CivilizationType, 					LeaderheadType)
VALUES		('CIVILIZATION_SENSHI_PAKISTAN', 	'LEADER_SENSHI_JINNAH');	
--==========================================================================================================================	
-- Civilization_UnitClassOverrides 
--==========================================================================================================================		
INSERT INTO Civilization_UnitClassOverrides 
			(CivilizationType, 				UnitClassType, 				UnitType)
VALUES		('CIVILIZATION_SENSHI_PAKISTAN', 	'UNITCLASS_PARATROOPER',	'UNIT_SENSHI_POLICE_RANGER');
--==========================================================================================================================	
-- Civilization_BuildingClassOverrides 
--==========================================================================================================================		
INSERT INTO Civilization_BuildingClassOverrides 
			(CivilizationType, 					BuildingClassType, 			BuildingType)
VALUES		('CIVILIZATION_SENSHI_PAKISTAN', 	'BUILDINGCLASS_CONSTABLE',	'BUILDING_SENSHI_URDU_SOCIETY');
--==========================================================================================================================	
-- Civilization_Religions
--==========================================================================================================================		
INSERT INTO Civilization_Religions 
			(CivilizationType, 					ReligionType)
SELECT		'CIVILIZATION_SENSHI_PAKISTAN', 	ReligionType
FROM Civilization_Religions WHERE (CivilizationType = 'CIVILIZATION_ARABIA');
--==========================================================================================================================	
-- Civilization_SpyNames
--==========================================================================================================================		
INSERT INTO Civilization_SpyNames 
			(CivilizationType, 					SpyName)
VALUES		('CIVILIZATION_SENSHI_PAKISTAN', 	'TXT_KEY_SPY_NAME_SENSHI_PAKISTAN_0'),	
			('CIVILIZATION_SENSHI_PAKISTAN', 	'TXT_KEY_SPY_NAME_SENSHI_PAKISTAN_1'),
			('CIVILIZATION_SENSHI_PAKISTAN', 	'TXT_KEY_SPY_NAME_SENSHI_PAKISTAN_2'),
			('CIVILIZATION_SENSHI_PAKISTAN', 	'TXT_KEY_SPY_NAME_SENSHI_PAKISTAN_3'),
			('CIVILIZATION_SENSHI_PAKISTAN', 	'TXT_KEY_SPY_NAME_SENSHI_PAKISTAN_4'),
			('CIVILIZATION_SENSHI_PAKISTAN', 	'TXT_KEY_SPY_NAME_SENSHI_PAKISTAN_5'),
			('CIVILIZATION_SENSHI_PAKISTAN', 	'TXT_KEY_SPY_NAME_SENSHI_PAKISTAN_6'),
			('CIVILIZATION_SENSHI_PAKISTAN', 	'TXT_KEY_SPY_NAME_SENSHI_PAKISTAN_7'),
			('CIVILIZATION_SENSHI_PAKISTAN', 	'TXT_KEY_SPY_NAME_SENSHI_PAKISTAN_8'),
			('CIVILIZATION_SENSHI_PAKISTAN', 	'TXT_KEY_SPY_NAME_SENSHI_PAKISTAN_9');
--==========================================================================================================================		
--==========================================================================================================================						
			
			

