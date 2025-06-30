--==========================================================================================================================	
-- Civilizations
--==========================================================================================================================				
INSERT INTO Civilizations 	
			(Type, 									Description, 								ShortDescription, 									Adjective, 											Civilopedia, 									CivilopediaTag, 						DefaultPlayerColor, 			ArtDefineTag, ArtStyleType,		ArtStyleSuffix, ArtStylePrefix, IconAtlas, 					PortraitIndex, 	AlphaIconAtlas, 					SoundtrackTag, 	MapImage, 					DawnOfManQuote, 						DawnOfManImage,		DawnOfManAudio)
SELECT		('CIVILIZATION_SENSHI_YUNNAN'), 		('TXT_KEY_CIV_SENSHI_YUNNAN_DESC'), 		('TXT_KEY_CIV_SENSHI_YUNNAN_SHORT_DESC'),		('TXT_KEY_CIV_SENSHI_YUNNAN_ADJECTIVE'), 		('TXT_KEY_CIV5_SENSHI_YUNNAN_TEXT_1'), 		('TXT_KEY_CIV5_SENSHI_YUNNAN'), 		('PLAYERCOLOR_SENSHI_YUNNAN'), 		ArtDefineTag, ArtStyleType,		ArtStyleSuffix,	ArtStylePrefix,	('SENSHI_YUNNAN_ATLAS'), 		0, 				('SENSHI_YUNNAN_ALPHA_ATLAS'), 	('CHINA'), 	('YunnanMap412.dds'), 	('TXT_KEY_CIV5_DOM_SENSHI_LONG_YUN_TEXT'), 	('YunnanDoM.dds'),	('AS2D_DOM_SPEECH_SENSHI_LONG_YUN')
FROM Civilizations WHERE (Type = 'CIVILIZATION_CHINA');

UPDATE Civilizations 
SET ArtStyleSuffix = (CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = '_CHINA' )
	THEN '_CHINA'
	ELSE '_ASIA' END) 
WHERE Type = 'CIVILIZATION_SENSHI_YUNNAN';
--==========================================================================================================================	
-- Civilization_CityNames
--==========================================================================================================================			
INSERT INTO Civilization_CityNames 
			(CivilizationType, 			 CityName)
VALUES		('CIVILIZATION_SENSHI_YUNNAN', 	'TXT_KEY_CITY_NAME_SENSHI_YUNNAN_01'),
			('CIVILIZATION_SENSHI_YUNNAN', 	'TXT_KEY_CITY_NAME_SENSHI_YUNNAN_02'),
			('CIVILIZATION_SENSHI_YUNNAN', 	'TXT_KEY_CITY_NAME_SENSHI_YUNNAN_03'),
			('CIVILIZATION_SENSHI_YUNNAN', 	'TXT_KEY_CITY_NAME_SENSHI_YUNNAN_04'),
			('CIVILIZATION_SENSHI_YUNNAN', 	'TXT_KEY_CITY_NAME_SENSHI_YUNNAN_05'),
			('CIVILIZATION_SENSHI_YUNNAN', 	'TXT_KEY_CITY_NAME_SENSHI_YUNNAN_06'),
			('CIVILIZATION_SENSHI_YUNNAN', 	'TXT_KEY_CITY_NAME_SENSHI_YUNNAN_07'),
			('CIVILIZATION_SENSHI_YUNNAN', 	'TXT_KEY_CITY_NAME_SENSHI_YUNNAN_08'),
			('CIVILIZATION_SENSHI_YUNNAN', 	'TXT_KEY_CITY_NAME_SENSHI_YUNNAN_09'),
			('CIVILIZATION_SENSHI_YUNNAN', 	'TXT_KEY_CITY_NAME_SENSHI_YUNNAN_10'),
			('CIVILIZATION_SENSHI_YUNNAN', 	'TXT_KEY_CITY_NAME_SENSHI_YUNNAN_11'),
			('CIVILIZATION_SENSHI_YUNNAN', 	'TXT_KEY_CITY_NAME_SENSHI_YUNNAN_12'),
			('CIVILIZATION_SENSHI_YUNNAN', 	'TXT_KEY_CITY_NAME_SENSHI_YUNNAN_13'),
			('CIVILIZATION_SENSHI_YUNNAN', 	'TXT_KEY_CITY_NAME_SENSHI_YUNNAN_14'),
			('CIVILIZATION_SENSHI_YUNNAN', 	'TXT_KEY_CITY_NAME_SENSHI_YUNNAN_15'),
			('CIVILIZATION_SENSHI_YUNNAN', 	'TXT_KEY_CITY_NAME_SENSHI_YUNNAN_16'),
			('CIVILIZATION_SENSHI_YUNNAN', 	'TXT_KEY_CITY_NAME_SENSHI_YUNNAN_17'),
			('CIVILIZATION_SENSHI_YUNNAN', 	'TXT_KEY_CITY_NAME_SENSHI_YUNNAN_18'),
			('CIVILIZATION_SENSHI_YUNNAN', 	'TXT_KEY_CITY_NAME_SENSHI_YUNNAN_19'),
			('CIVILIZATION_SENSHI_YUNNAN', 	'TXT_KEY_CITY_NAME_SENSHI_YUNNAN_20'),
			('CIVILIZATION_SENSHI_YUNNAN', 	'TXT_KEY_CITY_NAME_SENSHI_YUNNAN_21'),
			('CIVILIZATION_SENSHI_YUNNAN', 	'TXT_KEY_CITY_NAME_SENSHI_YUNNAN_22'),
			('CIVILIZATION_SENSHI_YUNNAN', 	'TXT_KEY_CITY_NAME_SENSHI_YUNNAN_23'),
			('CIVILIZATION_SENSHI_YUNNAN', 	'TXT_KEY_CITY_NAME_SENSHI_YUNNAN_24'),
			('CIVILIZATION_SENSHI_YUNNAN', 	'TXT_KEY_CITY_NAME_SENSHI_YUNNAN_25'),
			('CIVILIZATION_SENSHI_YUNNAN', 	'TXT_KEY_CITY_NAME_SENSHI_YUNNAN_26'),
			('CIVILIZATION_SENSHI_YUNNAN', 	'TXT_KEY_CITY_NAME_SENSHI_YUNNAN_27'),
			('CIVILIZATION_SENSHI_YUNNAN', 	'TXT_KEY_CITY_NAME_SENSHI_YUNNAN_28');
--==========================================================================================================================	
-- Civilization_FreeBuildingClasses
--==========================================================================================================================			
INSERT INTO Civilization_FreeBuildingClasses 
			(CivilizationType, 					BuildingClassType)
SELECT		('CIVILIZATION_SENSHI_YUNNAN'), 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE (CivilizationType = 'CIVILIZATION_CHINA');
--==========================================================================================================================	
-- Civilization_FreeTechs
--==========================================================================================================================		
INSERT INTO Civilization_FreeTechs 
			(CivilizationType, 					TechType)
SELECT		('CIVILIZATION_SENSHI_YUNNAN'), 	TechType
FROM Civilization_FreeTechs WHERE (CivilizationType = 'CIVILIZATION_CHINA');
--==========================================================================================================================	
-- Civilization_FreeUnits
--==========================================================================================================================		
INSERT INTO Civilization_FreeUnits 
			(CivilizationType, 					UnitClassType, Count, UnitAIType)
SELECT		('CIVILIZATION_SENSHI_YUNNAN'), 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE (CivilizationType = 'CIVILIZATION_CHINA');
--==========================================================================================================================	
-- Civilization_Start_Region_Priority
--==========================================================================================================================			
INSERT INTO Civilization_Start_Region_Priority 
			(CivilizationType, 				RegionType)
VALUES		('CIVILIZATION_SENSHI_YUNNAN', 	'REGION_HILLS');	
--==========================================================================================================================	
-- Civilization_Leaders
--==========================================================================================================================			
INSERT INTO Civilization_Leaders 
			(CivilizationType, 					LeaderheadType)
VALUES		('CIVILIZATION_SENSHI_YUNNAN', 	'LEADER_SENSHI_LONG_YUN');	
--==========================================================================================================================	
-- Civilization_UnitClassOverrides 
--==========================================================================================================================		
INSERT INTO Civilization_UnitClassOverrides 
			(CivilizationType, 				UnitClassType, 					UnitType)
VALUES		('CIVILIZATION_SENSHI_YUNNAN', 	'UNITCLASS_GREAT_WAR_INFANTRY',	'UNIT_SENSHI_DIAN_CORPS');
--==========================================================================================================================	
-- Civilization_BuildingClassOverrides 
--==========================================================================================================================		
INSERT INTO Civilization_BuildingClassOverrides 
			(CivilizationType, 				BuildingClassType,			BuildingType)
VALUES		('CIVILIZATION_SENSHI_YUNNAN', 	'BUILDINGCLASS_AIRPORT',	'BUILDING_SENSHI_HUMP_AIRBASE');
--==========================================================================================================================	
-- Civilization_Religions
--==========================================================================================================================		
INSERT INTO Civilization_Religions 
			(CivilizationType, 				ReligionType)
VALUES		('CIVILIZATION_SENSHI_YUNNAN', 	'RELIGION_CONFUCIANISM');
--==========================================================================================================================	
-- Civilization_SpyNames
--==========================================================================================================================		
INSERT INTO Civilization_SpyNames 
			(CivilizationType, 					SpyName)
VALUES		('CIVILIZATION_SENSHI_YUNNAN', 	'TXT_KEY_SPY_NAME_SENSHI_YUNNAN_0'),	
			('CIVILIZATION_SENSHI_YUNNAN', 	'TXT_KEY_SPY_NAME_SENSHI_YUNNAN_1'),
			('CIVILIZATION_SENSHI_YUNNAN', 	'TXT_KEY_SPY_NAME_SENSHI_YUNNAN_2'),
			('CIVILIZATION_SENSHI_YUNNAN', 	'TXT_KEY_SPY_NAME_SENSHI_YUNNAN_3'),
			('CIVILIZATION_SENSHI_YUNNAN', 	'TXT_KEY_SPY_NAME_SENSHI_YUNNAN_4'),
			('CIVILIZATION_SENSHI_YUNNAN', 	'TXT_KEY_SPY_NAME_SENSHI_YUNNAN_5'),
			('CIVILIZATION_SENSHI_YUNNAN', 	'TXT_KEY_SPY_NAME_SENSHI_YUNNAN_6'),
			('CIVILIZATION_SENSHI_YUNNAN', 	'TXT_KEY_SPY_NAME_SENSHI_YUNNAN_7'),
			('CIVILIZATION_SENSHI_YUNNAN', 	'TXT_KEY_SPY_NAME_SENSHI_YUNNAN_8'),
			('CIVILIZATION_SENSHI_YUNNAN', 	'TXT_KEY_SPY_NAME_SENSHI_YUNNAN_9');
--==========================================================================================================================		
--==========================================================================================================================						
			
			

