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
        (LeaderType,             	TraitOne,               TraitTwo)
SELECT	'LEADER_JFD_MARGARETHE', 	'POLICY_MERCANTILE_X',	'POLICY_SEAFARING_X'
WHERE EXISTS (SELECT * FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X');
------------------------------	
-- Leaders
------------------------------	
UPDATE Leaders 
SET Description = 'Margarethe I [ICON_CONNECTED][ICON_MOVES]'
WHERE Type = 'LEADER_JFD_MARGARETHE'
AND EXISTS (SELECT * FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X');
--==========================================================================================================================
-- GAZEBO COMMUNITY PATCH
--==========================================================================================================================
-- Building_ImprovementYieldChanges
------------------------------	
CREATE TABLE IF NOT EXISTS 
Building_ImprovementYieldChanges (
	BuildingType 					text 	REFERENCES Buildings(Type) 		default null,
	ImprovementType 				text	REFERENCES Improvements(Type) 	default null,
	YieldType						text									default	null,
	Yield							integer									default	0);

INSERT INTO Building_ImprovementYieldChanges 	
		(BuildingType, 					ImprovementType,	YieldType,		Yield)
SELECT	'BUILDING_JFD_KOBSTAD',			Type,				'YIELD_GOLD',	1
FROM Improvements WHERE Type IN ('IMPROVEMENT_TRADING_POST', 'IMPROVEMENT_JFD_TOWN', 'IMPROVEMENT_JFD_VILLAGE', 'IMPROVEMENT_JFD_TRADING_POST', 'IMPROVEMENT_CUSTOMS_HOUSE');
--==========================================================================================================================
-- GAZEBO COMMUNITY BALANCE PATCH
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS COMMUNITY (Type TEXT, Value INTEGER);
------------------------------
-- Buildings
------------------------------	
UPDATE Buildings 
SET Help = 'TXT_KEY_BUILDING_JFD_KOBSTAD_HELP_CBO'
WHERE Type = 'BUILDING_JFD_KOBSTAD'
AND EXISTS (SELECT * FROM COMMUNITY WHERE Type = 'COMMUNITY_CORE_BALANCE_BUILDINGS' AND Value = 1);
------------------------------
-- Building_ResourceYieldChanges
------------------------------	
INSERT INTO Building_ResourceYieldChanges 	
		(BuildingType, 					ResourceType,	YieldType,		Yield)
SELECT	'BUILDING_JFD_KOBSTAD',			ResourceType,	'YIELD_GOLD',	1
FROM Building_ResourceYieldChanges WHERE BuildingType = 'BUILDING_MARKET';
--==========================================================================================================================
-- GEDEMON R.E.D.
--==========================================================================================================================
-- Civilizations
------------------------------	
UPDATE Civilizations 
SET ArtStyleSuffix = '_DENMARK'
WHERE Type = 'CIVILIZATION_JFD_KALMAR_UNION'
AND EXISTS (SELECT * FROM Civilizations WHERE ArtStyleSuffix = '_DENMARK');
--==========================================================================================================================
-- GEDEMON YNAEMP
--==========================================================================================================================
-- Civilizations_YagemStartPosition (Earth Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YagemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YagemStartPosition
		(Type,								X,	Y)
SELECT	'CIVILIZATION_JFD_KALMAR_UNION',	X,	Y
FROM Civilizations_YagemStartPosition WHERE Type = 'CIVILIZATION_DENMARK';
------------------------------------------------------------	
-- Civilizations_YahemStartPosition (Earth Huge)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YahemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YahemStartPosition
		(Type,								X,	Y)
SELECT	'CIVILIZATION_JFD_KALMAR_UNION',	X,	Y
FROM Civilizations_YahemStartPosition WHERE Type = 'CIVILIZATION_DENMARK';
------------------------------------------------------------	
-- Civilizations_CordiformStartPosition (Earth Standard)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_CordiformStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_CordiformStartPosition
		(Type,								X,	Y)
SELECT	'CIVILIZATION_JFD_KALMAR_UNION',	X,	Y
FROM Civilizations_CordiformStartPosition WHERE Type = 'CIVILIZATION_DENMARK';
------------------------------------------------------------	
-- Civilizations_CordiformStartPosition (Earth Standard)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EarthStandardStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_EarthStandardStartPosition
		(Type,								X,	Y)
SELECT	'CIVILIZATION_JFD_KALMAR_UNION',	X,	Y
FROM Civilizations_EarthStandardStartPosition WHERE Type = 'CIVILIZATION_DENMARK';
------------------------------------------------------------	
-- Civilizations_GreatestEarthStartPosition (Earth Greatest)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_GreatestEarthStartPosition
		(Type,								X,	Y)
SELECT	'CIVILIZATION_JFD_KALMAR_UNION',	X,	Y
FROM Civilizations_GreatestEarthStartPosition WHERE Type = 'CIVILIZATION_DENMARK';
------------------------------------------------------------	
-- Civilizations_EuroGiantStartPosition (Europe Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EuroGiantStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_EuroGiantStartPosition
		(Type,								X,	Y)
SELECT	'CIVILIZATION_JFD_KALMAR_UNION',	X,	Y
FROM Civilizations_EuroGiantStartPosition WHERE Type = 'CIVILIZATION_DENMARK';
------------------------------------------------------------	
-- Civilizations_EuroLargeStartPosition (Europe Large)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EuroLargeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_EuroLargeStartPosition
		(Type,								X,	Y)
SELECT	'CIVILIZATION_JFD_KALMAR_UNION',	X,	Y
FROM Civilizations_EuroLargeStartPosition WHERE Type = 'CIVILIZATION_DENMARK';
------------------------------------------------------------	
-- Civilizations_BritishIslesStartPosition (British Isles)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_BritishIslesStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_BritishIslesStartPosition
		(Type,								X,	Y)
SELECT	'CIVILIZATION_JFD_KALMAR_UNION',	X,	Y
FROM Civilizations_BritishIslesStartPosition WHERE Type = 'CIVILIZATION_DENMARK';
------------------------------------------------------------	
-- Civilizations_CaribbeanStartPosition (Caribbean)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_CaribbeanStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_CaribbeanStartPosition
		(Type,								X,	Y)
SELECT	'CIVILIZATION_JFD_KALMAR_UNION',	X,	Y
FROM Civilizations_CaribbeanStartPosition WHERE Type = 'CIVILIZATION_DENMARK';
------------------------------------------------------------	
-- Civilizations_NorthAtlanticStartPosition (North Atlantic)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_NorthAtlanticStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_NorthAtlanticStartPosition
		(Type,								X,	Y)
SELECT	'CIVILIZATION_JFD_KALMAR_UNION',	X,	Y
FROM Civilizations_NorthAtlanticStartPosition WHERE Type = 'CIVILIZATION_DENMARK';
------------------------------------------------------------	
-- Civilizations_AmericasStartPosition (Americas)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_AmericasStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_AmericasStartPosition
		(Type,								X,	Y)
SELECT	'CIVILIZATION_JFD_KALMAR_UNION',	X,	Y
FROM Civilizations_AmericasStartPosition WHERE Type = 'CIVILIZATION_DENMARK';
------------------------------------------------------------	
-- Civilizations_NorthWestEuropeStartPosition (North-West Europe)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_NorthWestEuropeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_NorthWestEuropeStartPosition
		(Type,								X,	Y)
SELECT	'CIVILIZATION_JFD_KALMAR_UNION',	X,	Y
FROM Civilizations_NorthWestEuropeStartPosition WHERE Type = 'CIVILIZATION_DENMARK';
------------------------------------------------------------	
-- Civilizations_YagemRequestedResource (Earth Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YagemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YagemRequestedResource
		(Type, 								Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_KALMAR_UNION',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YagemRequestedResource WHERE Type = 'CIVILIZATION_DENMARK';
------------------------------------------------------------	
-- Civilizations_YahemRequestedResource (Earth Huge)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YahemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YahemRequestedResource
		(Type, 								Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_KALMAR_UNION',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YahemRequestedResource WHERE Type = 'CIVILIZATION_DENMARK';
------------------------------------------------------------	
-- Civilizations_GreatestEarthRequestedResource (Earth Greatest)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_GreatestEarthRequestedResource
		(Type, 								Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_KALMAR_UNION',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE Type = 'CIVILIZATION_DENMARK';
------------------------------------------------------------	
-- Civilizations_EuroGiantRequestedResource (Europe Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EuroGiantRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_EuroGiantRequestedResource
		(Type, 								Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_KALMAR_UNION',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_EuroGiantRequestedResource WHERE Type = 'CIVILIZATION_DENMARK';
------------------------------------------------------------	
-- Civilizations_EuroLargeRequestedResource (Europe Large)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EuroLargeRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_EuroLargeRequestedResource
		(Type, 								Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_KALMAR_UNION',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_EuroLargeRequestedResource WHERE Type = 'CIVILIZATION_DENMARK';
------------------------------------------------------------	
-- Civilizations_CaribbeanRequestedResource (Caribbean)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_CaribbeanRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_CaribbeanRequestedResource
		(Type, 								Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_KALMAR_UNION',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_CaribbeanRequestedResource WHERE Type = 'CIVILIZATION_DENMARK';
------------------------------------------------------------	
-- Civilizations_NorthAtlanticRequestedResource (North Atlantic)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_NorthAtlanticRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_NorthAtlanticRequestedResource
		(Type, 								Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_KALMAR_UNION',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_NorthAtlanticRequestedResource WHERE Type = 'CIVILIZATION_DENMARK';
------------------------------------------------------------	
-- Civilizations_AmericasRequestedResource (Americas)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_AmericasRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_AmericasRequestedResource
		(Type, 								Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_KALMAR_UNION',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_AmericasRequestedResource WHERE Type = 'CIVILIZATION_DENMARK';
------------------------------------------------------------	
-- Civilizations_NorthWestEuropeRequestedResource (North-West Europe)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_NorthWestEuropeRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_NorthWestEuropeRequestedResource
		(Type, 								Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_KALMAR_UNION',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_NorthWestEuropeRequestedResource WHERE Type = 'CIVILIZATION_DENMARK';
--==========================================================================================================================
-- HAZEL MAP LABELS
--==========================================================================================================================
-- ML_CivCultures
------------------------------	
CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
		(CivType,							CultureType,	CultureEra)
VALUES	('CIVILIZATION_JFD_KALMAR_UNION',	'GERMANIC',		'ANY');
--==========================================================================================================================
-- JFD USER SETTINGS
--==========================================================================================================================
-- JFD_GlobalUserSettings
-------------------------------------
CREATE TABLE IF NOT EXISTS 
JFD_GlobalUserSettings (
	Type 										text 											default null,
	Value 										integer 										default 1);
--==========================================================================================================================
-- JFD CIVILOPEDIA
--==========================================================================================================================
-- JFD_Civilopedia_HideFromPedia
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
JFD_Civilopedia_HideFromPedia (Type text default null);
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
		(CivilizationType,					ArtDefineTag, CultureType, DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag)
SELECT	'CIVILIZATION_JFD_KALMAR_UNION',	ArtDefineTag, CultureType, DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_DENMARK';
------------------------------	
-- Civilizations
------------------------------	
UPDATE Civilizations 
SET SoundtrackTag = 'JFD_Northern'
WHERE Type = 'CIVILIZATION_JFD_KALMAR_UNION'
AND EXISTS (SELECT * FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Northern')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);
--==========================================================================================================================
-- JFD CITIES IN DEVELOPMENT
--==========================================================================================================================
-- Building_ConstructionAudio
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS
	Building_ConstructionAudio (
    BuildingType								text		REFERENCES Buildings(Type)      default null,
    ConstructionAudio							text										default null);
	
INSERT INTO Building_ConstructionAudio
		(BuildingType, 					ConstructionAudio)
SELECT	'BUILDING_JFD_KOBSTAD',			'AS2D_BUILDING_JFD_KOBSTAD'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_CIV_BUILDING_SOUNDS' AND Value = 1);
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
		(CivilizationType,					ColonyName,	LinguisticType)
SELECT	'CIVILIZATION_JFD_KALMAR_UNION',	ColonyName, LinguisticType
FROM Civilization_JFD_ColonialCityNames WHERE CivilizationType = 'CIVILIZATION_DENMARK';
--====================================
-- JFD PROVINCES 
--====================================
-- Buildings
------------------------------------------------------------
UPDATE Buildings 
SET Help = 'TXT_KEY_BUILDING_JFD_KOBSTAD_HELP_PROVINCES', Strategy = 'TXT_KEY_BUILDING_JFD_KOBSTAD_STRATEGY_PROVINCES'
WHERE Type = 'BUILDING_JFD_KOBSTAD'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_IMPROVEMENT_CHANGES_TRADING_POST' AND Value = 1);

UPDATE Buildings 
SET Help = 'TXT_KEY_BUILDING_JFD_KOBSTAD_HELP_CBO_PROVINCES'
WHERE Type = 'BUILDING_JFD_KOBSTAD'
AND EXISTS (SELECT * FROM COMMUNITY WHERE Type = 'COMMUNITY_CORE_BALANCE_BUILDINGS' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_IMPROVEMENT_CHANGES_TRADING_POST' AND Value = 1);
------------------------------------------------------------
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
		(CivilizationType,					DefaultTitle, UniqueTitle)
SELECT	'CIVILIZATION_JFD_KALMAR_UNION',	DefaultTitle, UniqueTitle
FROM Civilization_JFD_ProvinceTitles WHERE CivilizationType = 'CIVILIZATION_DENMARK';
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
		(LeaderType,				FlavorType,				Flavor)
VALUES	('LEADER_JFD_MARGARETHE',	'FLAVOR_JFD_SLAVERY',	2);
--==========================================================================================================================	
-- JFD AND POUAKAI MERCENARIES
--==========================================================================================================================
-- Flavors
------------------------------------------------------------	
INSERT OR REPLACE INTO Flavors 
		(Type)
VALUES	('FLAVOR_JFD_MERCENARY');
------------------------------------------------------------
-- Leader_Flavors
------------------------------------------------------------	
INSERT INTO Leader_Flavors
		(LeaderType,				FlavorType,				 Flavor)
VALUES	('LEADER_JFD_MARGARETHE',	'FLAVOR_JFD_MERCENARY',	 5);
--====================================	
-- JFD PIETY
--====================================	
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
		(LeaderType,					FlavorType,							 Flavor)
VALUES	('LEADER_JFD_MARGARETHE',		'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',	 4),
		('LEADER_JFD_MARGARETHE',		'FLAVOR_JFD_STATE_RELIGION',		 7);
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
		(CivilizationType,					CurrencyType)
SELECT	'CIVILIZATION_JFD_KALMAR_UNION',	CurrencyType
FROM Civilization_JFD_Currencies WHERE CivilizationType = 'CIVILIZATION_SWEDEN';
--====================================
-- JFD SOVEREIGNTY
--====================================	
-- Civilization_JFD_Governments
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_Governments (
	CivilizationType  				text 		REFERENCES Civilizations(Type) 					default null,
	GovernmentType					text														default	null,
	Weight							integer														default	0);

INSERT INTO Civilization_JFD_Governments
		(CivilizationType,					GovernmentType,				Weight)
VALUES	('CIVILIZATION_JFD_KALMAR_UNION',	'GOVERNMENT_JFD_MONARCHY',  70);
------------------------------------------------------------
-- Civilization_JFD_HeadsOfGovernment	
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 	
	Civilization_JFD_HeadsOfGovernment (	
	CivilizationType  				text 		REFERENCES Civilizations(Type) 					default null,
	CultureType						text 		 												default null,
	HeadOfGovernmentName			text 		 												default null);

INSERT INTO Civilization_JFD_HeadsOfGovernment
        (CivilizationType,      			HeadOfGovernmentName)
VALUES  ('CIVILIZATION_JFD_KALMAR_UNION',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_KALMAR_UNION_1'),
        ('CIVILIZATION_JFD_KALMAR_UNION',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_KALMAR_UNION_2'),
        ('CIVILIZATION_JFD_KALMAR_UNION',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_KALMAR_UNION_3'),
        ('CIVILIZATION_JFD_KALMAR_UNION',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_KALMAR_UNION_4'),
        ('CIVILIZATION_JFD_KALMAR_UNION',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_KALMAR_UNION_5'),
        ('CIVILIZATION_JFD_KALMAR_UNION',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_KALMAR_UNION_6'),
        ('CIVILIZATION_JFD_KALMAR_UNION',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_KALMAR_UNION_7'),
        ('CIVILIZATION_JFD_KALMAR_UNION',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_KALMAR_UNION_8'),
        ('CIVILIZATION_JFD_KALMAR_UNION',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_KALMAR_UNION_9'),
        ('CIVILIZATION_JFD_KALMAR_UNION',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_KALMAR_UNION_10'),
        ('CIVILIZATION_JFD_KALMAR_UNION',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_KALMAR_UNION_11'),
        ('CIVILIZATION_JFD_KALMAR_UNION',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_KALMAR_UNION_12'),
        ('CIVILIZATION_JFD_KALMAR_UNION',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_KALMAR_UNION_13'),
        ('CIVILIZATION_JFD_KALMAR_UNION',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_KALMAR_UNION_14'),
        ('CIVILIZATION_JFD_KALMAR_UNION',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_KALMAR_UNION_15'),
        ('CIVILIZATION_JFD_KALMAR_UNION',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_KALMAR_UNION_16'),
        ('CIVILIZATION_JFD_KALMAR_UNION',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_KALMAR_UNION_17'),
        ('CIVILIZATION_JFD_KALMAR_UNION',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_KALMAR_UNION_18'),
        ('CIVILIZATION_JFD_KALMAR_UNION',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_KALMAR_UNION_19'),
        ('CIVILIZATION_JFD_KALMAR_UNION',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_KALMAR_UNION_20'),
        ('CIVILIZATION_JFD_KALMAR_UNION',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_KALMAR_UNION_21'),
        ('CIVILIZATION_JFD_KALMAR_UNION',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_KALMAR_UNION_22'),
        ('CIVILIZATION_JFD_KALMAR_UNION',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_KALMAR_UNION_23'),
        ('CIVILIZATION_JFD_KALMAR_UNION',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_KALMAR_UNION_24'),
        ('CIVILIZATION_JFD_KALMAR_UNION',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_KALMAR_UNION_25');
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
		(CivilizationType,					DefaultTitle,											UniqueTitle,												UseAdjective)
VALUES	('CIVILIZATION_JFD_KALMAR_UNION',	'TXT_KEY_GOVERNMENT_JFD_TRIBE_TITLE_GOVERNMENT',		'TXT_KEY_GOVERNMENT_JFD_TITLE_GOVERNMENT_JFD_KALMAR_UNION',	0),	
		('CIVILIZATION_JFD_KALMAR_UNION',	'TXT_KEY_GOVERNMENT_JFD_PRINCIPALITY_TITLE_GOVERNMENT',	'TXT_KEY_GOVERNMENT_JFD_TITLE_GOVERNMENT_JFD_KALMAR_UNION',	0),	
		('CIVILIZATION_JFD_KALMAR_UNION',	'TXT_KEY_GOVERNMENT_JFD_MONARCHY_TITLE_GOVERNMENT',		'TXT_KEY_GOVERNMENT_JFD_TITLE_GOVERNMENT_JFD_KALMAR_UNION',	0),	
		('CIVILIZATION_JFD_KALMAR_UNION',	'TXT_KEY_GOVERNMENT_JFD_EMPIRE_TITLE_GOVERNMENT',		'TXT_KEY_GOVERNMENT_JFD_TITLE_GOVERNMENT_JFD_KALMAR_UNION',	0),	
		('CIVILIZATION_JFD_KALMAR_UNION',	'TXT_KEY_GOVERNMENT_JFD_COMMONWEALTH_TITLE_GOVERNMENT',	'TXT_KEY_GOVERNMENT_JFD_TITLE_GOVERNMENT_JFD_KALMAR_UNION',	0),	
		('CIVILIZATION_JFD_KALMAR_UNION',	'TXT_KEY_GOVERNMENT_JFD_REPUBLIC_TITLE_GOVERNMENT',		'TXT_KEY_GOVERNMENT_JFD_TITLE_GOVERNMENT_JFD_KALMAR_UNION',	0),
		('CIVILIZATION_JFD_KALMAR_UNION',	'TXT_KEY_GOVERNMENT_JFD_FEDERATION_TITLE_GOVERNMENT',	'TXT_KEY_GOVERNMENT_JFD_TITLE_GOVERNMENT_JFD_KALMAR_UNION',	0);
------------------------------------------------------------
-- Civilization_JFD_Politics
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_Politics (
	CivilizationType  					text 		REFERENCES Civilizations(Type) 					default null,
	PoliticsType  						text 														default null,
	UniqueName							text														default	null);

INSERT INTO Civilization_JFD_Politics
		(CivilizationType,					PoliticsType, UniqueName)
SELECT	'CIVILIZATION_JFD_KALMAR_UNION',	PoliticsType, UniqueName
FROM Civilization_JFD_Politics WHERE CivilizationType = 'CIVILIZATION_DENMARK';
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
		(CivilizationType,					PrivyCouncillorType, UniqueName)
SELECT	'CIVILIZATION_JFD_KALMAR_UNION',	PrivyCouncillorType, UniqueName
FROM JFD_PrivyCouncillor_UniqueNames WHERE CivilizationType = 'CIVILIZATION_SWEDEN';
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
		(LeaderType,				FlavorType,							 Flavor)
VALUES	('LEADER_JFD_MARGARETHE',	'FLAVOR_JFD_REFORM_GOVERNMENT',		 5),
		('LEADER_JFD_MARGARETHE',	'FLAVOR_JFD_REFORM_LEGAL',			 5),
		('LEADER_JFD_MARGARETHE',	'FLAVOR_JFD_REFORM_CULTURE',		 5),
		('LEADER_JFD_MARGARETHE',	'FLAVOR_JFD_REFORM_ECONOMIC',		 4),
		('LEADER_JFD_MARGARETHE',	'FLAVOR_JFD_REFORM_FOREIGN',		 4),
		('LEADER_JFD_MARGARETHE',	'FLAVOR_JFD_REFORM_INDUSTRY',		 5),
		('LEADER_JFD_MARGARETHE',	'FLAVOR_JFD_REFORM_MILITARY',		 5),
		('LEADER_JFD_MARGARETHE',	'FLAVOR_JFD_REFORM_RELIGION',		 5);
--==========================================================================================================================
-- SUKRITACT DECISIONS
--==========================================================================================================================
-- DecisionsAddin_Support
------------------------------
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
INSERT INTO DecisionsAddin_Support (FileName) VALUES ('JFD_KalmarUnion_Decisions.lua');
--------------------------------
-- Policies
--------------------------------	
INSERT INTO Policies 
		(Type, 													Description, 											MinorGoldFriendshipMod)
VALUES	('POLICY_DECISIONS_JFD_KALMAR_UNION_MARKET_RIGHTS',		'TXT_KEY_DECISIONS_JFD_KALMAR_UNION_MARKET_RIGHTS', 	20);
------------------------------	
-- UnitPromotions
------------------------------
INSERT INTO UnitPromotions 
		(Type, 									TradeMissionInfluenceModifier,	Description, 								Help, 											Sound, 				CannotBeChosen, PortraitIndex, 	IconAtlas, 			PediaType, 			PediaEntry)
VALUES	('PROMOTION_DECISIONS_JFD_MAGNATE',		100,							'TXT_KEY_PROMOTION_DECISIONS_JFD_MAGNATE',	'TXT_KEY_PROMOTION_DECISIONS_JFD_MAGNATE_HELP', 'AS2D_IF_LEVELUP', 	1, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_DECISIONS_JFD_MAGNATE');
------------------------------	
-- Units
--------------------------------	
INSERT INTO Units 	
		(Type, 							ShowInPedia, Class, Cost, Moves, CivilianAttackPriority, Special, Domain, DefaultUnitAI, BaseGold,	Description, 							Civilopedia, 						Strategy, 										MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, AdvancedStartCost, GoodyHutUpgradeUnitClass, CombatLimit, ObsoleteTech, XPValueDefense, UnitArtInfo, 					UnitFlagIconOffset, UnitFlagAtlas,					PortraitIndex, 	IconAtlas,					MoveRate)
SELECT	'UNIT_DECISIONS_JFD_MAGNATE',	0,			 Class, Cost, Moves, CivilianAttackPriority, Special, Domain, DefaultUnitAI, 1,			'TXT_KEY_UNIT_DECISIONS_JFD_MAGNATE', 	'TXT_KEY_CIV5_JFD_MAGNATE_TEXT',	'TXT_KEY_UNIT_DECISIONS_JFD_MAGNATE_STRATEGY',	MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, AdvancedStartCost, GoodyHutUpgradeUnitClass, CombatLimit, ObsoleteTech, XPValueDefense, 'ART_DEF_UNIT_JFD_MAGNATE',	0,					'JFD_UNIT_FLAG_MAGNATE_ATLAS',	2, 				'JFD_KALMAR_UNION_ATLAS',	MoveRate
FROM Units WHERE Type = 'UNIT_MERCHANT';
------------------------------
-- UnitGameplay2DScripts
------------------------------	
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 						SelectionSound, FirstSelectionSound)
SELECT	'UNIT_DECISIONS_JFD_MAGNATE', 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_MERCHANT';
------------------------------
-- Unit_AITypes
------------------------------	
INSERT INTO Unit_AITypes 	
		(UnitType, 						UnitAIType)
SELECT	'UNIT_DECISIONS_JFD_MAGNATE', 	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_MERCHANT';
------------------------------
-- Unit_Flavors
------------------------------	
INSERT INTO Unit_Flavors 	
		(UnitType, 						FlavorType, Flavor)
SELECT	'UNIT_DECISIONS_JFD_MAGNATE', 	FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_MERCHANT';
------------------------------
-- Unit_FreePromotions
------------------------------	
INSERT INTO Unit_FreePromotions 	
		(UnitType, 						PromotionType)
SELECT	'UNIT_DECISIONS_JFD_MAGNATE', 	PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_MERCHANT';

INSERT INTO Unit_FreePromotions 	
		(UnitType, 						PromotionType)
VALUES	('UNIT_DECISIONS_JFD_MAGNATE',  'PROMOTION_DECISIONS_JFD_MAGNATE'),
		('UNIT_DECISIONS_JFD_MAGNATE',  'PROMOTION_RIVAL_TERRITORY');
--==========================================================================================================================
--==========================================================================================================================