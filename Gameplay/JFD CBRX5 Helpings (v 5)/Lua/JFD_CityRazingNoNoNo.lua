
--JFD_PlayerCanRaze
function JFD_PlayerCanRaze(playerID, cityID)
	local player = Players[playerID]	
	local city = player:GetCityByID(cityID)
	
	local numHappiness = player:GetExcessHappiness()
	if numHappiness > 0 then
		return false
	end
end
GameEvents.CanRaze.Add(JFD_PlayerCanRaze)
GameEvents.CanRazeOverride.Add(JFD_PlayerCanRaze)

--JFD_PlayerDoTurn
function JFD_PlayerDoTurn(playerID)
	local player = Players[playerID]	
	if (not player:IsAlive()) then return end
	
	local numHappiness = player:GetExcessHappiness()
	if numHappiness > 0 then
		for city in player:Cities() do
			if city:IsRazing() then
				city:ChangeRazingTurns(-city:GetRazingTurns())
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(JFD_PlayerDoTurn)