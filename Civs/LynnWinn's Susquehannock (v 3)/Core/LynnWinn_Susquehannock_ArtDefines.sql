--==========================================================================================================================
-- ART DEFINES
--==========================================================================================================================	
-- IconTextureAtlases
------------------------------
INSERT INTO IconTextureAtlases 
		(Atlas, 									IconSize, 	Filename, 						IconsPerRow, 	IconsPerColumn)
VALUES	('CIV_ATLAS_TG_SUSQUEHANNOCK', 				256, 		'SusquehannockAtlas256.dds',	3, 				2),
		('CIV_ATLAS_TG_SUSQUEHANNOCK', 				128, 		'SusquehannockAtlas128.dds',	3, 				2),
		('CIV_ATLAS_TG_SUSQUEHANNOCK', 				80, 		'SusquehannockAtlas80.dds',		3, 				2),
		('CIV_ATLAS_TG_SUSQUEHANNOCK', 				64, 		'SusquehannockAtlas64.dds',		3, 				2),
		('CIV_ATLAS_TG_SUSQUEHANNOCK', 				45, 		'SusquehannockAtlas45.dds',		3, 				2),
		('CIV_ATLAS_TG_SUSQUEHANNOCK', 				32, 		'SusquehannockAtlas32.dds',		3, 				2),
		('CIV_ALPHA_ATLAS_TG_SUSQUEHANNOCK', 		128, 		'SusquehannockAtlas128.dds',	1,				2),
		('CIV_ALPHA_ATLAS_TG_SUSQUEHANNOCK', 		80, 		'SusquehannockAtlas80.dds',		1, 				2),
		('CIV_ALPHA_ATLAS_TG_SUSQUEHANNOCK', 		64, 		'SusquehannockAtlas64.dds',		1, 				2),
		('CIV_ALPHA_ATLAS_TG_SUSQUEHANNOCK', 		48, 		'SusquehannockAtlas48.dds',		1, 				2),
		('CIV_ALPHA_ATLAS_TG_SUSQUEHANNOCK', 		45, 		'SusquehannockAtlas45.dds',		1, 				2),
		('CIV_ALPHA_ATLAS_TG_SUSQUEHANNOCK', 		32, 		'SusquehannockAtlas32.dds',		1, 				2),
		('CIV_ALPHA_ATLAS_TG_SUSQUEHANNOCK', 		24, 		'SusquehannockAtlas24.dds',		1, 				2),
		('CIV_ATLAS_TG_SUSQUEHANNOCK_ITAEAETSIN',	32, 		'SusquehannockFlag32.dds',		1, 				1),
		('CIV_ATLAS_TG_SUSQUEHANNOCK_ITAEAETSIN',	128, 		'SusquehannockFlag128.dds',		1, 				1);
--==========================================================================================================================
-- UNIT GRAPHICS
--==========================================================================================================================
-- ArtDefine_StrategicView
--------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 							TileType,	Asset)
VALUES	('ART_DEF_UNIT_TG_SUSQUEHANNOCK_ITAEAETSIN',	'Unit', 	'SusquehannockFlag128.dds');
----------------------
-- ArtDefine_UnitInfos
----------------------
INSERT INTO ArtDefine_UnitInfos
          (Type,                              DamageStates,     Formation)
SELECT    'ART_DEF_UNIT_TG_SUSQUEHANNOCK_ITAEAETSIN',   DamageStates,     Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_MUSKETMAN';
--------------------------------
-- ArtDefine_UnitInfoMemberInfos
--------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos
          (UnitInfoType,								UnitMemberInfoType,									NumMembers)
SELECT    'ART_DEF_UNIT_TG_SUSQUEHANNOCK_ITAEAETSIN',	'ART_DEF_UNIT_MEMBER_TG_SUSQUEHANNOCK_ITAEAETSIN',	NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_MUSKETMAN';

------------------------------
-- ArtDefine_UnitMemberCombats
------------------------------
INSERT INTO ArtDefine_UnitMemberCombats
		(UnitMemberType,									EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT  'ART_DEF_UNIT_MEMBER_TG_SUSQUEHANNOCK_ITAEAETSIN',	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_MUSKETMAN';
------------------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons
		(UnitMemberType,									"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT  'ART_DEF_UNIT_MEMBER_TG_SUSQUEHANNOCK_ITAEAETSIN',	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_MUSKETMAN';
----------------------------
-- ArtDefine_UnitMemberInfos
----------------------------
INSERT INTO ArtDefine_UnitMemberInfos
		(Type,												Scale,    ZOffset, Domain, Model,				MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_TG_SUSQUEHANNOCK_ITAEAETSIN',	Scale,    ZOffset, Domain, 'civ5_irorm.fxsxml',	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_MUSKETMAN';
--==========================================================================================================================
-- AUDIO
--==========================================================================================================================
-- Audio_Sounds
----------------------------
INSERT INTO Audio_Sounds 
		(SoundID,							   Filename,	   LoadType)
VALUES  ('SND_LEADER_MUSIC_TG_SHEEHAYS_PEACE', 'Sheehays_Peace', 'DynamicResident'), -- I Am Your Friend https://www.youtube.com/watch?v=GxnE1EnNWc8
		('SND_LEADER_MUSIC_TG_SHEEHAYS_WAR',   'Sheehays_War',   'DynamicResident'); -- The Great Law of Peace https://www.youtube.com/watch?v=LGRsQfrkZBs
----------------------------
-- Audio_2DSounds
----------------------------
INSERT INTO Audio_2DSounds 
		(ScriptID,								SoundID,								SoundType,		TaperSoundtrackVolume,	MinVolume,	MaxVolume,	IsMusic, Looping)
VALUES  ('AS2D_LEADER_MUSIC_TG_SHEEHAYS_PEACE',	'SND_LEADER_MUSIC_TG_SHEEHAYS_PEACE',	'GAME_MUSIC',	-1.0,					100,		100,		1,		 0),
		('AS2D_LEADER_MUSIC_TG_SHEEHAYS_WAR',	'SND_LEADER_MUSIC_TG_SHEEHAYS_WAR',		'GAME_MUSIC',	-1.0,					100,		100,		1,		 0);
-- UI STUFF
----------------------------
-- ArtDefine_LandmarkTypes
----------------------------
INSERT INTO ArtDefine_LandmarkTypes 
			(Type, 												LandmarkType,	FriendlyName)
VALUES		('ART_DEF_IMPROVEMENT_TG_PALISADE',	'Improvement', 	'Palisade Village');
----------------------------
-- ArtDefine_StrategicView
----------------------------PalisadeVillage_HB.fxdxml
--INSERT INTO ArtDefine_StrategicView
--			(StrategicViewType,									TileType,		Asset)
--VALUES    ('ART_DEF_IMPROVEMENT_MC_NTF_SENECA_THREE_SISTERS',	'Improvement',	'sv_ThreeSisters.dds');
----------------------------
-- ArtDefine_Landmarks
----------------------------
INSERT INTO ArtDefine_Landmarks 
			(ImprovementType, 					Era,	State,				 Scale, LayoutHandler,	ResourceType,			Model,									 TerrainContour)
VALUES		('ART_DEF_IMPROVEMENT_TG_PALISADE',	'Any', 	'UnderConstruction', 0.8,	'SNAPSHOT',		'ART_DEF_RESOURCE_ALL', 'North American Encampment 1 HB.fxsxml', 1),
			('ART_DEF_IMPROVEMENT_TG_PALISADE',	'Any', 	'Constructed',		 0.8,	'SNAPSHOT',		'ART_DEF_RESOURCE_ALL', 'North American Encampment 1 B.fxsxml',	 1),
			('ART_DEF_IMPROVEMENT_TG_PALISADE',	'Any', 	'Pillaged',			 0.8,	'SNAPSHOT',		'ART_DEF_RESOURCE_ALL', 'North American Encampment 1 PL.fxsxml', 1);