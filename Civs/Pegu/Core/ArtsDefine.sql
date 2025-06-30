--==========================================================================================================================	
-- Atlas Defines
--==========================================================================================================================	
INSERT INTO IconTextureAtlases 
		(Atlas, 				IconSize, 		Filename, 				IconsPerRow, 	IconsPerColumn)
VALUES 	('ER_PEGU_ATLAS',			256, 		'PeguAtlas256.dds',		8,				8),
		('ER_PEGU_ATLAS',			128, 		'PeguAtlas128.dds',		8,				8),
		('ER_PEGU_ATLAS',			80, 		'PeguAtlas80.dds',		8,				8),
		('ER_PEGU_ATLAS',			64, 		'PeguAtlas64.dds',		8,				8),
		('ER_PEGU_ATLAS',			45, 		'PeguAtlas45.dds',		8,				8),
		('ER_PEGU_ATLAS',			32, 		'PeguAtlas32.dds',		8,				8),
		('ER_ALPHA_PEGU_ATLAS',		64,			'PeguAlpha64.dds',		1,				1),
		('ER_ALPHA_PEGU_ATLAS',		48,			'PeguAlpha48.dds',		1,				1),
		('ER_ALPHA_PEGU_ATLAS',		32,			'PeguAlpha32.dds',		1,				1),
		('ER_ALPHA_PEGU_ATLAS',		24,			'PeguAlpha24.dds',		1,				1),
		('ER_KBBANG_FLAG',			32,		'UnitFlag_ER_Kbbang.dds',	1,				1);
--==========================================================================================================================	
-- Sound Defines
--==========================================================================================================================	
INSERT INTO Audio_Sounds
		(SoundID,									Filename,		LoadType)
VALUES	('SND_LEADER_MUSIC_ER_SHIN_SAWBU_PEACE',	'Pegu_Peace',	'DynamicResident'),
		('SND_LEADER_MUSIC_ER_SHIN_SAWBU_WAR',		'Pegu_War',		'DynamicResident'),
		('SND_DOM_SPEECH_SHIN_SAWBU',				'Pegu_DoM',		'DynamicResident');

INSERT INTO Audio_2DSounds
		(ScriptID, 									SoundID,								SoundType,		TaperSoundtrackVolume,	MinVolume,	MaxVolume, 	IsMusic,	Looping)
VALUES 	('AS2D_LEADER_MUSIC_ER_SHIN_SAWBU_PEACE',	'SND_LEADER_MUSIC_ER_SHIN_SAWBU_PEACE',	'GAME_MUSIC',	-1.0,					68,			68,			1,			0),
		('AS2D_LEADER_MUSIC_ER_SHIN_SAWBU_WAR',		'SND_LEADER_MUSIC_ER_SHIN_SAWBU_WAR',	'GAME_MUSIC',	-1.0,					70,			70,			1,			0),
		('AS2D_DOM_SPEECH_ER_PEGU',					'SND_DOM_SPEECH_SHIN_SAWBU',			'GAME_SPEECH',	-1.0,					100,		100,		1,			0);
--==========================================================================================================================	
-- Unit Defines
--==========================================================================================================================
------------------------------
-- ArtDefine_UnitInfos
------------------------------	
INSERT INTO ArtDefine_UnitInfos 
		(Type, 						DamageStates,	Formation)
SELECT	('ART_DEF_UNIT_ER_KBBANG'),	DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT_GALLEASS');
------------------------------
-- ArtDefine_UnitInfoMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,				UnitMemberInfoType,						NumMembers)
SELECT	('ART_DEF_UNIT_ER_KBBANG'),	('ART_DEF_UNIT_MEMBER_ER_KBBANG'),		NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_GALLEASS');
------------------------------
-- ArtDefine_UnitMemberCombats
------------------------------
INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,						EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	('ART_DEF_UNIT_MEMBER_ER_KBBANG'),		EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_GALLEASS');
------------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,						"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	('ART_DEF_UNIT_MEMBER_ER_KBBANG'),		"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_GALLEASS');
------------------------------
-- ArtDefine_UnitMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 									Scale,  ZOffset, Domain, Model,						MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	('ART_DEF_UNIT_MEMBER_ER_KBBANG'),		0.09,	ZOffset, Domain, 'u_pegu_kbbang.fxsxml',	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE (Type = 'ART_DEF_UNIT_MEMBER_GALLEASS');
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_StrategicView
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 				TileType,	Asset)
VALUES	('ART_DEF_UNIT_ER_KBBANG',			'Unit', 	'SV_ER_Kbbang.dds');
