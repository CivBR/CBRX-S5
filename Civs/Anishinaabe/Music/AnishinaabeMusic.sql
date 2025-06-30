-- Insert SQL Rules Here <?xml version="1.0" encoding="utf-8"?>
INSERT INTO Audio_Sounds (SoundID, Filename, LoadType) VALUES 
 ('SND_LEADER_MUSIC_CLPONTIAC_PEACE', 'AnishinaabePeace', 'DynamicResident'),
 ('SND_LEADER_MUSIC_CLPONTIAC_WAR', 'AnishinaabeWar', 'DynamicResident'),
 ('SND_DOM_SPEECH_CLPONTIAC', 'AnishinaabeDOM', 'DynamicResident');

INSERT INTO Audio_2DSounds (ScriptID, SoundID, SoundType, MinVolume, MaxVolume, Looping, IsMusic) 
 VALUES ('AS2D_LEADER_MUSIC_CLPONTIAC_PEACE', 'SND_LEADER_MUSIC_CLPONTIAC_PEACE', 'GAME_MUSIC', 
  65, 65, 0, 1),
 ('AS2D_LEADER_MUSIC_CLPONTIAC_WAR', 'SND_LEADER_MUSIC_CLPONTIAC_WAR', 'GAME_MUSIC', 70, 70, 0, 1),
 ('AS2D_DOM_SPEECH_CLPONTIAC', 'SND_DOM_SPEECH_CLPONTIAC', 'GAME_SPEECH', 70, 70, 0, 1);
