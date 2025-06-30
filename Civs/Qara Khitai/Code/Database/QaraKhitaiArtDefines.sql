--================================================================
-- Audio
--================================================================
INSERT INTO Audio_Sounds
		(SoundID,										Filename,			LoadType)
VALUES	('SND_LEADER_MUSIC_JWW_YELU_DASHI_PEACE',		'QaraKhitai_Peace',	'DynamicResident'),
		('SND_LEADER_MUSIC_JWW_YELU_DASHI_WAR',			'QaraKhitai_War',		'DynamicResident');

INSERT INTO Audio_2DSounds
		(ScriptID,										SoundID,									SoundType,		TaperSoundtrackVolume,	MinVolume,	MaxVolume,	IsMusic,	Looping)
VALUES	('AS2D_LEADER_MUSIC_JWW_YELU_DASHI_PEACE',		'SND_LEADER_MUSIC_JWW_YELU_DASHI_PEACE',	'GAME_MUSIC',	-1.0,					30,			30,			1,			0),
		('AS2D_LEADER_MUSIC_JWW_YELU_DASHI_WAR',		'SND_LEADER_MUSIC_JWW_YELU_DASHI_WAR',		'GAME_MUSIC',	-1.0,					30,			30,			1,			0);
--================================================================
-- Colors
--================================================================
INSERT INTO PlayerColors
		(Type,								PrimaryColor,								SecondaryColor,									TextColor)
VALUES	('PLAYERCOLOR_JWW_QARA_KHITAI',	'COLOR_PLAYER_JWW_QARA_KHITAI_ICON',		'COLOR_PLAYER_JWW_QARA_KHITAI_BACKGROUND',		'COLOR_PLAYER_WHITE_TEXT');

INSERT INTO Colors
		(Type,											Red,		Green,		Blue,		Alpha)
VALUES	('COLOR_PLAYER_JWW_QARA_KHITAI_ICON',			0.471,		0.702,		0.812,		1.0),
		('COLOR_PLAYER_JWW_QARA_KHITAI_BACKGROUND',		0.141,		0.137,		0.118,		1.0);
--================================================================
-- Atlases
--================================================================
INSERT INTO IconTextureAtlases
		(Atlas,									IconSize,		Filename,							IconsPerRow,	IconsPerColumn)
VALUES	('JWW_QARA_KHITAI_COLOR_ATLAS',			'256',			'QaraKhitaiIconAtlas_256.dds',		3,				2),
		('JWW_QARA_KHITAI_COLOR_ATLAS',			'128',			'QaraKhitaiIconAtlas_128.dds',		3,				2),
		('JWW_QARA_KHITAI_COLOR_ATLAS',			'80',			'QaraKhitaiIconAtlas_80.dds',		3,				2),
		('JWW_QARA_KHITAI_COLOR_ATLAS',			'64',			'QaraKhitaiIconAtlas_64.dds',		3,				2),
		('JWW_QARA_KHITAI_COLOR_ATLAS',			'48',			'QaraKhitaiIconAtlas_48.dds',		3,				2),
		('JWW_QARA_KHITAI_COLOR_ATLAS',			'45',			'QaraKhitaiIconAtlas_45.dds',		3,				2),
		('JWW_QARA_KHITAI_COLOR_ATLAS',			'32',			'QaraKhitaiIconAtlas_32.dds',		3,				2),
		('JWW_QARA_KHITAI_COLOR_ATLAS',			'24',			'QaraKhitaiIconAtlas_24.dds',		3,				2),
		('JWW_QARA_KHITAI_ALPHA_ATLAS',			'256',			'QaraKhitaiIconAtlas_256.dds',		1,				2),
		('JWW_QARA_KHITAI_ALPHA_ATLAS',			'128',			'QaraKhitaiIconAtlas_128.dds',		1,				2),
		('JWW_QARA_KHITAI_ALPHA_ATLAS',			'80',			'QaraKhitaiIconAtlas_80.dds',		1,				2),
		('JWW_QARA_KHITAI_ALPHA_ATLAS',			'64',			'QaraKhitaiIconAtlas_64.dds',		1,				2),
		('JWW_QARA_KHITAI_ALPHA_ATLAS',			'48',			'QaraKhitaiIconAtlas_48.dds',		1,				2),
		('JWW_QARA_KHITAI_ALPHA_ATLAS',			'45',			'QaraKhitaiIconAtlas_45.dds',		1,				2),
		('JWW_QARA_KHITAI_ALPHA_ATLAS',			'32',			'QaraKhitaiIconAtlas_32.dds',		1,				2),
		('JWW_QARA_KHITAI_ALPHA_ATLAS',			'24',			'QaraKhitaiIconAtlas_24.dds',		1,				2),
		('JWW_QARA_KHITAI_UNIT_ALPHA_ATLAS',	'32',			'OrdoCavalrymanAlpha32.dds',		1,				1),
		('JWW_QARA_KHITAI_UNIT_ALPHA_ATLAS_2',	'32',			'ShaojianAlpha32.dds',				1,				1);
--================================================================
-- Art Defines
--================================================================
--Ordo Calvaryman
INSERT INTO ArtDefine_UnitInfos
        (TYPE,                      DamageStates,   Formation)
SELECT  'ART_DEF_UNIT_JWW_ORDO_CAVALRYMAN', DamageStates,   Formation
FROM ArtDefine_UnitInfos WHERE TYPE = 'ART_DEF_UNIT_KNIGHT';
 
INSERT INTO ArtDefine_UnitInfoMemberInfos
        (UnitInfoType,                  UnitMemberInfoType,						NumMembers)
SELECT  'ART_DEF_UNIT_JWW_ORDO_CAVALRYMAN', 'ART_DEF_UNIT_MEMBER_JWW_ORDO_CAVALRYMAN',	NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_KNIGHT';
 
INSERT INTO ArtDefine_UnitMemberCombats
        (UnitMemberType,                    EnableActions,  DisableActions, MoveRadius, ShortMoveRadius,    ChargeRadius,   AttackRadius,   RangedAttackRadius, MoveRate,   ShortMoveRate,  TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT  'ART_DEF_UNIT_MEMBER_JWW_ORDO_CAVALRYMAN',  EnableActions,  DisableActions, MoveRadius, ShortMoveRadius,    ChargeRadius,   AttackRadius,   RangedAttackRadius, MoveRate,   ShortMoveRate,  TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_KNIGHT';
 
INSERT INTO ArtDefine_UnitMemberCombatWeapons
        (UnitMemberType,                        "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT  'ART_DEF_UNIT_MEMBER_JWW_ORDO_CAVALRYMAN',  "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_KNIGHT';
 
INSERT INTO ArtDefine_UnitMemberInfos
        (TYPE,                                  Scale,  ZOffset, DOMAIN, Model,  MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT  'ART_DEF_UNIT_MEMBER_JWW_ORDO_CAVALRYMAN',  Scale,  ZOffset, DOMAIN, 'er_ordo_cavalry.fxsxml',  MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE TYPE = 'ART_DEF_UNIT_MEMBER_KNIGHT';

INSERT INTO ArtDefine_StrategicView
        (StrategicViewType,						TileType,   Asset)
VALUES  ('ART_DEF_UNIT_JWW_ORDO_CAVALRYMAN',    'Unit',     'sv_OrdoCavalryman.dds');


--Shaojian
INSERT INTO ArtDefine_UnitInfos
        (TYPE,                      DamageStates,   Formation)
SELECT  'ART_DEF_UNIT_JWW_SHAOJIAN', DamageStates,   Formation
FROM ArtDefine_UnitInfos WHERE TYPE = 'ART_DEF_UNIT_MERCHANT';
 
INSERT INTO ArtDefine_UnitInfoMemberInfos
        (UnitInfoType,                  UnitMemberInfoType,						NumMembers)
SELECT  'ART_DEF_UNIT_JWW_SHAOJIAN', 'ART_DEF_UNIT_MEMBER_JWW_SHAOJIAN',	NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_MERCHANT';
 
INSERT INTO ArtDefine_UnitMemberCombats
        (UnitMemberType,                    EnableActions,  DisableActions, MoveRadius, ShortMoveRadius,    ChargeRadius,   AttackRadius,   RangedAttackRadius, MoveRate,   ShortMoveRate,  TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT  'ART_DEF_UNIT_MEMBER_JWW_SHAOJIAN',  EnableActions,  DisableActions, MoveRadius, ShortMoveRadius,    ChargeRadius,   AttackRadius,   RangedAttackRadius, MoveRate,   ShortMoveRate,  TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_GREATMERCHANT_EARLY_CAMEL_V1';
 
INSERT INTO ArtDefine_UnitMemberCombatWeapons
        (UnitMemberType,                        "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT  'ART_DEF_UNIT_MEMBER_JWW_SHAOJIAN',  "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_GREATMERCHANT_EARLY_CAMEL_V1';
 
INSERT INTO ArtDefine_UnitMemberInfos
        (TYPE,                                  Scale,  ZOffset, DOMAIN, Model,  MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT  'ART_DEF_UNIT_MEMBER_JWW_SHAOJIAN',  Scale,  ZOffset, DOMAIN, 'er_shaojian.fxsxml',  MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE TYPE = 'ART_DEF_UNIT_MEMBER_GREATMERCHANT_EARLY_CAMEL_V1';

INSERT INTO ArtDefine_StrategicView
        (StrategicViewType,				TileType,   Asset)
VALUES  ('ART_DEF_UNIT_JWW_SHAOJIAN',    'Unit',     'sv_Shaojian.dds');
--================================================================