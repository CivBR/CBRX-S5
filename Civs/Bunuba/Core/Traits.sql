--==========================================================================================================================	
-- Traits
--==========================================================================================================================	
INSERT INTO Traits 
			(Type, 						Description, 						ShortDescription)					
VALUES		('TRAIT_SENSHI_BUNUBA', 	'TXT_KEY_TRAIT_SENSHI_BUNUBA', 	'TXT_KEY_TRAIT_SENSHI_BUNUBA_SHORT');

--==========================================================================================================================

INSERT INTO BuildingClasses 	
		(Type, 						 		DefaultBuilding, 				Description)
VALUES	('BUILDINGCLASS_SENSHI_BUNUBA', 		'BUILDING_SENSHI_BUNUBA_AIRPORT',	'TXT_KEY_TRAIT_SENSHI_BUNUBA_SHORT');

INSERT INTO Buildings 		
		(Type, 						 		BuildingClass, 					Airlift,	SpecialistCount, SpecialistType,	PrereqTech, Cost, FaithCost, GreatWorkCount,	GoldMaintenance, MinAreaSize,	NeverCapture,	Description, 									Help, 												Strategy,										Civilopedia, 							ArtDefineTag, PortraitIndex, IconAtlas)
VALUES	('BUILDING_SENSHI_BUNUBA_AIRPORT', 	'BUILDINGCLASS_SENSHI_BUNUBA',	1,			0,				 null,				null,		 -1,   -1,		  -1,				0,				 0,				1,				'TXT_KEY_TRAIT_SENSHI_BUNUBA_SHORT',			'TXT_KEY_TRAIT_SENSHI_BUNUBA',			null,											null,									null,		  0, 			 'SENSHI_BUNUBA_ATLAS');

--==========================================================================================================================
-- UnitPromotions
--==========================================================================================================================
INSERT INTO UnitPromotions 
		(Type, 									Description, 									Help, 												Sound, 				CombatPercent,	FlankAttackModifier,	CannotBeChosen, LostWithUpgrade, PortraitIndex,  IconAtlas, 		PediaType, 				PediaEntry)
VALUES	('PROMOTION_SENSHI_BUNUBA_FRIGHTENED',	'TXT_KEY_PROMOTION_SENSHI_BUNUBA_FRIGHTENED',	'TXT_KEY_PROMOTION_SENSHI_BUNUBA_FRIGHTENED_HELP',	'AS2D_IF_LEVELUP', 	-10,			-10,					1, 				0, 				 59, 			 'ABILITY_ATLAS', 'PEDIA_ATTRIBUTES',		'TXT_KEY_PROMOTION_SENSHI_BUNUBA_FRIGHTENED');