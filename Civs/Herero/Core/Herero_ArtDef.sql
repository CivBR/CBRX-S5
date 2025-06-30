-- ======================================================================================================
-- ICON ATLASES
-- ======================================================================================================
-- IconTextureAtlases
---------------------
INSERT INTO IconTextureAtlases
(Atlas,                         IconSize,     Filename,                             IconsPerRow,     IconsPerColumn)
VALUES    ('THP_HERERO_ATLAS',     256,        'THP_HereroAtlas256.dds',        2,                 2),
('THP_HERERO_ATLAS',               128,        'THP_HereroAtlas128.dds',        2,                 2),
('THP_HERERO_ATLAS',               80,         'THP_HereroAtlas80.dds',         2,                 2),
('THP_HERERO_ATLAS',               64,         'THP_HereroAtlas64.dds',         2,                 2),
('THP_HERERO_ATLAS',               45,         'THP_HereroAtlas45.dds',         2,                 2),
('THP_HERERO_ATLAS',               32,         'THP_HereroAtlas32.dds',         2,                 2),
('THP_HERERO_ALPHA_ATLAS',         128,        'THP_HereroAlpha128.dds',        1,                 1),
('THP_HERERO_ALPHA_ATLAS',         80,         'THP_HereroAlpha80.dds',         1,                 1),
('THP_HERERO_ALPHA_ATLAS',         64,         'THP_HereroAlpha64.dds',         1,                 1),
('THP_HERERO_ALPHA_ATLAS',         48,         'THP_HereroAlpha48.dds',         1,                 1),
('THP_HERERO_ALPHA_ATLAS',         32,         'THP_HereroAlpha32.dds',         1,                 1),
('THP_HERERO_ALPHA_ATLAS',         24,         'THP_HereroAlpha24.dds',         1,                 1),
('THP_HERERO_ALPHA_ATLAS',         16,         'THP_HereroAlpha16.dds',         1,                 1),
('THP_UNIT_HERERO_OX_RIDER_FLAG_ATLAS',   32,  'Unit_Oxrider_Flag_32.dds',      1,                 1);
-- ======================================================================================================
-- COLORS
-- ======================================================================================================
-- Colors
---------
INSERT INTO Colors
(Type,                                       Red,     Green,    Blue,     Alpha)
VALUES    ('COLOR_PLAYER_THP_HERERO_ICON',   0.333,   0.047,    0.110,    1),
('COLOR_PLAYER_THP_HERERO_BACKGROUND',       0.953,   0.667,    0.596,    1);
---------------
-- PlayerColors
---------------
INSERT INTO PlayerColors
          (Type,                              PrimaryColor,                                        SecondaryColor,                   TextColor)
VALUES    ('PLAYERCOLOR_THP_HERERO',        'COLOR_PLAYER_THP_HERERO_ICON',     'COLOR_PLAYER_THP_HERERO_BACKGROUND',     'COLOR_PLAYER_WHITE_TEXT');
-- ======================================================================================================
-- UNIT ART
-- ======================================================================================================
-- Credit to Typhlomence for putting together the mod compatibility stuff in this section
--------------------------
-- ArtDefine_StrategicView
--------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 		        		 TileType,		 Asset)
VALUES	('ART_DEF_UNIT_THP_HERERO_OX_RIDER',		'Unit', 		'sv_oxrider.dds');
----------------------
-- ArtDefine_UnitInfos
----------------------
INSERT INTO ArtDefine_UnitInfos 
		(Type, 							        	DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_THP_HERERO_OX_RIDER',			DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_U_MORROCAN_BERBER_CAVALRY';

-- Updates the formation if it is adjusted by another mod
CREATE TRIGGER TyphTomomo_ScoutFormationChange
AFTER UPDATE OF Formation ON ArtDefine_UnitInfos
WHEN (OLD.Type = 'ART_DEF_UNIT_U_MORROCAN_BERBER_CAVALRY')
BEGIN
UPDATE ArtDefine_UnitInfos
SET Formation = NEW.Formation
WHERE (Type = 'ART_DEF_UNIT_HERERO_OX_RIDER');
END;
--------------------------------
-- ArtDefine_UnitInfoMemberInfos
--------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,					 UnitMemberInfoType,				 NumMembers)
SELECT	'ART_DEF_UNIT_THP_HERERO_OX_RIDER', 	'ART_DEF_UNIT_MEMBER_THP_HERERO_OX_RIDER',	 NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_U_MORROCAN_BERBER_CAVALRY';

-- Updates the number of other members of the unit if the number of them in
-- the original unit is adjusted. This should make it appear correctly if
-- R.E.D (Extreme) is enabled
CREATE TRIGGER TyphTomomo_ScoutNumMembersUpdate
AFTER UPDATE OF NumMembers ON ArtDefine_UnitInfoMemberInfos
WHEN (OLD.UnitInfoType = 'ART_DEF_UNIT_U_MORROCAN_BERBER_CAVALRY' AND OLD.UnitMemberInfoType = 'ART_DEF_UNIT_MEMBER_U_MORROCAN_BERBER_CAVALRY')
BEGIN
UPDATE ArtDefine_UnitInfoMemberInfos
SET NumMembers = NEW.NumMembers
WHERE (UnitInfoType = 'ART_DEF_UNIT_HERERO_OX_RIDER');
END;
------------------------------
-- ArtDefine_UnitMemberCombats
------------------------------
INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,					EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_THP_HERERO_OX_RIDER',	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax,   LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack,    HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat,  ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack,      AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_U_MORROCAN_BERBER_CAVALRY';
------------------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,					"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_THP_HERERO_OX_RIDER',	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_U_MORROCAN_BERBER_CAVALRY';
----------------------------
-- ArtDefine_UnitMemberInfos
----------------------------
INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 								        Scale,	ZOffset, Domain, Model, 				MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_THP_HERERO_OX_RIDER',	Scale,	ZOffset, Domain, 'OxCavalry.fxsxml',	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_U_MORROCAN_BERBER_CAVALRY';

-- Updates the size of the Ox Cavalry model if the size of the Berber Cavalry
-- is adjusted. This should make it appear correctly if a mod that adjusts unit
-- sizes (such as R.E.D) is enabled
CREATE TRIGGER TyphTomomo_ScoutScaleUpdate
AFTER UPDATE OF Scale ON ArtDefine_UnitMemberInfos
WHEN (OLD.Type = 'ART_DEF_UNIT_MEMBER_U_MORROCAN_BERBER_CAVALRY')
BEGIN
UPDATE ArtDefine_UnitMemberInfos
SET Scale = NEW.Scale
WHERE (Type = 'ART_DEF_UNIT_MEMBER_HERERO_OX_RIDER');
END;

-- In case a later loaded mod uses a global update which affects the Ox Cavalry
-- as well, reset it back to the Berber Cavalry's scale (extra bit in the WHEN
-- statement is to prevent it from triggering on itself, or the above trigger).
-- Mainly intended for R.E.D Xtreme
CREATE TRIGGER TyphTomomo_ScoutResetPoppoScaleUpdate
AFTER UPDATE OF Scale ON ArtDefine_UnitMemberInfos
WHEN ((OLD.Type = 'ART_DEF_UNIT_MEMBER_HERERO_OX_RIDER')
AND NEW.Scale <> (SELECT Scale FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_U_MORROCAN_BERBER_CAVALRY'))
BEGIN
UPDATE ArtDefine_UnitMemberInfos
SET Scale = (SELECT Scale FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_U_MORROCAN_BERBER_CAVALRY')
WHERE Type = OLD.Type;
END;
-- ======================================================================================================
-- AUDIO
-- ======================================================================================================
-- Audio_Sounds
---------------
INSERT INTO Audio_Sounds 
		(SoundID, 									     Filename, 		     LoadType)
VALUES	('SND_LEADER_MUSIC_THP_JACOB_MORENGA_PEACE', 	'Herero_Peace',		'DynamicResident'),
		('SND_LEADER_MUSIC_THP_JACOB_MORENGA_WAR', 		'Herero_War', 		'DynamicResident');
-----------------
-- Audio_2DSounds
-----------------
INSERT INTO Audio_2DSounds 
		(ScriptID, 										SoundID, 									SoundType, 		TaperSoundtrackVolume,	MinVolume, 	MaxVolume,  IsMusic, Looping)
VALUES	('AS2D_LEADER_MUSIC_THP_JACOB_MORENGA_PEACE', 		'SND_LEADER_MUSIC_THP_JACOB_MORENGA_PEACE', 		'GAME_MUSIC', 	-1.0,					100, 		100, 		1, 		 0),
		('AS2D_LEADER_MUSIC_THP_JACOB_MORENGA_WAR', 			'SND_LEADER_MUSIC_THP_JACOB_MORENGA_WAR', 		'GAME_MUSIC', 	-1.0,					100, 		100, 		1,		 0);


-- ======================================================================================================
-- ======================================================================================================
