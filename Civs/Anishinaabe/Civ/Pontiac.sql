--==========================================================================================================================	
-- Leaders
--==========================================================================================================================			
INSERT INTO Leaders 
			(Type, 						Description, 						Civilopedia, 							CivilopediaTag, 								ArtDefineTag, 				VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 				PortraitIndex)
VALUES		('LEADER_CLPONTIAC',		'TXT_KEY_LEADER_CLPONTIAC', 		'TXT_KEY_LEADER_CLPONTIAC_PEDIA', 		'TXT_KEY_CIVILOPEDIA_LEADERS_CLPONTIAC', 		'CLPontiac_Scene.xml',		8, 						3, 						8, 							8, 			4, 				4, 				9, 						7, 				8, 			3, 			3, 				3, 			5, 			'CLANISHINAABE_ATLAS', 	1);
--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================						
INSERT INTO Leader_MajorCivApproachBiases 
			(LeaderType, 				MajorCivApproachType, 				Bias)
VALUES		('LEADER_CLPONTIAC', 	'MAJOR_CIV_APPROACH_WAR', 				5),
			('LEADER_CLPONTIAC', 	'MAJOR_CIV_APPROACH_HOSTILE', 			7),
			('LEADER_CLPONTIAC', 	'MAJOR_CIV_APPROACH_DECEPTIVE', 		5),
			('LEADER_CLPONTIAC', 	'MAJOR_CIV_APPROACH_GUARDED', 			6),
			('LEADER_CLPONTIAC', 	'MAJOR_CIV_APPROACH_AFRAID', 			2),
			('LEADER_CLPONTIAC', 	'MAJOR_CIV_APPROACH_FRIENDLY', 			5),
			('LEADER_CLPONTIAC', 	'MAJOR_CIV_APPROACH_NEUTRAL', 			5);
--==========================================================================================================================	
-- Leader_MinorCivApproachBiases
--==========================================================================================================================						
INSERT INTO Leader_MinorCivApproachBiases 
			(LeaderType, 				MinorCivApproachType, 				Bias)
VALUES		('LEADER_CLPONTIAC', 		'MINOR_CIV_APPROACH_IGNORE', 		2),
			('LEADER_CLPONTIAC', 		'MINOR_CIV_APPROACH_FRIENDLY', 		8),
			('LEADER_CLPONTIAC', 		'MINOR_CIV_APPROACH_PROTECTIVE', 	7),
			('LEADER_CLPONTIAC', 		'MINOR_CIV_APPROACH_CONQUEST', 		4),
			('LEADER_CLPONTIAC', 		'MINOR_CIV_APPROACH_BULLY', 		2);
--==========================================================================================================================	
-- Leader_Flavors
--==========================================================================================================================						
INSERT INTO Leader_Flavors 
			(LeaderType, 				FlavorType, 						Flavor)
VALUES		('LEADER_CLPONTIAC', 		'FLAVOR_OFFENSE', 					7),
			('LEADER_CLPONTIAC', 		'FLAVOR_DEFENSE', 					4),
			('LEADER_CLPONTIAC', 		'FLAVOR_CITY_DEFENSE', 				5),
			('LEADER_CLPONTIAC', 		'FLAVOR_MILITARY_TRAINING', 		5),
			('LEADER_CLPONTIAC', 		'FLAVOR_RECON', 					3),
			('LEADER_CLPONTIAC', 		'FLAVOR_RANGED', 					6),
			('LEADER_CLPONTIAC', 		'FLAVOR_MOBILE', 					4),
			('LEADER_CLPONTIAC', 		'FLAVOR_NAVAL', 					4),
			('LEADER_CLPONTIAC', 		'FLAVOR_NAVAL_RECON', 				3),
			('LEADER_CLPONTIAC', 		'FLAVOR_NAVAL_GROWTH', 				4),
			('LEADER_CLPONTIAC', 		'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	6),
			('LEADER_CLPONTIAC', 		'FLAVOR_AIR', 						4),
			('LEADER_CLPONTIAC', 		'FLAVOR_EXPANSION', 				4),
			('LEADER_CLPONTIAC', 		'FLAVOR_GROWTH', 					4),
			('LEADER_CLPONTIAC', 		'FLAVOR_TILE_IMPROVEMENT', 			4),
			('LEADER_CLPONTIAC', 		'FLAVOR_INFRASTRUCTURE', 			4),
			('LEADER_CLPONTIAC', 		'FLAVOR_PRODUCTION', 				7),
			('LEADER_CLPONTIAC', 		'FLAVOR_GOLD', 						8),
			('LEADER_CLPONTIAC', 		'FLAVOR_SCIENCE', 					8),
			('LEADER_CLPONTIAC', 		'FLAVOR_CULTURE', 					4),
			('LEADER_CLPONTIAC', 		'FLAVOR_HAPPINESS', 				8),
			('LEADER_CLPONTIAC', 		'FLAVOR_GREAT_PEOPLE', 				4),
			('LEADER_CLPONTIAC', 		'FLAVOR_WONDER', 					8),
			('LEADER_CLPONTIAC', 		'FLAVOR_RELIGION', 					8),
			('LEADER_CLPONTIAC', 		'FLAVOR_DIPLOMACY', 				4),
			('LEADER_CLPONTIAC', 		'FLAVOR_SPACESHIP', 				6),
			('LEADER_CLPONTIAC', 		'FLAVOR_WATER_CONNECTION', 			6),
			('LEADER_CLPONTIAC', 		'FLAVOR_NUKE', 						4),
			('LEADER_CLPONTIAC', 		'FLAVOR_USE_NUKE', 					8),
			('LEADER_CLPONTIAC', 		'FLAVOR_ESPIONAGE', 				3),
			('LEADER_CLPONTIAC', 		'FLAVOR_AIRLIFT', 					9),
			('LEADER_CLPONTIAC', 		'FLAVOR_I_TRADE_DESTINATION', 		9),
			('LEADER_CLPONTIAC', 		'FLAVOR_I_TRADE_ORIGIN', 			9),
			('LEADER_CLPONTIAC', 		'FLAVOR_I_SEA_TRADE_ROUTE', 		6),
			('LEADER_CLPONTIAC', 		'FLAVOR_I_LAND_TRADE_ROUTE', 		6),
			('LEADER_CLPONTIAC', 		'FLAVOR_ARCHAEOLOGY', 				4),
			('LEADER_CLPONTIAC', 		'FLAVOR_AIR_CARRIER', 				9);
--==========================================================================================================================	
-- Leader_Traits
--==========================================================================================================================	
INSERT INTO Leader_Traits 
			(LeaderType, 				TraitType)
VALUES		('LEADER_CLPONTIAC', 		'TRAIT_CLANISHINAABE');
--==========================================================================================================================				
--==========================================================================================================================		

--==========================================================================================================================	
-- Language_en_US
--==========================================================================================================================		
INSERT INTO Language_en_US
			(Tag,											Text)
VALUES		('TXT_KEY_LEADER_CLPONTIAC',					'Pontiac'),
			('TXT_KEY_LEADER_CLPONTIAC_PEDIA',				'Pontiac'),
			('TXT_KEY_CIVILOPEDIA_LEADERS_CLPONTIAC',		'Pontiac'),
			('TXT_KEY_CIVILOPEDIA_LEADERS_CLPONTIAC_NAME', 'Pontiac'),
			('TXT_KEY_CIVILOPEDIA_LEADERS_CLPONTIAC_SUBTITLE', 'Counterinsurgent Midewewin'),
			('TXT_KEY_CIVILOPEDIA_LEADERS_CLPONTIAC_HEADING_1', 'Pontiac'),
			('TXT_KEY_CIVILOPEDIA_LEADERS_CLPONTIAC_TEXT_1', 'Somewhere along the river Detroit in the New French up-country or pays d''en haut, between 1712 and 1725 CE, a child named Obwandiyag was born to an Odawa mother and Ojibwa father. This is about as much as can be gleaned from contemporary sources - and indeed, there is some debate to this day as to whether or not his father was actually a Miami. Regardless, this child, the young Pontiac, was always identified as an Odawa, and a fine specimen at that; becoming the leader of a warband at a fairly early age. It was more his skill at forging alliances, and powerful orator''s voice that earned him his fame - that and a play from 1760 written by a famous British frontiersman called Robert Rogers, who codified Ranger doctrine still in use today by the American military machine.'),
			('TXT_KEY_CIVILOPEDIA_LEADERS_CLPONTIAC_HEADING_2', 'A Leader of the Anishinaabe'),
			('TXT_KEY_CIVILOPEDIA_LEADERS_CLPONTIAC_TEXT_2', 'Pontiac was not the leader of the Council of Three Fires, as in, he was not some sort of king or lord of the Council. He did not head the Council, nor did the Council listen to him. Yet, in many ways, Pontiac embodied the Council of Three Fires. He was an Odawa, skilled in trade and commerce, in diplomacy and oration. Oration, and the art of speaking, was something that Pontiac is rightfully legendary for, even without romantic embellishment. He was recorded as giving speeches in the natural amphitheaters and on hilltops, his resonant voice booming out for miles. But, more than that, Pontiac''s power came from his people''s traditions - even though he was not considered an Ojibwe, he was one of them in spirit; a Midew.'),
			('TXT_KEY_CIVILOPEDIA_LEADERS_CLPONTIAC_HEADING_3', 'Midewiwin'),
			('TXT_KEY_CIVILOPEDIA_LEADERS_CLPONTIAC_TEXT_3', 'Midewiwin (singular: Midew) is the religion of the Anishinaabe. Midew beliefs are shared by many of the peoples of what is now the Eastern United States. Practitioners of Midewiwin are keepers of the secrets of medicine, nature, history, and of the spirits, and as such, they do not share their beliefs and knowledge with just anyone. Only the most worthy are allowed to become Midew, and Pontiac was one of these most worthy.'),
			('TXT_KEY_CIVILOPEDIA_LEADERS_CLPONTIAC_HEADING_4', 'A Brewing Storm'),
			('TXT_KEY_CIVILOPEDIA_LEADERS_CLPONTIAC_TEXT_4', 'In 1760, the British defeated the French in the colonies; Pontiac, being a loyal sort, refused to let his people and French allies down in the face of British oppression. At the same time, a religious and cultural revival was underway. A prophet had been revealed among the Midewiwin-worshipping Lenape nation. This prophet, Neolin, called for a renewal of Midew beliefs and a shunning of foreign ways, especially those of the Europeans. Pontiac took full advantage of this new nationalistic spirit. He called upon the Midew to support him in war and was answered by many influential figures of the time, including the great Seneca leader Guyasuta. At the head of a massive uprising was Pontiac, and behind him stood Odawa, Ojibwr, Potawatomi, Wea, Miami, Kickapoo, Piankashaw, and even his old enemy, the Huron - who had clearly forgiven him for siding with the French during their earlier travails.'),
			('TXT_KEY_CIVILOPEDIA_LEADERS_CLPONTIAC_HEADING_5', 'Engineering a Conflict'),
			('TXT_KEY_CIVILOPEDIA_LEADERS_CLPONTIAC_TEXT_5', 'Pontiac''s war - called, in a startling fit of imagination, "Pontiac''s War" - was not immediately waged. It was more of a continuation of earlier conflicts, fueled by the blessing of the Midew. Pontiac''s warriors had already fought the British before then (over the course of the French and Indian War) and the man himself had long been an ally of New France, siding with them against a Huron uprising lead by Nicholas Orontony. While there''s a distinct lack of primary evidence to support the claim, it is also possible that he was part of the crushing defeat inflicted on the Braddock expedition at the Battle of the Monongahela, mostly because he happened to be in the neighbourhood at the time. Regardless, having developed a taste for kicking the lumps out of the redcoats, Pontiac brought an army of Midew-led tribes to bear on the Americans in 1763. The pays d''en haut was in open revolt, for, in their words, "this Country was given by God to the Indians".'),
			('TXT_KEY_CIVILOPEDIA_LEADERS_CLPONTIAC_HEADING_6', 'Bloodshed and Bitterness'),
			('TXT_KEY_CIVILOPEDIA_LEADERS_CLPONTIAC_TEXT_6', 'The war was a brief and brutal affair. The Anishinaabe and their allies used stealth and deception to negate their enemy''s fortifications, while the British turned to biological warfare, conspiring to spread smallpox among the besieging forces at Fort Pitt via infected blankets. It was a bloody war, too; prisoners on all sides were murdered, tortured, or forced into slavery. Pontiac’s forces were given to ritually torturing some of the prisoners they took, while the American Paxton Boys sprung up behind the lines, murdering any native Americans they could find - largely the neutral Susquehannock and Shawnee populations. Slowly, Pontiac’s War became an exercise in ethnic cleansing on the part of the British settlers, who seemed to be unable to tell one "native" from the next. The fighting finally came to an end in 1766, after which Pontiac descended into obscurity , brooding in his own village. He became a bitter old man, whose last act of notorioty involved compelling his french allies to drown an English girl. Prosecuted for her murder, he was later acquitted, but on his way home, he was slain by a Peoria assassin. It has been postulated that this man was hired by the British as their executioner, as they were afraid of starting another war with the Anishinaabe.'),
			('TXT_KEY_CIVILOPEDIA_LEADERS_CLPONTIAC_TITLES_1', 'Midew, Chief'),
			('TXT_KEY_CIVILOPEDIA_LEADERS_CLPONTIAC_LIVED', '1720 – April 20, 1769');