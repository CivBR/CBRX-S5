--==========================================================================================================================
-- Buildings
--==========================================================================================================================
INSERT INTO Buildings 	
		(Type, 									BuildingClass,	FreeStartEra,	Cost,	GoldMaintenance,	PrereqTech,	Description,									Civilopedia,											Help,												Strategy,												ArtDefineTag,	SpecialistType,	SpecialistCount,	MinAreaSize,	ConquestProb,	HurryCostModifier,	AllowsRangeStrike,	Defense,		ExtraCityHitPoints,		IconAtlas,				PortraitIndex)
SELECT	('BUILDING_MC_MYSORE_TARAMANDAL_PET'),	BuildingClass,	FreeStartEra,	Cost,	GoldMaintenance,	PrereqTech,	('TXT_KEY_BUILDING_MC_MYSORE_TARAMANDAL_PET'),	('TXT_KEY_BUILDING_MC_MYSORE_TARAMANDAL_PET_PEDIA'),	('TXT_KEY_BUILDING_MC_MYSORE_TARAMANDAL_PET_HELP'),	('TXT_KEY_BUILDING_MC_MYSORE_TARAMANDAL_PET_STRATEGY'),	ArtDefineTag,	SpecialistType,	SpecialistCount,	MinAreaSize,	0,				HurryCostModifier,	AllowsRangeStrike,	Defense+300,	ExtraCityHitPoints-10,	'MC_MYSORE_ATLAS',		2
FROM Buildings WHERE (Type = 'BUILDING_ARSENAL');

--Dummy Building
INSERT INTO Buildings
		(Type,									BuildingClass,								Description,									CultureRateModifier,	Cost,	PrereqTech,	GreatWorkCount,	FaithCost,	NeverCapture)
VALUES	('BUILDING_MC_SCIENCE_CULTURE_DUMMY',	'BUILDINGCLASS_MC_SCIENCE_CULTURE_DUMMY',	'TXT_KEY_BUILDING_MC_SCIENCE_CULTURE_DUMMY',	50,						-1,		null,		-1,				-1,			1),
		('BUILDING_MC_DUMMY_TIMER',				'BUILDINGCLASS_MC_DUMMY_TIMER',				'TXT_KEY_BUILDING_MC_DUMMY_TIMER',				0,						-1,		null,		-1,				-1,			1);

--==========================================================================================================================
-- BuildingClasses
--==========================================================================================================================
INSERT INTO BuildingClasses
		(Type,										DefaultBuilding,						Description)
VALUES	('BUILDINGCLASS_MC_SCIENCE_CULTURE_DUMMY',	'BUILDING_MC_SCIENCE_CULTURE_DUMMY',	'TXT_KEY_BUILDING_MC_SCIENCE_CULTURE_DUMMY'),
		('BUILDINGCLASS_MC_DUMMY_TIMER',			'BUILDING_MC_DUMMY_TIMER',				'TXT_KEY_BUILDING_MC_DUMMY_TIMER');

--==========================================================================================================================
-- Building_Flavors
--==========================================================================================================================
INSERT INTO Building_Flavors 	
		(BuildingType, 							FlavorType,					Flavor)
VALUES	('BUILDING_MC_MYSORE_TARAMANDAL_PET',	'FLAVOR_CITY_DEFENSE',		40),
		('BUILDING_MC_MYSORE_TARAMANDAL_PET',	'FLAVOR_OFFENSE',			20),
		('BUILDING_MC_MYSORE_TARAMANDAL_PET',	'FLAVOR_MILITARY_TRAINING',	30),
		('BUILDING_MC_MYSORE_TARAMANDAL_PET',	'FLAVOR_AIR',				20),
		('BUILDING_MC_MYSORE_TARAMANDAL_PET',	'FLAVOR_CULTURE',			10),
		('BUILDING_MC_MYSORE_TARAMANDAL_PET',	'FLAVOR_SCIENCE',			10);

--==========================================================================================================================
-- Building_ClassesNeededInCity
--==========================================================================================================================
INSERT INTO Building_ClassesNeededInCity 	
		(BuildingType, 							BuildingClassType)
SELECT	('BUILDING_MC_MYSORE_TARAMANDAL_PET'),	BuildingClassType
FROM Building_ClassesNeededInCity WHERE (BuildingType = 'BUILDING_ARSENAL');

--==========================================================================================================================
-- Building_YieldModifiers
--==========================================================================================================================
INSERT INTO Building_YieldModifiers 	
		(BuildingType, 								YieldType,			Yield)
VALUES	('BUILDING_MC_SCIENCE_CULTURE_DUMMY',	'YIELD_SCIENCE',	50);

		


