--=======================================================================================================================
-- CIVILIZATIONS
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------
-- TOMATEKH'S HISTORICAL RELIGIONS COMPLETE/AUSTRALIAN RELIGIONS
------------------------------------------------------------------------------------------------------------------------
UPDATE Civilization_Religions SET ReligionType =
    ( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_NGARRANGGARNI' )
        THEN 'RELIGION_NGARRANGGARNI'
        ELSE ( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_TJUKURPA' )
        THEN 'RELIGION_TJUKURPA'
        ELSE 'RELIGION_PROTESTANTISM' END ) END
    ) WHERE CivilizationType = 'CIVILIZATION_SENSHI_BUNUBA';
------------------------------------------------------------------------------------------------------------------------
-- Civilizations_YnAEMP
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMP(CivilizationType, MapPrefix, X, Y, CapitalName, AltX, AltY, AltCapitalName);
INSERT INTO Civilizations_YnAEMP
		(CivilizationType,					MapPrefix,			X,		Y,		AltX,	AltY,	AltCapitalName)
VALUES	('CIVILIZATION_SENSHI_BUNUBA',		'AfriAsiaAust',		109,	21,		null,	null,	null),
		('CIVILIZATION_SENSHI_BUNUBA',		'AustralasiaGiant',	43,		56,		null,	null,	null),
		('CIVILIZATION_SENSHI_BUNUBA',		'Australia',		23,		56,		null,	null,	null),
		('CIVILIZATION_SENSHI_BUNUBA',		'Cordiform ',		69,		11,		null,	null,	null),
		('CIVILIZATION_SENSHI_BUNUBA',		'EarthMk3',			94,		22,		null,	null,	null),
		('CIVILIZATION_SENSHI_BUNUBA',		'GreatestEarth',	94,		16,		null,	null,	null),
		('CIVILIZATION_SENSHI_BUNUBA',		'IndianOcean',		94,		19,		null,	null,	null),
		('CIVILIZATION_SENSHI_BUNUBA',		'Pacific',			37,		17,		null,	null,	null),
		('CIVILIZATION_SENSHI_BUNUBA',		'Yagem',			88,		19,		null,	null,	null),
		('CIVILIZATION_SENSHI_BUNUBA',		'Yahem',			111,	22,		null,	null,	null);
------------------------------------------------------------------------------------------------------------------------	
-- Civilizations_YnAEMPRequestedResources
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMPRequestedResources(CivilizationType, MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6);
INSERT INTO Civilizations_YnAEMPRequestedResources
		(CivilizationType,					MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6)
SELECT	'CIVILIZATION_SENSHI_BUNUBA',	MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6
FROM Civilizations_YnAEMPRequestedResources WHERE CivilizationType = 'CIVILIZATION_POLYNESIA';
------------------------------------------------------------------------------------------------------------------------
-- Civilization_JFD_CultureTypes
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilization_JFD_CultureTypes(CivilizationType, CultureType, SubCultureType, ArtDefineTag, DecisionsTag, DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag,	SoundtrackTag, UnitDialogueTag);
INSERT INTO Civilization_JFD_CultureTypes
		(CivilizationType,				CultureType,				DecisionsTag,		IdealsTag,			SplashScreenTag, 	SoundtrackTag)
VALUES	('CIVILIZATION_SENSHI_BUNUBA',	'CULTURE_JFD_ABORIGINAL',	'JFD_Aboriginal',	'JFD_Aboriginal',	'JFD_Aboriginal',	'JFD_Aboriginal');
	
UPDATE Civilizations 
SET SoundtrackTag = (SELECT SoundtrackTag FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_SENSHI_BUNUBA')
WHERE Type = 'CIVILIZATION_SENSHI_BUNUBA'
AND EXISTS (SELECT SoundID FROM Audio_Sounds WHERE SoundID = 'SND_JFD_ABORIGINAL_PEACE_01');
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_JFD_Governments
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilization_JFD_Governments(CivilizationType, GovernmentType, Weight);
INSERT INTO Civilization_JFD_Governments
		(CivilizationType, 				GovernmentType,					Weight)
VALUES	('CIVILIZATION_SENSHI_BUNUBA',	'GOVERNMENT_JFD_TRIBAL',		80);
--=======================================================================================================================
--=======================================================================================================================

