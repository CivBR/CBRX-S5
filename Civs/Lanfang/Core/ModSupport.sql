--==========================================================================================================================
-- STANDARD MOD SUPPORT
--==========================================================================================================================
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
--------------------------------------------------------------------------------------------------------------------------
--==========================================================================================================================
-- GEDEMON's YNAEMP (+JFD's v23 / 24 / 25)
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Civilizations_YnAEMP
		(CivilizationType,				MapPrefix,			X,		Y,		AltX,	AltY,	AltCapitalName)
VALUES	('CIVILIZATION_PB_LANFANG',		'AfriAsiaAust',		99,		35,		null,	null,	null),
		('CIVILIZATION_PB_LANFANG',		'AustralasiaGiant',	23,		94,		null,	null,	null),
		('CIVILIZATION_PB_LANFANG',		'Cordiform',		67,		24,		null,	null,	null),
		('CIVILIZATION_PB_LANFANG',		'EarthMk3',			86,		31,		null,	null,	null),
		('CIVILIZATION_PB_LANFANG',		'EastAsia',			33,		18,		null,	null,	null),
		('CIVILIZATION_PB_LANFANG',		'GreatestEarth',	86,		29,		null,	null,	null),
		('CIVILIZATION_PB_LANFANG',		'IndianOcean',		79,		38,		null,	null,	null),
		('CIVILIZATION_PB_LANFANG',		'Indonesia',		36,		28,		null,	null,	null),
		('CIVILIZATION_PB_LANFANG',		'Pacific',			30,		31,		null,	null,	null),
		('CIVILIZATION_PB_LANFANG',		'Yagem',			81,		30,		null,	null,	null),
		('CIVILIZATION_PB_LANFANG',		'Yahem',			104,	30,		null,	null,	null);

--CapitalName and AltCapitalName set a custom City Name on settlement at XY/AltXY coordinates, if needed. Should be TXT_KEY that refers to a string defined elsewhere.
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_YagemRequestedResource
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Civilizations_YnAEMPRequestedResources
		(CivilizationType,			MapPrefix, Req1,			Yield1, Req2,				Yield2, Req3,				Yield3, Req4,				Yield4)
SELECT	'CIVILIZATION_PB_LANFANG',	MapPrefix, 'RESOURCE_GOLD',	Yield1, 'RESOURCE_GOLD',	Yield2, 'RESOURCE_GOLD',	Yield3, 'RESOURCE_GOLD',	Yield4
FROM Civilizations_YnAEMPRequestedResources WHERE CivilizationType = 'CIVILIZATION_CHINA';
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
VALUES	('CIVILIZATION_PB_LANFANG', 	'GOVERNMENT_JFD_REPUBLIC',	100);

--Note that multiple entries are valid.
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
		(CivilizationType,			ArtDefineTag, CultureType, SubCultureType, DecisionsTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag)
SELECT	'CIVILIZATION_PB_LANFANG',	ArtDefineTag, CultureType, SubCultureType, DecisionsTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_CHINA';

UPDATE Civilizations 
SET SoundtrackTag = (SELECT SoundtrackTag FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_PB_LANFANG')
WHERE Type = 'CIVILIZATION_PB_LANFANG';
--==========================================================================================================================		
--==========================================================================================================================		
