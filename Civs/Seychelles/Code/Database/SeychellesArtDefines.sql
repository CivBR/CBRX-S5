--================================================================
-- Audio
--================================================================

INSERT INTO Audio_Sounds
		(SoundID,											Filename,				LoadType)
VALUES	('SND_LEADER_MUSIC_JWW_FRANCE-ALBERT_RENE_PEACE',	'Seychelles_Peace',		'DynamicResident'),
		('SND_LEADER_MUSIC_JWW_FRANCE-ALBERT_RENE_WAR',		'Seychelles_War',		'DynamicResident');

INSERT INTO Audio_2DSounds
		(ScriptID,											SoundID,											SoundType,		TaperSoundtrackVolume,	MinVolume,	MaxVolume,	IsMusic,	Looping)
VALUES	('AS2D_LEADER_MUSIC_JWW_FRANCE-ALBERT_RENE_PEACE',	'SND_LEADER_MUSIC_JWW_FRANCE-ALBERT_RENE_PEACE',	'GAME_MUSIC',	-1.0,					60,			60,			1,			0),
		('AS2D_LEADER_MUSIC_JWW_FRANCE-ALBERT_RENE_WAR',	'SND_LEADER_MUSIC_JWW_FRANCE-ALBERT_RENE_WAR',		'GAME_MUSIC',	-1.0,					60,			60,			1,			0);

--================================================================
-- Colors
--================================================================

INSERT INTO PlayerColors
		(Type,							PrimaryColor,							SecondaryColor,								TextColor)
VALUES	('PLAYERCOLOR_JWW_SEYCHELLES',	'COLOR_PLAYER_JWW_SEYCHELLES_ICON',	'COLOR_PLAYER_JWW_SEYCHELLES_BACKGROUND',	'COLOR_PLAYER_WHITE_TEXT');

INSERT INTO Colors
		(Type,										Red,		Green,		Blue,		Alpha)
VALUES	('COLOR_PLAYER_JWW_SEYCHELLES_ICON',		0.549,		0.827,		0.784,		1.0),
		('COLOR_PLAYER_JWW_SEYCHELLES_BACKGROUND',	0.063,		0.247,		0.353,		1.0);

--================================================================
-- Atlases
--================================================================

INSERT INTO IconTextureAtlases
		(Atlas,								IconSize,		Filename,						IconsPerRow,	IconsPerColumn)
VALUES	('JWW_SEYCHELLES_COLOR_ATLAS',		'256',			'SeychellesIconAtlas256.dds',		3,				2),
		('JWW_SEYCHELLES_COLOR_ATLAS',		'128',			'SeychellesIconAtlas128.dds',		3,				2),
		('JWW_SEYCHELLES_COLOR_ATLAS',		'80',			'SeychellesIconAtlas80.dds',		3,				2),
		('JWW_SEYCHELLES_COLOR_ATLAS',		'64',			'SeychellesIconAtlas64.dds',		3,				2),
		('JWW_SEYCHELLES_COLOR_ATLAS',		'48',			'SeychellesIconAtlas48.dds',		3,				2),
		('JWW_SEYCHELLES_COLOR_ATLAS',		'45',			'SeychellesIconAtlas45.dds',		3,				2),
		('JWW_SEYCHELLES_COLOR_ATLAS',		'32',			'SeychellesIconAtlas32.dds',		3,				2),
		('JWW_SEYCHELLES_COLOR_ATLAS',		'24',			'SeychellesIconAtlas24.dds',		3,				2),
		('JWW_SEYCHELLES_COLOR_ATLAS',		'16',			'SeychellesIconAtlas16.dds',		3,				2),
		('JWW_SEYCHELLES_ALPHA_ATLAS',		'256',			'SeychellesIconAtlas256.dds',		1,				2),
		('JWW_SEYCHELLES_ALPHA_ATLAS',		'128',			'SeychellesIconAtlas128.dds',		1,				2),
		('JWW_SEYCHELLES_ALPHA_ATLAS',		'80',			'SeychellesIconAtlas80.dds',		1,				2),
		('JWW_SEYCHELLES_ALPHA_ATLAS',		'64',			'SeychellesIconAtlas64.dds',		1,				2),
		('JWW_SEYCHELLES_ALPHA_ATLAS',		'48',			'SeychellesIconAtlas48.dds',		1,				2),
		('JWW_SEYCHELLES_ALPHA_ATLAS',		'45',			'SeychellesIconAtlas45.dds',		1,				2),
		('JWW_SEYCHELLES_ALPHA_ATLAS',		'32',			'SeychellesIconAtlas32.dds',		1,				2),
		('JWW_SEYCHELLES_ALPHA_ATLAS',		'24',			'SeychellesIconAtlas24.dds',		1,				2),
		('JWW_SEYCHELLES_ALPHA_ATLAS',		'16',			'SeychellesIconAtlas16.dds',		1,				2),
		('JWW_SEYCHELLES_UNIT_ALPHA_ATLAS',	'32',			'SCGCruiserAlpha32.dds',			1,				1),
		('UNIT_JWW_SEYCHELLES_CLAIM_ATLAS',	'45',			'SeychellesClaimAtlas45.dds',		1,				1),
		('UNIT_JWW_SEYCHELLES_CLAIM_ATLAS',	'64',			'SeychellesClaimAtlas64.dds',		1,				1);

--================================================================
-- Art Defines
--================================================================

INSERT INTO ArtDefine_UnitInfos
        (TYPE,                      DamageStates,   Formation)
SELECT  'ART_DEF_UNIT_JWW_SCG_CRUISER', DamageStates,   Formation
FROM ArtDefine_UnitInfos WHERE (TYPE = 'ART_DEF_UNIT_DESTROYER');
 
INSERT INTO ArtDefine_UnitInfoMemberInfos
        (UnitInfoType,                  UnitMemberInfoType,                 NumMembers)
SELECT  'ART_DEF_UNIT_JWW_SCG_CRUISER', 'ART_DEF_UNIT_MEMBER_JWW_SCG_CRUISER',  NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_DESTROYER');
 
INSERT INTO ArtDefine_UnitMemberCombats
        (UnitMemberType,                    EnableActions,  DisableActions, MoveRadius, ShortMoveRadius,    ChargeRadius,   AttackRadius,   RangedAttackRadius, MoveRate,   ShortMoveRate,  TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT  'ART_DEF_UNIT_MEMBER_JWW_SCG_CRUISER',  EnableActions,  DisableActions, MoveRadius, ShortMoveRadius,    ChargeRadius,   AttackRadius,   RangedAttackRadius, MoveRate,   ShortMoveRate,  TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_DESTROYER');
 
INSERT INTO ArtDefine_UnitMemberCombatWeapons
        (UnitMemberType,                        "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT  'ART_DEF_UNIT_MEMBER_JWW_SCG_CRUISER',  "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_DESTROYER');
 
INSERT INTO ArtDefine_UnitMemberInfos
        (TYPE,                                  Scale,  ZOffset, DOMAIN, Model,  MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT  'ART_DEF_UNIT_MEMBER_JWW_SCG_CRUISER',  Scale,  ZOffset, DOMAIN, Model,  MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE (TYPE = 'ART_DEF_UNIT_MEMBER_DESTROYER');
 
INSERT INTO ArtDefine_StrategicView
        (StrategicViewType,					TileType,   Asset)
VALUES  ('ART_DEF_UNIT_JWW_SCG_CRUISER',    'Unit',     'SCGCruiser_sv.dds');