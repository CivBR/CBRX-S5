-- ======================================================================================================
-- ICON ATLASES
-- ======================================================================================================
-- IconTextureAtlases
---------------------
INSERT INTO IconTextureAtlases
(Atlas,                           IconSize,    Filename,                      IconsPerRow,       IconsPerColumn)
VALUES    ('THP_GUAYCURU_ATLAS',     256,        'THP_GuaycuruAtlas256.dds',        2,                 2),
('THP_GUAYCURU_ATLAS',               128,        'THP_GuaycuruAtlas128.dds',        2,                 2),
('THP_GUAYCURU_ATLAS',               80,         'THP_GuaycuruAtlas80.dds',         2,                 2),
('THP_GUAYCURU_ATLAS',               64,         'THP_GuaycuruAtlas64.dds',         2,                 2),
('THP_GUAYCURU_ATLAS',               45,         'THP_GuaycuruAtlas45.dds',         2,                 2),
('THP_GUAYCURU_ATLAS',               32,         'THP_GuaycuruAtlas32.dds',         2,                 2),
('THP_GUAYCURU_ALPHA_ATLAS',         128,        'THP_GuaycuruAlpha128.dds',        1,                 1),
('THP_GUAYCURU_ALPHA_ATLAS',         64,         'THP_GuaycuruAlpha64.dds',         1,                 1),
('THP_GUAYCURU_ALPHA_ATLAS',         48,         'THP_GuaycuruAlpha48.dds',         1,                 1),
('THP_GUAYCURU_ALPHA_ATLAS',         32,         'THP_GuaycuruAlpha32.dds',         1,                 1),
('THP_GUAYCURU_ALPHA_ATLAS',         24,         'THP_GuaycuruAlpha24.dds',         1,                 1),
('THP_GUAYCURU_ALPHA_ATLAS',         16,         'THP_GuaycuruAlpha16.dds',         1,                 1),
('THP_UNIT_HALIAGANEK_FLAG_ATLAS',   32,         'Unit_Haliaganek_Flag_32.dds',     1,                 1);
-- ======================================================================================================
-- COLORS
-- ======================================================================================================
-- Colors
---------
INSERT INTO Colors
          (Type,                               Red,     Green,    Blue,     Alpha)
VALUES    ('COLOR_PLAYER_THP_GUAYCURU_ICON',   0.529,   0.267,    0.125,    1),
('COLOR_PLAYER_THP_GUAYCURU_BACKGROUND',       0.839,   0.780,    0.596,    1);
---------------
-- PlayerColors
---------------
INSERT INTO PlayerColors
          (Type,                           PrimaryColor,                     SecondaryColor,                   TextColor)
VALUES    ('PLAYERCOLOR_THP_GUAYCURU',        'COLOR_PLAYER_THP_GUAYCURU_ICON',     'COLOR_PLAYER_THP_GUAYCURU_BACKGROUND',     'COLOR_PLAYER_WHITE_TEXT');
-- ======================================================================================================
-- UNIT ART
-- ======================================================================================================
-- ArtDefine_StrategicView
--------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 		         TileType,		 Asset)
VALUES	('ART_DEF_UNIT_THP_HALIAGANEK',		'Unit', 		'sv_haliaganek.dds');
----------------------
-- ArtDefine_UnitInfos
----------------------
INSERT INTO ArtDefine_UnitInfos
          (Type,                                 DamageStates,     Formation)
SELECT    'ART_DEF_UNIT_THP_HALIAGANEK',         DamageStates,     Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_HORSEMAN';
--------------------------------
-- ArtDefine_UnitInfoMemberInfos
--------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos
          (UnitInfoType,                      UnitMemberInfoType,                      NumMembers)
SELECT    'ART_DEF_UNIT_THP_HALIAGANEK',     'ART_DEF_UNIT_MEMBER_THP_HALIAGANEK',     NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_HORSEMAN';
------------------------------
-- ArtDefine_UnitMemberCombats
------------------------------
INSERT INTO ArtDefine_UnitMemberCombats
(UnitMemberType,                                   EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT    'ART_DEF_UNIT_MEMBER_THP_HALIAGANEK',    EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax,   LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack,    HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat,  ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack,      AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_HORSEMAN';
------------------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons
(UnitMemberType,                                   "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT    'ART_DEF_UNIT_MEMBER_THP_HALIAGANEK',    "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_HORSEMAN';
----------------------------
-- ArtDefine_UnitMemberInfos
----------------------------
INSERT INTO ArtDefine_UnitMemberInfos
(Type,                                             Scale,    ZOffset, Domain, Model,                       MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT    'ART_DEF_UNIT_MEMBER_THP_HALIAGANEK',    Scale,    ZOffset, Domain, 'civ5_irohm5.fxsxml',    MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_HORSEMAN';
-- ======================================================================================================
-- AUDIO
-- ======================================================================================================
-- Audio_Sounds
---------------
INSERT INTO Audio_Sounds 
		(SoundID, 							     Filename, 		   LoadType)
VALUES	('SND_LEADER_MUSIC_THP_ESO_PEACE', 		'Guaycuru_Peace', 'DynamicResident'),
		('SND_LEADER_MUSIC_THP_ESO_WAR', 		'Guaycuru_War',   'DynamicResident');
-----------------
-- Audio_2DSounds
-----------------
INSERT INTO Audio_2DSounds 
		(ScriptID, 										SoundID, 									SoundType, 		TaperSoundtrackVolume,	MinVolume, 	MaxVolume,  IsMusic, Looping)
VALUES	('AS2D_LEADER_MUSIC_THP_ESO_PEACE', 		'SND_LEADER_MUSIC_THP_ESO_PEACE', 		'GAME_MUSIC', 	-1.0,					100, 		100, 		1, 		 0),
		('AS2D_LEADER_MUSIC_THP_ESO_WAR', 			'SND_LEADER_MUSIC_THP_ESO_WAR', 		'GAME_MUSIC', 	-1.0,					100, 		100, 		1,		 0);
-- ======================================================================================================
-- ======================================================================================================
