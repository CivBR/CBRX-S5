--=======================================================================================================================
-- CIVILIZATIONS
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_JFD_ColonialCityNames
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilization_JFD_ColonialCityNames(CivilizationType, ColonyName, LinguisticType);
INSERT INTO Civilization_JFD_ColonialCityNames 
		(CivilizationType, 							LinguisticType)
SELECT	'CIVILIZATION_LUNG_KIPCHAKS',		LinguisticType
FROM Civilization_JFD_ColonialCityNames WHERE CivilizationType = 'CIVILIZATION_MOROCCO';
------------------------------------------------------------------------------------------------------------------------
-- Civilizations_YnAEMP
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMP(CivilizationType, MapPrefix, X, Y, CapitalName, AltX, AltY, AltCapitalName);
INSERT INTO Civilizations_YnAEMP
		(CivilizationType,							MapPrefix,				X,		Y,		AltX,	AltY,	AltCapitalName)
VALUES	('CIVILIZATION_LUNG_KIPCHAKS',		'AfriAsiaAust',			46,		65,		null,	null,	null),
		-- ('CIVILIZATION_LUNG_KIPCHAKS',	'AfricaLarge',			0,		0,		null,	null,	null),
		('CIVILIZATION_LUNG_KIPCHAKS',		'AfriSouthEuro',		57,		58,		null,	null,	null),
		-- ('CIVILIZATION_LUNG_KIPCHAKS',	'Americas',				0,		0,		null,	null,	null),
		-- ('CIVILIZATION_LUNG_KIPCHAKS',	'Asia',					0,		0,		null,	null,	null),
		('CIVILIZATION_LUNG_KIPCHAKS',		'Cordiform',			47,		20,		null,	null,	null),
		('CIVILIZATION_LUNG_KIPCHAKS',		'EarthMk3',				38,		49,		null,	null,	null),
		-- ('CIVILIZATION_LUNG_KIPCHAKS',	'EastAsia',				0,		0,		null,	null,	null),
		('CIVILIZATION_LUNG_KIPCHAKS',		'EuroLarge',			63,		16,		null,	null,	null),
		('CIVILIZATION_LUNG_KIPCHAKS',		'EuroLargeNew',			71,		7,		null,	null,	null),
		('CIVILIZATION_LUNG_KIPCHAKS',		'GreatestEarth',		63,		38,		null,	null,	null),
		-- ('CIVILIZATION_LUNG_KIPCHAKS',	'IndianOcean',			0,		0,		null,	null,	null),
		('CIVILIZATION_LUNG_KIPCHAKS',		'Mediterranean',		94,		16,		null,	null,	null),
		('CIVILIZATION_LUNG_KIPCHAKS',		'Mesopotamia',			38,		16,		null,	null,	null),
		-- ('CIVILIZATION_LUNG_KIPCHAKS',	'NorthAtlantic',		0,		0,		null,	null,	null),
		-- ('CIVILIZATION_LUNG_KIPCHAKS',	'NorthEastAsia',		0,		0,		null,	null,	null),
		-- ('CIVILIZATION_LUNG_KIPCHAKS',	'NorthWestEurope',		0,		0,		null,	null,	null),
		('CIVILIZATION_LUNG_KIPCHAKS',		'Orient',				43,		44,		null,	null,	null),
		-- ('CIVILIZATION_LUNG_KIPCHAKS',	'SouthPacific',			0,		0,		null,	null,	null),
		('CIVILIZATION_LUNG_KIPCHAKS',		'Yagem',				37,		50,		null,	null,	null),
		('CIVILIZATION_LUNG_KIPCHAKS',		'Yahem',				73,		48,		null,	null,	null);
------------------------------------------------------------------------------------------------------------------------	
-- Civilizations_YnAEMPRequestedResources
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMPRequestedResources(CivilizationType, MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6);
INSERT INTO Civilizations_YnAEMPRequestedResources
		(CivilizationType,							MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6)
SELECT	'CIVILIZATION_LUNG_KIPCHAKS',		MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6
FROM Civilizations_YnAEMPRequestedResources WHERE CivilizationType = 'CIVILIZATION_MOROCCO';
------------------------------------------------------------------------------------------------------------------------
-- Civilization_JFD_CultureTypes
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilization_JFD_CultureTypes(CivilizationType, CultureType, SubCultureType, ArtDefineTag, DecisionsTag, DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag,	SoundtrackTag, UnitDialogueTag);
INSERT INTO Civilization_JFD_CultureTypes
		(CivilizationType,							ArtDefineTag, CultureType, SubCultureType, DecisionsTag, DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag)
SELECT	'CIVILIZATION_LUNG_KIPCHAKS',		ArtDefineTag, CultureType, SubCultureType, DecisionsTag, DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_MOROCCO';
	
UPDATE Civilizations 
SET SoundtrackTag = (SELECT SoundtrackTag FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_LUNG_KIPCHAKS')
WHERE Type = 'CIVILIZATION_LUNG_KIPCHAKS'
AND EXISTS (SELECT SoundID FROM Audio_Sounds WHERE SoundID = 'SND_JFD_ABORIGINAL_PEACE_01');
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_JFD_Governments
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilization_JFD_Governments(CivilizationType, GovernmentType, Weight);
INSERT INTO Civilization_JFD_Governments
		(CivilizationType, 							GovernmentType,					Weight)
VALUES	('CIVILIZATION_LUNG_KIPCHAKS',		'GOVERNMENT_JFD_MONARCHY',		90);
--=======================================================================================================================
--=======================================================================================================================

