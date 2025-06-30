UPDATE PolicyBranchTypes
SET
	EraPrereq = 'ERA_CLASSICAL'
WHERE
	Type IN ('POLICY_BRANCH_HONOR', 'POLICY_BRANCH_PIETY');

-- HONOR POLICY CHANGES
--Almost no Barbs in AI Games, just from Revoltsa
UPDATE Policies
SET
	BarbarianCombatBonus = 50, -- Increased from 25%
	CultureFromBarbarianKills = CultureFromBarbarianKills + 50 -- Extra culture per Barbarian kill
WHERE
	Type = 'POLICY_HONOR';

UPDATE Policy_UnitCombatProductionModifiers
SET
	ProductionModifier = 17 -- Increased from 15%
WHERE
	PolicyType = 'POLICY_WARRIOR_CODE';

INSERT INTO
	UnitPromotions (Type, Sound, CannotBeChosen, AdjacentMod, PortraitIndex, IconAtlas)
VALUES
	(
		'PROMOTION_ADJACENT_BONUS_DISCIPLINE',
		'AS2D_IF_LEVELUP',
		1,
		17, -- Increased AdjacentMod from 15 to 17
		59,
		'ABILITY_ATLAS'
	);

DELETE FROM Policy_FreePromotions
WHERE
	PolicyType = 'POLICY_DISCIPLINE'
	AND PromotionType = 'PROMOTION_ADJACENT_BONUS';

INSERT INTO
	Policy_FreePromotions (PolicyType, PromotionType)
VALUES
	('POLICY_DISCIPLINE', 'PROMOTION_ADJACENT_BONUS_DISCIPLINE');

UPDATE Policies
SET
	ExpModifier = 60 -- Increased from 50%
WHERE
	Type = 'POLICY_MILITARY_TRADITION';

UPDATE Policies
SET
	HappinessPerGarrisonedUnit = 2 -- Increased from 1
WHERE
	Type = 'POLICY_MILITARY_CASTE';

UPDATE Policies
SET
	UnitUpgradeCostMod = -50 -- Upgrade cost reduced from 33%
WHERE
	Type = 'POLICY_PROFESSIONAL_ARMY';

-- PIETY POLICY CHANGES
UPDATE Policy_BuildingClassProductionModifiers
SET
	ProductionModifier = 200 -- Increased from 100 (50%)
WHERE
	PolicyType = 'POLICY_PIETY'
	AND BuildingClassType IN ('BUILDINGCLASS_SHRINE', 'BUILDINGCLASS_TEMPLE');

UPDATE Policy_BuildingClassYieldChanges
SET
	YieldChange = 3 -- Increased from 1
WHERE
	PolicyType = 'POLICY_ORGANIZED_RELIGION'
	AND BuildingClassType IN ('BUILDINGCLASS_SHRINE', 'BUILDINGCLASS_TEMPLE')
	AND YieldType = 'YIELD_FAITH';

UPDATE Policy_ImprovementYieldChanges
SET
	Yield = 5 -- Increased from 3
WHERE
	PolicyType = 'POLICY_THEOCRACY'
	AND ImprovementType = 'IMPROVEMENT_HOLY_SITE'
	AND YieldType = 'YIELD_GOLD';

UPDATE Policy_BuildingClassYieldModifiers
SET
	YieldMod = 33 -- Increased from 25
WHERE
	PolicyType = 'POLICY_THEOCRACY'
	AND BuildingClassType = 'BUILDINGCLASS_TEMPLE'
	AND YieldType = 'YIELD_GOLD';

UPDATE Policies
SET
	CultureWonderMultiplier = 25
WHERE
	Type = 'POLICY_REFORMATION';

INSERT INTO
	Policy_Flavors (PolicyType, FlavorType, Flavor)
VALUES
	('POLICY_REFORMATION', 'FLAVOR_CULTURE', 20);

UPDATE Policies
SET
	GoldenAgeTurns = 5
WHERE
	Type = 'POLICY_FREE_RELIGION';