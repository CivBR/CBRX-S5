--==========================================================================================================================	
-- Leaders
--==========================================================================================================================			
INSERT INTO Leaders 
			(Type, 								Description, 						Civilopedia, 									CivilopediaTag, 									ArtDefineTag, 						VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 					PortraitIndex)
VALUES		('LEADER_SENSHI_MACARTHUR', 		'TXT_KEY_LEADER_SENSHI_MACARTHUR', 	'TXT_KEY_CIVILOPEDIA_LEADER_SENSHI_MACARTHUR', 	'TXT_KEY_CIVILOPEDIA_LEADERS_SENSHI_MACARTHUR', 	'Senshi_Macarthur_Scene.xml',		4, 						4, 						6, 							7, 			7, 				4, 				6, 						8, 				4, 			8, 			2, 				7, 			6, 			'SENSHI_NEW_SOUTH_WALES_ATLAS',		1);
--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================						
INSERT INTO Leader_MajorCivApproachBiases 
			(LeaderType, 						MajorCivApproachType, 				Bias)
VALUES		('LEADER_SENSHI_MACARTHUR', 		'MAJOR_CIV_APPROACH_WAR', 			4),
			('LEADER_SENSHI_MACARTHUR', 		'MAJOR_CIV_APPROACH_HOSTILE', 		4),
			('LEADER_SENSHI_MACARTHUR', 		'MAJOR_CIV_APPROACH_DECEPTIVE', 	6),
			('LEADER_SENSHI_MACARTHUR', 		'MAJOR_CIV_APPROACH_GUARDED', 		7),
			('LEADER_SENSHI_MACARTHUR', 		'MAJOR_CIV_APPROACH_AFRAID', 		6),
			('LEADER_SENSHI_MACARTHUR', 		'MAJOR_CIV_APPROACH_FRIENDLY', 		8),
			('LEADER_SENSHI_MACARTHUR', 		'MAJOR_CIV_APPROACH_NEUTRAL', 		6);
--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================						
INSERT INTO Leader_MinorCivApproachBiases 
			(LeaderType, 					MinorCivApproachType, 				Bias)
VALUES		('LEADER_SENSHI_MACARTHUR', 	'MINOR_CIV_APPROACH_IGNORE', 		5),
			('LEADER_SENSHI_MACARTHUR', 	'MINOR_CIV_APPROACH_FRIENDLY', 		7),
			('LEADER_SENSHI_MACARTHUR', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	4),
			('LEADER_SENSHI_MACARTHUR', 	'MINOR_CIV_APPROACH_CONQUEST', 		5),
			('LEADER_SENSHI_MACARTHUR', 	'MINOR_CIV_APPROACH_BULLY', 		7);
--==========================================================================================================================	
-- Leader_Flavors
--==========================================================================================================================						
INSERT INTO Leader_Flavors 
			(LeaderType, 					FlavorType,							Flavor)
VALUES		('LEADER_SENSHI_MACARTHUR', 	'FLAVOR_OFFENSE', 					7),
			('LEADER_SENSHI_MACARTHUR', 	'FLAVOR_DEFENSE', 					7),
			('LEADER_SENSHI_MACARTHUR', 	'FLAVOR_CITY_DEFENSE', 				4),
			('LEADER_SENSHI_MACARTHUR', 	'FLAVOR_MILITARY_TRAINING', 		6),
			('LEADER_SENSHI_MACARTHUR', 	'FLAVOR_RECON', 					5),
			('LEADER_SENSHI_MACARTHUR', 	'FLAVOR_RANGED', 					5),
			('LEADER_SENSHI_MACARTHUR', 	'FLAVOR_MOBILE', 					6),
			('LEADER_SENSHI_MACARTHUR', 	'FLAVOR_NAVAL', 					6),
			('LEADER_SENSHI_MACARTHUR', 	'FLAVOR_NAVAL_RECON', 				8),
			('LEADER_SENSHI_MACARTHUR', 	'FLAVOR_NAVAL_GROWTH', 				7),
			('LEADER_SENSHI_MACARTHUR', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	9),
			('LEADER_SENSHI_MACARTHUR', 	'FLAVOR_AIR', 						8),
			('LEADER_SENSHI_MACARTHUR', 	'FLAVOR_EXPANSION', 				8),
			('LEADER_SENSHI_MACARTHUR', 	'FLAVOR_GROWTH', 					5),
			('LEADER_SENSHI_MACARTHUR', 	'FLAVOR_TILE_IMPROVEMENT', 			9),
			('LEADER_SENSHI_MACARTHUR', 	'FLAVOR_INFRASTRUCTURE', 			9),
			('LEADER_SENSHI_MACARTHUR', 	'FLAVOR_PRODUCTION', 				7),
			('LEADER_SENSHI_MACARTHUR', 	'FLAVOR_GOLD', 						10),
			('LEADER_SENSHI_MACARTHUR', 	'FLAVOR_SCIENCE', 					7),
			('LEADER_SENSHI_MACARTHUR', 	'FLAVOR_CULTURE', 					5),
			('LEADER_SENSHI_MACARTHUR', 	'FLAVOR_HAPPINESS', 				6),
			('LEADER_SENSHI_MACARTHUR', 	'FLAVOR_GREAT_PEOPLE', 				5),
			('LEADER_SENSHI_MACARTHUR', 	'FLAVOR_WONDER', 					5),
			('LEADER_SENSHI_MACARTHUR', 	'FLAVOR_RELIGION', 					3),
			('LEADER_SENSHI_MACARTHUR', 	'FLAVOR_DIPLOMACY', 				9),
			('LEADER_SENSHI_MACARTHUR', 	'FLAVOR_SPACESHIP', 				4),
			('LEADER_SENSHI_MACARTHUR', 	'FLAVOR_WATER_CONNECTION', 			8),
			('LEADER_SENSHI_MACARTHUR', 	'FLAVOR_NUKE', 						6),
			('LEADER_SENSHI_MACARTHUR', 	'FLAVOR_USE_NUKE', 					4),
			('LEADER_SENSHI_MACARTHUR', 	'FLAVOR_ESPIONAGE', 				7),
			('LEADER_SENSHI_MACARTHUR', 	'FLAVOR_AIRLIFT', 					6),
			('LEADER_SENSHI_MACARTHUR', 	'FLAVOR_I_TRADE_DESTINATION', 		9),
			('LEADER_SENSHI_MACARTHUR', 	'FLAVOR_I_TRADE_ORIGIN', 			9),
			('LEADER_SENSHI_MACARTHUR', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		9),
			('LEADER_SENSHI_MACARTHUR', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		9),
			('LEADER_SENSHI_MACARTHUR', 	'FLAVOR_ARCHAEOLOGY', 				4),
			('LEADER_SENSHI_MACARTHUR', 	'FLAVOR_AIR_CARRIER', 				4);
--==========================================================================================================================	
-- Leader_Traits
--==========================================================================================================================						
INSERT INTO Leader_Traits 
			(LeaderType, 			TraitType)
VALUES		('LEADER_SENSHI_MACARTHUR', 	'TRAIT_SENSHI_NEW_SOUTH_WALES');
--==========================================================================================================================				
--==========================================================================================================================		