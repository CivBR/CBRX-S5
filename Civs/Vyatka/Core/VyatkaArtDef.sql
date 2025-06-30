INSERT INTO IconTextureAtlases
		(Atlas,	IconSize,	Filename,	IconsPerRow,	IconsPerColumn)
VALUES	('ATLAS_RHO_VYATKA',	256,	'VyatkaIcon_256.dds',	2,	2),
		('ATLAS_RHO_VYATKA',	128,	'VyatkaIcon_128.dds',	2,  2),
		('ATLAS_RHO_VYATKA',	80,	'VyatkaIcon_80.dds',	2,	2),
		('ATLAS_RHO_VYATKA',	64,	'VyatkaIcon_64.dds',	2,	2),
		('ATLAS_RHO_VYATKA',	45,	'VyatkaIcon_45.dds',	2,	2),
		('ATLAS_RHO_VYATKA',	32,	'VyatkaIcon_32.dds',	2,	2),
		('ALPHA_RHO_USHKUYNIK',	32,	'UshkuynikUnitflag32.dds',	1,	1),
		('ALPHA_RHO_VYATKA',	64,	'VyatkaAlpha_64.dds',	1,	1),
		('ALPHA_RHO_VYATKA',	48,	'VyatkaAlpha_48.dds',	1,	1),
		('ALPHA_RHO_VYATKA',	32,	'VyatkaAlpha_32.dds',	1,	1),
		('ALPHA_RHO_VYATKA',	24,	'VyatkaAlpha_24.dds',	1,	1);


INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 			TileType,	Asset)
SELECT	'ART_DEF_UNIT_RHO_USHKUYNIK',	TileType, 	'svUskuynik.dds'
FROM ArtDefine_StrategicView WHERE StrategicViewType = 'ART_DEF_UNIT_U_GERMAN_LANDSKNECHT';

INSERT INTO ArtDefine_UnitInfos
          (Type,                             DamageStates,    Formation)
SELECT    'ART_DEF_UNIT_RHO_USHKUYNIK',         DamageStates,     Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_U_SAXON_HUSCARL';

INSERT INTO ArtDefine_UnitInfoMemberInfos
          (UnitInfoType,                  UnitMemberInfoType,                  NumMembers)
SELECT    'ART_DEF_UNIT_RHO_USHKUYNIK',     UnitMemberInfoType,     NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_U_SAXON_HUSCARL';

--Sound

INSERT INTO Audio_Sounds 
		(SoundID, 									         Filename, 		          LoadType)
VALUES	('SND_LEADER_MUSIC_RHO_IOANN_PEACE', 		'VyatkaPeace',    'DynamicResident'),
		('SND_LEADER_MUSIC_RHO_IOANN_WAR', 	   	    'VyatkaWar',      'DynamicResident');

INSERT INTO Audio_2DSounds 
		(ScriptID, 										SoundID, 									SoundType, 		TaperSoundtrackVolume,	MinVolume, 	MaxVolume,  IsMusic, Looping)
VALUES	('AS2D_LEADER_MUSIC_RHO_IOANN_PEACE', 		'SND_LEADER_MUSIC_RHO_IOANN_PEACE', 		'GAME_MUSIC', 	-1.0,					90, 		90, 		1, 		 0),
		('AS2D_LEADER_MUSIC_RHO_IOANN_WAR', 			'SND_LEADER_MUSIC_RHO_IOANN_WAR', 		'GAME_MUSIC', 	-1.0,					70, 		70, 		1,		 0);