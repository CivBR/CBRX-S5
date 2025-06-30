--==========================================================================================================================	
-- IconTextureAtlases
--==========================================================================================================================		
INSERT INTO IconTextureAtlases 
			(Atlas, 							IconSize, 	Filename,						IconsPerRow,	IconsPerColumn)
VALUES		('CALIFORNIA_RELIGIONS_ATLAS', 		256, 		'CaliforniaReligions256.dds',	3, 				2),
			('CALIFORNIA_RELIGIONS_ATLAS', 		214, 		'CaliforniaReligions214.dds',	3, 				2),
			('CALIFORNIA_RELIGIONS_ATLAS', 		128, 		'CaliforniaReligions128.dds',	3, 				2),
			('CALIFORNIA_RELIGIONS_ATLAS', 		80, 		'CaliforniaReligions80.dds',	3, 				2),
			('CALIFORNIA_RELIGIONS_ATLAS', 		64, 		'CaliforniaReligions64.dds',	3, 				2),
			('CALIFORNIA_RELIGIONS_ATLAS', 		48, 		'CaliforniaReligions48.dds',	3, 				2),
			('CALIFORNIA_RELIGIONS_ATLAS', 		32, 		'CaliforniaReligions32.dds',	3, 				2),
			('CALIFORNIA_RELIGIONS_ATLAS', 		24, 		'CaliforniaReligions24.dds',	3, 				2),
			('CALIFORNIA_RELIGIONS_ATLAS', 		16, 		'CaliforniaReligions16.dds',	3, 				2);

--==========================================================================================================================	
-- IconFontTextures
--==========================================================================================================================		
INSERT INTO IconFontTextures 
			(IconFontTexture, 							IconFontTextureFile)
VALUES		('ICON_FONT_TEXTURE_CALIFORNIA_RELIGIONS', 	'CaliforniaReligions_FontIcons');

--==========================================================================================================================	
-- IconFontMapping
--==========================================================================================================================		
INSERT INTO IconFontMapping 
			(IconName, 						IconFontTexture,							IconMapping)
VALUES		('ICON_RELIGION_KUKSU',			'ICON_FONT_TEXTURE_CALIFORNIA_RELIGIONS',	1),
			('ICON_RELIGION_DATURA',		'ICON_FONT_TEXTURE_CALIFORNIA_RELIGIONS',	2),
			('ICON_RELIGION_DREAMING',		'ICON_FONT_TEXTURE_CALIFORNIA_RELIGIONS',	3),
			('ICON_RELIGION_WAASHAT',		'ICON_FONT_TEXTURE_CALIFORNIA_RELIGIONS',	4),
			('ICON_RELIGION_WORLD_RENEWAL',	'ICON_FONT_TEXTURE_CALIFORNIA_RELIGIONS',	5),
			('ICON_RELIGION_BOLE_MARU',		'ICON_FONT_TEXTURE_CALIFORNIA_RELIGIONS',	6);