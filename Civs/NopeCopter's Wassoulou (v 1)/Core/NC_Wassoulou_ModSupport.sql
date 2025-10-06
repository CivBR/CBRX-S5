--=======================================================================================================================
-- CIVILIZATIONS
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------
-- Civilizations_YnAEMP
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMP(CivilizationType, MapPrefix, X, Y, CapitalName, AltX, AltY, AltCapitalName);
INSERT INTO Civilizations_YnAEMP
		(CivilizationType,							MapPrefix,				X,		Y,		AltX,	AltY,	AltCapitalName)
VALUES	('CIVILIZATION_NC_WASSOULOU',	'AfriAsiaAust',			11,		44,		null,	null,	null),
		-- ('CIVILIZATION_NC_WASSOULOU',	'AfricaLarge',			0,		0,		null,	null,	null),
		-- ('CIVILIZATION_NC_WASSOULOU',		'AfriSouthEuro',		32,		74,		null,	null,	null),
		-- ('CIVILIZATION_NC_WASSOULOU',	'Americas',				0,		0,		null,	null,	null),
		-- ('CIVILIZATION_NC_WASSOULOU',	'Apennine',				17,		50,		null,	null,	null),
		-- ('CIVILIZATION_NC_WASSOULOU',	'Asia',					0,		0,		null,	null,	null),
		-- ('CIVILIZATION_NC_WASSOULOU',	'BritishIsles',			0,		0,		null,	null,	null),
		-- ('CIVILIZATION_NC_WASSOULOU',	'Caribbean',			0,		0,		null,	null,	null),
		-- ('CIVILIZATION_NC_WASSOULOU',		'Cordiform',			35,		25,		null,	null,	null),
		('CIVILIZATION_NC_WASSOULOU',		'EarthMk3',				11,		30,		null,	null,	null),
		-- ('CIVILIZATION_NC_WASSOULOU',	'EastAsia',				0,		0,		null,	null,	null),
		-- ('CIVILIZATION_NC_WASSOULOU',		'EuroLarge',			32,		36,		null,	null,	null),
		-- ('CIVILIZATION_NC_WASSOULOU',		'EuroLargeNew',			34,		29,		null,	null,	null),
		-- ('CIVILIZATION_NC_WASSOULOU',		'GreatestEarth',		53,		45,		null,	null,	null),
		-- ('CIVILIZATION_NC_WASSOULOU',	'IndianOcean',			0,		0,		null,	null,	null),
		-- ('CIVILIZATION_NC_WASSOULOU',		'Mediterranean',		36,		50,		null,	null,	null),
		-- ('CIVILIZATION_NC_WASSOULOU',	'Mesopotamia',			0,		0,		null,	null,	null),
		-- ('CIVILIZATION_NC_WASSOULOU',		'NorthAtlantic',		93,		23,		null,	null,	null),
		-- ('CIVILIZATION_NC_WASSOULOU',	'NorthEastAsia',		0,		0,		null,	null,	null),
		-- ('CIVILIZATION_NC_WASSOULOU',	'NorthWestEurope',		0,		0,		null,	null,	null),
		-- ('CIVILIZATION_NC_WASSOULOU',		'Orient',				7,		79,		null,	null,	null),
		-- ('CIVILIZATION_NC_WASSOULOU',	'SouthPacific',			0,		0,		null,	null,	null),
		('CIVILIZATION_NC_WASSOULOU',		'Yagem',				8,		35,		null,	null,	null),
		('CIVILIZATION_NC_WASSOULOU',		'Yahem',				54,		36,		null,	null,	null);
------------------------------------------------------------------------------------------------------------------------	
-- Civilizations_YnAEMPRequestedResources
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMPRequestedResources(CivilizationType, MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6);
INSERT INTO Civilizations_YnAEMPRequestedResources
		(CivilizationType,						MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6)
SELECT	'CIVILIZATION_NC_WASSOULOU',	MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6
FROM Civilizations_YnAEMPRequestedResources WHERE CivilizationType = 'CIVILIZATION_SONGHAI';
------------------------------------------------------------------------------------------------------------------------
-- Civilization_JFD_CultureTypes
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilization_JFD_CultureTypes(CivilizationType, CultureType, SubCultureType, ArtDefineTag, DecisionsTag, DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag,	SoundtrackTag, UnitDialogueTag);
INSERT INTO Civilization_JFD_CultureTypes
		(CivilizationType,						ArtDefineTag, CultureType, DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag)
SELECT	'CIVILIZATION_NC_WASSOULOU',	ArtDefineTag, CultureType, DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_SONGHAI';
	
UPDATE Civilizations 
SET SoundtrackTag = (SELECT SoundtrackTag FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_NC_WASSOULOU')
WHERE Type = 'CIVILIZATION_NC_WASSOULOU'
AND EXISTS (SELECT SoundID FROM Audio_Sounds WHERE SoundID = 'SND_JFD_ABORIGINAL_PEACE_01');
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_JFD_Governments
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilization_JFD_Governments(CivilizationType, GovernmentType, Weight);
INSERT INTO Civilization_JFD_Governments
		(CivilizationType, 						GovernmentType,				 Weight)
VALUES	('CIVILIZATION_NC_WASSOULOU',	'GOVERNMENT_JFD_MONARCHY',	 60);
--=======================================================================================================================
--=======================================================================================================================
