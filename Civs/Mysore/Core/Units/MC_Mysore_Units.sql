--==========================================================================================================================
-- UnitClasses
--==========================================================================================================================
INSERT INTO UnitClasses
		(Type, 									DefaultUnit, 							Description)
VALUES	('UNITCLASS_MC_MYSORE_CUSHOON_ROCKET', 	'UNIT_MC_MYSORE_CUSHOON_ROCKET',	 	'TXT_KEY_UNIT_MC_MYSORE_CUSHOON_ROCKET');

--==========================================================================================================================
-- Units
--==========================================================================================================================
INSERT INTO Units
			(Type,						Class, Cost, Range, PrereqTech, Combat,	RangedCombat, Moves,	SpecialCargo,				FaithCost,	RequiresFaithPurchaseEnabled, CombatClass, MilitarySupport, MilitaryProduction, Domain, Pillage, IgnoreBuildingDefense, ObsoleteTech, GoodyHutUpgradeUnitClass, XPValueAttack, XPValueDefense, Conscription,  DefaultUnitAI, Description, 							Civilopedia, 								Help, 										Strategy,										AdvancedStartCost,	UnitArtInfo, 						UnitFlagIconOffset,	UnitFlagAtlas,				PortraitIndex, 	IconAtlas)
SELECT		('UNIT_MC_MYSORE_CUSHOON'),	Class, Cost, Range, PrereqTech, Combat,	RangedCombat, Moves,	('SPECIALUNIT_MISSILE'),	FaithCost,	RequiresFaithPurchaseEnabled, CombatClass, MilitarySupport, MilitaryProduction,	Domain, Pillage, IgnoreBuildingDefense, ObsoleteTech, GoodyHutUpgradeUnitClass, XPValueAttack, XPValueDefense, Conscription,  DefaultUnitAI, ('TXT_KEY_UNIT_MC_MYSORE_CUSHOON'),	('TXT_KEY_UNIT_MC_MYSORE_CUSHOON_PEDIA'), 	('TXT_KEY_UNIT_MC_MYSORE_CUSHOON_HELP'), 	('TXT_KEY_UNIT_MC_MYSORE_CUSHOON_STRATEGY'),	AdvancedStartCost, 	('ART_DEF_UNIT_MC_MYSORE_CUSHOON'), 0,					('MC_MYSORE_CUSHOON_FLAG'),	3, 				('MC_MYSORE_ATLAS')
FROM Units WHERE (Type = 'UNIT_MUSKETMAN');

INSERT INTO Units
			(Type,								Class,									Cost, Moves, Immobile,	PrereqTech,				NoMaintenance,	Range,	RangedCombat,	Special,				Domain,			DefaultUnitAI,			CombatLimit, MilitarySupport,	MilitaryProduction,	IgnoreBuildingDefense,	Suicide,	AirUnitCap,	RangedCombatLimit,	XPValueDefense,	MoveRate,		Description, 								Civilopedia, 									Help, 											Strategy,											UnitArtInfo, 							 UnitFlagIconOffset,	UnitFlagAtlas,						PortraitIndex, 	IconAtlas)
VALUES		('UNIT_MC_MYSORE_CUSHOON_ROCKET',	'UNITCLASS_MC_MYSORE_CUSHOON_ROCKET',	-1,   2,	 1,			null,		1,				2,		30,				'SPECIALUNIT_MISSILE',	'DOMAIN_AIR',	'UNITAI_MISSILE_AIR',	0,			 1,					1,					1,						1,			1,			100,				2,				'AIR_REBASE',	'TXT_KEY_UNIT_MC_MYSORE_CUSHOON_ROCKET',	'TXT_KEY_UNIT_MC_MYSORE_CUSHOON_ROCKET_PEDIA', 	'TXT_KEY_UNIT_MC_MYSORE_CUSHOON_ROCKET_HELP', 	'TXT_KEY_UNIT_MC_MYSORE_CUSHOON_ROCKET_STRATEGY',	'ART_DEF_UNIT_MC_MYSORE_CUSHOON_ROCKET', 0,						'MC_MYSORE_CUSHOON_ROCKET_FLAG',	4, 				'MC_MYSORE_ATLAS');


--==========================================================================================================================
-- Unit_AITypes
--==========================================================================================================================
INSERT INTO Unit_AITypes
			(UnitType,						UnitAIType)
SELECT		('UNIT_MC_MYSORE_CUSHOON'), 	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_MUSKETMAN');

INSERT INTO Unit_AITypes
			(UnitType, 							UnitAIType)
SELECT		('UNIT_MC_MYSORE_CUSHOON_ROCKET'),	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_GUIDED_MISSILE');

--==========================================================================================================================
-- Unit_ClassUpgrades
--==========================================================================================================================
INSERT INTO Unit_ClassUpgrades
			(UnitType, 						UnitClassType)
SELECT		('UNIT_MC_MYSORE_CUSHOON'), 	UnitClassType
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_MUSKETMAN');

INSERT INTO Unit_ClassUpgrades
			(UnitType, 							UnitClassType)
VALUES		('UNIT_MC_MYSORE_CUSHOON_ROCKET',	'UNITCLASS_GUIDED_MISSILE');	

--==========================================================================================================================
-- Unit_Flavors
--==========================================================================================================================
INSERT INTO Unit_Flavors
			(UnitType,						FlavorType, Flavor)
SELECT		('UNIT_MC_MYSORE_CUSHOON'), 	FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_MUSKETMAN');

INSERT INTO Unit_Flavors
			(UnitType,							FlavorType, Flavor)
SELECT		('UNIT_MC_MYSORE_CUSHOON_ROCKET'), 	FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_GUIDED_MISSILE');

INSERT INTO Unit_Flavors
			(UnitType,					FlavorType,		Flavor)
VALUES		('UNIT_MC_MYSORE_CUSHOON',  'FLAVOR_AIR',	5);

--==========================================================================================================================
-- Unit_FreePromotions
--==========================================================================================================================
INSERT INTO Unit_FreePromotions
			(UnitType, 						PromotionType)
VALUES		('UNIT_MC_MYSORE_CUSHOON',		'PROMOTION_CARGO_II'),
			('UNIT_MC_MYSORE_CUSHOON',		'PROMOTION_MC_MYSORE_CUSHOON'),
			('UNIT_MC_MYSORE_CUSHOON',		'PROMOTION_MC_CUSHOON_ROCKET');

--==========================================================================================================================
-- UnitGameplay2DScripts
--==========================================================================================================================
INSERT INTO UnitGameplay2DScripts
(UnitType, 									SelectionSound, FirstSelectionSound)
SELECT		('UNIT_MC_MYSORE_CUSHOON'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_MUSKETMAN');
--==========================================================================================================================
--==========================================================================================================================
