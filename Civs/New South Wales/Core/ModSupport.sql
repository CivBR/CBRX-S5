--=======================================================================================================================
-- CIVILIZATIONS
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------
-- Civilizations_YnAEMP
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMP(CivilizationType, MapPrefix, X, Y, CapitalName, AltX, AltY, AltCapitalName);
INSERT INTO Civilizations_YnAEMP
		(CivilizationType,						MapPrefix,					X,		Y,		AltX,	AltY,	AltCapitalName)
VALUES	('CIVILIZATION_SENSHI_NEW_SOUTH_WALES',		'AustralasiaGiant',		89,		26,		null,	null,	null),
		('CIVILIZATION_SENSHI_NEW_SOUTH_WALES',		'Cordiform',			75,		9,		null,	null,	null),
		('CIVILIZATION_SENSHI_NEW_SOUTH_WALES',		'EarthMk3',				108,	11,		null,	null,	null),
		('CIVILIZATION_SENSHI_NEW_SOUTH_WALES',		'GreatestEarth',		102,	12,		null,	null,	null),
		('CIVILIZATION_SENSHI_NEW_SOUTH_WALES',		'Pacific',				50,		7,		null,	null,	null),
		('CIVILIZATION_SENSHI_NEW_SOUTH_WALES',		'SouthPacificGiant',	18,     21,		null,	null,	null),
		('CIVILIZATION_SENSHI_NEW_SOUTH_WALES',		'Yagem',				103,	11,		null,	null,	null),
		('CIVILIZATION_SENSHI_NEW_SOUTH_WALES',		'Yahem',				119,	13,		null,	null,	null);
------------------------------------------------------------------------------------------------------------------------	
-- Civilizations_YnAEMPRequestedResources
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMPRequestedResources(CivilizationType, MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6);
INSERT INTO Civilizations_YnAEMPRequestedResources
		(CivilizationType,					MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6)
SELECT	'CIVILIZATION_SENSHI_NEW_SOUTH_WALES',	MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6
FROM Civilizations_YnAEMPRequestedResources WHERE CivilizationType = 'CIVILIZATION_INCA';
------------------------------------------------------------------------------------------------------------------------
-- Civilization_JFD_CultureTypes
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilization_JFD_CultureTypes(CivilizationType, CultureType, SubCultureType, ArtDefineTag, DecisionsTag, DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag,	SoundtrackTag, UnitDialogueTag);
INSERT INTO Civilization_JFD_CultureTypes
		(CivilizationType,				ArtDefineTag,		CultureType, SubCultureType, DecisionsTag, DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag,	SoundtrackTag, UnitDialogueTag)
SELECT	'CIVILIZATION_SENSHI_NEW_SOUTH_WALES',	ArtDefineTag,		CultureType, SubCultureType, DecisionsTag, DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag,	SoundtrackTag, UnitDialogueTag
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_AMERICA';
	
UPDATE Civilizations 
SET SoundtrackTag = (SELECT SoundtrackTag FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_AMERICA')
WHERE Type = 'CIVILIZATION_SENSHI_NEW_SOUTH_WALES';
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_JFD_Governments
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilization_JFD_Governments(CivilizationType, GovernmentType, Weight);
INSERT INTO Civilization_JFD_Governments
		(CivilizationType, 						GovernmentType,				Weight)
VALUES	('CIVILIZATION_SENSHI_NEW_SOUTH_WALES',	'GOVERNMENT_JFD_MILITARY',	70);
--=======================================================================================================================
--=======================================================================================================================

