-- ======================================================================================================
-- ICON ATLASES
-- ======================================================================================================
-- IconTextureAtlases
---------------------
INSERT INTO IconTextureAtlases
(Atlas,                          IconSize,    Filename,                     IconsPerRow,       IconsPerColumn)
VALUES    ('THP_LUBA_ATLAS',     256,        'THP_LubaAtlas256.dds',        2,                 2),
('THP_LUBA_ATLAS',               128,        'THP_LubaAtlas128.dds',        2,                 2),
('THP_LUBA_ATLAS',               80,         'THP_LubaAtlas80.dds',         2,                 2),
('THP_LUBA_ATLAS',               64,         'THP_LubaAtlas64.dds',         2,                 2),
('THP_LUBA_ATLAS',               45,         'THP_LubaAtlas45.dds',         2,                 2),
('THP_LUBA_ATLAS',               32,         'THP_LubaAtlas32.dds',         2,                 2),
('THP_LUBA_ALPHA_ATLAS',         128,        'THP_LubaAlpha128.dds',        1,                 1),
('THP_LUBA_ALPHA_ATLAS',         64,         'THP_LubaAlpha64.dds',         1,                 1),
('THP_LUBA_ALPHA_ATLAS',         48,         'THP_LubaAlpha48.dds',         1,                 1),
('THP_LUBA_ALPHA_ATLAS',         32,         'THP_LubaAlpha32.dds',         1,                 1),
('THP_LUBA_ALPHA_ATLAS',         24,         'THP_LubaAlpha24.dds',         1,                 1),
('THP_LUBA_ALPHA_ATLAS',         16,         'THP_LubaAlpha16.dds',         1,                 1),
('THP_UNIT_NZAPPA_ZAP_FLAG_ATLAS',   32,     'Unit_NzappaZap_Flag_32.dds',  1,                 1);
-- ======================================================================================================
-- COLORS
-- ======================================================================================================
-- Colors
---------
INSERT INTO Colors
(Type,                                     Red,     Green,    Blue,     Alpha)
VALUES    ('COLOR_PLAYER_THP_LUBA_ICON',   0.878,   0.722,    0.686,    1),
('COLOR_PLAYER_THP_LUBA_BACKGROUND',       0.176,   0.220,    0.337,    1);
---------------
-- PlayerColors
---------------
INSERT INTO PlayerColors
          (Type,                           PrimaryColor,                     SecondaryColor,                   TextColor)
VALUES    ('PLAYERCOLOR_THP_LUBA',        'COLOR_PLAYER_THP_LUBA_ICON',     'COLOR_PLAYER_THP_LUBA_BACKGROUND',     'COLOR_PLAYER_WHITE_TEXT');
-- ======================================================================================================
-- UNIT ART
-- ======================================================================================================
-- ArtDefine_StrategicView
--------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 		         TileType,		 Asset)
VALUES	('ART_DEF_UNIT_THP_NZAPPA_ZAP',		'Unit', 		'sv_nzappazap.dds');
----------------------
-- ArtDefine_UnitInfos
----------------------
INSERT INTO ArtDefine_UnitInfos
          (Type,                               DamageStates,    Formation)
SELECT    'ART_DEF_UNIT_THP_NZAPPA_ZAP',       DamageStates,    Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_SWORDSMAN';
--------------------------------
-- ArtDefine_UnitInfoMemberInfos
--------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos
          (UnitInfoType,                    UnitMemberInfoType,                    NumMembers)
SELECT    'ART_DEF_UNIT_THP_NZAPPA_ZAP',   'ART_DEF_UNIT_MEMBER_THP_NZAPPA_ZAP',   NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_SWORDSMAN';
------------------------------
-- ArtDefine_UnitMemberCombats
------------------------------
INSERT INTO ArtDefine_UnitMemberCombats
(UnitMemberType,                                 EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT    'ART_DEF_UNIT_MEMBER_THP_NZAPPA_ZAP',    EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax,   LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack,    HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat,  ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack,      AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_SWORDSMAN';
------------------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons
(UnitMemberType,                                 "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT    'ART_DEF_UNIT_MEMBER_THP_NZAPPA_ZAP',    "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_SWORDSMAN';
----------------------------
-- ArtDefine_UnitMemberInfos
----------------------------
INSERT INTO ArtDefine_UnitMemberInfos
(Type,                                           Scale,    ZOffset, Domain, Model,                     MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT    'ART_DEF_UNIT_MEMBER_THP_NZAPPA_ZAP',  Scale,    ZOffset, Domain, 'ZimbabweanGano.fxsxml',   MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_SWORDSMAN';
-- ======================================================================================================
-- AUDIO
-- ======================================================================================================
-- Audio_Sounds
---------------
INSERT INTO Audio_Sounds 
		(SoundID, 									     Filename, 		  LoadType)
VALUES	('SND_LEADER_MUSIC_THP_ILUNGA_SUNGU_PEACE',     'Luba_Peace',    'DynamicResident'),
		('SND_LEADER_MUSIC_THP_ILUNGA_SUNGU_WAR', 		'Luba_War', 	 'DynamicResident');
-----------------
-- Audio_2DSounds
-----------------
INSERT INTO Audio_2DSounds 
		(ScriptID, 										SoundID, 									SoundType, 		TaperSoundtrackVolume,	MinVolume, 	MaxVolume,  IsMusic, Looping)
VALUES	('AS2D_LEADER_MUSIC_THP_ILUNGA_SUNGU_PEACE', 		'SND_LEADER_MUSIC_THP_ILUNGA_SUNGU_PEACE', 		'GAME_MUSIC', 	-1.0,					90, 		100, 		1, 		 0),
		('AS2D_LEADER_MUSIC_THP_ILUNGA_SUNGU_WAR', 			'SND_LEADER_MUSIC_THP_ILUNGA_SUNGU_WAR', 		'GAME_MUSIC', 	-1.0,					70, 		100, 		1,		 0);
-- ======================================================================================================
-- ======================================================================================================
