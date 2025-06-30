INSERT INTO IconTextureAtlases
		(Atlas,	IconSize,	Filename,	IconsPerRow,	IconsPerColumn)
VALUES	('ATLAS_RHO_ITELMEN',	256,	'ItelmenIcon_256.dds',	3,	2),
		('ATLAS_RHO_ITELMEN',	128,	'ItelmenIcon_128.dds',	3,  2),
		('ATLAS_RHO_ITELMEN',	80,	'ItelmenIcon_80.dds',	3,	2),
		('ATLAS_RHO_ITELMEN',	64,	'ItelmenIcon_64.dds',	3,	2),
		('ATLAS_RHO_ITELMEN',	45,	'ItelmenIcon_45.dds',	3,	2),
		('ATLAS_RHO_ITELMEN',	32,	'ItelmenIcon_32.dds',	3,	2),
		('ALPHA_RHO_KAMMA',	32,	'KammaUnitflag32.dds',	1,	1),
		('ALPHA_RHO_ITELMEN',	64,	'ItelmenAlpha_64.dds',	1,	1),
		('ALPHA_RHO_ITELMEN',	48,	'ItelmenAlpha_48.dds',	1,	1),
		('ALPHA_RHO_ITELMEN',	32,	'ItelmenAlpha_32.dds',	1,	1),
		('ALPHA_RHO_ITELMEN',	24,	'ItelmenAlpha_24.dds',	1,	1);


INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 			TileType,	Asset)
SELECT	'ART_DEF_UNIT_RHO_KAMMA',	TileType, 	'svKamma.dds'
FROM ArtDefine_StrategicView WHERE StrategicViewType = 'ART_DEF_UNIT_CROSSBOWMAN';

INSERT INTO ArtDefine_UnitInfos
          (Type,                             DamageStates,    Formation)
SELECT    'ART_DEF_UNIT_RHO_KAMMA',         DamageStates,     Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_CROSSBOWMAN';

INSERT INTO ArtDefine_UnitInfoMemberInfos
          (UnitInfoType,                  UnitMemberInfoType,                  NumMembers)
SELECT    'ART_DEF_UNIT_RHO_KAMMA',     UnitMemberInfoType,     NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_CROSSBOWMAN';

--Sound
INSERT INTO Audio_Sounds 
		(SoundID, 									         Filename, 		          LoadType)
VALUES	('SND_LEADER_MUSIC_RHO_HARCHIN_PEACE', 		'ItelmenPeace',    'DynamicResident'),
		('SND_LEADER_MUSIC_RHO_HARCHIN_WAR', 	   	    'ItelmenWar',      'DynamicResident');

INSERT INTO Audio_2DSounds 
		(ScriptID, 										SoundID, 									SoundType, 		TaperSoundtrackVolume,	MinVolume, 	MaxVolume,  IsMusic, Looping)
VALUES	('AS2D_LEADER_MUSIC_RHO_HARCHIN_PEACE', 		'SND_LEADER_MUSIC_RHO_HARCHIN_PEACE', 		'GAME_MUSIC', 	-1.0,					90, 		90, 		1, 		 0),
		('AS2D_LEADER_MUSIC_RHO_HARCHIN_WAR', 			'SND_LEADER_MUSIC_RHO_HARCHIN_WAR', 		'GAME_MUSIC', 	-1.0,					80, 		80, 		1,		 0);