--==========================================================================================================================	
-- Traits
--==========================================================================================================================	
INSERT INTO Traits 
			(Type, 						Description, 						ShortDescription)					
VALUES		('TRAIT_SENSHI_BANGLADESH', 	'TXT_KEY_TRAIT_SENSHI_BANGLADESH', 	'TXT_KEY_TRAIT_SENSHI_BANGLADESH_SHORT');

INSERT INTO BuildingClasses 	
		(Type, 						 		DefaultBuilding, 				Description)
VALUES	('BUILDINGCLASS_SENSHI_BANGLADESH', 		'BUILDING_SENSHI_BANGLADESH_CULTURE',	'TXT_KEY_TRAIT_SENSHI_BANGLADESH_SHORT');

INSERT INTO Buildings 		
		(Type, 						 					BuildingClass, 						SpecialistCount, SpecialistType,	Happiness,	ReligiousPressureModifier,	PrereqTech, Cost, FaithCost, GreatWorkCount,	GoldMaintenance, MinAreaSize,	NeverCapture,	Description, 									Help, 												Strategy,										Civilopedia, 							ArtDefineTag, PortraitIndex, IconAtlas)
VALUES	('BUILDING_SENSHI_BANGLADESH_CULTURE', 			'BUILDINGCLASS_SENSHI_BANGLADESH',	0,				 null,				0,									0,			null,		 -1,   -1,		  -1,				0,				 0,				1,				'TXT_KEY_TRAIT_SENSHI_BANGLADESH_SHORT',			'TXT_KEY_TRAIT_SENSHI_BANGLADESH',			null,											null,									null,		  0, 			 'SENSHI_BANGLADESH_ATLAS'),
		('BUILDING_SENSHI_BANGLADESH_HAPPINESS', 			'BUILDINGCLASS_SENSHI_BANGLADESH',	0,				 null,				1,									0,			null,		 -1,   -1,		  -1,				0,				 0,				1,				'TXT_KEY_TRAIT_SENSHI_BANGLADESH_SHORT',			'TXT_KEY_TRAIT_SENSHI_BANGLADESH',			null,											null,									null,		  0, 			 'SENSHI_BANGLADESH_ATLAS');

INSERT INTO Building_YieldChanges 	
		(BuildingType, 						 		YieldType, 			Yield)
VALUES	('BUILDING_SENSHI_BANGLADESH_CULTURE', 		'YIELD_CULTURE',	2);