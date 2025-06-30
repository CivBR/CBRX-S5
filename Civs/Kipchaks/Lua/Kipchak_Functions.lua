-- JFD_Civs_AfghanistanZahirShah_Functions
-- Author: JFD
-- DateCreated: 2/15/2014 6:33:36 PM
--==========================================================================================================================
-- INCLUDES
--==========================================================================================================================
------------------------------------------------------------------------------------------------------------------------
include("FLuaVector.lua")
include("PlotIterators.lua")
include("IconSupport.lua")
--include("UniqueDiplomacyUtilsV2.lua")

-- ======================== --
-- TABLESAVERLOADER SUPPORT --
-- ======================== --

-- Just stealing the includes from the code I'm referencing to be safe
include("Kipchaks_GlobalDefines.lua");
include("TableSaverLoader016.lua");

tableRoot = Lung_Kipchaks
tableName = "Lung_Kipchaks"

include("Kipchaks_TSLSerializerV3.lua");

TableLoad(tableRoot, tableName)

function OnModLoaded() 
	local bNewGame = not TableLoad(tableRoot, tableName)
	TableSave(tableRoot, tableName)
end
OnModLoaded()

-- if not KilomboStartingUnitXP[0] then
	-- for playerID, pPlayer in pairs(Players) do
		-- KilomboStartingUnitXP[playerID] = {}
	-- end
-- end

--==========================================================================================================================
-- GLOBALS
--==========================================================================================================================
------------------------------------------------------------------------------------------------------------------------
local g_ConvertTextKey  = Locale.ConvertTextKey
local g_MapGetPlot		= Map.GetPlot
local g_MathCeil		= math.ceil
local g_MathFloor		= math.floor
local g_MathMax			= math.max
local g_MathMin			= math.min
				
local Players 			= Players
local HexToWorld 		= HexToWorld
local ToHexFromGrid 	= ToHexFromGrid
local Teams 			= Teams
--==========================================================================================================================
-- UTILITIES
--==========================================================================================================================
------------------------------------------------------------------------------------------------------------------------
-- CORE UTILITIES
------------------------------------------------------------------------------------------------------------------------
--HasTrait
function HasTrait(player, traitID)
	if Player.HasTrait then 
		return player:HasTrait(traitID)
	else
		local leaderType = GameInfo.Leaders[player:GetLeaderType()].Type
		local traitType  = GameInfo.Traits[traitID].Type
		for row in GameInfo.Leader_Traits("LeaderType = '" .. leaderType .. "' AND TraitType = '" .. traitType .. "'") do
			return true
		end
	end
	return false
end

----------------------------------------------------------------------------------------------------------------------------
-- JFD_IsCivilisationActive
function JFD_IsCivilizationActive(civilizationID)
	for iSlot = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
		local slotStatus = PreGame.GetSlotStatus(iSlot)
		if (slotStatus == SlotStatus["SS_TAKEN"] or slotStatus == SlotStatus["SS_COMPUTER"]) then
			if PreGame.GetCivilization(iSlot) == civilizationID then
				return true
			end
		end
	end
	return false
end

function Neirai_GetNearestCity(pPlayer, pPlot)
    local distance = 9999
    local cNearestCity = nil
    for cCity in pPlayer:Cities() do
        local pCityPlot = cCity:Plot()
        local between = Map.PlotDistance(pCityPlot:GetX(), pCityPlot:GetY(), pPlot:GetX(), pPlot:GetY())
        if (between < distance) and (between > 0) then
            distance = between
            cNearestCity = cCity
        end
    end
    return cNearestCity
end

-- Adapted from TopHat's France, but hopefully not horribly bugged
function GetTraitPlayerFromTeam(teamID, traitID)
	local iTeam = 0
	for iPlayer = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
		local pPlayer = Players[iPlayer]
		if pPlayer and pPlayer:GetCivilizationType() == civilizationID then -- TODO: If this doesn't work, bypass HasTrait entirely here
			iTeam = pPlayer:GetTeam()
			if iTeam == teamID then
				return pPlayer
			end
		end
	end
	return nil
end

function GetTradeRoutesFromCity(pCity)
	local pOwner = Players[pCity:GetOwner()]
	local tLocalRoutes = {}
	local iVal = 1
	for k, v in pairs(pOwner:GetTradeRoutes()) do
		if v.FromCity == pCity then
			tLocalRoutes[iVal] = v
			iVal = iVal + 1
		end
	end
	return tLocalRoutes
end

function GetNumTradeRoutesFromCity(pCity)
	local pOwner = Players[pCity:GetOwner()]
	local iVal = 1
	for k, v in pairs(pOwner:GetTradeRoutes()) do
		if v.FromCity == pCity then
			iVal = iVal + 1
		end
	end
	return iVal
end

----------------------------------------------------------------------------------------------------------------------------
-- JFD_GetRandom
function JFD_GetRandom(lower, upper)
	return Game.Rand((upper + 1) - lower, "") + lower
end

------------------------------------------------------------------------------------------------------------------------
-- GetPlayerByCivilization
------------------------------------------------------------------------------------------------------------------------
function GetPlayerByCivilization(civilizationType)
	for _, pPlayer in pairs(Players) do
		if pPlayer and pPlayer:GetCivilizationType() == civilizationType then 
			return pPlayer
		end
	end
end
------------------------------------------------------------------------------------------------------------------------
-- MOD UTILITIES
------------------------------------------------------------------------------------------------------------------------
--Game_IsCPActive
function Game_IsCPActive()
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if mod.ID == "d1b6328c-ff44-4b0d-aad7-c657f83610cd" then
			return true
		end
	end
	return false
end
local g_IsCPActive = (Game_IsCPActive() and Player.HasStateReligion)
------------------------------------------------------------------------------------------------------------------------
--Game_IsVMCActive
function Game_IsVMCActive()
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if mod.ID == "d1b6328c-ff44-4b0d-aad7-c657f83610cd" then
			return true
		end
	end
	return false
end
local g_IsVMCActive = Game_IsVMCActive()
--==========================================================================================================================
-- GAME DEFINES
--==========================================================================================================================
------------------------------------------------------------------------------------------------------------------------
local defineMaxMajorCivs = GameDefines["MAX_MAJOR_CIVS"]
local defineMaxMinorCivs = GameDefines["MAX_MINOR_CIVS"]
--==========================================================================================================================
-- UNIQUE FUNCTIONS
--==========================================================================================================================
------------------------------------------------------------------------------------------------------------------------
-- GLOBALS
------------------------------------------------------------------------------------------------------------------------
local civilizationBarbarianID = 63
local civilizationID = GameInfoTypes["CIVILIZATION_LUNG_KIPCHAKS"]
local bIsActive = JFD_IsCivilizationActive(civilizationID)
local traitKipchaksID = GameInfoTypes["TRAIT_LUNG_KIPCHAKS"]

local improvementBalbalsID = GameInfoTypes["IMPROVEMENT_LUNG_BALBALS"]

local unitTarkhanID = GameInfoTypes["UNIT_LUNG_TARKHAN"]

local promotionKipchakMercenaryID = GameInfoTypes["PROMOTION_LUNG_KIPCHAK_MERCENARY"]

local iPracticalNumCivs = (GameDefines.MAX_MAJOR_CIVS - 1)
------------------------------------------------------------------------------------------------------------------------
-- FUNCTIONS
------------------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------------------
-- UA: Units garrisoned in cities may become mercenaries, disappearing from your control to join a foreign civÅfs army and granting you money
------------------------------------------------------------------------------------------------------------------------
local pActivePlayer = Players[Game.GetActivePlayer()]
local domainLandID = GameInfoTypes["DOMAIN_LAND"]
local goldReward = 50 -- TODO: Play with this number

function Lung_Kipchaks_IsButtonPossible(pUnit)
	-- print("Lung_Kipchaks_IsButtonPossible: Running...")
	-- To be possible, the unit must belong to the Kipchaks, must be garrisoned in a city, and there must be at least one friendly player to send to
	local pUnitOwner = Players[pUnit:GetOwner()]
	if (pUnitOwner:GetCivilizationType() == civilizationID) then
		-- print("Lung_Kipchaks_IsButtonPossible: Civilization is Kipchaks")
		local pPlot = pUnit:GetPlot()
		local pPlotOwner = -1
		if pPlot:IsOwned() then
			pPlotOwner = Players[pPlot:GetOwner()]
		end
		-- if pUnitOwner ~= pPlotOwner then
		if pUnit:GetBaseCombatStrength() < 1 then return false end
		
		if pPlot:IsCity() then
			local pCity = pPlot:GetPlotCity()
			
			if pCity:GetOwner() == pUnit:GetOwner() then
				local iPlayer = pUnit:GetOwner()
				local pPlayer = Players[iPlayer]
				local pTeam = Teams[pPlayer:GetTeam()]
				
				-- Making sure there's at least one friendly player
				local friendlyCivExists = false
				for iOtherPlayer = 0, iPracticalNumCivs do
					local pOtherPlayer = Players[iOtherPlayer]
					local iOtherTeam = Teams[pOtherPlayer:GetTeam()]
					if pOtherPlayer and (iOtherPlayer ~= iPlayer) then
						if not pTeam:IsAtWar(iOtherTeam) then
							if pOtherPlayer:GetNumCities() > 0 then
								-- At least one other player is friendly, return true
								return true
							end
						end
					end
				end
				
				
			end
			
		end
		
	end
	-- print("Lung_Kipchaks_IsButtonPossible: No condition satisfied, RETURNING FALSE")
	return false
end

function Lung_Kipchaks_DoButtonEffect(pPlayer, pUnit)
	-- print("Lung_Kipchaks_DoButtonEffect: Running...")
	local pPlot = pUnit:GetPlot()
	local pPlotOwner = -1
	local iPlayer = pUnit:GetOwner() -- Should be fine but is a bit hacky
	local pUnitOwner = Players[iPlayer]
	if pPlot:IsOwned() then
		pPlotOwner = Players[pPlot:GetOwner()]
	end
	local pTeam = Teams[pPlayer:GetTeam()]
	local iEra = pPlayer:GetCurrentEra()
	
	
	-- Stores relevant information regarding the unit, and then deletes the unit
	
	-- Selecting a random friendly player
	local tFriendlyPlayers = {}
	local tNumFriendlyPlayers = 0
	
	for iOtherPlayer = 0, iPracticalNumCivs do
		local pOtherPlayer = Players[iOtherPlayer]
		if pOtherPlayer and pOtherPlayer:IsEverAlive() and (iOtherPlayer ~= iPlayer) and (pOtherPlayer:GetNumCities() > 0) then
			local iOtherTeam = pOtherPlayer:GetTeam()
			if not pTeam:IsAtWar(iOtherTeam) then
				-- At least one other player is friendly, return true
				tNumFriendlyPlayers = tNumFriendlyPlayers + 1
				tFriendlyPlayers[tNumFriendlyPlayers] = iOtherPlayer

				-- Double the odds of getting picked if the player has a DoF with the Kipchaks
				if pPlayer:IsDoF(pOtherPlayer) then
					tNumFriendlyPlayers = tNumFriendlyPlayers + 1
					tFriendlyPlayers[tNumFriendlyPlayers] = iOtherPlayer
				end
			end
		end
	end
	
	local randPlayer = JFD_GetRandom(1, tNumFriendlyPlayers)
	local selectedPlayer = tFriendlyPlayers[randPlayer]
	-- print("Selected player: " .. selectedPlayer)
	
	local pSelectedPlayer = Players[selectedPlayer]
	
	-- Creates a copy of the unit being sent off
	local pNearestCity = Neirai_GetNearestCity(pSelectedPlayer, pPlot)
	local pNearestCityPlot = pNearestCity:Plot()
	local pUnitType = pUnit:GetUnitType()
	local pUnitAIType = pUnit:GetUnitAIType()
	local pNewUnit = pSelectedPlayer:InitUnit(pUnitType, pNearestCityPlot:GetX(), pNearestCityPlot:GetY(), pUnitAIType)
	pNewUnit:JumpToNearestValidPlot()
	pNewUnit:ChangeExperience(pUnit:GetExperience()) -- Maybe this is unnecessary, but I'm giving the unit the XP of the old unit
	pNewUnit:SetHasPromotion(promotionKipchakMercenaryID, true)

	-- Stores the info and then deletes the old unit
	-- Structure is: original owner of unit, unit type, experience on leaving, turn when the unit should return, player the unit belongs to, ID of the new unit
	table.insert(KipchakMercenaries, {iPlayer, pUnitType, pUnit:GetExperience(), (Game.GetGameTurn() + 25), selectedPlayer, pNewUnit:GetID()})
	-- print("Lung_Kipchaks_DoButtonEffect: Will return on turn " .. (Game.GetGameTurn() + 30))
	
	if pPlayer:IsHuman() then
		Events.GameplayAlertMessage('Your ' .. pUnit:GetName() ..' has been sent off to perform mercenary work!')
	end
	
	pUnit:Kill()
	
	pPlayer:ChangeGold(goldReward)
	
end

function Lung_KipchaksUnit_UnitActionButton()
	-- print("Lung_KipchaksUnit_UnitActionButton: Running...")
	local pUnit = UI.GetHeadSelectedUnit();
	Lung_Kipchaks_DoButtonEffect(pActivePlayer, pUnit)
end

function Lung_KipchaksUnit_SerialEventUnitInfoDirty()
	-- print("Lung_KipchaksUnit_SerialEventUnitInfoDirty: Running...")
	local pUnit = UI.GetHeadSelectedUnit();
	if (not pUnit) then return end
	if Lung_Kipchaks_IsButtonPossible(pUnit) then
		Controls.UnitActionButton:SetHide(false)
	else
		Controls.UnitActionButton:SetHide(true)
	end
	
	local buildCityButtonActive = pUnit:IsFound();
				
	local primaryStack = ContextPtr:LookUpControl("/InGame/WorldView/UnitPanel/PrimaryStack")
	local primaryStretchy = ContextPtr:LookUpControl("/InGame/WorldView/UnitPanel/PrimaryStretchy")
	primaryStack:CalculateSize();
	primaryStack:ReprocessAnchoring();

	local stackSize = primaryStack:GetSize();
	local stretchySize = primaryStretchy:GetSize();
	local buildCityButtonSize = 0
	if buildCityButtonActive then
		if OptionsManager.GetSmallUIAssets() and not UI.IsTouchScreenEnabled() then
			buildCityButtonSize = 36;
		else
			buildCityButtonSize = 60;
		end
	end
	primaryStretchy:SetSizeVal( stretchySize.x, stackSize.y + buildCityButtonSize + 348 );
end

local function Lung_KipchaksUnit_UpdateUnitInfoPanel()
	-- print("Lung_KipchaksUnit_UpdateUnitInfoPanel: Running...")
	if (not OptionsManager.GetSmallUIAssets()) then
		Controls.UnitActionButton:SetSizeVal(50,50)
		Controls.UnitActionIcon:SetSizeVal(64,64)
		Controls.UnitActionIcon:SetTexture("UnitActions360.dds")
	else
		Controls.UnitActionButton:SetSizeVal(36,36)
		Controls.UnitActionIcon:SetSizeVal(45,45)
		Controls.UnitActionIcon:SetTexture("UnitActions360.dds")
	end
	Controls.UnitActionIcon:LocalizeAndSetToolTip("TXT_KEY_LUNG_KIPCHAKS_SELLSWORD_TOOLTIP")
	Controls.UnitActionButton:ChangeParent(ContextPtr:LookUpControl("/InGame/WorldView/UnitPanel/PrimaryStack"))
end

function Lung_Kipchaks_AI_DoTurn(playerID)
	-- print("Lung_Kipchaks_AI_DoTurn: Running...")
	local pPlayer = Players[playerID]
	if (pPlayer:GetCivilizationType() == civilizationID) then
		-- print("Lung_Kipchaks_AI_DoTurn: Civilization is Lung_Kipchaks")
		if (not pPlayer:IsHuman()) then
			-- print("Lung_Kipchaks_AI_DoTurn: Lung_Kipchaks is AI player")
			for pUnit in pPlayer:Units() do
				if Lung_Kipchaks_IsButtonPossible(pUnit) then
					local randCap = 2
					local pTeam = Teams[pPlayer:GetTeam()]

					if pUnit:GetUnitType() == unitTarkhanID then
						randCap = randCap + 1
					end

					if pTeam:GetAtWarCount(true) > 0 then
						randCap = randCap - 1
					end

					if pPlayer:GetNumMilitaryUnits() < (pPlayer:GetNumCities() * 6) then
						randCap = randCap - 1
					end
				
					local iRand = JFD_GetRandom(1, 15)
					if iRand <= randCap then	
						-- print("Lung_Kipchaks_AI_DoTurn: Decided to send off unit")
						Lung_Kipchaks_DoButtonEffect(pPlayer, pUnit)
					end
				end
			end
		end
	end
	
end

local function Initialize()	
	Events.LoadScreenClose.Add(Lung_KipchaksUnit_UpdateUnitInfoPanel);
	Events.SerialEventUnitInfoDirty.Add(Lung_KipchaksUnit_SerialEventUnitInfoDirty);
end

Controls.UnitActionButton:RegisterCallback(Mouse.eLClick, Lung_KipchaksUnit_UnitActionButton);
IconHookup(51, 45, "UNIT_ACTION_ATLAS", Controls.UnitActionIcon)
GameEvents.PlayerDoTurn.Add(Lung_Kipchaks_AI_DoTurn)
Initialize();


------------------------------------------------------------------------------------------------------------------------
-- UA: After some amount of turns, whether they survived fighting for the other civ or not they return to you with a large boost of XP and Golden Age Points
------------------------------------------------------------------------------------------------------------------------
-- Structure is: original owner of unit, unit type, experience on leaving, turn when the unit should return, player the unit belongs to, ID of the new unit

local bonusExperience = 30 -- TODO: Play with this!
local mercGoldenAgePointReward = 15 -- TODO: Play with this!
function Lung_Kipchaks_UA_PlayerDoTurn(playerID) -- Begins the function, grabs the player's ID
	-- print("Lung_Kipchaks_UA_PlayerDoTurn: Running...")
	local pPlayer = Players[playerID] -- Defines a local variable equal to the ID of the current player. human specifically?
	if pPlayer and pPlayer:IsAlive() and pPlayer:GetCivilizationType() == civilizationID then
		
		local mercCount = table.maxn(KipchakMercenaries)
		local returnCount = 0
		if mercCount > 0 then
		
			for i=1, mercCount do -- TODO: FIgure out how to loop here
				-- print("Lung_Kipchaks_UA_PlayerDoTurn: Checking merc " .. i)
				if KipchakMercenaries[i][4] == Game.GetGameTurn() and KipchakMercenaries[i][1] == playerID then
					-- Return unit
					-- print("Lung_Kipchaks_UA_PlayerDoTurn: Found, returning unit")
					
					local pUnitType = KipchakMercenaries[i][2]
					local iBorrowingPlayer = KipchakMercenaries[i][5]
					-- print("Lung_Kipchaks_UA_PlayerDoTurn: Borrowing player is " .. iBorrowingPlayer)
					local pBorrowingPlayer = Players[iBorrowingPlayer]
					local iXP = 0
					local unitReturned = false
					if pBorrowingPlayer and pBorrowingPlayer:IsAlive() then
						-- print("Lung_Kipchaks_UA_PlayerDoTurn: Borrowing player is still around")
						
						local pBorrowedUnit = pBorrowingPlayer:GetUnitByID(KipchakMercenaries[i][6])
						if pBorrowedUnit then
							pUnitType = pBorrowedUnit:GetUnitType() -- If the unit is alive we can steal its unit type in case it was promoted
							iXP = pBorrowedUnit:GetExperience()
							pBorrowedUnit:Kill() -- Deleting the other player's copy
							unitReturned = true
						end
					end
					if unitReturned == false then
						iXP = KipchakMercenaries[i][3]
					end
					
					local pCapital = pPlayer:GetCapitalCity()
					local pCapitalPlot = pCapital:Plot()
					
					local pNewUnit = pPlayer:InitUnit(pUnitType, pCapitalPlot:GetX(), pCapitalPlot:GetY())
					pNewUnit:JumpToNearestValidPlot()
					pNewUnit:ChangeExperience(iXP + bonusExperience) -- Maybe this is unnecessary, but I'm giving the unit the XP of the old unit
					
					pPlayer:ChangeGoldenAgeProgressMeter(mercGoldenAgePointReward)
					
					if pPlayer:IsHuman() then
						Events.GameplayAlertMessage('Your ' .. pNewUnit:GetName() ..' has returned from mercenary work, granting [ICON_GOLDEN_AGE] Golden Age Points!')
					end
					returnCount = returnCount + 1 -- If the return failed for some reason we still want to remove from list
					
					-- Potentially increasing Happiness yields of Balbals
					if pPlayer:IsGoldenAge() then
						for k,v in pairs(BalbalsPlots) do
							if (v == true) then
								local pPlot = Map.GetPlotByIndex(k)
								local pCity = pPlot:GetWorkingCity()
								if pCity and (pCity:GetOwner() == playerID) then
									
									local happinessChance = JFD_GetRandom(1, 10)
									
									if happinessChance > 8 then
										local balbalHappiness = BalbalsHappiness[k]
										BalbalsHappiness[k] = balbalHappiness + 1
										
										if pPlayer:IsHuman() then -- TODO: This might not work, test this
											local pPlot = Map.GetPlotByIndex(k)
											local iX = pPlot:GetX()
											local iY = pPlot:GetY()
											local sMessage = "[COLOR_YIELD_GOLD]+" .. tradeRouteCount .. " [ICON_HAPPINESS_1][ENDCOLOR]"
											Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(iX, iY))), sMessage, 0)
										end
									end
								end
							end
						end
					end
				end
			end
			
			if returnCount > 0 then
				for j=1, returnCount do
					table.remove(KipchakMercenaries, 1)
				end
			end

		end
	end
	
end

if bIsActive then
	GameEvents.PlayerDoTurn.Add(Lung_Kipchaks_UA_PlayerDoTurn)
end

------------------------------------------------------------------------------------------------------------------------
-- UU: Capturing cities grants Golden Age Points
------------------------------------------------------------------------------------------------------------------------
local captureGoldenAgePointReward = 10 -- TODO: Play with this!
function Lung_Kipchaks_UU_CityCaptureComplete(oldPlayerID, bCap, iX, iY, newOwnerID, iOldPop, bConquest)
	-- print("Lung_Kipchaks_UU_CityCaptureComplete: Running...")
	local pCity = Map.GetPlot(x, y):GetPlotCity()
	local pPlot = Map.GetPlot(iX, iY)
	local pPlayer = Players[newOwnerID]
	if bConquest then
		
		local pPlot = Map.GetPlot(iX, iY)
		local pUnit = pPlot:GetUnit(0)
		if pUnit and pUnit:GetOwner() == newOwnerID then
			if pUnit:GetUnitType() == unitTarkhanID then
				pPlayer:ChangeGoldenAgeProgressMeter(captureGoldenAgePointReward)
				
				-- Original owner also get the points
				if pPlayer:GetCivilizationType() ~= civilizationID then
					local mercCount = table.maxn(KipchakMercenaries)
					if mercCount > 0 then
					
						for i=1, mercCount do -- TODO: Figure out how to loop here
							if KipchakMercenaries[i][5] == newOwnerID and KipchakMercenaries[i][6] == pUnit:GetID() then
								donorPlayerID = KipchakMercenaries[i][1]
								local pDonorPlayer = Players[donorPlayerID]
								if pDonorPlayer:IsAlive() then
									pDonorPlayer:ChangeGoldenAgeProgressMeter(captureGoldenAgePointReward)
								end
							end
						end
					end
				end
				
			end
		end
	end
end

if bIsActive then
	GameEvents.CityCaptureComplete.Add(Lung_Kipchaks_UU_CityCaptureComplete)
end

------------------------------------------------------------------------------------------------------------------------
-- UI: Increased movement speed to friendly units
------------------------------------------------------------------------------------------------------------------------

function Lung_Kipchaks_UI_Movement_PlayerDoTurn(playerID) -- Begins the function, grabs the player's ID
	-- print("Lung_Kipchaks_UI_Movement_PlayerDoTurn: Running...")
	local pPlayer = Players[playerID] -- Defines a local variable equal to the ID of the current player. human specifically?
	if pPlayer and pPlayer:IsAlive() and pPlayer:GetCivilizationType() == civilizationID then
		
		for pUnit in pPlayer:Units() do
			
			local pPlot = pUnit:GetPlot()
			if pPlot:GetImprovementType() == improvementBalbalsID and (pPlot:GetOwner() == playerID or (pPlayer:IsDoF(pPlot:GetOwner()))) then
				pUnit:ChangeMoves(60) -- TODO: Play with this!
			end
			
			if BalbalsPlots[pPlot:GetPlotIndex()] then
				-- print("Plot is Balbals in Balbals index")
			end
			
		end
	end
	
end

if bIsActive then
	GameEvents.PlayerDoTurn.Add(Lung_Kipchaks_UI_Movement_PlayerDoTurn)
end


------------------------------------------------------------------------------------------------------------------------
-- UI: During a Golden Age Balbals have a chance to accumulate permanent happiness yields when Kipchak Mercenaries return to your control
------------------------------------------------------------------------------------------------------------------------

-- Repurposed from Cebu, who in turn repurposed it from Rosas Argentina

-- TopHat is the only reason I'm able to do this, thank you lad, stolen from Louis XI - left TopHat's comments mostly intact
-- Combined with code from Rozvi and I think also DMS Indira Gandhi

-- This is ugly as hell, but I've done my best to provide clarifying comments

-- Had to mess around with IDs a lot, no clue if this works

-- This handles applying the Happiness dummies to cities! The actual Happiness-incrementing code is under the UA

local buildingDummyKipchaksHappiness = GameInfoTypes["BUILDING_DUMMY_LUNG_KIPCHAKS_BONUS_HAPPINESS"]

function Lung_Kipchaks_UI_PlayerDoTurn(playerID)
	-- print("Lung_Kipchaks_UI_PlayerDoTurn: Running for player " .. playerID)
	local pPlayer = Players[playerID]
	if pPlayer == nil then return end
	if not pPlayer:IsAlive() then return end
	if pPlayer:GetCivilizationType() ~= civilizationID then return end	

	-- STEP 0: Reset Gold dummy buildings

	for cCity in pPlayer:Cities() do
		-- print("NC_Cebu_UI_PlayerDoTurn: Resetting Cebu trade dummies")
		cCity:SetNumRealBuilding(buildingDummyKipchaksHappiness, 0)
	end
	
	for k,v in pairs(OtherPlayersWithBalbals) do
		-- print("NC_Cebu_UI_PlayerDoTurn: Resetting other civ trade dummies")
		local kPlayer = Players[k]
		for vk,vv in pairs(v) do
			local city = kPlayer:GetCityByID(vk)
			if city then
				city:SetNumRealBuilding(buildingDummyKipchaksHappiness, 0)
			end
		end
	end
	
	-- STEP 1: Check all the Balbals, see if there are any new cities or if any Balbals are pillaged/no longer belong to cities, have been resettled, or belong to a city/civ that didn't have one before
	for k,v in pairs(BalbalsPlots) do
		local pPlot = Map.GetPlotByIndex(k)
		local pCity = pPlot:GetWorkingCity()
		if pCity then
		
			-- Pillaged tiles need not be tallied
			if pPlot:IsImprovementPillaged() == true then
				-- print("NC_Cebu_UI_PlayerDoTurn: Removing pillaged improvements from count (this can never happen, it's destroyed on pillage)")
				BalbalsPlots[k] = false
			else
				local pOtherPlayer = Players[pCity:GetOwner()]
				-- If there's a city (belonging to a civ (that's not Cebu) with a Barangay that doesn't currently have a Barangay, add it to the list
				if pOtherPlayer:GetCivilizationType() ~= civilizationID then
					-- If the city belongs to a civ that didn't have a Barangay before, add them to the list
					if not OtherPlayersWithBalbals[pOtherPlayer:GetID()] then
						-- print("NC_Cebu_UI_PlayerDoTurn: New civ obtained Barangay, adding to list")
						OtherPlayersWithBalbals[pOtherPlayer:GetID()] = {}
					end
					if not OtherPlayersWithBalbals[pOtherPlayer:GetID()][pCity:GetID()] then
						-- print("NC_Cebu_UI_PlayerDoTurn: City with Barangay not being counted yet, adding to list")
						OtherPlayersWithBalbals[pOtherPlayer:GetID()][pCity:GetID()] = true
						
					end
				end
				
				-- If the plot wasn't being tallied before but belongs to a city and isn't pillaged now, we need to tally it
				if pPlot:GetImprovementType() == improvementBalbalsID and BalbalsPlots[k] == false then
					-- print("NC_Cebu_UI_PlayerDoTurn: Previously pillaged Barangay has been repaired (this can never happen, it's destroyed on pillage)")
					BalbalsPlots[k] = true
				end
			end
			
		-- Barangays not in cities need not be tallied
		else
			-- print("NC_Cebu_UI_PlayerDoTurn: Barangay not in city")
			BalbalsPlots[k] = false
		end
	end

	-- STEP 3: For all valid Barangays, check the city they belong to and their trade route count, then give that many Gold dummies to the city
	
	for k,v in pairs(BalbalsPlots) do
		if (v == true) then
			local pPlot = Map.GetPlotByIndex(k)
			local pCity = pPlot:GetWorkingCity()
			if pCity then
				
				local balbalHappiness = BalbalsHappiness[k]
				if balbalHappiness > 0 then
					pCity:SetNumRealBuilding(buildingDummyKipchaksHappiness, (pCity:GetNumRealBuilding(buildingDummyKipchaksHappiness) + balbalHappiness))
				end
					
			end
		end
	end
end



-- STEP 4: When an improvement is finished, if it's a Barangay then add it to the Barangays table, if it's a repaired Barangay then set its value in the table to true, and if it was a Barangay but isn't anymore then remove it
function Lung_Kipchaks_UI_OnBuildFinished(playerID, plotX, plotY, improvementID)
	-- print("Lung_Kipchaks_UI_OnBuildFinished: Running...")
	local pPlayer = Players[playerID]
	local plot = Map.GetPlot(plotX, plotY)
	-- PEARL OF THE DESERT
	if HasTrait(pPlayer, traitKipchaksID) and (improvementID == improvementBalbalsID) then
		-- print("Lung_Kipchaks_UI_OnBuildFinished: adding plot to table")
		BalbalsPlots[plot:GetPlotIndex()] = true
		BalbalsHappiness[plot:GetPlotIndex()] = 0
		-- BarangayCities[plot:GetWorkingCity()] = true
		-- print("NC_Cebu_OnBuildFinished: New Barangay built, adding to table")
	elseif BalbalsPlots[plot:GetPlotIndex()] then -- If the plot was a Balbals but is not anymore, stop checking the plot and reset its Happiness
		BalbalsPlots[plot:GetPlotIndex()] = false
		BalbalsHappiness[plot:GetPlotIndex()] = 0
	end -- TODO: Shouldn't need to add anything on removal of a Barangay
end

if bIsActive then
	GameEvents.PlayerDoTurn.Add(Lung_Kipchaks_UI_PlayerDoTurn)
	GameEvents.BuildFinished.Add(Lung_Kipchaks_UI_OnBuildFinished)
end

print("Kipchaks_Functions.lua loaded!")