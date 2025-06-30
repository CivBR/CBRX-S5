--==========================================================================================================================	
-- Leaders
--==========================================================================================================================			
INSERT INTO Leaders 
			(Type, 							Description, 						Civilopedia, 									CivilopediaTag, 								ArtDefineTag, 					VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 					PortraitIndex)
VALUES		('LEADER_SENSHI_LONG_YUN', 		'TXT_KEY_LEADER_SENSHI_LONG_YUN', 	'TXT_KEY_CIVILOPEDIA_LEADER_SENSHI_LONG_YUN', 	'TXT_KEY_CIVILOPEDIA_LEADERS_SENSHI_LONG_YUN', 	'Senshi_LongYun_Scene.xml',		6, 						3, 						6, 							9, 			6, 				6, 				7, 						6, 				7, 			6, 			4, 				3, 			6, 			'SENSHI_YUNNAN_ATLAS',		1);
--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================						
INSERT INTO Leader_MajorCivApproachBiases 
			(LeaderType, 				MajorCivApproachType, 				Bias)
VALUES		('LEADER_SENSHI_LONG_YUN', 		'MAJOR_CIV_APPROACH_WAR', 			5),
			('LEADER_SENSHI_LONG_YUN', 		'MAJOR_CIV_APPROACH_HOSTILE', 		4),
			('LEADER_SENSHI_LONG_YUN', 		'MAJOR_CIV_APPROACH_DECEPTIVE', 	3),
			('LEADER_SENSHI_LONG_YUN', 		'MAJOR_CIV_APPROACH_GUARDED', 		9),
			('LEADER_SENSHI_LONG_YUN', 		'MAJOR_CIV_APPROACH_AFRAID', 		2),
			('LEADER_SENSHI_LONG_YUN', 		'MAJOR_CIV_APPROACH_FRIENDLY', 		5),
			('LEADER_SENSHI_LONG_YUN', 		'MAJOR_CIV_APPROACH_NEUTRAL', 		6);
--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================						
INSERT INTO Leader_MinorCivApproachBiases 
			(LeaderType, 			MinorCivApproachType, 				Bias)
VALUES		('LEADER_SENSHI_LONG_YUN', 	'MINOR_CIV_APPROACH_IGNORE', 		5),
			('LEADER_SENSHI_LONG_YUN', 	'MINOR_CIV_APPROACH_FRIENDLY', 		7),
			('LEADER_SENSHI_LONG_YUN', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	5),
			('LEADER_SENSHI_LONG_YUN', 	'MINOR_CIV_APPROACH_CONQUEST', 		5),
			('LEADER_SENSHI_LONG_YUN', 	'MINOR_CIV_APPROACH_BULLY', 		7);
--==========================================================================================================================	
-- Leader_Flavors
--==========================================================================================================================						
INSERT INTO Leader_Flavors 
			(LeaderType, 			FlavorType, 						Flavor)
VALUES		('LEADER_SENSHI_LONG_YUN', 	'FLAVOR_OFFENSE', 					4),
			('LEADER_SENSHI_LONG_YUN', 	'FLAVOR_DEFENSE', 					8),
			('LEADER_SENSHI_LONG_YUN', 	'FLAVOR_CITY_DEFENSE', 				10),
			('LEADER_SENSHI_LONG_YUN', 	'FLAVOR_MILITARY_TRAINING', 		8),
			('LEADER_SENSHI_LONG_YUN', 	'FLAVOR_RECON', 					3),
			('LEADER_SENSHI_LONG_YUN', 	'FLAVOR_RANGED', 					6),
			('LEADER_SENSHI_LONG_YUN', 	'FLAVOR_MOBILE', 					4),
			('LEADER_SENSHI_LONG_YUN', 	'FLAVOR_NAVAL', 					3),
			('LEADER_SENSHI_LONG_YUN', 	'FLAVOR_NAVAL_RECON', 				3),
			('LEADER_SENSHI_LONG_YUN', 	'FLAVOR_NAVAL_GROWTH', 				3),
			('LEADER_SENSHI_LONG_YUN', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	3),
			('LEADER_SENSHI_LONG_YUN', 	'FLAVOR_AIR', 						9),
			('LEADER_SENSHI_LONG_YUN', 	'FLAVOR_EXPANSION', 				7),
			('LEADER_SENSHI_LONG_YUN', 	'FLAVOR_GROWTH', 					5),
			('LEADER_SENSHI_LONG_YUN', 	'FLAVOR_TILE_IMPROVEMENT', 			7),
			('LEADER_SENSHI_LONG_YUN', 	'FLAVOR_INFRASTRUCTURE', 			6),
			('LEADER_SENSHI_LONG_YUN', 	'FLAVOR_PRODUCTION', 				8),
			('LEADER_SENSHI_LONG_YUN', 	'FLAVOR_GOLD', 						5),
			('LEADER_SENSHI_LONG_YUN', 	'FLAVOR_SCIENCE', 					7),
			('LEADER_SENSHI_LONG_YUN', 	'FLAVOR_CULTURE', 					4),
			('LEADER_SENSHI_LONG_YUN', 	'FLAVOR_HAPPINESS', 				5),
			('LEADER_SENSHI_LONG_YUN', 	'FLAVOR_GREAT_PEOPLE', 				4),
			('LEADER_SENSHI_LONG_YUN', 	'FLAVOR_WONDER', 					3),
			('LEADER_SENSHI_LONG_YUN', 	'FLAVOR_RELIGION', 					3),
			('LEADER_SENSHI_LONG_YUN', 	'FLAVOR_DIPLOMACY', 				5),
			('LEADER_SENSHI_LONG_YUN', 	'FLAVOR_SPACESHIP', 				4),
			('LEADER_SENSHI_LONG_YUN', 	'FLAVOR_WATER_CONNECTION', 			5),
			('LEADER_SENSHI_LONG_YUN', 	'FLAVOR_NUKE', 						5),
			('LEADER_SENSHI_LONG_YUN', 	'FLAVOR_USE_NUKE', 					4),
			('LEADER_SENSHI_LONG_YUN', 	'FLAVOR_ESPIONAGE', 				6),
			('LEADER_SENSHI_LONG_YUN', 	'FLAVOR_AIRLIFT', 					10),
			('LEADER_SENSHI_LONG_YUN', 	'FLAVOR_I_TRADE_DESTINATION', 		5),
			('LEADER_SENSHI_LONG_YUN', 	'FLAVOR_I_TRADE_ORIGIN', 			5),
			('LEADER_SENSHI_LONG_YUN', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		4),
			('LEADER_SENSHI_LONG_YUN', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		6),
			('LEADER_SENSHI_LONG_YUN', 	'FLAVOR_ARCHAEOLOGY', 				3),
			('LEADER_SENSHI_LONG_YUN', 	'FLAVOR_AIR_CARRIER', 				3);
--==========================================================================================================================	
-- Leader_Traits
--==========================================================================================================================						
INSERT INTO Leader_Traits 
			(LeaderType, 			TraitType)
VALUES		('LEADER_SENSHI_LONG_YUN', 	'TRAIT_SENSHI_YUNNAN');
--==========================================================================================================================				
--==========================================================================================================================		