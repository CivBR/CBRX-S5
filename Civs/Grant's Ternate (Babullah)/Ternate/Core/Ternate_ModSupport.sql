--==========================================================================================================================
-- MASTER TABLES
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS COMMUNITY (Type TEXT, Value INTEGER);
CREATE TABLE IF NOT EXISTS Civilization_JFD_ColonialCityNames(CivilizationType text, ColonyName text, LinguisticType text);
CREATE TABLE IF NOT EXISTS Civilization_JFD_Governments(CivilizationType text, CultureType text, LegislatureName text, OfficeTitle text, GovernmentType text, Weight integer);
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMP(CivilizationType, MapPrefix, X, Y, CapitalName, AltX, AltY, AltCapitalName);
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMPRequestedResources(CivilizationType, MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6);
CREATE TABLE IF NOT EXISTS JFD_Civilopedia_HideFromPedia(Type text);
CREATE TABLE IF NOT EXISTS JFD_GlobalUserSettings(Type text, Value integer default 1);
CREATE TABLE IF NOT EXISTS MinorCivilizations_YnAEMP(MinorCivType, MapPrefix, X, Y, CapitalName, AltX, AltY, AltCapitalName);
--==========================================================================================================================
-- USER SETTINGS (THIS IS NEEDED IN MOST CASES)
--==========================================================================================================================
-- JFD_GlobalUserSettings
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
JFD_GlobalUserSettings (
    Type                text            default null,
    Value               integer         default 1);
--==========================================================================================================================
-- LEADERS
--==========================================================================================================================
-- Flavors
--------------------------------------------------------------------------------------------------------------------------
INSERT OR REPLACE INTO Flavors 
		(Type)
VALUES	('FLAVOR_JFD_DECOLONIZATION'),
		('FLAVOR_JFD_MERCENARY'),
		('FLAVOR_JFD_REFORM_GOVERNMENT'),
		('FLAVOR_JFD_REFORM_LEGAL'),
		('FLAVOR_JFD_REFORM_CULTURE'),
		('FLAVOR_JFD_REFORM_ECONOMIC'),
		('FLAVOR_JFD_REFORM_FOREIGN'),
		('FLAVOR_JFD_REFORM_INDUSTRY'),
		('FLAVOR_JFD_REFORM_MILITARY'),
		('FLAVOR_JFD_REFORM_RELIGION'),
		('FLAVOR_JFD_RELIGIOUS_INTOLERANCE'),
		('FLAVOR_JFD_SLAVERY'),
		('FLAVOR_JFD_STATE_RELIGION');
--------------------------------------------------------------------------------------------------------------------------
-- Leader_Flavors
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Leader_Flavors
		(LeaderType,				FlavorType,							Flavor)
VALUES	('LEADER_GT_BABULLAH',	'FLAVOR_JFD_DECOLONIZATION',			1),
		('LEADER_GT_BABULLAH',	'FLAVOR_JFD_MERCENARY',					10),
		('LEADER_GT_BABULLAH',	'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',		3),
		('LEADER_GT_BABULLAH',	'FLAVOR_JFD_REFORM_GOVERNMENT',			3),
		('LEADER_GT_BABULLAH',	'FLAVOR_JFD_REFORM_LEGAL',				4),
		('LEADER_GT_BABULLAH',	'FLAVOR_JFD_REFORM_CULTURE',			7),		
		('LEADER_GT_BABULLAH',	'FLAVOR_JFD_REFORM_ECONOMIC',			9),
		('LEADER_GT_BABULLAH',	'FLAVOR_JFD_REFORM_FOREIGN',			2),
		('LEADER_GT_BABULLAH',	'FLAVOR_JFD_REFORM_INDUSTRY',			2),
		('LEADER_GT_BABULLAH',	'FLAVOR_JFD_REFORM_MILITARY',			6),
		('LEADER_GT_BABULLAH',	'FLAVOR_JFD_REFORM_RELIGION',			7),
		('LEADER_GT_BABULLAH',	'FLAVOR_JFD_SLAVERY',					0),
		('LEADER_GT_BABULLAH',	'FLAVOR_JFD_STATE_RELIGION',			9);
--==========================================================================================================================
-- CIVILIZATIONS
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_JFD_Governments
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Civilization_JFD_Governments
		(CivilizationType,				GovernmentType,			     Weight)
VALUES  ('CIVILIZATION_GT_TERNATE',		'GOVERNMENT_JFD_MONARCHY',	 80);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_YnAEMP
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilizations_YnAEMP
		(CivilizationType,			MapPrefix,				X,		Y,		CapitalName,  	AltX,  		AltY,  	AltCapitalName)
VALUES	('CIVILIZATION_GT_TERNATE',	'AfriAsiaAust',			111,	37, 	null,		 	108,		36,		'TXT_KEY_CITY_NAME_CIVILIZATION_GT_TERNATE_15'),
		('CIVILIZATION_GT_TERNATE',	'AustralasiaGiant',		51,		93,     null,		 	46,			94,		'TXT_KEY_CITY_NAME_CIVILIZATION_GT_TERNATE_15'),
		('CIVILIZATION_GT_TERNATE',	'Indonesia',			79,		30,		null,		 	73,			30,		'TXT_KEY_CITY_NAME_CIVILIZATION_GT_TERNATE_15'),
		('CIVILIZATION_GT_TERNATE',	'EastAsia',				51,		20,		null,		 	47,			20,		'TXT_KEY_CITY_NAME_CIVILIZATION_GT_TERNATE_15'),
		('CIVILIZATION_GT_TERNATE',	'IndianOcean',			95,		36,		null,		 	92,			39,		'TXT_KEY_CITY_NAME_CIVILIZATION_GT_TERNATE_15'),
		('CIVILIZATION_GT_TERNATE',	'GreatestEarth',		95,		29,		null,		 	93,			29,		'TXT_KEY_CITY_NAME_CIVILIZATION_GT_TERNATE_15'),							
		('CIVILIZATION_GT_TERNATE',	'Pacific',				37,		29,		null,		 	38,			33,		'TXT_KEY_CITY_NAME_CIVILIZATION_GT_TERNATE_15'),
		('CIVILIZATION_GT_TERNATE',	'Cordiform',			72,		29,		null,		 	71,			26,		'TXT_KEY_CITY_NAME_CIVILIZATION_GT_TERNATE_15'),
		('CIVILIZATION_GT_TERNATE',	'Yagem',				89,		36,		null,		 	90,			33,		'TXT_KEY_CITY_NAME_CIVILIZATION_GT_TERNATE_15'),
		('CIVILIZATION_GT_TERNATE',	'Yahem',				112,	32,		null,		 	109,		31,		'TXT_KEY_CITY_NAME_CIVILIZATION_GT_TERNATE_15');
------------------------------------------------------------------------------------------------------------------------	
-- Civilizations_YnAEMPRequestedResources
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMPRequestedResources(CivilizationType, MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6);
INSERT INTO Civilizations_YnAEMPRequestedResources
		(CivilizationType,			MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6)
SELECT	'CIVILIZATION_GT_TERNATE',	MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6
FROM Civilizations_YnAEMPRequestedResources WHERE CivilizationType = 'CIVILIZATION_SIAM';
--------------------------------------------------------------------------------------------------------------------------
-- Civilization_JFD_CultureTypes
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_CultureTypes(
	CivilizationType 					text 		REFERENCES Civilizations(Type) 		default null,
	CultureType 						text											default null,
	SubCultureType 						text											default null,
	ArtDefineTag						text											default	null,
	DecisionsTag						text											default	null,
	DefeatScreenEarlyTag				text											default	null,
	DefeatScreenMidTag					text											default	null,
	DefeatScreenLateTag					text											default	null,
	IdealsTag							text											default	null,
	SplashScreenTag						text											default	null,
	SoundtrackTag						text											default	null,
	UnitDialogueTag						text											default null);

INSERT INTO Civilization_JFD_CultureTypes
		(CivilizationType,				ArtDefineTag, CultureType, SubCultureType, DecisionsTag, DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag)
SELECT	'CIVILIZATION_GT_TERNATE',	ArtDefineTag, CultureType, SubCultureType, DecisionsTag, DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_CHINA';

UPDATE Civilizations 
SET SoundtrackTag = 'JFD_EastIndies'
WHERE Type = 'CIVILIZATION_GT_TERNATE'
AND EXISTS (SELECT * FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_EastIndies')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================