--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
-- Buildings
------------------------------	
INSERT INTO Buildings 	
		(Type, 									SpecialistType,			SpecialistCount,	BuildingClass,	FreeStartEra,	Cost,	GoldMaintenance,	PrereqTech,	Description,								Civilopedia,								Help,											Strategy,							ArtDefineTag,	SpecialistType,	SpecialistCount,	MinAreaSize,	ConquestProb,	HurryCostModifier,	EspionageModifier,	Espionage, IconAtlas,				PortraitIndex)
SELECT	('BUILDING_SENSHI_URDU_SOCIETY'),		('SPECIALIST_WRITER'),	1,					BuildingClass,	FreeStartEra,	Cost,	GoldMaintenance,	PrereqTech,	('TXT_KEY_BUILDING_SENSHI_URDU_SOCIETY'),	('TXT_KEY_CIV5_BUILDING_SENSHI_URDU_SOCIETY_TEXT'),	('TXT_KEY_BUILDING_SENSHI_URDU_SOCIETY_HELP'),	('TXT_KEY_BUILDING_SENSHI_URDU_SOCIETY_STRATEGY'),	ArtDefineTag,	SpecialistType,	SpecialistCount,	MinAreaSize,	0,				HurryCostModifier,	EspionageModifier,	Espionage, 'SENSHI_PAKISTAN_ATLAS',	3
FROM Buildings WHERE (Type = 'BUILDING_CONSTABLE');
------------------------------	
-- Building_Flavors
------------------------------		
INSERT INTO Building_Flavors 	
		(BuildingType, 				FlavorType,			Flavor)
SELECT	('BUILDING_SENSHI_URDU_SOCIETY'),	FlavorType,			Flavor
FROM Building_Flavors WHERE (BuildingType = 'BUILDING_CONSTABLE');