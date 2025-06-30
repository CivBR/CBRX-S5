--==========================================================================================================================
-- COLORS
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
-- Colors
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Colors
		(Type,									Red,					Green,					Blue,					Alpha)
VALUES	('COLOR_PLAYER_PB_LANFANG_ICON',		0.12941176470588237,	0.12549019607843137,	0.12156862745098039,	1),
		('COLOR_PLAYER_PB_LANFANG_BACKGROUND',	0.6980392156862745,		0.6745098039215687,		0.10980392156862745,	1);
--------------------------------------------------------------------------------------------------------------------------
-- PlayerColors
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO PlayerColors
		(Type,						PrimaryColor,					SecondaryColor,							TextColor)
VALUES	('PLAYERCOLOR_PB_LANFANG',	'COLOR_PLAYER_PB_LANFANG_ICON',	'COLOR_PLAYER_PB_LANFANG_BACKGROUND',	'COLOR_PLAYER_WHITE_TEXT');

--==========================================================================================================================
-- ICON ATLASES
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
-- IconTextureAtlases
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO IconTextureAtlases
		(Atlas,							IconSize,	Filename,							IconsPerRow,	IconsPerColumn)
VALUES	('PB_LANFANG_ALPHA_ATLAS',		256,		'Lanfang_Alpha256.dds',				1,				1),
		('PB_LANFANG_ALPHA_ATLAS',		128,		'Lanfang_Alpha128.dds',				1,				1),
		('PB_LANFANG_ALPHA_ATLAS',		80,			'Lanfang_Alpha80.dds',				1,				1),
		('PB_LANFANG_ALPHA_ATLAS',		64,			'Lanfang_Alpha64.dds',				1,				1),
		('PB_LANFANG_ALPHA_ATLAS',		48,			'Lanfang_Alpha48.dds',				1,				1),
		('PB_LANFANG_ALPHA_ATLAS',		32,			'Lanfang_Alpha32.dds',				1,				1),
		('PB_LANFANG_ALPHA_ATLAS',		24,			'Lanfang_Alpha24.dds',				1,				1),
		('PB_LANFANG_ALPHA_ATLAS',		16,			'Lanfang_Alpha16.dds',				1,				1),
		
		('PB_LANFANG_ICON_ATLAS',		256, 		'Lanfang_Icon_Atlas_256.dds',		2,				2),
		('PB_LANFANG_ICON_ATLAS',		128, 		'Lanfang_Icon_Atlas_128.dds',		2,				2),
		('PB_LANFANG_ICON_ATLAS',		80, 		'Lanfang_Icon_Atlas_80.dds',		2,				2),
		('PB_LANFANG_ICON_ATLAS',		64, 		'Lanfang_Icon_Atlas_64.dds',		2,				2),
		('PB_LANFANG_ICON_ATLAS',		45, 		'Lanfang_Icon_Atlas_45.dds',		2,				2),
		('PB_LANFANG_ICON_ATLAS',		32, 		'Lanfang_Icon_Atlas_32.dds',		2,				2),
		
		('PB_LANFANG_LANSAAI_FLAG',		32,			'flag_lansaai.dds',			1,				1);
--==========================================================================================================================
-- AUDIO
--==========================================================================================================================	
--------------------------------------------------------------------------------------------------------------------------
-- Audio_Sounds
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Audio_Sounds 
		(SoundID, 										Filename, 			LoadType)
VALUES	('SND_LEADER_MUSIC_PB_LUO_FANGBO_PEACE', 		'FangboPeace',		'DynamicResident'),
		('SND_LEADER_MUSIC_PB_LUO_FANGBO_WAR',			'FangboWar', 		'DynamicResident');		
--------------------------------------------------------------------------------------------------------------------------
-- Audio_2DSounds
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Audio_2DSounds 
		(ScriptID, 											SoundID, 									SoundType, 			TaperSoundtrackVolume,	MinVolume, 	MaxVolume,  IsMusic, Looping)
VALUES	('AS2D_LEADER_MUSIC_PB_LUO_FANGBO_PEACE', 			'SND_LEADER_MUSIC_PB_LUO_FANGBO_PEACE', 	'GAME_MUSIC', 		-1.0,					80, 		80, 		1, 		 0),
		('AS2D_LEADER_MUSIC_PB_LUO_FANGBO_WAR', 			'SND_LEADER_MUSIC_PB_LUO_FANGBO_WAR', 		'GAME_MUSIC',		-1.0,					80, 		80, 		1,		 0);
--==========================================================================================================================
-- UNIT GRAPHICS
--==========================================================================================================================	
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_StrategicView
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 			TileType,		Asset)
VALUES	('ART_DEF_UNIT_PB_LANSAAI', 	'Unit', 		'Lansaai_SV.dds');
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfos
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO ArtDefine_UnitInfos 
		(Type, 								DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_PB_LANSAAI',			DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_SCOUT';
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfoMemberInfos
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,					UnitMemberInfoType,					NumMembers)
SELECT	'ART_DEF_UNIT_PB_LANSAAI', 		'ART_DEF_UNIT_MEMBER_PB_LANSAAI',	2
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_SCOUT';
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberCombats
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,					EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_PB_LANSAAI',	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_SCOUT';
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberCombatWeapons
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,					"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_PB_LANSAAI',	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_SCOUT';
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberInfos
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 								Scale,	ZOffset, Domain, Model, 			MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_PB_LANSAAI',	Scale,	ZOffset, Domain, 'Lansaai.fxsxml',	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_SCOUT';
