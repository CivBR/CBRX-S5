--==========================================================================================================================	
-- RESOURCES
--==========================================================================================================================	
-- Resources
------------------------------	
INSERT INTO Resources 
		(Type,							Description,				Civilopedia, 						ResourceClassType, 		Happiness,  AITradeModifier, 	ResourceUsage,	AIObjective,	'Unique', 	IconString, 			PortraitIndex, 	IconAtlas)
VALUES	('RESOURCE_SENSHI_SHEEP_LUX',	'TXT_KEY_RESOURCE_SHEEP',	'TXT_KEY_CIV5_RESOURCE_SHEEP_TEXT',	'RESOURCECLASS_LUXURY',	4,			10,					2, 				0, 				2, 			'[ICON_RES_SHEEP]',		26, 			'RESOURCE_ATLAS');

INSERT INTO BuildingClasses 	
		(Type, 						 		DefaultBuilding, 				Description)
VALUES	('BUILDINGCLASS_SENSHI_NEW_SOUTH_WALES', 		'BUILDING_SENSHI_NSW_SHEEP_DUMMY',	'TXT_KEY_TRAIT_SENSHI_NEW_SOUTH_WALES_SHORT');

INSERT INTO Buildings 		
		(Type, 						 			BuildingClass, 							SpecialistCount, SpecialistType,		ExtraLeagueVotes, PrereqTech, Cost, FaithCost, GreatWorkCount,	GoldMaintenance, MinAreaSize,	NeverCapture,	Description, 									Help, 												Strategy,										Civilopedia, 							ArtDefineTag, PortraitIndex, IconAtlas)
VALUES	('BUILDING_SENSHI_NSW_SHEEP_DUMMY', 	'BUILDINGCLASS_SENSHI_NEW_SOUTH_WALES',	0,				 null,					0,						null,		 -1,   -1,		  -1,				0,				 0,				1,				'TXT_KEY_TRAIT_SENSHI_NEW_SOUTH_WALES_SHORT',			'TXT_KEY_TRAIT_SENSHI_NEW_SOUTH_WALES',			null,											null,									null,		  0, 			 'SENSHI_NEW_SOUTH_WALES_ATLAS');

INSERT INTO Building_ResourceQuantity 	
		(BuildingType, 							ResourceType, 					Quantity)
VALUES	('BUILDING_SENSHI_NSW_SHEEP_DUMMY', 	'RESOURCE_SENSHI_SHEEP_LUX',	1);