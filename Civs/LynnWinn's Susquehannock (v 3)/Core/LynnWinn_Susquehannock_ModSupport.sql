--yoinked from tophat
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
            (LeaderType,			TraitOne,               TraitTwo)
SELECT      'LEADER_TG_SHEEHAYS',	'POLICY_MERCANTILE_X',	'POLICY_AGGRESSIVE_X'
WHERE EXISTS (SELECT * FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X');
------------------------------	
-- Leaders
------------------------------	
UPDATE Leaders 
SET Description = 'Sheehays [ICON_CONNECTED][ICON_WAR]'
WHERE Type = 'LEADER_TG_SHEEHAYS'
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
SET ArtStyleSuffix = '_IROQUOIS'
WHERE Type = 'CIVILIZATION_TG_SUSQUEHANNOCK'
AND EXISTS (SELECT * FROM Civilizations WHERE ArtStyleSuffix = '_IROQUOIS');
--==========================================================================================================================
-- GEDEMON's YNAEMP (+JFD's v23-25)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMP(CivilizationType, MapPrefix, X, Y, CapitalName, AltX, AltY, AltCapitalName);
INSERT INTO Civilizations_YnAEMP
	(CivilizationType,		MapPrefix,		X,	Y)
VALUES	('CIVILIZATION_TG_SUSQUEHANNOCK',	'GreatestEarth',	19, 47),
	('CIVILIZATION_TG_SUSQUEHANNOCK',		'Cordiform',		14,	32),
	('CIVILIZATION_TG_SUSQUEHANNOCK',		'Yagem',			156, 64),
	('CIVILIZATION_TG_SUSQUEHANNOCK',		'Yahem',			30,	54),
	('CIVILIZATION_TG_SUSQUEHANNOCK',		'Americas',			46,	55),
	('CIVILIZATION_TG_SUSQUEHANNOCK',		'AmericasGiant',	70,	120),
	('CIVILIZATION_TG_SUSQUEHANNOCK',		'NorthAmericaGiant',96,	52),
	('CIVILIZATION_TG_SUSQUEHANNOCK',		'NorthAmericaHuge',	92,	42),
	('CIVILIZATION_TG_SUSQUEHANNOCK',		'EarthMk3',			151, 67),
	('CIVILIZATION_TG_SUSQUEHANNOCK',       'NorthAtlantic',    11, 35),
	('CIVILIZATION_TG_SUSQUEHANNOCK',		'AtlanticGiant',	68,	73);

--CapitalName and AltCapitalName sets a custom City Name on settlement at XY/AltXY coordinates, if needed. Should be TXT_KEY that refers to a string defined elsewhere.
-----------------------------------------
-- Civilizations_YnAEMPRequestedResources
-----------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMPRequestedResources(CivilizationType, MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6);
INSERT INTO Civilizations_YnAEMPRequestedResources
		(CivilizationType, 	 				MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_TG_SUSQUEHANNOCK',	MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YnAEMPRequestedResources WHERE CivilizationType = 'CIVILIZATION_IROQUOIS';
--==========================================================================================================================
-- HAZEL MAP LABELS
--==========================================================================================================================
-- ML_CivCultures
------------------------------	
CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
	(CivType,			CultureType, CultureEra)
SELECT	'CIVILIZATION_TG_SUSQUEHANNOCK',	CultureType, CultureEra
FROM ML_CivCultures WHERE CivType = 'CIVILIZATION_IROQUOIS';
--==========================================================================================================================
-- JFDLC
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
-- GOVERNMENTS
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilization_JFD_Governments(CivilizationType text, GovernmentType text, Weight integer);
INSERT INTO Civilization_JFD_Governments
		(CivilizationType, 				GovernmentType,				Weight)
VALUES	('CIVILIZATION_TG_SUSQUEHANNOCK', 'GOVERNMENT_JFD_TRIBAL',	100);
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
VALUES	('LEADER_TG_SHEEHAYS',	'FLAVOR_JFD_DECOLONIZATION',		9),
	('LEADER_TG_SHEEHAYS',		'FLAVOR_JFD_MERCENARY',				3),
	('LEADER_TG_SHEEHAYS',		'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',	7),
	('LEADER_TG_SHEEHAYS',		'FLAVOR_JFD_REFORM_GOVERNMENT',		7),
	('LEADER_TG_SHEEHAYS',		'FLAVOR_JFD_REFORM_LEGAL',			6), 	
	('LEADER_TG_SHEEHAYS',		'FLAVOR_JFD_REFORM_CULTURE',		7),
	('LEADER_TG_SHEEHAYS',		'FLAVOR_JFD_REFORM_ECONOMIC',		7),
	('LEADER_TG_SHEEHAYS',		'FLAVOR_JFD_REFORM_EDUCATION',	 	5),
	('LEADER_TG_SHEEHAYS',		'FLAVOR_JFD_REFORM_FOREIGN',		6),
	('LEADER_TG_SHEEHAYS',		'FLAVOR_JFD_REFORM_INDUSTRY',		5),
	('LEADER_TG_SHEEHAYS',		'FLAVOR_JFD_REFORM_MILITARY',		8),
	('LEADER_TG_SHEEHAYS',		'FLAVOR_JFD_REFORM_RELIGION',		7),
	('LEADER_TG_SHEEHAYS',		'FLAVOR_JFD_SLAVERY',				3),
	('LEADER_TG_SHEEHAYS',		'FLAVOR_JFD_STATE_RELIGION',		5);
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
	(CivilizationType,		ArtDefineTag, CultureType, SubCultureType, DecisionsTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag)
SELECT	'CIVILIZATION_TG_SUSQUEHANNOCK',	ArtDefineTag, CultureType, SubCultureType, DecisionsTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_IROQUOIS';

UPDATE Civilizations 
SET SoundtrackTag = (SELECT SoundtrackTag FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_IROQUOIS')
WHERE Type = 'CIVILIZATION_TG_SUSQUEHANNOCK';