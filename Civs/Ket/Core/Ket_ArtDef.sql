-- ======================================================================================================
-- ICON ATLASES
-- ======================================================================================================
-- IconTextureAtlases
---------------------
INSERT INTO IconTextureAtlases
(Atlas,                         IconSize,    Filename,                    IconsPerRow,       IconsPerColumn)
VALUES    ('THP_KET_ATLAS',     256,        'THP_KetAtlas256.dds',        2,                 2),
('THP_KET_ATLAS',               128,        'THP_KetAtlas128.dds',        2,                 2),
('THP_KET_ATLAS',               80,         'THP_KetAtlas80.dds',         2,                 2),
('THP_KET_ATLAS',               64,         'THP_KetAtlas64.dds',         2,                 2),
('THP_KET_ATLAS',               45,         'THP_KetAtlas45.dds',         2,                 2),
('THP_KET_ATLAS',               32,         'THP_KetAtlas32.dds',         2,                 2),
('THP_KET_ALPHA_ATLAS',         128,        'THP_KetAlpha128.dds',        1,                 1),
('THP_KET_ALPHA_ATLAS',         64,         'THP_KetAlpha64.dds',         1,                 1),
('THP_KET_ALPHA_ATLAS',         48,         'THP_KetAlpha48.dds',         1,                 1),
('THP_KET_ALPHA_ATLAS',         32,         'THP_KetAlpha32.dds',         1,                 1),
('THP_KET_ALPHA_ATLAS',         24,         'THP_KetAlpha24.dds',         1,                 1),
('THP_KET_ALPHA_ATLAS',         16,         'THP_KetAlpha16.dds',         1,                 1),
('THP_UNIT_FISHBOWMAN_FLAG_ATLAS',     32,         'Unit_FishBowman_Flag_32.dds',       1,                 1),
('THP_UNIT_SENING_FLAG_ATLAS',         32,         'Unit_Sening_Flag_32.dds',           1,                 1);
-- ======================================================================================================
-- COLORS
-- ======================================================================================================
-- Colors
---------
INSERT INTO Colors
(Type,                                    Red,     Green,    Blue,     Alpha)
VALUES    ('COLOR_PLAYER_THP_KET_ICON',   0.576,   0.137,    0.137,    1),
('COLOR_PLAYER_THP_KET_BACKGROUND',       0.427,   0.537,    0.514,    1);
---------------
-- PlayerColors
---------------
INSERT INTO PlayerColors
          (Type,                          PrimaryColor,                    SecondaryColor,                   TextColor)
VALUES    ('PLAYERCOLOR_THP_KET',        'COLOR_PLAYER_THP_KET_ICON',     'COLOR_PLAYER_THP_KET_BACKGROUND',     'COLOR_PLAYER_WHITE_TEXT');
-- ======================================================================================================
-- UNIT ART
-- ======================================================================================================
-- ArtDefine_StrategicView
--------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 		         TileType,		 Asset)
VALUES	('ART_DEF_UNIT_THP_FISHBOWMAN',		'Unit', 		'sv_fishbowman.dds'),
        ('ART_DEF_UNIT_THP_SENING',         'Unit',         'sv_sening.dds');
----------------------
-- ArtDefine_UnitInfos
----------------------
INSERT INTO ArtDefine_UnitInfos
          (Type,                                 DamageStates,    Formation)
SELECT    'ART_DEF_UNIT_THP_FISHBOWMAN',         DamageStates,     Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_ARCHER';

INSERT INTO ArtDefine_UnitInfos
        (Type,                      DamageStates,  Formation)
VALUES  ('ART_DEF_UNIT_THP_SENING', 1,            'EarlyGreatArtist');
--------------------------------
-- ArtDefine_UnitInfoMemberInfos
--------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos
          (UnitInfoType,                      UnitMemberInfoType,                      NumMembers)
SELECT    'ART_DEF_UNIT_THP_FISHBOWMAN',     'ART_DEF_UNIT_MEMBER_THP_FISHBOWMAN',     NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_ARCHER';

INSERT INTO ArtDefine_UnitInfoMemberInfos
        (UnitInfoType,               UnitMemberInfoType,                 NumMembers)
VALUES  ('ART_DEF_UNIT_THP_SENING', 'ART_DEF_UNIT_MEMBER_THP_SENING',    3);
------------------------------
-- ArtDefine_UnitMemberCombats
------------------------------
INSERT INTO ArtDefine_UnitMemberCombats
(UnitMemberType,                                       EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT    'ART_DEF_UNIT_MEMBER_THP_FISHBOWMAN',    EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax,   LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack,    HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat,  ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack,      AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_ARCHER';

INSERT INTO ArtDefine_UnitMemberCombats
       (UnitMemberType,                    EnableActions,                 HasRefaceAfterCombat)
VALUES ('ART_DEF_UNIT_MEMBER_THP_SENING', 'Idle Death BombardDefend Run', 1);
------------------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons
(UnitMemberType,                                       "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT    'ART_DEF_UNIT_MEMBER_THP_FISHBOWMAN',    "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_ARCHER';
----------------------------
-- ArtDefine_UnitMemberInfos
----------------------------
INSERT INTO ArtDefine_UnitMemberInfos
(Type,                                             Scale,    ZOffset, Domain, Model,                         MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT    'ART_DEF_UNIT_MEMBER_THP_FISHBOWMAN',    Scale,    ZOffset, Domain, 'Composite_Bowman_Russia.fxsxml',    MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_ARCHER';

INSERT INTO ArtDefine_UnitMemberInfos
(Type,                                    Scale,             Model,                                MaterialTypeTag, MaterialTypeSoundOverrideTag)
VALUES ('ART_DEF_UNIT_MEMBER_THP_SENING', 0.119999997317791, 'u_anishinaabe_medicine_man.fxsxml', 'CLOTH', 'FLESH');
-- ======================================================================================================
-- AUDIO
-- ======================================================================================================
-- Audio_Sounds
---------------
INSERT INTO Audio_Sounds 
		(SoundID, 							     Filename, 		 LoadType)
VALUES	('SND_LEADER_MUSIC_THP_OLGIT_PEACE',    'Ket_Peace',    'DynamicResident'),
		('SND_LEADER_MUSIC_THP_OLGIT_WAR', 		'Ket_War', 	    'DynamicResident');
-----------------
-- Audio_2DSounds
-----------------
INSERT INTO Audio_2DSounds 
		(ScriptID, 										SoundID, 									SoundType, 		TaperSoundtrackVolume,	MinVolume, 	MaxVolume,  IsMusic, Looping)
VALUES	('AS2D_LEADER_MUSIC_THP_OLGIT_PEACE', 		'SND_LEADER_MUSIC_THP_OLGIT_PEACE', 		'GAME_MUSIC', 	-1.0,					75, 		95, 		1, 		 0),
		('AS2D_LEADER_MUSIC_THP_OLGIT_WAR', 			'SND_LEADER_MUSIC_THP_OLGIT_WAR', 		'GAME_MUSIC', 	-1.0,					75, 		90, 		1,		 0);
-- ======================================================================================================
-- ======================================================================================================
