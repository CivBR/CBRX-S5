-- Civilization_JFD_CultureTypes
-------------------------------------  
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
		(CivilizationType,				ArtDefineTag,	CultureType,			SubCultureType, DecisionsTag,	IdealsTag,		SplashScreenTag, SoundtrackTag, UnitDialogueTag)
SELECT	'CIVILIZATION_CL_TLINGIT',		'JFD_Pacific',	'CULTURE_JFD_PACIFIC',	SubCultureType, 'JFD_Pacific',	'JFD_Pacific',	'JFD_Pacific',	 'JFD_Pacific',	UnitDialogueTag
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_SHOSHONE';
--==========================================================================================================================
-- HAZEL MAP LABELS
--==========================================================================================================================
-- ML_CivCultures
------------------------------ 
CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
        (CivType,                        CultureType,            CultureEra)
VALUES  ('CIVILIZATION_CL_TLINGIT',      'TP_CANADIAN',  'ANY');
--=======================================================================================================================
-- BINGLES CIV IV TRAITS
--=======================================================================================================================
-- Leader_SharedTraits
------------------------------ 
CREATE TABLE IF NOT EXISTS
    Leader_SharedTraits (
    LeaderType          text    REFERENCES Leaders(TYPE)        DEFAULT NULL,
    TraitOne            text    REFERENCES Policies(TYPE)       DEFAULT NULL,
    TraitTwo            text    REFERENCES Policies(TYPE)       DEFAULT NULL);
     
-- INSERT INTO Leader_SharedTraits
       -- (LeaderType,                             TraitOne,                               TraitTwo)
-- VALUES ('LEADER_CL_SHAKES', 'POLICY_SEAFARING_X',   'POLICY_EXPANSIVE_X');
------------------------------ 
-- Leaders
------------------------------ 
UPDATE Leaders
SET Description = (CASE WHEN EXISTS(SELECT TYPE FROM Policies WHERE TYPE = 'POLICY_PHILOSOPHICAL_X')
        THEN 'Sheiyksh I [ICON_GREAT_EXPLORER][ICON_FOOD]'
        ELSE 'TXT_KEY_LEADER_CL_SHAKES' END)
WHERE TYPE = 'LEADER_CL_SHAKES';
 
--==========================================================================================================================
-- Historical Religions
--==========================================================================================================================
 
-- INSERT INTO Civilization_Religions
                -- (CivilizationType,                      ReligionType)
-- VALUES          ('CIVILIZATION_CL_TLINGIT',             'RELIGION_ORTHODOXY');
 
UPDATE Civilization_Religions SET ReligionType =
    ( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_SGAANAANG' )
	THEN 'RELIGION_SGAANAANG'
	ELSE 'RELIGION_ORTHODOXY' END
	) WHERE CivilizationType = 'CIVILIZATION_CL_TLINGIT';	
--==========================================================================================================================
-- JFD's EXPLORATION CONTINUED EXPANDED
--==========================================================================================================================
-- Civilization_JFD_ColonialCityNames
------------------------------------------------------------   
CREATE TABLE IF NOT EXISTS
Civilization_JFD_ColonialCityNames (
        CivilizationType                                                        text    REFERENCES Civilizations(TYPE)          DEFAULT NULL,
        ColonyName                                                                      text                                                                            DEFAULT NULL,
        LinguisticType                                                          text                                                                            DEFAULT NULL,
        CultureType                                                                     text                                                                            DEFAULT NULL);
 
INSERT INTO Civilization_JFD_ColonialCityNames
                (CivilizationType,                                              ColonyName,                                                             LinguisticType)
VALUES          ('CIVILIZATION_CL_TLINGIT',                      NULL,                                                                   'JFD_NorthAmerican');
 
-- INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
                -- (CivilizationType,                                              RevolutionaryCivilizationType)
-- SELECT  ('CIVILIZATION_CL_TLINGIT'),     ('CIVILIZATION_CL_AUSTRALIA')
-- WHERE EXISTS (SELECT TYPE FROM Civilizations WHERE TYPE = 'CIVILIZATION_CLWABANAKI');

------------------------------------------------------------ 
-- Flavors
------------------------------------------------------------   
INSERT OR REPLACE INTO Flavors
                (TYPE)
VALUES  ('FLAVOR_JFD_DECOLONIZATION');
------------------------------------------------------------
-- Leader_Flavors
------------------------------------------------------------   
INSERT INTO Leader_Flavors
                (LeaderType,        FlavorType,                     Flavor)
VALUES  ('LEADER_CL_SHAKES',        'FLAVOR_JFD_DECOLONIZATION',         2);
 
--==========================================================================================================================   
-- JFD's and Pouakai's MERCENARIES
--==========================================================================================================================
-- Flavors
------------------------------------------------------------   
INSERT OR REPLACE INTO Flavors
                (TYPE)
VALUES  ('FLAVOR_JFD_MERCENARY');
------------------------------------------------------------
-- Leader_Flavors
------------------------------------------------------------   
INSERT INTO Leader_Flavors
                (LeaderType,                            FlavorType,                                     Flavor)
VALUES  ('LEADER_CL_SHAKES',        'FLAVOR_JFD_MERCENARY',         8);
--==========================================================================================================================   
-- JFD's PIETY
--==========================================================================================================================   
-- Flavors
------------------------------------------------------------   
INSERT OR REPLACE INTO Flavors
                (TYPE)
VALUES  ('FLAVOR_JFD_RELIGIOUS_INTOLERANCE');
------------------------------------------------------------
-- Leader_Flavors
 
INSERT INTO Leader_Flavors
                (LeaderType,        FlavorType,                                Flavor)
VALUES  ('LEADER_CL_SHAKES',        'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',             4);
--==========================================================================================================================   
-- JFD's SOVEREIGNTY
--==========================================================================================================================
-- Civilization_JFD_Governments
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS
        Civilization_JFD_Governments (
        CivilizationType                                text            REFERENCES Civilizations(TYPE)                                  DEFAULT NULL,
        GovernmentType                                  text                                                                                                            DEFAULT NULL,
        Weight                                                  INTEGER                                                                                                         DEFAULT 0);
 
INSERT INTO Civilization_JFD_Governments
                (CivilizationType,                                     GovernmentType,                         Weight)
VALUES  ('CIVILIZATION_CL_TLINGIT',      'GOVERNMENT_JFD_REPUBLIC',      70);
------------------------------------------------------------
-- Civilization_JFD_Titles
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS
        Civilization_JFD_Titles (
        CivilizationType                                text            REFERENCES Civilizations(TYPE)                                  DEFAULT NULL,
        CultureType                                             text                                                                                                            DEFAULT NULL,
        ReligionType                                    text            REFERENCES Religions(TYPE)                                              DEFAULT NULL,
        DefaultTitle                                    text                                                                                                            DEFAULT NULL,
        UniqueTitle                                             text                                                                                                            DEFAULT NULL,
        UseAdjective                                    BOOLEAN                                                                                                         DEFAULT 0);    
 
INSERT INTO Civilization_JFD_Titles
        (CivilizationType,                  DefaultTitle,                                   UniqueTitle)
VALUES  ('CIVILIZATION_CL_TLINGIT',   'TXT_KEY_GOVERNMENT_JFD_TRIBE_TITLE_LEADER',    'TXT_KEY_GOVERNMENT_JFD_TRIBE_TITLE_LEADER_TLINGIT');
------------------------------------------------------------   
-- Civilization_JFD_HeadsOfGovernment  
------------------------------------------------------------   
CREATE TABLE IF NOT EXISTS      
        Civilization_JFD_HeadsOfGovernment (   
        CivilizationType                                text            REFERENCES Civilizations(TYPE)                                  DEFAULT NULL,
        CultureType                                             text                                                                                                            DEFAULT NULL,
        HeadOfGovernmentName                    text                                                                                                            DEFAULT NULL);
 
 
INSERT INTO Civilization_JFD_HeadsOfGovernment
        (CivilizationType,                                      HeadOfGovernmentName)
VALUES  ('CIVILIZATION_CL_TLINGIT',              'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_TLINGIT_1'),
        ('CIVILIZATION_CL_TLINGIT',              'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_TLINGIT_2');
------------------------------------------------------------
-- Flavors
------------------------------------------------------------   
INSERT OR REPLACE INTO Flavors
                (TYPE)
VALUES  ('FLAVOR_JFD_REFORM_GOVERNMENT'),
		('FLAVOR_JFD_REFORM_LEGAL'),
        ('FLAVOR_JFD_REFORM_CULTURE'),
        ('FLAVOR_JFD_REFORM_ECONOMIC'),
		('FLAVOR_JFD_REFORM_EDUCATION'),
        ('FLAVOR_JFD_REFORM_FOREIGN'),
        ('FLAVOR_JFD_REFORM_INDUSTRY'),
        ('FLAVOR_JFD_REFORM_MILITARY'),
        ('FLAVOR_JFD_REFORM_RELIGION');
------------------------------------------------------------
-- Leader_Flavors
------------------------------------------------------------   
--Each flavour corresponds to one of the seven Reform Categories, and how likely a civ is to take a reform in either the Right, Centre, or Left column.
--A value of 1-3 will favour Left Reforms. A value of 4-6 will value Centre Reforms. A value of 7-10 will value Right Reforms. The strength of the value will determine how soon a Leader will implement that Reform.
INSERT INTO Leader_Flavors
         (LeaderType,               FlavorType,						   Flavor)
VALUES  ('LEADER_CL_SHAKES',		'FLAVOR_JFD_REFORM_GOVERNMENT',         5),
        ('LEADER_CL_SHAKES',        'FLAVOR_JFD_REFORM_LEGAL',              6),
        ('LEADER_CL_SHAKES',        'FLAVOR_JFD_REFORM_CULTURE',            5),
        ('LEADER_CL_SHAKES',        'FLAVOR_JFD_REFORM_ECONOMIC',           7),
        ('LEADER_CL_SHAKES',        'FLAVOR_JFD_REFORM_EDUCATION',          3),
        ('LEADER_CL_SHAKES',        'FLAVOR_JFD_REFORM_FOREIGN',            5),
        ('LEADER_CL_SHAKES',        'FLAVOR_JFD_REFORM_INDUSTRY',           7),
        ('LEADER_CL_SHAKES',        'FLAVOR_JFD_REFORM_RELIGION',           6);
--==========================================================================================================================           
--==========================================================================================================================
--==========================================================================================================================
-- GEDEMON R.E.D.
--==========================================================================================================================
-- Civilizations
------------------------------	
UPDATE Civilizations 
SET ArtStyleSuffix = '_IROQUOIS'
WHERE Type = 'CIVILIZATION_CL_TLINGIT'
AND EXISTS (SELECT * FROM Civilizations WHERE ArtStyleSuffix = '_IROQUOIS');
--==========================================================================================================================
-- STANDARD MOD SUPPORT Emerald Edit
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
-- GOVERNMENTS
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilization_JFD_Governments
		(CivilizationType, 				GovernmentType,				Weight)
VALUES	('CIVILIZATION_CL_TLINGIT', 	'GOVERNMENT_JFD_TRIBAL',	80),
		('CIVILIZATION_CL_TLINGIT', 	'GOVERNMENT_JFD_MONARCHY',	10);