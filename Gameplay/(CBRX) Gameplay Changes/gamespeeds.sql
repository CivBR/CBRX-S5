UPDATE GameSpeeds
SET
	DealDuration = 45
WHERE
	Type = 'GAMESPEED_STANDARD';

UPDATE GameSpeeds
SET
	ResearchPercent = 400
WHERE
	Type = 'GAMESPEED_STANDARD';

UPDATE GameSpeeds
SET
	FaithPercent = 300
WHERE
	Type = 'GAMESPEED_STANDARD';

UPDATE GameSpeeds
SET
	InflationPercent = 20
WHERE
	Type = 'GAMESPEED_STANDARD';

UPDATE GameSpeeds
SET
	InflationOffset = -135
WHERE
	Type = 'GAMESPEED_STANDARD';

UPDATE GameSpeeds
SET
	ReligiousPressureAdjacentCity = 40
WHERE
	Type = 'GAMESPEED_STANDARD';

UPDATE GameSpeeds
SET
	PeaceDealDuration = 15
WHERE
	Type = 'GAMESPEED_STANDARD';
