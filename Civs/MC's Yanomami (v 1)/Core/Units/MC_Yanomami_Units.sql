--==========================================================================================================================
-- Units
--==========================================================================================================================
INSERT INTO Units
			(Type,								Class, Cost,	Range,	 PrereqTech, Combat,	RangedCombat,	Moves,		FaithCost,	RequiresFaithPurchaseEnabled, CombatClass, MilitarySupport, MilitaryProduction, Domain, Pillage, IgnoreBuildingDefense, ObsoleteTech,		GoodyHutUpgradeUnitClass,  XPValueAttack, XPValueDefense, Conscription,  DefaultUnitAI, Description, 								Civilopedia, 									Help, 											Strategy,											AdvancedStartCost,	UnitArtInfo, 								UnitFlagIconOffset,	UnitFlagAtlas,						PortraitIndex, 	IconAtlas)
SELECT		('UNIT_MC_YANOMAMI_DARTBLOWER'),	Class, Cost,	Range-1, PrereqTech, Combat+1,	RangedCombat+1, Moves-2,	FaithCost,	RequiresFaithPurchaseEnabled, CombatClass, MilitarySupport, MilitaryProduction,	Domain, Pillage, IgnoreBuildingDefense, ('TECH_MACHINERY'), ('UNITCLASS_CROSSBOWMAN'), XPValueAttack, XPValueDefense, Conscription,  DefaultUnitAI, ('TXT_KEY_UNIT_MC_YANOMAMI_DARTBLOWER'),	('TXT_KEY_UNIT_MC_YANOMAMI_DARTBLOWER_PEDIA'), 	('TXT_KEY_UNIT_MC_YANOMAMI_DARTBLOWER_HELP'), 	('TXT_KEY_UNIT_MC_YANOMAMI_DARTBLOWER_STRATEGY'),	AdvancedStartCost, 	('ART_DEF_UNIT_MC_YANOMAMI_DARTBLOWER'),	0,					('MC_YANOMAMI_DARTBLOWER_FLAG'),	2, 				('MC_YANOMAMI_ATLAS')
FROM Units WHERE (Type = 'UNIT_CHARIOT_ARCHER');

--==========================================================================================================================
-- Unit_AITypes
--==========================================================================================================================
INSERT INTO Unit_AITypes
			(UnitType, 							UnitAIType)
SELECT		('UNIT_MC_YANOMAMI_DARTBLOWER'),	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_ARCHER');

--==========================================================================================================================
-- Unit_ClassUpgrades
--==========================================================================================================================
INSERT INTO Unit_ClassUpgrades
			(UnitType, 						UnitClassType)
VALUES		('UNIT_MC_YANOMAMI_DARTBLOWER',	'UNITCLASS_CROSSBOWMAN');

--==========================================================================================================================
-- Unit_FreePromotions
--==========================================================================================================================
INSERT INTO Unit_FreePromotions
			(UnitType, 						PromotionType)
VALUES		('UNIT_MC_YANOMAMI_DARTBLOWER',	'PROMOTION_ONLY_DEFENSIVE'),
			('UNIT_MC_YANOMAMI_DARTBLOWER',	'PROMOTION_WOODSMAN'),
			('UNIT_MC_YANOMAMI_DARTBLOWER',	'PROMOTION_MC_YANOMAMI_LISTENER');	

--==========================================================================================================================
-- Unit_Flavors
--==========================================================================================================================
INSERT INTO Unit_Flavors
			(UnitType,						 FlavorType, Flavor)
SELECT		('UNIT_MC_YANOMAMI_DARTBLOWER'), FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_ARCHER');

--==========================================================================================================================
-- UnitGameplay2DScripts
--==========================================================================================================================
INSERT INTO UnitGameplay2DScripts
(UnitType, 									SelectionSound, FirstSelectionSound)
SELECT		('UNIT_MC_YANOMAMI_DARTBLOWER'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_ARCHER');

--==========================================================================================================================
--==========================================================================================================================
