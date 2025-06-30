INSERT INTO IconTextureAtlases
		(Atlas,	IconSize,	Filename,	IconsPerRow,	IconsPerColumn)
VALUES	('ATLAS_RHO_CHONO',	256,	'ChonoAtlas_256.dds',	2,	2),
		('ATLAS_RHO_CHONO',	128,	'ChonoAtlas_128.dds',	2,  2),
		('ATLAS_RHO_CHONO',	80,	'ChonoAtlas_80.dds',	2,	2),
		('ATLAS_RHO_CHONO',	64,	'ChonoAtlas_64.dds',	2,	2),
		('ATLAS_RHO_CHONO',	45,	'ChonoAtlas_45.dds',	2,	2),
		('ATLAS_RHO_CHONO',	32,	'ChonoAtlas_32.dds',	2,	2),
		('ALPHA_RHO_WALT',	32,	'WaltUnitflag32.dds',	1,	1),
		('ALPHA_RHO_DALCA',	32,	'DalcaUnitflag32.dds',	1,	1),
		('ALPHA_RHO_CHONO',	64,	'chonoAlpha64.dds',	1,	1),
		('ALPHA_RHO_CHONO',	48,	'chonoAlpha48.dds',	1,	1),
		('ALPHA_RHO_CHONO',	32,	'chonoAlpha32.dds',	1,	1),
		('ALPHA_RHO_CHONO',	24,	'chonoAlpha24.dds',	1,	1);
--Dalca
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 			TileType,	Asset)
SELECT	'ART_DEF_UNIT_RHO_DALCA',	TileType, 	'svDalca.dds'
FROM ArtDefine_StrategicView WHERE StrategicViewType = 'ART_DEF_UNIT_WORKBOAT';

INSERT INTO ArtDefine_UnitInfos
          (Type,                             DamageStates,    Formation)
SELECT    'ART_DEF_UNIT_RHO_DALCA',         DamageStates,     Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_WORKBOAT';

INSERT INTO ArtDefine_UnitInfoMemberInfos
          (UnitInfoType,                  UnitMemberInfoType,                  NumMembers)
SELECT    'ART_DEF_UNIT_RHO_DALCA',     'ART_DEF_UNIT_MEMBER_RHO_DALCA',     NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_WORKBOAT';

INSERT INTO ArtDefine_UnitMemberCombats
(UnitMemberType,                                       EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT    'ART_DEF_UNIT_MEMBER_RHO_DALCA',    EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax,   LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack,    HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat,  ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack,      AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_WORKBOAT';

INSERT INTO ArtDefine_UnitMemberCombatWeapons
(UnitMemberType,                                       "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT    'ART_DEF_UNIT_MEMBER_RHO_DALCA',    "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_WORKBOAT';

INSERT INTO ArtDefine_UnitMemberInfos
(Type,                                         Scale,    ZOffset, Domain, Model,    MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT    'ART_DEF_UNIT_MEMBER_RHO_DALCA',    Scale,    ZOffset, Domain, Model,    MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_WORKBOAT';
--Walt
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 			TileType,	Asset)
SELECT	'ART_DEF_UNIT_RHO_WALT',	TileType, 	'svWalt.dds'
FROM ArtDefine_StrategicView WHERE StrategicViewType = 'ART_DEF_UNIT_COMPOSITE_BOWMAN';

INSERT INTO ArtDefine_UnitInfos
          (Type,                             DamageStates,    Formation)
SELECT    'ART_DEF_UNIT_RHO_WALT',         DamageStates,     Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_COMPOSITE_BOWMAN';

INSERT INTO ArtDefine_UnitInfoMemberInfos
          (UnitInfoType,                  UnitMemberInfoType,                  NumMembers)
SELECT    'ART_DEF_UNIT_RHO_WALT',     'ART_DEF_UNIT_MEMBER_RHO_WALT',     NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_COMPOSITE_BOWMAN';

INSERT INTO ArtDefine_UnitMemberCombats
(UnitMemberType,                                       EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT    'ART_DEF_UNIT_MEMBER_RHO_WALT',    EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax,   LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack,    HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat,  ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack,      AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_COMPOSITE_BOWMAN';

INSERT INTO ArtDefine_UnitMemberCombatWeapons
(UnitMemberType,                                       "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT    'ART_DEF_UNIT_MEMBER_RHO_WALT',    "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_COMPOSITE_BOWMAN';

INSERT INTO ArtDefine_UnitMemberInfos
(Type,                                         Scale,    ZOffset, Domain, Model,    MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT    'ART_DEF_UNIT_MEMBER_RHO_WALT',    Scale,    ZOffset, Domain, Model,    MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_COMPOSITE_BOWMAN';

--Sound
INSERT INTO Audio_Sounds 
		(SoundID, 									         Filename, 		          LoadType)
VALUES	('SND_LEADER_MUSIC_RHO_OLLETA_PEACE', 		'ChonoPeace',    'DynamicResident'),
		('SND_LEADER_MUSIC_RHO_OLLETA_WAR', 	   	    'ChonoWar',      'DynamicResident');

INSERT INTO Audio_2DSounds 
		(ScriptID, 										SoundID, 									SoundType, 		TaperSoundtrackVolume,	MinVolume, 	MaxVolume,  IsMusic, Looping)
VALUES	('AS2D_LEADER_MUSIC_RHO_OLLETA_PEACE', 		'SND_LEADER_MUSIC_RHO_OLLETA_PEACE', 		'GAME_MUSIC', 	-1.0,					80, 		80, 		1, 		 0),
		('AS2D_LEADER_MUSIC_RHO_OLLETA_WAR', 			'SND_LEADER_MUSIC_RHO_OLLETA_WAR', 		'GAME_MUSIC', 	-1.0,					80, 		80, 		1,		 0);