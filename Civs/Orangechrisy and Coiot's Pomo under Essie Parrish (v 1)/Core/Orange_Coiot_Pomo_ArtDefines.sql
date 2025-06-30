--==========================================================================================================================
-- ART DEFINES
--==========================================================================================================================
-- IconTextureAtlases
------------------------------
INSERT INTO IconTextureAtlases
		(Atlas, 									IconSize, 	Filename, 					IconsPerRow,	IconsPerColumn)
VALUES	('ORG_COIOT_POMO_ATLAS', 					256, 		'PomoAtlas256.dds',			3, 				2),
		('ORG_COIOT_POMO_ATLAS', 					128, 		'PomoAtlas128.dds',			3, 				2),
		('ORG_COIOT_POMO_ATLAS', 					80, 		'PomoAtlas80.dds',			3, 				2),
		('ORG_COIOT_POMO_ATLAS', 					64, 		'PomoAtlas64.dds',			3, 				2),
		('ORG_COIOT_POMO_ATLAS', 					45, 		'PomoAtlas45.dds',			3, 				2),
		('ORG_COIOT_POMO_ATLAS', 					32, 		'PomoAtlas32.dds',			3, 				2),
		('ORG_COIOT_POMO_ALPHA_ATLAS', 				64, 		'PomoAtlas64.dds',			1, 				2),
		('ORG_COIOT_POMO_ALPHA_ATLAS', 				48, 		'PomoAtlas48.dds',			1, 				2),
		('ORG_COIOT_POMO_ALPHA_ATLAS', 				32, 		'PomoAtlas32.dds',			1, 				2),
		('ORG_COIOT_POMO_ALPHA_ATLAS', 				24, 		'PomoAtlas24.dds',			1, 				2),
		('ORG_COIOT_UNIT_FLAG_BASKET_WEAVER_ATLAS',	32, 		'BasketWeaverAlpha32.dds',	1, 				1);
--==========================================================================================================================
-- UNIT GRAPHICS
--==========================================================================================================================
-- ArtDefine_StrategicView
------------------------------
INSERT INTO ArtDefine_StrategicView
		(StrategicViewType, 						TileType,	Asset)
VALUES	('ART_DEF_UNIT_ORG_COIOT_BASKET_WEAVER',	'Unit',		'BasketWeaverAlpha128.dds');
------------------------------
-- ArtDefine_UnitInfos
------------------------------
INSERT INTO ArtDefine_UnitInfos
		(Type, 									DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_ORG_COIOT_BASKET_WEAVER',	DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_GREAT_ARTIST';
------------------------------
-- ArtDefine_UnitInfoMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos
		(UnitInfoType,							UnitMemberInfoType,								NumMembers)
SELECT	'ART_DEF_UNIT_ORG_COIOT_BASKET_WEAVER', 'ART_DEF_UNIT_MEMBER_ORG_COIOT_BASKET_WEAVER',	1
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_GREAT_ARTIST';
------------------------
-- ArtDefine_UnitMemberCombats
------------------------
INSERT INTO ArtDefine_UnitMemberCombats
		(UnitMemberType,								EnableActions, HasRefaceAfterCombat)
SELECT	'ART_DEF_UNIT_MEMBER_ORG_COIOT_BASKET_WEAVER',	EnableActions, HasRefaceAfterCombat
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_GREATARTIST_EARLY_DRUMMER';
------------------------
-- ArtDefine_UnitMemberInfos
------------------------
INSERT INTO ArtDefine_UnitMemberInfos
		(Type, 											Scale, Domain, Model,					MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_ORG_COIOT_BASKET_WEAVER',	Scale, Domain, 'basketweaver.fxsxml',	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_GREATARTIST_EARLY_DRUMMER';
--==========================================================================================================================
--==========================================================================================================================
---------------
-- Audio_Sounds
---------------
INSERT INTO Audio_Sounds 
		(SoundID,									Filename,						LoadType)
VALUES	('SND_LEADER_MUSIC_ORG_COIOT_ESSIE_PEACE',	'Pomo Fast 2 Step',				'DynamicResident'), -- Pomo Fast 2 Step by Thomas L. Brown and Rollin' Fox. https://youtu.be/6i7M355frDw
		('SND_LEADER_MUSIC_ORG_COIOT_ESSIE_WAR',	'Round Valley Feather Dancers',	'DynamicResident'); -- Round Valley Feather Dancers by The Silver Trembling Man (or at least that's who posted the video, I guess the video is just titled after the artists rather than any specific song name). https://youtu.be/2XPtn0nz9w8
-----------------
-- Audio_2DSounds
-----------------
INSERT INTO Audio_2DSounds 
		(ScriptID,									SoundID,									SoundType,		TaperSoundtrackVolume,	MinVolume,	MaxVolume,	IsMusic,	Looping)
VALUES	('AS2D_LEADER_MUSIC_ORG_COIOT_ESSIE_PEACE',	'SND_LEADER_MUSIC_ORG_COIOT_ESSIE_PEACE',	'GAME_MUSIC',	-1.0,					100,		100,		1,			0),
		('AS2D_LEADER_MUSIC_ORG_COIOT_ESSIE_WAR',	'SND_LEADER_MUSIC_ORG_COIOT_ESSIE_WAR',		'GAME_MUSIC',	-1.0,					100,		100,		1,			0);