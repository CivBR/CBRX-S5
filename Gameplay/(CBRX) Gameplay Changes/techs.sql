UPDATE Technologies
SET
	Era = 'ERA_ANCIENT'
WHERE
	Type = 'TECH_OPTICS';

UPDATE Buildings
SET
	AllowsWaterRoutes = 1
WHERE
	(Type = 'BUILDING_LIGHTHOUSE');