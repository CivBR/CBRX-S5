--================================================================
-- Audio
--================================================================
--Music
INSERT INTO Audio_Sounds
		(SoundID,										Filename,				LoadType)
VALUES	('SND_LEADER_MUSIC_JWW_JOSEPH_MARIA_PEACE',		'JWWKarankawa_Peace',	'DynamicResident'),
		('SND_LEADER_MUSIC_JWW_JOSEPH_MARIA_WAR',		'JWWKarankawa_War',		'DynamicResident');

INSERT INTO Audio_2DSounds
		(ScriptID,										SoundID,									SoundType,		TaperSoundtrackVolume,	MinVolume,	MaxVolume,	IsMusic,	Looping)
VALUES	('AS2D_LEADER_MUSIC_JWW_JOSEPH_MARIA_PEACE',	'SND_LEADER_MUSIC_JWW_JOSEPH_MARIA_PEACE',	'GAME_MUSIC',	-1.0,					30,			30,			1,			0),
		('AS2D_LEADER_MUSIC_JWW_JOSEPH_MARIA_WAR',		'SND_LEADER_MUSIC_JWW_JOSEPH_MARIA_WAR',	'GAME_MUSIC',	-1.0,					30,			30,			1,			0);
--================================================================
-- Colors
--================================================================
INSERT INTO PlayerColors
		(Type,							PrimaryColor,							SecondaryColor,									TextColor)
VALUES	('PLAYERCOLOR_JWW_KARANKAWA',	'COLOR_PLAYER_JWW_KARANKAWA_ICON',		'COLOR_PLAYER_JWW_KARANKAWA_BACKGROUND',		'COLOR_PLAYER_WHITE_TEXT');

INSERT INTO Colors
		(Type,										Red,		Green,		Blue,		Alpha)
VALUES	('COLOR_PLAYER_JWW_KARANKAWA_ICON',			0.957,		0.592,		0.522,		1.0),
		('COLOR_PLAYER_JWW_KARANKAWA_BACKGROUND',	0.082,		0.298,		0.463,		1.0);
--================================================================
-- Atlases
--================================================================
INSERT INTO IconTextureAtlases
		(Atlas,									IconSize,		Filename,								IconsPerRow,	IconsPerColumn)
VALUES	('JWW_KARANKAWA_COLOR_ATLAS',			'256',			'JWWKarankawaIconAtlas256.dds',			3,				2),
		('JWW_KARANKAWA_COLOR_ATLAS',			'128',			'JWWKarankawaIconAtlas128.dds',			3,				2),
		('JWW_KARANKAWA_COLOR_ATLAS',			'80',			'JWWKarankawaIconAtlas80.dds',			3,				2),
		('JWW_KARANKAWA_COLOR_ATLAS',			'64',			'JWWKarankawaIconAtlas64.dds',			3,				2),
		('JWW_KARANKAWA_COLOR_ATLAS',			'48',			'JWWKarankawaIconAtlas48.dds',			3,				2),
		('JWW_KARANKAWA_COLOR_ATLAS',			'45',			'JWWKarankawaIconAtlas45.dds',			3,				2),
		('JWW_KARANKAWA_COLOR_ATLAS',			'32',			'JWWKarankawaIconAtlas32.dds',			3,				2),
		('JWW_KARANKAWA_COLOR_ATLAS',			'24',			'JWWKarankawaIconAtlas24.dds',			3,				2),
		('JWW_KARANKAWA_ALPHA_ATLAS',			'256',			'JWWKarankawaIconAtlas256.dds',			1,				2),
		('JWW_KARANKAWA_ALPHA_ATLAS',			'128',			'JWWKarankawaIconAtlas128.dds',			1,				2),
		('JWW_KARANKAWA_ALPHA_ATLAS',			'80',			'JWWKarankawaIconAtlas80.dds',			1,				2),
		('JWW_KARANKAWA_ALPHA_ATLAS',			'64',			'JWWKarankawaIconAtlas64.dds',			1,				2),
		('JWW_KARANKAWA_ALPHA_ATLAS',			'48',			'JWWKarankawaIconAtlas48.dds',			1,				2),
		('JWW_KARANKAWA_ALPHA_ATLAS',			'45',			'JWWKarankawaIconAtlas45.dds',			1,				2),
		('JWW_KARANKAWA_ALPHA_ATLAS',			'32',			'JWWKarankawaIconAtlas32.dds',			1,				2),
		('JWW_KARANKAWA_ALPHA_ATLAS',			'24',			'JWWKarankawaIconAtlas24.dds',			1,				2),
		('JWW_KARANKAWA_RESOURCE_ATLAS',		'256',			'JWWKarankawaResourceAtlas256.dds',		2,				1),
		('JWW_KARANKAWA_RESOURCE_ATLAS',		'80',			'JWWKarankawaResourceAtlas80.dds',		2,				1),
		('JWW_KARANKAWA_RESOURCE_ATLAS',		'64',			'JWWKarankawaResourceAtlas64.dds',		2,				1),
		('JWW_KARANKAWA_RESOURCE_ATLAS',		'45',			'JWWKarankawaResourceAtlas45.dds',		2,				1),
		('JWW_KARANKAWA_UNIT_ALPHA_ATLAS',		'32',			'JWWDugOutAlpha32.dds',					1,				1);
--================================================================
-- Font Icons
--================================================================
INSERT INTO IconFontTextures 
		(IconFontTexture, 							IconFontTextureFile)
VALUES	('ICON_FONT_TEXTURE_RES_JWW_OYSTERS', 		'KarankawaOysterFontIcon'),
		('ICON_FONT_TEXTURE_RES_JWW_HOLLY', 		'KarankawaHollyFontIcon');

INSERT INTO IconFontMapping 
		(IconName, 					IconFontTexture,						IconMapping)
VALUES	('ICON_RES_JWW_OYSTERS',	'ICON_FONT_TEXTURE_RES_JWW_OYSTERS',	1),
		('ICON_RES_JWW_HOLLY',		'ICON_FONT_TEXTURE_RES_JWW_HOLLY',		1);
--================================================================
-- Art Defines
--================================================================	
--DugOut
INSERT INTO ArtDefine_UnitInfos 
			(Type, 							DamageStates,	Formation)
SELECT		'ART_DEF_UNIT_JWW_DUG_OUT', 	DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_CANNON';

INSERT INTO ArtDefine_UnitInfoMemberInfos 	
			(UnitInfoType,					UnitMemberInfoType,					NumMembers)
SELECT		'ART_DEF_UNIT_JWW_DUG_OUT', 	'ART_DEF_UNIT_MEMBER_JWW_DUG_OUT',	1
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_GALLEASS';

INSERT INTO ArtDefine_UnitMemberCombats 
			(UnitMemberType,						EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT		'ART_DEF_UNIT_MEMBER_JWW_DUG_OUT',	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_GALLEASS';

INSERT INTO ArtDefine_UnitMemberCombatWeapons	
			(UnitMemberType,						"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT		'ART_DEF_UNIT_MEMBER_JWW_DUG_OUT',	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_GALLEASS';
	
INSERT INTO ArtDefine_UnitMemberInfos 	
			(Type, 								Scale,		ZOffset, Domain, Model,  					MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT		'ART_DEF_UNIT_MEMBER_JWW_DUG_OUT',	Scale,		ZOffset, Domain, 'MC_Chinook_Whaler.fxsxml', MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_WORKBOAT';

INSERT INTO ArtDefine_StrategicView
        (StrategicViewType,				TileType,   Asset)
VALUES  ('ART_DEF_UNIT_JWW_DUG_OUT',	'Unit',     'sv_JWWDugOut.dds');

--Holly + Oysters
INSERT INTO ArtDefine_Landmarks
		(Era,	State,	Scale,	ImprovementType,	LayoutHandler,	ResourceType,					Model, TerrainContour)
SELECT	Era,	State,	Scale,	ImprovementType,	LayoutHandler,	'ART_DEF_RESOURCE_JWW_HOLLY',	Model, TerrainContour
FROM ArtDefine_Landmarks WHERE ResourceType = 'ART_DEF_RESOURCE_COCOA';

INSERT INTO ArtDefine_Landmarks
		(Era,	State,	Scale,	ImprovementType,	LayoutHandler,	ResourceType,					Model, TerrainContour)
SELECT	Era,	State,	Scale,	ImprovementType,	LayoutHandler,	'ART_DEF_RESOURCE_JWW_OYSTERS',	Model, TerrainContour
FROM ArtDefine_Landmarks WHERE ResourceType = 'ART_DEF_RESOURCE_PEARLS';

INSERT INTO ArtDefine_LandmarkTypes
		(Type,								LandmarkType,	FriendlyName)
VALUES	('ART_DEF_RESOURCE_JWW_HOLLY',		'Resource',		'Holly'),
		('ART_DEF_RESOURCE_JWW_OYSTERS',	'Resource',		'Oysters');

INSERT INTO ArtDefine_StrategicView
        (StrategicViewType,					TileType,		Asset)
VALUES  ('ART_DEF_RESOURCE_JWW_OYSTERS',	'Resource',     'sv_JWWOysters.dds'),
		('ART_DEF_RESOURCE_JWW_HOLLY',		'Resource',     'sv_JWWHolly.dds');
--================================================================