--==========================================================================================================================
-- ARTDEFINES
--==========================================================================================================================	
-- IconTextureAtlasesa
------------------------------
INSERT INTO IconTextureAtlases 
		(Atlas, 									IconSize, 	Filename, 									IconsPerRow, 	IconsPerColumn)
VALUES	('DMS_ETHIOPIA_ATLAS', 						256, 		'EthiopiaAtlas_256.dds',					5,				4),
		('DMS_ETHIOPIA_ATLAS', 						128, 		'EthiopiaAtlas_128.dds',					5, 				4),
		('DMS_ETHIOPIA_ATLAS', 						80, 		'EthiopiaAtlas_80.dds',						5, 				4),
		('DMS_ETHIOPIA_ATLAS', 						64, 		'EthiopiaAtlas_64.dds',						5, 				4),
		('DMS_ETHIOPIA_ATLAS', 						45, 		'EthiopiaAtlas_45.dds',						5, 				4),
		('DMS_ETHIOPIA_ATLAS', 						32, 		'EthiopiaAtlas_32.dds',						5, 				4),
		('DMS_ETHIOPIA_ALPHA_ATLAS', 				128, 		'EthiopiaAlphaAtlas_128.dds',				4, 				1),
		('DMS_ETHIOPIA_ALPHA_ATLAS', 				80, 		'EthiopiaAlphaAtlas_80.dds',				4, 				1),
		('DMS_ETHIOPIA_ALPHA_ATLAS', 				64, 		'EthiopiaAlphaAtlas_64.dds',				4, 				1),
		('DMS_ETHIOPIA_ALPHA_ATLAS', 				48, 		'EthiopiaAlphaAtlas_48.dds',				4, 				1),
		('DMS_ETHIOPIA_ALPHA_ATLAS', 				45, 		'EthiopiaAlphaAtlas_45.dds',				4, 				1),
		('DMS_ETHIOPIA_ALPHA_ATLAS', 				32, 		'EthiopiaAlphaAtlas_32.dds',				4, 				1),
		('DMS_ETHIOPIA_ALPHA_ATLAS', 				24, 		'EthiopiaAlphaAtlas_24.dds',				4, 				1),
		('DMS_ETHIOPIA_ALPHA_ATLAS', 				16, 		'EthiopiaAlphaAtlas_16.dds',				4, 				1),
		('DMS_MONOLITHIC_CHURCH_ATLAS', 			256, 		'MonolithicChurchIcon256.dds',				1, 				2),
		('DMS_MONOLITHIC_CHURCH_ATLAS', 			64, 		'MonolithicChurchIcon64.dds',				1, 				2),
		('DMS_MONOLITHIC_CHURCH_ATLAS', 			45, 		'MonolithicChurchIcon45.dds',				1, 				2),
		('DMS_DEBTERA_FLAG_ART_ATLAS', 				32, 		'UnitFlag_Debtera_32.dds',					1, 				1);
------------------------------
-- Colors
------------------------------		
INSERT INTO Colors 
		(Type, 													Red, 	Green, 	Blue, 	Alpha)
VALUES	('COLOR_PLAYER_ETHIOPIA_ZARA_YAQOB_ICON', 				0.239, 	0.569, 	0.525, 	1),
		('COLOR_PLAYER_ETHIOPIA_ZARA_YAQOB_BACKGROUND', 		0.067,	0.051,	0.294,	1);
------------------------------
-- PlayerColors
------------------------------			
INSERT INTO PlayerColors 
		(Type, 									PrimaryColor, 								SecondaryColor, 									TextColor)
VALUES		('PLAYERCOLOR_DMS_ETHIOPIA_YAQOB',		'COLOR_PLAYER_ETHIOPIA_ZARA_YAQOB_ICON', 	'COLOR_PLAYER_ETHIOPIA_ZARA_YAQOB_BACKGROUND', 		'COLOR_PLAYER_WHITE_TEXT');
------------------------------
-- ArtDefine_LandmarkTypes
------------------------------	
INSERT INTO ArtDefine_LandmarkTypes
		(Type,									LandmarkType,	FriendlyName)
SELECT 'ART_DEF_IMPROVEMENT_MONOLITHIC_CHURCH', 'Improvement',	'ETHIOPIA_MONOLITHIC_CHURCH';
------------------------------
-- ArtDefine_Landmarks
------------------------------	
INSERT INTO ArtDefine_Landmarks
		(Era,	State,					Scale,	ImprovementType,							LayoutHandler,	ResourceType,			Model,					TerrainContour)
SELECT	'Any',	'UnderConstruction',	1.5,	'ART_DEF_IMPROVEMENT_MONOLITHIC_CHURCH',	'SNAPSHOT',		'ART_DEF_RESOURCE_ALL', 'Lalibela_HB.fxsxml',	1 UNION ALL
SELECT	'Any',	'Constructed',			1.5,	'ART_DEF_IMPROVEMENT_MONOLITHIC_CHURCH',	'SNAPSHOT',		'ART_DEF_RESOURCE_ALL', 'Lalibela_B.fxsxml',	1 UNION ALL
SELECT	'Any',	'Pillaged',				1.5,	'ART_DEF_IMPROVEMENT_MONOLITHIC_CHURCH',	'SNAPSHOT',		'ART_DEF_RESOURCE_ALL', 'Lalibela_PL.fxsxml',	1;
------------------------------
-- ArtDefine_StrategicView
------------------------------	
INSERT INTO ArtDefine_StrategicView
		(StrategicViewType,							TileType,		Asset)
VALUES	('ART_DEF_IMPROVEMENT_MONOLITHIC_CHURCH',	'Improvement', 'sv_monolithic_church.dds');
--==========================================================================================================================
-- AUDIO
--==========================================================================================================================	
-- Audio_Sounds
------------------------------	
INSERT INTO Audio_Sounds 
		(SoundID, 									Filename, 			LoadType)
VALUES	('SND_LEADER_MUSIC_DMS_YAQOB_PEACE', 		'ZaraYaqob_Peace',	'DynamicResident'),
		('SND_LEADER_MUSIC_DMS_YAQOB_WAR',			'ZaraYaqob_War', 	'DynamicResident');			
------------------------------
-- Audio_2DSounds
------------------------------	
INSERT INTO Audio_2DSounds 
		(ScriptID, 										SoundID, 									SoundType, 		MinVolume, 	MaxVolume,  IsMusic,	Looping)
VALUES		('AS2D_LEADER_MUSIC_DMS_YAQOB_PEACE', 			'SND_LEADER_MUSIC_DMS_YAQOB_PEACE', 		'GAME_MUSIC', 	60, 		60, 		1, 			0),
		('AS2D_LEADER_MUSIC_DMS_YAQOB_WAR', 			'SND_LEADER_MUSIC_DMS_YAQOB_WAR', 			'GAME_MUSIC', 	60, 		60, 		1,			0);
--==========================================================================================================================
-- UNIT GRAPHICS
--==========================================================================================================================	
-- ArtDefine_StrategicView
------------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 				TileType,	Asset)
VALUES		('ART_DEF_UNIT_DMS_DEBTERA', 		'Unit', 	'sv_u_debtera.dds');
------------------------------
-- ArtDefine_UnitInfos
------------------------------
INSERT INTO ArtDefine_UnitInfos 
		(Type, 								DamageStates,	Formation)
SELECT	('ART_DEF_UNIT_DMS_DEBTERA'),		DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT_MISSIONARY');
------------------------------
-- ArtDefine_UnitInfoMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,						UnitMemberInfoType,						NumMembers)
SELECT	('ART_DEF_UNIT_DMS_DEBTERA'),		('ART_DEF_UNIT_MEMBER_DMS_DEBTERA'),	NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_MISSIONARY');
------------------------------
-- ArtDefine_UnitMemberCombats
------------------------------
INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,							EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	('ART_DEF_UNIT_MEMBER_DMS_DEBTERA'),		EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_MISSIONARY');
------------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,							"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	('ART_DEF_UNIT_MEMBER_DMS_DEBTERA'),		"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_MISSIONARY');
------------------------------
-- ArtDefine_UnitMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 									Scale,  ZOffset, Domain, Model,								MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	('ART_DEF_UNIT_MEMBER_DMS_DEBTERA'),	Scale,	ZOffset, Domain, ('DMS_EthiopianMissionary.fxsxml'),MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE (Type = 'ART_DEF_UNIT_MEMBER_MISSIONARY');
--==========================================================================================================================	
--==========================================================================================================================	
