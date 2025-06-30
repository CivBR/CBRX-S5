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
        (LeaderType,				TraitOne,				TraitTwo)
SELECT  'LEADER_MC_DAVI_KOPENAWA',		'POLICY_SPIRITUAL_X',	'POLICY_DIPLOMATIC_X'
WHERE EXISTS (SELECT * FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X');
------------------------------  
-- Leaders
------------------------------  
UPDATE Leaders
SET Description = 'Davi Kopenawa [ICON_PEACE][ICON_INFLUENCE]'
WHERE TYPE = 'LEADER_MC_DAVI_KOPENAWA'
AND EXISTS (SELECT * FROM Policies WHERE TYPE = 'POLICY_PHILOSOPHICAL_X');

--==========================================================================================================================
-- Events & Decisions
--==========================================================================================================================
-- DecisionsAddin_Support
------------------------------
--CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
--INSERT INTO DecisionsAddin_Support (FileName) VALUES ('MC_TeKooti_Decisions.lua');


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
		(CivilizationType,				ArtDefineTag, CultureType,				SubCultureType, DecisionsTag,	IdealsTag,		SplashScreenTag,	SoundtrackTag,	UnitDialogueTag)
SELECT	('CIVILIZATION_MC_YANOMAMI'),	ArtDefineTag, ('CULTURE_JFD_KATUJE'),	null,			('JFD_Katuje'), ('JFD_Katuje'), ('JFD_Katuje'),		('JFD_Katuje'),	('AS2D_SOUND_JFD_TUPI')
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_AZTEC';

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
VALUES	('LEADER_MC_DAVI_KOPENAWA',		'FLAVOR_JFD_DECOLONIZATION',		 9),
		('LEADER_MC_DAVI_KOPENAWA',		'FLAVOR_JFD_MERCENARY',				 6),
		('LEADER_MC_DAVI_KOPENAWA',		'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',	 7),
		('LEADER_MC_DAVI_KOPENAWA',		'FLAVOR_JFD_REFORM_GOVERNMENT',		 6), --Scale of Liberal to Authoritarian.
		('LEADER_MC_DAVI_KOPENAWA',		'FLAVOR_JFD_REFORM_LEGAL',			 7), 	
		('LEADER_MC_DAVI_KOPENAWA',		'FLAVOR_JFD_REFORM_CULTURE',		 8),
		('LEADER_MC_DAVI_KOPENAWA',		'FLAVOR_JFD_REFORM_ECONOMIC',		 2),
		('LEADER_MC_DAVI_KOPENAWA',		'FLAVOR_JFD_REFORM_EDUCATION',	 	 6),
		('LEADER_MC_DAVI_KOPENAWA',		'FLAVOR_JFD_REFORM_FOREIGN',		 2),
		('LEADER_MC_DAVI_KOPENAWA',		'FLAVOR_JFD_REFORM_INDUSTRY',		 2),
		('LEADER_MC_DAVI_KOPENAWA',		'FLAVOR_JFD_REFORM_MILITARY',		 3),
		('LEADER_MC_DAVI_KOPENAWA',		'FLAVOR_JFD_REFORM_RELIGION',		 6),
		('LEADER_MC_DAVI_KOPENAWA',		'FLAVOR_JFD_SLAVERY',				 5),
		('LEADER_MC_DAVI_KOPENAWA',		'FLAVOR_JFD_STATE_RELIGION',		 5);
--==========================================================================================================================
-- TOMATEKH'S HISTORICAL RELIGIONS
--==========================================================================================================================
------------------------------
-- Civilization_Religions
------------------------------
UPDATE Civilization_Religions
SET ReligionType = 'RELIGION_PAJELANCA'
WHERE CivilizationType = 'CIVILIZATION_MC_YANOMAMI'
AND EXISTS (SELECT * FROM Religions WHERE Type = 'RELIGION_PAJELANCA');
--==========================================================================================================================
-- HAZEL MAP LABELS
--==========================================================================================================================
-- ML_CivCultures
------------------------------  
CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
        (CivType,					CultureType,        CultureEra)
VALUES  ('CIVILIZATION_MC_YANOMAMI',	'PACIFIC',	       'ANCIENT');
--==========================================================================================================================
-- R.E.D. / Ethnic Units
--==========================================================================================================================
-- Civilizations
------------------------------  
UPDATE Civilizations
SET ArtStyleSuffix = (CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = '_RUSSIA' )
    THEN '_BRAZIL'
    ELSE '_AMER' END)
WHERE TYPE = 'CIVILIZATION_MC_YANOMAMI';
--==========================================================================================================================
-- YnAEMP v25
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMP(CivilizationType, MapPrefix, X, Y);
INSERT INTO Civilizations_YnAEMP
		(CivilizationType,				MapPrefix,					X,		 Y)
VALUES	('CIVILIZATION_MC_YANOMAMI',	'Yahem',					34,		34),
		('CIVILIZATION_MC_YANOMAMI',	'Cordiform',				14,		17),
		('CIVILIZATION_MC_YANOMAMI',	'GreatestEarth',			25,		21),
		('CIVILIZATION_MC_YANOMAMI',	'Yagem',					159,	37),
		('CIVILIZATION_MC_YANOMAMI',	'EarthMk3',					154,	39),
		('CIVILIZATION_MC_YANOMAMI',	'SouthAmericaGiant',		57,		127),
		('CIVILIZATION_MC_YANOMAMI',	'SouthAmericaLarge',		42,		78),
		('CIVILIZATION_MC_YANOMAMI',	'SouthAmericaCentralGiant',	76,		106),
		('CIVILIZATION_MC_YANOMAMI',	'SouthAmericaCentralHuge',	56,		81),
		('CIVILIZATION_MC_YANOMAMI',	'Americas',					50,		34),
		('CIVILIZATION_MC_YANOMAMI',	'AmericasGiant',			88,		75),
		('CIVILIZATION_MC_YANOMAMI',	'AtlanticGiant',			53,		35);

--==========================================================================================================================
--==========================================================================================================================