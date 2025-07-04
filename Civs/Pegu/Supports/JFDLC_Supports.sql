--==========================================================================================================================
-- STANDARD MOD SUPPORT
--==========================================================================================================================
--UPDATED for Pegu on 31 Jan 2020

--As of June 9 2019, the standard mod support structure has changed. Please see immediately below for the new standard featured 
--in my civ mods and see https://drive.google.com/file/d/1uzqjOHiPOXmQHWMCSsuCKiImA6fQXB_X/view?usp=sharing for the old support structure.

--The following mod supports have been dropped:
---JFDLC Titles; to be replaced with Culture-specific Titles.
---JFDLC Inventions; to be replaced with Culture-wide preferences.
---JFDLC Construction Audios. These will remain defaulted to Building Class.
---Decisions; to be replaced with Culture-specific Decisions.
---Map Labels, Civ IV Traits, R.E.D., and Ethnic Units; to be replaced with Culture-wide supports.

--The following mod supports have been preserved:
---Cultural Diversity. This is the most important one to support (at a minimum, the Culture Type) because other supports will draw from it.
---YnAEMP v25. Recommend only bother with AltXY/AltCapital when your civ's Capital is the exact same as another's (e.g. Byzantium and Constantinople).
---JFDLC Leader Flavours.
---Colony names (where applicable). Linguistic type should be omitted.

--Please note these are the STANDARD mod supports, that is, they are supported by every custom civ.
--This list does not include mod support for mods like Enlightenment Era. The support required for these are case-sensitive.

--Please also note that I maintain NO GUARANTEES that the old support structures for my mods will remain valid. 
--If you choose to support things like JFDLC Titles, they may not function with the latest version of the JFDLC mod that uses them.
--It is HIGHLY RECOMMENDED you leave support to me (that is, to CulDiv) and follow only this template for JFDLC supports.
--Former methods for supporting JFDLC Titles and Inventions are particularly at risk of becoming obsolete. Construction audios less so.
--Supporting anything not JFDLC-related is up to however you see fit.
--------------------------------------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------------------------------------------
--==========================================================================================================================
-- MASTER TABLES
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
--Below are the tables required for standard mod support.

CREATE TABLE IF NOT EXISTS COMMUNITY (Type TEXT, Value INTEGER);
CREATE TABLE IF NOT EXISTS Civilization_JFD_ColonialCityNames(CivilizationType text, ColonyName text, LinguisticType text);
CREATE TABLE IF NOT EXISTS Civilization_JFD_Governments(CivilizationType text, CultureType text, LegislatureName text, OfficeTitle text, GovernmentType text, Weight integer);
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMP(CivilizationType, MapPrefix, X, Y, CapitalName, AltX, AltY, AltCapitalName);
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMPRequestedResources(CivilizationType, MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6);
CREATE TABLE IF NOT EXISTS MinorCivilizations_YnAEMP(MinorCivType, MapPrefix, X, Y, CapitalName, AltX, AltY, AltCapitalName);
CREATE TABLE IF NOT EXISTS JFD_Civilopedia_HideFromPedia(Type text);
CREATE TABLE IF NOT EXISTS JFD_GlobalUserSettings(Type text, Value integer default 1);
--------------------------------------------------------------------------------------------------------------------------
--==========================================================================================================================
-- GEDEMON's YNAEMP (+JFD's v23 / 24 / 25)
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
/*
Map Prefixes:
   
v22
	Cordiform 
    GreatestEarth 
    Yagem
    Yahem 
     
v23
    Asia 
    EastAsia 
    Pacific
v24
    AfriAsiaAust
    AsiaSmall 
    AustralasiaGiant 
    IndiaGiant 
    SouthAsiaHuge 
    IndianOcean 
v25
    EarthMk3
    India 
    Indonesia 
*/

INSERT INTO Civilizations_YnAEMP
		(CivilizationType,			MapPrefix,			X,	Y,		AltX,	AltY,	AltCapitalName)
VALUES	('CIVILIZATION_ER_PEGU',	'Cordiform',		63,	24,		null,	null,	null),
		('CIVILIZATION_ER_PEGU',	'GreatestEarth',	82,	37,		null,	null,	null),
		('CIVILIZATION_ER_PEGU',	'Yagem',			73,	42,		null,	null,	null),
		('CIVILIZATION_ER_PEGU',	'Yahem',			98,	39,		null,	null,	null),
		('CIVILIZATION_ER_PEGU',	'Asia',				50,	24,		null,	null,	null),
		('CIVILIZATION_ER_PEGU',	'EastAsia',			20,	37,		null,	null,	null),
		('CIVILIZATION_ER_PEGU',	'Pacific',			21,	43,		null,	null,	null),
		('CIVILIZATION_ER_PEGU',	'AfriAsiaAust',		90,	51,		null,	null,	null),
		('CIVILIZATION_ER_PEGU',	'AsiaSmall',		3,	10,		null,	null,	null),
		('CIVILIZATION_ER_PEGU',	'AustralasiaGiant',	2,	129,	null,	null,	null),
		('CIVILIZATION_ER_PEGU',	'InidaGiant',		109,46,		null,	null,	null),
		('CIVILIZATION_ER_PEGU',	'SouthAsiaHuge',	87,	48,		null,	null,	null),
		('CIVILIZATION_ER_PEGU',	'IndianOcean',		67,	57,		null,	null,	null),
		('CIVILIZATION_ER_PEGU',	'EarthMk3',			76,	43,		null,	null,	null),
		('CIVILIZATION_ER_PEGU',	'India',			87,	48,		null,	null,	null),
		('CIVILIZATION_ER_PEGU',	'Indonesia',		9,	76,		null,	null,	null);

--CapitalName and AltCapitalName set a custom City Name on settlement at XY/AltXY coordinates, if needed. Should be TXT_KEY that refers to a string defined elsewhere.
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_YagemRequestedResource
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Civilizations_YnAEMPRequestedResources
		(CivilizationType, 			MapPrefix, Req1, 				Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_ER_PEGU', 	MapPrefix, ('RESOURCE_GOLD'), 	Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YnAEMPRequestedResources WHERE CivilizationType = 'CIVILIZATION_SIAM';
--------------------------------------------------------------------------------------------------------------------------
-- MinorCivilizations_YnAEMP
--------------------------------------------------------------------------------------------------------------------------
--This table operates the same as Civilizations_YnAEMP, merely substitute CivilizationType for MinorCivType.
--==========================================================================================================================
-- JFDLC
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------	
-- COLONIES
--------------------------------------------------------------------------------------------------------------------------	
--Colony specific city names. Only recommended for Civilizations that historically had colonies (personally, I also only do it for relevant leaders too), as CulDiv will handle the rest.
INSERT INTO Civilization_JFD_ColonialCityNames
		(CivilizationType, 			ColonyName)
VALUES	('CIVILIZATION_ER_PEGU', 	'TXT_KEY_COLONY_NAME_ER_PEGU_01'),
		('CIVILIZATION_ER_PEGU', 	'TXT_KEY_COLONY_NAME_ER_PEGU_02'),
		('CIVILIZATION_ER_PEGU', 	'TXT_KEY_COLONY_NAME_ER_PEGU_03'),
		('CIVILIZATION_ER_PEGU', 	'TXT_KEY_COLONY_NAME_ER_PEGU_04'),
		('CIVILIZATION_ER_PEGU', 	'TXT_KEY_COLONY_NAME_ER_PEGU_05');
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_JFD_Governments
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilization_JFD_Governments(CivilizationType, GovernmentType, Weight);
INSERT INTO Civilization_JFD_Governments
		(CivilizationType, 			GovernmentType,				 Weight)
VALUES	('CIVILIZATION_ER_PEGU',    'GOVERNMENT_JFD_MONARCHY',	 80),
     	('CIVILIZATION_ER_PEGU',    'GOVERNMENT_JFD_MERCHANT',	 20),
		('CIVILIZATION_ER_PEGU',    'GOVERNMENT_JFD_THEOCRATIC', 50);
--------------------------------------------------------------------------------------------------------------------------
-- LEADER FLAVOURS
--------------------------------------------------------------------------------------------------------------------------	
INSERT OR REPLACE INTO Flavors 
		(Type)
VALUES	('FLAVOR_JFD_DECOLONIZATION'), --0-10. Determines likelihood for annexing a colony, where 0 means never, and 10 means as soon as possible.
		('FLAVOR_JFD_MERCENARY'), --0-10. Determines likelihood of taking out Mercenary Contracts, where 0 means never, and 10 means as soon as possible.
		('FLAVOR_JFD_REFORM_GOVERNMENT'), --0-10. Determines Reform preference; corresponding to Left>Centre>Right/Liberal to Authoritarian continuum. 1-4=Left, 5-6=Centre, 7-10=Right. For government issues.
		('FLAVOR_JFD_REFORM_LEGAL'), --same as above for legal issues. 
		('FLAVOR_JFD_REFORM_CULTURE'), --same as above for cultural issues.
		('FLAVOR_JFD_REFORM_ECONOMIC'), --same as above for economic issues. 
		('FLAVOR_JFD_REFORM_EDUCATION'), --same as above for educational issues.
		('FLAVOR_JFD_REFORM_FOREIGN'), --same as above for diplomatic/international issues.
		('FLAVOR_JFD_REFORM_INDUSTRY'), --same as above for industrial/labour issues.
		('FLAVOR_JFD_REFORM_MILITARY'), --same as above for military issues.
		('FLAVOR_JFD_REFORM_RELIGION'), --same as above for religious issues.
		('FLAVOR_JFD_RELIGIOUS_INTOLERANCE'), --0-12. Determines the diplomatic penalty/bonus with leaders of a different/same state religion
		('FLAVOR_JFD_SLAVERY'), --0-10. Determines likelihood of enslaving Cities and spending Shackles on Slave Units, where 0 means never, and 10 as much as possible.
		('FLAVOR_JFD_STATE_RELIGION'); --0-12. Determines chance to adopt a State Religion, where 0 means never. 9+ also means this leader will never secularize.

INSERT INTO Leader_Flavors
		(LeaderType,				FlavorType,							 Flavor)
VALUES	('LEADER_ER_SHIN_SAWBU',	'FLAVOR_JFD_DECOLONIZATION',		 2),
		('LEADER_ER_SHIN_SAWBU',	'FLAVOR_JFD_MERCENARY',				 5),
		('LEADER_ER_SHIN_SAWBU',	'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',	 6),
		('LEADER_ER_SHIN_SAWBU',	'FLAVOR_JFD_REFORM_GOVERNMENT',		 6), 
		('LEADER_ER_SHIN_SAWBU',	'FLAVOR_JFD_REFORM_LEGAL',			 5), 	
		('LEADER_ER_SHIN_SAWBU',	'FLAVOR_JFD_REFORM_CULTURE',		 9),
		('LEADER_ER_SHIN_SAWBU',	'FLAVOR_JFD_REFORM_ECONOMIC',		 3),
		('LEADER_ER_SHIN_SAWBU',	'FLAVOR_JFD_REFORM_EDUCATION',	 	 6),
		('LEADER_ER_SHIN_SAWBU',	'FLAVOR_JFD_REFORM_FOREIGN',		 2),
		('LEADER_ER_SHIN_SAWBU',	'FLAVOR_JFD_REFORM_INDUSTRY',		 5),
		('LEADER_ER_SHIN_SAWBU',	'FLAVOR_JFD_REFORM_MILITARY',		 3),
		('LEADER_ER_SHIN_SAWBU',	'FLAVOR_JFD_REFORM_RELIGION',		 9),
		('LEADER_ER_SHIN_SAWBU',	'FLAVOR_JFD_SLAVERY',				 8),
		('LEADER_ER_SHIN_SAWBU',	'FLAVOR_JFD_STATE_RELIGION',		 11);
		
--------------------------------------------------------------------------------------------------------------------------
-- JFD'S CULTURAL DIVERSITY (31a31d1c-b9d7-45e1-842c-23232d66cd47)
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_CultureTypes(
	CivilizationType 					text 			default null,
	CultureType 						text			default null,
	SubCultureType 						text			default null,
	ArtDefineTag						text			default	null,
	DecisionsTag						text			default null,
	DefeatScreenEarlyTag				text			default	null,
	DefeatScreenMidTag					text			default	null,
	DefeatScreenLateTag					text			default	null,
	IdealsTag							text			default	null,
	SplashScreenTag						text			default	null,
	SoundtrackTag						text			default	null,
	UnitDialogueTag						text			default null);
/*
CultureTypes:
  CULTURE_JFD_ABORIGINAL, CULTURE_JFD_ANDEAN, CULTURE_JFD_BANTU, CULTURE_JFD_BHARATA, CULTURE_JFD_CENTRAL, CULTURE_JFD_CLASSICAL, CULTURE_JFD_COLONIAL, CULTURE_JFD_EASTERN, CULTURE_JFD_EAST_INDIES, CULTURE_JFD_GREAT_PLAINS, CULTURE_JFD_HIMALAYAN, CULTURE_JFD_IRANIAN, CULTURE_JFD_ISLAMIC, CULTURE_JFD_KATUJE, CULTURE_JFD_MANDALA, CULTURE_JFD_MESOAMERICAN, CULTURE_JFD_MESOPOTAMIC, CULTURE_JFD_NORTHERN, CULTURE_JFD_OCEANIC, CULTURE_JFD_ORIENTAL, CULTURE_JFD_PACIFIC, CULTURE_JFD_POLAR, CULTURE_JFD_SAHARAN, CULTURE_JFD_SEMITIC, CULTURE_JFD_STEPPE, CULTURE_JFD_SOUTHERN, CULTURE_JFD_TOTALITARIAN, CULTURE_JFD_WEST_AFRICAN, CULTURE_JFD_WESTERN, CULTURE_JFD_WOODLANDS

 SubCultureType:
  CULTURE_SUB_JFD_CLASSICAL_ROMAN, CULTURE_SUB_JFD_COLONIAL_LATIN, CULTURE_SUB_JFD_EASTERN_BYZANTINE, CULTURE_SUB_JFD_ISLAMIC_TURKIC, CULTURE_SUB_JFD_MESOPOTAMIC_EGYPTIAN, CULTURE_SUB_JFD_NORTHERN_CELTIC, CULTURE_SUB_JFD_ORIENTAL_JAPANESE, CULTURE_SUB_JFD_SEMITIC_ETHIOPIC, CULTURE_SUB_JFD_SOUTHERN_PAPAL, CULTURE_SUB_JFD_WESTERN_BRITISH
  
SplashScreenTags (As above, unless otherwise specified):
   As above in single word lower-case, e.g. CULTURE_JFD_CENTRAL = JFD_Central, CULTURE_JFD_WEST_AFRICAN = JFD_WestAfrican
   JFD_ClassicalRoman, JFD_ColonialLatin, JFD_NorthernCeltic, JFD_OrientalJapanese, JFD_SemiticEthiopic, JFD_SouthernPapal
  
SoundtrackTag (As above, unless otherwise specified):
  As above in single word lower-case, e.g. CULTURE_JFD_CENTRAL = JFD_Central, CULTURE_JFD_WEST_AFRICAN = JFD_WestAfrican
  JFD_ClassicalRoman, JFD_ColonialLatin, JFD_MesopotamicEgyptian, JFD_NorthernCeltic, JFD_OrientalJapanese, JFD_SemiticEthiopic, JFD_SouthernPapal
  
 UnitDialogueTag:
	AS2D_SOUND_JFD_AMERICAN, AS2D_SOUND_JFD_AMERICAN_WEST, AS2D_SOUND_JFD_ALBANIAN*, AS2D_SOUND_JFD_ARABIC, AS2D_SOUND_JFD_AZTEC, AS2D_SOUND_JFD_BABYLONIAN, AS2D_SOUND_JFD_BERBER*, AS2D_SOUND_JFD_BYZANTINE, AS2D_SOUND_JFD_CARTHAGINIAN, AS2D_SOUND_JFD_CELTIC, AS2D_SOUND_JFD_CHINESE, AS2D_SOUND_JFD_COMANCHE*, AS2D_SOUND_JFD_DUTCH, AS2D_SOUND_JFD_EGYPTIAN, AS2D_SOUND_JFD_ENGLISH, AS2D_SOUND_JFD_ETHIOPIAN, AS2D_SOUND_JFD_FINNISH*, AS2D_SOUND_JFD_FRENCH, AS2D_SOUND_JFD_GAELIC*, AS2D_SOUND_JFD_GERMAN, AS2D_SOUND_JFD_GREEK, AS2D_SOUND_JFD_HOLY_ROMAN, AS2D_SOUND_JFD_HUNNIC, AS2D_SOUND_JFD_INCAN, AS2D_SOUND_JFD_INDIAN, AS2D_SOUND_JFD_ITALIAN, AS2D_SOUND_JFD_JAPANESE, AS2D_SOUND_JFD_KHMER, AS2D_SOUND_JFD_KOREAN, AS2D_SOUND_JFD_LATINO, AS2D_SOUND_JFD_MALINESE, AS2D_SOUND_JFD_MAMLUKE*, AS2D_SOUND_JFD_MAPUDUNGUN, AS2D_SOUND_JFD_MAYAN, AS2D_SOUND_JFD_MOHAWK, AS2D_SOUND_JFD_MONGOL, AS2D_SOUND_JFD_OTTOMAN, AS2D_SOUND_JFD_PERSIAN, AS2D_SOUND_JFD_POLISH, AS2D_SOUND_JFD_PORTUGUESE, AS2D_SOUND_JFD_ROMAN, AS2D_SOUND_JFD_RUSSIAN, AS2D_SOUND_JFD_SIAMESE, AS2D_SOUND_JFD_SIOUX, AS2D_SOUND_JFD_SPANISH, AS2D_SOUND_JFD_SUMERIAN, AS2D_SOUND_JFD_SWEDISH, AS2D_SOUND_JFD_TUPI*, AS2D_SOUND_JFD_VIKING, AS2D_SOUND_JFD_ZAPOTEC*, AS2D_SOUND_JFD_ZULU
	
	*Not recommended as these have few tracks.
*/

--This is an example of support which copies all attributes from an existing civ. 
--For the most part, this is probably all you'll need; just change 'CIVILIZATION_ER_PEGU' to the tag of your custom civ. 
INSERT INTO Civilization_JFD_CultureTypes
		(CivilizationType,			ArtDefineTag, CultureType, SubCultureType, DecisionsTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag)
SELECT	'CIVILIZATION_ER_PEGU',		ArtDefineTag, CultureType, SubCultureType, DecisionsTag, IdealsTag, SplashScreenTag, SoundtrackTag, 'AS2D_SOUND_JFD_KHMER'
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_SIAM';

UPDATE Civilizations 
SET SoundtrackTag = 'JFD_Mandala'
WHERE Type = 'CIVILIZATION_ER_PEGU'
AND EXISTS (SELECT * FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Mandala');
--==========================================================================================================================		
--==========================================================================================================================		

