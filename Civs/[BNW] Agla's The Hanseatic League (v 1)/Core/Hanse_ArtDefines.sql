--=======================================================================================================================
-- ART DEFINES
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitInfos(Type, DamageStates)
  VALUES ('ART_DEF_UNIT_AGLA_HANSE_COG', 1);
INSERT INTO ArtDefine_UnitInfoMemberInfos(UnitInfoType, UnitMemberInfoType, NumMembers)
  VALUES ('ART_DEF_UNIT_AGLA_HANSE_COG', 'ART_DEF_UNIT_MEMBER_AGLA_HANSE_COG', 1);
INSERT INTO ArtDefine_UnitMemberInfos(Type, Scale, Domain, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
  VALUES ('ART_DEF_UNIT_MEMBER_AGLA_HANSE_COG', 0.140000000596046, 'Sea', 'Art/Graphics/Carabinier Guard/euro_galleon.fxsxml', 'WOOD', 'WOODLRG');
INSERT INTO ArtDefine_UnitMemberCombats(UnitMemberType, EnableActions, HasShortRangedAttack, HasLeftRightAttack, HasRefaceAfterCombat, HasIndependentWeaponFacing)
  VALUES ('ART_DEF_UNIT_MEMBER_AGLA_HANSE_COG', 'Idle Attack RunCharge AttackCity Bombard Death BombardDefend Run Fortify CombatReady AttackSurfaceToAir', 1, 1, 0, 1);
INSERT INTO ArtDefine_UnitMemberCombatWeapons(UnitMemberType, "Index", SubIndex, VisKillStrengthMin, VisKillStrengthMax, HitEffect, WeaponTypeTag, WeaponTypeSoundOverrideTag)
  VALUES ('ART_DEF_UNIT_MEMBER_AGLA_HANSE_COG', 0, 0, 0.0, 0.0, 'ART_DEF_VEFFECT_CANNON_IMPACT_$(TERRAIN)', 'EXPLOSIVE', 'EXPLOSION6POUND');
INSERT INTO ArtDefine_StrategicView(StrategicViewType, TileType, Asset)
  VALUES ('ART_DEF_UNIT_AGLA_HANSE_COG', 'Unit', 'Hanse_AlphaAtlas_128.dds');
--=======================================================================================================================
-- AUDIO
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- Audio_Sounds
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Audio_Sounds 
		(SoundID, 													Filename, 								LoadType)
VALUES	('SND_LEADER_MUSIC_AGLA_HANSE_WULLENWEVER_PEACE',	'HansePeace', 								'DynamicResident'),
		('SND_LEADER_MUSIC_AGLA_HANSE_WULLENWEVER_WAR', 	'HanseWar',								 	'DynamicResident');	
------------------------------------------------------------------------------------------------------------------------
-- Audio_2DSounds
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Audio_2DSounds 
		(ScriptID, 														SoundID, 														SoundType, 		TaperSoundtrackVolume,	MinVolume, 	MaxVolume,	IsMusic, Looping)
VALUES	('AS2D_LEADER_MUSIC_AGLA_HANSE_WULLENWEVER_PEACE', 	'SND_LEADER_MUSIC_AGLA_HANSE_WULLENWEVER_PEACE',		'GAME_MUSIC', 	-1.0,					50, 		50, 		1, 		 0),
		('AS2D_LEADER_MUSIC_AGLA_HANSE_WULLENWEVER_WAR',		'SND_LEADER_MUSIC_AGLA_HANSE_WULLENWEVER_WAR', 		'GAME_MUSIC', 	-1.0,					50, 		50, 		1,		 0);

--=======================================================================================================================
-- COLOURS
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- Colors
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Colors 
		(Type, 															Red, 	Green, 	Blue,   Alpha)
VALUES	('COLOR_PLAYER_AGLA_HANSE_WULLENWEVER_ICON', 			0.59608 ,  0.16471 ,  0.11373,	1),
		('COLOR_PLAYER_AGLA_HANSE_WULLENWEVER_BACKGROUND', 	0.89020  ,0.85098,  0.81961,	1);
------------------------------------------------------------------------------------------------------------------------
-- PlayerColors
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO PlayerColors 
		(Type, 												PrimaryColor, 											SecondaryColor, 											TextColor)
VALUES	('PLAYERCOLOR_AGLA_HANSE_WULLENWEVER',		'COLOR_PLAYER_AGLA_HANSE_WULLENWEVER_ICON',	'COLOR_PLAYER_AGLA_HANSE_WULLENWEVER_BACKGROUND',	'COLOR_PLAYER_WHITE_TEXT');
--=======================================================================================================================
-- ICON ATLASES
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- IconTextureAtlases
------------------------------------------------------------------------------------------------------------------------
INSERT INTO IconTextureAtlases 
		(Atlas, 												IconSize, 	Filename, 												IconsPerRow, 	IconsPerColumn)
VALUES	('AGLA_HANSE_WULLENWEVER_ALPHA_ATLAS',			128, 		'Hanse_AlphaAtlas_128.dds',		1,				1),
		('AGLA_HANSE_WULLENWEVER_ALPHA_ATLAS',			80, 		'Hanse_AlphaAtlas_80.dds',		1, 				1),
		('AGLA_HANSE_WULLENWEVER_ALPHA_ATLAS',			64, 		'Hanse_AlphaAtlas_64.dds',		1, 				1),
		('AGLA_HANSE_WULLENWEVER_ALPHA_ATLAS',			48, 		'Hanse_AlphaAtlas_48.dds',		1, 				1),
		('AGLA_HANSE_WULLENWEVER_ALPHA_ATLAS',			45, 		'Hanse_AlphaAtlas_45.dds',		1, 				1),
		('AGLA_HANSE_WULLENWEVER_ALPHA_ATLAS',			32, 		'Hanse_AlphaAtlas_32.dds',		1, 				1),
		('AGLA_HANSE_WULLENWEVER_ALPHA_ATLAS',			24, 		'Hanse_AlphaAtlas_24.dds',		1, 				1),
		('AGLA_HANSE_WULLENWEVER_ALPHA_ATLAS',			16, 		'Hanse_AlphaAtlas_16.dds',		1, 				1),
		('AGLA_HANSE_WULLENWEVER_ICON_ATLAS', 			256, 		'AGLA_HANSE_IconAtlas_256.dds',		2, 				2),
		('AGLA_HANSE_WULLENWEVER_ICON_ATLAS', 			128, 		'AGLA_HANSE_IconAtlas_128.dds',		2, 				2),
		('AGLA_HANSE_WULLENWEVER_ICON_ATLAS', 			80, 		'AGLA_HANSE_IconAtlas_80.dds',		2, 				2),
		('AGLA_HANSE_WULLENWEVER_ICON_ATLAS', 			64, 		'AGLA_HANSE_IconAtlas_64.dds',		2, 				2),
		('AGLA_HANSE_WULLENWEVER_ICON_ATLAS', 			45, 		'AGLA_HANSE_IconAtlas_45.dds',		2, 				2),
		('AGLA_HANSE_WULLENWEVER_ICON_ATLAS', 			32, 		'AGLA_HANSE_IconAtlas_32.dds',		2, 				2),
		('AGLA_HANSE_WULLENWEVER_UNIT_FLAG_ATLAS', 		32, 		'Cog_UnitFlagAtlas_32.dds',	1, 				1);
--=======================================================================================================================	
--=======================================================================================================================	
