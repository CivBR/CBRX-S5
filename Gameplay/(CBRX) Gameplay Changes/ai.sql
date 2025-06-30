-- Aggression and Expansion
UPDATE Leaders
SET
	WonderCompetitiveness = WonderCompetitiveness + 2,
	MinorCivCompetitiveness = MinorCivCompetitiveness + 2,
	VictoryCompetitiveness = VictoryCompetitiveness + 2,
	Boldness = Boldness + 2;

CREATE TRIGGER IF NOT EXISTS CBR_AggressiveAI_InsertMain AFTER INSERT ON Leaders BEGIN
UPDATE Leaders
SET
	WonderCompetitiveness = WonderCompetitiveness + 2,
	MinorCivCompetitiveness = MinorCivCompetitiveness + 2,
	VictoryCompetitiveness = VictoryCompetitiveness + 2,
	Boldness = Boldness + 2
WHERE
	Type = NEW.Type;

END;

UPDATE Leader_MajorCivApproachBiases
SET
	Bias = Bias + 2
WHERE
	MajorCivApproachType IN (
		'MAJOR_CIV_APPROACH_WAR',
		'MAJOR_CIV_APPROACH_HOSTILE'
	);

CREATE TRIGGER IF NOT EXISTS CBR_AggressiveAI_InsertBiases AFTER INSERT ON Leader_MajorCivApproachBiases WHEN (
	NEW.MajorCivApproachType = 'MAJOR_CIV_APPROACH_WAR'
	OR NEW.MajorCivApproachType = 'MAJOR_CIV_APPROACH_HOSTILE'
) BEGIN
UPDATE Leader_MajorCivApproachBiases
SET
	Bias = Bias + 2
WHERE
	LeaderType = NEW.LeaderType
	AND NEW.MajorCivApproachType = 'MAJOR_CIV_APPROACH_WAR'
	AND MajorCivApproachType = 'MAJOR_CIV_APPROACH_WAR';

UPDATE Leader_MajorCivApproachBiases
SET
	Bias = Bias + 2
WHERE
	LeaderType = NEW.LeaderType
	AND NEW.MajorCivApproachType = 'MAJOR_CIV_APPROACH_HOSTILE'
	AND MajorCivApproachType = 'MAJOR_CIV_APPROACH_HOSTILE';

END;

UPDATE Leader_Flavors
SET
	Flavor = Flavor + 2
WHERE
	FlavorType IN (
		'FLAVOR_OFFENSE',
		'FLAVOR_DEFENSE',
		'FLAVOR_EXPANSION'
	);

CREATE TRIGGER IF NOT EXISTS CBR_AggressiveAI_InsertFlavors AFTER INSERT ON Leader_Flavors WHEN (
	NEW.FlavorType = 'FLAVOR_OFFENSE'
	OR NEW.FlavorType = 'FLAVOR_DEFENSE'
	OR NEW.FlavorType = 'FLAVOR_EXPANSION'
) BEGIN
UPDATE Leader_Flavors
SET
	Flavor = Flavor + 2
WHERE
	LeaderType = NEW.LeaderType
	AND NEW.FlavorType = 'FLAVOR_OFFENSE'
	AND FlavorType = 'FLAVOR_OFFENSE';

UPDATE Leader_Flavors
SET
	Flavor = Flavor + 2
WHERE
	LeaderType = NEW.LeaderType
	AND NEW.FlavorType = 'FLAVOR_EXPANSION'
	AND FlavorType = 'FLAVOR_EXPANSION';

END;

-- Revolts Mininum City Count
UPDATE Defines
SET
	Value = 12
WHERE
	Name = 'UPRISING_NUM_CITY_COUNT';

-- Victory Idealogoy Picks (Less Autocracy Focus)
UPDATE Defines
SET
	Value = 95
WHERE
	Name = 'IDEOLOGY_PERCENT_CLEAR_VICTORY_PREF';

UPDATE Defines
SET
	Value = 5
WHERE
	Name IN (
		'AI_GRAND_STRATEGY_CONQUEST_CRAMPED_WEIGHT',
		'AI_GRAND_STRATEGY_CONQUEST_WEIGHT_PER_MINOR_ATTACKED',
		'AI_GRAND_STRATEGY_CONQUEST_WEIGHT_PER_MINOR_CONQUERED',
		'AI_GRAND_STRATEGY_CONQUEST_WEIGHT_PER_MAJOR_ATTACKED',
		'AI_GRAND_STRATEGY_CONQUEST_WEIGHT_PER_MAJOR_CONQUERED'
	);

-- Island Settling
UPDATE Defines
SET
	Value = 98
WHERE
	Name = 'AI_STRATEGY_AREA_IS_FULL_PERCENT';

UPDATE Defines
SET
	Value = 5
WHERE
	Name = 'AI_STRATEGY_EARLY_EXPANSION_NUM_UNOWNED_TILES_REQUIRED';

UPDATE Defines
SET
	Value = 7
WHERE
	Name = 'AI_STRATEGY_EARLY_EXPANSION_NUM_CITIES_LIMIT';

UPDATE Defines
SET
	Value = 90
WHERE
	Name = 'AI_STRATEGY_ISLAND_START_COAST_REVEAL_PERCENT';

-- Delayed Settler Production
UPDATE Defines
SET
	Value = 3
WHERE
	Name = 'CITY_MIN_SIZE_FOR_SETTLERS';
