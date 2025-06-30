-------------------------------------------
--Unit (Ordo Cavalryman)
-------------------------------------------
INSERT INTO Units
		(Type,						Description,						Civilopedia,									Strategy,										Help,										Combat,	RangedCombat, Cost,	FaithCost,	RequiresFaithPurchaseEnabled,	PurchaseOnly, MoveAfterPurchase,	Moves,	Immobile,	Range,	BaseSightRange,	Class,	Special,	Capture,	CombatClass,	Domain,		CivilianAttackPriority,	DefaultUnitAI,	Food,	NoBadGoodies,	RivalTerritory,	MilitarySupport,	MilitaryProduction,	Pillage,	PillagePrereqTech,	Found,	FoundAbroad,	CultureBombRadius,	GoldenAgeTurns,	FreePolicies,	OneShotTourism,	OneShotTourismPercentOthers,	IgnoreBuildingDefense,	PrereqResources,	Mechanized,	Suicide,	CaptureWhileEmbarked,	PrereqTech,	ObsoleteTech,	GoodyHutUpgradeUnitClass,	HurryCostModifier,	AdvancedStartCost,	MinAreaSize,	AirInterceptRange,	AirUnitCap,	NukeDamageLevel,	WorkRate,	NumFreeTechs,	BaseBeakersTurnsToCount,	BaseCultureTurnsToCount,	RushBuilding,	BaseHurry,	HurryMultiplier,	BaseGold,	NumGoldPerEra,	SpreadReligion,	RemoveHeresy,	ReligionSpreads,	ReligiousStrength,	FoundReligion,	RequiresEnhancedReligion,	ProhibitsSpread,	CanBuyCityState,	CombatLimit,	RangeAttackOnlyInDomain,	RangeAttackIgnoreLOS,	Trade,	NumExoticGoods,	PolicyType,	RangedCombatLimit,	XPValueAttack,	XPValueDefense,	SpecialCargo,	DomainCargo,	Conscription,	ExtraMaintenanceCost,	NoMaintenance,	Unhappiness,	UnitArtInfoCulturalVariation,	UnitArtInfoEraVariation,	ProjectPrereq,	SpaceshipProject,	LeaderPromotion,	LeaderExperience,	DontShowYields,	ShowInPedia,	MoveRate,	UnitArtInfo,						UnitFlagIconOffset,	PortraitIndex,	IconAtlas,						UnitFlagAtlas)
SELECT	'UNIT_JWW_ORDO_CAVALRYMAN',	'TXT_KEY_UNIT_JWW_ORDO_CAVALRYMAN',	'TXT_KEY_CIV5_UNIT_JWW_ORDO_CAVALRYMAN_TEXT',	'TXT_KEY_UNIT_JWW_ORDO_CAVALRYMAN_STRATEGY',	'TXT_KEY_UNIT_HELP_JWW_ORDO_CAVALRYMAN',	18,		RangedCombat, Cost,	FaithCost,	RequiresFaithPurchaseEnabled,	PurchaseOnly, MoveAfterPurchase,	Moves,	Immobile,	Range,	BaseSightRange,	Class,	Special,	Capture,	CombatClass,	Domain,		CivilianAttackPriority,	DefaultUnitAI,	Food,	NoBadGoodies,	RivalTerritory,	MilitarySupport,	MilitaryProduction,	Pillage,	PillagePrereqTech,	Found,	FoundAbroad,	CultureBombRadius,	GoldenAgeTurns,	FreePolicies,	OneShotTourism,	OneShotTourismPercentOthers,	IgnoreBuildingDefense,	PrereqResources,	Mechanized,	Suicide,	CaptureWhileEmbarked,	PrereqTech,	ObsoleteTech,	GoodyHutUpgradeUnitClass,	HurryCostModifier,	AdvancedStartCost,	MinAreaSize,	AirInterceptRange,	AirUnitCap,	NukeDamageLevel,	WorkRate,	NumFreeTechs,	BaseBeakersTurnsToCount,	BaseCultureTurnsToCount,	RushBuilding,	BaseHurry,	HurryMultiplier,	BaseGold,	NumGoldPerEra,	SpreadReligion,	RemoveHeresy,	ReligionSpreads,	ReligiousStrength,	FoundReligion,	RequiresEnhancedReligion,	ProhibitsSpread,	CanBuyCityState,	CombatLimit,	RangeAttackOnlyInDomain,	RangeAttackIgnoreLOS,	Trade,	NumExoticGoods,	PolicyType,	RangedCombatLimit,	XPValueAttack,	XPValueDefense,	SpecialCargo,	DomainCargo,	Conscription,	ExtraMaintenanceCost,	NoMaintenance,	Unhappiness,	UnitArtInfoCulturalVariation,	UnitArtInfoEraVariation,	ProjectPrereq,	SpaceshipProject,	LeaderPromotion,	LeaderExperience,	DontShowYields,	ShowInPedia,	MoveRate,	'ART_DEF_UNIT_JWW_ORDO_CAVALRYMAN',	0,					2,				'JWW_QARA_KHITAI_COLOR_ATLAS',	'JWW_QARA_KHITAI_UNIT_ALPHA_ATLAS'
FROM Units WHERE Type = 'UNIT_KNIGHT';

INSERT INTO UnitGameplay2DScripts
		(UnitType,			SelectionSound,		FirstSelectionSound)
SELECT	'UNIT_JWW_ORDO_CAVALRYMAN',	SelectionSound,		FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_KNIGHT';

INSERT INTO Unit_AITypes
		(UnitType,			UnitAIType)
SELECT	'UNIT_JWW_ORDO_CAVALRYMAN',	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_KNIGHT';

INSERT INTO Unit_Flavors
		(UnitType,			FlavorType,			Flavor)
SELECT	'UNIT_JWW_ORDO_CAVALRYMAN',	FlavorType,			Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_KNIGHT';

INSERT INTO Unit_FreePromotions
		(UnitType,			PromotionType)
SELECT	'UNIT_JWW_ORDO_CAVALRYMAN',	PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_KNIGHT';

INSERT INTO Unit_FreePromotions
		(UnitType,						PromotionType)
VALUES	('UNIT_JWW_ORDO_CAVALRYMAN',	'PROMOTION_SURVIVALISM_1');

INSERT INTO UnitPromotions
		(Type,										Description,									Help,													Sound,				CannotBeChosen,	PortraitIndex,	IconAtlas,			PediaType,			PediaEntry)
VALUES	('PROMOTION_JWW_ORDO_DISTANCE_PROM',		'TXT_KEY_PROMOTION_JWW_ORDO_DISTANCE_PROM',		'TXT_KEY_PROMOTION_JWW_ORDO_DISTANCE_PROM_HELP',		'AS2D_IF_LEVELUP',	1,				59,				'ABILITY_ATLAS',	'PEDIA_ATTRIBUTES',	'TXT_KEY_PROMOTION_JWW_ORDO_DISTANCE_PROM');
-------------------------------------------
--Great Person (Shaojian)
-------------------------------------------
INSERT INTO Units
		(Type,					Description,					Civilopedia,							Strategy,								Help,								Combat,	RangedCombat, Cost,	FaithCost,	RequiresFaithPurchaseEnabled,	PurchaseOnly, MoveAfterPurchase,	Moves,	Immobile,	Range,	BaseSightRange,	Class,	Special,	Capture,	CombatClass,	Domain,		CivilianAttackPriority,	DefaultUnitAI,	Food,	NoBadGoodies,	RivalTerritory,	MilitarySupport,	MilitaryProduction,	Pillage,	PillagePrereqTech,	Found,	FoundAbroad,	CultureBombRadius,	GoldenAgeTurns,	FreePolicies,	OneShotTourism,	OneShotTourismPercentOthers,	IgnoreBuildingDefense,	PrereqResources,	Mechanized,	Suicide,	CaptureWhileEmbarked,	PrereqTech,	ObsoleteTech,	GoodyHutUpgradeUnitClass,	HurryCostModifier,	AdvancedStartCost,	MinAreaSize,	AirInterceptRange,	AirUnitCap,	NukeDamageLevel,	WorkRate,	NumFreeTechs,	BaseBeakersTurnsToCount,	BaseCultureTurnsToCount,	RushBuilding,	BaseHurry,	HurryMultiplier,	BaseGold,	NumGoldPerEra,	SpreadReligion,	RemoveHeresy,	ReligionSpreads,	ReligiousStrength,	FoundReligion,	RequiresEnhancedReligion,	ProhibitsSpread,	CanBuyCityState,	CombatLimit,	RangeAttackOnlyInDomain,	RangeAttackIgnoreLOS,	Trade,	NumExoticGoods,	PolicyType,	RangedCombatLimit,	XPValueAttack,	XPValueDefense,	SpecialCargo,	DomainCargo,	Conscription,	ExtraMaintenanceCost,	NoMaintenance,	Unhappiness,	UnitArtInfoCulturalVariation,	UnitArtInfoEraVariation,	ProjectPrereq,	SpaceshipProject,	LeaderPromotion,	LeaderExperience,	DontShowYields,	ShowInPedia,	MoveRate,	UnitArtInfo,					UnitFlagIconOffset,	PortraitIndex,	IconAtlas,						UnitFlagAtlas)
SELECT	'UNIT_JWW_SHAOJIAN',	'TXT_KEY_UNIT_JWW_SHAOJIAN',	'TXT_KEY_CIV5_UNIT_JWW_SHAOJIAN_TEXT',	'TXT_KEY_UNIT_JWW_SHAOJIAN_STRATEGY',	'TXT_KEY_UNIT_HELP_JWW_SHAOJIAN',	Combat,	RangedCombat, Cost,	FaithCost,	RequiresFaithPurchaseEnabled,	PurchaseOnly, MoveAfterPurchase,	Moves,	Immobile,	Range,	BaseSightRange,	Class,	Special,	Capture,	CombatClass,	Domain,		CivilianAttackPriority,	DefaultUnitAI,	Food,	NoBadGoodies,	RivalTerritory,	MilitarySupport,	MilitaryProduction,	Pillage,	PillagePrereqTech,	Found,	FoundAbroad,	CultureBombRadius,	GoldenAgeTurns,	FreePolicies,	OneShotTourism,	OneShotTourismPercentOthers,	IgnoreBuildingDefense,	PrereqResources,	Mechanized,	Suicide,	CaptureWhileEmbarked,	PrereqTech,	ObsoleteTech,	GoodyHutUpgradeUnitClass,	HurryCostModifier,	AdvancedStartCost,	MinAreaSize,	AirInterceptRange,	AirUnitCap,	NukeDamageLevel,	WorkRate,	NumFreeTechs,	BaseBeakersTurnsToCount,	BaseCultureTurnsToCount,	RushBuilding,	BaseHurry,	HurryMultiplier,	BaseGold,	NumGoldPerEra,	SpreadReligion,	RemoveHeresy,	ReligionSpreads,	ReligiousStrength,	FoundReligion,	RequiresEnhancedReligion,	ProhibitsSpread,	CanBuyCityState,	CombatLimit,	RangeAttackOnlyInDomain,	RangeAttackIgnoreLOS,	Trade,	NumExoticGoods,	PolicyType,	RangedCombatLimit,	XPValueAttack,	XPValueDefense,	SpecialCargo,	DomainCargo,	Conscription,	ExtraMaintenanceCost,	NoMaintenance,	Unhappiness,	UnitArtInfoCulturalVariation,	UnitArtInfoEraVariation,	ProjectPrereq,	SpaceshipProject,	LeaderPromotion,	LeaderExperience,	DontShowYields,	ShowInPedia,	MoveRate,	'ART_DEF_UNIT_JWW_SHAOJIAN',	0,					4,				'JWW_QARA_KHITAI_COLOR_ATLAS',	'JWW_QARA_KHITAI_UNIT_ALPHA_ATLAS_2'
FROM Units WHERE Type = 'UNIT_MERCHANT';

INSERT INTO UnitGameplay2DScripts
		(UnitType,			SelectionSound,		FirstSelectionSound)
SELECT	'UNIT_JWW_SHAOJIAN',	SelectionSound,		FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_MERCHANT';

INSERT INTO Unit_AITypes
		(UnitType,			UnitAIType)
SELECT	'UNIT_JWW_SHAOJIAN',	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_MERCHANT';

INSERT INTO Unit_Flavors
		(UnitType,			FlavorType,			Flavor)
SELECT	'UNIT_JWW_SHAOJIAN',	FlavorType,			Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_MERCHANT';

INSERT INTO Unit_FreePromotions
		(UnitType,			PromotionType)
SELECT	'UNIT_JWW_SHAOJIAN',	PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_MERCHANT';

INSERT INTO Unit_Builds
		(UnitType,			BuildType)
SELECT	'UNIT_JWW_SHAOJIAN',	BuildType
FROM Unit_Builds WHERE UnitType = 'UNIT_MERCHANT';
-------------------------------------------
--Leader (Yelü Dashi)
-------------------------------------------
INSERT INTO Leaders
		(Type,						Description,						Civilopedia,							CivilopediaTag,									ArtDefineTag,			VictoryCompetitiveness,	WonderCompetitiveness,	MinorCivCompetitiveness,	Boldness,	DiploBalance,	WarmongerHate,	WorkAgainstWillingness,	WorkWithWillingness,	DenounceWillingness,	DoFWillingness,	Loyalty,	Neediness,	Forgiveness,	Chattiness,	Meanness,	PortraitIndex,	IconAtlas)
VALUES	('LEADER_JWW_YELU_DASHI',	'TXT_KEY_LEADER_JWW_YELU_DASHI',	'TXT_KEY_LEADER_JWW_YELU_DASHI_PEDIA',	'TXT_KEY_CIVILOPEDIA_LEADERS_JWW_YELU_DASHI',	'YeluDashiScene.xml',	4,						6,						3,							7,			5,				7,				5,						4,						7,						3,				5,			3,			4,				7,			5,			0,				'JWW_QARA_KHITAI_COLOR_ATLAS');

INSERT INTO Leader_MajorCivApproachBiases
		(LeaderType,				MajorCivApproachType,			Bias)
VALUES	('LEADER_JWW_YELU_DASHI',	'MAJOR_CIV_APPROACH_WAR',		8),
		('LEADER_JWW_YELU_DASHI',	'MAJOR_CIV_APPROACH_HOSTILE',	8),
		('LEADER_JWW_YELU_DASHI',	'MAJOR_CIV_APPROACH_DECEPTIVE',	5),
		('LEADER_JWW_YELU_DASHI',	'MAJOR_CIV_APPROACH_GUARDED',	8),
		('LEADER_JWW_YELU_DASHI',	'MAJOR_CIV_APPROACH_AFRAID',	3),
		('LEADER_JWW_YELU_DASHI',	'MAJOR_CIV_APPROACH_FRIENDLY',	2),
		('LEADER_JWW_YELU_DASHI',	'MAJOR_CIV_APPROACH_NEUTRAL',	2);

INSERT INTO Leader_MinorCivApproachBiases
		(LeaderType,				MinorCivApproachType,				Bias)
VALUES	('LEADER_JWW_YELU_DASHI',	'MINOR_CIV_APPROACH_IGNORE',		3),
		('LEADER_JWW_YELU_DASHI',	'MINOR_CIV_APPROACH_FRIENDLY',		3),
		('LEADER_JWW_YELU_DASHI',	'MINOR_CIV_APPROACH_PROTECTIVE',	5),
		('LEADER_JWW_YELU_DASHI',	'MINOR_CIV_APPROACH_CONQUEST',		8),
		('LEADER_JWW_YELU_DASHI',	'MINOR_CIV_APPROACH_BULLY',			5);

INSERT INTO	Leader_Flavors
		(LeaderType,				FlavorType,							Flavor)
VALUES	('LEADER_JWW_YELU_DASHI',	'FLAVOR_OFFENSE',					8),
		('LEADER_JWW_YELU_DASHI',	'FLAVOR_DEFENSE',					3),
		('LEADER_JWW_YELU_DASHI',	'FLAVOR_CITY_DEFENSE',				4),
		('LEADER_JWW_YELU_DASHI',	'FLAVOR_MILITARY_TRAINING',			8),
		('LEADER_JWW_YELU_DASHI',	'FLAVOR_RECON',						6),
		('LEADER_JWW_YELU_DASHI',	'FLAVOR_RANGED',					5),
		('LEADER_JWW_YELU_DASHI',	'FLAVOR_MOBILE',					9),
		('LEADER_JWW_YELU_DASHI',	'FLAVOR_NAVAL',						1),
		('LEADER_JWW_YELU_DASHI',	'FLAVOR_NAVAL_RECON',				1),
		('LEADER_JWW_YELU_DASHI',	'FLAVOR_NAVAL_GROWTH',				2),
		('LEADER_JWW_YELU_DASHI',	'FLAVOR_NAVAL_TILE_IMPROVEMENT',	2),
		('LEADER_JWW_YELU_DASHI',	'FLAVOR_AIR',						5),
		('LEADER_JWW_YELU_DASHI',	'FLAVOR_EXPANSION',					7),
		('LEADER_JWW_YELU_DASHI',	'FLAVOR_GROWTH',					3),
		('LEADER_JWW_YELU_DASHI',	'FLAVOR_TILE_IMPROVEMENT',			3),
		('LEADER_JWW_YELU_DASHI',	'FLAVOR_INFRASTRUCTURE',			4),
		('LEADER_JWW_YELU_DASHI',	'FLAVOR_PRODUCTION',				5),
		('LEADER_JWW_YELU_DASHI',	'FLAVOR_GOLD',						8),
		('LEADER_JWW_YELU_DASHI',	'FLAVOR_SCIENCE',					2),
		('LEADER_JWW_YELU_DASHI',	'FLAVOR_CULTURE',					7),
		('LEADER_JWW_YELU_DASHI',	'FLAVOR_HAPPINESS',					5),
		('LEADER_JWW_YELU_DASHI',	'FLAVOR_GREAT_PEOPLE',				9),
		('LEADER_JWW_YELU_DASHI',	'FLAVOR_WONDER',					5),
		('LEADER_JWW_YELU_DASHI',	'FLAVOR_RELIGION',					3),
		('LEADER_JWW_YELU_DASHI',	'FLAVOR_DIPLOMACY',					5),
		('LEADER_JWW_YELU_DASHI',	'FLAVOR_SPACESHIP',					2),
		('LEADER_JWW_YELU_DASHI',	'FLAVOR_WATER_CONNECTION',			1),
		('LEADER_JWW_YELU_DASHI',	'FLAVOR_NUKE',						6),
		('LEADER_JWW_YELU_DASHI',	'FLAVOR_USE_NUKE',					7),
		('LEADER_JWW_YELU_DASHI',	'FLAVOR_ESPIONAGE',					8),
		('LEADER_JWW_YELU_DASHI',	'FLAVOR_ANTIAIR',					5),
		('LEADER_JWW_YELU_DASHI',	'FLAVOR_AIR_CARRIER',				1),
		('LEADER_JWW_YELU_DASHI',	'FLAVOR_ARCHAEOLOGY',				8),
		('LEADER_JWW_YELU_DASHI',	'FLAVOR_I_LAND_TRADE_ROUTE',		9),
		('LEADER_JWW_YELU_DASHI',	'FLAVOR_I_SEA_TRADE_ROUTE',			1),
		('LEADER_JWW_YELU_DASHI',	'FLAVOR_I_TRADE_ORIGIN',			9),
		('LEADER_JWW_YELU_DASHI',	'FLAVOR_I_TRADE_DESTINATION',		5),
		('LEADER_JWW_YELU_DASHI',	'FLAVOR_AIRLIFT',					7);

INSERT INTO Leader_Traits
		(LeaderType,				TraitType)
VALUES	('LEADER_JWW_YELU_DASHI',	'TRAIT_JWW_BATTLE_OF_QATWAN');
-------------------------------------------
--Trait (Battle of Qatwan)
-------------------------------------------
INSERT INTO Traits
		(Type,						Description,						ShortDescription)
VALUES	('TRAIT_JWW_BATTLE_OF_QATWAN',	'TXT_KEY_TRAIT_JWW_BATTLE_OF_QATWAN',	'TXT_KEY_TRAIT_JWW_BATTLE_OF_QATWAN_SHORT');

INSERT INTO BuildingClasses
		(Type, 										DefaultBuilding, 					Description)
VALUES	('BUILDINGCLASS_JWW_QARA_KHITAI_UA', 		'BUILDING_JWW_QARA_KHITAI_UA', 		'TXT_KEY_BUILDING_JWW_QARA_KHITAI_UA');

INSERT INTO Buildings		
		(Type, 								BuildingClass,								Cost,	FaithCost,	GreatWorkCount,	Happiness,	NeverCapture,	Description)
VALUES	('BUILDING_JWW_QARA_KHITAI_UA',		'BUILDINGCLASS_JWW_QARA_KHITAI_UA',			-1,		-1,			-1,				1,			1,				'TXT_KEY_BUILDING_JWW_QARA_KHITAI_UA');

INSERT INTO Building_YieldChanges
		(BuildingType,					YieldType,			Yield)
VALUES	('BUILDING_JWW_QARA_KHITAI_UA',	'YIELD_GOLD',		2),
		('BUILDING_JWW_QARA_KHITAI_UA',	'YIELD_CULTURE',	2);
-------------------------------------------
--Diplomacy Responses
-------------------------------------------
INSERT INTO Diplomacy_Responses
		(LeaderType,					ResponseType,									 Response,																		Bias)
VALUES	('LEADER_JWW_YELU_DASHI',     'RESPONSE_ATTACKED_HOSTILE',                     'TXT_KEY_LEADER_JWW_YELU_DASHI_ATTACKED_GENERIC%',						500),
		('LEADER_JWW_YELU_DASHI',     'RESPONSE_DEFEATED',                             'TXT_KEY_LEADER_JWW_YELU_DASHI_DEFEATED%',								500),
		('LEADER_JWW_YELU_DASHI',     'RESPONSE_DOW_GENERIC',                          'TXT_KEY_LEADER_JWW_YELU_DASHI_DOW_GENERIC%',							500),
		('LEADER_JWW_YELU_DASHI',     'RESPONSE_EXPANSION_SERIOUS_WARNING',            'TXT_KEY_LEADER_JWW_YELU_DASHI_EXPANSION_SERIOUS_WARNING%',				500),
		('LEADER_JWW_YELU_DASHI',     'RESPONSE_FIRST_GREETING',                       'TXT_KEY_LEADER_JWW_YELU_DASHI_FIRSTGREETING%',							500),
		('LEADER_JWW_YELU_DASHI',     'RESPONSE_GREETING_AT_WAR_HOSTILE',			  'TXT_KEY_LEADER_JWW_YELU_DASHI_GREETING_AT_WAR_HOSTILE%',				500),
		('LEADER_JWW_YELU_DASHI',     'RESPONSE_GREETING_POLITE_HELLO',                'TXT_KEY_LEADER_JWW_YELU_DASHI_GREETING_POLITE_HELLO%',					500),
		('LEADER_JWW_YELU_DASHI',     'RESPONSE_GREETING_NEUTRAL_HELLO',               'TXT_KEY_LEADER_JWW_YELU_DASHI_GREETING_NEUTRAL_HELLO%',					500),
		('LEADER_JWW_YELU_DASHI',     'RESPONSE_GREETING_HOSTILE_HELLO',               'TXT_KEY_LEADER_JWW_YELU_DASHI_GREETING_HOSTILE_HELLO%',					500),
		('LEADER_JWW_YELU_DASHI',     'RESPONSE_HOSTILE_AGGRESSIVE_MILITARY_WARNING',  'TXT_KEY_LEADER_JWW_YELU_DASHI_HOSTILE_AGGRESSIVE_MILITARY_WARNING%',	500),
		('LEADER_JWW_YELU_DASHI',     'RESPONSE_INFLUENTIAL_ON_AI',                    'TXT_KEY_LEADER_JWW_YELU_DASHI_INFLUENTIAL_ON_AI%',						500),
		('LEADER_JWW_YELU_DASHI',     'RESPONSE_INFLUENTIAL_ON_HUMAN',                 'TXT_KEY_LEADER_JWW_YELU_DASHI_INFLUENTIAL_ON_HUMAN%',					500),	
		('LEADER_JWW_YELU_DASHI',     'RESPONSE_LETS_HEAR_IT',                         'TXT_KEY_LEADER_JWW_YELU_DASHI_LETS_HEAR_IT%',							500),
		('LEADER_JWW_YELU_DASHI',     'RESPONSE_LUXURY_TRADE',                         'TXT_KEY_LEADER_JWW_YELU_DASHI_LUXURY_TRADE%',							500),
		('LEADER_JWW_YELU_DASHI',     'RESPONSE_NO_PEACE',                             'TXT_KEY_LEADER_JWW_YELU_DASHI_NO_PEACE%',								500),
		('LEADER_JWW_YELU_DASHI',     'RESPONSE_OPEN_BORDERS_EXCHANGE',                'TXT_KEY_LEADER_JWW_YELU_DASHI_OPEN_BORDERS_EXCHANGE%',					500),
		('LEADER_JWW_YELU_DASHI',     'RESPONSE_PEACE_MADE_BY_HUMAN_GRACIOUS',         'TXT_KEY_LEADER_JWW_YELU_DASHI_LOSEWAR%',								500),
		('LEADER_JWW_YELU_DASHI',     'RESPONSE_REPEAT_NO',                            'TXT_KEY_LEADER_JWW_YELU_DASHI_REPEAT_NO%',								500),
		('LEADER_JWW_YELU_DASHI',     'RESPONSE_RESPONSE_REQUEST',                     'TXT_KEY_LEADER_JWW_YELU_DASHI_RESPONSE_REQUEST%',						500),
		('LEADER_JWW_YELU_DASHI',     'RESPONSE_RESPONSE_TO_BEING_DENOUNCED',		     'TXT_KEY_LEADER_JWW_YELU_DASHI_RESPONSE_TO_BEING_DENOUNCED%',			500),
		('LEADER_JWW_YELU_DASHI',     'RESPONSE_TOO_SOON_NO_PEACE',                    'TXT_KEY_LEADER_JWW_YELU_DASHI_TOO_SOON_NO_PEACE_1%',					500),
		('LEADER_JWW_YELU_DASHI',     'RESPONSE_WINNER_PEACE_OFFER',                   'TXT_KEY_LEADER_JWW_YELU_DASHI_WINWAR%',									500),
		('LEADER_JWW_YELU_DASHI',     'RESPONSE_WORK_AGAINST_SOMEONE',                 'TXT_KEY_LEADER_JWW_YELU_DASHI_DENOUNCE%',								500),
		('LEADER_JWW_YELU_DASHI',     'RESPONSE_WORK_WITH_US',                         'TXT_KEY_LEADER_JWW_YELU_DASHI_DEC_FRIENDSHIP%',							500);
-------------------------------------------
--Civilization (Qara Khitai)
-------------------------------------------
INSERT INTO Civilizations
		(Type,								Description,						CivilopediaTag,						Playable,	AIPlayable,		ShortDescription,								Adjective,									DefaultPlayerColor,					ArtDefineTag,					ArtStyleType,			ArtStyleSuffix,		ArtStylePrefix,		PortraitIndex,		IconAtlas,						AlphaIconAtlas,					MapImage,				DawnOfManQuote,								DawnOfManImage,		SoundtrackTag)
VALUES	('CIVILIZATION_JWW_QARA_KHITAI',	'TXT_KEY_CIV_JWW_QARA_KHITAI_DESC',	'TXT_KEY_CIV5_JWW_QARA_KHITAI',		1,			1,				'TXT_KEY_CIV_JWW_QARA_KHITAI_SHORT_DESC',		'TXT_KEY_CIV_JWW_QARA_KHITAI_ADJECTIVE',	'PLAYERCOLOR_JWW_QARA_KHITAI',		'ART_DEF_CIVILIZATION_RUSSIA',	'ARTSTYLE_ASIAN',		'_ASIA',			'ASIA',				1,					'JWW_QARA_KHITAI_COLOR_ATLAS',	'JWW_QARA_KHITAI_ALPHA_ATLAS',	'JWWQaraKhitaiMap.dds',	'TXT_KEY_CIV5_DAWN_JWW_QARA_KHITAI_TEXT',	'YeluDashiDoM.dds',	'Mongolia');

INSERT INTO Civilization_Leaders
		(CivilizationType,					LeaderheadType)
VALUES	('CIVILIZATION_JWW_QARA_KHITAI',	'LEADER_JWW_YELU_DASHI');

INSERT INTO Civilization_UnitClassOverrides
		(CivilizationType,					UnitClassType,			UnitType)
VALUES	('CIVILIZATION_JWW_QARA_KHITAI',	'UNITCLASS_KNIGHT',		'UNIT_JWW_ORDO_CAVALRYMAN'),
		('CIVILIZATION_JWW_QARA_KHITAI',	'UNITCLASS_MERCHANT',	'UNIT_JWW_SHAOJIAN');

INSERT INTO Civilization_FreeBuildingClasses
		(CivilizationType,					BuildingClassType)
VALUES	('CIVILIZATION_JWW_QARA_KHITAI',	'BUILDINGCLASS_PALACE');

INSERT INTO Civilization_FreeTechs
		(CivilizationType,					TechType)
VALUES	('CIVILIZATION_JWW_QARA_KHITAI',	'TECH_AGRICULTURE');

INSERT INTO Civilization_FreeUnits
		(CivilizationType,					UnitClassType,			UnitAIType,			Count)
VALUES	('CIVILIZATION_JWW_QARA_KHITAI',	'UNITCLASS_SETTLER',	'UNITAI_SETTLE',	1);

INSERT INTO Civilization_Start_Region_Priority
		(CivilizationType,					RegionType)
VALUES	('CIVILIZATION_JWW_QARA_KHITAI',	'REGION_GRASS');

INSERT INTO Civilization_Religions
		(CivilizationType,					ReligionType)
VALUES	('CIVILIZATION_JWW_QARA_KHITAI',	'RELIGION_BUDDHISM');

INSERT INTO	Civilization_CityNames
		(CivilizationType,				CityName)
VALUES	('CIVILIZATION_JWW_QARA_KHITAI',	'TXT_KEY_CITY_NAME_JWW_QARA_KHITAI_0'),
		('CIVILIZATION_JWW_QARA_KHITAI',	'TXT_KEY_CITY_NAME_JWW_QARA_KHITAI_1'),
		('CIVILIZATION_JWW_QARA_KHITAI',	'TXT_KEY_CITY_NAME_JWW_QARA_KHITAI_2'),
		('CIVILIZATION_JWW_QARA_KHITAI',	'TXT_KEY_CITY_NAME_JWW_QARA_KHITAI_3'),
		('CIVILIZATION_JWW_QARA_KHITAI',	'TXT_KEY_CITY_NAME_JWW_QARA_KHITAI_4'),
		('CIVILIZATION_JWW_QARA_KHITAI',	'TXT_KEY_CITY_NAME_JWW_QARA_KHITAI_5'),
		('CIVILIZATION_JWW_QARA_KHITAI',	'TXT_KEY_CITY_NAME_JWW_QARA_KHITAI_6'),
		('CIVILIZATION_JWW_QARA_KHITAI',	'TXT_KEY_CITY_NAME_JWW_QARA_KHITAI_7'),
		('CIVILIZATION_JWW_QARA_KHITAI',	'TXT_KEY_CITY_NAME_JWW_QARA_KHITAI_8'),
		('CIVILIZATION_JWW_QARA_KHITAI',	'TXT_KEY_CITY_NAME_JWW_QARA_KHITAI_9'),
		('CIVILIZATION_JWW_QARA_KHITAI',	'TXT_KEY_CITY_NAME_JWW_QARA_KHITAI_10'),
		('CIVILIZATION_JWW_QARA_KHITAI',	'TXT_KEY_CITY_NAME_JWW_QARA_KHITAI_11'),
		('CIVILIZATION_JWW_QARA_KHITAI',	'TXT_KEY_CITY_NAME_JWW_QARA_KHITAI_12'),
		('CIVILIZATION_JWW_QARA_KHITAI',	'TXT_KEY_CITY_NAME_JWW_QARA_KHITAI_13'),
		('CIVILIZATION_JWW_QARA_KHITAI',	'TXT_KEY_CITY_NAME_JWW_QARA_KHITAI_14'),
		('CIVILIZATION_JWW_QARA_KHITAI',	'TXT_KEY_CITY_NAME_JWW_QARA_KHITAI_15'),
		('CIVILIZATION_JWW_QARA_KHITAI',	'TXT_KEY_CITY_NAME_JWW_QARA_KHITAI_16'),
		('CIVILIZATION_JWW_QARA_KHITAI',	'TXT_KEY_CITY_NAME_JWW_QARA_KHITAI_17'),
		('CIVILIZATION_JWW_QARA_KHITAI',	'TXT_KEY_CITY_NAME_JWW_QARA_KHITAI_18'),
		('CIVILIZATION_JWW_QARA_KHITAI',	'TXT_KEY_CITY_NAME_JWW_QARA_KHITAI_19'),
		('CIVILIZATION_JWW_QARA_KHITAI',	'TXT_KEY_CITY_NAME_JWW_QARA_KHITAI_20'),
		('CIVILIZATION_JWW_QARA_KHITAI',	'TXT_KEY_CITY_NAME_JWW_QARA_KHITAI_21'),
		('CIVILIZATION_JWW_QARA_KHITAI',	'TXT_KEY_CITY_NAME_JWW_QARA_KHITAI_22'),
		('CIVILIZATION_JWW_QARA_KHITAI',	'TXT_KEY_CITY_NAME_JWW_QARA_KHITAI_23'),
		('CIVILIZATION_JWW_QARA_KHITAI',	'TXT_KEY_CITY_NAME_JWW_QARA_KHITAI_24'),
		('CIVILIZATION_JWW_QARA_KHITAI',	'TXT_KEY_CITY_NAME_JWW_QARA_KHITAI_25'),
		('CIVILIZATION_JWW_QARA_KHITAI',	'TXT_KEY_CITY_NAME_JWW_QARA_KHITAI_26'),
		('CIVILIZATION_JWW_QARA_KHITAI',	'TXT_KEY_CITY_NAME_JWW_QARA_KHITAI_27'),
		('CIVILIZATION_JWW_QARA_KHITAI',	'TXT_KEY_CITY_NAME_JWW_QARA_KHITAI_28'),
		('CIVILIZATION_JWW_QARA_KHITAI',	'TXT_KEY_CITY_NAME_JWW_QARA_KHITAI_29'),
		('CIVILIZATION_JWW_QARA_KHITAI',	'TXT_KEY_CITY_NAME_JWW_QARA_KHITAI_30'),
		('CIVILIZATION_JWW_QARA_KHITAI',	'TXT_KEY_CITY_NAME_JWW_QARA_KHITAI_31'),
		('CIVILIZATION_JWW_QARA_KHITAI',	'TXT_KEY_CITY_NAME_JWW_QARA_KHITAI_32'),
		('CIVILIZATION_JWW_QARA_KHITAI',	'TXT_KEY_CITY_NAME_JWW_QARA_KHITAI_33'),
		('CIVILIZATION_JWW_QARA_KHITAI',	'TXT_KEY_CITY_NAME_JWW_QARA_KHITAI_34'),
		('CIVILIZATION_JWW_QARA_KHITAI',	'TXT_KEY_CITY_NAME_JWW_QARA_KHITAI_35');
		
INSERT INTO Civilization_SpyNames
		(CivilizationType,						SpyName)
VALUES	('CIVILIZATION_JWW_QARA_KHITAI',		'TXT_KEY_SPY_NAME_JWW_QARA_KHITAI_0'),
		('CIVILIZATION_JWW_QARA_KHITAI',		'TXT_KEY_SPY_NAME_JWW_QARA_KHITAI_1'),
		('CIVILIZATION_JWW_QARA_KHITAI',		'TXT_KEY_SPY_NAME_JWW_QARA_KHITAI_2'),
		('CIVILIZATION_JWW_QARA_KHITAI',		'TXT_KEY_SPY_NAME_JWW_QARA_KHITAI_3'),
		('CIVILIZATION_JWW_QARA_KHITAI',		'TXT_KEY_SPY_NAME_JWW_QARA_KHITAI_4'),
		('CIVILIZATION_JWW_QARA_KHITAI',		'TXT_KEY_SPY_NAME_JWW_QARA_KHITAI_5'),
		('CIVILIZATION_JWW_QARA_KHITAI',		'TXT_KEY_SPY_NAME_JWW_QARA_KHITAI_6'),
		('CIVILIZATION_JWW_QARA_KHITAI',		'TXT_KEY_SPY_NAME_JWW_QARA_KHITAI_7'),
		('CIVILIZATION_JWW_QARA_KHITAI',		'TXT_KEY_SPY_NAME_JWW_QARA_KHITAI_8'),
		('CIVILIZATION_JWW_QARA_KHITAI',		'TXT_KEY_SPY_NAME_JWW_QARA_KHITAI_9');
--============================================	
--============================================
