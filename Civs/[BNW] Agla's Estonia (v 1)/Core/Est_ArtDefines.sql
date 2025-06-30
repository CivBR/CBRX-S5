--=======================================================================================================================
-- ART DEFINES
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_StrategicView
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 						TileType,		Asset)
VALUES	('ART_DEF_UNIT_AGLA_FBROTHER',		'Unit', 		'Agla_Estonia_AlphaAtlas_128.dds');
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfos
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO ArtDefine_UnitInfos 
		(Type, 										DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_AGLA_FBROTHER',		DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_MARINE'; 
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfoMemberInfos
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,							UnitMemberInfoType,								NumMembers)
SELECT	'ART_DEF_UNIT_AGLA_FBROTHER',	'ART_DEF_UNIT_MEMBER_AGLA_FBROTHER',	NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_MARINE';
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberCombats
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,								EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_AGLA_FBROTHER',	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_MARINE';
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,								"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_AGLA_FBROTHER',	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_MARINE';
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberInfos
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 											Scale, ZOffset, Domain, Model, 				  MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_AGLA_FBROTHER',	Scale, ZOffset, Domain, 'Tzahal_Commando.fxsxml',   MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_MARINE';
--=======================================================================================================================
-- AUDIO
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- Audio_Sounds
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Audio_Sounds 
		(SoundID, 											Filename, 						LoadType)
VALUES	('SND_LEADER_MUSIC_AGLA_ESTONIA_PEACE',	'EstoniaP', 	'DynamicResident'),
		('SND_LEADER_MUSIC_AGLA_ESTONIA_WAR',		'EstoniaW', 		'DynamicResident');		
------------------------------------------------------------------------------------------------------------------------
-- Audio_2DSounds
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Audio_2DSounds 
		(ScriptID, 											SoundID, 											SoundType, 		TaperSoundtrackVolume,	MinVolume, 	MaxVolume,	IsMusic, Looping)
VALUES	('AS2D_LEADER_MUSIC_AGLA_ESTONIA_PEACE', 	'SND_LEADER_MUSIC_AGLA_ESTONIA_PEACE',		'GAME_MUSIC', 	-1.0,					50, 		50, 		1, 		 0),
		('AS2D_LEADER_MUSIC_AGLA_ESTONIA_WAR',		'SND_LEADER_MUSIC_AGLA_ESTONIA_WAR', 		'GAME_MUSIC', 	-1.0,					50, 		50, 		1,		 0);
--=======================================================================================================================
-- COLOURS
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- Colors
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Colors 
		(Type, 												Red, 	Green, 	Blue,   Alpha)
VALUES	('COLOR_PLAYER_AGLA_ESTONIA_ICON', 			0.09412,  0.11373,  0.16863, 		1),
		('COLOR_PLAYER_AGLA_ESTONIA_BACKGROUND', 	0.31373,  0.58824,  0.86667, 	1);
------------------------------------------------------------------------------------------------------------------------
-- PlayerColors
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO PlayerColors 
		(Type, 									PrimaryColor, 								SecondaryColor, 									TextColor)
VALUES	('PLAYERCOLOR_AGLA_ESTONIA',	'COLOR_PLAYER_AGLA_ESTONIA_ICON',	'COLOR_PLAYER_AGLA_ESTONIA_BACKGROUND',	'COLOR_PLAYER_WHITE_TEXT');
--=======================================================================================================================
-- ICON ATLASES
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- IconTextureAtlases
------------------------------------------------------------------------------------------------------------------------
INSERT INTO IconTextureAtlases 
		(Atlas, 										IconSize, 	Filename, 											IconsPerRow, 	IconsPerColumn)
VALUES	('AGLA_ESTONIA_ALPHA_ATLAS',			128, 		'Agla_Estonia_AlphaAtlas_128.dds',			1,				1),
		('AGLA_ESTONIA_ALPHA_ATLAS',			80, 		'Agla_Estonia_AlphaAtlas_80.dds',			1, 				1),
		('AGLA_ESTONIA_ALPHA_ATLAS',			64, 		'Agla_Estonia_AlphaAtlas_64.dds',			1, 				1),
		('AGLA_ESTONIA_ALPHA_ATLAS',			48, 		'Agla_Estonia_AlphaAtlas_48.dds',			1, 				1),
		('AGLA_ESTONIA_ALPHA_ATLAS',			45, 		'Agla_Estonia_AlphaAtlas_45.dds',			1, 				1),
		('AGLA_ESTONIA_ALPHA_ATLAS',			32, 		'Agla_Estonia_AlphaAtlas_32.dds',			1, 				1),
		('AGLA_ESTONIA_ALPHA_ATLAS',			24, 		'Agla_Estonia_AlphaAtlas_24.dds',			1, 				1),
		('AGLA_ESTONIA_ALPHA_ATLAS',			16, 		'Agla_Estonia_AlphaAtlas_16.dds',			1, 				1),
		('AGLA_ESTONIA_ICON_ATLAS', 			256, 		'Agla_Estonia_IconAtlas_256.dds',			2, 				2),
		('AGLA_ESTONIA_ICON_ATLAS', 			128, 		'Agla_Estonia_IconAtlas_128.dds',			2, 				2),
		('AGLA_ESTONIA_ICON_ATLAS', 			80, 		'Agla_Estonia_IconAtlas_80.dds',				2, 				2),
		('AGLA_ESTONIA_ICON_ATLAS', 			64, 		'Agla_Estonia_IconAtlas_64.dds',				2, 				2),
		('AGLA_ESTONIA_ICON_ATLAS', 			45, 		'Agla_Estonia_IconAtlas_45.dds',				2, 				2),
		('AGLA_ESTONIA_ICON_ATLAS', 			32, 		'Agla_Estonia_IconAtlas_32.dds',				2, 				2),
		('AGLA_ESTONIA_UNIT_FLAG_ATLAS', 		32, 		'Agla_FrBro_UnitFlagAtlas_32.dds',			1, 				1);
--=======================================================================================================================	
--=======================================================================================================================	
