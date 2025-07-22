--------------------------------------------------------------------------------------------------------------------------
--==========================================================================================================================
-- MASTER TABLES
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS COMMUNITY (Type TEXT, Value INTEGER);
CREATE TABLE IF NOT EXISTS Civilization_JFD_ColonialCityNames(CivilizationType text, ColonyName text, LinguisticType text);
CREATE TABLE IF NOT EXISTS Civilization_JFD_Governments(CivilizationType text, CultureType text, LegislatureName text, OfficeTitle text, GovernmentType text, Weight integer);
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMP(CivilizationType, MapPrefix, X, Y, CapitalName, AltX, AltY, AltCapitalName);
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMPRequestedResources(CivilizationType, MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6);
CREATE TABLE IF NOT EXISTS MinorCivilizations_YnAEMP(MinorCivType, MapPrefix, X, Y, CapitalName, AltX, AltY, AltCapitalName);
CREATE TABLE IF NOT EXISTS JFD_Civilopedia_HideFromPedia(Type text);
CREATE TABLE IF NOT EXISTS JFD_GlobalUserSettings(Type text, Value integer default 1);

--==========================================================================================================================
-- UNITS
--==========================================================================================================================
----------------------------------------------------------------------------------------------------------------------------
-- Units
----------------------------------------------------------------------------------------------------------------------------
INSERT OR REPLACE INTO Units 	
		(Type, 					Class, PrereqTech, Combat, Cost, FaithCost,	RequiresFaithPurchaseEnabled, Moves, CombatClass, Domain, DefaultUnitAI, Description, 						Help, 									Strategy, 									Civilopedia, 							MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, ObsoleteTech, XPValueDefense, GoodyHutUpgradeUnitClass, UnitArtInfo, 						UnitFlagAtlas,									UnitFlagIconOffset, IconAtlas,								PortraitIndex, 	MoveRate)
SELECT	'UNIT_US_REVOLUTIONARY_GUARD', 	Class, PrereqTech, Combat, Cost, FaithCost,	RequiresFaithPurchaseEnabled, Moves, CombatClass, Domain, DefaultUnitAI, 'TXT_KEY_UNIT_US_REVOLUTIONARY_GUARD', 		'TXT_KEY_UNIT_US_REVOLUTIONARY_GUARD_HELP',		'TXT_KEY_UNIT_US_REVOLUTIONARY_GUARD_STRATEGY', 	'TXT_KEY_CIV5_REVOLUTIONARY_GUARD_TEXT', 		MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, ObsoleteTech, XPValueDefense, GoodyHutUpgradeUnitClass, 'ART_DEF_UNIT_US_REVOLUTIONARY_GUARD',		'US_FRANCE_FLAG_ATLAS',		0,					'US_FRANCE_ICON_ATLAS',	2, 				MoveRate				
FROM Units WHERE Type = 'UNIT_EE_LINE_INFANTRY'
AND EXISTS (SELECT * FROM Units WHERE Type = 'UNIT_EE_LINE_INFANTRY');	
----------------------------------------------------------------------------------------------------------------------------
-- Unit_ClassUpgrades
----------------------------------------------------------------------------------------------------------------------------
DELETE FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_US_REVOLUTIONARY_GUARD'
AND EXISTS (SELECT * FROM Units WHERE Type = 'UNIT_EE_LINE_INFANTRY');	
INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 					UnitClassType)
SELECT	'UNIT_US_REVOLUTIONARY_GUARD',		UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_EE_LINE_INFANTRY'
AND EXISTS (SELECT * FROM Units WHERE Type = 'UNIT_EE_LINE_INFANTRY');	
----------------------------------------------------------------------------------------------------------------------------
-- Civilization_UnitClassOverrides
----------------------------------------------------------------------------------------------------------------------------
UPDATE Civilization_UnitClassOverrides
SET UnitClassType = 'UNITCLASS_EE_LINE_INFANTRY'
WHERE CivilizationType = 'CIVILIZATION_US_FRANCE' AND UnitType = 'UNIT_US_REVOLUTIONARY_GUARD'
AND EXISTS (SELECT * FROM Units WHERE Type = 'UNIT_EE_LINE_INFANTRY');	
--==========================================================================================================================
-- JFDLC
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
-- GOVERNMENTS
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilization_JFD_Governments
		(CivilizationType, 				GovernmentType,				Weight)
VALUES	('CIVILIZATION_US_FRANCE', 	'GOVERNMENT_JFD_REVOLUTIONARY',	90),
		('CIVILIZATION_US_FRANCE', 	'GOVERNMENT_JFD_REPUBLIC',		10);

--------------------------------------------------------------------------------------------------------------------------
-- JFD'S CULTURAL DIVERSITY (31a31d1c-b9d7-45e1-842c-23232d66cd47)
--------------------------------------------------------------------------------------------------------------------------	
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
		(CivilizationType,						ArtDefineTag, CultureType, SubCultureType, DecisionsTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag)
SELECT	'CIVILIZATION_US_FRANCE',	ArtDefineTag, CultureType, SubCultureType, DecisionsTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_FRANCE';

UPDATE Civilizations 
SET SoundtrackTag = (SELECT SoundtrackTag FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_US_FRANCE')
WHERE Type = 'CIVILIZATION_US_FRANCE'
AND EXISTS (SELECT SoundID FROM Audio_Sounds WHERE SoundID = 'SND_JFD_ABORIGINAL_PEACE_01');
--==========================================================================================================================		
--==========================================================================================================================
-- GEDEMON R.E.D.
--==========================================================================================================================
-- Civilizations
--------------------------------------------------------------------------------------------------------------------------
UPDATE Civilizations 
SET ArtStyleSuffix = '_FRANCE'
WHERE Type = 'CIVILIZATION_US_FRANCE'
AND EXISTS (SELECT * FROM Civilizations WHERE ArtStyleSuffix = '_FRANCE');
----------------------------------------------------------------------------------------------------------------------------
-- Civilizations_YnAEMP
----------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMP(CivilizationType, MapPrefix, X, Y, CapitalName, AltX, AltY, AltCapitalName);
INSERT INTO Civilizations_YnAEMP
		(CivilizationType,						 MapPrefix,	X, Y, AltX,	AltY, AltCapitalName)
SELECT	'CIVILIZATION_US_FRANCE',	 MapPrefix,	X, Y, AltX,	AltY, AltCapitalName
FROM Civilizations_YnAEMP WHERE CivilizationType = 'CIVILIZATION_FRANCE';
----------------------------------------------------------------------------------------------------------------------------	
-- Civilizations_YnAEMPRequestedResources
----------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMPRequestedResources(CivilizationType, MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6);
INSERT INTO Civilizations_YnAEMPRequestedResources
		(CivilizationType,						MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6)
SELECT	'CIVILIZATION_US_FRANCE',	MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6
FROM Civilizations_YnAEMPRequestedResources WHERE CivilizationType = 'CIVILIZATION_FRANCE';
--==========================================================================================================================
--==========================================================================================================================