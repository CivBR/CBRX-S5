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
		(LeaderType,				FlavorType,							Flavor)
VALUES	('LEADER_JWW_JOSEPH_MARIA',	'FLAVOR_JFD_DECOLONIZATION',		1),
		('LEADER_JWW_JOSEPH_MARIA',	'FLAVOR_JFD_MERCENARY',				2),
		('LEADER_JWW_JOSEPH_MARIA',	'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',	4),
		('LEADER_JWW_JOSEPH_MARIA',	'FLAVOR_JFD_REFORM_GOVERNMENT',		5),
		('LEADER_JWW_JOSEPH_MARIA',	'FLAVOR_JFD_REFORM_LAW',			3),
		('LEADER_JWW_JOSEPH_MARIA',	'FLAVOR_JFD_REFORM_DIPLOMACY',		4),
		('LEADER_JWW_JOSEPH_MARIA',	'FLAVOR_JFD_REFORM_ECONOMY',		9),
		('LEADER_JWW_JOSEPH_MARIA',	'FLAVOR_JFD_REFORM_EDUCATION',		5),
		('LEADER_JWW_JOSEPH_MARIA',	'FLAVOR_JFD_REFORM_INDUSTRY',		6),
		('LEADER_JWW_JOSEPH_MARIA',	'FLAVOR_JFD_REFORM_MILITARY',		9),
		('LEADER_JWW_JOSEPH_MARIA',	'FLAVOR_JFD_REFORM_RELIGION',		5),
		('LEADER_JWW_JOSEPH_MARIA',	'FLAVOR_JFD_REFORM_SOCIETY',		10),
		('LEADER_JWW_JOSEPH_MARIA',	'FLAVOR_JFD_REFORM_WELFARE',		8),
		('LEADER_JWW_JOSEPH_MARIA',	'FLAVOR_JFD_SLAVERY',				6),
		('LEADER_JWW_JOSEPH_MARIA',	'FLAVOR_JFD_STATE_RELIGION',		4);
--==========================================================================================================================
-- CIVILIZATIONS
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_YnAEMP
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilizations_YnAEMP
		(CivilizationType,				MapPrefix,				X,		Y)
VALUES	('CIVILIZATION_JWW_KARANKAWA',	'Yagem',				141,	55),
		('CIVILIZATION_JWW_KARANKAWA',	'Yahem',				22,		49),
		('CIVILIZATION_JWW_KARANKAWA',	'Cordiform',			7,		31),
		('CIVILIZATION_JWW_KARANKAWA',	'GreatestEarth',		13,		40),
		('CIVILIZATION_JWW_KARANKAWA',	'EarthMk3',				137,	59),
		('CIVILIZATION_JWW_KARANKAWA',	'Americas',				38,		49),
		('CIVILIZATION_JWW_KARANKAWA',	'AmericasGiant',		48,		105),
		('CIVILIZATION_JWW_KARANKAWA',	'Caribbean',			13,		61),
		('CIVILIZATION_JWW_KARANKAWA',	'NorthAmericaGiant',	70,		35),
		('CIVILIZATION_JWW_KARANKAWA',	'NorthAmericaHuge',		67,		24);
--------------------------------------------------------------------------------------------------------------------------	
-- Civilizations_YnAEMPRequestedResources
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilizations_YnAEMPRequestedResources
		(CivilizationType,				MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6)
SELECT	'CIVILIZATION_JWW_KARANKAWA',	MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6
FROM Civilizations_YnAEMPRequestedResources WHERE CivilizationType = 'CIVILIZATION_IROQUOIS';
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
--GOVERNMENT_JFD_CHIEFDOM
--GOVERNMENT_JFD_TRIBE

INSERT INTO Civilization_JFD_Governments
		(CivilizationType, 				GovernmentType,				Weight)
VALUES	('CIVILIZATION_JWW_KARANKAWA', 	'GOVERNMENT_JFD_CHIEFDOM',	50);
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

--CULTURE_JFD_ABORIGINAL,	_JFD_ABORIGINAL,	JFD_Aboriginal
--CULTURE_JFD_ANDEAN,	_JFD_ANDEAN,	JFD_Andean
--CULTURE_JFD_BANTU,	_JFD_BANTU,	JFD_Bantu
--CULTURE_JFD_BHARATA,	_JFD_BHARATA,	JFD_Bharata
--CULTURE_JFD_CENTRAL,	_JFD_CENTRAL,	JFD_Central
--CULTURE_JFD_CLASSICAL,	_JFD_CLASSICAL,	JFD_Classical (Roman)
--CULTURE_JFD_COLONIAL,	_JFD_WESTERN,	JFD_Colonial (Latin)
--CULTURE_JFD_EASTERN,	_JFD_EASTERN,	JFD_Eastern (Byzantine)
--CULTURE_JFD_EAST_INDIES,	_JFD_EAST_INDIES,	JFD_EastIndies
--CULTURE_JFD_GREAT_PLAINS,	_JFD_GREAT_PLAINS,	JFD_GreatPlains
--CULTURE_JFD_HIMALAYAN,	_JFD_HIMALAYAN,	JFD_Himalayan
--CULTURE_JFD_IRANIAN,	_JFD_IRANIAN,	JFD_Iranian
--CULTURE_JFD_ISLAMIC,	_JFD_ISLAMIC,	JFD_Islamic (Turkic)
--CULTURE_JFD_KATUJE,	_JFD_KATUJE,	JFD_Katuje
--CULTURE_JFD_MANDALA,	_JFD_MANDALA,	JFD_Mandala
--CULTURE_JFD_MESOAMERICAN,	_JFD_MESOAMERICAN,	JFD_Mesoamerican
--CULTURE_JFD_MESOPOTAMIC,	_JFD_MESOPOTAMIC,	JFD_Mesopotamic (Egyptian)
--CULTURE_JFD_NORTHERN,	_JFD_NORTHERN,	JFD_Northern (Celtic)
--CULTURE_JFD_OCEANIC,	_JFD_OCEANIC,	JFD_Oceanic
--CULTURE_JFD_ORIENTAL,	_JFD_ORIENTAL,	JFD_Oriental
--CULTURE_JFD_PACIFIC,	_JFD_PACIFIC,	JFD_Pacific
--CULTURE_JFD_POLAR,	_JFD_POLAR,	JFD_Polar
--CULTURE_JFD_SAHARAN,	_JFD_SAHARAN,	JFD_Saharan
--CULTURE_JFD_SEMITIC,	_JFD_SEMITIC,	JFD_Semitic (Ethiopic)
--CULTURE_JFD_SOUTHERN,	_JFD_SOUTHERN,	JFD_Southern (Papal)
--CULTURE_JFD_STEPPE,	_JFD_STEPPE,	JFD_Steppe
--CULTURE_JFD_TOTALITARIAN,	_JFD_WESTERN,	JFD_Totalitarian
--CULTURE_JFD_WEST_AFRICAN,	_JFD_WEST_AFRICAN,	JFD_WestAfrican
--CULTURE_JFD_WESTERN,	_JFD_WESTERN,	JFD_Western (British)
--CULTURE_JFD_WOODLANDS,	_JFD_WOODLANDS,	JFD_Woodlands

INSERT INTO Civilization_JFD_CultureTypes
		(CivilizationType,				CultureType,				ArtDefineTag,			IdealsTag,			SplashScreenTag,		SoundtrackTag)
VALUES	('CIVILIZATION_JWW_KARANKAWA',	'CULTURE_JFD_WOODLANDS',	'_JFD_WOODLANDS',		'JFD_Woodlands',	'JFD_Woodlands',		'JFD_Woodlands');
--==========================================================================================================================
-- UNIQUE CULTURAL INFLUENCE
--==========================================================================================================================

INSERT INTO Diplomacy_Responses
		(LeaderType,				ResponseType,					Response,														Bias)
VALUES	('LEADER_JWW_JOSEPH_MARIA',	'RESPONSE_INFLUENTIAL_ON_AI',	'TXT_KEY_LEADER_JWW_JOSEPH_MARIA_INFLUENTIAL_ON_AI%',			1),
		('LEADER_JWW_JOSEPH_MARIA',	'RESPONSE_INFLUENTIAL_ON_HUMAN','TXT_KEY_LEADER_JWW_JOSEPH_MARIA_INFLUENTIAL_ON_HUMAN%',		1);
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
SELECT  'LEADER_JWW_JOSEPH_MARIA',	'POLICY_SEAFARING_X',	'POLICY_PROTECTIVE_X'
WHERE EXISTS (SELECT * FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X');
------------------------------	
-- Leaders
------------------------------	
UPDATE Leaders 
SET Description = 'Joseph Mar�a [ICON_MOVES][ICON_STRENGTH]'
WHERE Type = 'LEADER_JWW_JOSEPH_MARIA'
AND EXISTS (SELECT * FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X');
--==========================================================================================================================
-- GEDEMON R.E.D.
--==========================================================================================================================
-- Civilizations
------------------------------	
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
--_MOROCCO
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
SET ArtStyleSuffix = '_IROQUOIS'
WHERE Type = 'CIVILIZATION_JWW_KARANKAWA'
AND EXISTS (SELECT * FROM Civilizations WHERE ArtStyleSuffix = '_IROQUOIS');
--==========================================================================================================================
-- Hazel's Map Labels
--==========================================================================================================================
-- ML_CivCultures
------------------------------	
CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
		(CivType,						CultureType,			CultureEra)
SELECT	'CIVILIZATION_JWW_KARANKAWA',	CultureType,			CultureEra
FROM ML_CivCultures WHERE CivType = 'CIVILIZATION_IROQUOIS';
--==========================================================================================================================
-- HISTORICAL RELIGIONS
--==========================================================================================================================
UPDATE Civilization_Religions
SET ReligionType = 'RELIGION_SOUTHERN_CULT'
WHERE CivilizationType = 'CIVILIZATION_JWW_KARANKAWA'
AND EXISTS (SELECT * FROM Religions WHERE Type = 'RELIGION_SOUTHERN_CULT');
--==========================================================================================================================
--==========================================================================================================================