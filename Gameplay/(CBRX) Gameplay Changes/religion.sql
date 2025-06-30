-- Maximum Number of Religions
UPDATE Worlds
SET
	MaxActiveReligions = 18
WHERE
	Type IN (
		'WORLDSIZE_STANDARD',
		'WORLDSIZE_LARGE',
		'WORLDSIZE_HUGE'
	);

--Missionary and Prophet costs Update
UPDATE Defines
SET
	Value = 300
WHERE
	Name = 'RELIGION_BASE_CHANCE_PROPHET_SPAWN';

UPDATE Defines
SET
	Value = 120
WHERE
	Name = 'RELIGION_MIN_FAITH_FIRST_PROPHET';

UPDATE Defines
SET
	Value = 15
WHERE
	Name = "RELIGION_MIN_FAITH_FIRST_PANTHEON";

UPDATE Defines
SET
	Value = 250
WHERE
	Name = "RELIGION_MIN_FAITH_FIRST_PROPHET";

UPDATE Defines
SET
	Value = 1500
WHERE
	Name = "RELIGION_MIN_FAITH_FIRST_GREAT_PERSON";

UPDATE Defines
SET
	Value = 500
WHERE
	Name = "RELIGION_FAITH_DELTA_NEXT_PROPHET";

UPDATE Defines
SET
	Value = 800
WHERE
	Name = "RELIGION_FAITH_DELTA_NEXT_GREAT_PERSON";

UPDATE Units
SET
	FaithCost = 300
WHERE
	Type = 'UNIT_MISSIONARY';

-- Inquisitor cost Update
UPDATE Units
SET
	FaithCost = 120,
	Moves = 4
WHERE
	Type = 'UNIT_INQUISITOR';

-- whoward VMC DLL options
UPDATE CustomModOptions
SET
	Value = 1
WHERE
	Name = 'RELIGION_CONVERSION_MODIFIERS';

UPDATE CustomModOptions
SET
	Value = 1
WHERE
	Name = 'GLOBAL_RELIGIOUS_SETTLERS';

UPDATE Buildings
SET
	ConversionModifier = -5
WHERE
	Type = 'BUILDING_SHRINE';

UPDATE Buildings
SET
	ConversionModifier = -5
WHERE
	Type = 'BUILDING_TEMPLE';

UPDATE Buildings
SET
	GlobalConversionModifier = -2
WHERE
	Type = 'BUILDING_STONEHENGE';

UPDATE Buildings
SET
	GlobalConversionModifier = -2
WHERE
	Type = 'BUILDING_HAGIA_SOPHIA';

UPDATE Buildings
SET
	GlobalConversionModifier = -2
WHERE
	Type = 'BUILDING_MOSQUE_OF_DJENNE';

UPDATE Buildings
SET
	GlobalConversionModifier = -10
WHERE
	Type = 'BUILDING_GRAND_TEMPLE';

UPDATE Policies
SET
	ConversionModifier = -5
WHERE
	Type = 'POLICY_ORGANIZED_RELIGION';
