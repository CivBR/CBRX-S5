--=======================================================================================================================
-- ART DEFINES
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_StrategicView
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 				TileType,		Asset)
VALUES	('ART_DEF_UNIT_JFD_SWISS_GUARD',	'Unit', 		'sv_SwissGuard.dds');
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfos
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO ArtDefine_UnitInfos 
		(Type, 								DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_JFD_SWISS_GUARD', 	DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_PIKEMAN';	
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfos
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,						UnitMemberInfoType,						NumMembers)
SELECT	'ART_DEF_UNIT_JFD_SWISS_GUARD', 	'ART_DEF_UNIT_MEMBER_JFD_SWISS_GUARD', 	NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_PIKEMAN';
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfos
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,						EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_SWISS_GUARD',	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_PIKEMAN';
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,						"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_SWISS_GUARD',	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_PIKEMAN';
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfos
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 									Scale, ZOffset, Domain, Model,					MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_SWISS_GUARD',	Scale, ZOffset, Domain, 'reislaufer.fxsxml',	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_PIKEMAN';
--=======================================================================================================================
-- AUDIO
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- Audio_Sounds
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Audio_Sounds 
		(SoundID, 												Filename, 							LoadType)
VALUES	('SND_LEADER_MUSIC_JFD_PAPAL_STATES_JULIUS_II_PEACE',	'JFD_PapalStatesJuliusII_Peace', 	'DynamicResident'),
		('SND_LEADER_MUSIC_JFD_PAPAL_STATES_JULIUS_II_WAR', 	'JFD_PapalStatesJuliusII_War',	 	'DynamicResident');			
------------------------------------------------------------------------------------------------------------------------
-- Audio_2DSounds
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Audio_2DSounds 
		(ScriptID, 												SoundID, 												SoundType, 		TaperSoundtrackVolume,	MinVolume, 	MaxVolume,  IsMusic, Looping)
VALUES	('AS2D_LEADER_MUSIC_JFD_PAPAL_STATES_JULIUS_II_PEACE',	'SND_LEADER_MUSIC_JFD_PAPAL_STATES_JULIUS_II_PEACE',	'GAME_MUSIC',	-1.0,					45, 		45, 		1, 		 0),
		('AS2D_LEADER_MUSIC_JFD_PAPAL_STATES_JULIUS_II_WAR', 	'SND_LEADER_MUSIC_JFD_PAPAL_STATES_JULIUS_II_WAR', 		'GAME_MUSIC',	-1.0,					45, 		45, 		1,		 0);
--=======================================================================================================================
-- COLOURS
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- Colors
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Colors 
		(Type, 													Red, 	Green, 	Blue, 	Alpha)
VALUES	('COLOR_PLAYER_JFD_PAPAL_STATES_JULIUS_II_ICON', 		0.949,	0.886,	0.756, 	1),
		('COLOR_PLAYER_JFD_PAPAL_STATES_JULIUS_II_BACKGROUND',	0.737,	0.341,	0.125, 	1);
------------------------------------------------------------------------------------------------------------------------
-- PlayerColors
------------------------------------------------------------------------------------------------------------------------				
INSERT INTO PlayerColors 
		(Type, 										PrimaryColor, 									SecondaryColor, 										TextColor)
VALUES	('PLAYERCOLOR_JFD_PAPAL_STATES_JULIUS_II',	'COLOR_PLAYER_JFD_PAPAL_STATES_JULIUS_II_ICON', 'COLOR_PLAYER_JFD_PAPAL_STATES_JULIUS_II_BACKGROUND', 	'COLOR_PLAYER_WHITE_TEXT');
--=======================================================================================================================
-- ICON ATLASES
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- IconTextureAtlases
------------------------------------------------------------------------------------------------------------------------
INSERT INTO IconTextureAtlases 
		(Atlas, 										IconSize, 	Filename, 											IconsPerRow, 	IconsPerColumn)
VALUES	('JFD_PAPAL_STATES_JULIUS_II_ALPHA_ATLAS', 		128, 		'JFD_PapalStatesJuliusII_AlphaAtlas_128.dds',		1, 				1),
		('JFD_PAPAL_STATES_JULIUS_II_ALPHA_ATLAS', 		80, 		'JFD_PapalStatesJuliusII_AlphaAtlas_80.dds',		1, 				1),
		('JFD_PAPAL_STATES_JULIUS_II_ALPHA_ATLAS', 		64, 		'JFD_PapalStatesJuliusII_AlphaAtlas_64.dds',		1, 				1),
		('JFD_PAPAL_STATES_JULIUS_II_ALPHA_ATLAS', 		48, 		'JFD_PapalStatesJuliusII_AlphaAtlas_48.dds',		1, 				1),
		('JFD_PAPAL_STATES_JULIUS_II_ALPHA_ATLAS', 		45, 		'JFD_PapalStatesJuliusII_AlphaAtlas_45.dds',		1, 				1),
		('JFD_PAPAL_STATES_JULIUS_II_ALPHA_ATLAS', 		32, 		'JFD_PapalStatesJuliusII_AlphaAtlas_32.dds',		1, 				1),
		('JFD_PAPAL_STATES_JULIUS_II_ALPHA_ATLAS', 		24, 		'JFD_PapalStatesJuliusII_AlphaAtlas_24.dds',		1, 				1),
		('JFD_PAPAL_STATES_JULIUS_II_ALPHA_ATLAS', 		16, 		'JFD_PapalStatesJuliusII_AlphaAtlas_16.dds',		1, 				1),
		('JFD_PAPAL_STATES_JULIUS_II_ICON_ATLAS', 		256, 		'JFD_PapalStatesJuliusII_IconAtlas_256.dds',		2, 				2),
		('JFD_PAPAL_STATES_JULIUS_II_ICON_ATLAS', 		128, 		'JFD_PapalStatesJuliusII_IconAtlas_128.dds',		2, 				2),
		('JFD_PAPAL_STATES_JULIUS_II_ICON_ATLAS', 		80, 		'JFD_PapalStatesJuliusII_IconAtlas_80.dds',			2, 				2),
		('JFD_PAPAL_STATES_JULIUS_II_ICON_ATLAS', 		64, 		'JFD_PapalStatesJuliusII_IconAtlas_64.dds',			2, 				2),
		('JFD_PAPAL_STATES_JULIUS_II_ICON_ATLAS', 		45, 		'JFD_PapalStatesJuliusII_IconAtlas_45.dds',			2, 				2),
		('JFD_PAPAL_STATES_JULIUS_II_ICON_ATLAS', 		32, 		'JFD_PapalStatesJuliusII_IconAtlas_32.dds',			2, 				2),
		('JFD_PAPAL_STATES_JULIUS_II_UNIT_FLAG_ATLAS',	32, 		'JFD_PapalStatesJuliusII_UnitFlagAtlas_32.dds',		1, 				1);
--=======================================================================================================================	
--=======================================================================================================================	
