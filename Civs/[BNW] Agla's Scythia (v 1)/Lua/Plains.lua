------------------------------------------------------------------------------------------------------------------------
-- UTILITIES
------------------------------------------------------------------------------------------------------------------------
include("PlotIterators")

local civilisationID = GameInfoTypes["CIVILIZATION_AGLA_SCYTHIA"]

function JFD_IsCivilisationActive(civilisationID)
	for iSlot = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
		local slotStatus = PreGame.GetSlotStatus(iSlot)
		if (slotStatus == SlotStatus["SS_TAKEN"] or slotStatus == SlotStatus["SS_COMPUTER"]) then
			if PreGame.GetCivilization(iSlot) == civilisationID then
				return true
			end
		end
	end

	return false
end




function JFD_GetNumAdjacentPlains(playerID, city)
	local iAdjacentPlains = 0
	local plot = Map.GetPlot(city:GetX(), city:GetY())
    for adjPlot in PlotAreaSweepIterator(plot, 1, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
		local x = adjPlot:GetX()
		local y = adjPlot:GetY()
		--ER Edit: Flatlands also cannot have forests or jungles
		if adjPlot:GetOwner() == playerID and adjPlot:IsFlatlands() and adjPlot:GetFeatureType() ~= GameInfoTypes["FEATURE_FOREST"] and adjPlot:GetFeatureType() ~= GameInfoTypes["FEATURE_JUNGLE"] then
			iAdjacentPlains = iAdjacentPlains + 1
		end
	end

    return iAdjacentPlains     
end

function JFD_ScottishCultureFromHills(playerID)
	local player = Players[playerID]
	if player:GetCivilizationType() == civilisationID and player:IsEverAlive() then
		for city in player:Cities() do
			--ER Edit: OG Code gave +1 Faith per 2 tiles not per 3 tiles.
			local iBonus = math.floor(JFD_GetNumAdjacentPlains(playerID, city) / 3)
			city:SetNumRealBuilding(GameInfoTypes["BUILDING_SCYTHIAN_PLAINS"], iBonus)
		end
	end
end

if JFD_IsCivilisationActive(civilisationID) then
	GameEvents.PlayerDoTurn.Add(JFD_ScottishCultureFromHills)
	GameEvents.PlayerCityFounded.Add(JFD_ScottishCultureFromHills)
end