--==========================================================================================================================
-- Units
--==========================================================================================================================
INSERT INTO Units 	
			(Type, 									PrereqTech, Combat, Cost, Class, FaithCost,	RequiresFaithPurchaseEnabled,	Moves, 	CombatClass, Domain, DefaultUnitAI, Description, 							Civilopedia, 										Help, 										Strategy,								  			MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, ObsoleteTech, 	XPValueAttack, XPValueDefense, GoodyHutUpgradeUnitClass, UnitArtInfo,							UnitFlagIconOffset,	UnitFlagAtlas,						MoveRate,	PortraitIndex, 	IconAtlas)
SELECT		('UNIT_MC_PHOENICIA_BIREME'),			PrereqTech, Combat, Cost, Class, FaithCost,	RequiresFaithPurchaseEnabled,	Moves, 	CombatClass, Domain, DefaultUnitAI, ('TXT_KEY_UNIT_MC_PHOENICIA_BIREME'), 	('TXT_KEY_CIV5_UNIT_MC_PHOENICIA_BIREME_TEXT'), 	('TXT_KEY_UNIT_MC_PHOENICIA_BIREME_HELP'), 	('TXT_KEY_UNIT_MC_PHOENICIA_BIREME_STRATEGY'),  	MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, ObsoleteTech,	XPValueAttack, XPValueDefense, GoodyHutUpgradeUnitClass, ('ART_DEF_UNIT_MC_PHOENICIA_BIREME'),  0,					'MC_PHOENICIAN_BIREME_FLAG',		MoveRate,	2, 				('MC_PHOENICIA_ATLAS')
FROM Units WHERE (Type = 'UNIT_TRIREME');

INSERT INTO Units 	
			(Type, 							PrereqTech, CivilianAttackPriority, Class, Cost, Moves, FaithCost, RequiresFaithPurchaseEnabled, Special, CombatLimit, Domain, 	DefaultUnitAI, 	Description, 									Civilopedia, 									Help, 										Strategy,								   			AdvancedStartCost, WorkRate, BaseHurry, HurryMultiplier, Pillage, IgnoreBuildingDefense, UnitArtInfo,								UnitFlagIconOffset,	UnitFlagAtlas,				MoveRate,	PortraitIndex, 	IconAtlas)
SELECT		('UNIT_MC_TYRIAN_MERCHANT'),	PrereqTech, CivilianAttackPriority, Class, Cost, Moves, FaithCost, RequiresFaithPurchaseEnabled, Special, CombatLimit, Domain,	DefaultUnitAI, 	('TXT_KEY_UNIT_MC_TYRIAN_MERCHANT'), 			('TXT_KEY_CIV5_UNIT_MC_TYRIAN_MERCHANT_TEXT'), 	('TXT_KEY_UNIT_MC_TYRIAN_MERCHANT_HELP'), 	('TXT_KEY_UNIT_MC_TYRIAN_MERCHANT_STRATEGY'),		AdvancedStartCost, WorkRate, BaseHurry, HurryMultiplier, Pillage, IgnoreBuildingDefense, ('ART_DEF_UNIT_MC_TYRIAN_MERCHANT'),  		0,					'MC_TYRIAN_MERCHANT_FLAG',	MoveRate,	3, 				('MC_PHOENICIA_ATLAS')
FROM Units WHERE (Type = 'UNIT_MERCHANT');
--==========================================================================================================================
-- UnitGameplay2DScripts
--==========================================================================================================================
INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 								SelectionSound, FirstSelectionSound)
SELECT		('UNIT_MC_PHOENICIA_BIREME'), 			SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_TRIREME');

INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 							SelectionSound, FirstSelectionSound)
SELECT		('UNIT_MC_TYRIAN_MERCHANT'), 		SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_MERCHANT');
--==========================================================================================================================
-- Unit_AITypes
--==========================================================================================================================
INSERT INTO Unit_AITypes 	
			(UnitType, 								UnitAIType)
SELECT		('UNIT_MC_PHOENICIA_BIREME'), 			UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_TRIREME');

INSERT INTO Unit_AITypes 	
			(UnitType, 								UnitAIType)
SELECT		('UNIT_MC_TYRIAN_MERCHANT'), 			UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_MERCHANT');
--==========================================================================================================================
-- Unit_Flavors
--==========================================================================================================================
INSERT INTO Unit_Flavors 	
			(UnitType, 								FlavorType, Flavor)
SELECT		('UNIT_MC_PHOENICIA_BIREME'), 			FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_TRIREME');

INSERT INTO Unit_Flavors 	
			(UnitType, 							FlavorType, Flavor)
SELECT		('UNIT_MC_TYRIAN_MERCHANT'), 		FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_MERCHANT');
--==========================================================================================================================	
-- Unit_ClassUpgrades
--==========================================================================================================================	
INSERT INTO Unit_ClassUpgrades 	
			(UnitType, 							UnitClassType)
SELECT		('UNIT_MC_PHOENICIA_BIREME'),		UnitClassType
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_TRIREME');
--==========================================================================================================================
-- Unit_FreePromotions
--==========================================================================================================================
INSERT INTO Unit_FreePromotions 	
			(UnitType, 							PromotionType)
SELECT		('UNIT_MC_PHOENICIA_BIREME'), 		PromotionType
FROM Unit_FreePromotions WHERE (UnitType = 'UNIT_TRIREME');

INSERT INTO Unit_FreePromotions
			(UnitType, 						PromotionType)
VALUES		('UNIT_MC_PHOENICIA_BIREME', 	'PROMOTION_CEDARS_OF_LEBANON');
--==========================================================================================================================
-- Unit_UniqueNames
--==========================================================================================================================
INSERT INTO Unit_UniqueNames 
			(UnitType, 					UniqueName)
VALUES		('UNIT_MC_TYRIAN_MERCHANT',	'TXT_KEY_GREAT_PERSON_MC_TYRIAN_MERCHANT_01'),
			('UNIT_MC_TYRIAN_MERCHANT',	'TXT_KEY_GREAT_PERSON_MC_TYRIAN_MERCHANT_02'),
			('UNIT_MC_TYRIAN_MERCHANT',	'TXT_KEY_GREAT_PERSON_MC_TYRIAN_MERCHANT_03'),
			('UNIT_MC_TYRIAN_MERCHANT',	'TXT_KEY_GREAT_PERSON_MC_TYRIAN_MERCHANT_04'),
			('UNIT_MC_TYRIAN_MERCHANT',	'TXT_KEY_GREAT_PERSON_MC_TYRIAN_MERCHANT_05'),
			('UNIT_MC_TYRIAN_MERCHANT',	'TXT_KEY_GREAT_PERSON_MC_TYRIAN_MERCHANT_06'),
			('UNIT_MC_TYRIAN_MERCHANT',	'TXT_KEY_GREAT_PERSON_MC_TYRIAN_MERCHANT_07'),
			('UNIT_MC_TYRIAN_MERCHANT',	'TXT_KEY_GREAT_PERSON_MC_TYRIAN_MERCHANT_08'),
			('UNIT_MC_TYRIAN_MERCHANT',	'TXT_KEY_GREAT_PERSON_MC_TYRIAN_MERCHANT_09'),
			('UNIT_MC_TYRIAN_MERCHANT',	'TXT_KEY_GREAT_PERSON_MC_TYRIAN_MERCHANT_10'),
			('UNIT_MC_TYRIAN_MERCHANT',	'TXT_KEY_GREAT_PERSON_MC_TYRIAN_MERCHANT_11'),
			('UNIT_MC_TYRIAN_MERCHANT',	'TXT_KEY_GREAT_PERSON_MC_TYRIAN_MERCHANT_12'),
			('UNIT_MC_TYRIAN_MERCHANT',	'TXT_KEY_GREAT_PERSON_MC_TYRIAN_MERCHANT_13'),
			('UNIT_MC_TYRIAN_MERCHANT',	'TXT_KEY_GREAT_PERSON_MC_TYRIAN_MERCHANT_14'),
			('UNIT_MC_TYRIAN_MERCHANT',	'TXT_KEY_GREAT_PERSON_MC_TYRIAN_MERCHANT_15'),
			('UNIT_MC_TYRIAN_MERCHANT',	'TXT_KEY_GREAT_PERSON_MC_TYRIAN_MERCHANT_16'),
			('UNIT_MC_TYRIAN_MERCHANT',	'TXT_KEY_GREAT_PERSON_MC_TYRIAN_MERCHANT_17'),
			('UNIT_MC_TYRIAN_MERCHANT',	'TXT_KEY_GREAT_PERSON_MC_TYRIAN_MERCHANT_18'),
			('UNIT_MC_TYRIAN_MERCHANT',	'TXT_KEY_GREAT_PERSON_MC_TYRIAN_MERCHANT_19'),
			('UNIT_MC_TYRIAN_MERCHANT',	'TXT_KEY_GREAT_PERSON_MC_TYRIAN_MERCHANT_20'),
			('UNIT_MC_TYRIAN_MERCHANT',	'TXT_KEY_GREAT_PERSON_MC_TYRIAN_MERCHANT_21');
--==========================================================================================================================
-- Unit_Builds
--==========================================================================================================================
INSERT INTO Unit_Builds 	
			(UnitType, 								BuildType)
SELECT		('UNIT_MC_TYRIAN_MERCHANT'),			BuildType
FROM Unit_Builds WHERE (UnitType = 'UNIT_MERCHANT');
--==========================================================================================================================
--==========================================================================================================================
