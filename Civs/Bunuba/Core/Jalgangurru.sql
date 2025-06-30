INSERT INTO Units 	
		(Type, 							Class, Cost, Moves, Capture, CivilianAttackPriority, Special, Domain, DefaultUnitAI,		Description, 				Civilopedia, 					Help, 							Strategy,							AdvancedStartCost,	WorkRate, CombatLimit, FoundReligion, SpreadReligion, ReligionSpreads, ReligiousStrength, UnitArtInfoEraVariation,	UnitArtInfo, 				UnitFlagIconOffset,	UnitFlagAtlas,					MoveRate, PortraitIndex, IconAtlas)
SELECT	'UNIT_SENSHI_JALGANGURRU',		Class, Cost, Moves, Capture, CivilianAttackPriority, Special, Domain, DefaultUnitAI,		'TXT_KEY_UNIT_SENSHI_JALGANGURRU', 	'TXT_KEY_CIV5_UNIT_SENSHI_JALGANGURRU_TEXT', 	'TXT_KEY_UNIT_SENSHI_JALGANGURRU_HELP',  'TXT_KEY_UNIT_SENSHI_JALGANGURRU_STRATEGY',	AdvancedStartCost, 	WorkRate, CombatLimit, FoundReligion, SpreadReligion, ReligionSpreads, ReligiousStrength, 0,						'ART_DEF_UNIT_SENSHI_JALGANGURRU',   0,					'SENSHI_JALGANGURRU_FLAG',	MoveRate, 3, 			 'SENSHI_BUNUBA_ATLAS'
FROM Units WHERE Type = 'UNIT_PROPHET';	
------------------------------
-- UnitGameplay2DScripts
------------------------------
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 						SelectionSound, FirstSelectionSound)
SELECT	'UNIT_SENSHI_JALGANGURRU',		SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_PROPHET';
------------------------------
-- Unit_AITypes
------------------------------
INSERT INTO Unit_AITypes 	
		(UnitType, 					UnitAIType)
SELECT	'UNIT_SENSHI_JALGANGURRU', 		UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_PROPHET';
------------------------------
-- Unit_Flavors
------------------------------
INSERT INTO Unit_Flavors 	
		(UnitType, 					FlavorType, Flavor)
SELECT	'UNIT_SENSHI_JALGANGURRU', 		FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_PROPHET';
------------------------------
-- Unit_Builds
------------------------------
INSERT INTO Unit_Builds 	
		(UnitType, 					BuildType)
SELECT	'UNIT_SENSHI_JALGANGURRU',		BuildType
FROM Unit_Builds WHERE UnitType = 'UNIT_PROPHET';
------------------------------
-- Unit_FreePromotions
------------------------------
INSERT INTO Unit_FreePromotions 	
		(UnitType, 					PromotionType)
SELECT	'UNIT_SENSHI_JALGANGURRU',		PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_PROPHET';