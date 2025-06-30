--==========================================================================================================================
-- DecisionsAddin_Support
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
INSERT INTO DecisionsAddin_Support (FileName) VALUES ('Anishinaabe_Decisions.lua');
--==========================================================================================================================
-- EventsAddin_Support
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS EventsAddin_Support(FileName);
INSERT INTO EventsAddin_Support (FileName) VALUES ('Anishinaabe_Events.lua');
--==========================================================================================================================
-- Language_en_US
--==========================================================================================================================
INSERT OR REPLACE INTO Language_en_US (Tag, Text)
VALUES
	(
		'TXT_KEY_DECISIONS_ANISHINAABESCROLLS',
		'Begin the use of Birch Bark Scrolls'
	),
	(
		'TXT_KEY_DECISIONS_ANISHINAABESCROLLS_DESC',
		'Our people have proud traditions and a legacy that stretches back into time immemorial. The grandeur of the Anishinaabe must be preserved. We will instruct our Midew to begin inscribing our knowledge onto Birch Bark Scrolls, that we may never be forgotten[NEWLINE]
		[NEWLINE]Requirement/Restrictions:
		[NEWLINE][ICON_BULLET]Player must be the Anishinaabe
		[NEWLINE][ICON_BULLET]Must have bought/earned at least 2 Midew
		[NEWLINE][ICON_BULLET]Must have a Midew in the Capital
		[NEWLINE][ICON_BULLET]May only be enacted once per game
		[NEWLINE]Costs:
		[NEWLINE][ICON_BULLET]2 [ICON_MAGISTRATES] Magistrates
		[NEWLINE][ICON_BULLET]The Midew is expended
		[NEWLINE]Rewards:
		[NEWLINE][ICON_BULLET][ICON_PEACE] Faith and [ICON_RESEARCH] Science whenever a Great Person is expended
		[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]Note: The amount of [ICON_PEACE] Faith and [ICON_RESEARCH] Science you recieve increases with each Midew you buy/earn. Currently you would earn {1_NUM}[ENDCOLOR]'
	),
	(
		'TXT_KEY_DECISIONS_ANISHINAABESCROLLS_ENACTED_DESC',
		'Our people have proud traditions and a legacy that stretches back into time immemorial. The grandeur of the Anishinaabe must be preserved. We will instruct our Midew to begin inscribing our knowledge onto Birch Bark Scrolls, that we may never be forgotten[NEWLINE]
		[NEWLINE]Rewards:
		[NEWLINE][ICON_BULLET][ICON_PEACE] Faith and [ICON_RESEARCH] Science whenever a Great Person is expended
		[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]Note: The amount of [ICON_PEACE] Faith and [ICON_RESEARCH] Science you recieve increases with each Midew you buy/earn. Currently you earn {1_NUM}[ENDCOLOR]'
	),
	(
		'TXT_KEY_DECISIONS_ANISHINAABECOUNCIL',
		'Convene the Council of Three Fires'
	),
	(
		'TXT_KEY_DECISIONS_ANISHINAABECOUNCIL_DESC',
		'The Ojibwe, Ottawa, Potawatomi. Together these three peoples form the noble Anishinaabe nation. We should call a meeting so they may meet and plan the future of the collective Anishinaabeg people.[NEWLINE]
		[NEWLINE]Requirement/Restrictions:
		[NEWLINE][ICON_BULLET]Player must be the Anishinaabe
		[NEWLINE][ICON_BULLET]Player must have at least 3 Cities[NEWLINE][ICON_BULLET]Must have completed at least 1 Social Policy tree
		[NEWLINE][ICON_BULLET]May only be enacted once per era
		[NEWLINE]Costs:
		[NEWLINE][ICON_BULLET]1 [ICON_MAGISTRATES] Magistrates
		[NEWLINE]Rewards:
		[NEWLINE][ICON_BULLET]Choose between the following:
		[NEWLINE][ICON_BULLET]{1_Num} [ICON_CULTURE] Culture
		[NEWLINE][ICON_BULLET]{1_Num} [ICON_PEACE] Faith and {2_Num} [ICON_RESEARCH] Science
		[NEWLINE][ICON_BULLET]{3_Num} [ICON_GOLD] Gold
		[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]Note: The rewards will scale to the number of Cities you own.[ENDCOLOR]'
	),
	(
		'TXT_KEY_DECISIONS_ANISHINAABECOUNCIL_ENACTED_DESC',
		'The Ojibwe, Ottawa, Potawatomi. Together these three peoples form the noble Anishinaabe nation. We should call a meeting so they may meet and plan the future of the collective Anishinaabeg people.[NEWLINE]
		[NEWLINE]Rewards:
		[NEWLINE][ICON_BULLET]Choose between the following:
		[NEWLINE][ICON_BULLET]a lump sum [ICON_CULTURE] Culture
		[NEWLINE][ICON_BULLET]a lump sum [ICON_PEACE] Faith and [ICON_RESEARCH] Science
		[NEWLINE][ICON_BULLET]a lump sum [ICON_GOLD] Gold
		[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]Note: The rewards will scale to the number of Cities you own.[ENDCOLOR]'
	),
	(
		'TXT_KEY_EVENT_ANISHINAABECOUNCIL_DESC',
		'The Ojibwe, Ottawa and Potawatomi have met and have made some very convincing arguments about the future of the Anishinaabe. We must decide who to side with in some important matters...[NEWLINE]'
	),
	(
		'TXT_KEY_EVENT_ANISHINAABECOUNCIL_OUTCOME_1',
		'Our faith is central to our nation. We must side with the Ojibwe.'
	),
	(
		'TXT_KEY_EVENT_ANISHINAABECOUNCIL_OUTCOME_1_DESC',
		'[ICON_BULLET]{1_Num} [ICON_PEACE] Faith and {2_Num} [ICON_RESEARCH] Science'
	),
	(
		'TXT_KEY_EVENT_ANISHINAABECOUNCIL_OUTCOME_2',
		'Trade is the lifeblood of the nation. We must side with the Ottawa.'
	),
	(
		'TXT_KEY_EVENT_ANISHINAABECOUNCIL_OUTCOME_2_DESC',
		'[ICON_BULLET]{1_Num} [ICON_GOLD] Gold'
	),
	(
		'TXT_KEY_EVENT_ANISHINAABECOUNCIL_OUTCOME_3',
		'Stability is paramount. We must side with the Potawatomi.'
	),
	(
		'TXT_KEY_EVENT_ANISHINAABECOUNCIL_OUTCOME_3_DESC',
		'[ICON_BULLET]{1_Num} [ICON_CULTURE] Culture'
	);