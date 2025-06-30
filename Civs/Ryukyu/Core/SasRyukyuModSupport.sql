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
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMPRequestedResource(CivilizationType, MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6);
CREATE TABLE IF NOT EXISTS MinorCivilizations_YnAEMP(MinorCivType, MapPrefix, X, Y, CapitalName, AltX, AltY, AltCapitalName);
CREATE TABLE IF NOT EXISTS JFD_Civilopedia_HideFromPedia(Type text);
CREATE TABLE IF NOT EXISTS JFD_GlobalUserSettings(Type text, Value integer default 1);

--==========================================================================================================================
--==========================================================================================================================
--==========================================================================================================================
-- JFDLC
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
-- CIVILOPEDIA
--------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------
-- GOVERNMENTS
--------------------------------------------------------------------------------------------------------------------------	
--------------------------------------------------------------------------------------------------------------------------
-- Civilization_JFD_Governments
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Civilization_JFD_Governments
		(CivilizationType, 				GovernmentType,				Weight)
VALUES	('CIVILIZATION_SAS_RYUKYU', 	'GOVERNMENT_JFD_MONARCHY',	60),
		('CIVILIZATION_SAS_RYUKYU', 	'GOVERNMENT_JFD_MERCHANT',	50),
		('CIVILIZATION_SAS_RYUKYU', 	'GOVERNMENT_JFD_IMPERIAL',	40),
		('CIVILIZATION_SAS_RYUKYU', 	'GOVERNMENT_JFD_MANDATE',	30),
		('CIVILIZATION_SAS_RYUKYU', 	'GOVERNMENT_JFD_SHOGUNATE',	30);
--------------------------------------------------------------------------------------------------------------------------
-- JFD'S CULTURAL DIVERSITY (31a31d1c-b9d7-45e1-842c-23232d66cd47)
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_CultureTypes(
	CivilizationType 					text 			default null,
	CultureType 						text			default null,
	SubCultureType 						text			default null,
	ArtDefineTag						text			default	null,
	DecisionsTag						text			default null,
	DefeatScreenEarlyTag				text			default	null,
	DefeatScreenMidTag					text			default	null,
	DefeatScreenLateTag					text			default	null,
	IdealsTag							text			default	null,
	SplashScreenTag						text			default	null,
	SoundtrackTag						text			default	null,
	UnitDialogueTag						text			default null);

INSERT INTO Civilization_JFD_CultureTypes
		(CivilizationType,						ArtDefineTag, CultureType, SubCultureType, DecisionsTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag)
SELECT	'CIVILIZATION_SAS_RYUKYU',	ArtDefineTag, CultureType, SubCultureType, DecisionsTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_CHINA';

UPDATE Civilizations 
SET SoundtrackTag = 'JFD_FarEastern'
WHERE Type = 'CIVILIZATION_SAS_RYUKYU'
AND EXISTS (SELECT SoundID FROM Audio_Sounds WHERE SoundID = 'SND_JFD_ABORIGINAL_PEACE_01');

--==========================================================================================================================
-- TOMATEKH'S HISTORICAL RELIGIONS COMPLETE
--==========================================================================================================================
INSERT INTO Civilization_Religions
	(CivilizationType,		 ReligionType)
VALUES	('CIVILIZATION_SAS_RYUKYU',	'RELIGION_TAOISM');

UPDATE Civilization_Religions SET ReligionType =
( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type="RELIGION_UTAKI_SM" )
THEN "RELIGION_UTAKI_SM"
ELSE "RELIGION_TAOISM" END
) WHERE CivilizationType = "CIVILIZATION_SAS_RYUKYU";

CREATE TRIGGER IF NOT EXISTS Sas_RyukyuReligion_Insert
AFTER INSERT ON Religions
WHEN (NEW.Type = 'RELIGION_UTAKI_SM') AND EXISTS (SELECT Type FROM Civilizations WHERE Type='CIVILIZATION_SAS_RYUKYU')
BEGIN
UPDATE Civilization_Religions
SET ReligionType = NEW.Type
WHERE CivilizationType = 'CIVILIZATION_SAS_RYUKYU';
END;