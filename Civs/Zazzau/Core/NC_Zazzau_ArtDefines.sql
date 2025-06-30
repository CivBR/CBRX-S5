-- ======================================================================================================
-- UNIT ART
-- ======================================================================================================
-- ArtDefine_StrategicView
--------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 		         TileType,		 Asset)
VALUES	('ART_DEF_UNIT_NC_YAN_LIFIDA',		'Unit', 		'sv_yanlifida.dds');
----------------------
-- ArtDefine_UnitInfos
----------------------
INSERT INTO ArtDefine_UnitInfos
          (Type,                                DamageStates,    Formation)
SELECT    'ART_DEF_UNIT_NC_YAN_LIFIDA',         DamageStates,     Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_LANCER';
--------------------------------
-- ArtDefine_UnitInfoMemberInfos
--------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos
          (UnitInfoType,                     UnitMemberInfoType,                     NumMembers)
SELECT    'ART_DEF_UNIT_NC_YAN_LIFIDA',     'ART_DEF_UNIT_MEMBER_NC_YAN_LIFIDA',     NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_LANCER';
------------------------------
-- ArtDefine_UnitMemberCombats
------------------------------
INSERT INTO ArtDefine_UnitMemberCombats
(UnitMemberType,                                       EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT    'ART_DEF_UNIT_MEMBER_NC_YAN_LIFIDA',    EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax,   LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack,    HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat,  ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack,      AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_LANCER';
------------------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons
(UnitMemberType,                                       "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT    'ART_DEF_UNIT_MEMBER_NC_YAN_LIFIDA',    "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_LANCER';
----------------------------
-- ArtDefine_UnitMemberInfos
----------------------------
INSERT INTO ArtDefine_UnitMemberInfos
(Type,                                             Scale,   ZOffset, Domain, Model,                    MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT    'ART_DEF_UNIT_MEMBER_NC_YAN_LIFIDA',    Scale,    ZOffset, Domain, 'Knight_China.fxsxml',    MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_LANCER';
--=======================================================================================================================
-- AUDIO
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- Audio_Sounds
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Audio_Sounds 
		(SoundID, 										 Filename, 						LoadType)
VALUES	('SND_LEADER_MUSIC_NC_ZAZZAU_PEACE',	 'NC_Zazzau_Peace', 	'DynamicResident'),
		('SND_LEADER_MUSIC_NC_ZAZZAU_WAR', 	 'NC_Zazzau_War', 	'DynamicResident');			
------------------------------------------------------------------------------------------------------------------------
-- Audio_2DSounds
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Audio_2DSounds 
		(ScriptID, 												SoundID, 										SoundType, 		TaperSoundtrackVolume,	MinVolume, 	MaxVolume,  IsMusic, Looping)
VALUES	('AS2D_AMBIENCE_LEADER_NC_ZAZZAU_AMBIENCE',	'SND_AMBIENCE_COAST_BED', 						'GAME_SFX', 	-1.0,					25, 		25, 		0,		 1),
		('AS2D_LEADER_MUSIC_NC_ZAZZAU_PEACE',		'SND_LEADER_MUSIC_NC_ZAZZAU_PEACE',	'GAME_MUSIC',	-1.0,					45, 		45, 		1, 		 0),
		('AS2D_LEADER_MUSIC_NC_ZAZZAU_WAR', 			'SND_LEADER_MUSIC_NC_ZAZZAU_WAR', 	'GAME_MUSIC',	-1.0,					45, 		45, 		1,		 0);
--=======================================================================================================================
-- COLOURS
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- Colors
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Colors 
		(Type, 												Red, 	Green, 	Blue, 	Alpha)
VALUES	('COLOR_PLAYER_NC_ZAZZAU_ICON', 			0.361,   0.078,    0.078,    1),
		('COLOR_PLAYER_NC_ZAZZAU_BACKGROUND',	0.584,   0.667,    0.267,    1);
------------------------------------------------------------------------------------------------------------------------
-- PlayerColors
------------------------------------------------------------------------------------------------------------------------				
INSERT INTO PlayerColors 
		(Type, 									PrimaryColor, 								SecondaryColor, 									TextColor)
VALUES	('PLAYERCOLOR_NC_ZAZZAU',	'COLOR_PLAYER_NC_ZAZZAU_ICON',	'COLOR_PLAYER_NC_ZAZZAU_BACKGROUND', 	'COLOR_PLAYER_WHITE_TEXT');
--=======================================================================================================================
-- ICON ATLASES
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- IconTextureAtlases
------------------------------------------------------------------------------------------------------------------------
INSERT INTO IconTextureAtlases 
		(Atlas, 									IconSize, 	Filename, 										IconsPerRow, 	IconsPerColumn)
VALUES	('NC_ZAZZAU_ALPHA_ATLAS', 		256, 		'ZazzauAlpha_256.dds',		1, 				1),
		('NC_ZAZZAU_ALPHA_ATLAS', 		128, 		'ZazzauAlpha_128.dds',		1, 				1),
		('NC_ZAZZAU_ALPHA_ATLAS', 		64, 		'ZazzauAlpha_64.dds',		1, 				1),
		('NC_ZAZZAU_ALPHA_ATLAS', 		48, 		'ZazzauAlpha_48.dds',		1, 				1),
		('NC_ZAZZAU_ALPHA_ATLAS', 		32, 		'ZazzauAlpha_32.dds',		1, 				1),
		('NC_ZAZZAU_ALPHA_ATLAS', 		24, 		'ZazzauAlpha_24.dds',		1, 				1),
		('NC_ZAZZAU_ICON_ATLAS', 		256, 		'NC_ZazzauAtlas_256.dds',		2, 				2),
		('NC_ZAZZAU_ICON_ATLAS', 		128, 		'NC_ZazzauAtlas_128.dds',		2, 				2),
		('NC_ZAZZAU_ICON_ATLAS', 		80, 		'NC_ZazzauAtlas_80.dds',			2, 				2),
		('NC_ZAZZAU_ICON_ATLAS', 		64, 		'NC_ZazzauAtlas_64.dds',			2, 				2),
		('NC_ZAZZAU_ICON_ATLAS', 		45, 		'NC_ZazzauAtlas_45.dds',			2, 				2),
		('NC_ZAZZAU_ICON_ATLAS', 		32, 		'NC_ZazzauAtlas_32.dds',			2, 				2),
		('NC_ZAZZAU_UNIT_FLAG_ATLAS',	32, 		'Unit_YanLifida_Flag_32.dds',		1, 				1);
--=======================================================================================================================	
--=======================================================================================================================	
