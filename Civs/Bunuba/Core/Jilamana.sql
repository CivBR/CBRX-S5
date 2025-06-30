--==========================================================================================================================
-- Units
--==========================================================================================================================
INSERT INTO Units
(Type, 										Class, Cost, Range, PrereqTech, Combat,		Moves, FaithCost,	RequiresFaithPurchaseEnabled,	CombatClass,	MilitarySupport, MilitaryProduction, Domain, Pillage, IgnoreBuildingDefense, ObsoleteTech, GoodyHutUpgradeUnitClass, XPValueAttack, XPValueDefense, Conscription,  DefaultUnitAI, Description, 						Civilopedia, 							Help, 									Strategy,									AdvancedStartCost,	UnitArtInfo, 					  UnitFlagIconOffset,	UnitFlagAtlas,						PortraitIndex, 	IconAtlas)
SELECT		('UNIT_SENSHI_JILAMANA'),		Class, Cost, Range, PrereqTech, Combat-4,	Moves, FaithCost,	RequiresFaithPurchaseEnabled,	CombatClass,	MilitarySupport, MilitaryProduction,	Domain, Pillage, IgnoreBuildingDefense, ObsoleteTech, GoodyHutUpgradeUnitClass, XPValueAttack, XPValueDefense, Conscription,  DefaultUnitAI, ('TXT_KEY_UNIT_SENSHI_JILAMANA'),	('TXT_KEY_CIV5_UNIT_SENSHI_JILAMANA_TEXT'), 	('TXT_KEY_UNIT_SENSHI_JILAMANA_HELP'), 	('TXT_KEY_UNIT_SENSHI_JILAMANA_STRATEGY'),	AdvancedStartCost, 	('ART_DEF_UNIT_SENSHI_JILAMANA'),  0,					('SENSHI_JILAMANA_FLAG'),	2, 				('SENSHI_BUNUBA_ATLAS')
FROM Units WHERE (Type = 'UNIT_RIFLEMAN');
--==========================================================================================================================
-- UnitGameplay2DScripts
--==========================================================================================================================
INSERT INTO UnitGameplay2DScripts
			(UnitType, 					SelectionSound, FirstSelectionSound)
SELECT		('UNIT_SENSHI_JILAMANA'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_RIFLEMAN');
--==========================================================================================================================
-- Unit_AITypes
--==========================================================================================================================
INSERT INTO Unit_AITypes
(UnitType, 					UnitAIType)
SELECT		('UNIT_SENSHI_JILAMANA'), 	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_RIFLEMAN');
--==========================================================================================================================
-- Unit_ClassUpgrades
--==========================================================================================================================
INSERT INTO Unit_ClassUpgrades
(UnitType, 					UnitClassType)
SELECT		('UNIT_SENSHI_JILAMANA'), 	UnitClassType
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_RIFLEMAN');
--==========================================================================================================================
-- Unit_Flavors
--==========================================================================================================================
INSERT INTO Unit_Flavors
(UnitType, 					FlavorType, Flavor)
SELECT		'UNIT_SENSHI_JILAMANA', 	FlavorType, Flavor+1
FROM Unit_Flavors WHERE (UnitType = 'UNIT_RIFLEMAN');
--==========================================================================================================================
-- Unit_FreePromotions
--==========================================================================================================================
INSERT INTO Unit_FreePromotions
			(UnitType, 					PromotionType)
SELECT		'UNIT_SENSHI_JILAMANA',		PromotionType
FROM Unit_FreePromotions WHERE (UnitType = 'UNIT_RIFLEMAN');

INSERT INTO Unit_FreePromotions 	
			(UnitType, 						PromotionType)
VALUES		('UNIT_SENSHI_JILAMANA', 		'PROMOTION_SCOUTING_1'),
			('UNIT_SENSHI_JILAMANA', 		'PROMOTION_SURVIVALISM_1'),
			('UNIT_SENSHI_JILAMANA', 		'PROMOTION_CAN_MOVE_AFTER_ATTACKING');
--==========================================================================================================================
--==========================================================================================================================
