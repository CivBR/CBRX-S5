--==========================================================================================================================
-- JFDLC
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
-- GOVERNMENTS
--------------------------------------------------------------------------------------------------------------------------	
--------------------------------------------------------------------------------------------------------------------------
-- Civilization_JFD_Governments
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Civilization_JFD_Governments
		(CivilizationType, 				GovernmentType,				Weight)
VALUES	('CIVILIZATION_SAS_XAVANTE', 	'GOVERNMENT_JFD_TRIBAL',	25),
		('CIVILIZATION_SAS_XAVANTE', 	'GOVERNMENT_JFD_MONARCHY',	25),
		('CIVILIZATION_SAS_XAVANTE', 	'GOVERNMENT_JFD_MILITARY',	25),
		('CIVILIZATION_SAS_XAVANTE', 	'GOVERNMENT_JFD_REPUBLIC',	25);
--------------------------------------------------------------------------------------------------------------------------
-- JFD'S CULTURAL DIVERSITY (31a31d1c-b9d7-45e1-842c-23232d66cd47)
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_CultureTypes(
	CivilizationType 					text 			default null,
	CultureType 						text			default null,
	SubCultureType 						text			default null,
	ArtDefineTag						text			default	null,
	DecisionsTag						text			default null,
	DefeatScreenEarlyTag				text			default	null,
	DefeatScreenMidTag					text			default	null,
	DefeatScreenLateTag					text			default	null,
	IdealsTag							text			default	null,
	SplashScreenTag						text			default	null,
	SoundtrackTag						text			default	null,
	UnitDialogueTag						text			default null);
INSERT INTO Civilization_JFD_CultureTypes
		(CivilizationType,				ArtDefineTag, CultureType,	SubCultureType, DecisionsTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag)
SELECT	'CIVILIZATION_SAS_XAVANTE',	ArtDefineTag, 'CULTURE_JFD_KATUJE',	null, 'JFD_Katuje', 'JFD_Katuje', 'JFD_Katuje', 'JFD_Katuje', 'AS2D_SOUND_JFD_TUPI'
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_AZTEC';
--==========================================================================================================================
-- Historical Religions
--==========================================================================================================================
INSERT INTO Civilization_Religions
        (CivilizationType,                      ReligionType)
VALUES  ('CIVILIZATION_SAS_XAVANTE',          CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_PAJELANCA' )
												THEN 'RELIGION_PAJELANCA'
												ELSE 'RELIGION_CHRISTIANITY' END);
												
CREATE TRIGGER IF NOT EXISTS C15_Sas_Xavante_Religion_Insert
AFTER INSERT ON Religions
WHEN NEW.Type = 'RELIGION_PAJELANCA'
BEGIN
	UPDATE Civilization_Religions
	SET ReligionType = NEW.Type
	WHERE CivilizationType = 'CIVILIZATION_SAS_XAVANTE';
END;