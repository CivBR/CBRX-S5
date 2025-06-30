--==========================================================================================================================	
-- Traits
--==========================================================================================================================	
INSERT INTO Traits 
			(Type, 						Description, 						ShortDescription)					
VALUES		('TRAIT_SENSHI_PAKISTAN', 	'TXT_KEY_TRAIT_SENSHI_PAKISTAN', 	'TXT_KEY_TRAIT_SENSHI_PAKISTAN_SHORT');

INSERT INTO BuildingClasses 	
		(Type, 						 		DefaultBuilding, 				Description)
VALUES	('BUILDINGCLASS_SENSHI_PAKISTAN', 		'BUILDING_SENSHI_PAKISTAN_GROWTH',	'TXT_KEY_TRAIT_SENSHI_PAKISTAN_SHORT');

INSERT INTO Buildings 		
		(Type, 						 					BuildingClass, 						SpecialistCount, SpecialistType,	Happiness,	ReligiousPressureModifier,	PrereqTech, Cost, FaithCost, GreatWorkCount,	GoldMaintenance, MinAreaSize,	NeverCapture,	Description, 									Help, 												Strategy,										Civilopedia, 							ArtDefineTag, PortraitIndex, IconAtlas)
VALUES	('BUILDING_SENSHI_PAKISTAN_GROWTH', 			'BUILDINGCLASS_SENSHI_PAKISTAN',	0,				 null,				0,									0,			null,		 -1,   -1,		  -1,				0,				 0,				1,				'TXT_KEY_TRAIT_SENSHI_PAKISTAN_SHORT',			'TXT_KEY_TRAIT_SENSHI_PAKISTAN',			null,											null,									null,		  0, 			 'SENSHI_PAKISTAN_ATLAS'),
		('BUILDING_SENSHI_PAKISTAN_HAPPINESS', 			'BUILDINGCLASS_SENSHI_PAKISTAN',	0,				 null,				1,									0,			null,		 -1,   -1,		  -1,				0,				 0,				1,				'TXT_KEY_TRAIT_SENSHI_PAKISTAN_SHORT',			'TXT_KEY_TRAIT_SENSHI_PAKISTAN',			null,											null,									null,		  0, 			 'SENSHI_PAKISTAN_ATLAS'),
		('BUILDING_SENSHI_PAKISTAN_PRESSURE', 			'BUILDINGCLASS_SENSHI_PAKISTAN',	0,				 null,				0,									25,			null,		 -1,   -1,		  -1,				0,				 0,				1,				'TXT_KEY_TRAIT_SENSHI_PAKISTAN_SHORT',			'TXT_KEY_TRAIT_SENSHI_PAKISTAN',			null,											null,									null,		  0, 			 'SENSHI_PAKISTAN_ATLAS');

INSERT INTO Building_YieldModifiers 	
		(BuildingType, 						 		YieldType, 		Yield)
VALUES	('BUILDING_SENSHI_PAKISTAN_GROWTH', 		'YIELD_FOOD',	1);