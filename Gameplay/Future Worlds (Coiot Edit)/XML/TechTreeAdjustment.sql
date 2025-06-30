-- Do NOT use XML/SQL to relocate TECH_FUTURE_TECH
-- Shift all our modified techs relative to where we EXPECT TECH_FUTURE_TECH to be
UPDATE Technologies
SET
	GridX = GridX + (
		SELECT
			GridX
		FROM
			Technologies
		WHERE
			Type = 'TECH_FUTURE_TECH'
	) - 17
WHERE
	Type IN ('TECH_ENVIRONMENTALISM', 'TECH_CLONING', 'TECH_GEN_MANIP', 'TECH_MEMETICS', 'TECH_GRID_COMPUTING', 'TECH_TRANSGENICS', 'TECH_AUTONOMOUS_SYSTEMS', 'TECH_NANOMATERIALS', 'TECH_SUPERCONDUCTIVITY', 'TECH_ARTIFICIAL_ENVIRONMENTS', 'TECH_ECOSOPHY', 'TECH_IMPLANTS', 'TECH_NEURAL_INTERFACE', 'TECH_COGNITIVE_TECH', 'TECH_QUANTUM_COMPUTERS', 'TECH_ORBITAL_DEV', 'TECH_GENGINEERING', 'TECH_BIOMODIFICATION', 'TECH_CYBERNETICS', 'TECH_AI', 'TECH_ADAMANTIUM', 'TECH_ARCOLOGIES', 'TECH_TERRAFORMING', 'TECH_HOMO_SUPERIOR', 'TECH_DIGITAL_SOCIETY', 'TECH_SMART_MATERIALS', 'TECH_HYPERSTRUCTURES', 'TECH_ENERGY_THEORY', 'TECH_HUMAN_AUGMENTATION', 'TECH_COMPUTRONIUM', 'TECH_SPACE_COLONIZATION', 'TECH_NANOTECHNOLOGY', 'TECH_NUCLEAR_FUSION');

-- Now shift TECH_FUTURE_TECH to the end of the tree
UPDATE Technologies
SET
	GridX = (
		SELECT
			GridX
		FROM
			Technologies
		ORDER BY
			GridX DESC
		LIMIT
			1
	) + 1
WHERE
	Type = 'TECH_FUTURE_TECH';

DELETE FROM Technology_PrereqTechs
WHERE
	TechType LIKE ('TECH_EE_%')
	OR PrereqTech LIKE ('TECH_EE_%');

INSERT INTO
	Technology_PrereqTechs (TechType, PrereqTech)
SELECT
	'TECH_EE_EXPLORATION',
	'TECH_ASTRONOMY'
WHERE
	EXISTS (
		SELECT
			Type
		FROM
			Technologies
		WHERE
			Type = 'TECH_EE_EXPLORATION'
	);

INSERT INTO
	Technology_PrereqTechs (TechType, PrereqTech)
SELECT
	'TECH_EE_SOVEREIGNTY',
	'TECH_BANKING'
WHERE
	EXISTS (
		SELECT
			Type
		FROM
			Technologies
		WHERE
			Type = 'TECH_EE_EXPLORATION'
	);

INSERT INTO
	Technology_PrereqTechs (TechType, PrereqTech)
SELECT
	'TECH_EE_HUMANISM',
	'TECH_BANKING'
WHERE
	EXISTS (
		SELECT
			Type
		FROM
			Technologies
		WHERE
			Type = 'TECH_EE_EXPLORATION'
	);

INSERT INTO
	Technology_PrereqTechs (TechType, PrereqTech)
SELECT
	'TECH_EE_HUMANISM',
	'TECH_PRINTING_PRESS'
WHERE
	EXISTS (
		SELECT
			Type
		FROM
			Technologies
		WHERE
			Type = 'TECH_EE_EXPLORATION'
	);

INSERT INTO
	Technology_PrereqTechs (TechType, PrereqTech)
SELECT
	'TECH_NAVIGATION',
	'TECH_EE_EXPLORATION'
WHERE
	EXISTS (
		SELECT
			Type
		FROM
			Technologies
		WHERE
			Type = 'TECH_EE_EXPLORATION'
	);

INSERT INTO
	Technology_PrereqTechs (TechType, PrereqTech)
SELECT
	'TECH_EE_IMPERIALISM',
	'TECH_EE_EXPLORATION'
WHERE
	EXISTS (
		SELECT
			Type
		FROM
			Technologies
		WHERE
			Type = 'TECH_EE_EXPLORATION'
	);

INSERT INTO
	Technology_PrereqTechs (TechType, PrereqTech)
SELECT
	'TECH_EE_IMPERIALISM',
	'TECH_ARCHITECTURE'
WHERE
	EXISTS (
		SELECT
			Type
		FROM
			Technologies
		WHERE
			Type = 'TECH_EE_EXPLORATION'
	);

INSERT INTO
	Technology_PrereqTechs (TechType, PrereqTech)
SELECT
	'TECH_EE_IMPERIALISM',
	'TECH_EE_SOVEREIGNTY'
WHERE
	EXISTS (
		SELECT
			Type
		FROM
			Technologies
		WHERE
			Type = 'TECH_EE_EXPLORATION'
	);

INSERT INTO
	Technology_PrereqTechs (TechType, PrereqTech)
SELECT
	'TECH_ECONOMICS',
	'TECH_EE_SOVEREIGNTY'
WHERE
	EXISTS (
		SELECT
			Type
		FROM
			Technologies
		WHERE
			Type = 'TECH_EE_EXPLORATION'
	);

INSERT INTO
	Technology_PrereqTechs (TechType, PrereqTech)
SELECT
	'TECH_ECONOMICS',
	'TECH_EE_HUMANISM'
WHERE
	EXISTS (
		SELECT
			Type
		FROM
			Technologies
		WHERE
			Type = 'TECH_EE_EXPLORATION'
	);

INSERT INTO
	Technology_PrereqTechs (TechType, PrereqTech)
SELECT
	'TECH_EE_NATURAL_HISTORY',
	'TECH_EE_HUMANISM'
WHERE
	EXISTS (
		SELECT
			Type
		FROM
			Technologies
		WHERE
			Type = 'TECH_EE_EXPLORATION'
	);

INSERT INTO
	Technology_PrereqTechs (TechType, PrereqTech)
SELECT
	'TECH_EE_FLINTLOCK',
	'TECH_METALLURGY'
WHERE
	EXISTS (
		SELECT
			Type
		FROM
			Technologies
		WHERE
			Type = 'TECH_EE_EXPLORATION'
	);

INSERT INTO
	Technology_PrereqTechs (TechType, PrereqTech)
SELECT
	'TECH_EE_FLINTLOCK',
	'TECH_CHEMISTRY'
WHERE
	EXISTS (
		SELECT
			Type
		FROM
			Technologies
		WHERE
			Type = 'TECH_EE_EXPLORATION'
	);

INSERT INTO
	Technology_PrereqTechs (TechType, PrereqTech)
SELECT
	'TECH_EE_WARSHIPS',
	'TECH_NAVIGATION'
WHERE
	EXISTS (
		SELECT
			Type
		FROM
			Technologies
		WHERE
			Type = 'TECH_EE_EXPLORATION'
	);

INSERT INTO
	Technology_PrereqTechs (TechType, PrereqTech)
SELECT
	'TECH_EE_WARSHIPS',
	'TECH_EE_IMPERIALISM'
WHERE
	EXISTS (
		SELECT
			Type
		FROM
			Technologies
		WHERE
			Type = 'TECH_EE_EXPLORATION'
	);

INSERT INTO
	Technology_PrereqTechs (TechType, PrereqTech)
SELECT
	'TECH_EE_MANUFACTURING',
	'TECH_EE_IMPERIALISM'
WHERE
	EXISTS (
		SELECT
			Type
		FROM
			Technologies
		WHERE
			Type = 'TECH_EE_EXPLORATION'
	);

INSERT INTO
	Technology_PrereqTechs (TechType, PrereqTech)
SELECT
	'TECH_EE_MANUFACTURING',
	'TECH_ECONOMICS'
WHERE
	EXISTS (
		SELECT
			Type
		FROM
			Technologies
		WHERE
			Type = 'TECH_EE_EXPLORATION'
	);

INSERT INTO
	Technology_PrereqTechs (TechType, PrereqTech)
SELECT
	'TECH_SCIENTIFIC_THEORY',
	'TECH_EE_NATURAL_HISTORY'
WHERE
	EXISTS (
		SELECT
			Type
		FROM
			Technologies
		WHERE
			Type = 'TECH_EE_EXPLORATION'
	);

INSERT INTO
	Technology_PrereqTechs (TechType, PrereqTech)
SELECT
	'TECH_FERTILIZER',
	'TECH_EE_NATURAL_HISTORY'
WHERE
	EXISTS (
		SELECT
			Type
		FROM
			Technologies
		WHERE
			Type = 'TECH_EE_EXPLORATION'
	);

INSERT INTO
	Technology_PrereqTechs (TechType, PrereqTech)
SELECT
	'TECH_FERTILIZER',
	'TECH_EE_FLINTLOCK'
WHERE
	EXISTS (
		SELECT
			Type
		FROM
			Technologies
		WHERE
			Type = 'TECH_EE_EXPLORATION'
	);

INSERT INTO
	Technology_PrereqTechs (TechType, PrereqTech)
SELECT
	'TECH_EE_FORTIFICATION',
	'TECH_EE_FLINTLOCK'
WHERE
	EXISTS (
		SELECT
			Type
		FROM
			Technologies
		WHERE
			Type = 'TECH_EE_EXPLORATION'
	);

INSERT INTO
	Technology_PrereqTechs (TechType, PrereqTech)
SELECT
	'TECH_EE_ARMOUR_PLATING',
	'TECH_EE_WARSHIPS'
WHERE
	EXISTS (
		SELECT
			Type
		FROM
			Technologies
		WHERE
			Type = 'TECH_EE_EXPLORATION'
	);

INSERT INTO
	Technology_PrereqTechs (TechType, PrereqTech)
SELECT
	'TECH_EE_ARMOUR_PLATING',
	'TECH_EE_MANUFACTURING'
WHERE
	EXISTS (
		SELECT
			Type
		FROM
			Technologies
		WHERE
			Type = 'TECH_EE_EXPLORATION'
	);

INSERT INTO
	Technology_PrereqTechs (TechType, PrereqTech)
SELECT
	'TECH_EE_ROMANTICISM',
	'TECH_EE_MANUFACTURING'
WHERE
	EXISTS (
		SELECT
			Type
		FROM
			Technologies
		WHERE
			Type = 'TECH_EE_EXPLORATION'
	);

INSERT INTO
	Technology_PrereqTechs (TechType, PrereqTech)
SELECT
	'TECH_INDUSTRIALIZATION',
	'TECH_EE_MANUFACTURING'
WHERE
	EXISTS (
		SELECT
			Type
		FROM
			Technologies
		WHERE
			Type = 'TECH_EE_EXPLORATION'
	);

INSERT INTO
	Technology_PrereqTechs (TechType, PrereqTech)
SELECT
	'TECH_RIFLING',
	'TECH_EE_FORTIFICATION'
WHERE
	EXISTS (
		SELECT
			Type
		FROM
			Technologies
		WHERE
			Type = 'TECH_EE_EXPLORATION'
	);

INSERT INTO
	Technology_PrereqTechs (TechType, PrereqTech)
SELECT
	'TECH_MILITARY_SCIENCE',
	'TECH_EE_FORTIFICATION'
WHERE
	EXISTS (
		SELECT
			Type
		FROM
			Technologies
		WHERE
			Type = 'TECH_EE_EXPLORATION'
	);

INSERT INTO
	Technology_PrereqTechs (TechType, PrereqTech)
SELECT
	'TECH_STEAM_POWER',
	'TECH_EE_ARMOUR_PLATING'
WHERE
	EXISTS (
		SELECT
			Type
		FROM
			Technologies
		WHERE
			Type = 'TECH_EE_EXPLORATION'
	);

INSERT INTO
	Technology_PrereqTechs (TechType, PrereqTech)
SELECT
	'TECH_ELECTRICITY',
	'TECH_EE_ARMOUR_PLATING'
WHERE
	EXISTS (
		SELECT
			Type
		FROM
			Technologies
		WHERE
			Type = 'TECH_EE_EXPLORATION'
	);

INSERT INTO
	Technology_PrereqTechs (TechType, PrereqTech)
SELECT
	'TECH_ELECTRICITY',
	'TECH_EE_ROMANTICISM'
WHERE
	EXISTS (
		SELECT
			Type
		FROM
			Technologies
		WHERE
			Type = 'TECH_EE_EXPLORATION'
	);

CREATE TRIGGER FWTech_Technology_PrereqTechs_TechType AFTER INSERT ON Technology_PrereqTechs WHEN NEW.TechType LIKE ('TECH_EE_%') BEGIN
DELETE FROM Technology_PrereqTechs
WHERE
	TechType = NEW.TechType;

INSERT INTO
	Technology_PrereqTechs (TechType, PrereqTech)
SELECT
	'TECH_EE_EXPLORATION',
	'TECH_ASTRONOMY'
FROM
	Technologies
WHERE
	Type = NEW.TechType = 'TECH_EE_EXPLORATION'
	AND Type NOT IN (
		SELECT
			PrereqTech
		FROM
			Technology_PrereqTechs
		WHERE
			TechType = 'TECH_EE_EXPLORATION'
			AND PrereqTech = 'TECH_ASTRONOMY'
	);

INSERT INTO
	Technology_PrereqTechs (TechType, PrereqTech)
SELECT
	'TECH_EE_SOVEREIGNTY',
	'TECH_BANKING'
FROM
	Technologies
WHERE
	Type = NEW.TechType = 'TECH_EE_SOVEREIGNTY'
	AND Type NOT IN (
		SELECT
			PrereqTech
		FROM
			Technology_PrereqTechs
		WHERE
			TechType = 'TECH_EE_SOVEREIGNTY'
			AND PrereqTech = 'TECH_BANKING'
	);

INSERT INTO
	Technology_PrereqTechs (TechType, PrereqTech)
SELECT
	'TECH_EE_HUMANISM',
	'TECH_BANKING'
FROM
	Technologies
WHERE
	Type = NEW.TechType = 'TECH_EE_HUMANISM'
	AND Type NOT IN (
		SELECT
			PrereqTech
		FROM
			Technology_PrereqTechs
		WHERE
			TechType = 'TECH_EE_HUMANISM'
			AND PrereqTech = 'TECH_BANKING'
	);

INSERT INTO
	Technology_PrereqTechs (TechType, PrereqTech)
SELECT
	'TECH_EE_HUMANISM',
	'TECH_PRINTING_PRESS'
FROM
	Technologies
WHERE
	Type = NEW.TechType = 'TECH_EE_HUMANISM'
	AND Type NOT IN (
		SELECT
			PrereqTech
		FROM
			Technology_PrereqTechs
		WHERE
			TechType = 'TECH_EE_HUMANISM'
			AND PrereqTech = 'TECH_PRINTING_PRESS'
	);

INSERT INTO
	Technology_PrereqTechs (TechType, PrereqTech)
SELECT
	'TECH_EE_IMPERIALISM',
	'TECH_EE_EXPLORATION'
FROM
	Technologies
WHERE
	Type = NEW.TechType = 'TECH_EE_IMPERIALISM'
	AND Type NOT IN (
		SELECT
			PrereqTech
		FROM
			Technology_PrereqTechs
		WHERE
			TechType = 'TECH_EE_IMPERIALISM'
			AND PrereqTech = 'TECH_EE_EXPLORATION'
	);

INSERT INTO
	Technology_PrereqTechs (TechType, PrereqTech)
SELECT
	'TECH_EE_IMPERIALISM',
	'TECH_ARCHITECTURE'
FROM
	Technologies
WHERE
	Type = NEW.TechType = 'TECH_EE_IMPERIALISM'
	AND Type NOT IN (
		SELECT
			PrereqTech
		FROM
			Technology_PrereqTechs
		WHERE
			TechType = 'TECH_EE_IMPERIALISM'
			AND PrereqTech = 'TECH_ARCHITECTURE'
	);

INSERT INTO
	Technology_PrereqTechs (TechType, PrereqTech)
SELECT
	'TECH_EE_IMPERIALISM',
	'TECH_EE_SOVEREIGNTY'
FROM
	Technologies
WHERE
	Type = NEW.TechType = 'TECH_EE_IMPERIALISM'
	AND Type NOT IN (
		SELECT
			PrereqTech
		FROM
			Technology_PrereqTechs
		WHERE
			TechType = 'TECH_EE_IMPERIALISM'
			AND PrereqTech = 'TECH_EE_SOVEREIGNTY'
	);

INSERT INTO
	Technology_PrereqTechs (TechType, PrereqTech)
SELECT
	'TECH_EE_NATURAL_HISTORY',
	'TECH_EE_HUMANISM'
FROM
	Technologies
WHERE
	Type = NEW.TechType = 'TECH_EE_NATURAL_HISTORY'
	AND Type NOT IN (
		SELECT
			PrereqTech
		FROM
			Technology_PrereqTechs
		WHERE
			TechType = 'TECH_EE_NATURAL_HISTORY'
			AND PrereqTech = 'TECH_EE_HUMANISM'
	);

INSERT INTO
	Technology_PrereqTechs (TechType, PrereqTech)
SELECT
	'TECH_EE_FLINTLOCK',
	'TECH_METALLURGY'
FROM
	Technologies
WHERE
	Type = NEW.TechType = 'TECH_EE_FLINTLOCK'
	AND Type NOT IN (
		SELECT
			PrereqTech
		FROM
			Technology_PrereqTechs
		WHERE
			TechType = 'TECH_EE_FLINTLOCK'
			AND PrereqTech = 'TECH_METALLURGY'
	);

INSERT INTO
	Technology_PrereqTechs (TechType, PrereqTech)
SELECT
	'TECH_EE_FLINTLOCK',
	'TECH_CHEMISTRY'
FROM
	Technologies
WHERE
	Type = NEW.TechType = 'TECH_EE_FLINTLOCK'
	AND Type NOT IN (
		SELECT
			PrereqTech
		FROM
			Technology_PrereqTechs
		WHERE
			TechType = 'TECH_EE_FLINTLOCK'
			AND PrereqTech = 'TECH_CHEMISTRY'
	);

INSERT INTO
	Technology_PrereqTechs (TechType, PrereqTech)
SELECT
	'TECH_EE_WARSHIPS',
	'TECH_NAVIGATION'
FROM
	Technologies
WHERE
	Type = NEW.TechType = 'TECH_EE_WARSHIPS'
	AND Type NOT IN (
		SELECT
			PrereqTech
		FROM
			Technology_PrereqTechs
		WHERE
			TechType = 'TECH_EE_WARSHIPS'
			AND PrereqTech = 'TECH_NAVIGATION'
	);

INSERT INTO
	Technology_PrereqTechs (TechType, PrereqTech)
SELECT
	'TECH_EE_WARSHIPS',
	'TECH_EE_IMPERIALISM'
FROM
	Technologies
WHERE
	Type = NEW.TechType = 'TECH_EE_WARSHIPS'
	AND Type NOT IN (
		SELECT
			PrereqTech
		FROM
			Technology_PrereqTechs
		WHERE
			TechType = 'TECH_EE_WARSHIPS'
			AND PrereqTech = 'TECH_EE_IMPERIALISM'
	);

INSERT INTO
	Technology_PrereqTechs (TechType, PrereqTech)
SELECT
	'TECH_EE_MANUFACTURING',
	'TECH_EE_IMPERIALISM'
FROM
	Technologies
WHERE
	Type = NEW.TechType = 'TECH_EE_MANUFACTURING'
	AND Type NOT IN (
		SELECT
			PrereqTech
		FROM
			Technology_PrereqTechs
		WHERE
			TechType = 'TECH_EE_MANUFACTURING'
			AND PrereqTech = 'TECH_EE_IMPERIALISM'
	);

INSERT INTO
	Technology_PrereqTechs (TechType, PrereqTech)
SELECT
	'TECH_EE_MANUFACTURING',
	'TECH_ECONOMICS'
FROM
	Technologies
WHERE
	Type = NEW.TechType = 'TECH_EE_MANUFACTURING'
	AND Type NOT IN (
		SELECT
			PrereqTech
		FROM
			Technology_PrereqTechs
		WHERE
			TechType = 'TECH_EE_ROMANTICISM'
			AND PrereqTech = 'TECH_ECONOMICS'
	);

INSERT INTO
	Technology_PrereqTechs (TechType, PrereqTech)
SELECT
	'TECH_EE_FORTIFICATION',
	'TECH_EE_FLINTLOCK'
FROM
	Technologies
WHERE
	Type = NEW.TechType = 'TECH_EE_FORTIFICATION'
	AND Type NOT IN (
		SELECT
			PrereqTech
		FROM
			Technology_PrereqTechs
		WHERE
			TechType = 'TECH_EE_FORTIFICATION'
			AND PrereqTech = 'TECH_EE_FLINTLOCK'
	);

INSERT INTO
	Technology_PrereqTechs (TechType, PrereqTech)
SELECT
	'TECH_EE_ARMOUR_PLATING',
	'TECH_EE_WARSHIPS'
FROM
	Technologies
WHERE
	Type = NEW.TechType = 'TECH_EE_ARMOUR_PLATING'
	AND Type NOT IN (
		SELECT
			PrereqTech
		FROM
			Technology_PrereqTechs
		WHERE
			TechType = 'TECH_EE_ARMOUR_PLATING'
			AND PrereqTech = 'TECH_EE_WARSHIPS'
	);

INSERT INTO
	Technology_PrereqTechs (TechType, PrereqTech)
SELECT
	'TECH_EE_ARMOUR_PLATING',
	'TECH_EE_MANUFACTURING'
FROM
	Technologies
WHERE
	Type = NEW.TechType = 'TECH_EE_ARMOUR_PLATING'
	AND Type NOT IN (
		SELECT
			PrereqTech
		FROM
			Technology_PrereqTechs
		WHERE
			TechType = 'TECH_EE_ARMOUR_PLATING'
			AND PrereqTech = 'TECH_EE_MANUFACTURING'
	);

INSERT INTO
	Technology_PrereqTechs (TechType, PrereqTech)
SELECT
	'TECH_EE_ROMANTICISM',
	'TECH_EE_MANUFACTURING'
FROM
	Technologies
WHERE
	Type = NEW.TechType = 'TECH_EE_ROMANTICISM'
	AND Type NOT IN (
		SELECT
			PrereqTech
		FROM
			Technology_PrereqTechs
		WHERE
			TechType = 'TECH_EE_ROMANTICISM'
			AND PrereqTech = 'TECH_EE_MANUFACTURING'
	);

END;

CREATE TRIGGER FWTech_Technology_PrereqTechs_PrereqTech AFTER INSERT ON Technology_PrereqTechs WHEN NEW.PrereqTech LIKE ('TECH_EE_%') BEGIN
DELETE FROM Technology_PrereqTechs
WHERE
	PrereqTech = NEW.PrereqTech;

INSERT INTO
	Technology_PrereqTechs (TechType, PrereqTech)
SELECT
	'TECH_NAVIGATION',
	'TECH_EE_EXPLORATION'
FROM
	Technologies
WHERE
	Type = NEW.PrereqTech = 'TECH_EE_EXPLORATION'
	AND Type NOT IN (
		SELECT
			PrereqTech
		FROM
			Technology_PrereqTechs
		WHERE
			TechType = 'TECH_NAVIGATION'
			AND PrereqTech = 'TECH_EE_EXPLORATION'
	);

INSERT INTO
	Technology_PrereqTechs (TechType, PrereqTech)
SELECT
	'TECH_ECONOMICS',
	'TECH_EE_SOVEREIGNTY'
FROM
	Technologies
WHERE
	Type = NEW.PrereqTech = 'TECH_EE_SOVEREIGNTY'
	AND Type NOT IN (
		SELECT
			PrereqTech
		FROM
			Technology_PrereqTechs
		WHERE
			TechType = 'TECH_ECONOMICS'
			AND PrereqTech = 'TECH_EE_SOVEREIGNTY'
	);

INSERT INTO
	Technology_PrereqTechs (TechType, PrereqTech)
SELECT
	'TECH_ECONOMICS',
	'TECH_EE_HUMANISM'
FROM
	Technologies
WHERE
	Type = NEW.PrereqTech = 'TECH_EE_HUMANISM'
	AND Type NOT IN (
		SELECT
			PrereqTech
		FROM
			Technology_PrereqTechs
		WHERE
			TechType = 'TECH_ECONOMICS'
			AND PrereqTech = 'TECH_EE_HUMANISM'
	);

INSERT INTO
	Technology_PrereqTechs (TechType, PrereqTech)
SELECT
	'TECH_SCIENTIFIC_THEORY',
	'TECH_EE_NATURAL_HISTORY'
FROM
	Technologies
WHERE
	Type = NEW.PrereqTech = 'TECH_EE_NATURAL_HISTORY'
	AND Type NOT IN (
		SELECT
			PrereqTech
		FROM
			Technology_PrereqTechs
		WHERE
			TechType = 'TECH_SCIENTIFIC_THEORY'
			AND PrereqTech = 'TECH_EE_NATURAL_HISTORY'
	);

INSERT INTO
	Technology_PrereqTechs (TechType, PrereqTech)
SELECT
	'TECH_FERTILIZER',
	'TECH_EE_NATURAL_HISTORY'
FROM
	Technologies
WHERE
	Type = NEW.PrereqTech = 'TECH_EE_NATURAL_HISTORY'
	AND Type NOT IN (
		SELECT
			PrereqTech
		FROM
			Technology_PrereqTechs
		WHERE
			TechType = 'TECH_FERTILIZER'
			AND PrereqTech = 'TECH_EE_NATURAL_HISTORY'
	);

INSERT INTO
	Technology_PrereqTechs (TechType, PrereqTech)
SELECT
	'TECH_FERTILIZER',
	'TECH_EE_FLINTLOCK'
FROM
	Technologies
WHERE
	Type = NEW.PrereqTech = 'TECH_EE_FLINTLOCK'
	AND Type NOT IN (
		SELECT
			PrereqTech
		FROM
			Technology_PrereqTechs
		WHERE
			TechType = 'TECH_FERTILIZER'
			AND PrereqTech = 'TECH_EE_FLINTLOCK'
	);

INSERT INTO
	Technology_PrereqTechs (TechType, PrereqTech)
SELECT
	'TECH_INDUSTRIALIZATION',
	'TECH_EE_MANUFACTURING'
FROM
	Technologies
WHERE
	Type = NEW.PrereqTech = 'TECH_EE_MANUFACTURING'
	AND Type NOT IN (
		SELECT
			PrereqTech
		FROM
			Technology_PrereqTechs
		WHERE
			TechType = 'TECH_INDUSTRIALIZATION'
			AND PrereqTech = 'TECH_EE_MANUFACTURING'
	);

INSERT INTO
	Technology_PrereqTechs (TechType, PrereqTech)
SELECT
	'TECH_RIFLING',
	'TECH_EE_FORTIFICATION'
FROM
	Technologies
WHERE
	Type = NEW.PrereqTech = 'TECH_EE_FORTIFICATION'
	AND Type NOT IN (
		SELECT
			PrereqTech
		FROM
			Technology_PrereqTechs
		WHERE
			TechType = 'TECH_RIFLING'
			AND PrereqTech = 'TECH_EE_FORTIFICATION'
	);

INSERT INTO
	Technology_PrereqTechs (TechType, PrereqTech)
SELECT
	'TECH_MILITARY_SCIENCE',
	'TECH_EE_FORTIFICATION'
FROM
	Technologies
WHERE
	Type = NEW.PrereqTech = 'TECH_EE_FORTIFICATION'
	AND Type NOT IN (
		SELECT
			PrereqTech
		FROM
			Technology_PrereqTechs
		WHERE
			TechType = 'TECH_MILITARY_SCIENCE'
			AND PrereqTech = 'TECH_EE_FORTIFICATION'
	);

INSERT INTO
	Technology_PrereqTechs (TechType, PrereqTech)
SELECT
	'TECH_STEAM_POWER',
	'TECH_EE_ARMOUR_PLATING'
FROM
	Technologies
WHERE
	Type = NEW.PrereqTech = 'TECH_EE_ARMOUR_PLATING'
	AND Type NOT IN (
		SELECT
			PrereqTech
		FROM
			Technology_PrereqTechs
		WHERE
			TechType = 'TECH_STEAM_POWER'
			AND PrereqTech = 'TECH_EE_ARMOUR_PLATING'
	);

INSERT INTO
	Technology_PrereqTechs (TechType, PrereqTech)
SELECT
	'TECH_ELECTRICITY',
	'TECH_EE_ARMOUR_PLATING'
FROM
	Technologies
WHERE
	Type = NEW.PrereqTech = 'TECH_EE_ARMOUR_PLATING'
	AND Type NOT IN (
		SELECT
			PrereqTech
		FROM
			Technology_PrereqTechs
		WHERE
			TechType = 'TECH_ELECTRICITY'
			AND PrereqTech = 'TECH_EE_ARMOUR_PLATING'
	);

INSERT INTO
	Technology_PrereqTechs (TechType, PrereqTech)
SELECT
	'TECH_ELECTRICITY',
	'TECH_EE_ROMANTICISM'
FROM
	Technologies
WHERE
	Type = NEW.PrereqTech = 'TECH_EE_ROMANTICISM'
	AND Type NOT IN (
		SELECT
			PrereqTech
		FROM
			Technology_PrereqTechs
		WHERE
			TechType = 'TECH_ELECTRICITY'
			AND PrereqTech = 'TECH_EE_ROMANTICISM'
	);

END;