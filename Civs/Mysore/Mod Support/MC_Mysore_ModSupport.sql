------------------------------------------------------------------------------------------------------------------------
--=======================================================================================================================
-- MASTER TABLES
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS COMMUNITY (Type TEXT, Value INTEGER);
CREATE TABLE IF NOT EXISTS Civilization_JFD_ColonialCityNames(CivilizationType text, ColonyName text, LinguisticType text);
CREATE TABLE IF NOT EXISTS Civilization_JFD_Governments(CivilizationType text, CultureType text, LegislatureName text, OfficeTitle text, GovernmentType text, Weight integer);
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMP(CivilizationType, MapPrefix, X, Y, CapitalName, AltX, AltY, AltCapitalName);
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMPRequestedResources(CivilizationType, MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6);
CREATE TABLE IF NOT EXISTS MinorCivilizations_YnAEMP(MinorCivType, MapPrefix, X, Y, CapitalName, AltX, AltY, AltCapitalName);
CREATE TABLE IF NOT EXISTS JFD_Civilopedia_HideFromPedia(Type text);
CREATE TABLE IF NOT EXISTS JFD_GlobalUserSettings(Type text, Value integer default 1);
--=======================================================================================================================
-- BINGLES CIV IV TRAITS
--=======================================================================================================================
-- Leader_SharedTraits
------------------------------  
CREATE TABLE IF NOT EXISTS
    Leader_SharedTraits (
    LeaderType          text    REFERENCES Leaders(TYPE)        DEFAULT NULL,
    TraitOne            text    REFERENCES Policies(TYPE)       DEFAULT NULL,
    TraitTwo            text    REFERENCES Policies(TYPE)       DEFAULT NULL);
     
INSERT INTO Leader_SharedTraits
        (LeaderType,				TraitOne,				TraitTwo)
SELECT  'LEADER_MC_TIPU_SULTAN',	'POLICY_INVENTIVE_X',	'POLICY_PROTECTIVE_X'
WHERE EXISTS (SELECT * FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X');
------------------------------  
-- Leaders
------------------------------  
UPDATE Leaders
SET Description = 'Uzun Hasan [ICON_RESEARCH][ICON_PROTECTIVE]'
WHERE TYPE = 'LEADER_MC_TIPU_SULTAN'
AND EXISTS (SELECT * FROM Policies WHERE TYPE = 'POLICY_PHILOSOPHICAL_X');

--==========================================================================================================================
-- Events & Decisions
--==========================================================================================================================
-- DecisionsAddin_Support
------------------------------
--CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
--INSERT INTO DecisionsAddin_Support (FileName) VALUES ('MC_MYSORE_Decisions.lua');

--==========================================================================================================================
-- JFDLC
--==========================================================================================================================
--====================================
-- Miscellanenous
--====================================
--INSERT INTO JFD_Civilopedia_HideFromPedia
--		(Type)
--VALUES	('');
--====================================
-- JFD's Cultural Diversity
--====================================
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_CultureTypes(
	CivilizationType 					text 			default null,
	CultureType 						text			default null,
	SubCultureType 						text			default null,
	ArtDefineTag						text			default	null,
	DecisionsTag						text			default null,
	DefeatScreenEarlyTag				text			default	null,
	DefeatScreenMidTag					text			default	null,
	DefeatScreenLateTag					text			default	null,
	IdealsTag							text			default	null,
	SplashScreenTag						text			default	null,
	SoundtrackTag						text			default	null,
	UnitDialogueTag						text			default null);

INSERT INTO Civilization_JFD_CultureTypes
		(CivilizationType,				ArtDefineTag, CultureType, SubCultureType, DecisionsTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag)
SELECT	'CIVILIZATION_MC_MYSORE',		ArtDefineTag, CultureType, SubCultureType, DecisionsTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_INDIA';

UPDATE Civilizations 
SET SoundtrackTag = (SELECT SoundtrackTag FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_MC_MYSORE')
WHERE Type = 'CIVILIZATION_MC_MYSORE'
AND EXISTS (SELECT SoundID FROM Audio_Sounds WHERE SoundID = 'SND_JFD_ABORIGINAL_PEACE_01');
------------------------------  
-- Flavours
------------------------------  
INSERT OR REPLACE INTO Flavors 
		(Type)
VALUES	('FLAVOR_JFD_DECOLONIZATION'),			--0-10. Determines likelihood for annexing a colony, where 0 means never, and 10 means as soon as possible.
		('FLAVOR_JFD_MERCENARY'),				--0-10. Determines likelihood of taking out Mercenary Contracts, where 0 means never, and 10 means as soon as possible.
		('FLAVOR_JFD_RELIGIOUS_INTOLERANCE'),	--0-12. Determines the diplomatic penalty/bonus with leaders of a different/same state religion
		('FLAVOR_JFD_REFORM_GOVERNMENT'),		--0-10. Determines Reform preference; corresponding to Left>Centre>Right/Liberal to Authoritarian continuum. 1-4=Left, 5-6=Centre, 7-10=Right. For government issues.
		('FLAVOR_JFD_REFORM_LEGAL'),			--same as above for legal issues. 
		('FLAVOR_JFD_REFORM_CULTURE'),			--same as above for cultural issues.
		('FLAVOR_JFD_REFORM_ECONOMIC'),			--same as above for economic issues. 
		('FLAVOR_JFD_REFORM_EDUCATION'),		--same as above for educational issues.
		('FLAVOR_JFD_REFORM_FOREIGN'),			--same as above for diplomatic/international issues.
		('FLAVOR_JFD_REFORM_INDUSTRY'),			--same as above for industrial/labour issues.
		('FLAVOR_JFD_REFORM_MILITARY'),			--same as above for military issues.
		('FLAVOR_JFD_REFORM_RELIGION'),			--same as above for religious issues.
		('FLAVOR_JFD_SLAVERY'),					--0-10. Determines likelihood of enslaving Cities and spending Shackles on Slave Units, where 0 means never, and 10 as much as possible.
		('FLAVOR_JFD_STATE_RELIGION');			--0-12. Determines chance to adopt a State Religion, where 0 means never. 9+ also means this leader will never secularize.

INSERT INTO Leader_Flavors
		(LeaderType,				FlavorType,							 Flavor)
VALUES	('LEADER_MC_TIPU_SULTAN',		'FLAVOR_JFD_DECOLONIZATION',		 4),
		('LEADER_MC_TIPU_SULTAN',		'FLAVOR_JFD_MERCENARY',				 8),
		('LEADER_MC_TIPU_SULTAN',		'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',	 5),
		('LEADER_MC_TIPU_SULTAN',		'FLAVOR_JFD_REFORM_GOVERNMENT',		 7), --Scale of Liberal to Authoritarian.
		('LEADER_MC_TIPU_SULTAN',		'FLAVOR_JFD_REFORM_LEGAL',			 6), 	
		('LEADER_MC_TIPU_SULTAN',		'FLAVOR_JFD_REFORM_CULTURE',		 7),
		('LEADER_MC_TIPU_SULTAN',		'FLAVOR_JFD_REFORM_ECONOMIC',		 6),
		('LEADER_MC_TIPU_SULTAN',		'FLAVOR_JFD_REFORM_EDUCATION',	 	 7),
		('LEADER_MC_TIPU_SULTAN',		'FLAVOR_JFD_REFORM_FOREIGN',		 8),
		('LEADER_MC_TIPU_SULTAN',		'FLAVOR_JFD_REFORM_INDUSTRY',		 4),
		('LEADER_MC_TIPU_SULTAN',		'FLAVOR_JFD_REFORM_MILITARY',		 9),
		('LEADER_MC_TIPU_SULTAN',		'FLAVOR_JFD_REFORM_RELIGION',		 7),
		('LEADER_MC_TIPU_SULTAN',		'FLAVOR_JFD_SLAVERY',				 8),
		('LEADER_MC_TIPU_SULTAN',		'FLAVOR_JFD_STATE_RELIGION',		 6);
--==========================================================================================================================
-- TOMATEKH HISTORICAL RELIGIONS
--==========================================================================================================================
------------------------------
-- Civilization_Religions
------------------------------
--Commenting out as Sunni uses the same default tag as Islam in HR
--UPDATE Civilization_Religions
--SET ReligionType = 'RELIGION_AL_ASNAM'
--WHERE CivilizationType = 'CIVILIZATION_MC_MYSORE'
--AND EXISTS (SELECT * FROM Religions WHERE Type = 'RELIGION_AL_ASNAM');
--==========================================================================================================================
-- HAZEL MAP LABELS
--==========================================================================================================================
-- ML_CivCultures
------------------------------  
CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
        (CivType,						CultureType,        CultureEra)
VALUES  ('CIVILIZATION_MC_MYSORE',		'INDIAN',	       'ANCIENT');
--==========================================================================================================================
-- R.E.D. / Ethnic Units
--==========================================================================================================================
-- Civilizations
------------------------------  
UPDATE Civilizations
SET ArtStyleSuffix = (CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = '_RUSSIA' )
    THEN '_INDIA'
    ELSE '_AFRI' END)
WHERE TYPE = 'CIVILIZATION_MC_MYSORE';
--==========================================================================================================================
-- YnAEMP v25
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMP(CivilizationType, MapPrefix, X, Y);
INSERT INTO Civilizations_YnAEMP
		(CivilizationType,				MapPrefix,				X,		 Y)
VALUES	('CIVILIZATION_MC_MYSORE',		'Yagem',				59,		37),
		('CIVILIZATION_MC_MYSORE',		'Yahem',				89,		37),
		('CIVILIZATION_MC_MYSORE',		'Cordiform',			58,		18),
		('CIVILIZATION_MC_MYSORE',		'GreatestEarth',		76,		32),
		('CIVILIZATION_MC_MYSORE',		'EarthMk3',				64,		34),
		('CIVILIZATION_MC_MYSORE',		'AfriAsiaAust',			75,		44),
		('CIVILIZATION_MC_MYSORE',		'Asia',					26,		15),
		('CIVILIZATION_MC_MYSORE',		'EastAsia',				0,		30),
		('CIVILIZATION_MC_MYSORE',		'India',				48,		13),
		('CIVILIZATION_MC_MYSORE',		'IndiaGiant',			42,		31),
		('CIVILIZATION_MC_MYSORE',		'IndianOcean',			47,		51),
		('CIVILIZATION_MC_MYSORE',		'Orient',				117,	7),
		('CIVILIZATION_MC_MYSORE',		'Pacific',				8,		36),
		('CIVILIZATION_MC_MYSORE',		'SouthAsiaHuge',		46,		16);

--==========================================================================================================================
-- ENLIGHTENMENT ERA
--==========================================================================================================================
------------------------------------------------------------
-- Units
------------------------------------------------------------
INSERT OR REPLACE INTO Units 	
			(Type,						Class, Cost, Range, PrereqTech, Combat,	RangedCombat, Moves,	SpecialCargo,				FaithCost,	RequiresFaithPurchaseEnabled, CombatClass, MilitarySupport, MilitaryProduction, Domain, Pillage, IgnoreBuildingDefense, ObsoleteTech, GoodyHutUpgradeUnitClass, XPValueAttack, XPValueDefense, Conscription,  DefaultUnitAI, Description, 							Civilopedia, 								Help, 											Strategy,										AdvancedStartCost,	UnitArtInfo, 						UnitFlagIconOffset,	UnitFlagAtlas,				PortraitIndex, 	IconAtlas)
SELECT		('UNIT_MC_MYSORE_CUSHOON'),	Class, Cost, Range, PrereqTech, Combat,	RangedCombat, Moves,	('SPECIALUNIT_MISSILE'),	FaithCost,	RequiresFaithPurchaseEnabled, CombatClass, MilitarySupport, MilitaryProduction,	Domain, Pillage, IgnoreBuildingDefense, ObsoleteTech, GoodyHutUpgradeUnitClass, XPValueAttack, XPValueDefense, Conscription,  DefaultUnitAI, ('TXT_KEY_UNIT_MC_MYSORE_CUSHOON'),	('TXT_KEY_UNIT_MC_MYSORE_CUSHOON_PEDIA'), 	('TXT_KEY_UNIT_MC_MYSORE_CUSHOON_HELP_EE'), 	('TXT_KEY_UNIT_MC_MYSORE_CUSHOON_STRATEGY_EE'),	AdvancedStartCost, 	('ART_DEF_UNIT_MC_MYSORE_CUSHOON'), 0,					('MC_MYSORE_CUSHOON_FLAG'),	3, 				('MC_MYSORE_ATLAS')
FROM Units WHERE Type = 'UNIT_EE_LINE_INFANTRY'
AND EXISTS (SELECT * FROM Technologies WHERE Type = 'TECH_EE_FLINTLOCK');

------------------------------------------------------------
-- Unit_ClassUpgrades
------------------------------------------------------------
DELETE FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_MC_MYSORE_CUSHOON'
AND EXISTS (SELECT * FROM Technologies WHERE Type = 'TECH_EE_FLINTLOCK');

INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 					UnitClassType)
SELECT	'UNIT_MC_MYSORE_CUSHOON',	UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_EE_LINE_INFANTRY'
AND EXISTS (SELECT * FROM Technologies WHERE Type = 'TECH_EE_FLINTLOCK');

------------------------------------------------------------
-- Civilization_UnitClassOverrides
------------------------------------------------------------
UPDATE Civilization_UnitClassOverrides
SET UnitClassType = 'UNITCLASS_EE_LINE_INFANTRY'
WHERE CivilizationType = 'CIVILIZATION_MC_MYSORE' AND UnitType = 'UNIT_MC_MYSORE_CUSHOON'
AND EXISTS (SELECT * FROM Technologies WHERE Type = 'TECH_EE_FLINTLOCK');

------------------------------------------------------------
-- Buildings
------------------------------------------------------------
INSERT OR REPLACE INTO Buildings 	
		(Type, 									BuildingClass,	FreeStartEra,	Cost,	GoldMaintenance,	PrereqTech,	Description,									Civilopedia,											Help,													Strategy,													ArtDefineTag,	SpecialistType,	SpecialistCount,	MinAreaSize,	ConquestProb,	HurryCostModifier,	AllowsRangeStrike,	Defense,		ExtraCityHitPoints,		IconAtlas,				PortraitIndex)
SELECT	('BUILDING_MC_MYSORE_TARAMANDAL_PET'),	BuildingClass,	FreeStartEra,	Cost,	GoldMaintenance,	PrereqTech,	('TXT_KEY_BUILDING_MC_MYSORE_TARAMANDAL_PET'),	('TXT_KEY_BUILDING_MC_MYSORE_TARAMANDAL_PET_PEDIA'),	('TXT_KEY_BUILDING_MC_MYSORE_TARAMANDAL_PET_HELP_EE'),	('TXT_KEY_BUILDING_MC_MYSORE_TARAMANDAL_PET_STRATEGY_EE'),	ArtDefineTag,	SpecialistType,	SpecialistCount,	MinAreaSize,	0,				HurryCostModifier,	AllowsRangeStrike,	Defense+200,	ExtraCityHitPoints-10,	'MC_MYSORE_ATLAS',		2
FROM Buildings WHERE Type = 'BUILDING_EE_BASTION'
AND EXISTS (SELECT * FROM Technologies WHERE Type = 'TECH_EE_FLINTLOCK');

------------------------------------------------------------
-- Building_ClassesNeededInCity
------------------------------------------------------------
DELETE FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_MC_MYSORE_TARAMANDAL_PET'
AND EXISTS (SELECT * FROM Technologies WHERE Type = 'TECH_EE_FLINTLOCK');

INSERT OR REPLACE INTO Building_ClassesNeededInCity 	
		(BuildingType, 							BuildingClassType)
SELECT	('BUILDING_MC_MYSORE_TARAMANDAL_PET'),	BuildingClassType
FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_EE_BASTION'
AND EXISTS (SELECT * FROM Technologies WHERE Type = 'TECH_EE_FLINTLOCK');

------------------------------------------------------------
-- Civilization_BuildingClassOverrides
------------------------------------------------------------
UPDATE Civilization_BuildingClassOverrides 
SET BuildingClassType = 'BUILDINGCLASS_EE_BASTION'
WHERE CivilizationType = 'CIVILIZATION_MC_MYSORE' AND BuildingType = 'BUILDING_MC_MYSORE_TARAMANDAL_PET'
AND EXISTS (SELECT * FROM Technologies WHERE Type = 'TECH_EE_FLINTLOCK');

--==========================================================================================================================
-- TROLLER ADDITIONAL ACHIEVEMENTS
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
-- AdditionalAchievements_Mods
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	AdditionalAchievements_Mods (
	ID  				integer 	PRIMARY KEY		AUTOINCREMENT,
	Type				text		default	null,
	ModName				text		default null,
	ModID				text		default	null,	
	Authors				text		default	null);

INSERT INTO AdditionalAchievements_Mods
		(Type,				ModName,						ModID,								Authors)
VALUES	('MOD_MC_MYSORE',	'TXT_KEY_MOD_MC_MYSORE_NAME',	'TXT_KEY_MOD_MC_MYSORE_ID_STEAM',	'TXT_KEY_MOD_MC_MYSORE_AUTHORS');
--------------------------------------------------------------------------------------------------------------------------
-- AdditionalAchievements
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	AdditionalAchievements (
	ID					integer 	PRIMARY KEY		AUTOINCREMENT,
	Type				text					default	null,
	Achievopedia		text					default null,
	Header				text					default	null,	
	IconAtlas			text					default	null,	
	PortraitIndex		integer					default	0,
	ModType				text					default	null,	
	ModVersion			integer					default	0,
	Unlocked			boolean					default	0,
	LockedIconAtlas		text					default	'CIV_COLOR_ATLAS',
	LockedPortraitIndex	integer					default	23,
	UnlockSound			text					default	'AS2D_INTERFACE_ANCIENT_RUINS',
	PopupDuration		integer					default	-1,
	Hidden				boolean					default	0,
	HiddenBorder		boolean					default	0,
	RequiredCivWin		text					default	null,
	RequiredCivLoss		text					default	null,
	RequiredCivKill		text					default	null);

INSERT INTO AdditionalAchievements
		(Type,						Header,									Achievopedia,							ModType,			ModVersion,		RequiredCivWin,				IconAtlas,			PortraitIndex)
VALUES	('AA_MC_MYSORE_VICTORY',	'TXT_KEY_AA_MC_MYSORE_VICTORY_HEADER',	'TXT_KEY_AA_MC_MYSORE_VICTORY_TEXT',	'MOD_MC_MYSORE',	1,				'CIVILIZATION_MC_MYSORE',	'MC_MYSORE_ATLAS',	0);
		--('AA_MC_MYSORE_SPECIAL',	'TXT_KEY_AA_MC_MYSORE_SPECIAL_HEADER',	'TXT_KEY_AA_MC_MYSORE_SPECIAL_TEXT',	'MOD_MC_MYSORE',	1,				null,						'UNIT_ATLAS_2',		35);
--==========================================================================================================================
--==========================================================================================================================