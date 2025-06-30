-- ArchaeologistGenocideWhen
UPDATE Units
SET
	Cost = -1
WHERE
	Type = 'UNIT_ARCHAEOLOGIST';

UPDATE Units
SET
	PrereqTech = NULL
WHERE
	Type = 'UNIT_ARCHAEOLOGIST';

UPDATE Defines
SET
	Value = 0
WHERE
	Name IN (
		'MIN_DIG_SITES_PER_MAJOR_CIV',
		'MAX_DIG_SITES_PER_MAJOR_CIV'
	);

UPDATE Defines
SET
	Value = 4
WHERE
	Name = 'BASE_CITY_AIR_STACKING';

UPDATE Defines
SET
	Value = 6
WHERE
	Name = 'INITIAL_FREE_OUTSIDE_UNITS';

-- Scout and Submarines ignore Borders
UPDATE Units
SET
	RivalTerritory = 1
WHERE
	Type IN (
		'UNIT_SCOUT',
		'UNIT_SUBMARINE',
		'UNIT_NUCLEAR_SUBMARINE'
	);

-- Formation and Ambush Fix
INSERT INTO
	UnitPromotions_UnitCombats (PromotionType, UnitCombatType)
VALUES
	('PROMOTION_FORMATION_2', 'UNITCOMBAT_MELEE'),
	('PROMOTION_FORMATION_2', 'UNITCOMBAT_GUN'),
	('PROMOTION_FORMATION_2', 'UNITCOMBAT_MOUNTED'),
	('PROMOTION_FORMATION_2', 'UNITCOMBAT_ARMOR'),
	('PROMOTION_AMBUSH_2', 'UNITCOMBAT_MELEE'),
	('PROMOTION_AMBUSH_2', 'UNITCOMBAT_GUN');

-- Helicopters, Hovertanks, and Nexii units fly over water
INSERT INTO
	UnitPromotions (
		Type,
		Description,
		Help,
		Sound,
		IconAtlas,
		PediaType,
		PortraitIndex,
		PediaEntry,
		CanMoveAllTerrain,
		LostWithUpgrade
	)
VALUES
	(
		'PROMOTION_MOVE_ALL_TERRAIN',
		'TXT_KEY_PROMOTION_MOVE_ALL_TERRAIN',
		'TXT_KEY_PROMOTION_MOVE_ALL_TERRAIN_HELP',
		'AS2D_IF_LEVELUP',
		'ABILITY_ATLAS',
		'PEDIA_ATTRIBUTES',
		58,
		'TXT_KEY_PROMOTION_MOVE_ALL_TERRAIN',
		1,
		0
	);

DELETE FROM UnitPromotions_UnitCombats
WHERE
	(
		UnitCombatType IN (
			'UNITCOMBAT_HELICOPTER',
			'UNITCOMBAT_FW_HOVERTANK',
			'UNITCOMBAT_FW_NEXUS'
		)
		AND PromotionType IN (
			'PROMOTION_EMBARKATION',
			'PROMOTION_DEFENSIVE_EMBARKATION',
			'PROMOTION_ALLWATER_EMBARKATION'
		)
	);

INSERT INTO
	Unit_FreePromotions (UnitType, PromotionType)
VALUES
	(
		'UNIT_HELICOPTER_GUNSHIP',
		'PROMOTION_MOVE_ALL_TERRAIN'
	),
	('UNIT_FW_HOVERTANK', 'PROMOTION_MOVE_ALL_TERRAIN'),
	('UNIT_FW_NEXUS', 'PROMOTION_MOVE_ALL_TERRAIN');

-- Carriers Heal Units + Attack
INSERT INTO
	UnitPromotions_UnitCombats (PromotionType, UnitCombatType)
VALUES
	('PROMOTION_MEDIC', 'UNITCOMBAT_CARRIER'),
	('PROMOTION_MEDIC_II', 'UNITCOMBAT_CARRIER');

INSERT INTO
	Unit_FreePromotions (UnitType, PromotionType)
VALUES
	('UNIT_CARRIER', 'PROMOTION_MEDIC'),
	('UNIT_FW_SUPERCARRIER', 'PROMOTION_MEDIC');

UPDATE Units
SET
	RangedCombat = 30
WHERE
	Type = 'UNIT_CARRIER';

UPDATE Units
SET
	Range = 2
WHERE
	Type = 'UNIT_CARRIER';

-- Strat-less Resource up to Alum
CREATE TABLE UnitsThatNeededStrategicResources (UnitType TEXT, ResourceType TEXT);

INSERT INTO
	UnitsThatNeededStrategicResources (UnitType, ResourceType)
SELECT
	UnitType,
	ResourceType
FROM
	Unit_ResourceQuantityRequirements
WHERE
	ResourceType IN (
		'RESOURCE_IRON',
		'RESOURCE_HORSE',
		'RESOURCE_COAL',
		'RESOURCE_OIL',
		'RESOURCE_ALUMINUM'
	);

UPDATE Unit_ResourceQuantityRequirements
SET
	ResourceType = NULL
WHERE
	ResourceType IN (
		'RESOURCE_IRON',
		'RESOURCE_HORSE',
		'RESOURCE_COAL',
		'RESOURCE_OIL',
		'RESOURCE_ALUMINUM'
	);

UPDATE Unit_ResourceQuantityRequirements
SET
	ResourceType = 'RESOURCE_ALUMINUM'
WHERE
	UnitType IN (
		'UNIT_MECHANIZED_INFANTRY',
		'UNIT_FW_UAV',
		'UNIT_MODERN_ARMOR',
		'UNIT_FW_HOVERTANK',
		'UNIT_FW_RAILGUN_TANK',
		'UNIT_FW_MECH_ARTILLERY',
		'UNITCLASS_FW_ARSENAL_SHIP',
		'UNIT_FW_MISSILE_DESTROYER',
		'UNIT_NUCLEAR_SUBMARINE',
		'UNIT_FW_SUPERCARRIER',
		'UNIT_JET_FIGHTER',
		'UNIT_STEALTH_BOMBER',
		'UNIT_FW_CHIMERA',
		'UNIT_FW_BATTLESUIT',
		'UNIT_XCOM'
	);

-- Misc. Changes
UPDATE Units
SET
	Combat = 80
WHERE
	Type = 'UNIT_TANK';

UPDATE Units
SET
	Moves = 4
WHERE
	Type = 'UNIT_MECHANIZED_INFANTRY';

UPDATE Units
SET
	Range = '2'
WHERE
	UnitType IN (
		'UNIT_GATLING_GUN',
		'UNIT_MACHINE_GUN',
		'UNIT_BAZOOKA'
	);
