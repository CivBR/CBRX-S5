-- Ensure the table exists and correctly formatted
CREATE TABLE IF NOT EXISTS CustomModOptions (
	Name TEXT,
	Value INTEGER,
	Class INTEGER,
	DbUpdates INTEGER
);

-- Insert or replace into CustomModOptions
INSERT
OR REPLACE INTO CustomModOptions (Name, Value)
VALUES
	('API_EXTENSIONS', 1);

-- Create a trigger that fires after any INSERT on Civilization_Religions
-- This ensures we clean up unwanted default religions after the civilizations are loaded
CREATE TRIGGER IF NOT EXISTS CleanupDefaultReligions
AFTER INSERT ON Civilization_Religions
WHEN NEW.CivilizationType IN ('CIVILIZATION_CLANISHINAABE', 'CIVILIZATION_LEU_ONONDAGA_TADODAHO', 'CIVILIZATION_MC_RAPA_NUI')
	AND NEW.ReligionType IN ('RELIGION_CHRISTIANITY', 'RELIGION_PROTESTANTISM')
BEGIN
	DELETE FROM Civilization_Religions
	WHERE CivilizationType = NEW.CivilizationType
		AND ReligionType = NEW.ReligionType;
END;

DELETE FROM Civilization_Religions
WHERE EXISTS (
	SELECT 1 FROM Civilizations
	WHERE Type IN ('CIVILIZATION_CLANISHINAABE', 'CIVILIZATION_LEU_ONONDAGA_TADODAHO', 'CIVILIZATION_MC_RAPA_NUI')
)
AND CivilizationType IN (
	'CIVILIZATION_CLANISHINAABE',
	'CIVILIZATION_LEU_ONONDAGA_TADODAHO',
	'CIVILIZATION_MC_RAPA_NUI'
)
AND ReligionType IN (
	'RELIGION_CHRISTIANITY',
	'RELIGION_PROTESTANTISM'
);
