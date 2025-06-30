--==========================================================================================================================
-- Units
--==========================================================================================================================
INSERT INTO Units
(Type, 										Class, Cost, Range, PrereqTech, Combat,		Moves, FaithCost,	RequiresFaithPurchaseEnabled,	CombatClass,	MilitarySupport, MilitaryProduction, Domain, Pillage, IgnoreBuildingDefense, ObsoleteTech, GoodyHutUpgradeUnitClass, XPValueAttack, XPValueDefense, Conscription,  DefaultUnitAI, Description, 						Civilopedia, 							Help, 									Strategy,									AdvancedStartCost,	UnitArtInfo, 					  UnitFlagIconOffset,	UnitFlagAtlas,						PortraitIndex, 	IconAtlas)
SELECT		('UNIT_SENSHI_RUM_CORPS'),		Class, Cost, Range, PrereqTech, Combat,		Moves, FaithCost,	RequiresFaithPurchaseEnabled,	CombatClass,	MilitarySupport, MilitaryProduction,	Domain, Pillage, IgnoreBuildingDefense, ObsoleteTech, GoodyHutUpgradeUnitClass, XPValueAttack, XPValueDefense, Conscription,  DefaultUnitAI, ('TXT_KEY_UNIT_SENSHI_RUM_CORPS'),	('TXT_KEY_CIV5_UNIT_SENSHI_RUM_CORPS_TEXT'), 	('TXT_KEY_UNIT_SENSHI_RUM_CORPS_HELP'), 	('TXT_KEY_UNIT_SENSHI_RUM_CORPS_STRATEGY'),	AdvancedStartCost, 	('ART_DEF_UNIT_SENSHI_RUM_CORPS'),  0,					('SENSHI_RUM_CORPS_FLAG'),	2, 				('SENSHI_NEW_SOUTH_WALES_ATLAS')
FROM Units WHERE (Type = 'UNIT_RIFLEMAN');
--==========================================================================================================================
-- UnitGameplay2DScripts
--==========================================================================================================================
INSERT INTO UnitGameplay2DScripts
			(UnitType, 					SelectionSound, FirstSelectionSound)
SELECT		('UNIT_SENSHI_RUM_CORPS'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_RIFLEMAN');
--==========================================================================================================================
-- Unit_AITypes
--==========================================================================================================================
INSERT INTO Unit_AITypes
(UnitType, 					UnitAIType)
SELECT		('UNIT_SENSHI_RUM_CORPS'), 	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_RIFLEMAN');
--==========================================================================================================================
-- Unit_ClassUpgrades
--==========================================================================================================================
INSERT INTO Unit_ClassUpgrades
(UnitType, 					UnitClassType)
SELECT		('UNIT_SENSHI_RUM_CORPS'), 	UnitClassType
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_RIFLEMAN');
--==========================================================================================================================
-- Unit_Flavors
--==========================================================================================================================
INSERT INTO Unit_Flavors
(UnitType, 					FlavorType, Flavor)
SELECT		'UNIT_SENSHI_RUM_CORPS', 	FlavorType, Flavor+1
FROM Unit_Flavors WHERE (UnitType = 'UNIT_RIFLEMAN');
--==========================================================================================================================
-- Unit_FreePromotions
--==========================================================================================================================
INSERT INTO Unit_FreePromotions
			(UnitType, 					PromotionType)
SELECT		'UNIT_SENSHI_RUM_CORPS',		PromotionType
FROM Unit_FreePromotions WHERE (UnitType = 'UNIT_RIFLEMAN');
--==========================================================================================================================
--==========================================================================================================================
