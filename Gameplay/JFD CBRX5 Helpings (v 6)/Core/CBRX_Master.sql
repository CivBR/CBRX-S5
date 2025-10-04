--==========================================================================================================================
-- CBRX MASTER
--==========================================================================================================================
----------------------------------------------------------------------------------------------------------------------------
-- Civilization_CBRX_Colours
----------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS
Civilization_CBRX_Colours (
    CivilizationType	text    		default null,
	Red					integer			default 0,
	Green				integer			default 0,
	Blue				integer			default 0,
	IsBackground		boolean			default 0,
	SecondaryColor		text			default null,
	IsIcon				boolean			default 0,
	PrimaryColor		text			default null,
	NewIconAtlas		text			default null,
	NewPortraitIndex	integer			default -1);
----------------------------------------------------------------------------------------------------------------------------
-- Civilization_CBRX_TerrainChanges
----------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS
Civilization_CBRX_TerrainChanges (
    CivilizationType	text    		default null,
	X					integer			default -1,
	Y					integer			default -1,
	TerrainType			text			default null);
----------------------------------------------------------------------------------------------------------------------------
-- Civilization_CBRX_TSLs
----------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS
Civilization_CBRX_TSLs (
    CivilizationType	text    		default null,
	X					integer			default -1,
	Y					integer			default -1,
	IsIsland			boolean			default 0);
----------------------------------------------------------------------------------------------------------------------------
-- Civilization_CBRX_Visibilities
----------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS
Civilization_CBRX_Visibilities (
    CivilizationType	text    		default null,
	X					integer			default -1,
	Y					integer			default -1);
--==========================================================================================================================
--==========================================================================================================================