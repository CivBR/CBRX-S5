-- Support for Pouakai's Enlightenement Era that makes the Glung Kbbang replace the Carrack instead.

--==========================================================================================================================
-- ENLIGHTENMENT ERA
--==========================================================================================================================
------------------------------------------------------------
-- Units
------------------------------------------------------------
INSERT OR REPLACE INTO Units 	
		(Type, 				Class, PrereqTech, Combat,	Cost, Range, FaithCost,	RequiresFaithPurchaseEnabled, Moves,	CombatClass, Domain, DefaultUnitAI, Description, 			  Civilopedia, 					  Strategy, 								Help,								MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, ObsoleteTech, XPValueDefense, GoodyHutUpgradeUnitClass, UnitArtInfo, 				UnitFlagIconOffset, UnitFlagAtlas,	PortraitIndex, 	IconAtlas)
SELECT	'UNIT_ER_KBBANG', 	Class, PrereqTech, Combat,	Cost, Range, FaithCost,	RequiresFaithPurchaseEnabled, Moves+1,	CombatClass, Domain, DefaultUnitAI, 'TXT_KEY_UNIT_ER_KBBANG', 'TXT_KEY_CIV5_UNIT_ER_KBBANG',  'TXT_KEY_UNIT_ER_KBBANG_STRATEGY_EE', 	'TXT_KEY_UNIT_ER_KBBANG_HELP_EE',	MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, ObsoleteTech, XPValueDefense, GoodyHutUpgradeUnitClass, 'ART_DEF_UNIT_ER_KBBANG',	0,				'ER_KBBANG_FLAG', 2,			'ER_PEGU_ATLAS'
FROM Units WHERE Type = 'UNIT_EE_CARRACK'
AND EXISTS (SELECT * FROM Technologies WHERE Type = 'TECH_EE_FLINTLOCK');
------------------------------------------------------------
-- Unit_ClassUpgrades
------------------------------------------------------------
DELETE FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_ER_KBBANG'
AND EXISTS (SELECT * FROM Technologies WHERE Type = 'TECH_EE_FLINTLOCK');
INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 				UnitClassType)
SELECT	'UNIT_ER_KBBANG',		UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_EE_CARRACK'
AND EXISTS (SELECT * FROM Technologies WHERE Type = 'TECH_EE_FLINTLOCK');
------------------------------------------------------------
-- Civilization_UnitClassOverrides
------------------------------------------------------------
UPDATE Civilization_UnitClassOverrides
SET UnitClassType = 'UNITCLASS_EE_CARRACK'
WHERE CivilizationType = 'CIVILIZATION_ER_PEGU' AND UnitType = 'UNIT_ER_KBBANG'
AND EXISTS (SELECT * FROM Technologies WHERE Type = 'TECH_EE_FLINTLOCK');
------------------------------------------------------------
-- Texts
------------------------------------------------------------
INSERT INTO Language_en_US 
		(Tag, 									Text) 
VALUES  ('TXT_KEY_UNIT_ER_KBBANG_HELP_EE', 		'Replaces Carrack. May move on ocean tiles[NEWLINE]+25% [ICON_STRENGTH] Defence against Ranged Attacks, +50% [ICON_STRENGTH] Combat Strength when defending from melee attacks. Will not retreat when attacked.'),
		('TXT_KEY_UNIT_ER_KBBANG_STRATEGY_EE',	'Replaces Carrack. May move on ocean tiles[NEWLINE]Has more [ICON_STRENGTH] Defence against Ranged Attacks, and more Combat Strength when defending from melee attacks. Will not retreat when attacked.');