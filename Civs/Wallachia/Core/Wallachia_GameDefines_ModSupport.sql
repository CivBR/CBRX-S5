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
        (LeaderType,            TraitOne,               TraitTwo)
SELECT  'LEADER_JFD_VLAD',		'POLICY_AGGRESSIVE_X',	 'POLICY_PROTECTIVE_X'
WHERE EXISTS (SELECT * FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X');
------------------------------	
-- Leaders
------------------------------	
UPDATE Leaders 
SET Description = 'Vlad III Tepes [ICON_WAR][ICON_STRENGTH]'
WHERE Type = 'LEADER_JFD_VLAD'
AND EXISTS (SELECT * FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X');
--==========================================================================================================================
-- GAZEBO COMMUNITY PATCH
--==========================================================================================================================
-- COMMUNITY
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS COMMUNITY (Type TEXT, Value INTEGER);
--==========================================================================================================================
-- GAZEBO COMMUNITY BALANCE OVERHAUL
--==========================================================================================================================
-- Buildings
------------------------------	
UPDATE Buildings 
SET Help = 'TXT_KEY_BUILDING_JFD_FORTIFIED_CHURCH_HELP_CBO'
WHERE Type = 'BUILDING_JFD_FORTIFIED_CHURCH'
AND EXISTS (SELECT * FROM COMMUNITY WHERE Type = 'COMMUNITY_CORE_BALANCE_BUILDINGS' AND Value = 1);
--==========================================================================================================================
-- GEDEMON R.E.D.
--==========================================================================================================================
-- Civilizations
------------------------------	
UPDATE Civilizations 
SET ArtStyleSuffix = '_POLAND'
WHERE Type = 'CIVILIZATION_JFD_WALLACHIA'
AND EXISTS (SELECT * FROM Civilizations WHERE ArtStyleSuffix = '_POLAND');
--==========================================================================================================================
-- GEDEMON YNAEMP
--==========================================================================================================================
-- Civilizations_YagemStartPosition (Earth Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YagemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YagemStartPosition
		(Type,							X,	Y)
VALUES	('CIVILIZATION_JFD_WALLACHIA',	31,	64);

CREATE TABLE IF NOT EXISTS MinorCiv_YagemStartPosition(Type, X, Y, AltX, AltY);			
DELETE FROM MinorCiv_YagemStartPosition WHERE Type IN ('MINOR_CIV_BUCHAREST');
INSERT INTO MinorCiv_YagemStartPosition
		(Type,							X,	Y)
VALUES	('MINOR_CIV_BUCHAREST',			32,	65); -- Chisinau
------------------------------------------------------------	
-- Civilizations_YahemStartPosition (Earth Huge)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YahemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YahemStartPosition
		(Type,							X,	Y)
VALUES	('CIVILIZATION_JFD_WALLACHIA',	68,	56);

CREATE TABLE IF NOT EXISTS MinorCiv_YahemStartPosition(Type, X, Y, AltX, AltY);				
DELETE FROM MinorCiv_YahemStartPosition WHERE Type IN ('MINOR_CIV_BUCHAREST');
INSERT INTO MinorCiv_YahemStartPosition
		(Type,							X,	Y)
VALUES	('MINOR_CIV_BUCHAREST',			69,	58); -- Chisinau
------------------------------------------------------------	
-- Civilizations_CordiformStartPosition (Earth Standard)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_CordiformStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_CordiformStartPosition
		(Type,							X,	Y)
VALUES	('CIVILIZATION_JFD_WALLACHIA',	43,	26);

CREATE TABLE IF NOT EXISTS MinorCiv_CordiformStartPosition(Type, X, Y, AltX, AltY);
DELETE FROM MinorCiv_CordiformStartPosition WHERE Type IN ('MINOR_CIV_BUCHAREST');
INSERT INTO MinorCiv_CordiformStartPosition
		(Type,							X,	Y)
VALUES	('MINOR_CIV_BUCHAREST',			43,	27); -- Chisinau
------------------------------------------------------------	
-- Civilizations_GreatestEarthStartPosition (Earth Greatest)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_GreatestEarthStartPosition
		(Type,							X,	Y)
VALUES	('CIVILIZATION_JFD_WALLACHIA',	57,	49);

CREATE TABLE IF NOT EXISTS MinorCiv_GreatestEarthStartPosition(Type, X, Y, AltX, AltY);		
DELETE FROM MinorCiv_GreatestEarthStartPosition WHERE Type IN ('MINOR_CIV_BUCHAREST');
INSERT INTO MinorCiv_GreatestEarthStartPosition
		(Type,							X,	Y)
VALUES	('MINOR_CIV_BUCHAREST',			58,	50); -- Chisinau
------------------------------------------------------------	
-- Civilizations_EuroGiantStartPosition (Europe Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EuroGiantStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_EuroGiantStartPosition
		(Type,							X,	Y)
VALUES	('CIVILIZATION_JFD_WALLACHIA',	97, 45);

CREATE TABLE IF NOT EXISTS MinorCiv_EuroGiantStartPosition(Type, X, Y, AltX, AltY);	
DELETE FROM MinorCiv_EuroGiantStartPosition WHERE Type IN ('MINOR_CIV_BUCHAREST');
INSERT INTO MinorCiv_EuroGiantStartPosition
		(Type,							X,	 Y)
VALUES	('MINOR_CIV_BUCHAREST',			107, 56); -- Chisinau
------------------------------------------------------------	
-- Civilizations_EuroLargeStartPosition (Europe Large)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EuroLargeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_EuroLargeStartPosition
		(Type,							X,	Y)
VALUES	('CIVILIZATION_JFD_WALLACHIA',	50,	37);

CREATE TABLE IF NOT EXISTS MinorCiv_EuroLargeStartPosition(Type, X, Y, AltX, AltY);	
DELETE FROM MinorCiv_EuroLargeStartPosition WHERE Type IN ('MINOR_CIV_BUCHAREST');
INSERT INTO MinorCiv_EuroLargeStartPosition
		(Type,							X,	Y)
VALUES	('MINOR_CIV_BUCHAREST',			53,	40); -- Chisinau
------------------------------------------------------------	
-- Civilizations_EuroLargeNewStartPosition (Europe (Greatest) Large)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EuroLargeNewStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_EuroLargeNewStartPosition
		(Type,							X,	Y)
VALUES	('CIVILIZATION_JFD_WALLACHIA',	55,	30);

CREATE TABLE IF NOT EXISTS MinorCiv_EuroLargeNewStartPosition(Type, X, Y, AltX, AltY);	
DELETE FROM MinorCiv_EuroLargeNewStartPosition WHERE Type IN ('MINOR_CIV_BUCHAREST');
INSERT INTO MinorCiv_EuroLargeNewStartPosition
		(Type,							X,	Y)
VALUES	('MINOR_CIV_BUCHAREST',			57, 36); -- Chisinau
------------------------------------------------------------	
-- Civilizations_MediterraneanStartPosition (Mediterranean)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_MediterraneanStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_MediterraneanStartPosition
		(Type,							X,	Y)
VALUES	('CIVILIZATION_JFD_WALLACHIA',	65, 53);

CREATE TABLE IF NOT EXISTS MinorCiv_MediterraneanStartPosition(Type, X, Y, AltX, AltY);	
DELETE FROM MinorCiv_MediterraneanStartPosition WHERE Type IN ('MINOR_CIV_BUCHAREST');
INSERT INTO MinorCiv_MediterraneanStartPosition
		(Type,							X,	Y)
VALUES	('MINOR_CIV_BUCHAREST',			71,	57); -- Chisinau
------------------------------------------------------------	
-- Civilizations_EuroEasternStartPosition (Eastern Europe Large)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EuroEasternStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_EuroEasternStartPosition
		(Type,							X,	Y)
VALUES	('CIVILIZATION_JFD_WALLACHIA',	45,	6);

CREATE TABLE IF NOT EXISTS MinorCiv_EuroEasternStartPosition(Type, X, Y, AltX, AltY);	
DELETE FROM MinorCiv_EuroEasternStartPosition WHERE Type IN ('MINOR_CIV_BUCHAREST');
INSERT INTO MinorCiv_EuroEasternStartPosition
		(Type,							X,	Y)
VALUES	('MINOR_CIV_BUCHAREST',			48, 19); -- Chisinau
------------------------------------------------------------	
-- Civilizations_AfriAsiaAustStartPosition (Africa, Asia & Australia)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_AfriAsiaAustStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_AfriAsiaAustStartPosition
		(Type,							X,	Y)
VALUES	('CIVILIZATION_JFD_WALLACHIA',	37,	79);

CREATE TABLE IF NOT EXISTS MinorCiv_AfriAsiaAustStartPosition(Type, X, Y, AltX, AltY);	
DELETE FROM MinorCiv_AfriAsiaAustStartPosition WHERE Type IN ('MINOR_CIV_BUCHAREST');
------------------------------------------------------------	
-- Civilizations_AfriSouthEuroStartPosition (Africa & Southern Europe)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_AfriSouthEuroStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_AfriSouthEuroStartPosition
		(Type,							X,	Y)
VALUES	('CIVILIZATION_JFD_WALLACHIA',	49,	77);

CREATE TABLE IF NOT EXISTS MinorCiv_AfriSouthEuroStartPosition(Type, X, Y, AltX, AltY);	
DELETE FROM MinorCiv_AfriSouthEuroStartPosition WHERE Type IN ('MINOR_CIV_BUCHAREST');
INSERT INTO MinorCiv_AfriSouthEuroStartPosition
		(Type,							X,	Y)
VALUES	('MINOR_CIV_BUCHAREST',			52, 79); -- Chisinau
------------------------------------------------------------	
-- Civilizations_YagemRequestedResource (Earth Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YagemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YagemRequestedResource
		(Type, 							Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_WALLACHIA',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YagemRequestedResource WHERE Type = 'CIVILIZATION_POLAND';
------------------------------------------------------------	
-- Civilizations_YahemRequestedResource (Earth Huge)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YahemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YahemRequestedResource
		(Type, 							Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_WALLACHIA',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YahemRequestedResource WHERE Type = 'CIVILIZATION_POLAND';
------------------------------------------------------------	
-- Civilizations_GreatestEarthRequestedResource (Earth Greatest)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_GreatestEarthRequestedResource
		(Type, 							Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_WALLACHIA',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE Type = 'CIVILIZATION_POLAND';
------------------------------------------------------------	
-- Civilizations_EuroLargeRequestedResource (Europe Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EuroGiantRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_EuroGiantRequestedResource
		(Type, 							Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_WALLACHIA',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_EuroGiantRequestedResource WHERE Type = 'CIVILIZATION_POLAND';
------------------------------------------------------------	
-- Civilizations_EuroLargeRequestedResource (Europe Large)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EuroLargeRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_EuroLargeRequestedResource
		(Type, 							Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_WALLACHIA',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_EuroLargeRequestedResource WHERE Type = 'CIVILIZATION_POLAND';
------------------------------------------------------------	
-- Civilizations_AfriSouthEuroRequestedResource (Africa, Asia & Australia)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_AfriSouthEuroRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_AfriSouthEuroRequestedResource
		(Type, 							Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_WALLACHIA',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_AfriSouthEuroRequestedResource WHERE Type = 'CIVILIZATION_POLAND';
------------------------------------------------------------	
-- Civilizations_AfriSouthEuroRequestedResource (Africa & Southern Europe)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_AfriSouthEuroRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_AfriSouthEuroRequestedResource
		(Type, 							Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_WALLACHIA',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_AfriSouthEuroRequestedResource WHERE Type = 'CIVILIZATION_POLAND';
------------------------------------------------------------	
-- Civilizations_NorthWestEuropeRequestedResource (North-West Europe)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_NorthWestEuropeRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_NorthWestEuropeRequestedResource
		(Type, 							Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_WALLACHIA',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_NorthWestEuropeRequestedResource WHERE Type = 'CIVILIZATION_POLAND';
------------------------------------------------------------	
-- Civilizations_EuroLargeNewRequestedResource (Europe (Greatest) Large)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EuroLargeNewRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_EuroLargeNewRequestedResource
		(Type, 							Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_WALLACHIA',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_EuroLargeNewRequestedResource WHERE Type = 'CIVILIZATION_POLAND';
------------------------------------------------------------	
-- Civilizations_EuroEasternRequestedResource (Eastern Europe Large)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EuroEasternRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_EuroEasternRequestedResource
		(Type, 							Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_WALLACHIA',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_EuroEasternRequestedResource WHERE Type = 'CIVILIZATION_POLAND';
--==========================================================================================================================
-- HAZEL MAP LABELS
--==========================================================================================================================
-- ML_CivCultures
------------------------------	
CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
		(CivType,						CultureType,	CultureEra)
SELECT	'CIVILIZATION_JFD_WALLACHIA',	CultureType,	CultureEra
FROM ML_CivCultures WHERE CivType = 'CIVILIZATION_RUSSIA';
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
-- JFD CIVILOPEDIA
--==========================================================================================================================
-- JFD_Civilopedia_HideFromPedia
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
JFD_Civilopedia_HideFromPedia (Type text default null);

INSERT INTO JFD_Civilopedia_HideFromPedia
		(Type)
VALUES	('PROMOTION_JFD_LEFEGII_HEAL_ACTIVE');
--==========================================================================================================================
-- JFD CITIES IN DEVELOPMENT
--==========================================================================================================================
-- Building_ConstructionAudio
----------------------
CREATE TABLE IF NOT EXISTS
	Building_ConstructionAudio (
    BuildingType								text		REFERENCES Buildings(Type)      default null,
    ConstructionAudio							text										default null);
	
INSERT INTO Building_ConstructionAudio
		(BuildingType, 						ConstructionAudio)
SELECT	'BUILDING_JFD_FORTIFIED_CHURCH',	'AS2D_BUILDING_JFD_FORTIFIED_CHURCH'
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
		(CivilizationType,				LinguisticType)
SELECT	'CIVILIZATION_JFD_WALLACHIA',	LinguisticType
FROM Civilization_JFD_ColonialCityNames WHERE CivilizationType = 'CIVILIZATION_POLAND';
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
		(LeaderType,			FlavorType,						Flavor)
VALUES	('LEADER_JFD_VLAD',		'FLAVOR_JFD_DECOLONIZATION',	5);
--====================================
-- JFD PROVINCES 
--====================================
-- Units
------------------------------------------------------------
UPDATE Units
SET Help = 'TXT_KEY_UNIT_JFD_LEFEGII_HELP_PROVINCES', Strategy = 'TXT_KEY_UNIT_JFD_LEFEGII_STRATEGY_PROVINCES'
WHERE Type = 'UNIT_JFD_LEFEGII'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_IMPROVEMENT_CHANGES_TRADING_POST' AND Value = 1);

UPDATE UnitPromotions
SET Help = 'TXT_KEY_PROMOTION_JFD_LEFEGII_HEAL_HELP_PROVINCES'
WHERE Type = 'PROMOTION_JFD_LEFEGII_HEAL'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_PROVINCES_IMPROVEMENT_CHANGES_TRADING_POST' AND Value = 1);

UPDATE UnitPromotions
SET Help = 'TXT_KEY_PROMOTION_JFD_LEFEGII_HEAL_ACTIVE_HELP_PROVINCES'
WHERE Type = 'PROMOTION_JFD_LEFEGII_HEAL_ACTIVE'
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
		(CivilizationType,				DefaultTitle,											UniqueTitle)
VALUES	('CIVILIZATION_JFD_WALLACHIA',	'TXT_KEY_PROVINCE_JFD_BARONY_DESC_MONARCHY',			'TXT_KEY_PROVINCE_JFD_BARONY_DESC_JFD_WALLACHIA'),
		('CIVILIZATION_JFD_WALLACHIA',	'TXT_KEY_PROVINCE_JFD_BARONY_DESC_RULER_MONARCHY',		'TXT_KEY_PROVINCE_JFD_BARONY_DESC_RULER_JFD_WALLACHIA'),
		('CIVILIZATION_JFD_WALLACHIA',	'TXT_KEY_PROVINCE_JFD_COUNTY_DESC_MONARCHY',			'TXT_KEY_PROVINCE_JFD_COUNTY_DESC_JFD_WALLACHIA'),
		('CIVILIZATION_JFD_WALLACHIA',	'TXT_KEY_PROVINCE_JFD_COUNTY_DESC_RULER_MONARCHY',		'TXT_KEY_PROVINCE_JFD_COUNTY_DESC_RULER_JFD_WALLACHIA'),
		('CIVILIZATION_JFD_WALLACHIA',	'TXT_KEY_PROVINCE_JFD_DUCHY_DESC_MONARCHY',				'TXT_KEY_PROVINCE_JFD_DUCHY_DESC_JFD_WALLACHIA'),
		('CIVILIZATION_JFD_WALLACHIA',	'TXT_KEY_PROVINCE_JFD_DUCHY_DESC_RULER_MONARCHY',		'TXT_KEY_PROVINCE_JFD_DUCHY_DESC_RULER_JFD_WALLACHIA');
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
		(LeaderType,			FlavorType,				Flavor)
VALUES	('LEADER_JFD_VLAD',		'FLAVOR_JFD_SLAVERY',	9);
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
		(CivilizationType,				ArtDefineTag, CultureType,	DefeatScreenEarlyTag,			  DefeatScreenMidTag,				DefeatScreenLateTag,				IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag)
SELECT	'CIVILIZATION_JFD_WALLACHIA',	ArtDefineTag, CultureType,	'DefeatScreenEarlyWallachia.dds', 'DefeatScreenMidWallachia.dds',	'DefeatScreenLateWallachia.dds',	IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_RUSSIA';
------------------------------	
-- Civilizations
------------------------------	
UPDATE Civilizations 
SET SoundtrackTag = 'JFD_Eastern'
WHERE Type = 'CIVILIZATION_JFD_WALLACHIA'
AND EXISTS (SELECT * FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Eastern')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);
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
		(LeaderType,			FlavorType,								Flavor)
VALUES	('LEADER_JFD_VLAD',		'FLAVOR_JFD_MERCENARY',					8);
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
		(LeaderType,			FlavorType,								Flavor)
VALUES	('LEADER_JFD_VLAD',		'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',		8),
		('LEADER_JFD_VLAD',		'FLAVOR_JFD_STATE_RELIGION',			8);
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
		(CivilizationType,				CurrencyType)
SELECT	'CIVILIZATION_JFD_WALLACHIA',	CurrencyType
FROM Civilization_JFD_Currencies WHERE CivilizationType = 'CIVILIZATION_RUSSIA';
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
		(CivilizationType,				GovernmentType,				Weight)
SELECT	'CIVILIZATION_JFD_WALLACHIA',	'GOVERNMENT_JFD_MONARCHY',	70
FROM Civilization_JFD_Governments WHERE CivilizationType = 'CIVILIZATION_POLAND';
------------------------------------------------------------	
-- Civilization_JFD_HeadsOfGovernment	
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 	
	Civilization_JFD_HeadsOfGovernment (	
	CivilizationType  				text 		REFERENCES Civilizations(Type) 					default null,
	CultureType						text 		 												default null,
	HeadOfGovernmentName			text 		 												default null);

INSERT INTO Civilization_JFD_HeadsOfGovernment
        (CivilizationType,      		HeadOfGovernmentName)
VALUES  ('CIVILIZATION_JFD_WALLACHIA',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_WALLACHIA_1'),
        ('CIVILIZATION_JFD_WALLACHIA',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_WALLACHIA_2'),
        ('CIVILIZATION_JFD_WALLACHIA',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_WALLACHIA_3'),
        ('CIVILIZATION_JFD_WALLACHIA',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_WALLACHIA_4'),
        ('CIVILIZATION_JFD_WALLACHIA',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_WALLACHIA_5'),
        ('CIVILIZATION_JFD_WALLACHIA',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_WALLACHIA_6'),
        ('CIVILIZATION_JFD_WALLACHIA',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_WALLACHIA_7'),
        ('CIVILIZATION_JFD_WALLACHIA',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_WALLACHIA_8'),
        ('CIVILIZATION_JFD_WALLACHIA',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_WALLACHIA_9'),
        ('CIVILIZATION_JFD_WALLACHIA',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_WALLACHIA_10'),
        ('CIVILIZATION_JFD_WALLACHIA',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_WALLACHIA_11'),
        ('CIVILIZATION_JFD_WALLACHIA',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_WALLACHIA_12'),
        ('CIVILIZATION_JFD_WALLACHIA',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_WALLACHIA_13'),
        ('CIVILIZATION_JFD_WALLACHIA',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_WALLACHIA_14'),
        ('CIVILIZATION_JFD_WALLACHIA',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_WALLACHIA_15'),
        ('CIVILIZATION_JFD_WALLACHIA',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_WALLACHIA_16'),
        ('CIVILIZATION_JFD_WALLACHIA',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_WALLACHIA_17'),
        ('CIVILIZATION_JFD_WALLACHIA',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_WALLACHIA_18'),
        ('CIVILIZATION_JFD_WALLACHIA',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_WALLACHIA_19'),
        ('CIVILIZATION_JFD_WALLACHIA',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_WALLACHIA_20'),
        ('CIVILIZATION_JFD_WALLACHIA',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_WALLACHIA_21'),
        ('CIVILIZATION_JFD_WALLACHIA',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_WALLACHIA_22'),
        ('CIVILIZATION_JFD_WALLACHIA',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_WALLACHIA_23'),
        ('CIVILIZATION_JFD_WALLACHIA',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_WALLACHIA_24'),
        ('CIVILIZATION_JFD_WALLACHIA',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JFD_WALLACHIA_25');
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
		(CivilizationType,				DefaultTitle,											UniqueTitle,															UseAdjective)
VALUES	('CIVILIZATION_JFD_WALLACHIA',	'TXT_KEY_GOVERNMENT_JFD_DICTATORSHIP_TITLE_GOVERNMENT',	'TXT_KEY_GOVERNMENT_JFD_DICTATORSHIP_TITLE_GOVERNMENT_JFD_WALLACHIA',	0),	
		('CIVILIZATION_JFD_WALLACHIA',	'TXT_KEY_GOVERNMENT_JFD_DICTATORSHIP_TITLE_LEADER',		'TXT_KEY_GOVERNMENT_JFD_DICTATORSHIP_TITLE_LEADER_JFD_WALLACHIA',		0);
------------------------------------------------------------
-- MinorCivilization_JFD_Titles
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	MinorCivilization_JFD_Titles (
	MinorCivilizationType  				text 		REFERENCES MinorCivilizations(Type)			default null,
	ReligionType						text 		REFERENCES Religions(Type) 					default null,
	UniqueGovernmentTitle				text 		 											default null,
	UniqueLeaderTitle					text 		 											default null);	

UPDATE MinorCivilization_JFD_Titles
SET UniqueGovernmentTitle = 'TXT_KEY_GOVERNMENT_JFD_TITLE_GOVERNMENT_JFD_CHISINAU', UniqueLeaderTitle = 'TXT_KEY_GOVERNMENT_JFD_TITLE_LEADER_JFD_CHISINAU'
WHERE MinorCivilizationType = 'MINOR_CIV_BUCHAREST';
------------------------------------------------------------
-- JFD_PrivyCouncillor_UniqueNames
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	JFD_PrivyCouncillor_UniqueNames (
	PrivyCouncillorType  				text 										 	default null,
	PolicyType  						text 	REFERENCES Policies(Type) 				default null,
	CivilizationType					text	REFERENCES Civilizations(Type) 			default	null,
	CultureType							text											default	null,
	GovernmentType  					text 	 										default null,
	ReligionType						text	REFERENCES Religions(Type) 				default	null,
	UniqueName							text											default	null);

INSERT INTO JFD_PrivyCouncillor_UniqueNames	
		(PrivyCouncillorType,				CivilizationType,									UniqueName)
VALUES	('COUNCILLOR_JFD_CHANCELLOR',		'CIVILIZATION_JFD_WALLACHIA',						'TXT_KEY_COUNCILLOR_JFD_CHANCELLOR_DESC_JFD_WALLACHIA'),
		('COUNCILLOR_JFD_MARSHAL',			'CIVILIZATION_JFD_WALLACHIA',						'TXT_KEY_COUNCILLOR_JFD_MARSHAL_DESC_JFD_WALLACHIA'),
		('COUNCILLOR_JFD_HERALD',			'CIVILIZATION_JFD_WALLACHIA',						'TXT_KEY_COUNCILLOR_JFD_HERALD_DESC_JFD_WALLACHIA'),
		('COUNCILLOR_JFD_STEWARD',			'CIVILIZATION_JFD_WALLACHIA',						'TXT_KEY_COUNCILLOR_JFD_STEWARD_DESC_JFD_WALLACHIA');
------------------------------------------------------------
-- Civilization_JFD_Politics
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_Politics (
	CivilizationType  					text 		REFERENCES Civilizations(Type) 				default null,
	PoliticsType  						text 													default null,
	UniqueName							text													default	null);

INSERT INTO Civilization_JFD_Politics
		(CivilizationType,				UniqueName,												PoliticsType)
VALUES	('CIVILIZATION_JFD_WALLACHIA',	'TXT_KEY_JFD_ASSEMBLY_JFD_MILITARY_JFD_WALLACHIA',		'ASSEMBLY_JFD_MILITARY'),
		('CIVILIZATION_JFD_WALLACHIA',	'TXT_KEY_JFD_FACTION_JFD_NATIONALIST_JFD_WALLACHIA',	'FACTION_JFD_NATIONALIST'),
		('CIVILIZATION_JFD_WALLACHIA',	'TXT_KEY_JFD_FACTION_JFD_POPULARIST_JFD_WALLACHIA',		'FACTION_JFD_POPULARIST'),
		('CIVILIZATION_JFD_WALLACHIA',	'TXT_KEY_JFD_PARTY_JFD_REVOLUTIONARY_JFD_WALLACHIA',	'FACTION_JFD_REVOLUTIONARY'),
		('CIVILIZATION_JFD_WALLACHIA',	'TXT_KEY_JFD_PARTY_JFD_BURGHERS_JFD_WALLACHIA',			'PARTY_JFD_BURGHERS'),
		('CIVILIZATION_JFD_WALLACHIA',	'TXT_KEY_JFD_PARTY_JFD_CLERGY_JFD_WALLACHIA',			'PARTY_JFD_CLERGY'),
		('CIVILIZATION_JFD_WALLACHIA',	'TXT_KEY_JFD_PARTY_JFD_COMMUNIST_JFD_WALLACHIA',		'PARTY_JFD_COMMUNIST'),
		('CIVILIZATION_JFD_WALLACHIA',	'TXT_KEY_JFD_PARTY_JFD_CONSERVATIVE_JFD_WALLACHIA',		'PARTY_JFD_CONSERVATIVE'),
		('CIVILIZATION_JFD_WALLACHIA',	'TXT_KEY_JFD_PARTY_JFD_FASCIST_JFD_WALLACHIA',			'PARTY_JFD_FASCIST'),
		('CIVILIZATION_JFD_WALLACHIA',	'TXT_KEY_JFD_PARTY_JFD_LIBERAL_JFD_WALLACHIA',			'PARTY_JFD_LIBERAL'),
		('CIVILIZATION_JFD_WALLACHIA',	'TXT_KEY_JFD_PARTY_JFD_LIBERTARIAN_JFD_WALLACHIA',		'PARTY_JFD_LIBERTARIAN'),
		('CIVILIZATION_JFD_WALLACHIA',	'TXT_KEY_JFD_PARTY_JFD_NOBILITY_JFD_WALLACHIA',			'PARTY_JFD_NOBILITY'),
		('CIVILIZATION_JFD_WALLACHIA',	'TXT_KEY_JFD_PARTY_JFD_REACTIONARY_JFD_WALLACHIA',		'PARTY_JFD_REACTIONARY'),
		('CIVILIZATION_JFD_WALLACHIA',	'TXT_KEY_JFD_PARTY_JFD_REVOLUTIONARY_JFD_WALLACHIA',	'PARTY_JFD_REVOLUTIONARY'),
		('CIVILIZATION_JFD_WALLACHIA',	'TXT_KEY_JFD_PARTY_JFD_SOCIALIST_JFD_WALLACHIA',		'PARTY_JFD_SOCIALIST');
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
		(LeaderType,			FlavorType,							Flavor)
VALUES	('LEADER_JFD_VLAD',		'FLAVOR_JFD_REFORM_GOVERNMENT',		6),
		('LEADER_JFD_VLAD',		'FLAVOR_JFD_REFORM_LEGAL',			8),
		('LEADER_JFD_VLAD',		'FLAVOR_JFD_REFORM_CULTURE',		6),
		('LEADER_JFD_VLAD',		'FLAVOR_JFD_REFORM_ECONOMIC',		5),
		('LEADER_JFD_VLAD',		'FLAVOR_JFD_REFORM_FOREIGN',		8),
		('LEADER_JFD_VLAD',		'FLAVOR_JFD_REFORM_INDUSTRY',		5),
		('LEADER_JFD_VLAD',		'FLAVOR_JFD_REFORM_MILITARY',		8),
		('LEADER_JFD_VLAD',		'FLAVOR_JFD_REFORM_RELIGION',		7);
--------------------------------------------------------------------------------------------------------------------------
-- Leader_JFD_Reforms
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Leader_JFD_Reforms (
	LeaderType  					text 	REFERENCES Leaders(Type) 	default	null,
	ReformType						text								default	null);
	
INSERT INTO Leader_JFD_Reforms
		(LeaderType,			ReformType)
VALUES	('LEADER_JFD_VLAD',		'REFORM_JFD_POWER_HARD'),
		('LEADER_JFD_VLAD',		'REFORM_JFD_CONFLICT_OFFENSE');
--==========================================================================================================================
-- SUKRITACT DECISIONS
--==========================================================================================================================
-- DecisionsAddin_Support
------------------------------
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
INSERT INTO DecisionsAddin_Support (FileName) VALUES ('JFD_Wallachia_Decisions.lua');
------------------------------
-- Policies
------------------------------
INSERT INTO Policies
		(Type,											Description)
VALUES	('POLICY_DECISIONS_JFD_WALLACHIA_GUNPOWDER',	'TXT_KEY_DECISIONS_JFD_WALLACHIA_GUNPOWDER'),
		('POLICY_DECISIONS_JFD_WALLACHIA_ROMANIA',		'TXT_KEY_DECISIONS_JFD_WALLACHIA_ROMANIA');
------------------------------
-- Policy_BuildingClassHappiness
------------------------------	
INSERT INTO Policy_BuildingClassHappiness
		(PolicyType, 									BuildingClassType, 			Happiness)
VALUES	('POLICY_DECISIONS_JFD_WALLACHIA_ROMANIA', 		'BUILDINGCLASS_ARMORY', 	1),
		('POLICY_DECISIONS_JFD_WALLACHIA_ROMANIA', 		'BUILDINGCLASS_TEMPLE', 	1),
		('POLICY_DECISIONS_JFD_WALLACHIA_ROMANIA', 		'BUILDINGCLASS_CASTLE',		1);
------------------------------
-- Policy_BuildingClassProductionModifiers
------------------------------	
INSERT INTO Policy_BuildingClassProductionModifiers
		(PolicyType, 									BuildingClassType, 			ProductionModifier)
VALUES	('POLICY_DECISIONS_JFD_WALLACHIA_ROMANIA', 		'BUILDINGCLASS_ARMORY', 	20),
		('POLICY_DECISIONS_JFD_WALLACHIA_ROMANIA', 		'BUILDINGCLASS_TEMPLE', 	20),
		('POLICY_DECISIONS_JFD_WALLACHIA_ROMANIA', 		'BUILDINGCLASS_CASTLE',		20);
------------------------------------------------------------
-- Policy_JFD_CivilizationNames
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS
	Policy_JFD_CivilizationNames (
	PolicyType								text 	REFERENCES Policies(Type) 				default null,
	CivilizationType						text 	REFERENCES Civilizations(Type) 			default null,
	Description								text 											default null,
	ShortDescription						text 											default null,
	Adjective								text 											default null);
	
INSERT INTO Policy_JFD_CivilizationNames 	
		(PolicyType, 									CivilizationType,					Adjective,								Description,						ShortDescription)
VALUES	('POLICY_DECISIONS_JFD_WALLACHIA_ROMANIA',		'CIVILIZATION_JFD_WALLACHIA',		'TXT_KEY_CIV_JFD_ROMANIA_ADJECTIVE',	'TXT_KEY_CIV_JFD_ROMANIA_DESC',		'TXT_KEY_CIV_JFD_ROMANIA_SHORT_DESC');
------------------------------
-- UnitClasses
------------------------------	
INSERT INTO UnitClasses
		(Type, 						DefaultUnit, 				Description)
VALUES	('UNITCLASS_JFD_LEFEGII', 	'UNIT_JFD_LEFEGII_GUN', 	'TXT_KEY_UNIT_JFD_LEFEGII');
------------------------------
-- Units
--------------------------------
INSERT INTO Units 	
		(Type, 						PolicyType,									Class,					 Cost, Moves, FaithCost,	RequiresFaithPurchaseEnabled, GoodyHutUpgradeUnitClass, PrereqTech, ShowInPedia, Combat,   CombatClass, Domain, DefaultUnitAI, ObsoleteTech, Description, 				Civilopedia, 						Help, 								Strategy, Pillage, HurryCostModifier, AdvancedStartCost, CombatLimit, UnitArtInfo,						XPValueAttack, XPValueDefense, UnitFlagIconOffset,  UnitFlagAtlas,					MoveRate, PortraitIndex, 	IconAtlas)
SELECT	'UNIT_JFD_LEFEGII_GUN',		'POLICY_DECISIONS_JFD_WALLACHIA_GUNPOWDER',	'UNITCLASS_JFD_LEFEGII', Cost, Moves, FaithCost,	RequiresFaithPurchaseEnabled, GoodyHutUpgradeUnitClass, null,		0,			 Combat+4, CombatClass, Domain, DefaultUnitAI, ObsoleteTech, 'TXT_KEY_UNIT_JFD_LEFEGII',  'TXT_KEY_CIV5_JFD_LEFEGII_TEXT', 	'TXT_KEY_UNIT_JFD_LEFEGII_HELP', 	Strategy, Pillage, HurryCostModifier, AdvancedStartCost, CombatLimit, 'ART_DEF_UNIT_JFD_LEFEGII_GUN',	XPValueAttack, XPValueDefense, 0,					'JFD_UNIT_FLAG_LEFEGII_ATLAS',	MoveRate, 2, 				'JFD_WALLACHIA_ATLAS'
FROM Units WHERE Type = 'UNIT_MUSKETMAN';	
--------------------------------
-- UnitGameplay2DScripts
--------------------------------
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 					SelectionSound, FirstSelectionSound)
SELECT	'UNIT_JFD_LEFEGII_GUN', 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_LONGSWORDSMAN';	
--------------------------------
-- Unit_AITypes
--------------------------------
INSERT INTO Unit_AITypes 	
		(UnitType, 					UnitAIType)
SELECT	'UNIT_JFD_LEFEGII_GUN', 	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_LONGSWORDSMAN';
--------------------------------
-- Unit_ClassUpgrades
--------------------------------
INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 					UnitClassType)
SELECT	'UNIT_JFD_LEFEGII_GUN', 	UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_MUSKETMAN';
--------------------------------
-- Unit_ResourceQuantityRequirements
--------------------------------
INSERT INTO Unit_ResourceQuantityRequirements 	
		(UnitType, 					ResourceType, Cost)
SELECT	'UNIT_JFD_LEFEGII_GUN', 	ResourceType, Cost
FROM Unit_ResourceQuantityRequirements WHERE UnitType = 'UNIT_LONGSWORDSMAN';
--------------------------------
-- Unit_Flavors
--------------------------------
INSERT INTO Unit_Flavors 	
		(UnitType, 					FlavorType,	  Flavor)
SELECT	'UNIT_JFD_LEFEGII_GUN', 	FlavorType,	  Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_LONGSWORDSMAN';
--------------------------------
-- Unit_FreePromotions
--------------------------------
INSERT INTO Unit_FreePromotions 	
		(UnitType, 					PromotionType)
SELECT	'UNIT_JFD_LEFEGII_GUN', 	PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_JFD_LEFEGII';
--==========================================================================================================================
--==========================================================================================================================