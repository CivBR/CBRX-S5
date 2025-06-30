--================================================================
-- Audio
--================================================================
INSERT INTO Audio_Sounds
		(SoundID,										Filename,				LoadType)
VALUES	('SND_LEADER_MUSIC_JWW_KALONGA_MAZULA_PEACE',	'JWWMaraviPeace',		'DynamicResident'),
		('SND_LEADER_MUSIC_JWW_KALONGA_MAZULA_WAR',		'JWWMaraviWar',			'DynamicResident');

INSERT INTO Audio_2DSounds
		(ScriptID,										SoundID,										SoundType,		TaperSoundtrackVolume,	MinVolume,	MaxVolume,	IsMusic,	Looping)
VALUES	('AS2D_LEADER_MUSIC_JWW_KALONGA_MAZULA_PEACE',	'SND_LEADER_MUSIC_JWW_KALONGA_MAZULA_PEACE',	'GAME_MUSIC',	-1.0,					30,			30,			1,			0),
		('AS2D_LEADER_MUSIC_JWW_KALONGA_MAZULA_WAR',	'SND_LEADER_MUSIC_JWW_KALONGA_MAZULA_WAR',		'GAME_MUSIC',	-1.0,					30,			30,			1,			0);
--================================================================
-- Colors
--================================================================
INSERT INTO PlayerColors
		(Type,						PrimaryColor,					SecondaryColor,							TextColor)
VALUES	('PLAYERCOLOR_JWW_MARAVI',	'COLOR_PLAYER_JWW_MARAVI_ICON',	'COLOR_PLAYER_JWW_MARAVI_BACKGROUND',	'COLOR_PLAYER_WHITE_TEXT');

INSERT INTO Colors
		(Type,									Red,		Green,		Blue,		Alpha)
VALUES	('COLOR_PLAYER_JWW_MARAVI_ICON',		0.761,		0.384,		0.345,		1.0),
		('COLOR_PLAYER_JWW_MARAVI_BACKGROUND',	0.055,		0.071,		0.008,		1.0);
--================================================================
-- Atlases
--================================================================
INSERT INTO IconTextureAtlases
		(Atlas,								IconSize,		Filename,							IconsPerRow,	IconsPerColumn)
VALUES	('JWW_MARAVI_COLOR_ATLAS',			'256',			'JWWMaraviIconAtlas256.dds',		3,				2),
		('JWW_MARAVI_COLOR_ATLAS',			'128',			'JWWMaraviIconAtlas128.dds',		3,				2),
		('JWW_MARAVI_COLOR_ATLAS',			'80',			'JWWMaraviIconAtlas80.dds',			3,				2),
		('JWW_MARAVI_COLOR_ATLAS',			'64',			'JWWMaraviIconAtlas64.dds',			3,				2),
		('JWW_MARAVI_COLOR_ATLAS',			'48',			'JWWMaraviIconAtlas48.dds',			3,				2),
		('JWW_MARAVI_COLOR_ATLAS',			'45',			'JWWMaraviIconAtlas45.dds',			3,				2),
		('JWW_MARAVI_COLOR_ATLAS',			'32',			'JWWMaraviIconAtlas32.dds',			3,				2),
		('JWW_MARAVI_COLOR_ATLAS',			'24',			'JWWMaraviIconAtlas24.dds',			3,				2),
		('JWW_MARAVI_COLOR_ATLAS',			'16',			'JWWMaraviIconAtlas16.dds',			3,				2),
		('JWW_MARAVI_ALPHA_ATLAS',			'256',			'JWWMaraviIconAtlas256.dds',		1,				2),
		('JWW_MARAVI_ALPHA_ATLAS',			'128',			'JWWMaraviIconAtlas128.dds',		1,				2),
		('JWW_MARAVI_ALPHA_ATLAS',			'80',			'JWWMaraviIconAtlas80.dds',			1,				2),
		('JWW_MARAVI_ALPHA_ATLAS',			'64',			'JWWMaraviIconAtlas64.dds',			1,				2),
		('JWW_MARAVI_ALPHA_ATLAS',			'48',			'JWWMaraviIconAtlas48.dds',			1,				2),
		('JWW_MARAVI_ALPHA_ATLAS',			'45',			'JWWMaraviIconAtlas45.dds',			1,				2),
		('JWW_MARAVI_ALPHA_ATLAS',			'32',			'JWWMaraviIconAtlas32.dds',			1,				2),
		('JWW_MARAVI_ALPHA_ATLAS',			'24',			'JWWMaraviIconAtlas24.dds',			1,				2),
		('JWW_MARAVI_ALPHA_ATLAS',			'16',			'JWWMaraviIconAtlas16.dds',			1,				2),
		('JWW_MARAVI_UNIT_ALPHA_ATLAS',		'32',			'ZimbaMarauderAlpha32.dds',			1,				1),
		('JWW_MARAVI_UNIT_ALPHA_ATLAS_2',	'32',			'NyauCultistAlpha32.dds',			1,				1),
		('JWW_MARAVI_GULE_WAMKULU_ATLAS',	'45',			'MaraviGaleWamkuluAtlas45.dds',		1,				1),
		('JWW_MARAVI_GULE_WAMKULU_ATLAS',	'64',			'MaraviGaleWamkuluAtlas64.dds',		1,				1),
		('JWW_MARAVI_RELIGION_ATLAS',		'128',			'JWWNyauAlpha128.dds',				1,				1),
		('JWW_MARAVI_RELIGION_ATLAS',		'80',			'JWWNyauAlpha80.dds',				1,				1),
		('JWW_MARAVI_RELIGION_ATLAS',		'64',			'JWWNyauAlpha64.dds',				1,				1),
		('JWW_MARAVI_RELIGION_ATLAS',		'48',			'JWWNyauAlpha48.dds',				1,				1),
		('JWW_MARAVI_RELIGION_ATLAS',		'32',			'JWWNyauAlpha32.dds',				1,				1),
		('JWW_MARAVI_RELIGION_ATLAS',		'24',			'JWWNyauAlpha24.dds',				1,				1),
		('JWW_MARAVI_RELIGION_ATLAS',		'16',			'JWWNyauAlpha16.dds',				1,				1);
--================================================================
-- Font Icon
--================================================================
INSERT INTO IconFontTextures 
		(IconFontTexture, 					IconFontTextureFile)
VALUES	('ICON_FONT_TEXTURE_JWW_NYAU', 		'JWWNyauFontIcon22');

INSERT INTO IconFontMapping 
		(IconName, 							IconFontTexture,				IconMapping)
VALUES	('ICON_RELIGION_JWW_NYAU',			'ICON_FONT_TEXTURE_JWW_NYAU',	1);
--================================================================
-- Art Defines
--================================================================
--Zimba
INSERT INTO ArtDefine_UnitInfos
        (TYPE,                      DamageStates,   Formation)
SELECT  'ART_DEF_UNIT_JWW_ZIMBA_MARAUDER', DamageStates,   Formation
FROM ArtDefine_UnitInfos WHERE (TYPE = 'ART_DEF_UNIT_U_ZULU_IMPI_WARRIOR');
 
INSERT INTO ArtDefine_UnitInfoMemberInfos
        (UnitInfoType,						UnitMemberInfoType,							NumMembers)
VALUES	('ART_DEF_UNIT_JWW_ZIMBA_MARAUDER', 'ART_DEF_UNIT_MEMBER_JWW_ZIMBA_MARAUDER',	12);
 
INSERT INTO ArtDefine_UnitMemberCombats
        (UnitMemberType,                    EnableActions,  DisableActions, MoveRadius, ShortMoveRadius,    ChargeRadius,   AttackRadius,   RangedAttackRadius, MoveRate,   ShortMoveRate,  TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT  'ART_DEF_UNIT_MEMBER_JWW_ZIMBA_MARAUDER',  EnableActions,  DisableActions, MoveRadius, ShortMoveRadius,    ChargeRadius,   AttackRadius,   RangedAttackRadius, MoveRate,   ShortMoveRate,  TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_U_ZULU_IMPI_WARRIOR');
 
INSERT INTO ArtDefine_UnitMemberCombatWeapons
        (UnitMemberType,                        "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT  'ART_DEF_UNIT_MEMBER_JWW_ZIMBA_MARAUDER',  "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_U_ZULU_IMPI_WARRIOR');
 
INSERT INTO ArtDefine_UnitMemberInfos
        (TYPE,                                  Scale,  ZOffset, DOMAIN, Model,     MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT  'ART_DEF_UNIT_MEMBER_JWW_ZIMBA_MARAUDER',  Scale,  ZOffset, DOMAIN, 'JWW_Zimba.fxsxml',  MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE (TYPE = 'ART_DEF_UNIT_MEMBER_U_ZULU_IMPI_WARRIOR');
 
 --Nyau
INSERT INTO ArtDefine_UnitInfos
        (TYPE,							DamageStates,   Formation)
SELECT  'ART_DEF_UNIT_JWW_NYAU_CULTIST', DamageStates,   Formation
FROM ArtDefine_UnitInfos WHERE (TYPE = 'ART_DEF_UNIT_MISSIONARY');
 
INSERT INTO ArtDefine_UnitInfoMemberInfos
        (UnitInfoType,						UnitMemberInfoType,						NumMembers)
VALUES  ('ART_DEF_UNIT_JWW_NYAU_CULTIST', 'ART_DEF_UNIT_MEMBER_JWW_NYAU_CULTIST',	1),
		('ART_DEF_UNIT_JWW_NYAU_CULTIST', 'ART_DEF_UNIT_MEMBER_JWW_NYAU_CULTIST_2',	2);
 
INSERT INTO ArtDefine_UnitMemberCombats
        (UnitMemberType,                    EnableActions,  DisableActions, MoveRadius, ShortMoveRadius,    ChargeRadius,   AttackRadius,   RangedAttackRadius, MoveRate,   ShortMoveRate,  TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT  'ART_DEF_UNIT_MEMBER_JWW_NYAU_CULTIST',  EnableActions,  DisableActions, MoveRadius, ShortMoveRadius,    ChargeRadius,   AttackRadius,   RangedAttackRadius, MoveRate,   ShortMoveRate,  TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_MISSIONARY');
INSERT INTO ArtDefine_UnitMemberCombats
        (UnitMemberType,                    EnableActions,  DisableActions, MoveRadius, ShortMoveRadius,    ChargeRadius,   AttackRadius,   RangedAttackRadius, MoveRate,   ShortMoveRate,  TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT  'ART_DEF_UNIT_MEMBER_JWW_NYAU_CULTIST_2',  EnableActions,  DisableActions, MoveRadius, ShortMoveRadius,    ChargeRadius,   AttackRadius,   RangedAttackRadius, MoveRate,   ShortMoveRate,  TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_MISSIONARY_02');
 
INSERT INTO ArtDefine_UnitMemberCombatWeapons
        (UnitMemberType,                        "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT  'ART_DEF_UNIT_MEMBER_JWW_NYAU_CULTIST',  "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_MISSIONARY');
INSERT INTO ArtDefine_UnitMemberCombatWeapons
        (UnitMemberType,                        "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT  'ART_DEF_UNIT_MEMBER_JWW_NYAU_CULTIST_2',  "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_MISSIONARY_02');

INSERT INTO ArtDefine_UnitMemberInfos
        (TYPE,                                  Scale,  ZOffset, DOMAIN, Model,             MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT  'ART_DEF_UNIT_MEMBER_JWW_NYAU_CULTIST',  Scale,  ZOffset, DOMAIN, 'JWW_Nyau_v1.fxsxml',  MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE (TYPE = 'ART_DEF_UNIT_MEMBER_MISSIONARY');
INSERT INTO ArtDefine_UnitMemberInfos
        (TYPE,                                  Scale,  ZOffset, DOMAIN, Model,             MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT  'ART_DEF_UNIT_MEMBER_JWW_NYAU_CULTIST_2',	Scale,  ZOffset, DOMAIN, 'JWW_Nyau_v2.fxsxml',  MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE (TYPE = 'ART_DEF_UNIT_MEMBER_MISSIONARY_02');

INSERT INTO ArtDefine_StrategicView
        (StrategicViewType,						TileType,   Asset)
VALUES  ('ART_DEF_UNIT_JWW_ZIMBA_MARAUDER',     'Unit',     'ZimbaMarauderSV.dds'),
		('ART_DEF_UNIT_JWW_NYAU_CULTIST',		'Unit',     'NyauCultistSV.dds');
--================================================================
--================================================================