--=======================================================================================================================
-- CIVILIZATIONS
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------
-- Civilizations_YnAEMP
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMP(CivilizationType, MapPrefix, X, Y, CapitalName, AltX, AltY, AltCapitalName);
INSERT INTO Civilizations_YnAEMP
		(CivilizationType, MapPrefix, X, Y, AltX, AltY, AltCapitalName)
SELECT	 CivilizationType, MapPrefix, X, Y, AltX, AltY, AltCapitalName
FROM Civilizations_YnAEMP WHERE CivilizationType = 'CIVILIZATION_ROME';
------------------------------------------------------------------------------------------------------------------------	
-- Civilizations_YnAEMPRequestedResources
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMPRequestedResources(CivilizationType, MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6);
INSERT INTO Civilizations_YnAEMPRequestedResources
		(CivilizationType,							MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6)
SELECT	'CIVILIZATION_JFD_PAPAL_STATES_JULIUS_II',	MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6
FROM Civilizations_YnAEMPRequestedResources WHERE CivilizationType = 'CIVILIZATION_ROME';
------------------------------------------------------------------------------------------------------------------------
-- Civilization_JFD_CultureTypes
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilization_JFD_CultureTypes(CivilizationType, CultureType, SubCultureType, ArtDefineTag, DecisionsTag, DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag,	SoundtrackTag, UnitDialogueTag);
INSERT INTO Civilization_JFD_CultureTypes
		(CivilizationType,							ArtDefineTag, CultureType, DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag)
SELECT	'CIVILIZATION_JFD_PAPAL_STATES_JULIUS_II',	ArtDefineTag, CultureType, DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_ROME';
	
UPDATE Civilizations 
SET SoundtrackTag = (SELECT SoundtrackTag FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_JFD_PAPAL_STATES_JULIUS_II')
WHERE Type = 'CIVILIZATION_JFD_PAPAL_STATES_JULIUS_II'
AND EXISTS (SELECT SoundID FROM Audio_Sounds WHERE SoundID = 'SND_JFD_ABORIGINAL_PEACE_01');
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_JFD_Governments
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilization_JFD_Governments(CivilizationType, GovernmentType, Weight);
INSERT INTO Civilization_JFD_Governments
		(CivilizationType, 							GovernmentType,			 Weight)
VALUES	('CIVILIZATION_JFD_PAPAL_STATES_JULIUS_II',	'GOVERNMENT_JFD_PAPACY', 100);
----------------------------------------------------------------------------------------------------------------------------
-- MinorCivilizations_YnAEMP
----------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS MinorCivilizations_YnAEMP(MinorCivType, MapPrefix, X, Y, CapitalName, AltX, AltY, AltCapitalName);
DELETE FROM MinorCivilizations_YnAEMP WHERE MinorCivType = 'MINOR_CIV_VATICAN_CITY';
INSERT INTO MinorCivilizations_YnAEMP
		( MinorCivType,					MapPrefix,				X,		Y,		AltX,	AltY,	AltCapitalName)
VALUES	('MINOR_CIV_VATICAN_CITY',		'AfriAsiaAust',			36,		70,		null,	null,	null),
		-- ('MINOR_CIV_VATICAN_CITY',	'AfricaLarge',			0,		0,		null,	null,	null),
		('MINOR_CIV_VATICAN_CITY',		'AfriSouthEuro',		46,		64,		null,	null,	null),
		-- ('MINOR_CIV_VATICAN_CITY',	'Americas',				0,		0,		null,	null,	null),
		-- ('MINOR_CIV_VATICAN_CITY',	'Apennine',				0,		0,		null,	null,	null),
		-- ('MINOR_CIV_VATICAN_CITY',	'Asia',					0,		0,		null,	null,	null),
		-- ('MINOR_CIV_VATICAN_CITY',	'BritishIsles',			0,		0,		null,	null,	null),
		-- ('MINOR_CIV_VATICAN_CITY',	'Caribbean',			0,		0,		null,	null,	null),
		('MINOR_CIV_VATICAN_CITY',		'Cordiform',			42,		22,		null,	null,	null),
		('MINOR_CIV_VATICAN_CITY',		'EarthMk3',				30,		50,		null,	null,	null),
		-- ('MINOR_CIV_VATICAN_CITY',	'EastAsia',				0,		0,		null,	null,	null),
		('MINOR_CIV_VATICAN_CITY',		'EuroLarge',			48,		23,		null,	null,	null),
		('MINOR_CIV_VATICAN_CITY',		'EuroLargeNew',			53,		13,		null,	null,	null),
		('MINOR_CIV_VATICAN_CITY',		'GreatestEarth',		57,		40,		null,	null,	null),
		-- ('MINOR_CIV_VATICAN_CITY',	'IndianOcean',			0,		0,		null,	null,	null),
		('MINOR_CIV_VATICAN_CITY',		'Mediterranean',		63,		28,		null,	null,	null),
		-- ('MINOR_CIV_VATICAN_CITY',	'Mesopotamia',			0,		0,		null,	null,	null),
		-- ('MINOR_CIV_VATICAN_CITY',	'NorthAtlantic',		0,		0,		null,	null,	null),
		-- ('MINOR_CIV_VATICAN_CITY',	'NorthEastAsia',		0,		0,		null,	null,	null),
		-- ('MINOR_CIV_VATICAN_CITY',	'NorthWestEurope',		0,		0,		null,	null,	null),
		('MINOR_CIV_VATICAN_CITY',		'Orient',				24,		58,		null,	null,	null),
		-- ('MINOR_CIV_VATICAN_CITY',	'SouthPacific',			0,		0,		null,	null,	null),
		('MINOR_CIV_VATICAN_CITY',		'Yagem',				28,		54,		null,	null,	null),
		('MINOR_CIV_VATICAN_CITY',		'Yahem',				67,		51,		null,	null,	null);
--=======================================================================================================================
--=======================================================================================================================
