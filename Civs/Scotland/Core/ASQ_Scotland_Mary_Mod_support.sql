--==========================================================================================================================
-- GEDEMON R.E.D.
--==========================================================================================================================
-- Civilizations
------------------------------	
UPDATE Civilizations 
SET ArtStyleSuffix = '_ENGLAND'
WHERE Type = 'CIVILIZATION_ASQ_SCOTLAND_MARY'
AND EXISTS (SELECT * FROM Civilizations WHERE ArtStyleSuffix = '_ENGLAND');

--==========================================================================================================================
-- CIVILIZATIONS
--==========================================================================================================================
----------------------------------------------------------------------------------------------------------------------------
-- Civilizations_YnAEMP
----------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMP(CivilizationType, MapPrefix, X, Y, CapitalName, AltX, AltY, AltCapitalName);
INSERT INTO Civilizations_YnAEMP
		(CivilizationType,							 MapPrefix,			X,		Y,		AltX,	AltY,	AltCapitalName)
VALUES	-- ('CIVILIZATION_ASQ_SCOTLAND_MARY',	 'AfriAsiaAust',	0,		0,		null,	null,	null),
		-- ('CIVILIZATION_ASQ_SCOTLAND_MARY',	 'AfricaLarge',		0,		0,		null,	null,	null),
		-- ('CIVILIZATION_ASQ_SCOTLAND_MARY',	 'AfriSouthEuro',	0,		0,		null,	null,	null),
		-- ('CIVILIZATION_ASQ_SCOTLAND_MARY',	 'Americas',		0,		0,		null,	null,	null),
		-- ('CIVILIZATION_ASQ_SCOTLAND_MARY',	 'Apennine',		0,		0,		null,	null,	null),
		-- ('CIVILIZATION_ASQ_SCOTLAND_MARY',	 'Asia',			0,		0,		null,	null,	null),
		('CIVILIZATION_ASQ_SCOTLAND_MARY',		 'BritishIsles',	32,		51,		null,	null,	null),
		-- ('CIVILIZATION_ASQ_SCOTLAND_MARY',	 'Caribbean',		0,		0,		null,	null,	null),
		('CIVILIZATION_ASQ_SCOTLAND_MARY',		 'Cordiform',		33,		36,		null,	null,	null),
		('CIVILIZATION_ASQ_SCOTLAND_MARY',		 'EarthMk3',		16,		78,		null,	null,	null),
		-- ('CIVILIZATION_ASQ_SCOTLAND_MARY',	 'EastAsia',		0,		0,		null,	null,	null),
		('CIVILIZATION_ASQ_SCOTLAND_MARY',		 'EuroLarge',		22,		56,		null,	null,	null),
		('CIVILIZATION_ASQ_SCOTLAND_MARY',		 'EuroLargeNew',	23,		57,		null,	null,	null),
		('CIVILIZATION_ASQ_SCOTLAND_MARY',		 'GreatestEarth',	38,		58,		null,	null,	null),
		-- ('CIVILIZATION_ASQ_SCOTLAND_MARY',	 'IndianOcean',		0,		0,		null,	null,	null),
		-- ('CIVILIZATION_ASQ_SCOTLAND_MARY',	 'Mediterranean',	0,		0,		null,	null,	null),
		-- ('CIVILIZATION_ASQ_SCOTLAND_MARY',	 'Mesopotamia',		0,		0,		null,	null,	null),
		('CIVILIZATION_ASQ_SCOTLAND_MARY',		 'NorthAtlantic',	79,		36,		null,	null,	null),
		-- ('CIVILIZATION_ASQ_SCOTLAND_MARY',	 'NorthEastAsia',	0,		0,		null,	null,	null),
		('CIVILIZATION_ASQ_SCOTLAND_MARY',		 'NorthWestEurope',	14,		31,		null,	null,	null),
		-- ('CIVILIZATION_ASQ_SCOTLAND_MARY',	 'Orient',			0,		0,		null,	null,	null),
		-- ('CIVILIZATION_ASQ_SCOTLAND_MARY',	 'SouthPacific',	0,		0,		null,	null,	null),
		('CIVILIZATION_ASQ_SCOTLAND_MARY',		 'Yagem',			9,		77,		null,	null,	null),
		('CIVILIZATION_ASQ_SCOTLAND_MARY',		 'Yahem',			55,		66,		null,	null,	null);
----------------------------------------------------------------------------------------------------------------------------	
-- Civilizations_YnAEMPRequestedResources
----------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMPRequestedResources(CivilizationType, MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6);
INSERT INTO Civilizations_YnAEMPRequestedResources
		(CivilizationType,						MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6)
SELECT	'CIVILIZATION_ASQ_SCOTLAND_MARY',	MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6
FROM Civilizations_YnAEMPRequestedResources WHERE CivilizationType = 'CIVILIZATION_CELTS';
----------------------------------------------------------------------------------------------------------------------------
-- Civilization_JFD_CultureTypes
----------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilization_JFD_CultureTypes(CivilizationType, CultureType, SubCultureType, ArtDefineTag, DecisionsTag, DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag,	SoundtrackTag, UnitDialogueTag);
INSERT INTO Civilization_JFD_CultureTypes
		(CivilizationType,						ArtDefineTag, CultureType, SubCultureType,	DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag)
SELECT	'CIVILIZATION_ASQ_SCOTLAND_MARY',	ArtDefineTag, CultureType, SubCultureType,	DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_CELTS';
	
UPDATE Civilizations 
SET SoundtrackTag = (SELECT SoundtrackTag FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_ASQ_SCOTLAND_MARY')
WHERE Type = 'CIVILIZATION_ASQ_SCOTLAND_MARY'
AND EXISTS (SELECT SoundID FROM Audio_Sounds WHERE SoundID = 'SND_JFD_ABORIGINAL_PEACE_01');

