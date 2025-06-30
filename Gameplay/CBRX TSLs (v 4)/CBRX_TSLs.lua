local cbrxTSLs = {
	["CIVILIZATION_BABYLON"] = { X = 9, Y = 0 }, --Observer--
	["CIVILIZATION_MC_AFSHARIDS"] = { X = 52, Y = 53 },
	["CIVILIZATION_UC_ALAOUITE"] = { X = 9, Y = 44 },
	["CIVILIZATION_JFD_BAVARIA_LUDWIG_II"] = { X = 21, Y = 62 },
	["CIVILIZATION_JWW_BORA_BORA"] = { X = 133, Y = 29, Island = true },
	["CIVILIZATION_JWW_BUKHARA_SHAYBANI"] = { X = 56, Y = 62 },
	["CIVILIZATION_AGLA_BURGUNDY_BOLD"] = { X = 15, Y = 61 },
	["CIVILIZATION_SAS_CROW"] = { X = 132, Y = 73 },
	["CIVILIZATION_LUNG_DAI_VIET"] = { X = 83, Y = 48 },
	["CIVILIZATION_COIOT_DZUNGARS"] = { X = 66, Y = 68 },
	["CIVILIZATION_JFD_ECUADOR_MORENO"] = { X = 145, Y = 37 },
	["CIVILIZATION_JFD_ENGLAND_HENRY_V"] = { X = 10, Y = 67 },
	["CIVILIZATION_DJ_ESWATINI"] = { X = 35, Y = 9 },
	["CIVILIZATION_DMS_FAROE_ISLANDS"] = { X = 8, Y = 85, Island = true },
	["CIVILIZATION_GT_FINNS"] = { X = 30, Y = 80 },
	["CIVILIZATION_JWW_THE_FLORIDAS"] = { X = 149, Y = 60 },
	["CIVILIZATION_MC_GOGURYEO"] = { X = 91, Y = 73 },
	["CIVILIZATION_HARAPPA_MOD"] = { X = 61, Y = 50 },
	["CIVILIZATION_PB_IKKO_IKKI"] = { X = 100, Y = 65, Island = true },
	["CIVILIZATION_ER_KALMYKIA"] = { X = 46, Y = 64 },
	["CIVILIZATION_DMS_MC_KANEM_BORNU"] = { X = 24, Y = 34 },
	["CIVILIZATION_UC_KAZAKHSTAN"] = { X = 58, Y = 72 },
	["CIVILIZATION_AGLA_KAZAN"] = { X = 45, Y = 73 },
	["CIVILIZATION_EW_KHOSHUT"] = { X = 73, Y = 54 },
	["CIVILIZATION_THP_LATVIA"] = { X = 30, Y = 73 },
	["CIVILIZATION_NC_MAGUINDANAO"] = { X = 95, Y = 37, Island = true },
	["CIVILIZATION_EW_FREETERRITORY"] = { X = 38, Y = 65 },
	["CIVILIZATION_ZRQ_MAMLUK_SHAJAR"] = { X = 33, Y = 45 },
	["CIVILIZATION_JFD_MEXICO_MAXIMILIAN_I"] = { X = 135, Y = 50 },
	["CIVILIZATION_ER_MOGADISHU"] = { X = 43, Y = 27 },
	["CIVILIZATION_DJ_MONGOLIA"] = { X = 76, Y = 73 },
	["CIVILIZATION_NC_NDONGO"] = { X = 27, Y = 21 },
	["CIVILIZATION_AGLA_DUTCHBRAZIL"] = { X = 169, Y = 33 },
	["CIVILIZATION_EW_NIVKH"] = { X = 96, Y = 83 },
	["CIVILIZATION_THP_NOONGAR"] = { X = 91, Y = 9 },
	["CIVILIZATION_GR_OSAGE"] = { X = 138, Y = 65 },
	["CIVILIZATION_SAS_PALAWA"] = { X = 107, Y = 4, Island = true },
	["CIVILIZATION_GT_PONTUS"] = { X = 38, Y = 57 },
	["CIVILIZATION_SAS_PUEBLO"] = { X = 131, Y = 64 },
	["CIVILIZATION_US_QARMATIANS"] = { X = 47, Y = 44 },
	["CIVILIZATION_JWW_RIOGRANDENSE_REPUBLIC"] = { X = 161, Y = 21 },
	["CIVILIZATION_US_ROME_TRAJAN"] = { X = 21, Y = 53 },
	["CIVILIZATION_JFD_ROYAL_HUNGARY_BATHORY"] = { X = 27, Y = 62 },
	["CIVILIZATION_ASQ_ROZVI"] = { X = 34, Y = 13 },
	["CIVILIZATION_EW_SHEBA"] = { X = 39, Y = 35 },
	["CIVILIZATION_SENSHI_SELKUPS"] = { X = 64, Y = 79 },
	["CIVILIZATION_MC_NTF_SENECA"] = { X = 151, Y = 73 },
	["CIVILIZATION_ASQ_SHANG"] = { X = 85, Y = 66 },
	["CIVILIZATION_GPUZ_SHAWNEE"] = { X = 144, Y = 70 },
	["CIVILIZATION_JFD_SIAM_RAMA_V"] = { X = 78, Y = 41 },
	["CIVILIZATION_JWW_SIERRA_LEONE_PETERS"] = { X = 9, Y = 30 },
	["CIVILIZATION_ER_SINGAPORE"] = { X = 83, Y = 32, Island = true },
	["CIVILIZATION_UC_TAINO"] = { X = 160, Y = 51, Island = true },
	["CIVILIZATION_HOOP_THROWER_TEHUELCHE"] = { X = 153, Y = 4 },
	["CIVILIZATION_AGLA_THULE"] = { X = 119, Y = 89 },
	["CIVILIZATION_TIWANAKU"] = { X = 152, Y = 25 },
	["CIVILIZATION_RHO_UME_SAMI"] = { X = 24, Y = 84 },
	["CIVILIZATION_MC_VIJAYANAGARA"] = { X = 64, Y = 38 },
	["CIVILIZATION_TCM_VISIGOTH"] = { X = 8, Y = 51 },
	["CIVILIZATION_SAS_WAHGI"] = { X = 106, Y = 31, Island = true },
	["CIVILIZATION_THP_YELLOWKNIFE"] = { X = 133, Y = 86 },
	["CIVILIZATION_EW_TUNGNING"] = { X = 90, Y = 54, Island = true },
}

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
	GameInfoTypes["TECH_ARCHERY"],
	GameInfoTypes["TECH_COMPASS"] --Compass replacement (with EE + FW-lite enabled)
}

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

	for currentPlayer = 0, GameDefines.MAX_MAJOR_CIVS - 1, 1 do
		local player = Players[currentPlayer]
		if not player then return end

		local civType = GameInfo.Civilizations[player:GetCivilizationType()].Type
		local Team = Teams[player:GetTeam()]

		if cbrxTSLs[civType] then
			print("TSL Set: " .. civType)

			local startX = cbrxTSLs[civType].X
			local startY = cbrxTSLs[civType].Y

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
			if cbrxTSLs[civType].Island then
				Team:SetHasTech(Optics, true)

				-- Replace Warriors with Triremes
				for _ = 1, 2 do
					local warrior = player:InitUnit(Units.Warrior, startX, startY)
					local newTrireme = player:InitUnit(Units.Trireme, warrior:GetX(), warrior:GetY())
					newTrireme:JumpToNearestValidPlot()
					warrior:Kill()
				end

				-- Replace Workers with Workboats
				for unit in player:Units() do
					if unit:GetUnitType() == Units.Worker then
						local newWorkBoat = player:InitUnit(Units.WorkBoat, unit:GetX(), unit:GetY())
						newWorkBoat:JumpToNearestValidPlot()
						unit:Kill()
						break
					end
				end
			end

			-- Move all units to TSL coordinates
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

			-- Remove Observer units + full map reveal
			if civType == "CIVILIZATION_BABYLON" then
				for _, mod in pairs(Modding.GetActivatedMods()) do
					if (mod.ID == fwModID) then
						isUsingFW = true
						break
					end
				end

				if isUsingFW then
					player:InitUnit(Units.Cybersub, startX, startY)
				else
					player:InitUnit(Units.NuclearSubmarine, startX, startY)
				end

				for unit in player:Units() do
					if unit:GetUnitType() ~= Units.Cybersub then
						unit:Kill()
					end
				end

				-- for plotIndex = 0, Map.GetNumPlots() - 1 do
				-- 	local plot = Map.GetPlotByIndex(plotIndex)
				-- 	plot:ChangeVisibilityCount(Team:GetID(), 1, -1, true, true)
				-- 	plot:SetRevealed(Team:GetID(), true)
				-- end
			end
		end
	end

	-- Update the game visibility for all civs
	Game.UpdateFOW(true)
	UI.RequestMinimapBroadcast()
end

Events.SequenceGameInitComplete.Add(setTSLs)
