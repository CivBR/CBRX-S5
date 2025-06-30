-- PhoenicianUA
-- Author: Sukritact
--=======================================================================================================================

print("Phoenician Alphabet Top-Panel: loaded")

--=======================================================================================================================
-- Main Code
--=======================================================================================================================
function MC_PhoenicianAlphabet(iPlayer)
	local pPlayer = Players[iPlayer]
	
	local iScienceExport = 0
	-- Trade routes from you
	local tTradeRoutes = pPlayer:GetTradeRoutes()
	for iKey, tTradeRoute in ipairs(tTradeRoutes) do
		iScienceExport = iScienceExport + tTradeRoute.ToScience
	end
	-- Trade routes to you
	local tTradeRoutes = pPlayer:GetTradeRoutesToYou()
	for iKey, tTradeRoute in ipairs(tTradeRoutes) do
		iScienceExport = iScienceExport + tTradeRoute.FromScience
	end
	
	local iDeltaGold = iScienceExport * 0.05 -- Yields from Trade Routes must be /100 so this is actually just *5
	
	return iDeltaGold
end
--=======================================================================================================================
--=======================================================================================================================