--==========================================================================================================================	
-- Audio_Sounds
--==========================================================================================================================		
INSERT INTO Audio_Sounds 
			(SoundID, 										Filename, 						LoadType)
VALUES		('SND_LEADER_MUSIC_MC_HIRAM_PEACE', 			'HiramPeace',					'DynamicResident'),
			('SND_LEADER_MUSIC_MC_HIRAM_WAR', 				'HiramWar', 					'DynamicResident'),
			('SND_DOM_SPEECH_MC_HIRAM', 					'HiramDOM',						'DynamicResident');			
--==========================================================================================================================	
-- Audio_2DSounds
--==========================================================================================================================		
INSERT INTO Audio_2DSounds 
			(ScriptID, 										SoundID, 								SoundType, 			MinVolume, 	MaxVolume,  IsMusic, Looping)
VALUES		('AS2D_LEADER_MUSIC_MC_HIRAM_PEACE', 			'SND_LEADER_MUSIC_MC_HIRAM_PEACE', 		'GAME_MUSIC', 		100, 		100, 		1, 		 0),
			('AS2D_LEADER_MUSIC_MC_HIRAM_WAR', 				'SND_LEADER_MUSIC_MC_HIRAM_WAR', 		'GAME_MUSIC', 		100, 		100, 		1,		 0),
			('AS2D_DOM_SPEECH_MC_HIRAM', 					'SND_DOM_SPEECH_MC_HIRAM',				'GAME_SPEECH', 		100, 		100, 		1, 		 0);
--==========================================================================================================================		
--==========================================================================================================================		
