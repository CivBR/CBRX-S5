INSERT INTO ArtDefine_UnitInfos(Type, DamageStates, Formation)
  VALUES ('ART_DEF_UNIT_SAS_WAZURIWA', 1, 'Scout');
INSERT INTO ArtDefine_UnitInfoMemberInfos(UnitInfoType, UnitMemberInfoType, NumMembers)
  VALUES ('ART_DEF_UNIT_SAS_WAZURIWA', 'ART_DEF_UNIT_MEMBER_SAS_WAZURIWA', 6);
INSERT INTO ArtDefine_UnitMemberInfos(Type, Scale, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
  VALUES ('ART_DEF_UNIT_MEMBER_SAS_WAZURIWA', 0.140000000596046, 'Art/Model/Xavante_Scout.fxsxml', 'CLOTH', 'FLESH');
INSERT INTO ArtDefine_UnitMemberCombats(UnitMemberType, EnableActions, ShortMoveRadius, ShortMoveRate, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat)
  VALUES ('ART_DEF_UNIT_MEMBER_SAS_WAZURIWA', 'Idle Attack RunCharge AttackCity Bombard Death BombardDefend Run Fortify CombatReady Walk AttackCharge', 12.0, 0.349999994039536, 8.0, 1, 1, 1, 1);
INSERT INTO ArtDefine_UnitMemberCombatWeapons(UnitMemberType, "Index", SubIndex, ProjectileSpeed, WeaponTypeTag, WeaponTypeSoundOverrideTag, MissTargetSlopRadius)
  VALUES ('ART_DEF_UNIT_MEMBER_SAS_WAZURIWA', 0, 0, 5.30000019073486, 'ARROW', 'ARROW', 10.0);
INSERT INTO ArtDefine_UnitMemberCombatWeapons(UnitMemberType, "Index", SubIndex, VisKillStrengthMin, VisKillStrengthMax, WeaponTypeTag, MissTargetSlopRadius)
  VALUES ('ART_DEF_UNIT_MEMBER_SAS_WAZURIWA', 1, 0, 10.0, 20.0, 'FLAMING_ARROW', 10.0);
INSERT INTO ArtDefine_StrategicView(StrategicViewType, TileType, Asset)
  VALUES ('ART_DEF_UNIT_SAS_WAZURIWA', 'Unit', 'SV_Sas_Wazuriwa.dds');
--=======================================================================================================================
-- AUDIO
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- Audio_Sounds
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Audio_Sounds 
		(SoundID, 											Filename, 						LoadType)
VALUES	('SND_LEADER_MUSIC_SAS_APOENA_PEACE',		'Sas_Apoena_Peace',		'DynamicResident'),
		('SND_LEADER_MUSIC_SAS_APOENA_WAR', 		'Sas_Apoena_War', 		'DynamicResident');		
------------------------------------------------------------------------------------------------------------------------
-- Audio_2DSounds
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Audio_2DSounds 
		(ScriptID, 											SoundID, 										SoundType, 		MinVolume, 	MaxVolume,	IsMusic, Looping)
VALUES	('AS2D_AMBIENCE_LEADER_SAS_APOENA_AMBIENCE',	'SND_AMBIENCE_JUNGLE_BED', 				'GAME_SFX', 	40, 		40, 		0, 		 1),
		('AS2D_LEADER_MUSIC_SAS_APOENA_PEACE', 	'SND_LEADER_MUSIC_SAS_APOENA_PEACE',	'GAME_MUSIC', 	90, 		90, 		1, 		 0),
		('AS2D_LEADER_MUSIC_SAS_APOENA_WAR',		'SND_LEADER_MUSIC_SAS_APOENA_WAR', 	'GAME_MUSIC', 	90, 		90, 		1,		 0);
--=======================================================================================================================
-- COLOURS
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- Colors
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Colors 
		(Type, 											 Red, 	Green, 	Blue,   Alpha)
VALUES	('COLOR_PLAYER_SAS_XAVANTE_ICON', 		 0.843, 0.301, 	0.192, 	1),
		('COLOR_PLAYER_SAS_XAVANTE_BACKGROUND',  0.141,	0.019,	0.054, 	1);
------------------------------------------------------------------------------------------------------------------------
-- PlayerColors
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO PlayerColors 
		(Type, 									PrimaryColor, 								SecondaryColor, 									TextColor)
VALUES	('PLAYERCOLOR_SAS_XAVANTE',		'COLOR_PLAYER_SAS_XAVANTE_ICON',	'COLOR_PLAYER_SAS_XAVANTE_BACKGROUND',		'COLOR_PLAYER_WHITE_TEXT');
--=======================================================================================================================
-- ICON ATLASES
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- IconTextureAtlases
------------------------------------------------------------------------------------------------------------------------
INSERT INTO IconTextureAtlases 
		(Atlas, 									IconSize, 	Filename, 										IconsPerRow, 	IconsPerColumn)
VALUES	('SAS_XAVANTE_ALPHA_ATLAS',			128, 		'SasXavanteAlpha_128.dds',			1,				1),
		('SAS_XAVANTE_ALPHA_ATLAS',			80, 		'SasXavanteAlpha_80.dds',			1, 				1),
		('SAS_XAVANTE_ALPHA_ATLAS',			64, 		'SasXavanteAlpha_64.dds',			1, 				1),
		('SAS_XAVANTE_ALPHA_ATLAS',			48, 		'SasXavanteAlpha_48.dds',			1, 				1),
		('SAS_XAVANTE_ALPHA_ATLAS',			45, 		'SasXavanteAlpha_45.dds',			1, 				1),
		('SAS_XAVANTE_ALPHA_ATLAS',			32, 		'SasXavanteAlpha_32.dds',			1, 				1),
		('SAS_XAVANTE_ALPHA_ATLAS',			24, 		'SasXavanteAlpha_24.dds',			1, 				1),
		('SAS_XAVANTE_ALPHA_ATLAS',			16, 		'SasXavanteAlpha_16.dds',			1, 				1),
		('SAS_XAVANTE_ICON_ATLAS', 			256, 		'SasXavanteIcons256.dds',			4, 				1),
		('SAS_XAVANTE_ICON_ATLAS', 			128, 		'SasXavanteIcons128.dds',			4, 				1),
		('SAS_XAVANTE_ICON_ATLAS', 			80, 		'SasXavanteIcons80.dds',			4, 				1),
		('SAS_XAVANTE_ICON_ATLAS', 			64, 		'SasXavanteIcons64.dds',			4, 				1),
		('SAS_XAVANTE_ICON_ATLAS', 			45, 		'SasXavanteIcons45.dds',			4, 				1),
		('SAS_XAVANTE_ICON_ATLAS', 			32, 		'SasXavanteIcons32.dds',			4, 				1),
		('SAS_TSAWOROWA_FLAG', 				32, 		'SasTsaworowaFlag.dds',		1, 				1);
--=======================================================================================================================	
--=======================================================================================================================	