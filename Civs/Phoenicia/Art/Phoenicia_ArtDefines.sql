--==========================================================================================================================
-- ArtDefine_StrategicView
--==========================================================================================================================	
INSERT INTO ArtDefine_StrategicView 
			(StrategicViewType, 							TileType,	Asset)
VALUES		('ART_DEF_UNIT_MC_PHOENICIA_BIREME', 			'Unit', 	'sv_bireme.dds');

INSERT INTO ArtDefine_StrategicView 
			(StrategicViewType, 							TileType,	Asset)
VALUES		('ART_DEF_UNIT_MC_TYRIAN_MERCHANT', 			'Unit', 	'sv_tyrian_merchant.dds');
--==========================================================================================================================
-- ArtDefine_UnitInfos
--==========================================================================================================================			
INSERT INTO ArtDefine_UnitInfos 
			(Type, 										DamageStates,	Formation)
SELECT		('ART_DEF_UNIT_MC_PHOENICIA_BIREME'),		3, 				Formation
FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT_TRIREME');

INSERT INTO ArtDefine_UnitInfos 
			(Type, 										DamageStates,	Formation)
SELECT		('ART_DEF_UNIT_MC_TYRIAN_MERCHANT'),		DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT_ENGINEER');
--==========================================================================================================================
-- ArtDefine_UnitInfoMemberInfos
--==========================================================================================================================
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
			(UnitInfoType,									UnitMemberInfoType,								NumMembers)
SELECT		('ART_DEF_UNIT_MC_PHOENICIA_BIREME'),		('ART_DEF_UNIT_MEMBER_MC_PHOENICIA_BIREME'),		NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_TRIREME');

INSERT INTO ArtDefine_UnitInfoMemberInfos 	
			(UnitInfoType,									UnitMemberInfoType,							NumMembers)
SELECT		('ART_DEF_UNIT_MC_TYRIAN_MERCHANT'),		('ART_DEF_UNIT_MEMBER_MC_TYRIAN_MERCHANT'),		NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_ENGINEER');
--==========================================================================================================================
-- ArtDefine_UnitMemberCombats
--==========================================================================================================================
INSERT INTO ArtDefine_UnitMemberCombats 
			(UnitMemberType,										EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT		('ART_DEF_UNIT_MEMBER_MC_PHOENICIA_BIREME'),			EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_TRIREME');

INSERT INTO ArtDefine_UnitMemberCombats 
			(UnitMemberType,										EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT		('ART_DEF_UNIT_MEMBER_MC_TYRIAN_MERCHANT'),			EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_GREATENGINEER_EARLY');
--==========================================================================================================================
-- ArtDefine_UnitMemberCombatWeapons
--==========================================================================================================================
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
			(UnitMemberType,										"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT		('ART_DEF_UNIT_MEMBER_MC_PHOENICIA_BIREME'),			"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_TRIREME');

INSERT INTO ArtDefine_UnitMemberCombatWeapons	
			(UnitMemberType,										"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT		('ART_DEF_UNIT_MEMBER_MC_TYRIAN_MERCHANT'),			"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_GREATENGINEER_EARLY');
--==========================================================================================================================
-- ArtDefine_UnitMemberInfos
--==========================================================================================================================
INSERT INTO ArtDefine_UnitMemberInfos 	
			(Type, 													Scale,  ZOffset, Domain, Model, 					MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT		('ART_DEF_UNIT_MEMBER_MC_PHOENICIA_BIREME'),			0.09,	ZOffset, Domain, ('bireme.fxsxml'),			MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE (Type = 'ART_DEF_UNIT_MEMBER_TRIREME');

INSERT INTO ArtDefine_UnitMemberInfos 	
			(Type, 													Scale,  ZOffset, Domain, Model, 					MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT		('ART_DEF_UNIT_MEMBER_MC_TYRIAN_MERCHANT'),				Scale,	ZOffset, Domain, ('tyre_merchant.fxsxml'),	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE (Type = 'ART_DEF_UNIT_MEMBER_GREATENGINEER_EARLY');
--==========================================================================================================================
-- IconTextureAtlases
--==========================================================================================================================
INSERT INTO IconTextureAtlases 
			(Atlas, 											IconSize, 	Filename, 								IconsPerRow, 	IconsPerColumn)
VALUES		('MC_PHOENICIA_ATLAS', 								256, 		'PhoeniciaAtlas_256.dds',				5, 				1),
			('MC_PHOENICIA_ATLAS', 								128, 		'PhoeniciaAtlas_128.dds',				5, 				1),
			('MC_PHOENICIA_ATLAS', 								80, 		'PhoeniciaAtlas_80.dds',				5, 				1),
			('MC_PHOENICIA_ATLAS', 								64, 		'PhoeniciaAtlas_64.dds',				5, 				1),
			('MC_PHOENICIA_ATLAS', 								45, 		'PhoeniciaAtlas_45.dds',				5, 				1),
			('MC_PHOENICIA_ATLAS', 								32, 		'PhoeniciaAtlas_32.dds',				5, 				1),
			('MC_PHOENICIA_ALPHA_ATLAS', 						128, 		'PhoeniciaAlpha_128.dds',				1, 				1),
			('MC_PHOENICIA_ALPHA_ATLAS', 						80, 		'PhoeniciaAlpha_80.dds',				1, 				1),
			('MC_PHOENICIA_ALPHA_ATLAS', 						64, 		'PhoeniciaAlpha_64.dds',				1, 				1),
			('MC_PHOENICIA_ALPHA_ATLAS', 						48, 		'PhoeniciaAlpha_48.dds',				1, 				1),
			('MC_PHOENICIA_ALPHA_ATLAS', 						45, 		'PhoeniciaAlpha_45.dds',				1, 				1),
			('MC_PHOENICIA_ALPHA_ATLAS', 						32, 		'PhoeniciaAlpha_32.dds',				1, 				1),
			('MC_PHOENICIA_ALPHA_ATLAS', 						24, 		'PhoeniciaAlpha_24.dds',				1, 				1),
			('MC_PHOENICIA_ALPHA_ATLAS', 						16, 		'PhoeniciaAlpha_16.dds',				1, 				1),
			('MC_PHOENICIAN_BIREME_FLAG', 						32, 		'flag_bireme.dds',						1, 				1),
			('MC_TYRIAN_MERCHANT_FLAG', 						32, 		'flag_tyrian_merchant.dds',				1, 				1);
--==========================================================================================================================
-- IconFontTextures
--==========================================================================================================================
INSERT INTO IconFontTextures
			(IconFontTexture, 									IconFontTextureFile)
VALUES		('ICON_FONT_TEXTURE_MC_TYRIAN_DYES', 				'Tyrian_Dyes_fonticons_22');
--==========================================================================================================================
-- IconFontMapping
--==========================================================================================================================
INSERT INTO IconFontMapping
			(IconName, 								IconFontTexture,					IconMapping)
VALUES		('ICON_RES_MC_TYRIAN_DYES', 			'ICON_FONT_TEXTURE_MC_TYRIAN_DYES',	1);
--==========================================================================================================================
--==========================================================================================================================