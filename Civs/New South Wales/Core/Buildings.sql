--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
-- Buildings
------------------------------	
INSERT INTO Buildings 	
		(Type, 									BuildingClass,	FreeStartEra,	Cost,	GoldMaintenance,	PrereqTech,	Description,								Civilopedia,								Help,											Strategy,							ArtDefineTag,	SpecialistType,	SpecialistCount,	MinAreaSize,	ConquestProb,	HurryCostModifier,	IconAtlas,				PortraitIndex)
SELECT	('BUILDING_SENSHI_SHEEP_STATION'),		BuildingClass,	FreeStartEra,	Cost,	GoldMaintenance,	PrereqTech,	('TXT_KEY_BUILDING_SENSHI_SHEEP_STATION'),	('TXT_KEY_CIV5_BUILDING_SENSHI_SHEEP_STATION_TEXT'),	('TXT_KEY_BUILDING_SENSHI_SHEEP_STATION_HELP'),	('TXT_KEY_BUILDING_SENSHI_SHEEP_STATION_STRATEGY'),	ArtDefineTag,	SpecialistType,	SpecialistCount,	MinAreaSize,	0,				HurryCostModifier,	'SENSHI_NEW_SOUTH_WALES_ATLAS',	3
FROM Buildings WHERE (Type = 'BUILDING_STABLE');
------------------------------	
-- Building_Flavors
------------------------------		
INSERT INTO Building_Flavors 	
		(BuildingType, 				FlavorType,			Flavor)
SELECT	('BUILDING_SENSHI_SHEEP_STATION'),	FlavorType,			Flavor
FROM Building_Flavors WHERE (BuildingType = 'BUILDING_STABLE');

INSERT INTO Building_Flavors 	
		(BuildingType, 						FlavorType,			Flavor)
SELECT	('BUILDING_SENSHI_SHEEP_STATION'),	'FLAVOR_GOLD',		Flavor
FROM Building_Flavors WHERE (BuildingType = 'BUILDING_STABLE') AND (FlavorType = 'FLAVOR_PRODUCTION');
------------------------------	
-- Building_LocalResourceOrs
------------------------------		
INSERT INTO Building_LocalResourceOrs 	
		(BuildingType, 						ResourceType)
SELECT	('BUILDING_SENSHI_SHEEP_STATION'),	ResourceType
FROM Building_LocalResourceOrs WHERE (BuildingType = 'BUILDING_STABLE');
------------------------------	
-- Building_ResourceYieldChanges
------------------------------		
INSERT INTO Building_ResourceYieldChanges 	
		(BuildingType, 						ResourceType,	YieldType,		Yield)
SELECT	('BUILDING_SENSHI_SHEEP_STATION'),	ResourceType,	'YIELD_GOLD',	1
FROM Building_ResourceYieldChanges WHERE (BuildingType = 'BUILDING_STABLE');

INSERT INTO Building_ResourceYieldChanges 	
		(BuildingType, 						ResourceType,	YieldType,		Yield)
SELECT	('BUILDING_SENSHI_SHEEP_STATION'),	ResourceType,	YieldType,		Yield
FROM Building_ResourceYieldChanges WHERE (BuildingType = 'BUILDING_STABLE');
------------------------------	
-- Building_UnitCombatProductionModifiers
------------------------------		
INSERT INTO Building_UnitCombatProductionModifiers 	
		(BuildingType, 						UnitCombatType,		Modifier)
SELECT	('BUILDING_SENSHI_SHEEP_STATION'),	UnitCombatType,		Modifier
FROM Building_UnitCombatProductionModifiers WHERE (BuildingType = 'BUILDING_STABLE');