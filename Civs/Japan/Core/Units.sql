--==========================================================================================================================
-- Units
--==========================================================================================================================
INSERT INTO Units
(Type, 										Class, Cost,	Range, PrereqTech, Combat,	Moves, FaithCost,	RequiresFaithPurchaseEnabled,	CombatClass,	MilitarySupport, MilitaryProduction, Domain, Pillage, IgnoreBuildingDefense, ObsoleteTech, GoodyHutUpgradeUnitClass, XPValueAttack, XPValueDefense, Conscription,  DefaultUnitAI, Description, 						Civilopedia, 							Help, 									Strategy,									AdvancedStartCost,	UnitArtInfo, 					  UnitFlagIconOffset,	UnitFlagAtlas,						PortraitIndex, 	IconAtlas)
SELECT		('UNIT_SENSHI_ASHIGARU'),		Class, Cost-10, Range, PrereqTech, Combat,	Moves, FaithCost,	RequiresFaithPurchaseEnabled,	CombatClass,	MilitarySupport, MilitaryProduction,	Domain, Pillage, IgnoreBuildingDefense, ObsoleteTech, GoodyHutUpgradeUnitClass, XPValueAttack, XPValueDefense, Conscription,  DefaultUnitAI, ('TXT_KEY_UNIT_SENSHI_ASHIGARU'),	('TXT_KEY_CIV5_UNIT_SENSHI_ASHIGARU_TEXT'), 	('TXT_KEY_UNIT_SENSHI_ASHIGARU_HELP'), 	('TXT_KEY_UNIT_SENSHI_ASHIGARU_STRATEGY'),	AdvancedStartCost, 	('ART_DEF_UNIT_SENSHI_ASHIGARU'),  0,					('SENSHI_ASHIGARU_FLAG'),	2, 				('SENSHI_HIDEYOSHI_ATLAS')
FROM Units WHERE (Type = 'UNIT_PIKEMAN');
--==========================================================================================================================
-- UnitGameplay2DScripts
--==========================================================================================================================
INSERT INTO UnitGameplay2DScripts
			(UnitType, 					SelectionSound, FirstSelectionSound)
SELECT		('UNIT_SENSHI_ASHIGARU'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_PIKEMAN');
--==========================================================================================================================
-- Unit_AITypes
--==========================================================================================================================
INSERT INTO Unit_AITypes
(UnitType, 					UnitAIType)
SELECT		('UNIT_SENSHI_ASHIGARU'), 	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_PIKEMAN');
--==========================================================================================================================
-- Unit_ClassUpgrades
--==========================================================================================================================
INSERT INTO Unit_ClassUpgrades
(UnitType, 					UnitClassType)
SELECT		('UNIT_SENSHI_ASHIGARU'), 	UnitClassType
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_LONGSWORDSMAN');
--==========================================================================================================================
-- Unit_Flavors
--==========================================================================================================================
INSERT INTO Unit_Flavors
(UnitType, 					FlavorType, Flavor)
SELECT		'UNIT_SENSHI_ASHIGARU', 	FlavorType, Flavor+2
FROM Unit_Flavors WHERE (UnitType = 'UNIT_PIKEMAN');
--==========================================================================================================================
-- Unit_FreePromotions
--==========================================================================================================================
INSERT INTO Unit_FreePromotions
			(UnitType, 					PromotionType)
SELECT		'UNIT_SENSHI_ASHIGARU',		PromotionType
FROM Unit_FreePromotions WHERE (UnitType = 'UNIT_PIKEMAN') AND (PromotionType != 'PROMOTION_ANTI_MOUNTED_I');
--==========================================================================================================================
--==========================================================================================================================
