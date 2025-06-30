--==========================================================================================================================
-- USER SETTINGS (THIS IS NEEDED IN MOST CASES)
--==========================================================================================================================
-- JFD_GlobalUserSettings
--------------------------------
CREATE TABLE IF NOT EXISTS 
JFD_GlobalUserSettings (
    Type                text            default null,
    Value               integer         default 1);

--==========================================================================================================================
-- JFD CIVILOPEDIA
--==========================================================================================================================
-- JFD_Civilopedia_HideFromPedia
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
JFD_Civilopedia_HideFromPedia (Type text default null);

--Any items entered into this table will not show into the Civilopedia. There is no technical limitation as to what can be hidden (I think).
INSERT INTO JFD_Civilopedia_HideFromPedia
		(Type)
VALUES		('BUILDING_DMS_ZY_GREAT_WORKS_WRITING_1'),
		('BUILDING_DMS_ZY_GREAT_WORKS_WRITING_2'),
		('BUILDING_DMS_ZY_GREAT_WORKS_WRITING_3'),
		('BUILDING_DMS_ZY_GREAT_WORKS_WRITING_4'),
		('BUILDING_DMS_ZY_GREAT_WORKS_WRITING_5'),
		('BUILDING_DMS_ZY_RELIGIOUS_PRESSURE'),
		('BUILDING_DMS_ZY_DEFENSE'),
		('IMPROVEMENT_DMS_MONOLITHIC_CHURCH_1'),
		('IMPROVEMENT_DMS_MONOLITHIC_CHURCH_2'),
		('IMPROVEMENT_DMS_MONOLITHIC_CHURCH_3'),
		('IMPROVEMENT_DMS_MONOLITHIC_CHURCH_4'),
		('IMPROVEMENT_DMS_MONOLITHIC_CHURCH_5'),
		('PROMOTION_DMS_SEED_OF_JACOB_1'),
		('PROMOTION_DMS_SEED_OF_JACOB_2'),
		('PROMOTION_DMS_SEED_OF_JACOB_3'),
		('PROMOTION_DMS_SEED_OF_JACOB_4'),
		('PROMOTION_DMS_SEED_OF_JACOB_5'),
		('PROMOTION_DMS_SEED_OF_JACOB_6'),
		('PROMOTION_DMS_SEED_OF_JACOB_7'),
		('PROMOTION_DMS_SEED_OF_JACOB_8'),
		('PROMOTION_DMS_SEED_OF_JACOB_9'),
		('PROMOTION_DMS_SEED_OF_JACOB_10'),
		('PROMOTION_DMS_SEED_OF_JACOB_11'),
		('PROMOTION_DMS_SEED_OF_JACOB_12'),
		('PROMOTION_DMS_SEED_OF_JACOB_13'),
		('PROMOTION_DMS_SEED_OF_JACOB_14'),
		('PROMOTION_DMS_SEED_OF_JACOB_15'),
		('PROMOTION_DMS_SEED_OF_JACOB_16'),
		('PROMOTION_DMS_SEED_OF_JACOB_17'),
		('PROMOTION_DMS_SEED_OF_JACOB_18'),
		('PROMOTION_DMS_SEED_OF_JACOB_19'),
		('PROMOTION_DMS_SEED_OF_JACOB_20'),
		('PROMOTION_DMS_SEED_OF_JACOB_21'),
		('PROMOTION_DMS_SEED_OF_JACOB_22'),
		('PROMOTION_DMS_SEED_OF_JACOB_23'),
		('PROMOTION_DMS_SEED_OF_JACOB_24'),
		('PROMOTION_DMS_SEED_OF_JACOB_25');
--==========================================================================================================================
-- JFD's CULTURAL DIVERSITY (31a31d1c-b9d7-45e1-842c-23232d66cd47)
--==========================================================================================================================
-- Civilization_JFD_CultureTypes
-------------------------------------	
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_CultureTypes(
	CivilizationType 							text 	REFERENCES Civilizations(Type) 			default null,
	CultureType 								text											default null,
	ArtDefineTag								text											default	null,
	DefeatScreenEarlyTag						text											default	null,
	DefeatScreenMidTag							text											default	null,
	DefeatScreenLateTag							text											default	null,
	IdealsTag									text											default	null,
	SplashScreenTag								text											default	null,
	SoundtrackTag								text											default	null,
	UnitDialogueTag								text											default null);

INSERT INTO Civilization_JFD_CultureTypes
		(CivilizationType,							ArtDefineTag,	CultureType,			IdealsTag,		SplashScreenTag,		SoundtrackTag,			UnitDialogueTag)
VALUES		('CIVILIZATION_DMS_ETHIOPIA_YAQOB',			'_JFD_SEMITIC', 'CULTURE_JFD_SEMITIC',	'JFD_Semitic',	'JFD_SemiticEthiopic',	'JFD_SemiticEthiopic',	'AS2D_SOUND_JFD_ETHIOPIAN');

UPDATE Civilizations 
SET SoundtrackTag = 'JFD_SemiticEthiopic'
WHERE Type = 'CIVILIZATION_DMS_ETHIOPIA_YAQOB'
AND EXISTS (SELECT * FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_SemiticEthiopic');
--==========================================================================================================================	
-- JFD's RISE TO POWER (eea66053-7579-481a-bb8d-2f3959b59974)
--==========================================================================================================================	
-- PIETY
--==========================================================	
-- Flavors
------------------------------------------------------------	
INSERT OR REPLACE INTO Flavors 
		(Type)
VALUES	('FLAVOR_JFD_RELIGIOUS_INTOLERANCE'),
		('FLAVOR_JFD_STATE_RELIGION');
------------------------------------------------------------
-- Leader_Flavors
------------------------------------------------------------	
--Religous Intolerance: A value of 0-12 may be set. This value determines the diplomatic penalty/bonus with civilizations of a different/same state religion
--State Religion: A value of 0-12 may be set. This value determines the chance to adopt a State Religion. A value higher than 9 means this civilization will never secularise. A value of 0 means this civilization has no interest in State Religion.
INSERT INTO Leader_Flavors
		(LeaderType,			FlavorType,								Flavor)
VALUES		('LEADER_DMS_YAQOB',	'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',		9),
		('LEADER_DMS_YAQOB',	'FLAVOR_JFD_STATE_RELIGION',			10);
--==========================================================	
-- SOVEREIGNTY
--==========================================================
-- Civilization_JFD_Governments
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_Governments (
	CivilizationType  				text 		REFERENCES Civilizations(Type) 					default null,
	GovernmentType					text														default	null,
	Weight							integer														default	0);

INSERT INTO Civilization_JFD_Governments
		(CivilizationType,					GovernmentType, 			Weight)
SELECT	'CIVILIZATION_DMS_ETHIOPIA_YAQOB',	GovernmentType, 			Weight
FROM Civilization_JFD_Governments WHERE CivilizationType = 'CIVILIZATION_ETHIOPIA';
------------------------------------------------------------
-- Civilization_JFD_Titles
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_Titles (
	CivilizationType  				text 		REFERENCES Civilizations(Type) 					default null,
	CultureType						text 		 												default null,
	ReligionType					text 		REFERENCES Religions(Type) 						default null,
	DefaultTitle					text 		 												default null,
	UniqueTitle						text 		 												default null,
	UseAdjective					boolean														default 0);	

INSERT INTO Civilization_JFD_Titles
		(CivilizationType,					DefaultTitle,									UniqueTitle)
SELECT	('CIVILIZATION_DMS_ETHIOPIA_YAQOB'),	DefaultTitle,									UniqueTitle
FROM Civilization_JFD_Titles WHERE (CivilizationType = 'CIVILIZATION_ETHIOPIA');
------------------------------------------------------------
-- Civilization_JFD_Politics
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_Politics (
	CivilizationType  					text 		REFERENCES Civilizations(Type) 					default null,
	PoliticsType  						text 														default null,
	UniqueName							text														default	null);

INSERT INTO Civilization_JFD_Politics
		(CivilizationType,					PoliticsType, 				UniqueName)
SELECT	('CIVILIZATION_DMS_ETHIOPIA_YAQOB'),	PoliticsType, 				UniqueName
FROM Civilization_JFD_Politics WHERE (CivilizationType = 'CIVILIZATION_ETHIOPIA');
--==========================================================================================================================
-- TOMATEKH'S HISTORICAL RELIGIONS
--==========================================================================================================================
-- Civilization_Religions
------------------------------------------------------------
-- Zara Yaqob
DELETE FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_DMS_ETHIOPIA_YAQOB';
INSERT INTO Civilization_Religions 
		        (CivilizationType,	ReligionType)
SELECT		Type,			('RELIGION_CHRISTIANITY')
FROM Civilizations WHERE Type = 'CIVILIZATION_DMS_ETHIOPIA_YAQOB';

UPDATE Civilization_Religions SET ReligionType = 
	( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_CHRISTIAN_ORIENTAL_ORTHODOX' )
		THEN 'RELIGION_CHRISTIAN_ORIENTAL_ORTHODOX'
		ELSE 'RELIGION_CHRISTIANITY' END 
	) WHERE CivilizationType = 'CIVILIZATION_DMS_ETHIOPIA_YAQOB';

CREATE TRIGGER CivilizationTierEthiopiaZaraYaqob
AFTER INSERT ON Civilization_Religions WHEN 'CIVILIZATION_DMS_ETHIOPIA_YAQOB' = NEW.CivilizationType
BEGIN
	UPDATE Civilization_Religions SET ReligionType = 
		( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_CHRISTIAN_ORIENTAL_ORTHODOX' )
			THEN 'RELIGION_CHRISTIAN_ORIENTAL_ORTHODOX'
			ELSE 'RELIGION_CHRISTIANITY' END 
		) WHERE CivilizationType = 'CIVILIZATION_DMS_ETHIOPIA_YAQOB';
END;
--==========================================================================================================================
-- BrutalSamurai's Ethnic Units/Gedemon's R.E.D.
--==========================================================================================================================
-- Civilizations
------------------------------	
UPDATE Civilizations 
SET ArtStyleSuffix = (CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = '_ETHIOPIA' )
	THEN '_ETHIOPIA'
	ELSE '_AFRI' END) 
WHERE Type = 'CIVILIZATION_DMS_ETHIOPIA_YAQOB';
--==========================================================================================================================
--==========================================================================================================================