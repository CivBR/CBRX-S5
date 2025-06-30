--Decisions
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
INSERT INTO DecisionsAddin_Support (FileName) VALUES ('TomatekhNorteChicoDecisions.lua');

--Ethnic Units
UPDATE Civilizations SET ArtStyleSuffix = 
	( CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = "_INCA")
		THEN "_INCA"
		ELSE "_AMER" END
	) WHERE Type = "CIVILIZATION_NORTE_CHICO_MOD";

--Map Labels
CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
			(CivType,									  CultureType,	CultureEra)
VALUES		('CIVILIZATION_NORTE_CHICO_MOD',		'FIRST_AMERICANS',		 'ANY'),
			('CIVILIZATION_NORTE_CHICO_MOD',  'MOD_TP_SOUTH_AMERICAN',	  'MODERN');

--Nazca
UPDATE Features SET Description =
	( CASE WHEN EXISTS(SELECT Type FROM Civilizations WHERE Type="CIVILIZATION_NAZCA" )
		THEN "TXT_KEY_FEATURE_CARAL_MOD_FOSSIL_WATER_MOD"
		ELSE "TXT_KEY_FEATURE_CARAL_MOD_FOSSIL_WATER" END
    ) WHERE Type = "FEATURE_ANCIENT_LIBYAN_MOD_FOSSIL_WATER";

UPDATE Features SET Civilopedia =
	( CASE WHEN EXISTS(SELECT Type FROM Civilizations WHERE Type="CIVILIZATION_NAZCA" )
		THEN "TXT_KEY_FEATURE_CARAL_MOD_FOSSIL_WATER_MOD_TEXT"
		ELSE "TXT_KEY_FEATURE_CARAL_MOD_FOSSIL_WATER_TEXT" END
    ) WHERE Type = "FEATURE_ANCIENT_LIBYAN_MOD_FOSSIL_WATER";

CREATE TRIGGER CaralNazcaAquifer
AFTER INSERT ON Civilizations WHEN 'CIVILIZATION_NAZCA' = NEW.Type
BEGIN

	UPDATE Features SET Description =
		( CASE WHEN EXISTS(SELECT Type FROM Civilizations WHERE Type="CIVILIZATION_NAZCA" )
			THEN "TXT_KEY_FEATURE_CARAL_MOD_FOSSIL_WATER_MOD"
			ELSE "TXT_KEY_FEATURE_CARAL_MOD_FOSSIL_WATER" END
		) WHERE Type = "FEATURE_ANCIENT_LIBYAN_MOD_FOSSIL_WATER";

	UPDATE Features SET Civilopedia =
		( CASE WHEN EXISTS(SELECT Type FROM Civilizations WHERE Type="CIVILIZATION_NAZCA" )
			THEN "TXT_KEY_FEATURE_CARAL_MOD_FOSSIL_WATER_MOD_TEXT"
			ELSE "TXT_KEY_FEATURE_CARAL_MOD_FOSSIL_WATER_TEXT" END
		) WHERE Type = "FEATURE_ANCIENT_LIBYAN_MOD_FOSSIL_WATER";

END;

UPDATE Features SET Description =
	( CASE WHEN EXISTS(SELECT Type FROM Civilizations WHERE Type="CIVILIZATION_MC_NAZCA" )
		THEN "TXT_KEY_FEATURE_CARAL_MOD_FOSSIL_WATER_MOD"
		ELSE "TXT_KEY_FEATURE_CARAL_MOD_FOSSIL_WATER" END
    ) WHERE Type = "FEATURE_ANCIENT_LIBYAN_MOD_FOSSIL_WATER";

UPDATE Features SET Civilopedia =
	( CASE WHEN EXISTS(SELECT Type FROM Civilizations WHERE Type="CIVILIZATION_MC_NAZCA" )
		THEN "TXT_KEY_FEATURE_CARAL_MOD_FOSSIL_WATER_MOD_TEXT"
		ELSE "TXT_KEY_FEATURE_CARAL_MOD_FOSSIL_WATER_TEXT" END
    ) WHERE Type = "FEATURE_ANCIENT_LIBYAN_MOD_FOSSIL_WATER";

CREATE TRIGGER CaralMCNazcaAquifer
AFTER INSERT ON Civilizations WHEN 'CIVILIZATION_MC_NAZCA' = NEW.Type
BEGIN

	UPDATE Features SET Description =
		( CASE WHEN EXISTS(SELECT Type FROM Civilizations WHERE Type="CIVILIZATION_MC_NAZCA" )
			THEN "TXT_KEY_FEATURE_CARAL_MOD_FOSSIL_WATER_MOD"
			ELSE "TXT_KEY_FEATURE_CARAL_MOD_FOSSIL_WATER" END
		) WHERE Type = "FEATURE_ANCIENT_LIBYAN_MOD_FOSSIL_WATER";

	UPDATE Features SET Civilopedia =
		( CASE WHEN EXISTS(SELECT Type FROM Civilizations WHERE Type="CIVILIZATION_MC_NAZCA" )
			THEN "TXT_KEY_FEATURE_CARAL_MOD_FOSSIL_WATER_MOD_TEXT"
			ELSE "TXT_KEY_FEATURE_CARAL_MOD_FOSSIL_WATER_TEXT" END
		) WHERE Type = "FEATURE_ANCIENT_LIBYAN_MOD_FOSSIL_WATER";

END;

--JFD
CREATE TABLE IF NOT EXISTS 
JFD_GlobalUserSettings (
    Type                                        text                                        default null,
    Value                                       integer                                     default 1);

--Piety
INSERT OR REPLACE INTO Flavors
            (Type)
VALUES      ('FLAVOR_JFD_RELIGIOUS_INTOLERANCE');
 
INSERT INTO Leader_Flavors
            (LeaderType,									      FlavorType,    Flavor)
VALUES      ('LEADER_NORTE_CHICO_MOD',    'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',         6);

--Prestige
CREATE TABLE IF NOT EXISTS 
    Civilization_JFD_Governments (
    CivilizationType                text        REFERENCES Civilizations(Type)                  default null,
    -- CultureType                     text                                                        default null,
    -- LegislatureName                 text                                                        default null,
    -- OfficeTitle                     text                                                        default null,
    GovernmentType                  text                                                        default null,
    Weight                          integer                                                     default 0);

CREATE TABLE IF NOT EXISTS  
    Civilization_JFD_HeadsOfGovernment (    
    CivilizationType                text        REFERENCES Civilizations(Type)                  default null,
    CultureType                     text                                                        default null,
    HeadOfGovernmentName            text                                                        default null);

CREATE TABLE IF NOT EXISTS 
    Civilization_JFD_Titles (
    CivilizationType                text        REFERENCES Civilizations(Type)                  default null,
    CultureType                     text                                                        default null,
    ReligionType                    text        REFERENCES Religions(Type)                      default null,
    DefaultTitle                    text                                                        default null,
    UniqueTitle                     text                                                        default null,
    UseAdjective                    boolean                                                     default 0); 

CREATE TABLE IF NOT EXISTS 
    Civilization_JFD_Politics (
    CivilizationType                    text        REFERENCES Civilizations(Type)                  default null,
    PoliticsType                        text                                                        default null,
    UniqueName                          text                                                        default null);

INSERT INTO Civilization_JFD_Governments
        (CivilizationType,          	  GovernmentType, Weight)
SELECT  ('CIVILIZATION_NORTE_CHICO_MOD'), GovernmentType, Weight
FROM Civilization_JFD_Governments WHERE CivilizationType = 'CIVILIZATION_INCA';

INSERT INTO Civilization_JFD_HeadsOfGovernment
        (CivilizationType,          HeadOfGovernmentName)
SELECT  ('CIVILIZATION_NORTE_CHICO_MOD'), HeadOfGovernmentName
FROM Civilization_JFD_HeadsOfGovernment WHERE CivilizationType = 'CIVILIZATION_INCA';

INSERT INTO Civilization_JFD_Titles
        (CivilizationType,          DefaultTitle,   UniqueTitle)
SELECT  ('CIVILIZATION_NORTE_CHICO_MOD'), DefaultTitle,   UniqueTitle
FROM Civilization_JFD_Titles WHERE CivilizationType = 'CIVILIZATION_INCA';

INSERT INTO Civilization_JFD_Politics
        (CivilizationType,          PoliticsType, UniqueName)
SELECT  ('CIVILIZATION_NORTE_CHICO_MOD'), PoliticsType, UniqueName
FROM Civilization_JFD_Politics WHERE CivilizationType = 'CIVILIZATION_INCA';

INSERT OR REPLACE INTO Flavors 
        (Type)
VALUES  ('FLAVOR_JFD_REFORM_GOVERNMENT'),
        ('FLAVOR_JFD_REFORM_CULTURE'),
        ('FLAVOR_JFD_REFORM_ECONOMIC'),
        ('FLAVOR_JFD_REFORM_FOREIGN'),
        ('FLAVOR_JFD_REFORM_INDUSTRY'),
        ('FLAVOR_JFD_REFORM_MILITARY'),
        ('FLAVOR_JFD_REFORM_RELIGION');

INSERT INTO Leader_Flavors
        (LeaderType,							                FlavorType,                         Flavor)
VALUES  ('LEADER_NORTE_CHICO_MOD',			'FLAVOR_JFD_REFORM_GOVERNMENT',                              5),
        ('LEADER_NORTE_CHICO_MOD',			   'FLAVOR_JFD_REFORM_CULTURE',                              5),
        ('LEADER_NORTE_CHICO_MOD',			  'FLAVOR_JFD_REFORM_ECONOMIC',                              5),
        ('LEADER_NORTE_CHICO_MOD',			   'FLAVOR_JFD_REFORM_FOREIGN',                              5),
        ('LEADER_NORTE_CHICO_MOD',			  'FLAVOR_JFD_REFORM_INDUSTRY',                              5),
        ('LEADER_NORTE_CHICO_MOD',			  'FLAVOR_JFD_REFORM_RELIGION',                              8);

--Cultural Diversity
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_CultureTypes(
	CivilizationType 							text 	REFERENCES Civilizations(Type) 			default null,
	CultureType 								text											default null,
	ArtDefineTag								text											default	null,
	SplashScreenTag								text											default	null,
	SoundtrackTag								text											default	null,
	UnitDialogueTag								text											default null);

INSERT INTO Civilization_JFD_CultureTypes
		(CivilizationType,					ArtDefineTag, CultureType, SplashScreenTag, SoundtrackTag, UnitDialogueTag)
SELECT	('CIVILIZATION_NORTE_CHICO_MOD'),	ArtDefineTag, CultureType, SplashScreenTag, SoundtrackTag, UnitDialogueTag
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_INCA';

UPDATE Civilizations 
SET SoundtrackTag = 'JFD_Andean'
WHERE Type = 'CIVILIZATION_NORTE_CHICO_MOD'
AND EXISTS (SELECT * FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Andean')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);

--Civ IV Traits
CREATE TABLE IF NOT EXISTS 
    Leader_SharedTraits (
    LeaderType          text    REFERENCES Leaders(Type)        default null,
    TraitOne            text    REFERENCES Policies(Type)       default null,
    TraitTwo            text    REFERENCES Policies(Type)       default null);
     
INSERT OR REPLACE INTO Leader_SharedTraits
			(LeaderType,									          TraitOne,					 TraitTwo)
SELECT		('LEADER_NORTE_CHICO_MOD'),		            ('POLICY_SEAFARING_X'),	  ('POLICY_INDUSTRIOUS_X')
WHERE EXISTS (SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X');

UPDATE Leaders 
SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
	THEN 'Qhapaq[ICON_GREAT_EXPLORER][ICON_PRODUCTION]'
	ELSE 'TXT_KEY_LEADER_NORTE_CHICO_MOD_DESC' END) 
WHERE Type = 'LEADER_NORTE_CHICO_MOD';

CREATE TRIGGER CivIVTraitsCaral
AFTER INSERT ON Leaders WHEN 'LEADER_NORTE_CHICO_MOD' = NEW.Type
BEGIN
	UPDATE Leaders 
	SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
		THEN 'Qhapaq[ICON_GREAT_EXPLORER][ICON_PRODUCTION]'
		ELSE 'TXT_KEY_LEADER_NORTE_CHICO_MOD_DESC' END) 
	WHERE Type = 'LEADER_NORTE_CHICO_MOD';
END;	

--ExCE
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_ColonialCityNames (
	CivilizationType 							text 	REFERENCES Civilizations(Type) 		default null,
	ColonyName 									text										default null,
	LinguisticType								text										default	null,
	CultureType									text										default	null);

INSERT OR REPLACE INTO Civilization_JFD_ColonialCityNames
			(CivilizationType, 						ColonyName,								LinguisticType)
VALUES		('CIVILIZATION_NORTE_CHICO_MOD', 			null,								'JFD_Quechumaran');

CREATE TABLE IF NOT EXISTS 
Civilization_JFD_RevolutionaryCivilizationsToSpawn (
	CivilizationType 							text 	REFERENCES Civilizations(Type) 		default null,
	RevolutionaryCivilizationType 				text 	REFERENCES Civilizations(Type) 		default null);
	
INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,							RevolutionaryCivilizationType)
VALUES		('CIVILIZATION_NORTE_CHICO_MOD',			'CIVILIZATION_INCA');

INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,						RevolutionaryCivilizationType)
SELECT		('CIVILIZATION_NORTE_CHICO_MOD'),		('CIVILIZATION_QULLANA')
WHERE EXISTS (SELECT Type FROM Civilizations WHERE Type = 'CIVILIZATION_QULLANA');

INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,						RevolutionaryCivilizationType)
SELECT		('CIVILIZATION_NORTE_CHICO_MOD'),		('CIVILIZATION_NAZCA')
WHERE EXISTS (SELECT Type FROM Civilizations WHERE Type = 'CIVILIZATION_NAZCA');

INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,						RevolutionaryCivilizationType)
SELECT		('CIVILIZATION_NORTE_CHICO_MOD'),		('CIVILIZATION_MC_NAZCA')
WHERE EXISTS (SELECT Type FROM Civilizations WHERE Type = 'CIVILIZATION_MC_NAZCA');

--Mercenaries 
INSERT OR REPLACE INTO Flavors 
        (Type)
VALUES  ('FLAVOR_JFD_MERCENARY');

INSERT INTO Leader_Flavors
        (LeaderType,									 FlavorType,                 Flavor)
VALUES  ('LEADER_NORTE_CHICO_MOD',           'FLAVOR_JFD_MERCENARY',                      0);

--Cultural Developments
CREATE TABLE IF NOT EXISTS 
Events_CulturalDevelopments(
	CivilizationType		text  REFERENCES Civilizations(Type)	default null,
	CultureType				text									default null,
	Description				text									default null);

INSERT INTO Events_CulturalDevelopments 
			(Description,								                      CivilizationType,						          CultureType)
VALUES		('TXT_KEY_EVENT_CULDEV_TOMATEKH_CARAL_01',			'CIVILIZATION_NORTE_CHICO_MOD',					             'JFD_Andean');

--RtP
-- INSERT INTO Builds     
        -- (Type,                                    Description, Help, DisabledHelp, Recommendation,    HotKey,    HotKeyAlt,     HotKeyPriority, HotKeyPriorityAlt, OrderPriority,     AltDown, AltDownAlt, ShiftDown, ShiftDownAlt, CtrlDown, CtrlDownAlt, Time, Cost, CostIncreasePerImprovement, Kill, Repair, RemoveRoute, Water, CanBeEmbarked, PrereqTech, ImprovementType, RouteType, EntityEvent, IconIndex, IconAtlas, ShowInPedia, ShowInTechTree)
-- SELECT  ('BUILD_JFD_CARAL_WHALE_BOATS'),          Description, Help, DisabledHelp, Recommendation,    HotKey,    HotKeyAlt,     HotKeyPriority, HotKeyPriorityAlt, OrderPriority,     AltDown, AltDownAlt, ShiftDown, ShiftDownAlt, CtrlDown, CtrlDownAlt,  400, Cost, CostIncreasePerImprovement,    0, Repair, RemoveRoute, Water,             1, PrereqTech, ImprovementType, RouteType, EntityEvent, IconIndex, IconAtlas,           0,               0
-- FROM Builds WHERE (Type = 'BUILD_JFD_WHALE_BOATS')
-- AND EXISTS (SELECT Type FROM Builds WHERE Type = 'BUILD_JFD_WHALE_BOATS');

-- INSERT INTO Unit_Builds 
		-- (UnitType,							       BuildType)
-- SELECT	('UNIT_NORTE_CHICO_MOD'),          ('BUILD_JFD_CARAL_WHALE_BOATS')
-- WHERE EXISTS (SELECT Type FROM Builds WHERE Type = 'BUILD_JFD_WHALE_BOATS');

-- CREATE TRIGGER CaralRtPStuff
-- AFTER INSERT ON Builds WHEN 'BUILD_JFD_WHALE_BOATS' = NEW.Type
-- BEGIN

	-- INSERT INTO Builds     
			-- (Type,                                    Description, Help, DisabledHelp, Recommendation,    HotKey,    HotKeyAlt,     HotKeyPriority, HotKeyPriorityAlt, OrderPriority,     AltDown, AltDownAlt, ShiftDown, ShiftDownAlt, CtrlDown, CtrlDownAlt, Time, Cost, CostIncreasePerImprovement, Kill, Repair, RemoveRoute, Water, CanBeEmbarked, PrereqTech, ImprovementType, RouteType, EntityEvent, IconIndex, IconAtlas, ShowInPedia, ShowInTechTree)
	-- SELECT  ('BUILD_JFD_CARAL_WHALE_BOATS'),          Description, Help, DisabledHelp, Recommendation,    HotKey,    HotKeyAlt,     HotKeyPriority, HotKeyPriorityAlt, OrderPriority,     AltDown, AltDownAlt, ShiftDown, ShiftDownAlt, CtrlDown, CtrlDownAlt,  400, Cost, CostIncreasePerImprovement,    0, Repair, RemoveRoute, Water,             1, PrereqTech, ImprovementType, RouteType, EntityEvent, IconIndex, IconAtlas,           0,               0
	-- FROM Builds WHERE (Type = 'BUILD_JFD_WHALE_BOATS')
	-- AND EXISTS (SELECT Type FROM Builds WHERE Type = 'BUILD_JFD_WHALE_BOATS');

	-- INSERT INTO Unit_Builds 
			-- (UnitType,							       BuildType)
	-- SELECT	('UNIT_NORTE_CHICO_MOD'),          ('BUILD_JFD_CARAL_WHALE_BOATS')
	-- WHERE EXISTS (SELECT Type FROM Builds WHERE Type = 'BUILD_JFD_WHALE_BOATS');

-- END;	

--CiD
-- INSERT INTO Unit_ClassUpgrades
		-- (UnitType, 			UnitClassType)
-- SELECT 	'UNIT_NORTE_CHICO_MOD',		'UNITCLASS_JFD_WORKER'
-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_CORE' AND Value = 1);

-- DELETE FROM Unit_Builds WHERE UnitType = 'UNIT_NORTE_CHICO_MOD' AND BuildType = 'BUILD_RAILROAD'
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_CORE' AND Value = 1);

-- UPDATE Units
-- SET Cost = 50, UnitArtInfoEraVariation = 0, ExtraMaintenanceCost = 0, ObsoleteTech = 'TECH_INDUSTRIALIZATION', PrereqTech = 'TECH_AGRICULTURE', WorkRate = 75
-- WHERE Type = 'UNIT_NORTE_CHICO_MOD'
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_UNIT_ADDITIONS_SLAVE_WORKER' AND Value = 1);

-- CREATE TRIGGER CaralSlavesAndStuff
-- AFTER INSERT ON Units WHEN 'UNIT_JFD_SLAVE' = NEW.Type
-- BEGIN

	-- INSERT INTO Unit_ClassUpgrades
			-- (UnitType, 			UnitClassType)
	-- SELECT 	'UNIT_NORTE_CHICO_MOD',		'UNITCLASS_JFD_WORKER'
	-- WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_CORE' AND Value = 1);

	-- DELETE FROM Unit_Builds WHERE UnitType = 'UNIT_NORTE_CHICO_MOD' AND BuildType = 'BUILD_RAILROAD'
	-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_CORE' AND Value = 1);

	-- UPDATE Units
	-- SET Cost = 50, UnitArtInfoEraVariation = 0, ExtraMaintenanceCost = 0, ObsoleteTech = 'TECH_INDUSTRIALIZATION', PrereqTech = 'TECH_AGRICULTURE', WorkRate = 75
	-- WHERE Type = 'UNIT_NORTE_CHICO_MOD'
	-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_SLAVERY_UNIT_ADDITIONS_SLAVE_WORKER' AND Value = 1);

-- END;

-- CREATE TABLE IF NOT EXISTS
    -- Build_JFD_ChargeCosts (
    -- BuildType                                                    text                                             default null,
    -- UnitType                                                    text     REFERENCES Units(Type)                 default null,
    -- ChargeCost                                                  integer                                            default 0,
    -- RequiresPolicy                                              text     REFERENCES Policies(Type)                 default null);

-- INSERT INTO Build_JFD_ChargeCosts 
			-- (BuildType,								                      UnitType,				      ChargeCost)
-- VALUES		('BUILD_OFFSHORE_PLATFORM_CARAL_MOD',			'UNIT_NORTE_CHICO_MOD',					           1),
			-- ('BUILD_FISHING_BOATS_CARAL_MOD',				'UNIT_NORTE_CHICO_MOD',					           1);

-- INSERT INTO Build_JFD_ChargeCosts 
			-- (BuildType,								    UnitType,				      ChargeCost)
-- SELECT		('BUILD_JFD_CARAL_WHALE_BOATS'),				('UNIT_NORTE_CHICO_MOD'),			  1
-- WHERE EXISTS (SELECT Type FROM Builds WHERE Type = 'BUILD_JFD_WHALE_BOATS');

-- UPDATE Builds
-- SET Time = null
-- WHERE Type IN (SELECT BuildType FROM Unit_Builds WHERE UnitType = 'UNIT_NORTE_CHICO_MOD' AND BuildType NOT IN ('BUILD_ROAD', 'BUILD_RAILROAD', 'BUILD_REMOVE_ROUTE', 'BUILD_REPAIR'))
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_BUILD_CHARGES' AND Value = 1)
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_BUILD_CHARGES_EXCLUDES_REMOVING' AND Value = 0);

-- UPDATE Builds
-- SET Time = null
-- WHERE Type IN (SELECT BuildType FROM Unit_Builds WHERE UnitType = 'UNIT_NORTE_CHICO_MOD' AND BuildType NOT IN ('BUILD_ROAD', 'BUILD_RAILROAD', 'BUILD_REMOVE_ROUTE', 'BUILD_REPAIR', 'BUILD_REMOVE_JUNGLE', 'BUILD_REMOVE_FOREST', 'BUILD_REMOVE_MARSH', 'BUILD_SCRUB_FALLOUT'))
-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_BUILD_CHARGES_EXCLUDES_REMOVING' AND Value = 1);

-- CREATE TRIGGER CaralChargeStuff
-- AFTER INSERT ON Units WHEN 'UNIT_JFD_WORKER' = NEW.Type
-- BEGIN

	-- INSERT INTO Build_JFD_ChargeCosts 
				-- (BuildType,								                      UnitType,				      ChargeCost)
	-- VALUES		('BUILD_OFFSHORE_PLATFORM_CARAL_MOD',			'UNIT_NORTE_CHICO_MOD',					           1),
				-- ('BUILD_FISHING_BOATS_CARAL_MOD',				'UNIT_NORTE_CHICO_MOD',					           1);

	-- INSERT INTO Build_JFD_ChargeCosts 
				-- (BuildType,								    UnitType,				      ChargeCost)
	-- SELECT		('BUILD_JFD_CARAL_WHALE_BOATS'),				('UNIT_NORTE_CHICO_MOD'),			  1
	-- WHERE EXISTS (SELECT Type FROM Builds WHERE Type = 'BUILD_JFD_WHALE_BOATS');

	-- UPDATE Builds
	-- SET Time = null
	-- WHERE Type IN (SELECT BuildType FROM Unit_Builds WHERE UnitType = 'UNIT_NORTE_CHICO_MOD' AND BuildType NOT IN ('BUILD_ROAD', 'BUILD_RAILROAD', 'BUILD_REMOVE_ROUTE', 'BUILD_REPAIR'))
	-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_BUILD_CHARGES' AND Value = 1)
	-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_BUILD_CHARGES_EXCLUDES_REMOVING' AND Value = 0);

	-- UPDATE Builds
	-- SET Time = null
	-- WHERE Type IN (SELECT BuildType FROM Unit_Builds WHERE UnitType = 'UNIT_NORTE_CHICO_MOD' AND BuildType NOT IN ('BUILD_ROAD', 'BUILD_RAILROAD', 'BUILD_REMOVE_ROUTE', 'BUILD_REPAIR', 'BUILD_REMOVE_JUNGLE', 'BUILD_REMOVE_FOREST', 'BUILD_REMOVE_MARSH', 'BUILD_SCRUB_FALLOUT'))
	-- AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_MISC_BUILD_CHARGES_EXCLUDES_REMOVING' AND Value = 1);

-- END;