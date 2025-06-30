--==========================================================================================================================
-- USER SETTINGS (THIS IS NEEDED IN MOST CASES)
--==========================================================================================================================
-- JFD_GlobalUserSettings
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
JFD_GlobalUserSettings (
	Type 				text 			default null,
	Value 				integer 		default 1);
--==========================================================================================================================
-- Bingle's Civ IV Traits
--==========================================================================================================================
-- Leader_SharedTraits
------------------------------	
CREATE TABLE IF NOT EXISTS 
    Leader_SharedTraits (
    LeaderType          text    REFERENCES Leaders(Type)        default null,
    TraitOne            text    REFERENCES Policies(Type)       default null,
    TraitTwo            text    REFERENCES Policies(Type)       default null);
     
INSERT OR REPLACE INTO Leader_SharedTraits
            (LeaderType,		TraitOne,                  		TraitTwo)
SELECT      'LEADER_THP_TAIZONG',	'POLICY_IMPERIALISTIC_X',		'POLICY_INVENTIVE_X'
WHERE EXISTS (SELECT * FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X');
------------------------------	
-- Leaders
------------------------------	
UPDATE Leaders 
SET Description = 'Taizong [ICON_CITY_STATE][ICON_RESEARCH]'
WHERE Type = 'LEADER_THP_TAIZONG'
AND EXISTS (SELECT * FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X');
--==========================================================================================================================
-- GAZEBO COMMUNITY PATCH
--==========================================================================================================================
-- COMMUNITY
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS COMMUNITY (Type TEXT, Value INTEGER);
--==========================================================================================================================
-- GEDEMON R.E.D.
--==========================================================================================================================
-- Civilizations
--------------------------------------------------------------------------------------------------------------------------
UPDATE Civilizations 
SET ArtStyleSuffix = '_CHINA'
WHERE Type = 'CIVILIZATION_THP_TANG'
AND EXISTS (SELECT * FROM Civilizations WHERE ArtStyleSuffix = '_CHINA');
--==========================================================================================================================
-- GEDEMON's YNAEMP (+JFD's v23 / 24)
--==========================================================================================================================
-- Civilizations_YagemStartPosition (Earth Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YagemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YagemStartPosition
		(Type,				X,		Y)
VALUES		('CIVILIZATION_THP_TANG',	79,		59);
------------------------------------------------------------	
-- Civilizations_YahemStartPosition (Earth Huge)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YahemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YahemStartPosition
		(Type,				X,	Y)
VALUES		('CIVILIZATION_THP_TANG',	102,	49);
------------------------------------------------------------	
-- Civilizations_CordiformStartPosition (Earth Standard)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_CordiformStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_CordiformStartPosition
		(Type,				X,		Y)
VALUES		('CIVILIZATION_THP_TANG',	59,		33);
------------------------------------------------------------	
-- Civilizations_GreatestEarthStartPosition (Earth Greatest)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_GreatestEarthStartPosition
		(Type,				X,		Y)
VALUES		('CIVILIZATION_THP_TANG',	83,		49);
------------------------------------------------------------	
-- Civilizations_EastAsiaStartPosition (East Asia)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EastAsiaStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_EastAsiaStartPosition
		(Type,				X,		Y)
VALUES		('CIVILIZATION_THP_TANG',	18,		30);
------------------------------------------------------------	
-- Civilizations_PacificStartPosition (Pacific)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_PacificStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_PacificStartPosition
		(Type,				X,		Y)
VALUES		('CIVILIZATION_THP_TANG',	30,		55);
------------------------------------------------------------
-- Civilizations_NorthEastAsiaStartPosition (North-East Asia)
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_NorthEastAsiaStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_NorthEastAsiaStartPosition
		(Type,				X,		Y)
VALUES		('CIVILIZATION_THP_TANG',	10,		19);
------------------------------------------------------------
-- Civilizations_AsiaStartPosition (Asia)
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_AsiaStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_AsiaStartPosition
		(Type,				X,		Y)
VALUES		('CIVILIZATION_THP_TANG',	62,		50);
------------------------------------------------------------
-- Civilizations_EarthMk3StartPosition
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_EarthMk3StartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_EarthMk3StartPosition
		(Type,				X,		Y)
VALUES		('CIVILIZATION_THP_TANG',	80,		65);
------------------------------------------------------------	
-- Civilizations_YagemRequestedResource (Earth Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YagemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YagemRequestedResource
			(Type, 			Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_THP_TANG'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YagemRequestedResource WHERE Type = 'CIVILIZATION_CHINA';
------------------------------------------------------------
-- Civilizations_YahemRequestedResource (Earth Huge)
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_YahemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YahemRequestedResource
			(Type, 			Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_THP_TANG'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YahemRequestedResource WHERE Type = 'CIVILIZATION_CHINA';
------------------------------------------------------------
-- Civilizations_GreatestEarthRequestedResource (Earth Greatest)
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_GreatestEarthRequestedResource
			(Type, 			Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_THP_TANG'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE Type = 'CIVILIZATION_CHINA';
------------------------------------------------------------
-- Civilizations_GreatestEarthRequestedResource (Asia)
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_AsiaRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_AsiaRequestedResource
			(Type, 			Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_THP_TANG'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_AsiaRequestedResource WHERE Type = 'CIVILIZATION_CHINA';
------------------------------------------------------------
-- Civilizations_EastAsiaRequestedResource (East Asia)
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_EastAsiaRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_EastAsiaRequestedResource
			(Type, 			Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_THP_TANG'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_EastAsiaRequestedResource WHERE Type = 'CIVILIZATION_CHINA';
------------------------------------------------------------
-- Civilizations_PacificRequestedResource (Pacific)
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_PacificRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_PacificRequestedResource
			(Type, 			Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_THP_TANG'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_PacificRequestedResource WHERE Type = 'CIVILIZATION_CHINA';
------------------------------------------------------------
-- Civilizations_NorthEastAsiaRequestedResource (North-East Asia)
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_NorthEastAsiaRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_NorthEastAsiaRequestedResource
			(Type, 			Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_THP_TANG'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_NorthEastAsiaRequestedResource WHERE Type = 'CIVILIZATION_CHINA';
--==========================================================================================================================
-- JFD CIVILOPEDIA
--==========================================================================================================================
UPDATE Civilizations
SET DerivativeCiv = 'CIVILIZATION_CHINA'
WHERE Type = 'CIVILIZATION_THP_TANG';		
--==========================================================================================================================
-- JFD's CITIES IN DEVELOPMENT (10e9728f-d61c-4317-be4f-7d52d6bae6f4)
-- Please Note: it is NOT necessary to make any changes to this if you had supported Colony Names under the ExCE ID. 
-- You will only need to add support for Claims if you wish some of your Decisions to cost Dignitaries instead of Magistrates. Examples TBD.
--==========================================================================================================================
--==========================================================	
-- AMENITIES 
--==========================================================
-- Civilization_JFD_ClassNames
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_ClassNames (
	CivilizationType  		text 		REFERENCES Civilizations(Type) 		default null,
	ClassType  			text 							default null,
	UniqueClassName			text 		 					default null);		

INSERT INTO Civilization_JFD_ClassNames
	(CivilizationType, 		ClassType,	UniqueClassName)
SELECT	'CIVILIZATION_THP_TANG', 	ClassType,	UniqueClassName
FROM Civilization_JFD_ClassNames WHERE CivilizationType = 'CIVILIZATION_CHINA';
--==========================================================	
-- COLONIES 
--==========================================================	
-- Civilization_JFD_ColonialCityNames
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_ColonialCityNames (
	CivilizationType 		text 	REFERENCES Civilizations(Type) 		default null,
	ColonyName 			text						default null,
	LinguisticType			text						default	null,
	CultureType			text						default	null);

INSERT INTO Civilization_JFD_ColonialCityNames
	(CivilizationType, 			ColonyName,	LinguisticType)
SELECT	'CIVILIZATION_THP_TANG', 		ColonyName,	LinguisticType
FROM Civilization_JFD_ColonialCityNames WHERE CivilizationType = 'CIVILIZATION_CHINA';
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
	(LeaderType,		FlavorType,			Flavor)
VALUES	('LEADER_THP_TAIZONG',	'FLAVOR_JFD_DECOLONIZATION',	1);
--==========================================================	
-- PROVINCES 
--==========================================================	
-- Civilization_JFD_ProvinceTitles
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_ProvinceTitles (
	CivilizationType  			text 		REFERENCES Civilizations(Type)  default null,
	ReligionType  				text 		REFERENCES Religions(Type) 	default null, -- ignore this
	DefaultTitle				text 						default null,
	UniqueTitle				text 						default null,
	UseAdjective				boolean						default 0);	

INSERT INTO Civilization_JFD_ProvinceTitles
	(CivilizationType,		DefaultTitle, UniqueTitle, UseAdjective)
SELECT	'CIVILIZATION_THP_TANG',	DefaultTitle, UniqueTitle, UseAdjective
FROM Civilization_JFD_ProvinceTitles WHERE CivilizationType = 'CIVILIZATION_CHINA';
--==========================================================	
-- SLAVERY 
--==========================================================	
-- Flavors
------------------------------------------------------------	
INSERT OR REPLACE INTO Flavors 
		(Type)
VALUES	('FLAVOR_JFD_SLAVERY');
------------------------------------------------------------
-- Leader_Flavors
------------------------------------------------------------
INSERT INTO Leader_Flavors
	(LeaderType,		FlavorType,		Flavor)
VALUES	('LEADER_THP_TAIZONG',	'FLAVOR_JFD_SLAVERY',	3);
--==========================================================================================================================
-- JFD's CULTURAL DIVERSITY (31a31d1c-b9d7-45e1-842c-23232d66cd47)
--==========================================================================================================================
-- Civilization_JFD_CultureTypes
-------------------------------------	
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_CultureTypes(
	CivilizationType 	text 	REFERENCES Civilizations(Type) 		default null,
	CultureType 		text						default null,
	ArtDefineTag		text						default	null,
	DefeatScreenEarlyTag	text						default	null,
	DefeatScreenMidTag	text						default	null,
	DefeatScreenLateTag	text						default	null,
	IdealsTag		text						default	null,
	SplashScreenTag		text						default	null,
	SoundtrackTag		text						default	null,
	UnitDialogueTag		text						default null);

INSERT INTO Civilization_JFD_CultureTypes
	(CivilizationType,		ArtDefineTag, CultureType, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag)
SELECT	'CIVILIZATION_THP_TANG',	ArtDefineTag, CultureType, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_CHINA';
--==========================================================================================================================	
-- JFD's AND POUAKAI's MERCENARIES (a19351c5-c0b3-4b07-8695-4affaa199949)
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
	(LeaderType,			FlavorType,			Flavor)
VALUES	('LEADER_THP_TAIZONG',		'FLAVOR_JFD_MERCENARY',		7);
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
INSERT INTO Leader_Flavors
	(LeaderType,		FlavorType,				Flavor)
VALUES	('LEADER_THP_TAIZONG',	'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',	6),
	('LEADER_THP_TAIZONG',	'FLAVOR_JFD_STATE_RELIGION',		2);
--==========================================================	
-- PROSPERITY
--==========================================================
-- Civilization_JFD_Currencies
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_Currencies (
	CivilizationType  		text 		REFERENCES Civilizations(Type) 	default null,
	CurrencyType	  		text 		 				default null);

INSERT INTO Civilization_JFD_Currencies
	(CivilizationType,		CurrencyType)
SELECT	'CIVILIZATION_THP_TANG',	CurrencyType
FROM Civilization_JFD_Currencies WHERE CivilizationType = 'CIVILIZATION_CHINA';
--==========================================================	
-- INVENTIONS 
--==========================================================	
-- Civilization_JFD_Inventions
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_Inventions (
	CivilizationType  		text 	REFERENCES Civilizations(Type) 				default null,
	InventionType  			text 		 						default null,
	InventionPreference		text 		 						default null);
	
INSERT INTO Civilization_JFD_Inventions
	(CivilizationType, 		InventionType, 	InventionPreference)
SELECT	'CIVILIZATION_THP_TANG',	InventionType,	InventionPreference
FROM Civilization_JFD_Inventions WHERE CivilizationType = 'CIVILIZATION_CHINA';

INSERT OR REPLACE INTO Civilization_JFD_Inventions
	(CivilizationType,		InventionType,		InventionPreference)
VALUES	('CIVILIZATION_THP_TANG',	'INVENTION_JFD_SPORT',	'SPORT_JFD_ARCHERY');
--==========================================================	
-- SOVEREIGNTY
--==========================================================
-- Civilization_JFD_Governments
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_Governments (
	CivilizationType  		text 		REFERENCES Civilizations(Type) 	default null,
	GovernmentType			text						default	null,
	Weight				integer						default	0);

INSERT INTO Civilization_JFD_Governments
	(CivilizationType,				GovernmentType, 		Weight)
SELECT	'CIVILIZATION_THP_TANG',	'GOVERNMENT_JFD_MONARCHY', 	100
FROM Civilization_JFD_Governments WHERE CivilizationType = 'CIVILIZATION_CHINA';
------------------------------------------------------------	
-- Civilization_JFD_HeadsOfGovernment	
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 	
	Civilization_JFD_HeadsOfGovernment (	
	CivilizationType  			text 	REFERENCES Civilizations(Type) 	default null,
	CultureType				text 					default null,
	HeadOfGovernmentName			text 		 			default null);

INSERT INTO Civilization_JFD_HeadsOfGovernment
        (CivilizationType,      		HeadOfGovernmentName)
SELECT  'CIVILIZATION_THP_TANG',		HeadOfGovernmentName
FROM Civilization_JFD_HeadsOfGovernment WHERE CivilizationType = 'CIVILIZATION_CHINA';
------------------------------------------------------------
-- Civilization_JFD_Titles
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_Titles (
	CivilizationType  		text 		REFERENCES Civilizations(Type) 	default null,
	CultureType			text 		 				default null,
	ReligionType			text 		REFERENCES Religions(Type) 	default null,
	DefaultTitle			text 		 				default null,
	UniqueTitle			text 		 				default null,
	UseAdjective			boolean						default 0);	

INSERT INTO Civilization_JFD_Titles
	(CivilizationType,			DefaultTitle,	UniqueTitle,	UseAdjective)
SELECT	'CIVILIZATION_THP_TANG',		DefaultTitle,	UniqueTitle,	1
FROM Civilization_JFD_Titles WHERE CivilizationType = 'CIVILIZATION_CHINA';
------------------------------------------------------------
-- JFD_PrivyCouncillor_UniqueNames
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	JFD_PrivyCouncillor_UniqueNames (
	PrivyCouncillorType  			text 					default null,
	PolicyType  				text 	REFERENCES Policies(Type) 	default null,
	CivilizationType			text	REFERENCES Civilizations(Type) 	default	null,
	CultureType				text					default	null,
	GovernmentType  			text 	 				default null,
	ReligionType				text	REFERENCES Religions(Type) 	default	null,
	UniqueName				text					default	null);
	
INSERT INTO JFD_PrivyCouncillor_UniqueNames	
	(PrivyCouncillorType,	CivilizationType,		UniqueName)
SELECT	 PrivyCouncillorType,	'CIVILIZATION_THP_TANG',	UniqueName
FROM JFD_PrivyCouncillor_UniqueNames WHERE CivilizationType = 'CIVILIZATION_CHINA';
------------------------------------------------------------
-- Civilization_JFD_Politics
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_Politics (
	CivilizationType  		text 		REFERENCES Civilizations(Type) 	default null,
	PoliticsType  			text 						default null,
	UniqueName			text						default	null);

INSERT INTO Civilization_JFD_Politics
	(CivilizationType,		PoliticsType, 	UniqueName)
SELECT	'CIVILIZATION_THP_TANG',	PoliticsType,	UniqueName
FROM Civilization_JFD_Politics WHERE CivilizationType = 'CIVILIZATION_CHINA';
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
		(LeaderType,		FlavorType,				Flavor)
VALUES	('LEADER_THP_TAIZONG',		'FLAVOR_JFD_REFORM_GOVERNMENT',		7),
		('LEADER_THP_TAIZONG',	'FLAVOR_JFD_REFORM_LEGAL',		8),
		('LEADER_THP_TAIZONG',	'FLAVOR_JFD_REFORM_CULTURE',		7),
		('LEADER_THP_TAIZONG',	'FLAVOR_JFD_REFORM_ECONOMIC',		4),
		('LEADER_THP_TAIZONG',	'FLAVOR_JFD_REFORM_FOREIGN',		9),
		('LEADER_THP_TAIZONG',	'FLAVOR_JFD_REFORM_INDUSTRY',		5),
		('LEADER_THP_TAIZONG',	'FLAVOR_JFD_REFORM_MILITARY',		7),
		('LEADER_THP_TAIZONG',	'FLAVOR_JFD_REFORM_RELIGION',		2);
--==========================================================================================================================
-- TOMATEKH'S HISTORICAL RELIGIONS COMPLETE
--==========================================================================================================================
-- N/A; Taoism is already in vanilla
--==========================================================================================================================
-- EVENTS AND DECISIONS
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);

INSERT INTO DecisionsAddin_Support (FileName) VALUES ('Tang_Decisions.lua');
-----------
-- Policies
-----------
INSERT INTO Policies
	(Type,				Description,				Help)
VALUES	('POLICY_THP_TANG_TEAHORSES',	'TXT_KEY_DECISIONS_THP_TANG_TEAHORSES',	'TXT_KEY_DECISIONS_THP_TANG_TEAHORSES_ENACTED_DESC');
---------------------------------
-- Policy_ImprovementYieldChanges
---------------------------------
INSERT INTO Policy_ImprovementYieldChanges
	(PolicyType,			ImprovementType,	YieldType,	Yield)
VALUES	('POLICY_THP_TANG_TEAHORSES',	'IMPROVEMENT_PASTURE',	'YIELD_GOLD',	1);
--==========================================================================================================================
-- TROLLER ADDITIONAL ACHIEVEMENTS
--==========================================================================================================================
-- AdditionalAchievements_Mods
------------------------------
CREATE TABLE IF NOT EXISTS 
	AdditionalAchievements_Mods (
	ID  				integer 	PRIMARY KEY		AUTOINCREMENT,
	Type				text					default	null,
	ModName				text					default null,
	ModID				text					default	null,	
	Authors				text					default	null);

INSERT INTO AdditionalAchievements_Mods
	(Type,		  ModName,			ModID,			       Authors)
VALUES	('MOD_THP_TANG', 'TXT_KEY_MOD_THP_TANG_NAME',  'TXT_KEY_MOD_THP_TANG_ID_STEAM', 'TXT_KEY_MOD_THP_TANG_AUTHORS');
-------------------------
-- AdditionalAchievements
-------------------------
CREATE TABLE IF NOT EXISTS 
	AdditionalAchievements (
	ID  			integer 	PRIMARY KEY		AUTOINCREMENT,
	Type			text					default	null,
	Achievopedia		text					default null,
	Header			text					default	null,	
	IconAtlas		text					default	null,	
	PortraitIndex		integer					default	0,
	ModType			text					default	null,	
	ModVersion		integer					default	0,
	Unlocked		boolean					default	0,
	LockedIconAtlas		text					default	'CIV_COLOR_ATLAS',
	LockedPortraitIndex	integer					default	23,
	UnlockSound		text					default	'AS2D_INTERFACE_ANCIENT_RUINS',
	PopupDuration		integer					default	-1,
	Hidden			boolean					default	0,
	HiddenBorder		boolean					default	0,
	RequiredCivWin		text					default	null,
	RequiredCivLoss		text					default	null,
	RequiredCivKill		text					default	null);

INSERT INTO AdditionalAchievements
		(Type,			Header,			Achievopedia,		ModType,	ModVersion,		RequiredCivWin,				IconAtlas,		PortraitIndex)
VALUES	('AA_THP_TANG_SPECIAL',	'TXT_KEY_AA_THP_TANG_SPECIAL_HEADER',	'TXT_KEY_AA_THP_TANG_SPECIAL_TEXT',	'MOD_THP_TANG',	1,	null,				'THP_TANG_ATLAS',	0),
	('AA_THP_TANG_VICTORY',	'TXT_KEY_AA_THP_TANG_VICTORY_HEADER',	'TXT_KEY_AA_THP_TANG_VICTORY_TEXT',	'MOD_THP_TANG',1,	'CIVILIZATION_THP_TANG',	'THP_TANG_ATLAS',	0);
--==========================================================================================================================
--==========================================================================================================================