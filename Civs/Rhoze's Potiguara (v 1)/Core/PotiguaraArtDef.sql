INSERT INTO IconTextureAtlases
		(Atlas,	IconSize,	Filename,	IconsPerRow,	IconsPerColumn)
VALUES  ('ATLAS_RHO_POTIGUARA',	256,	'PotiguaraIcon_256.dds',	1,	1),
		('ATLAS_RHO_POTIGUARA',	128,	'PotiguaraIcon_128.dds',	1,  1),
		('ATLAS_RHO_POTIGUARA',	80,	'PotiguaraIcon_80.dds',	1,	1),
		('ATLAS_RHO_POTIGUARA',	64,	'PotiguaraIcon_64.dds',	1,	1),
		('ATLAS_RHO_POTIGUARA',	45,	'PotiguaraIcon_45.dds',	1,	1),
		('ATLAS_RHO_POTIGUARA',	32,	'PotiguaraIcon_32.dds',	1,	1),
		('ALPHA_RHO_PHUSA',	32,	'PhusaUnitflag32.dds',	1,	1),
		('ALPHA_RHO_POTIGUARA',	64,	'PotiguaraAlpha_64.dds',	1,	1),
		('ALPHA_RHO_POTIGUARA',	48,	'PotiguaraAlpha_48.dds',	1,	1),
		('ALPHA_RHO_POTIGUARA',	32,	'PotiguaraAlpha_32.dds',	1,	1),
		('ALPHA_RHO_POTIGUARA',	24,	'PotiguaraAlpha_24.dds',	1,	1),
		('ATLAS_RHO_POTISHRIMP',	256,	'ShrimpIcon_256.dds',	1,	1),
		('ATLAS_RHO_POTISHRIMP',	80,	'ShrimpIcon_80.dds',	1,	1),
		('ATLAS_RHO_POTISHRIMP',	64,	'ShrimpIcon_64.dds',	1,	1),
		('ATLAS_RHO_POTISHRIMP',	45,	'ShrimpIcon_45.dds',	1,	1);

INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 			TileType,	Asset)
SELECT	'ART_DEF_UNIT_RHO_PHUSA',	TileType, 	'svPhusa.dds'
FROM ArtDefine_StrategicView WHERE StrategicViewType = 'ART_DEF_UNIT_PIKEMAN';

INSERT INTO ArtDefine_UnitInfos
          (Type,                             DamageStates,    Formation)
SELECT    'ART_DEF_UNIT_RHO_PHUSA',         DamageStates,     Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_PIKEMAN';

INSERT INTO ArtDefine_UnitInfoMemberInfos
          (UnitInfoType,                  UnitMemberInfoType,                  NumMembers)
SELECT    'ART_DEF_UNIT_RHO_PHUSA',     UnitMemberInfoType,     NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_PIKEMAN';

INSERT INTO ArtDefine_StrategicView 
			(StrategicViewType, 				TileType,	Asset)
VALUES		('ART_DEF_RESOURCE_RHO_POTISHRIMP', 		'Resource', 	'svShrimp.dds');

--Shrimpium
INSERT INTO IconFontTextures 
		(IconFontTexture, 							IconFontTextureFile)
VALUES  ('ICON_FONT_TEXTURE_RES_RHO_POTISHRIMP', 		'PotyShrimpFontIcon');

INSERT INTO IconFontMapping 
		(IconName, 					IconFontTexture,						IconMapping)
VALUES	('ICON_RES_RHO_POTISHRIMP',		'ICON_FONT_TEXTURE_RES_RHO_POTISHRIMP',		1);

INSERT INTO ArtDefine_LandmarkTypes 
		(Type,									LandmarkType,		FriendlyName) 
VALUES  ('ART_DEF_RESOURCE_RHO_POTISHRIMP',			'Resource',			'Shrimp');

INSERT INTO ArtDefine_Landmarks
		(Era,	State,	Scale,	ImprovementType,	LayoutHandler,	ResourceType,					Model, TerrainContour)
SELECT	Era,	State,	Scale,	ImprovementType,	LayoutHandler,	'ART_DEF_RESOURCE_RHO_POTISHRIMP',	Model, TerrainContour
FROM ArtDefine_Landmarks WHERE ResourceType = 'ART_DEF_RESOURCE_PEARLS';