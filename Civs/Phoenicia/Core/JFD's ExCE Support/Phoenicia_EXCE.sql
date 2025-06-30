--==========================================================================================================================
-- JFD's Exploration Continued Expanded
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_ColonialCityNames (
    CivilizationType                            text    REFERENCES Civilizations(Type)      default null,
    ColonyName                                  text                                        default null,
    LinguisticType                              text                                        default null,
    CultureType                                 text                                        default null);

	
INSERT OR REPLACE INTO Civilization_JFD_ColonialCityNames
			(CivilizationType, 				ColonyName,											LinguisticType)
VALUES		('CIVILIZATION_MC_PHOENICIA', 	null,												'JFD_Semitic'),
			('CIVILIZATION_MC_PHOENICIA', 	'TXT_KEY_COLONY_NAME_CIVILIZATION_MC_PHOENICIA_1',  null),
			('CIVILIZATION_MC_PHOENICIA', 	'TXT_KEY_COLONY_NAME_CIVILIZATION_MC_PHOENICIA_2',  null),
			('CIVILIZATION_MC_PHOENICIA', 	'TXT_KEY_COLONY_NAME_CIVILIZATION_MC_PHOENICIA_3',  null),
			('CIVILIZATION_MC_PHOENICIA', 	'TXT_KEY_COLONY_NAME_CIVILIZATION_MC_PHOENICIA_4',  null),
			('CIVILIZATION_MC_PHOENICIA', 	'TXT_KEY_COLONY_NAME_CIVILIZATION_MC_PHOENICIA_5',  null),
			('CIVILIZATION_MC_PHOENICIA', 	'TXT_KEY_COLONY_NAME_CIVILIZATION_MC_PHOENICIA_6',  null),
			('CIVILIZATION_MC_PHOENICIA', 	'TXT_KEY_COLONY_NAME_CIVILIZATION_MC_PHOENICIA_7',  null),
			('CIVILIZATION_MC_PHOENICIA', 	'TXT_KEY_COLONY_NAME_CIVILIZATION_MC_PHOENICIA_8',  null),
			('CIVILIZATION_MC_PHOENICIA', 	'TXT_KEY_COLONY_NAME_CIVILIZATION_MC_PHOENICIA_9',  null),
			('CIVILIZATION_MC_PHOENICIA', 	'TXT_KEY_COLONY_NAME_CIVILIZATION_MC_PHOENICIA_10',  null);
 
--PROMOTION_JFD_SNOW_IMMUNITY, PROMOTION_JFD_DESERT_IMMUNITY, PROMOTION_JFD_DISEASE_IMMUNITY, PROMOTION_JFD_JUNGLE_IMMUNITY, PROMOTION_JFD_SCUVRY_IMMUNITY, PROMOTION_JFD_IMMUNITY (immunity to all except Disease)
INSERT INTO Unit_FreePromotions
			(UnitType, 						PromotionType)
SELECT		('UNIT_MC_PHOENICIA_BIREME'),	('PROMOTION_JFD_SCURVY_IMMUNITY')
WHERE EXISTS (SELECT Type FROM UnitPromotions WHERE Type = 'PROMOTION_JFD_SCURVY_IMMUNITY');

INSERT INTO Unit_FreePromotions
			(UnitType, 						PromotionType)
SELECT		('UNIT_MC_TYRIAN_MERCHANT'),	('PROMOTION_JFD_SCURVY_IMMUNITY')
WHERE EXISTS (SELECT Type FROM UnitPromotions WHERE Type = 'PROMOTION_JFD_SCURVY_IMMUNITY');
--==========================================================================================================================
--==========================================================================================================================
