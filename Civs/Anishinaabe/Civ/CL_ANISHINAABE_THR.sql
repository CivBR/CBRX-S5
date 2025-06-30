--=====================================================================================
--Tomatekh's Historical Religions (Load after Anishinaabe.sql)
--=====================================================================================
UPDATE Civilization_Religions SET ReligionType = 
	( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type='RELIGION_MIDEWIWIN' )
		THEN 'RELIGION_MIDEWIWIN'
		ELSE 'RELIGION_CHRISTIANITY' END
	) WHERE CivilizationType = 'CIVILIZATION_CLANISHINAABE';

CREATE TRIGGER ReligionTomatekhGothsMod
AFTER INSERT ON Religions WHEN 'RELIGION_MIDEWIWIN' = NEW.Type
BEGIN
	UPDATE Civilization_Religions 
	SET ReligionType = 'RELIGION_MIDEWIWIN'
	WHERE CivilizationType IN ('CIVILIZATION_CLANISHINAABE');
END;
