-- ======================================================================================================
-- ICON ATLASES
-- ======================================================================================================
-- IconTextureAtlases
---------------------
INSERT INTO IconTextureAtlases
(Atlas,                           IconSize,    Filename,                      IconsPerRow,       IconsPerColumn)
VALUES    ('ZRQ_TEO_SPEAROWL_ATLAS',     256,        'TeotihuacanAtlas_256.dds',        3,                 2),
('ZRQ_TEO_SPEAROWL_ATLAS',               128,        'TeotihuacanAtlas_128.dds',        3,                 2),
('ZRQ_TEO_SPEAROWL_ATLAS',               80,         'TeotihuacanAtlas_80.dds',         3,                 2),
('ZRQ_TEO_SPEAROWL_ATLAS',               64,         'TeotihuacanAtlas_64.dds',         3,                 2),
('ZRQ_TEO_SPEAROWL_ATLAS',               45,         'TeotihuacanAtlas_45.dds',         3,                 2),
('ZRQ_TEO_SPEAROWL_ATLAS',               32,         'TeotihuacanAtlas_32.dds',         3,                 2),
('ZRQ_TEO_SPEAROWL_ALPHA_ATLAS',         256,        'TeotihuacanAlpha_256.dds',        1,                 1),
('ZRQ_TEO_SPEAROWL_ALPHA_ATLAS',         128,        'TeotihuacanAlpha_128.dds',        1,                 1),
('ZRQ_TEO_SPEAROWL_ALPHA_ATLAS',         64,         'TeotihuacanAlpha_64.dds',         1,                 1),
('ZRQ_TEO_SPEAROWL_ALPHA_ATLAS',         48,         'TeotihuacanAlpha_48.dds',         1,                 1),
('ZRQ_TEO_SPEAROWL_ALPHA_ATLAS',         32,         'TeotihuacanAlpha_32.dds',         1,                 1),
('ZRQ_TEO_SPEAROWL_ALPHA_ATLAS',         24,         'TeotihuacanAlpha_24.dds',         1,                 1);

-- Define the file names right you Dodo--

-- ======================================================================================================
-- COLORS
-- ======================================================================================================
-- Colors
---------
INSERT INTO Colors
          (Type,									Red,     Green,    Blue,     Alpha)
VALUES    ('COLOR_PLAYER_ZRQ_TEO_SPEAROWL_ICON',	   0.314,   0.710,    0.584,    1),
		  ('COLOR_PLAYER_ZRQ_TEO_SPEAROWL_BACKGROUND', 0.106,   0.086,    0.153,    1);
---------------
-- PlayerColors
---------------
INSERT INTO PlayerColors
          (Type,                           PrimaryColor,                     SecondaryColor,                   TextColor)
VALUES    ('PLAYERCOLOR_ZRQ_TEO_SPEAROWL',        'COLOR_PLAYER_ZRQ_TEO_SPEAROWL_ICON',     'COLOR_PLAYER_ZRQ_TEO_SPEAROWL_BACKGROUND',     'COLOR_PLAYER_WHITE_TEXT');



------------------------------
-- IconFontTextures
------------------------------
INSERT INTO IconFontTextures 
		(IconFontTexture, 						IconFontTextureFile)
VALUES	('ICON_FONT_TEXTURE_ZRQ_OBSIDIAN', 		'ZRQ_ObsidianFontIcon_22');
------------------------------
-- IconFontMapping
------------------------------
INSERT INTO IconFontMapping 
		(IconName, 								IconFontTexture,					IconMapping)
VALUES	('ICON_RES_ZRQ_OBSIDIAN', 				'ICON_FONT_TEXTURE_ZRQ_OBSIDIAN',	1);

-- ======================================================================================================
-- UNIT ART
-- ======================================================================================================
--==========================================================================================================================	
-- Atlas Defines
--==========================================================================================================================	
INSERT INTO IconTextureAtlases 
		(Atlas, 				IconSize, 	Filename, 			IconsPerRow, 	IconsPerColumn)
VALUES 	('ZRQ_CANINE_FLAG',		  32,	'DogFlag32.dds',	1,				1);

--==========================================================================================================================	
-- Unit Defines
--==========================================================================================================================
------------------------------
-- ArtDefine_UnitInfos
------------------------------	
INSERT INTO ArtDefine_UnitInfos 
		(Type, 								DamageStates,	Formation)
SELECT	('ART_DEF_UNIT_ZRQ_CANINE'),	DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT_U_AZTEC_JAGUAR ');


------------------------------
-- ArtDefine_UnitInfoMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,					UnitMemberInfoType,						NumMembers)
SELECT	'ART_DEF_UNIT_ZRQ_CANINE',	'ART_DEF_UNIT_MEMBER_ZRQ_CANINE',	NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_MEMBER_U_AZTEC_JAGUAR');


------------------------------
-- ArtDefine_UnitMemberCombats
------------------------------
INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,						EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	('ART_DEF_UNIT_MEMBER_ZRQ_CANINE'),	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_U_AZTEC_JAGUAR');


------------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,						"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	('ART_DEF_UNIT_MEMBER_ZRQ_CANINE'),	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_U_AZTEC_JAGUAR');



------------------------------
-- ArtDefine_UnitMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitMemberInfos 										--this is where you add fxsml - Model Tag
		(Type, 									Scale,  ZOffset, Domain, Model,						 MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	('ART_DEF_UNIT_MEMBER_ZRQ_CANINE'),	Scale,	ZOffset, Domain, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE (Type = 'ART_DEF_UNIT_MEMBER_U_AZTEC_JAGUAR');



--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_StrategicView
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 			TileType,	Asset)
VALUES	('ART_DEF_UNIT_ZRQ_CANINE',	'Unit', 	'DogFlagSV.dds');




-- ======================================================================================================
-- AUDIO
-- ======================================================================================================
-- Audio_Sounds
---------------
INSERT INTO Audio_Sounds 
		(SoundID, 							             Filename, 		  LoadType)
VALUES	('SND_LEADER_MUSIC_ZRQ_SPEAROWL_PEACE', 		'Teotihuacan_Peace', 'DynamicResident'),
		('SND_LEADER_MUSIC_ZRQ_SPEAROWL_WAR', 		'Teotihuacan_War',   'DynamicResident');
-----------------
-- Audio_2DSounds
-----------------
INSERT INTO Audio_2DSounds 
		(ScriptID, 										SoundID, 									SoundType, 		TaperSoundtrackVolume,	MinVolume, 	MaxVolume,  IsMusic, Looping)
VALUES	('AS2D_LEADER_MUSIC_ZRQ_SPEAROWL_PEACE', 		'SND_LEADER_MUSIC_ZRQ_SPEAROWL_PEACE', 		'GAME_MUSIC', 	-1.0,					100, 		100, 		1, 		 0),
		('AS2D_LEADER_MUSIC_ZRQ_SPEAROWL_WAR', 			'SND_LEADER_MUSIC_ZRQ_SPEAROWL_WAR', 		'GAME_MUSIC', 	-1.0,					100, 		100, 		1,		 0);
-- ======================================================================================================
-- ======================================================================================================