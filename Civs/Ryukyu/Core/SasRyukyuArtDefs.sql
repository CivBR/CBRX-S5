INSERT INTO ArtDefine_UnitInfos(Type, DamageStates)
  VALUES ('ART_DEF_UNIT_SAS_CHINKUNSHIN', 1);
INSERT INTO ArtDefine_UnitInfoMemberInfos(UnitInfoType, UnitMemberInfoType, NumMembers)
  VALUES ('ART_DEF_UNIT_SAS_CHINKUNSHIN', 'ART_DEF_UNIT_MEMBER_SAS_CHINKUNSHIN', 1);
INSERT INTO ArtDefine_UnitMemberInfos(Type, Scale, Domain, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
  VALUES ('ART_DEF_UNIT_MEMBER_SAS_CHINKUNSHIN', 0.121, 'Sea', 'Art/Models/Chinkunshin.fxsxml', 'WOOD', 'WOODLRG');
INSERT INTO ArtDefine_UnitMemberCombats(UnitMemberType, EnableActions, HasShortRangedAttack, HasLeftRightAttack, HasRefaceAfterCombat, HasIndependentWeaponFacing)
  VALUES ('ART_DEF_UNIT_MEMBER_SAS_CHINKUNSHIN', 'Idle Attack RunCharge AttackCity Bombard Death BombardDefend Run Fortify CombatReady AttackSurfaceToAir', 1, 1, 0, 1);
INSERT INTO ArtDefine_UnitMemberCombatWeapons(UnitMemberType, "Index", SubIndex, VisKillStrengthMin, VisKillStrengthMax, HitEffect, WeaponTypeTag, WeaponTypeSoundOverrideTag)
  VALUES ('ART_DEF_UNIT_MEMBER_SAS_CHINKUNSHIN', 0, 0, 0.0, 0.0, 'ART_DEF_VEFFECT_CANNON_IMPACT_$(TERRAIN)', 'EXPLOSIVE', 'EXPLOSION6POUND');
INSERT INTO ArtDefine_StrategicView(StrategicViewType, TileType, Asset)
  VALUES ('ART_DEF_UNIT_SAS_CHINKUNSHIN', 'Unit', 'SV_SasChinkunshin.dds');

INSERT INTO ArtDefine_UnitInfos(Type, DamageStates, Formation)
  VALUES ('ART_DEF_UNIT_SAS_YUKATCHU', 1, 'DefaultCavalry');
INSERT INTO ArtDefine_UnitInfoMemberInfos(UnitInfoType, UnitMemberInfoType, NumMembers)
  VALUES ('ART_DEF_UNIT_SAS_YUKATCHU', 'ART_DEF_UNIT_MEMBER_SAS_YUKATCHU', 1);
INSERT INTO ArtDefine_UnitMemberInfos(Type, Scale, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
  VALUES ('ART_DEF_UNIT_MEMBER_SAS_YUKATCHU', 0.14, 'Art/Models/Sas_Yukatchu.fxsxml', 'CLOTH', 'FLESH');
INSERT INTO ArtDefine_UnitMemberCombats(UnitMemberType, EnableActions, ShortMoveRadius, ShortMoveRate, TargetHeight, HasRefaceAfterCombat)
  VALUES ('ART_DEF_UNIT_MEMBER_SAS_YUKATCHU', 'Idle Attack RunCharge AttackCity Bombard Death BombardDefend Run Fortify CombatReady Walk AttackCharge', 12.0, 0.349999994039536, 8.0, 1);
INSERT INTO ArtDefine_UnitMemberCombatWeapons(UnitMemberType, "Index", SubIndex, WeaponTypeTag, WeaponTypeSoundOverrideTag)
  VALUES ('ART_DEF_UNIT_MEMBER_SAS_YUKATCHU', 0, 0, 'METAL', 'SWORD');
INSERT INTO ArtDefine_UnitMemberCombatWeapons(UnitMemberType, "Index", SubIndex, VisKillStrengthMin, VisKillStrengthMax, WeaponTypeTag, MissTargetSlopRadius)
  VALUES ('ART_DEF_UNIT_MEMBER_SAS_YUKATCHU', 1, 0, 10.0, 20.0, 'FLAMING_ARROW', 10.0);
INSERT INTO ArtDefine_StrategicView(StrategicViewType, TileType, Asset)
  VALUES ('ART_DEF_UNIT_SAS_YUKATCHU', 'Unit', 'SV_SasYukatchu.dds');

--==========================================================================================================================
-- IMPROVEMENT GRAPHICS
--==========================================================================================================================
INSERT INTO ArtDefine_LandmarkTypes(Type, LandmarkType, FriendlyName)
SELECT 'ART_DEF_IMPROVEMENT_SAS_GUSUKU', 'Improvement', 'SAS_GUSUKU';

INSERT INTO ArtDefine_Landmarks(Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour)
SELECT 'Any', 'Constructed', 0.98, 'ART_DEF_IMPROVEMENT_SAS_GUSUKU', 'SNAPSHOT', 'ART_DEF_RESOURCE_ALL', 'Gusuku.fxsxml', 1 UNION ALL
SELECT 'Any', 'Pillaged', 0.98, 'ART_DEF_IMPROVEMENT_SAS_GUSUKU', 'SNAPSHOT', 'ART_DEF_RESOURCE_ALL', 'Gusuku_pl.fxsxml', 1;

INSERT INTO ArtDefine_StrategicView(StrategicViewType, TileType, Asset)
SELECT 'ART_DEF_IMPROVEMENT_SAS_GUSUKU', 'Improvement', 'SV_SasGusuku.dds';

--=======================================================================================================================
-- AUDIO
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- Audio_Sounds
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Audio_Sounds 
		(SoundID, 											Filename, 						LoadType)
VALUES	('SND_LEADER_MUSIC_SAS_SHOSHIN_PEACE',		'Sas_ShoShin_Peace',		'DynamicResident'),
		('SND_LEADER_MUSIC_SAS_SHOSHIN_WAR', 		'Sas_ShoShin_War', 		'DynamicResident');	
------------------------------------------------------------------------------------------------------------------------
-- Audio_2DSounds
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Audio_2DSounds 
		(ScriptID, 											SoundID, 										SoundType, 		MinVolume, 	MaxVolume,	IsMusic, Looping)
VALUES	('AS2D_LEADER_MUSIC_SAS_SHOSHIN_PEACE', 	'SND_LEADER_MUSIC_SAS_SHOSHIN_PEACE',	'GAME_MUSIC', 	70, 		70, 		1, 		 0),
		('AS2D_LEADER_MUSIC_SAS_SHOSHIN_WAR',		'SND_LEADER_MUSIC_SAS_SHOSHIN_WAR', 	'GAME_MUSIC', 	70, 		70, 		1,		 0);
--=======================================================================================================================
-- COLOURS
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- Colors
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Colors 
		(Type, 											 Red, 	Green, 	Blue,   Alpha)
VALUES	('COLOR_PLAYER_SAS_RYUKYU_ICON', 		 0.701, 0.643, 	0.788, 	1),
		('COLOR_PLAYER_SAS_RYUKYU_BACKGROUND',  0.156,	0.156,	0.156, 	1);
------------------------------------------------------------------------------------------------------------------------
-- PlayerColors
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO PlayerColors 
		(Type, 									PrimaryColor, 								SecondaryColor, 									TextColor)
VALUES	('PLAYERCOLOR_SAS_RYUKYU',		'COLOR_PLAYER_SAS_RYUKYU_ICON',	'COLOR_PLAYER_SAS_RYUKYU_BACKGROUND',		'COLOR_PLAYER_WHITE_TEXT');
--=======================================================================================================================
-- ICON ATLASES
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- IconTextureAtlases
------------------------------------------------------------------------------------------------------------------------
INSERT INTO IconTextureAtlases 
		(Atlas, 									IconSize, 	Filename, 										IconsPerRow, 	IconsPerColumn)
VALUES	('SAS_RYUKYU_ALPHA_ATLAS',			128, 		'SasRyukyuAlpha_128.dds',			1,				1),
		('SAS_RYUKYU_ALPHA_ATLAS',			80, 		'SasRyukyuAlpha_80.dds',			1, 				1),
		('SAS_RYUKYU_ALPHA_ATLAS',			64, 		'SasRyukyuAlpha_64.dds',			1, 				1),
		('SAS_RYUKYU_ALPHA_ATLAS',			48, 		'SasRyukyuAlpha_48.dds',			1, 				1),
		('SAS_RYUKYU_ALPHA_ATLAS',			45, 		'SasRyukyuAlpha_45.dds',			1, 				1),
		('SAS_RYUKYU_ALPHA_ATLAS',			32, 		'SasRyukyuAlpha_32.dds',			1, 				1),
		('SAS_RYUKYU_ALPHA_ATLAS',			24, 		'SasRyukyuAlpha_24.dds',			1, 				1),
		('SAS_RYUKYU_ALPHA_ATLAS',			16, 		'SasRyukyuAlpha_16.dds',			1, 				1),
		('SAS_RYUKYU_ICON_ATLAS', 			256, 		'SasRyukyuIcons256.dds',			6, 				1),
		('SAS_RYUKYU_ICON_ATLAS', 			128, 		'SasRyukyuIcons128.dds',			6, 				1),
		('SAS_RYUKYU_ICON_ATLAS', 			80, 		'SasRyukyuIcons80.dds',			6, 				1),
		('SAS_RYUKYU_ICON_ATLAS', 			64, 		'SasRyukyuIcons64.dds',			6, 				1),
		('SAS_RYUKYU_ICON_ATLAS', 			45, 		'SasRyukyuIcons45.dds',			6, 				1),
		('SAS_RYUKYU_ICON_ATLAS', 			32, 		'SasRyukyuIcons32.dds',			6, 				1),
		('SAS_CHINKUNSHIN_ATLAS', 				32, 		'SasChinkunshinFlag.dds',		1, 				1),
		('SAS_YUKATCHU_ATLAS', 				32, 		'SasYukatchuFlag.dds',		1, 				1);
--=======================================================================================================================	
--=======================================================================================================================	