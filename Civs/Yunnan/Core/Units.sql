--==========================================================================================================================
-- Units
--==========================================================================================================================
INSERT INTO Units
(Type, 										Class, Cost,	WorkRate,	Range, PrereqTech, Combat,	Moves, FaithCost,	RequiresFaithPurchaseEnabled,	CombatClass,	MilitarySupport, MilitaryProduction, Domain, Pillage, IgnoreBuildingDefense, ObsoleteTech, GoodyHutUpgradeUnitClass, XPValueAttack, XPValueDefense, Conscription,  DefaultUnitAI, Description, 						Civilopedia, 							Help, 									Strategy,									AdvancedStartCost,	UnitArtInfo, 					  UnitFlagIconOffset,	UnitFlagAtlas,						PortraitIndex, 	IconAtlas)
SELECT		('UNIT_SENSHI_DIAN_CORPS'),		Class, Cost-50, 150,		Range, PrereqTech, Combat,	Moves, FaithCost,	RequiresFaithPurchaseEnabled,	CombatClass,	MilitarySupport, MilitaryProduction,	Domain, Pillage, IgnoreBuildingDefense, ObsoleteTech, GoodyHutUpgradeUnitClass, XPValueAttack, XPValueDefense, Conscription,  DefaultUnitAI, ('TXT_KEY_UNIT_SENSHI_DIAN_CORPS'),	('TXT_KEY_CIV5_UNIT_SENSHI_DIAN_CORPS_TEXT'), 	('TXT_KEY_UNIT_SENSHI_DIAN_CORPS_HELP'), 	('TXT_KEY_UNIT_SENSHI_DIAN_CORPS_STRATEGY'),	AdvancedStartCost, 	('ART_DEF_UNIT_SENSHI_DIAN_CORPS'),  0,					('SENSHI_DIAN_CORPS_FLAG'),	2, 				('SENSHI_YUNNAN_ATLAS')
FROM Units WHERE (Type = 'UNIT_GREAT_WAR_INFANTRY');
--==========================================================================================================================
-- UnitGameplay2DScripts
--==========================================================================================================================
INSERT INTO UnitGameplay2DScripts
			(UnitType, 					SelectionSound, FirstSelectionSound)
SELECT		('UNIT_SENSHI_DIAN_CORPS'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_GREAT_WAR_INFANTRY');
--==========================================================================================================================
-- Unit_AITypes
--==========================================================================================================================
INSERT INTO Unit_AITypes
(UnitType, 					UnitAIType)
SELECT		('UNIT_SENSHI_DIAN_CORPS'), 	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_GREAT_WAR_INFANTRY');
--==========================================================================================================================
-- Unit_ClassUpgrades
--==========================================================================================================================
INSERT INTO Unit_ClassUpgrades
(UnitType, 					UnitClassType)
SELECT		('UNIT_SENSHI_DIAN_CORPS'), 	UnitClassType
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_GREAT_WAR_INFANTRY');
--==========================================================================================================================
-- Unit_Flavors
--==========================================================================================================================
INSERT INTO Unit_Flavors
(UnitType, 					FlavorType, Flavor)
SELECT		'UNIT_SENSHI_DIAN_CORPS', 	FlavorType, Flavor+1
FROM Unit_Flavors WHERE (UnitType = 'UNIT_GREAT_WAR_INFANTRY');
--==========================================================================================================================
-- Unit_FreePromotions
--==========================================================================================================================
INSERT INTO Unit_FreePromotions
			(UnitType, 					PromotionType)
SELECT		'UNIT_SENSHI_DIAN_CORPS',		PromotionType
FROM Unit_FreePromotions WHERE (UnitType = 'UNIT_GREAT_WAR_INFANTRY');

INSERT INTO Unit_Builds 	
			(UnitType, 						BuildType)
VALUES		('UNIT_SENSHI_DIAN_CORPS', 		'BUILD_ROAD'),
			('UNIT_SENSHI_DIAN_CORPS', 		'BUILD_RAILROAD'),
			('UNIT_SENSHI_DIAN_CORPS', 		'BUILD_MINE');
--==========================================================================================================================
--==========================================================================================================================
