--==========================================================================================================================
-- UNIT GRAPHICS
--==========================================================================================================================	
-- ArtDefine_StrategicView
------------------------------
INSERT INTO ArtDefine_StrategicView 
			(StrategicViewType, 		TileType,	Asset)
VALUES		('ART_DEF_UNIT_GT_WRIGGLING_RIDER', 	'Unit', 	'sv_WrigglingRider.dds'),
			('ART_DEF_UNIT_GT_NONOR', 	'Unit', 	'sv_Nonor.dds'),
			('ART_DEF_IMPROVEMENT_GT_ORTEGE', 	'Improvement', 	'sv_Ortege.dds');
------------------------------
-- ArtDefine_UnitInfos
------------------------------			
INSERT INTO ArtDefine_UnitInfos 
			(Type, 								DamageStates,	Formation)
SELECT		('ART_DEF_UNIT_GT_WRIGGLING_RIDER'), 	DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT_HORSEMAN');

INSERT INTO ArtDefine_UnitInfos 
			(Type, 								DamageStates,	Formation)
SELECT		('ART_DEF_UNIT_GT_NONOR'), 	DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT_GENERAL_KHAN');
------------------------------
-- ArtDefine_UnitInfoMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
			(UnitInfoType,						UnitMemberInfoType,							NumMembers)
SELECT		('ART_DEF_UNIT_GT_WRIGGLING_RIDER'), 	('ART_DEF_UNIT_MEMBER_GT_WRIGGLING_RIDER'), 	2
FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_HORSEMAN');

INSERT INTO ArtDefine_UnitInfoMemberInfos 	
			(UnitInfoType,						UnitMemberInfoType,							NumMembers)
SELECT		('ART_DEF_UNIT_GT_NONOR'), 	('ART_DEF_UNIT_MEMBER_GT_NONOR'), 	NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_GENERAL_KHAN');
------------------------------
-- ArtDefine_UnitMemberCombats
------------------------------
INSERT INTO ArtDefine_UnitMemberCombats 
			(UnitMemberType,						EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT		('ART_DEF_UNIT_MEMBER_GT_WRIGGLING_RIDER'),	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_HORSEMAN');

INSERT INTO ArtDefine_UnitMemberCombats 
			(UnitMemberType,						EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT		('ART_DEF_UNIT_MEMBER_GT_NONOR'),	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_GREATGENERAL_KHAN');
------------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
			(UnitMemberType,						"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT		('ART_DEF_UNIT_MEMBER_GT_WRIGGLING_RIDER'),	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_HORSEMAN');

INSERT INTO ArtDefine_UnitMemberCombatWeapons	
			(UnitMemberType,						"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT		('ART_DEF_UNIT_MEMBER_GT_NONOR'),	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_GREATGENERAL_KHAN');
----------------------------
-- ArtDefine_UnitMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitMemberInfos 	
			(Type, 									Scale,  ZOffset, Domain, Model, 					MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT		('ART_DEF_UNIT_MEMBER_GT_WRIGGLING_RIDER'),	Scale,	ZOffset, Domain, ('tcmAltaicRider.fxsxml'),	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE (Type = 'ART_DEF_UNIT_MEMBER_HORSEMAN');

INSERT INTO ArtDefine_UnitMemberInfos 	
			(Type, 									Scale,  ZOffset, Domain, Model, 					MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT		('ART_DEF_UNIT_MEMBER_GT_NONOR'),	Scale,	ZOffset, Domain, ('Knight_Persia.fxsxml'),	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE (Type = 'ART_DEF_UNIT_MEMBER_GREATGENERAL_KHAN');
------------------------------
-- ArtDefine_LandmarkTypes
------------------------------
INSERT INTO ArtDefine_LandmarkTypes(Type, LandmarkType, FriendlyName)
SELECT 'ART_DEF_IMPROVEMENT_GT_ORTEGE', 'Improvement', 'Ortege';
------------------------------
-- ArtDefine_Landmarks
------------------------------
INSERT INTO ArtDefine_Landmarks(Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour)
SELECT 'Any', 'UnderConstruction', 0.75,  'ART_DEF_IMPROVEMENT_GT_ORTEGE', 'SNAPSHOT', 'ART_DEF_RESOURCE_ALL', 'tcmYurtCamp.fxsxml', 1 UNION ALL
SELECT 'Any', 'Constructed', 0.75,  'ART_DEF_IMPROVEMENT_GT_ORTEGE', 'SNAPSHOT', 'ART_DEF_RESOURCE_ALL', 'tcmYurtCamp.fxsxml', 1 UNION ALL
SELECT 'Any', 'Pillaged', 0.75,  'ART_DEF_IMPROVEMENT_GT_ORTEGE', 'SNAPSHOT', 'ART_DEF_RESOURCE_ALL', 'tcmYurtCamp.fxsxml', 1;
--==========================================================================================================================
-- AUDIO
--==========================================================================================================================	
-- Audio_Sounds
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Audio_Sounds 
		(SoundID, 									Filename, 						LoadType)
VALUES	('SND_LEADER_MUSIC_GT_YUJIULU_MUGULU_PEACE', 		'RouranPeace',				'DynamicResident'),
		('SND_LEADER_MUSIC_GT_YUJIULU_MUGULU_WAR', 		'RouranWar', 				'DynamicResident');
--------------------------------------------------------------------------------------------------------------------------
-- Audio_2DSounds
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Audio_2DSounds 
		(ScriptID, 										SoundID, 								SoundType, 		TaperSoundtrackVolume,	MinVolume, 	MaxVolume,  IsMusic, Looping)
VALUES	('AS2D_LEADER_MUSIC_GT_YUJIULU_MUGULU_PEACE', 			'SND_LEADER_MUSIC_GT_YUJIULU_MUGULU_PEACE',	'GAME_MUSIC', 	-1.0,					45, 		45, 		1, 		 0),
		('AS2D_LEADER_MUSIC_GT_YUJIULU_MUGULU_WAR', 				'SND_LEADER_MUSIC_GT_YUJIULU_MUGULU_WAR', 		'GAME_MUSIC', 	-1.0,					45, 		45, 		1,		 0);
--==========================================================================================================================
-- COLOURS
--==========================================================================================================================	
-- Colors
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Colors 
		(Type, 										Red, 	Green, 	Blue, 	Alpha)
VALUES	('COLOR_PLAYER_GT_ROURAN_ICON', 			0.478,	0.109,	0.003,	1),													
		('COLOR_PLAYER_GT_ROURAN_BACKGROUND',	0.780,	0.773,	0.216,	1);		
--------------------------------------------------------------------------------------------------------------------------
-- PlayerColors
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO PlayerColors 
		(Type, 								PrimaryColor, 								SecondaryColor, 								TextColor)
VALUES	('PLAYERCOLOR_GT_ROURAN',		'COLOR_PLAYER_GT_ROURAN_ICON', 		'COLOR_PLAYER_GT_ROURAN_BACKGROUND',		'COLOR_PLAYER_WHITE_TEXT');
--==========================================================================================================================
-- Icon Atlases
--==========================================================================================================================	
INSERT INTO IconTextureAtlases 
		(Atlas, 								IconSize, 	Filename, 							IconsPerRow, 	IconsPerColumn)
VALUES	('GT_ROURAN_ATLAS', 						256, 		'Rouran_Atlas256.dds',			3, 				2),
		('GT_ROURAN_ATLAS', 						128, 		'Rouran_Atlas128.dds',			3, 				2),
		('GT_ROURAN_ATLAS', 						80, 		'Rouran_Atlas80.dds',				3, 				2),
		('GT_ROURAN_ATLAS', 						64, 		'Rouran_Atlas64.dds',				3, 				2),
		('GT_ROURAN_ATLAS', 						45, 		'Rouran_Atlas45.dds',				3, 				2),
		('GT_ROURAN_ATLAS', 						32, 		'Rouran_Atlas32.dds',				3, 				2),
		('GT_ROURAN_ATLAS', 						24, 		'Rouran_Atlas24.dds',				3, 				2),
		('GT_ROURAN_ALPHA_ATLAS', 				128, 		'Rouran_Alpha128.dds',		1,				1),
		('GT_ROURAN_ALPHA_ATLAS', 				80, 		'Rouran_Alpha80.dds',			1, 				1),
		('GT_ROURAN_ALPHA_ATLAS', 				64, 		'Rouran_Alpha64.dds',			1, 				1),
		('GT_ROURAN_ALPHA_ATLAS', 				48, 		'Rouran_Alpha48.dds',			1, 				1),
		('GT_ROURAN_ALPHA_ATLAS', 				32, 		'Rouran_Alpha32.dds',			1, 				1),
		('GT_ROURAN_ALPHA_ATLAS', 				24, 		'Rouran_Alpha24.dds',			1, 				1),
		('GT_WRIGGLING_RIDER_FLAG_ATLAS',		32,			'uu_WrigglingRider_flag.dds',			1,				1),
		('GT_NONOR_FLAG_ATLAS',		32,			'uu_Nonor_flag.dds',			1,				1),
		('GT_ORTEGE_ATLAS', 					64, 		'OrtegeAtlas64.dds',				1, 				1),
		('GT_ORTEGE_ATLAS', 					45, 		'OrtegeAtlas45.dds',				1, 				1);
--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
-- Civilizations
--------------------------------		
INSERT INTO Civilizations 
		(Type, 							Description, 							ShortDescription,							Adjective,										CivilopediaTag,										DefaultPlayerColor,				ArtDefineTag,	ArtStyleType,	ArtStyleSuffix,	ArtStylePrefix,	PortraitIndex,	IconAtlas,				AlphaIconAtlas,					SoundtrackTag, 	MapImage,				DawnOfManQuote,							DawnOfManImage)
SELECT	('CIVILIZATION_GT_ROURAN'), 	('TXT_KEY_CIVILIZATION_GT_ROURAN'), 	('TXT_KEY_CIVILIZATION_GT_ROURAN_SHORT'),	('TXT_KEY_CIVILIZATION_GT_ROURAN_ADJECTIVE'),	('TXT_KEY_CIV5_GT_ROURAN'),	('PLAYERCOLOR_GT_ROURAN'),	ArtDefineTag,	ArtStyleType,	ArtStyleSuffix,	ArtStylePrefix,	0,				('GT_ROURAN_ATLAS'),	('GT_ROURAN_ALPHA_ATLAS'),	('Mongol'), 		('RouranMap.dds'),	('TXT_KEY_CIV5_DAWN_GT_ROURAN_TEXT'),	('RouranDoM.dds')
FROM Civilizations WHERE (Type = 'CIVILIZATION_MONGOL');
--------------------------------	
-- Civilization_CityNames
--------------------------------	
INSERT INTO Civilization_CityNames
        (CivilizationType,				CityName)
VALUES	('CIVILIZATION_GT_ROURAN',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_ROURAN_1'),
        ('CIVILIZATION_GT_ROURAN',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_ROURAN_2'),
        ('CIVILIZATION_GT_ROURAN',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_ROURAN_3'),
        ('CIVILIZATION_GT_ROURAN',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_ROURAN_4'),
        ('CIVILIZATION_GT_ROURAN',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_ROURAN_5'),
        ('CIVILIZATION_GT_ROURAN',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_ROURAN_6'),
        ('CIVILIZATION_GT_ROURAN',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_ROURAN_7'),
        ('CIVILIZATION_GT_ROURAN',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_ROURAN_8'),
        ('CIVILIZATION_GT_ROURAN',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_ROURAN_9'),
        ('CIVILIZATION_GT_ROURAN',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_ROURAN_10'),
        ('CIVILIZATION_GT_ROURAN',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_ROURAN_11'),
        ('CIVILIZATION_GT_ROURAN',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_ROURAN_12'),
        ('CIVILIZATION_GT_ROURAN',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_ROURAN_13'),
        ('CIVILIZATION_GT_ROURAN',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_ROURAN_14'),
        ('CIVILIZATION_GT_ROURAN',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_ROURAN_15'),
        ('CIVILIZATION_GT_ROURAN',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_ROURAN_16'),
        ('CIVILIZATION_GT_ROURAN',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_ROURAN_17'),
        ('CIVILIZATION_GT_ROURAN',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_ROURAN_18'),
        ('CIVILIZATION_GT_ROURAN',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_ROURAN_19'),
        ('CIVILIZATION_GT_ROURAN',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_ROURAN_20'),
        ('CIVILIZATION_GT_ROURAN',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_ROURAN_21'),
        ('CIVILIZATION_GT_ROURAN',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_ROURAN_22'),
        ('CIVILIZATION_GT_ROURAN',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_ROURAN_23'),
        ('CIVILIZATION_GT_ROURAN',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_ROURAN_24'),
        ('CIVILIZATION_GT_ROURAN',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_ROURAN_25'),
        ('CIVILIZATION_GT_ROURAN',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_ROURAN_26'),
        ('CIVILIZATION_GT_ROURAN',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_ROURAN_27'),
        ('CIVILIZATION_GT_ROURAN',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_ROURAN_28'),
        ('CIVILIZATION_GT_ROURAN',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_ROURAN_29'),
        ('CIVILIZATION_GT_ROURAN',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_ROURAN_30');		
--------------------------------	
-- Civilization_FreeBuildingClasses
--------------------------------			
INSERT INTO Civilization_FreeBuildingClasses 
		(CivilizationType, 					BuildingClassType)
SELECT	('CIVILIZATION_GT_ROURAN'),	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE (CivilizationType = 'CIVILIZATION_MONGOL');
--------------------------------	
-- Civilization_FreeTechs
--------------------------------		
INSERT INTO Civilization_FreeTechs 
		(CivilizationType, 					TechType)
SELECT	('CIVILIZATION_GT_ROURAN'),	TechType
FROM Civilization_FreeTechs WHERE (CivilizationType = 'CIVILIZATION_MONGOL');
--------------------------------	
-- Civilization_FreeUnits
--------------------------------		
INSERT INTO Civilization_FreeUnits 
		(CivilizationType, 					UnitClassType, Count, UnitAIType)
SELECT	('CIVILIZATION_GT_ROURAN'),	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE (CivilizationType = 'CIVILIZATION_MONGOL');
--------------------------------	
-- Civilization_Leaders
--------------------------------
INSERT INTO Civilization_Leaders 
		(CivilizationType, 				LeaderheadType)
VALUES	('CIVILIZATION_GT_ROURAN',	'LEADER_GT_YUJIULU_MUGULU');
--------------------------------	
-- Civilization_Religions
--------------------------------
INSERT INTO Civilization_Religions
		(CivilizationType, 				ReligionType)
VALUES	('CIVILIZATION_GT_ROURAN',	'RELIGION_TENGRIISM');
--------------------------------	
-- Civilization_UnitClassOverrides 
--------------------------------
DELETE FROM Civilization_UnitClassOverrides WHERE (CivilizationType = 'CIVILIZATION_MONGOL');
INSERT INTO Civilization_UnitClassOverrides 
		(CivilizationType, 				UnitClassType, 			UnitType)
VALUES	('CIVILIZATION_GT_ROURAN', 	'UNITCLASS_HORSEMAN',		'UNIT_GT_WRIGGLING_RIDER'),
		('CIVILIZATION_GT_ROURAN', 	'UNITCLASS_GREAT_GENERAL',	'UNIT_GT_NONOR'),
		('CIVILIZATION_MONGOL', 	'UNITCLASS_HORSEMAN',			'UNIT_MONGOLIAN_KESHIK');
--------------------------------	
-- Civilization_SpyNames
--------------------------------
INSERT INTO Civilization_SpyNames 
		(CivilizationType, 				SpyName)
VALUES	('CIVILIZATION_GT_ROURAN', 	'TXT_KEY_SPY_NAME_GT_ROURAN_0'),	
		('CIVILIZATION_GT_ROURAN', 	'TXT_KEY_SPY_NAME_GT_ROURAN_1'),
		('CIVILIZATION_GT_ROURAN', 	'TXT_KEY_SPY_NAME_GT_ROURAN_2'),
		('CIVILIZATION_GT_ROURAN', 	'TXT_KEY_SPY_NAME_GT_ROURAN_3'),
		('CIVILIZATION_GT_ROURAN', 	'TXT_KEY_SPY_NAME_GT_ROURAN_4'),
		('CIVILIZATION_GT_ROURAN', 	'TXT_KEY_SPY_NAME_GT_ROURAN_5'),
		('CIVILIZATION_GT_ROURAN', 	'TXT_KEY_SPY_NAME_GT_ROURAN_6'),
		('CIVILIZATION_GT_ROURAN', 	'TXT_KEY_SPY_NAME_GT_ROURAN_7'),
		('CIVILIZATION_GT_ROURAN', 	'TXT_KEY_SPY_NAME_GT_ROURAN_8'),
		('CIVILIZATION_GT_ROURAN', 	'TXT_KEY_SPY_NAME_GT_ROURAN_9');
--------------------------------	
-- Civilization_Start_Region_Priority
--------------------------------	
INSERT INTO Civilization_Start_Region_Priority 
		(CivilizationType, 				RegionType)
VALUES	('CIVILIZATION_GT_ROURAN',	'REGION_PLAINS'),
		('CIVILIZATION_GT_ROURAN',	'REGION_HILLS');
--------------------------------	
-- Civilization_Start_Region_Avoid
--------------------------------	
INSERT INTO Civilization_Start_Region_Avoid 
		(CivilizationType, 				RegionType)
VALUES	('CIVILIZATION_GT_ROURAN',	'REGION_JUNGLE');
--==========================================================================================================================	
-- LEADERS
--==========================================================================================================================	
-- Leaders
--------------------------------			
INSERT INTO Leaders 
		(Type, 					Description, 					Civilopedia, 							CivilopediaTag, 						ArtDefineTag, 												VictoryCompetitiveness, 	WonderCompetitiveness, 		MinorCivCompetitiveness, 	Boldness, 		DiploBalance, 	WarmongerHate, 			DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 		Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 				PortraitIndex)
VALUES	('LEADER_GT_YUJIULU_MUGULU', 	'TXT_KEY_LEADER_GT_YUJIULU_MUGULU', 	'TXT_KEY_LEADER_GT_YUJIULU_MUGULU_PEDIA', 	'TXT_KEY_CIVILOPEDIA_LEADERS_GT_YUJIULU_MUGULU',	'Rouran_Diplo.xml',			4, 							9, 							6, 							6, 				5, 				5, 						5, 						6, 				4, 			4, 				7, 				4, 			6, 			'GT_ROURAN_ATLAS',		1);
--------------------------------		
-- Leader_MajorCivApproachBiases
--------------------------------						
INSERT INTO Leader_MajorCivApproachBiases 
		(LeaderType, 				MajorCivApproachType, 				Bias)
VALUES	('LEADER_GT_YUJIULU_MUGULU', 		'MAJOR_CIV_APPROACH_WAR', 			8),
		('LEADER_GT_YUJIULU_MUGULU', 		'MAJOR_CIV_APPROACH_HOSTILE', 		6),
		('LEADER_GT_YUJIULU_MUGULU', 		'MAJOR_CIV_APPROACH_DECEPTIVE', 	3),
		('LEADER_GT_YUJIULU_MUGULU', 		'MAJOR_CIV_APPROACH_GUARDED', 		4),
		('LEADER_GT_YUJIULU_MUGULU', 		'MAJOR_CIV_APPROACH_AFRAID', 		3),
		('LEADER_GT_YUJIULU_MUGULU', 		'MAJOR_CIV_APPROACH_FRIENDLY', 		2),
		('LEADER_GT_YUJIULU_MUGULU', 		'MAJOR_CIV_APPROACH_NEUTRAL', 		1);
--------------------------------	
-- Leader_MinorCivApproachBiases
--------------------------------							
INSERT INTO Leader_MinorCivApproachBiases 
		(LeaderType, 						MinorCivApproachType, 				Bias)
VALUES	('LEADER_GT_YUJIULU_MUGULU', 		'MINOR_CIV_APPROACH_IGNORE', 		1),
		('LEADER_GT_YUJIULU_MUGULU', 		'MINOR_CIV_APPROACH_FRIENDLY', 		3),
		('LEADER_GT_YUJIULU_MUGULU', 		'MINOR_CIV_APPROACH_PROTECTIVE', 	2),
		('LEADER_GT_YUJIULU_MUGULU', 		'MINOR_CIV_APPROACH_CONQUEST', 		10),
		('LEADER_GT_YUJIULU_MUGULU', 		'MINOR_CIV_APPROACH_BULLY', 		6);
--------------------------------	
-- Leader_Flavors
--------------------------------							
INSERT INTO Leader_Flavors 
		(LeaderType, 						FlavorType, 						Flavor)
VALUES	('LEADER_GT_YUJIULU_MUGULU', 		'FLAVOR_OFFENSE', 					8),
		('LEADER_GT_YUJIULU_MUGULU', 		'FLAVOR_DEFENSE', 					4),
		('LEADER_GT_YUJIULU_MUGULU', 		'FLAVOR_CITY_DEFENSE', 				1),
		('LEADER_GT_YUJIULU_MUGULU', 		'FLAVOR_MILITARY_TRAINING', 		8),
		('LEADER_GT_YUJIULU_MUGULU', 		'FLAVOR_RECON', 					6),
		('LEADER_GT_YUJIULU_MUGULU', 		'FLAVOR_RANGED', 					6),
		('LEADER_GT_YUJIULU_MUGULU', 		'FLAVOR_MOBILE', 					11),
		('LEADER_GT_YUJIULU_MUGULU', 		'FLAVOR_NAVAL', 					1),
		('LEADER_GT_YUJIULU_MUGULU', 		'FLAVOR_NAVAL_RECON', 				1),
		('LEADER_GT_YUJIULU_MUGULU', 		'FLAVOR_NAVAL_GROWTH', 				3),
		('LEADER_GT_YUJIULU_MUGULU', 		'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	3),
		('LEADER_GT_YUJIULU_MUGULU', 		'FLAVOR_AIR', 						9),
		('LEADER_GT_YUJIULU_MUGULU', 		'FLAVOR_EXPANSION', 				9),
		('LEADER_GT_YUJIULU_MUGULU', 		'FLAVOR_GROWTH', 					2),
		('LEADER_GT_YUJIULU_MUGULU', 		'FLAVOR_TILE_IMPROVEMENT', 			6),
		('LEADER_GT_YUJIULU_MUGULU', 		'FLAVOR_INFRASTRUCTURE', 			4),
		('LEADER_GT_YUJIULU_MUGULU', 		'FLAVOR_PRODUCTION', 				7),
		('LEADER_GT_YUJIULU_MUGULU', 		'FLAVOR_GOLD', 						7),
		('LEADER_GT_YUJIULU_MUGULU', 		'FLAVOR_SCIENCE', 					3),
		('LEADER_GT_YUJIULU_MUGULU', 		'FLAVOR_CULTURE', 					5),
		('LEADER_GT_YUJIULU_MUGULU', 		'FLAVOR_HAPPINESS', 				6),
		('LEADER_GT_YUJIULU_MUGULU', 		'FLAVOR_GREAT_PEOPLE', 				4),
		('LEADER_GT_YUJIULU_MUGULU', 		'FLAVOR_WONDER', 					1),
		('LEADER_GT_YUJIULU_MUGULU', 		'FLAVOR_RELIGION', 					3),
		('LEADER_GT_YUJIULU_MUGULU', 		'FLAVOR_DIPLOMACY', 				6),
		('LEADER_GT_YUJIULU_MUGULU', 		'FLAVOR_SPACESHIP', 				5),
		('LEADER_GT_YUJIULU_MUGULU', 		'FLAVOR_WATER_CONNECTION', 			4),
		('LEADER_GT_YUJIULU_MUGULU', 		'FLAVOR_NUKE', 						7),
		('LEADER_GT_YUJIULU_MUGULU', 		'FLAVOR_USE_NUKE', 					3),
		('LEADER_GT_YUJIULU_MUGULU', 		'FLAVOR_ESPIONAGE', 				3),
		('LEADER_GT_YUJIULU_MUGULU', 		'FLAVOR_AIRLIFT', 					8),
		('LEADER_GT_YUJIULU_MUGULU', 		'FLAVOR_I_TRADE_DESTINATION', 		5),
		('LEADER_GT_YUJIULU_MUGULU', 		'FLAVOR_I_TRADE_ORIGIN', 			5),
		('LEADER_GT_YUJIULU_MUGULU', 		'FLAVOR_I_SEA_TRADE_ROUTE', 		1),
		('LEADER_GT_YUJIULU_MUGULU', 		'FLAVOR_I_LAND_TRADE_ROUTE', 		10),
		('LEADER_GT_YUJIULU_MUGULU', 		'FLAVOR_ARCHAEOLOGY', 				4),
		('LEADER_GT_YUJIULU_MUGULU', 		'FLAVOR_AIR_CARRIER', 				3);
--------------------------------	
-- Leader_Traits
--------------------------------	
INSERT INTO Leader_Traits 
		(LeaderType, 				TraitType)
VALUES	('LEADER_GT_YUJIULU_MUGULU', 		'TRAIT_GT_ROURAN');
--==========================================================================================================================	
-- TRAITS
--==========================================================================================================================	
-- Traits
--------------------------------	
INSERT INTO Traits 
		(Type, 					Description, 					ShortDescription)
VALUES	('TRAIT_GT_ROURAN', 	'TXT_KEY_TRAIT_GT_ROURAN',	'TXT_KEY_TRAIT_GT_ROURAN_SHORT');
--==========================================================================================================================	
-- DIPLOMACY
--==========================================================================================================================	
-- Diplomacy_Responses
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Diplomacy_Responses
		(LeaderType, 			ResponseType, 									Response, 															Bias)
VALUES 	('LEADER_GT_YUJIULU_MUGULU', 	'RESPONSE_ATTACKED_HOSTILE', 					'TXT_KEY_LEADER_GT_YUJIULU_MUGULU_ATTACKED_GENERIC%', 					500),
		('LEADER_GT_YUJIULU_MUGULU', 	'RESPONSE_DEFEATED', 							'TXT_KEY_LEADER_GT_YUJIULU_MUGULU_DEFEATED%', 							500),
		('LEADER_GT_YUJIULU_MUGULU', 	'RESPONSE_DOW_GENERIC', 						'TXT_KEY_LEADER_GT_YUJIULU_MUGULU_DOW_GENERIC%', 							500),
		('LEADER_GT_YUJIULU_MUGULU', 	'RESPONSE_DENOUNCE', 						'TXT_KEY_LEADER_GT_YUJIULU_MUGULU_DENOUNCE%', 							500),
		('LEADER_GT_YUJIULU_MUGULU', 	'RESPONSE_DENOUNCE_FRIEND', 						'TXT_KEY_LEADER_GT_YUJIULU_MUGULU_DENOUNCE_FRIEND%', 							500),
		('LEADER_GT_YUJIULU_MUGULU', 	'RESPONSE_FIRST_GREETING', 						'TXT_KEY_LEADER_GT_YUJIULU_MUGULU_FIRSTGREETING%', 						500),
		('LEADER_GT_YUJIULU_MUGULU', 	'RESPONSE_TO_BEING_DENOUNCED', 'TXT_KEY_LEADER_GT_YUJIULU_MUGULU_RESPONSE_TO_BEING_DENOUNCED%', 	500),
		('LEADER_GT_YUJIULU_MUGULU', 	'RESPONSE_DEC_FRIENDSHIP', 						'TXT_KEY_LEADER_GT_YUJIULU_MUGULU_DEC_FRIENDSHIP%', 						500);
--==========================================================================================================================	
-- PROMOTIONS
--==========================================================================================================================	
-- UnitPromotions
--------------------------------
INSERT INTO UnitPromotions 
		(Type, 									Description, 								Help, 											Sound, 					CannotBeChosen, Invisible, 					LostWithUpgrade, PortraitIndex, 	IconAtlas, 			PediaType, 			PediaEntry)
VALUES	('PROMOTION_GT_ROURAN', 				'TXT_KEY_PROMOTION_GT_ROURAN',				'TXT_KEY_PROMOTION_GT_ROURAN_HELP',				'AS2D_IF_LEVELUP', 		1, 				'INVISIBLE_SUBMARINE',		0, 				 59, 				'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_GT_ROURAN'),
		('PROMOTION_GT_WRIGGLING_RIDER', 		'TXT_KEY_PROMOTION_GT_WRIGGLING_RIDER',		'TXT_KEY_PROMOTION_GT_WRIGGLING_RIDER_HELP',	'AS2D_IF_LEVELUP', 		1, 				null,						0, 				 59, 				'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_GT_WRIGGLING_RIDER'),
		('PROMOTION_GT_ORTEGE', 				'TXT_KEY_PROMOTION_GT_ORTEGE',				'TXT_KEY_PROMOTION_GT_ORTEGE_HELP',				'AS2D_IF_LEVELUP', 		1, 				null,						0, 				 59, 				'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_GT_ORTEGE'),
		('PROMOTION_GT_NONOR', 				'TXT_KEY_PROMOTION_GT_NONOR',					'TXT_KEY_PROMOTION_GT_NONOR_HELP',				'AS2D_IF_LEVELUP', 		1, 				null,						0, 				 59, 				'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_GT_NONOR');
--==========================================================================================================================
-- UNITS
--==========================================================================================================================
-- Units
--------------------------------	
INSERT INTO Units 	
		(Type, 						Class, PrereqTech, Combat, 	Cost, 	FaithCost, 	RequiresFaithPurchaseEnabled, 	Moves, HurryCostModifier,	CombatClass, Domain, DefaultUnitAI, Description, 					Civilopedia, 					Strategy, 							Help, 							MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, AdvancedStartCost, GoodyHutUpgradeUnitClass, CombatLimit, XPValueAttack, XPValueDefense, Conscription, 					UnitArtInfo, 					UnitFlagAtlas, 			UnitFlagIconOffset, PortraitIndex, 	IconAtlas, 				MoveRate)
SELECT	'UNIT_GT_WRIGGLING_RIDER',	Class, PrereqTech, 	Combat, Cost, 	FaithCost, 	RequiresFaithPurchaseEnabled, 	Moves+1, HurryCostModifier,	CombatClass, Domain, DefaultUnitAI, 'TXT_KEY_GT_WRIGGLING_RIDER_DESC',	'TXT_KEY_GT_WRIGGLING_RIDER_TEXT',	'TXT_KEY_GT_WRIGGLING_RIDER_STRATEGY',	'TXT_KEY_GT_WRIGGLING_RIDER_HELP',	MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, AdvancedStartCost, GoodyHutUpgradeUnitClass, CombatLimit, XPValueAttack, XPValueDefense, Conscription, 'ART_DEF_UNIT_GT_WRIGGLING_RIDER',	'GT_WRIGGLING_RIDER_FLAG_ATLAS', 	0,					4, 				'GT_ROURAN_ATLAS',	MoveRate
FROM Units WHERE (Type = 'UNIT_HORSEMAN');

INSERT INTO Units 	
		(Type, 				Class, Cost, Moves, FaithCost, CivilianAttackPriority, Special, Combat, MoveAfterPurchase, Domain, DefaultUnitAI, Description, 				Civilopedia, 					Help, 							Strategy,							AdvancedStartCost,	WorkRate, CombatLimit, DontShowYields, UnitArtInfoEraVariation, UnitArtInfo, 				UnitFlagIconOffset,	UnitFlagAtlas,					MoveRate, PortraitIndex, 	IconAtlas)
SELECT	'UNIT_GT_NONOR',	Class, Cost, Moves, FaithCost, CivilianAttackPriority, Special, 13, MoveAfterPurchase, Domain, DefaultUnitAI, 'TXT_KEY_UNIT_GT_NONOR', 'TXT_KEY_GT_NONOR_TEXT', 	'TXT_KEY_UNIT_GT_NONOR_HELP',	'TXT_KEY_UNIT_GT_NONOR_STRATEGY',	AdvancedStartCost, 	WorkRate, CombatLimit, DontShowYields, 0,						'ART_DEF_UNIT_GT_NONOR',	0,					'GT_NONOR_FLAG_ATLAS',	MoveRate, 3, 				'GT_ROURAN_ATLAS'
FROM Units WHERE Type = 'UNIT_GREAT_GENERAL';	

UPDATE Units
SET Combat = 15
WHERE (Type = 'UNIT_MONGOLIAN_KHAN');
--------------------------------	
-- UnitGameplay2DScripts
--------------------------------		
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 				SelectionSound, FirstSelectionSound)
SELECT	'UNIT_GT_WRIGGLING_RIDER',		SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_HORSEMAN';

INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 				SelectionSound, FirstSelectionSound)
SELECT	'UNIT_GT_NONOR',		SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_MONGOLIAN_KHAN';
--------------------------------	
-- Unit_AITypes
--------------------------------		
INSERT INTO Unit_AITypes 	
		(UnitType, 				UnitAIType)
SELECT	'UNIT_GT_WRIGGLING_RIDER',		UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_HORSEMAN';

INSERT INTO Unit_AITypes 	
		(UnitType, 				UnitAIType)
SELECT	'UNIT_GT_NONOR',		UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_HORSEMAN';
--------------------------------	
-- Unit_Flavors
--------------------------------		
INSERT INTO Unit_Flavors 	
		(UnitType, 				FlavorType,	Flavor)
SELECT	'UNIT_GT_WRIGGLING_RIDER',		FlavorType,	Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_HORSEMAN';

INSERT INTO Unit_Flavors 	
		(UnitType, 				FlavorType,	Flavor)
SELECT	'UNIT_GT_NONOR',		FlavorType,	Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_HORSEMAN';
--------------------------------	
-- Unit_ResourceQuantityRequirements
--------------------------------		
INSERT INTO Unit_ResourceQuantityRequirements 	
		(UnitType, 					ResourceType, 		Cost)
VALUES	('UNIT_GT_WRIGGLING_RIDER',	'RESOURCE_HORSE', 	1);
--------------------------------	
-- Unit_FreePromotions
--------------------------------		
INSERT INTO Unit_FreePromotions 	
		(UnitType, 					PromotionType)
SELECT	'UNIT_GT_WRIGGLING_RIDER',		PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_HORSEMAN';

INSERT INTO Unit_FreePromotions 	
		(UnitType, 			PromotionType)
SELECT	'UNIT_GT_NONOR', 	PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_GREAT_GENERAL';

INSERT INTO Unit_FreePromotions 
		(UnitType, 			PromotionType)
VALUES	('UNIT_GT_NONOR', 	'PROMOTION_ONLY_DEFENSIVE'),
		('UNIT_MONGOLIAN_KHAN', 	'PROMOTION_ONLY_DEFENSIVE');
--------------------------------	
-- Unit_ClassUpgrades
--------------------------------		
INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 					UnitClassType)
SELECT	'UNIT_GT_WRIGGLING_RIDER',			UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_HORSEMAN';	
--------------------------------	
-- Unit_ClassUpgrades
--------------------------------
DELETE FROM Unit_UniqueNames WHERE (UnitType = 'UNIT_MONGOLIAN_KHAN');
INSERT INTO Unit_UniqueNames 
			(UnitType, 				UniqueName)
VALUES		('UNIT_MONGOLIAN_KHAN', 	'TXT_KEY_GREAT_PERSON_GT_KHAN_1'),
			('UNIT_MONGOLIAN_KHAN', 	'TXT_KEY_GREAT_PERSON_GT_KHAN_2'),
			('UNIT_MONGOLIAN_KHAN', 	'TXT_KEY_GREAT_PERSON_GT_KHAN_3'),
			('UNIT_MONGOLIAN_KHAN', 	'TXT_KEY_GREAT_PERSON_GT_KHAN_4'),
			('UNIT_MONGOLIAN_KHAN', 	'TXT_KEY_GREAT_PERSON_GT_KHAN_5'),
			('UNIT_MONGOLIAN_KHAN', 	'TXT_KEY_GREAT_PERSON_GT_KHAN_6'),
			('UNIT_MONGOLIAN_KHAN', 	'TXT_KEY_GREAT_PERSON_GT_KHAN_7'),
			('UNIT_MONGOLIAN_KHAN', 	'TXT_KEY_GREAT_PERSON_GT_KHAN_8'),
			('UNIT_MONGOLIAN_KHAN', 	'TXT_KEY_GREAT_PERSON_GT_KHAN_9'),
			('UNIT_MONGOLIAN_KHAN', 	'TXT_KEY_GREAT_PERSON_GT_KHAN_10'),
			('UNIT_MONGOLIAN_KHAN', 	'TXT_KEY_GREAT_PERSON_GT_KHAN_11'),
			('UNIT_MONGOLIAN_KHAN', 	'TXT_KEY_GREAT_PERSON_GT_KHAN_12'),
			('UNIT_MONGOLIAN_KHAN', 	'TXT_KEY_GREAT_PERSON_GT_KHAN_13'),
			('UNIT_MONGOLIAN_KHAN', 	'TXT_KEY_GREAT_PERSON_GT_KHAN_14'),
			('UNIT_MONGOLIAN_KHAN', 	'TXT_KEY_GREAT_PERSON_GT_KHAN_15'),
			('UNIT_MONGOLIAN_KHAN', 	'TXT_KEY_GREAT_PERSON_GT_KHAN_16'),
			('UNIT_MONGOLIAN_KHAN', 	'TXT_KEY_GREAT_PERSON_GT_KHAN_17'),
			('UNIT_MONGOLIAN_KHAN', 	'TXT_KEY_GREAT_PERSON_GT_KHAN_18'),
			('UNIT_MONGOLIAN_KHAN', 	'TXT_KEY_GREAT_PERSON_GT_KHAN_19'),
			('UNIT_MONGOLIAN_KHAN', 	'TXT_KEY_GREAT_PERSON_GT_KHAN_20'),
			('UNIT_GT_NONOR', 	'TXT_KEY_GREAT_PERSON_GT_NONOR_1'),
			('UNIT_GT_NONOR', 	'TXT_KEY_GREAT_PERSON_GT_NONOR_2'),
			('UNIT_GT_NONOR', 	'TXT_KEY_GREAT_PERSON_GT_NONOR_3'),
			('UNIT_GT_NONOR', 	'TXT_KEY_GREAT_PERSON_GT_NONOR_4'),
			('UNIT_GT_NONOR', 	'TXT_KEY_GREAT_PERSON_GT_NONOR_5'),
			('UNIT_GT_NONOR', 	'TXT_KEY_GREAT_PERSON_GT_NONOR_6'),
			('UNIT_GT_NONOR', 	'TXT_KEY_GREAT_PERSON_GT_NONOR_7'),
			('UNIT_GT_NONOR', 	'TXT_KEY_GREAT_PERSON_GT_NONOR_8'),
			('UNIT_GT_NONOR', 	'TXT_KEY_GREAT_PERSON_GT_NONOR_9'),
			('UNIT_GT_NONOR', 	'TXT_KEY_GREAT_PERSON_GT_NONOR_10'),
			('UNIT_GT_NONOR', 	'TXT_KEY_GREAT_PERSON_GT_NONOR_11'),
			('UNIT_GT_NONOR', 	'TXT_KEY_GREAT_PERSON_GT_NONOR_12'),
			('UNIT_GT_NONOR', 	'TXT_KEY_GREAT_PERSON_GT_NONOR_13'),
			('UNIT_GT_NONOR', 	'TXT_KEY_GREAT_PERSON_GT_NONOR_14'),
			('UNIT_GT_NONOR', 	'TXT_KEY_GREAT_PERSON_GT_NONOR_15'),
			('UNIT_GT_NONOR', 	'TXT_KEY_GREAT_PERSON_GT_NONOR_16'),
			('UNIT_GT_NONOR', 	'TXT_KEY_GREAT_PERSON_GT_NONOR_17'),
			('UNIT_GT_NONOR', 	'TXT_KEY_GREAT_PERSON_GT_NONOR_18'),
			('UNIT_GT_NONOR', 	'TXT_KEY_GREAT_PERSON_GT_NONOR_19'),
			('UNIT_GT_NONOR', 	'TXT_KEY_GREAT_PERSON_GT_NONOR_20');
--==========================================================================================================================
-- IMPROVEMENTS
--==========================================================================================================================
-- Improvements
--------------------------------	
INSERT INTO Improvements
		(Type,							Description,						Civilopedia,							Help,									ArtDefineTag,						SpecificCivRequired,	CivilizationType,			HillsMakesValid, 	DestroyedWhenPillaged, 	NoTwoAdjacent,	PortraitIndex,	IconAtlas)
VALUES	('IMPROVEMENT_GT_ORTEGE', 	'TXT_KEY_IMPROVEMENT_GT_ORTEGE',	'TXT_KEY_IMPROVEMENT_GT_ORTEGE_TEXT',	'TXT_KEY_IMPROVEMENT_GT_ORTEGE_HELP',	'ART_DEF_IMPROVEMENT_GT_ORTEGE',	1,						'CIVILIZATION_MONGOL',	1,					1,						1, 				2,				'GT_ROURAN_ATLAS');

INSERT INTO Improvements
		(Type,						Description,						Civilopedia,							Help,									ArtDefineTag,						SpecificCivRequired,			CivilizationType,			NoTwoAdjacent, 	RequiresFlatlands,	PortraitIndex,	IconAtlas)
VALUES	('IMPROVEMENT_GT_AQUIFER', 	'TXT_KEY_IMPROVEMENT_GT_AQUIFER',	'TXT_KEY_IMPROVEMENT_GT_AQUIFER_TEXT',	'TXT_KEY_IMPROVEMENT_GT_AQUIFER_HELP',	'ART_DEF_IMPROVEMENT_NONE',			1,								'CIVILIZATION_GT_ROURAN',	1,				1,					2,				'GT_ROURAN_ATLAS');
------------------------------	
-- Improvement_Yields
------------------------------	
INSERT INTO Improvement_Yields
		(ImprovementType,			YieldType,				Yield)
VALUES	('IMPROVEMENT_GT_ORTEGE',	'YIELD_GOLD',			2);
------------------------------	
-- Improvement_ValidTerrains
------------------------------	
INSERT INTO Improvement_ValidTerrains
		(ImprovementType,				TerrainType)
VALUES	('IMPROVEMENT_GT_ORTEGE',	'TERRAIN_HILL'),
		('IMPROVEMENT_GT_ORTEGE',	'TERRAIN_PLAINS'),
		('IMPROVEMENT_GT_ORTEGE',	'TERRAIN_DESERT'),
		('IMPROVEMENT_GT_AQUIFER',	'TERRAIN_PLAINS'),
		('IMPROVEMENT_GT_AQUIFER',	'TERRAIN_DESERT');		
--==========================================================================================================================	
-- Features
--==========================================================================================================================
INSERT OR REPLACE INTO Features 
		(Type, 							Description, 			Civilopedia, 						Movement, 	AddsFreshWater, PortraitIndex, 	IconAtlas)
VALUES 	('FEATURE_GT_AQUIFER', 	'TXT_KEY_FEATURE_GT_AQUIFER', 	'TXT_KEY_FEATURE_GT_AQUIFER_TEXT', 	0, 			1, 				2, 				'GT_ROURAN_ATLAS');
--==========================================================================================================================	
-- Builds
--==========================================================================================================================
INSERT INTO Builds
		(Type,                   PrereqTech,        		ImprovementType,            	Time,  Recommendation,                 		Description,          				Help,                              	CtrlDown,    OrderPriority,    IconIndex, IconAtlas,            	HotKey,    EntityEvent)
VALUES  ('BUILD_GT_ORTEGE',    'TECH_CURRENCY',    			'IMPROVEMENT_GT_ORTEGE',    	500, 	'TXT_KEY_BUILD_GT_ORTEGE_REC', 	'TXT_KEY_IMPROVEMENT_GT_ORTEGE',  'TXT_KEY_BUILD_GT_ORTEGE_HELP',    1,           98,               0,        'GT_ORTEGE_ATLAS',   	'KB_B',    'ENTITY_EVENT_BUILD'),
		('BUILD_GT_AQUIFER',    'TECH_HORSEBACK_RIDING',    'IMPROVEMENT_GT_AQUIFER',    	600, 	'TXT_KEY_BUILD_GT_AQUIFER_REC', 	'TXT_KEY_IMPROVEMENT_GT_AQUIFER',  'TXT_KEY_BUILD_GT_AQUIFER_HELP',    1,           98,               null,        null,   	'KB_B',    'ENTITY_EVENT_BUILD');
----------------
-- BuildFeatures
----------------
INSERT INTO BuildFeatures
        (BuildType,              FeatureType, 	PrereqTech,  		Time, Remove)
SELECT  ('BUILD_GT_ORTEGE'),    FeatureType, 	('TECH_MASONRY'), 	Time, 0
FROM BuildFeatures WHERE BuildType = 'BUILD_TRADING_POST';
--------------------------------	
-- Unit_Builds
--------------------------------	
INSERT INTO Unit_Builds 	
		(UnitType, 					BuildType)
VALUES	('UNIT_WORKER',		'BUILD_GT_ORTEGE'),
		('UNIT_GT_WRIGGLING_RIDER',	'BUILD_GT_AQUIFER');
--=======================================================================================================================
-- BUILDINGCLASSES
--=======================================================================================================================
-- BuildingClasses
------------------------------	
INSERT INTO BuildingClasses
		(Type, 							DefaultBuilding, 			Description)
VALUES	('BUILDINGCLASS_GT_ROURAN', 	'BUILDING_GT_ROURAN', 	'TXT_KEY_BUILDING_GT_ROURAN_DESC');
--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
-- Buildings
------------------------------	
INSERT INTO Buildings		
		(Type, 									BuildingClass, 			  				BorderObstacle,		Cost, 	FaithCost,	GreatWorkCount,	Defense, 	Description, 								Help,											NeverCapture)
VALUES	('BUILDING_GT_ROURAN', 				'BUILDINGCLASS_GT_ROURAN', 			0,					-1, 	-1,			-1,				0,			'TXT_KEY_BUILDING_GT_ROURAN', 			'TXT_KEY_BUILDING_GT_ROURAN_HELP',			1),
		('BUILDING_GT_ORTEGE', 		'BUILDINGCLASS_GT_ROURAN', 					0,				-1, 	-1,			-1,				0,			'TXT_KEY_BUILDING_GT_ORTEGE', 		'TXT_KEY_BUILDING_GT_ORTEGE_HELP',		1);
CREATE TABLE IF NOT EXISTS Building_ProvidesAccesstoFreshWater (
  BuildingType text
);	
INSERT INTO Buildings 	
		(Type, 								BuildingClass, 					Description,								Help,											GreatWorkCount,	Cost,		FaithCost,	PrereqTech, 	NeverCapture)
VALUES	('BUILDING_GT_WRIGGLING_WATER', 	'BUILDINGCLASS_GT_ROURAN',	'TXT_KEY_BUILDING_GT_WRIGGLING_WATER',	'TXT_KEY_BUILDING_GT_WRIGGLING_WATER_HELP',	-1, 			-1,   		-1,			null,			1);
INSERT INTO Building_ProvidesAccesstoFreshWater
		(BuildingType)
VALUES	('BUILDING_GT_WRIGGLING_WATER');
--==========================================================================================================================
-- MASTER TABLES
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS COMMUNITY (Type TEXT, Value INTEGER);
CREATE TABLE IF NOT EXISTS Civilization_JFD_ColonialCityNames(CivilizationType text, ColonyName text, LinguisticType text);
CREATE TABLE IF NOT EXISTS Civilization_JFD_Governments(CivilizationType text, CultureType text, LegislatureName text, OfficeTitle text, GovernmentType text, Weight integer);
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMP(CivilizationType, MapPrefix, X, Y, CapitalName, AltX, AltY, AltCapitalName);
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMPRequestedResources(CivilizationType, MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6);
CREATE TABLE IF NOT EXISTS JFD_Civilopedia_HideFromPedia(Type text);
CREATE TABLE IF NOT EXISTS JFD_GlobalUserSettings(Type text, Value integer default 1);
CREATE TABLE IF NOT EXISTS MinorCivilizations_YnAEMP(MinorCivType, MapPrefix, X, Y, CapitalName, AltX, AltY, AltCapitalName);
--==========================================================================================================================
-- USER SETTINGS (THIS IS NEEDED IN MOST CASES)
--==========================================================================================================================
-- JFD_GlobalUserSettings
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
JFD_GlobalUserSettings (
    Type                text            default null,
    Value               integer         default 1);
--==========================================================================================================================
-- LEADERS
--==========================================================================================================================
-- Flavors
--------------------------------------------------------------------------------------------------------------------------
INSERT OR REPLACE INTO Flavors 
		(Type)
VALUES	('FLAVOR_JFD_DECOLONIZATION'),
		('FLAVOR_JFD_MERCENARY'),
		('FLAVOR_JFD_REFORM_GOVERNMENT'),
		('FLAVOR_JFD_REFORM_LEGAL'),
		('FLAVOR_JFD_REFORM_CULTURE'),
		('FLAVOR_JFD_REFORM_ECONOMIC'),
		('FLAVOR_JFD_REFORM_FOREIGN'),
		('FLAVOR_JFD_REFORM_INDUSTRY'),
		('FLAVOR_JFD_REFORM_MILITARY'),
		('FLAVOR_JFD_REFORM_RELIGION'),
		('FLAVOR_JFD_RELIGIOUS_INTOLERANCE'),
		('FLAVOR_JFD_SLAVERY'),
		('FLAVOR_JFD_STATE_RELIGION');
--------------------------------------------------------------------------------------------------------------------------
-- Leader_Flavors
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Leader_Flavors
		(LeaderType,				FlavorType,							Flavor)
VALUES	('LEADER_GT_YUJIULU_MUGULU',	'FLAVOR_JFD_DECOLONIZATION',			2),
		('LEADER_GT_YUJIULU_MUGULU',	'FLAVOR_JFD_MERCENARY',					8),
		('LEADER_GT_YUJIULU_MUGULU',	'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',		5),
		('LEADER_GT_YUJIULU_MUGULU',	'FLAVOR_JFD_REFORM_GOVERNMENT',			5),
		('LEADER_GT_YUJIULU_MUGULU',	'FLAVOR_JFD_REFORM_LEGAL',				8),
		('LEADER_GT_YUJIULU_MUGULU',	'FLAVOR_JFD_REFORM_CULTURE',			10),		
		('LEADER_GT_YUJIULU_MUGULU',	'FLAVOR_JFD_REFORM_ECONOMIC',			2),
		('LEADER_GT_YUJIULU_MUGULU',	'FLAVOR_JFD_REFORM_FOREIGN',			10),
		('LEADER_GT_YUJIULU_MUGULU',	'FLAVOR_JFD_REFORM_INDUSTRY',			10),
		('LEADER_GT_YUJIULU_MUGULU',	'FLAVOR_JFD_REFORM_MILITARY',			7),
		('LEADER_GT_YUJIULU_MUGULU',	'FLAVOR_JFD_REFORM_RELIGION',			7),
		('LEADER_GT_YUJIULU_MUGULU',	'FLAVOR_JFD_SLAVERY',					10),
		('LEADER_GT_YUJIULU_MUGULU',	'FLAVOR_JFD_STATE_RELIGION',			8);
--==========================================================================================================================
-- CIVILIZATIONS
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_JFD_Governments
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Civilization_JFD_Governments
		(CivilizationType,					GovernmentType,			     Weight)
VALUES  ('CIVILIZATION_GT_ROURAN',	'GOVERNMENT_JFD_MONARCHY',	 90);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_YnAEMP
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilizations_YnAEMP
		(CivilizationType,					MapPrefix,				X,		Y,		AltX,  		AltY,  	AltCapitalName)
VALUES	('CIVILIZATION_GT_ROURAN',	'AfriAsiaAust',			124,	31, 	null,	null,	null),
		('CIVILIZATION_GT_ROURAN',	'Asia',					46,		62,     null,	null,	null),
		('CIVILIZATION_GT_ROURAN',	'AsiaSmall',			14,		47,		null,	null,	null),
		('CIVILIZATION_GT_ROURAN',	'EastAsia',				23,		78,		null,	null,	null),
		('CIVILIZATION_GT_ROURAN',	'GreatestEarth',		100,	22,		null,	null,	null),							
		('CIVILIZATION_GT_ROURAN',	'Steppe',				127,	47,		null,	null,	null),
		('CIVILIZATION_GT_ROURAN',	'Cordiform',			52,		41,		null,	null,	null),
		('CIVILIZATION_GT_ROURAN',	'Yagem',				47,		71,		null,	null,	null),
		('CIVILIZATION_GT_ROURAN',	'Yahem',				102,	61,		null,	null,	null);
------------------------------------------------------------------------------------------------------------------------	
-- Civilizations_YnAEMPRequestedResources
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMPRequestedResources(CivilizationType, MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6);
INSERT INTO Civilizations_YnAEMPRequestedResources
		(CivilizationType,			MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6)
SELECT	'CIVILIZATION_GT_ROURAN',	MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6
FROM Civilizations_YnAEMPRequestedResources WHERE CivilizationType = 'CIVILIZATION_MONGOL';
--------------------------------------------------------------------------------------------------------------------------
-- Civilization_JFD_CultureTypes
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_CultureTypes(
	CivilizationType 					text 		REFERENCES Civilizations(Type) 		default null,
	CultureType 						text											default null,
	SubCultureType 						text											default null,
	ArtDefineTag						text											default	null,
	DecisionsTag						text											default	null,
	DefeatScreenEarlyTag				text											default	null,
	DefeatScreenMidTag					text											default	null,
	DefeatScreenLateTag					text											default	null,
	IdealsTag							text											default	null,
	SplashScreenTag						text											default	null,
	SoundtrackTag						text											default	null,
	UnitDialogueTag						text											default null);

INSERT INTO Civilization_JFD_CultureTypes
		(CivilizationType,				ArtDefineTag, CultureType, SubCultureType, DecisionsTag, DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag)
SELECT	'CIVILIZATION_GT_ROURAN',	ArtDefineTag, CultureType, SubCultureType, DecisionsTag, DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_MONGOL';

UPDATE Civilizations 
SET SoundtrackTag = 'JFD_Steppe'
WHERE Type = 'CIVILIZATION_GT_ROURAN'
AND EXISTS (SELECT * FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Steppe')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================