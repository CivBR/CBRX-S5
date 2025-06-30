print("JFD IGE Utils loaded")
--------------------------------------------------------------
if Game then
	--Game_IsModActive
	function Game_IsModActive(modID)
		for _, mod in pairs(Modding.GetActivatedMods()) do
			if mod.ID == modID then
				return true
			end
		end
		return false
	end
	
	--Game.IsJFDLLActive
	function Game.IsJFDLLActive()
		return Game_IsModActive("dedf47d7-6428-4e62-b48e-18e07e4fcc53")
	end
end
local isJFDLLActive = Game.IsJFDLLActive()
--------------------------------------------------------------
-- function JFD_CouldHaveFeature(featureID, plot, isDebugging)
	-- if isJFDLLActive then
		-- return plot:CanHaveFeature(featureID, true)
	-- end
	
	-- local feature = GameInfo.Features[featureID]
	-- local featureType = feature.Type
	-- local featureDesc = Locale.ConvertTextKey(feature.Description)
	-- local terrainID = plot:GetTerrainType()
	-- local terrain = GameInfo.Terrains[terrainID]
	-- local terrainType = terrain.Type
	-- local terrainDesc = Locale.ConvertTextKey(terrain.Description)
	
	-- if feature.NaturalWonder then
		-- return true
	-- end
	
	-- if plot:IsCity() then
		-- if isDebugging then print("IsCity check failed. Removing: '" .. featureDesc .. "'") end	
		-- return false
	-- end
	-- if plot:IsMountain() then
		-- if isDebugging then print("IsMountain check failed. Removing: '" .. featureDesc .. "'") end	
		-- return false
	-- end
	
	-- if feature.NoCoast and terrainID == GameInfoTypes["TERRAIN_COAST"] then
		-- if isDebugging then print("NoCoast check failed. Removing: '" .. featureDesc .. "'") end	
		-- return false
	-- end
	
	-- if feature.NoRiver and plot:IsRiver() then
		-- if isDebugging then print("NoRiver check failed. Removing: '" .. featureDesc .. "'") end	
		-- return false
	-- end
	-- if feature.RequiresRiver and (not plot:IsRiver()) then
		-- if isDebugging then print("RequiresRiver check failed. Removing: '" .. featureDesc .. "'") end	
		-- return false
	-- end
	-- if feature.RequiresFlatlands and (not plot:IsFlatlands()) then
		-- if isDebugging then print("RequiresFlatlands check failed. Removing: '" .. featureDesc .. "'") end	
		-- return false
	-- end
	
	-- local row = GameInfo.Feature_TerrainBooleans("FeatureType = '" .. featureType .. "' AND TerrainType = '" .. terrainType .. "'")()
	-- if (not row) then
		-- if isDebugging then print("Terrain check failed. Removing: '" .. featureDesc .. "'") end	
		-- return false
	-- end	
	
	-- return true;
-- end
--------------------------------------------------------------
function JFD_CouldHaveImprovement(improvementID, plot, isDebugging)
	
	if improvementID == GameInfoTypes["IMPROVEMENT_GOODY_HUT"] 
	or improvementID == GameInfoTypes["IMPROVEMENT_CITY_RUINS"]
	or improvementID == GameInfoTypes["IMPROVEMENT_BARBARIAN_CAMP"] then
		return true
	end

	if isJFDLLActive then
		return plot:CanHaveFeature(improvementID, -1, true)
	end
	
	local improvement = GameInfo.Improvements[improvementID]
	local improvementType = improvement.Type
	local improvementDesc = Locale.ConvertTextKey(improvement.Description)
	local featureID = plot:GetFeatureType()
	local improvementOtherID = plot:GetImprovementType()
	local resourceID = plot:GetResourceType()
	local terrainID = plot:GetTerrainType()
	local terrain = GameInfo.Terrains[terrainID]
	local terrainType = terrain.Type
	local terrainDesc = Locale.ConvertTextKey(terrain.Description)
	
	if plot:IsCity() then
		if isDebugging then print("IsCity check failed. Removing: '" .. improvementDesc .. "'") end	
		return false
	end
	
	if plot:IsImpassable() or plot:IsMountain() then
		if isDebugging then print("IsImpassable/IsMountain check failed. Removing: '" .. improvementDesc .. "'") end	
		return false
	end
	
	if improvement.NoFreshWater and plot:IsFreshWater() then
		if isDebugging then print("NoFreshWater check failed. Removing: '" .. improvementDesc .. "'") end	
		return false
	end
	if improvement.FreshWaterMakesValid and (not plot:IsFreshWater()) then
		if isDebugging then print("FreshWaterMakesValid check failed. Removing: '" .. improvementDesc .. "'") end	
		return false
	end
	if improvement.RequiresFlatlands and (not plot:IsFlatlands()) then
		if isDebugging then print("RequiresFlatlands check failed. Removing: '" .. improvementDesc .. "'") end	
		return false
	end
	if improvement.RequiresFlatlandsOrFreshWater and (not plot:IsFlatlands()) and (not plot:IsFreshWater()) then
		if isDebugging then print("RequiresFlatlandsOrFreshWater check failed. Removing: '" .. improvementDesc .. "'") end	
		return false
	end
	if improvement.RequiresFeature and featureID == -1 then
		if isDebugging then print("RequiresFeature check failed. Removing: '" .. improvementDesc .. "'") end	
		return false
	end
	if improvement.RequiresImprovement and improvementOtherID == -1 then
		if isDebugging then print("RequiresImprovement check failed. Removing: '" .. improvementDesc .. "'") end	
		return false
	end
	if improvement.Coastal and terrainID ~= GameInfoTypes["TERRAIN_COAST"] then
		if isDebugging then print("Coastal check failed. Removing: '" .. improvementDesc .. "'") end	
		return false
	end
	if improvement.Water and (not plot:IsWater()) then
		if isDebugging then print("Water check failed. Removing: '" .. improvementDesc .. "'") end	
		return false
	end
	if improvement.RiverSideMakesValid and (not plot:IsRiverSide()) then
		if isDebugging then print("RiverSideMakesValid check failed. Removing: '" .. improvementDesc .. "'") end	
		return false
	end
	if improvement.HillsMakesValid and (not plot:IsHills()) then
		if isDebugging then print("HillsMakeValid check failed. Removing: '" .. improvementDesc .. "'") end	
		return false
	end
	
	if featureID > -1 then
		local feature = GameInfo.Features[featureID]
		local featureType = feature.Type
		local featureDesc = Locale.ConvertTextKey(feature.Description)
		if feature.NoImprovement then
			if isDebugging then print("FeatureNoImprovement check failed. Removing: '" .. improvementDesc .. "'") end	
			return false
		else
			local row = GameInfo.Improvement_ValidFeatures("ImprovementType = '" .. improvementType .. "' AND FeatureType = '" .. featureType .. "'")()
			if (not row) then
				if isDebugging then print("ValidFeature check failed. Removing: '" .. improvementDesc .. "'") end	
				return false
			end
		end
	end
	
	if improvement.BuildableOnResources then
		if resourceID > -1 then
			local resource = GameInfo.Resources[resourceID]
			local resourceType = resource.Type
			local resourceDesc = Locale.ConvertTextKey(resource.Description)
			local row = GameInfo.Improvement_ResourceTypes("ImprovementType = '" .. improvementType .. "' AND ResourceMakesValid = 1 AND ResourceType = '" .. resourceType .. "'")()
			if (not row) then
				if isDebugging then print("ResourceMakesValid check failed. Removing: '" .. improvementDesc .. "''") end	
				return false
			end
		end
	end
	
	local row = GameInfo.Improvement_ValidTerrains("ImprovementType = '" .. improvementType .. "' AND TerrainType = '" .. terrainType .. "'")()
	if (not row) then
		if isDebugging then print("ValidTerrain check failed. Removing: '" .. improvementDesc .. "'") end	
		return false
	end
	
	return true;
end
--------------------------------------------------------------
function JFD_CouldHaveResource(resourceID, plot, isDebugging)
	if isJFDLLActive then
		return plot:CanHaveFeature(resourceID, true, true, true)
	end
	
	local featureID = plot:GetFeatureType()
	local resource = GameInfo.Resources[resourceID]
	local resourceType = resource.Type
	local resourceDesc = Locale.ConvertTextKey(resource.Description)
	local terrainID = plot:GetTerrainType()
	local terrain = GameInfo.Terrains[terrainID]
	local terrainType = terrain.Type
	local terrainDesc = Locale.ConvertTextKey(terrain.Description)
	
	if plot:IsMountain() then
		if isDebugging then print("IsMountain check failed. Removing: '" .. resourceDesc .. "'") end	
		return false
	end
	
	if (not resource.Hills) and plot:IsHills() then
		if isDebugging then print("Hills check failed. Removing: '" .. resourceDesc .. "'") end	
		return false
	end
	
	if (not resource.Flatlands) and plot:IsFlatlands() then
		if isDebugging then print("Flatlands check failed. Removing: '" .. resourceDesc .. "'") end	
		return false
	end
	
	if resource.NoRiverSide and plot:IsRiverSide() then
		if isDebugging then print("NoRiverSide check failed. Removing: '" .. resourceDesc .. "'") end	
		return false
	end
	
	if featureID > -1 then
		local feature = GameInfo.Features[featureID]
		local featureType = feature.Type
		local row = GameInfo.Resource_FeatureBooleans("ResourceType = '" .. resourceType .. "' AND FeatureType = '" .. featureType .. "'")()
		if (not row) then
			if isDebugging then print("Feature check failed. Removing: '" .. resourceDesc .. "'") end	
			return false
		end
		local row = GameInfo.Resource_FeatureTerrainBooleans("ResourceType = '" .. resourceType .. "' AND TerrainType = '" .. terrainType .. "'")()
		if (not row) then
			if isDebugging then print("FeatureTerrain check failed. Removing: '" .. resourceDesc .. "'") end	
			return false
		end
	else
		local row = GameInfo.Resource_TerrainBooleans("ResourceType = '" .. resourceType .. "' AND TerrainType = '" .. terrainType .. "'")()
		if (not row) then
			if isDebugging then print("Terrain check failed. Removing: '" .. resourceDesc .. "'") end	
			return false
		end
	end
	
	return true;
end
--------------------------------------------------------------
function JFD_CleanupIllegalTiles(isFeatures, isResources, isImprovements, isDebugging)
	local mapWidth, mapHeight = Map.GetGridSize()
	for y = 0, mapHeight-1, 1 do  
		for x = 0, mapWidth-1, 1 do
			local pPlot = Map.GetPlot(x, y)
			if pPlot then
				-- local iFeature = pPlot:GetFeatureType()
				-- if iFeature > -1 and isFeatures then
					-- if (not JFD_CouldHaveFeature(iFeature, pPlot, isDebugging)) then
						-- pPlot:SetFeatureType(-1, -1)
					-- end
				-- end
				local iImprovement = pPlot:GetImprovementType() 
				if iImprovement > -1 and isImprovements then
					if (not JFD_CouldHaveImprovement(iImprovement, pPlot, isDebugging)) then
						pPlot:SetImprovementType(-1)
					end
				end
				local iResource = pPlot:GetResourceType()
				if iResource > -1 and isResources then
					if (not JFD_CouldHaveResource(iResource, pPlot, isDebugging)) then
						local iImprovement = pPlot:GetImprovementType() 
						if (not pPlot:IsResourceConnectedByImprovement(iImprovement)) then
							pPlot:SetResourceType(-1, -1)
						end
					end
				end
			end
		end
	end
end