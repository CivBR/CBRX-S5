--==========================================================================================================================
-- ART
--==========================================================================================================================
INSERT INTO IconTextureAtlases 
			(Atlas, 									IconSize, 						 Filename,      IconsPerRow, IconsPerColumn)
VALUES		('AUSTRALIAN_RELIGIONS_ATLAS', 					 256,     'AusRelAtlas256.dds',				4, 				4),
			('AUSTRALIAN_RELIGIONS_ATLAS', 					 214, 	  'AusRelAtlas214.dds',				4, 				4),
			('AUSTRALIAN_RELIGIONS_ATLAS', 					 128, 	  'AusRelAtlas128.dds',				4, 				4),
			('AUSTRALIAN_RELIGIONS_ATLAS', 					  80, 	   'AusRelAtlas80.dds',				4, 				4),
			('AUSTRALIAN_RELIGIONS_ATLAS', 					  64, 	   'AusRelAtlas64.dds',				4, 				4),
			('AUSTRALIAN_RELIGIONS_ATLAS', 					  48, 	   'AusRelAtlas48.dds',				4, 				4),
			('AUSTRALIAN_RELIGIONS_ATLAS', 					  32, 	   'AusRelAtlas32.dds',				4, 				4),
			('AUSTRALIAN_RELIGIONS_ATLAS', 					  24, 	   'AusRelAtlas24.dds',				4, 				4),
			('AUSTRALIAN_RELIGIONS_ATLAS', 					  16, 	   'AusRelAtlas16.dds',				4, 				4);

INSERT INTO IconFontTextures 
			(IconFontTexture, 											 IconFontTextureFile)
VALUES		('ICON_FONT_TEXTURE_AUSTRALIAN_RELIGIONS', 					 'AusRelFont');

INSERT INTO IconFontMapping 
			(IconName, 													IconFontTexture,	 IconMapping)
VALUES		('ICON_RELIGION_BURRUGUU_NGAYI_LI',			'ICON_FONT_TEXTURE_AUSTRALIAN_RELIGIONS',			1),
			('ICON_RELIGION_GUNYALUNGALUNG',		'ICON_FONT_TEXTURE_AUSTRALIAN_RELIGIONS',			2),
			('ICON_RELIGION_KALDOWINYERI',				'ICON_FONT_TEXTURE_AUSTRALIAN_RELIGIONS',			3),
			('ICON_RELIGION_MURAYMIN',			'ICON_FONT_TEXTURE_AUSTRALIAN_RELIGIONS',			4),
			('ICON_RELIGION_MURRUP_BIIK',			'ICON_FONT_TEXTURE_AUSTRALIAN_RELIGIONS',			5),
			('ICON_RELIGION_NGARRANGGARNI',			'ICON_FONT_TEXTURE_AUSTRALIAN_RELIGIONS',			6),
			('ICON_RELIGION_PENTECOSTALISM',			'ICON_FONT_TEXTURE_AUSTRALIAN_RELIGIONS',			16),
			('ICON_RELIGION_UNITING_CHURCH',				'ICON_FONT_TEXTURE_AUSTRALIAN_RELIGIONS',			15);
--==========================================================================================================================
-- RELIGIONS
--==========================================================================================================================
INSERT INTO Religions 
			(Type,												       	Description,								 Civilopedia,						IconAtlas,	 										PortraitIndex,		                                IconString)						   
VALUES	  	('RELIGION_BURRUGUU_NGAYI_LI',									'TXT_KEY_RELIGION_BURRUGUU_NGAYI_LI',			            'TXT_KEY_RELIGION_BURRUGUU_NGAYI_LI_PEDIA',		'AUSTRALIAN_RELIGIONS_ATLAS',			    			0,		  '[ICON_RELIGION_BURRUGUU_NGAYI_LI]'),
			('RELIGION_GUNYALUNGALUNG',										   'TXT_KEY_RELIGION_GUNYALUNGALUNG',			            'TXT_KEY_RELIGION_GUNYALUNGALUNG_PEDIA',		'AUSTRALIAN_RELIGIONS_ATLAS',			    					1,		  '[ICON_RELIGION_GUNYALUNGALUNG]'),
			('RELIGION_KALDOWINYERI',										   'TXT_KEY_RELIGION_KALDOWINYERI',			            'TXT_KEY_RELIGION_KALDOWINYERI_PEDIA',		'AUSTRALIAN_RELIGIONS_ATLAS',			    					2,		  '[ICON_RELIGION_KALDOWINYERI]'),
			('RELIGION_MURAYMIN',										   'TXT_KEY_RELIGION_MURAYMIN',			            'TXT_KEY_RELIGION_MURAYMIN_PEDIA',		'AUSTRALIAN_RELIGIONS_ATLAS',			    					3,		  '[ICON_RELIGION_MURAYMIN]'),
			('RELIGION_MURRUP_BIIK',										   'TXT_KEY_RELIGION_MURRUP_BIIK',			            'TXT_KEY_RELIGION_MURRUP_BIIK_PEDIA',		'AUSTRALIAN_RELIGIONS_ATLAS',			    	4,		  '[ICON_RELIGION_MURRUP_BIIK]'),
			('RELIGION_NGARRANGGARNI',										   'TXT_KEY_RELIGION_NGARRANGGARNI',			            'TXT_KEY_RELIGION_NGARRANGGARNI_PEDIA',		'AUSTRALIAN_RELIGIONS_ATLAS',			    			5,		  '[ICON_RELIGION_NGARRANGGARNI]'),
			('RELIGION_PENTECOSTALISM',										   'TXT_KEY_RELIGION_PENTECOSTALISM',			            'TXT_KEY_RELIGION_PENTECOSTALISM_PEDIA',		'AUSTRALIAN_RELIGIONS_ATLAS',			    15,		  '[ICON_RELIGION_PENTECOSTALISM]'),
			('RELIGION_UNITING_CHURCH',										   'TXT_KEY_RELIGION_UNITING_CHURCH',			            'TXT_KEY_RELIGION_UNITING_CHURCH_PEDIA',		'AUSTRALIAN_RELIGIONS_ATLAS',			   					14,		  '[ICON_RELIGION_UNITING_CHURCH]');
--==========================================================================================================================
-- PREFERENCES
--==========================================================================================================================
--Murri

DELETE FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_CL_MURRI';
INSERT INTO Civilization_Religions 
		        (CivilizationType,	ReligionType)
SELECT		Type,			('RELIGION_BURRUGUU_NGAYI_LI')
FROM Civilizations WHERE Type = 'CIVILIZATION_CL_MURRI'; 

UPDATE Civilization_Religions SET ReligionType = 
	( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_BURRUGUU_NGAYI_LI' )
		THEN 'RELIGION_BURRUGUU_NGAYI_LI'
		ELSE 'RELIGION_PROTESTANTISM' END
	) WHERE CivilizationType = 'CIVILIZATION_CL_MURRI';

CREATE TRIGGER CivilizationMurriAusRel
AFTER INSERT ON Civilization_Religions WHEN 'CIVILIZATION_CL_MURRI' = NEW.CivilizationType
BEGIN
	UPDATE Civilization_Religions SET ReligionType = 
		( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_BURRUGUU_NGAYI_LI' )
			THEN 'RELIGION_BURRUGUU_NGAYI_LI'
			ELSE 'RELIGION_PROTESTANTISM' END
		) WHERE CivilizationType = 'CIVILIZATION_CL_MURRI';
END;

--Eora

DELETE FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_EORA';
INSERT INTO Civilization_Religions 
		        (CivilizationType,	ReligionType)
SELECT		Type,			('RELIGION_GUNYALUNGALUNG')
FROM Civilizations WHERE Type = 'CIVILIZATION_EORA'; 


CREATE TRIGGER CivilizationEoraAusRel
AFTER INSERT ON Civilization_Religions WHEN 'CIVILIZATION_EORA' = NEW.CivilizationType
BEGIN
	UPDATE Civilization_Religions SET ReligionType = 
		( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_GUNYALUNGALUNG' )
			THEN 'RELIGION_GUNYALUNGALUNG'
			ELSE 'RELIGION_PROTESTANTISM' END
		) WHERE CivilizationType = 'CIVILIZATION_EORA';
END;

--Ngarrindjeri

DELETE FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_THP_NGARRINDJERI';
INSERT INTO Civilization_Religions 
		        (CivilizationType,	ReligionType)
SELECT		Type,			('RELIGION_KALDOWINYERI')
FROM Civilizations WHERE Type = 'CIVILIZATION_THP_NGARRINDJERI'; 


CREATE TRIGGER CivilizationNgarrindjeriAusRel
AFTER INSERT ON Civilization_Religions WHEN 'CIVILIZATION_THP_NGARRINDJERI' = NEW.CivilizationType
BEGIN
	UPDATE Civilization_Religions SET ReligionType = 
		( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_KALDOWINYERI' )
			THEN 'RELIGION_KALDOWINYERI'
			ELSE 'RELIGION_PROTESTANTISM' END
		) WHERE CivilizationType = 'CIVILIZATION_THP_NGARRINDJERI';
END;

--Wiradjuri/LStralia

DELETE FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_AUSTRALIA_LS_MOD';
INSERT INTO Civilization_Religions 
		        (CivilizationType,	ReligionType)
SELECT		Type,			('RELIGION_MURAYMIN')
FROM Civilizations WHERE Type = 'CIVILIZATION_AUSTRALIA_LS_MOD'; 

UPDATE Civilization_Religions SET ReligionType = 
	( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_MURAYMIN' )
		THEN 'RELIGION_MURAYMIN'
		ELSE 'RELIGION_PROTESTANTISM' END
	) WHERE CivilizationType = 'CIVILIZATION_AUSTRALIA_LS_MOD';

CREATE TRIGGER CivilizationWiradjuriAusRel
AFTER INSERT ON Civilization_Religions WHEN 'CIVILIZATION_AUSTRALIA_LS_MOD' = NEW.CivilizationType
BEGIN
	UPDATE Civilization_Religions SET ReligionType = 
		( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_MURAYMIN' )
			THEN 'RELIGION_MURAYMIN'
			ELSE 'RELIGION_PROTESTANTISM' END
		) WHERE CivilizationType = 'CIVILIZATION_AUSTRALIA_LS_MOD';
END;

--Kulin

DELETE FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_CL_KULIN';
INSERT INTO Civilization_Religions 
		        (CivilizationType,	ReligionType)
SELECT		Type,			('RELIGION_MURRUP_BIIK')
FROM Civilizations WHERE Type = 'CIVILIZATION_CL_KULIN'; 


CREATE TRIGGER CivilizationKulinAusRel
AFTER INSERT ON Civilization_Religions WHEN 'CIVILIZATION_CL_KULIN' = NEW.CivilizationType
BEGIN
	UPDATE Civilization_Religions SET ReligionType = 
		( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_MURRUP_BIIK' )
			THEN 'RELIGION_MURRUP_BIIK'
			ELSE 'RELIGION_PROTESTANTISM' END
		) WHERE CivilizationType = 'CIVILIZATION_CL_KULIN';
END;

--Kimberley

DELETE FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_CLKIMBERLEY';
INSERT INTO Civilization_Religions 
		        (CivilizationType,	ReligionType)
SELECT		Type,			('RELIGION_NGARRANGGARNI')
FROM Civilizations WHERE Type = 'CIVILIZATION_CLKIMBERLEY'; 


CREATE TRIGGER CivilizationKimberleyAusRel
AFTER INSERT ON Civilization_Religions WHEN 'CIVILIZATION_CLKIMBERLEY' = NEW.CivilizationType
BEGIN
	UPDATE Civilization_Religions SET ReligionType = 
		( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_NGARRANGGARNI' )
			THEN 'RELIGION_NGARRANGGARNI'
			ELSE 'RELIGION_PROTESTANTISM' END
		) WHERE CivilizationType = 'CIVILIZATION_CLKIMBERLEY';
END;

--Australia (Parkes)

DELETE FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_CL_AUSTRALIA';
INSERT INTO Civilization_Religions 
		        (CivilizationType,	ReligionType)
SELECT		Type,			('RELIGION_UNITING_CHURCH')
FROM Civilizations WHERE Type = 'CIVILIZATION_CL_AUSTRALIA'; 


CREATE TRIGGER CivilizationAusParkesAusRel
AFTER INSERT ON Civilization_Religions WHEN 'CIVILIZATION_CL_AUSTRALIA' = NEW.CivilizationType
BEGIN
	UPDATE Civilization_Religions SET ReligionType = 
		( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_UNITING_CHURCH' )
			THEN 'RELIGION_UNITING_CHURCH'
			ELSE ( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_PROTESTANT_CALVINISM' )
			THEN 'RELIGION_PROTESTANT_CALVINISM'
			ELSE 'RELIGION_PROTESTANTISM' END ) END
		) WHERE CivilizationType = 'CIVILIZATION_CL_AUSTRALIA';
END;
--==========================================================================================================================
--==========================================================================================================================
