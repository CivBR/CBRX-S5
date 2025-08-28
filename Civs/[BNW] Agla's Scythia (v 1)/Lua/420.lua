	-- Drug Farm Provides Drugs
	-- Author: JFD	

local civilizationAglaID = GameInfoTypes["CIVILIZATION_AGLA_SCYTHIA"]

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

local iHolySite = GameInfoTypes["IMPROVEMENT_HOLY_SITE"]
		 
function JFD_GetNumberWorkedDrugFarms(playerID, city)
	local numWorkedDrugFarms = 0
	for cityPlot = 0, city:GetNumCityPlots() - 1, 1 do
		local plot = city:GetCityIndexPlot(cityPlot)
		if plot then
			local player = Players[playerID]
			if player:GetCivilizationType() == civilizationAglaID and player:IsEverAlive() then
				if city:IsWorkingPlot(plot) then	
					if plot:GetImprovementType() == iHolySite then 
						numWorkedDrugFarms = numWorkedDrugFarms + 1
					end
				end
			end
		end
	end
	
	return numWorkedDrugFarms
end

local iWeedPriest = GameInfoTypes["BUILDING_AGLA_WEED_PRIEST"]

function JFD_DrugFarmDrugsResource(playerID)
	local player = Players[playerID]
	if player:IsAlive() then
		for city in player:Cities() do
			city:SetNumRealBuilding(iWeedPriest, JFD_GetNumberWorkedDrugFarms(playerID, city))
		end
	end
end
GameEvents.PlayerDoTurn.Add(JFD_DrugFarmDrugsResource)




