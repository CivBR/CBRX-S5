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
            (LeaderType,				TraitOne,                  TraitTwo)
SELECT      'LEADER_ZRQ_SPEAROWL',	'POLICY_AGGRESSIVE_X',		'POLICY_EXPANSIVE_X'
WHERE EXISTS (SELECT * FROM Policies WHERE Type = 'POLICY_CREATIVE_X');
------------------------------	
-- Leaders
------------------------------	
UPDATE Leaders 
SET Description = 'Spearthrower Owl [ICON_WAR][ICON_FOOD]'
WHERE Type = 'LEADER_ZRQ_SPEAROWL'
AND EXISTS (SELECT * FROM Policies WHERE Type = 'POLICY_CREATIVE_X');
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
SET ArtStyleSuffix = '_AZTEC'
WHERE Type = 'CIVILIZATION_ZRQ_TEO_SPEAROWL'
AND EXISTS (SELECT * FROM Civilizations WHERE ArtStyleSuffix = '_AZTEC');
--==========================================================================================================================
------------------------------------------------------------------------------------------------------------------------
-- Civilizations_YnAEMP
------------------------------------------------------------------------------------------------------------------------	

-----------------------------------------
-- Civilizations_YnAEMPRequestedResources
-----------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMPRequestedResources(CivilizationType, MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6);
INSERT INTO Civilizations_YnAEMPRequestedResources
	(CivilizationType, 	 	MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_ZRQ_TEO_SPEAROWL',	MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YnAEMPRequestedResources WHERE CivilizationType = 'CIVILIZATION_AZTEC';
--==========================================================================================================================
-- HAZEL MAP LABELS
--==========================================================================================================================
-- ML_CivCultures
------------------------------	
CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
	(CivType,			CultureType, CultureEra)
SELECT	'CIVILIZATION_ZRQ_TEO_SPEAROWL',	CultureType, CultureEra
FROM ML_CivCultures WHERE CivType = 'CIVILIZATION_AZTEC';
--==========================================================================================================================
-- JFDLC
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
-- GOVERNMENTS
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilization_JFD_Governments(CivilizationType text, GovernmentType text, Weight integer);
INSERT INTO Civilization_JFD_Governments
	(CivilizationType, 		GovernmentType,			Weight)
VALUES	('CIVILIZATION_ZRQ_TEO_SPEAROWL', 	'GOVERNMENT_JFD_MONARCHY',	60),
	('CIVILIZATION_ZRQ_TEO_SPEAROWL', 	'GOVERNMENT_JFD_PRINCIPALITY',      30);
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
	(LeaderType,			FlavorType,				 Flavor)
VALUES	('LEADER_ZRQ_SPEAROWL',	'FLAVOR_JFD_DECOLONIZATION',		 1),
	('LEADER_ZRQ_SPEAROWL',	'FLAVOR_JFD_MERCENARY',			 3),
	('LEADER_ZRQ_SPEAROWL',	'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',	 3),
	('LEADER_ZRQ_SPEAROWL',	'FLAVOR_JFD_REFORM_GOVERNMENT',		 4),
	('LEADER_ZRQ_SPEAROWL',	'FLAVOR_JFD_REFORM_LEGAL',		 6), 	
	('LEADER_ZRQ_SPEAROWL',	'FLAVOR_JFD_REFORM_CULTURE',		 9),
	('LEADER_ZRQ_SPEAROWL',	'FLAVOR_JFD_REFORM_EDUCATION',	 	 2),
	('LEADER_ZRQ_SPEAROWL',	'FLAVOR_JFD_REFORM_FOREIGN',		 4),
	('LEADER_ZRQ_SPEAROWL',	'FLAVOR_JFD_REFORM_MILITARY',		 8),
	('LEADER_ZRQ_SPEAROWL',	'FLAVOR_JFD_REFORM_RELIGION',		 4),
	('LEADER_ZRQ_SPEAROWL',	'FLAVOR_JFD_SLAVERY',			 6),
	('LEADER_ZRQ_SPEAROWL',	'FLAVOR_JFD_STATE_RELIGION',		 4);

-- randomized economic and industry reform values
CREATE TABLE SpearOwlRandomInt(Value integer default 8);

INSERT INTO SpearOwlRandomInt(Value)
SELECT random();

INSERT INTO Leader_Flavors
	(LeaderType,	FlavorType,	Flavor)
SELECT	'LEADER_ZRQ_SPEAROWL',	'FLAVOR_JFD_REFORM_ECONOMIC',	ABS(Value % 10)
FROM SpearOwlRandomInt;

INSERT INTO Leader_Flavors
	(LeaderType,	FlavorType,	Flavor)
SELECT	'LEADER_ZRQ_SPEAROWL',	'FLAVOR_JFD_REFORM_INDUSTRY',	ABS(Value % 10)
FROM SpearOwlRandomInt;
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
	DefeatScreenEarlyTag		text			default	null,
	DefeatScreenMidTag		text			default	null,
	DefeatScreenLateTag		text			default	null,
	IdealsTag			text			default	null,
	SplashScreenTag			text			default	null,
	SoundtrackTag			text			default	null,
	UnitDialogueTag			text			default null);

INSERT INTO Civilization_JFD_CultureTypes
	(CivilizationType,		ArtDefineTag, CultureType, SubCultureType, DecisionsTag, IdealsTag, SplashScreenTag, SoundtrackTag, SplashScreenTag)
SELECT	'CIVILIZATION_ZRQ_TEO_SPEAROWL',	ArtDefineTag, CultureType, SubCultureType, DecisionsTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_AZTEC';

--==========================================================================================================================
-- TOMATEKH'S HISTORICAL RELIGIONS COMPLETE
--==========================================================================================================================
UPDATE Civilization_Religions SET ReligionType =
( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type="RELIGION_TLATEOMATILIZTLI" )
THEN "RELIGION_TLATEOMATILIZTLI"
ELSE "RELIGION_CHRISTIANITY" END
) WHERE CivilizationType = "CIVILIZATION_ZRQ_TEO_SPEAROWL";