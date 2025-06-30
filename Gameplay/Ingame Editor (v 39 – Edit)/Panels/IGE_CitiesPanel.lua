-- Released under GPL v3
--------------------------------------------------------------
include("IGE_API_All");
print("IGE_CitiesPanel");
IGE = nil;

local buildingItemManagers = {};
local wonderItemManagers = {};
local groupInstances = {};
local eraItemManager = CreateInstanceManager("BuildingGroupInstance", "Stack", Controls.BuildingEraList );
local unitsManager = CreateInstanceManager("ListItemInstance", "Button", Controls.UnitsOnPlotList );
local unitsAdjManager = CreateInstanceManager("ListItemInstance", "Button", Controls.UnitsOnAdjPlotList );
local conversionsManager = CreateInstanceManager("ConversionInstance", "Stack", Controls.ConversionStack );

local data = {};
local isVisible = false;
local isTeleporting = false;
-- local isTeleportingAdj = false;
local currentPlot = nil;
local oldPlot = nil;
local currentCity = nil;
local currentUnit = nil;
local currentUnitIndex = 0;
local currentReligion = 0;
local teleportationStartPlot = nil;

local selectedUnits = {};
local selectedAdjUnits = {} 
local adjUnitsHeadingOpen = false
--===============================================================================================
-- CORE EVENTS
--===============================================================================================
local function OnSharingGlobalAndOptions(_IGE)
	IGE = _IGE;
end
LuaEvents.IGE_SharingGlobalAndOptions.Add(OnSharingGlobalAndOptions);

-------------------------------------------------------------------------------------------------
function OnInitialize()
	SetUnitsData(data, {});
	SetBuildingsData(data, {});
	SetReligionsData(data);

	Resize(Controls.Container);
	Resize(Controls.ScrollPanel);
	Resize(Controls.OuterContainer);

	-- Create eras instances
	for i, v in ipairs(data.eras) do
		if #v.buildings + #v.wonders > 0 then
			local instance = eraItemManager:GetInstance();
			if instance then
				instance.Header:SetText(v.name);
				groupInstances[i] = instance;
				buildingItemManagers[i] = CreateInstanceManager("ListItemInstance", "Button", instance.BuildingList );
				wonderItemManagers[i] = CreateInstanceManager("ListItemInstance", "Button", instance.WonderList );
			end
		end
	end

	local tt = L("TXT_KEY_IGE_CITIES_AND_UNITS_PANEL_HELP");
	LuaEvents.IGE_RegisterTab("CITIES_AND_UNITS",  L("TXT_KEY_IGE_CITIES_AND_UNITS_PANEL"), 1, "edit",  tt)
end
LuaEvents.IGE_Initialize.Add(OnInitialize)

-------------------------------------------------------------------------------------------------
function OnSelectedPanel(ID)
	isVisible = (ID == "CITIES_AND_UNITS");
	OnMoveUnitCancelButtonClick();
end
LuaEvents.IGE_SelectedPanel.Add(OnSelectedPanel);

-------------------------------------------------------------------------------------------------
function OnSelectedPlot(plot)
	currentUnitIndex = 0;
	currentPlot = plot;
end
LuaEvents.IGE_SelectedPlot.Add(OnSelectedPlot)


--===============================================================================================
-- UPDATE
--===============================================================================================
local directions = {}
directions[DirectionTypes["DIRECTION_NORTHEAST"]] = "NE"
directions[DirectionTypes["DIRECTION_EAST"]] = "E"
directions[DirectionTypes["DIRECTION_SOUTHEAST"]] = "SE"
directions[DirectionTypes["DIRECTION_SOUTHWEST"]] = "SW"
directions[DirectionTypes["DIRECTION_WEST"]] = "W"
directions[DirectionTypes["DIRECTION_NORTHWEST"]] = "NW"
					
local function UpdateUnits()
	local count = currentPlot:GetNumUnits();
	Controls.UnitEdition:SetHide(count == 0);
	Controls.NoUnitOnPlot:SetHide(count ~= 0);
	if count == 0 then return end
	
	if adjUnitsHeadingOpen then
		local localizedLabel = "[ICON_MINUS] "..Locale.ConvertTextKey( "TXT_KEY_IGE_MOVE_UNIT_ADJ_LIST" );
		Controls.UnitsAdjToPlotListLabel:SetText(localizedLabel);
		Controls.UnitsOnAdjPlotList:SetHide(false);
	else
		local localizedLabel = "[ICON_PLUS] "..Locale.ConvertTextKey( "TXT_KEY_IGE_MOVE_UNIT_ADJ_LIST" );
		Controls.UnitsAdjToPlotListLabel:SetText(localizedLabel);
		Controls.UnitsOnAdjPlotList:SetHide(true);
	end

	-- Update units list
	units = {};
	unitsAdj = {};
	currentUnit = currentPlot:GetUnit(0);
	for i = 0, count - 1 do
		local pUnit = currentPlot:GetUnit(i);
		local unitID = pUnit:GetUnitType();
		local unit = data.unitsByID[unitID];
		local pOwner = Players[pUnit:GetOwner()];

		local item = {};

		-- Label
		if (pUnit:HasName()) then
			local desc = L("TXT_KEY_PLOTROLL_UNIT_DESCRIPTION_CIV", pOwner:GetCivilizationAdjectiveKey(), pUnit:GetNameKey());
			item.label = string.format("%s (%s)", pUnit:GetNameNoDesc(), desc); 
		else
			item.label = L("TXT_KEY_PLOTROLL_UNIT_DESCRIPTION_CIV", pOwner:GetCivilizationAdjectiveKey(), pUnit:GetNameKey());
		end

		local strength = pUnit:GetBaseCombatStrength();
		if (strength > 0) then
			item.label = item.label..", [ICON_STRENGTH]" .. pUnit:GetBaseCombatStrength();
		end
			
		local damage = pUnit:GetDamage();
		if (damage > 0) then
			item.label = item.label..", " .. L("TXT_KEY_PLOTROLL_UNIT_HP", GameDefines["MAX_HIT_POINTS"] - damage);
		end

		-- Other unit
		item.actor = pUnit;
		item.name = unit.name;
		item.subtitle = pOwner:GetCivilizationShortDescription();
		item.textureOffset = unit.textureOffset;
		item.texture = unit.texture;
		item.help = unit.help .. Locale.ConvertTextKey("TXT_KEY_IGE_MOVE_UNIT_HELP_TT")
		item.selected = (i == currentUnitIndex);
		item.selectedADD = selectedUnits[pUnit:GetID()]
		item.visible = true;
		item.enabled = true;
		item.index = i;

		-- Insertion
		table.insert(units, item);
		if item.selected then
			currentUnit = pUnit;
			item.label = "[COLOR_POSITIVE_TEXT]" .. item.label .. "[ENDCOLOR]"
		end
	end
	
	if adjUnitsHeadingOpen then	
		
		for adjacentPlot in PlotAreaSweepIterator(currentPlot, 1, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
			local thisCount = adjacentPlot:GetNumUnits();
			for i = 0, thisCount - 1 do
				local pUnit = adjacentPlot:GetUnit(i);
				if pUnit then
					local unitID = pUnit:GetUnitType();
					local unit = data.unitsByID[unitID];
					local pOwner = Players[pUnit:GetOwner()];
					
					print(pUnit:GetName(), "unit adjacent")
			
					local item = {};
			
					-- Label
					if (pUnit:HasName()) then
						local desc = L("TXT_KEY_PLOTROLL_UNIT_DESCRIPTION_CIV", pOwner:GetCivilizationAdjectiveKey(), pUnit:GetNameKey());
						item.label = string.format("%s (%s)", pUnit:GetNameNoDesc(), desc); 
					else
						item.label = L("TXT_KEY_PLOTROLL_UNIT_DESCRIPTION_CIV", pOwner:GetCivilizationAdjectiveKey(), pUnit:GetNameKey());
					end
			
					local strength = pUnit:GetBaseCombatStrength();
					if (strength > 0) then
						item.label = item.label..", [ICON_STRENGTH]" .. pUnit:GetBaseCombatStrength();
					end
						
					local damage = pUnit:GetDamage();
					if (damage > 0) then
						item.label = item.label..", " .. L("TXT_KEY_PLOTROLL_UNIT_HP", GameDefines["MAX_HIT_POINTS"] - damage);
					end
			
					-- Other unit
					item.actor = pUnit;
					item.name = unit.name;
					item.subtitle = pOwner:GetCivilizationShortDescription();
					item.textureOffset = unit.textureOffset;
					item.texture = unit.texture;
					item.help = unit.help .. Locale.ConvertTextKey("TXT_KEY_IGE_MOVE_UNIT_HELP_TT")
					item.selectedADD = selectedAdjUnits[pUnit:GetID()]
					item.visible = true;
					item.enabled = true;
					item.index = i;
					
					local numDirections = DirectionTypes.NUM_DIRECTION_TYPES;
					local thisUnitDirection = {}
					for direction = 0, numDirections - 1, 1 do
						local adjPlot = Map.PlotDirection(currentPlot:GetX(), currentPlot:GetY(), direction)
						if adjPlot ~= nil and adjPlot == adjacentPlot then
							item.direction = directions[direction]
							break
						end
					end
					if item.direction then
						item.label = Locale.ConvertTextKey("({1_Desc}) ", item.direction) .. item.label 
					end
					
					-- Insertion
					table.insert(unitsAdj, item);
				end
			end
		end
	end
	
	UpdateList(units, unitsManager, UnitClickHandler, UnitRClickHandler);
	UpdateList(unitsAdj, unitsAdjManager, UnitClickHandler, UnitRClickHandler, HoverHandler);
end

-------------------------------------------------------------------------------------------------
function InvalidateCity()
	if currentCity then
		local cityID = currentCity:GetID();
		local playerID = currentCity:GetOwner();
		Events.SpecificCityInfoDirty(playerID, cityID, CityUpdateTypes.CITY_UPDATE_TYPE_BANNER);
		Events.SpecificCityInfoDirty(playerID, cityID, CityUpdateTypes.CITY_UPDATE_TYPE_PRODUCTION);
	end
	Events.SerialEventGameDataDirty();
	OnUpdate();
end

-------------------------------------------------------------------------------------------------
function UpdateBuildingList(buildings, manager, instance, prefix)
	for _, v in ipairs(buildings) do
		local count = currentCity:GetNumRealBuilding(v.ID);
		v.label = (count > 1) and prefix..v.name.." x"..count or v.name;
		v.enabled = currentCity:CanConstruct(v.ID, 1, 1, 1) or count ~= 0;
		v.selected = count ~= 0;
	end

	UpdateHierarchizedList(buildings, manager, BuildingClickHandler);
end

-------------------------------------------------------------------------------------------------
local preserveSortOrder = false;
function UpdateConversionList(cityReligionID, playerReligionID)
	-- Sort
	if not preserveSortOrder then
		for _, v in ipairs(data.religions) do
			if v.ID == playerReligionID then
				v.priority = 1000;
			else
				v.priority = currentCity:GetNumFollowers(v.ID);

				-- Pantheon at the bottom
				if v.priority == 0 and v.ID == 0 then
					v.priority = -1;
				end
			end
		end
		table.sort(data.religions, DefaultSort);
	end
	preserveSortOrder = false;

	-- Collect founded religions
	local foundedReligions = {}
	for iPlayer = 0, GameDefines.MAX_MAJOR_CIVS - 1 do	
		local pPlayer = Players[iPlayer];
		if (pPlayer:IsEverAlive() and pPlayer:HasCreatedReligion()) then
			foundedReligions[pPlayer:GetReligionCreatedByPlayer()] = true;
		end
	end

	-- Update instances
	local isHolyCity = currentCity:IsHolyCityAnyReligion()
	Controls.HolyCityWarning:SetHide(not isHolyCity)

	conversionsManager:ResetInstances();
	for _, v in ipairs(data.religions) do
		if foundedReligions[v.ID] then
			local instance = conversionsManager:GetInstance();
			if instance then
				instance.Header:SetText(v.iconString);
				local update = HookNumericBox("Conversion", 
					function() return currentCity:GetNumFollowers(v.ID) end, 
					function(amount) SetFollowers(v.ID, amount) end, 
					0, currentCity:GetPopulation(), 1, instance);
				update(currentCity:GetNumFollowers(v.ID));
				instance.MinButton:RegisterCallback(Mouse.eLClick, function() SetMinFollowers(v.ID) end);
				instance.MaxButton:RegisterCallback(Mouse.eLClick, function() SetMaxFollowers(v.ID) end);

				instance.NumericBox:SetToolTipString(L("TXT_KEY_IGE_FOLLOWERS", Game.GetReligionName(v.ID)));
				instance.MinButton:SetToolTipString(L("TXT_KEY_IGE_FOLLOWERS_MIN_HELP", Game.GetReligionName(v.ID)));
				instance.MaxButton:SetToolTipString(L("TXT_KEY_IGE_FOLLOWERS_MAX_HELP", Game.GetReligionName(v.ID)));
			end
		end
	end
end

-------------------------------------------------------------------------------------------------
local function UpdateCityUI()
	currentCity = currentPlot:GetPlotCity();
	Controls.CityEdition:SetHide(currentCity == nil);
	Controls.NoCityOnPlot:SetHide(currentCity ~= nil);
	if not currentCity then return end

	UpdatePopulation(currentCity:GetPopulation());
	Controls.PuppetCityCB:SetCheck(false);
	Controls.OccupiedCityCB:SetCheck(false);
	Controls.NeverLostCityCB:SetCheck(false);
	Controls.ReconqueredCityCB:SetCheck(false);

	if currentCity:IsPuppet() then
		Controls.PuppetCityCB:SetCheck(true);
	elseif currentCity:IsOccupied() then
		Controls.OccupiedCityCB:SetCheck(true);
	elseif currentCity:IsNeverLost() then
		Controls.NeverLostCityCB:SetCheck(true);
	else
		Controls.ReconqueredCityCB:SetCheck(true);
	end

	Controls.CaptureCityButton:SetDisabled(IGE.currentPlayerID == currentCity:GetOwner());
	Controls.CityNameBox:SetText(currentCity:GetName());

	for i, era in ipairs(data.eras) do
		if #era.buildings + #era.wonders > 0 then
			local instance = groupInstances[i];
			UpdateBuildingList(era.buildings, buildingItemManagers[i], instance, "");
			UpdateBuildingList(era.wonders, wonderItemManagers[i], instance, "[ICON_CAPITAL]");
			instance.BottomStack:CalculateSize();
			local width = instance.BottomStack:GetSizeX();
			instance.HeaderBackground:SetSizeX(width + 10);
		end
	end	

	if IGE_HasGodsAndKings then
		local playerReligionID = IGE.currentPlayer:GetReligionCreatedByPlayer();
		local cityReligionID = currentCity:GetReligiousMajority();
		UpdateConversionList(cityReligionID, playerReligionID)

		if cityReligionID >= 0 then
			Controls.ReligionHeader:SetText(L(Game.GetReligionName(cityReligionID)));
		else
			Controls.ReligionHeader:SetText(L("TXT_KEY_IGE_NO_RELIGION"));
		end
	else
		Controls.ReligionStack:SetHide(true);
	end

	-- Resize top border
	Controls.BuildingEraList:CalculateSize();
	local width = Controls.BuildingEraList:GetSizeX();
	Controls.BuildingContainer:SetSizeX(width);
	Controls.CityTopBorder:SetSizeX(width);
end

-------------------------------------------------------------------------------------------------
function OnUpdate()
	Controls.OuterContainer:SetHide(not isVisible);
	if not isVisible then return end

	if isTeleporting then
		LuaEvents.IGE_SetMouseMode(IGE_MODE_PLOP);
		Controls.MoveUnitPromptStack:SetHide(false);
		Controls.PlotSelectionPrompt:SetHide(true);
		Controls.Container:SetHide(true);
	else
		LuaEvents.IGE_SetMouseMode(IGE_MODE_EDIT_AND_PLOP);
		Controls.MoveUnitPromptStack:SetHide(true);
		Controls.PlotSelectionPrompt:SetHide(currentPlot ~= nil);
		Controls.Container:SetHide(currentPlot == nil);
	end
	if (currentPlot ~= nil) and (not isTeleporting) then 
		UpdateUnits();
		UpdateCityUI();
	end

	Controls.CityEdition:CalculateSize();
	Controls.Stack:CalculateSize();
    Controls.ScrollPanel:CalculateInternalSize();
	Controls.ScrollPanel:ReprocessAnchoring();
	Controls.ScrollBar:SetSizeX(Controls.ScrollPanel:GetSizeX() - 36);
end
LuaEvents.IGE_Update.Add(OnUpdate);


--===============================================================================================
-- INPUTS
--===============================================================================================
function PrintReligionState(state)
	print("dumping religions:")
	local str = "";
	for i,v in pairs(state) do
		if (str ~= "")  then str = str..", " end
		str = str..i..":"..v;
	end
	print(str);
end

-------------------------------------------------------------------------------------------------
function SetReligionState(state)
	PrintReligionState(state);

	-- What is the majority?
	local maxFollowers = -1;
	local majority = -1;
	for i in pairs(state) do
		state[i] = math.floor(state[i] + 0.5)
		if state[i] > maxFollowers then
			majority = i;
			maxFollowers = state[i]
		end
	end

	-- EDIT: Those crashes may actually have only been caused by tests with a religion not founded yet. Doesn't matter, leave the code like that
	-- ConvertPercentFollowers is full of nasty bugs (can only convert from majority to minority) hence this twisted method
	currentCity:AdoptReligionFully(majority);
	print("Done fully adopting")

	for i, v in pairs(state) do
		if i ~= majority and i >= 0 then
			-- Convert 1% at a time because followers are internally stored as real numbers.
			while (currentCity:GetNumFollowers(i) + 0.5) < v do
				currentCity:ConvertPercentFollowers(i, majority, 1)
			end
		end
	end
	print("Done increasing minorities.")

	-- We do atheists in the end because of a rounding error in civ5 (sum of followers can be population + 1)
	-- Since they're never displayed, we actually use the majority as a loop condition.
	if majority >= 0 then
		while (currentCity:GetNumFollowers(majority) - 0.5) > state[majority] do
			currentCity:ConvertPercentFollowers(-1, majority, 1)
		end
	end
	print("Done lowering majority.")
end

-------------------------------------------------------------------------------------------------
function ConvertState(state, sourceID, targetID, toConvert)
	-- Enough people from that other religion?
	local converted = toConvert
	if state[sourceID] < toConvert then
		converted = state[sourceID]
	end

	state[sourceID] = state[sourceID] - converted;
	state[targetID] = state[targetID] + converted;
	return toConvert - converted;
end

-------------------------------------------------------------------------------------------------
function SetFollowers(religionID, num)
	local current = currentCity:GetNumFollowers(religionID);
	if (num == current) then return end

	-- Get followers state
	local count = 0;
	local state = {}
	for _, v in pairs(data.religions) do
		state[v.ID] = currentCity:GetNumFollowers(v.ID);
		count = count + state[v.ID];
	end
	state[-1] = currentCity:GetPopulation() - count;

	--print("Converting...");
	--PrintReligionState(state);

	if num < current then
		-- Convert to atheists
		ConvertState(state, religionID, -1, current - num);
	else
		local toConvert = num - current;

		-- Convert from atheists
		toConvert = ConvertState(state, -1, religionID, toConvert)

		-- Convert from pantheon
		toConvert = ConvertState(state, 0, religionID, toConvert)

		-- Convert from group with max followers, one at a time
		while toConvert > 0 do
			local maxFollowers = 0;
			local sourceID = -1;
			for _, v in pairs(data.religions) do
				if v.ID ~= religionID and v.ID > 0 then
					if state[v.ID] > maxFollowers then
						sourceID = v.ID;
						maxFollowers = state[v.ID];
					end
				end
			end
			if sourceID == -1 then break end

			if ConvertState(state, sourceID, religionID, 1) == 0 then
				toConvert = toConvert - 1;
			end
		end
	end	

	SetReligionState(state);
	preserveSortOrder = true;
	LuaEvents.IGE_Update();
	Events.SerialEventCityInfoDirty();
end

-------------------------------------------------------------------------------------------------
function SetMinFollowers(religionID)
	SetFollowers(religionID, 0);
end

-------------------------------------------------------------------------------------------------
function SetMaxFollowers(religionID)
	preserveSortOrder = true;
	currentCity:AdoptReligionFully(religionID);
	Events.SerialEventCityInfoDirty();
	LuaEvents.IGE_Update();
end

-------------------------------------------------------------------------------------------------
function UnitClickHandler(unit)
	for _, v in ipairs(units) do
		v.selected = (v == unit);
		if v.selected then currentUnitIndex = unit.index end
	end
	for _, v in ipairs(unitsAdj) do
		v.selected = (v == unit);
		if v.selected then 
			currentUnitIndex = unit.index 
			local pUnit = unit.actor
			local plot = Map.GetPlot(pUnit:GetX(),pUnit:GetY())
			OnSelectedPlot(plot)
			LuaEvents.IGE_SetCurrentPlot(plot)
			UI.LookAt(plot, 0);
		end
	end
	OnUpdate();
end
-------------------------------------------------------------------------------------------------
function UnitRClickHandler(unit)
	for _, v in ipairs(units) do	
		if (v == unit) then
			local pUnit = unit.actor
			local unitID = pUnit:GetID()
			if (not selectedUnits[unitID]) then		
				v.selectedADD = true
				selectedUnits[unitID] = pUnit
			else	
				v.selectedADD = false
				selectedUnits[unitID] = nil
			end
		end
	end
	for _, v in ipairs(unitsAdj) do	
		if (v == unit) then
			local pUnit = unit.actor
			local unitID = pUnit:GetID()
			if (not adjUnitsHeadingOpen) then
				v.selectedADD = false
				selectedAdjUnits[unitID] = nil
			elseif selectedAdjUnits[unitID] then
				v.selectedADD = false
				selectedAdjUnits[unitID] = nil
			else
				local pUnit = unit.actor
				local unitID = pUnit:GetID()
				v.selectedADD = true
				selectedAdjUnits[unitID] = pUnit
			end
		end
	end
	OnUpdate();
end
-------------------------------------------------------------------------------------------------
function HoverHandler(unit)
	local pUnit = unit.actor
	Events.SerialEventHexHighlight(ToHexFromGrid(Vector2(pUnit:GetX(), pUnit:GetY())), true, Vector4(0.8, 0.0, 0.0, 1));
end
-------------------------------------------------------------------------------------------------
function BuildingClickHandler(building)
	local count = currentCity:GetNumRealBuilding(building.ID);
	if building.noLimit then
		currentCity:SetNumRealBuilding(building.ID, count + 1);
	else
		currentCity:SetNumRealBuilding(building.ID, count == 1 and 0 or 1);
	end
	InvalidateCity();

	-- Wonder splash screen
	if building.isWonder then
		if Game == nil or Game.GetGameTurn() <= Game.GetStartTurn() then
			LuaEvents.IGE_WonderPopup(building.ID);
		end
	end
end

-------------------------------------------------------------------------------------------------
function BuildingRightClickHandler(building)
	local count = currentCity:GetNumRealBuilding(building.ID);
	if count ~= 0 then
		currentCity:SetNumRealBuilding(building.ID, count - 1);
	end

	InvalidateCity();
end

-------------------------------------------------------------------------------------------------
function OnDisbandUnitClick()
	currentUnit:Kill();	
	--JFD
	for _, thisUnit in pairs(selectedUnits) do	
		thisUnit:Kill();	
	end		
	for _, thisUnit in pairs(selectedAdjUnits) do	
		thisUnit:Kill();	
	end			
	--JFD
			
	Events.SerialEventGameDataDirty();
	OnUpdate();
end
Controls.DisbandUnitButton:RegisterCallback(Mouse.eLClick, OnDisbandUnitClick);

-------------------------------------------------------------------------------------------------
function OnPromoteUnitClick()
	local level = GetLevelFromXP(currentUnit:GetExperience());
	local xp = GetXPForLevel(level + 1);
	currentUnit:SetExperience(xp);
	currentUnit:SetPromotionReady(true);	
	--JFD
	for _, thisUnit in pairs(selectedUnits) do	
		local level = GetLevelFromXP(thisUnit:GetExperience());
		local xp = GetXPForLevel(level + 1);
		thisUnit:SetExperience(xp);
		thisUnit:SetPromotionReady(true);
	end
	for _, thisUnit in pairs(selectedAdjUnits) do	
		local level = GetLevelFromXP(thisUnit:GetExperience());
		local xp = GetXPForLevel(level + 1);
		thisUnit:SetExperience(xp);
		thisUnit:SetPromotionReady(true);
	end
	--JFD
	Events.SerialEventGameDataDirty();
	OnUpdate();
end
Controls.PromoteUnitButton:RegisterCallback(Mouse.eLClick, OnPromoteUnitClick);

-------------------------------------------------------------------------------------------------
function OnHealUnitClick()
	currentUnit:SetDamage(0);	
	--JFD
	for _, thisUnit in pairs(selectedUnits) do	
		local xp = GetXPForLevel(level + 1);
		thisUnit:SetDamage(0);	
	end
	for _, thisUnit in pairs(selectedAdjUnits) do	
		local xp = GetXPForLevel(level + 1);
		thisUnit:SetDamage(0);	
	end
	--JFD
	OnUpdate();
end
Controls.HealUnitButton:RegisterCallback(Mouse.eLClick, OnHealUnitClick);

-------------------------------------------------------------------------------------------------
function OnCityNameChange(name)
	currentCity:SetName(name);
	OnUpdate();
end
Controls.CityNameBox:RegisterCallback(OnCityNameChange);

-------------------------------------------------------------------------------------------------
function OnDisbandCityClick()
	local playerID = currentCity:GetOwner();
	local pPlayer = Players[playerID];
	--pPlayer:Disband(currentCity);	
	local plot = currentCity:Plot()
	local hexpos = ToHexFromGrid(Vector2(plot:GetX(), plot:GetY()));
	local cityID = currentCity:GetID()
	currentCity:Kill();
	Events.SerialEventCityDestroyed(hexpos, playerID, cityID, -1)
	Events.SerialEventGameDataDirty();
	OnUpdate();
end
Controls.DisbandCityButton:RegisterCallback(Mouse.eLClick, OnDisbandCityClick);

-------------------------------------------------------------------------------------------------
function OnCaptureCityClick()
	if IGE.currentPlayerID ~= currentCity:GetOwner() then
		local pPlayer = Players[IGE.currentPlayerID];
		pPlayer:AcquireCity(currentCity);	
	end
	InvalidateCity();
end
Controls.CaptureCityButton:RegisterCallback(Mouse.eLClick, OnCaptureCityClick);

-------------------------------------------------------------------------------------------------
function OnHealCityClick()
	currentCity:SetDamage(0);
	InvalidateCity();
end
Controls.HealCityButton:RegisterCallback(Mouse.eLClick, OnHealCityClick);

-------------------------------------------------------------------------------------------------
function OnHurryProductionCityClick()
	local prod = currentCity:GetProductionNeeded();
	currentCity:SetProduction(prod);
	InvalidateCity();
end
Controls.HurryCityButton:RegisterCallback(Mouse.eLClick, OnHurryProductionCityClick);

-------------------------------------------------------------------------------------------------
function OnExpandBordersCityClick()
	local playerTeamID = IGE.currentPlayer:GetTeam()

	-- Store revealed plots
	local revealed = {}
	for i = 0, Map.GetNumPlots()-1, 1 do
		local plot = Map.GetPlotByIndex(i)
		revealed[i] = plot:IsRevealed(playerTeamID, false)
	end

	-- Expand borders
	currentCity:DoJONSCultureLevelIncrease();

	-- Update fog on plots that have just been revealed
	for i = 0, Map.GetNumPlots()-1, 1 do
		local plot = Map.GetPlotByIndex(i);
		if plot:IsRevealed(playerTeamID, false) ~= revealed[i] then
			plot:UpdateFog();
			local hexpos = ToHexFromGrid(Vector2(plot:GetX(), plot:GetY()));
			Events.HexFOWStateChanged(hexpos, true, false);
		end
	end

	-- Invalidate UI for the city
	InvalidateCity();
end
Controls.ExpandCityButton:RegisterCallback(Mouse.eLClick, OnExpandBordersCityClick);

-------------------------------------------------------------------------------------------------
function SetWeLoveTheKing(turns)
	local goldRow = GameInfo.Resources["RESOURCE_GOLD"];

	if IGE.currentPlayerID == currentCity:GetOwner() then
		IGE.currentPlayer:AddNotification(
			NotificationTypes.NOTIFICATION_DISCOVERED_LUXURY_RESOURCE, 
			L("TXT_KEY_NOTIFICATION_CITY_WLTKD", goldRow.Description, currentCity:GetNameKey()),
			L("TXT_KEY_NOTIFICATION_SUMMARY_CITY_WLTKD", currentCity:GetNameKey()), 
			currentCity:GetX(), currentCity:GetY(), 
			goldRow.ID);
	end

	currentCity:SetWeLoveTheKingDayCounter(turns);
	currentCity:SetResourceDemanded(-1);
	print("wltkd turns: "..currentCity:GetWeLoveTheKingDayCounter());
	Events.SerialEventCityInfoDirty();
	InvalidateCity();
end

function OnLoveKingCity10Click()
	SetWeLoveTheKing(GameDefines.CITY_RESOURCE_WLTKD_TURNS);
end
Controls.LoveKingCity10Button:RegisterCallback(Mouse.eLClick, OnLoveKingCity10Click);

function OnLoveKingCity250Click()
	SetWeLoveTheKing(250);
end
Controls.LoveKingCity250Button:RegisterCallback(Mouse.eLClick, OnLoveKingCity250Click);

-------------------------------------------------------------------------------------------------
function OnPuppetCityCBChanged()
	currentCity:SetNeverLost(false)
	currentCity:SetOccupied(true)
	currentCity:SetPuppet(true)
	currentCity:SetProductionAutomated(true)
	InvalidateCity()
end
Controls.PuppetCityCB:RegisterCallback(Mouse.eLClick, OnPuppetCityCBChanged);

-------------------------------------------------------------------------------------------------
function OnOccupiedCityCBChanged()
	currentCity:SetNeverLost(false);
	currentCity:SetPuppet(false);
	currentCity:SetOccupied(true);
	InvalidateCity();
end
Controls.OccupiedCityCB:RegisterCallback(Mouse.eLClick, OnOccupiedCityCBChanged);

-------------------------------------------------------------------------------------------------
function OnNeverLostCityCBChanged()
	currentCity:SetPuppet(false);
	currentCity:SetOccupied(false);
	currentCity:SetNeverLost(true);
	InvalidateCity();
end
Controls.NeverLostCityCB:RegisterCallback(Mouse.eLClick, OnNeverLostCityCBChanged);

-------------------------------------------------------------------------------------------------
function OnReconqueredCityCBChanged()
	currentCity:SetPuppet(false);
	currentCity:SetOccupied(false);
	currentCity:SetNeverLost(false);
	InvalidateCity();
end
Controls.ReconqueredCityCB:RegisterCallback(Mouse.eLClick, OnReconqueredCityCBChanged);

-------------------------------------------------------------------------------------------------
function OnMoveUnitButtonClick()
	teleportationStartPlot = currentPlot;
	isTeleporting = true;
	-- isTeleportingAdj = false;
	OnUpdate();
end
Controls.MoveUnitButton:RegisterCallback(Mouse.eLClick, OnMoveUnitButtonClick);

-------------------------------------------------------------------------------------------------

--JFD added for Nopelad
-- function OnMoveAdjUnitButtonClick()
	-- teleportationStartPlot = currentPlot;
	-- isTeleporting = true;
	-- isTeleportingAdj = true;
	
	-- OnUpdate();
-- end
-- Controls.MoveAdjUnitButton:RegisterCallback(Mouse.eLClick, OnMoveAdjUnitButtonClick);

function OnShowAdjUnitsHeaderSelected()
	adjUnitsHeadingOpen = not adjUnitsHeadingOpen;
	isTeleporting = false;
	isTeleportingAdj = false;
	selectedAdjUnits = {}
	OnUpdate();
end
Controls.UnitsAdjToPlotList:RegisterCallback( Mouse.eLClick, OnShowAdjUnitsHeaderSelected );


-------------------------------------------------------------------------------------------------
function OnMoveUnitCancelButtonClick()
	teleportationStartPlot = nil;
	isTeleporting = false;
	-- isTeleportingAdj = false;
	OnUpdate();
	selectedUnits = {}
	selectedAdjUnits = {}
end
Controls.MoveUnitCancelButton:RegisterCallback(Mouse.eLClick, OnMoveUnitCancelButtonClick);

-------------------------------------------------------------------------------------------------
--JFD
function OnPlop(button, plot)
	if not isVisible then return end
	if isTeleporting then
		if plot:GetX() ~= currentUnit:GetX() or plot:GetY() ~= currentUnit:GetY() then
			currentUnit:SetXY(plot:GetX(), plot:GetY());
			for _, thisUnit in pairs(selectedUnits) do	
				if thisUnit:GetID() ~= currentUnit:GetID() then
					thisUnit:SetXY(plot:GetX(), plot:GetY());
					local plotType = plot:GetPlotType()
					-- if plotType == PlotTypes.PLOT_OCEAN or
					-- plotType == PlotTypes.PLOT_MOUNTAIN or 
					-- plot:GetUnit() and plot:GetUnit():GetOwner() ~= thisUnit:GetOwner() then
						-- thisUnit:JumpToNearestValidPlot()
					-- end	
				end
			end
			for _, thisUnit in pairs(selectedAdjUnits) do	
				if thisUnit:GetID() ~= currentUnit:GetID() then
					local numDirections = DirectionTypes.NUM_DIRECTION_TYPES;
					local thisUnitDirection = {}
					for direction = 0, numDirections - 1, 1 do
						local adjPlot = Map.PlotDirection(currentPlot:GetX(), currentPlot:GetY(), direction)
						if adjPlot ~= nil then
							for index = 0, adjPlot:GetNumUnits() - 1, 1 do
								local unit = adjPlot:GetUnit(index)
								if unit and unit:GetID() == thisUnit:GetID() and unit:GetOwner() == currentUnit:GetOwner() then
									thisUnitDirection[unit] = direction
								end
							end
						end
					end
					
					for adjacentPlot in PlotAreaSweepIterator(teleportationStartPlot, 1, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
						for index = 0, adjacentPlot:GetNumUnits() - 1, 1 do
							local unit = adjacentPlot:GetUnit(index)
							if unit and unit ~= currentUnit and unit:GetOwner() == currentUnit:GetOwner() then
								for direction = 0, numDirections - 1, 1 do
									local adjPlot = Map.PlotDirection(plot:GetX(), plot:GetY(), direction)
									local plotType = adjPlot:GetPlotType()
									if adjPlot ~= nil then
										if thisUnitDirection[unit] == direction then
											unit:SetXY(adjPlot:GetX(), adjPlot:GetY());
											-- if plotType == PlotTypes.PLOT_OCEAN or
											-- plotType == PlotTypes.PLOT_MOUNTAIN or 
											-- adjPlot:GetUnit() and adjPlot:GetUnit():GetOwner() ~= unit:GetOwner() then
												-- unit:JumpToNearestValidPlot()
											-- end											
										end
									end
								end
							end
						end
					end
				end
			end
			--JFD added for Nopelad
			-- if isTeleportingAdj then
				-- local numDirections = DirectionTypes.NUM_DIRECTION_TYPES;
				-- local thisUnitDirection = {}
				-- for direction = 0, numDirections - 1, 1 do
					-- local adjPlot = Map.PlotDirection(teleportationStartPlot:GetX(), teleportationStartPlot:GetY(), direction)
					-- if adjPlot ~= nil then
						-- for index = 0, adjPlot:GetNumUnits() - 1, 1 do
							-- local unit = adjPlot:GetUnit(index)
							-- if unit and unit ~= currentUnit and unit:GetOwner() == currentUnit:GetOwner() then
								-- thisUnitDirection[unit] = direction
							-- end
						-- end
					-- end
				-- end
				
				-- for adjacentPlot in PlotAreaSweepIterator(teleportationStartPlot, 1, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
					-- for index = 0, adjacentPlot:GetNumUnits() - 1, 1 do
						-- local unit = adjacentPlot:GetUnit(index)
						-- if unit and unit ~= currentUnit and unit:GetOwner() == currentUnit:GetOwner() then
							-- for direction = 0, numDirections - 1, 1 do
								-- local adjPlot = Map.PlotDirection(plot:GetX(), plot:GetY(), direction)
								-- if adjPlot ~= nil then
									-- if thisUnitDirection[unit] == direction then
										-- unit:SetXY(adjPlot:GetX(), adjPlot:GetY());
									-- end
								-- end
							-- end
						-- end
					-- end
				-- end
			-- end
		end
		isTeleporting = false;
		-- isTeleportingAdj = false;
		OnUpdate();
		selectedUnits = {}
		selectedAdjUnits = {}
	else
		if plot:GetPlotCity() == nil then
			IGE.currentPlayer:InitCity(plot:GetX(), plot:GetY());
			Events.SerialEventGameDataDirty();
		end
	end
end
LuaEvents.IGE_Plop.Add(OnPlop);
--JFD
-------------------------------------------------------------------------------------------------
function InputHandler(uiMsg, wParam, lParam)
	if isVisible and isTeleporting then
		if uiMsg == KeyEvents.KeyDown and wParam == Keys.VK_ESCAPE then
			OnMoveUnitCancelButtonClick();
			return true;
		end
	end

	return false;
end
ContextPtr:SetInputHandler(InputHandler);

------------------------------------------------------------------------------------------------
UpdatePopulation = HookNumericBox("Population", 
	function() return currentCity:GetPopulation() end, 
	function(amount) 
		if amount ~= currentCity:GetPopulation() then
			currentCity:SetPopulation(amount, true)
			LuaEvents.IGE_Update();
		end
	end, 
	0, nil, 1);
