--==========================================================================================================================
-- TOMATEKH'S HISTORICAL RELIGIONS COMPLETE
--==========================================================================================================================
UPDATE Civilization_Religions SET ReligionType = 
	( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type="RELIGION_AL_ASNAM" )
		THEN "RELIGION_AL_ASNAM"
		ELSE "RELIGION_ISLAM" END
	) WHERE CivilizationType = "CIVILIZATION_DMS_NURAGIC";
------------------------------------------------------------
-- ReligionTestTrigger
------------------------------------------------------------	
CREATE TRIGGER ReligionMinaeanAlAsnam
AFTER INSERT ON Religions WHEN 'RELIGION_AL_ASNAM' = NEW.Type
BEGIN
	UPDATE Civilization_Religions 
	SET ReligionType = 'RELIGION_AL_ASNAM'
	WHERE CivilizationType IN ('CIVILIZATION_DMS_NURAGIC');
END;
--==========================================================================================================================
-- MASTER TABLES
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS COMMUNITY (Type TEXT, Value INTEGER);
CREATE TABLE IF NOT EXISTS Civilization_JFD_ColonialCityNames(CivilizationType text, ColonyName text, LinguisticType text);
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMP(CivilizationType, MapPrefix, X, Y, CapitalName, AltX, AltY, AltCapitalName);
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMPRequestedResources(CivilizationType, MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6);
CREATE TABLE IF NOT EXISTS JFD_Civilopedia_HideFromPedia(Type text);
CREATE TABLE IF NOT EXISTS JFD_GlobalUserSettings(Type text, Value integer default 1);
CREATE TABLE IF NOT EXISTS MinorCivilizations_YnAEMP(MinorCivType, MapPrefix, X, Y, CapitalName, AltX, AltY, AltCapitalName);
--==========================================================================================================================
-- CIVILOPEDIA
--==========================================================================================================================
-- DMS_Civilopedia_HideFromPedia
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO JFD_Civilopedia_HideFromPedia
		(Type)
VALUES	('BUILDING_DMS_MINAEANS_WADD_AB_FAITH'),
		('BUILDING_DMS_MINAEANS_HAWTAH_DISTANCE');

UPDATE Civilizations
SET DerivativeCiv = 'CIVILIZATION_DMS_MINAEANS'
WHERE Type = 'CIVILIZATION_DMS_MINAEANS';
--==========================================================================================================================
-- LEADERS
--==========================================================================================================================
-- Flavors
--------------------------------------------------------------------------------------------------------------------------	
INSERT OR REPLACE INTO Flavors 
		(Type)
VALUES	('FLAVOR_DMS_DECOLONIZATION'),
		('FLAVOR_DMS_MERCENARY'),
		('FLAVOR_DMS_REFORM_GOVERNMENT'),
		('FLAVOR_DMS_REFORM_LEGAL'),
		('FLAVOR_DMS_REFORM_CULTURE'),
		('FLAVOR_DMS_REFORM_ECONOMIC'),
		('FLAVOR_DMS_REFORM_EDUCATION'),
		('FLAVOR_DMS_REFORM_FOREIGN'),
		('FLAVOR_DMS_REFORM_INDUSTRY'),
		('FLAVOR_DMS_REFORM_MILITARY'),
		('FLAVOR_DMS_REFORM_RELIGION'),
		('FLAVOR_DMS_RELIGIOUS_INTOLERANCE'),
		('FLAVOR_DMS_SLAVERY'),
		('FLAVOR_DMS_STATE_RELIGION');
--------------------------------------------------------------------------------------------------------------------------
-- Leader_Flavors
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Leader_Flavors
		(LeaderType,				FlavorType,							 Flavor)
VALUES	('LEADER_DMS_WAQAH_IL_SADIQ_I',	'FLAVOR_DMS_DECOLONIZATION',		 3),
		('LEADER_DMS_WAQAH_IL_SADIQ_I',	'FLAVOR_DMS_MERCENARY',				 7),
		('LEADER_DMS_WAQAH_IL_SADIQ_I',	'FLAVOR_DMS_RELIGIOUS_INTOLERANCE',	 2),
		('LEADER_DMS_WAQAH_IL_SADIQ_I',	'FLAVOR_DMS_REFORM_GOVERNMENT',		 5),
		('LEADER_DMS_WAQAH_IL_SADIQ_I',	'FLAVOR_DMS_REFORM_LEGAL',			 5),
		('LEADER_DMS_WAQAH_IL_SADIQ_I',	'FLAVOR_DMS_REFORM_CULTURE',		 6),
		('LEADER_DMS_WAQAH_IL_SADIQ_I',	'FLAVOR_DMS_REFORM_ECONOMIC',		 4),
		('LEADER_DMS_WAQAH_IL_SADIQ_I',	'FLAVOR_DMS_REFORM_EDUCATION',		 5),
		('LEADER_DMS_WAQAH_IL_SADIQ_I',	'FLAVOR_DMS_REFORM_FOREIGN',		 5),
		('LEADER_DMS_WAQAH_IL_SADIQ_I',	'FLAVOR_DMS_REFORM_INDUSTRY',		 5),
		('LEADER_DMS_WAQAH_IL_SADIQ_I',	'FLAVOR_DMS_REFORM_MILITARY',		 3),
		('LEADER_DMS_WAQAH_IL_SADIQ_I',	'FLAVOR_DMS_REFORM_RELIGION',		 6),
		('LEADER_DMS_WAQAH_IL_SADIQ_I',	'FLAVOR_DMS_SLAVERY',				 6),
		('LEADER_DMS_WAQAH_IL_SADIQ_I',	'FLAVOR_DMS_STATE_RELIGION',		 6);
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
SELECT	'CIVILIZATION_DMS_MINAEANS',	ArtDefineTag, CultureType, SubCultureType, DecisionsTag, DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag, SoundtrackTag, 'AS2D_SOUND_DMS_GREEK'
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_ARABIA';

UPDATE Civilizations 
SET SoundtrackTag = 'JFD_Classical'
WHERE Type = 'CIVILIZATION_DMS_MINAEANS'
AND EXISTS (SELECT * FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Classical')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------	
-- Civilizations_YnAEMP
--------------------------------------------------------------------------------------------------------------------------	
--==========================================================================================================================
-- SUKRITACT'S DECISIONS
--==========================================================================================================================
-- DecisionsAddin_Support
------------------------------------------------------------
--==========================================================================================================================
-- SUKRITACT'S EVENTS
--==========================================================================================================================
-- EventsAddin_Support
------------------------------------------------------------
--==========================================================================================================================
--==========================================================================================================================