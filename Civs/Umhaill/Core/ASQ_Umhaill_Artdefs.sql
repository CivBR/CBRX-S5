INSERT INTO Colors
		(Type,						Red,	Green,	Blue,	Alpha)
--VALUES	('COLOR_ASQ_UMHAILL_ICON',	round(105.0/255, 3),round(3.0/255, 3),	round(0.0/255, 3), 1),
--		('COLOR_ASQ_UMHAILL_BG',		round(216.0/255, 3),round(165.0/255, 3),		round(42.0/255, 3), 1);
VALUES	('COLOR_ASQ_UMHAILL_ICON',	round(109.0/255, 3),round(4.0/255, 3),	round(24.0/255, 3), 1),
		('COLOR_ASQ_UMHAILL_BG',		round(237.0/255, 3),round(179.0/255, 3),		round(22.0/255, 3), 1);

INSERT INTO PlayerColors
		(Type,						PrimaryColor,			SecondaryColor,			TextColor)
VALUES	('PLAYERCOLOR_ASQ_UMHAILL',	'COLOR_ASQ_UMHAILL_ICON',	'COLOR_ASQ_UMHAILL_BG',	'COLOR_PLAYER_WHITE_TEXT');


-----

INSERT INTO IconTextureAtlases
		(Atlas,						IconSize,	Filename,				IconsPerRow,	IconsPerColumn)
VALUES	('ALPHA_ASQ_UMHAILL',			128,		'umhaillAlpha128.dds',	1,				1),
		('ALPHA_ASQ_UMHAILL',			64,			'umhaillAlpha64.dds',	1,				1),
		('ALPHA_ASQ_UMHAILL',			48,			'umhaillAlpha48.dds',	1,				1),
		('ALPHA_ASQ_UMHAILL',			32,			'umhaillAlpha32.dds',	1,				1),
		('ALPHA_ASQ_UMHAILL',			24,			'umhaillAlpha24.dds',	1,				1),
		('ATLAS_ASQ_GRACEOMALLEY',			256,		'umhaillAtlas256.dds',	2,				2),
		('ATLAS_ASQ_GRACEOMALLEY',			128,		'umhaillAtlas128.dds',	2,				2),
		('ATLAS_ASQ_GRACEOMALLEY',			80,			'umhaillAtlas80.dds',		2,				2),
		('ATLAS_ASQ_GRACEOMALLEY',			64,			'umhaillAtlas64.dds',		2,				2),
		('ATLAS_ASQ_GRACEOMALLEY',			45,			'umhaillAtlas45.dds',		2,				2),
		('ATLAS_ASQ_GRACEOMALLEY',			32,			'umhaillAtlas32.dds',		2,				2),
		('ALPHA_ASQ_LONGAFADA',			32,			'longaFadaAlpha32.dds',		1,				1),
		('ALPHA_ASQ_LONGAFADA',			128,		'longaFadaAlpha128.dds',	1,				1)
		;

		--------------------------------------------------------------------------------------------------------------------------
		-- ArtDefine_StrategicView
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 			TileType,	Asset)
SELECT	'ART_DEF_UNIT_ASQ_LONGAFADA',	TileType, 	'longaFadaAlpha128.dds'
FROM ArtDefine_StrategicView WHERE StrategicViewType = 'ART_DEF_UNIT_CARAVEL';
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfos
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO ArtDefine_UnitInfos 
		(Type, 							DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_ASQ_LONGAFADA',		DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_CARAVEL';
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfoMemberInfos
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,					UnitMemberInfoType,					NumMembers)
SELECT	'ART_DEF_UNIT_ASQ_LONGAFADA', 	'ART_DEF_UNIT_MEMBER_ASQ_LONGAFADA',	NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_CARAVEL';
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberCombats
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,					EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_ASQ_LONGAFADA',	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_CARAVEL';
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberCombatWeapons
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,						"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_ASQ_LONGAFADA',	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_CARAVEL';
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberInfos
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 									Scale,	ZOffset, Domain, Model, 		MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_ASQ_LONGAFADA',	Scale,	ZOffset, Domain, 'Skeid.fxsxml',			MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_CARAVEL';
--==========================================================================================================================
-- AUDIO
--==========================================================================================================================	
-- Audio_Sounds
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Audio_Sounds 
		(SoundID, 										Filename, 					LoadType)
VALUES	('SND_LEADER_MUSIC_ASQ_GRACEOMALLEY_PEACE', 		'Pandya_Peace',	'DynamicResident'),
		('SND_LEADER_MUSIC_ASQ_GRACEOMALLEY_WAR', 		'Pandya_War', 		'DynamicResident');		
--------------------------------------------------------------------------------------------------------------------------
-- Audio_2DSounds
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Audio_2DSounds 
		(ScriptID, 										SoundID, 									SoundType, 		TaperSoundtrackVolume,	MinVolume, 	MaxVolume,  IsMusic, Looping)
VALUES	('AS2D_LEADER_MUSIC_ASQ_GRACEOMALLEY_AMBIENCE', 	'SND_AMBIENCE_COAST_BED', 				'GAME_SFX', 	0.0,					50, 		50, 		0, 		 1),
		('AS2D_LEADER_MUSIC_ASQ_GRACEOMALLEY_PEACE',		'SND_LEADER_MUSIC_ASQ_GRACEOMALLEY_PEACE', 	'GAME_MUSIC', 	-1.0,					45, 		100, 		1, 		 0),
		('AS2D_LEADER_MUSIC_ASQ_GRACEOMALLEY_WAR', 		'SND_LEADER_MUSIC_ASQ_GRACEOMALLEY_WAR', 		'GAME_MUSIC', 	-1.0,					45, 		100, 		1,		 0);

