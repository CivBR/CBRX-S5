--==========================================================================================================================
-- ART DEFINES
--==========================================================================================================================	
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_StrategicView
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 			TileType,	Asset)
VALUES	('ART_DEF_UNIT_AGLA_SUCKERHONS',	'Unit', 	'SuckerHonsSV.dds'),
		('ART_DEF_UNIT_AGLA_ENAREE','Unit', 		'EnareeSV.dds');

--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfos
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO ArtDefine_UnitInfos 
		(Type, 									DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_AGLA_SUCKERHONS',		DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_U_HUNS_HORSE_ARCHER';

INSERT INTO ArtDefine_UnitInfos 
		(Type, 										DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_AGLA_ENAREE', 		DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_MISSIONARY';
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfoMemberInfos
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,							UnitMemberInfoType,							NumMembers)
SELECT	'ART_DEF_UNIT_AGLA_SUCKERHONS', 		'ART_DEF_UNIT_MEMBER_AGLA_SUCKERHONS',	NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_U_HUNS_HORSE_ARCHER';

INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,								UnitMemberInfoType,					NumMembers)
SELECT	'ART_DEF_UNIT_AGLA_ENAREE', 					'ART_DEF_UNIT_MEMBER_AGLA_ENAREE', 	1
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_MISSIONARY';
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberCombats
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,							EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_AGLA_SUCKERHONS',	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_U_HUNS_HORSE_ARCHER';

INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,					EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_AGLA_ENAREE',	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_MISSIONARY';
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,							"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_AGLA_SUCKERHONS',	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_U_HUNS_HORSE_ARCHER';

INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,					"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_AGLA_ENAREE',	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_MISSIONARY';
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberInfos
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 										Scale,	ZOffset, Domain, Model, 						MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_AGLA_SUCKERHONS',	Scale,	ZOffset, Domain, 'HorseArcher_Mongol.fxsxml',   MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_U_HUNS_HORSE_ARCHER';

INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 								Scale, ZOffset, Domain, Model, 				MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_AGLA_ENAREE',	Scale, ZOffset, Domain, 'JFD_Tulku.fxsxml',	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_MISSIONARY';


--==========================================================================================================================
-- AUDIO
--==========================================================================================================================	
--------------------------------------------------------------------------------------------------------------------------
-- Audio_Sounds
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Audio_Sounds 
		(SoundID, 											Filename, 						LoadType)
VALUES	('SND_LEADER_MUSIC_AGLA_SCYTHIA_PEACE', 	'Ateas_Peace', 	'DynamicResident'),
		('SND_LEADER_MUSIC_AGLA_SCYTHIA_WAR', 		'Ateas_War', 		'DynamicResident');		
--------------------------------------------------------------------------------------------------------------------------
-- Audio_2DSounds
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Audio_2DSounds 
		(ScriptID, 											SoundID, 										SoundType, 		MinVolume, 	MaxVolume,	IsMusic, Looping)
VALUES	('AS2D_LEADER_MUSIC_AGLA_SCYTHIA_PEACE', 	'SND_LEADER_MUSIC_AGLA_SCYTHIA_PEACE',					'GAME_MUSIC', 	35, 		35, 		1, 		0),
		('AS2D_LEADER_MUSIC_AGLA_SCYTHIA_WAR', 	'SND_LEADER_MUSIC_AGLA_SCYTHIA_WAR', 						'GAME_MUSIC', 	50, 		50, 		1,		0);
--==========================================================================================================================
-- COLOURS
--==========================================================================================================================	
--------------------------------------------------------------------------------------------------------------------------
-- Colors
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Colors 
		(Type, 												Red, 	Green, 			Blue, 				Alpha)
VALUES	('COLOR_PLAYER_AGLA_SCYTHIA_ICON', 			0.99216 , 0.83922 , 0.66275, 		1),
		('COLOR_PLAYER_AGLA_SCYTHIA_BACKGROUND', 	0.60000 , 0.23922 , 0.04314, 		1);
--------------------------------------------------------------------------------------------------------------------------
-- PlayerColors
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO PlayerColors 
		(Type, 									PrimaryColor, 								SecondaryColor, 									TextColor)
VALUES	('PLAYERCOLOR_AGLA_SCYTHIA',	'COLOR_PLAYER_AGLA_SCYTHIA_ICON', 	'COLOR_PLAYER_AGLA_SCYTHIA_BACKGROUND', 	'COLOR_PLAYER_WHITE_TEXT');

-- IconFontTextures
------------------------------------------------------------------------------------------------------------------------	
INSERT OR REPLACE INTO IconFontTextures 
		(IconFontTexture, 						 IconFontTextureFile)
VALUES	('ICON_FONT_TEXTURE_AGLA_SCYTHIA', 'FontIcon_VaasDrugs');	
--==========================================================================================================================
-- ICON ATLASES
--==========================================================================================================================	
--------------------------------------------------------------------------------------------------------------------------
-- IconTextureAtlases
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO IconTextureAtlases 
		(Atlas, 									IconSize, 	Filename, 										IconsPerRow, 	IconsPerColumn)
VALUES	('AGLA_SCYTHIA_ALPHA_ATLAS',		128, 		'Agla_Scythia_AlphaAtlas_128.dds',		1,				1),
		('AGLA_SCYTHIA_ALPHA_ATLAS',		80, 		'Agla_Scythia_AlphaAtlas_80.dds',		1, 				1),
		('AGLA_SCYTHIA_ALPHA_ATLAS',		64, 		'Agla_Scythia_AlphaAtlas_64.dds',		1, 				1),
		('AGLA_SCYTHIA_ALPHA_ATLAS',		48, 		'Agla_Scythia_AlphaAtlas_48.dds',		1, 				1),
		('AGLA_SCYTHIA_ALPHA_ATLAS',		45, 		'Agla_Scythia_AlphaAtlas_45.dds',		1, 				1),
		('AGLA_SCYTHIA_ALPHA_ATLAS',		32, 		'Agla_Scythia_AlphaAtlas_32.dds',		1, 				1),
		('AGLA_SCYTHIA_ALPHA_ATLAS',		24, 		'Agla_Scythia_AlphaAtlas_24.dds',		1, 				1),
		('AGLA_SCYTHIA_ALPHA_ATLAS',		16, 		'Agla_Scythia_AlphaAtlas_16.dds',		1, 				1),
		('AGLA_SCYTHIA_ICON_ATLAS', 		256, 		'Agla_Scythia_IconAtlas_256.dds',					2, 				2),
		('AGLA_SCYTHIA_ICON_ATLAS', 		128, 		'Agla_Scythia_IconAtlas_128.dds',					2, 				2),
		('AGLA_SCYTHIA_ICON_ATLAS', 		80, 		'Agla_Scythia_IconAtlas_80.dds',			2, 				2),
		('AGLA_SCYTHIA_ICON_ATLAS', 		64, 		'Agla_Scythia_IconAtlas_64.dds',			2, 				2),
		('AGLA_SCYTHIA_ICON_ATLAS', 		45, 		'Agla_Scythia_IconAtlas_45.dds',			2, 				2),
		('AGLA_SCYTHIA_ICON_ATLAS', 		32, 		'Agla_Scythia_IconAtlas_32.dds',			2, 				2),
		('AGLA_SCYTHIA_PROMOTION_ATLAS',	256, 	    'Tomatekh_PromotionAtlas_256.dds',				2, 				1),
		('AGLA_SCYTHIA_PROMOTION_ATLAS',	64, 	    'Tomatekh_PromotionAtlas_64.dds',				2, 				1),
		('AGLA_SCYTHIA_PROMOTION_ATLAS',	45, 	    'Tomatekh_PromotionAtlas_45.dds',				2, 				1),
		('AGLA_SCYTHIA_PROMOTION_ATLAS',	32, 	    'Tomatekh_PromotionAtlas_32.dds',				2, 				1),
		('AGLA_SCYTHIA_UNIT_FLAG_ATLAS', 	32, 		'Agla_Scythia_UnitFlagAtlas_32.dds',		1, 				1),
		('AGLA_SCYTHIA_UNIT2_FLAG_ATLAS', 	32, 		'Agla_Scythia2_UnitFlagAtlas_32.dds',		1, 				1),
		('AGLA_SCYTHIA_RES_ATLAS',		256, 		'FC3DrugsIcon256.dds',		1,				1),
		('AGLA_SCYTHIA_RES_ATLAS',		80, 		'FC3DrugsIcon80.dds',		1,				1),
		('AGLA_SCYTHIA_RES_ATLAS',		64, 		'FC3DrugsIcon64.dds',		1,				1),
		('AGLA_SCYTHIA_RES_ATLAS',		45, 		'FC3DrugsIcon45.dds',		1,				1);
--==========================================================================================================================	
--==========================================================================================================================	
