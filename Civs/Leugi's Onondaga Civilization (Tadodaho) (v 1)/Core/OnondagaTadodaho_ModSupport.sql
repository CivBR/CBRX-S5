--=======================================================================================================================
-- CIVILIZATIONS
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_JFD_ColonialCityNames
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilization_JFD_ColonialCityNames(CivilizationType, ColonyName, LinguisticType);
------------------------------------------------------------------------------------------------------------------------
-- Civilizations_YnAEMP
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMP(CivilizationType, MapPrefix, X, Y, CapitalName, AltX, AltY, AltCapitalName);
------------------------------------------------------------------------------------------------------------------------	
-- Civilizations_YnAEMPRequestedResources
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMPRequestedResources(CivilizationType, MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6);
INSERT INTO Civilizations_YnAEMPRequestedResources
		(CivilizationType,						MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6)
SELECT	'CIVILIZATION_LEU_ONONDAGA_TADODAHO',	MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6
FROM Civilizations_YnAEMPRequestedResources WHERE CivilizationType = 'CIVILIZATION_IROQUOIS';
------------------------------------------------------------------------------------------------------------------------
-- Civilization_EC_CultureTypes
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilization_JFD_CultureTypes(CivilizationType, CultureType, SubCultureType, ArtDefineTag, DecisionsTag, DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag,	SoundtrackTag, UnitDialogueTag);
INSERT INTO Civilization_JFD_CultureTypes
		(CivilizationType,						ArtDefineTag, CultureType, SubCultureType, DecisionsTag, DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag)
SELECT	'CIVILIZATION_LEU_ONONDAGA_TADODAHO',	ArtDefineTag, CultureType, SubCultureType, DecisionsTag, DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_IROQUOIS';
	
UPDATE Civilizations 
SET SoundtrackTag = (SELECT SoundtrackTag FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_IROQUOIS')
WHERE Type = 'CIVILIZATION_LEU_ONONDAGA_TADODAHO'
AND EXISTS (SELECT SoundID FROM Audio_Sounds WHERE SoundID = 'SND_EC_ABORIGINAL_PEACE_01');
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_EC_Governments
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilization_JFD_Governments(CivilizationType, GovernmentType, Weight);
INSERT INTO Civilization_JFD_Governments
		(CivilizationType, 						GovernmentType,				Weight)
VALUES	('CIVILIZATION_LEU_ONONDAGA_TADODAHO',	'GOVERNMENT_JFD_TRIBAL',	100);
------------------------------------------------------------------------------------------------------------------------	
-- HR
------------------------------------------------------------------------------------------------------------------------
-- INSERT OR REPLACE INTO FavoredReligions
           -- (LeaderType,                                       ReligionType)
-- SELECT   ('LEADER_LEU_ONONDAGA_TADODAHO'),                     ('RELIGION_OENDA')
-- WHERE EXISTS (SELECT * FROM Religions WHERE ReligionType = 'RELIGION_OENDA');
----------------------------------------------------------------------------------------------------------------------------
-- Civilization_Religions
----------------------------------------------------------------------------------------------------------------------------
UPDATE Civilization_Religions 
SET ReligionType = 'RELIGION_OENDA'
WHERE CivilizationType = 'LEADER_LEU_ONONDAGA_TADODAHO'
AND EXISTS (SELECT * FROM Religions WHERE Type = 'RELIGION_OENDA');
--=======================================================================================================================
--=======================================================================================================================

