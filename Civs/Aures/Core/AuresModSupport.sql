--------------------------------------------------------------------------------------------------------------------------
--==========================================================================================================================
-- MASTER TABLES
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
--Below are the tables required for standard mod support.

CREATE TABLE IF NOT EXISTS COMMUNITY (Type TEXT, Value INTEGER);
CREATE TABLE IF NOT EXISTS Civilization_JFD_ColonialCityNames(CivilizationType text, ColonyName text, LinguisticType text);
CREATE TABLE IF NOT EXISTS Civilization_JFD_Governments(CivilizationType text, CultureType text, LegislatureName text, OfficeTitle text, GovernmentType text, Weight integer);
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMP(CivilizationType, MapPrefix, X, Y, CapitalName, AltX, AltY, AltCapitalName);
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMPRequestedResources(CivilizationType, MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6);
CREATE TABLE IF NOT EXISTS MinorCivilizations_YnAEMP(MinorCivType, MapPrefix, X, Y, CapitalName, AltX, AltY, AltCapitalName);
CREATE TABLE IF NOT EXISTS JFD_Civilopedia_HideFromPedia(Type text);
CREATE TABLE IF NOT EXISTS JFD_GlobalUserSettings(Type text, Value integer default 1);

-------------------------------------------------------------------------------------------------------------------------
--==========================================================================================================================
-- GEDEMON's YNAEMP (+JFD's v23 / 24 / 25)
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Civilizations_YnAEMP
		(CivilizationType,				MapPrefix,			X,	Y)
VALUES	('CIVILIZATION_SAS_AURES',	'Yagem',				16,		50),
		('CIVILIZATION_SAS_AURES',	'Yahem',				58,		49),
		('CIVILIZATION_SAS_AURES',	'Cordiform',			31,		20),
		('CIVILIZATION_SAS_AURES',	'GreatestEarth',		46,		35),
		('CIVILIZATION_SAS_AURES',	'EarthMk3',				14,		45),
		('CIVILIZATION_SAS_AURES',	'AfriAsiaAust',			23,		68),
		('CIVILIZATION_SAS_AURES',	'AfriGiant',			54,		133),
		('CIVILIZATION_SAS_AURES',	'AfriSouthEuro',		30,		60),
		('CIVILIZATION_SAS_AURES',	'EuroGiant',			50,		14),
		('CIVILIZATION_SAS_AURES',	'EuroLarge',			31,		20),
		('CIVILIZATION_SAS_AURES',	'EuroLargeNew',			30,		10),
		('CIVILIZATION_SAS_AURES',	'Apennine',				12,		6),	
		('CIVILIZATION_SAS_AURES',	'Mediterranean',		32,		24),
		('CIVILIZATION_SAS_AURES',	'NorthAtlantic',		97,		7),	
		('CIVILIZATION_SAS_AURES',	'WestAfrica',			66,		73);
--==========================================================================================================================
-- JFDLC
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
-- GOVERNMENTS
--------------------------------------------------------------------------------------------------------------------------	
--------------------------------------------------------------------------------------------------------------------------
-- Civilization_JFD_Governments
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Civilization_JFD_Governments
		(CivilizationType, 				GovernmentType,				Weight)
VALUES	('CIVILIZATION_SAS_AURES', 	'GOVERNMENT_JFD_MONARCHY',	75),
		('CIVILIZATION_SAS_AURES', 	'GOVERNMENT_JFD_IMPERIAL',	75),
		('CIVILIZATION_SAS_AURES', 	'GOVERNMENT_JFD_THEOCRACY',	25);
--------------------------------------------------------------------------------------------------------------------------
-- JFD'S CULTURAL DIVERSITY (31a31d1c-b9d7-45e1-842c-23232d66cd47)
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilization_JFD_CultureTypes(CivilizationType, CultureType, SubCultureType, ArtDefineTag, DecisionsTag, DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag,	SoundtrackTag, UnitDialogueTag);
INSERT INTO Civilization_JFD_CultureTypes
		(CivilizationType,						ArtDefineTag, CultureType, SubCultureType, DecisionsTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag)
SELECT	'CIVILIZATION_SAS_AURES',	ArtDefineTag, CultureType, SubCultureType, DecisionsTag, IdealsTag, SplashScreenTag, SoundtrackTag, 'AS2D_SOUND_JFD_BERBER'
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_SONGHAI';

UPDATE Civilizations 
SET SoundtrackTag = (SELECT SoundtrackTag FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_SAS_AURES')
WHERE Type = 'CIVILIZATION_SAS_AURES'
AND EXISTS (SELECT SoundID FROM Audio_Sounds WHERE SoundID = 'SND_JFD_ABORIGINAL_PEACE_01');

--==========================================================================================================================
-- Historical Religions
--==========================================================================================================================
 UPDATE Civilization_Religions SET ReligionType =
    ( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_AMANAIISM' )
        THEN 'RELIGION_AMANAIISM'
        ELSE ( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_CHRISTIAN_ARIANISM' )
        THEN 'RELIGION_CHRISTIAN_ARIANISM'
        ELSE 'RELIGION_JUDAISM' END ) END
    ) WHERE CivilizationType = 'CIVILIZATION_SAS_AURES';