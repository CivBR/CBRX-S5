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
SELECT      'LEADER_ASQ_ANACAONA',	'POLICY_SPIRITUAL_X',	'POLICY_CREATIVE_X'
WHERE EXISTS (SELECT * FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X');
------------------------------	
-- Leaders
------------------------------	
UPDATE Leaders 
SET Description = 'Anacaona [ICON_PEACE][ICON_CULTURE]'
WHERE Type = 'LEADER_ASQ_ANACAONA'
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
SET ArtStyleSuffix = '_MAYA'
WHERE Type = 'CIVILIZATION_ASQ_XARAGUA'
AND EXISTS (SELECT * FROM Civilizations WHERE ArtStyleSuffix = '_AYA');
--==========================================================================================================================
-- GEDEMON's YNAEMP (+JFD's v23-25)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMP(CivilizationType, MapPrefix, X, Y, CapitalName, AltX, AltY, AltCapitalName);
INSERT INTO Civilizations_YnAEMP
		(CivilizationType,						MapPrefix,				X,		Y,		AltX,	AltY,	AltCapitalName)
VALUES	-- ('CIVILIZATION_ASQ_XARAGUA',	'AfriAsiaAust',			0,		0,		null,	null,	null),
		-- ('CIVILIZATION_ASQ_XARAGUA',	'AfricaLarge',			0,		0,		null,	null,	null),
		-- ('CIVILIZATION_ASQ_XARAGUA',	'AfriSouthEuro',		0,		0,		null,	null,	null),
		('CIVILIZATION_ASQ_XARAGUA',		'Americas',				48,		43,		null,	null,	null),
		-- ('CIVILIZATION_ASQ_XARAGUA',	'Asia',					0,		0,		null,	null,	null),
		('CIVILIZATION_ASQ_XARAGUA',		'Cordiform',			12,		26,		null,	null,	null),
		('CIVILIZATION_ASQ_XARAGUA',		'EarthMk3',				154,	50,		null,	null,	null),
		-- ('CIVILIZATION_ASQ_XARAGUA',	'EastAsia',				0,		0,		null,	null,	null),
		-- ('CIVILIZATION_ASQ_XARAGUA',	'EuroLarge',			0,		0,		null,	null,	null),
		-- ('CIVILIZATION_ASQ_XARAGUA',	'EuroLargeNew',			0,		0,		null,	null,	null),
		('CIVILIZATION_ASQ_XARAGUA',		'GreatestEarth',		26,		35,		null,	null,	null),
		-- ('CIVILIZATION_ASQ_XARAGUA',	'IndianOcean',			0,		0,		null,	null,	null),
		-- ('CIVILIZATION_ASQ_XARAGUA',	'Mediterranean',		0,		0,		null,	null,	null),
		-- ('CIVILIZATION_ASQ_XARAGUA',	'Mesopotamia',			0,		0,		null,	null,	null),
		('CIVILIZATION_ASQ_XARAGUA',		'NorthAtlantic',		2,		4,		null,	null,	null),
		-- ('CIVILIZATION_ASQ_XARAGUA',	'NorthEastAsia',		0,		0,		null,	null,	null),
		-- ('CIVILIZATION_ASQ_XARAGUA',	'NorthWestEurope',		0,		0,		null,	null,	null),
		-- ('CIVILIZATION_ASQ_XARAGUA',	'Orient',				0,		0,		null,	null,	null),
		-- ('CIVILIZATION_ASQ_XARAGUA',	'SouthPacific',			0,		0,		null,	null,	null),
		('CIVILIZATION_ASQ_XARAGUA',		'Yagem',				154,	47,		null,	null,	null),
		('CIVILIZATION_ASQ_XARAGUA',		'Yahem',				32,		43,		null,	null,	null);

--CapitalName and AltCapitalName sets a custom City Name on settlement at XY/AltXY coordinates, if needed. Should be TXT_KEY that refers to a string defined elsewhere.
-----------------------------------------
-- Civilizations_YnAEMPRequestedResources
-----------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMPRequestedResources(CivilizationType, MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6);
INSERT INTO Civilizations_YnAEMPRequestedResources
		(CivilizationType, 	 			MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_ASQ_XARAGUA',	MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YnAEMPRequestedResources WHERE CivilizationType = 'CIVILIZATION_MAYA';
--==========================================================================================================================
-- HAZEL MAP LABELS
--==========================================================================================================================
-- ML_CivCultures
------------------------------	
CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
		(CivType,					CultureType, CultureEra)
SELECT	'CIVILIZATION_ASQ_XARAGUA',	CultureType, CultureEra
FROM ML_CivCultures WHERE CivType = 'CIVILIZATION_MAYA';
--==========================================================================================================================
-- JFDLC
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
-- GOVERNMENTS
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilization_JFD_Governments(CivilizationType text, GovernmentType text, Weight integer);
INSERT INTO Civilization_JFD_Governments
		(CivilizationType, 				GovernmentType,				Weight)
VALUES	('CIVILIZATION_ASQ_XARAGUA',	'GOVERNMENT_JFD_TRIBAL',	100);
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
VALUES	('LEADER_ASQ_ANACAONA',	'FLAVOR_JFD_DECOLONIZATION',		9),
		('LEADER_ASQ_ANACAONA',	'FLAVOR_JFD_MERCENARY',				3),
		('LEADER_ASQ_ANACAONA',	'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',	6),
		('LEADER_ASQ_ANACAONA',	'FLAVOR_JFD_REFORM_GOVERNMENT',		6),
		('LEADER_ASQ_ANACAONA',	'FLAVOR_JFD_REFORM_LEGAL',			5), 	
		('LEADER_ASQ_ANACAONA',	'FLAVOR_JFD_REFORM_CULTURE',		7),
		('LEADER_ASQ_ANACAONA',	'FLAVOR_JFD_REFORM_ECONOMIC',		6),
		('LEADER_ASQ_ANACAONA',	'FLAVOR_JFD_REFORM_EDUCATION',	 	4),
		('LEADER_ASQ_ANACAONA',	'FLAVOR_JFD_REFORM_FOREIGN',		6),
		('LEADER_ASQ_ANACAONA',	'FLAVOR_JFD_REFORM_INDUSTRY',		4),
		('LEADER_ASQ_ANACAONA',	'FLAVOR_JFD_REFORM_MILITARY',		4),
		('LEADER_ASQ_ANACAONA',	'FLAVOR_JFD_REFORM_RELIGION',		8),
		('LEADER_ASQ_ANACAONA',	'FLAVOR_JFD_SLAVERY',				2),
		('LEADER_ASQ_ANACAONA',	'FLAVOR_JFD_STATE_RELIGION',		9);
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
SELECT	'CIVILIZATION_ASQ_XARAGUA',	ArtDefineTag, CultureType, SubCultureType, DecisionsTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_MAYA';

UPDATE Civilizations 
SET SoundtrackTag = (SELECT SoundtrackTag FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_MAYA')
WHERE Type = 'CIVILIZATION_ASQ_XARAGUA';

--==========================================================================================================================
-- TOMATEKH HISTORICAL RELIGIONS
--==========================================================================================================================
-- Civilization_Religions
------------------------------
UPDATE Civilization_Religions 
SET ReligionType = 'RELIGION_ZEMIISM'
WHERE CivilizationType = 'CIVILIZATION_ASQ_XARAGUA'
AND EXISTS (SELECT * FROM Religions WHERE Type = 'RELIGION_ZEMIISM');