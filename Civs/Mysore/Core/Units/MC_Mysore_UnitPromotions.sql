--==========================================================================================================================
-- UnitPromotions
--==========================================================================================================================	
INSERT INTO UnitPromotions 
		(Type, 							NearbyEnemyCombatMod,	NearbyEnemyCombatRange,	LostWithUpgrade,	Description, 							Help, 										Sound, 				CannotBeChosen, PortraitIndex, 	IconAtlas, 			 PediaType, 			PediaEntry)
VALUES	('PROMOTION_MC_MYSORE',			0,						0,						1,					'TXT_KEY_PROMOTION_MC_MYSORE',			'TXT_KEY_PROMOTION_MC_MYSORE_HELP', 		'AS2D_IF_LEVELUP', 	1, 				59, 			'ABILITY_ATLAS', 	 'PEDIA_ATTRIBUTES',	'TXT_KEY_PROMOTION_MC_MYSORE'),
		('PROMOTION_MC_MYSORE_CUSHOON',	0,						0,						1,					'TXT_KEY_PROMOTION_MC_MYSORE_CUSHOON',	'TXT_KEY_PROMOTION_MC_MYSORE_CUSHOON_HELP', 'AS2D_IF_LEVELUP', 	1, 				59, 			'ABILITY_ATLAS', 	 'PEDIA_ATTRIBUTES',	'TXT_KEY_PROMOTION_MC_MYSORE_CUSHOON'),
		('PROMOTION_MC_CUSHOON_ROCKET',	-10,					2,						1,					'TXT_KEY_PROMOTION_MC_CUSHOON_ROCKET',	'TXT_KEY_PROMOTION_MC_CUSHOON_ROCKET_HELP', 'AS2D_IF_LEVELUP', 	1, 				59, 			'ABILITY_ATLAS', 	 'PEDIA_ATTRIBUTES',	'TXT_KEY_PROMOTION_MC_CUSHOON_ROCKET');


--==========================================================================================================================
--UnitPromotions_Domains
--==========================================================================================================================
INSERT INTO UnitPromotions_Domains
		(PromotionType,				DomainType,		Modifier)
VALUES	('PROMOTION_MC_MYSORE',		'DOMAIN_LAND',	10);

