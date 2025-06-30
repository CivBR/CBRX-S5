--=======================================================================================================================
-- ART DEFINES
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_StrategicView
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 				TileType,		Asset)
VALUES	('ART_DEF_IMPROVEMENT_NC_BARANGAY',	'Improvement', 	'sv_Kampung.dds'),		
		('ART_DEF_UNIT_NC_TIMAWA',		'Unit', 		'sv_timawa.dds');
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfos
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO ArtDefine_LandmarkTypes 
		(Type, 									LandmarkType,	FriendlyName)
VALUES	('ART_DEF_IMPROVEMENT_NC_BARANGAY',	'Improvement', 	'NC_BARANGAY');
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfos
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO ArtDefine_Landmarks 
		(Era, 	State,					Scale,	ImprovementType,				LayoutHandler,  ResourceType,			 Model,								TerrainContour)
VALUES	('Any', 'UnderConstruction',	1,	'ART_DEF_IMPROVEMENT_NC_BARANGAY',	'SNAPSHOT',		'ART_DEF_RESOURCE_ALL',  'Water Village HB.fxsxml',	1),
		('Any', 'Constructed',			1,	'ART_DEF_IMPROVEMENT_NC_BARANGAY',	'SNAPSHOT',		'ART_DEF_RESOURCE_ALL',  'Water Village B.fxsxml',		1),
		('Any', 'Pillaged',				1,	'ART_DEF_IMPROVEMENT_NC_BARANGAY',	'SNAPSHOT',		'ART_DEF_RESOURCE_ALL',  'Water Village PL.fxsxml',	1);
		
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfos
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO ArtDefine_UnitInfos 
		(Type, 									DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_NC_TIMAWA',		DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_PIKEMAN'; 
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfoMemberInfos
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,							UnitMemberInfoType,							NumMembers)
SELECT	'ART_DEF_UNIT_NC_TIMAWA',		'ART_DEF_UNIT_MEMBER_NC_TIMAWA',	NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_PIKEMAN';
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberCombats
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,								EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_NC_TIMAWA',		EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_PIKEMAN';
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,								"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_NC_TIMAWA',		"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_PIKEMAN';
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberInfos
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 											Scale, ZOffset, Domain, Model, 					 MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_NC_TIMAWA',		Scale, ZOffset, Domain, 'u_malaysian_silat.fxsxml', MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_PIKEMAN';
--=======================================================================================================================
-- AUDIO
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- Audio_Sounds
------------------------------------------------------------------------------------------------------------------------	
-- INSERT INTO Audio_Sounds 
--		(SoundID, 											Filename, 						LoadType)
-- VALUES	('SND_LEADER_MUSIC_NC_CEBU_PEACE',		'NC_Cebu_Peace',		'DynamicResident'),
--		('SND_LEADER_MUSIC_NC_CEBU_WAR', 		'NC_Cebu_War', 		'DynamicResident');		
------------------------------------------------------------------------------------------------------------------------
-- Audio_2DSounds
------------------------------------------------------------------------------------------------------------------------	
-- INSERT INTO Audio_2DSounds 
--		(ScriptID, 											SoundID, 										SoundType, 		TaperSoundtrackVolume,	MinVolume, 	MaxVolume,	IsMusic, Looping)
-- VALUES	('AS2D_LEADER_MUSIC_NC_CEBU_PEACE', 	'SND_LEADER_MUSIC_NC_CEBU_PEACE',	'GAME_MUSIC', 	-1.0,					50, 		50, 		1, 		 0),
--		('AS2D_LEADER_MUSIC_NC_CEBU_WAR',		'SND_LEADER_MUSIC_NC_CEBU_WAR', 	'GAME_MUSIC', 	-1.0,					50, 		50, 		1,		 0);
--=======================================================================================================================
-- COLOURS
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- Colors
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Colors 
		(Type, 												Red, 	Green, 	Blue,   Alpha)
VALUES	('COLOR_PLAYER_NC_CEBU_ICON', 			0.467, 	0.855, 	0.804, 	1),
		('COLOR_PLAYER_NC_CEBU_BACKGROUND', 	0.035,	0.251,	0.282, 	1);
------------------------------------------------------------------------------------------------------------------------
-- PlayerColors
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO PlayerColors 
		(Type, 									PrimaryColor, 								SecondaryColor, 								 TextColor)
VALUES	('PLAYERCOLOR_NC_CEBU',		'COLOR_PLAYER_NC_CEBU_ICON',	'COLOR_PLAYER_NC_CEBU_BACKGROUND',	 'COLOR_PLAYER_WHITE_TEXT');
--=======================================================================================================================
-- ICON ATLASES
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- IconTextureAtlases
------------------------------------------------------------------------------------------------------------------------
INSERT INTO IconTextureAtlases 
		(Atlas, 								IconSize, 	Filename, 										IconsPerRow, 	IconsPerColumn)
VALUES	('NC_CEBU_ALPHA_ATLAS',		128, 		'cebuAlpha_128.dds',		1,				1),
		('NC_CEBU_ALPHA_ATLAS',		80, 		'cebuAlpha_80.dds',			1, 				1),
		('NC_CEBU_ALPHA_ATLAS',		64, 		'cebuAlpha_64.dds',			1, 				1),
		('NC_CEBU_ALPHA_ATLAS',		48, 		'cebuAlpha_48.dds',			1, 				1),
		('NC_CEBU_ALPHA_ATLAS',		45, 		'cebuAlpha_45.dds',			1, 				1),
		('NC_CEBU_ALPHA_ATLAS',		32, 		'cebuAlpha_32.dds',			1, 				1),
		('NC_CEBU_ALPHA_ATLAS',		24, 		'cebuAlpha_24.dds',			1, 				1),
		('NC_CEBU_ALPHA_ATLAS',		16, 		'cebuAlpha_16.dds',			1, 				1),
		('NC_CEBU_ICON_ATLAS', 		256, 		'NC_Cebu_IconAtlas_256.dds',			2, 				3),
		('NC_CEBU_ICON_ATLAS', 		128, 		'NC_Cebu_IconAtlas_128.dds',			2, 				3),
		('NC_CEBU_ICON_ATLAS', 		80, 		'NC_Cebu_IconAtlas_80.dds',			2, 				3),
		('NC_CEBU_ICON_ATLAS', 		64, 		'NC_Cebu_IconAtlas_64.dds',			2, 				3),
		('NC_CEBU_ICON_ATLAS', 		45, 		'NC_Cebu_IconAtlas_45.dds',			2, 				3),
		('NC_CEBU_ICON_ATLAS', 		32, 		'NC_Cebu_IconAtlas_32.dds',			2, 				3),
		('NC_CEBU_UNIT_FLAG_ATLAS', 32, 		'timawa_unitflag.dds',		2, 				1);
--=======================================================================================================================	
--=======================================================================================================================	
