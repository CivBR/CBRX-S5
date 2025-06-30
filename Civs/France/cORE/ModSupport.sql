--=======================================================================================================================
-- BINGLES CIV IV TRAITS
--=======================================================================================================================
-- Leader_SharedTraits
------------------------------	
CREATE TABLE IF NOT EXISTS 
    Leader_SharedTraits (
    LeaderType          text    REFERENCES Leaders(Type)        default null,
    TraitOne            text    REFERENCES Policies(Type)       default null,
    TraitTwo            text    REFERENCES Policies(Type)       default null);
     
INSERT INTO Leader_SharedTraits
        (LeaderType,				   TraitOne,					TraitTwo)
SELECT  'LEADER_URDNOT_ROBESPIERRE',   'POLICY_PHILOSOPHICAL_X',	'POLICY_SEAFARING_X'
WHERE EXISTS (SELECT * FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X');
------------------------------	
-- Leaders
------------------------------	
UPDATE Leaders 
SET Description = 'Robespierre [ICON_CULTURE][ICON_HAPPINESS_1]'
WHERE Type = 'LEADER_URDNOT_ROBESPIERRE'
AND EXISTS (SELECT * FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X');
--==========================================================================================================================
-- GEDEMON R.E.D.
--==========================================================================================================================
-- Civilizations
------------------------------	
UPDATE Civilizations 
SET ArtStyleSuffix = '_FRANCE'
WHERE Type = 'CIVILIZATION_URDNOT_REV_FRANCE'
AND EXISTS (SELECT * FROM Civilizations WHERE ArtStyleSuffix = '_FRANCE');
--==========================================================================================================================
-- Gedemon's YnAEMP
--==========================================================================================================================
-- Civilizations_YagemStartPosition (Earth Giant)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_YagemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YagemStartPosition
			(Type,																X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_URDNOT_REV_FRANCE',					            	48,		43,		null,	null);
--==========================================================================================================================
-- Civilizations_YahemStartPosition (Earth Huge)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_YahemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YahemStartPosition
			(Type,													X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_URDNOT_REV_FRANCE',					            	79,		43,		null,	null);
--==========================================================================================================================
-- Civilizations_CordiformStartPosition (Earth Standard)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_CordiformStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_CordiformStartPosition
			(Type,																X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_URDNOT_REV_FRANCE',					            	53,		18,		null,	null);
--==========================================================================================================================
-- Civilizations_GreatestEarthStartPosition (Earth Greatest)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_GreatestEarthStartPosition
			(Type,																X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_URDNOT_REV_FRANCE',					            	69,		34,		null,	null);
--==========================================================================================================================
-- Civilizations_YagemRequestedResource (Earth Giant)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_YagemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YagemRequestedResource
			(Type, 											Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_URDNOT_REV_FRANCE'),	            Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YagemRequestedResource WHERE Type = 'CIVILIZATION_FRANCE';
--==========================================================================================================================
-- Civilizations_YahemRequestedResource (Earth Huge)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_YahemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YahemRequestedResource
			(Type, 											Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_URDNOT_REV_FRANCE'),	            Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YahemRequestedResource WHERE Type = 'CIVILIZATION_FRANCE';
--==========================================================================================================================
-- Civilizations_EuroLargeRequestedResource (Europe Large)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_EuroLargeRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_EuroLargeRequestedResource
			(Type, 											Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_URDNOT_REV_FRANCE'),	            Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_EuroLargeRequestedResource WHERE Type = 'CIVILIZATION_FRANCE';
--==========================================================================================================================
-- Civilizations_GreatestEarthRequestedResource (Earth Greatest)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_GreatestEarthRequestedResource
			(Type, 											Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_URDNOT_REV_FRANCE'),	            Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE Type = 'CIVILIZATION_FRANCE';
--==========================================================================================================================
-- HAZEL MAP LABELS
--==========================================================================================================================
-- ML_CivCultures
------------------------------	
CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
		(CivType, 							CultureType, CultureEra)
SELECT	'CIVILIZATION_URDNOT_REV_FRANCE',	CultureType, CultureEra
FROM ML_CivCultures WHERE CivType = 'CIVILIZATION_FRANCE';
--==========================================================================================================================
-- JFD USER SETTINGS
--==========================================================================================================================
-- JFD_GlobalUserSettings
-------------------------------------
CREATE TABLE IF NOT EXISTS 
JFD_GlobalUserSettings (
	Type 											text 										default null,
	Value 											integer 									default 1);
--====================================	
-- JFD COLONIES
--====================================	
-- Civilization_JFD_ColonialCityNames
------------------------------	
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_ColonialCityNames (
	CivilizationType 							text 	REFERENCES Civilizations(Type) 		default null,
	ColonyName 									text										default null,
	LinguisticType								text										default	null,
	CultureType									text										default	null);

INSERT INTO Civilization_JFD_ColonialCityNames
		(CivilizationType,						LinguisticType, ColonyName)
SELECT	'CIVILIZATION_URDNOT_REV_FRANCE',		LinguisticType, ColonyName
FROM Civilization_JFD_ColonialCityNames WHERE CivilizationType = 'CIVILIZATION_FRANCE';
------------------------------------------------------------
-- Flavors
------------------------------------------------------------	
INSERT OR REPLACE INTO Flavors 
		(Type)
VALUES	('FLAVOR_JFD_DECOLONIZATION');
------------------------------------------------------------
-- Leader_Flavors
------------------------------------------------------------
INSERT INTO Leader_Flavors
		(LeaderType,					FlavorType,						Flavor)
VALUES	('LEADER_URDNOT_ROBESPIERRE',	'FLAVOR_JFD_DECOLONIZATION',	4);
--====================================
-- JFD PROVINCES 
--====================================
-- Civilization_JFD_ProvinceTitles
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_ProvinceTitles (
	CivilizationType  				text 		REFERENCES Civilizations(Type) 					default null,
	ReligionType  					text 		REFERENCES Religions(Type) 						default null,
	DefaultTitle					text 		 												default null,
	UniqueTitle						text 		 												default null,
	UseAdjective					boolean														default 0);	

INSERT INTO Civilization_JFD_ProvinceTitles
		(CivilizationType,					DefaultTitle,	UniqueTitle)
SELECT	'CIVILIZATION_URDNOT_REV_FRANCE',	DefaultTitle,	UniqueTitle
FROM Civilization_JFD_ProvinceTitles WHERE CivilizationType = 'CIVILIZATION_FRANCE';
--====================================	
-- JFD SLAVERY
--====================================	
-- Flavors
------------------------------------------------------------	
INSERT OR REPLACE INTO Flavors 
		(Type)
VALUES	('FLAVOR_JFD_SLAVERY');
------------------------------------------------------------
-- Leader_Flavors
------------------------------------------------------------
INSERT INTO Leader_Flavors
		(LeaderType,					FlavorType,				Flavor)
VALUES	('LEADER_URDNOT_ROBESPIERRE',	'FLAVOR_JFD_SLAVERY',		2);
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
	DefeatScreenEarlyTag						text											default	null,
	DefeatScreenMidTag							text											default	null,
	DefeatScreenLateTag							text											default	null,
	IdealsTag									text											default	null,
	SplashScreenTag								text											default	null,
	SoundtrackTag								text											default	null,
	UnitDialogueTag								text											default null);

INSERT INTO Civilization_JFD_CultureTypes
		(CivilizationType,						ArtDefineTag, CultureType,	DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag)
SELECT	'CIVILIZATION_URDNOT_REV_FRANCE',		ArtDefineTag, CultureType,	DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_FRANCE';
--==========================================================================================================================
-- JFD RISE TO POWER
--==========================================================================================================================
--====================================	
-- JFD AND POUAKAI MERCENARIES
--====================================
-- Flavors
------------------------------------------------------------	
INSERT OR REPLACE INTO Flavors 
		(Type)
VALUES	('FLAVOR_JFD_MERCENARY');
------------------------------------------------------------
-- Leader_Flavors
------------------------------------------------------------	
INSERT INTO Leader_Flavors
		(LeaderType,					FlavorType,					Flavor)
VALUES	('LEADER_URDNOT_ROBESPIERRE',	'FLAVOR_JFD_MERCENARY',		6);
--====================================	
-- JFD PIETY
--====================================	
------------------------------------------------------------
-- Flavors
------------------------------------------------------------	
INSERT OR REPLACE INTO Flavors 
		(Type)
VALUES	('FLAVOR_JFD_RELIGIOUS_INTOLERANCE'),
		('FLAVOR_JFD_STATE_RELIGION');
------------------------------------------------------------
-- Leader_Flavors
------------------------------------------------------------
INSERT INTO Leader_Flavors
		(LeaderType,					FlavorType,								Flavor)
VALUES	('LEADER_URDNOT_ROBESPIERRE',	'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',		11),
		('LEADER_URDNOT_ROBESPIERRE',	'FLAVOR_JFD_STATE_RELIGION',			3);
--====================================
-- JFD PROSPERITY
--====================================
-- Civilization_JFD_Currencies
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_Currencies (
	CivilizationType  				text 		REFERENCES Civilizations(Type) 	default null,
	CurrencyType	  				text 		  								default null);

INSERT INTO Civilization_JFD_Currencies	
		(CivilizationType,						CurrencyType)
SELECT	'CIVILIZATION_URDNOT_REV_FRANCE',		CurrencyType
FROM Civilization_JFD_Currencies WHERE CivilizationType = 'CIVILIZATION_FRANCE';
--====================================	
-- JFD SOVEREIGNTY
--====================================	
-- Civilization_JFD_Governments
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_Governments (
	CivilizationType  				text 		REFERENCES Civilizations(Type) 					default null,
	-- CultureType	  					text 		 												default null,
	-- LegislatureName					text														default	null,
	-- OfficeTitle						text														default	null,
	GovernmentType					text														default	null,
	Weight							integer														default	0);

INSERT INTO Civilization_JFD_Governments
		(CivilizationType,					GovernmentType,				Weight)
VALUES	('CIVILIZATION_URDNOT_REV_FRANCE',	'GOVERNMENT_JFD_MONARCHY',	0);
------------------------------------------------------------	
-- Civilization_JFD_HeadsOfGovernment	
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 	
	Civilization_JFD_HeadsOfGovernment (	
	CivilizationType  				text 		REFERENCES Civilizations(Type) 					default null,
	CultureType						text 		 												default null,
	HeadOfGovernmentName			text 		 												default null);

INSERT INTO Civilization_JFD_HeadsOfGovernment
        (CivilizationType,      					HeadOfGovernmentName)
VALUES  ('CIVILIZATION_URDNOT_REV_FRANCE',			'TXT_KEY_US_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_URDNOT_REV_FRANCE_1'),
        ('CIVILIZATION_URDNOT_REV_FRANCE',			'TXT_KEY_US_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_URDNOT_REV_FRANCE_2'),
        ('CIVILIZATION_URDNOT_REV_FRANCE',			'TXT_KEY_US_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_URDNOT_REV_FRANCE_3'),
        ('CIVILIZATION_URDNOT_REV_FRANCE',			'TXT_KEY_US_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_URDNOT_REV_FRANCE_4'),
        ('CIVILIZATION_URDNOT_REV_FRANCE',			'TXT_KEY_US_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_URDNOT_REV_FRANCE_5'),
        ('CIVILIZATION_URDNOT_REV_FRANCE',			'TXT_KEY_US_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_URDNOT_REV_FRANCE_6'),
        ('CIVILIZATION_URDNOT_REV_FRANCE',			'TXT_KEY_US_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_URDNOT_REV_FRANCE_7'),
        ('CIVILIZATION_URDNOT_REV_FRANCE',			'TXT_KEY_US_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_URDNOT_REV_FRANCE_8'),
        ('CIVILIZATION_URDNOT_REV_FRANCE',			'TXT_KEY_US_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_URDNOT_REV_FRANCE_9'),
        ('CIVILIZATION_URDNOT_REV_FRANCE',			'TXT_KEY_US_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_URDNOT_REV_FRANCE_10');
------------------------------------------------------------
-- Civilization_JFD_Titles
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_Titles (
	CivilizationType  					text 		REFERENCES Civilizations(Type) 				default null,
	CultureType							text 		 											default null,
	ReligionType						text 		REFERENCES Religions(Type) 					default null,
	DefaultTitle						text 		 											default null,
	UniqueTitle							text 		 											default null,
	UseAdjective						boolean													default 0);	
	
INSERT INTO Civilization_JFD_Titles
		(CivilizationType,							DefaultTitle,											UniqueTitle,																UseAdjective)
VALUES	('CIVILIZATION_URDNOT_REV_FRANCE',			'TXT_KEY_GOVERNMENT_JFD_DICTATORSHIP_TITLE_GOVERNMENT',	'TXT_KEY_GOVERNMENT_US_DICTATORSHIP_TITLE_GOVERNMENT_URDNOT_REV_FRANCE',	0),	
		('CIVILIZATION_URDNOT_REV_FRANCE',			'TXT_KEY_GOVERNMENT_JFD_DICTATORSHIP_TITLE_LEADER',		'TXT_KEY_GOVERNMENT_US_DICTATORSHIP_TITLE_LEADER_URDNOT_REV_FRANCE',		0),	
		('CIVILIZATION_URDNOT_REV_FRANCE',			'TXT_KEY_GOVERNMENT_JFD_MONARCHY_TITLE_GOVERNMENT',		'TXT_KEY_GOVERNMENT_US_MONARCHY_TITLE_GOVERNMENT_URDNOT_REV_FRANCE',		0),
		('CIVILIZATION_URDNOT_REV_FRANCE',			'TXT_KEY_GOVERNMENT_JFD_MONARCHY_TITLE_LEADER',			'TXT_KEY_GOVERNMENT_US_MONARCHY_TITLE_LEADER_URDNOT_REV_FRANCE',			0);
--------------------------------------------------------------------------------------------------------------------------
-- JFD_PrivyCouncillor_UniqueNames
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	JFD_PrivyCouncillor_UniqueNames (
	PrivyCouncillorType  					text 										 	default null,
	PolicyType  							text 	REFERENCES Policies(Type) 				default null,
	CivilizationType						text	REFERENCES Civilizations(Type) 			default	null,
	CultureType								text											default	null,
	GovernmentType  						text 	 										default null,
	ReligionType							text	REFERENCES Religions(Type) 				default	null,
	UniqueName								text											default	null);

INSERT INTO JFD_PrivyCouncillor_UniqueNames
		(CivilizationType,							PrivyCouncillorType, UniqueName)
SELECT	'CIVILIZATION_URDNOT_REV_FRANCE',			PrivyCouncillorType, UniqueName
FROM JFD_PrivyCouncillor_UniqueNames WHERE CivilizationType = 'CIVILIZATION_FRANCE';
------------------------------------------------------------
-- Civilization_JFD_Politics
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_Politics (
	CivilizationType  					text 		REFERENCES Civilizations(Type) 				default null,
	PoliticsType  						text 													default null,
	UniqueName							text													default	null);

INSERT INTO Civilization_JFD_Politics
		(CivilizationType,							UniqueName,															PoliticsType)
VALUES	('CIVILIZATION_URDNOT_REV_FRANCE',			'TXT_KEY_JFD_ASSEMBLY_JFD_MILITARY_URDNOT_REV_FRANCE',				'ASSEMBLY_JFD_MILITARY'),
		('CIVILIZATION_URDNOT_REV_FRANCE',			'TXT_KEY_JFD_FACTION_JFD_NATIONALIST_URDNOT_REV_FRANCE',			'FACTION_JFD_NATIONALIST'),
		('CIVILIZATION_URDNOT_REV_FRANCE',			'TXT_KEY_JFD_FACTION_JFD_POPULARIST_URDNOT_REV_FRANCE',				'FACTION_JFD_POPULARIST'),
		('CIVILIZATION_URDNOT_REV_FRANCE',			'TXT_KEY_JFD_PARTY_JFD_REVOLUTIONARY_URDNOT_REV_FRANCE',			'FACTION_JFD_REVOLUTIONARY'),
		('CIVILIZATION_URDNOT_REV_FRANCE',			'TXT_KEY_JFD_PARTY_JFD_BURGHERS_URDNOT_REV_FRANCE',					'PARTY_JFD_BURGHERS'),
		('CIVILIZATION_URDNOT_REV_FRANCE',			'TXT_KEY_JFD_PARTY_JFD_CLERGY_URDNOT_REV_FRANCE',					'PARTY_JFD_CLERGY'),
		('CIVILIZATION_URDNOT_REV_FRANCE',			'TXT_KEY_JFD_PARTY_JFD_COMMUNIST_URDNOT_REV_FRANCE',				'PARTY_JFD_COMMUNIST'),
		('CIVILIZATION_URDNOT_REV_FRANCE',			'TXT_KEY_JFD_PARTY_JFD_CONSERVATIVE_URDNOT_REV_FRANCE',				'PARTY_JFD_CONSERVATIVE'),
		('CIVILIZATION_URDNOT_REV_FRANCE',			'TXT_KEY_JFD_PARTY_JFD_FASCIST_URDNOT_REV_FRANCE',					'PARTY_JFD_FASCIST'),
		('CIVILIZATION_URDNOT_REV_FRANCE',			'TXT_KEY_JFD_PARTY_JFD_LIBERAL_URDNOT_REV_FRANCE',					'PARTY_JFD_LIBERAL'),
		('CIVILIZATION_URDNOT_REV_FRANCE',			'TXT_KEY_JFD_PARTY_JFD_LIBERTARIAN_URDNOT_REV_FRANCE',				'PARTY_JFD_LIBERTARIAN'),
		('CIVILIZATION_URDNOT_REV_FRANCE',			'TXT_KEY_JFD_PARTY_JFD_NOBILITY_URDNOT_REV_FRANCE',					'PARTY_JFD_NOBILITY'),
		('CIVILIZATION_URDNOT_REV_FRANCE',			'TXT_KEY_JFD_PARTY_JFD_REACTIONARY_URDNOT_REV_FRANCE',				'PARTY_JFD_REACTIONARY'),
		('CIVILIZATION_URDNOT_REV_FRANCE',			'TXT_KEY_JFD_PARTY_JFD_REVOLUTIONARY_URDNOT_REV_FRANCE',			'PARTY_JFD_REVOLUTIONARY'),
		('CIVILIZATION_URDNOT_REV_FRANCE',			'TXT_KEY_JFD_PARTY_JFD_SOCIALIST_URDNOT_REV_FRANCE',				'PARTY_JFD_SOCIALIST');
------------------------------------------------------------			
-- Flavors
------------------------------------------------------------	
INSERT OR REPLACE INTO Flavors 
		(Type)
VALUES	('FLAVOR_JFD_REFORM_GOVERNMENT'),
		('FLAVOR_JFD_REFORM_LEGAL'),
		('FLAVOR_JFD_REFORM_CULTURE'),
		('FLAVOR_JFD_REFORM_ECONOMIC'),
		('FLAVOR_JFD_REFORM_FOREIGN'),
		('FLAVOR_JFD_REFORM_INDUSTRY'),
		('FLAVOR_JFD_REFORM_MILITARY'),
		('FLAVOR_JFD_REFORM_RELIGION');
------------------------------------------------------------
-- Leader_Flavors
------------------------------------------------------------
INSERT INTO Leader_Flavors
		(LeaderType,					FlavorType,							 Flavor)
VALUES	('LEADER_URDNOT_ROBESPIERRE',	'FLAVOR_JFD_REFORM_GOVERNMENT',		 2),
		('LEADER_URDNOT_ROBESPIERRE',	'FLAVOR_JFD_REFORM_LEGAL',			 1),
		('LEADER_URDNOT_ROBESPIERRE',	'FLAVOR_JFD_REFORM_CULTURE',		 4),
		('LEADER_URDNOT_ROBESPIERRE',	'FLAVOR_JFD_REFORM_ECONOMIC',		 5),
		('LEADER_URDNOT_ROBESPIERRE',	'FLAVOR_JFD_REFORM_FOREIGN',		 7),
		('LEADER_URDNOT_ROBESPIERRE',	'FLAVOR_JFD_REFORM_INDUSTRY',		 6),
		('LEADER_URDNOT_ROBESPIERRE',	'FLAVOR_JFD_REFORM_MILITARY',		 8),
		('LEADER_URDNOT_ROBESPIERRE',	'FLAVOR_JFD_REFORM_RELIGION',		 1);
--------------------------------------------------------------------------------------------------------------------------
-- Leader_JFD_Reforms
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Leader_JFD_Reforms (
	LeaderType  					text 	REFERENCES Leaders(Type) 	default	null,
	ReformType						text								default	null);
	
INSERT INTO Leader_JFD_Reforms
		(LeaderType,					ReformType)
VALUES	('LEADER_URDNOT_ROBESPIERRE',	'REFORM_JFD_LEGITIMACY_MIGHT'),
		('LEADER_URDNOT_ROBESPIERRE',	'REFORM_JFD_STATE_EMPIRE'),
		('LEADER_URDNOT_ROBESPIERRE',	'REFORM_JFD_CONSTITUTION_CODIFIED'),
		('LEADER_URDNOT_ROBESPIERRE',	'REFORM_JFD_POWER_HARD'),
		('LEADER_URDNOT_ROBESPIERRE',	'REFORM_JFD_CONQUEST_SUBJUGATION'),
		('LEADER_URDNOT_ROBESPIERRE',	'REFORM_JFD_RECRUITMENT_PROFESSIONAL');
--==========================================================================================================================
-- SUKRITACT DECISIONS
--==========================================================================================================================
-- DecisionsAddin_Support
------------------------------
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
INSERT INTO DecisionsAddin_Support (FileName) VALUES ('RevFranceDecisions.lua');
--==========================================================================================================================
-- TOMATEKH HISTORICAL RELIGIONS
--==========================================================================================================================
-- Civilization_Religions
------------------------------
UPDATE Civilization_Religions 
SET ReligionType = 'RELIGION_CHRISTIANITY'
WHERE CivilizationType = 'CIVILIZATION_URDNOT_REV_FRANCE'
AND EXISTS (SELECT * FROM Religions WHERE Type = 'RELIGION_CATHOLICISM');
--==========================================================================================================================
--==========================================================================================================================