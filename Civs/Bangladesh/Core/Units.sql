--==========================================================================================================================
-- Units
--==========================================================================================================================
INSERT INTO Units
(Type, 											Class, Cost, Range, PrereqTech, Combat, RangedCombat,	Moves, FaithCost,	RequiresFaithPurchaseEnabled, CombatClass, MilitarySupport, MilitaryProduction, Domain, Pillage, IgnoreBuildingDefense, ObsoleteTech, GoodyHutUpgradeUnitClass, XPValueAttack, XPValueDefense, Conscription,  DefaultUnitAI, Description, 						Civilopedia, 							Help, 									Strategy,									AdvancedStartCost,	UnitArtInfo, 					  UnitFlagIconOffset,	UnitFlagAtlas,						PortraitIndex, 	IconAtlas)
SELECT		('UNIT_SENSHI_MUKTI_BAHINI'),		Class, Cost, Range, PrereqTech, Combat-5, RangedCombat-5,	Moves, FaithCost,	RequiresFaithPurchaseEnabled, CombatClass, MilitarySupport, MilitaryProduction,	Domain, Pillage, IgnoreBuildingDefense, ObsoleteTech, GoodyHutUpgradeUnitClass, XPValueAttack, XPValueDefense, Conscription,  DefaultUnitAI, ('TXT_KEY_UNIT_SENSHI_MUKTI_BAHINI'),	('TXT_KEY_CIV5_UNIT_SENSHI_MUKTI_BAHINI_TEXT'), 	('TXT_KEY_UNIT_SENSHI_MUKTI_BAHINI_HELP'), 	('TXT_KEY_UNIT_SENSHI_MUKTI_BAHINI_STRATEGY'),	AdvancedStartCost, 	('ART_DEF_UNIT_MUKTI_BAHINI'),  0,					('SENSHI_MUKTI_BAHINI_FLAG'),	2, 				('SENSHI_BANGLADESH_ATLAS')
FROM Units WHERE (Type = 'UNIT_MACHINE_GUN');
--==========================================================================================================================
-- UnitGameplay2DScripts
--==========================================================================================================================
INSERT INTO UnitGameplay2DScripts
(UnitType, 					SelectionSound, FirstSelectionSound)
SELECT		('UNIT_SENSHI_MUKTI_BAHINI'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_MACHINE_GUN');
--==========================================================================================================================
-- Unit_AITypes
--==========================================================================================================================
INSERT INTO Unit_AITypes
(UnitType, 					UnitAIType)
SELECT		('UNIT_SENSHI_MUKTI_BAHINI'), 	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_MACHINE_GUN');
--==========================================================================================================================
-- Unit_ClassUpgrades
--==========================================================================================================================
INSERT INTO Unit_ClassUpgrades
(UnitType, 					UnitClassType)
SELECT		('UNIT_SENSHI_MUKTI_BAHINI'), 	UnitClassType
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_MACHINE_GUN');
--==========================================================================================================================
-- Unit_Flavors
--==========================================================================================================================
INSERT INTO Unit_Flavors
(UnitType, 					FlavorType, Flavor)
SELECT		'UNIT_SENSHI_MUKTI_BAHINI', 	FlavorType, Flavor+1
FROM Unit_Flavors WHERE (UnitType = 'UNIT_MACHINE_GUN');
--==========================================================================================================================
-- Unit_FreePromotions
--==========================================================================================================================
INSERT INTO Unit_FreePromotions
			(UnitType, 					PromotionType)
SELECT		'UNIT_SENSHI_MUKTI_BAHINI',		PromotionType
FROM Unit_FreePromotions WHERE (UnitType = 'UNIT_MACHINE_GUN');

INSERT INTO Unit_FreePromotions 	
			(UnitType, 						PromotionType)
VALUES		('UNIT_SENSHI_MUKTI_BAHINI', 	'PROMOTION_GOLDEN_AGE_POINTS');
--==========================================================================================================================
--==========================================================================================================================
