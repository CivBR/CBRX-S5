--==========================================================================================================================	
-- UNITS
--==========================================================================================================================
----------------------------------------------------------------------------------------------------------------------------
-- Units
----------------------------------------------------------------------------------------------------------------------------	
INSERT OR REPLACE INTO Units 	
		(Type, 					Class, PrereqTech, Combat, RangedCombat, Cost, Moves, HurryCostModifier, Range, CombatClass, Domain, DefaultUnitAI, MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, Mechanized, AdvancedStartCost, MinAreaSize, XPValueAttack, XPValueDefense, MoveRate, Description, 						Help, 									Strategy, 									Civilopedia, 							UnitArtInfo, 							UnitFlagAtlas,		UnitFlagIconOffset,	IconAtlas,									PortraitIndex)
SELECT	'UNIT_ASQ_LONGAFADA',	Class, PrereqTech, Combat-4, RangedCombat, Cost, Moves+1, HurryCostModifier, Range, CombatClass, Domain, DefaultUnitAI, MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, Mechanized, AdvancedStartCost, MinAreaSize, XPValueAttack, XPValueDefense, MoveRate, 'TXT_KEY_UNIT_ASQ_LONGAFADA',		'TXT_KEY_UNIT_ASQ_LONGAFADA_HELP_EE', 	'TXT_KEY_UNIT_ASQ_LONGAFADA_STRATEGY',  'TXT_KEY_UNIT_ASQ_LONGAFADA_PEDIA',		'ART_DEF_UNIT_ASQ_LONGAFADA',	'ALPHA_ASQ_LONGAFADA',  0,					'ATLAS_ASQ_GRACEOMALLEY',	2
FROM Units WHERE Type = 'UNIT_EE_GALLEON'
AND EXISTS (SELECT Type FROM Units WHERE Type = 'UNIT_EE_GALLEON');	

----------------------------------------------------------------------------------------------------------------------------	
-- UnitGameplay2DScripts
----------------------------------------------------------------------------------------------------------------------------		
DELETE FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_ASQ_LONGAFADA' 
AND EXISTS (SELECT Type FROM Units WHERE Type = 'UNIT_EE_GALLEON');	
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 				SelectionSound,	FirstSelectionSound)
SELECT	'UNIT_ASQ_LONGAFADA', 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_EE_GALLEON'
AND EXISTS (SELECT Type FROM Units WHERE Type = 'UNIT_EE_GALLEON');	
----------------------------------------------------------------------------------------------------------------------------		
-- Unit_AITypes
----------------------------------------------------------------------------------------------------------------------------		
DELETE FROM Unit_AITypes WHERE UnitType = 'UNIT_ASQ_LONGAFADA' 
AND EXISTS (SELECT Type FROM Units WHERE Type = 'UNIT_EE_GALLEON');	 
INSERT INTO Unit_AITypes 	
		(UnitType, 				UnitAIType)
SELECT	'UNIT_ASQ_LONGAFADA', 	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_EE_GALLEON'
AND EXISTS (SELECT Type FROM Units WHERE Type = 'UNIT_EE_GALLEON');
----------------------------------------------------------------------------------------------------------------------------	
-- Unit_ClassUpgrades
----------------------------------------------------------------------------------------------------------------------------	
DELETE FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_ASQ_LONGAFADA' 
AND EXISTS (SELECT Type FROM Units WHERE Type = 'UNIT_EE_GALLEON');	
INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 				UnitClassType)
SELECT	'UNIT_ASQ_LONGAFADA',	UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_EE_GALLEON'
AND EXISTS (SELECT Type FROM Units WHERE Type = 'UNIT_EE_GALLEON');	
----------------------------------------------------------------------------------------------------------------------------	
-- Unit_Flavors
----------------------------------------------------------------------------------------------------------------------------	
DELETE FROM Unit_Flavors WHERE UnitType = 'UNIT_ASQ_LONGAFADA' 
AND EXISTS (SELECT Type FROM Units WHERE Type = 'UNIT_EE_GALLEON');	
INSERT INTO Unit_Flavors 	
		(UnitType, 				FlavorType, Flavor)
SELECT	'UNIT_ASQ_LONGAFADA', 	FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_EE_GALLEON'
AND EXISTS (SELECT Type FROM Units WHERE Type = 'UNIT_EE_GALLEON');	
----------------------------------------------------------------------------------------------------------------------------	
-- Unit_FreePromotions
----------------------------------------------------------------------------------------------------------------------------		
DELETE FROM Unit_FreePromotions WHERE UnitType = 'UNIT_ASQ_LONGAFADA' 
AND EXISTS (SELECT Type FROM Units WHERE Type = 'UNIT_EE_GALLEON');
INSERT INTO Unit_FreePromotions 	
		(UnitType, 				PromotionType)
SELECT	'UNIT_ASQ_LONGAFADA', 	PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_EE_GALLEON'
AND EXISTS (SELECT Type FROM Units WHERE Type = 'UNIT_EE_GALLEON');	
----------------------------------------------------------------------------------------------------------------------------	
-- Unit_ResourceQuantityRequirements
----------------------------------------------------------------------------------------------------------------------------	
DELETE FROM Unit_ResourceQuantityRequirements WHERE UnitType = 'UNIT_ASQ_LONGAFADA' 
AND EXISTS (SELECT Type FROM Units WHERE Type = 'UNIT_EE_GALLEON');	
INSERT INTO Unit_ResourceQuantityRequirements 	
		(UnitType, 				ResourceType, Cost)
SELECT	'UNIT_ASQ_LONGAFADA', 	ResourceType, Cost
FROM Unit_ResourceQuantityRequirements WHERE UnitType = 'UNIT_EE_GALLEON'
AND EXISTS (SELECT Type FROM Units WHERE Type = 'UNIT_EE_GALLEON');	
----------------------------------------------------------------------------------------------------------------------------	
-- Civilization_UnitClassOverrides 
----------------------------------------------------------------------------------------------------------------------------	
UPDATE Civilization_UnitClassOverrides
SET UnitClassType = 'UNITCLASS_EE_GALLEON'
WHERE CivilizationType = 'CIVILIZATION_ASQ_UMHAILL' AND UnitClassType = 'UNITCLASS_CARAVEL'
AND EXISTS (SELECT Type FROM Units WHERE Type = 'UNIT_EE_GALLEON');
--==========================================================================================================================
-- CIVILIZATIONS
--==========================================================================================================================
----------------------------------------------------------------------------------------------------------------------------
-- Civilizations_YnAEMP
----------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMP(CivilizationType, MapPrefix, X, Y, CapitalName, AltX, AltY, AltCapitalName);
INSERT INTO Civilizations_YnAEMP
		(CivilizationType,							 MapPrefix,			X,		Y,		AltX,	AltY,	AltCapitalName)
VALUES	-- ('CIVILIZATION_ASQ_UMHAILL',	 'AfriAsiaAust',	0,		0,		null,	null,	null),
		-- ('CIVILIZATION_ASQ_UMHAILL',	 'AfricaLarge',		0,		0,		null,	null,	null),
		-- ('CIVILIZATION_ASQ_UMHAILL',	 'AfriSouthEuro',	0,		0,		null,	null,	null),
		-- ('CIVILIZATION_ASQ_UMHAILL',	 'Americas',		0,		0,		null,	null,	null),
		-- ('CIVILIZATION_ASQ_UMHAILL',	 'Apennine',		0,		0,		null,	null,	null),
		-- ('CIVILIZATION_ASQ_UMHAILL',	 'Asia',			0,		0,		null,	null,	null),
		('CIVILIZATION_ASQ_UMHAILL',		 'BritishIsles',	57,		56,		null,	null,	null),
		-- ('CIVILIZATION_ASQ_UMHAILL',	 'Caribbean',		0,		0,		null,	null,	null),
		('CIVILIZATION_ASQ_UMHAILL',		 'Cordiform',		36,		37,		null,	null,	null),
		('CIVILIZATION_ASQ_UMHAILL',		 'EarthMk3',		16,		78,		null,	null,	null),
		-- ('CIVILIZATION_ASQ_UMHAILL',	 'EastAsia',		0,		0,		null,	null,	null),
		('CIVILIZATION_ASQ_UMHAILL',		 'EuroLarge',		31,		61,		null,	null,	null),
		('CIVILIZATION_ASQ_UMHAILL',		 'EuroLargeNew',	32,		63,		null,	null,	null),
		('CIVILIZATION_ASQ_UMHAILL',		 'GreatestEarth',	43,		61,		null,	null,	null),
		-- ('CIVILIZATION_ASQ_UMHAILL',	 'IndianOcean',		0,		0,		null,	null,	null),
		-- ('CIVILIZATION_ASQ_UMHAILL',	 'Mediterranean',	0,		0,		null,	null,	null),
		-- ('CIVILIZATION_ASQ_UMHAILL',	 'Mesopotamia',		0,		0,		null,	null,	null),
		('CIVILIZATION_ASQ_UMHAILL',		 'NorthAtlantic',	83,		44,		null,	null,	null),
		-- ('CIVILIZATION_ASQ_UMHAILL',	 'NorthEastAsia',	0,		0,		null,	null,	null),
		('CIVILIZATION_ASQ_UMHAILL',		 'NorthWestEurope',	28,		41,		null,	null,	null),
		-- ('CIVILIZATION_ASQ_UMHAILL',	 'Orient',			0,		0,		null,	null,	null),
		-- ('CIVILIZATION_ASQ_UMHAILL',	 'SouthPacific',	0,		0,		null,	null,	null),
		('CIVILIZATION_ASQ_UMHAILL',		 'Yagem',			17,		80,		null,	null,	null),
		('CIVILIZATION_ASQ_UMHAILL',		 'Yahem',			61,		67,		null,	null,	null);
----------------------------------------------------------------------------------------------------------------------------	
-- Civilizations_YnAEMPRequestedResources
----------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMPRequestedResources(CivilizationType, MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6);
INSERT INTO Civilizations_YnAEMPRequestedResources
		(CivilizationType,						MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6)
SELECT	'CIVILIZATION_ASQ_UMHAILL',	MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6
FROM Civilizations_YnAEMPRequestedResources WHERE CivilizationType = 'CIVILIZATION_CELTS';
----------------------------------------------------------------------------------------------------------------------------
-- Civilization_JFD_CultureTypes
----------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilization_JFD_CultureTypes(CivilizationType, CultureType, SubCultureType, ArtDefineTag, DecisionsTag, DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag,	SoundtrackTag, UnitDialogueTag);
INSERT INTO Civilization_JFD_CultureTypes
		(CivilizationType,						ArtDefineTag, CultureType, SubCultureType,	DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag)
SELECT	'CIVILIZATION_ASQ_UMHAILL',	ArtDefineTag, CultureType, SubCultureType,	DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_CELTS';
	
UPDATE Civilizations 
SET SoundtrackTag = (SELECT SoundtrackTag FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_ASQ_UMHAILL')
WHERE Type = 'CIVILIZATION_ASQ_UMHAILL'
AND EXISTS (SELECT SoundID FROM Audio_Sounds WHERE SoundID = 'SND_JFD_ABORIGINAL_PEACE_01');

