INSERT INTO ArtDefine_UnitInfos(Type, DamageStates, Formation)
  VALUES ('ART_DEF_UNIT_SAS_DZHIGIT', 1, 'DefaultCavalry');
INSERT INTO ArtDefine_UnitInfoMemberInfos(UnitInfoType, UnitMemberInfoType, NumMembers)
  VALUES ('ART_DEF_UNIT_SAS_DZHIGIT', 'ART_DEF_UNIT_MEMBER_SAS_DZHIGIT', 1);
INSERT INTO ArtDefine_UnitInfoMemberInfos(UnitInfoType, UnitMemberInfoType, NumMembers)
  VALUES ('ART_DEF_UNIT_SAS_DZHIGIT', 'ART_DEF_UNIT_MEMBER_SAS_DZHIGIT_V2', 2);
INSERT INTO ArtDefine_UnitInfoMemberInfos(UnitInfoType, UnitMemberInfoType, NumMembers)
  VALUES ('ART_DEF_UNIT_SAS_DZHIGIT', 'ART_DEF_UNIT_MEMBER_SAS_DZHIGIT_V3', 2);
INSERT INTO ArtDefine_UnitMemberInfos(Type, Scale, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
  VALUES ('ART_DEF_UNIT_MEMBER_SAS_DZHIGIT', 0.119999997317791, 'Art/Models/Circassian_Dzhigit.fxsxml', 'CLOTH', 'FLESH');
INSERT INTO ArtDefine_UnitMemberInfos(Type, Scale, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
  VALUES ('ART_DEF_UNIT_MEMBER_SAS_DZHIGIT_V2', 0.119999997317791, 'Art/Models/Circassian_Dzhigit_v2.fxsxml', 'CLOTH', 'FLESH');
INSERT INTO ArtDefine_UnitMemberInfos(Type, Scale, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
  VALUES ('ART_DEF_UNIT_MEMBER_SAS_DZHIGIT_V3', 0.119999997317791, 'Art/Models/Circassian_Dzhigit_v3.fxsxml', 'CLOTH', 'FLESH');
INSERT INTO ArtDefine_UnitMemberCombats(UnitMemberType, EnableActions, ShortMoveRadius, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, TargetHeight, HasShortRangedAttack, HasStationaryMelee, HasRefaceAfterCombat, ReformBeforeCombat, OnlyTurnInMovementActions)
  VALUES ('ART_DEF_UNIT_MEMBER_SAS_DZHIGIT', 'Idle Attack RunCharge AttackCity Bombard Death BombardDefend Run Fortify CombatReady Walk', 24.0, 0.349999994039536, 0.5, 0.75, 15.0, 20.0, 12.0, 1, 1, 1, 1, 1);
INSERT INTO ArtDefine_UnitMemberCombats(UnitMemberType, EnableActions, ShortMoveRadius, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, TargetHeight, HasShortRangedAttack, HasStationaryMelee, HasRefaceAfterCombat, ReformBeforeCombat, OnlyTurnInMovementActions)
  VALUES ('ART_DEF_UNIT_MEMBER_SAS_DZHIGIT_V2', 'Idle Attack RunCharge AttackCity Bombard Death BombardDefend Run Fortify CombatReady Walk', 24.0, 0.349999994039536, 0.5, 0.75, 15.0, 20.0, 12.0, 1, 1, 1, 1, 1);
INSERT INTO ArtDefine_UnitMemberCombats(UnitMemberType, EnableActions, ShortMoveRadius, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, TargetHeight, HasShortRangedAttack, HasStationaryMelee, HasRefaceAfterCombat, ReformBeforeCombat, OnlyTurnInMovementActions)
  VALUES ('ART_DEF_UNIT_MEMBER_SAS_DZHIGIT_V3', 'Idle Attack RunCharge AttackCity Bombard Death BombardDefend Run Fortify CombatReady Walk', 24.0, 0.349999994039536, 0.5, 0.75, 15.0, 20.0, 12.0, 1, 1, 1, 1, 1);
INSERT INTO ArtDefine_UnitMemberCombatWeapons(UnitMemberType, "Index", SubIndex, WeaponTypeTag, WeaponTypeSoundOverrideTag)
  VALUES ('ART_DEF_UNIT_MEMBER_SAS_DZHIGIT', 0, 0, 'BULLET', 'BULLET');
INSERT INTO ArtDefine_UnitMemberCombatWeapons(UnitMemberType, "Index", SubIndex, WeaponTypeTag, WeaponTypeSoundOverrideTag)
  VALUES ('ART_DEF_UNIT_MEMBER_SAS_DZHIGIT_V2', 0, 0, 'BULLET', 'BULLET');
INSERT INTO ArtDefine_UnitMemberCombatWeapons(UnitMemberType, "Index", SubIndex, WeaponTypeTag, WeaponTypeSoundOverrideTag)
  VALUES ('ART_DEF_UNIT_MEMBER_SAS_DZHIGIT_V3', 0, 0, 'BULLET', 'BULLET');
INSERT INTO ArtDefine_StrategicView(StrategicViewType, TileType, Asset)
  VALUES ('ART_DEF_UNIT_SAS_DZHIGIT', 'Unit', 'SV_Sas_Dzhigit.dds');
--=======================================================================================================================
-- AUDIO
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- Audio_Sounds
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Audio_Sounds 
		(SoundID, 											Filename, 						LoadType)
VALUES	('SND_LEADER_MUSIC_SAS_BERZEG_PEACE',		'Sas_Berzeg_Peace',		'DynamicResident'),
		('SND_LEADER_MUSIC_SAS_BERZEG_WAR', 		'Sas_Berzeg_War', 		'DynamicResident');		
------------------------------------------------------------------------------------------------------------------------
-- Audio_2DSounds
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Audio_2DSounds 
		(ScriptID, 											SoundID, 										SoundType, 		TaperSoundtrackVolume,	MinVolume, 	MaxVolume,	IsMusic, Looping)
VALUES	('AS2D_LEADER_MUSIC_SAS_BERZEG_PEACE', 	'SND_LEADER_MUSIC_SAS_BERZEG_PEACE',	'GAME_MUSIC', 	-1.0,					50, 		50, 		1, 		 0),
		('AS2D_LEADER_MUSIC_SAS_BERZEG_WAR',		'SND_LEADER_MUSIC_SAS_BERZEG_WAR', 	'GAME_MUSIC', 	-1.0,					50, 		50, 		1,		 0);
--=======================================================================================================================
-- COLOURS
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- Colors
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Colors 
		(Type, 											 Red, 	Green, 	Blue,   Alpha)
VALUES	('COLOR_PLAYER_SAS_BERZEG_ICON', 		 0.933,		0.858,	0.305,		1),
		('COLOR_PLAYER_SAS_BERZEG_BACKGROUND',  0.149,	0.360,	0.141,	1);
------------------------------------------------------------------------------------------------------------------------
-- PlayerColors
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO PlayerColors 
		(Type, 									PrimaryColor, 								SecondaryColor, 									TextColor)
VALUES	('PLAYERCOLOR_SAS_BERZEG',		'COLOR_PLAYER_SAS_BERZEG_ICON',	'COLOR_PLAYER_SAS_BERZEG_BACKGROUND',		'COLOR_PLAYER_WHITE_TEXT');
--=======================================================================================================================
-- ICON ATLASES
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- IconTextureAtlases
------------------------------------------------------------------------------------------------------------------------
INSERT INTO IconTextureAtlases 
		(Atlas, 									IconSize, 	Filename, 										IconsPerRow, 	IconsPerColumn)
VALUES	('SAS_BERZEG_ALPHA_ATLAS',			128, 		'SasBerzegAlpha_128.dds',			1,				1),
		('SAS_BERZEG_ALPHA_ATLAS',			80, 		'SasBerzegAlpha_80.dds',			1, 				1),
		('SAS_BERZEG_ALPHA_ATLAS',			64, 		'SasBerzegAlpha_64.dds',			1, 				1),
		('SAS_BERZEG_ALPHA_ATLAS',			48, 		'SasBerzegAlpha_48.dds',			1, 				1),
		('SAS_BERZEG_ALPHA_ATLAS',			45, 		'SasBerzegAlpha_45.dds',			1, 				1),
		('SAS_BERZEG_ALPHA_ATLAS',			32, 		'SasBerzegAlpha_32.dds',			1, 				1),
		('SAS_BERZEG_ALPHA_ATLAS',			24, 		'SasBerzegAlpha_24.dds',			1, 				1),
		('SAS_BERZEG_ALPHA_ATLAS',			16, 		'SasBerzegAlpha_16.dds',			1, 				1),
		('SAS_BERZEG_ICON_ATLAS', 			256, 		'SasBerzegIcons256.dds',			4, 				1),
		('SAS_BERZEG_ICON_ATLAS', 			128, 		'SasBerzegIcons128.dds',			4, 				1),
		('SAS_BERZEG_ICON_ATLAS', 			80, 		'SasBerzegIcons80.dds',			4, 				1),
		('SAS_BERZEG_ICON_ATLAS', 			64, 		'SasBerzegIcons64.dds',			4, 				1),
		('SAS_BERZEG_ICON_ATLAS', 			45, 		'SasBerzegIcons45.dds',			4, 				1),
		('SAS_BERZEG_ICON_ATLAS', 			32, 		'SasBerzegIcons32.dds',			4, 				1),
		('SAS_DZHIGIT_FLAG', 	32, 		'Sas_Dzhigit_Flag.dds',		1, 				1);
--=======================================================================================================================	
--=======================================================================================================================	