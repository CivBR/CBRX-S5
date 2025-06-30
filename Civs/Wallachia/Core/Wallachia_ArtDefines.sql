--==========================================================================================================================
-- ART DEFINES
--==========================================================================================================================	
-- IconTextureAtlases
------------------------------
INSERT INTO IconTextureAtlases 
		(Atlas, 									IconSize, 	Filename, 								IconsPerRow, 	IconsPerColumn)
VALUES	('JFD_WALLACHIA_ATLAS', 					256, 		'JFD_WallachiaAtlas_256.dds',			2, 				2),
		('JFD_WALLACHIA_ATLAS', 					128, 		'JFD_WallachiaAtlas_128.dds',			2, 				2),
		('JFD_WALLACHIA_ATLAS', 					80, 		'JFD_WallachiaAtlas_80.dds',			2, 				2),
		('JFD_WALLACHIA_ATLAS', 					64, 		'JFD_WallachiaAtlas_64.dds',			2, 				2),
		('JFD_WALLACHIA_ATLAS', 					45, 		'JFD_WallachiaAtlas_45.dds',			2, 				2),
		('JFD_WALLACHIA_ATLAS', 					32, 		'JFD_WallachiaAtlas_32.dds',			2, 				2),
		('JFD_WALLACHIA_PROMOTION_ATLAS',			256, 	    'Tomatekh_PromotionAtlas_256.dds',		2, 				1),
		('JFD_WALLACHIA_PROMOTION_ATLAS',			64, 	    'Tomatekh_PromotionAtlas_64.dds',		2, 				1),
		('JFD_WALLACHIA_PROMOTION_ATLAS',			45, 	    'Tomatekh_PromotionAtlas_45.dds',		2, 				1),
		('JFD_WALLACHIA_PROMOTION_ATLAS',			32, 	    'Tomatekh_PromotionAtlas_32.dds',		2, 				1),
		('JFD_WALLACHIA_ALPHA_ATLAS', 				128, 		'JFD_WallachiaAlphaAtlas_128.dds',		1,				1),
		('JFD_WALLACHIA_ALPHA_ATLAS', 				80, 		'JFD_WallachiaAlphaAtlas_80.dds',		1, 				1),
		('JFD_WALLACHIA_ALPHA_ATLAS', 				64, 		'JFD_WallachiaAlphaAtlas_64.dds',		1, 				1),
		('JFD_WALLACHIA_ALPHA_ATLAS', 				48, 		'JFD_WallachiaAlphaAtlas_48.dds',		1, 				1),
		('JFD_WALLACHIA_ALPHA_ATLAS', 				45, 		'JFD_WallachiaAlphaAtlas_45.dds',		1, 				1),
		('JFD_WALLACHIA_ALPHA_ATLAS', 				32, 		'JFD_WallachiaAlphaAtlas_32.dds',		1, 				1),
		('JFD_WALLACHIA_ALPHA_ATLAS', 				24, 		'JFD_WallachiaAlphaAtlas_24.dds',		1, 				1),
		('JFD_WALLACHIA_ALPHA_ATLAS', 				16, 		'JFD_WallachiaAlphaAtlas_16.dds',		1, 				1),
		('JFD_UNIT_FLAG_LEFEGII_ATLAS',				32, 		'Unit_Lefegii_Flag_32.dds',				1, 				1);
------------------------------
-- Colors
------------------------------		
INSERT INTO Colors 
		(Type, 										Red, 	Green, 	Blue,	Alpha)
VALUES	('COLOR_PLAYER_JFD_WALLACHIA_ICON', 		0.698,	0.690,	0.270,	1),
		('COLOR_PLAYER_JFD_WALLACHIA_BACKGROUND', 	0.070,	0.352,	0.352,	1);
------------------------------	
-- PlayerColors
------------------------------				
INSERT INTO PlayerColors 
		(Type, 										PrimaryColor, 							SecondaryColor, 							TextColor)
VALUES	('PLAYERCOLOR_JFD_WALLACHIA',				'COLOR_PLAYER_JFD_WALLACHIA_ICON', 		'COLOR_PLAYER_JFD_WALLACHIA_BACKGROUND', 	'COLOR_PLAYER_WHITE_TEXT');
--==========================================================================================================================
-- AUDIO
--==========================================================================================================================	
-- Audio_Sounds
------------------------------	
INSERT INTO Audio_Sounds 
		(SoundID, 										Filename, 				LoadType)
VALUES	('SND_BUILDING_JFD_FORTIFIED_CHURCH', 			'FortifiedChurch',		'DynamicResident'),
		('SND_LEADER_MUSIC_JFD_VLAD_PEACE', 			'Vlad_Peace', 			'DynamicResident'),
		('SND_LEADER_MUSIC_JFD_VLAD_WAR', 				'Vlad_War', 			'DynamicResident');			
------------------------------	
-- Audio_2DSounds
------------------------------		
INSERT INTO Audio_2DSounds 
		(ScriptID, 										SoundID, 									SoundType, 		MinVolume, 	MaxVolume,  IsMusic,	Looping)
VALUES	('AS2D_AMBIENCE_LEADER_JFD_VLAD_AMBIENCE',		'SND_AMBIENCE_MONTEZUMA_AMBIENCE',			'GAME_SFX', 	50, 		50, 		0, 			1),
		('AS2D_BUILDING_JFD_FORTIFIED_CHURCH',			'SND_BUILDING_JFD_FORTIFIED_CHURCH',		'GAME_SFX', 	100, 		100, 		0, 			0),
		('AS2D_LEADER_MUSIC_JFD_VLAD_PEACE', 			'SND_LEADER_MUSIC_JFD_VLAD_PEACE', 			'GAME_MUSIC', 	45, 		45, 		1, 			0),
		('AS2D_LEADER_MUSIC_JFD_VLAD_WAR', 				'SND_LEADER_MUSIC_JFD_VLAD_WAR', 			'GAME_MUSIC', 	45, 		45, 		1,			0);
--==========================================================================================================================
-- UNIT GRAPHICS
--==========================================================================================================================	
-- ArtDefine_StrategicView
------------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 				TileType,		Asset)
VALUES	('ART_DEF_UNIT_JFD_LEFEGII', 		'Unit', 		'sv_Lefegii.dds'),
		('ART_DEF_UNIT_JFD_LEFEGII_GUN', 	'Unit', 		'sv_Lefegii.dds');
------------------------------
-- ArtDefine_UnitInfos
------------------------------			
INSERT INTO ArtDefine_UnitInfos 
		(Type, 								DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_JFD_LEFEGII',			DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_SWORDSMAN';

INSERT INTO ArtDefine_UnitInfos 
		(Type, 								DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_JFD_LEFEGII_GUN',		DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_SWORDSMAN';
------------------------------
-- ArtDefine_UnitInfoMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,						UnitMemberInfoType,					NumMembers)
SELECT	'ART_DEF_UNIT_JFD_LEFEGII', 		'ART_DEF_UNIT_MEMBER_JFD_LEFEGII',	NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_SWORDSMAN';

INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,						UnitMemberInfoType,					NumMembers)
SELECT	'ART_DEF_UNIT_JFD_LEFEGII_GUN', 	'ART_DEF_UNIT_MEMBER_JFD_LEFEGII',	NumMembers-2
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_SWORDSMAN';

INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,						UnitMemberInfoType,					NumMembers)
SELECT	'ART_DEF_UNIT_JFD_LEFEGII_GUN', 	'ART_DEF_UNIT_MEMBER_MUSKETMAN',	2
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_SWORDSMAN';
------------------------
-- ArtDefine_UnitMemberCombats
------------------------
INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,					EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_LEFEGII',	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_SWORDSMAN';
------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,					"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_LEFEGII',	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_SWORDSMAN';
------------------------
-- ArtDefine_UnitMemberInfos
------------------------
INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 								Scale,	ZOffset, Domain, Model, 			MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_LEFEGII',	Scale,	ZOffset, Domain, 'Lefegii.fxsxml',	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_SWORDSMAN';
--==========================================================================================================================	
--==========================================================================================================================	
