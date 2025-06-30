--=======================================================================================================================
-- CIVILIZATIONS
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------
-- Civilizations_YnAEMP
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMP(CivilizationType, MapPrefix, X, Y, CapitalName, AltX, AltY, AltCapitalName);
INSERT INTO Civilizations_YnAEMP
		(CivilizationType,							MapPrefix,				X,		Y,		AltX,	AltY,	AltCapitalName)
VALUES	-- ('CIVILIZATION_NC_WASSOULOU',	'AfriAsiaAust',			0,		0,		null,	null,	null),
		-- ('CIVILIZATION_NC_WASSOULOU',	'AfricaLarge',			0,		0,		null,	null,	null),
		('CIVILIZATION_NC_WASSOULOU',		'AfriSouthEuro',		32,		74,		null,	null,	null),
		-- ('CIVILIZATION_NC_WASSOULOU',	'Americas',				0,		0,		null,	null,	null),
		-- ('CIVILIZATION_NC_WASSOULOU',	'Apennine',				17,		50,		null,	null,	null),
		-- ('CIVILIZATION_NC_WASSOULOU',	'Asia',					0,		0,		null,	null,	null),
		-- ('CIVILIZATION_NC_WASSOULOU',	'BritishIsles',			0,		0,		null,	null,	null),
		-- ('CIVILIZATION_NC_WASSOULOU',	'Caribbean',			0,		0,		null,	null,	null),
		('CIVILIZATION_NC_WASSOULOU',		'Cordiform',			35,		25,		null,	null,	null),
		('CIVILIZATION_NC_WASSOULOU',		'EarthMk3',				18,		56,		null,	null,	null),
		-- ('CIVILIZATION_NC_WASSOULOU',	'EastAsia',				0,		0,		null,	null,	null),
		('CIVILIZATION_NC_WASSOULOU',		'EuroLarge',			32,		36,		null,	null,	null),
		('CIVILIZATION_NC_WASSOULOU',		'EuroLargeNew',			34,		29,		null,	null,	null),
		('CIVILIZATION_NC_WASSOULOU',		'GreatestEarth',		53,		45,		null,	null,	null),
		-- ('CIVILIZATION_NC_WASSOULOU',	'IndianOcean',			0,		0,		null,	null,	null),
		('CIVILIZATION_NC_WASSOULOU',		'Mediterranean',		36,		50,		null,	null,	null),
		-- ('CIVILIZATION_NC_WASSOULOU',	'Mesopotamia',			0,		0,		null,	null,	null),
		('CIVILIZATION_NC_WASSOULOU',		'NorthAtlantic',		93,		23,		null,	null,	null),
		-- ('CIVILIZATION_NC_WASSOULOU',	'NorthEastAsia',		0,		0,		null,	null,	null),
		-- ('CIVILIZATION_NC_WASSOULOU',	'NorthWestEurope',		0,		0,		null,	null,	null),
		('CIVILIZATION_NC_WASSOULOU',		'Orient',				7,		79,		null,	null,	null),
		-- ('CIVILIZATION_NC_WASSOULOU',	'SouthPacific',			0,		0,		null,	null,	null),
		('CIVILIZATION_NC_WASSOULOU',		'Yagem',				18,		61,		null,	null,	null),
		('CIVILIZATION_NC_WASSOULOU',		'Yahem',				61,		56,		null,	null,	null);
------------------------------------------------------------------------------------------------------------------------	
-- Civilizations_YnAEMPRequestedResources
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMPRequestedResources(CivilizationType, MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6);
INSERT INTO Civilizations_YnAEMPRequestedResources
		(CivilizationType,						MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6)
SELECT	'CIVILIZATION_NC_WASSOULOU',	MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6
FROM Civilizations_YnAEMPRequestedResources WHERE CivilizationType = 'CIVILIZATION_VENICE';
------------------------------------------------------------------------------------------------------------------------
-- Civilization_JFD_CultureTypes
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilization_JFD_CultureTypes(CivilizationType, CultureType, SubCultureType, ArtDefineTag, DecisionsTag, DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag,	SoundtrackTag, UnitDialogueTag);
INSERT INTO Civilization_JFD_CultureTypes
		(CivilizationType,						ArtDefineTag, CultureType, DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag)
SELECT	'CIVILIZATION_NC_WASSOULOU',	ArtDefineTag, CultureType, DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_VENICE';
	
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
VALUES	('CIVILIZATION_NC_WASSOULOU',	'GOVERNMENT_JFD_REPUBLIC',	 80);
------------------------------------------------------------------------------------------------------------------------
-- MinorCivilizations_YnAEMP
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS MinorCivilizations_YnAEMP(MinorCivType, MapPrefix, X, Y, CapitalName, AltX, AltY, AltCapitalName);
DELETE FROM MinorCivilizations_YnAEMP WHERE MinorCivType = 'MINOR_CIV_GENOA';
INSERT INTO MinorCivilizations_YnAEMP
		( MinorCivType,				MapPrefix,				X,		Y,		AltX,	AltY,	AltCapitalName)
VALUES	('MINOR_CIV_GENOA',			'AfriAsiaAust',			29,		75,		null,	null,	null),
		-- ('MINOR_CIV_GENOA',		'AfricaLarge',			0,		0,		null,	null,	null),
		('MINOR_CIV_GENOA',			'AfriSouthEuro',		37,		67,		null,	null,	null),
		-- ('MINOR_CIV_GENOA',		'Americas',				0,		0,		null,	null,	null),
		('MINOR_CIV_GENOA',			'Apennine',				36,		26,		null,	null,	null),
		-- ('MINOR_CIV_GENOA',		'Asia',					0,		0,		null,	null,	null),
		-- ('MINOR_CIV_GENOA',		'BritishIsles',			0,		0,		null,	null,	null),
		-- ('MINOR_CIV_GENOA',		'Caribbean',			0,		0,		null,	null,	null),
		('MINOR_CIV_GENOA',			'Cordiform',			37,		23,		null,	null,	null),
		('MINOR_CIV_GENOA',			'EarthMk3',				24,		52,		null,	null,	null),
		-- ('MINOR_CIV_GENOA',		'EastAsia',				0,		0,		null,	null,	null),
		('MINOR_CIV_GENOA',			'EuroLarge',			38,		29,		null,	null,	null),
		('MINOR_CIV_GENOA',			'EuroLargeNew',			42,		20,		null,	null,	null),
		('MINOR_CIV_GENOA',			'GreatestEarth',		52,		40,		null,	null,	null),
		-- ('MINOR_CIV_GENOA',		'IndianOcean',			0,		0,		null,	null,	null),
		('MINOR_CIV_GENOA',			'Mediterranean',		48,		38,		null,	null,	null),
		-- ('MINOR_CIV_GENOA',		'Mesopotamia',			0,		0,		null,	null,	null),
		('MINOR_CIV_GENOA',			'NorthAtlantic',		101,	21,		null,	null,	null),
		-- ('MINOR_CIV_GENOA',		'NorthEastAsia',		0,		0,		null,	null,	null),
		-- ('MINOR_CIV_GENOA',		'NorthWestEurope',		0,		0,		null,	null,	null),
		('MINOR_CIV_GENOA',			'Orient',				13,		69,		null,	null,	null),
		-- ('MINOR_CIV_GENOA',		'SouthPacific',			0,		0,		null,	null,	null),
		('MINOR_CIV_GENOA',			'Yagem',				22,		57,		null,	null,	null),
		('MINOR_CIV_GENOA',			'Yahem',				62,		53,		null,	null,	null);
--=======================================================================================================================
--=======================================================================================================================
