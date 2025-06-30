--=======================================================================
--ML_CivCultures (Hazel16's Map Labels)
--=======================================================================

CREATE TABLE IF NOT EXISTS
ML_CivCultures (
		ID INTEGER PRIMARY KEY AUTOINCREMENT,
		CivType TEXT,
		CultureType TEXT,
		CultureEra TEXT DEFAULT 'ANY');

INSERT INTO ML_CivCultures
	         (CivType,                  CultureType)
VALUES ('CIVILIZATION_CLANISHINAABE', 'CULTURE_GROUP_AMERICAN');
