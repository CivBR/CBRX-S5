--=======================================================================================================================
-- CIVILIZATIONS
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------
-- Civilizations_YnAEMP
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMP(CivilizationType, MapPrefix, X, Y, CapitalName, AltX, AltY, AltCapitalName);
INSERT INTO Civilizations_YnAEMP
		(CivilizationType,							MapPrefix,				X,		Y,		AltX,	AltY,	AltCapitalName)
VALUES	('CIVILIZATION_NC_ZAZZAU',	'AfriAsiaAust',			24,		47,		null,	null,	null),
		('CIVILIZATION_NC_ZAZZAU',	'AfricaLarge',			23,		49,		null,	null,	null),
		('CIVILIZATION_NC_ZAZZAU',		'AfriSouthEuro',		35,		42,		null,	null,	null),
		-- ('CIVILIZATION_NC_ZAZZAU',	'Americas',				0,		0,		null,	null,	null),
		-- ('CIVILIZATION_NC_ZAZZAU',	'Apennine',				17,		50,		null,	null,	null),
		-- ('CIVILIZATION_NC_ZAZZAU',	'Asia',					0,		0,		null,	null,	null),
		-- ('CIVILIZATION_NC_ZAZZAU',	'BritishIsles',			0,		0,		null,	null,	null),
		-- ('CIVILIZATION_NC_ZAZZAU',	'Caribbean',			0,		0,		null,	null,	null),
		('CIVILIZATION_NC_ZAZZAU',		'Cordiform',			36,		14,		null,	null,	null),
		('CIVILIZATION_NC_ZAZZAU',		'EarthMk3',				22,		33,		null,	null,	null),
		-- ('CIVILIZATION_NC_ZAZZAU',	'EastAsia',				0,		0,		null,	null,	null),
		-- ('CIVILIZATION_NC_ZAZZAU',		'EuroLarge',			32,		36,		null,	null,	null),
		-- ('CIVILIZATION_NC_ZAZZAU',		'EuroLargeNew',			34,		29,		null,	null,	null),
		('CIVILIZATION_NC_ZAZZAU',		'GreatestEarth',		49,		25,		null,	null,	null),
		-- ('CIVILIZATION_NC_ZAZZAU',	'IndianOcean',			0,		0,		null,	null,	null),
		-- ('CIVILIZATION_NC_ZAZZAU',		'Mediterranean',		36,		50,		null,	null,	null),
		-- ('CIVILIZATION_NC_ZAZZAU',	'Mesopotamia',			0,		0,		null,	null,	null),
		('CIVILIZATION_NC_ZAZZAU',		'NorthAtlantic',		93,		23,		null,	null,	null),
		-- ('CIVILIZATION_NC_ZAZZAU',	'NorthEastAsia',		0,		0,		null,	null,	null),
		-- ('CIVILIZATION_NC_ZAZZAU',	'NorthWestEurope',		0,		0,		null,	null,	null),
		-- ('CIVILIZATION_NC_ZAZZAU',		'Orient',				7,		79,		null,	null,	null),
		-- ('CIVILIZATION_NC_ZAZZAU',	'SouthPacific',			0,		0,		null,	null,	null),
		('CIVILIZATION_NC_ZAZZAU',		'Yagem',				20,		38,		null,	null,	null),
		('CIVILIZATION_NC_ZAZZAU',		'Yahem',				62,		37,		null,	null,	null);
------------------------------------------------------------------------------------------------------------------------	
-- Civilizations_YnAEMPRequestedResources
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMPRequestedResources(CivilizationType, MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6);
INSERT INTO Civilizations_YnAEMPRequestedResources
		(CivilizationType,						MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6)
SELECT	'CIVILIZATION_NC_ZAZZAU',	MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6
FROM Civilizations_YnAEMPRequestedResources WHERE CivilizationType = 'CIVILIZATION_SONGHAI';
------------------------------------------------------------------------------------------------------------------------
-- Civilization_JFD_CultureTypes
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilization_JFD_CultureTypes(CivilizationType, CultureType, SubCultureType, ArtDefineTag, DecisionsTag, DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag,	SoundtrackTag, UnitDialogueTag);
INSERT INTO Civilization_JFD_CultureTypes
		(CivilizationType,						ArtDefineTag, CultureType, DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag)
SELECT	'CIVILIZATION_NC_ZAZZAU',	ArtDefineTag, CultureType, DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_SONGHAI';
	
UPDATE Civilizations 
SET SoundtrackTag = (SELECT SoundtrackTag FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_NC_ZAZZAU')
WHERE Type = 'CIVILIZATION_NC_ZAZZAU'
AND EXISTS (SELECT SoundID FROM Audio_Sounds WHERE SoundID = 'SND_JFD_ABORIGINAL_PEACE_01');
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_JFD_Governments
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilization_JFD_Governments(CivilizationType, GovernmentType, Weight);
INSERT INTO Civilization_JFD_Governments
		(CivilizationType, 						GovernmentType,				 Weight)
VALUES	('CIVILIZATION_NC_ZAZZAU',	'GOVERNMENT_JFD_MONARCHY',	 80);
--=======================================================================================================================
--=======================================================================================================================
