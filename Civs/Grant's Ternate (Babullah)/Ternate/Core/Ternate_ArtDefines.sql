--==========================================================================================================================
-- UNIT GRAPHICS
--==========================================================================================================================	
-- ArtDefine_StrategicView
------------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 								TileType,	Asset)
VALUES	('ART_DEF_UNIT_GT_ARUMBAI',	'Unit', 	'sv_Orembai.dds');
------------------------------
-- ArtDefine_UnitInfos
------------------------------	
INSERT INTO ArtDefine_UnitInfos 
		(Type, 												DamageStates,	Formation)
SELECT	('ART_DEF_UNIT_GT_ARUMBAI'),	DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT_WORKBOAT');
------------------------------
-- ArtDefine_UnitInfoMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,										UnitMemberInfoType,							NumMembers)
SELECT	('ART_DEF_UNIT_GT_ARUMBAI'),	('ART_DEF_UNIT_MEMBER_GT_ARUMBAI'),		NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_WORKBOAT');
------------------------------
-- ArtDefine_UnitMemberCombats
------------------------------
INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,							EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	('ART_DEF_UNIT_MEMBER_GT_ARUMBAI'),		EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_WORKBOAT');
------------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,							"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	('ART_DEF_UNIT_MEMBER_GT_ARUMBAI'),		"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_WORKBOAT');
------------------------------
-- ArtDefine_UnitMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 										Scale,  ZOffset, Domain, Model,				MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	('ART_DEF_UNIT_MEMBER_GT_ARUMBAI'),		Scale+.03,	ZOffset, Domain, 'Mesopotamic_Embark.fxsxml',	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE (Type = 'ART_DEF_UNIT_MEMBER_WORKBOAT');
--==========================================================================================================================
-- AUDIO
--==========================================================================================================================	
-- Audio_Sounds
------------------------------	
INSERT INTO Audio_Sounds 
		(SoundID, 									Filename, 				LoadType)
VALUES	('SND_LEADER_MUSIC_GT_BABULLAH_PEACE', 	'Ternate_Peace',	'DynamicResident'),
		('SND_LEADER_MUSIC_GT_BABULLAH_WAR', 		'Ternate_War', 		'DynamicResident');		
------------------------------
-- Audio_2DSounds
------------------------------	
INSERT INTO Audio_2DSounds 
		(ScriptID, 									SoundID, 								SoundType, 		MinVolume, 	MaxVolume,  IsMusic, Looping)
VALUES	('AS2D_LEADER_MUSIC_GT_BABULLAH_PEACE',	'SND_LEADER_MUSIC_GT_BABULLAH_PEACE',	'GAME_MUSIC', 	50, 		50, 		1, 		 0),
		('AS2D_LEADER_MUSIC_GT_BABULLAH_WAR', 		'SND_LEADER_MUSIC_GT_BABULLAH_WAR', 	'GAME_MUSIC', 	50, 		50, 		1,		 0);
------------------------------
-- Colors
------------------------------		
INSERT INTO Colors 
		(Type, 										Red, 	Green, 	Blue, 	Alpha)
VALUES	('COLOR_PLAYER_GT_TERNATE_ICON',			0.839,	0.784,	0.439,	1),
		('COLOR_PLAYER_GT_TERNATE_BACKGROUND',		0.259,	0.235,	0.004,	1);
------------------------------
-- PlayerColors
------------------------------			
INSERT INTO PlayerColors 
		(Type, 						PrimaryColor, 					SecondaryColor, 					TextColor)
VALUES	('PLAYERCOLOR_GT_TERNATE',	'COLOR_PLAYER_GT_TERNATE_ICON', 	'COLOR_PLAYER_GT_TERNATE_BACKGROUND', 	'COLOR_PLAYER_WHITE_TEXT');
--==========================================================================================================================
-- ARTDEFINES
--==========================================================================================================================	
-- IconTextureAtlasesa
------------------------------
INSERT INTO IconTextureAtlases 
		(Atlas, 									IconSize, 	Filename, 							IconsPerRow, 	IconsPerColumn)
VALUES	('GT_TERNATE_ATLAS', 						256, 		'TernateAtlas256.dds',				2, 				2),
		('GT_TERNATE_ATLAS', 						128, 		'TernateAtlas128.dds',				2, 				2),
		('GT_TERNATE_ATLAS', 						80, 		'TernateAtlas80.dds',				2, 				2),
		('GT_TERNATE_ATLAS', 						64, 		'TernateAtlas64.dds',				2, 				2),
		('GT_TERNATE_ATLAS', 						45, 		'TernateAtlas45.dds',				2, 				2),
		('GT_TERNATE_ATLAS', 						32, 		'TernateAtlas32.dds',				2, 				2),
		('GT_TERNATE_ATLAS', 						24, 		'TernateAtlas24.dds',				2, 				2),
		('GT_TERNATE_ALPHA_ATLAS', 					128, 		'TernateAlpha128.dds',			1,				1),
		('GT_TERNATE_ALPHA_ATLAS', 					80, 		'TernateAlpha80.dds',			1, 				1),
		('GT_TERNATE_ALPHA_ATLAS', 					64, 		'TernateAlpha64.dds',			1, 				1),
		('GT_TERNATE_ALPHA_ATLAS', 					48, 		'TernateAlpha48.dds',			1, 				1),
		('GT_TERNATE_ALPHA_ATLAS', 					45, 		'TernateAlpha45.dds',			1, 				1),
		('GT_TERNATE_ALPHA_ATLAS', 					32, 		'TernateAlpha32.dds',			1, 				1),
		('GT_TERNATE_ALPHA_ATLAS', 					24, 		'TernateAlpha24.dds',			1, 				1),
		('GT_ARUMBAI_FLAG_ATLAS', 				32, 		'Orembai_flag.dds',				1, 				1);
--==========================================================================================================================	
--==========================================================================================================================	