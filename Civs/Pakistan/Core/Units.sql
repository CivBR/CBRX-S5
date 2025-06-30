--==========================================================================================================================
-- Units
--==========================================================================================================================
INSERT INTO Units
(Type, 											Class, Cost, Range, PrereqTech, Combat, RangedCombat, Moves, FaithCost,	RequiresFaithPurchaseEnabled, CombatClass, MilitarySupport, MilitaryProduction, Domain, Pillage, IgnoreBuildingDefense, ObsoleteTech, GoodyHutUpgradeUnitClass, XPValueAttack, XPValueDefense, Conscription,  DefaultUnitAI, Description, 						Civilopedia, 							Help, 									Strategy,									AdvancedStartCost,	UnitArtInfo, 					  UnitFlagIconOffset,	UnitFlagAtlas,						PortraitIndex, 	IconAtlas)
SELECT		('UNIT_SENSHI_POLICE_RANGER'),		Class, Cost, Range, PrereqTech, Combat, RangedCombat, Moves, FaithCost, RequiresFaithPurchaseEnabled, CombatClass, MilitarySupport, MilitaryProduction,	Domain, Pillage, IgnoreBuildingDefense, ObsoleteTech, GoodyHutUpgradeUnitClass, XPValueAttack, XPValueDefense, Conscription,  DefaultUnitAI, ('TXT_KEY_UNIT_SENSHI_POLICE_RANGER'),	('TXT_KEY_UNIT_CIV5_SENSHI_POLICE_RANGER_TEXT'), 	('TXT_KEY_UNIT_SENSHI_POLICE_RANGER_HELP'), 	('TXT_KEY_UNIT_SENSHI_POLICE_RANGER_STRATEGY'),	AdvancedStartCost, 	('ART_DEF_UNIT_SENSHI_POLICE_RANGER'),  0,					('SENSHI_POLICE_RANGER_FLAG'),	2, 				('SENSHI_PAKISTAN_ATLAS')
FROM Units WHERE (Type = 'UNIT_PARATROOPER');
--==========================================================================================================================
-- UnitGameplay2DScripts
--==========================================================================================================================
INSERT INTO UnitGameplay2DScripts
(UnitType, 					SelectionSound, FirstSelectionSound)
SELECT		('UNIT_SENSHI_POLICE_RANGER'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_PARATROOPER');
--==========================================================================================================================
-- Unit_AITypes
--==========================================================================================================================
INSERT INTO Unit_AITypes
(UnitType, 					UnitAIType)
SELECT		('UNIT_SENSHI_POLICE_RANGER'), 	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_PARATROOPER');
--==========================================================================================================================
-- Unit_ClassUpgrades
--==========================================================================================================================
INSERT INTO Unit_ClassUpgrades
(UnitType, 					UnitClassType)
SELECT		('UNIT_SENSHI_POLICE_RANGER'), 	UnitClassType
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_PARATROOPER');
--==========================================================================================================================
-- Unit_Flavors
--==========================================================================================================================
INSERT INTO Unit_Flavors
(UnitType, 					FlavorType, Flavor)
SELECT		'UNIT_SENSHI_POLICE_RANGER', 	FlavorType, Flavor+3
FROM Unit_Flavors WHERE (UnitType = 'UNIT_PARATROOPER');
--==========================================================================================================================
-- Unit_FreePromotions
--==========================================================================================================================
INSERT INTO Unit_FreePromotions
			(UnitType, 					PromotionType)
SELECT		'UNIT_SENSHI_POLICE_RANGER',		PromotionType
FROM Unit_FreePromotions WHERE (UnitType = 'UNIT_PARATROOPER');
--==========================================================================================================================
--==========================================================================================================================
