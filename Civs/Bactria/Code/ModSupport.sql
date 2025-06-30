--==========================================================================================================================
--This SQL file handles most of the mod support.
--==========================================================================================================================
--==========================================================================================================================
--==========================================================================================================================
-- JFD USER SETTINGS
--==========================================================================================================================
-- JFD_GlobalUserSettings
-------------------------------------
CREATE TABLE IF NOT EXISTS 
JFD_GlobalUserSettings (
	Type 											text 										default null,
	Value 											integer 									default 1);
--==========================================================================================================================
-- Bingle's Civ IV Traits
--==========================================================================================================================
-- Leader_SharedTraits
------------------------------	
-- CREATE TABLE IF NOT EXISTS 
    -- Leader_SharedTraits (
    -- LeaderType          text    REFERENCES Leaders(Type)        default null,
    -- TraitOne            text    REFERENCES Policies(Type)       default null,
    -- TraitTwo            text    REFERENCES Policies(Type)       default null);
     
-- INSERT OR REPLACE INTO Leader_SharedTraits
            -- (LeaderType,				TraitOne,					TraitTwo)
-- VALUES      ('LEADER_TCM_DEMETRIUS',	'POLICY_AGGRESSIVE_X',		'POLICY_EXPANSIVE_X');
------------------------------	
-- Leaders
------------------------------	
UPDATE Leaders 
SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
	THEN 'Demetrius [ICON_WAR][ICON_FOOD]'
	ELSE 'TXT_KEY_LEADER_TCM_DEMETRIUS' END) 
WHERE Type = 'LEADER_TCM_DEMETRIUS';

CREATE TRIGGER CivIVTraitsTCMBACTRIA
AFTER INSERT ON Leaders WHEN 'LEADER_TCM_DEMETRIUS' = NEW.Type
BEGIN
	UPDATE Leaders
	SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
		THEN 'Demetrius [ICON_WAR][ICON_FOOD]'
		ELSE 'TXT_KEY_LEADER_TCM_DEMETRIUS' END) 
	WHERE Type = 'LEADER_TCM_DEMETRIUS';
END;		
--==========================================================================================================================
-- BrutalSamurai's Ethnic Units/Gedemon's R.E.D.
--==========================================================================================================================
-- Civilizations
------------------------------	
UPDATE Civilizations 
SET ArtStyleSuffix = (CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = '_GREECE' )
	THEN '_GREECE'
	ELSE '_EURO' END) 
WHERE Type = 'CIVILIZATION_TCM_BACTRIA';
--==========================================================================================================================
-- Gedemon's YnAEMP
--==========================================================================================================================
--==========================================================================================================================
-- Civilizations_YagemStartPosition (Earth Giant)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_YagemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YagemStartPosition
			(Type,							X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_TCM_BACTRIA',	53,		57,		null,	null);
--==========================================================================================================================
-- Civilizations_YahemStartPosition (Earth Huge)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_YahemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YahemStartPosition
			(Type,							X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_TCM_BACTRIA',	85,		50,		null,	null);
--==========================================================================================================================
-- Civilizations_CordiformStartPosition (Earth Standard)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_CordiformStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_CordiformStartPosition
			(Type,							X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_TCM_BACTRIA',	54,		27,		null,	null);
--==========================================================================================================================
-- Civilizations_GreatestEarthStartPosition (Earth Greatest)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_GreatestEarthStartPosition
			(Type,							X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_TCM_BACTRIA',	72,		44,		null,	null);
--==========================================================================================================================
-- Civilizations_YagemRequestedResource (Earth Giant)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_YagemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YagemRequestedResource
			(Type, 						Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_TCM_BACTRIA'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YagemRequestedResource WHERE Type = 'CIVILIZATION_GREECE';
--==========================================================================================================================
-- Civilizations_YahemRequestedResource
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_YahemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YahemRequestedResource
			(Type, 						Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_TCM_BACTRIA'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YahemRequestedResource WHERE Type = 'CIVILIZATION_GREECE';
--==========================================================================================================================
-- Civilizations_GreatestEarthRequestedResource 
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_GreatestEarthRequestedResource
			(Type, 						Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_TCM_BACTRIA'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE Type = 'CIVILIZATION_GREECE';
--==========================================================================================================================
-- Hazel's Map Labels
--==========================================================================================================================
-- ML_CivCultures
------------------------------	
CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
			(CivType,						CultureType,		CultureEra)
VALUES		('CIVILIZATION_TCM_BACTRIA',	'Mediterranean',	'ANY'),
			('CIVILIZATION_TCM_BACTRIA',	'Indian',			'ANY'),
			('CIVILIZATION_TCM_BACTRIA',	'Arabian',			'ANY');
--==========================================================================================================================
-- JFD's Exploration Continued Expanded
--==========================================================================================================================
-- Civilization_JFD_ColonialCityNames
------------------------------	
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_ColonialCityNames (
	CivilizationType 							text 	REFERENCES Civilizations(Type) 		default null,
	ColonyName 									text										default null,
	LinguisticType								text										default	null,
	CultureType									text										default	null);

INSERT OR REPLACE INTO Civilization_JFD_ColonialCityNames
			(CivilizationType, 			ColonyName,		LinguisticType)
VALUES		('CIVILIZATION_TCM_BACTRIA',	null,		'JFD_Hellenic');
--==========================================================================================================================	
-- JFD's Piety & Prestige
--==========================================================================================================================			
------------------------------					
-- Flavors
------------------------------	
INSERT OR REPLACE INTO Flavors 
			(Type)
VALUES		('FLAVOR_JFD_RELIGIOUS_INTOLERANCE');
------------------------------
-- Leader_Flavors
------------------------------
INSERT INTO Leader_Flavors
			(LeaderType,				FlavorType,								Flavor)
VALUES		('LEADER_TCM_DEMETRIUS',	'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',		0);
--==========================================================================================================================	
-- JFD's Mercenaries
--==========================================================================================================================	
INSERT INTO Leader_Flavors
        (LeaderType,				 FlavorType,                Flavor)
VALUES  ('LEADER_TCM_DEMETRIUS',    'FLAVOR_JFD_MERCENARY',     3);
--==========================================================================================================================
-- Sukritact's Decisions
--==========================================================================================================================
-- DecisionsAddin_Support
------------------------------
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
INSERT INTO DecisionsAddin_Support (FileName) VALUES ('tcmBactriaDecisions.lua');
--==========================================================================================================================
-- Sukritact's Events
--==========================================================================================================================
-- EventsAddin_Support
------------------------------
CREATE TABLE IF NOT EXISTS EventsAddin_Support(FileName);
INSERT INTO EventsAddin_Support (FileName) VALUES ('tcmBactriaEvents.lua');
--==========================================================================================================================
-- JFD CULTURAL DIVERSITY
--==========================================================================================================================
-- Civilization_JFD_CultureTypes
------------------------------	
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_CultureTypes(
	CivilizationType 							text 	REFERENCES Civilizations(Type) 			default null,
	CultureType 								text											default null,
	ArtDefineTag								text											default	null,
	IdealsTag									text											default	null,
	SplashScreenTag								text											default	null,
	SoundtrackTag								text											default	null,
	UnitDialogueTag								text											default null);

INSERT INTO Civilization_JFD_CultureTypes
		(CivilizationType,			ArtDefineTag, CultureType, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag)
SELECT	'CIVILIZATION_TCM_BACTRIA',	ArtDefineTag, CultureType, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_GREECE';
------------------------------	
-- Civilizations
------------------------------	
UPDATE Civilizations 
SET SoundtrackTag = 'JFD_Mediterranean'
WHERE Type = 'CIVILIZATION_TCM_BACTRIA'
AND EXISTS (SELECT * FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Mediterranean')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1)
--==========================================================================================================================
--=========================================================================================================================