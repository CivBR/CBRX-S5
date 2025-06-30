--==========================================================================================================================
-- ART DEFINES
--==========================================================================================================================	
-- IconTextureAtlases
------------------------------
INSERT INTO IconTextureAtlases 
		(Atlas, 									IconSize, 	Filename, 									IconsPerRow, 	IconsPerColumn)
VALUES	('JFD_KALMAR_UNION_ATLAS', 					256, 		'JFD_GE_KalmarUnionAtlas_256.dds',			2, 				3),
		('JFD_KALMAR_UNION_ATLAS', 					128, 		'JFD_GE_KalmarUnionAtlas_128.dds',			2, 				3),
		('JFD_KALMAR_UNION_ATLAS', 					80, 		'JFD_GE_KalmarUnionAtlas_80.dds',			2, 				3),
		('JFD_KALMAR_UNION_ATLAS', 					64, 		'JFD_GE_KalmarUnionAtlas_64.dds',			2, 				3),
		('JFD_KALMAR_UNION_ATLAS', 					45, 		'JFD_GE_KalmarUnionAtlas_45.dds',			2, 				3),
		('JFD_KALMAR_UNION_ATLAS', 					32, 		'JFD_GE_KalmarUnionAtlas_32.dds',			2, 				3),
		('JFD_KALMAR_UNION_ALPHA_ATLAS', 			128, 		'JFD_GE_KalmarUnionAlphaAtlas_128.dds',		1,				1),
		('JFD_KALMAR_UNION_ALPHA_ATLAS', 			80, 		'JFD_GE_KalmarUnionAlphaAtlas_80.dds',		1, 				1),
		('JFD_KALMAR_UNION_ALPHA_ATLAS', 			64, 		'JFD_GE_KalmarUnionAlphaAtlas_64.dds',		1, 				1),
		('JFD_KALMAR_UNION_ALPHA_ATLAS', 			48, 		'JFD_GE_KalmarUnionAlphaAtlas_48.dds',		1, 				1),
		('JFD_KALMAR_UNION_ALPHA_ATLAS', 			45, 		'JFD_GE_KalmarUnionAlphaAtlas_45.dds',		1, 				1),
		('JFD_KALMAR_UNION_ALPHA_ATLAS', 			32, 		'JFD_GE_KalmarUnionAlphaAtlas_32.dds',		1, 				1),
		('JFD_KALMAR_UNION_ALPHA_ATLAS', 			24, 		'JFD_GE_KalmarUnionAlphaAtlas_24.dds',		1, 				1),
		('JFD_KALMAR_UNION_ALPHA_ATLAS', 			16, 		'JFD_GE_KalmarUnionAlphaAtlas_16.dds',		1, 				1),
		('JFD_UNIT_FLAG_GUN_HULK_ATLAS', 			32, 		'JFD_GE_GunHolkUnitFlag_32.dds',			1, 				1),
		('JFD_UNIT_FLAG_MAGNATE_ATLAS',				32, 		'JFD_GE_MagnateUnitFlag_32.dds',			1, 				1);
------------------------------
-- Colors
------------------------------		
INSERT INTO Colors 
		(Type, 											Red, 	Green, 	Blue, 	Alpha)
VALUES	('COLOR_PLAYER_JFD_KALMAR_UNION_ICON', 			0.866,	0.768,	0.501,	1),
		('COLOR_PLAYER_JFD_KALMAR_UNION_BACKGROUND',	0.498,	0.239,	0.168,	1);
------------------------------
-- PlayerColors
------------------------------			
INSERT INTO PlayerColors 
		(Type, 											PrimaryColor, 								SecondaryColor, 									TextColor)
VALUES	('PLAYERCOLOR_JFD_KALMAR_UNION',				'COLOR_PLAYER_JFD_KALMAR_UNION_ICON',		'COLOR_PLAYER_JFD_KALMAR_UNION_BACKGROUND',	'COLOR_PLAYER_WHITE_TEXT');
--==========================================================================================================================
-- AUDIO
--==========================================================================================================================	
-- Audio_Sounds
------------------------------	
INSERT INTO Audio_Sounds 
		(SoundID, 										Filename, 				LoadType)
VALUES	('SND_BUILDING_JFD_KOBSTAD',					'Kobstad', 				'DynamicResident'),
		('SND_SOUND_JFD_KALMAR_UNION', 					'KalmarUnion',			'DynamicResident'),
		('SND_LEADER_MUSIC_JFD_MARGARETHE_PEACE', 		'Margarethe_Peace',		'DynamicResident'),
		('SND_LEADER_MUSIC_JFD_MARGARETHE_WAR',			'Margarethe_War', 		'DynamicResident');		
------------------------------
-- Audio_2DSounds
------------------------------	
INSERT INTO Audio_2DSounds 
		(ScriptID, 										SoundID, 									SoundType, 		TaperSoundtrackVolume,	MinVolume, 	MaxVolume,  IsMusic, Looping)
VALUES	('AS2D_BUILDING_JFD_KOBSTAD',					'SND_BUILDING_JFD_KOBSTAD',					'GAME_SFX', 	0.0,					100, 		100, 		0, 		 0),
		('AS2D_SOUND_JFD_KALMAR_UNION',					'SND_SOUND_JFD_KALMAR_UNION', 				'GAME_SFX', 	-1.0,					80, 		80, 		0, 		 0),
		('AS2D_LEADER_MUSIC_JFD_MARGARETHE_PEACE',		'SND_LEADER_MUSIC_JFD_MARGARETHE_PEACE', 	'GAME_MUSIC', 	-1.0,					45, 		45, 		1, 		 0),
		('AS2D_LEADER_MUSIC_JFD_MARGARETHE_WAR', 		'SND_LEADER_MUSIC_JFD_MARGARETHE_WAR', 		'GAME_MUSIC', 	-1.0,					45, 		45, 		1,		 0);
--==========================================================================================================================
-- UNIT GRAPHICS
--==========================================================================================================================	
-- ArtDefine_StrategicView
------------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 					TileType,		Asset)
VALUES	('ART_DEF_UNIT_JFD_GUN_HOLK', 			'Unit', 		'sv_GunHolk.dds'),
		('ART_DEF_UNIT_JFD_MAGNATE',			'Unit', 		'sv_Magnate.dds');
------------------------------
-- ArtDefine_UnitInfos
------------------------------		
INSERT INTO ArtDefine_UnitInfos 
		(Type, 									DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_JFD_GUN_HOLK', 			DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_GALLEASS';

INSERT INTO ArtDefine_UnitInfos 
		(Type, 									DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_JFD_MAGNATE', 			DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_U_VENETIAN_MERCHANT';
------------------------------
-- ArtDefine_UnitInfoMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,							UnitMemberInfoType,						NumMembers)
SELECT	'ART_DEF_UNIT_JFD_GUN_HOLK', 			'ART_DEF_UNIT_MEMBER_JFD_GUN_HOLK',		NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_GALLEASS';

INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,							UnitMemberInfoType,						NumMembers)
SELECT	'ART_DEF_UNIT_JFD_MAGNATE', 			'ART_DEF_UNIT_MEMBER_JFD_MAGNATE', 		1
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_U_VENETIAN_MERCHANT';
------------------------------
-- ArtDefine_UnitMemberCombats
------------------------------
INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,						EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_GUN_HOLK',		EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_GALLEASS';

INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,						EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_MAGNATE',		EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_U_VENETIAN_MERCHANT';
------------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,						"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_GUN_HOLK',		"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_GALLEASS';

INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,						"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_MAGNATE',		"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_U_VENETIAN_MERCHANT';
------------------------------
-- ArtDefine_UnitMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 									Scale, ZOffset, Domain, Model, 				MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_GUN_HOLK',		Scale, ZOffset, Domain, 'gunholk.fxsxml',	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_GALLEASS';

INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 									Scale, ZOffset, Domain, Model, 				 MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_MAGNATE',		Scale, ZOffset, Domain, 'magnate.fxsxml',	 MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_U_VENETIAN_MERCHANT';
--==========================================================================================================================	
--==========================================================================================================================	
