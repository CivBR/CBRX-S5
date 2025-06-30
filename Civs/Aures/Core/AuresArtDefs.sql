INSERT INTO ArtDefine_UnitInfos(Type, DamageStates, Formation)
  VALUES ('ART_DEF_UNIT_SAS_ZENATAHORSEMAN', 1, 'DefaultCavalry');
INSERT INTO ArtDefine_UnitInfoMemberInfos(UnitInfoType, UnitMemberInfoType, NumMembers)
  VALUES ('ART_DEF_UNIT_SAS_ZENATAHORSEMAN', 'ART_DEF_UNIT_MEMBER_SAS_ZENATAHORSEMAN', 5);
INSERT INTO ArtDefine_UnitMemberInfos(Type, Scale, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
  VALUES ('ART_DEF_UNIT_MEMBER_SAS_ZENATAHORSEMAN', 0.11, 'Art/Models/ZenataHorseman.fxsxml', 'CLOTH', 'FLESH');
INSERT INTO ArtDefine_UnitMemberCombats(UnitMemberType, EnableActions, ShortMoveRadius, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, TargetHeight, HasStationaryMelee, HasRefaceAfterCombat, ReformBeforeCombat, OnlyTurnInMovementActions, RushAttackFormation)
  VALUES ('ART_DEF_UNIT_MEMBER_SAS_ZENATAHORSEMAN', 'Idle Attack RunCharge AttackCity Bombard Death BombardDefend Run Fortify CombatReady Walk', 24.0, 0.349999994039536, 0.5, 0.75, 15.0, 20.0, 12.0, 1, 1, 2, 1, 'DefaultCavalry');
INSERT INTO ArtDefine_UnitMemberCombatWeapons(UnitMemberType, "Index", SubIndex, WeaponTypeTag, WeaponTypeSoundOverrideTag)
  VALUES ('ART_DEF_UNIT_MEMBER_SAS_ZENATAHORSEMAN', 0, 0, 'METAL', 'SWORD');
INSERT INTO ArtDefine_UnitMemberCombatWeapons(UnitMemberType, "Index", SubIndex, VisKillStrengthMin, VisKillStrengthMax, WeaponTypeTag, MissTargetSlopRadius)
  VALUES ('ART_DEF_UNIT_MEMBER_SAS_ZENATAHORSEMAN', 1, 0, 10.0, 20.0, 'FLAMING_ARROW', 10.0);
INSERT INTO ArtDefine_StrategicView(StrategicViewType, TileType, Asset)
  VALUES ('ART_DEF_UNIT_SAS_ZENATAHORSEMAN', 'Unit', 'SV_SasZenataHorseman.dds');
--=======================================================================================================================
-- AUDIO
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- Audio_Sounds
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Audio_Sounds 
		(SoundID, 											Filename, 						LoadType)
VALUES	('SND_LEADER_MUSIC_SAS_DIHYA_PEACE',		'Sas_Dihya_Peace',		'DynamicResident'),
		('SND_LEADER_MUSIC_SAS_DIHYA_WAR', 		'Sas_Dihya_War', 		'DynamicResident');		
------------------------------------------------------------------------------------------------------------------------
-- Audio_2DSounds
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Audio_2DSounds 
		(ScriptID, 											SoundID, 										SoundType, 		MinVolume, 	MaxVolume,	IsMusic, Looping)
VALUES	('AS2D_AMBIENCE_LEADER_SAS_DIHYA_AMBIENCE',	'SND_AMBIENCE_ASKIA_AMBIENCE', 				'GAME_SFX', 	20, 		20, 		0, 		 1),
		('AS2D_LEADER_MUSIC_SAS_DIHYA_PEACE', 	'SND_LEADER_MUSIC_SAS_DIHYA_PEACE',	'GAME_MUSIC', 	60, 		60, 		1, 		 0),
		('AS2D_LEADER_MUSIC_SAS_DIHYA_WAR',		'SND_LEADER_MUSIC_SAS_DIHYA_WAR', 	'GAME_MUSIC', 	60, 		60, 		1,		 0);
--=======================================================================================================================
-- COLOURS
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- Colors
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Colors 
		(Type, 											 Red, 	Green, 	Blue,   Alpha)
VALUES	('COLOR_PLAYER_SAS_AURES_ICON', 		 0.027, 0.235, 	0.258, 	1),
		('COLOR_PLAYER_SAS_AURES_BACKGROUND',  0.870,	0.690,	0.341, 	1);
------------------------------------------------------------------------------------------------------------------------
-- PlayerColors
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO PlayerColors 
		(Type, 									PrimaryColor, 								SecondaryColor, 									TextColor)
VALUES	('PLAYERCOLOR_SAS_AURES',		'COLOR_PLAYER_SAS_AURES_ICON',	'COLOR_PLAYER_SAS_AURES_BACKGROUND',		'COLOR_PLAYER_WHITE_TEXT');
--=======================================================================================================================
-- ICON ATLASES
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- IconTextureAtlases
------------------------------------------------------------------------------------------------------------------------
INSERT INTO IconTextureAtlases 
		(Atlas, 									IconSize, 	Filename, 										IconsPerRow, 	IconsPerColumn)
VALUES	('SAS_AURES_ALPHA_ATLAS',			128, 		'SasAuresAlpha_128.dds',			1,				1),
		('SAS_AURES_ALPHA_ATLAS',			80, 		'SasAuresAlpha_80.dds',			1, 				1),
		('SAS_AURES_ALPHA_ATLAS',			64, 		'SasAuresAlpha_64.dds',			1, 				1),
		('SAS_AURES_ALPHA_ATLAS',			48, 		'SasAuresAlpha_48.dds',			1, 				1),
		('SAS_AURES_ALPHA_ATLAS',			45, 		'SasAuresAlpha_45.dds',			1, 				1),
		('SAS_AURES_ALPHA_ATLAS',			32, 		'SasAuresAlpha_32.dds',			1, 				1),
		('SAS_AURES_ALPHA_ATLAS',			24, 		'SasAuresAlpha_24.dds',			1, 				1),
		('SAS_AURES_ALPHA_ATLAS',			16, 		'SasAuresAlpha_16.dds',			1, 				1),
		('SAS_ZENATAHORSEMAN_ATLAS',		32, 		'SasZenataHorsemanFlag.dds',				1, 				1),
		('SAS_AURES_ICON_ATLAS', 			256, 		'SasAuresIcons256.dds',			4, 				1),
		('SAS_AURES_ICON_ATLAS', 			128, 		'SasAuresIcons128.dds',			4, 				1),
		('SAS_AURES_ICON_ATLAS', 			80, 		'SasAuresIcons80.dds',			4, 				1),
		('SAS_AURES_ICON_ATLAS', 			64, 		'SasAuresIcons64.dds',			4, 				1),
		('SAS_AURES_ICON_ATLAS', 			45, 		'SasAuresIcons45.dds',			4, 				1),
		('SAS_AURES_ICON_ATLAS', 			32, 		'SasAuresIcons32.dds',			4, 				1);
--=======================================================================================================================	
--=======================================================================================================================	
