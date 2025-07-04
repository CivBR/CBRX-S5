--=======================================================================================================================
-- ART DEFINES
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_StrategicView
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 				TileType,		Asset)
VALUES	('ART_DEF_IMPROVEMENT_LUNG_BALBALS',	'Improvement', 	'kipchakuicon_sv.dds'),		
		('ART_DEF_UNIT_LUNG_TARKHAN',		'Unit', 		'kipchak_uu_alpha_sv.dds');
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_LandmarkTypes
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO ArtDefine_LandmarkTypes 
		(Type, 									LandmarkType,	FriendlyName)
VALUES	('ART_DEF_IMPROVEMENT_LUNG_BALBALS',	'Improvement', 	'LUNG_BALBALS');
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_Landmarks
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO ArtDefine_Landmarks 
		(Era, 	State,					Scale,	ImprovementType,				LayoutHandler,  ResourceType,			 Model,								TerrainContour)
VALUES	('Any', 'UnderConstruction',	0.5,	'ART_DEF_IMPROVEMENT_LUNG_BALBALS',	'SNAPSHOT',		'ART_DEF_RESOURCE_ALL',  'balbal_hb.fxsxml',	1),
		('Any', 'Constructed',			0.5,	'ART_DEF_IMPROVEMENT_LUNG_BALBALS',	'SNAPSHOT',		'ART_DEF_RESOURCE_ALL',  'balbal.fxsxml',		1),
		('Any', 'Pillaged',				0.5,	'ART_DEF_IMPROVEMENT_LUNG_BALBALS',	'SNAPSHOT',		'ART_DEF_RESOURCE_ALL',  'balbal_pl.fxsxml',	1);
		
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfos
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO ArtDefine_UnitInfos 
		(Type, 									DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_LUNG_TARKHAN',		DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_U_OTTOMAN_SIPAHI'; 
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfoMemberInfos
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,							UnitMemberInfoType,							NumMembers)
SELECT	'ART_DEF_UNIT_LUNG_TARKHAN',		'ART_DEF_UNIT_MEMBER_LUNG_TARKHAN',	NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_U_OTTOMAN_SIPAHI';
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberCombats
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,								EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_LUNG_TARKHAN',		EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_U_OTTOMAN_SIPAHI';
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,								"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_LUNG_TARKHAN',		"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_U_OTTOMAN_SIPAHI';
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberInfos
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 											Scale, ZOffset, Domain, Model, 					 MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_LUNG_TARKHAN',		Scale, ZOffset, Domain, 'Horseman_Turkey.fxsxml', MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_U_OTTOMAN_SIPAHI';
--=======================================================================================================================
-- AUDIO
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- Audio_Sounds
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Audio_Sounds 
		(SoundID, 											Filename, 						LoadType)
VALUES	('SND_LEADER_MUSIC_LUNG_KIPCHAKS_PEACE',		'Kipchaks_Peace',		'DynamicResident'),
		('SND_LEADER_MUSIC_LUNG_KIPCHAKS_WAR', 		'Kipchaks_War', 		'DynamicResident');		
------------------------------------------------------------------------------------------------------------------------
-- Audio_2DSounds
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Audio_2DSounds 
		(ScriptID, 											SoundID, 										SoundType, 		TaperSoundtrackVolume,	MinVolume, 	MaxVolume,	IsMusic, Looping)
VALUES	('AS2D_LEADER_MUSIC_LUNG_KIPCHAKS_PEACE', 	'SND_LEADER_MUSIC_LUNG_KIPCHAKS_PEACE',	'GAME_MUSIC', 	-1.0,					50, 		50, 		1, 		 0),
		('AS2D_LEADER_MUSIC_LUNG_KIPCHAKS_WAR',		'SND_LEADER_MUSIC_LUNG_KIPCHAKS_WAR', 	'GAME_MUSIC', 	-1.0,					50, 		50, 		1,		 0);
--=======================================================================================================================
-- COLOURS
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- Colors
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Colors 
		(Type, 												Red, 	Green, 	Blue,   Alpha)
VALUES	('COLOR_PLAYER_LUNG_KIPCHAKS_ICON', 			0.082, 	0.102, 	0.157, 	1),
		('COLOR_PLAYER_LUNG_KIPCHAKS_BACKGROUND', 	0.898,	0.616,	0.231, 	1);
------------------------------------------------------------------------------------------------------------------------
-- PlayerColors
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO PlayerColors 
		(Type, 									PrimaryColor, 								SecondaryColor, 								 TextColor)
VALUES	('PLAYERCOLOR_LUNG_KIPCHAKS',		'COLOR_PLAYER_LUNG_KIPCHAKS_ICON',	'COLOR_PLAYER_LUNG_KIPCHAKS_BACKGROUND',	 'COLOR_PLAYER_WHITE_TEXT');
--=======================================================================================================================
-- ICON ATLASES
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- IconTextureAtlases
------------------------------------------------------------------------------------------------------------------------
INSERT INTO IconTextureAtlases 
		(Atlas, 								IconSize, 	Filename, 										IconsPerRow, 	IconsPerColumn)
VALUES	('LUNG_KIPCHAKS_ALPHA_ATLAS',		128, 		'kipchak_alpha_128.dds',		1,				1),
		('LUNG_KIPCHAKS_ALPHA_ATLAS',		80, 		'kipchak_alpha_80.dds',			1, 				1),
		('LUNG_KIPCHAKS_ALPHA_ATLAS',		64, 		'kipchak_alpha_64.dds',			1, 				1),
		('LUNG_KIPCHAKS_ALPHA_ATLAS',		48, 		'kipchak_alpha_48.dds',			1, 				1),
		('LUNG_KIPCHAKS_ALPHA_ATLAS',		45, 		'kipchak_alpha_45.dds',			1, 				1),
		('LUNG_KIPCHAKS_ALPHA_ATLAS',		32, 		'kipchak_alpha_32.dds',			1, 				1),
		('LUNG_KIPCHAKS_ALPHA_ATLAS',		24, 		'kipchak_alpha_24.dds',			1, 				1),
		('LUNG_KIPCHAKS_ALPHA_ATLAS',		16, 		'kipchak_alpha_16.dds',			1, 				1),
		('LUNG_KIPCHAKS_ICON_ATLAS', 		256, 		'NC_Kipchaks_IconAtlas_256.dds',			2, 				3),
		('LUNG_KIPCHAKS_ICON_ATLAS', 		128, 		'NC_Kipchaks_IconAtlas_128.dds',			2, 				3),
		('LUNG_KIPCHAKS_ICON_ATLAS', 		80, 		'NC_Kipchaks_IconAtlas_80.dds',			2, 				3),
		('LUNG_KIPCHAKS_ICON_ATLAS', 		64, 		'NC_Kipchaks_IconAtlas_64.dds',			2, 				3),
		('LUNG_KIPCHAKS_ICON_ATLAS', 		45, 		'NC_Kipchaks_IconAtlas_45.dds',			2, 				3),
		('LUNG_KIPCHAKS_ICON_ATLAS', 		32, 		'NC_Kipchaks_IconAtlas_32.dds',			2, 				3),
		('LUNG_KIPCHAKS_ICON_BUTTON', 		64, 		'kipchakuiconbutton_64.dds',			1, 				1),
		('LUNG_KIPCHAKS_ICON_BUTTON', 		45, 		'kipchakuiconbutton_45.dds',			1, 				1),
		('LUNG_KIPCHAKS_UNIT_FLAG_ATLAS', 32, 		'kipchak_uu_alpha_32.dds',		2, 				1);
--=======================================================================================================================	
--=======================================================================================================================	
