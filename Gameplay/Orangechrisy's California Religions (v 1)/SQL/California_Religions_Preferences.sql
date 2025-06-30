--from Tomatekh's complete religions mod
--Mohave
DELETE FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_SAS_MOHAVE';
INSERT INTO Civilization_Religions 
		        (CivilizationType,	ReligionType)
SELECT		Type,			('RELIGION_CHRISTIANITY')
FROM Civilizations WHERE Type = 'CIVILIZATION_SAS_MOHAVE'; 

UPDATE Civilization_Religions SET ReligionType = 
	( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_DREAMING' )
		THEN 'RELIGION_DREAMING' 
		ELSE 'RELIGION_CHRISTIANITY' END
	) WHERE CivilizationType = 'CIVILIZATION_SAS_MOHAVE';

CREATE TRIGGER ORG_CaliReligionsSasMohave
AFTER INSERT ON Civilization_Religions WHEN 'CIVILIZATION_SAS_MOHAVE' = NEW.CivilizationType
BEGIN
	UPDATE Civilization_Religions SET ReligionType = 
		( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_DREAMING' )
			THEN 'RELIGION_DREAMING' 
			ELSE 'RELIGION_CHRISTIANITY' END
		) WHERE CivilizationType = 'CIVILIZATION_SAS_MOHAVE';
END;

--Kumeyaay
DELETE FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_RELIC_KUMEYAAY';
INSERT INTO Civilization_Religions 
		        (CivilizationType,	ReligionType)
SELECT		Type,			('RELIGION_CHRISTIANITY')
FROM Civilizations WHERE Type = 'CIVILIZATION_RELIC_KUMEYAAY'; 

UPDATE Civilization_Religions SET ReligionType = 
	( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_DREAMING' )
		THEN 'RELIGION_DREAMING'
		ELSE ( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_DATURA' )
		THEN 'RELIGION_DATURA'
		ELSE 'RELIGION_CHRISTIANITY' END ) END
	) WHERE CivilizationType = 'CIVILIZATION_RELIC_KUMEYAAY';

CREATE TRIGGER ORG_CaliReligionsRelicKumeyaay
AFTER INSERT ON Civilization_Religions WHEN 'CIVILIZATION_RELIC_KUMEYAAY' = NEW.CivilizationType
BEGIN
	UPDATE Civilization_Religions SET ReligionType = 
		( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_DREAMING' )
			THEN 'RELIGION_DREAMING'
			ELSE ( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_DATURA' )
			THEN 'RELIGION_DATURA'
			ELSE 'RELIGION_CHRISTIANITY' END ) END
		) WHERE CivilizationType = 'CIVILIZATION_RELIC_KUMEYAAY';
END;

--Payomkawichum
DELETE FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_SAS_PAYOMKAWICHUM';
INSERT INTO Civilization_Religions 
		        (CivilizationType,	ReligionType)
SELECT		Type,			('RELIGION_CHRISTIANITY')
FROM Civilizations WHERE Type = 'CIVILIZATION_SAS_PAYOMKAWICHUM'; 

UPDATE Civilization_Religions SET ReligionType = 
	( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_DATURA' )
		THEN 'RELIGION_DATURA' 
		ELSE 'RELIGION_CHRISTIANITY' END
	) WHERE CivilizationType = 'CIVILIZATION_SAS_PAYOMKAWICHUM';

CREATE TRIGGER ORG_CaliReligionsSasPayomkawichum
AFTER INSERT ON Civilization_Religions WHEN 'CIVILIZATION_SAS_PAYOMKAWICHUM' = NEW.CivilizationType
BEGIN
	UPDATE Civilization_Religions SET ReligionType = 
		( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_DATURA' )
			THEN 'RELIGION_DATURA' 
			ELSE 'RELIGION_CHRISTIANITY' END
		) WHERE CivilizationType = 'CIVILIZATION_SAS_PAYOMKAWICHUM';
END;

--Tongva (Sas)
DELETE FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_SAS_TONGVA';
INSERT INTO Civilization_Religions 
		        (CivilizationType,	ReligionType)
SELECT		Type,			('RELIGION_CHRISTIANITY')
FROM Civilizations WHERE Type = 'CIVILIZATION_SAS_TONGVA'; 

UPDATE Civilization_Religions SET ReligionType = 
	( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_DATURA' )
		THEN 'RELIGION_DATURA' 
		ELSE 'RELIGION_CHRISTIANITY' END
	) WHERE CivilizationType = 'CIVILIZATION_SAS_TONGVA';

CREATE TRIGGER ORG_CaliReligionsSasTongva
AFTER INSERT ON Civilization_Religions WHEN 'CIVILIZATION_SAS_TONGVA' = NEW.CivilizationType
BEGIN
	UPDATE Civilization_Religions SET ReligionType = 
		( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_DATURA' )
			THEN 'RELIGION_DATURA' 
			ELSE 'RELIGION_CHRISTIANITY' END
		) WHERE CivilizationType = 'CIVILIZATION_SAS_TONGVA';
END;

--Tongva (Clap)
DELETE FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_TONGVA';
INSERT INTO Civilization_Religions 
		        (CivilizationType,	ReligionType)
SELECT		Type,			('RELIGION_CHRISTIANITY')
FROM Civilizations WHERE Type = 'CIVILIZATION_TONGVA'; 

UPDATE Civilization_Religions SET ReligionType = 
	( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_DATURA' )
		THEN 'RELIGION_DATURA' 
		ELSE 'RELIGION_CHRISTIANITY' END
	) WHERE CivilizationType = 'CIVILIZATION_TONGVA';

CREATE TRIGGER ORG_CaliReligionsClapTongva
AFTER INSERT ON Civilization_Religions WHEN 'CIVILIZATION_TONGVA' = NEW.CivilizationType
BEGIN
	UPDATE Civilization_Religions SET ReligionType = 
		( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_DATURA' )
			THEN 'RELIGION_DATURA' 
			ELSE 'RELIGION_CHRISTIANITY' END
		) WHERE CivilizationType = 'CIVILIZATION_TONGVA';
END;

--Chumash
DELETE FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_ORG_CHUMASH';
INSERT INTO Civilization_Religions 
		        (CivilizationType,	ReligionType)
SELECT		Type,			('RELIGION_CHRISTIANITY')
FROM Civilizations WHERE Type = 'CIVILIZATION_ORG_CHUMASH'; 

UPDATE Civilization_Religions SET ReligionType = 
	( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_DATURA' )
		THEN 'RELIGION_DATURA' 
		ELSE 'RELIGION_CHRISTIANITY' END
	) WHERE CivilizationType = 'CIVILIZATION_ORG_CHUMASH';

CREATE TRIGGER ORG_CaliReligionsOrangeChumash
AFTER INSERT ON Civilization_Religions WHEN 'CIVILIZATION_ORG_CHUMASH' = NEW.CivilizationType
BEGIN
	UPDATE Civilization_Religions SET ReligionType = 
		( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_DATURA' )
			THEN 'RELIGION_DATURA' 
			ELSE 'RELIGION_CHRISTIANITY' END
		) WHERE CivilizationType = 'CIVILIZATION_ORG_CHUMASH';
END;

--Yokuts
DELETE FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_SAS_YOKUTS';
INSERT INTO Civilization_Religions 
		        (CivilizationType,	ReligionType)
SELECT		Type,			('RELIGION_CHRISTIANITY')
FROM Civilizations WHERE Type = 'CIVILIZATION_SAS_YOKUTS'; 

UPDATE Civilization_Religions SET ReligionType = 
	( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_DATURA' )
		THEN 'RELIGION_DATURA'
		ELSE ( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_KUKSU' )
		THEN 'RELIGION_KUKSU'
		ELSE 'RELIGION_CHRISTIANITY' END ) END
	) WHERE CivilizationType = 'CIVILIZATION_SAS_YOKUTS';

CREATE TRIGGER ORG_CaliReligionsSasYokuts
AFTER INSERT ON Civilization_Religions WHEN 'CIVILIZATION_SAS_YOKUTS' = NEW.CivilizationType
BEGIN
	UPDATE Civilization_Religions SET ReligionType = 
		( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_DATURA' )
			THEN 'RELIGION_DATURA'
			ELSE ( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_KUKSU' )
			THEN 'RELIGION_KUKSU'
			ELSE 'RELIGION_CHRISTIANITY' END ) END
		) WHERE CivilizationType = 'CIVILIZATION_SAS_YOKUTS';
END;

--Ohlone
DELETE FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_ORG_OHLONE';
INSERT INTO Civilization_Religions 
		        (CivilizationType,	ReligionType)
SELECT		Type,			('RELIGION_CHRISTIANITY')
FROM Civilizations WHERE Type = 'CIVILIZATION_ORG_OHLONE'; 

UPDATE Civilization_Religions SET ReligionType = 
	( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_KUKSU' )
		THEN 'RELIGION_KUKSU' 
		ELSE 'RELIGION_CHRISTIANITY' END
	) WHERE CivilizationType = 'CIVILIZATION_ORG_OHLONE';

CREATE TRIGGER ORG_CaliReligionsOrangeOhlone
AFTER INSERT ON Civilization_Religions WHEN 'CIVILIZATION_ORG_OHLONE' = NEW.CivilizationType
BEGIN
	UPDATE Civilization_Religions SET ReligionType = 
		( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_KUKSU' )
			THEN 'RELIGION_KUKSU' 
			ELSE 'RELIGION_CHRISTIANITY' END
		) WHERE CivilizationType = 'CIVILIZATION_ORG_OHLONE';
END;

--Pomo (the BC version that was posted on cfc but never finished. please just use the reworked one me and coiot made instead)
DELETE FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_CBR_POMO';
INSERT INTO Civilization_Religions 
		        (CivilizationType,	ReligionType)
SELECT		Type,			('RELIGION_CHRISTIANITY')
FROM Civilizations WHERE Type = 'CIVILIZATION_CBR_POMO'; 

UPDATE Civilization_Religions SET ReligionType = 
	( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_KUKSU' )
		THEN 'RELIGION_KUKSU'
		ELSE ( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_BOLE_MARU' )
		THEN 'RELIGION_BOLE_MARU'
		ELSE 'RELIGION_CHRISTIANITY' END ) END
	) WHERE CivilizationType = 'CIVILIZATION_CBR_POMO';

CREATE TRIGGER ORG_CaliReligionsCBRPomo
AFTER INSERT ON Civilization_Religions WHEN 'CIVILIZATION_CBR_POMO' = NEW.CivilizationType
BEGIN
	UPDATE Civilization_Religions SET ReligionType = 
		( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_KUKSU' )
			THEN 'RELIGION_KUKSU'
			ELSE ( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_BOLE_MARU' )
			THEN 'RELIGION_BOLE_MARU'
			ELSE 'RELIGION_CHRISTIANITY' END ) END
		) WHERE CivilizationType = 'CIVILIZATION_CBR_POMO';
END;

--Modoc
DELETE FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_SAS_MODOC';
INSERT INTO Civilization_Religions 
		        (CivilizationType,	ReligionType)
SELECT		Type,			('RELIGION_CHRISTIANITY')
FROM Civilizations WHERE Type = 'CIVILIZATION_SAS_MODOC'; 

UPDATE Civilization_Religions SET ReligionType = 
	( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_WAASHAT' )
		THEN 'RELIGION_WAASHAT'
		ELSE ( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_BOLE_MARU' )
		THEN 'RELIGION_BOLE_MARU'
		ELSE 'RELIGION_CHRISTIANITY' END ) END
	) WHERE CivilizationType = 'CIVILIZATION_SAS_MODOC';

CREATE TRIGGER ORG_CaliReligionsSasModoc
AFTER INSERT ON Civilization_Religions WHEN 'CIVILIZATION_SAS_MODOC' = NEW.CivilizationType
BEGIN
	UPDATE Civilization_Religions SET ReligionType = 
		( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_WAASHAT' )
			THEN 'RELIGION_WAASHAT'
			ELSE ( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_BOLE_MARU' )
			THEN 'RELIGION_BOLE_MARU'
			ELSE 'RELIGION_CHRISTIANITY' END ) END
		) WHERE CivilizationType = 'CIVILIZATION_SAS_MODOC';
END;

--Chinook
DELETE FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_MC_CHINOOK';
INSERT INTO Civilization_Religions 
		        (CivilizationType,	ReligionType)
SELECT		Type,			('RELIGION_CHRISTIANITY')
FROM Civilizations WHERE Type = 'CIVILIZATION_MC_CHINOOK'; 

UPDATE Civilization_Religions SET ReligionType = 
	( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_WAASHAT' )
		THEN 'RELIGION_WAASHAT' 
		ELSE 'RELIGION_CHRISTIANITY' END
	) WHERE CivilizationType = 'CIVILIZATION_MC_CHINOOK';

CREATE TRIGGER ORG_CaliReligionsSukritactChinook
AFTER INSERT ON Civilization_Religions WHEN 'CIVILIZATION_MC_CHINOOK' = NEW.CivilizationType
BEGIN
	UPDATE Civilization_Religions SET ReligionType = 
		( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_WAASHAT' )
			THEN 'RELIGION_WAASHAT' 
			ELSE 'RELIGION_CHRISTIANITY' END
		) WHERE CivilizationType = 'CIVILIZATION_MC_CHINOOK';
END;

--Coast Salish
DELETE FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_CLCOASTSALISH';
INSERT INTO Civilization_Religions 
		        (CivilizationType,	ReligionType)
SELECT		Type,			('RELIGION_CHRISTIANITY')
FROM Civilizations WHERE Type = 'CIVILIZATION_CLCOASTSALISH'; 

UPDATE Civilization_Religions SET ReligionType = 
	( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_SGAANAANG' )
		THEN 'RELIGION_SGAANAANG'
		ELSE ( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_WAASHAT' )
		THEN 'RELIGION_WAASHAT'
		ELSE 'RELIGION_CHRISTIANITY' END ) END
	) WHERE CivilizationType = 'CIVILIZATION_CLCOASTSALISH';

CREATE TRIGGER ORG_CaliReligionsCLCoastSalish
AFTER INSERT ON Civilization_Religions WHEN 'CIVILIZATION_CLCOASTSALISH' = NEW.CivilizationType
BEGIN
	UPDATE Civilization_Religions SET ReligionType = 
		( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_SGAANAANG' )
			THEN 'RELIGION_SGAANAANG'
			ELSE ( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_WAASHAT' )
			THEN 'RELIGION_WAASHAT'
			ELSE 'RELIGION_CHRISTIANITY' END ) END
		) WHERE CivilizationType = 'CIVILIZATION_CLCOASTSALISH';
END;