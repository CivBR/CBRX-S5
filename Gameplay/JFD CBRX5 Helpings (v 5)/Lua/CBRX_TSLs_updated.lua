-- local cbrxTSLs = {
	-- ["CIVILIZATION_BABYLON"] = { X = 9, Y = 0 }, --Observer--
	-- ["CIVILIZATION_AMERICA"] = { X = 32, Y = 76, Island = true },
	-- ["CIVILIZATION_AGLA_ESTONIA"] = { X = 32, Y = 76 },
	-- ["CIVILIZATION_AGLA_ZELENY_KLYN"] = { X = 95, Y = 75 },
	-- ["CIVILIZATION_AGLA_SCYTHIA"] = { X = 37, Y = 67 },
	-- ["CIVILIZATION_AGLA_HANSE_WULLENWEVER"] = { X = 19, Y = 69 },
	-- ["CIVILIZATION_SAS_AURES"] = { X = 17, Y = 46 },
	-- ["CIVILIZATION_SENSHI_BANGLADESH"] = { X = 72, Y = 49 },
	-- ["CIVILIZATION_RHO_BJARMIA"] = { X = 35, Y = 86 },
	-- ["CIVILIZATION_SENSHI_BUNUBA"] = { X = 94, Y = 21 },
	-- ["CIVILIZATION_SAS_BERZEG"] = { X = 40, Y = 61 },
	-- ["CIVILIZATION_DMS_ETHIOPIA_YAQOB"] = { X = 37, Y = 33 },
	-- ["CIVILIZATION_URDNOT_REV_FRANCE"] = { X = 12, Y = 62 },
	-- ["CIVILIZATION_GT_ROURAN"] = { X = 76, Y = 73 },
	-- ["CIVILIZATION_GT_TERNATE"] = { X = 97, Y = 34, Island = true },
	-- ["CIVILIZATION_THP_HERERO"] = { X = 28, Y = 12 },
	-- ["CIVILIZATION_TCM_HYKSOS"] = { X = 35, Y = 46 },
	-- ["CIVILIZATION_RHO_ITELMEN"] = { X = 104, Y = 85 },
	-- ["CIVILIZATION_SENSHI_HIDEYOSHI"] = { X = 100, Y = 66, Island = true },
	-- ["CIVILIZATION_JFD_KALMAR_UNION"] = { X = 22, Y = 73 },
	-- ["CIVILIZATION_LUNG_KIPCHAKS"] = { X = 56, Y = 72 },
	-- ["CIVILIZATION_PB_LANFANG"] = { X = 86, Y = 30, Island = true },
	-- ["CIVILIZATION_THP_LUBA"] = { X = 32, Y = 22 },
	-- ["CIVILIZATION_DMS_MINAEANS"] = { X = 42, Y = 38 },
	-- ["CIVILIZATION_JWW_MARAVI"] = { X = 37, Y = 17 },
	-- ["CIVILIZATION_MC_RAPA_NUI"] = { X = 143, Y = 24, Island = true },
	-- ["CIVILIZATION_MC_MYSORE"] = { X = 64, Y = 36 },
	-- ["CIVILIZATION_SENSHI_NEW_SOUTH_WALES"] = { X = 109, Y = 11 },
	-- ["CIVILIZATION_SENSHI_PAKISTAN"] = { X = 57, Y = 44 },
	-- ["CIVILIZATION_JFD_PAPAL_STATES_JULIUS_II"] = { X = 21, Y = 53 },
	-- ["CIVILIZATION_ER_PEGU"] = { X = 75, Y = 43 },
	-- ["CIVILIZATION_MC_PHOENICIA"] = { X = 38, Y = 50 },
	-- ["CIVILIZATION_TCM_AVIS_PORTUGAL"] = { X = 5, Y = 50 },
	-- ["CIVILIZATION_JWW_QARA_KHITAI"] = { X = 62, Y = 67 },
	-- ["CIVILIZATION_SAS_RYUKYU"] = { X = 94, Y = 56, Island = true },
	-- ["CIVILIZATION_ASQ_SCOTLAND_MARY"] = { X = 7, Y = 75, Island = true },
	-- ["CIVILIZATION_JWW_SEYCHELLES"] = { X = 50, Y = 25, Island = true },
	-- ["CIVILIZATION_AKKADIAN_MOD"] = { X = 47, Y = 48 },
	-- ["CIVILIZATION_THP_TANG"] = { X = 80, Y = 64 },
	-- ["CIVILIZATION_ASQ_UMHAILL"] = { X = 0, Y = 70, Island = true },
	-- ["CIVILIZATION_NC_CEBU"] = { X = 94, Y = 40, Island = true },
	-- ["CIVILIZATION_RHO_VYATKA"] = { X = 46, Y = 76 },
	-- ["CIVILIZATION_JFD_WALLACHIA"] = { X = 30, Y = 60 },
	-- ["CIVILIZATION_SENSHI_YUNNAN"] = { X = 80, Y = 52 },
	-- ["CIVILIZATION_THP_KET"] = { X = 61, Y = 83 },
	-- ["CIVILIZATION_TCM_BACTRIA"] = { X = 57, Y = 59 },
	-- ["CIVILIZATION_NC_ZAZZAU"] = { X = 23, Y = 32 },
	-- ["CIVILIZATION_NC_WASSOULOU"] = { X = 10, Y = 31 },
	-- ["CIVILIZATION_CL_TLINGIT"] = { X = 120, Y = 81 },
	-- ["CIVILIZATION_CLANISHINAABE"] = { X = 143, Y = 78 },
	-- ["CIVILIZATION_JWW_KARANKAWA"] = { X = 136, Y = 59 },
	-- ["CIVILIZATION_LEU_ONONDAGA_TADODAHO"] = { X = 152, Y = 73 },
	-- ["CIVILIZATION_NC_PONCA"] = { X = 136, Y = 71 },
	-- ["CIVILIZATION_ORG_COIOT_POMO"] = { X = 125, Y = 66 },
	-- ["CIVILIZATION_TG_SUSQUEHANNOCK"] = { X = 152, Y = 68 },
	-- ["CIVILIZATION_NORTE_CHICO_MOD"] = { X = 147, Y = 30 },
	-- ["CIVILIZATION_MC_YANOMAMI"] = { X = 153, Y = 39 },
	-- ["CIVILIZATION_ZRQ_TEO_SPEAROWL"] = { X = 135, Y = 50 },
	-- ["CIVILIZATION_ASQ_XARAGUA"] = { X = 154, Y = 50, Island = true },
	-- ["CIVILIZATION_RHO_CHONO"] = { X = 148, Y = 10, Island = true },
	-- ["CIVILIZATION_THP_GUAYCURU"] = { X = 156, Y = 24 },
	-- ["CIVILIZATION_SAS_XAVANTE"] = { X = 159, Y = 31 },
	-- ["CIVILIZATION_RHO_POTIGUARA"] = { X = 168, Y = 33 },
-- }

--g_Civilization_CBRX_TSLs_Table
local g_Civilization_CBRX_TSLs_Table = {}
local g_Civilization_CBRX_TSLs_Count = 1
local g_Civilization_CBRX_TerrainChanges_Table = {}
local g_Civilization_CBRX_Visibilities_Table = {}
for row in DB.Query("SELECT * FROM Civilization_CBRX_TSLs;") do 
	g_Civilization_CBRX_TSLs_Table[g_Civilization_CBRX_TSLs_Count] = row
	g_Civilization_CBRX_TSLs_Count = g_Civilization_CBRX_TSLs_Count + 1
	
	g_Civilization_CBRX_Visibilities_Table[row.CivilizationType] = {}
	local g_Civilization_CBRX_Visibilities_Count = 1
	--g_Civilization_CBRX_Visibilities_Table
	for row2 in DB.Query("SELECT * FROM Civilization_CBRX_Visibilities WHERE CivilizationType = '" .. row.CivilizationType .. "';") do 
		g_Civilization_CBRX_Visibilities_Table[row.CivilizationType][g_Civilization_CBRX_Visibilities_Count] = row2
		g_Civilization_CBRX_Visibilities_Count = g_Civilization_CBRX_Visibilities_Count + 1
	end

	g_Civilization_CBRX_TerrainChanges_Table[row.CivilizationType] = {}
	local g_Civilization_CBRX_TerrainChanges_Count = 1
	--g_Civilization_CBRX_TerrainChanges_Table
	for row2 in DB.Query("SELECT * FROM Civilization_CBRX_TerrainChanges WHERE CivilizationType = '" .. row.CivilizationType .. "';") do 
		g_Civilization_CBRX_TerrainChanges_Table[row.CivilizationType][g_Civilization_CBRX_TerrainChanges_Count] = row2
		g_Civilization_CBRX_TerrainChanges_Count = g_Civilization_CBRX_TerrainChanges_Count + 1
	end
end

local Units = {
	Worker = GameInfoTypes["UNIT_WORKER"],
	Warrior = GameInfoTypes["UNIT_WARRIOR"],
	Archer = GameInfoTypes["UNIT_ARCHER"],
	WorkBoat = GameInfoTypes["UNIT_WORKBOAT"],
	Trireme = GameInfoTypes["UNIT_TRIREME"],
	NuclearSubmarine = GameInfoTypes["UNIT_NUCLEAR_SUBMARINE"],
	Cybersub = GameInfoTypes["UNIT_FW_CYBERSUB"],
}

local Optics = GameInfoTypes["TECH_OPTICS"]

local observerTechs = {
	GameInfoTypes["TECH_SAILING"],
	GameInfoTypes["TECH_POTTERY"],
	GameInfoTypes["TECH_TRAPPING"],
	GameInfoTypes["TECH_MINING"],
	GameInfoTypes["TECH_AGRICULTURE"],
	GameInfoTypes["TECH_ARCHERY"]
}

local observerTHETechTHE = GameInfoTypes["TECH_CBR_OBSERVER"]

local fwModID = "d9ece224-6cd8-4519-a27a-c417b59cdf35"

function setTSLs()
	local iCBRXWidth, iCBRXHeight = 180, 94
	local currentMapWidth, currentMapHeight = Map.GetGridSize()
	local isUsingFW = false

	if currentMapWidth ~= iCBRXWidth or currentMapHeight ~= iCBRXHeight then
		print("TSLs will not be set: Map dimensions do not match requirements.")
		return
	end

	if Game.GetGameTurn() > 2 then
		print("Game has already started. TSLs will not be set.")
		return
	end

	if Game.CountKnownTechNumTeams(observerTHETechTHE) > 0 then
		print("Observer has sentience, all done.")
		return
	end

	for currentPlayer = 0, GameDefines.MAX_MAJOR_CIVS - 1, 1 do
		local player = Players[currentPlayer]
		if not player then return end

		local civType = GameInfo.Civilizations[player:GetCivilizationType()].Type
		local Team = Teams[player:GetTeam()]
		
		local hasTSL = false
		local startX = -1
		local startY = -1
		local isIsland = false
		
		--g_Civilization_CBRX_TSLs_Table
		local civTSLTable = g_Civilization_CBRX_TSLs_Table
		for index = 1, #civTSLTable do
			local row = civTSLTable[index]
			if row.CivilizationType == civType then
				hasTSL = true
				startX = row.X
				startY = row.Y
				isIsland = row.IsIsland	
			end
		end
		
		if hasTSL then
			print("TSL Set: " .. civType)

			-- local startX = cbrxTSLs[civType].X
			-- local startY = cbrxTSLs[civType].Y

			-- Give starting base techs
			for _, tech in ipairs(observerTechs) do
				Team:SetHasTech(tech, true)
			end
			
			-- Spawn default extra units
			local unitList = { Units.Worker, Units.Archer, Units.Archer }
			for _, unit in ipairs(unitList) do
				player:InitUnit(unit, startX, startY)
			end

			-- Handle Island Civilizations
			if isIsland then
				Team:SetHasTech(Optics, true)

				-- Replace Warriors with Triremes
				for unit in player:Units() do
					if unit:GetUnitType() == Units.Warrior then
						local newTrireme = player:InitUnit(Units.Trireme, unit:GetX(), unit:GetY())
						newTrireme:JumpToNearestValidPlot()
						unit:Kill(-1)
					end
				end
				
				-- for _ = 1, 2 do
					-- local warrior = player:InitUnit(Units.Warrior, startX, startY)
					-- local newTrireme = player:InitUnit(Units.Trireme, warrior:GetX(), warrior:GetY())
					-- newTrireme:JumpToNearestValidPlot()
					-- warrior:Kill(-1)
				-- end

				-- Replace Workers with Workboats
				for unit in player:Units() do
					if unit:GetUnitType() == Units.Worker then
						local newWorkBoat = player:InitUnit(Units.WorkBoat, unit:GetX(), unit:GetY())
						newWorkBoat:JumpToNearestValidPlot()
						unit:Kill(-1)
						break
					end
				end
			end

			-- Move all units to TSL coordinates
			local isFirstSettler = false
			for unit in player:Units() do
				unit:SetXY(startX, startY)
			end

			-- Hide pre-TSL plot visibility
			local startingPlot = player:GetStartingPlot()
			if startingPlot then
				local visibilityRange = 4
				for dx = -visibilityRange, visibilityRange do
					for dy = -visibilityRange, visibilityRange do
						local plot = Map.GetPlotXY(startingPlot:GetX(), startingPlot:GetY(), dx, dy)
						if plot then
							plot:ChangeVisibilityCount(Team:GetID(), -1, -1, true, true)
							plot:SetRevealed(Team:GetID(), false)
							plot:UpdateFog()
						end
					end
				end
			end
			
			--Gib new Visibilities
			--g_Civilization_CBRX_Visibilities_Table
			local civVisibTable = g_Civilization_CBRX_Visibilities_Table[civType]
			for index = 1, #civVisibTable do
				local row = civVisibTable[index]
				if row.CivilizationType == civType then
					local plot = Map.GetPlot(row.X, row.Y)
					if plot and (not plot:IsVisible(Team:GetID())) then
						plot:ChangeVisibilityCount(Team:GetID(), 1, -1, true, true)
						plot:SetRevealed(Team:GetID(), true)
						plot:UpdateFog()
					end
				end
			end

			-- Remove Observer units + full map reveal
			if civType == "CIVILIZATION_BABYLON" then
				for _, mod in pairs(Modding.GetActivatedMods()) do
					if (mod.ID == fwModID) then
						isUsingFW = true
						break
					end
				end

				local unitNOTToKill = Units.NuclearSubmarine
				if isUsingFW then
					unitNOTToKill = Units.Cybersub
					player:InitUnit(unitNOTToKill, startX, startY)
				else
					player:InitUnit(unitNOTToKill, startX, startY)
				end

				for unit in player:Units() do
					if unit:GetUnitType() ~= unitNOTToKill then
						unit:Kill(-1)
					end
				end

				-- for plotIndex = 0, Map.GetNumPlots() - 1 do
				-- 	local plot = Map.GetPlotByIndex(plotIndex)
				-- 	plot:ChangeVisibilityCount(Team:GetID(), 1, -1, true, true)
				-- 	plot:SetRevealed(Team:GetID(), true)
				-- end
			end

			--Give the Observer, the the Observer Dummy Tech
			local teamTechs = Team:GetTeamTechs()
			teamTechs:SetHasTech(observerTHETechTHE, true)
		end
	end

	-- Update the game visibility for all civs
	Game.UpdateFOW(true)
	UI.RequestMinimapBroadcast()
end
if Game.CountKnownTechNumTeams(observerTHETechTHE) == 0 then
	Events.SequenceGameInitComplete.Add(setTSLs)
end

local civilizationObserverID = GameInfoTypes["CIVILIZATION_BABYLON"]
local observerTerrainChangesTechID = GameInfoTypes["TECH_CBR_OBSERVER_2"]
local function setTerrainChanges(playerID, plotX, plotY)
	local player = Players[playerID]
	if (not player:IsAlive()) then return end

	if Game.CountKnownTechNumTeams(observerTerrainChangesTechID) > 0 then
		GameEvents.PlayerCityFounded.Remove(setTerrainChanges)
		return
	end

	for currentPlayer = 0, GameDefines.MAX_MAJOR_CIVS - 1, 1 do
		local player = Players[currentPlayer]
		if player:IsAlive() then
			if (not player:GetCapitalCity()) then
				return
			end
		end
	end	
	
	local playerObserverID = -1
	for currentPlayer = 0, GameDefines.MAX_MAJOR_CIVS - 1, 1 do
		local player = Players[currentPlayer]
		if player:IsAlive() then
			if player:GetCivilizationType() == civilizationObserverID then
				playerObserverID = currentPlayer
			end
			local civType = GameInfo.Civilizations[player:GetCivilizationType()].Type
			--g_Civilization_CBRX_TerrainChanges_Table
			local terrainChangesTable = g_Civilization_CBRX_TerrainChanges_Table[civType]
			if terrainChangesTable then
				for index = 1, #terrainChangesTable do
					local row = terrainChangesTable[index]
					if row.CivilizationType == civType then
						local plot = Map.GetPlot(row.X, row.Y)
						if plot then
							local terrainID = GameInfoTypes[row.TerrainType]
							if plot:GetTerrainType() ~= terrainID then
								plot:SetTerrainType(terrainID)
							end
						end
					end
				end
			end
		end
	end
	if playerObserverID > -1 then
		local playerObserver = Players[playerObserverID]
		local Team = Teams[playerObserver:GetTeam()]
		local teamTechs = Team:GetTeamTechs()
		teamTechs:SetHasTech(observerTerrainChangesTechID, true)
	end
end
if Game.CountKnownTechNumTeams(observerTerrainChangesTechID) == 0 then
	GameEvents.PlayerCityFounded.Add(setTerrainChanges)
end
