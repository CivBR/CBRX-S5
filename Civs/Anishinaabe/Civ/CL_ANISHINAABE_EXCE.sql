--=======================================================================
-- JFD's Exploration Continued Expanded
--=======================================================================
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_ColonialCityNames (
	CivilizationType 	text 	REFERENCES Civilizations(Type) 		default null,
	ColonyName 		text						default null,
	LinguisticType		text						default	null,
	CultureType		text						default	null);

INSERT OR REPLACE INTO Civilization_JFD_ColonialCityNames
			(CivilizationType, 		ColonyName,			   LinguisticType)
VALUES		('CIVILIZATION_CLANISHINAABE', 		null,			        'JFD_North_American'),
		('CIVILIZATION_CLANISHINAABE', 	 'TXT_KEY_COLONY_NAME_CLANISHINAABE_01',	null),
		('CIVILIZATION_CLANISHINAABE', 	 'TXT_KEY_COLONY_NAME_CLANISHINAABE_02',	null),
		('CIVILIZATION_CLANISHINAABE', 	 'TXT_KEY_COLONY_NAME_CLANISHINAABE_03',	null),
		('CIVILIZATION_CLANISHINAABE', 	 'TXT_KEY_COLONY_NAME_CLANISHINAABE_04',	null),
		('CIVILIZATION_CLANISHINAABE', 	 'TXT_KEY_COLONY_NAME_CLANISHINAABE_05',	null);

CREATE TABLE IF NOT EXISTS 
Civilization_JFD_RevolutionaryCivilizationsToSpawn (
	CivilizationType 		text 	REFERENCES Civilizations(Type) 		default null,
	RevolutionaryCivilizationType 	text 	REFERENCES Civilizations(Type) 		default null);
	
INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,		RevolutionaryCivilizationType)
VALUES		('CIVILIZATION_CLANISHINAABE',		'CIVILIZATION_IROQUOIS'),
		('CIVILIZATION_CLANISHINAABE',		'CIVILIZATION_SHOSHONE');

INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,		RevolutionaryCivilizationType)
SELECT		('CIVILIZATION_CLANISHINAABE'),		('CIVILIZATION_BLACKFOOTFIRSTNATION')
WHERE EXISTS (SELECT Type FROM Civilizations WHERE Type = 'CIVILIZATION_BLACKFOOTFIRSTNATION');

INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,		RevolutionaryCivilizationType)
SELECT		('CIVILIZATION_CLANISHINAABE'),		('CIVILIZATION_THECREEFIRSTNATION')
WHERE EXISTS (SELECT Type FROM Civilizations WHERE Type = 'CIVILIZATION_THECREEFIRSTNATION');
