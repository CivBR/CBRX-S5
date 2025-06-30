--==========================================================================================================================	
-- Leaders
--==========================================================================================================================				
INSERT INTO Leaders
			(Type, 						Description, 							Civilopedia, 						CivilopediaTag, 					ArtDefineTag, 					VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 			PortraitIndex)
VALUES		('LEADER_MC_DAVI_KOPENAWA',	'TXT_KEY_LEADER_MC_DAVI_KOPENAWA_DESC',	'TXT_KEY_LEADER_MC_DAVI_KOPENAWA',	'TXT_KEY_LEADER_MC_DAVI_KOPENAWA',	'MC_YANOMAMI_Leaderscene.xml',	7,						6,						7,							9,			8,				7,				6,						7,				5,			6,			7,				8,			6,			'MC_YANOMAMI_ATLAS',	1);

--==========================================================================================================================	
-- Diplomacy_Responses
--==========================================================================================================================				
INSERT INTO Diplomacy_Responses
			(LeaderType,				ResponseType,				Response)
VALUES		('LEADER_MC_DAVI_KOPENAWA',	'RESPONSE_FIRST_GREETING',	'TXT_KEY_LEADER_MC_DAVI_KOPENAWA_FIRSTGREETING_%'),
			('LEADER_MC_DAVI_KOPENAWA',	'RESPONSE_DEFEATED',		'TXT_KEY_LEADER_MC_DAVI_KOPENAWA_DEFEATED_%'),
			('LEADER_MC_DAVI_KOPENAWA',	'RESPONSE_ATTACKED',		'TXT_KEY_LEADER_MC_DAVI_KOPENAWA_ATTACKED_%'),
			('LEADER_MC_DAVI_KOPENAWA',	'RESPONSE_DOW_GENERIC',		'TXT_KEY_LEADER_MC_DAVI_KOPENAWA_DOW_%'),
			('LEADER_MC_DAVI_KOPENAWA',	'RESPONSE_DEC_FRIENDSHIP',	'TXT_KEY_LEADER_MC_DAVI_KOPENAWA_DEC_FRIENDSHIP_%'),
			('LEADER_MC_DAVI_KOPENAWA',	'RESPONSE_DENOUNCE',		'TXT_KEY_LEADER_MC_DAVI_KOPENAWA_DENOUNCE_%'),
			('LEADER_MC_DAVI_KOPENAWA',	'RESPONSE_DENOUNCE_FRIEND',	'TXT_KEY_LEADER_MC_DAVI_KOPENAWA_DENOUNCE_FRIEND_%'),
			('LEADER_MC_DAVI_KOPENAWA',	'RESPONSE_DENOUNCED',		'TXT_KEY_LEADER_MC_DAVI_KOPENAWA_RESPONSE_TO_BEING_DENOUNCED_%');
			
--==========================================================================================================================	
-- Traits
--==========================================================================================================================				
INSERT INTO Traits
			(Type,							Description,						ShortDescription)
VALUES		('TRAIT_MC_THE_FALLING_SKY',	'TXT_KEY_TRAIT_MC_THE_FALLING_SKY',	'TXT_KEY_TRAIT_MC_THE_FALLING_SKY_SHORT');

--==========================================================================================================================	
-- Leader_Traits
--==========================================================================================================================				
INSERT INTO Leader_Traits
			(LeaderType,				TraitType)
VALUES		('LEADER_MC_DAVI_KOPENAWA',	'TRAIT_MC_THE_FALLING_SKY');

--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================				
INSERT INTO Leader_MajorCivApproachBiases 
			(LeaderType, 					MajorCivApproachType, 				Bias)
VALUES		('LEADER_MC_DAVI_KOPENAWA', 	'MAJOR_CIV_APPROACH_WAR', 			3),
			('LEADER_MC_DAVI_KOPENAWA', 	'MAJOR_CIV_APPROACH_HOSTILE', 		5),
			('LEADER_MC_DAVI_KOPENAWA', 	'MAJOR_CIV_APPROACH_DECEPTIVE', 	3),
			('LEADER_MC_DAVI_KOPENAWA', 	'MAJOR_CIV_APPROACH_GUARDED', 		8),
			('LEADER_MC_DAVI_KOPENAWA', 	'MAJOR_CIV_APPROACH_AFRAID', 		5),
			('LEADER_MC_DAVI_KOPENAWA', 	'MAJOR_CIV_APPROACH_FRIENDLY', 		7),
			('LEADER_MC_DAVI_KOPENAWA', 	'MAJOR_CIV_APPROACH_NEUTRAL', 		7);

--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================							
INSERT INTO Leader_MinorCivApproachBiases 
			(LeaderType, 					MinorCivApproachType, 				Bias)
VALUES		('LEADER_MC_DAVI_KOPENAWA', 	'MINOR_CIV_APPROACH_IGNORE', 		7),
			('LEADER_MC_DAVI_KOPENAWA', 	'MINOR_CIV_APPROACH_FRIENDLY', 		6),
			('LEADER_MC_DAVI_KOPENAWA', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	5),
			('LEADER_MC_DAVI_KOPENAWA', 	'MINOR_CIV_APPROACH_CONQUEST', 		4),
			('LEADER_MC_DAVI_KOPENAWA', 	'MINOR_CIV_APPROACH_BULLY', 		3);

--==========================================================================================================================	
-- Leader_Flavors
--==========================================================================================================================	
INSERT INTO Leader_Flavors 
			(LeaderType, 					FlavorType, 						Flavor)
VALUES		('LEADER_MC_DAVI_KOPENAWA', 	'FLAVOR_OFFENSE', 					4),
			('LEADER_MC_DAVI_KOPENAWA', 	'FLAVOR_DEFENSE', 					6),
			('LEADER_MC_DAVI_KOPENAWA', 	'FLAVOR_CITY_DEFENSE', 				5),
			('LEADER_MC_DAVI_KOPENAWA', 	'FLAVOR_MILITARY_TRAINING', 		4),
			('LEADER_MC_DAVI_KOPENAWA', 	'FLAVOR_RECON', 					7),
			('LEADER_MC_DAVI_KOPENAWA', 	'FLAVOR_RANGED', 					7),
			('LEADER_MC_DAVI_KOPENAWA', 	'FLAVOR_MOBILE', 					3),
			('LEADER_MC_DAVI_KOPENAWA', 	'FLAVOR_NAVAL', 					3),
			('LEADER_MC_DAVI_KOPENAWA', 	'FLAVOR_NAVAL_RECON', 				4),
			('LEADER_MC_DAVI_KOPENAWA', 	'FLAVOR_NAVAL_GROWTH', 				3),
			('LEADER_MC_DAVI_KOPENAWA', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	3),
			('LEADER_MC_DAVI_KOPENAWA', 	'FLAVOR_AIR', 						6),
			('LEADER_MC_DAVI_KOPENAWA', 	'FLAVOR_EXPANSION', 				6),
			('LEADER_MC_DAVI_KOPENAWA', 	'FLAVOR_GROWTH', 					7),
			('LEADER_MC_DAVI_KOPENAWA', 	'FLAVOR_TILE_IMPROVEMENT', 			4),
			('LEADER_MC_DAVI_KOPENAWA', 	'FLAVOR_INFRASTRUCTURE', 			4),
			('LEADER_MC_DAVI_KOPENAWA', 	'FLAVOR_PRODUCTION', 				4),
			('LEADER_MC_DAVI_KOPENAWA', 	'FLAVOR_GOLD', 						4),
			('LEADER_MC_DAVI_KOPENAWA', 	'FLAVOR_SCIENCE', 					6),
			('LEADER_MC_DAVI_KOPENAWA', 	'FLAVOR_CULTURE', 					8),
			('LEADER_MC_DAVI_KOPENAWA', 	'FLAVOR_HAPPINESS', 				6),
			('LEADER_MC_DAVI_KOPENAWA', 	'FLAVOR_GREAT_PEOPLE', 				7),
			('LEADER_MC_DAVI_KOPENAWA', 	'FLAVOR_WONDER', 					5),
			('LEADER_MC_DAVI_KOPENAWA', 	'FLAVOR_RELIGION', 					9),
			('LEADER_MC_DAVI_KOPENAWA', 	'FLAVOR_DIPLOMACY', 				7),
			('LEADER_MC_DAVI_KOPENAWA', 	'FLAVOR_SPACESHIP', 				5),
			('LEADER_MC_DAVI_KOPENAWA', 	'FLAVOR_WATER_CONNECTION', 			5),
			('LEADER_MC_DAVI_KOPENAWA', 	'FLAVOR_NUKE', 						5),
			('LEADER_MC_DAVI_KOPENAWA', 	'FLAVOR_USE_NUKE', 					4),
			('LEADER_MC_DAVI_KOPENAWA', 	'FLAVOR_ESPIONAGE', 				7),
			('LEADER_MC_DAVI_KOPENAWA', 	'FLAVOR_AIRLIFT', 					5),
			('LEADER_MC_DAVI_KOPENAWA', 	'FLAVOR_I_TRADE_DESTINATION', 		6),
			('LEADER_MC_DAVI_KOPENAWA', 	'FLAVOR_I_TRADE_ORIGIN', 			6),
			('LEADER_MC_DAVI_KOPENAWA', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
			('LEADER_MC_DAVI_KOPENAWA', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
			('LEADER_MC_DAVI_KOPENAWA', 	'FLAVOR_ARCHAEOLOGY', 				5),
			('LEADER_MC_DAVI_KOPENAWA', 	'FLAVOR_AIR_CARRIER', 				6);
--==========================================================================================================================