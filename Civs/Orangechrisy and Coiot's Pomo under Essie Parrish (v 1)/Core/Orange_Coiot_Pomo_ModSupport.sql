--==========================================================================================================================
-- Orange's California Religions
--==========================================================================================================================
DELETE FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_ORG_COIOT_POMO';

-- thank you chrisy15 for the help
-- Attempt to insert for one of these religions
INSERT INTO Civilization_Religions
		(CivilizationType,				ReligionType)
SELECT	'CIVILIZATION_ORG_COIOT_POMO',	Type
FROM Religions WHERE Type IN ('RELIGION_BOLE_MARU', 'RELIGION_KUKSU') ORDER BY RANDOM() LIMIT 1;

-- If neither of those Religions exist, no insert will have been made; under this condition, make this insert
INSERT INTO Civilization_Religions
    (CivilizationType,  ReligionType)
SELECT  'CIVILIZATION_ORG_COIOT_POMO', 'RELIGION_PROTESTANTISM'
WHERE NOT EXISTS (SELECT 1 FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_ORG_COIOT_POMO');
--==========================================================================================================================
-- USER SETTINGS (THIS IS NEEDED IN MOST CASES)
--==========================================================================================================================
-- JFD_GlobalUserSettings
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
JFD_GlobalUserSettings (
	Type 				text 			default null,
	Value 				integer 		default 1);
--==========================================================================================================================
-- Bingle's Civ IV Traits
--==========================================================================================================================
-- Leader_SharedTraits
------------------------------	
CREATE TABLE IF NOT EXISTS 
    Leader_SharedTraits (
    LeaderType          text    REFERENCES Leaders(Type)        default null,
    TraitOne            text    REFERENCES Policies(Type)       default null,
    TraitTwo            text    REFERENCES Policies(Type)       default null);
     
INSERT OR REPLACE INTO Leader_SharedTraits
            (LeaderType,				TraitOne,               TraitTwo)
SELECT      'LEADER_ORG_COIOT_ESSIE',	'POLICY_SPIRITUAL_X',	'POLICY_CREATIVE_X'
WHERE EXISTS (SELECT * FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X');
------------------------------	
-- Leaders
------------------------------	
UPDATE Leaders 
SET Description = 'Sargent Sambo [ICON_PEACE][ICON_CULTURE]'
WHERE Type = 'LEADER_ORG_COIOT_ESSIE'
AND EXISTS (SELECT * FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X');
--==========================================================================================================================
-- GAZEBO COMMUNITY PATCH
--==========================================================================================================================
-- COMMUNITY
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS COMMUNITY (Type TEXT, Value INTEGER);
--==========================================================================================================================
-- GEDEMON R.E.D.
--==========================================================================================================================
-- Civilizations
--------------------------------------------------------------------------------------------------------------------------
UPDATE Civilizations 
SET ArtStyleSuffix = '_SHOSHONE'
WHERE Type = 'CIVILIZATION_ORG_COIOT_POMO'
AND EXISTS (SELECT * FROM Civilizations WHERE ArtStyleSuffix = '_SHOSHONE');
--==========================================================================================================================
-- GEDEMON's YNAEMP (+JFD's v23-25)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMP(CivilizationType, MapPrefix, X, Y, CapitalName, AltX, AltY, AltCapitalName);
INSERT INTO Civilizations_YnAEMP
		(CivilizationType,				MapPrefix,				X,	Y)
VALUES	('CIVILIZATION_ORG_COIOT_POMO',	'GreatestEarth',		1, 47),
		('CIVILIZATION_ORG_COIOT_POMO',	'Cordiform',			12,	42),
		('CIVILIZATION_ORG_COIOT_POMO',	'Yagem',				130, 63),
		('CIVILIZATION_ORG_COIOT_POMO',	'Yahem',				13,	54),
		('CIVILIZATION_ORG_COIOT_POMO',	'Americas',				29,	54),
		('CIVILIZATION_ORG_COIOT_POMO',	'AmericasGiant',		21,	119),
		('CIVILIZATION_ORG_COIOT_POMO',	'NorthAmericaGiant',	34,	55),
		('CIVILIZATION_ORG_COIOT_POMO',	'NorthAmericaHuge',		33,	42),
		('CIVILIZATION_ORG_COIOT_POMO',	'Pacific',				102, 54),
		('CIVILIZATION_ORG_COIOT_POMO',	'EarthMk3',				124, 66);

--CapitalName and AltCapitalName sets a custom City Name on settlement at XY/AltXY coordinates, if needed. Should be TXT_KEY that refers to a string defined elsewhere.
-----------------------------------------
-- Civilizations_YnAEMPRequestedResources
-----------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMPRequestedResources(CivilizationType, MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6);
INSERT INTO Civilizations_YnAEMPRequestedResources
		(CivilizationType, 	 			MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_ORG_COIOT_POMO',	MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YnAEMPRequestedResources WHERE CivilizationType = 'CIVILIZATION_SHOSHONE';
--==========================================================================================================================
-- HAZEL MAP LABELS
--==========================================================================================================================
-- ML_CivCultures
------------------------------	
CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
		(CivType,					CultureType, CultureEra)
SELECT	'CIVILIZATION_ORG_SHASTA',	CultureType, CultureEra
FROM ML_CivCultures WHERE CivType = 'CIVILIZATION_SHOSHONE';
--==========================================================================================================================
-- JFDLC
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
-- GOVERNMENTS
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilization_JFD_Governments(CivilizationType text, GovernmentType text, Weight integer);
INSERT INTO Civilization_JFD_Governments
		(CivilizationType, 				GovernmentType,				Weight)
VALUES	('CIVILIZATION_ORG_COIOT_POMO',	'GOVERNMENT_JFD_TRIBAL',	100);
--------------------------------------------------------------------------------------------------------------------------
-- LEADER FLAVOURS
--------------------------------------------------------------------------------------------------------------------------	
INSERT OR REPLACE INTO Flavors 
		(Type)
VALUES	('FLAVOR_JFD_DECOLONIZATION'),
		('FLAVOR_JFD_MERCENARY'),
		('FLAVOR_JFD_REFORM_GOVERNMENT'),
		('FLAVOR_JFD_REFORM_LEGAL'),
		('FLAVOR_JFD_REFORM_CULTURE'),
		('FLAVOR_JFD_REFORM_ECONOMIC'),
		('FLAVOR_JFD_REFORM_EDUCATION'),
		('FLAVOR_JFD_REFORM_FOREIGN'),
		('FLAVOR_JFD_REFORM_INDUSTRY'),
		('FLAVOR_JFD_REFORM_MILITARY'),
		('FLAVOR_JFD_REFORM_RELIGION'),
		('FLAVOR_JFD_RELIGIOUS_INTOLERANCE'),
		('FLAVOR_JFD_SLAVERY'),
		('FLAVOR_JFD_STATE_RELIGION');

INSERT INTO Leader_Flavors
		(LeaderType,				FlavorType,							Flavor)
VALUES	('LEADER_ORG_COIOT_ESSIE',	'FLAVOR_JFD_DECOLONIZATION',		9),
		('LEADER_ORG_COIOT_ESSIE',	'FLAVOR_JFD_MERCENARY',				3),
		('LEADER_ORG_COIOT_ESSIE',	'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',	6),
		('LEADER_ORG_COIOT_ESSIE',	'FLAVOR_JFD_REFORM_GOVERNMENT',		6),
		('LEADER_ORG_COIOT_ESSIE',	'FLAVOR_JFD_REFORM_LEGAL',			5), 	
		('LEADER_ORG_COIOT_ESSIE',	'FLAVOR_JFD_REFORM_CULTURE',		7),
		('LEADER_ORG_COIOT_ESSIE',	'FLAVOR_JFD_REFORM_ECONOMIC',		6),
		('LEADER_ORG_COIOT_ESSIE',	'FLAVOR_JFD_REFORM_EDUCATION',	 	4),
		('LEADER_ORG_COIOT_ESSIE',	'FLAVOR_JFD_REFORM_FOREIGN',		6),
		('LEADER_ORG_COIOT_ESSIE',	'FLAVOR_JFD_REFORM_INDUSTRY',		5),
		('LEADER_ORG_COIOT_ESSIE',	'FLAVOR_JFD_REFORM_MILITARY',		4),
		('LEADER_ORG_COIOT_ESSIE',	'FLAVOR_JFD_REFORM_RELIGION',		8),
		('LEADER_ORG_COIOT_ESSIE',	'FLAVOR_JFD_SLAVERY',				2),
		('LEADER_ORG_COIOT_ESSIE',	'FLAVOR_JFD_STATE_RELIGION',		8);
--------------------------------------------------------------------------------------------------------------------------
-- JFD'S CULTURAL DIVERSITY (31a31d1c-b9d7-45e1-842c-23232d66cd47)
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_CultureTypes(
	CivilizationType 		text 			default null,
	CultureType 			text			default null,
	SubCultureType 			text			default null,
	ArtDefineTag			text			default	null,
	DecisionsTag			text			default null,
	DefeatScreenEarlyTag	text			default	null,
	DefeatScreenMidTag		text			default	null,
	DefeatScreenLateTag		text			default	null,
	IdealsTag				text			default	null,
	SplashScreenTag			text			default	null,
	SoundtrackTag			text			default	null,
	UnitDialogueTag			text			default null);

INSERT INTO Civilization_JFD_CultureTypes
		(CivilizationType,			ArtDefineTag, CultureType, SubCultureType, DecisionsTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag)
SELECT	'CIVILIZATION_ORG_COIOT_POMO',	ArtDefineTag, CultureType, SubCultureType, DecisionsTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_SHOSHONE';

UPDATE Civilizations 
SET SoundtrackTag = (SELECT SoundtrackTag FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_SHOSHONE')
WHERE Type = 'CIVILIZATION_ORG_COIOT_POMO';