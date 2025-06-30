--=======================================================================================================================
-- ART DEFINES
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_StrategicView
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 						TileType,	Asset)
VALUES	('ART_DEF_UNIT_NC_BOLO',		'Unit', 	'wass_uu_alpha_sv.dds');
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfos
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO ArtDefine_UnitInfos 
		(Type, 										DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_NC_BOLO', 		DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_MUSKETMAN'; 
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfos
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,								UnitMemberInfoType,								NumMembers)
SELECT	'ART_DEF_UNIT_NC_BOLO', 		'ART_DEF_UNIT_MEMBER_NC_BOLO', 	NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_MUSKETMAN';
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfos
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,								EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_NC_BOLO',	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_MUSKETMAN';
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,								"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_NC_BOLO',	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_MUSKETMAN';
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfos
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 											Scale, ZOffset, Domain, Model, 						MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_NC_BOLO',	Scale, ZOffset, Domain, 'civ5_ottrm2.fxsxml',	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_MUSKETMAN';	
--=======================================================================================================================
-- AUDIO
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- Audio_Sounds
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Audio_Sounds 
		(SoundID, 										 Filename, 						LoadType)
VALUES	('SND_LEADER_MUSIC_NC_WASSOULOU_PEACE',	 'NC_Wassoulou_Peace', 	'DynamicResident'),
		('SND_LEADER_MUSIC_NC_WASSOULOU_WAR', 	 'NC_Wassoulou_War', 	'DynamicResident');			
------------------------------------------------------------------------------------------------------------------------
-- Audio_2DSounds
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Audio_2DSounds 
		(ScriptID, 												SoundID, 										SoundType, 		TaperSoundtrackVolume,	MinVolume, 	MaxVolume,  IsMusic, Looping)
VALUES	('AS2D_AMBIENCE_LEADER_NC_WASSOULOU_AMBIENCE',	'SND_AMBIENCE_COAST_BED', 						'GAME_SFX', 	-1.0,					25, 		25, 		0,		 1),
		('AS2D_LEADER_MUSIC_NC_WASSOULOU_PEACE',		'SND_LEADER_MUSIC_NC_WASSOULOU_PEACE',	'GAME_MUSIC',	-1.0,					45, 		45, 		1, 		 0),
		('AS2D_LEADER_MUSIC_NC_WASSOULOU_WAR', 			'SND_LEADER_MUSIC_NC_WASSOULOU_WAR', 	'GAME_MUSIC',	-1.0,					45, 		45, 		1,		 0);
--=======================================================================================================================
-- COLOURS
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- Colors
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Colors 
		(Type, 												Red, 	Green, 	Blue, 	Alpha)
VALUES	('COLOR_PLAYER_NC_WASSOULOU_ICON', 			0.098,	0.110,	0.302, 	1),
		('COLOR_PLAYER_NC_WASSOULOU_BACKGROUND',	0.647,	0.882,	0.922, 	1);
------------------------------------------------------------------------------------------------------------------------
-- PlayerColors
------------------------------------------------------------------------------------------------------------------------				
INSERT INTO PlayerColors 
		(Type, 									PrimaryColor, 								SecondaryColor, 									TextColor)
VALUES	('PLAYERCOLOR_NC_WASSOULOU',	'COLOR_PLAYER_NC_WASSOULOU_ICON',	'COLOR_PLAYER_NC_WASSOULOU_BACKGROUND', 	'COLOR_PLAYER_WHITE_TEXT');
--=======================================================================================================================
-- ICON ATLASES
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- IconTextureAtlases
------------------------------------------------------------------------------------------------------------------------
INSERT INTO IconTextureAtlases 
		(Atlas, 									IconSize, 	Filename, 										IconsPerRow, 	IconsPerColumn)
VALUES	('NC_WASSOULOU_ALPHA_ATLAS', 		128, 		'NC_Wassoulou_AlphaAtlas_128.dds',		1, 				1),
		('NC_WASSOULOU_ALPHA_ATLAS', 		80, 		'NC_Wassoulou_AlphaAtlas_80.dds',		1, 				1),
		('NC_WASSOULOU_ALPHA_ATLAS', 		64, 		'NC_Wassoulou_AlphaAtlas_64.dds',		1, 				1),
		('NC_WASSOULOU_ALPHA_ATLAS', 		48, 		'NC_Wassoulou_AlphaAtlas_48.dds',		1, 				1),
		('NC_WASSOULOU_ALPHA_ATLAS', 		45, 		'NC_Wassoulou_AlphaAtlas_45.dds',		1, 				1),
		('NC_WASSOULOU_ALPHA_ATLAS', 		32, 		'wass_alpha32.dds',		1, 				1),
		('NC_WASSOULOU_ALPHA_ATLAS', 		24, 		'NC_Wassoulou_AlphaAtlas_24.dds',		1, 				1),
		('NC_WASSOULOU_ALPHA_ATLAS', 		16, 		'NC_Wassoulou_AlphaAtlas_16.dds',		1, 				1),
		('NC_WASSOULOU_ICON_ATLAS', 		256, 		'NC_Wassoulou_IconAtlas_256.dds',		2, 				2),
		('NC_WASSOULOU_ICON_ATLAS', 		128, 		'NC_Wassoulou_IconAtlas_128.dds',		2, 				2),
		('NC_WASSOULOU_ICON_ATLAS', 		80, 		'NC_Wassoulou_IconAtlas_80.dds',			2, 				2),
		('NC_WASSOULOU_ICON_ATLAS', 		64, 		'NC_Wassoulou_IconAtlas_64.dds',			2, 				2),
		('NC_WASSOULOU_ICON_ATLAS', 		45, 		'NC_Wassoulou_IconAtlas_45.dds',			2, 				2),
		('NC_WASSOULOU_ICON_ATLAS', 		32, 		'NC_Wassoulou_IconAtlas_32.dds',			2, 				2),
		('NC_WASSOULOU_UNIT_FLAG_ATLAS',	32, 		'wass_uu_alpha32.dds',		1, 				1);
--=======================================================================================================================	
--=======================================================================================================================	
