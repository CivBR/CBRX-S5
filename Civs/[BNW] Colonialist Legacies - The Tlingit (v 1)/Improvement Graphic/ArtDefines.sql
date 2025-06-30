
--==========================================================================================================================
-- ArtDefine_LandmarkTypes
--==========================================================================================================================
INSERT INTO ArtDefine_LandmarkTypes 
			(Type, 								LandmarkType,	FriendlyName)
VALUES		('ART_DEF_IMPROVEMENT_CLFB_NOOW',	'Improvement', 	'CLFB_NOOW');

--==========================================================================================================================
-- ArtDefine_Landmarks
--==========================================================================================================================
INSERT INTO ArtDefine_Landmarks 
			(ImprovementType, 						Era,	State,				 Scale, LayoutHandler,	ResourceType,			Model,			TerrainContour)
VALUES		('ART_DEF_IMPROVEMENT_CLFB_NOOW',		'Any', 	'UnderConstruction', 1.0,	'SNAPSHOT',		'ART_DEF_RESOURCE_ALL', 'WTI_HB.fxsxml', 1),
			('ART_DEF_IMPROVEMENT_CLFB_NOOW',		'Any', 	'Constructed',		 1.0,	'SNAPSHOT',		'ART_DEF_RESOURCE_ALL', 'WTI_B.fxsxml', 1),
			('ART_DEF_IMPROVEMENT_CLFB_NOOW',		'Any', 	'Pillaged',			 1.0,	'SNAPSHOT',		'ART_DEF_RESOURCE_ALL', 'WTI_PL.fxsxml', 1);



