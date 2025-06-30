--==========================================================================================================================	
-- Civilizations
--==========================================================================================================================				
INSERT INTO Civilizations 	
			(Type, 							Description, 					ShortDescription, 			Adjective,							CivilopediaTag, 						DefaultPlayerColor, 			ArtDefineTag,	ArtStyleType,	ArtStyleSuffix, ArtStylePrefix, IconAtlas, 				PortraitIndex, 	AlphaIconAtlas, 				SoundtrackTag,  MapImage, 					DawnOfManQuote, 							DawnOfManImage,				DawnOfManAudio)
SELECT		('CIVILIZATION_MC_YANOMAMI'), 	('TXT_KEY_MC_YANOMAMI_DESC'), 	('TXT_KEY_MC_YANOMAMI'),	('TXT_KEY_MC_YANOMAMI_ADJECTIVE'), 	('TXT_KEY_CIVILOPEDIA_MC_YANOMAMI'),	('PLAYERCOLOR_MC_YANOMAMI'), 	ArtDefineTag,	ArtStyleType,	ArtStyleSuffix,	ArtStylePrefix,	('MC_YANOMAMI_ATLAS'), 	0, 				('MC_YANOMAMI_ALPHA_ATLAS'),	('Brazil'), 	('MC_YANOMAMI_Map.dds'), 	('TXT_KEY_DAWN_OF_MAN_MC_YANOMAMI_TEXT'), 	('MC_YANOMAMI_DoM.dds'),	('AS2D_DOM_SPEECH_MC_YANOMAMI')
FROM Civilizations WHERE (Type = 'CIVILIZATION_INCA');

--==========================================================================================================================	
-- Civilization_Leaders
--==========================================================================================================================		
INSERT INTO Civilization_Leaders 
			(CivilizationType, 				LeaderheadType)
VALUES		('CIVILIZATION_MC_YANOMAMI', 	'LEADER_MC_DAVI_KOPENAWA');

--==========================================================================================================================	
-- Civilization_Start_Region_Priority
--==========================================================================================================================		
INSERT INTO Civilization_Start_Region_Priority 
			(CivilizationType, 				RegionType)
VALUES		('CIVILIZATION_MC_YANOMAMI', 	'REGION_JUNGLE');

--==========================================================================================================================	
-- Civilization_FreeBuildingClasses
--==========================================================================================================================		
INSERT INTO Civilization_FreeBuildingClasses 
			(CivilizationType, 				BuildingClassType)
VALUES		('CIVILIZATION_MC_YANOMAMI', 	'BUILDINGCLASS_PALACE');
			
--==========================================================================================================================	
-- Civilization_FreeTechs
--==========================================================================================================================		
INSERT INTO Civilization_FreeTechs 
			(CivilizationType, 				TechType)
VALUES		('CIVILIZATION_MC_YANOMAMI', 	'TECH_AGRICULTURE');
			
--==========================================================================================================================	
-- Civilization_FreeUnits
--==========================================================================================================================		
INSERT INTO Civilization_FreeUnits 
			(CivilizationType, 				UnitClassType,			Count,		UnitAIType)
VALUES		('CIVILIZATION_MC_YANOMAMI', 	'UNITCLASS_SETTLER',	1,			'UNITAI_SETTLE');
	
--==========================================================================================================================	
-- Civilization_UnitClassOverrides
--==========================================================================================================================		
INSERT INTO Civilization_UnitClassOverrides
       (CivilizationType,			UnitClassType,				UnitType)
VALUES ('CIVILIZATION_MC_YANOMAMI',	'UNITCLASS_CHARIOT_ARCHER',	'UNIT_MC_YANOMAMI_DARTBLOWER');

--==========================================================================================================================	
-- Civilization_BuildingClassOverrides
--==========================================================================================================================		
INSERT INTO Civilization_BuildingClassOverrides 
			(CivilizationType, 				BuildingClassType,			BuildingType)
VALUES		('CIVILIZATION_MC_YANOMAMI', 	'BUILDINGCLASS_GRANARY',	'BUILDING_MC_YANOMAMI_SHABONO');
			
--==========================================================================================================================	
-- Civilization_Religions
--==========================================================================================================================		
INSERT INTO Civilization_Religions 
			(CivilizationType, 				ReligionType)
SELECT		'CIVILIZATION_MC_YANOMAMI', 	ReligionType
FROM Civilization_Religions WHERE (CivilizationType = 'CIVILIZATION_BRAZIL');

--==========================================================================================================================	
-- Colors
--==========================================================================================================================			
INSERT INTO Colors 												
		(Type, 										Red, 		Green, 		Blue,		Alpha)
VALUES	('COLOR_PLAYER_MC_YANOMAMI_ICON', 			0.741,		0.761,		0.682,		1),
		('COLOR_PLAYER_MC_YANOMAMI_BACKGROUND',		0.455,		0.075,		0.145,		1);


		
--==========================================================================================================================	
-- PlayerColors
--==========================================================================================================================				
INSERT INTO PlayerColors 
			(Type, 						PrimaryColor, 						SecondaryColor, 						TextColor)
VALUES		('PLAYERCOLOR_MC_YANOMAMI',	'COLOR_PLAYER_MC_YANOMAMI_ICON',	'COLOR_PLAYER_MC_YANOMAMI_BACKGROUND',	'COLOR_PLAYER_WHITE_TEXT');

--==========================================================================================================================	
-- Civilization_CityNames
--==========================================================================================================================			
INSERT INTO Civilization_CityNames 						
		(CivilizationType, 				CityName)
VALUES	('CIVILIZATION_MC_YANOMAMI', 	'TXT_KEY_CITY_NAME_MC_YANOMAMI_TAYARITERI'),
		('CIVILIZATION_MC_YANOMAMI', 	'TXT_KEY_CITY_NAME_MC_YANOMAMI_SHUIMUITERI'),
		('CIVILIZATION_MC_YANOMAMI', 	'TXT_KEY_CITY_NAME_MC_YANOMAMI_PATAHAMATERI'),
		('CIVILIZATION_MC_YANOMAMI', 	'TXT_KEY_CITY_NAME_MC_YANOMAMI_HASUPUWETERI'),
		('CIVILIZATION_MC_YANOMAMI', 	'TXT_KEY_CITY_NAME_MC_YANOMAMI_HIOMISITERI'),
		('CIVILIZATION_MC_YANOMAMI', 	'TXT_KEY_CITY_NAME_MC_YANOMAMI_MOKARITATERI'),
		('CIVILIZATION_MC_YANOMAMI', 	'TXT_KEY_CITY_NAME_MC_YANOMAMI_HAWAROWETERI'),
		('CIVILIZATION_MC_YANOMAMI', 	'TXT_KEY_CITY_NAME_MC_YANOMAMI_YEHIOPATERI'),
		('CIVILIZATION_MC_YANOMAMI', 	'TXT_KEY_CITY_NAME_MC_YANOMAMI_NANIMAPUWETERI'),
		('CIVILIZATION_MC_YANOMAMI', 	'TXT_KEY_CITY_NAME_MC_YANOMAMI_PRARARAITERI'),
		('CIVILIZATION_MC_YANOMAMI', 	'TXT_KEY_CITY_NAME_MC_YANOMAMI_KASHARAWETERI'),
		('CIVILIZATION_MC_YANOMAMI', 	'TXT_KEY_CITY_NAME_MC_YANOMAMI_ASHITOWETERI'),
		('CIVILIZATION_MC_YANOMAMI', 	'TXT_KEY_CITY_NAME_MC_YANOMAMI_BISHAASHITERI'),
		('CIVILIZATION_MC_YANOMAMI', 	'TXT_KEY_CITY_NAME_MC_YANOMAMI_KONOPOREPIWETERI'),
		('CIVILIZATION_MC_YANOMAMI', 	'TXT_KEY_CITY_NAME_MC_YANOMAMI_PATANOWETERI'),
		('CIVILIZATION_MC_YANOMAMI', 	'TXT_KEY_CITY_NAME_MC_YANOMAMI_POREWETERI'),
		('CIVILIZATION_MC_YANOMAMI', 	'TXT_KEY_CITY_NAME_MC_YANOMAMI_WAROKOAWETERI'),
		('CIVILIZATION_MC_YANOMAMI', 	'TXT_KEY_CITY_NAME_MC_YANOMAMI_TOKANAWETERI'),
		('CIVILIZATION_MC_YANOMAMI', 	'TXT_KEY_CITY_NAME_MC_YANOMAMI_IROKAI'),
		('CIVILIZATION_MC_YANOMAMI', 	'TXT_KEY_CITY_NAME_MC_YANOMAMI_HASUBOWA'),
		('CIVILIZATION_MC_YANOMAMI', 	'TXT_KEY_CITY_NAME_MC_YANOMAMI_MAVAKA'),
		('CIVILIZATION_MC_YANOMAMI', 	'TXT_KEY_CITY_NAME_MC_YANOMAMI_OKIYAMOPE'),
		('CIVILIZATION_MC_YANOMAMI', 	'TXT_KEY_CITY_NAME_MC_YANOMAMI_HOREAPE'),
		('CIVILIZATION_MC_YANOMAMI', 	'TXT_KEY_CITY_NAME_MC_YANOMAMI_MAICOTO'),
		('CIVILIZATION_MC_YANOMAMI', 	'TXT_KEY_CITY_NAME_MC_YANOMAMI_MATOWE'),
		('CIVILIZATION_MC_YANOMAMI', 	'TXT_KEY_CITY_NAME_MC_YANOMAMI_WAIKA'),
		('CIVILIZATION_MC_YANOMAMI', 	'TXT_KEY_CITY_NAME_MC_YANOMAMI_GUAICA'),
		('CIVILIZATION_MC_YANOMAMI', 	'TXT_KEY_CITY_NAME_MC_YANOMAMI_XIRIANA'),
		('CIVILIZATION_MC_YANOMAMI', 	'TXT_KEY_CITY_NAME_MC_YANOMAMI_SANEMA'),
		('CIVILIZATION_MC_YANOMAMI', 	'TXT_KEY_CITY_NAME_MC_YANOMAMI_GUAHARIBO'),
		('CIVILIZATION_MC_YANOMAMI', 	'TXT_KEY_CITY_NAME_MC_YANOMAMI_CATRIMANI'),
		('CIVILIZATION_MC_YANOMAMI', 	'TXT_KEY_CITY_NAME_MC_YANOMAMI_TACLAUDUB'),
		('CIVILIZATION_MC_YANOMAMI', 	'TXT_KEY_CITY_NAME_MC_YANOMAMI_KARIME'),
		('CIVILIZATION_MC_YANOMAMI', 	'TXT_KEY_CITY_NAME_MC_YANOMAMI_MUCAJAI'),
		('CIVILIZATION_MC_YANOMAMI', 	'TXT_KEY_CITY_NAME_MC_YANOMAMI_PAKIDAI'),
		('CIVILIZATION_MC_YANOMAMI', 	'TXT_KEY_CITY_NAME_MC_YANOMAMI_CASAPARE'),
		('CIVILIZATION_MC_YANOMAMI', 	'TXT_KEY_CITY_NAME_MC_YANOMAMI_MACUXI'),
		('CIVILIZATION_MC_YANOMAMI', 	'TXT_KEY_CITY_NAME_MC_YANOMAMI_SHIRIANA'),
		('CIVILIZATION_MC_YANOMAMI', 	'TXT_KEY_CITY_NAME_MC_YANOMAMI_SURARA'),
		('CIVILIZATION_MC_YANOMAMI', 	'TXT_KEY_CITY_NAME_MC_YANOMAMI_AICA');	

--==========================================================================================================================	
-- Civilization_SpyNames
--==========================================================================================================================		
INSERT INTO Civilization_SpyNames 
			(CivilizationType, 				SpyName)
VALUES		('CIVILIZATION_MC_YANOMAMI', 	'TXT_KEY_SPY_NAME_MC_YANOMAMI_0'),	
			('CIVILIZATION_MC_YANOMAMI', 	'TXT_KEY_SPY_NAME_MC_YANOMAMI_1'),
			('CIVILIZATION_MC_YANOMAMI', 	'TXT_KEY_SPY_NAME_MC_YANOMAMI_2'),
			('CIVILIZATION_MC_YANOMAMI', 	'TXT_KEY_SPY_NAME_MC_YANOMAMI_3'),
			('CIVILIZATION_MC_YANOMAMI', 	'TXT_KEY_SPY_NAME_MC_YANOMAMI_4'),
			('CIVILIZATION_MC_YANOMAMI', 	'TXT_KEY_SPY_NAME_MC_YANOMAMI_5'),
			('CIVILIZATION_MC_YANOMAMI', 	'TXT_KEY_SPY_NAME_MC_YANOMAMI_6'),
			('CIVILIZATION_MC_YANOMAMI', 	'TXT_KEY_SPY_NAME_MC_YANOMAMI_7'),
			('CIVILIZATION_MC_YANOMAMI', 	'TXT_KEY_SPY_NAME_MC_YANOMAMI_8'),
			('CIVILIZATION_MC_YANOMAMI', 	'TXT_KEY_SPY_NAME_MC_YANOMAMI_9');
--==========================================================================================================================	
--==========================================================================================================================	
