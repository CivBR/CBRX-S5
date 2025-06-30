--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
-- Buildings
------------------------------	
INSERT INTO Buildings 	
		(Type, 							BuildingClass,	FreeStartEra,	Cost,		GoldMaintenance,	PrereqTech, Defense,	ExtraCityHitPoints,		Description,								Civilopedia,								Help,											Strategy,							ArtDefineTag,	SpecialistType,	SpecialistCount,	MinAreaSize,	ConquestProb,	HurryCostModifier,	IconAtlas,				PortraitIndex)
SELECT	('BUILDING_SENSHI_WAJO'),		BuildingClass,	FreeStartEra,	Cost-80,	GoldMaintenance,	PrereqTech,	Defense,	ExtraCityHitPoints,		('TXT_KEY_BUILDING_SENSHI_WAJO'),	('TXT_KEY_CIV5_BUILDING_SENSHI_WAJO_TEXT'),	('TXT_KEY_BUILDING_SENSHI_WAJO_HELP'),	('TXT_KEY_BUILDING_SENSHI_WAJO_STRATEGY'),	ArtDefineTag,	SpecialistType,	SpecialistCount,	MinAreaSize,	0,				HurryCostModifier,	'SENSHI_HIDEYOSHI_ATLAS',	3
FROM Buildings WHERE (Type = 'BUILDING_CASTLE');
------------------------------	
-- Building_Flavors
------------------------------		
INSERT INTO Building_Flavors 	
		(BuildingType, 					FlavorType,			Flavor)
SELECT	('BUILDING_SENSHI_WAJO'),	FlavorType,			Flavor
FROM Building_Flavors WHERE (BuildingType = 'BUILDING_CASTLE');

INSERT INTO Building_Flavors 	
		(BuildingType, 				FlavorType,			Flavor)
VALUES	('BUILDING_SENSHI_WAJO',	'FLAVOR_OFFENSE',	5)