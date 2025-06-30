-- ============================================================================
-- ArtDefine_StrategicView table
-- ============================================================================
INSERT INTO ArtDefine_StrategicView
			(StrategicViewType, 						TileType,	Asset)
VALUES		('ART_DEF_UNIT_MC_MYSORE_CUSHOON_ROCKET',	'Unit', 	'SV_CushoonRocket.dds');

-- ============================================================================
-- ArtDefine_UnitInfos table	
-- ============================================================================
INSERT INTO ArtDefine_UnitInfos 
			(Type,										DamageStates,	Formation)
SELECT		('ART_DEF_UNIT_MC_MYSORE_CUSHOON_ROCKET'),	DamageStates,	Formation
FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT_GUIDED_MISSILE');

-- ============================================================================
-- ArtDefine_UnitInfoMemberInfos table
-- ============================================================================
INSERT INTO ArtDefine_UnitInfoMemberInfos
			(UnitInfoType,								UnitMemberInfoType,						NumMembers)
VALUES		('ART_DEF_UNIT_MC_MYSORE_CUSHOON_ROCKET',	'ART_DEF_UNIT_MEMBER_MYSORE_ROCKET',	3);

-- ============================================================================
-- ArtDefine_UnitMemberInfos table
-- ============================================================================
INSERT INTO ArtDefine_UnitMemberInfos
			(Type,                                  Scale,          ZOffset,    Domain, Model,                      MaterialTypeTag,    MaterialTypeSoundOverrideTag)
SELECT 		('ART_DEF_UNIT_MEMBER_MYSORE_ROCKET'),  (Scale * 0.5),  ZOffset,    Domain, ('MysoreRocket.fxsxml'),    MaterialTypeTag,    MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE (Type = 'ART_DEF_UNIT_MEMBER_GUIDEDMISSILE');

-- ============================================================================
-- ArtDefine_UnitMemberCombats table
-- ============================================================================
INSERT INTO ArtDefine_UnitMemberCombats
            (UnitMemberType,                        EnableActions,                      AttackRadius,   MoveRate,   TurnRateMin,    TurnRateMax,    PitchRateMin,   PitchRateMax,   HasRefaceAfterCombat,   HasCollisionAttack,     AttackAltitude)
VALUES      ('ART_DEF_UNIT_MEMBER_MYSORE_ROCKET',   'Idle Attack Bombard Death Run',    32.0,           2.5,        100.0,          100.0,          2.0,            6.0,            0,                      1,                      20.0);

-- ============================================================================
-- ArtDefine_UnitMemberCombatWeapons table
-- ============================================================================
INSERT INTO ArtDefine_UnitMemberCombatWeapons
            (UnitMemberType,                        "Index",    SubIndex,   VisKillStrengthMin, VisKillStrengthMax, HitEffect,                                  WeaponTypeTag,  WeaponTypeSoundOverrideTag)
VALUES      ('ART_DEF_UNIT_MEMBER_MYSORE_ROCKET',   0,          0,          100.0,              100.0,              'ART_DEF_VEFFECT_TANK_IMPACT_$(TERRAIN)',   'EXPLOSIVE',    'EXPLOSION6POUND');