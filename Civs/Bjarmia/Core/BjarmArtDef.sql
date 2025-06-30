INSERT INTO IconTextureAtlases
		(Atlas,	IconSize,	Filename,	IconsPerRow,	IconsPerColumn)
VALUES ('ATLAS_RHO_BJARMIA',	256,	'BjarmiaIcon_256.dds',	4,	1),
		('ATLAS_RHO_BJARMIA',	128,	'BjarmiaIcon_128.dds',	4,  1),
		('ATLAS_RHO_BJARMIA',	80,	'BjarmiaIcon_80.dds',	4,	1),
		('ATLAS_RHO_BJARMIA',	64,	'BjarmiaIcon_64.dds',	4,	1),
		('ATLAS_RHO_BJARMIA',	45,	'BjarmiaIcon_45.dds',	4,	1),
		('ATLAS_RHO_BJARMIA',	32,	'BjarmiaIcon_32.dds',	4,	1),
		('ALPHA_RHO_ASHSLAYER',	32,	'AshenUnitflag32.dds',	1,	1),
		('ALPHA_RHO_BJARMIA',	64,	'BjarmiaAlpha_64.dds',	1,	1),
		('ALPHA_RHO_BJARMIA',	48,	'BjarmiaAlpha_48.dds',	1,	1),
		('ALPHA_RHO_BJARMIA',	32,	'BjarmiaAlpha_32.dds',	1,	1),
		('ALPHA_RHO_BJARMIA',	24,	'BjarmiaAlpha_24.dds',	1,	1);

INSERT INTO ArtDefine_StrategicView
		(StrategicViewType, 			TileType,	Asset)
SELECT	'ART_DEF_UNIT_RHO_ASHSLAYER',	TileType, 	'svAshen.dds'
FROM ArtDefine_StrategicView WHERE StrategicViewType = 'ART_DEF_UNIT_COMPOSITE_BOWMAN';

INSERT INTO ArtDefine_UnitInfos
          (Type,                             DamageStates,    Formation)
SELECT    'ART_DEF_UNIT_RHO_ASHSLAYER',         DamageStates,     Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_COMPOSITE_BOWMAN';

INSERT INTO ArtDefine_UnitInfoMemberInfos
          (UnitInfoType,                  UnitMemberInfoType,                  NumMembers)
SELECT    'ART_DEF_UNIT_RHO_ASHSLAYER',     UnitMemberInfoType,     NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_COMPOSITE_BOWMAN';

--Sound

INSERT INTO Audio_Sounds 
		(SoundID, 									         Filename, 		          LoadType)
VALUES	('SND_LEADER_MUSIC_RHO_HAREKR_PEACE', 		'BjarmiaPeace',    'DynamicResident'),
		('SND_LEADER_MUSIC_RHO_HAREKR_WAR', 	   	    'BjarmiaWar',      'DynamicResident');

INSERT INTO Audio_2DSounds 
		(ScriptID, 										SoundID, 									SoundType, 		TaperSoundtrackVolume,	MinVolume, 	MaxVolume,  IsMusic, Looping)
VALUES	('AS2D_LEADER_MUSIC_RHO_HAREKR_PEACE', 		'SND_LEADER_MUSIC_RHO_HAREKR_PEACE', 		'GAME_MUSIC', 	-1.0,					90, 		90, 		1, 		 0),
		('AS2D_LEADER_MUSIC_RHO_HAREKR_WAR', 			'SND_LEADER_MUSIC_RHO_HAREKR_WAR', 		'GAME_MUSIC', 	-1.0,					80, 		80, 		1,		 0);