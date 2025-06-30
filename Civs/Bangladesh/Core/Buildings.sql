--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
-- Buildings
------------------------------	
INSERT INTO Buildings 	
		(Type, 											BuildingClass,	FreeStartEra,	Cost,	GoldMaintenance,	PrereqTech,	Description,								Civilopedia,								Help,											Strategy,							ArtDefineTag,	SpecialistType,	SpecialistCount,	MinAreaSize,	ConquestProb,	HurryCostModifier,	EspionageModifier,	Espionage, IconAtlas,				PortraitIndex)
SELECT	('BUILDING_SENSHI_MONUMENT_OF_MARTYRS'),		BuildingClass,	FreeStartEra,	Cost,	GoldMaintenance,	PrereqTech,	('TXT_KEY_BUILDING_SENSHI_MONUMENT_OF_MARTYRS'),	('TXT_KEY_CIV5_BUILDING_SENSHI_MONUMENT_OF_MARTYRS_TEXT'),	('TXT_KEY_BUILDING_SENSHI_MONUMENT_OF_MARTYRS_HELP'),	('TXT_KEY_BUILDING_SENSHI_MONUMENT_OF_MARTYRS_STRATEGY'),	ArtDefineTag,	SpecialistType,	SpecialistCount,	MinAreaSize,	0,				HurryCostModifier,	EspionageModifier,	Espionage, 'SENSHI_BANGLADESH_ATLAS',	3
FROM Buildings WHERE (Type = 'BUILDING_CONSTABLE');
------------------------------	
-- Building_Flavors
------------------------------		
INSERT INTO Building_Flavors 	
		(BuildingType, 				FlavorType,			Flavor)
SELECT	('BUILDING_SENSHI_MONUMENT_OF_MARTYRS'),	FlavorType,			Flavor
FROM Building_Flavors WHERE (BuildingType = 'BUILDING_CONSTABLE');

INSERT INTO Building_Flavors
			(BuildingType, 								FlavorType,			Flavor)
VALUES		('BUILDING_SENSHI_MONUMENT_OF_MARTYRS', 	'FLAVOR_GROWTH',	20);