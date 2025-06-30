-- ======================================================================================================
-- ICON ATLASES
-- ======================================================================================================
-- IconTextureAtlases
---------------------
INSERT INTO IconTextureAtlases
(Atlas,                          IconSize,    Filename,                     IconsPerRow,       IconsPerColumn)
VALUES    ('THP_TANG_ATLAS',     256,        'THP_TangAtlas256.dds',        2,                 2),
('THP_TANG_ATLAS',               128,        'THP_TangAtlas128.dds',        2,                 2),
('THP_TANG_ATLAS',               80,         'THP_TangAtlas80.dds',         2,                 2),
('THP_TANG_ATLAS',               64,         'THP_TangAtlas64.dds',         2,                 2),
('THP_TANG_ATLAS',               45,         'THP_TangAtlas45.dds',         2,                 2),
('THP_TANG_ATLAS',               32,         'THP_TangAtlas32.dds',         2,                 2),
('THP_TANG_ALPHA_ATLAS',         128,        'THP_TangAlpha128.dds',        1,                 1),
('THP_TANG_ALPHA_ATLAS',         64,         'THP_TangAlpha64.dds',         1,                 1),
('THP_TANG_ALPHA_ATLAS',         48,         'THP_TangAlpha48.dds',         1,                 1),
('THP_TANG_ALPHA_ATLAS',         32,         'THP_TangAlpha32.dds',         1,                 1),
('THP_TANG_ALPHA_ATLAS',         24,         'THP_TangAlpha24.dds',         1,                 1),
('THP_TANG_ALPHA_ATLAS',         16,         'THP_TangAlpha16.dds',         1,                 1),
('THP_UNIT_FORBIDDENGUARD_FLAG_ATLAS',     32,         'Unit_ForbiddenGuard_Flag_32.dds',       1,                 1);
-- ======================================================================================================
-- COLORS
-- ======================================================================================================
-- Colors
---------
INSERT INTO Colors
(Type,                                     Red,     Green,    Blue,     Alpha)
VALUES    ('COLOR_PLAYER_THP_TANG_ICON',   0.647,   0.639,    0.129,    1),
('COLOR_PLAYER_THP_TANG_BACKGROUND',       0.294,   0.067,    0.043,    1);
---------------
-- PlayerColors
---------------
INSERT INTO PlayerColors
          (Type,                           PrimaryColor,                     SecondaryColor,                   TextColor)
VALUES    ('PLAYERCOLOR_THP_TANG',        'COLOR_PLAYER_THP_TANG_ICON',     'COLOR_PLAYER_THP_TANG_BACKGROUND',     'COLOR_PLAYER_WHITE_TEXT');
-- ======================================================================================================
-- UNIT ART
-- ======================================================================================================
-- ArtDefine_StrategicView
--------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 		             TileType,		 Asset)
VALUES	('ART_DEF_UNIT_THP_FORBIDDENGUARD',		'Unit', 		'sv_forbidden_guard.dds');
----------------------
-- ArtDefine_UnitInfos
----------------------
INSERT INTO ArtDefine_UnitInfos
          (Type,                                     DamageStates,    Formation)
SELECT    'ART_DEF_UNIT_THP_FORBIDDENGUARD',         DamageStates,     Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_COMPOSITE_BOWMAN';
--------------------------------
-- ArtDefine_UnitInfoMemberInfos
--------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos
          (UnitInfoType,                          UnitMemberInfoType,                          NumMembers)
SELECT    'ART_DEF_UNIT_THP_FORBIDDENGUARD',     'ART_DEF_UNIT_MEMBER_THP_FORBIDDENGUARD',     NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_COMPOSITE_BOWMAN';
------------------------------
-- ArtDefine_UnitMemberCombats
------------------------------
INSERT INTO ArtDefine_UnitMemberCombats
(UnitMemberType,                                       EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT    'ART_DEF_UNIT_MEMBER_THP_FORBIDDENGUARD',    EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax,   LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack,    HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat,  ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack,      AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_COMPOSITE_BOWMAN';
------------------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons
(UnitMemberType,                                       "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT    'ART_DEF_UNIT_MEMBER_THP_FORBIDDENGUARD',    "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_COMPOSITE_BOWMAN';
----------------------------
-- ArtDefine_UnitMemberInfos
----------------------------
INSERT INTO ArtDefine_UnitMemberInfos
(Type,                                                 Scale,    ZOffset, Domain, Model,                         MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT    'ART_DEF_UNIT_MEMBER_THP_FORBIDDENGUARD',    Scale,    ZOffset, Domain, 'Crossbowman_China.fxsxml',    MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_COMPOSITE_BOWMAN';
-- ======================================================================================================
-- AUDIO
-- ======================================================================================================
-- Audio_Sounds
---------------
INSERT INTO Audio_Sounds 
		(SoundID, 									 Filename, 		  LoadType)
VALUES	('SND_LEADER_MUSIC_THP_TAIZONG_PEACE', 		'Tang_Peace',    'DynamicResident'),
		('SND_LEADER_MUSIC_THP_TAIZONG_WAR', 		'Tang_War', 	 'DynamicResident');
-----------------
-- Audio_2DSounds
-----------------
INSERT INTO Audio_2DSounds 
		(ScriptID, 										SoundID, 									SoundType, 		TaperSoundtrackVolume,	MinVolume, 	MaxVolume,  IsMusic, Looping)
VALUES	('AS2D_LEADER_MUSIC_THP_TAIZONG_PEACE', 		'SND_LEADER_MUSIC_THP_TAIZONG_PEACE', 		'GAME_MUSIC', 	-1.0,					90, 		100, 		1, 		 0),
		('AS2D_LEADER_MUSIC_THP_TAIZONG_WAR', 			'SND_LEADER_MUSIC_THP_TAIZONG_WAR', 		'GAME_MUSIC', 	-1.0,					90, 		100, 		1,		 0);
-- ======================================================================================================
-- ======================================================================================================
