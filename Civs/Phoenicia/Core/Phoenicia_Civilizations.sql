--==========================================================================================================================	
-- Civilizations
--==========================================================================================================================		
INSERT INTO Civilizations 	
			(Type, 								Description,							ShortDescription, 							Adjective, 								Civilopedia, 							CivilopediaTag, 					DefaultPlayerColor, 					ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas, 						PortraitIndex, 	AlphaIconAtlas, 						SoundtrackTag, 	MapImage, 					DawnOfManQuote, 							DawnOfManAudio,						DawnOfManImage)
SELECT		('CIVILIZATION_MC_PHOENICIA'), 		('TXT_KEY_MC_PHOENICIA_DESC'),			('TXT_KEY_MC_PHOENICIA_SHORT_DESC'), 		('TXT_KEY_MC_PHOENICIA_ADJ'),			('TXT_KEY_MC_PHOENICIA_DESC'), 			('TXT_KEY_CIV5_MC_PHOENICIA'), 		('PLAYERCOLOR_MC_PHOENICIA'), 			ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, ('MC_PHOENICIA_ATLAS'), 		0, 				('MC_PHOENICIA_ALPHA_ATLAS'), 			('Egypt'), 		('MC_PhoeniciaMap512.dds'),	('TXT_KEY_DAWN_OF_MAN_MC_PHOENICIA_TEXT'), 	('AS2D_DOM_SPEECH_MC_HIRAM'),		('MC_Phoenicia_DOM.dds')
FROM Civilizations WHERE (Type = 'CIVILIZATION_ASSYRIA');
--------------------------------	
-- Ethnic Units Support
--------------------------------	
UPDATE Civilizations 
SET ArtStyleSuffix = (CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = '_BABYLON' )
	THEN '_BABYLON'
	ELSE '_MED' END) 
WHERE Type = 'CIVILIZATION_MC_PHOENICIA';
--------------------------------
-- Map Labels Support
--------------------------------
CREATE TABLE IF NOT EXISTS ML_CivCultures(CivType, CultureType, CultureEra);
INSERT INTO ML_CivCultures
			(CivType,							CultureType,		CultureEra)
VALUES		('CIVILIZATION_MC_PHOENICIA',		'ARABIAN',			'ANY');
--------------------------------
-- Cultural Diversity Support
--------------------------------
CREATE TABLE IF NOT EXISTS Civilization_JFD_CultureTypes(CivilizationType, CultureType, SplashScreenTag, SoundtrackTag);
INSERT INTO Civilization_JFD_CultureTypes
            (CivilizationType,					CultureType,		SplashScreenTag,	SoundtrackTag)
VALUES      ('CIVILIZATION_MC_PHOENICIA',     	'JFD_Mesopotamic',  'JFD_Mesopotamic',	'JFD_Mesopotamic');
--==========================================================================================================================	
-- Civilization_CityNames
--==========================================================================================================================	
INSERT INTO Civilization_CityNames
			(CivilizationType, 				CityName)
VALUES		('CIVILIZATION_MC_PHOENICIA', 	'TXT_KEY_CITY_NAME_MC_PHOENICIA_TYRE'),
			('CIVILIZATION_MC_PHOENICIA', 	'TXT_KEY_CITY_NAME_MC_PHOENICIA_SIDON'),
			('CIVILIZATION_MC_PHOENICIA', 	'TXT_KEY_CITY_NAME_MC_PHOENICIA_BYBLOS'),
			('CIVILIZATION_MC_PHOENICIA', 	'TXT_KEY_CITY_NAME_MC_PHOENICIA_SAREPTA'),
			('CIVILIZATION_MC_PHOENICIA', 	'TXT_KEY_CITY_NAME_MC_PHOENICIA_BERYTOS'),
			('CIVILIZATION_MC_PHOENICIA', 	'TXT_KEY_CITY_NAME_MC_PHOENICIA_BAALBEK'),
			('CIVILIZATION_MC_PHOENICIA', 	'TXT_KEY_CITY_NAME_MC_PHOENICIA_AKKO'),
			('CIVILIZATION_MC_PHOENICIA', 	'TXT_KEY_CITY_NAME_MC_PHOENICIA_DOR'),
			('CIVILIZATION_MC_PHOENICIA', 	'TXT_KEY_CITY_NAME_MC_PHOENICIA_ARADOS'),
			('CIVILIZATION_MC_PHOENICIA', 	'TXT_KEY_CITY_NAME_MC_PHOENICIA_QART_HADASHT'),
			('CIVILIZATION_MC_PHOENICIA', 	'TXT_KEY_CITY_NAME_MC_PHOENICIA_LEPTIS'),
			('CIVILIZATION_MC_PHOENICIA', 	'TXT_KEY_CITY_NAME_MC_PHOENICIA_UTICA'),
			('CIVILIZATION_MC_PHOENICIA', 	'TXT_KEY_CITY_NAME_MC_PHOENICIA_KARALIS'),
			('CIVILIZATION_MC_PHOENICIA', 	'TXT_KEY_CITY_NAME_MC_PHOENICIA_HIPPO_REGIUS'),
			('CIVILIZATION_MC_PHOENICIA', 	'TXT_KEY_CITY_NAME_MC_PHOENICIA_OIA'),
			('CIVILIZATION_MC_PHOENICIA', 	'TXT_KEY_CITY_NAME_MC_PHOENICIA_SABRATHA'),
			('CIVILIZATION_MC_PHOENICIA', 	'TXT_KEY_CITY_NAME_MC_PHOENICIA_HADRUMENTUM'),
			('CIVILIZATION_MC_PHOENICIA', 	'TXT_KEY_CITY_NAME_MC_PHOENICIA_ICOSIUM'),
			('CIVILIZATION_MC_PHOENICIA', 	'TXT_KEY_CITY_NAME_MC_PHOENICIA_IOL'),
			('CIVILIZATION_MC_PHOENICIA', 	'TXT_KEY_CITY_NAME_MC_PHOENICIA_EBUSOS'),
			('CIVILIZATION_MC_PHOENICIA', 	'TXT_KEY_CITY_NAME_MC_PHOENICIA_THAPSOS'),
			('CIVILIZATION_MC_PHOENICIA', 	'TXT_KEY_CITY_NAME_MC_PHOENICIA_MELITA'),
			('CIVILIZATION_MC_PHOENICIA', 	'TXT_KEY_CITY_NAME_MC_PHOENICIA_PANORMOS'),
			('CIVILIZATION_MC_PHOENICIA', 	'TXT_KEY_CITY_NAME_MC_PHOENICIA_MOTZA'),
			('CIVILIZATION_MC_PHOENICIA', 	'TXT_KEY_CITY_NAME_MC_PHOENICIA_KOSSYRA'),
			('CIVILIZATION_MC_PHOENICIA', 	'TXT_KEY_CITY_NAME_MC_PHOENICIA_TARTESSOS'),
			('CIVILIZATION_MC_PHOENICIA', 	'TXT_KEY_CITY_NAME_MC_PHOENICIA_GADIR'),
			('CIVILIZATION_MC_PHOENICIA', 	'TXT_KEY_CITY_NAME_MC_PHOENICIA_MALACA'),
			('CIVILIZATION_MC_PHOENICIA', 	'TXT_KEY_CITY_NAME_MC_PHOENICIA_TINGIS'),
			('CIVILIZATION_MC_PHOENICIA', 	'TXT_KEY_CITY_NAME_MC_PHOENICIA_ZILI'),
			('CIVILIZATION_MC_PHOENICIA', 	'TXT_KEY_CITY_NAME_MC_PHOENICIA_LIXOS'),
			('CIVILIZATION_MC_PHOENICIA', 	'TXT_KEY_CITY_NAME_MC_PHOENICIA_CIRTA'),
			('CIVILIZATION_MC_PHOENICIA', 	'TXT_KEY_CITY_NAME_MC_PHOENICIA_IGILGILI'),
			('CIVILIZATION_MC_PHOENICIA', 	'TXT_KEY_CITY_NAME_MC_PHOENICIA_MELILLA'),
			('CIVILIZATION_MC_PHOENICIA', 	'TXT_KEY_CITY_NAME_MC_PHOENICIA_MAGADOR'),
			('CIVILIZATION_MC_PHOENICIA', 	'TXT_KEY_CITY_NAME_MC_PHOENICIA_THARROS');
--==========================================================================================================================	
-- Civilization_FreeBuildingClasses
--==========================================================================================================================			
INSERT INTO Civilization_FreeBuildingClasses 
			(CivilizationType, 					BuildingClassType)
SELECT		('CIVILIZATION_MC_PHOENICIA'), 		BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE (CivilizationType = 'CIVILIZATION_ASSYRIA');
--==========================================================================================================================	
-- Civilization_FreeTechs
--==========================================================================================================================		
INSERT INTO Civilization_FreeTechs 
			(CivilizationType, 					TechType)
SELECT		('CIVILIZATION_MC_PHOENICIA'), 		TechType
FROM Civilization_FreeTechs WHERE (CivilizationType = 'CIVILIZATION_ASSYRIA');
--==========================================================================================================================	
-- Civilization_FreeUnits
--==========================================================================================================================		
INSERT INTO Civilization_FreeUnits 
			(CivilizationType, 					UnitClassType, Count, UnitAIType)
SELECT		('CIVILIZATION_MC_PHOENICIA'), 		UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE (CivilizationType = 'CIVILIZATION_ASSYRIA');
--==========================================================================================================================	
-- Civilization_Leaders
--==========================================================================================================================		
INSERT INTO Civilization_Leaders 
			(CivilizationType, 					LeaderheadType)
VALUES		('CIVILIZATION_MC_PHOENICIA', 		'LEADER_MC_HIRAM');
--==========================================================================================================================	
-- Civilization_UnitClassOverrides 
--==========================================================================================================================		
INSERT INTO Civilization_UnitClassOverrides 
			(CivilizationType, 					UnitClassType, 			UnitType)
VALUES		('CIVILIZATION_MC_PHOENICIA', 		'UNITCLASS_MERCHANT', 	'UNIT_MC_TYRIAN_MERCHANT'),
			('CIVILIZATION_MC_PHOENICIA', 		'UNITCLASS_TRIREME', 	'UNIT_MC_PHOENICIA_BIREME');
--==========================================================================================================================	
-- Civilization_Religions
--==========================================================================================================================		
INSERT INTO Civilization_Religions 
			(CivilizationType, 					ReligionType)
VALUES		('CIVILIZATION_MC_PHOENICIA', 		'RELIGION_JUDAISM');
--==========================================================================================================================
-- Civilization_Start_Along_Ocean
--==========================================================================================================================	
INSERT INTO Civilization_Start_Along_Ocean 
			(CivilizationType, 				StartAlongOcean)
VALUES		('CIVILIZATION_MC_PHOENICIA', 	1);
--==========================================================================================================================	
-- Civilization_SpyNames
--==========================================================================================================================	
INSERT INTO Civilization_SpyNames 
			(CivilizationType, 			SpyName)
VALUES		('CIVILIZATION_MC_PHOENICIA', 		'TXT_KEY_SPY_NAME_MC_PHOENICIA_0'),
			('CIVILIZATION_MC_PHOENICIA', 		'TXT_KEY_SPY_NAME_MC_PHOENICIA_1'),
			('CIVILIZATION_MC_PHOENICIA', 		'TXT_KEY_SPY_NAME_MC_PHOENICIA_2'),
			('CIVILIZATION_MC_PHOENICIA', 		'TXT_KEY_SPY_NAME_MC_PHOENICIA_3'),
			('CIVILIZATION_MC_PHOENICIA', 		'TXT_KEY_SPY_NAME_MC_PHOENICIA_4'),
			('CIVILIZATION_MC_PHOENICIA', 		'TXT_KEY_SPY_NAME_MC_PHOENICIA_5'),
			('CIVILIZATION_MC_PHOENICIA', 		'TXT_KEY_SPY_NAME_MC_PHOENICIA_6'),
			('CIVILIZATION_MC_PHOENICIA', 		'TXT_KEY_SPY_NAME_MC_PHOENICIA_7'),
			('CIVILIZATION_MC_PHOENICIA', 		'TXT_KEY_SPY_NAME_MC_PHOENICIA_8'),
			('CIVILIZATION_MC_PHOENICIA', 		'TXT_KEY_SPY_NAME_MC_PHOENICIA_9');
--==========================================================================================================================		
--==========================================================================================================================