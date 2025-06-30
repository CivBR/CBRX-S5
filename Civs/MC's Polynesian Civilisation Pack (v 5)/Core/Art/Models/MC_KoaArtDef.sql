--==========================================================================================================================
-- ArtDefine_StrategicView
--==========================================================================================================================
INSERT INTO ArtDefine_StrategicView
            (StrategicViewType,					TileType,   Asset)
VALUES      ('ART_DEF_UNIT_MC_HAWAIIAN_KOA',  'Unit',     'sv_Koa.dds');

--==========================================================================================================================
-- ArtDefine_UnitInfos
--==========================================================================================================================           
INSERT INTO ArtDefine_UnitInfos
            (Type,								DamageStates,   Formation)
SELECT      ('ART_DEF_UNIT_MC_HAWAIIAN_KOA'),	DamageStates,   Formation
FROM ArtDefine_UnitInfos WHERE  (Type = 'ART_DEF_UNIT_U_AZTEC_JAGUAR');

--==========================================================================================================================
-- ArtDefine_UnitInfoMemberInfos
--==========================================================================================================================   
INSERT INTO ArtDefine_UnitInfoMemberInfos  
            (UnitInfoType,						UnitMemberInfoType,							NumMembers)
SELECT      ('ART_DEF_UNIT_MC_HAWAIIAN_KOA'),	('ART_DEF_UNIT_MEMBER_MC_HAWAIIAN_KOA'),	NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_U_AZTEC_JAGUAR');

--==========================================================================================================================
-- ArtDefine_UnitMemberCombats
--==========================================================================================================================
INSERT INTO ArtDefine_UnitMemberCombats
            (UnitMemberType,							EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT      ('ART_DEF_UNIT_MEMBER_MC_HAWAIIAN_KOA'),	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_U_AZTEC_JAGUAR');

--==========================================================================================================================
-- ArtDefine_UnitMemberCombatWeapons
--==========================================================================================================================
INSERT INTO ArtDefine_UnitMemberCombatWeapons  
            (UnitMemberType,							"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT      ('ART_DEF_UNIT_MEMBER_MC_HAWAIIAN_KOA'),	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_U_AZTEC_JAGUAR');

INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 			 SelectionSound, FirstSelectionSound)
SELECT	'UNIT_MC_HAWAIIAN_KOA',	 SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_WARRIOR';
--==========================================================================================================================
-- ArtDefine_UnitMemberInfos
--==========================================================================================================================   
INSERT INTO ArtDefine_UnitMemberInfos  
            (Type,										Scale, ZOffset, Domain, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT      ('ART_DEF_UNIT_MEMBER_MC_HAWAIIAN_KOA'),	Scale, ZOffset, Domain, ('hawaii_ikaika.fxsxml'), MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE (Type = 'ART_DEF_UNIT_MEMBER_U_AZTEC_JAGUAR');
--==========================================================================================================================
--==========================================================================================================================