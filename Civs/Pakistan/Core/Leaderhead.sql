--==========================================================================================================================	
-- Leaders
--==========================================================================================================================			
INSERT INTO Leaders 
			(Type, 							Description, 						Civilopedia, 									CivilopediaTag, 								ArtDefineTag, 					VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 					PortraitIndex)
VALUES		('LEADER_SENSHI_JINNAH', 		'TXT_KEY_LEADER_SENSHI_JINNAH', 	'TXT_KEY_CIVILOPEDIA_LEADER_SENSHI_JINNAH', 	'TXT_KEY_CIVILOPEDIA_LEADERS_SENSHI_JINNAH', 	'Senshi_Jinnah_Scene.xml',		7, 						5, 						8, 							7, 			6, 				5, 				6, 						7, 				7, 			7, 			4, 				6, 			4, 			'SENSHI_PAKISTAN_ATLAS',		1);
--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================						
INSERT INTO Leader_MajorCivApproachBiases 
			(LeaderType, 					MajorCivApproachType, 				Bias)
VALUES		('LEADER_SENSHI_JINNAH', 		'MAJOR_CIV_APPROACH_WAR', 			5),
			('LEADER_SENSHI_JINNAH', 		'MAJOR_CIV_APPROACH_HOSTILE', 		4),
			('LEADER_SENSHI_JINNAH', 		'MAJOR_CIV_APPROACH_DECEPTIVE', 	6),
			('LEADER_SENSHI_JINNAH', 		'MAJOR_CIV_APPROACH_GUARDED', 		7),
			('LEADER_SENSHI_JINNAH', 		'MAJOR_CIV_APPROACH_AFRAID', 		3),
			('LEADER_SENSHI_JINNAH', 		'MAJOR_CIV_APPROACH_FRIENDLY', 		6),
			('LEADER_SENSHI_JINNAH', 		'MAJOR_CIV_APPROACH_NEUTRAL', 		4);
--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================						
INSERT INTO Leader_MinorCivApproachBiases 
			(LeaderType, 				MinorCivApproachType, 				Bias)
VALUES		('LEADER_SENSHI_JINNAH', 	'MINOR_CIV_APPROACH_IGNORE', 		3),
			('LEADER_SENSHI_JINNAH', 	'MINOR_CIV_APPROACH_FRIENDLY', 		8),
			('LEADER_SENSHI_JINNAH', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	5),
			('LEADER_SENSHI_JINNAH', 	'MINOR_CIV_APPROACH_CONQUEST', 		8),
			('LEADER_SENSHI_JINNAH', 	'MINOR_CIV_APPROACH_BULLY', 		4);
--==========================================================================================================================	
-- Leader_Flavors
--==========================================================================================================================						
INSERT INTO Leader_Flavors 
			(LeaderType, 				FlavorType, 						Flavor)
VALUES		('LEADER_SENSHI_JINNAH', 	'FLAVOR_OFFENSE', 					7),
			('LEADER_SENSHI_JINNAH', 	'FLAVOR_DEFENSE', 					8),
			('LEADER_SENSHI_JINNAH', 	'FLAVOR_CITY_DEFENSE', 				6),
			('LEADER_SENSHI_JINNAH', 	'FLAVOR_MILITARY_TRAINING', 		6),
			('LEADER_SENSHI_JINNAH', 	'FLAVOR_RECON', 					5),
			('LEADER_SENSHI_JINNAH', 	'FLAVOR_RANGED', 					6),
			('LEADER_SENSHI_JINNAH', 	'FLAVOR_MOBILE', 					7),
			('LEADER_SENSHI_JINNAH', 	'FLAVOR_NAVAL', 					5),
			('LEADER_SENSHI_JINNAH', 	'FLAVOR_NAVAL_RECON', 				5),
			('LEADER_SENSHI_JINNAH', 	'FLAVOR_NAVAL_GROWTH', 				9),
			('LEADER_SENSHI_JINNAH', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	6),
			('LEADER_SENSHI_JINNAH', 	'FLAVOR_AIR', 						7),
			('LEADER_SENSHI_JINNAH', 	'FLAVOR_EXPANSION', 				8),
			('LEADER_SENSHI_JINNAH', 	'FLAVOR_GROWTH', 					9),
			('LEADER_SENSHI_JINNAH', 	'FLAVOR_TILE_IMPROVEMENT', 			6),
			('LEADER_SENSHI_JINNAH', 	'FLAVOR_INFRASTRUCTURE', 			7),
			('LEADER_SENSHI_JINNAH', 	'FLAVOR_PRODUCTION', 				7),
			('LEADER_SENSHI_JINNAH', 	'FLAVOR_GOLD', 						6),
			('LEADER_SENSHI_JINNAH', 	'FLAVOR_SCIENCE', 					7),
			('LEADER_SENSHI_JINNAH', 	'FLAVOR_CULTURE', 					7),
			('LEADER_SENSHI_JINNAH', 	'FLAVOR_HAPPINESS', 				10),
			('LEADER_SENSHI_JINNAH', 	'FLAVOR_GREAT_PEOPLE', 				6),
			('LEADER_SENSHI_JINNAH', 	'FLAVOR_WONDER', 					5),
			('LEADER_SENSHI_JINNAH', 	'FLAVOR_RELIGION', 					10), --yes I know Jinnah was quite secular but this is Pakistan ffs, plus the civ is sorta reliant on it (not that biases actually do much anyway lol)
			('LEADER_SENSHI_JINNAH', 	'FLAVOR_DIPLOMACY', 				8),
			('LEADER_SENSHI_JINNAH', 	'FLAVOR_SPACESHIP', 				5),
			('LEADER_SENSHI_JINNAH', 	'FLAVOR_WATER_CONNECTION', 			5),
			('LEADER_SENSHI_JINNAH', 	'FLAVOR_NUKE', 						8),
			('LEADER_SENSHI_JINNAH', 	'FLAVOR_USE_NUKE', 					4),
			('LEADER_SENSHI_JINNAH', 	'FLAVOR_ESPIONAGE', 				6),
			('LEADER_SENSHI_JINNAH', 	'FLAVOR_AIRLIFT', 					7),
			('LEADER_SENSHI_JINNAH', 	'FLAVOR_I_TRADE_DESTINATION', 		6),
			('LEADER_SENSHI_JINNAH', 	'FLAVOR_I_TRADE_ORIGIN', 			6),
			('LEADER_SENSHI_JINNAH', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		6),
			('LEADER_SENSHI_JINNAH', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		7),
			('LEADER_SENSHI_JINNAH', 	'FLAVOR_ARCHAEOLOGY', 				5),
			('LEADER_SENSHI_JINNAH', 	'FLAVOR_AIR_CARRIER', 				4);
--==========================================================================================================================	
-- Leader_Traits
--==========================================================================================================================						
INSERT INTO Leader_Traits 
			(LeaderType, 				TraitType)
VALUES		('LEADER_SENSHI_JINNAH', 	'TRAIT_SENSHI_PAKISTAN');
--==========================================================================================================================				
--==========================================================================================================================		