--==========================================================================================================================	
-- Leaders
--==========================================================================================================================			
INSERT INTO Leaders 
			(Type, 							Description, 							Civilopedia, 										CivilopediaTag, 									ArtDefineTag, 						VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 					PortraitIndex)
VALUES		('LEADER_SENSHI_JANDAMARRA', 	'TXT_KEY_LEADER_SENSHI_JANDAMARRA', 	'TXT_KEY_CIVILOPEDIA_LEADER_SENSHI_JANDAMARRA', 	'TXT_KEY_CIVILOPEDIA_LEADERS_SENSHI_JANDAMARRA', 	'Senshi_Jandamarra_Scene.xml',		7, 						3, 						5, 							9, 			3, 				7, 				6, 						4, 				3, 			7, 			2, 				5, 			6, 			'SENSHI_BUNUBA_ATLAS',		1);
--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================						
INSERT INTO Leader_MajorCivApproachBiases 
			(LeaderType, 				MajorCivApproachType, 				Bias)
VALUES		('LEADER_SENSHI_JANDAMARRA', 		'MAJOR_CIV_APPROACH_WAR', 			5),
			('LEADER_SENSHI_JANDAMARRA', 		'MAJOR_CIV_APPROACH_HOSTILE', 		6),
			('LEADER_SENSHI_JANDAMARRA', 		'MAJOR_CIV_APPROACH_DECEPTIVE', 	7),
			('LEADER_SENSHI_JANDAMARRA', 		'MAJOR_CIV_APPROACH_GUARDED', 		9),
			('LEADER_SENSHI_JANDAMARRA', 		'MAJOR_CIV_APPROACH_AFRAID', 		1),
			('LEADER_SENSHI_JANDAMARRA', 		'MAJOR_CIV_APPROACH_FRIENDLY', 		4),
			('LEADER_SENSHI_JANDAMARRA', 		'MAJOR_CIV_APPROACH_NEUTRAL', 		7);
--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================						
INSERT INTO Leader_MinorCivApproachBiases 
			(LeaderType, 			MinorCivApproachType, 				Bias)
VALUES		('LEADER_SENSHI_JANDAMARRA', 	'MINOR_CIV_APPROACH_IGNORE', 		5),
			('LEADER_SENSHI_JANDAMARRA', 	'MINOR_CIV_APPROACH_FRIENDLY', 		4),
			('LEADER_SENSHI_JANDAMARRA', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	5),
			('LEADER_SENSHI_JANDAMARRA', 	'MINOR_CIV_APPROACH_CONQUEST', 		4),
			('LEADER_SENSHI_JANDAMARRA', 	'MINOR_CIV_APPROACH_BULLY', 		6);
--==========================================================================================================================	
-- Leader_Flavors
--==========================================================================================================================						
INSERT INTO Leader_Flavors 
			(LeaderType, 			FlavorType, 						Flavor)
VALUES		('LEADER_SENSHI_JANDAMARRA', 	'FLAVOR_OFFENSE', 					9),
			('LEADER_SENSHI_JANDAMARRA', 	'FLAVOR_DEFENSE', 					7),
			('LEADER_SENSHI_JANDAMARRA', 	'FLAVOR_CITY_DEFENSE', 				5),
			('LEADER_SENSHI_JANDAMARRA', 	'FLAVOR_MILITARY_TRAINING', 		6),
			('LEADER_SENSHI_JANDAMARRA', 	'FLAVOR_RECON', 					7),
			('LEADER_SENSHI_JANDAMARRA', 	'FLAVOR_RANGED', 					8),
			('LEADER_SENSHI_JANDAMARRA', 	'FLAVOR_MOBILE', 					7),
			('LEADER_SENSHI_JANDAMARRA', 	'FLAVOR_NAVAL', 					4),
			('LEADER_SENSHI_JANDAMARRA', 	'FLAVOR_NAVAL_RECON', 				4),
			('LEADER_SENSHI_JANDAMARRA', 	'FLAVOR_NAVAL_GROWTH', 				4),
			('LEADER_SENSHI_JANDAMARRA', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	6),
			('LEADER_SENSHI_JANDAMARRA', 	'FLAVOR_AIR', 						7),
			('LEADER_SENSHI_JANDAMARRA', 	'FLAVOR_EXPANSION', 				7),
			('LEADER_SENSHI_JANDAMARRA', 	'FLAVOR_GROWTH', 					4),
			('LEADER_SENSHI_JANDAMARRA', 	'FLAVOR_TILE_IMPROVEMENT', 			5),
			('LEADER_SENSHI_JANDAMARRA', 	'FLAVOR_INFRASTRUCTURE', 			5),
			('LEADER_SENSHI_JANDAMARRA', 	'FLAVOR_PRODUCTION', 				7),
			('LEADER_SENSHI_JANDAMARRA', 	'FLAVOR_GOLD', 						3),
			('LEADER_SENSHI_JANDAMARRA', 	'FLAVOR_SCIENCE', 					6),
			('LEADER_SENSHI_JANDAMARRA', 	'FLAVOR_CULTURE', 					6),
			('LEADER_SENSHI_JANDAMARRA', 	'FLAVOR_HAPPINESS', 				5),
			('LEADER_SENSHI_JANDAMARRA', 	'FLAVOR_GREAT_PEOPLE', 				4),
			('LEADER_SENSHI_JANDAMARRA', 	'FLAVOR_WONDER', 					3),
			('LEADER_SENSHI_JANDAMARRA', 	'FLAVOR_RELIGION', 					8),
			('LEADER_SENSHI_JANDAMARRA', 	'FLAVOR_DIPLOMACY', 				3),
			('LEADER_SENSHI_JANDAMARRA', 	'FLAVOR_SPACESHIP', 				2),
			('LEADER_SENSHI_JANDAMARRA', 	'FLAVOR_WATER_CONNECTION', 			4),
			('LEADER_SENSHI_JANDAMARRA', 	'FLAVOR_NUKE', 						7),
			('LEADER_SENSHI_JANDAMARRA', 	'FLAVOR_USE_NUKE', 					3),
			('LEADER_SENSHI_JANDAMARRA', 	'FLAVOR_ESPIONAGE', 				7),
			('LEADER_SENSHI_JANDAMARRA', 	'FLAVOR_AIRLIFT', 					9),
			('LEADER_SENSHI_JANDAMARRA', 	'FLAVOR_I_TRADE_DESTINATION', 		5),
			('LEADER_SENSHI_JANDAMARRA', 	'FLAVOR_I_TRADE_ORIGIN', 			5),
			('LEADER_SENSHI_JANDAMARRA', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		4),
			('LEADER_SENSHI_JANDAMARRA', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		4),
			('LEADER_SENSHI_JANDAMARRA', 	'FLAVOR_ARCHAEOLOGY', 				2),
			('LEADER_SENSHI_JANDAMARRA', 	'FLAVOR_AIR_CARRIER', 				3);
--==========================================================================================================================	
-- Leader_Traits
--==========================================================================================================================						
INSERT INTO Leader_Traits 
			(LeaderType, 			TraitType)
VALUES		('LEADER_SENSHI_JANDAMARRA', 	'TRAIT_SENSHI_BUNUBA');
--==========================================================================================================================				
--==========================================================================================================================		