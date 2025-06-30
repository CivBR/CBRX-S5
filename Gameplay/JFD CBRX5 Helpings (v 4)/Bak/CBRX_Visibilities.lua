local cbrxTileVisibilities = {
	["CIVILIZATION_BABYLON"] = { X = 9, Y = 0 }, --Observer--
	["CIVILIZATION_AMERICA"] = { X = 11, Y = 0 }, 
	["CIVILIZATION_AMERICA"] = { X = 12, Y = 0 }, 
}

function setTSLs()
	for currentPlayer = 0, GameDefines.MAX_MAJOR_CIVS - 1, 1 do
		local player = Players[currentPlayer]
		if not player then return end

		local civType = GameInfo.Civilizations[player:GetCivilizationType()].Type
		local Team = Teams[player:GetTeam()]

		for civType, plot in pairs(cbrxTileVisibilities) do
			local plot = Map.GetPlot(plot.X, plot.Y)
			if plot and (not plot:IsVisible(Team:GetID())) then
				plot:ChangeVisibilityCount(Team:GetID(), 1, -1, true, true)
				plot:SetRevealed(Team:GetID(), true)
			end
		end
	end
end

Events.SequenceGameInitComplete.Add(setTSLs)
