--=======================================================================================================================
-- ART DEFINES
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_StrategicView
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 					TileType,	Asset)
VALUES	('ART_DEF_UNIT_NC_WASHABE', 	'Unit', 	'PoncaFlagSV.dds');
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfos
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO ArtDefine_UnitInfos 
		(Type, 							DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_NC_WASHABE',		DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_ARCHER';
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfoMemberInfos
--------------------------------------------------------------------------------------------------------------------------

INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,					UnitMemberInfoType,						NumMembers)
SELECT	'ART_DEF_UNIT_NC_WASHABE', 		'ART_DEF_UNIT_MEMBER_NC_WASHABE',		NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_ARCHER';
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberCombats
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,					EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_NC_WASHABE',	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_ARCHER';
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberCombatWeapons
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,					"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_NC_WASHABE',	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_ARCHER';
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberInfos
-------------------------------------------------------------------------------------------------------------------------												 
INSERT INTO ArtDefine_UnitMemberInfos 														 
		(Type, 									Scale,	ZOffset, Domain, Model, 			 MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_NC_WASHABE',		Scale,	ZOffset, Domain, 'Archer_Aztec.fxsxml',	 MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_CROSSBOWMAN';	
--=======================================================================================================================
-- AUDIO
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- Audio_Sounds
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Audio_Sounds 
		(SoundID, 											Filename, 						LoadType)
VALUES	('SND_LEADER_MUSIC_NC_PONCA_PEACE',		'NC_Ponca_Peace',		'DynamicResident'),
		('SND_LEADER_MUSIC_NC_PONCA_WAR', 		'NC_Ponca_War', 		'DynamicResident');		
------------------------------------------------------------------------------------------------------------------------
-- Audio_2DSounds
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Audio_2DSounds 
		(ScriptID, 											SoundID, 										SoundType, 		TaperSoundtrackVolume,	MinVolume, 	MaxVolume,	IsMusic, Looping)
VALUES	('AS2D_LEADER_MUSIC_NC_PONCA_PEACE',		'SND_LEADER_MUSIC_NC_PONCA_PEACE',	'GAME_MUSIC', 	-1.0,					50, 		50, 		1, 		 0),
		('AS2D_LEADER_MUSIC_NC_PONCA_WAR',		'SND_LEADER_MUSIC_NC_PONCA_WAR', 		'GAME_MUSIC', 	-1.0,					50, 		50, 		1,		 0);
--=======================================================================================================================
-- COLOURS
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- Colors
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Colors 
		(Type, 											Red, 	Green, 	Blue,   Alpha)
VALUES	('COLOR_PLAYER_NC_PONCA_ICON', 		0.518, 	0.271, 	0.020, 	1),
		('COLOR_PLAYER_NC_PONCA_BACKGROUND', 	0.894,	0.831,	0.635, 	1);
------------------------------------------------------------------------------------------------------------------------
-- PlayerColors
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO PlayerColors 
		(Type, 									PrimaryColor, 								SecondaryColor, 								 TextColor)
VALUES	('PLAYERCOLOR_NC_PONCA',		'COLOR_PLAYER_NC_PONCA_ICON',		'COLOR_PLAYER_NC_PONCA_BACKGROUND',	 'COLOR_PLAYER_WHITE_TEXT');
--=======================================================================================================================
-- ICON ATLASES
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- IconTextureAtlases
------------------------------------------------------------------------------------------------------------------------
INSERT INTO IconTextureAtlases 
		(Atlas, 								IconSize, 	Filename, 										IconsPerRow, 	IconsPerColumn)
VALUES	('NC_PONCA_ALPHA_ATLAS',		128, 		'PoncaAlpha_128.dds',			1,				1),
		('NC_PONCA_ALPHA_ATLAS',		80, 		'PoncaAlpha_80.dds',			1, 				1),
		('NC_PONCA_ALPHA_ATLAS',		64, 		'PoncaAlpha_64.dds',			1, 				1),
		('NC_PONCA_ALPHA_ATLAS',		48, 		'PoncaAlpha_48.dds',			1, 				1),
		('NC_PONCA_ALPHA_ATLAS',		45, 		'PoncaAlpha_45.dds',			1, 				1),
		('NC_PONCA_ALPHA_ATLAS',		32, 		'PoncaAlpha_32.dds',			1, 				1),
		('NC_PONCA_ALPHA_ATLAS',		24, 		'PoncaAlpha_24.dds',			1, 				1),
		('NC_PONCA_ALPHA_ATLAS',		16, 		'PoncaAlpha_16.dds',			1, 				1),
		('NC_PONCA_ICON_ATLAS', 		256, 		'PoncaAtlas_256.dds',			2, 				2),
		('NC_PONCA_ICON_ATLAS', 		128, 		'PoncaAtlas_128.dds',			2, 				2),
		('NC_PONCA_ICON_ATLAS', 		80, 		'PoncaAtlas_80.dds',			2, 				2),
		('NC_PONCA_ICON_ATLAS', 		64, 		'PoncaAtlas_64.dds',			2, 				2),
		('NC_PONCA_ICON_ATLAS', 		45, 		'PoncaAtlas_45.dds',			2, 				2),
		('NC_PONCA_ICON_ATLAS', 		32, 		'PoncaAtlas_32.dds',			2, 				2),
		('NC_PONCA_CAMP_FLAG',		45,			'BedouinsCampFlag45.dds',		1,				1),
		('NC_PONCA_CAMP_FLAG',		80,			'BedouinsCampFlag80.dds',		1,				1),
		('NC_PONCA_UNIT_FLAG_ATLAS',	32, 		'PoncaFlag32.dds',		1, 				1);
--=======================================================================================================================	
--=======================================================================================================================	
