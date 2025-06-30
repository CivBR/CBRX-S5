--==========================================================================================================================	
-- Leaders
--==========================================================================================================================				
INSERT INTO Leaders
			(Type, 						Description, 							Civilopedia, 						CivilopediaTag, 					ArtDefineTag, 					VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 			PortraitIndex)
VALUES		('LEADER_MC_TIPU_SULTAN',	'TXT_KEY_LEADER_MC_TIPU_SULTAN_DESC',	'TXT_KEY_LEADER_MC_TIPU_SULTAN',	'TXT_KEY_LEADER_MC_TIPU_SULTAN',	'MC_MYSORE_Leaderscene.xml',	5,						6,						7,							5,			3,				6,				4,						4,				6,			6,			3,				4,			4,			'MC_MYSORE_ATLAS',	1);

--==========================================================================================================================	
-- Diplomacy_Responses
--==========================================================================================================================				
INSERT INTO Diplomacy_Responses
			(LeaderType,				ResponseType,				Response)
VALUES		('LEADER_MC_TIPU_SULTAN',	'RESPONSE_FIRST_GREETING',	'TXT_KEY_LEADER_MC_TIPU_SULTAN_FIRSTGREETING_%'),
			('LEADER_MC_TIPU_SULTAN',	'RESPONSE_DEFEATED',		'TXT_KEY_LEADER_MC_TIPU_SULTAN_DEFEATED_%'),
			('LEADER_MC_TIPU_SULTAN',	'RESPONSE_ATTACKED',		'TXT_KEY_LEADER_MC_TIPU_SULTAN_ATTACKED_%'),
			('LEADER_MC_TIPU_SULTAN',	'RESPONSE_DOW_GENERIC',		'TXT_KEY_LEADER_MC_TIPU_SULTAN_DOW_%');
			
--==========================================================================================================================	
-- Traits
--==========================================================================================================================				
INSERT INTO Traits
			(Type,							Description,							ShortDescription)
VALUES		('TRAIT_MC_FATHUL_MUJAHAIDIN',	'TXT_KEY_TRAIT_MC_FATHUL_MUJAHAIDIN',	'TXT_KEY_TRAIT_MC_FATHUL_MUJAHAIDIN_SHORT');

INSERT INTO Trait_FreePromotionUnitCombats
		(TraitType,						UnitCombatType,		PromotionType)
VALUES	('TRAIT_MC_FATHUL_MUJAHAIDIN',	'UNITCOMBAT_SIEGE',	'PROMOTION_MC_MYSORE');

--==========================================================================================================================	
-- Leader_Traits
--==========================================================================================================================				
INSERT INTO Leader_Traits
			(LeaderType,				TraitType)
VALUES		('LEADER_MC_TIPU_SULTAN',	'TRAIT_MC_FATHUL_MUJAHAIDIN');

--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================				
INSERT INTO Leader_MajorCivApproachBiases 
			(LeaderType, 				MajorCivApproachType, 				Bias)
VALUES		('LEADER_MC_TIPU_SULTAN', 	'MAJOR_CIV_APPROACH_WAR', 			5),
			('LEADER_MC_TIPU_SULTAN', 	'MAJOR_CIV_APPROACH_HOSTILE', 		5),
			('LEADER_MC_TIPU_SULTAN', 	'MAJOR_CIV_APPROACH_DECEPTIVE', 	4),
			('LEADER_MC_TIPU_SULTAN', 	'MAJOR_CIV_APPROACH_GUARDED', 		6),
			('LEADER_MC_TIPU_SULTAN', 	'MAJOR_CIV_APPROACH_AFRAID', 		4),
			('LEADER_MC_TIPU_SULTAN', 	'MAJOR_CIV_APPROACH_FRIENDLY', 		6),
			('LEADER_MC_TIPU_SULTAN', 	'MAJOR_CIV_APPROACH_NEUTRAL', 		6);

--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================							
INSERT INTO Leader_MinorCivApproachBiases 
			(LeaderType, 				MinorCivApproachType, 				Bias)
VALUES		('LEADER_MC_TIPU_SULTAN', 	'MINOR_CIV_APPROACH_IGNORE', 		5),
			('LEADER_MC_TIPU_SULTAN', 	'MINOR_CIV_APPROACH_FRIENDLY', 		5),
			('LEADER_MC_TIPU_SULTAN', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	4),
			('LEADER_MC_TIPU_SULTAN', 	'MINOR_CIV_APPROACH_CONQUEST', 		4),
			('LEADER_MC_TIPU_SULTAN', 	'MINOR_CIV_APPROACH_BULLY', 		6);

--==========================================================================================================================	
-- Leader_Flavors
--==========================================================================================================================	
INSERT INTO Leader_Flavors 
			(LeaderType, 				FlavorType, 						Flavor)
VALUES		('LEADER_MC_TIPU_SULTAN', 	'FLAVOR_OFFENSE', 					7),
			('LEADER_MC_TIPU_SULTAN', 	'FLAVOR_DEFENSE', 					7),
			('LEADER_MC_TIPU_SULTAN', 	'FLAVOR_CITY_DEFENSE', 				7),
			('LEADER_MC_TIPU_SULTAN', 	'FLAVOR_MILITARY_TRAINING', 		5),
			('LEADER_MC_TIPU_SULTAN', 	'FLAVOR_RECON', 					4),
			('LEADER_MC_TIPU_SULTAN', 	'FLAVOR_RANGED', 					7),
			('LEADER_MC_TIPU_SULTAN', 	'FLAVOR_MOBILE', 					4),
			('LEADER_MC_TIPU_SULTAN', 	'FLAVOR_NAVAL', 					5),
			('LEADER_MC_TIPU_SULTAN', 	'FLAVOR_NAVAL_RECON', 				4),
			('LEADER_MC_TIPU_SULTAN', 	'FLAVOR_NAVAL_GROWTH', 				4),
			('LEADER_MC_TIPU_SULTAN', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	4),
			('LEADER_MC_TIPU_SULTAN', 	'FLAVOR_AIR', 						9),
			('LEADER_MC_TIPU_SULTAN', 	'FLAVOR_EXPANSION', 				5),
			('LEADER_MC_TIPU_SULTAN', 	'FLAVOR_GROWTH', 					7),
			('LEADER_MC_TIPU_SULTAN', 	'FLAVOR_TILE_IMPROVEMENT', 			5),
			('LEADER_MC_TIPU_SULTAN', 	'FLAVOR_INFRASTRUCTURE', 			4),
			('LEADER_MC_TIPU_SULTAN', 	'FLAVOR_PRODUCTION', 				6),
			('LEADER_MC_TIPU_SULTAN', 	'FLAVOR_GOLD', 						5),
			('LEADER_MC_TIPU_SULTAN', 	'FLAVOR_SCIENCE', 					7),
			('LEADER_MC_TIPU_SULTAN', 	'FLAVOR_CULTURE', 					7),
			('LEADER_MC_TIPU_SULTAN', 	'FLAVOR_HAPPINESS', 				5),
			('LEADER_MC_TIPU_SULTAN', 	'FLAVOR_GREAT_PEOPLE', 				5),
			('LEADER_MC_TIPU_SULTAN', 	'FLAVOR_WONDER', 					4),
			('LEADER_MC_TIPU_SULTAN', 	'FLAVOR_RELIGION', 					6),
			('LEADER_MC_TIPU_SULTAN', 	'FLAVOR_DIPLOMACY', 				5),
			('LEADER_MC_TIPU_SULTAN', 	'FLAVOR_SPACESHIP', 				5),
			('LEADER_MC_TIPU_SULTAN', 	'FLAVOR_WATER_CONNECTION', 			5),
			('LEADER_MC_TIPU_SULTAN', 	'FLAVOR_NUKE', 						9),
			('LEADER_MC_TIPU_SULTAN', 	'FLAVOR_USE_NUKE', 					9),
			('LEADER_MC_TIPU_SULTAN', 	'FLAVOR_ESPIONAGE', 				5),
			('LEADER_MC_TIPU_SULTAN', 	'FLAVOR_AIRLIFT', 					7),
			('LEADER_MC_TIPU_SULTAN', 	'FLAVOR_I_TRADE_DESTINATION', 		6),
			('LEADER_MC_TIPU_SULTAN', 	'FLAVOR_I_TRADE_ORIGIN', 			6),
			('LEADER_MC_TIPU_SULTAN', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
			('LEADER_MC_TIPU_SULTAN', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
			('LEADER_MC_TIPU_SULTAN', 	'FLAVOR_ARCHAEOLOGY', 				6),
			('LEADER_MC_TIPU_SULTAN', 	'FLAVOR_AIR_CARRIER', 				8);
--==========================================================================================================================