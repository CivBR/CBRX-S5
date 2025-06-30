--=========================================================================================================================
-- IconTextureAtlases
--==========================================================================================================================
INSERT INTO IconTextureAtlases 
			(Atlas, 								IconSize, 	Filename, 							IconsPerRow, 	IconsPerColumn)
VALUES		('TCM_BACTRIA_ATLAS', 					256, 		'TCM_BACTRIA_ICONS_256.dds',		2,				2),
			('TCM_BACTRIA_ATLAS', 					128, 		'TCM_BACTRIA_ICONS_128.dds',		2, 				2),
			('TCM_BACTRIA_ATLAS', 					80, 		'TCM_BACTRIA_ICONS_80.dds',			2, 				2),
			('TCM_BACTRIA_ATLAS', 					64, 		'TCM_BACTRIA_ICONS_64.dds',			2, 				2),
			('TCM_BACTRIA_ATLAS', 					45, 		'TCM_BACTRIA_ICONS_45.dds',			2, 				2),
			('TCM_BACTRIA_ATLAS', 					32, 		'TCM_BACTRIA_ICONS_32.dds',			2, 				2),
			('TCM_BACTRIA_ALPHA_ATLAS',				128, 		'TCM_BACTRIA_ALPHA_128.dds',		1,				1),
			('TCM_BACTRIA_ALPHA_ATLAS',				80, 		'TCM_BACTRIA_ALPHA_80.dds',			1, 				1),
			('TCM_BACTRIA_ALPHA_ATLAS',				64, 		'TCM_BACTRIA_ALPHA_64.dds',			1, 				1),
			('TCM_BACTRIA_ALPHA_ATLAS',				48, 		'TCM_BACTRIA_ALPHA_48.dds',			1, 				1),
			('TCM_BACTRIA_ALPHA_ATLAS',				32, 		'TCM_BACTRIA_ALPHA_32.dds',			1, 				1),
			('TCM_BACTRIA_ALPHA_ATLAS',				24, 		'TCM_BACTRIA_ALPHA_24.dds',			1, 				1),
			('TCM_BACTRIA_ALPHA_ATLAS',		 		16, 		'TCM_BACTRIA_ALPHA_16.dds',			1, 				1),
			('TCM_UNIT_FLAG_ELEPHANTARCH_ATLAS',	32, 		'TCM_ELEPANTARCH_FLAG.dds',			1, 				1),
			('TCM_PHROURIA_ATLAS',					256,		'TCM_BACTRIA_PHROURIA_256.dds',		1, 				1),
			('TCM_PHROURIA_ATLAS',					64,			'TCM_BACTRIA_PHROURIA_64.dds',		1, 				1),
			('TCM_PHROURIA_ATLAS',					45,			'TCM_BACTRIA_PHROURIA_45.dds',		1, 				1);
--==========================================================================================================================
-- ARTDEFINES
--==========================================================================================================================
INSERT INTO ArtDefine_UnitInfos(Type, DamageStates, Formation)
  VALUES ('ART_DEF_UNIT_TCM_ELEPHANTARCH', 1, 'ChariotElephant');
INSERT INTO ArtDefine_UnitInfoMemberInfos(UnitInfoType, UnitMemberInfoType, NumMembers)
  VALUES ('ART_DEF_UNIT_TCM_ELEPHANTARCH', 'ART_DEF_UNIT_MEMBER_TCM_ELEPHANTARCH', 2);
INSERT INTO ArtDefine_UnitMemberInfos(Type, Scale, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
  VALUES ('ART_DEF_UNIT_MEMBER_TCM_ELEPHANTARCH', 0.129999995231628, 'U_Carthage_AfricanForest_Elephant.fxsxml', 'CLOTH', 'FLESH');
INSERT INTO ArtDefine_UnitMemberCombats(UnitMemberType, EnableActions, MoveRadius, ShortMoveRadius, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasStationaryMelee, HasRefaceAfterCombat, OnlyTurnInMovementActions)
  VALUES ('ART_DEF_UNIT_MEMBER_TCM_ELEPHANTARCH', 'Idle Attack RunCharge AttackCity Bombard Death BombardDefend Run Fortify CombatReady Walk', 7.0, 24.0, 0.349999994039536, 0.5, 0.75, 15.0, 20.0, 12.0, 1, 1, 1, 1, 1);
INSERT INTO ArtDefine_UnitMemberCombatWeapons(UnitMemberType, "Index", SubIndex, VisKillStrengthMin, VisKillStrengthMax, WeaponTypeTag, WeaponTypeSoundOverrideTag)
  VALUES ('ART_DEF_UNIT_MEMBER_TCM_ELEPHANTARCH', 0, 0, 10.0, 20.0, 'METAL', 'ARROW');
INSERT INTO ArtDefine_UnitMemberCombatWeapons(UnitMemberType, "Index", SubIndex, VisKillStrengthMin, VisKillStrengthMax, WeaponTypeTag)
  VALUES ('ART_DEF_UNIT_MEMBER_TCM_ELEPHANTARCH', 1, 0, 10.0, 20.0, 'FLAMING_ARROW');	
------------------------------
-- ArtDefine_LandmarkTypes
------------------------------
INSERT INTO ArtDefine_LandmarkTypes
			(Type,								LandmarkType,	FriendlyName)
VALUES		('ART_DEF_IMPROVEMENT_PHROURIA', 	'Improvement',	'Phrouria');
------------------------------
-- ArtDefine_Landmarks
------------------------------
INSERT INTO ArtDefine_Landmarks(Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour)
SELECT 'Any', 'UnderConstruction', 0.57,  'ART_DEF_IMPROVEMENT_PHROURIA', 'SNAPSHOT', 'ART_DEF_RESOURCE_ALL', 'Oriental Fort HB.fxsxml', 1 UNION ALL
SELECT 'Any', 'Constructed', 0.57,  'ART_DEF_IMPROVEMENT_PHROURIA', 'SNAPSHOT', 'ART_DEF_RESOURCE_ALL', 'Oriental Fort B.fxsxml', 1 UNION ALL
SELECT 'Any', 'Pillaged', 0.57,  'ART_DEF_IMPROVEMENT_PHROURIA', 'SNAPSHOT', 'ART_DEF_RESOURCE_ALL', 'Oriental Fort PL.fxsxml', 1;
------------------------------
-- ArtDefine_StrategicView
------------------------------
INSERT INTO ArtDefine_StrategicView 
			(StrategicViewType, 				TileType,		Asset)
VALUES		('ART_DEF_IMPROVEMENT_PHROURIA', 	'Improvement', 	'TCM_PHROURIA_SV.dds'),
			('ART_DEF_UNIT_TCM_ELEPHANTARCH', 	'Unit', 		'TCM_ELEPHANTARCH_SV.dds');
--==========================================================================================================================
--==========================================================================================================================