--==========================================================================================================================
-- Building_YieldModifiers
--==========================================================================================================================
INSERT INTO UnitPromotions
		(Type,									Description,								Help,												Sound,				CannotBeChosen, LostWithUpgrade,	NoDefensiveBonus,	HasPostCombatPromotions,	PortraitIndex,	IconAtlas,			PediaType,			PediaEntry)
VALUES	('PROMOTION_MC_YANOMAMI_LISTENER',		'TXT_KEY_PROMOTION_MC_YANOMAMI_LISTENER',	'TXT_KEY_PROMOTION_MC_YANOMAMI_LISTENER_HELP',		'AS2D_IF_LEVELUP',	1,				0,					0,					1,							59,				'ABILITY_ATLAS',	'PEDIA_ATTRIBUTES',	'TXT_KEY_PROMOTION_MC_YANOMAMI_LISTENER'),
		('PROMOTION_MC_YANOMAMI_LISTENER_2',	'TXT_KEY_PROMOTION_MC_YANOMAMI_LISTENER',	'TXT_KEY_PROMOTION_MC_YANOMAMI_LISTENER_2_HELP',	'AS2D_IF_LEVELUP',	1,				0,					0,					0,							59,				'ABILITY_ATLAS',	'PEDIA_ATTRIBUTES',	'TXT_KEY_PROMOTION_MC_YANOMAMI_LISTENER'),
		('PROMOTION_MC_DARTBLOWER_MARKED',		'TXT_KEY_PROMOTION_MC_DARTBLOWER_MARKED',	'TXT_KEY_PROMOTION_MC_DARTBLOWER_MARKED_HELP',		'AS2D_IF_LEVELUP',	1,				0,					1,					0,							57,				'ABILITY_ATLAS',	'PEDIA_ATTRIBUTES',	'TXT_KEY_PROMOTION_MC_DARTBLOWER_MARKED'),
		('PROMOTION_MC_DARTBLOWER_COUNT_1',		'TXT_KEY_PROMOTION_MC_DARTBLOWER_MARKED',	'TXT_KEY_PROMOTION_MC_COUNT_1_HELP',				'AS2D_IF_LEVELUP',	1,				0,					1,					0,							57,				'ABILITY_ATLAS',	'PEDIA_ATTRIBUTES',	'TXT_KEY_PROMOTION_MC_DARTBLOWER_MARKED'),
		('PROMOTION_MC_DARTBLOWER_COUNT_2',		'TXT_KEY_PROMOTION_MC_DARTBLOWER_MARKED',	'TXT_KEY_PROMOTION_MC_COUNT_2_HELP',				'AS2D_IF_LEVELUP',	1,				0,					1,					0,							57,				'ABILITY_ATLAS',	'PEDIA_ATTRIBUTES',	'TXT_KEY_PROMOTION_MC_DARTBLOWER_MARKED');
--==========================================================================================================================
-- UnitPromotions_PostCombatRandomPromotion
--==========================================================================================================================

INSERT INTO UnitPromotions_PostCombatRandomPromotion
		(PromotionType,						NewPromotion)
VALUES	('PROMOTION_MC_YANOMAMI_LISTENER',	'PROMOTION_MC_YANOMAMI_LISTENER_2');

