--==========================================================================================================================
-- IconTextureAtlases
--==========================================================================================================================
INSERT INTO IconTextureAtlases 
			(Atlas, 								IconSize, 	Filename, 									IconsPerRow, 	IconsPerColumn)
VALUES		('TCM_AVIS_PORTUGAL_ATLAS', 			256, 		'TCM_PortugalJoaoIIAtlas_256.dds',			2,				2),
			('TCM_AVIS_PORTUGAL_ATLAS', 			128, 		'TCM_PortugalJoaoIIAtlas_128.dds',			2, 				2),
			('TCM_AVIS_PORTUGAL_ATLAS', 			80, 		'TCM_PortugalJoaoIIAtlas_80.dds',			2, 				2),
			('TCM_AVIS_PORTUGAL_ATLAS', 			64, 		'TCM_PortugalJoaoIIAtlas_64.dds',			2, 				2),
			('TCM_AVIS_PORTUGAL_ATLAS', 			45, 		'TCM_PortugalJoaoIIAtlas_45.dds',			2, 				2),
			('TCM_AVIS_PORTUGAL_ATLAS', 			32, 		'TCM_PortugalJoaoIIAtlas_32.dds',			2, 				2),
			('TCM_PORTUGAL_BRAZIL_ATLAS', 			256, 		'TCM_PortugalMariaAtlas_256.dds',			3,				1),
			('TCM_PORTUGAL_BRAZIL_ATLAS', 			128, 		'TCM_PortugalMariaAtlas_128.dds',			3, 				1),
			('TCM_PORTUGAL_BRAZIL_ATLAS', 			80, 		'TCM_PortugalMariaAtlas_80.dds',			3, 				1),
			('TCM_PORTUGAL_BRAZIL_ATLAS', 			64, 		'TCM_PortugalMariaAtlas_64.dds',			3, 				1),
			('TCM_PORTUGAL_BRAZIL_ATLAS', 			45, 		'TCM_PortugalMariaAtlas_45.dds',			3, 				1),
			('TCM_PORTUGAL_BRAZIL_ATLAS', 			32, 		'TCM_PortugalMariaAtlas_32.dds',			3, 				1),
			('TCM_PORTUGAL_BRAZIL_ALPHA_ATLAS',		128, 		'TCM_PortugalMariaAlphaAtlas_128.dds',		1,				1),
			('TCM_PORTUGAL_BRAZIL_ALPHA_ATLAS',		80, 		'TCM_PortugalMariaAlphaAtlas_80.dds',		1, 				1),
			('TCM_PORTUGAL_BRAZIL_ALPHA_ATLAS',		64, 		'TCM_PortugalMariaAlphaAtlas_64.dds',		1, 				1),
			('TCM_PORTUGAL_BRAZIL_ALPHA_ATLAS',		48, 		'TCM_PortugalMariaAlphaAtlas_48.dds',		1, 				1),
			('TCM_PORTUGAL_BRAZIL_ALPHA_ATLAS',		32, 		'TCM_PortugalMariaAlphaAtlas_32.dds',		1, 				1),
			('TCM_PORTUGAL_BRAZIL_ALPHA_ATLAS',		24, 		'TCM_PortugalMariaAlphaAtlas_24.dds',		1, 				1),
			('TCM_PORTUGAL_BRAZIL_ALPHA_ATLAS',		16, 		'TCM_PortugalMariaAlphaAtlas_16.dds',		1, 				1),
			('TCM_PORTUGAL_AVIS_ALPHA_ATLAS',		128, 		'TCM_PortugalJoaoAlphaAtlas_128.dds',		1,				1),
			('TCM_PORTUGAL_AVIS_ALPHA_ATLAS',		80, 		'TCM_PortugalJoaoAlphaAtlas_80.dds',		1, 				1),
			('TCM_PORTUGAL_AVIS_ALPHA_ATLAS',		64, 		'TCM_PortugalJoaoAlphaAtlas_64.dds',		1, 				1),
			('TCM_PORTUGAL_AVIS_ALPHA_ATLAS',		48, 		'TCM_PortugalJoaoAlphaAtlas_48.dds',		1, 				1),
			('TCM_PORTUGAL_AVIS_ALPHA_ATLAS',		32, 		'TCM_PortugalJoaoAlphaAtlas_32.dds',		1, 				1),
			('TCM_PORTUGAL_AVIS_ALPHA_ATLAS',		24, 		'TCM_PortugalJoaoAlphaAtlas_24.dds',		1, 				1),
			('TCM_PORTUGAL_AVIS_ALPHA_ATLAS',		16, 		'TCM_PortugalJoaoAlphaAtlas_16.dds',		1, 				1),
			('TCM_UNIT_FLAG_CACADOR_ATLAS',			32,			'tcm_PortugalCacadorFlag_32.dds',			1, 				1);
--==========================================================================================================================
--==========================================================================================================================
INSERT INTO ArtDefine_UnitInfos(Type, DamageStates, Formation)
  VALUES ('ART_DEF_UNIT_TCM_CACADOR', 1, 'HonorableGunpowder');
INSERT INTO ArtDefine_UnitInfoMemberInfos(UnitInfoType, UnitMemberInfoType, NumMembers)
  VALUES ('ART_DEF_UNIT_TCM_CACADOR', 'ART_DEF_UNIT_MEMBER_TCM_CACADOR', 14);
INSERT INTO ArtDefine_UnitMemberInfos(Type, Scale, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
  VALUES ('ART_DEF_UNIT_MEMBER_TCM_CACADOR', 0.140000000596046, 'PortugueseCacador.fxsxml', 'CLOTH', 'FLESH');
INSERT INTO ArtDefine_UnitMemberCombats(UnitMemberType, EnableActions, ShortMoveRadius, ShortMoveRate, TargetHeight, HasShortRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat)
  VALUES ('ART_DEF_UNIT_MEMBER_TCM_CACADOR', 'Idle Attack RunCharge AttackCity Bombard Death BombardDefend Run Fortify CombatReady Walk AttackCharge', 12.0, 0.349999994039536, 8.0, 1, 1, 1);
INSERT INTO ArtDefine_UnitMemberCombatWeapons(UnitMemberType, "Index", SubIndex, WeaponTypeTag, WeaponTypeSoundOverrideTag)
  VALUES ('ART_DEF_UNIT_MEMBER_TCM_CACADOR', 0, 0, 'BULLET', 'BULLET');
INSERT INTO ArtDefine_StrategicView(StrategicViewType, TileType, Asset)
  VALUES ('ART_DEF_UNIT_TCM_CACADOR', 'Unit', 'sv_Cacador.dds');
