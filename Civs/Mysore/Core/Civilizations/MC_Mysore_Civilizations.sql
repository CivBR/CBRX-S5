--==========================================================================================================================	
-- Civilizations
--==========================================================================================================================				
INSERT INTO Civilizations 	
			(Type, 							Description, 					ShortDescription, 		Adjective, 							CivilopediaTag, 					DefaultPlayerColor, 		ArtDefineTag,	ArtStyleType,			ArtStyleSuffix, ArtStylePrefix, IconAtlas, 				PortraitIndex, 	AlphaIconAtlas, 			SoundtrackTag,  MapImage, 				DawnOfManQuote, 					DawnOfManImage,			DawnOfManAudio)
SELECT		('CIVILIZATION_MC_MYSORE'), 	('TXT_KEY_MC_MYSORE_DESC'), 	('TXT_KEY_MC_MYSORE'),	('TXT_KEY_MC_MYSORE_ADJECTIVE'), 	('TXT_KEY_CIVILOPEDIA_MC_MYSORE'),	('PLAYERCOLOR_MC_MYSORE'), 	ArtDefineTag,	'ARTSTYLE_MIDDLE_EAST',	ArtStyleSuffix,	ArtStylePrefix,	('MC_MYSORE_ATLAS'), 	0, 				('MC_MYSORE_ALPHA_ATLAS'), ('India'), 		('MC_MYSORE_Map.dds'), 	('TXT_KEY_DAWN_OF_MAN_MC_MYSORE'), 	('MC_MYSORE_DoM.dds'),	('AS2D_DOM_SPEECH_MC_MYSORE')
FROM Civilizations WHERE (Type = 'CIVILIZATION_INDIA');

--==========================================================================================================================	
-- Civilization_Leaders
--==========================================================================================================================		
INSERT INTO Civilization_Leaders 
			(CivilizationType, 			LeaderheadType)
VALUES		('CIVILIZATION_MC_MYSORE', 	'LEADER_MC_TIPU_SULTAN');

--==========================================================================================================================	
-- Civilization_FreeBuildingClasses
--==========================================================================================================================		
INSERT INTO Civilization_FreeBuildingClasses 
			(CivilizationType, 			BuildingClassType)
VALUES		('CIVILIZATION_MC_MYSORE', 	'BUILDINGCLASS_PALACE');
			
--==========================================================================================================================	
-- Civilization_FreeTechs
--==========================================================================================================================		
INSERT INTO Civilization_FreeTechs 
			(CivilizationType, 			TechType)
VALUES		('CIVILIZATION_MC_MYSORE', 	'TECH_AGRICULTURE');
			
--==========================================================================================================================	
-- Civilization_FreeUnits
--==========================================================================================================================		
INSERT INTO Civilization_FreeUnits 
			(CivilizationType, 			UnitClassType,			Count,		UnitAIType)
VALUES		('CIVILIZATION_MC_MYSORE', 	'UNITCLASS_SETTLER',	1,			'UNITAI_SETTLE');
	
--==========================================================================================================================	
-- Civilization_UnitClassOverrides
--==========================================================================================================================		
INSERT INTO Civilization_UnitClassOverrides 
			(CivilizationType, 			UnitClassType,				UnitType)
VALUES		('CIVILIZATION_MC_MYSORE', 	'UNITCLASS_MUSKETMAN',		'UNIT_MC_MYSORE_CUSHOON');
			
--==========================================================================================================================	
-- Civilization_BuildingClassOverrides
--==========================================================================================================================		
INSERT INTO Civilization_BuildingClassOverrides 
			(CivilizationType, 			BuildingClassType,			BuildingType)
VALUES		('CIVILIZATION_MC_MYSORE', 	'BUILDINGCLASS_ARSENAL',	'BUILDING_MC_MYSORE_TARAMANDAL_PET');
--==========================================================================================================================	
-- Civilization_Religions
--==========================================================================================================================		
INSERT INTO Civilization_Religions 
			(CivilizationType, 			ReligionType)
SELECT		('CIVILIZATION_MC_MYSORE'),	ReligionType
FROM Civilization_Religions WHERE (CivilizationType = 'CIVILIZATION_INDIA');

--==========================================================================================================================	
-- Colors
--==========================================================================================================================			
INSERT INTO Colors 												
		(Type,									Red, 		Green, 		Blue,		Alpha)
VALUES	('COLOR_PLAYER_MC_MYSORE_ICON', 		0.965,		0.412,		0.361,		1),
		('COLOR_PLAYER_MC_MYSORE_BACKGROUND',	0.306,		0.012,		0.031,		1);


--==========================================================================================================================	
-- PlayerColors
--==========================================================================================================================				
INSERT INTO PlayerColors 
			(Type, 						PrimaryColor, 					SecondaryColor, 						TextColor)
VALUES		('PLAYERCOLOR_MC_MYSORE',	'COLOR_PLAYER_MC_MYSORE_ICON', 'COLOR_PLAYER_MC_MYSORE_BACKGROUND',	'COLOR_PLAYER_WHITE_TEXT');

--==========================================================================================================================	
-- Civilization_CityNames
--==========================================================================================================================			
INSERT INTO Civilization_CityNames 						
		(CivilizationType, 			CityName)
VALUES	('CIVILIZATION_MC_MYSORE', 	'TXT_KEY_CITY_NAME_MC_MYSORE_MYSORE'),
		('CIVILIZATION_MC_MYSORE', 	'TXT_KEY_CITY_NAME_MC_MYSORE_SRIRANGAPATNA'),
		('CIVILIZATION_MC_MYSORE', 	'TXT_KEY_CITY_NAME_MC_MYSORE_BANGALORE'),
		('CIVILIZATION_MC_MYSORE', 	'TXT_KEY_CITY_NAME_MC_MYSORE_CALICUT'),
		('CIVILIZATION_MC_MYSORE', 	'TXT_KEY_CITY_NAME_MC_MYSORE_KELADI'),
		('CIVILIZATION_MC_MYSORE', 	'TXT_KEY_CITY_NAME_MC_MYSORE_MANGALORE'),
		('CIVILIZATION_MC_MYSORE', 	'TXT_KEY_CITY_NAME_MC_MYSORE_CHANNAPATNA'),
		('CIVILIZATION_MC_MYSORE', 	'TXT_KEY_CITY_NAME_MC_MYSORE_SALEM'),
		('CIVILIZATION_MC_MYSORE', 	'TXT_KEY_CITY_NAME_MC_MYSORE_KARWAR'),
		('CIVILIZATION_MC_MYSORE', 	'TXT_KEY_CITY_NAME_MC_MYSORE_ERODE'),
		('CIVILIZATION_MC_MYSORE', 	'TXT_KEY_CITY_NAME_MC_MYSORE_HASSAN'),
		('CIVILIZATION_MC_MYSORE', 	'TXT_KEY_CITY_NAME_MC_MYSORE_DHARWAD'),
		('CIVILIZATION_MC_MYSORE', 	'TXT_KEY_CITY_NAME_MC_MYSORE_DHARMAPURI'),
		('CIVILIZATION_MC_MYSORE', 	'TXT_KEY_CITY_NAME_MC_MYSORE_BIDANUR'),
		('CIVILIZATION_MC_MYSORE', 	'TXT_KEY_CITY_NAME_MC_MYSORE_CHITRADURGA'),
		('CIVILIZATION_MC_MYSORE', 	'TXT_KEY_CITY_NAME_MC_MYSORE_BEKALA'),
		('CIVILIZATION_MC_MYSORE', 	'TXT_KEY_CITY_NAME_MC_MYSORE_MADIKERI'),
		('CIVILIZATION_MC_MYSORE', 	'TXT_KEY_CITY_NAME_MC_MYSORE_TELLICHERRY'),
		('CIVILIZATION_MC_MYSORE', 	'TXT_KEY_CITY_NAME_MC_MYSORE_KAVERIPATTINAM'),
		('CIVILIZATION_MC_MYSORE', 	'TXT_KEY_CITY_NAME_MC_MYSORE_CUDDAPAH'),
		('CIVILIZATION_MC_MYSORE', 	'TXT_KEY_CITY_NAME_MC_MYSORE_CHIKKAMAGALURU'),
		('CIVILIZATION_MC_MYSORE', 	'TXT_KEY_CITY_NAME_MC_MYSORE_TUMKUR'),
		('CIVILIZATION_MC_MYSORE', 	'TXT_KEY_CITY_NAME_MC_MYSORE_SIRA'),
		('CIVILIZATION_MC_MYSORE', 	'TXT_KEY_CITY_NAME_MC_MYSORE_COIMBATORE'),
		('CIVILIZATION_MC_MYSORE', 	'TXT_KEY_CITY_NAME_MC_MYSORE_KURNOOL'),
		('CIVILIZATION_MC_MYSORE', 	'TXT_KEY_CITY_NAME_MC_MYSORE_BELLARY'),
		('CIVILIZATION_MC_MYSORE', 	'TXT_KEY_CITY_NAME_MC_MYSORE_PERIYAPATNA'),
		('CIVILIZATION_MC_MYSORE', 	'TXT_KEY_CITY_NAME_MC_MYSORE_GURRAMAKONDA'),
		('CIVILIZATION_MC_MYSORE', 	'TXT_KEY_CITY_NAME_MC_MYSORE_GUTTY'),
		('CIVILIZATION_MC_MYSORE', 	'TXT_KEY_CITY_NAME_MC_MYSORE_SATHYAMANGALAM'),
		('CIVILIZATION_MC_MYSORE', 	'TXT_KEY_CITY_NAME_MC_MYSORE_GAJENDRAGAD'),
		('CIVILIZATION_MC_MYSORE', 	'TXT_KEY_CITY_NAME_MC_MYSORE_GURRAMKONDA');			

--==========================================================================================================================	
-- Civilization_SpyNames
--==========================================================================================================================		
INSERT INTO Civilization_SpyNames 
			(CivilizationType, 			SpyName)
VALUES		('CIVILIZATION_MC_MYSORE', 	'TXT_KEY_SPY_NAME_MC_MYSORE_0'),	
			('CIVILIZATION_MC_MYSORE', 	'TXT_KEY_SPY_NAME_MC_MYSORE_1'),
			('CIVILIZATION_MC_MYSORE', 	'TXT_KEY_SPY_NAME_MC_MYSORE_2'),
			('CIVILIZATION_MC_MYSORE', 	'TXT_KEY_SPY_NAME_MC_MYSORE_3'),
			('CIVILIZATION_MC_MYSORE', 	'TXT_KEY_SPY_NAME_MC_MYSORE_4'),
			('CIVILIZATION_MC_MYSORE', 	'TXT_KEY_SPY_NAME_MC_MYSORE_5'),
			('CIVILIZATION_MC_MYSORE', 	'TXT_KEY_SPY_NAME_MC_MYSORE_6'),
			('CIVILIZATION_MC_MYSORE', 	'TXT_KEY_SPY_NAME_MC_MYSORE_7'),
			('CIVILIZATION_MC_MYSORE', 	'TXT_KEY_SPY_NAME_MC_MYSORE_8'),
			('CIVILIZATION_MC_MYSORE', 	'TXT_KEY_SPY_NAME_MC_MYSORE_9');
--==========================================================================================================================	
--==========================================================================================================================	
