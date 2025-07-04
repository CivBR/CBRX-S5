INSERT INTO
	Building_Flavors (BuildingType, FlavorType, Flavor)
VALUES
	('BUILDING_CHEOMSEONGDAE', 'FLAVOR_CULTURE', 10),
	('BUILDING_CHEOMSEONGDAE', 'FLAVOR_WONDER', 20),
	('BUILDING_TEMPLO', 'FLAVOR_PRODUCTION', 15),
	('BUILDING_TEMPLO', 'FLAVOR_CULTURE', 15),
	('BUILDING_TEMPLO', 'FLAVOR_WONDER', 35),
	('BUILDING_DOME', 'FLAVOR_CULTURE', 30),
	('BUILDING_DOME', 'FLAVOR_WONDER', 30),
	('BUILDING_BANAUE', 'FLAVOR_GROWTH', 15),
	('BUILDING_BANAUE', 'FLAVOR_WONDER', 20),
	('BUILDING_LALIBELA', 'FLAVOR_RELIGION', 40),
	('BUILDING_LALIBELA', 'FLAVOR_WONDER', 30),
	('BUILDING_SHWEDAGON', 'FLAVOR_SCIENCE', 32),
	('BUILDING_SHWEDAGON', 'FLAVOR_RELIGION', 64),
	('BUILDING_SHWEDAGON', 'FLAVOR_WONDER', 16),
	('BUILDING_TAKTSANG', 'FLAVOR_CULTURE', 30),
	('BUILDING_TAKTSANG', 'FLAVOR_RELIGION', 30),
	('BUILDING_TAKTSANG', 'FLAVOR_WONDER', 30),
	('BUILDING_PENA', 'FLAVOR_DEFENSE', 13),
	('BUILDING_PENA', 'FLAVOR_WONDER', 25),
	('BUILDING_ITSUKUSHIMA', 'FLAVOR_RELIGION', 15),
	('BUILDING_ITSUKUSHIMA', 'FLAVOR_OFFENSE', 10),
	('BUILDING_ITSUKUSHIMA', 'FLAVOR_WONDER', 20),
	('BUILDING_GOBEKLI', 'FLAVOR_RELIGION', 15),
	('BUILDING_GOBEKLI', 'FLAVOR_WONDER', 10),
	('BUILDING_GATE_SUN', 'FLAVOR_WONDER', 35),
	('BUILDING_GATE_SUN', 'FLAVOR_CULTURE', 15),
	('BUILDING_GATE_SUN', 'FLAVOR_PRODUCTION', 15),
	('BUILDING_VENICE', 'FLAVOR_WONDER', 20),
	('BUILDING_VENICE', 'FLAVOR_GOLD', 20),
	('BUILDING_VENICE', 'FLAVOR_I_TRADE_ORIGIN', 20),
	('BUILDING_VENICE', 'FLAVOR_I_SEA_TRADE_ROUTE', 20),
	('BUILDING_MAHADEVA', 'FLAVOR_RELIGION', 30),
	('BUILDING_MAHADEVA', 'FLAVOR_WONDER', 25),
	('BUILDING_MADOL', 'FLAVOR_GROWTH', 10),
	('BUILDING_MADOL', 'FLAVOR_WONDER', 20),
	('BUILDING_STONE_TOWN', 'FLAVOR_WONDER', 20),
	('BUILDING_STONE_TOWN', 'FLAVOR_GOLD', 20),
	('BUILDING_STONE_TOWN', 'FLAVOR_HAPPINESS', 15),
	('BUILDING_HARMANDIR', 'FLAVOR_RELIGION', 30),
	('BUILDING_HARMANDIR', 'FLAVOR_WONDER', 25),
	('BUILDING_SAGRADA', 'FLAVOR_GREAT_PEOPLE', 30),
	('BUILDING_SAGRADA', 'FLAVOR_WONDER', 25),
	('BUILDING_NEUSCHWANSTEIN', 'FLAVOR_GOLD', 30),
	('BUILDING_NEUSCHWANSTEIN', 'FLAVOR_WONDER', 20),
	('BUILDING_NEUSCHWANSTEIN', 'FLAVOR_CULTURE', 10),
	('BUILDING_NEUSCHWANSTEIN', 'FLAVOR_HAPPINESS', 20),
	('BUILDING_EE_VERSAILLES', 'FLAVOR_WONDER', 25),
	('BUILDING_EE_CRYSTAL_PALACE', 'FLAVOR_WONDER', 25),
	('BUILDING_EE_FASIL_GHEBBI', 'FLAVOR_WONDER', 20),
	('BUILDING_EE_FASIL_GHEBBI', 'FLAVOR_CULTURE', 20),
	(
		'BUILDING_EE_CRYSTAL_PALACE',
		'FLAVOR_CULTURE',
		20
	),
	('BUILDING_EE_VERSAILLES', 'FLAVOR_CULTURE', 50),
	('BUILDING_SKYTOWER', 'FLAVOR_HAPPINESS', 30),
	('BUILDING_SKYTOWER', 'FLAVOR_WONDER', 25);

INSERT INTO
	Building_YieldChanges (BuildingType, YieldType, Yield)
VALUES
	('BUILDING_CHEOMSEONGDAE', 'YIELD_SCIENCE', 3),
	('BUILDING_CHEOMSEONGDAE', 'YIELD_CULTURE', 1),
	('BUILDING_TEMPLO', 'YIELD_CULTURE', 2),
	('BUILDING_TEMPLO', 'YIELD_FAITH', 2),
	('BUILDING_LALIBELA', 'YIELD_FAITH', 3),
	('BUILDING_SHWEDAGON', 'YIELD_SCIENCE', 3),
	('BUILDING_PENA', 'YIELD_CULTURE', 2),
	('BUILDING_GOBEKLI', 'YIELD_FAITH', 4),
	('BUILDING_GATE_SUN', 'YIELD_CULTURE', 3),
	('BUILDING_VENICE', 'YIELD_CULTURE', 2),
	('BUILDING_MAHADEVA', 'YIELD_FAITH', 3),
	('BUILDING_MAHADEVA', 'YIELD_CULTURE', 2),
	('BUILDING_MADOL', 'YIELD_CULTURE', 2),
	('BUILDING_STONE_TOWN', 'YIELD_CULTURE', 1),
	('BUILDING_HARMANDIR', 'YIELD_FAITH', 4),
	('BUILDING_SAGRADA', 'YIELD_CULTURE', 2),
	('BUILDING_SAGRADA', 'YIELD_GOLD', 2),
	('BUILDING_SAGRADA', 'YIELD_CULTURE', 1);

INSERT INTO
	Building_YieldChangesPerPop (BuildingType, YieldType, Yield)
VALUES
	('BUILDING_CHEOMSEONGDAE', 'YIELD_SCIENCE', 34),
	('BUILDING_SKYTOWER', 'YIELD_GOLD', 25);

INSERT INTO
	Building_TechAndPrereqs (BuildingType, TechType)
VALUES
	('BUILDING_CHEOMSEONGDAE', 'TECH_MASONRY');

INSERT INTO
	Building_FreeUnits (BuildingType, UnitType, NumUnits)
VALUES
	('BUILDING_DOME', 'UNIT_PROPHET', 1);

INSERT INTO
	Building_TerrainYieldChanges (BuildingType, TerrainType, YieldType, Yield)
VALUES
	(
		'BUILDING_BANAUE',
		'TERRAIN_HILL',
		'YIELD_FOOD',
		1
	),
	(
		'BUILDING_TAKTSANG',
		'TERRAIN_MOUNTAIN',
		'YIELD_FAITH',
		1
	),
	(
		'BUILDING_TAKTSANG',
		'TERRAIN_MOUNTAIN',
		'YIELD_CULTURE',
		1
	);

INSERT INTO
	Building_SpecialistYieldChanges (BuildingType, SpecialistType, YieldType, Yield)
VALUES
	(
		'BUILDING_LALIBELA',
		'SPECIALIST_CITIZEN',
		'YIELD_FAITH',
		1
	),
	(
		'BUILDING_LALIBELA',
		'SPECIALIST_ARTIST',
		'YIELD_FAITH',
		1
	),
	(
		'BUILDING_LALIBELA',
		'SPECIALIST_SCIENTIST',
		'YIELD_FAITH',
		1
	),
	(
		'BUILDING_LALIBELA',
		'SPECIALIST_MERCHANT',
		'YIELD_FAITH',
		1
	),
	(
		'BUILDING_LALIBELA',
		'SPECIALIST_ENGINEER',
		'YIELD_FAITH',
		1
	),
	(
		'BUILDING_HARMANDIR',
		'SPECIALIST_MERCHANT',
		'YIELD_CULTURE',
		2
	);

INSERT INTO
	Building_BuildingClassYieldChanges (
		BuildingType,
		BuildingClassType,
		YieldType,
		YieldChange
	)
VALUES
	(
		'BUILDING_SHWEDAGON',
		'BUILDINGCLASS_SHRINE',
		'YIELD_SCIENCE',
		2
	),
	(
		'BUILDING_SHWEDAGON',
		'BUILDINGCLASS_TEMPLE',
		'YIELD_SCIENCE',
		2
	),
	(
		'BUILDING_SHWEDAGON',
		'BUILDINGCLASS_MONASTERY',
		'YIELD_SCIENCE',
		2
	),
	(
		'BUILDING_SHWEDAGON',
		'BUILDINGCLASS_CATHEDRAL',
		'YIELD_SCIENCE',
		2
	),
	(
		'BUILDING_SHWEDAGON',
		'BUILDINGCLASS_MOSQUE',
		'YIELD_SCIENCE',
		2
	),
	(
		'BUILDING_SHWEDAGON',
		'BUILDINGCLASS_PAGODA',
		'YIELD_SCIENCE',
		2
	);

INSERT INTO
	Building_YieldModifiers (BuildingType, YieldType, Yield)
VALUES
	('BUILDING_SHWEDAGON', 'YIELD_SCIENCE', 20);

INSERT INTO
	Building_ResourceYieldChanges (BuildingType, ResourceType, YieldType, Yield)
VALUES
	(
		'BUILDING_ITSUKUSHIMA',
		'RESOURCE_WHALE',
		'YIELD_FAITH',
		3
	),
	(
		'BUILDING_ITSUKUSHIMA',
		'RESOURCE_FISH',
		'YIELD_FAITH',
		3
	),
	(
		'BUILDING_ITSUKUSHIMA',
		'RESOURCE_PEARLS',
		'YIELD_FAITH',
		3
	),
	(
		'BUILDING_ITSUKUSHIMA',
		'RESOURCE_CRAB',
		'YIELD_FAITH',
		3
	),
	(
		'BUILDING_GOBEKLI',
		'RESOURCE_MARBLE',
		'YIELD_FAITH',
		4
	),
	(
		'BUILDING_GOBEKLI',
		'RESOURCE_STONE',
		'YIELD_FAITH',
		4
	);

INSERT INTO
	Building_DomainFreeExperiences (BuildingType, DomainType, Experience)
VALUES
	('BUILDING_ITSUKUSHIMA', 'DOMAIN_LAND', 20),
	('BUILDING_ITSUKUSHIMA', 'DOMAIN_SEA', 20);

INSERT INTO
	Building_GlobalYieldModifiers (BuildingType, YieldType, Yield)
VALUES
	('BUILDING_GATE_SUN', 'YIELD_FOOD', 5);

INSERT INTO
	Building_LakePlotYieldChanges (BuildingType, YieldType, Yield)
VALUES
	('BUILDING_GATE_SUN', 'YIELD_FOOD', 2),
	('BUILDING_GATE_SUN', 'YIELD_GOLD', 1);

INSERT INTO
	Building_YieldChangesPerReligion (BuildingType, YieldType, Yield)
VALUES
	('BUILDING_MAHADEVA', 'YIELD_PRODUCTION', 600);

INSERT INTO
	Building_SeaPlotYieldChanges (BuildingType, YieldType, Yield)
VALUES
	('BUILDING_MADOL', 'YIELD_FOOD', 1),
	('BUILDING_MADOL', 'YIELD_GOLD', 1),
	('BUILDING_MADOL', 'YIELD_PRODUCTION', 1);
