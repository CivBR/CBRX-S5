--==========================================================================================================================
-- Units
--==========================================================================================================================	
INSERT INTO Units 	
			(Class,	Type, 					PrereqTech,		Range, RangedCombat,	Combat,		FaithCost,			RequiresFaithPurchaseEnabled, Cost,		Moves, 	CombatClass, Domain, DefaultUnitAI, Description, 				Civilopedia, 					Strategy, 								Help, 								MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, AdvancedStartCost, GoodyHutUpgradeUnitClass, CombatLimit, XPValueAttack, XPValueDefense, Conscription, UnitArtInfo, 					UnitFlagAtlas, 			UnitFlagIconOffset, PortraitIndex,	IconAtlas,				WorkRate)
SELECT		Class,	'UNIT_CLOGICHIDA', 		PrereqTech,		Range, RangedCombat,	Combat-3,		FaithCost-30,	RequiresFaithPurchaseEnabled, Cost-15,	Moves, 	CombatClass, Domain, DefaultUnitAI, 'TXT_KEY_UNIT_CLOGICHIDA', 	'TXT_KEY_CIV5_CLOGICHIDA_TEXT',	'TXT_KEY_UNIT_CLOGICHIDA_STRATEGY',		'TXT_KEY_UNIT_CLOGICHIDA_HELP',		MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, AdvancedStartCost, GoodyHutUpgradeUnitClass, CombatLimit, XPValueAttack, XPValueDefense, Conscription, 'ART_DEF_UNIT_CLOGICHIDA', 		'CLOGICHIDA_FLAG',		0,					2, 				'CLANISHINAABE_ATLAS',	WorkRate
FROM Units WHERE (Type = 'UNIT_MUSKETMAN');
--==========================================================================================================================
-- Unit_AITypes
--==========================================================================================================================	
INSERT INTO Unit_AITypes 	
			(UnitType, 			UnitAIType)
SELECT		'UNIT_CLOGICHIDA', 	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_MUSKETMAN');
--==========================================================================================================================
-- Unit_Flavors
--==========================================================================================================================	
INSERT INTO Unit_Flavors 	
			(UnitType, 			FlavorType, Flavor)
SELECT		'UNIT_CLOGICHIDA', 	FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_MUSKETMAN');
--==========================================================================================================================
-- UnitPromotions
--==========================================================================================================================	
INSERT INTO UnitPromotions 
			(Type, 							Description, 						Help, 									Sound, 				CannotBeChosen, PortraitIndex,  IconAtlas, 			PediaType, 			PediaEntry,						IgnoreZOC)
VALUES		('PROMOTION_CLOGICHIDA',		'TXT_KEY_PROMOTION_CLOGICHIDA',		'TXT_KEY_PROMOTION_CLOGICHIDA_HELP',	'AS2D_IF_LEVELUP', 	1, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_CLOGICHIDA',	1);
--==========================================================================================================================
-- Unit_FreePromotions
--==========================================================================================================================	
INSERT INTO Unit_FreePromotions 
			(UnitType, 				PromotionType)
VALUES		('UNIT_CLOGICHIDA', 	'PROMOTION_CLOGICHIDA');
--==========================================================================================================================
-- Unit_ClassUpgrades
--==========================================================================================================================	
INSERT INTO Unit_ClassUpgrades 	
			(UnitType, 			UnitClassType)
SELECT		'UNIT_CLOGICHIDA',	UnitClassType
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_MUSKETMAN');

INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 			 SelectionSound, FirstSelectionSound)
SELECT	'UNIT_CLOGICHIDA',	 SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_MUSKETMAN';
--==========================================================================================================================
-- ARTDEFINES
--==========================================================================================================================	
------------------------------
-- ArtDefine_UnitInfos
------------------------------		
INSERT INTO ArtDefine_UnitInfos 
			(Type, 								DamageStates,	Formation)
SELECT		('ART_DEF_UNIT_CLOGICHIDA'), 		DamageStates, 	('UnFormed')
FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT_U_AMERICAN_MINUTEMAN');
------------------------------
-- ArtDefine_UnitInfoMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
			(UnitInfoType,						UnitMemberInfoType,						NumMembers)
SELECT		('ART_DEF_UNIT_CLOGICHIDA'), 		('ART_DEF_UNIT_MEMBER_CLOGICHIDA'), 	10
FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_U_AMERICAN_MINUTEMAN');
------------------------------
-- ArtDefine_UnitMemberCombats
------------------------------
INSERT INTO ArtDefine_UnitMemberCombats 
			(UnitMemberType,						EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT		('ART_DEF_UNIT_MEMBER_CLOGICHIDA'),	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_U_AMERICAN_MINUTEMAN');
------------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
			(UnitMemberType,						"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT		('ART_DEF_UNIT_MEMBER_CLOGICHIDA'),	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_U_AMERICAN_MINUTEMAN');
------------------------------
-- ArtDefine_UnitMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitMemberInfos 	
			(Type, 									Scale, ZOffset, Domain, Model, 							MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT		('ART_DEF_UNIT_MEMBER_CLOGICHIDA'),	Scale, ZOffset, Domain, ('CL_Ogichidaa.fxsxml'),	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE (Type = 'ART_DEF_UNIT_MEMBER_U_AMERICAN_MINUTEMAN');
------------------------------
-- ArtDefine_StrategicView
------------------------------
INSERT OR REPLACE INTO ArtDefine_StrategicView 
			(StrategicViewType, 			TileType,	Asset)
SELECT		('ART_DEF_UNIT_CLOGICHIDA'), 	TileType, 	'SV_Ogichiida.dds'
FROM ArtDefine_StrategicView WHERE (StrategicViewType = 'ART_DEF_UNIT_U_AMERICAN_MINUTEMAN');
--==========================================================================================================================	
--==========================================================================================================================	
--==========================================================================================================================	
--==========================================================================================================================	
-- Language_en_US
--==========================================================================================================================		
INSERT INTO Language_en_US
			(Tag,											Text)
VALUES		('TXT_KEY_UNIT_CLOGICHIDA',						'Ogichida'),
			('TXT_KEY_CIV5_CLOGICHIDA_TEXT',				'The Ogichida was the main foot soldier of the Anishinaabe when they struggled against America. Cunning tactics on the part of the Ogichida allowed them to momentarily overcome the superior might of the American army.'),
			('TXT_KEY_UNIT_CLOGICHIDA_STRATEGY',			'The Ogichida performs as well as a Longswordman, and can ignore nearby enemies when moving. Use this to get to enemy cities while your spies have rendered them defenseless.'),
			('TXT_KEY_UNIT_CLOGICHIDA_HELP',				'Cheaper than the Musketman it replaces, the Ogichida is weaker but ignores nearby enemies when moving.'),
			('TXT_KEY_PROMOTION_CLOGICHIDA',				'Stealthy'),
			('TXT_KEY_PROMOTION_CLOGICHIDA_HELP',			'Ignore the effect of nearby enemies when moving.');