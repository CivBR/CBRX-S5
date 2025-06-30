--==========================================================================================================================	
-- Civilizations
--==========================================================================================================================				
INSERT INTO Civilizations 	
			(Type, 									Description, 								ShortDescription, 									Adjective, 									Civilopedia, 								CivilopediaTag, 					DefaultPlayerColor, 				ArtDefineTag, ArtStyleType,		ArtStyleSuffix, ArtStylePrefix, IconAtlas, 					PortraitIndex, 	AlphaIconAtlas, 					SoundtrackTag, 	MapImage, 					DawnOfManQuote, 						DawnOfManImage,		DawnOfManAudio)
SELECT		('CIVILIZATION_SENSHI_NEW_SOUTH_WALES'), 		('TXT_KEY_CIV_SENSHI_NEW_SOUTH_WALES_DESC'), 		('TXT_KEY_CIV_SENSHI_NEW_SOUTH_WALES_SHORT_DESC'),		('TXT_KEY_CIV_SENSHI_NEW_SOUTH_WALES_ADJECTIVE'), 		('TXT_KEY_CIV5_SENSHI_NEW_SOUTH_WALES_TEXT_1'), 		('TXT_KEY_CIV5_SENSHI_NEW_SOUTH_WALES'),		('PLAYERCOLOR_SENSHI_NEW_SOUTH_WALES'), 		ArtDefineTag, ArtStyleType,		ArtStyleSuffix,	ArtStylePrefix,	('SENSHI_NEW_SOUTH_WALES_ATLAS'), 		0, 				('SENSHI_NEW_SOUTH_WALES_ALPHA_ATLAS'), 	SoundtrackTag, 	('NSWMap412.dds'), 	('TXT_KEY_CIV5_DOM_SENSHI_NEW_SOUTH_WALES_TEXT'), 	('MacarthurNSWDoM.dds'),	('AS2D_DOM_SPEECH_SENSHI_NEW_SOUTH_WALES')
FROM Civilizations WHERE (Type = 'CIVILIZATION_ENGLAND');

UPDATE Civilizations 
SET ArtStyleSuffix = (CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = '_ENGLAND' )
	THEN '_ENGLAND'
	ELSE '_EURO' END) 
WHERE Type = 'CIVILIZATION_SENSHI_NEW_SOUTH_WALES';
--==========================================================================================================================	
-- Civilization_CityNames
--==========================================================================================================================			
INSERT INTO Civilization_CityNames 
			(CivilizationType, 			 CityName)
VALUES		('CIVILIZATION_SENSHI_NEW_SOUTH_WALES', 	'TXT_KEY_CITY_NAME_SENSHI_NEW_SOUTH_WALES_01'),
			('CIVILIZATION_SENSHI_NEW_SOUTH_WALES', 	'TXT_KEY_CITY_NAME_SENSHI_NEW_SOUTH_WALES_02'),
			('CIVILIZATION_SENSHI_NEW_SOUTH_WALES', 	'TXT_KEY_CITY_NAME_SENSHI_NEW_SOUTH_WALES_03'),
			('CIVILIZATION_SENSHI_NEW_SOUTH_WALES', 	'TXT_KEY_CITY_NAME_SENSHI_NEW_SOUTH_WALES_04'),
			('CIVILIZATION_SENSHI_NEW_SOUTH_WALES', 	'TXT_KEY_CITY_NAME_SENSHI_NEW_SOUTH_WALES_05'),
			('CIVILIZATION_SENSHI_NEW_SOUTH_WALES', 	'TXT_KEY_CITY_NAME_SENSHI_NEW_SOUTH_WALES_06'),
			('CIVILIZATION_SENSHI_NEW_SOUTH_WALES', 	'TXT_KEY_CITY_NAME_SENSHI_NEW_SOUTH_WALES_07'),
			('CIVILIZATION_SENSHI_NEW_SOUTH_WALES', 	'TXT_KEY_CITY_NAME_SENSHI_NEW_SOUTH_WALES_08'),
			('CIVILIZATION_SENSHI_NEW_SOUTH_WALES', 	'TXT_KEY_CITY_NAME_SENSHI_NEW_SOUTH_WALES_09'),
			('CIVILIZATION_SENSHI_NEW_SOUTH_WALES', 	'TXT_KEY_CITY_NAME_SENSHI_NEW_SOUTH_WALES_10'),
			('CIVILIZATION_SENSHI_NEW_SOUTH_WALES', 	'TXT_KEY_CITY_NAME_SENSHI_NEW_SOUTH_WALES_11'),
			('CIVILIZATION_SENSHI_NEW_SOUTH_WALES', 	'TXT_KEY_CITY_NAME_SENSHI_NEW_SOUTH_WALES_12'),
			('CIVILIZATION_SENSHI_NEW_SOUTH_WALES', 	'TXT_KEY_CITY_NAME_SENSHI_NEW_SOUTH_WALES_13'),
			('CIVILIZATION_SENSHI_NEW_SOUTH_WALES', 	'TXT_KEY_CITY_NAME_SENSHI_NEW_SOUTH_WALES_14'),
			('CIVILIZATION_SENSHI_NEW_SOUTH_WALES', 	'TXT_KEY_CITY_NAME_SENSHI_NEW_SOUTH_WALES_15'),
			('CIVILIZATION_SENSHI_NEW_SOUTH_WALES', 	'TXT_KEY_CITY_NAME_SENSHI_NEW_SOUTH_WALES_16'),
			('CIVILIZATION_SENSHI_NEW_SOUTH_WALES', 	'TXT_KEY_CITY_NAME_SENSHI_NEW_SOUTH_WALES_17'),
			('CIVILIZATION_SENSHI_NEW_SOUTH_WALES', 	'TXT_KEY_CITY_NAME_SENSHI_NEW_SOUTH_WALES_18'),
			('CIVILIZATION_SENSHI_NEW_SOUTH_WALES', 	'TXT_KEY_CITY_NAME_SENSHI_NEW_SOUTH_WALES_19'),
			('CIVILIZATION_SENSHI_NEW_SOUTH_WALES', 	'TXT_KEY_CITY_NAME_SENSHI_NEW_SOUTH_WALES_20'),
			('CIVILIZATION_SENSHI_NEW_SOUTH_WALES', 	'TXT_KEY_CITY_NAME_SENSHI_NEW_SOUTH_WALES_21'),
			('CIVILIZATION_SENSHI_NEW_SOUTH_WALES', 	'TXT_KEY_CITY_NAME_SENSHI_NEW_SOUTH_WALES_22'),
			('CIVILIZATION_SENSHI_NEW_SOUTH_WALES', 	'TXT_KEY_CITY_NAME_SENSHI_NEW_SOUTH_WALES_23'),
			('CIVILIZATION_SENSHI_NEW_SOUTH_WALES', 	'TXT_KEY_CITY_NAME_SENSHI_NEW_SOUTH_WALES_24'),
			('CIVILIZATION_SENSHI_NEW_SOUTH_WALES', 	'TXT_KEY_CITY_NAME_SENSHI_NEW_SOUTH_WALES_25'),
			('CIVILIZATION_SENSHI_NEW_SOUTH_WALES', 	'TXT_KEY_CITY_NAME_SENSHI_NEW_SOUTH_WALES_26'),
			('CIVILIZATION_SENSHI_NEW_SOUTH_WALES', 	'TXT_KEY_CITY_NAME_SENSHI_NEW_SOUTH_WALES_27'),
			('CIVILIZATION_SENSHI_NEW_SOUTH_WALES', 	'TXT_KEY_CITY_NAME_SENSHI_NEW_SOUTH_WALES_28'),
			('CIVILIZATION_SENSHI_NEW_SOUTH_WALES', 	'TXT_KEY_CITY_NAME_SENSHI_NEW_SOUTH_WALES_29'),
			('CIVILIZATION_SENSHI_NEW_SOUTH_WALES', 	'TXT_KEY_CITY_NAME_SENSHI_NEW_SOUTH_WALES_30'),
			('CIVILIZATION_SENSHI_NEW_SOUTH_WALES', 	'TXT_KEY_CITY_NAME_SENSHI_NEW_SOUTH_WALES_31');
--==========================================================================================================================	
-- Civilization_FreeBuildingClasses
--==========================================================================================================================			
INSERT INTO Civilization_FreeBuildingClasses 
			(CivilizationType, 					BuildingClassType)
SELECT		('CIVILIZATION_SENSHI_NEW_SOUTH_WALES'), 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE (CivilizationType = 'CIVILIZATION_ENGLAND');
--==========================================================================================================================	
-- Civilization_FreeTechs
--==========================================================================================================================		
INSERT INTO Civilization_FreeTechs 
			(CivilizationType, 					TechType)
SELECT		('CIVILIZATION_SENSHI_NEW_SOUTH_WALES'), 	TechType
FROM Civilization_FreeTechs WHERE (CivilizationType = 'CIVILIZATION_ENGLAND');
--==========================================================================================================================	
-- Civilization_FreeUnits
--==========================================================================================================================		
INSERT INTO Civilization_FreeUnits 
			(CivilizationType, 					UnitClassType, Count, UnitAIType)
SELECT		('CIVILIZATION_SENSHI_NEW_SOUTH_WALES'), 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE (CivilizationType = 'CIVILIZATION_ENGLAND');
--==========================================================================================================================	
-- Civilization_Start_Region_Priority
--==========================================================================================================================			
INSERT INTO Civilization_Start_Region_Priority 
			(CivilizationType, 							RegionType)
VALUES		('CIVILIZATION_SENSHI_NEW_SOUTH_WALES', 	'REGION_PLAINS');	
--==========================================================================================================================	
-- Civilization_Leaders
--==========================================================================================================================			
INSERT INTO Civilization_Leaders 
			(CivilizationType, 					LeaderheadType)
VALUES		('CIVILIZATION_SENSHI_NEW_SOUTH_WALES', 	'LEADER_SENSHI_MACARTHUR');	
--==========================================================================================================================	
-- Civilization_UnitClassOverrides 
--==========================================================================================================================		
INSERT INTO Civilization_UnitClassOverrides 
			(CivilizationType, 				UnitClassType, 				UnitType)
VALUES		('CIVILIZATION_SENSHI_NEW_SOUTH_WALES', 	'UNITCLASS_RIFLEMAN',	'UNIT_SENSHI_RUM_CORPS');
--==========================================================================================================================	
-- Civilization_BuildingClassOverrides 
--==========================================================================================================================		
INSERT INTO Civilization_BuildingClassOverrides 
			(CivilizationType, 					BuildingClassType, 			BuildingType)
VALUES		('CIVILIZATION_SENSHI_NEW_SOUTH_WALES', 	'BUILDINGCLASS_STABLE',		'BUILDING_SENSHI_SHEEP_STATION');
--==========================================================================================================================	
-- Civilization_Religions
--==========================================================================================================================		
INSERT INTO Civilization_Religions 
			(CivilizationType, 					ReligionType)
SELECT		'CIVILIZATION_SENSHI_NEW_SOUTH_WALES', 	ReligionType
FROM Civilization_Religions WHERE (CivilizationType = 'CIVILIZATION_ENGLAND');
--==========================================================================================================================	
-- Civilization_SpyNames
--==========================================================================================================================		
INSERT INTO Civilization_SpyNames 
			(CivilizationType, 					SpyName)
VALUES		('CIVILIZATION_SENSHI_NEW_SOUTH_WALES', 	'TXT_KEY_SPY_NAME_SENSHI_NEW_SOUTH_WALES_0'),	
			('CIVILIZATION_SENSHI_NEW_SOUTH_WALES', 	'TXT_KEY_SPY_NAME_SENSHI_NEW_SOUTH_WALES_1'),
			('CIVILIZATION_SENSHI_NEW_SOUTH_WALES', 	'TXT_KEY_SPY_NAME_SENSHI_NEW_SOUTH_WALES_2'),
			('CIVILIZATION_SENSHI_NEW_SOUTH_WALES', 	'TXT_KEY_SPY_NAME_SENSHI_NEW_SOUTH_WALES_3'),
			('CIVILIZATION_SENSHI_NEW_SOUTH_WALES', 	'TXT_KEY_SPY_NAME_SENSHI_NEW_SOUTH_WALES_4'),
			('CIVILIZATION_SENSHI_NEW_SOUTH_WALES', 	'TXT_KEY_SPY_NAME_SENSHI_NEW_SOUTH_WALES_5'),
			('CIVILIZATION_SENSHI_NEW_SOUTH_WALES', 	'TXT_KEY_SPY_NAME_SENSHI_NEW_SOUTH_WALES_6'),
			('CIVILIZATION_SENSHI_NEW_SOUTH_WALES', 	'TXT_KEY_SPY_NAME_SENSHI_NEW_SOUTH_WALES_7'),
			('CIVILIZATION_SENSHI_NEW_SOUTH_WALES', 	'TXT_KEY_SPY_NAME_SENSHI_NEW_SOUTH_WALES_8'),
			('CIVILIZATION_SENSHI_NEW_SOUTH_WALES', 	'TXT_KEY_SPY_NAME_SENSHI_NEW_SOUTH_WALES_9');
--==========================================================================================================================		
--==========================================================================================================================						
			
			

