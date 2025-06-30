--==========================================================================================================================
-- Update Toyotomi Art
--==========================================================================================================================
UPDATE Civilizations SET ArtStyleSuffix = "_HIDEYOSHI_SAMURAI" WHERE Type = 'CIVILIZATION_SENSHI_HIDEYOSHI';
INSERT OR REPLACE INTO "ArtDefine_UnitInfos" ('Type','DamageStates','Formation')
	SELECT	REPLACE("Type", '_ASIA', '_HIDEYOSHI_SAMURAI'), "DamageStates", "Formation"
	FROM "ArtDefine_UnitInfos" WHERE Type LIKE '%_ASIA';
INSERT OR REPLACE INTO "ArtDefine_UnitInfoMemberInfos" ('UnitInfoType','UnitMemberInfoType','NumMembers')
	SELECT	REPLACE("UnitInfoType", '_ASIA', '_HIDEYOSHI_SAMURAI'), "UnitMemberInfoType", "NumMembers"
	FROM "ArtDefine_UnitInfoMemberInfos" WHERE UnitInfoType LIKE '%_ASIA';

---------------
-- Longswordsman
---------------
UPDATE Units SET UnitArtInfoCulturalVariation = 1 WHERE Type = 'UNIT_LONGSWORDSMAN';

INSERT OR REPLACE INTO "ArtDefine_UnitInfos" ('Type','DamageStates','Formation')
	SELECT	("ART_DEF_UNIT_LONGSWORDSMAN_HIDEYOSHI_SAMURAI"), "DamageStates", "Samurai"
	FROM "ArtDefine_UnitInfos" WHERE (Type = "ART_DEF_UNIT_U_JAPANESE_SAMURAI");
INSERT OR REPLACE INTO "ArtDefine_UnitInfoMemberInfos" ('UnitInfoType','UnitMemberInfoType','NumMembers')
	SELECT	("ART_DEF_UNIT_LONGSWORDSMAN_HIDEYOSHI_SAMURAI"), ("ART_DEF_UNIT_MEMBER_LONGSWORDSMAN_HIDEYOSHI_SAMURAI"), 12
	FROM "ArtDefine_UnitInfoMemberInfos" WHERE (UnitInfoType = "ART_DEF_UNIT_U_JAPANESE_SAMURAI");
INSERT OR REPLACE INTO "ArtDefine_UnitMemberCombats" ('UnitMemberType', 'EnableActions', 'DisableActions', 'MoveRadius', 'ShortMoveRadius', 'ChargeRadius', 'AttackRadius', 'RangedAttackRadius', 'MoveRate', 'ShortMoveRate', 'TurnRateMin', 'TurnRateMax', 'TurnFacingRateMin', 'TurnFacingRateMax', 'RollRateMin', 'RollRateMax', 'PitchRateMin', 'PitchRateMax', 'LOSRadiusScale', 'TargetRadius', 'TargetHeight', 'HasShortRangedAttack', 'HasLongRangedAttack', 'HasLeftRightAttack', 'HasStationaryMelee', 'HasStationaryRangedAttack', 'HasRefaceAfterCombat', 'ReformBeforeCombat', 'HasIndependentWeaponFacing', 'HasOpponentTracking', 'HasCollisionAttack', 'AttackAltitude', 'AltitudeDecelerationDistance', 'OnlyTurnInMovementActions', 'RushAttackFormation')
	SELECT	("ART_DEF_UNIT_MEMBER_LONGSWORDSMAN_HIDEYOSHI_SAMURAI"), "EnableActions", "DisableActions", "MoveRadius", "ShortMoveRadius", "ChargeRadius", "AttackRadius", "RangedAttackRadius", 
			"MoveRate", "ShortMoveRate", "TurnRateMin", "TurnRateMax", "TurnFacingRateMin", "TurnFacingRateMax", "RollRateMin", "RollRateMax", "PitchRateMin", "PitchRateMax", "LOSRadiusScale", "TargetRadius", "TargetHeight", "HasShortRangedAttack", "HasLongRangedAttack", "HasLeftRightAttack", "HasStationaryMelee", "HasStationaryRangedAttack", "HasRefaceAfterCombat", "ReformBeforeCombat", "HasIndependentWeaponFacing", "HasOpponentTracking", "HasCollisionAttack", "AttackAltitude", "AltitudeDecelerationDistance", "OnlyTurnInMovementActions", "RushAttackFormation"
	FROM "ArtDefine_UnitMemberCombats" WHERE (UnitMemberType = "ART_DEF_UNIT_MEMBER_U_JAPANESE_SAMURAI");
INSERT OR REPLACE INTO "ArtDefine_UnitMemberCombatWeapons" ('UnitMemberType', 'Index', 'SubIndex', 'ID', 'VisKillStrengthMin', 'VisKillStrengthMax', 'ProjectileSpeed', 'ProjectileTurnRateMin', 'ProjectileTurnRateMax', 'HitEffect', 'HitEffectScale', 'HitRadius', 'ProjectileChildEffectScale', 'AreaDamageDelay', 'ContinuousFire', 'WaitForEffectCompletion', 'TargetGround', 'IsDropped', 'WeaponTypeTag', 'WeaponTypeSoundOverrideTag')
	SELECT ("ART_DEF_UNIT_MEMBER_LONGSWORDSMAN_HIDEYOSHI_SAMURAI"), "Index", "SubIndex", "ID", "VisKillStrengthMin", "VisKillStrengthMax", "ProjectileSpeed", "ProjectileTurnRateMin", "ProjectileTurnRateMax", "HitEffect", "HitEffectScale", "HitRadius", "ProjectileChildEffectScale", "AreaDamageDelay", "ContinuousFire", "WaitForEffectCompletion", "TargetGround", "IsDropped", "WeaponTypeTag", "WeaponTypeSoundOverrideTag"
	FROM "ArtDefine_UnitMemberCombatWeapons" WHERE (UnitMemberType = "ART_DEF_UNIT_MEMBER_U_JAPANESE_SAMURAI");
INSERT OR REPLACE INTO "ArtDefine_UnitMemberInfos" ("Type", "Scale", "ZOffset", "Domain", "Model", "MaterialTypeTag", "MaterialTypeSoundOverrideTag")
	SELECT	("ART_DEF_UNIT_MEMBER_LONGSWORDSMAN_HIDEYOSHI_SAMURAI"), 0.140000000596046, "ZOffset", "Domain", 
			("Art/UniqueLongsword/u_toyotomi_samurai.fxsxml"), "MaterialTypeTag", "MaterialTypeSoundOverrideTag"
	FROM "ArtDefine_UnitMemberInfos" WHERE (Type = "ART_DEF_UNIT_MEMBER_U_JAPANESE_SAMURAI");