INSERT INTO Colors
		(Type,						Red,	Green,	Blue,	Alpha)
	VALUES	('COLOR_ASQ_SCOTLAND_MARY_ICON',	round(176.0/255, 3),round(193.0/255, 3),	round(188.0/255, 3), 1),
		('COLOR_ASQ_SCOTLAND_MARY_BG',		round(28.0/255, 3),round(30.0/255, 3),		round(54.0/255, 3), 1);
--	VALUES	('COLOR_ASQ_SCOTLAND_MARY_ICON',	round(189.0/255, 3),round(201.0/255, 3),	round(185.0/255, 3), 1),
--		('COLOR_ASQ_SCOTLAND_MARY_BG',		round(57.0/255, 3),round(50.0/255, 3),		round(35.0/255, 3), 1);


INSERT INTO PlayerColors
		(Type,						PrimaryColor,			SecondaryColor,			TextColor)
VALUES	('PLAYERCOLOR_ASQ_SCOTLAND_MARY',	'COLOR_ASQ_SCOTLAND_MARY_ICON',	'COLOR_ASQ_SCOTLAND_MARY_BG',	'COLOR_PLAYER_WHITE_TEXT');


-----

INSERT INTO IconTextureAtlases
		(Atlas,						IconSize,	Filename,				IconsPerRow,	IconsPerColumn)
VALUES	('ALPHA_ASQ_SCOTLAND_MARY',			128,		'maryScotsAlpha128.dds',	1,				1),
		('ALPHA_ASQ_SCOTLAND_MARY',			64,			'maryScotsAlpha64.dds',	1,				1),
		('ALPHA_ASQ_SCOTLAND_MARY',			48,			'maryScotsAlpha48.dds',	1,				1),
		('ALPHA_ASQ_SCOTLAND_MARY',			32,			'maryScotsAlpha32.dds',	1,				1),
		('ALPHA_ASQ_SCOTLAND_MARY',			24,			'maryScotsAlpha24.dds',	1,				1),
		('ATLAS_ASQ_MARY_SCOTS',			256,		'maryScotsAtlas256.dds',	2,				2),
		('ATLAS_ASQ_MARY_SCOTS',			128,		'maryScotsAtlas128.dds',	2,				2),
		('ATLAS_ASQ_MARY_SCOTS',			80,			'maryScotsAtlas80.dds',		2,				2),
		('ATLAS_ASQ_MARY_SCOTS',			64,			'maryScotsAtlas64.dds',		2,				2),
		('ATLAS_ASQ_MARY_SCOTS',			45,			'maryScotsAtlas45.dds',		2,				2),
		('ATLAS_ASQ_MARY_SCOTS',			32,			'maryScotsAtlas32.dds',		2,				2),
		('ALPHA_ASQ_HACKBUTTER',			32,			'hackbutterAlpha32.dds',		1,				1),
		('ALPHA_ASQ_HACKBUTTER',			128,		'hackbutterAlpha128.dds',	1,				1)
		;

		--------------------------------------------------------------------------------------------------------------------------
		-- ArtDefine_StrategicView
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 			TileType,	Asset)
SELECT	'ART_DEF_UNIT_ASQ_HACKBUTTER',	TileType, 	'hackbutterAlpha128.dds'
FROM ArtDefine_StrategicView WHERE StrategicViewType = 'ART_DEF_UNIT_MUSKETMAN';
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfos
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO ArtDefine_UnitInfos 
		(Type, 							DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_ASQ_HACKBUTTER',		DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_MUSKETMAN';
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfoMemberInfos
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,					UnitMemberInfoType,					NumMembers)
SELECT	'ART_DEF_UNIT_ASQ_HACKBUTTER', 	'ART_DEF_UNIT_MEMBER_ASQ_HACKBUTTER',	NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_MUSKETMAN';
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberCombats
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,					EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_ASQ_HACKBUTTER',	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_MUSKETMAN';
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberCombatWeapons
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,						"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_ASQ_HACKBUTTER',	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_MUSKETMAN';
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberInfos
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 									Scale,	ZOffset, Domain, Model, 		MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_ASQ_HACKBUTTER',	Scale,	ZOffset, Domain, 'hackbutter.fxsxml',			MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_MUSKETMAN';
--==========================================================================================================================
-- AUDIO
--==========================================================================================================================	
-- Audio_Sounds
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Audio_Sounds 
		(SoundID, 										Filename, 					LoadType)
VALUES	('SND_LEADER_MUSIC_ASQ_MARY_SCOTS_PEACE', 		'Mary_Peace',	'DynamicResident'),
		('SND_LEADER_MUSIC_ASQ_MARY_SCOTS_WAR', 		'Mary_War', 		'DynamicResident');		
--------------------------------------------------------------------------------------------------------------------------
-- Audio_2DSounds
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Audio_2DSounds 
		(ScriptID, 										SoundID, 									SoundType, 		TaperSoundtrackVolume,	MinVolume, 	MaxVolume,  IsMusic, Looping)
VALUES	('AS2D_LEADER_MUSIC_ASQ_MARY_SCOTS_AMBIENCE', 	'SND_AMBIENCE_COAST_BED', 				'GAME_SFX', 	0.0,					50, 		50, 		0, 		 1),
		('AS2D_LEADER_MUSIC_ASQ_MARY_SCOTS_PEACE',		'SND_LEADER_MUSIC_ASQ_MARY_SCOTS_PEACE', 	'GAME_MUSIC', 	-1.0,					45, 		100, 		1, 		 0),
		('AS2D_LEADER_MUSIC_ASQ_MARY_SCOTS_WAR', 		'SND_LEADER_MUSIC_ASQ_MARY_SCOTS_WAR', 		'GAME_MUSIC', 	-1.0,					45, 		100, 		1,		 0);

