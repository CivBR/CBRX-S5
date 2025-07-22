--=======================================================================================================================
--==========================================================================================================================
-- UNIT/RESOURCE GRAPHICS
--==========================================================================================================================	
-- ArtDefine_StrategicView
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 				TileType,		Asset)
VALUES	('ART_DEF_UNIT_US_REVOLUTIONARY_GUARD',			'Unit', 		'sv_NationalGuard_128.dds');
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfos
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO ArtDefine_UnitInfos 
		(Type, 								DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_US_REVOLUTIONARY_GUARD',			DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_MUSKETMAN';	
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfoMemberInfos
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,						UnitMemberInfoType,					NumMembers)
SELECT	'ART_DEF_UNIT_US_REVOLUTIONARY_GUARD', 			'ART_DEF_UNIT_MEMBER_REVOLUTIONARY_GUARD',		NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_MUSKETMAN';
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberCombats
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,				EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_REVOLUTIONARY_GUARD',	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_MUSKETMAN';
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberCombatWeapons
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,				"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_REVOLUTIONARY_GUARD',	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_MUSKETMAN';
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberInfos
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 									Scale,	ZOffset, Domain, Model, 			MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_REVOLUTIONARY_GUARD',	Scale,	ZOffset, Domain, 'civ5_fremm1.fxsxml',	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_MUSKETMAN';
--=======================================================================================================================
-- AUDIO
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- Audio_Sounds
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Audio_Sounds 
		(SoundID, 								Filename, 				LoadType)
VALUES	('SND_LEADER_MUSIC_US_FRANCE_PEACE', 	'US_FRANCE_Peace',		'DynamicResident'),
		('SND_LEADER_MUSIC_US_FRANCE_WAR',		'US_FRANCE_War', 		'DynamicResident');		
------------------------------------------------------------------------------------------------------------------------
-- Audio_2DSounds
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Audio_2DSounds 
		(ScriptID, 									SoundID, 								SoundType, 		TaperSoundtrackVolume,	MinVolume, 	MaxVolume,  IsMusic, Looping)
VALUES	('AS2D_LEADER_MUSIC_US_FRANCE_PEACE',		'SND_LEADER_MUSIC_US_FRANCE_PEACE',	'GAME_MUSIC', 	-1.0,					60, 		60, 		1, 		 0),
		('AS2D_LEADER_MUSIC_US_FRANCE_WAR', 		'SND_LEADER_MUSIC_US_FRANCE_WAR', 		'GAME_MUSIC', 	-1.0,					60, 		60, 		1,		 0);
--=======================================================================================================================
-- COLOURS
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- Colors
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Colors 
		(Type, 										Red, 	Green, 	Blue, 	Alpha)
VALUES	('COLOR_PLAYER_US_FRANCE_ICON', 			0.924,	0.322,	0.22,	1),
		('COLOR_PLAYER_US_FRANCE_BACKGROUND',		0.062,	0.182,	0.284,	1);
------------------------------------------------------------------------------------------------------------------------
-- PlayerColors
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO PlayerColors 
		(Type, 								PrimaryColor, 						SecondaryColor,								TextColor)
VALUES	('PLAYERCOLOR_US_FRANCE',		'COLOR_PLAYER_US_FRANCE_ICON',	'COLOR_PLAYER_US_FRANCE_BACKGROUND',   'COLOR_PLAYER_WHITE_TEXT');
--=======================================================================================================================
-- ICON ATLAS
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- IconTextureAtlases
------------------------------------------------------------------------------------------------------------------------
INSERT INTO IconTextureAtlases 
		(Atlas, 							IconSize, 	Filename, 					IconsPerRow, 	IconsPerColumn)
VALUES	('US_FRANCE_ALPHA_ATLAS',			128, 		'RevFrance_Alpha_128.dds',			1, 				1),
		('US_FRANCE_ALPHA_ATLAS',			64, 		'RevFrance_Alpha_64.dds',			1, 				1),
		('US_FRANCE_ALPHA_ATLAS',			48, 		'RevFrance_Alpha_48.dds',			1, 				1),
		('US_FRANCE_ALPHA_ATLAS',			32, 		'RevFrance_Alpha_32.dds',			1, 				1),
		('US_FRANCE_ALPHA_ATLAS',			24, 		'RevFrance_Alpha_24.dds',			1, 				1),
		('US_FRANCE_ICON_ATLAS', 			256, 		'RevFrance_Atlas_256.dds',			2, 				2),
		('US_FRANCE_ICON_ATLAS', 			128, 		'RevFrance_Atlas_128.dds',			2, 				2),
		('US_FRANCE_ICON_ATLAS', 			80, 		'RevFrance_Atlas_80.dds',			2, 				2),
		('US_FRANCE_ICON_ATLAS', 			64, 		'RevFrance_Atlas_64.dds',			2, 				2),
		('US_FRANCE_ICON_ATLAS', 			45, 		'RevFrance_Atlas_45.dds',			2, 				2),
		('US_FRANCE_ICON_ATLAS', 			32, 		'RevFrance_Atlas_32.dds',			2, 				2),
		('SUPREME_BEING_ATLAS',				16, 		'Supreme_Being_16.dds',				1, 				1),
		('SUPREME_BEING_ATLAS',				214, 		'Supreme_Being_214.dds',			1, 				1),
		('SUPREME_BEING_ATLAS',				24, 		'Supreme_Being_24.dds',				1, 				1),
		('SUPREME_BEING_ATLAS',				256, 		'Supreme_Being_256.dds',			1, 				1),
		('SUPREME_BEING_ATLAS',				32, 		'Supreme_Being_32.dds',				1, 				1),
		('SUPREME_BEING_ATLAS',				80, 		'Supreme_Being_80.dds',				1, 				1),
		('SUPREME_BEING_ATLAS',				128, 		'Supreme_Being_128.dds',			1, 				1),
		('SUPREME_BEING_ATLAS',				45, 		'Supreme_Being_45.dds',				1, 				1),
		('SUPREME_BEING_ATLAS',				64, 		'Supreme_Being_64.dds',				1, 				1),
		('US_FRANCE_FLAG_ATLAS',			32, 		'GuardFlag32.dds',					1, 				1);
--=======================================================================================================================	
--=======================================================================================================================	


