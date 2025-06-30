--==========================================================================================================================	
-- Leaders
--==========================================================================================================================			
INSERT INTO Leaders 
			(Type, 								Description, 								Civilopedia, 											CivilopediaTag, 										ArtDefineTag, 					VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 					PortraitIndex)
VALUES		('LEADER_SENSHI_MUJIBUR_RAHMAN', 	'TXT_KEY_LEADER_SENSHI_MUJIBUR_RAHMAN', 	'TXT_KEY_CIVILOPEDIA_LEADER_SENSHI_MUJIBUR_RAHMAN', 	'TXT_KEY_CIVILOPEDIA_LEADERS_SENSHI_MUJIBUR_RAHMAN', 	'Senshi_Mujibur_Scene.xml',		5, 						4, 						5, 							9, 			4, 				9, 				6, 						7, 				5, 			8, 			4, 				5, 			4, 			'SENSHI_BANGLADESH_ATLAS',		1);
--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================						
INSERT INTO Leader_MajorCivApproachBiases 
			(LeaderType, 					MajorCivApproachType, 				Bias)
VALUES		('LEADER_SENSHI_MUJIBUR_RAHMAN', 		'MAJOR_CIV_APPROACH_WAR', 			4),
			('LEADER_SENSHI_MUJIBUR_RAHMAN', 		'MAJOR_CIV_APPROACH_HOSTILE', 		5),
			('LEADER_SENSHI_MUJIBUR_RAHMAN', 		'MAJOR_CIV_APPROACH_DECEPTIVE', 	6),
			('LEADER_SENSHI_MUJIBUR_RAHMAN', 		'MAJOR_CIV_APPROACH_GUARDED', 		7),
			('LEADER_SENSHI_MUJIBUR_RAHMAN', 		'MAJOR_CIV_APPROACH_AFRAID', 		6),
			('LEADER_SENSHI_MUJIBUR_RAHMAN', 		'MAJOR_CIV_APPROACH_FRIENDLY', 		8),
			('LEADER_SENSHI_MUJIBUR_RAHMAN', 		'MAJOR_CIV_APPROACH_NEUTRAL', 		5);
--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================						
INSERT INTO Leader_MinorCivApproachBiases 
			(LeaderType, 				MinorCivApproachType, 				Bias)
VALUES		('LEADER_SENSHI_MUJIBUR_RAHMAN', 	'MINOR_CIV_APPROACH_IGNORE', 		6),
			('LEADER_SENSHI_MUJIBUR_RAHMAN', 	'MINOR_CIV_APPROACH_FRIENDLY', 		6),
			('LEADER_SENSHI_MUJIBUR_RAHMAN', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	4),
			('LEADER_SENSHI_MUJIBUR_RAHMAN', 	'MINOR_CIV_APPROACH_CONQUEST', 		3),
			('LEADER_SENSHI_MUJIBUR_RAHMAN', 	'MINOR_CIV_APPROACH_BULLY', 		3);
--==========================================================================================================================	
-- Leader_Flavors
--==========================================================================================================================						
INSERT INTO Leader_Flavors 
			(LeaderType, 				FlavorType, 						Flavor)
VALUES		('LEADER_SENSHI_MUJIBUR_RAHMAN', 	'FLAVOR_OFFENSE', 					5),
			('LEADER_SENSHI_MUJIBUR_RAHMAN', 	'FLAVOR_DEFENSE', 					8),
			('LEADER_SENSHI_MUJIBUR_RAHMAN', 	'FLAVOR_CITY_DEFENSE', 				7),
			('LEADER_SENSHI_MUJIBUR_RAHMAN', 	'FLAVOR_MILITARY_TRAINING', 		5),
			('LEADER_SENSHI_MUJIBUR_RAHMAN', 	'FLAVOR_RECON', 					4),
			('LEADER_SENSHI_MUJIBUR_RAHMAN', 	'FLAVOR_RANGED', 					8),
			('LEADER_SENSHI_MUJIBUR_RAHMAN', 	'FLAVOR_MOBILE', 					5),
			('LEADER_SENSHI_MUJIBUR_RAHMAN', 	'FLAVOR_NAVAL', 					4),
			('LEADER_SENSHI_MUJIBUR_RAHMAN', 	'FLAVOR_NAVAL_RECON', 				4),
			('LEADER_SENSHI_MUJIBUR_RAHMAN', 	'FLAVOR_NAVAL_GROWTH', 				9),
			('LEADER_SENSHI_MUJIBUR_RAHMAN', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	7),
			('LEADER_SENSHI_MUJIBUR_RAHMAN', 	'FLAVOR_AIR', 						6),
			('LEADER_SENSHI_MUJIBUR_RAHMAN', 	'FLAVOR_EXPANSION', 				5),
			('LEADER_SENSHI_MUJIBUR_RAHMAN', 	'FLAVOR_GROWTH', 					12),
			('LEADER_SENSHI_MUJIBUR_RAHMAN', 	'FLAVOR_TILE_IMPROVEMENT', 			6),
			('LEADER_SENSHI_MUJIBUR_RAHMAN', 	'FLAVOR_INFRASTRUCTURE', 			6),
			('LEADER_SENSHI_MUJIBUR_RAHMAN', 	'FLAVOR_PRODUCTION', 				5),
			('LEADER_SENSHI_MUJIBUR_RAHMAN', 	'FLAVOR_GOLD', 						5),
			('LEADER_SENSHI_MUJIBUR_RAHMAN', 	'FLAVOR_SCIENCE', 					6),
			('LEADER_SENSHI_MUJIBUR_RAHMAN', 	'FLAVOR_CULTURE', 					8),
			('LEADER_SENSHI_MUJIBUR_RAHMAN', 	'FLAVOR_HAPPINESS', 				11),
			('LEADER_SENSHI_MUJIBUR_RAHMAN', 	'FLAVOR_GREAT_PEOPLE', 				5),
			('LEADER_SENSHI_MUJIBUR_RAHMAN', 	'FLAVOR_WONDER', 					4),
			('LEADER_SENSHI_MUJIBUR_RAHMAN', 	'FLAVOR_RELIGION', 					6),
			('LEADER_SENSHI_MUJIBUR_RAHMAN', 	'FLAVOR_DIPLOMACY', 				8),
			('LEADER_SENSHI_MUJIBUR_RAHMAN', 	'FLAVOR_SPACESHIP', 				4),
			('LEADER_SENSHI_MUJIBUR_RAHMAN', 	'FLAVOR_WATER_CONNECTION', 			6),
			('LEADER_SENSHI_MUJIBUR_RAHMAN', 	'FLAVOR_NUKE', 						4),
			('LEADER_SENSHI_MUJIBUR_RAHMAN', 	'FLAVOR_USE_NUKE', 					3),
			('LEADER_SENSHI_MUJIBUR_RAHMAN', 	'FLAVOR_ESPIONAGE', 				5),
			('LEADER_SENSHI_MUJIBUR_RAHMAN', 	'FLAVOR_AIRLIFT', 					5),
			('LEADER_SENSHI_MUJIBUR_RAHMAN', 	'FLAVOR_I_TRADE_DESTINATION', 		5),
			('LEADER_SENSHI_MUJIBUR_RAHMAN', 	'FLAVOR_I_TRADE_ORIGIN', 			5),
			('LEADER_SENSHI_MUJIBUR_RAHMAN', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
			('LEADER_SENSHI_MUJIBUR_RAHMAN', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
			('LEADER_SENSHI_MUJIBUR_RAHMAN', 	'FLAVOR_ARCHAEOLOGY', 				3),
			('LEADER_SENSHI_MUJIBUR_RAHMAN', 	'FLAVOR_AIR_CARRIER', 				4);
--==========================================================================================================================	
-- Leader_Traits
--==========================================================================================================================						
INSERT INTO Leader_Traits 
			(LeaderType, 				TraitType)
VALUES		('LEADER_SENSHI_MUJIBUR_RAHMAN', 	'TRAIT_SENSHI_BANGLADESH');
--==========================================================================================================================				
--==========================================================================================================================		