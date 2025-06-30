------------------------------------------------------------------------------------------------------------------------
--=======================================================================================================================
-- MASTER TABLES
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS COMMUNITY (Type TEXT, Value INTEGER);
CREATE TABLE IF NOT EXISTS Civilization_JFD_ColonialCityNames(CivilizationType text, ColonyName text, LinguisticType text);
CREATE TABLE IF NOT EXISTS Civilization_JFD_Governments(CivilizationType text, CultureType text, LegislatureName text, OfficeTitle text, GovernmentType text, Weight integer);
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMP(CivilizationType, MapPrefix, X, Y, CapitalName, AltX, AltY, AltCapitalName);
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMPRequestedResources(CivilizationType, MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6);
CREATE TABLE IF NOT EXISTS MinorCivilizations_YnAEMP(MinorCivType, MapPrefix, X, Y, CapitalName, AltX, AltY, AltCapitalName);
CREATE TABLE IF NOT EXISTS JFD_Civilopedia_HideFromPedia(Type text);
CREATE TABLE IF NOT EXISTS JFD_GlobalUserSettings(Type text, Value integer default 1);

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
     
INSERT INTO Leader_SharedTraits
        (LeaderType,			TraitOne,				TraitTwo)
SELECT  'LEADER_MC_HOTU_MATUA',	'POLICY_CREATIVE_X',	'POLICY_SPIRITUAL_X'
WHERE EXISTS (SELECT * FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X');

INSERT INTO Leader_SharedTraits
        (LeaderType,			TraitOne,				TraitTwo)
SELECT  'LEADER_MC_AHO_EITU',	'POLICY_SEAFARING_X',	'POLICY_DIPLOMATIC_X'
WHERE EXISTS (SELECT * FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X');

INSERT INTO Leader_SharedTraits
        (LeaderType,			TraitOne,				TraitTwo)
SELECT  'LEADER_MC_TE_RAUPARAHA',	'POLICY_AGGRESSIVE_X',	'POLICY_PROTECTIVE_X'
WHERE EXISTS (SELECT * FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X');

INSERT OR REPLACE INTO Leader_SharedTraits
        (LeaderType,			TraitOne,				TraitTwo)
SELECT  'LEADER_KAMEHAMEHA',	'POLICY_PHILOSOPHICAL_X',	'POLICY_INDUSTRIOUS_X'
WHERE EXISTS (SELECT * FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X');
 
------------------------------  
-- Leaders
------------------------------  
UPDATE Leaders
SET Description = 'TXT_KEY_MC_HOTU_MATUA_DESC_IV_TRAITS'
WHERE Type = 'LEADER_MC_HOTU_MATUA'
AND EXISTS (SELECT * FROM Policies WHERE TYPE = 'POLICY_PHILOSOPHICAL_X');

UPDATE Leaders
SET Description = 'TXT_KEY_MC_AHO_EITU_DESC_IV_TRAITS'
WHERE Type = 'LEADER_MC_AHO_EITU'
AND EXISTS (SELECT * FROM Policies WHERE TYPE = 'POLICY_PHILOSOPHICAL_X');

UPDATE Leaders
SET Description = 'TXT_KEY_MC_TE_RAUPARAHA_DESC_IV_TRAITS'
WHERE Type = 'LEADER_MC_TE_RAUPARAHA'
AND EXISTS (SELECT * FROM Policies WHERE TYPE = 'POLICY_PHILOSOPHICAL_X');

UPDATE Leaders
SET Description = 'TXT_KEY_MC_KAMEHAMEHA_DESC_IV_TRAITS'
WHERE Type = 'LEADER_KAMEHAMEKA'
AND EXISTS (SELECT * FROM Policies WHERE TYPE = 'POLICY_PHILOSOPHICAL_X');

--==========================================================================================================================
-- Events & Decisions
--==========================================================================================================================
-- DecisionsAddin_Support
------------------------------
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
INSERT INTO DecisionsAddin_Support (FileName) VALUES ('MC_Polynesia_Decisions.lua');

--==========================================================================================================================
-- JFDLC
--==========================================================================================================================
--====================================
-- Miscellanenous
--====================================
--INSERT INTO JFD_Civilopedia_HideFromPedia
--		(Type)
--VALUES	('');
--====================================
-- JFD's Cultural Diversity
--====================================
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
SELECT	'CIVILIZATION_MC_MAORI',	ArtDefineTag, CultureType, SubCultureType, DecisionsTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_POLYNESIA';

INSERT INTO Civilization_JFD_CultureTypes
		(CivilizationType,			ArtDefineTag, CultureType, SubCultureType, DecisionsTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag)
SELECT	'CIVILIZATION_MC_TONGA',	ArtDefineTag, CultureType, SubCultureType, DecisionsTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_POLYNESIA';

INSERT INTO Civilization_JFD_CultureTypes
		(CivilizationType,			ArtDefineTag, CultureType, SubCultureType, DecisionsTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag)
SELECT	'CIVILIZATION_MC_RAPA_NUI',	ArtDefineTag, CultureType, SubCultureType, DecisionsTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_POLYNESIA';

------------------------------  
-- Flavours
------------------------------  
INSERT OR REPLACE INTO Flavors 
		(Type)
VALUES	('FLAVOR_JFD_DECOLONIZATION'),			--0-10. Determines likelihood for annexing a colony, where 0 means never, and 10 means as soon as possible.
		('FLAVOR_JFD_MERCENARY'),				--0-10. Determines likelihood of taking out Mercenary Contracts, where 0 means never, and 10 means as soon as possible.
		('FLAVOR_JFD_RELIGIOUS_INTOLERANCE'),	--0-12. Determines the diplomatic penalty/bonus with leaders of a different/same state religion
		('FLAVOR_JFD_REFORM_GOVERNMENT'),		--0-10. Determines Reform preference; corresponding to Left>Centre>Right/Liberal to Authoritarian continuum. 1-4=Left, 5-6=Centre, 7-10=Right. For government issues.
		('FLAVOR_JFD_REFORM_LEGAL'),			--same as above for legal issues. 
		('FLAVOR_JFD_REFORM_CULTURE'),			--same as above for cultural issues.
		('FLAVOR_JFD_REFORM_ECONOMIC'),			--same as above for economic issues. 
		('FLAVOR_JFD_REFORM_EDUCATION'),		--same as above for educational issues.
		('FLAVOR_JFD_REFORM_FOREIGN'),			--same as above for diplomatic/international issues.
		('FLAVOR_JFD_REFORM_INDUSTRY'),			--same as above for industrial/labour issues.
		('FLAVOR_JFD_REFORM_MILITARY'),			--same as above for military issues.
		('FLAVOR_JFD_REFORM_RELIGION'),			--same as above for religious issues.
		('FLAVOR_JFD_SLAVERY'),					--0-10. Determines likelihood of enslaving Cities and spending Shackles on Slave Units, where 0 means never, and 10 as much as possible.
		('FLAVOR_JFD_STATE_RELIGION');			--0-12. Determines chance to adopt a State Religion, where 0 means never. 9+ also means this leader will never secularize.

INSERT INTO Leader_Flavors
		(LeaderType,				FlavorType,							 Flavor)
VALUES	('LEADER_MC_AHO_EITU',		'FLAVOR_JFD_DECOLONIZATION',		 3),
		('LEADER_MC_AHO_EITU',		'FLAVOR_JFD_MERCENARY',				 4),
		('LEADER_MC_AHO_EITU',		'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',	 5),
		('LEADER_MC_AHO_EITU',		'FLAVOR_JFD_REFORM_GOVERNMENT',		 4), --Scale of Liberal to Authoritarian.
		('LEADER_MC_AHO_EITU',		'FLAVOR_JFD_REFORM_LEGAL',			 6), 	
		('LEADER_MC_AHO_EITU',		'FLAVOR_JFD_REFORM_CULTURE',		 6),
		('LEADER_MC_AHO_EITU',		'FLAVOR_JFD_REFORM_ECONOMIC',		 4),
		('LEADER_MC_AHO_EITU',		'FLAVOR_JFD_REFORM_EDUCATION',	 	 7),
		('LEADER_MC_AHO_EITU',		'FLAVOR_JFD_REFORM_FOREIGN',		 2),
		('LEADER_MC_AHO_EITU',		'FLAVOR_JFD_REFORM_INDUSTRY',		 4),
		('LEADER_MC_AHO_EITU',		'FLAVOR_JFD_REFORM_MILITARY',		 3),
		('LEADER_MC_AHO_EITU',		'FLAVOR_JFD_REFORM_RELIGION',		 6),
		('LEADER_MC_AHO_EITU',		'FLAVOR_JFD_SLAVERY',				 3),
		('LEADER_MC_AHO_EITU',		'FLAVOR_JFD_STATE_RELIGION',		 6),
		('LEADER_MC_TE_RAUPARAHA',	'FLAVOR_JFD_DECOLONIZATION',		 6),
		('LEADER_MC_TE_RAUPARAHA',	'FLAVOR_JFD_MERCENARY',				 9),
		('LEADER_MC_TE_RAUPARAHA',	'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',	 4),
		('LEADER_MC_TE_RAUPARAHA',	'FLAVOR_JFD_REFORM_GOVERNMENT',		 7), --Scale of Liberal to Authoritarian.
		('LEADER_MC_TE_RAUPARAHA',	'FLAVOR_JFD_REFORM_LEGAL',			 6), 	
		('LEADER_MC_TE_RAUPARAHA',	'FLAVOR_JFD_REFORM_CULTURE',		 6),
		('LEADER_MC_TE_RAUPARAHA',	'FLAVOR_JFD_REFORM_ECONOMIC',		 5),
		('LEADER_MC_TE_RAUPARAHA',	'FLAVOR_JFD_REFORM_EDUCATION',	 	 4),
		('LEADER_MC_TE_RAUPARAHA',	'FLAVOR_JFD_REFORM_FOREIGN',		 7),
		('LEADER_MC_TE_RAUPARAHA',	'FLAVOR_JFD_REFORM_INDUSTRY',		 6),
		('LEADER_MC_TE_RAUPARAHA',	'FLAVOR_JFD_REFORM_MILITARY',		 8),
		('LEADER_MC_TE_RAUPARAHA',	'FLAVOR_JFD_REFORM_RELIGION',		 4),
		('LEADER_MC_TE_RAUPARAHA',	'FLAVOR_JFD_SLAVERY',				 8),
		('LEADER_MC_TE_RAUPARAHA',	'FLAVOR_JFD_STATE_RELIGION',		 5),
		('LEADER_MC_HOTU_MATUA',	'FLAVOR_JFD_DECOLONIZATION',		 8),
		('LEADER_MC_HOTU_MATUA',	'FLAVOR_JFD_MERCENARY',				 6),
		('LEADER_MC_HOTU_MATUA',	'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',	 8),
		('LEADER_MC_HOTU_MATUA',	'FLAVOR_JFD_REFORM_GOVERNMENT',		 7), --Scale of Liberal to Authoritarian.
		('LEADER_MC_HOTU_MATUA',	'FLAVOR_JFD_REFORM_LEGAL',			 6), 	
		('LEADER_MC_HOTU_MATUA',	'FLAVOR_JFD_REFORM_CULTURE',		 6),
		('LEADER_MC_HOTU_MATUA',	'FLAVOR_JFD_REFORM_ECONOMIC',		 2),
		('LEADER_MC_HOTU_MATUA',	'FLAVOR_JFD_REFORM_EDUCATION',	 	 2),
		('LEADER_MC_HOTU_MATUA',	'FLAVOR_JFD_REFORM_FOREIGN',		 2),
		('LEADER_MC_HOTU_MATUA',	'FLAVOR_JFD_REFORM_INDUSTRY',		 3),
		('LEADER_MC_HOTU_MATUA',	'FLAVOR_JFD_REFORM_MILITARY',		 6),
		('LEADER_MC_HOTU_MATUA',	'FLAVOR_JFD_REFORM_RELIGION',		 9),
		('LEADER_MC_HOTU_MATUA',	'FLAVOR_JFD_SLAVERY',				 5),
		('LEADER_MC_HOTU_MATUA',	'FLAVOR_JFD_STATE_RELIGION',		 8);
--==========================================================================================================================
-- HAZEL MAP LABELS
--==========================================================================================================================
-- ML_CivCultures
------------------------------  
CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
        (CivType,						CultureType,    CultureEra)
VALUES  ('CIVILIZATION_MC_MAORI',		'PACIFIC',		'ANY'),
		('CIVILIZATION_MC_MAORI',		'BRITISH',		'MODERN'),
		('CIVILIZATION_MC_RAPA_NUI',	'PACIFIC',		'ANY'),
		('CIVILIZATION_MC_TONGA',		'PACIFIC',		'ANY');
--==========================================================================================================================
-- TOMATEKH HISTORICAL RELIGIONS
--==========================================================================================================================
------------------------------
-- Civilization_Religions
------------------------------
UPDATE Civilization_Religions
SET ReligionType = 'RELIGION_ANGLICANISM'
WHERE CivilizationType = 'CIVILIZATION_MC_NGAI_TAHU'
AND EXISTS (SELECT * FROM Religions WHERE Type = 'RELIGION_ANGLICANISM');
--==========================================================================================================================
-- ENLIGHTENMENT ERA
--==========================================================================================================================
-- Unit
------------------------------
UPDATE Unit_ClassUpgrades
SET UnitClassType = 'UNITCLASS_EE_CARRACK'
WHERE UnitType ='UNIT_MC_TONGAN_TONGIAKI'
AND EXISTS (SELECT * FROM Units WHERE Class = 'UNITCLASS_EE_CARRACK');
--==========================================================================================================================
-- R.E.D. / Ethnic Units
--==========================================================================================================================
-- Civilizations
------------------------------  
UPDATE Civilizations
SET ArtStyleSuffix = (CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = '_RUSSIA' )
    THEN '_POLYNESIA'
    ELSE '_MED' END)
WHERE Type = 'CIVILIZATION_MC_TONGA';

UPDATE Civilizations
SET ArtStyleSuffix = (CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = '_RUSSIA' )
    THEN '_POLYNESIA'
    ELSE '_MED' END)
WHERE Type = 'CIVILIZATION_MC_MAORI';

UPDATE Civilizations
SET ArtStyleSuffix = (CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = '_RUSSIA' )
    THEN '_POLYNESIA'
    ELSE '_MED' END)
WHERE Type = 'CIVILIZATION_MC_RAPA_NUI';
--==========================================================================================================================
-- YnAEMP v24
--==========================================================================================================================
-- Civilizations_YagemStartPosition (Earth Giant)
------------------------------------------------------------    
CREATE TABLE IF NOT EXISTS Civilizations_YagemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YagemStartPosition
            (Type,                          X,      Y)
VALUES      ('CIVILIZATION_MC_MAORI',       111,    9),
            ('CIVILIZATION_MC_RAPA_NUI',    135,    17),
            ('CIVILIZATION_MC_TONGA',       117,    23);
------------------------------------------------------------    
-- Civilizations_YahemStartPosition (Earth Huge)
------------------------------------------------------------    
CREATE TABLE IF NOT EXISTS Civilizations_YahemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YahemStartPosition
            (Type,                          X,      Y)
VALUES      ('CIVILIZATION_MC_MAORI',       1,      9),
            ('CIVILIZATION_MC_RAPA_NUI',    22,     18),
            ('CIVILIZATION_MC_TONGA',       7,      21);
------------------------------------------------------------    
-- Civilizations_CordiformStartPosition (Earth Standard)
------------------------------------------------------------    
CREATE TABLE IF NOT EXISTS Civilizations_CordiformStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_CordiformStartPosition
            (Type,                          X,      Y)
VALUES      ('CIVILIZATION_MC_MAORI',       3,      5),
            ('CIVILIZATION_MC_RAPA_NUI',    9,      8),
            ('CIVILIZATION_MC_TONGA',       75,     40);
------------------------------------------------------------    
-- Civilizations_GreatestEarthStartPosition (Earth Greatest)
------------------------------------------------------------    
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_GreatestEarthStartPosition
            (Type,                          X,      Y)
VALUES      ('CIVILIZATION_MC_MAORI',       2,      9),
            --('CIVILIZATION_MC_RAPA_NUI',  74,     35),
            ('CIVILIZATION_MC_TONGA',       2,      21);
------------------------------------------------------------    
-- Civilizations_PacificStartPosition (Pacific)
------------------------------------------------------------    
CREATE TABLE IF NOT EXISTS Civilizations_PacificStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_PacificStartPosition
            (Type,                          X,      Y)
VALUES      ('CIVILIZATION_MC_MAORI',       61,     5),
            --('CIVILIZATION_MC_RAPA_NUI',  74,     35),
            ('CIVILIZATION_MC_TONGA',       69,     18);
------------------------------------------------------------    
-- Civilizations_SouthPacificStartPosition (South Pacific)
------------------------------------------------------------    
CREATE TABLE IF NOT EXISTS Civilizations_SouthPacificStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_SouthPacificStartPosition
            (Type,                          X,      Y)
VALUES      ('CIVILIZATION_MC_MAORI',       19,     14),
            ('CIVILIZATION_MC_RAPA_NUI',    96,     29),
            ('CIVILIZATION_MC_TONGA',       31,     38);
------------------------------------------------------------    
-- Civilizations_AmericasStartPosition (Americas)
------------------------------------------------------------    
CREATE TABLE IF NOT EXISTS Civilizations_AmericasStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_AmericasStartPosition
            (Type,                          X,      Y)
VALUES      ('CIVILIZATION_MC_RAPA_NUI',    21,     12);
------------------------------------------------------------    
-- Civilizations_AustralasiaGiantStartPosition (Australasia Giant)
------------------------------------------------------------    
CREATE TABLE IF NOT EXISTS Civilizations_AustralasiaGiantStartPosition(TYPE, X, Y, AltX, AltY);
INSERT INTO Civilizations_AustralasiaGiantStartPosition
        (TYPE,                          X,   Y)
VALUES  ('CIVILIZATION_MC_MAORI',       131, 23);
------------------------------------------------------------    
-- Civilizations_SouthPacificGiantStartPosition (South Pacific Giant)
------------------------------------------------------------    
CREATE TABLE IF NOT EXISTS Civilizations_SouthPacificGiantStartPosition(TYPE, X, Y, AltX, AltY);
INSERT INTO Civilizations_SouthPacificGiantStartPosition
        (TYPE,                          X,  Y)
VALUES  ('CIVILIZATION_MC_MAORI',       60, 13),
        ('CIVILIZATION_MC_TONGA',       82, 38);
--==========================================================================================================================
--==========================================================================================================================