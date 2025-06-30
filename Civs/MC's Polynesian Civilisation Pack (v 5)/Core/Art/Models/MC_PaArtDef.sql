--==========================================================================================================================
-- ArtDefine_LandmarkTypes
--==========================================================================================================================	
INSERT INTO ArtDefine_LandmarkTypes
		(Type,								LandmarkType,	FriendlyName)
VALUES	('ART_DEF_IMPROVEMENT_MC_MAORI_PA', 'Improvement', 'MC_MAORI_PA');

--==========================================================================================================================
-- ArtDefine_Landmarks
--==========================================================================================================================	
INSERT INTO ArtDefine_Landmarks
		(Era,	State,					Scale,	ImprovementType,					LayoutHandler,	ResourceType,			Model,			TerrainContour)
VALUES	('Any', 'UnderConstruction',	0.22,	'ART_DEF_IMPROVEMENT_MC_MAORI_PA',	'SNAPSHOT',		'ART_DEF_RESOURCE_ALL', 'pa_hb.fxsxml', 1),
		('Any', 'Constructed',			0.22,	'ART_DEF_IMPROVEMENT_MC_MAORI_PA',	'RANDOM',		'ART_DEF_RESOURCE_ALL', 'pa_01.fxsxml', 1),
		('Any', 'Constructed',			0.22,	'ART_DEF_IMPROVEMENT_MC_MAORI_PA',	'RANDOM',		'ART_DEF_RESOURCE_ALL', 'pa_02.fxsxml', 1),
		('Any', 'Constructed',			0.22,	'ART_DEF_IMPROVEMENT_MC_MAORI_PA',	'RANDOM',		'ART_DEF_RESOURCE_ALL', 'pa_03.fxsxml', 1),
		('Any', 'Pillaged',				0.22,	'ART_DEF_IMPROVEMENT_MC_MAORI_PA',	'SNAPSHOT',		'ART_DEF_RESOURCE_ALL', 'pa_pl.fxsxml', 1);

--==========================================================================================================================
-- ArtDefine_StrategicView
--==========================================================================================================================
INSERT INTO ArtDefine_StrategicView
		(StrategicViewType,					TileType,		Asset)
VALUES	('ART_DEF_IMPROVEMENT_MC_MAORI_PA', 'Improvement', 'sv_pa.dds');
--==========================================================================================================================
--==========================================================================================================================