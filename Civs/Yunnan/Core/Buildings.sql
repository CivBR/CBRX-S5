--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
-- Buildings
------------------------------	
INSERT INTO Buildings 	
		(Type, 									BuildingClass,	FreeStartEra,	Cost,	GoldMaintenance,	LandmarksTourismPercent,	GreatWorksTourismModifier,	Airlift,	AirModifier,	PrereqTech,	Description,								Civilopedia,								Help,											Strategy,							ArtDefineTag,	SpecialistType,	SpecialistCount,	MinAreaSize,	ConquestProb,	HurryCostModifier,	IconAtlas,				PortraitIndex)
SELECT	('BUILDING_SENSHI_HUMP_AIRBASE'),		BuildingClass,	FreeStartEra,	Cost,	GoldMaintenance,	LandmarksTourismPercent,	GreatWorksTourismModifier,	Airlift,	AirModifier,	('TECH_FLIGHT'),	('TXT_KEY_BUILDING_SENSHI_HUMP_AIRBASE'),	('TXT_KEY_CIV5_BUILDING_SENSHI_HUMP_AIRBASE_TEXT'),	('TXT_KEY_BUILDING_SENSHI_HUMP_AIRBASE_HELP'),	('TXT_KEY_BUILDING_SENSHI_HUMP_AIRBASE_STRATEGY'),	ArtDefineTag,	SpecialistType,	SpecialistCount,	MinAreaSize,	0,				HurryCostModifier,	'SENSHI_YUNNAN_ATLAS',	3
FROM Buildings WHERE (Type = 'BUILDING_AIRPORT');
------------------------------	
-- Building_Flavors
------------------------------		
INSERT INTO Building_Flavors 	
		(BuildingType, 				FlavorType,			Flavor)
SELECT	('BUILDING_SENSHI_HUMP_AIRBASE'),	FlavorType,			Flavor
FROM Building_Flavors WHERE (BuildingType = 'BUILDING_AIRPORT');
------------------------------	
-- Building_YieldChanges
------------------------------		
INSERT INTO Building_YieldChanges 	
		(BuildingType, 					YieldType,		Yield)
SELECT	('BUILDING_SENSHI_HUMP_AIRBASE'),	YieldType,		Yield
FROM Building_YieldChanges WHERE (BuildingType = 'BUILDING_AIRPORT');
------------------------------	
-- Building_YieldModifiers
------------------------------		
INSERT INTO Building_YieldModifiers 	
		(BuildingType, 						YieldType,		Yield)
SELECT	('BUILDING_SENSHI_HUMP_AIRBASE'),	YieldType,		Yield
FROM Building_YieldModifiers WHERE (BuildingType = 'BUILDING_AIRPORT');

INSERT INTO Building_DomainFreeExperiences 	
			(BuildingType, 						DomainType,		Experience)
VALUES		('BUILDING_SENSHI_HUMP_AIRBASE', 	'DOMAIN_AIR',	15);