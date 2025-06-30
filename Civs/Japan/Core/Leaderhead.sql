--==========================================================================================================================	
-- Leaders
--==========================================================================================================================			
INSERT INTO Leaders 
			(Type, 							Description, 						Civilopedia, 									CivilopediaTag, 									ArtDefineTag, 					VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 					PortraitIndex)
VALUES		('LEADER_SENSHI_HIDEYOSHI', 	'TXT_KEY_LEADER_SENSHI_HIDEYOSHI', 	'TXT_KEY_CIVILOPEDIA_LEADER_SENSHI_HIDEYOSHI', 	'TXT_KEY_CIVILOPEDIA_LEADERS_SENSHI_HIDEYOSHI', 	'Senshi_Hideyoshi_Scene.xml',	8, 						6, 						9, 							8, 			4, 				4, 				6, 						5, 				7, 			6, 			3, 				6, 			8, 			'SENSHI_HIDEYOSHI_ATLAS',		1);
--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================						
INSERT INTO Leader_MajorCivApproachBiases 
			(LeaderType, 				MajorCivApproachType, 				Bias)
VALUES		('LEADER_SENSHI_HIDEYOSHI', 		'MAJOR_CIV_APPROACH_WAR', 			7),
			('LEADER_SENSHI_HIDEYOSHI', 		'MAJOR_CIV_APPROACH_HOSTILE', 		6),
			('LEADER_SENSHI_HIDEYOSHI', 		'MAJOR_CIV_APPROACH_DECEPTIVE', 	5),
			('LEADER_SENSHI_HIDEYOSHI', 		'MAJOR_CIV_APPROACH_GUARDED', 		7),
			('LEADER_SENSHI_HIDEYOSHI', 		'MAJOR_CIV_APPROACH_AFRAID', 		4),
			('LEADER_SENSHI_HIDEYOSHI', 		'MAJOR_CIV_APPROACH_FRIENDLY', 		5),
			('LEADER_SENSHI_HIDEYOSHI', 		'MAJOR_CIV_APPROACH_NEUTRAL', 		5);
--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================						
INSERT INTO Leader_MinorCivApproachBiases 
			(LeaderType, 			MinorCivApproachType, 				Bias)
VALUES		('LEADER_SENSHI_HIDEYOSHI', 	'MINOR_CIV_APPROACH_IGNORE', 		5),
			('LEADER_SENSHI_HIDEYOSHI', 	'MINOR_CIV_APPROACH_FRIENDLY', 		5),
			('LEADER_SENSHI_HIDEYOSHI', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	6),
			('LEADER_SENSHI_HIDEYOSHI', 	'MINOR_CIV_APPROACH_CONQUEST', 		7),
			('LEADER_SENSHI_HIDEYOSHI', 	'MINOR_CIV_APPROACH_BULLY', 		9);
--==========================================================================================================================	
-- Leader_Flavors
--==========================================================================================================================						
INSERT INTO Leader_Flavors 
			(LeaderType, 					FlavorType, 						Flavor)
VALUES		('LEADER_SENSHI_HIDEYOSHI', 	'FLAVOR_OFFENSE', 					9),
			('LEADER_SENSHI_HIDEYOSHI', 	'FLAVOR_DEFENSE', 					8),
			('LEADER_SENSHI_HIDEYOSHI', 	'FLAVOR_CITY_DEFENSE', 				9),
			('LEADER_SENSHI_HIDEYOSHI', 	'FLAVOR_MILITARY_TRAINING', 		8),
			('LEADER_SENSHI_HIDEYOSHI', 	'FLAVOR_RECON', 					4),
			('LEADER_SENSHI_HIDEYOSHI', 	'FLAVOR_RANGED', 					6),
			('LEADER_SENSHI_HIDEYOSHI', 	'FLAVOR_MOBILE', 					5),
			('LEADER_SENSHI_HIDEYOSHI', 	'FLAVOR_NAVAL', 					6),
			('LEADER_SENSHI_HIDEYOSHI', 	'FLAVOR_NAVAL_RECON', 				6),
			('LEADER_SENSHI_HIDEYOSHI', 	'FLAVOR_NAVAL_GROWTH', 				7),
			('LEADER_SENSHI_HIDEYOSHI', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	6),
			('LEADER_SENSHI_HIDEYOSHI', 	'FLAVOR_AIR', 						8),
			('LEADER_SENSHI_HIDEYOSHI', 	'FLAVOR_EXPANSION', 				9),
			('LEADER_SENSHI_HIDEYOSHI', 	'FLAVOR_GROWTH', 					6),
			('LEADER_SENSHI_HIDEYOSHI', 	'FLAVOR_TILE_IMPROVEMENT', 			7),
			('LEADER_SENSHI_HIDEYOSHI', 	'FLAVOR_INFRASTRUCTURE', 			6),
			('LEADER_SENSHI_HIDEYOSHI', 	'FLAVOR_PRODUCTION', 				8),
			('LEADER_SENSHI_HIDEYOSHI', 	'FLAVOR_GOLD', 						7),
			('LEADER_SENSHI_HIDEYOSHI', 	'FLAVOR_SCIENCE', 					6),
			('LEADER_SENSHI_HIDEYOSHI', 	'FLAVOR_CULTURE', 					6),
			('LEADER_SENSHI_HIDEYOSHI', 	'FLAVOR_HAPPINESS', 				6),
			('LEADER_SENSHI_HIDEYOSHI', 	'FLAVOR_GREAT_PEOPLE', 				5),
			('LEADER_SENSHI_HIDEYOSHI', 	'FLAVOR_WONDER', 					5),
			('LEADER_SENSHI_HIDEYOSHI', 	'FLAVOR_RELIGION', 					4),
			('LEADER_SENSHI_HIDEYOSHI', 	'FLAVOR_DIPLOMACY', 				8),
			('LEADER_SENSHI_HIDEYOSHI', 	'FLAVOR_SPACESHIP', 				5),
			('LEADER_SENSHI_HIDEYOSHI', 	'FLAVOR_WATER_CONNECTION', 			6),
			('LEADER_SENSHI_HIDEYOSHI', 	'FLAVOR_NUKE', 						8),
			('LEADER_SENSHI_HIDEYOSHI', 	'FLAVOR_USE_NUKE', 					3),
			('LEADER_SENSHI_HIDEYOSHI', 	'FLAVOR_ESPIONAGE', 				5),
			('LEADER_SENSHI_HIDEYOSHI', 	'FLAVOR_AIRLIFT', 					4),
			('LEADER_SENSHI_HIDEYOSHI', 	'FLAVOR_I_TRADE_DESTINATION', 		4),
			('LEADER_SENSHI_HIDEYOSHI', 	'FLAVOR_I_TRADE_ORIGIN', 			4),
			('LEADER_SENSHI_HIDEYOSHI', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
			('LEADER_SENSHI_HIDEYOSHI', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		4),
			('LEADER_SENSHI_HIDEYOSHI', 	'FLAVOR_ARCHAEOLOGY', 				4),
			('LEADER_SENSHI_HIDEYOSHI', 	'FLAVOR_AIR_CARRIER', 				4);
--==========================================================================================================================	
-- Leader_Traits
--==========================================================================================================================						
INSERT INTO Leader_Traits 
			(LeaderType, 			TraitType)
VALUES		('LEADER_SENSHI_HIDEYOSHI', 	'TRAIT_SENSHI_HIDEYOSHI');
--==========================================================================================================================				
--==========================================================================================================================		