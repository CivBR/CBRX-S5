-- Water passable Forts & Citadels
UPDATE CustomModOptions
SET
	Value = 1
WHERE
	Name = 'GLOBAL_PASSABLE_FORTS';

UPDATE CustomModOptions
SET
	Value = 0
WHERE
	Name = 'GLOBAL_PASSABLE_FORTS_ANY';

UPDATE Improvements
SET
	MakesPassable = 1
WHERE
	Type = 'IMPROVEMENT_FORT';

UPDATE Improvements
SET
	MakesPassable = 1
WHERE
	Type = 'IMPROVEMENT_CITADEL';