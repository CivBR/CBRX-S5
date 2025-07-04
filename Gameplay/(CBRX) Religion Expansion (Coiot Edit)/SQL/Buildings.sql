-- Author: Limaeus/Limerickarcher
-- Date: 5/30/2020
-- Ensure text entries exist for building descriptions and help text
-- commenting out the text insert as it's all duplicative with the GameText.xml file these days –THP, 7/3/2025
/*
INSERT INTO
	Language_en_US (Tag, Text)
VALUES
	(
		'TXT_KEY_BUILDING_CBRX_FOUNDER_GUARDIAN_SPIRITS',
		'Guardian Spirits'
	),
	(
		'TXT_KEY_BUILDING_CBRX_FOUNDER_GUARDIAN_SPIRITS_HELP',
		'Provides additional faith generation and cultural influence.'
	),
	(
		'TXT_KEY_BUILDING_CBRX_FOUNDER_CHARITY',
		'Charity'
	),
	(
		'TXT_KEY_BUILDING_CBRX_FOUNDER_CHARITY_HELP',
		'Reduces global maintenance costs and increases happiness.'
	),
	(
		'TXT_KEY_BUILDING_CBRX_FOUNDER_ASTRAL_PROJECTION',
		'Astral Projection'
	),
	(
		'TXT_KEY_BUILDING_CBRX_FOUNDER_ASTRAL_PROJECTION_HELP',
		'Grants additional vision and movement bonuses to religious units.'
	),
	(
		'TXT_KEY_BUILDING_CBRX_FOUNDER_TUTELARY_DEITIES',
		'Tutelary Deities'
	),
	(
		'TXT_KEY_BUILDING_CBRX_FOUNDER_TUTELARY_DEITIES_HELP',
		'Boosts great artist generation and increases culture output.'
	),
	('TXT_KEY_BUILDING_CBRX_FOLLOWER_ALTARS', 'Altars'),
	(
		'TXT_KEY_BUILDING_CBRX_FOLLOWER_ALTARS_HELP',
		'Increases faith output and allows sacrifices for bonuses.'
	),
	(
		'TXT_KEY_BUILDING_CBRX_FOLLOWER_TORII_GATES',
		'Torii Gates'
	),
	(
		'TXT_KEY_BUILDING_CBRX_FOLLOWER_TORII_GATES_HELP',
		'Provides culture and tourism bonuses, increasing faith-based influence.'
	);
*/

-- Ensure Building Classes exist
INSERT INTO
	BuildingClasses (Type, DefaultBuilding, Description)
VALUES
	(
		'BUILDINGCLASS_CBRX_FOUNDER',
		'BUILDING_CBRX_FOUNDER',
		'TXT_KEY_BUILDING_CLASS_CBRX_FOUNDER'
	),
	(
		'BUILDINGCLASS_CBRX_FOLLOWER_ALTARS',
		'BUILDING_CBRX_FOLLOWER_ALTARS',
		'TXT_KEY_BUILDING_CLASS_CBRX_FOLLOWER_ALTARS'
	),
	(
		'BUILDINGCLASS_CBRX_PANTHEON_AXIS_MUNDI',
		'BUILDING_CBRX_PANTHEON_AXIS_MUNDI',
		'TXT_KEY_BUILDING_CLASS_CBRX_PANTHEON_AXIS_MUNDI'
	),
	(
		'BUILDINGCLASS_CBRX_FOLLOWER_TORII_GATES',
		'BUILDING_CBRX_FOLLOWER_TORII_GATES',
		'TXT_KEY_BUILDING_CLASS_CBRX_FOLLOWER_TORII_GATES'
	);

-- Ensure Buildings are inserted properly
INSERT INTO
	Buildings (
		Type,
		BuildingClass,
		Defense,
		GlobalPlotBuyCostModifier,
		GlobalPlotCultureCostModifier,
		SpecialistType,
		GreatPeopleRateChange,
		UnlockedByBelief,
		Cost,
		FaithCost,
		PrereqTech,
		Description,
		Help,
		NeverCapture
	)
VALUES
	(
		'BUILDING_CBRX_FOUNDER_GUARDIAN_SPIRITS',
		'BUILDINGCLASS_CBRX_FOUNDER',
		100,
		0,
		0,
		NULL,
		0,
		0,
		-1,
		-1,
		NULL,
		'TXT_KEY_BUILDING_CBRX_FOUNDER_GUARDIAN_SPIRITS',
		'TXT_KEY_BUILDING_CBRX_FOUNDER_GUARDIAN_SPIRITS_HELP',
		1
	),
	(
		'BUILDING_CBRX_FOUNDER_CHARITY',
		'BUILDINGCLASS_CBRX_FOUNDER',
		0,
		-20,
		0,
		NULL,
		0,
		0,
		-1,
		-1,
		NULL,
		'TXT_KEY_BUILDING_CBRX_FOUNDER_CHARITY',
		'TXT_KEY_BUILDING_CBRX_FOUNDER_CHARITY_HELP',
		1
	),
	(
		'BUILDING_CBRX_FOUNDER_ASTRAL_PROJECTION',
		'BUILDINGCLASS_CBRX_FOUNDER',
		0,
		0,
		-20,
		NULL,
		0,
		0,
		-1,
		-1,
		NULL,
		'TXT_KEY_BUILDING_CBRX_FOUNDER_ASTRAL_PROJECTION',
		'TXT_KEY_BUILDING_CBRX_FOUNDER_ASTRAL_PROJECTION_HELP',
		1
	),
	(
		'BUILDING_CBRX_FOUNDER_TUTELARY_DEITIES',
		'BUILDINGCLASS_CBRX_FOUNDER',
		0,
		0,
		0,
		'SPECIALIST_ARTIST',
		1,
		0,
		-1,
		-1,
		NULL,
		'TXT_KEY_BUILDING_CBRX_FOUNDER_TUTELARY_DEITIES',
		'TXT_KEY_BUILDING_CBRX_FOUNDER_TUTELARY_DEITIES_HELP',
		1
	),
	(
		'BUILDING_CBRX_FOLLOWER_ALTARS',
		'BUILDINGCLASS_CBRX_FOLLOWER_ALTARS',
		0,
		0,
		0,
		NULL,
		0,
		1,
		-1,
		225,
		NULL,
		'TXT_KEY_BUILDING_CBRX_FOLLOWER_ALTARS',
		'TXT_KEY_BUILDING_CBRX_FOLLOWER_ALTARS_HELP',
		1
	),
	(
		'BUILDING_CBRX_FOLLOWER_TORII_GATES',
		'BUILDINGCLASS_CBRX_FOLLOWER_TORII_GATES',
		0,
		0,
		0,
		NULL,
		0,
		1,
		-1,
		225,
		NULL,
		'TXT_KEY_BUILDING_CBRX_FOLLOWER_TORII_GATES',
		'TXT_KEY_BUILDING_CBRX_FOLLOWER_TORII_GATES_HELP',
		1
	);
