--==========================================================================================================================
-- MASTER TABLES
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS COMMUNITY (Type TEXT, Value INTEGER);
CREATE TABLE IF NOT EXISTS Civilization_JFD_ColonialCityNames(CivilizationType text, ColonyName text, LinguisticType text);
CREATE TABLE IF NOT EXISTS Civilization_JFD_Governments(CivilizationType text, CultureType text, LegislatureName text, OfficeTitle text, GovernmentType text, Weight integer);
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMP(CivilizationType, MapPrefix, X, Y, CapitalName, AltX, AltY, AltCapitalName);
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMPRequestedResources(CivilizationType, MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6);
CREATE TABLE IF NOT EXISTS JFD_Civilopedia_HideFromPedia(Type text);
CREATE TABLE IF NOT EXISTS JFD_GlobalUserSettings(Type text, Value integer default 1);
CREATE TABLE IF NOT EXISTS MinorCivilizations_YnAEMP(MinorCivType, MapPrefix, X, Y, CapitalName, AltX, AltY, AltCapitalName);
--==========================================================================================================================
-- CIVILOPEDIA
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
-- JFD_Civilopedia_HideFromPedia
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS JFD_Civilopedia_HideFromPedia (Type text default null);
--==========================================================================================================================
-- GEDEMON R.E.D.
--==========================================================================================================================
-- Civilizations
--------------------------------------------------------------------------------------------------------------------------
--_AMERICA
--_ANTWERP
--_ARABIA
--_ASSYRIA
--_AUSTRIA
--_AZTEC
--_BABYLON
--_BRAZIL
--_BYZANTIUM
--_CARTHAGE
--_CELTS
--_CHINA
--_DENMARK
--_EGYPT
--_ENGLAND
--_ETHIOPIA
--_FRANCE
--_GARAMANTES
--_GERMANY
--_GREECE
--_HUNS
--_INCA
--_INDIA
--_INDONESIA
--_IROQUOIS
--_JAPAN
--_KOREA
--_LISBON
--_MAYA
--_MONGOL
--_ZULU
--_NETHERLANDS
--_OTTOMAN
--_PERSIA
--_POLAND
--_PORTUGAL
--_POLYNESIA
--_ROME
--_RUSSIA
--_SHOSHONE
--_SIAM
--_SONGHAI
--_SPAIN
--_SWEDEN
--_ZULU
--_VENICE

UPDATE Civilizations 
SET ArtStyleSuffix = '_ZULU'
WHERE Type = 'CIVILIZATION_JWW_MARAVI'
AND EXISTS (SELECT * FROM Civilizations WHERE ArtStyleSuffix = '_ZULU');
--==========================================================================================================================
-- LEADERS
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
-- Flavors
--------------------------------------------------------------------------------------------------------------------------	
INSERT OR REPLACE INTO Flavors 
		(Type)
VALUES	('FLAVOR_JFD_DECOLONIZATION'),
		('FLAVOR_JFD_MERCENARY'),
		('FLAVOR_JFD_REFORM_GOVERNMENT'),
		('FLAVOR_JFD_REFORM_LAW'),
		('FLAVOR_JFD_REFORM_DIPLOMACY'),
		('FLAVOR_JFD_REFORM_ECONOMY'),
		('FLAVOR_JFD_REFORM_EDUCATION'),
		('FLAVOR_JFD_REFORM_INDUSTRY'),
		('FLAVOR_JFD_REFORM_MILITARY'),
		('FLAVOR_JFD_REFORM_RELIGION'),
		('FLAVOR_JFD_REFORM_SOCIETY'),
		('FLAVOR_JFD_REFORM_WELFARE'),
		('FLAVOR_JFD_RELIGIOUS_INTOLERANCE'),
		('FLAVOR_JFD_SLAVERY'),
		('FLAVOR_JFD_STATE_RELIGION');
--------------------------------------------------------------------------------------------------------------------------
-- Leader_Flavors
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Leader_Flavors
		(LeaderType,					FlavorType,							Flavor)
VALUES	('LEADER_JWW_KALONGA_MAZULA',	'FLAVOR_JFD_DECOLONIZATION',		2),
		('LEADER_JWW_KALONGA_MAZULA',	'FLAVOR_JFD_MERCENARY',				10),
		('LEADER_JWW_KALONGA_MAZULA',	'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',	7),
		('LEADER_JWW_KALONGA_MAZULA',	'FLAVOR_JFD_REFORM_GOVERNMENT',		3),
		('LEADER_JWW_KALONGA_MAZULA',	'FLAVOR_JFD_REFORM_LAW',			1),
		('LEADER_JWW_KALONGA_MAZULA',	'FLAVOR_JFD_REFORM_DIPLOMACY',		3),
		('LEADER_JWW_KALONGA_MAZULA',	'FLAVOR_JFD_REFORM_ECONOMY',		6),
		('LEADER_JWW_KALONGA_MAZULA',	'FLAVOR_JFD_REFORM_EDUCATION',		2),
		('LEADER_JWW_KALONGA_MAZULA',	'FLAVOR_JFD_REFORM_INDUSTRY',		2),
		('LEADER_JWW_KALONGA_MAZULA',	'FLAVOR_JFD_REFORM_MILITARY',		9),
		('LEADER_JWW_KALONGA_MAZULA',	'FLAVOR_JFD_REFORM_RELIGION',		8),
		('LEADER_JWW_KALONGA_MAZULA',	'FLAVOR_JFD_REFORM_SOCIETY',		7),
		('LEADER_JWW_KALONGA_MAZULA',	'FLAVOR_JFD_REFORM_WELFARE',		5),
		('LEADER_JWW_KALONGA_MAZULA',	'FLAVOR_JFD_SLAVERY',				8),
		('LEADER_JWW_KALONGA_MAZULA',	'FLAVOR_JFD_STATE_RELIGION',		9);
--==========================================================================================================================
-- CIVILIZATIONS
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_YnAEMP
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilizations_YnAEMP
		(CivilizationType,			MapPrefix,				X,		Y)
VALUES	('CIVILIZATION_JWW_MARAVI',	'Yagem',				33,	    19),
		('CIVILIZATION_JWW_MARAVI',	'Yahem',				72,		24),
		('CIVILIZATION_JWW_MARAVI',	'Cordiform',			41,		6),
		('CIVILIZATION_JWW_MARAVI',	'GreatestEarth',		59,		12),
		('CIVILIZATION_JWW_MARAVI',	'EarthMk3',				37,		17),
		('CIVILIZATION_JWW_MARAVI',	'AfriAsiaAust',			43,		23),
		('CIVILIZATION_JWW_MARAVI',	'AfricaLarge',			46,		21),
		('CIVILIZATION_JWW_MARAVI',	'AfriGiant',			99,		41),
		('CIVILIZATION_JWW_MARAVI',	'AfriSouthEuro',		50,		19),
		('CIVILIZATION_JWW_MARAVI',	'IndianOcean',			7,		23),
		('CIVILIZATION_JWW_MARAVI',	'SouthernAfrica',		101,	65),
		('CIVILIZATION_JWW_MARAVI',	'AtlanticGiant',		111,	18);
--------------------------------------------------------------------------------------------------------------------------	
-- Civilizations_YnAEMPRequestedResources
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilizations_YnAEMPRequestedResources
		(CivilizationType,				MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6)
SELECT	'CIVILIZATION_JWW_MARAVI',	MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6
FROM Civilizations_YnAEMPRequestedResources WHERE CivilizationType = 'CIVILIZATION_ZULU';
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
SELECT	'CIVILIZATION_JWW_MARAVI',	ArtDefineTag, CultureType, SubCultureType, DecisionsTag, DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_ZULU';
	
UPDATE Civilizations 
SET SoundtrackTag = (SELECT SoundtrackTag FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_JWW_MARAVI')
WHERE Type = 'CIVILIZATION_JWW_MARAVI';
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_JFD_Governments
--------------------------------------------------------------------------------------------------------------------------
--GOVERNMENT_JFD_MONARCHY
--GOVERNMENT_JFD_PRINCIPALITY
--GOVERNMENT_JFD_REPUBLIC
--GOVERNMENT_JFD_THEOCRACY
--GOVERNMENT_JFD_DICTATORSHIP
--GOVERNMENT_JFD_SHOGUNATE
--GOVERNMENT_JFD_HOLY_ROMAN_EMPIRE
--GOVERNMENT_JFD_PAPACY
--GOVERNMENT_JFD_MANDATE_OF_HEAVEN
--GOVERNMENT_JFD_CALIPHATE

INSERT INTO Civilization_JFD_Governments
		(CivilizationType, 				GovernmentType,				Weight)
VALUES	('CIVILIZATION_JWW_MARAVI', 	'GOVERNMENT_JFD_MONARCHY',	75);
--==========================================================================================================================
-- UNIQUE CULTURAL INFLUENCE
--==========================================================================================================================

INSERT INTO Diplomacy_Responses
		(LeaderType,						ResponseType,					Response,													Bias)
VALUES	('LEADER_JWW_KALONGA_MAZULA',		'RESPONSE_INFLUENTIAL_ON_AI',	'TXT_KEY_LEADER_JWW_KALONGA_MAZULA_INFLUENTIAL_ON_AI%',		1),
		('LEADER_JWW_KALONGA_MAZULA',		'RESPONSE_INFLUENTIAL_ON_HUMAN','TXT_KEY_LEADER_JWW_KALONGA_MAZULA_INFLUENTIAL_ON_HUMAN%',	1);
--=========================================================================================================================
-- BINGLES CIV IV TRAITS
--=========================================================================================================================
--POLICY_AGGRESSIVE_X [ICON_WAR] (Military)
--POLICY_CHARISMATIC_X [ICON_HAPPINESS_1] (Happiness)
--POLICY_CREATIVE_X [ICON_CULTURE] (Culture)
--POLICY_DIPLOMATIC_X [ICON_INFLUENCE] (City States)
--POLICY_EXPANSIVE_X [ICON_FOOD] (Food)
--POLICY_FINANCIAL_X [ICON_GOLD] (City Connections, Domestic Trade Routes)
--POLICY_IMPERIALISTIC_X [ICON_CITY_STATE] (Admirals, Generals)
--POLICY_INDUSTRIOUS_X [ICON_PRODUCTION] (Production)
--POLICY_INVENTIVE_X [ICON_RESEARCH] (Science)
--POLICY_MERCANTILE_X [ICON_TRADE] (Gold)
--POLICY_PHILOSOPHICAL_X [ICON_GREAT_PEOPLE] (Great People)
--POLICY_PROTECTIVE_X [ICON_STRENGTH] (Defense)
--POLICY_SEAFARING_X [ICON_MOVES] (Navy)
--POLICY_SPIRITUAL_X [ICON_PEACE] (Faith)
------------------------------	
-- Leader_SharedTraits
------------------------------	
CREATE TABLE IF NOT EXISTS 
    Leader_SharedTraits (
    LeaderType          text    REFERENCES Leaders(Type)        default null,
    TraitOne            text    REFERENCES Policies(Type)       default null,
    TraitTwo            text    REFERENCES Policies(Type)       default null);
     
INSERT INTO Leader_SharedTraits
        (LeaderType,				TraitOne,				TraitTwo)
SELECT  'LEADER_JWW_KALONGA_MAZULA',	'POLICY_AGGRESSIVE_X',	'POLICY_SPIRITUAL_X'
WHERE EXISTS (SELECT * FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X');
------------------------------	
-- Leaders
------------------------------	
UPDATE Leaders 
SET Description = 'Kalonga Mazula [ICON_WAR][ICON_PEACE]'
WHERE Type = 'LEADER_JWW_KALONGA_MAZULA'
AND EXISTS (SELECT * FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X');
--==========================================================================================================================
-- Hazel's Map Labels
--==========================================================================================================================
-- ML_CivCultures
------------------------------	
CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
		(CivType,								CultureType,			CultureEra)
SELECT	'CIVILIZATION_JWW_MARAVI',	CultureType,			CultureEra
FROM ML_CivCultures WHERE CivType = 'CIVILIZATION_ZULU';
--==========================================================================================================================
-- TOMATEKH'S HISTORICAL RELIGIONS
--==========================================================================================================================
/*UPDATE Civilization_Religions 
( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type='RELIGION_PROTESTANT_METHODISM' )
THEN 'RELIGION_PROTESTANT_METHODISM'
ELSE 'RELGION_PROTESTANTISM' END
) WHERE CivilizationType = 'CIVILIZATION_JWW_MARAVI';
--==========================================================================================================================
--==========================================================================================================================
