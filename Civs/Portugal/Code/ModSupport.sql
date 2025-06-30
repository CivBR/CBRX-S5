--==========================================================================================================================
--This SQL file handles most of the mod support.
--==========================================================================================================================
--==========================================================================================================================
-- USER SETTINGS (THIS IS NEEDED IN MOST CASES)
--==========================================================================================================================
-- JFD_GlobalUserSettings
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
JFD_GlobalUserSettings (
    Type                text            default null,
    Value               integer         default 1);
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
            -- (LeaderType,			TraitOne,					TraitTwo)
-- VALUES      ('LEADER_TCM_JOAO_II',	'POLICY_CHARISMATIC_X',		'POLICY_MERCANTILE_X');
------------------------------	
-- Leaders
------------------------------	
-- UPDATE Leaders 
-- SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
	-- THEN 'João II [ICON_HAPPINESS_1][ICON_GOLD]'
	-- ELSE 'TXT_KEY_LEADER_TCM_JOAO_II' END) 
-- WHERE Type = 'LEADER_TCM_JOAO_II';

-- CREATE TRIGGER CivIVTraitsTCMAVIS_PORTUGAL
-- AFTER INSERT ON Leaders WHEN 'LEADER_TCM_JOAO_II' = NEW.Type
-- BEGIN
	-- UPDATE Leaders
	-- SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
		-- THEN 'João II [ICON_HAPPINESS_1][ICON_GOLD]'
		-- ELSE 'TXT_KEY_LEADER_TCM_JOAO_II' END) 
	-- WHERE Type = 'LEADER_TCM_JOAO_II';
-- END;
--==========================================================================================================================
-- BrutalSamurai's Ethnic Units/Gedemon's R.E.D.
--==========================================================================================================================
-- Civilizations
------------------------------	
UPDATE Civilizations 
SET ArtStyleSuffix = (CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = '_PORTUGAL' )
	THEN '_PORTUGAL'
	ELSE '_EURO' END) 
WHERE Type = 'CIVILIZATION_TCM_AVIS_PORTUGAL';
--==========================================================================================================================
-- Gedemon's YnAEMP
--==========================================================================================================================
--==========================================================================================================================
-- Civilizations_YagemStartPosition (Earth Giant)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_YagemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YagemStartPosition
			(Type,								X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_TCM_AVIS_PORTUGAL',	5,		55,		null,	null);
--==========================================================================================================================
-- Civilizations_YahemStartPosition (Earth Huge)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_YahemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YahemStartPosition
			(Type,								X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_TCM_AVIS_PORTUGAL',	53,		54,		null,	null);
--==========================================================================================================================
-- Civilizations_CordiformStartPosition (Earth Standard)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_CordiformStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_CordiformStartPosition
			(Type,								X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_TCM_AVIS_PORTUGAL',	14,		26,		null,	null);
--==========================================================================================================================
-- Civilizations_GreatestEarthStartPosition (Earth Greatest)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_GreatestEarthStartPosition
			(Type,								X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_TCM_AVIS_PORTUGAL',	33,		37,		null,	null);
--==========================================================================================================================
-- Civilizations_EuroGiantStartPosition
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_EuroGiantStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_EuroGiantStartPosition
			(Type,								X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_TCM_AVIS_PORTUGAL',	5,		38,		null,	null);
--==========================================================================================================================
-- Civilizations_AmericasStartPosition
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_AmericasStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_AmericasStartPosition
			(Type,								X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_TCM_AVIS_PORTUGAL',	59,		26,		null,	null);
--==========================================================================================================================
-- Civilizations_MediterraneanStartPosition
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_MediterraneanStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_MediterraneanStartPosition
			(Type,								X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_TCM_AVIS_PORTUGAL',	1,		40,		null,	null);
--==========================================================================================================================
-- Civilizations_NorthAtlanticStartPosition
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_NorthAtlanticStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_NorthAtlanticStartPosition
			(Type,								X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_TCM_AVIS_PORTUGAL',	80,		5,		null,	null);
--==========================================================================================================================
-- Civilizations_YagemRequestedResource (Earth Giant)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_YagemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YagemRequestedResource
			(Type, 								Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_TCM_AVIS_PORTUGAL'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YagemRequestedResource WHERE Type = 'CIVILIZATION_PORTUGAL';
--==========================================================================================================================
-- Civilizations_YahemRequestedResource
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_YahemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YahemRequestedResource
			(Type, 								Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_TCM_AVIS_PORTUGAL'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YahemRequestedResource WHERE Type = 'CIVILIZATION_PORTUGAL';
--==========================================================================================================================
-- Civilizations_GreatestEarthRequestedResource 
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_GreatestEarthRequestedResource
			(Type, 								Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_TCM_AVIS_PORTUGAL'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE Type = 'CIVILIZATION_PORTUGAL';
--==========================================================================================================================
-- Hazel's Map Labels
--==========================================================================================================================
-- ML_CivCultures
------------------------------	
CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
			(CivType,							CultureType,	CultureEra)
VALUES		('CIVILIZATION_TCM_AVIS_PORTUGAL',	'EUROPEAN',		'ANY');
--==========================================================================================================================
-- JFD's CITIES IN DEVELOPMENT (10e9728f-d61c-4317-be4f-7d52d6bae6f4)
--==========================================================================================================================
------------------------------------------------------------
-- Civilization_JFD_ColonialCityNames
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_ColonialCityNames (
	CivilizationType 							text 	REFERENCES Civilizations(Type) 		default null,
	ColonyName 									text										default null,
	LinguisticType								text										default	null,
	CultureType									text										default	null);
/*
JFD_Germanic, JFD_Latinate, JFD_Tai_Khmer, JFD_Austronesian, JFD_Arabic, JFD_Slavic, JFD_Mesopotamian, JFD_Mesoamerican, JFD_Oriental,
JFD_Finno_Ugric, JFD_Semitic, JFD_Hellenic, JFD_Bantu, JFD_Songhay, JFD_Indo_Iranian, JFD_Altaic, JFD_Celtic, JFD_NorthAmerican, JFD_Quechumaran
*/
INSERT INTO Civilization_JFD_ColonialCityNames
		(CivilizationType, 							ColonyName,									LinguisticType)
VALUES	('CIVILIZATION_TCM_AVIS_PORTUGAL', 			null,										'JFD_Latinate'),
		('CIVILIZATION_TCM_AVIS_PORTUGAL', 			'TXT_KEY_COLONY_NAME_TCM_AVIS_PORTUGAL_01',	null),
		('CIVILIZATION_TCM_AVIS_PORTUGAL', 			'TXT_KEY_COLONY_NAME_TCM_AVIS_PORTUGAL_02',	null),
		('CIVILIZATION_TCM_AVIS_PORTUGAL', 			'TXT_KEY_COLONY_NAME_TCM_AVIS_PORTUGAL_03',	null),
		('CIVILIZATION_TCM_AVIS_PORTUGAL', 			'TXT_KEY_COLONY_NAME_TCM_AVIS_PORTUGAL_04',	null),
		('CIVILIZATION_TCM_AVIS_PORTUGAL', 			'TXT_KEY_COLONY_NAME_TCM_AVIS_PORTUGAL_05',	null),
		('CIVILIZATION_TCM_AVIS_PORTUGAL', 			'TXT_KEY_COLONY_NAME_TCM_AVIS_PORTUGAL_06',	null),
		('CIVILIZATION_TCM_AVIS_PORTUGAL', 			'TXT_KEY_COLONY_NAME_TCM_AVIS_PORTUGAL_07',	null),
		('CIVILIZATION_TCM_AVIS_PORTUGAL', 			'TXT_KEY_COLONY_NAME_TCM_AVIS_PORTUGAL_08',	null),
		('CIVILIZATION_TCM_AVIS_PORTUGAL', 			'TXT_KEY_COLONY_NAME_TCM_AVIS_PORTUGAL_09',	null),
		('CIVILIZATION_TCM_AVIS_PORTUGAL', 			'TXT_KEY_COLONY_NAME_TCM_AVIS_PORTUGAL_10',	null),
		('CIVILIZATION_TCM_AVIS_PORTUGAL', 			'TXT_KEY_COLONY_NAME_TCM_AVIS_PORTUGAL_11',	null),
		('CIVILIZATION_TCM_AVIS_PORTUGAL', 			'TXT_KEY_COLONY_NAME_TCM_AVIS_PORTUGAL_12',	null),
		('CIVILIZATION_TCM_AVIS_PORTUGAL', 			'TXT_KEY_COLONY_NAME_TCM_AVIS_PORTUGAL_13',	null),
		('CIVILIZATION_TCM_AVIS_PORTUGAL', 			'TXT_KEY_COLONY_NAME_TCM_AVIS_PORTUGAL_14',	null),
		('CIVILIZATION_TCM_AVIS_PORTUGAL', 			'TXT_KEY_COLONY_NAME_TCM_AVIS_PORTUGAL_15',	null);
------------------------------------------------------------
-- Flavors
------------------------------------------------------------	
INSERT OR REPLACE INTO Flavors 
		(Type)
VALUES	('FLAVOR_JFD_SLAVERY');
------------------------------------------------------------
-- Leader_Flavors
------------------------------------------------------------	
--A value of 0-10 may be set. This value determines the proclivity a civ has toward enslaving a captured city and toward spending Slavery on Units.
INSERT INTO Leader_Flavors
		(LeaderType,			FlavorType,					Flavor)
VALUES	('LEADER_TCM_JOAO_II',	'FLAVOR_JFD_SLAVERY',		9);
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
/*
CultureTypes:
  JFD_Andean, JFD_Bantu, JFD_Bharata, JFD_Central, JFD_Colonial, JFD_Eastern, JFD_Islamic, JFD_Katuje, JFD_Mandala, JFD_Mediterranean, JFD_Mesoamerican, JFD_Mesopotamic, JFD_Northern, JFD_Oceanic, JFD_Oriental, JFD_Polar, JFD_Sahul, JFD_Semitic, JFD_Steppe, JFD_Southern, JFD_TribalAmerican, JFD_Totalitarian, JFD_WestAfrican, JFD_Western

SplashScreenTags (As above, unless otherwise specified)
  JFD_ColonialLatin, JFD_NorthernCeltic, JFD_OrientalJapanese, JFD_SouthernPapal
  
SoundtrackTag (As above, unless otherwise specified)
  JFD_MesopotamicEgyptian, JFD_NorthernCeltic, JFD_OrientalJapanese
  
 UnitDialogueTag
	AS2D_SOUND_JFD_AMERICAN, AS2D_SOUND_JFD_AMERICAN_WEST, AS2D_SOUND_JFD_ALBANIAN*, AS2D_SOUND_JFD_ARABIC, AS2D_SOUND_JFD_AZTEC, AS2D_SOUND_JFD_BABYLONIAN, AS2D_SOUND_JFD_BERBER*, AS2D_SOUND_JFD_BYZANTINE, AS2D_SOUND_JFD_CARTHAGINIAN, AS2D_SOUND_JFD_CELTIC, AS2D_SOUND_JFD_CHINESE, AS2D_SOUND_JFD_COMANCHE*, AS2D_SOUND_JFD_DUTCH, AS2D_SOUND_JFD_EGYPTIAN, AS2D_SOUND_JFD_ENGLISH, AS2D_SOUND_JFD_ETHIOPIAN, AS2D_SOUND_JFD_FINNISH*, AS2D_SOUND_JFD_FRENCH, AS2D_SOUND_JFD_GAELIC*, AS2D_SOUND_JFD_GERMAN, AS2D_SOUND_JFD_GREEK, AS2D_SOUND_JFD_HOLY_ROMAN, AS2D_SOUND_JFD_HUNNIC, AS2D_SOUND_JFD_INCAN, AS2D_SOUND_JFD_INDIAN, AS2D_SOUND_JFD_ITALIAN, AS2D_SOUND_JFD_JAPANESE, AS2D_SOUND_JFD_KHMER, AS2D_SOUND_JFD_KOREAN, AS2D_SOUND_JFD_MALINESE, AS2D_SOUND_JFD_MAMLUKE*, AS2D_SOUND_JFD_MAYAN, AS2D_SOUND_JFD_MONGOL, AS2D_SOUND_JFD_NATIVE_AMERICAN (Mohawk), AS2D_SOUND_JFD_OTTOMAN, AS2D_SOUND_JFD_PERSIAN, AS2D_SOUND_JFD_POLISH, AS2D_SOUND_JFD_PORTUGUESE, AS2D_SOUND_JFD_ROMAN, AS2D_SOUND_JFD_RUSSIAN, AS2D_SOUND_JFD_SIAMESE, AS2D_SOUND_JFD_SPANISH, AS2D_SOUND_JFD_SUMERIAN, AS2D_SOUND_JFD_SWEDISH, AS2D_SOUND_JFD_TUPI*, AS2D_SOUND_JFD_VIKING, AS2D_SOUND_JFD_ZAPOTEC*, AS2D_SOUND_JFD_ZULU
	
	*Recommended to only use for Mercenary Units, as these have fewer tracks.
*/

-- This is an example of support which copies all attributes from an existing civ (i.e. Denmark). For the most part, this is probably all you'll need; just change 'CIVILIZATION_JFD_NORWAY' to the
-- tag of your custom civ. 
INSERT INTO Civilization_JFD_CultureTypes
		(CivilizationType,					ArtDefineTag, CultureType, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag)
SELECT	'CIVILIZATION_TCM_AVIS_PORTUGAL',	ArtDefineTag, CultureType, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_PORTUGAL';

UPDATE Civilizations 
SET SoundtrackTag = 'JFD_Western'
WHERE Type = 'CIVILIZATION_TCM_AVIS_PORTUGAL'
AND EXISTS (SELECT * FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Western');
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
--A value of 0-10 may be set. This value determines the likelihood that a leader will take out Mercenary Contracts (provided they have the funds).
--A value of 10 means this civilization will always take a Contract if available. A value of 0 means this civilization will never take out a contract.
INSERT INTO Leader_Flavors
		(LeaderType,			FlavorType,					Flavor)
VALUES	('LEADER_TCM_JOAO_II',	'FLAVOR_JFD_MERCENARY',		8);
--==========================================================================================================================	
-- JFD's RISE TO POWER: PIETY (eea66053-7579-481a-bb8d-2f3959b59974)
--==========================================================================================================================	
-- Flavors
------------------------------------------------------------	
INSERT OR REPLACE INTO Flavors 
		(Type)
VALUES	('FLAVOR_JFD_RELIGIOUS_INTOLERANCE');
------------------------------------------------------------
-- Leader_Flavors
------------------------------------------------------------	
--A value of 0-12 may be set. This value determines the diplomatic penalty/bonus with civilizations of a different/same state religion
--A value higher than 9 means this civilization will never secularise. A value of 0 means this civilization has no interest in State Religion.
INSERT INTO Leader_Flavors
		(LeaderType,			FlavorType,								Flavor)
VALUES	('LEADER_TCM_JOAO_II',	'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',		6);
--==========================================================================================================================	
-- JFD's RISE TO POWER: PROSPERITY (eea66053-7579-481a-bb8d-2f3959b59974)
--==========================================================================================================================	
-- Civilization_JFD_Currencies
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_Currencies (
	CivilizationType  				text 		REFERENCES Civilizations(Type) 	default null,
	CurrencyType	  				text 		  								default null);

INSERT INTO Civilization_JFD_Currencies
		(CivilizationType,					CurrencyType)
SELECT	'CIVILIZATION_TCM_AVIS_PORTUGAL',	CurrencyType
FROM Civilization_JFD_Currencies WHERE CivilizationType = 'CIVILIZATION_PORTUGAL';
--==========================================================================================================================
-- POUAKAI ENLIGHTENMENT ERA
--==========================================================================================================================
-- Civilization_UnitClassOverrides
------------------------------
UPDATE Civilization_UnitClassOverrides
SET UnitClassType = 'UNITCLASS_EE_CARRACK'
WHERE CivilizationType = 'CIVILIZATION_TCM_AVIS_PORTUGAL' AND UnitType = 'UNIT_PORTUGUESE_NAU'
AND EXISTS (SELECT * FROM Units WHERE Type = 'UNIT_EE_CARRACK');

UPDATE Civilization_UnitClassOverrides
SET UnitClassType = 'UNITCLASS_EE_SKIRMISHER'
WHERE CivilizationType = 'CIVILIZATION_PORTUGAL' AND UnitType = 'UNIT_TCM_CACADOR'
AND EXISTS (SELECT * FROM Units WHERE Type = 'UNIT_EE_SKIRMISHER');
------------------------------
-- Unit_ClassUpgrades
------------------------------
UPDATE Unit_ClassUpgrades
SET UnitClassType = 'UNITCLASS_EE_GALLEON'
WHERE UnitType = 'UNIT_PORTUGUESE_NAU'
AND EXISTS (SELECT * FROM Units WHERE Type = 'UNIT_EE_CARRACK');

UPDATE Unit_ClassUpgrades
SET UnitClassType = 'UNITCLASS_GATLINGGUN'
WHERE UnitType = 'UNIT_TCM_CACADOR'
AND EXISTS (SELECT * FROM Units WHERE Type = 'UNIT_EE_SKIRMISHER');
------------------------------
-- Units
------------------------------
UPDATE Units
SET ObsoleteTech = 'TECH_EE_EXPLORATION', Class = 'UNITCLASS_EE_CARRACK', PrereqTech = 'TECH_COMPASS', Combat = 18, Cost = 120
WHERE Type = 'UNIT_PORTUGUESE_NAU'
AND EXISTS (SELECT * FROM Units WHERE Type = 'UNIT_EE_CARRACK');

UPDATE Units
SET ObsoleteTech = 'TECH_INDUSTRIALIZATION', Class = 'UNITCLASS_EE_SKIRMISHER', PrereqTech = 'TECH_EE_FLINTLOCK', Combat = 25, RangedCombat = 25, Cost = 185, FaithCost = 370
WHERE Type = 'UNIT_TCM_CACADOR'
AND EXISTS (SELECT * FROM Units WHERE Type = 'UNIT_EE_SKIRMISHER');
------------------------------
-- Civilization_BuildingClassOverrides
------------------------------	
UPDATE Civilization_BuildingClassOverrides
SET BuildingClassType = 'BUILDINGCLASS_EE_MENAGERIE'
WHERE CivilizationType = 'CIVILIZATION_PORTUGAL'
AND EXISTS (SELECT * FROM Technologies WHERE Type = 'TECH_EE_FLINTLOCK');
------------------------------
-- Buildings
------------------------------
UPDATE Buildings
SET FreeStartEra = 'ERA_FUTURE', BuildingClass = 'BUILDINGCLASS_EE_MENAGERIE', PrereqTech = 'TECH_EE_ROMANTICISM', Cost = 300, Happiness = 3, GoldMaintenance = 2
WHERE Type = 'BUILDING_TCM_WINERY'
AND EXISTS (SELECT * FROM Units WHERE Type = 'UNIT_EE_CARRACK');
------------------------------
-- Building_ClassesNeededInCity
------------------------------
UPDATE Building_ClassesNeededInCity
SET BuildingClassType = 'BUILDINGCLASS_EE_TAVERN'
WHERE BuildingType = 'BUILDING_TCM_WINERY'
AND EXISTS (SELECT * FROM Units WHERE Type = 'UNIT_EE_CARRACK');
--==========================================================================================================================
-- Sukritact's Decisions
--==========================================================================================================================
-- DecisionsAddin_Support
------------------------------
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
INSERT INTO DecisionsAddin_Support (FileName) VALUES ('tcm_Portugal_Decisions.lua');
--==========================================================================================================================
-- Sukritact's Events
--==========================================================================================================================
-- EventsAddin_Support
------------------------------
CREATE TABLE IF NOT EXISTS EventsAddin_Support(FileName);
INSERT INTO EventsAddin_Support (FileName) VALUES ('tcm_Portugal_Events.lua');
------------------------------
-- GreatWorks
------------------------------
INSERT INTO GreatWorks 
			(Type, 								GreatWorkClassType,	 		Description,							 Quote,												Image)
VALUES		('GREAT_WORK_EVENT_TCM_LUSIADS', 	'GREAT_WORK_LITERATURE',	 'TXT_KEY_GREAT_WORK_EVENT_TCM_LUSIADS', 'TXT_KEY_GREAT_WORK_EVENT_QUOTE_TCM_LUSIADS',		'GreatWriter_Background.dds');
------------------------------
-- Units
------------------------------
INSERT INTO Units 	
			(Type, 				 Class, Moves, Special, Domain, Description, ShowInPedia,  UnitArtInfoEraVariation, UnitArtInfo, UnitFlagIconOffset, UnitFlagAtlas, PortraitIndex, IconAtlas)
SELECT		('UNIT_TCM_CAMOES'), Class, Moves, Special, Domain, Description, 0,			  UnitArtInfoEraVariation, UnitArtInfo, UnitFlagIconOffset,	UnitFlagAtlas, PortraitIndex, IconAtlas
FROM Units WHERE (Type = 'UNIT_WRITER');
------------------------------
-- Unit_UniqueNames
------------------------------
INSERT INTO Unit_UniqueNames 
			(UnitType, 				UniqueName,				GreatWorkType)
VALUES		('UNIT_TCM_CAMOES', 	'TXT_KEY_EVENT_CAMOES',	'GREAT_WORK_EVENT_TCM_LUSIADS');
---------------------
INSERT INTO Policies
			(Type, 										Description)
VALUES		('POLICY_TCM_PORTUGAL_BRAZIL_PREFAB', 		'TXT_KEY_DECISIONS_TCM_PORTUGAL_BRAZIL_PREFAB'),
			('POLICY_TCM_PORTUGAL_BRAZIL_WINE', 		'TXT_KEY_DECISIONS_TCM_PORTUGAL_BRAZIL_WINE');

INSERT INTO Policy_ImprovementYieldChanges
			(PolicyType, 						ImprovementType,			YieldType,		Yield)
VALUES		('POLICY_TCM_PORTUGAL_BRAZIL_WINE', 'IMPROVEMENT_PLANTATION',	'YIELD_GOLD',	2);
---------------------
INSERT INTO BuildingClasses 	
			(Type, 						 						DefaultBuilding, 								Description)
VALUES		('BUILDINGCLASS_TCM_PORTUGAL_BRAZIL_TRADE_ROUTE', 	'BUILDING_TCM_PORTUGAL_BRAZIL_TRADE_ROUTE', 	'TXT_KEY_DECISIONS_TCM_PORTUGAL_BRAZIL_PREFAB');

INSERT INTO Buildings 	
			(Type, 											BuildingClass, 										NumTradeRouteBonus,	GreatWorkCount, Cost, FaithCost, NukeImmune, ConquestProb,  PrereqTech,	Description, 										Help,											PortraitIndex, 	IconAtlas)
VALUES		('BUILDING_TCM_PORTUGAL_BRAZIL_TRADE_ROUTE',	'BUILDINGCLASS_TCM_PORTUGAL_BRAZIL_TRADE_ROUTE',	1,					-1, 			-1,   -1, 		 1,		 	 0,				NULL, 		'TXT_KEY_DECISIONS_TCM_PORTUGAL_BRAZIL_PREFAB', 	'TXT_KEY_DECISIONS_TCM_PORTUGAL_BRAZIL_PREFAB',	0, 				'TCM_AVIS_PORTUGAL_ATLAS');
---------------------
-- DELETE FROM Civilization_FreePolicies WHERE CivilizationType = 'CIVILIZATION_PORTUGAL';