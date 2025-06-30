--==========================================================================================================================
-- ART DEFINES
--==========================================================================================================================
-- IconTextureAtlases
------------------------------
INSERT INTO IconTextureAtlases
		(Atlas, 									IconSize, 	Filename, 							IconsPerRow,	IconsPerColumn)
VALUES	('ASQ_XARAGUA_ATLAS', 					256, 		'xaragua_atlas_256.dds',			2, 				2),
		('ASQ_XARAGUA_ATLAS', 					128, 		'xaragua_atlas_128.dds',			2, 				2),
		('ASQ_XARAGUA_ATLAS', 					80, 		'xaragua_atlas_80.dds',			2, 				2),
		('ASQ_XARAGUA_ATLAS', 					64, 		'xaragua_atlas_64.dds',			2, 				2),
		('ASQ_XARAGUA_ATLAS', 					45, 		'xaragua_atlas_45.dds',			2, 				2),
		('ASQ_XARAGUA_ATLAS', 					32, 		'xaragua_atlas_32.dds',			2, 				2),
		('ASQ_XARAGUA_ALPHA_ATLAS', 				128, 		'xaragua_alpha_128.dds',		1,				1),
		('ASQ_XARAGUA_ALPHA_ATLAS', 				80, 		'xaragua_alpha_80.dds',		1, 				1),
		('ASQ_XARAGUA_ALPHA_ATLAS', 				64, 		'xaragua_alpha_64.dds',		1, 				1),
		('ASQ_XARAGUA_ALPHA_ATLAS', 				48, 		'xaragua_alpha_48.dds',		1, 				1),
		('ASQ_XARAGUA_ALPHA_ATLAS', 				45, 		'xaragua_alpha_45.dds',		1, 				1),
		('ASQ_XARAGUA_ALPHA_ATLAS', 				32, 		'xaragua_alpha_32.dds',		1, 				1),
		('ASQ_XARAGUA_ALPHA_ATLAS', 				24, 		'xaragua_alpha_24.dds',		1, 				1),
		('ASQ_XARAGUA_ALPHA_ATLAS', 				16, 		'xaragua_alpha_16.dds',		1, 				1),
		('ASQ_UNIT_FLAG_TEKINA_ATLAS',	32, 		'tekina_alpha_32.dds',	1, 				1);
--==========================================================================================================================
-- UNIT GRAPHICS
--==========================================================================================================================
-- ArtDefine_StrategicView
------------------------------
INSERT INTO ArtDefine_StrategicView
		(StrategicViewType, 						TileType,	Asset)
VALUES	('ART_DEF_UNIT_ASQ_TEKINA',	'Unit',		'tekina_alpha_sv.dds');
------------------------------
-- ArtDefine_UnitInfos
------------------------------
INSERT INTO ArtDefine_UnitInfos
		(Type, 									DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_ASQ_TEKINA',	DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_GENERAL';
------------------------------
-- ArtDefine_UnitInfoMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos
		(UnitInfoType,							UnitMemberInfoType,								NumMembers)
SELECT	'ART_DEF_UNIT_ASQ_TEKINA', 'ART_DEF_UNIT_MEMBER_ASQ_TEKINA',	1
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_GENERAL';
------------------------
-- ArtDefine_UnitMemberCombats
------------------------
INSERT INTO ArtDefine_UnitMemberCombats
		(UnitMemberType,								EnableActions, HasRefaceAfterCombat)
SELECT	'ART_DEF_UNIT_MEMBER_ASQ_TEKINA',	EnableActions, HasRefaceAfterCombat
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_GREATGENERAL_EARLY';
------------------------
-- ArtDefine_UnitMemberInfos
------------------------
INSERT INTO ArtDefine_UnitMemberInfos
		(Type, 											Scale, Domain, Model,	MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_ASQ_TEKINA',	Scale, Domain, 'chimu_general.fxsxml',	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_GREATGENERAL_EARLY';
--==========================================================================================================================
-- AUDIO
--==========================================================================================================================	
-- Audio_Sounds
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Audio_Sounds 
		(SoundID, 										Filename, 									LoadType)
VALUES	('SND_GREAT_WORK_ASQ_AREITO', 				'areitosound',								'DynamicResident'),
		('SND_LEADER_MUSIC_ASQ_XARAGUA_PEACE', 			'XaraguaPeace',							'DynamicResident'),
		('SND_LEADER_MUSIC_ASQ_XARAGUA_WAR', 			'XaraguaWar', 								'DynamicResident');		
--------------------------------------------------------------------------------------------------------------------------
-- Audio_2DSounds
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Audio_2DSounds 
		(ScriptID, 										SoundID, 									SoundType, 		TaperSoundtrackVolume,	MinVolume, 	MaxVolume,  IsMusic, Looping)
VALUES	('AS2D_GREAT_WORK_ASQ_AREITO', 				'SND_GREAT_WORK_ASQ_AREITO',			'GAME_SFX', 	-1.0,					100,		100,		0,		 0),
		('AS2D_LEADER_MUSIC_ASQ_XARAGUA_PEACE', 		'SND_LEADER_MUSIC_ASQ_XARAGUA_PEACE', 		'GAME_MUSIC', 	-1.0,					45, 		45, 		1, 		 0),
		('AS2D_LEADER_MUSIC_ASQ_XARAGUA_WAR', 			'SND_LEADER_MUSIC_ASQ_XARAGUA_WAR', 		'GAME_MUSIC', 	-1.0,					45, 		45, 		1,		 0);
--==========================================================================================================================
--==========================================================================================================================