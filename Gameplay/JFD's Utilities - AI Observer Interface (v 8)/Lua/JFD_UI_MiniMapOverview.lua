-------------------------------------------------
-- OverlayMaps Overview Popup
-------------------------------------------------
include( "IconSupport" );
include( "InstanceManager" );
include( "JFD_OverlayMaps_Utils.lua" );

local isBNW = ContentManager.IsActive("6DA07636-4123-4018-B643-6575B4EC336B", ContentType.GAMEPLAY)
local isJFDLLActive = Game.IsJFDLLActive()
-------------------------------------------------
-- Global Constants
-------------------------------------------------

local DefaultColours = {
  UNKNOWN   = {Red=190, Green=190, Blue=190, Alpha=1.0},
  NONE      = {Red=0,   Green=0,   Blue=0,   Alpha=0.0},
  LAND      = {Red=90,   Green=131,   Blue=65,   Alpha=1.0},
  MOUNTAIN      = {Red=89,   Green=118,   Blue=74,   Alpha=1.0},
  WATER     = {Red=88,   Green=128,   Blue=143,   Alpha=1.0},
  COAST     = {Red=95,   Green=137,   Blue=155,   Alpha=1.0},
  OCEAN     = {Red=88,   Green=128,   Blue=143,   Alpha=1.0},
  ICE       = {Red=189, Green=242, Blue=255, Alpha=0.7},
  CITY      = {Red=255,   Green=255,   Blue=255,   Alpha=1.0},
  CAPITAL_CITY  = {Red=208,   Green=208,   Blue=208,   Alpha=1.0},
  HOLY_CITY = {Red=255, Green=255, Blue=0,   Alpha=1.0}
}
local Colours = {}

local iFeatureIce = GameInfoTypes.FEATURE_ICE
local iTerrainCoast = GameInfoTypes.TERRAIN_COAST
local iTerrainOcean = GameInfoTypes.TERRAIN_OCEAN
local iTerrainDesert = GameInfoTypes.TERRAIN_DESERT

local mapWidth, mapHeight = Map.GetGridSize()
Controls.Map:SetMapSize(mapWidth, mapHeight, 0,-1)

g_LegendInstanceManager = InstanceManager:new("LegendInstance", "LegendButton", Controls.LegendStack);
g_LegendPlayerInstanceManager = InstanceManager:new("PlayerInstance", "PlayerButton", Controls.LegendPlayersStack);
g_LegendBarbPlayerInstanceManager = InstanceManager:new("PlayerInstance", "PlayerButton", Controls.LegendBarbPlayersStack);
g_LegendMinorPlayerInstanceManager = InstanceManager:new("PlayerInstance", "PlayerButton", Controls.LegendMinorPlayersStack);
g_LegendReligionInstanceManager = InstanceManager:new("ReligionInstance", "ReligionButton", Controls.LegendReligionsStack);

local iCBRXWidth, iCBRXHeight = 180,94
local iMainGridCBRX, iMainGridCBRY = 1110,653
local iMapCBRX, iMapCBRXY = -50,15
local iScrollGridCBRX, iScrollGridCBRY = -40,15
local iShowPlayersButtonCBRX, iShowPlayersButtonCBRY = -40,25
local iOverlayClassPulldownCBRX, iOverlayClassPulldownCBRY = -56,-10
local iOverlayFilterPulldownCBRX, iOverlayFilterPulldownCBRY = -15,38
local iHorizontalTrimTopCBRSizeX, iHorizontalTrimTopCBRSizeY = 1030,5
local iHorizontalTrimTopCBRX, iHorizontalTrimTopCBRY = 0,25
local iBottomTrimTopCBRX, iBottomTrimTopCBRY = 1030,5
local iCloseButtonCBRX, iCloseButtonCBRY = -65,54
local iMapSubPulldownCBRX, iMapSubPulldownCBRY = 120,-10

if mapWidth == iCBRXWidth and mapHeight == iCBRXHeight then
	Controls.MainGrid:SetSizeVal(iMainGridCBRX, iMainGridCBRY)
	Controls.Map:SetOffsetVal(iMapCBRX,iMapCBRXY)
	Controls.ScrollGrid:SetOffsetVal(iScrollGridCBRX,iScrollGridCBRY)
	Controls.ShowPlayersButton:SetOffsetVal(iShowPlayersButtonCBRX,iShowPlayersButtonCBRY)
	Controls.OverlayMapClassesPullDown:SetOffsetVal(iOverlayClassPulldownCBRX,iOverlayClassPulldownCBRY)
	Controls.OverlayMapFilerPulldownStack:SetOffsetVal(iOverlayFilterPulldownCBRX,iOverlayFilterPulldownCBRY)
	Controls.OverlayMapSubsPulldownStack:SetOffsetVal(iMapSubPulldownCBRX,iMapSubPulldownCBRY)
	Controls.HorizontalTrimTop:SetSizeVal(iHorizontalTrimTopCBRSizeX,iHorizontalTrimTopCBRSizeY)
	Controls.HorizontalTrimTop:SetOffsetVal(iHorizontalTrimTopCBRX,iHorizontalTrimTopCBRY)
	Controls.CloseButtonBox:SetOffsetVal(iCloseButtonCBRX,iCloseButtonCBRY)
	Controls.MapTrimBottom:SetSizeVal(iBottomTrimTopCBRX,iBottomTrimTopCBRY)
end
-------------------------------------------------
-- Global Variables
-------------------------------------------------
local g_SelectedOverlayMapID = -1
local g_SelectedOverlayMapClassID = -1
local g_SelectedOverlayMapSubID = -1
local g_SelectedOverlayMapFilterID = -1
local g_SelectedOverlayMapFilterPlayerID = -1
local g_SelectedOverlayMapFilterTeamID = -1

local g_SelectedMapOverlayPlayers = nil
local g_SelectedMapOverlayOptions = {}

local numHeadersOpen = 0
local numPlayers = 0
local numMinorPlayers = 0
local numBarbPlayers = 0
local numReligions = 0
local numLegends = 0

local isCivHeaderOpen = true
local isCSHeaderOpen = false
local isLegendHeaderOpen = false
local isOptionsHeaderOpen = false
local isReliHeaderOpen = false
local isBarbHeaderOpen = false
local isShowPlayers = false
-------------------------------------------------
-------------------------------------------------

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
function IgnoreLeftClick( Id )
	-- just swallow it
end
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
function InputHandler( uiMsg, wParam, lParam )
    ----------------------------------------------------------------
    -- Key Down Processing
    ----------------------------------------------------------------
    if(uiMsg == KeyEvents.KeyDown) then
        if (wParam == Keys.VK_ESCAPE) then
			OnClose();
			return true;
        end

        -- Do Nothing.
        if(wParam == Keys.VK_RETURN) then
			return true;
        end
    end
end
ContextPtr:SetInputHandler( InputHandler );
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
function OnClose()
	UIManager:DequeuePopup(ContextPtr);
end
Controls.CloseButton:RegisterCallback(Mouse.eLClick, OnClose);
-------------------------------------------------------------------------------
--PLAYERS
-------------------------------------------------------------------------------
local g_PlayerLegendsTable = {}
local g_ReligionLegendsTable = {}
local g_SortedPlayerEntryTable = {}
local g_SortedPlayerPlusBarbsEntryTable = {}
local g_SortedBarbarianPlayerEntryTable = {}
local g_SortedMajorPlayerEntryTable = {}
local g_SortedMinorPlayerEntryTable = {}
function PopulateSortedPlayers()
	local iActivePlayer = Game.GetActivePlayer()
	local pActivePlayer = Players[iActivePlayer]
	local sActivePlayerDesc = Locale.ConvertTextKey("{Civ} ([COLOR_POSITIVE_TEXT]YOU[ENDCOLOR])", pActivePlayer:GetCivilizationShortDescription())

	for iPlayer=0, GameDefines.MAX_CIV_PLAYERS do
		local pPlayer = Players[iPlayer]
		if pPlayer:IsEverAlive() then
			local civDesc = pPlayer:GetCivilizationShortDescription()
			if pPlayer:IsMinorCiv() then
				table.insert(g_SortedMinorPlayerEntryTable, {iPlayer, civDesc})
			elseif pPlayer:IsBarbarian() then
				table.insert(g_SortedBarbarianPlayerEntryTable, {iPlayer, civDesc})
			else
				table.insert(g_SortedMajorPlayerEntryTable, {iPlayer, civDesc})
			end
			g_PlayerLegendsTable[iPlayer] = {}
		end
	end

	local f = function(a, b)
		return a[2] < b[2];
	end
	table.sort(g_SortedMajorPlayerEntryTable, f)
	table.sort(g_SortedMinorPlayerEntryTable, f)
	table.sort(g_SortedBarbarianPlayerEntryTable, f)

	for _, tPlayer in ipairs(g_SortedMajorPlayerEntryTable) do
		table.insert(g_SortedPlayerEntryTable, {tPlayer[1], tPlayer[2]})
		table.insert(g_SortedPlayerPlusBarbsEntryTable, {tPlayer[1], tPlayer[2]})
	end
	for _, tPlayer in ipairs(g_SortedMinorPlayerEntryTable) do
		table.insert(g_SortedPlayerEntryTable, {tPlayer[1], tPlayer[2]})
		table.insert(g_SortedPlayerPlusBarbsEntryTable, {tPlayer[1], tPlayer[2]})
	end
	for _, tPlayer in ipairs(g_SortedBarbarianPlayerEntryTable) do
		table.insert(g_SortedPlayerEntryTable, {tPlayer[1], tPlayer[2]})
		table.insert(g_SortedPlayerPlusBarbsEntryTable, {tPlayer[1], tPlayer[2]})
	end
	g_SelectedMapOverlayPlayers = g_SortedPlayerEntryTable
end
PopulateSortedPlayers()
-------------------------------------------------------------------------------
local g_SortedRankedPlayerEntryTable
function PopulateRankedPlayers(overlayMapID)
	local iActiveTeam = g_SelectedOverlayMapFilterTeamID
	local isActiveTeam = (iActiveTeam ~= -1)

	g_SortedRankedPlayerEntryTable = {}
	local tablePlayers = g_SortedPlayerEntryTable
	if g_SelectedOverlayMapFilterID ~= -1 then
		local overlayMapFilter = GameInfo.JFD_OverlayMapFilters[g_SelectedOverlayMapFilterID]
		local overlayMapFilterType = overlayMapFilter.Type
		if overlayMapFilterType == "FILTER_ALL_MAJORS" then
			tablePlayers = g_SortedMajorPlayerEntryTable
		elseif overlayMapFilterType == "FILTER_ALL_MINORS" then
			tablePlayers = g_SortedMinorPlayerEntryTable
		end
	end

	local numRankHighestVal = 0
	local numRankHighestPlayerID = 0
	for _, tPlayer in ipairs(tablePlayers) do
		local iPlayer = tPlayer[1]
		local pPlayer = Players[iPlayer]
		if pPlayer:IsAlive() and ((isActiveTeam and Teams[pPlayer:GetTeam()]:IsHasMet(iActiveTeam)) or (not isActiveTeam)) then
			local numRankVal = pPlayer:GetValueForRankForOverlayMap(overlayMapID)
			if numRankVal > numRankHighestVal then
				numRankHighestVal = numRankVal
				numRankHighestPlayerID = iPlayer
			end
			table.insert(g_SortedRankedPlayerEntryTable, {iPlayer, numRankVal})
		end
	end

	local f = function(a, b)
		return a[2] > b[2];
	end
	table.sort(g_SortedRankedPlayerEntryTable, f)

	local numRankTotal = #g_SortedRankedPlayerEntryTable
	for numRank, tPlayer in ipairs(g_SortedRankedPlayerEntryTable) do
		local iPlayer = tPlayer[1]
		local numRankVal = tPlayer[2]
		g_PlayerLegendsTable[iPlayer].RankInfo = {Rank = numRank, RankTotal = numRankTotal, RankVal = numRankVal, RankHighestVal = numRankHighestVal}
	end
end
-------------------------------------------------------------------------------
local g_SortedPlayersEntryTable
local g_SortedActivePlayerEntryTable
function PopulatePlayers(overlayMapID)
	g_SortedPlayersEntryTable = {}
	g_SortedActivePlayerEntryTable = {}
	local iActivePlayer = g_SelectedOverlayMapFilterPlayerID
	local iActiveTeam = g_SelectedOverlayMapFilterTeamID
	local isActiveTeam = (iActiveTeam ~= -1)
	table.insert(g_SortedActivePlayerEntryTable, {iActivePlayer})
	for i, tPlayer in ipairs(g_SelectedMapOverlayPlayers) do
		local iPlayer = tPlayer[1]
		local pPlayer = Players[iPlayer]
		local pOtherTeam = Teams[pPlayer:GetTeam()]
		if pPlayer:IsAlive() and ((isActiveTeam and pOtherTeam:IsHasMet(iActiveTeam)) or (not isActiveTeam)) then
			table.insert(g_SortedPlayersEntryTable, {iPlayer})
			g_PlayerLegendsTable[iPlayer] = {}
			g_PlayerLegendsTable[iPlayer].Checked = true
			g_PlayerLegendsTable[iPlayer].Visible = true
		end
	end
end
-------------------------------------------------------------------------------
local g_SortedPlayerReligionEntryTable
function PopulateReligions(overlayMapID)
	g_SortedPlayerReligionEntryTable = {}
	for i, tPlayer in ipairs(g_SelectedMapOverlayPlayers) do
		local iPlayer = tPlayer[1]
		local pPlayer = Players[iPlayer]
		if pPlayer:IsEverAlive() then
			if pPlayer:HasCreatedReligion() then
				local iReligion = pPlayer:GetReligionCreatedByPlayer()
				table.insert(g_SortedPlayerReligionEntryTable, {iReligion, Game.GetReligionName(iReligion), iPlayer})
				g_ReligionLegendsTable[iReligion] = {}
				g_ReligionLegendsTable[iReligion].Checked = true
				g_ReligionLegendsTable[iReligion].Visible = true
			end
		end
	end

	local f = function(a, b)
		return a[2] < b[2];
	end
	table.sort(g_SortedReligionEntryTable, f)
end
-------------------------------------------------------------------------------
local g_ActiveOverlayMap
function PopulateActiveOverlayMap(overlayMapID)
	local overlayMap = GameInfo.JFD_OverlayMaps[overlayMapID]
	local overlayMapType = overlayMap.Type
	g_ActiveOverlayMap = {}
	g_ActiveOverlayMap[overlayMapType] = {}
	for row in GameInfo.JFD_OverlayMap_Legends("OverlayMapType='" .. overlayMapType .. "'") do
		local legendType = row.LegendType
		g_ActiveOverlayMap[overlayMapType][legendType] = {}
		g_ActiveOverlayMap[overlayMapType][legendType].Checked = row.DefaultChecked
		g_ActiveOverlayMap[overlayMapType][legendType].Visible = false
	end
	if overlayMap.PopulatePlayers then
		PopulatePlayers(overlayMapID)
	end
	if overlayMap.PopulateRankings then
		PopulateRankedPlayers(overlayMapID)
	end
	if overlayMap.PopulateReligions then
		PopulateReligions(overlayMapID)
	end
end
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
function GetColour(overlayMapID, thisLegend, thisLegendInfo, iPlayer, iReligion, pPlot)

	local overlayMap = GameInfo.JFD_OverlayMaps[overlayMapID]
	local overlayMapType = overlayMap.Type
	local overlayLegend = GameInfo.JFD_OverlayMap_Legends("OverlayMapType = '".. overlayMapType .. "' AND LegendType = '" .. thisLegend .. "'")()

	local colour
	local colourAlpha
	local colorType = overlayLegend.ColorType
	local colorAlpha = overlayLegend.ColorAlpha

	if colorType then
		colour = GameInfo.Colors[colorType]
		colourAlpha = colour.Alpha
	end

	if overlayLegend.UseReligionColor and (iReligion  and iReligion > 0) then
		local religionType = GameInfo.Religions[iReligion].Type
		local religionColour = GameInfo.Religion_MapColors("ReligionType = '" .. religionType .. "'")()
		colour = GameInfo.Colors[religionColour]
		colourAlpha = colour.Alpha
	end

	if overlayLegend.UseAreaColorType and pPlot then
		local iArea = pPlot:Area():GetID()
		if iArea > -1 then
			colour = GameInfo.Colors[iArea]
		end
	elseif overlayLegend.UseFilteredPlayerColor and (g_SelectedOverlayMapFilterPlayerID and g_SelectedOverlayMapFilterPlayerID > -1) then
		local pPlayer = Players[g_SelectedOverlayMapFilterPlayerID]
		local playerColour = GameInfo.PlayerColors[pPlayer:GetPlayerColor()]
		colour = GameInfo.Colors[playerColour.SecondaryColor]
	elseif overlayLegend.UsePlayerColor and (iPlayer and iPlayer > -1) then
		local pPlayer = Players[iPlayer]
		local playerColour = GameInfo.PlayerColors[pPlayer:GetPlayerColor()]
		colour = GameInfo.Colors[playerColour.SecondaryColor]
	elseif overlayLegend.UsePlayerColorInverted and (iPlayer and iPlayer > -1) then
		local pPlayer = Players[iPlayer]
		local playerColour = GameInfo.PlayerColors[pPlayer:GetPlayerColor()]
		colour = GameInfo.Colors[playerColour.PrimaryColor]
		colourAlpha = colour.Alpha
	end

	if (not colour) and overlayLegend.UsePlayerColorFallback then
		local pPlayer = Players[iPlayer]
		local playerColour = GameInfo.PlayerColors[pPlayer:GetPlayerColor()]
		colour = GameInfo.Colors[playerColour.SecondaryColor]
		colourAlpha = colour.Alpha
	end

	if overlayLegend.UseRankedColor and (iPlayer and iPlayer > -1) then
		colour = GameInfo.Colors[overlayLegendRankings.ColorType]
		colourAlpha = colour.Alpha

		local rankInfo = g_PlayerLegendsTable[iPlayer].RankInfo
		local rank = rankInfo.Rank
		local rankHighestVal = rankInfo.RankHighestVal
		local rankTotal = rankInfo.RankTotal
		local rankVal = rankInfo.RankVal
		local overlayLegendRankings = GameInfo.JFD_OverlayMap_Rankings("OverlayMapType = '" .. overlayMapType .. "'")()
		local colorTypeAlt = overlayLegendRankings.ColorTypeAlt
		if colorTypeAlt then
			local numValEquals = overlayLegendRankings.ColorTypeAltEqualToValue
			local numValLessOrEquals = overlayLegendRankings.ColorTypeAltLessOrEqualToValue
			local numValLess = overlayLegendRankings.ColorTypeAltLessThanValue
			local numValGreaterOrEquals = overlayLegendRankings.ColorTypeAltGreaterOrEqualToValue
			local numValGreater = overlayLegendRankings.ColorTypeAltGreaterThanValue
			if numValEquals ~= -1 and rankVal == numValEquals then
				colour = GameInfo.Colors[colorTypeAlt]
			elseif numValLessOrEquals ~= -1 and rankVal <= numValLessOrEquals then
				colour = GameInfo.Colors[colorTypeAlt]
			elseif numValLess ~= -1 and rankVal < numValLess then
				colour = GameInfo.Colors[colorTypeAlt]
			elseif numValGreaterOrEquals ~= -1 and rankVal >= numValGreaterOrEquals then
				colour = GameInfo.Colors[colorTypeAlt]
			elseif numValGreater ~= -1 and rankVal > numValGreater then
				colour = GameInfo.Colors[colorTypeAlt]
			end
		else
			colour = GetColourAdjustedForRank(colour, rank, rankHighestVal, rankTotal, rankVal)
		end
	end
	if colour then
		if colorAlpha ~= colourAlpha then
			colourAlpha = colorAlpha
		end
		return {Red=(255*colour.Red), Green=(255*colour.Green), Blue=(255*colour.Blue), Alpha=colourAlpha}
	end
end
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
function GetColourForPlayer(iPlayer)
	local pPlayer = Players[iPlayer]

	local colour

	local playerColour = GameInfo.PlayerColors[pPlayer:GetPlayerColor()]
	colour = GameInfo.Colors[playerColour.SecondaryColor]

	return {Red=(255*colour.Red), Green=(255*colour.Green), Blue=(255*colour.Blue), Alpha=colour.Alpha}
end
-------------------------------------------------------------------------------
function GetColourForCityPlot(overlayMapID, iPlayer, pCity)
	local pPlayer = Players[iPlayer]
	local overlayMap = GameInfo.JFD_OverlayMaps[overlayMapID]
	local overlayMapType = overlayMap.Type
	local optionShowBorders = g_SelectedMapOverlayOptions["OVERLAY_JFD_OPTION_SHOW_BORDERS"]

	local colour
	local colourAlpha = 1

	if pCity:IsCapital() then
		colour = DefaultColours.CAPITAL_CITY
	else
		colour = DefaultColours.CITY
	end

	if (optionShowBorders.Check and optionShowBorders.IsValid) or overlayMapType == "OVERLAY_MAP_JFD_PLAYERS_BORDERS_OWNER" then
		local playerColour, _ = pPlayer:GetPlayerColors()
		colour = {Red=(255*playerColour.x), Green=(255*playerColour.y), Blue=(255*playerColour.z), Alpha=playerColour.w}
	end

	return colour
end
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
function ShadeMap(overlayMapID)
	local iActiveTeam = g_SelectedOverlayMapFilterTeamID
	local isActiveTeam = (iActiveTeam ~= -1)

	local overlayMapOptionShowTerrain = true

	for y = 0, mapHeight-1, 1 do
		for x = 0, mapWidth-1, 1 do
			local pPlot = Map.GetPlot(x, y)
			if pPlot then
				local colour = DefaultColours.UNKNOWN
				if (isActiveTeam and pPlot:IsRevealed(iActiveTeam)) or (not isActiveTeam) then
					if (pPlot:GetFeatureType() == iFeatureIce) then
						colour = DefaultColours.ICE
					elseif (pPlot:IsWater()) then
						if overlayMapOptionShowTerrain then
							colour = DefaultColours.WATER
						else
							if pPlot:GetTerrainType() == iTerrainCoast then
								colour = DefaultColours.COAST
							else
								colour = DefaultColours.OCEAN
							end
						end
					else
						if overlayMapOptionShowTerrain then
							colour = DefaultColours.NONE
						else
							if pPlot:IsMountain() then
								colour = DefaultColours.MOUNTAIN
							else
								colour = DefaultColours.LAND
							end
						end
					end
				end
				Controls.Map:SetPlot(x, y, pPlot:GetTerrainType(), colour.Red/255, colour.Green/255, colour.Blue/255, colour.Alpha)
			end
		end
	end
	ShadeTiles(overlayMapID)
end
-------------------------------------------------------------------------------
function ShadeTiles(overlayMapID)
	local iActivePlayer = g_SelectedOverlayMapFilterPlayerID
	local isActivePlayer = (iActivePlayer ~= -1)
	local iActiveTeam = g_SelectedOverlayMapFilterTeamID
	local isActiveTeam = (iActiveTeam ~= -1)

	local overlayMap = GameInfo.JFD_OverlayMaps[overlayMapID]
	local overlayMapType = overlayMap.Type
	local overlayMapIterateTiles = overlayMap.IterateTiles
	local overlayMapIteratePlayers = overlayMap.IteratePlayers
	local overlayMapIteratePlayerCities = overlayMap.IteratePlayerCities
	local overlayMapIteratePlayerTiles = overlayMap.IteratePlayerTiles
	local overlayMapIteratePlayerUnits = overlayMap.IteratePlayerUnits

	local overlayMapFilterID = g_SelectedOverlayMapFilterID
	local overlayMapOptionExcInactive = (g_SelectedMapOverlayOptions["OVERLAY_JFD_OPTION_EXCLUDE_INACTIVE"].Check and g_SelectedMapOverlayOptions["OVERLAY_JFD_OPTION_EXCLUDE_INACTIVE"].IsValid)
	local overlayMapOptionExcPillagedTiles = (g_SelectedMapOverlayOptions["OVERLAY_JFD_OPTION_EXCLUDE_PILLAGED_TILES"].Check and g_SelectedMapOverlayOptions["OVERLAY_JFD_OPTION_EXCLUDE_PILLAGED_TILES"].IsValid)
	local overlayMapOptionExcWaterTiles = (g_SelectedMapOverlayOptions["OVERLAY_JFD_OPTION_EXCLUDE_WATER_TILES"].Check and g_SelectedMapOverlayOptions["OVERLAY_JFD_OPTION_EXCLUDE_WATER_TILES"].IsValid)
	local overlayMapOptionIncBarbs = (g_SelectedMapOverlayOptions["OVERLAY_JFD_OPTION_INCLUDE_BARBARIANS"].Check and g_SelectedMapOverlayOptions["OVERLAY_JFD_OPTION_INCLUDE_BARBARIANS"].IsValid)
	local overlayMapOptionIncCityTiles = (g_SelectedMapOverlayOptions["OVERLAY_JFD_OPTION_INCLUDE_CITY_TILES"].Check and g_SelectedMapOverlayOptions["OVERLAY_JFD_OPTION_INCLUDE_CITY_TILES"].IsValid)
	local overlayMapOptionIncEmbarkUnits = (g_SelectedMapOverlayOptions["OVERLAY_JFD_OPTION_INCLUDE_EMARBKED_UNITS"].Check and g_SelectedMapOverlayOptions["OVERLAY_JFD_OPTION_INCLUDE_EMARBKED_UNITS"].IsValid)
	local overlayMapOptionShowBorders = (g_SelectedMapOverlayOptions["OVERLAY_JFD_OPTION_SHOW_BORDERS"].Check and g_SelectedMapOverlayOptions["OVERLAY_JFD_OPTION_SHOW_BORDERS"].IsValid)
	local overlayMapOptionShowCities = (g_SelectedMapOverlayOptions["OVERLAY_JFD_OPTION_SHOW_CITIES"].Check and g_SelectedMapOverlayOptions["OVERLAY_JFD_OPTION_SHOW_CITIES"].IsValid)
	local overlayMapOptionShowStarts = (g_SelectedMapOverlayOptions["OVERLAY_JFD_OPTION_SHOW_STARTS"].Check and g_SelectedMapOverlayOptions["OVERLAY_JFD_OPTION_SHOW_STARTS"].IsValid)
	local overlayMapOptionShowTerrain = (g_SelectedMapOverlayOptions["OVERLAY_JFD_OPTION_SHOW_TERRAIN"].Check and g_SelectedMapOverlayOptions["OVERLAY_JFD_OPTION_SHOW_TERRAIN"].IsValid)

	local playersTable = g_SortedPlayersEntryTable
	if overlayMapOptionExcInactive then
		playersTable = g_SortedActivePlayerEntryTable
	end
	if (overlayMapOptionShowBorders or overlayMapOptionShowCities or overlayMapOptionShowStarts) and (not overlayMapOptionIncCityTiles) then
		for i, tPlayer in ipairs(playersTable) do
			local iOtherPlayer = tPlayer[1]
			local pOtherPlayer = Players[iOtherPlayer]
			local iOtherTeam = pOtherPlayer:GetTeam()
			local thisLegendPlayer = g_PlayerLegendsTable[iOtherPlayer]
			if (thisLegendPlayer and thisLegendPlayer.Checked) then
				if overlayMapOptionShowBorders and pOtherPlayer:GetNumCities() > 0 then
					local colour = GetColourForPlayer(iOtherPlayer)
					local colourA = colour.Alpha
					for pCity in pOtherPlayer:Cities() do
						local pPlotX = pCity:GetX()
						local pPlotY = pCity:GetY()
						local pPlot = Map.GetPlot(pPlotX, pPlotY)
						if (isActiveTeam and pPlot:IsRevealed(iActiveTeam)) or (not isActiveTeam) then
							ShadeCityTiles(iActiveTeam, pCity, colour, colourA, (not overlayMapOptionShowCities), (not overlayMapOptionExcWaterTiles))
						end
					end
				end
				if overlayMapOptionShowCities then
					for pCity in pOtherPlayer:Cities() do
						local pPlotX = pCity:GetX()
						local pPlotY = pCity:GetY()
						local pPlot = Map.GetPlot(pPlotX, pPlotY)
						if pPlot then
							if (isActiveTeam and pPlot:IsRevealed(iActiveTeam)) or (not isActiveTeam) then
								local colour = GetColourForCityPlot(overlayMapID, iOtherPlayer, pCity)
								local colourA = colour.Alpha
								Controls.Map:SetPlot(pPlotX, pPlotY, pPlot:GetTerrainType(), colour.Red/255, colour.Green/255, colour.Blue/255, colourA)
							end
						end
					end
				end
				if overlayMapOptionShowStarts and pOtherPlayer:GetNumCities() == 0 then
					local pPlot = pOtherPlayer:GetStartingPlot()
					if pPlot then
						local pPlotX = pPlot:GetX()
						local pPlotY = pPlot:GetY()
						if (isActiveTeam and pPlot:IsRevealed(iActiveTeam)) or (not isActiveTeam) then
							local colour = GetColourForPlayer(iOtherPlayer)
							local colourA = colour.Alpha
							Controls.Map:SetPlot(pPlotX, pPlotY, pPlot:GetTerrainType(), colour.Red/255, colour.Green/255, colour.Blue/255, colourA)
						end
					end
				end
			end
		end
	end

	if overlayMapIterateTiles then
		for y = 0, mapHeight-1, 1 do
		for x = 0, mapWidth-1, 1 do
			local pPlot = Map.GetPlot(x, y)
			if (isActiveTeam and pPlot:IsRevealed(iActiveTeam)) or (not isActiveTeam) then
				local iOtherPlayer = pPlot:GetOwner()
				local iFeature = pPlot:GetFeatureType()
				local iTerrain = pPlot:GetTerrainType()
				if iTerrain ~= iTerrainOcean and iTerrain ~= iTerrainCoast and pPlot:GetFeatureType() ~= iFeatureIce then
					local thisLegend = GetOverlayMapLegend(overlayMapID, overlayMapFilterID, iActivePlayer, iActiveTeam, iOtherPlayer, iOtherTeam, pCity, pPlot, pUnit, iReligion)
					if thisLegend then
						local thisLegendInfo = g_ActiveOverlayMap[overlayMapType][thisLegend]
						if thisLegendInfo then
							local colour = GetColour(overlayMapID, thisLegend, thisLegendInfo, iOtherPlayer, pPlot)
							local colourA = colour.Alpha
							if colour then
								if thisLegendInfo.Checked then
									Controls.Map:SetPlot(x, y, pPlot:GetTerrainType(), colour.Red/255, colour.Green/255, colour.Blue/255, colourA)
								end
								if (not thisLegendInfo.Colour) or thisLegendInfo.Colour ~= colour then
									thisLegendInfo.Colour = colour
								end
								if (not thisLegendInfo.Visible) then
									thisLegendInfo.Visible = true
								end
							end
						end
					end
				end
			end
		end
		end
	elseif overlayMapIteratePlayerTiles then
		if overlayMapOptionExcInactive and isActivePlayer then
			local iOtherPlayer = iActivePlayer
			local pOtherPlayer = Players[iOtherPlayer]
			for pCity in pOtherPlayer:Cities() do
				for i = 1, pCity:GetNumCityPlots()-1, 1 do
					local pPlot = pCity:GetCityIndexPlot(i)
					if pPlot and (pPlot:GetOwner() == pCity:GetOwner()) then
						if ((overlayMapOptionExcPillagedTiles and (not pPlot:IsImprovementPillaged()) and (not pPlot:IsRoutePillaged())) or (not overlayMapOptionExcPillagedTiles))
						and ((overlayMapOptionExcWaterTiles and (not pPlot:IsWater())) or (not overlayMapOptionExcWaterTiles)) then
							local thisLegendPlayer = g_PlayerLegendsTable[iOtherPlayer]
							if (thisLegendPlayer and thisLegendPlayer.Checked) then
								local thisLegend = GetOverlayMapLegend(overlayMapID, overlayMapFilterID, iActivePlayer, iActiveTeam, iOtherPlayer, iOtherTeam, pCity, pPlot, pUnit, iReligion)
								if thisLegend then
									local thisLegendInfo = g_ActiveOverlayMap[overlayMapType][thisLegend]
									if thisLegendInfo then
										local colour = GetColour(overlayMapID, thisLegend, thisLegendInfo, iOtherPlayer)
										local colourA = colour.Alpha
										if thisLegendInfo.Checked then
											Controls.Map:SetPlot(x, y, pPlot:GetTerrainType(), colour.Red/255, colour.Green/255, colour.Blue/255, colourA)
										end
										if (not thisLegendInfo.Colour) or thisLegendInfo.Colour ~= colour then
											thisLegendInfo.Colour = colour
										end
										if (not thisLegendInfo.Visible) then
											thisLegendInfo.Visible = true
										end
										if (not thisLegendPlayer.Colour) or thisLegendPlayer.Colour ~= colour then
											thisLegendPlayer.Colour = colour
										end
										if (not thisLegendPlayer.Legend) or thisLegendPlayer.Legend ~= thisLegend then
											thisLegendPlayer.Legend = thisLegend
										end
									end
								end
							end
						end
					end
				end
			end
		else
			for y = 0, mapHeight-1, 1 do
			for x = 0, mapWidth-1, 1 do
				local pPlot = Map.GetPlot(x, y)
				if ((overlayMapOptionExcPillagedTiles and (not pPlot:IsImprovementPillaged()) and (not pPlot:IsRoutePillaged())) or (not overlayMapOptionExcPillagedTiles)) then
					if (isActiveTeam and pPlot:IsRevealed(iActiveTeam)) or (not isActiveTeam) then
						local iOtherPlayer = pPlot:GetOwner()
						if iOtherPlayer > -1 then
							local pOtherPlayer = Players[iOtherPlayer]
							if pOtherPlayer:IsAlive() then
								local iOtherTeam = pOtherPlayer:GetTeam()
								local pOtherTeam = Teams[iPlayerTeam]
								if ((isActiveTeam and pOtherTeam:IsHasMet(iActiveTeam)) or (not isActiveTeam)) then
									local thisLegendPlayer = g_PlayerLegendsTable[iOtherPlayer]
									if (thisLegendPlayer and thisLegendPlayer.Checked) then
										local thisLegend = GetOverlayMapLegend(overlayMapID, overlayMapFilterID, iActivePlayer, iActiveTeam, iOtherPlayer, iOtherTeam, pCity, pPlot, pUnit, iReligion)
										if thisLegend then
											local thisLegendInfo = g_ActiveOverlayMap[overlayMapType][thisLegend]
											if thisLegendInfo then
												local colour = GetColour(overlayMapID, thisLegend, thisLegendInfo, iOtherPlayer)
												local colourA = colour.Alpha
												if thisLegendInfo.Checked then
													Controls.Map:SetPlot(x, y, pPlot:GetTerrainType(), colour.Red/255, colour.Green/255, colour.Blue/255, colourA)
												end
												if (not thisLegendInfo.Colour) or thisLegendInfo.Colour ~= colour then
													thisLegendInfo.Colour = colour
												end
												if (not thisLegendInfo.Visible) then
													thisLegendInfo.Visible = true
												end
												if (not thisLegendPlayer.Colour) or thisLegendPlayer.Colour ~= colour then
													thisLegendPlayer.Colour = colour
												end
												if (not thisLegendPlayer.Legend) or thisLegendPlayer.Legend ~= thisLegend then
													thisLegendPlayer.Legend = thisLegend
												end
											end
										end
									end
								end
							end
						else
							local thisLegend = GetOverlayMapLegend(overlayMapID, overlayMapFilterID, iActivePlayer, iActiveTeam, iOtherPlayer, iOtherTeam, pCity, pPlot, pUnit, iReligion)
							if thisLegend then
								local thisLegendInfo = g_ActiveOverlayMap[overlayMapType][thisLegend]
								if thisLegendInfo then
									local colour = GetColour(overlayMapID, thisLegend, thisLegendInfo, iOtherPlayer)
									local colourA = colour.Alpha
									if colour then
										if thisLegendInfo.Checked then
											Controls.Map:SetPlot(x, y, pPlot:GetTerrainType(), colour.Red/255, colour.Green/255, colour.Blue/255, colourA)
										end
										if (not thisLegendInfo.Colour) or thisLegendInfo.Colour ~= colour then
											thisLegendInfo.Colour = colour
										end
										if (not thisLegendInfo.Visible) then
											thisLegendInfo.Visible = true
										end
									end
								end
							end
						end
					end
				end
			end
			end
		end
	elseif overlayMapIteratePlayers then
		for i, tPlayer in ipairs(playersTable) do
			local iOtherPlayer = tPlayer[1]
			local thisLegendPlayer = g_PlayerLegendsTable[iOtherPlayer]
			if (thisLegendPlayer and thisLegendPlayer.Checked) then
				local pOtherPlayer = Players[iOtherPlayer]
				local iOtherTeam = pOtherPlayer:GetTeam()
				local pOtherTeam = Teams[iOtherTeam]
				local thisLegend = GetOverlayMapLegend(overlayMapID, overlayMapFilterID, iActivePlayer, iActiveTeam, iOtherPlayer, iOtherTeam, pCity, pPlot, pUnit, iReligion)
				if thisLegend then
					local thisLegendInfo = g_ActiveOverlayMap[overlayMapType][thisLegend]
					if thisLegendInfo then
						local colour = GetColour(overlayMapID, thisLegend, thisLegendInfo, iOtherPlayer)
						local colourA = colour.Alpha
						if thisLegendInfo.Checked then
							for pCity in pOtherPlayer:Cities() do
								ShadeCityTiles(iActiveTeam, pCity, colour, colourA, (not overlayMapOptionShowCities), (not overlayMapOptionExcWaterTiles))
							end
						end
						if (not thisLegendInfo.Colour) or thisLegendInfo.Colour ~= colour then
							thisLegendInfo.Colour = colour
						end
						if (not thisLegendInfo.Visible) then
							thisLegendInfo.Visible = true
						end
						if (not thisLegendPlayer.Colour) or thisLegendPlayer.Colour ~= colour then
							thisLegendPlayer.Colour = colour
						end
						if (not thisLegendPlayer.Legend) or thisLegendPlayer.Legend ~= thisLegend then
							thisLegendPlayer.Legend = thisLegend
						end
					end
				end
			end
		end
	elseif overlayMapIteratePlayerCities then
		for i, tPlayer in ipairs(playersTable) do
			local iOtherPlayer = tPlayer[1]
			local thisLegendPlayer = g_PlayerLegendsTable[iOtherPlayer]
			if (thisLegendPlayer and thisLegendPlayer.Checked) then
				local pOtherPlayer = Players[iOtherPlayer]
				local iOtherTeam = pOtherPlayer:GetTeam()
				local pOtherTeam = Teams[iOtherTeam]
				for pCity in pOtherPlayer:Cities() do
					local thisLegend = GetOverlayMapLegend(overlayMapID, overlayMapFilterID, iActivePlayer, iActiveTeam, iOtherPlayer, iOtherTeam, pCity, pPlot, pUnit, iReligion)
					if thisLegend then
						local thisLegendInfo = g_ActiveOverlayMap[overlayMapType][thisLegend]
						if thisLegendInfo then
							local colour = GetColour(overlayMapID, thisLegend, thisLegendInfo, iOtherPlayer)
							local colourA = colour.Alpha
							local pPlotX = pCity:GetX()
							local pPlotY = pCity:GetY()
							local pPlot = Map.GetPlot(pPlotX, pPlotY)
							if thisLegendInfo.Checked then
								Controls.Map:SetPlot(pPlotX, pPlotY, pPlot:GetTerrainType(), colour.Red/255, colour.Green/255, colour.Blue/255, colourA)
								if overlayMapOptionIncCityTiles then
									ShadeCityTiles(iActiveTeam, pCity, colour, colourA, (not overlayMapOptionShowCities), (not overlayMapOptionExcWaterTiles))
								end
							end
							if (not thisLegendInfo.Colour) or thisLegendInfo.Colour ~= colour then
								thisLegendInfo.Colour = colour
							end
							if (not thisLegendInfo.Visible) then
								thisLegendInfo.Visible = true
							end
							if (not thisLegendPlayer.Colour) or thisLegendPlayer.Colour ~= colour then
								thisLegendPlayer.Colour = colour
							end
							if (not thisLegendPlayer.Legend) or thisLegendPlayer.Legend ~= thisLegend then
								thisLegendPlayer.Legend = thisLegend
							end
						end
					end
				end
			end
		end
	elseif overlayMapIteratePlayerUnits then
		for i, tPlayer in ipairs(playersTable) do
			local iOtherPlayer = tPlayer[1]
			local thisLegendPlayer = g_PlayerLegendsTable[iOtherPlayer]
			if (thisLegendPlayer and thisLegendPlayer.Checked) then
				local pOtherPlayer = Players[iOtherPlayer]
				local iOtherTeam = pOtherPlayer:GetTeam()
				local pOtherTeam = Teams[iOtherTeam]
				for pUnit in pOtherPlayer:Units() do
					if (pUnit:IsEmbarked() and overlayMapOptionIncEmbarkUnits) or (not pUnit:IsEmbarked()) then
						local thisLegend = GetOverlayMapLegend(overlayMapID, overlayMapFilterID, iActivePlayer, iActiveTeam, iOtherPlayer, iOtherTeam, pCity, pPlot, pUnit, iReligion)
						if thisLegend then
							local thisLegendInfo = g_ActiveOverlayMap[overlayMapType][thisLegend]
							if thisLegendInfo then
								local colour = GetColour(overlayMapID, thisLegend, thisLegendInfo, iOtherPlayer)
								local colourA = colour.Alpha
								local pPlotX = pUnit:GetX()
								local pPlotY = pUnit:GetY()
								local pPlot = Map.GetPlot(pPlotX, pPlotY)
								if thisLegendInfo.Checked then
									Controls.Map:SetPlot(pPlotX, pPlotY, pPlot:GetTerrainType(), colour.Red/255, colour.Green/255, colour.Blue/255, colourA)
								end
								if (not thisLegendInfo.Colour) or thisLegendInfo.Colour ~= colour then
									thisLegendInfo.Colour = colour
								end
								if (not thisLegendInfo.Visible) then
									thisLegendInfo.Visible = true
								end
								if (not thisLegendPlayer.Colour) or thisLegendPlayer.Colour ~= colour then
									thisLegendPlayer.Colour = colour
								end
								if (not thisLegendPlayer.Legend) or thisLegendPlayer.Legend ~= thisLegend then
									thisLegendPlayer.Legend = thisLegend
								end
							end
						end
					end
				end
			end
		end
	end
end
-------------------------------------------------------------------------------
--Original func. by Whoward
function ShadeCityTiles(iActiveTeam, pCity, colour, colourA, isShadeCityTile, isIncludeWaterTiles)
	local isActiveTeam = (iActiveTeam ~= -1)
	for i = 1, pCity:GetNumCityPlots()-1, 1 do
		local pPlot = pCity:GetCityIndexPlot(i)
		if (pPlot and (isActiveTeam and pPlot:IsRevealed(iActiveTeam))) or (pPlot and (not isActiveTeam)) then
			if (pPlot:GetOwner() == pCity:GetOwner()) then
				if (((not pPlot:IsWater()) and (not isIncludeWaterTiles)) or isIncludeWaterTiles) then
					if (pPlot:IsMountain() or pPlot:GetTerrainType() == iTerrainDesert or pCity:IsWorkingPlot(pPlot) or pCity:CanWork(pPlot)) then
						Controls.Map:SetPlot(pPlot:GetX(), pPlot:GetY(), pPlot:GetTerrainType(), colour.Red/255, colour.Green/255, colour.Blue/255, colourA)
					end
				end
			end
		end
	end
	if isShadeCityTile then
		local pPlotX = pCity:GetX()
		local pPlotY = pCity:GetY()
		local pPlot = Map.GetPlot(pPlotX, pPlotY)
		if pPlot and (isActiveTeam and pPlot:IsRevealed(iActiveTeam)) or (not isActiveTeam) then
			Controls.Map:SetPlot(pPlotX, pPlotY, pPlot:GetTerrainType(), colour.Red/255, colour.Green/255, colour.Blue/255, colourA)
		end
	end
end
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
function PopulateOverlayPlayerRankings(overlayMapID)
	local iActivePlayer = g_SelectedOverlayMapFilterPlayerID
	local iActiveTeam = g_SelectedOverlayMapFilterTeamID
	local isActiveTeam = (iActiveTeam ~= -1)

	local overlayMap = GameInfo.JFD_OverlayMaps[overlayMapID]
	local overlayMapType = overlayMap.Type
	local overlayMasterMapType = overlayMap.MasterOverlayMapType

	local tableMapOverlay = g_ActiveOverlayMap[overlayMapType]

	for i, tPlayer in ipairs(g_SortedRankedPlayerEntryTable) do
		local iPlayer = tPlayer[1]
		local pPlayer = Players[iPlayer]
		local iPlayerTeam = pPlayer:GetTeam()
		local pTeam = Teams[iPlayerTeam]
		if pPlayer:IsAlive() and ((isActiveTeam and pTeam:IsHasMet(iActiveTeam)) or (not isActiveTeam)) then
			local thisPlayerInfo = g_PlayerLegendsTable[iPlayer]
			local thisLegend = thisPlayerInfo.Legend
			local thisLegendInfo = tableMapOverlay[thisLegend]
			if thisPlayerInfo and thisPlayerInfo.Visible and thisLegendInfo and (thisLegendInfo.Visible) then
				local legend = GameInfo.JFD_OverlayMapLegends[thisLegend]
				local legendInstance = g_LegendPlayerInstanceManager:GetInstance();
				local legendRanking = GameInfo.JFD_OverlayMap_Rankings("OverlayMapType = '" .. overlayMapType .. "'")()

				local playerRankInfo = thisPlayerInfo.RankInfo
				local strPlayerRank = tostring(playerRankInfo.Rank)
				local strPlayerRankVal = tostring(playerRankInfo.RankVal)
				local strPlayerShortDesc = pPlayer:GetCivilizationShortDescription()
				local strLeaderShortDesc = pPlayer:GetName()

				local strShortDesc = Locale.ConvertTextKey(legend.ShortDescription, strPlayerShortDesc, strPlayerRank, strLeaderShortDesc)
				local strRankShortDesc = Locale.ConvertTextKey(legendRanking.ShortDescription, legendRanking.IconFont, strPlayerRankVal)
				legendInstance.PlayerName:SetText(strShortDesc);
				legendInstance.PlayerRankVal:SetText(strRankShortDesc);
				legendInstance.PlayerRankVal:SetHide(false)

				if legend.UsePlayerIcon then
					if pPlayer:IsMinorCiv() then
						local minorCivID = pPlayer:GetMinorCivType()
						local minorCivTraitType = GameInfo.MinorCivilizations[minorCivID].MinorCivTrait
						local minorCivTrait = GameInfo.MinorCivTraits[minorCivTraitType]
						local _, minorCivColour = pPlayer:GetPlayerColors()
						minorCivColour.w = 1
						local traitTexture = minorCivTrait.TraitIcon
						legendInstance.PlayerTexture:SetTexture(traitTexture)
						legendInstance.PlayerTexture:SetColor(minorCivColour)
						legendInstance.PlayerTexture:SetHide(false)
					else
						local civ = GameInfo.Civilizations[pPlayer:GetCivilizationType()]
						IconHookup( civ.PortraitIndex, 32, civ.IconAtlas, legendInstance.PlayerIcon );
						legendInstance.PlayerIcon:SetHide(false)
					end
				else
					local strFont = legend.IconFont
					if strFont then
						legendInstance.PlayerFont:SetText(strFont)
						legendInstance.PlayerFont:SetHide(false)
					end
				end

				local legendColour = thisPlayerInfo.Colour
				local legendColourR = legendColour.Red
				local legendColourG = legendColour.Green
				local legendColourB = legendColour.Blue
				local legendColourA = legendColour.Alpha
				local strColour = "[COLOR:" .. 255 .. ":" .. legendColourG .. ":" .. legendColourB .. ":" .. legendColourA .. "]"
				legendInstance.PlayerLine:SetColorVal(legendColourR/255, legendColourG/255, legendColourB/255, legendColourA);
				legendInstance.PlayerLine:SetHide(false)

				local strRankDesc = Locale.ConvertTextKey(legendRanking.Description, strColour, strPlayerRank, strPlayerShortDesc, strPlayerRankVal, legendRanking.IconFont)
				legendInstance.PlayerButton:SetToolTipString(strRankDesc);

				legendInstance.PlayerSelectHighlight:SetHide(true)

				local checked = thisLegendInfo.Checked
				legendInstance.ShowHide:SetHide(true)
				legendInstance.ShowHide:SetCheck(checked);
				legendInstance.ShowHide:SetHide(showInLegendAlways)

				legendInstance.ShowHide:RegisterCheckHandler( function(bCheck)
					thisPlayerInfo.Checked = bCheck
					ShadeMap(overlayMapID, overlayMapFilterID, overlayMapFilterPlayerID, overlayMapFilterReligionID, legendGroupID)
				end);
			end
		end
	end
	Controls.LegendPlayersStack:CalculateSize();
	Controls.LegendPlayersStack:ReprocessAnchoring();
	Controls.PlayerGrid:SetSizeY(Controls.LegendPlayersStack:GetSizeY() + 5)
	Controls.MainStack:CalculateSize();
	Controls.MainStack:ReprocessAnchoring();
	Controls.LegendScrollPanel:CalculateInternalSize();
	Controls.LegendScrollPanel:ReprocessAnchoring();
end
-------------------------------------------------------------------------------
function RefreshMapLegend(overlayMapID)
	numHeadersOpen = 0

	g_LegendInstanceManager:ResetInstances();
	g_LegendPlayerInstanceManager:ResetInstances();
	g_LegendBarbPlayerInstanceManager:ResetInstances();
	g_LegendMinorPlayerInstanceManager:ResetInstances();

	local overlayMap = GameInfo.JFD_OverlayMaps[overlayMapID]
	local overlayMapType = overlayMap.Type
	local overlayMasterMapType = overlayMap.MasterOverlayMapType
	local overlayMapDontShowLegend = overlayMap.DontShowLegend
	local overlayMapPopulateReligions = overlayMap.PopulateReligions
	local overlayMapPopulatePlayers = overlayMap.PopulatePlayers
	local overlayMapPopulateRankings = overlayMap.PopulateRankings
	if (not overlayMapDontShowLegend) then
		if overlayMapPopulateReligions then
			PopulateOverlayReligions(overlayMapID)
		else
			PopulateOverlayMapLegends(overlayMapID)
		end
		isShowPlayers = false
		Controls.ShowPlayersButtonLabel:LocalizeAndSetText("TXT_KEY_OVERLAY_JFD_SHOW_PLAYERS")
		Controls.ShowPlayersButton:SetDisabled(true)

		Controls.LegendButton:SetHide(false)
		Controls.LegendGrid:SetHide(false)

		Controls.ReligionsButton:SetHide(true)
		Controls.ReligionGrid:SetHide(true)
		Controls.PlayersButton:SetHide(true)
		Controls.PlayerGrid:SetHide(true)
		Controls.MinorPlayersButton:SetHide(true)
		Controls.MinorPlayerGrid:SetHide(true)
		Controls.BarbPlayersButton:SetHide(true)
		Controls.BarbPlayerGrid:SetHide(true)

	else
		isShowPlayers = true
		Controls.ShowPlayersButtonLabel:LocalizeAndSetText("TXT_KEY_OVERLAY_JFD_SHOW_LEGEND")
		Controls.ShowPlayersButton:SetDisabled(true)

		Controls.LegendButton:SetHide(true)
		Controls.LegendGrid:SetHide(true)
	end
	if overlayMapPopulateRankings then
		PopulateOverlayPlayerRankings(overlayMapID)
	elseif overlayMapPopulatePlayers then
		if g_SelectedOverlayMapFilterID ~= -1 then
			local overlayMapFilter = GameInfo.JFD_OverlayMapFilters[g_SelectedOverlayMapFilterID]
			local overlayMapFilterType = overlayMapFilter.Type
			if overlayMapFilterType == "OVERLAY_FILTER_JFD_ALL_PLAYERS" then
				PopulateOverlayPlayers(overlayMapID)
				PopulateOverlayMinorPlayers(overlayMapID)

				Controls.PlayersButton:SetHide(not isShowPlayers)
				Controls.PlayerGrid:SetHide(not isShowPlayers)
			elseif overlayMapFilterType == "OVERLAY_FILTER_JFD_ALL_MAJORS" then
				PopulateOverlayPlayers(overlayMapID)
				Controls.MinorPlayersButton:SetHide(true)
				Controls.MinorPlayerGrid:SetHide(true)

				Controls.PlayersButton:SetHide(not isShowPlayers)
				Controls.PlayerGrid:SetHide(not isShowPlayers)
			elseif overlayMapFilterType == "OVERLAY_FILTER_JFD_ALL_MINORS" then
				PopulateOverlayMinorPlayers(overlayMapID)
				Controls.PlayersButton:SetHide(true)
				Controls.PlayerGrid:SetHide(true)

				Controls.MinorPlayersButton:SetHide(not isShowPlayers)
				Controls.MinorPlayerGrid:SetHide(not isShowPlayers)
			end
		end
		local optionIncludeBarbs = g_SelectedMapOverlayOptions["OVERLAY_JFD_OPTION_INCLUDE_BARBARIANS"]
		if optionIncludeBarbs.Check and optionIncludeBarbs.IsValid then
			PopulateOverlayBarbPlayers(overlayMapID)

			Controls.BarbPlayersButton:SetHide(not isShowPlayers)
		end
		Controls.ShowPlayersButton:SetDisabled(overlayMapDontShowLegend)
	end
	Controls.MainStack:CalculateSize();
	Controls.MainStack:ReprocessAnchoring();
	Controls.LegendScrollPanel:CalculateInternalSize();
	Controls.LegendScrollPanel:ReprocessAnchoring();
end
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
function RefreshMap(overlayMapID)
	PopulateActiveOverlayMap(overlayMapID)
	PopulateOverlayMapOptions(overlayMapID)
	ShadeMap(overlayMapID)
	RefreshMapLegend(overlayMapID)
end
-------------------------------------------------------------------------------
function RefreshOverlayMapsOverview()
	Controls.OverlayMapClassesPullDown:ClearEntries()
	for row in GameInfo.JFD_OverlayMapClasses() do
		local strDesc = row.ShortDescription
		local strHelp = row.Help

		local entry = {}
		Controls.OverlayMapClassesPullDown:BuildEntry("InstanceOne", entry)
		entry.Button:SetVoid1(row.ID)
		entry.Button:SetText(Locale.ToUpper(strDesc))
		if strHelp then
			entry.Button:LocalizeAndSetToolTip(strHelp)
		end

		if g_SelectedOverlayMapClassID == -1 then
			g_SelectedOverlayMapClassID = row.ID
		end
	end
	Controls.OverlayMapClassesPullDown:CalculateInternals()
	Controls.OverlayMapClassesPullDown:RegisterSelectionCallback(RefreshOverlayMapClass)
	Controls.OverlayMapClassesPullDown:SetHide(false)
	RefreshOverlayMapClass(g_SelectedOverlayMapClassID)
end
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
function ShowHideHandler( bIsHide, bInitState )
    if( not bInitState ) then
        if( not bIsHide ) then
        	UI.incTurnTimerSemaphore();
           RefreshOverlayMapsOverview()
        else
			if(g_PopupInfo ~= nil) then
				--Events.SerialEventGameMessagePopupProcessed.CallImmediate(g_PopupInfo.Type, 0);
            end
            UI.decTurnTimerSemaphore();
        end
    end
end
ContextPtr:SetShowHideHandler( ShowHideHandler );

----------------------------------------------------------------
-- 'Active' (local human) player has changed
----------------------------------------------------------------
function OnActivePlayerChanged()
end
Events.GameplaySetActivePlayer.Add(OnActivePlayerChanged);

-----------------------------------------------------------------
-- Add Religion Overview to Dropdown (if enabled)
-----------------------------------------------------------------
LuaEvents.AdditionalInformationDropdownGatherEntries.Add(function(entries)
	table.insert(entries, {
		text=Locale.Lookup("TXT_KEY_OVERLAY_JFD_OVERVIEW"),
		call=function()
			UIManager:QueuePopup(ContextPtr, PopupPriority.SocialPolicy)
		end,
	});
	table.insert(entries, {
		text=Locale.Lookup("Open Civilopedia"),
		call=function()
			Events.SearchForPediaEntry("");
		end,
	});
end);

LuaEvents.RequestRefreshAdditionalInformationDropdownEntries();

function JFD_UI_ShowOverlayMapsOverview()
	if ContextPtr:IsHidden() then
		UIManager:QueuePopup(ContextPtr, PopupPriority.SocialPolicy)
	else
		UIManager:DequeuePopup(ContextPtr)
	end
end
LuaEvents.JFD_UI_ShowOverlayMapsOverview.Add(JFD_UI_ShowOverlayMapsOverview);

UIManager:QueuePopup(ContextPtr, PopupPriority.SocialPolicy)
UIManager:DequeuePopup(ContextPtr)
