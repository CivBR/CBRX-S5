--CONFUCIANISM

--Shotoku (LS)

DELETE FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_LS_AJ_JAPAN';
INSERT INTO Civilization_Religions 
		        (CivilizationType,	ReligionType)
SELECT		Type,			('RELIGION_CONFUCIANISM')
FROM Civilizations WHERE Type = 'CIVILIZATION_LS_AJ_JAPAN'; 

CREATE TRIGGER CivilizationShotokuJaR
AFTER INSERT ON Civilization_Religions WHEN 'CIVILIZATION_LS_AJ_JAPAN' = NEW.CivilizationType
BEGIN
	UPDATE Civilization_Religions SET ReligionType = 
		( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_CONFUCIANISM' )
			THEN 'RELIGION_CONFUCIANISM'
			ELSE 'RELIGION_SHINTO' END 
		) WHERE CivilizationType = 'CIVILIZATION_LS_AJ_JAPAN';
END;

--JODO SHINSHU

--Ikko (RS)

DELETE FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_IKKOIKKI';
INSERT INTO Civilization_Religions 
		        (CivilizationType,	ReligionType)
SELECT		Type,			('RELIGION_JODO_SHINSHU_SM')
FROM Civilizations WHERE Type = 'CIVILIZATION_IKKOIKKI'; 

CREATE TRIGGER CivilizationIkkyJaR
AFTER INSERT ON Civilization_Religions WHEN 'CIVILIZATION_IKKOIKKI ' = NEW.CivilizationType
BEGIN
	UPDATE Civilization_Religions SET ReligionType = 
		( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_NICHIREN_SM' )
			THEN 'RELIGION_JODO_SHINSHU_SM'
			ELSE 'RELIGION_BUDDHISM' END
		) WHERE CivilizationType = 'CIVILIZATION_IKKOIKKI';
END;

--Tokaido (RS)

DELETE FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_TOKUGAWA';
INSERT INTO Civilization_Religions 
		        (CivilizationType,	ReligionType)
SELECT		Type,			('RELIGION_JODO_SHINSHU_SM')
FROM Civilizations WHERE Type = 'CIVILIZATION_TOKUGAWA'; 

CREATE TRIGGER CivilizationRSTokkyJaR
AFTER INSERT ON Civilization_Religions WHEN 'CIVILIZATION_TOKUGAWA ' = NEW.CivilizationType
BEGIN
	UPDATE Civilization_Religions SET ReligionType = 
		( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_SM_TOKUGAWA' )
			THEN 'RELIGION_JODO_SHINSHU_SM'
			ELSE 'RELIGION_BUDDHISM' END
		) WHERE CivilizationType = 'CIVILIZATION_TOKUGAWA';
END;

--KAMUI

--Ainu (LITE)

DELETE FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_LITE_AINU';
INSERT INTO Civilization_Religions 
		        (CivilizationType,	ReligionType)
SELECT		Type,			('RELIGION_KAMUI_SM')
FROM Civilizations WHERE Type = 'CIVILIZATION_LITE_AINU'; 


CREATE TRIGGER CivilizationLAinuJaR
AFTER INSERT ON Civilization_Religions WHEN 'CIVILIZATION_LITE_AINU ' = NEW.CivilizationType
BEGIN
	UPDATE Civilization_Religions SET ReligionType = 
		( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_KAMUI_SM' )
			THEN 'RELIGION_KAMUI_SM'
			ELSE 'RELIGION_SHINTO' END
		) WHERE CivilizationType = 'CIVILIZATION_LITE_AINU';
END;

--Emishi (Homu)

DELETE FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_SM_EMISHI';
INSERT INTO Civilization_Religions 
		        (CivilizationType,	ReligionType)
SELECT		Type,			('RELIGION_KAMUI_SM')
FROM Civilizations WHERE Type = 'CIVILIZATION_SM_EMISHI'; 


CREATE TRIGGER CivilizationEmishiJaR
AFTER INSERT ON Civilization_Religions WHEN 'CIVILIZATION_SM_EMISHI ' = NEW.CivilizationType
BEGIN
	UPDATE Civilization_Religions SET ReligionType = 
		( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_KAMUI_SM' )
			THEN 'RELIGION_KAMUI_SM'
			ELSE 'RELIGION_SHINTO' END
		) WHERE CivilizationType = 'CIVILIZATION_SM_EMISHI';
END;

--Jomon (Gedemo)

DELETE FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_JOMON';
INSERT INTO Civilization_Religions 
		        (CivilizationType,	ReligionType)
SELECT		Type,			('RELIGION_KAMUI_SM')
FROM Civilizations WHERE Type = 'CIVILIZATION_JOMON'; 

CREATE TRIGGER CivilizationJomonJaR
AFTER INSERT ON Civilization_Religions WHEN 'CIVILIZATION_JOMON ' = NEW.CivilizationType
BEGIN
	UPDATE Civilization_Religions SET ReligionType = 
		( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_KAMUI_SM' )
			THEN 'RELIGION_KAMUI_SM'
			ELSE 'RELIGION_SHINTO' END
		) WHERE CivilizationType = 'CIVILIZATION_JOMON';
END;

--KOSHINTO

--Jimmu (JFD)

DELETE FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_JFD_JAPAN_JIMMU';
INSERT INTO Civilization_Religions 
		        (CivilizationType,	ReligionType)
SELECT		Type,			('RELIGION_KOSHINTO_SM')
FROM Civilizations WHERE Type = 'CIVILIZATION_JFD_JAPAN_JIMMU'; 

CREATE TRIGGER CivilizationJFJimmyJaR
AFTER INSERT ON Civilization_Religions WHEN 'CIVILIZATION_JFD_JAPAN_JIMMU' = NEW.CivilizationType
BEGIN
	UPDATE Civilization_Religions SET ReligionType = 
		( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_KOSHINTO_SM' )
			THEN 'RELIGION_KOSHINTO_SM'
			ELSE 'RELIGION_SHINTO' END 
		) WHERE CivilizationType = 'CIVILIZATION_JFD_JAPAN_JIMMU';
END;

--Jimmu (LS)

DELETE FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_LS_JJ_JAPAN';
INSERT INTO Civilization_Religions 
		        (CivilizationType,	ReligionType)
SELECT		Type,			('RELIGION_KOSHINTO_SM')
FROM Civilizations WHERE Type = 'CIVILIZATION_LS_JJ_JAPAN'; 

CREATE TRIGGER CivilizationLSJimmyJaR
AFTER INSERT ON Civilization_Religions WHEN 'CIVILIZATION_LS_JJ_JAPAN' = NEW.CivilizationType
BEGIN
	UPDATE Civilization_Religions SET ReligionType = 
		( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_KOSHINTO_SM' )
			THEN 'RELIGION_KOSHINTO_SM'
			ELSE 'RELIGION_SHINTO' END 
		) WHERE CivilizationType = 'CIVILIZATION_LS_JJ_JAPAN';
END;

--NICHIREN

--North Kyushu (RS)

DELETE FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_KIYOMASA';
INSERT INTO Civilization_Religions 
		        (CivilizationType,	ReligionType)
SELECT		Type,			('RELIGION_NICHIREN_SM')
FROM Civilizations WHERE Type = 'CIVILIZATION_KIYOMASA'; 

CREATE TRIGGER CivilizationNorthKyushuJaR
AFTER INSERT ON Civilization_Religions WHEN 'CIVILIZATION_KIYOMASA ' = NEW.CivilizationType
BEGIN
	UPDATE Civilization_Religions SET ReligionType = 
		( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_NICHIREN_SM' )
			THEN 'RELIGION_NICHIREN_SM'
			ELSE 'RELIGION_BUDDHISM' END
		) WHERE CivilizationType = 'CIVILIZATION_KIYOMASA';
END;

--SHINGON

--East Shikoku (RS)

DELETE FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_MIYOSHI';
INSERT INTO Civilization_Religions 
		        (CivilizationType,	ReligionType)
SELECT		Type,			('RELIGION_SHINGON_SM')
FROM Civilizations WHERE Type = 'CIVILIZATION_MIYOSHI'; 

CREATE TRIGGER CivilizationEastShikokuJaR
AFTER INSERT ON Civilization_Religions WHEN 'CIVILIZATION_MIYOSHI ' = NEW.CivilizationType
BEGIN
	UPDATE Civilization_Religions SET ReligionType = 
		( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_SHINGON_SM' )
			THEN 'RELIGION_SHINGON_SM'
			ELSE 'RELIGION_BUDDHISM' END
		) WHERE CivilizationType = 'CIVILIZATION_MIYOSHI';
END;

--Shikoku (RS)

DELETE FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_TOSA';
INSERT INTO Civilization_Religions 
		        (CivilizationType,	ReligionType)
SELECT		Type,			('RELIGION_SHINGON_SM')
FROM Civilizations WHERE Type = 'CIVILIZATION_TOSA'; 

CREATE TRIGGER CivilizationOGShikokuJaR
AFTER INSERT ON Civilization_Religions WHEN 'CIVILIZATION_TOSA ' = NEW.CivilizationType
BEGIN
	UPDATE Civilization_Religions SET ReligionType = 
		( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_SHINGON_SM' )
			THEN 'RELIGION_SHINGON_SM'
			ELSE 'RELIGION_BUDDHISM' END
		) WHERE CivilizationType = 'CIVILIZATION_TOSA';
END;

--Shikoku (Homu)

DELETE FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_SM_TOSA';
INSERT INTO Civilization_Religions 
		        (CivilizationType,	ReligionType)
SELECT		Type,			('RELIGION_SHINGON_SM')
FROM Civilizations WHERE Type = 'CIVILIZATION_SM_TOSA'; 

CREATE TRIGGER CivilizationCBRXShikokuJaR
AFTER INSERT ON Civilization_Religions WHEN 'CIVILIZATION_SM_TOSA ' = NEW.CivilizationType
BEGIN
	UPDATE Civilization_Religions SET ReligionType = 
		( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_SHINGON_SM' )
			THEN 'RELIGION_SHINGON_SM'
			ELSE 'RELIGION_BUDDHISM' END
		) WHERE CivilizationType = 'CIVILIZATION_SM_TOSA';
END;

--Chosokabe (Relic)

DELETE FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_RELIC_CHOSOKABE';
INSERT INTO Civilization_Religions 
		        (CivilizationType,	ReligionType)
SELECT		Type,			('RELIGION_SHINGON_SM')
FROM Civilizations WHERE Type = 'CIVILIZATION_RELIC_CHOSOKABE'; 

CREATE TRIGGER CivilizationChosokabeJaR
AFTER INSERT ON Civilization_Religions WHEN 'CIVILIZATION_RELIC_CHOSOKABE ' = NEW.CivilizationType
BEGIN
	UPDATE Civilization_Religions SET ReligionType = 
		( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_SHINGON_SM' )
			THEN 'RELIGION_SHINGON_SM'
			ELSE 'RELIGION_BUDDHISM' END
		) WHERE CivilizationType = 'CIVILIZATION_RELIC_CHOSOKABE';
END;

--SHUGENDO

--Iga (Porkbean/Homu)

DELETE FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_IGA';
INSERT INTO Civilization_Religions 
		        (CivilizationType,	ReligionType)
SELECT		Type,			('RELIGION_SHUGENDO_SM')
FROM Civilizations WHERE Type = 'CIVILIZATION_IGA'; 

CREATE TRIGGER CivilizationIgaJaR
AFTER INSERT ON Civilization_Religions WHEN 'CIVILIZATION_IGA' = NEW.CivilizationType
BEGIN
	UPDATE Civilization_Religions SET ReligionType = 
		( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_SHUGENDO_SM' )
			THEN 'RELIGION_SHUGENDO_SM'
			ELSE 'RELIGION_SHINTO' END 
		) WHERE CivilizationType = 'CIVILIZATION_IGA';
END;

--STATE SHINTO

--Meiji (JFD)

DELETE FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_JFD_JAPAN_MEIJI';
INSERT INTO Civilization_Religions 
		        (CivilizationType,	ReligionType)
SELECT		Type,			('RELIGION_STATE_SHINTO_SM')
FROM Civilizations WHERE Type = 'CIVILIZATION_JFD_JAPAN_MEIJI'; 

CREATE TRIGGER CivilizationJFDMeijiJaR
AFTER INSERT ON Civilization_Religions WHEN 'CIVILIZATION_JFD_JAPAN_MEIJI' = NEW.CivilizationType
BEGIN
	UPDATE Civilization_Religions SET ReligionType = 
		( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_STATE_SHINTO_SM' )
			THEN 'RELIGION_STATE_SHINTO_SM'
			ELSE 'RELIGION_SHINTO' END 
		) WHERE CivilizationType = 'CIVILIZATION_JFD_JAPAN_MEIJI';
END;

--Meiji (LS)

DELETE FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_LS_MJ_JAPAN';
INSERT INTO Civilization_Religions 
		        (CivilizationType,	ReligionType)
SELECT		Type,			('RELIGION_STATE_SHINTO_SM')
FROM Civilizations WHERE Type = 'CIVILIZATION_LS_MJ_JAPAN'; 

CREATE TRIGGER CivilizationLSMeijiJaR
AFTER INSERT ON Civilization_Religions WHEN 'CIVILIZATION_LS_MJ_JAPAN' = NEW.CivilizationType
BEGIN
	UPDATE Civilization_Religions SET ReligionType = 
		( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_STATE_SHINTO_SM' )
			THEN 'RELIGION_STATE_SHINTO_SM'
			ELSE 'RELIGION_SHINTO' END 
		) WHERE CivilizationType = 'CIVILIZATION_LS_MJ_JAPAN';
END;

--Tojo (JFD)

DELETE FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_JFD_JAPAN_TOJO';
INSERT INTO Civilization_Religions 
		        (CivilizationType,	ReligionType)
SELECT		Type,			('RELIGION_STATE_SHINTO_SM')
FROM Civilizations WHERE Type = 'CIVILIZATION_JFD_JAPAN_TOJO'; 

CREATE TRIGGER CivilizationJFDTojoJaR
AFTER INSERT ON Civilization_Religions WHEN 'CIVILIZATION_JFD_JAPAN_TOJO' = NEW.CivilizationType
BEGIN
	UPDATE Civilization_Religions SET ReligionType = 
		( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_STATE_SHINTO_SM' )
			THEN 'RELIGION_STATE_SHINTO_SM'
			ELSE 'RELIGION_SHINTO' END 
		) WHERE CivilizationType = 'CIVILIZATION_JFD_JAPAN_TOJO';
END;

--Manchukuo (Homu)

DELETE FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_SM_MANCHUKUO';
INSERT INTO Civilization_Religions 
		        (CivilizationType,	ReligionType)
SELECT		Type,			('RELIGION_STATE_SHINTO_SM')
FROM Civilizations WHERE Type = 'CIVILIZATION_SM_MANCHUKUO'; 

CREATE TRIGGER CivilizationManchukuoJaR
AFTER INSERT ON Civilization_Religions WHEN 'CIVILIZATION_SM_MANCHUKUO' = NEW.CivilizationType
BEGIN
	UPDATE Civilization_Religions SET ReligionType = 
		( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_STATE_SHINTO_SM' )
			THEN 'RELIGION_STATE_SHINTO_SM'
			ELSE 'RELIGION_SHINTO' END 
		) WHERE CivilizationType = 'CIVILIZATION_SM_MANCHUKUO';
END;

--TENDAI

--Akechi (RS)

DELETE FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_AKECHI';
INSERT INTO Civilization_Religions 
		        (CivilizationType,	ReligionType)
SELECT		Type,			('RELIGION_TENDAI_SM')
FROM Civilizations WHERE Type = 'CIVILIZATION_AKECHI'; 

CREATE TRIGGER CivilizationAkechiJaR
AFTER INSERT ON Civilization_Religions WHEN 'CIVILIZATION_AKECHI ' = NEW.CivilizationType
BEGIN
	UPDATE Civilization_Religions SET ReligionType = 
		( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_TENDAI_SM' )
			THEN 'RELIGION_TENDAI_SM'
			ELSE 'RELIGION_BUDDHISM' END
		) WHERE CivilizationType = 'CIVILIZATION_AKECHI';
END;

--Kanmu (LS)

DELETE FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_LS_HJ_JAPAN';
INSERT INTO Civilization_Religions 
		        (CivilizationType,	ReligionType)
SELECT		Type,			('RELIGION_TENDAI_SM')
FROM Civilizations WHERE Type = 'CIVILIZATION_LS_HJ_JAPAN'; 

CREATE TRIGGER CivilizationKanmuJaR
AFTER INSERT ON Civilization_Religions WHEN 'CIVILIZATION_LS_HJ_JAPAN ' = NEW.CivilizationType
BEGIN
	UPDATE Civilization_Religions SET ReligionType = 
		( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_TENDAI_SM' )
			THEN 'RELIGION_TENDAI_SM'
			ELSE 'RELIGION_BUDDHISM' END
		) WHERE CivilizationType = 'CIVILIZATION_LS_HJ_JAPAN';
END;

--Tokugawa Ieyasu (LS)

DELETE FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_LS_TJ_JAPAN';
INSERT INTO Civilization_Religions 
		        (CivilizationType,	ReligionType)
SELECT		Type,			('RELIGION_TENDAI_SM')
FROM Civilizations WHERE Type = 'CIVILIZATION_LS_TJ_JAPAN'; 

CREATE TRIGGER CivilizationIeyasuJaR
AFTER INSERT ON Civilization_Religions WHEN 'CIVILIZATION_LS_TJ_JAPAN ' = NEW.CivilizationType
BEGIN
	UPDATE Civilization_Religions SET ReligionType = 
		( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_TENDAI_SM' )
			THEN 'RELIGION_TENDAI_SM'
			ELSE 'RELIGION_BUDDHISM' END
		) WHERE CivilizationType = 'CIVILIZATION_LS_TJ_JAPAN';
END;

--Tokugawa Yoshimune (Homu)

DELETE FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_SM_TYJAPAN';
INSERT INTO Civilization_Religions 
		        (CivilizationType,	ReligionType)
SELECT		Type,			('RELIGION_TENDAI_SM')
FROM Civilizations WHERE Type = 'CIVILIZATION_SM_TYJAPAN'; 

CREATE TRIGGER CivilizationTYoshimJaR
AFTER INSERT ON Civilization_Religions WHEN 'CIVILIZATION_SM_TYJAPAN ' = NEW.CivilizationType
BEGIN
	UPDATE Civilization_Religions SET ReligionType = 
		( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_TENDAI_SM' )
			THEN 'RELIGION_TENDAI_SM'
			ELSE 'RELIGION_BUDDHISM' END
		) WHERE CivilizationType = 'CIVILIZATION_SM_TYJAPAN';
END;

--Tokugawa Yoshinobu (ExplosiveWatermelon)

DELETE FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_EW_TOKUGAWA';
INSERT INTO Civilization_Religions 
		        (CivilizationType,	ReligionType)
SELECT		Type,			('RELIGION_TENDAI_SM')
FROM Civilizations WHERE Type = 'CIVILIZATION_EW_TOKUGAWA'; 

CREATE TRIGGER CivilizationYoshinobuJaR
AFTER INSERT ON Civilization_Religions WHEN 'CIVILIZATION_EW_TOKUGAWA ' = NEW.CivilizationType
BEGIN
	UPDATE Civilization_Religions SET ReligionType = 
		( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_TENDAI_SM' )
			THEN 'RELIGION_TENDAI_SM'
			ELSE 'RELIGION_BUDDHISM' END
		) WHERE CivilizationType = 'CIVILIZATION_EW_TOKUGAWA';
END;

--UTAKI

--Ryukyu (BOTH - apparently neither early 2010s me nor Hiram knew about modder tags)

DELETE FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_RYUKYU';
INSERT INTO Civilization_Religions 
		        (CivilizationType,	ReligionType)
SELECT		Type,			('RELIGION_UTAKI_SM')
FROM Civilizations WHERE Type = 'CIVILIZATION_RYUKYU'; 

CREATE TRIGGER CivilizationRyukyuHomuJaR
AFTER INSERT ON Civilization_Religions WHEN 'CIVILIZATION_RYUKYU' = NEW.CivilizationType
BEGIN
	UPDATE Civilization_Religions SET ReligionType = 
		( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_UTAKI_SM' )
			THEN 'RELIGION_UTAKI_SM'
			ELSE 'RELIGION_CONFUCIANISM' END 
		) WHERE CivilizationType = 'CIVILIZATION_RYUKYU';
END;

--YOSHIDA SHINTO

--Hideyoshi (GPuzzle)

DELETE FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_GPUZ_IMJI_JAPAN';
INSERT INTO Civilization_Religions 
		        (CivilizationType,	ReligionType)
SELECT		Type,			('RELIGION_YOSHIDA_SM')
FROM Civilizations WHERE Type = 'CIVILIZATION_GPUZ_IMJI_JAPAN'; 

CREATE TRIGGER CivilizationHideyoshiJaR
AFTER INSERT ON Civilization_Religions WHEN 'CIVILIZATION_GPUZ_IMJI_JAPAN' = NEW.CivilizationType
BEGIN
	UPDATE Civilization_Religions SET ReligionType = 
		( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_YOSHIDA_SM' )
			THEN 'RELIGION_YOSHIDA_SM'
			ELSE 'RELIGION_SHINTO' END 
		) WHERE CivilizationType = 'CIVILIZATION_GPUZ_IMJI_JAPAN';
END;

--Kansai (RS)

DELETE FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_HIDEYOSHI';
INSERT INTO Civilization_Religions 
		        (CivilizationType,	ReligionType)
SELECT		Type,			('RELIGION_YOSHIDA_SM')
FROM Civilizations WHERE Type = 'CIVILIZATION_HIDEYOSHI'; 

CREATE TRIGGER CivilizationKansaiJaR
AFTER INSERT ON Civilization_Religions WHEN 'CIVILIZATION_HIDEYOSHI' = NEW.CivilizationType
BEGIN
	UPDATE Civilization_Religions SET ReligionType = 
		( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_YOSHIDA_SM' )
			THEN 'RELIGION_YOSHIDA_SM'
			ELSE 'RELIGION_SHINTO' END 
		) WHERE CivilizationType = 'CIVILIZATION_HIDEYOSHI';
END;

--ZEN

--Hojo Tokimune (LS)

DELETE FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_LS_HOJO_JAPAN';
INSERT INTO Civilization_Religions 
		        (CivilizationType,	ReligionType)
SELECT		Type,			('RELIGION_ZEN_SM')
FROM Civilizations WHERE Type = 'CIVILIZATION_LS_HOJO_JAPAN'; 

CREATE TRIGGER CivilizationTokimuneJaR
AFTER INSERT ON Civilization_Religions WHEN 'CIVILIZATION_LS_HOJO_JAPAN ' = NEW.CivilizationType
BEGIN
	UPDATE Civilization_Religions SET ReligionType = 
		( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_ZEN_SM' )
			THEN 'RELIGION_ZEN_SM'
			ELSE 'RELIGION_SHINTO' END
		) WHERE CivilizationType = 'CIVILIZATION_LS_HOJO_JAPAN';
END;

--Ashikaga Takauji (LS)

DELETE FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_LS_ASJ_JAPAN';
INSERT INTO Civilization_Religions 
		        (CivilizationType,	ReligionType)
SELECT		Type,			('RELIGION_ZEN_SM')
FROM Civilizations WHERE Type = 'CIVILIZATION_LS_ASJ_JAPAN'; 

CREATE TRIGGER CivilizationTakaujiJaR
AFTER INSERT ON Civilization_Religions WHEN 'CIVILIZATION_LS_ASJ_JAPAN ' = NEW.CivilizationType
BEGIN
	UPDATE Civilization_Religions SET ReligionType = 
		( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_ZEN_SM' )
			THEN 'RELIGION_ZEN_SM'
			ELSE 'RELIGION_SHINTO' END
		) WHERE CivilizationType = 'CIVILIZATION_LS_ASJ_JAPAN';
END;

--Ashikaga Yoshimitsu (Senshi)

DELETE FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_SENSHI_ASHIKAGA';
INSERT INTO Civilization_Religions 
		        (CivilizationType,	ReligionType)
SELECT		Type,			('RELIGION_ZEN_SM')
FROM Civilizations WHERE Type = 'CIVILIZATION_SENSHI_ASHIKAGA'; 

CREATE TRIGGER CivilizationYoshimitsuJaR
AFTER INSERT ON Civilization_Religions WHEN 'CIVILIZATION_SENSHI_ASHIKAGA ' = NEW.CivilizationType
BEGIN
	UPDATE Civilization_Religions SET ReligionType = 
		( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_ZEN_SM' )
			THEN 'RELIGION_ZEN_SM'
			ELSE 'RELIGION_SHINTO' END
		) WHERE CivilizationType = 'CIVILIZATION_SENSHI_ASHIKAGA';
END;

--Chugoku (RS)

DELETE FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_MORI';
INSERT INTO Civilization_Religions 
		        (CivilizationType,	ReligionType)
SELECT		Type,			('RELIGION_ZEN_SM')
FROM Civilizations WHERE Type = 'CIVILIZATION_MORI'; 

CREATE TRIGGER CivilizationChugokuJaR
AFTER INSERT ON Civilization_Religions WHEN 'CIVILIZATION_MORI ' = NEW.CivilizationType
BEGIN
	UPDATE Civilization_Religions SET ReligionType = 
		( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_ZEN_SM' )
			THEN 'RELIGION_ZEN_SM'
			ELSE 'RELIGION_SHINTO' END
		) WHERE CivilizationType = 'CIVILIZATION_MORI';
END;

--Echigo (RS)

DELETE FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_UESUGI';
INSERT INTO Civilization_Religions 
		        (CivilizationType,	ReligionType)
SELECT		Type,			('RELIGION_ZEN_SM')
FROM Civilizations WHERE Type = 'CIVILIZATION_UESUGI'; 

CREATE TRIGGER CivilizationEchigoJaR
AFTER INSERT ON Civilization_Religions WHEN 'CIVILIZATION_UESUGI ' = NEW.CivilizationType
BEGIN
	UPDATE Civilization_Religions SET ReligionType = 
		( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_ZEN_SM' )
			THEN 'RELIGION_ZEN_SM'
			ELSE 'RELIGION_SHINTO' END
		) WHERE CivilizationType = 'CIVILIZATION_UESUGI';
END;

--Ezo (Porkbean)

DELETE FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_EZO';
INSERT INTO Civilization_Religions 
		        (CivilizationType,	ReligionType)
SELECT		Type,			('RELIGION_ZEN_SM')
FROM Civilizations WHERE Type = 'CIVILIZATION_EZO'; 

CREATE TRIGGER CivilizationEzoJaR
AFTER INSERT ON Civilization_Religions WHEN 'CIVILIZATION_EZO ' = NEW.CivilizationType
BEGIN
	UPDATE Civilization_Religions SET ReligionType = 
		( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_ZEN_SM' )
			THEN 'RELIGION_ZEN_SM'
			ELSE 'RELIGION_SHINTO' END
		) WHERE CivilizationType = 'CIVILIZATION_EZO';
END;

--Hokuriku (RS)

DELETE FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_MAEDA';
INSERT INTO Civilization_Religions 
		        (CivilizationType,	ReligionType)
SELECT		Type,			('RELIGION_ZEN_SM')
FROM Civilizations WHERE Type = 'CIVILIZATION_MAEDA'; 

CREATE TRIGGER CivilizationHokurikuJaR
AFTER INSERT ON Civilization_Religions WHEN 'CIVILIZATION_MAEDA ' = NEW.CivilizationType
BEGIN
	UPDATE Civilization_Religions SET ReligionType = 
		( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_ZEN_SM' )
			THEN 'RELIGION_ZEN_SM'
			ELSE 'RELIGION_SHINTO' END
		) WHERE CivilizationType = 'CIVILIZATION_MAEDA';
END;

--Kanto (RS)

DELETE FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_HOJO';
INSERT INTO Civilization_Religions 
		        (CivilizationType,	ReligionType)
SELECT		Type,			('RELIGION_ZEN_SM')
FROM Civilizations WHERE Type = 'CIVILIZATION_HOJO'; 

CREATE TRIGGER CivilizationUjiyasuJaR
AFTER INSERT ON Civilization_Religions WHEN 'CIVILIZATION_HOJO ' = NEW.CivilizationType
BEGIN
	UPDATE Civilization_Religions SET ReligionType = 
		( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_ZEN_SM' )
			THEN 'RELIGION_ZEN_SM'
			ELSE 'RELIGION_SHINTO' END
		) WHERE CivilizationType = 'CIVILIZATION_HOJO';
END;

--Shinshu (RS)

DELETE FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_TAKEDA';
INSERT INTO Civilization_Religions 
		        (CivilizationType,	ReligionType)
SELECT		Type,			('RELIGION_ZEN_SM')
FROM Civilizations WHERE Type = 'CIVILIZATION_TAKEDA'; 

CREATE TRIGGER CivilizationShinshuJaR
AFTER INSERT ON Civilization_Religions WHEN 'CIVILIZATION_TAKEDA ' = NEW.CivilizationType
BEGIN
	UPDATE Civilization_Religions SET ReligionType = 
		( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_ZEN_SM' )
			THEN 'RELIGION_ZEN_SM'
			ELSE 'RELIGION_SHINTO' END
		) WHERE CivilizationType = 'CIVILIZATION_TAKEDA';
END;

--South Kyushu (RS)

DELETE FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_SHIMAZU';
INSERT INTO Civilization_Religions 
		        (CivilizationType,	ReligionType)
SELECT		Type,			('RELIGION_ZEN_SM')
FROM Civilizations WHERE Type = 'CIVILIZATION_SHIMAZU'; 


CREATE TRIGGER CivilizationSouthKyushuJaR
AFTER INSERT ON Civilization_Religions WHEN 'CIVILIZATION_SHIMAZU ' = NEW.CivilizationType
BEGIN
	UPDATE Civilization_Religions SET ReligionType = 
		( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_ZEN_SM' )
			THEN 'RELIGION_ZEN_SM'
			ELSE 'RELIGION_SHINTO' END
		) WHERE CivilizationType = 'CIVILIZATION_SHIMAZU';
END;

--Tohoku (RS)

DELETE FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_SENDAI';
INSERT INTO Civilization_Religions 
		        (CivilizationType,	ReligionType)
SELECT		Type,			('RELIGION_ZEN_SM')
FROM Civilizations WHERE Type = 'CIVILIZATION_SENDAI'; 


CREATE TRIGGER CivilizationTohokuJaR
AFTER INSERT ON Civilization_Religions WHEN 'CIVILIZATION_SENDAI ' = NEW.CivilizationType
BEGIN
	UPDATE Civilization_Religions SET ReligionType = 
		( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_ZEN_SM' )
			THEN 'RELIGION_ZEN_SM'
			ELSE 'RELIGION_SHINTO' END
		) WHERE CivilizationType = 'CIVILIZATION_SENDAI';
END;