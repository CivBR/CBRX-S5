
include("PlotIterators.lua")
include("FLuaVector.lua")

local defineCityMinRangeForCoast = GameDefines["MIN_CITY_RANGE"] --Changed default to 2, for evaluating Coastal distance
local defineCityMinRangeOtherwise = 3

--JFD_CanStartMission
local missionFoundID = GameInfoTypes["MISSION_FOUND"]
function JFD_CanStartMission(playerID, unitID, missionID)
	local player = Players[playerID]	
	if missionID ~= missionFoundID then return true end
	
	local unit = player:GetUnitByID(unitID)
	if (not unit:IsFound()) then return true end

	local plot = Map.GetPlot(unit:GetX(), unit:GetY())
	if plot:IsCoastalLand() then 
		for loopPlot in PlotAreaSweepIterator(plot, defineCityMinRangeForCoast, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
			if loopPlot:IsCity() then
				return false
			end
		end
		return true
	end
	
	for loopPlot in PlotAreaSweepIterator(plot, defineCityMinRangeOtherwise, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
		if loopPlot:IsCity() then
			return false
		end
	end
	
	return true
end
GameEvents.CanStartMission.Add(JFD_CanStartMission)