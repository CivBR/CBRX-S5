--==========================================================================================================================	
-- Leaders
--==========================================================================================================================			
INSERT INTO Leaders 
			(Type, 							Description, 							Civilopedia, 						CivilopediaTag, 								ArtDefineTag, 				VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 				PortraitIndex)
VALUES		('LEADER_MC_HIRAM', 			'TXT_KEY_LEADER_MC_HIRAM', 				'TXT_KEY_LEADER_MC_HIRAM', 			'TXT_KEY_CIV5_LEADER_MC_HIRAM', 				'Phoenicia_Leaderhead.xml',	6, 						5, 						7, 							6, 			5, 				7, 				6, 						7, 				8, 			4, 			6, 				7, 			5, 			'MC_PHOENICIA_ATLAS', 	1);
--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================						
INSERT INTO Leader_MajorCivApproachBiases 
			(LeaderType, 						MajorCivApproachType, 				Bias)
VALUES		('LEADER_MC_HIRAM', 				'MAJOR_CIV_APPROACH_WAR', 			4),
			('LEADER_MC_HIRAM', 				'MAJOR_CIV_APPROACH_HOSTILE', 		5),
			('LEADER_MC_HIRAM', 				'MAJOR_CIV_APPROACH_DECEPTIVE', 	5),
			('LEADER_MC_HIRAM', 				'MAJOR_CIV_APPROACH_GUARDED', 		5),
			('LEADER_MC_HIRAM', 				'MAJOR_CIV_APPROACH_AFRAID', 		4),
			('LEADER_MC_HIRAM', 				'MAJOR_CIV_APPROACH_FRIENDLY', 		7),
			('LEADER_MC_HIRAM', 				'MAJOR_CIV_APPROACH_NEUTRAL', 		6);
--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================						
INSERT INTO Leader_MinorCivApproachBiases 
			(LeaderType, 						MinorCivApproachType, 				Bias)
VALUES		('LEADER_MC_HIRAM', 				'MINOR_CIV_APPROACH_IGNORE', 		4),
			('LEADER_MC_HIRAM', 				'MINOR_CIV_APPROACH_FRIENDLY', 		8),
			('LEADER_MC_HIRAM', 				'MINOR_CIV_APPROACH_PROTECTIVE', 	6),
			('LEADER_MC_HIRAM', 				'MINOR_CIV_APPROACH_CONQUEST', 		4),
			('LEADER_MC_HIRAM', 				'MINOR_CIV_APPROACH_BULLY', 		4);
--==========================================================================================================================	
-- Leader_Flavors
--==========================================================================================================================						
INSERT INTO Leader_Flavors 
			(LeaderType, 						FlavorType, 						Flavor)
VALUES		('LEADER_MC_HIRAM', 				'FLAVOR_OFFENSE', 					5),
			('LEADER_MC_HIRAM', 				'FLAVOR_DEFENSE', 					5),
			('LEADER_MC_HIRAM', 				'FLAVOR_CITY_DEFENSE', 				6),
			('LEADER_MC_HIRAM', 				'FLAVOR_MILITARY_TRAINING', 		5),
			('LEADER_MC_HIRAM', 				'FLAVOR_RECON', 					6),
			('LEADER_MC_HIRAM', 				'FLAVOR_RANGED', 					5),
			('LEADER_MC_HIRAM', 				'FLAVOR_MOBILE', 					5),
			('LEADER_MC_HIRAM', 				'FLAVOR_NAVAL', 					7),
			('LEADER_MC_HIRAM', 				'FLAVOR_NAVAL_RECON', 				7),
			('LEADER_MC_HIRAM', 				'FLAVOR_NAVAL_GROWTH', 				6),
			('LEADER_MC_HIRAM', 				'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	7),
			('LEADER_MC_HIRAM', 				'FLAVOR_AIR', 						6),
			('LEADER_MC_HIRAM', 				'FLAVOR_EXPANSION', 				5),
			('LEADER_MC_HIRAM', 				'FLAVOR_GROWTH', 					6),
			('LEADER_MC_HIRAM', 				'FLAVOR_TILE_IMPROVEMENT', 			6),
			('LEADER_MC_HIRAM', 				'FLAVOR_INFRASTRUCTURE', 			6),
			('LEADER_MC_HIRAM', 				'FLAVOR_PRODUCTION', 				6),
			('LEADER_MC_HIRAM', 				'FLAVOR_GOLD', 						8),
			('LEADER_MC_HIRAM', 				'FLAVOR_SCIENCE', 					7),
			('LEADER_MC_HIRAM', 				'FLAVOR_CULTURE', 					5),
			('LEADER_MC_HIRAM', 				'FLAVOR_HAPPINESS', 				6),
			('LEADER_MC_HIRAM', 				'FLAVOR_GREAT_PEOPLE', 				5),
			('LEADER_MC_HIRAM', 				'FLAVOR_WONDER', 					4),
			('LEADER_MC_HIRAM', 				'FLAVOR_RELIGION', 					5),
			('LEADER_MC_HIRAM', 				'FLAVOR_DIPLOMACY', 				7),
			('LEADER_MC_HIRAM', 				'FLAVOR_SPACESHIP', 				5),
			('LEADER_MC_HIRAM', 				'FLAVOR_WATER_CONNECTION', 			5),
			('LEADER_MC_HIRAM', 				'FLAVOR_NUKE', 						5),
			('LEADER_MC_HIRAM', 				'FLAVOR_USE_NUKE', 					5),
			('LEADER_MC_HIRAM', 				'FLAVOR_ESPIONAGE', 				7),
			('LEADER_MC_HIRAM', 				'FLAVOR_AIRLIFT', 					5),
			('LEADER_MC_HIRAM', 				'FLAVOR_I_TRADE_DESTINATION', 		5),
			('LEADER_MC_HIRAM', 				'FLAVOR_I_TRADE_ORIGIN', 			5),
			('LEADER_MC_HIRAM', 				'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
			('LEADER_MC_HIRAM', 				'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
			('LEADER_MC_HIRAM', 				'FLAVOR_ARCHAEOLOGY', 				5),
			('LEADER_MC_HIRAM', 				'FLAVOR_AIR_CARRIER', 				5);
--==========================================================================================================================	
-- Leader_Traits
--==========================================================================================================================	
INSERT INTO Leader_Traits 
			(LeaderType, 						TraitType)
VALUES		('LEADER_MC_HIRAM', 				'TRAIT_MC_PHOENICIAN_APLHABET');
--==========================================================================================================================				
--==========================================================================================================================		