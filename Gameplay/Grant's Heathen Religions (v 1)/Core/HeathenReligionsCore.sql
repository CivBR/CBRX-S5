--==========================================================================================================================
-- ART
--==========================================================================================================================
INSERT INTO
	IconTextureAtlases (Atlas, IconSize, Filename, IconsPerRow, IconsPerColumn)
VALUES
	('HEATHENS_MASTER_ATLAS', 256, 'HeathenAtlas256.dds', 8, 4),
	('HEATHENS_MASTER_ATLAS', 214, 'HeathenAtlas214.dds', 8, 4),
	('HEATHENS_MASTER_ATLAS', 128, 'HeathenAtlas128.dds', 8, 4),
	('HEATHENS_MASTER_ATLAS', 80, 'HeathenAtlas80.dds', 8, 4),
	('HEATHENS_MASTER_ATLAS', 64, 'HeathenAtlas64.dds', 8, 4),
	('HEATHENS_MASTER_ATLAS', 48, 'HeathenAtlas48.dds', 8, 4),
	('HEATHENS_MASTER_ATLAS', 32, 'HeathenAtlas32.dds', 8, 4),
	('HEATHENS_MASTER_ATLAS', 24, 'HeathenAtlas24.dds', 8, 4),
	('HEATHENS_MASTER_ATLAS', 16, 'HeathenAtlas16.dds', 8, 4);

INSERT INTO
	IconFontTextures (IconFontTexture, IconFontTextureFile)
VALUES
	('ICON_FONT_TEXTURE_HEATHENS_MASTER', 'HeathenFontIcons');

INSERT INTO
	IconFontMapping (IconName, IconFontTexture, IconMapping)
VALUES
	('ICON_RELIGION_AMA_LURRA', 'ICON_FONT_TEXTURE_HEATHENS_MASTER', 2),
	('ICON_RELIGION_BIMO', 'ICON_FONT_TEXTURE_HEATHENS_MASTER', 13),
	('ICON_RELIGION_BON', 'ICON_FONT_TEXTURE_HEATHENS_MASTER', 3),
	('ICON_RELIGION_DAL', 'ICON_FONT_TEXTURE_HEATHENS_MASTER', 5),
	('ICON_RELIGION_DII_MAURI', 'ICON_FONT_TEXTURE_HEATHENS_MASTER', 6),
	('ICON_RELIGION_HALDIANISM', 'ICON_FONT_TEXTURE_HEATHENS_MASTER', 7),
	('ICON_RELIGION_IMANA', 'ICON_FONT_TEXTURE_HEATHENS_MASTER', 18),
	('ICON_RELIGION_INZAKISM', 'ICON_FONT_TEXTURE_HEATHENS_MASTER', 9),
	('ICON_RELIGION_PASETEOI', 'ICON_FONT_TEXTURE_HEATHENS_MASTER', 12),
	('ICON_RELIGION_IRMINISM', 'ICON_FONT_TEXTURE_HEATHENS_MASTER', 8),
	('ICON_RELIGION_PERENDIANISM', 'ICON_FONT_TEXTURE_HEATHENS_MASTER', 1),
	('ICON_RELIGION_REDONISM', 'ICON_FONT_TEXTURE_HEATHENS_MASTER', 29),
	('ICON_RELIGION_TREBARUNA_CULT', 'ICON_FONT_TEXTURE_HEATHENS_MASTER', 17),
	('ICON_RELIGION_HAITHN', 'ICON_FONT_TEXTURE_HEATHENS_MASTER', 16),
	('ICON_RELIGION_MARAPU', 'ICON_FONT_TEXTURE_HEATHENS_MASTER', 28),
	('ICON_RELIGION_SWANCO', 'ICON_FONT_TEXTURE_HEATHENS_MASTER', 19),
	('ICON_RELIGION_SOLAR_BIRD_CULT', 'ICON_FONT_TEXTURE_HEATHENS_MASTER', 23),
	('ICON_RELIGION_VOS', 'ICON_FONT_TEXTURE_HEATHENS_MASTER', 22),
	('ICON_RELIGION_ZALMOXIANISM', 'ICON_FONT_TEXTURE_HEATHENS_MASTER', 24),
	('ICON_RELIGION_TAIVAANAULA', 'ICON_FONT_TEXTURE_HEATHENS_MASTER', 20),
	('ICON_RELIGION_ESE_HAVURNE', 'ICON_FONT_TEXTURE_HEATHENS_MASTER', 11),
	('ICON_RELIGION_UTAKI_SHINKO', 'ICON_FONT_TEXTURE_HEATHENS_MASTER', 15),
	('ICON_RELIGION_KAWASKAWAS', 'ICON_FONT_TEXTURE_HEATHENS_MASTER', 10),
	('ICON_RELIGION_COSSUS_CULT', 'ICON_FONT_TEXTURE_HEATHENS_MASTER', 14),
	('ICON_RELIGION_CIMARII_JULA', 'ICON_FONT_TEXTURE_HEATHENS_MASTER', 4),
	('ICON_RELIGION_MASTORAVA', 'ICON_FONT_TEXTURE_HEATHENS_MASTER', 21),
	('ICON_RELIGION_LUPWKA', 'ICON_FONT_TEXTURE_HEATHENS_MASTER', 25),
	('ICON_RELIGION_GARDACVABELA', 'ICON_FONT_TEXTURE_HEATHENS_MASTER', 26),
	('ICON_RELIGION_AJDAHA_YILAN', 'ICON_FONT_TEXTURE_HEATHENS_MASTER', 30),
	('ICON_RELIGION_AK_JANG', 'ICON_FONT_TEXTURE_HEATHENS_MASTER', 31),
	('ICON_RELIGION_MAGUZANCI', 'ICON_FONT_TEXTURE_HEATHENS_MASTER', 32),
	('ICON_RELIGION_ELETFA', 'ICON_FONT_TEXTURE_HEATHENS_MASTER', 27);

--==========================================================================================================================
-- RELIGIONS
--==========================================================================================================================
INSERT INTO
	Religions (Type, Description, Civilopedia, IconAtlas, PortraitIndex, IconString)
VALUES
	('RELIGION_AMA_LURRA', 'TXT_KEY_RELIGION_AMA_LURRA', 'TXT_KEY_RELIGION_AMA_LURRA_PEDIA', 'HEATHENS_MASTER_ATLAS', 1, '[ICON_RELIGION_AMA_LURRA]'),
	('RELIGION_BIMO', 'TXT_KEY_RELIGION_BIMO', 'TXT_KEY_RELIGION_BIMO_PEDIA', 'HEATHENS_MASTER_ATLAS', 12, '[ICON_RELIGION_BIMO]'),
	('RELIGION_BON', 'TXT_KEY_RELIGION_BON', 'TXT_KEY_RELIGION_BON_PEDIA', 'HEATHENS_MASTER_ATLAS', 2, '[ICON_RELIGION_BON]'),
	('RELIGION_DAL', 'TXT_KEY_RELIGION_DAL', 'TXT_KEY_RELIGION_DAL_PEDIA', 'HEATHENS_MASTER_ATLAS', 4, '[ICON_RELIGION_DAL]'),
	('RELIGION_DII_MAURI', 'TXT_KEY_RELIGION_DII_MAURI', 'TXT_KEY_RELIGION_DII_MAURI_PEDIA', 'HEATHENS_MASTER_ATLAS', 5, '[ICON_RELIGION_DII_MAURI]'),
	('RELIGION_ELETFA', 'TXT_KEY_RELIGION_ELETFA', 'TXT_KEY_RELIGION_ELETFA_PEDIA', 'HEATHENS_MASTER_ATLAS', 26, '[ICON_RELIGION_ELETFA]'),
	('RELIGION_HALDIANISM', 'TXT_KEY_RELIGION_HALDIANISM', 'TXT_KEY_RELIGION_HALDIANISM_PEDIA', 'HEATHENS_MASTER_ATLAS', 6, '[ICON_RELIGION_HALDIANISM]'),
	('RELIGION_IMANA', 'TXT_KEY_RELIGION_IMANA', 'TXT_KEY_RELIGION_IMANA_PEDIA', 'HEATHENS_MASTER_ATLAS', 17, '[ICON_RELIGION_IMANA]'),
	('RELIGION_INZAKISM', 'TXT_KEY_RELIGION_INZAKISM', 'TXT_KEY_RELIGION_INZAKISM_PEDIA', 'HEATHENS_MASTER_ATLAS', 8, '[ICON_RELIGION_INZAKISM]'),
	('RELIGION_PASETEOI', 'TXT_KEY_RELIGION_PASETEOI', 'TXT_KEY_RELIGION_PASETEOI_PEDIA', 'HEATHENS_MASTER_ATLAS', 11, '[ICON_RELIGION_PASETEOI]'),
	('RELIGION_IRMINISM', 'TXT_KEY_RELIGION_IRMINISM', 'TXT_KEY_RELIGION_IRMINISM_PEDIA', 'HEATHENS_MASTER_ATLAS', 7, '[ICON_RELIGION_IRMINISM]'),
	('RELIGION_PERENDIANISM', 'TXT_KEY_RELIGION_PERENDIANISM', 'TXT_KEY_RELIGION_PERENDIANISM_PEDIA', 'HEATHENS_MASTER_ATLAS', 0, '[ICON_RELIGION_PERENDIANISM]'),
	('RELIGION_REDONISM', 'TXT_KEY_RELIGION_REDONISM', 'TXT_KEY_RELIGION_REDONISM_PEDIA', 'HEATHENS_MASTER_ATLAS', 28, '[ICON_RELIGION_REDONISM]'),
	('RELIGION_TREBARUNA_CULT', 'TXT_KEY_RELIGION_TREBARUNA_CULT', 'TXT_KEY_RELIGION_TREBARUNA_CULT_PEDIA', 'HEATHENS_MASTER_ATLAS', 16, '[ICON_RELIGION_TREBARUNA_CULT]'),
	('RELIGION_HAITHN', 'TXT_KEY_RELIGION_HAITHN', 'TXT_KEY_RELIGION_HAITHN_PEDIA', 'HEATHENS_MASTER_ATLAS', 15, '[ICON_RELIGION_HAITHN]'),
	('RELIGION_MARAPU', 'TXT_KEY_RELIGION_MARAPU', 'TXT_KEY_RELIGION_MARAPU_PEDIA', 'HEATHENS_MASTER_ATLAS', 27, '[ICON_RELIGION_MARAPU]'),
	('RELIGION_SWANCO', 'TXT_KEY_RELIGION_SWANCO', 'TXT_KEY_RELIGION_SWANCO_PEDIA', 'HEATHENS_MASTER_ATLAS', 18, '[ICON_RELIGION_SWANCO]'),
	('RELIGION_SOLAR_BIRD_CULT', 'TXT_KEY_RELIGION_SOLAR_BIRD_CULT', 'TXT_KEY_RELIGION_SOLAR_BIRD_CULT_PEDIA', 'HEATHENS_MASTER_ATLAS', 22, '[ICON_RELIGION_SOLAR_BIRD_CULT]'),
	('RELIGION_VOS', 'TXT_KEY_RELIGION_VOS', 'TXT_KEY_RELIGION_VOS_PEDIA', 'HEATHENS_MASTER_ATLAS', 21, '[ICON_RELIGION_VOS]'),
	('RELIGION_ZALMOXIANISM', 'TXT_KEY_RELIGION_ZALMOXIANISM', 'TXT_KEY_RELIGION_ZALMOXIANISM_PEDIA', 'HEATHENS_MASTER_ATLAS', 23, '[ICON_RELIGION_ZALMOXIANISM]'),
	('RELIGION_TAIVAANAULA', 'TXT_KEY_RELIGION_TAIVAANAULA', 'TXT_KEY_RELIGION_TAIVAANAULA_PEDIA', 'HEATHENS_MASTER_ATLAS', 19, '[ICON_RELIGION_TAIVAANAULA]'),
	('RELIGION_ESE_HAVURNE', 'TXT_KEY_RELIGION_ESE_HAVURNE', 'TXT_KEY_RELIGION_ESE_HAVURNE_PEDIA', 'HEATHENS_MASTER_ATLAS', 10, '[ICON_RELIGION_ESE_HAVURNE]'),
	('RELIGION_KAWASKAWAS', 'TXT_KEY_RELIGION_KAWASKAWAS', 'TXT_KEY_RELIGION_KAWASKAWAS_PEDIA', 'HEATHENS_MASTER_ATLAS', 9, '[ICON_RELIGION_KAWASKAWAS]'),
	('RELIGION_MASTORAVA', 'TXT_KEY_RELIGION_MASTORAVA', 'TXT_KEY_RELIGION_MASTORAVA_PEDIA', 'HEATHENS_MASTER_ATLAS', 20, '[ICON_RELIGION_MASTORAVA]'),
	('RELIGION_COSSUS_CULT', 'TXT_KEY_RELIGION_COSSUS_CULT', 'TXT_KEY_RELIGION_COSSUS_CULT_PEDIA', 'HEATHENS_MASTER_ATLAS', 13, '[ICON_RELIGION_COSSUS_CULT]'),
	('RELIGION_CIMARII_JULA', 'TXT_KEY_RELIGION_CIMARII_JULA', 'TXT_KEY_RELIGION_CIMARII_JULA_PEDIA', 'HEATHENS_MASTER_ATLAS', 3, '[ICON_RELIGION_CIMARII_JULA]'),
	('RELIGION_AJDAHA_YILAN', 'TXT_KEY_RELIGION_AJDAHA_YILAN', 'TXT_KEY_RELIGION_AJDAHA_YILAN_PEDIA', 'HEATHENS_MASTER_ATLAS', 29, '[ICON_RELIGION_AJDAHA_YILAN]'),
	('RELIGION_AK_JANG', 'TXT_KEY_RELIGION_AK_JANG', 'TXT_KEY_RELIGION_AK_JANG_PEDIA', 'HEATHENS_MASTER_ATLAS', 30, '[ICON_RELIGION_AK_JANG]'),
	('RELIGION_MAGUZANCI', 'TXT_KEY_RELIGION_MAGUZANCI', 'TXT_KEY_RELIGION_MAGUZANCI_PEDIA', 'HEATHENS_MASTER_ATLAS', 31, '[ICON_RELIGION_MAGUZANCI]'),
	('RELIGION_LUPWKA', 'TXT_KEY_RELIGION_LUPWKA', 'TXT_KEY_RELIGION_LUPWKA_PEDIA', 'HEATHENS_MASTER_ATLAS', 24, '[ICON_RELIGION_LUPWKA]'),
	('RELIGION_GARDACVABELA', 'TXT_KEY_RELIGION_GARDACVABELA', 'TXT_KEY_RELIGION_GARDACVABELA_PEDIA', 'HEATHENS_MASTER_ATLAS', 25, '[ICON_RELIGION_GARDACVABELA]');

--==========================================================================================================================
-- PREFERENCES
--==========================================================================================================================
-- Ama Lurra
-- DELETE FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_UC_NAVARRE';
-- INSERT INTO Civilization_Religions
-- 		        (CivilizationType,	ReligionType)
-- SELECT		Type,			('RELIGION_AMA_LURRA')
-- FROM Civilizations WHERE Type = 'CIVILIZATION_UC_NAVARRE';
-- CREATE TRIGGER CivilizationTierNavarre
-- AFTER INSERT ON Civilization_Religions WHEN 'RELIGION_AMA_LURRA' = NEW.CivilizationType
-- BEGIN
-- 	UPDATE Civilization_Religions SET ReligionType =
-- 		( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_AMA_LURRA' )
-- 			THEN 'RELIGION_AMA_LURRA'
-- 			ELSE 'RELIGION_CHRISTIANITY' END
-- 		) WHERE CivilizationType = 'CIVILIZATION_UC_NAVARRE';
-- END;
-- -- Bimo
-- DELETE FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_GT_DALI';
-- INSERT INTO Civilization_Religions
-- 		        (CivilizationType,	ReligionType)
-- SELECT		Type,			('RELIGION_BIMO')
-- FROM Civilizations WHERE Type = 'CIVILIZATION_GT_DALI';
-- UPDATE Civilization_Religions SET ReligionType =
-- 	( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_BIMO' )
-- 		THEN 'RELIGION_BIMO'
-- 		ELSE ( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_VAJRAYANA' )
-- 		THEN 'RELIGION_VAJRAYANA'
-- 		ELSE 'RELIGION_BUDDHISM' END
-- 	) WHERE CivilizationType = 'CIVILIZATION_GT_DALI';
-- CREATE TRIGGER CivilizationTierDali
-- AFTER INSERT ON Civilization_Religions WHEN 'CIVILIZATION_GT_DALI' = NEW.CivilizationType
-- BEGIN
-- 	UPDATE Civilization_Religions SET ReligionType =
-- 		( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_BIMO' )
-- 			THEN 'RELIGION_BIMO'
-- 			ELSE ( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_VAJRAYANA' )
-- 			THEN 'RELIGION_VAJRAYANA'
-- 			ELSE 'RELIGION_BUDDHISM' END ) END
-- 		) WHERE CivilizationType = 'CIVILIZATION_GT_DALI';
-- END;
-- -- Bon
-- -- Dal
-- DELETE FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_RJ_VAINAKH';
-- INSERT INTO Civilization_Religions
-- 		        (CivilizationType,	ReligionType)
-- SELECT		Type,			('RELIGION_DAL')
-- FROM Civilizations WHERE Type = 'CIVILIZATION_RJ_VAINAKH';
-- CREATE TRIGGER CivilizationTierDali
-- AFTER INSERT ON Civilization_Religions WHEN 'CIVILIZATION_RJ_VAINAKH' = NEW.CivilizationType
-- BEGIN
-- 	UPDATE Civilization_Religions SET ReligionType =
-- 		( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_DAL' )
-- 			THEN 'RELIGION_DAL'
-- 			ELSE 'RELIGION_ISLAM' END
-- 		) WHERE CivilizationType = 'CIVILIZATION_RJ_VAINAKH';
-- END;
-- -- Dii Mauri
-- DELETE FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_LS_NUMIDIA';
-- INSERT INTO Civilization_Religions
-- 		        (CivilizationType,	ReligionType)
-- SELECT		Type,			('RELIGION_DII_MAURI')
-- FROM Civilizations WHERE Type = 'CIVILIZATION_LS_NUMIDIA';
-- CREATE TRIGGER CivilizationTierNumidia
-- AFTER INSERT ON Civilization_Religions WHEN 'CIVILIZATION_LS_NUMIDIA' = NEW.CivilizationType
-- BEGIN
-- 	UPDATE Civilization_Religions SET ReligionType =
-- 		( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_DII_MAURI' )
-- 			THEN 'RELIGION_DII_MAURI'
-- 			ELSE 'RELIGION_ISLAM' END
-- 		) WHERE CivilizationType = 'CIVILIZATION_LS_NUMIDIA';
-- END;
-- DELETE FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_RJ_GUANCHES';
-- INSERT INTO Civilization_Religions
-- 		        (CivilizationType,	ReligionType)
-- SELECT		Type,			('RELIGION_DII_MAURI')
-- FROM Civilizations WHERE Type = 'CIVILIZATION_RJ_GUANCHES';
-- CREATE TRIGGER CivilizationTierGuanches
-- AFTER INSERT ON Civilization_Religions WHEN 'CIVILIZATION_RJ_GUANCHES' = NEW.CivilizationType
-- BEGIN
-- 	UPDATE Civilization_Religions SET ReligionType =
-- 		( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_DII_MAURI' )
-- 			THEN 'RELIGION_DII_MAURI'
-- 			ELSE 'RELIGION_ISLAM' END
-- 		) WHERE CivilizationType = 'CIVILIZATION_RJ_GUANCHES';
-- END;
-- -- Eletfa
-- DELETE FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_AW_MAGYARS';
-- INSERT INTO Civilization_Religions
-- 		        (CivilizationType,	ReligionType)
-- SELECT		Type,			('RELIGION_ELETFA')
-- FROM Civilizations WHERE Type = 'CIVILIZATION_AW_MAGYARS';
-- CREATE TRIGGER CivilizationTierMagyars
-- AFTER INSERT ON Civilization_Religions WHEN 'CIVILIZATION_AW_MAGYARS' = NEW.CivilizationType
-- BEGIN
-- 	UPDATE Civilization_Religions SET ReligionType =
-- 		( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_ELETFA' )
-- 			THEN 'RELIGION_ELETFA'
-- 			ELSE 'RELIGION_CHRISTIANITY' END
-- 		) WHERE CivilizationType = 'CIVILIZATION_AW_MAGYARS';
-- END;
-- DELETE FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_CL_YUGRA';
-- INSERT INTO Civilization_Religions
-- 		        (CivilizationType,	ReligionType)
-- SELECT		Type,			('RELIGION_SAMANISM')
-- FROM Civilizations WHERE Type = 'CIVILIZATION_CL_YUGRA';
-- UPDATE Civilization_Religions SET ReligionType =
-- 	( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_ELETFA' )
-- 		THEN 'RELIGION_ELETFA'
-- 		ELSE ( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_SAMANISM' )
-- 		THEN 'RELIGION_SAMANISM'
-- 		ELSE ( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_ORTHODOX' )
-- 		THEN 'RELIGION_ORTHODOX'
-- 		ELSE 'RELIGION_CHRISTIANITY' END ) END ) END
-- 	) WHERE CivilizationType = 'CIVILIZATION_CL_YUGRA';
-- CREATE TRIGGER CivilizationTierYugra
-- AFTER INSERT ON Civilization_Religions WHEN 'CIVILIZATION_CL_YUGRA' = NEW.CivilizationType
-- BEGIN
-- 	UPDATE Civilization_Religions SET ReligionType =
-- 		( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_ELETFA' )
-- 			THEN 'RELIGION_ELETFA'
-- 			ELSE ( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_SAMANISM' )
-- 			THEN 'RELIGION_SAMANISM'
-- 			ELSE ( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_ORTHODOX' )
-- 			THEN 'RELIGION_ORTHODOX'
-- 			ELSE 'RELIGION_CHRISTIANITY' END ) END ) END
-- 		) WHERE CivilizationType = 'CIVILIZATION_CL_YUGRA';
-- END;
-- -- Haldianism
-- DELETE FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_AW_URATU';
-- INSERT INTO Civilization_Religions
-- 		        (CivilizationType,	ReligionType)
-- SELECT		Type,			('RELIGION_HALDIANISM')
-- FROM Civilizations WHERE Type = 'CIVILIZATION_AW_URATU';
-- CREATE TRIGGER CivilizationTierUratu
-- AFTER INSERT ON Civilization_Religions WHEN 'CIVILIZATION_AW_URATU' = NEW.CivilizationType
-- BEGIN
-- 	UPDATE Civilization_Religions SET ReligionType =
-- 		( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_HALDIANISM' )
-- 			THEN 'RELIGION_HALDIANISM'
-- 			ELSE 'RELIGION_CHRISTIANITY' END
-- 		) WHERE CivilizationType = 'CIVILIZATION_AW_URATU';
-- END;
-- -- Imana
-- DELETE FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_DMS_MC_KANEM_BORNU';
-- INSERT INTO Civilization_Religions
-- 		        (CivilizationType,	ReligionType)
-- SELECT		Type,			('RELIGION_IMANA')
-- FROM Civilizations WHERE Type = 'CIVILIZATION_DMS_MC_KANEM_BORNU';
-- CREATE TRIGGER CivilizationTierKanem
-- AFTER INSERT ON Civilization_Religions WHEN 'CIVILIZATION_DMS_MC_KANEM_BORNU' = NEW.CivilizationType
-- BEGIN
-- 	UPDATE Civilization_Religions SET ReligionType =
-- 		( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_IMANA' )
-- 			THEN 'RELIGION_IMANA'
-- 			ELSE 'RELIGION_ISLAM' END
-- 		) WHERE CivilizationType = 'CIVILIZATION_DMS_MC_KANEM_BORNU';
-- END;
-- DELETE FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_DMS_RWANDA';
-- INSERT INTO Civilization_Religions
-- 		        (CivilizationType,	ReligionType)
-- SELECT		Type,			('RELIGION_IMANA')
-- FROM Civilizations WHERE Type = 'CIVILIZATION_DMS_RWANDA';
-- UPDATE Civilization_Religions SET ReligionType =
-- 	( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_IMANA' )
-- 		THEN 'RELIGION_IMANA'
-- 		ELSE ( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_ITAN' )
-- 		THEN 'RELIGION_ITAN'
-- 		ELSE 'RELIGION_ISLAM' END ) END
-- 	) WHERE CivilizationType = 'CIVILIZATION_DMS_RWANDA';
-- CREATE TRIGGER CivilizationTierRwanda
-- AFTER INSERT ON Civilization_Religions WHEN 'CIVILIZATION_DMS_RWANDA' = NEW.CivilizationType
-- BEGIN
-- 	UPDATE Civilization_Religions SET ReligionType =
-- 		( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_IMANA' )
-- 			THEN 'RELIGION_IMANA'
-- 			ELSE ( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_ITAN' )
-- 			THEN 'RELIGION_ITAN'
-- 			ELSE 'RELIGION_ISLAM' END ) END
-- 		) WHERE CivilizationType = 'CIVILIZATION_DMS_RWANDA';
-- END;
-- -- Inzak
-- DELETE FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_AW_DILMUN';
-- INSERT INTO Civilization_Religions
-- 		        (CivilizationType,	ReligionType)
-- SELECT		Type,			('RELIGION_INZAKISM')
-- FROM Civilizations WHERE Type = 'CIVILIZATION_AW_DILMUN';
-- CREATE TRIGGER CivilizationTierDilmun
-- AFTER INSERT ON Civilization_Religions WHEN 'CIVILIZATION_AW_DILMUN' = NEW.CivilizationType
-- BEGIN
-- 	UPDATE Civilization_Religions SET ReligionType =
-- 		( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_INZAKISM' )
-- 			THEN 'RELIGION_INZAKISM'
-- 			ELSE 'RELIGION_ISLAM' END
-- 		) WHERE CivilizationType = 'CIVILIZATION_AW_DILMUN';
-- END;
-- -- Pasetoi
-- DELETE FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_MC_MYCENAE';
-- INSERT INTO Civilization_Religions
-- 		        (CivilizationType,	ReligionType)
-- SELECT		Type,			('RELIGION_PASETEOI')
-- FROM Civilizations WHERE Type = 'CIVILIZATION_MC_MYCENAE';
-- CREATE TRIGGER CivilizationTierMycenae
-- AFTER INSERT ON Civilization_Religions WHEN 'CIVILIZATION_MC_MYCENAE' = NEW.CivilizationType
-- BEGIN
-- 	UPDATE Civilization_Religions SET ReligionType =
-- 		( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_PASETEOI' )
-- 			THEN 'RELIGION_PASETEOI'
-- 			ELSE 'RELIGION_CHRISTIANITY' END
-- 		) WHERE CivilizationType = 'CIVILIZATION_MC_MYCENAE';
-- END;
-- -- Irminism
-- DELETE FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_SAXONIA';
-- INSERT INTO Civilization_Religions
-- 		        (CivilizationType,	ReligionType)
-- SELECT		Type,			('RELIGION_IRMINISM')
-- FROM Civilizations WHERE Type = 'CIVILIZATION_SAXONIA';
-- CREATE TRIGGER CivilizationTierSaxons
-- AFTER INSERT ON Civilization_Religions WHEN 'CIVILIZATION_SAXONIA' = NEW.CivilizationType
-- BEGIN
-- 	UPDATE Civilization_Religions SET ReligionType =
-- 		( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_IRMINISM' )
-- 			THEN 'RELIGION_IRMINISM'
-- 			ELSE 'RELIGION_CHRISTIANITY' END
-- 		) WHERE CivilizationType = 'CIVILIZATION_SAXONIA';
-- END;
-- DELETE FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_ASQ_WESSEX';
-- INSERT INTO Civilization_Religions
-- 		        (CivilizationType,	ReligionType)
-- SELECT		Type,			('RELIGION_IRMINISM')
-- FROM Civilizations WHERE Type = 'CIVILIZATION_ASQ_WESSEX';
-- CREATE TRIGGER CivilizationTierWessex
-- AFTER INSERT ON Civilization_Religions WHEN 'CIVILIZATION_ASQ_WESSEX' = NEW.CivilizationType
-- BEGIN
-- 	UPDATE Civilization_Religions SET ReligionType =
-- 		( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_IRMINISM' )
-- 			THEN 'RELIGION_IRMINISM'
-- 			ELSE 'RELIGION_CHRISTIANITY' END
-- 		) WHERE CivilizationType = 'CIVILIZATION_ASQ_WESSEX';
-- END;
-- DELETE FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_JFD_GERMANS';
-- INSERT INTO Civilization_Religions
-- 		        (CivilizationType,	ReligionType)
-- SELECT		Type,			('RELIGION_IRMINISM')
-- FROM Civilizations WHERE Type = 'CIVILIZATION_JFD_GERMANS';
-- CREATE TRIGGER CivilizationTierGermans
-- AFTER INSERT ON Civilization_Religions WHEN 'CIVILIZATION_JFD_GERMANS' = NEW.CivilizationType
-- BEGIN
-- 	UPDATE Civilization_Religions SET ReligionType =
-- 		( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_IRMINISM' )
-- 			THEN 'RELIGION_IRMINISM'
-- 			ELSE 'RELIGION_CHRISTIANITY' END
-- 		) WHERE CivilizationType = 'CIVILIZATION_JFD_GERMANS';
-- END;
-- DELETE FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_THP_FRANKS';
-- INSERT INTO Civilization_Religions
-- 		        (CivilizationType,	ReligionType)
-- SELECT		Type,			('RELIGION_IRMINISM')
-- FROM Civilizations WHERE Type = 'CIVILIZATION_THP_FRANKS';
-- CREATE TRIGGER CivilizationTierFranks
-- AFTER INSERT ON Civilization_Religions WHEN 'CIVILIZATION_THP_FRANKS' = NEW.CivilizationType
-- BEGIN
-- 	UPDATE Civilization_Religions SET ReligionType =
-- 		( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_IRMINISM' )
-- 			THEN 'RELIGION_IRMINISM'
-- 			ELSE 'RELIGION_CHRISTIANITY' END
-- 		) WHERE CivilizationType = 'CIVILIZATION_THP_FRANKS';
-- END;
-- -- Perendianism
-- DELETE FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_DJS_ALBANIA';
-- INSERT INTO Civilization_Religions
-- 		        (CivilizationType,	ReligionType)
-- SELECT		Type,			('RELIGION_PERENDIANISM')
-- FROM Civilizations WHERE Type = 'CIVILIZATION_DJS_ALBANIA';
-- CREATE TRIGGER CivilizationTierAlbania
-- AFTER INSERT ON Civilization_Religions WHEN 'CIVILIZATION_DJS_ALBANIA' = NEW.CivilizationType
-- BEGIN
-- 	UPDATE Civilization_Religions SET ReligionType =
-- 		( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_PERENDIANISM' )
-- 			THEN 'RELIGION_PERENDIANISM'
-- 			ELSE 'RELIGION_CHRISTIANITY' END
-- 		) WHERE CivilizationType = 'CIVILIZATION_DJS_ALBANIA';
-- END;
-- -- Redonism
-- DELETE FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_DMS_ILLYRIA';
-- INSERT INTO Civilization_Religions
-- 		        (CivilizationType,	ReligionType)
-- SELECT		Type,			('RELIGION_REDONISM')
-- FROM Civilizations WHERE Type = 'CIVILIZATION_DMS_ILLYRIA';
-- CREATE TRIGGER CivilizationTierRedonism
-- AFTER INSERT ON Civilization_Religions WHEN 'CIVILIZATION_DMS_ILLYRIA' = NEW.CivilizationType
-- BEGIN
-- 	UPDATE Civilization_Religions SET ReligionType =
-- 		( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_REDONISM' )
-- 			THEN 'RELIGION_REDONISM'
-- 			ELSE 'RELIGION_CHRISTIANITY' END
-- 		) WHERE CivilizationType = 'CIVILIZATION_DMS_ILLYRIA';
-- END;
-- -- Trebaruna Cult
-- DELETE FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_DMS_LUSITANIANS';
-- INSERT INTO Civilization_Religions
-- 		        (CivilizationType,	ReligionType)
-- SELECT		Type,			('RELIGION_TREBARUNA')
-- FROM Civilizations WHERE Type = 'CIVILIZATION_DMS_LUSITANIANS';
-- CREATE TRIGGER CivilizationTierLusitania
-- AFTER INSERT ON Civilization_Religions WHEN 'CIVILIZATION_DMS_LUSITANIANS' = NEW.CivilizationType
-- BEGIN
-- 	UPDATE Civilization_Religions SET ReligionType =
-- 		( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_TREBARUNA' )
-- 			THEN 'RELIGION_TREBARUNA'
-- 			ELSE 'RELIGION_CHRISTIANITY' END
-- 		) WHERE CivilizationType = 'CIVILIZATION_DMS_LUSITANIANS';
-- END;
-- -- Haithn
-- DELETE FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_VISIGOTHS_MOD';
-- INSERT INTO Civilization_Religions
-- 		        (CivilizationType,	ReligionType)
-- SELECT		Type,			('RELIGION_HAITHN')
-- FROM Civilizations WHERE Type = 'CIVILIZATION_VISIGOTHS_MOD';
-- CREATE TRIGGER CivilizationTierVisigoths
-- AFTER INSERT ON Civilization_Religions WHEN 'CIVILIZATION_VISIGOTHS_MOD' = NEW.CivilizationType
-- BEGIN
-- 	UPDATE Civilization_Religions SET ReligionType =
-- 		( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_HAITHN' )
-- 			THEN 'RELIGION_HAITHN'
-- 			ELSE 'RELIGION_CHRISTIANITY' END
-- 		) WHERE CivilizationType = 'CIVILIZATION_VISIGOTHS_MOD';
-- END;
-- DELETE FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_JFD_VANDALS';
-- INSERT INTO Civilization_Religions
-- 		        (CivilizationType,	ReligionType)
-- SELECT		Type,			('RELIGION_HAITHN')
-- FROM Civilizations WHERE Type = 'CIVILIZATION_JFD_VANDALS';
-- CREATE TRIGGER CivilizationTierHaithn
-- AFTER INSERT ON Civilization_Religions WHEN 'CIVILIZATION_JFD_VANDALS' = NEW.CivilizationType
-- BEGIN
-- 	UPDATE Civilization_Religions SET ReligionType =
-- 		( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_HAITHN' )
-- 			THEN 'RELIGION_HAITHN'
-- 			ELSE 'RELIGION_CHRISTIANITY' END
-- 		) WHERE CivilizationType = 'CIVILIZATION_JFD_VANDALS';
-- END;
-- -- Marapu
-- -- Swanco
-- DELETE FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_GT_KRORAINA';
-- INSERT INTO Civilization_Religions
-- 		        (CivilizationType,	ReligionType)
-- SELECT		Type,			('RELIGION_SWANCO')
-- FROM Civilizations WHERE Type = 'CIVILIZATION_GT_KRORAINA';
-- CREATE TRIGGER CivilizationTierSwanco
-- AFTER INSERT ON Civilization_Religions WHEN 'CIVILIZATION_GT_KRORAINA' = NEW.CivilizationType
-- BEGIN
-- 	UPDATE Civilization_Religions SET ReligionType =
-- 		( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_SWANCO' )
-- 			THEN 'RELIGION_SWANCO'
-- 			ELSE 'RELIGION_BUDDHISM' END
-- 		) WHERE CivilizationType = 'CIVILIZATION_GT_KRORAINA';
-- END;
-- -- Solar Bird Cult
-- DELETE FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_SHANG_MOD';
-- INSERT INTO Civilization_Religions
-- 		        (CivilizationType,	ReligionType)
-- SELECT		Type,			('RELIGION_SOLAR_BIRD_CULT')
-- FROM Civilizations WHERE Type = 'CIVILIZATION_SHANG_MOD';
-- CREATE TRIGGER CivilizationTierSBC
-- AFTER INSERT ON Civilization_Religions WHEN 'CIVILIZATION_SHANG_MOD' = NEW.CivilizationType
-- BEGIN
-- 	UPDATE Civilization_Religions SET ReligionType =
-- 		( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_SOLAR_BIRD_CULT' )
-- 			THEN 'RELIGION_SOLAR_BIRD_CULT'
-- 			ELSE 'RELIGION_TAOISM' END
-- 		) WHERE CivilizationType = 'CIVILIZATION_SHANG_MOD';
-- END;
-- -- Vos
-- DELETE FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_GT_PERM';
-- INSERT INTO Civilization_Religions
-- 		        (CivilizationType,	ReligionType)
-- SELECT		Type,			('RELIGION_VOS')
-- FROM Civilizations WHERE Type = 'CIVILIZATION_GT_PERM';
-- CREATE TRIGGER CivilizationTierPerm
-- AFTER INSERT ON Civilization_Religions WHEN 'CIVILIZATION_GT_PERM' = NEW.CivilizationType
-- BEGIN
-- 	UPDATE Civilization_Religions SET ReligionType =
-- 		( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_VOS' )
-- 			THEN 'RELIGION_VOS'
-- 			ELSE 'RELIGION_CHRISTIANITY' END
-- 		) WHERE CivilizationType = 'CIVILIZATION_GT_PERM';
-- END;
-- -- Zalmoxianism
-- DELETE FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_DMS_DACIANS';
-- INSERT INTO Civilization_Religions
-- 		        (CivilizationType,	ReligionType)
-- SELECT		Type,			('RELIGION_ZALMOXIANISM')
-- FROM Civilizations WHERE Type = 'CIVILIZATION_DMS_DACIANS';
-- CREATE TRIGGER CivilizationTierDacia
-- AFTER INSERT ON Civilization_Religions WHEN 'CIVILIZATION_DMS_DACIANS' = NEW.CivilizationType
-- BEGIN
-- 	UPDATE Civilization_Religions SET ReligionType =
-- 		( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_ZALMOXIANISM' )
-- 			THEN 'RELIGION_ZALMOXIANISM'
-- 			ELSE 'RELIGION_CHRISTIANITY' END
-- 		) WHERE CivilizationType = 'CIVILIZATION_DMS_DACIANS';
-- END;
-- -- Taivaanaula
-- DELETE FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_GT_FINNS';
-- INSERT INTO Civilization_Religions
-- 		        (CivilizationType,	ReligionType)
-- SELECT		Type,			('RELIGION_TAIVAANAULA')
-- FROM Civilizations WHERE Type = 'CIVILIZATION_GT_FINNS';
-- CREATE TRIGGER CivilizationTierFinns
-- AFTER INSERT ON Civilization_Religions WHEN 'CIVILIZATION_GT_FINNS' = NEW.CivilizationType
-- BEGIN
-- 	UPDATE Civilization_Religions SET ReligionType =
-- 		( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_TAIVAANAULA' )
-- 			THEN 'RELIGION_TAIVAANAULA'
-- 			ELSE 'RELIGION_CHRISTIANITY' END
-- 		) WHERE CivilizationType = 'CIVILIZATION_GT_FINNS';
-- END;
-- DELETE FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_EW_OESELIANS';
-- INSERT INTO Civilization_Religions
-- 		        (CivilizationType,	ReligionType)
-- SELECT		Type,			('RELIGION_TAIVAANAULA')
-- FROM Civilizations WHERE Type = 'CIVILIZATION_EW_OESELIANS';
-- CREATE TRIGGER CivilizationTierAlbania
-- AFTER INSERT ON Civilization_Religions WHEN 'CIVILIZATION_EW_OESELIANS' = NEW.CivilizationType
-- BEGIN
-- 	UPDATE Civilization_Religions SET ReligionType =
-- 		( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_TAIVAANAULA' )
-- 			THEN 'RELIGION_TAIVAANAULA'
-- 			ELSE 'RELIGION_CHRISTIANITY' END
-- 		) WHERE CivilizationType = 'CIVILIZATION_EW_OESELIANS';
-- END;
-- -- Ese Havurne
-- DELETE FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_MITANNI';
-- INSERT INTO Civilization_Religions
-- 		        (CivilizationType,	ReligionType)
-- SELECT		Type,			('RELIGION_ESE_HAVURNE')
-- FROM Civilizations WHERE Type = 'CIVILIZATION_MITANNI';
-- CREATE TRIGGER CivilizationTierHurrians
-- AFTER INSERT ON Civilization_Religions WHEN 'CIVILIZATION_MITANNI' = NEW.CivilizationType
-- BEGIN
-- 	UPDATE Civilization_Religions SET ReligionType =
-- 		( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_ESE_HAVURNE' )
-- 			THEN 'RELIGION_ESE_HAVURNE'
-- 			ELSE 'RELIGION_JUDAISM' END
-- 		) WHERE CivilizationType = 'CIVILIZATION_MITANNI';
-- END;
-- -- Utaki Shinko
-- DELETE FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_SAS_RYUKYU';
-- INSERT INTO Civilization_Religions
-- 		        (CivilizationType,	ReligionType)
-- SELECT		Type,			('RELIGION_UTAKI_SHINKO')
-- FROM Civilizations WHERE Type = 'CIVILIZATION_SAS_RYUKYU';
-- CREATE TRIGGER CivilizationTierRykukyu
-- AFTER INSERT ON Civilization_Religions WHEN 'CIVILIZATION_SAS_RYUKYU' = NEW.CivilizationType
-- BEGIN
-- 	UPDATE Civilization_Religions SET ReligionType =
-- 		( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_UTAKI_SHINKO' )
-- 			THEN 'RELIGION_UTAKI_SHINKO'
-- 			ELSE 'RELIGION_BUDDHISM' END
-- 		) WHERE CivilizationType = 'CIVILIZATION_SAS_RYUKYU';
-- END;
-- DELETE FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_RYUKYU';
-- INSERT INTO Civilization_Religions
-- 		        (CivilizationType,	ReligionType)
-- SELECT		Type,			('RELIGION_UTAKI_SHINKO')
-- FROM Civilizations WHERE Type = 'CIVILIZATION_RYUKYU';
-- CREATE TRIGGER CivilizationTierHiram
-- AFTER INSERT ON Civilization_Religions WHEN 'CIVILIZATION_RYUKYU' = NEW.CivilizationType
-- BEGIN
-- 	UPDATE Civilization_Religions SET ReligionType =
-- 		( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_UTAKI_SHINKO' )
-- 			THEN 'RELIGION_UTAKI_SHINKO'
-- 			ELSE 'RELIGION_BUDDHISM' END
-- 		) WHERE CivilizationType = 'CIVILIZATION_RYUKYU';
-- END;
-- -- Kawaskawas
-- DELETE FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_CLAP_AMIS';
-- INSERT INTO Civilization_Religions
-- 		        (CivilizationType,	ReligionType)
-- SELECT		Type,			('RELIGION_KAWASKAWAS')
-- FROM Civilizations WHERE Type = 'CIVILIZATION_CLAP_AMIS';
-- CREATE TRIGGER CivilizationTierAmis
-- AFTER INSERT ON Civilization_Religions WHEN 'CIVILIZATION_CLAP_AMIS' = NEW.CivilizationType
-- BEGIN
-- 	UPDATE Civilization_Religions SET ReligionType =
-- 		( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_KAWASKAWAS' )
-- 			THEN 'RELIGION_KAWASKAWAS'
-- 			ELSE 'RELIGION_BUDDHISM' END
-- 		) WHERE CivilizationType = 'CIVILIZATION_CLAP_AMIS';
-- END;
-- DELETE FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_DJS_TAIWAN';
-- INSERT INTO Civilization_Religions
-- 		        (CivilizationType,	ReligionType)
-- SELECT		Type,			('RELIGION_KAWASKAWAS')
-- FROM Civilizations WHERE Type = 'CIVILIZATION_DJS_TAIWAN';
-- CREATE TRIGGER CivilizationTierTaiwan
-- AFTER INSERT ON Civilization_Religions WHEN 'CIVILIZATION_DJS_TAIWAN' = NEW.CivilizationType
-- BEGIN
-- 	UPDATE Civilization_Religions SET ReligionType =
-- 		( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_KAWASKAWAS' )
-- 			THEN 'RELIGION_KAWASKAWAS'
-- 			ELSE 'RELIGION_BUDDHISM' END
-- 		) WHERE CivilizationType = 'CIVILIZATION_DJS_TAIWAN';
-- END;
-- -- Mastorava
-- DELETE FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_GT_EASTERN_FINNS';
-- INSERT INTO Civilization_Religions
-- 		        (CivilizationType,	ReligionType)
-- SELECT		Type,			('RELIGION_MASTORAVA')
-- FROM Civilizations WHERE Type = 'CIVILIZATION_GT_EASTERN_FINNS';
-- CREATE TRIGGER CivilizationTierEastFinns
-- AFTER INSERT ON Civilization_Religions WHEN 'CIVILIZATION_GT_EASTERN_FINNS' = NEW.CivilizationType
-- BEGIN
-- 	UPDATE Civilization_Religions SET ReligionType =
-- 		( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_MASTORAVA' )
-- 			THEN 'RELIGION_MASTORAVA'
-- 			ELSE 'RELIGION_BUDDHISM' END
-- 		) WHERE CivilizationType = 'CIVILIZATION_GT_EASTERN_FINNS';
-- END;
-- -- Ciimari Jula
-- -- Cossus Cult
-- DELETE FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_DMS_CANTABRIANS';
-- INSERT INTO Civilization_Religions
-- 		        (CivilizationType,	ReligionType)
-- SELECT		Type,			('RELIGION_COSSUS_CULT')
-- FROM Civilizations WHERE Type = 'CIVILIZATION_DMS_CANTABRIANS';
-- UPDATE Civilization_Religions SET ReligionType =
-- 	( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_COSSUS_CULT' )
-- 		THEN 'RELIGION_COSSUS_CULT'
-- 		ELSE ( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_DRUIDISM' )
-- 		THEN 'RELIGION_DRUIDISM'
-- 		ELSE 'RELIGION_CHRISTIANITY' END ) END
-- 	) WHERE CivilizationType = 'CIVILIZATION_DMS_CANTABRIANS';
-- CREATE TRIGGER CivilizationTierCantabrians
-- AFTER INSERT ON Civilization_Religions WHEN 'CIVILIZATION_DMS_CANTABRIANS' = NEW.CivilizationType
-- BEGIN
-- 	UPDATE Civilization_Religions SET ReligionType =
-- 		( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_COSSUS_CULT' )
-- 			THEN 'RELIGION_COSSUS_CULT'
-- 			ELSE ( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_DRUIDISM' )
-- 			THEN 'RELIGION_DRUIDISM'
-- 			ELSE 'RELIGION_CHRISTIANITY' END ) END
-- 		) WHERE CivilizationType = 'CIVILIZATION_DMS_CANTABRIANS';
-- END;
-- -- Lupwka
-- DELETE FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_OXUS';
-- INSERT INTO Civilization_Religions
-- 		        (CivilizationType,	ReligionType)
-- SELECT		Type,			('RELIGION_LUPWKA')
-- FROM Civilizations WHERE Type = 'CIVILIZATION_OXUS';
-- CREATE TRIGGER CivilizationTierOxus
-- AFTER INSERT ON Civilization_Religions WHEN 'CIVILIZATION_OXUS' = NEW.CivilizationType
-- BEGIN
-- 	UPDATE Civilization_Religions SET ReligionType =
-- 		( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_LUPWKA' )
-- 			THEN 'RELIGION_LUPWKA'
-- 			ELSE 'RELIGION_ZOROASTRIANISM' END
-- 		) WHERE CivilizationType = 'CIVILIZATION_OXUS';
-- END;
-- -- Ajdaha Yilan
-- DELETE FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_GT_VOLGA_BULGARIA';
-- INSERT INTO Civilization_Religions
-- 		        (CivilizationType,	ReligionType)
-- SELECT		Type,			('RELIGION_AJDAHA_YILAN')
-- FROM Civilizations WHERE Type = 'CIVILIZATION_GT_VOLGA_BULGARIA';
-- CREATE TRIGGER CivilizationTierVolgaBulgaria
-- AFTER INSERT ON Civilization_Religions WHEN 'CIVILIZATION_GT_VOLGA_BULGARIA' = NEW.CivilizationType
-- BEGIN
-- 	UPDATE Civilization_Religions SET ReligionType =
-- 		( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_AJDAHA_YILAN' )
-- 			THEN 'RELIGION_AJDAHA_YILAN'
-- 			ELSE 'RELIGION_ISLAM' END
-- 		) WHERE CivilizationType = 'CIVILIZATION_GT_VOLGA_BULGARIA';
-- END;
-- DELETE FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_ASQ_KAZAN';
-- INSERT INTO Civilization_Religions
-- 		        (CivilizationType,	ReligionType)
-- SELECT		Type,			('RELIGION_AJDAHA_YILAN')
-- FROM Civilizations WHERE Type = 'CIVILIZATION_ASQ_KAZAN';
-- CREATE TRIGGER CivilizationTierAsqKazan
-- AFTER INSERT ON Civilization_Religions WHEN 'CIVILIZATION_ASQ_KAZAN' = NEW.CivilizationType
-- BEGIN
-- 	UPDATE Civilization_Religions SET ReligionType =
-- 		( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_AJDAHA_YILAN' )
-- 			THEN 'RELIGION_AJDAHA_YILAN'
-- 			ELSE 'RELIGION_ISLAM' END
-- 		) WHERE CivilizationType = 'CIVILIZATION_ASQ_KAZAN';
-- END;
-- DELETE FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_KAZAN';
-- INSERT INTO Civilization_Religions
-- 		        (CivilizationType,	ReligionType)
-- SELECT		Type,			('RELIGION_AJDAHA_YILAN')
-- FROM Civilizations WHERE Type = 'CIVILIZATION_KAZAN';
-- CREATE TRIGGER CivilizationTierKazan
-- AFTER INSERT ON Civilization_Religions WHEN 'CIVILIZATION_KAZAN' = NEW.CivilizationType
-- BEGIN
-- 	UPDATE Civilization_Religions SET ReligionType =
-- 		( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_AJDAHA_YILAN' )
-- 			THEN 'RELIGION_AJDAHA_YILAN'
-- 			ELSE 'RELIGION_ISLAM' END
-- 		) WHERE CivilizationType = 'CIVILIZATION_KAZAN';
-- END;
-- DELETE FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_SIBIR';
-- INSERT INTO Civilization_Religions
-- 		        (CivilizationType,	ReligionType)
-- SELECT		Type,			('RELIGION_AJDAHA_YILAN')
-- FROM Civilizations WHERE Type = 'CIVILIZATION_SIBIR';
-- CREATE TRIGGER CivilizationTierSibir
-- AFTER INSERT ON Civilization_Religions WHEN 'CIVILIZATION_SIBIR' = NEW.CivilizationType
-- BEGIN
-- 	UPDATE Civilization_Religions SET ReligionType =
-- 		( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_AJDAHA_YILAN' )
-- 			THEN 'RELIGION_AJDAHA_YILAN'
-- 			ELSE 'RELIGION_ISLAM' END
-- 		) WHERE CivilizationType = 'CIVILIZATION_SIBIR';
-- END;
-- -- MAGUZANCI
-- DELETE FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_UW_NOK';
-- INSERT INTO Civilization_Religions
-- 		        (CivilizationType,	ReligionType)
-- SELECT		Type,			('RELIGION_MAGUZANCI')
-- FROM Civilizations WHERE Type = 'CIVILIZATION_UW_NOK';
-- CREATE TRIGGER CivilizationTierNok
-- AFTER INSERT ON Civilization_Religions WHEN 'CIVILIZATION_UW_NOK' = NEW.CivilizationType
-- BEGIN
-- 	UPDATE Civilization_Religions SET ReligionType =
-- 		( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_MAGUZANCI' )
-- 			THEN 'RELIGION_MAGUZANCI'
-- 			ELSE 'RELIGION_ISLAM' END
-- 		) WHERE CivilizationType = 'CIVILIZATION_UW_NOK';
-- END;
-- DELETE FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_THP_SOKOTO';
-- INSERT INTO Civilization_Religions
-- 		        (CivilizationType,	ReligionType)
-- SELECT		Type,			('RELIGION_MAGUZANCI')
-- FROM Civilizations WHERE Type = 'CIVILIZATION_THP_SOKOTO';
-- CREATE TRIGGER CivilizationTierSokoto
-- AFTER INSERT ON Civilization_Religions WHEN 'CIVILIZATION_THP_SOKOTO' = NEW.CivilizationType
-- BEGIN
-- 	UPDATE Civilization_Religions SET ReligionType =
-- 		( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_MAGUZANCI' )
-- 			THEN 'RELIGION_MAGUZANCI'
-- 			ELSE 'RELIGION_ISLAM' END
-- 		) WHERE CivilizationType = 'CIVILIZATION_THP_SOKOTO';
-- END;
-- -- Ak Jang
-- DELETE FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_VIV_ALTAIANS';
-- INSERT INTO Civilization_Religions
-- 		        (CivilizationType,	ReligionType)
-- SELECT		Type,			('RELIGION_AK_JANG')
-- FROM Civilizations WHERE Type = 'CIVILIZATION_VIV_ALTAIANS';
-- CREATE TRIGGER CivilizationTierGurkin
-- AFTER INSERT ON Civilization_Religions WHEN 'CIVILIZATION_VIV_ALTAIANS' = NEW.CivilizationType
-- BEGIN
-- 	UPDATE Civilization_Religions SET ReligionType =
-- 		( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_AK_JANG' )
-- 			THEN 'RELIGION_AK_JANG'
-- 			ELSE 'RELIGION_TENGRIISM' END
-- 		) WHERE CivilizationType = 'CIVILIZATION_VIV_ALTAIANS';
-- END;
-- -- Gardacvabela
-- DELETE FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_AMC_COLCHIS';
-- INSERT INTO Civilization_Religions
-- 		        (CivilizationType,	ReligionType)
-- SELECT		Type,			('RELIGION_GARDACVABELA')
-- FROM Civilizations WHERE Type = 'CIVILIZATION_AMC_COLCHIS';
-- CREATE TRIGGER CivilizationTierColchis
-- AFTER INSERT ON Civilization_Religions WHEN 'CIVILIZATION_AMC_COLCHIS' = NEW.CivilizationType
-- BEGIN
-- 	UPDATE Civilization_Religions SET ReligionType =
-- 		( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_GARDACVABELA' )
-- 			THEN 'RELIGION_GARDACVABELA'
-- 			ELSE 'RELIGION_CHRISTIANITY' END
-- 		) WHERE CivilizationType = 'CIVILIZATION_AMC_COLCHIS';
-- END;
-- DELETE FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_AW_KARTLI';
-- INSERT INTO Civilization_Religions
-- 		        (CivilizationType,	ReligionType)
-- SELECT		Type,			('RELIGION_GARDACVABELA')
-- FROM Civilizations WHERE Type = 'CIVILIZATION_AW_KARTLI';
-- CREATE TRIGGER CivilizationTierColchis
-- AFTER INSERT ON Civilization_Religions WHEN 'CIVILIZATION_AW_KARTLI' = NEW.CivilizationType
-- BEGIN
-- 	UPDATE Civilization_Religions SET ReligionType =
-- 		( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_GARDACVABELA' )
-- 			THEN 'RELIGION_GARDACVABELA'
-- 			ELSE 'RELIGION_CHRISTIANITY' END
-- 		) WHERE CivilizationType = 'CIVILIZATION_AW_KARTLI';
-- END;
--==========================================================================================================================
--==========================================================================================================================