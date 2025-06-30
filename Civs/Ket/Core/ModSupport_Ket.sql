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
            (LeaderType,		TraitOne,               TraitTwo)
SELECT      'LEADER_THP_OLGIT',		'POLICY_CREATIVE_X',	'POLICY_SPIRITUAL_X'
WHERE EXISTS (SELECT * FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X');
------------------------------	
-- Leaders
------------------------------	
UPDATE Leaders 
SET Description = 'Olgit [ICON_CULTURE][ICON_PEACE]'
WHERE Type = 'LEADER_THP_OLGIT'
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
------------------------------	
UPDATE Civilizations 
SET ArtStyleSuffix = '_MONGOL'
WHERE Type = 'CIVILIZATION_THP_KET'
AND EXISTS (SELECT * FROM Civilizations WHERE ArtStyleSuffix = '_MONGOL');
--==========================================================================================================================
-- GEDEMON's YNAEMP (+JFD's v23 / 24)
--==========================================================================================================================
/*
v25	 
    EarthMk3 (Earth_Mk3_Giant.Civ5Map)
    RussiaLarge (Russia_Large.Civ5Map)
*/

-----------------------------------
-- Civilizations_YagemStartPosition
-----------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_YagemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YagemStartPosition
		(Type,			X,	Y)
VALUES	('CIVILIZATION_THP_KET',	66,	79);
-----------------------------------
-- Civilizations_YahemStartPosition
-----------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_YahemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YahemStartPosition
		(Type,			X,	Y)
VALUES	('CIVILIZATION_THP_KET',	96,	69);
---------------------------------------
-- Civilizations_CordiformStartPosition
---------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_CordiformStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_CordiformStartPosition
		(Type,			X,	Y)
VALUES	('CIVILIZATION_THP_KET',	47,	41);
-------------------------------------------
-- Civilizations_GreatestEarthStartPosition
-------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_GreatestEarthStartPosition
		(Type,			X,	Y)
VALUES	('CIVILIZATION_THP_KET',	79,	62);
---------------------------------------------
-- Civilizations_AsiaSteppeGiantStartPosition
---------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_AsiaSteppeGiantStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_AsiaSteppeGiantStartPosition
		(Type,			X,	Y)
VALUES	('CIVILIZATION_THP_KET',	98,	87);
---------------------------------------------
-- Civilizations_EarthMk3StartPosition
---------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_EarthMk3StartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_EarthMk3StartPosition
		(Type,			X,	Y)
VALUES	('CIVILIZATION_THP_KET',	72,	83);
---------------------------------------
-- Civilizations_YagemRequestedResource
---------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_YagemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YagemRequestedResource
		(Type, 		Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_THP_KET',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YagemRequestedResource WHERE Type = 'CIVILIZATION_RUSSIA';
---------------------------------------
-- Civilizations_YagemRequestedResource
---------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_YahemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YahemRequestedResource
		(Type, 		Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_THP_KET',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YahemRequestedResource WHERE Type = 'CIVILIZATION_RUSSIA';
--==========================================================================================================================
-- JFD's CITIES IN DEVELOPMENT (10e9728f-d61c-4317-be4f-7d52d6bae6f4)
-- Please Note: it is NOT necessary to make any changes to this if you had supported Colony Names under the ExCE ID. 
-- You will only need to add support for Claims if you wish some of your Decisions to cost Dignitaries instead of Magistrates. Examples TBD.
--==========================================================================================================================
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

-- ya boi weighing in on linguistic issues right now
INSERT INTO Civilization_JFD_ColonialCityNames
	(CivilizationType, 			ColonyName,		LinguisticType)
VALUES	('CIVILIZATION_THP_KET', 		null,			'JFD_Dene_Chinookan');
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
VALUES	('LEADER_THP_OLGIT',	'FLAVOR_JFD_DECOLONIZATION',	8);
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
VALUES	('LEADER_THP_OLGIT',	'FLAVOR_JFD_SLAVERY',	4);
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
	(CivilizationType,		ArtDefineTag, CultureType,		IdealsTag,   SplashScreenTag, SoundtrackTag, UnitDialogueTag)
VALUES	('CIVILIZATION_THP_KET',	'JFD_Polar',  'CULTURE_JFD_POLAR',	'JFD_Polar', 'JFD_Polar',     'JFD_Polar',	'AS2D_SOUND_JFD_HUNNIC');
------------------------------	
-- Civilizations
------------------------------	
UPDATE Civilizations 
SET SoundtrackTag = 'JFD_Polar'
WHERE Type = 'CIVILIZATION_THP_KET'
AND EXISTS (SELECT * FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Polar')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);
--==========================================================================================================================
-- JFD's EXPLORATION CONTINUED EXPANDED (6676902b-b907-45f1-8db5-32dcb2135eee)
--==========================================================================================================================
INSERT INTO Unit_FreePromotions
		(UnitType, 		PromotionType)
SELECT	'UNIT_THP_FISHBOWMAN',		'PROMOTION_JFD_SNOW_IMMUNITY'
WHERE EXISTS (SELECT Type FROM UnitPromotions WHERE Type = 'PROMOTION_JFD_SCURVY_IMMUNITY');
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
		(LeaderType,		FlavorType,			Flavor)
VALUES	('LEADER_THP_OLGIT',		'FLAVOR_JFD_MERCENARY',		1);
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
VALUES	('LEADER_THP_OLGIT',	'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',	2),
	('LEADER_THP_OLGIT',	'FLAVOR_JFD_STATE_RELIGION',		2);
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
	(CivilizationType,	CurrencyType)
SELECT	'CIVILIZATION_THP_KET',	CurrencyType
FROM Civilization_JFD_Currencies WHERE CivilizationType = 'CIVILIZATION_MONGOLIA';
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
	(CivilizationType, 		InventionType, 			InventionPreference)
VALUES 	('CIVILIZATION_THP_KET', 	'INVENTION_JFD_WRITING',	'WRITING_JFD_CYRILLIC'),
	('CIVILIZATION_THP_KET', 	'INVENTION_JFD_SPORT',		'SPORT_JFD_ARCHERY');	
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
SELECT	'CIVILIZATION_THP_KET',		'GOVERNMENT_JFD_MONARCHY', 	65
FROM Civilization_JFD_Governments WHERE CivilizationType = 'CIVILIZATION_MONGOLIA';
------------------------------------------------------------	
-- Civilization_JFD_HeadsOfGovernment	
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 	
	Civilization_JFD_HeadsOfGovernment (	
	CivilizationType  			text 	REFERENCES Civilizations(Type) 	default null,
	CultureType				text 					default null,
	HeadOfGovernmentName			text 		 			default null);
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
	(PrivyCouncillorType,			CivilizationType,	UniqueName)
VALUES	('COUNCILLOR_JFD_CHAPLAIN',		'CIVILIZATION_THP_KET',	'TXT_KEY_COUNCILLOR_JFD_CHAPLAIN_DESC_THP_KET'),
	('COUNCILLOR_JFD_STEWARD',		'CIVILIZATION_THP_KET',	'TXT_KEY_COUNCILLOR_JFD_STEWARD_DESC_THP_KET');
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
SELECT	'CIVILIZATION_THP_KET',		PoliticsType,	UniqueName
FROM Civilization_JFD_Politics WHERE CivilizationType = 'CIVILIZATION_RUSSIA';
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
VALUES	('LEADER_THP_OLGIT',	'FLAVOR_JFD_REFORM_GOVERNMENT',		6),
	('LEADER_THP_OLGIT',	'FLAVOR_JFD_REFORM_LEGAL',		7),
	('LEADER_THP_OLGIT',	'FLAVOR_JFD_REFORM_CULTURE',		7),
	('LEADER_THP_OLGIT',	'FLAVOR_JFD_REFORM_ECONOMIC',		4),
	('LEADER_THP_OLGIT',	'FLAVOR_JFD_REFORM_FOREIGN',		5),
	('LEADER_THP_OLGIT',	'FLAVOR_JFD_REFORM_INDUSTRY',		2),
	('LEADER_THP_OLGIT',	'FLAVOR_JFD_REFORM_MILITARY',		3),
	('LEADER_THP_OLGIT',	'FLAVOR_JFD_REFORM_RELIGION',		9);
--==========================================================================================================================
-- TOMATEKH'S HISTORICAL RELIGIONS COMPLETE
--==========================================================================================================================
UPDATE Civilization_Religions SET ReligionType =
( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type="RELIGION_SAMAN" )
THEN "RELIGION_SAMAN"
ELSE "RELIGION_ORTHODOXY" END
) WHERE CivilizationType = "CIVILIZATION_THP_KET";
--==========================================================================================================================
-- EVENTS AND DECISIONS
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);

INSERT INTO DecisionsAddin_Support (FileName) VALUES ('Ket_Decisions.lua');

------------------
-- BuildingClasses
------------------
INSERT INTO BuildingClasses
        (Type,                            DefaultBuilding,             Description)
VALUES  ('BUILDINGCLASS_THP_KET_ALLEL',  'BUILDING_THP_KET_ALLEL',    'TXT_KEY_DECISIONS_THP_KET_ALLEL');
------------
-- Buildings
------------
INSERT INTO Buildings
	(Type,                      BuildingClass,                      Happiness,	SpecialistCount, GreatWorkCount, Cost, FaithCost,         Description,                         Help,                                  NeverCapture)
VALUES  ('BUILDING_THP_KET_ALLEL', 'BUILDINGCLASS_THP_KET_ALLEL',	1,		0,               -1,             -1,	-1,               'TXT_KEY_DECISIONS_THP_KET_ALLEL',    'TXT_KEY_DECISIONS_THP_KET_ALLEL_ENACTED_DESC',   1);
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
	(Type,		    ModName,			   ModID,			    Authors)
VALUES	('MOD_THP_KET', 'TXT_KEY_MOD_THP_KET_NAME', 'TXT_KEY_MOD_THP_KET_ID_STEAM', 'TXT_KEY_MOD_THP_KET_AUTHORS');
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
VALUES	('AA_THP_KET_SPECIAL',	'TXT_KEY_AA_THP_KET_SPECIAL_HEADER',	'TXT_KEY_AA_THP_KET_SPECIAL_TEXT',	'MOD_THP_KET',	1,				null,				'THP_KET_ATLAS',	0),
		('AA_THP_KET_VICTORY',	'TXT_KEY_AA_THP_KET_VICTORY_HEADER',	'TXT_KEY_AA_THP_KET_VICTORY_TEXT',	'MOD_THP_KET',	1,				'CIVILIZATION_THP_KET',	'THP_KET_ATLAS',	0);
--==========================================================================================================================
--==========================================================================================================================