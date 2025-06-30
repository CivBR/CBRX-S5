--============================================================
-- GLOBALS
--============================================================
include("FLuaVector.lua")
include("IconSupport.lua")
include("InstanceManager.lua")

local iSeychelles = GameInfoTypes["CIVILIZATION_JWW_SEYCHELLES"]
local iCoast = GameInfoTypes["TERRAIN_COAST"]
local iOcean = GameInfoTypes["TERRAIN_OCEAN"]

local iPracticalNumCivs = (GameDefines.MAX_MAJOR_CIVS - 1)
function JFD_IsCivilisationActive(civilizationID)
	for iSlot = 0, iPracticalNumCivs, 1 do
		local slotStatus = PreGame.GetSlotStatus(iSlot)
		if (slotStatus == SlotStatus["SS_TAKEN"] or slotStatus == SlotStatus["SS_COMPUTER"]) then
			if PreGame.GetCivilization(iSlot) == civilizationID then
				return true
			end
		end
	end
	return false
end
local bIsActive = JFD_IsCivilisationActive(iSeychelles)

function JFD_GetRandom(lower, upper)
    return Game.Rand((upper + 1) - lower, "") + lower
end

function Neirai_GetNearestCity(pPlayer, pPlot)
    local distance = 9999
    local cNearestCity = nil
    for cCity in pPlayer:Cities() do
        local pCityPlot = cCity:Plot()
        local between = Map.PlotDistance(pCityPlot:GetX(), pCityPlot:GetY(), pPlot:GetX(), pPlot:GetY())
        if between < distance then
            distance = between
            cNearestCity = cCity
        end
    end
    return cNearestCity
end

local tSeaResources = {}
for row in DB.Query("SELECT ID FROM Resources WHERE TechCityTrade = 'TECH_SAILING' OR TechCityTrade = 'TECH_BIOLOGY'") do
    tSeaResources[row.ID] = true
end
--===========================================================================
-- UA (Finis Coronat Opus)
--===========================================================================
-- Sea Resources are Automatically Upgraded
-----------------------------------------------------------------------------
local iFishingBoats = GameInfoTypes["IMPROVEMENT_FISHING_BOATS"]
local iOffshorePlatform = GameInfoTypes["IMPROVEMENT_OFFSHORE_PLATFORM"]

local tImprovements = {}
for row in DB.Query("SELECT Type FROM Improvements WHERE Water = 1") do
	tImprovements[row.Type] = true
end

function JWW_UpgradeDemSeaResources(iPlayer)
	local pPlayer = Players[iPlayer]
	if pPlayer:IsAlive() and pPlayer:GetCivilizationType() == iSeychelles then
		for pCity in pPlayer:Cities() do
			if (not pCity:IsPuppet()) or (not pCity:IsOccupied()) then
				for i = 0, pCity:GetNumCityPlots() - 1, 1 do
					local pPlot = pCity:GetCityIndexPlot(i)
					if pPlot:GetWorkingCity() == pCity then
						if tSeaResources[pPlot:GetResourceType(pPlayer:GetTeam())] then
							if not tImprovements[pPlot:GetImprovementType()] then
								if pPlot:CanHaveImprovement(iFishingBoats) then
									pPlot:SetImprovementType(iFishingBoats)
								else
									if pPlot:CanHaveImprovement(iOffshorePlatform) then
										pPlot:SetImprovementType(iOffshorePlatform)
									end
								end
							else
								if pPlot:IsImprovementPillaged() then --if Improvement is pillaged, fix it automatically
									pPlot:SetImprovementPillaged(false)
								end
							end
						end
					end
				end
			end
		end
	end
end
-----------------------------------------------------------------------------
-- (AI Only) Delete Work Boats
-----------------------------------------------------------------------------
local iWorkBoat = GameInfoTypes["UNIT_WORKBOAT"]

function JWW_IfAIIsFuckingDumb(iPlayer) --Sometimes the AI builds Work Boats despite it being covered by the UA
	local pPlayer = Players[iPlayer]
	if pPlayer:GetCivilizationType() == iSeychelles and not pPlayer:IsHuman() then
		for pUnit in pPlayer:Units() do
			if pUnit:GetUnitType() == iWorkBoat then
				local pPlot = pUnit:GetPlot()
				local pCity = Neirai_GetNearestCity(pPlayer, pPlot)
				pUnit:Kill()
				pCity:ChangeProduction(50)
				pPlayer:ChangeGold(5)
			end
		end
	end
end
-----------------------------------------------------------------------------
-- Tourism gives dummies that give units additonal XP when trained
-----------------------------------------------------------------------------
local iUADummy = GameInfoTypes["BUILDING_JWW_SEYCHELLES_UA"]

function JWW_TourismGiveDummies(iPlayer)
	local pPlayer = Players[iPlayer]
	if pPlayer:IsAlive() and pPlayer:GetCivilizationType() == iSeychelles then
		for pCity in pPlayer:Cities() do
			local iTourism = pCity:GetBaseTourism()
			pCity:SetNumRealBuilding(iUADummy, iTourism)
		end
	end
end
-----------------------------------------------------------------------------
if bIsActive then
	GameEvents.PlayerDoTurn.Add(JWW_UpgradeDemSeaResources)
	GameEvents.PlayerDoTurn.Add(JWW_IfAIIsFuckingDumb)
	GameEvents.PlayerDoTurn.Add(JWW_TourismGiveDummies)
end
--===========================================================================
-- UB (UA)
--===========================================================================
local iUA = GameInfoTypes["BUILDING_JWW_LOTEL"]
-----------------------------------------------------------------------------
-- Enemy Naval units within city limits have chance to swap sides
-----------------------------------------------------------------------------
local iSea = GameInfoTypes["DOMAIN_SEA"]

function JWW_EnemyChanceToSwitchSides(iPlayer)
	local pPlayer = Players[iPlayer]
	if pPlayer:IsAlive() and pPlayer:GetCivilizationType() == iSeychelles then
		for pCity in pPlayer:Cities() do
			if pCity:IsHasBuilding(iUA) then
				local pTeam = Teams[pPlayer:GetTeam()]
				for iPlayer = 0, GameDefines.MAX_MAJOR_CIVS - 1, 1 do
					local pOtherPlayer = Players[iPlayer]
					if pOtherPlayer ~= pPlayer then
						local iOtherTeam = pOtherPlayer:GetTeam()
						if pTeam:IsAtWar(iOtherTeam) then
							for pUnit in pOtherPlayer:Units() do
								if pUnit:GetDomainType() == iSea then
									local pPlot = pUnit:GetPlot()
									if pPlot:IsOwned() and (pPlot:GetWorkingCity() == pCity) then
										if Players[pPlot:GetOwner()] == pPlayer then
											if JFD_GetRandom(1, 200) == 1 then
												local pNewUnit = pPlayer:InitUnit(pUnit:GetUnitType(), pPlot:GetX(), pPlot:GetY(), pUnit:GetUnitAIType())
												pNewUnit:JumpToNearestValidPlot()
												pUnit:Kill(true)
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
	end
end
-----------------------------------------------------------------------------
-- Sea Resources provide Tourism
-----------------------------------------------------------------------------
local iUBDummy = GameInfoTypes["BUILDING_JWW_SEYCHELLES_UB"]

function JWW_FishMakeTourists(iPlayer)
	local iNumFish = 0
	local pPlayer = Players[iPlayer]
	if pPlayer:IsAlive() and pPlayer:GetCivilizationType() == iSeychelles then
		for pCity in pPlayer:Cities() do
			if pCity:IsHasBuilding(iUA) then
				for i = 0, pCity:GetNumCityPlots() - 1, 1 do
					local pPlot = pCity:GetCityIndexPlot(i)
					if pPlot:GetWorkingCity() == pCity then
						if tSeaResources[pPlot:GetResourceType(pPlayer:GetTeam())] then
							if (pPlot:GetTerrainType() == iCoast) or pPlot:GetTerrainType() == iOcean then
								iNumFish = iNumFish + 1
							end
						end
					end
				end
			end
			pCity:SetNumRealBuilding(iUBDummy, iNumFish)
		end
	end
end
-----------------------------------------------------------------------------
if bIsActive then
	GameEvents.PlayerDoTurn.Add(JWW_EnemyChanceToSwitchSides)
	GameEvents.PlayerDoTurn.Add(JWW_FishMakeTourists)
end
--===========================================================================
-- UU (SCG Cruiser)
--===========================================================================
local iSCGCruiser = GameInfoTypes["UNIT_JWW_SCG_CRUISER"]
local iDestroyerClass = GameInfoTypes["UNITCLASS_DESTROYER"]
-----------------------------------------------------------------------------
-- Units killed by UU grant Population in nearest city, and have a chance to swap sides
-----------------------------------------------------------------------------
function JWW_IfDedNextToUUThenSwitchSides(iPlayer, iUnit, eUnit, iPlotX, iPlotY, bDelay, iByPlayer)
	local pPlayer = Players[iPlayer]
	local pByPlayer = Players[iByPlayer]
	local pCap = pPlayer:GetCapitalCity()
	if JFD_GetRandom(1, 10) == 1 then
		if pByPlayer ~= nil then
			if (pPlayer ~= pByPlayer) and pByPlayer:HasUnitOfClassType(iDestroyerClass) then
				local pUnit = pPlayer:GetUnitByID(iUnit)
				for direction = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do
					local pAdjacentPlot = Map.PlotDirection(pUnit:GetX(), pUnit:GetY(), direction)
					if pAdjacentPlot and pAdjacentPlot:IsUnit() and not pAdjacentPlot:IsOwned() then
						for i = 0, pAdjacentPlot:GetNumUnits() - 1 do
							local pAdjUnit = pAdjacentPlot:GetUnit(i)
							if pAdjUnit:GetUnitType() == iSCGCruiser then
								for pByUnit in pByPlayer:Units() do
									if pByUnit == pAdjUnit then
										local pNewUnit = pByPlayer:InitUnit(pUnit:GetUnitType(), pAdjacentPlot:GetX(), pAdjacentPlot:GetY(), pUnit:GetUnitAIType())
										pNewUnit:JumpToNearestValidPlot()
										if pByPlayer:IsHuman() then
											Events.GameplayAlertMessage('As a result of the skirmish with the [COLOR_NEGATIVE_TEXT]' .. pPlayer:GetCivilizationAdjective() .. '[ENDCOLOR] pirates, we were able to capture their ship and send the pirates to prison.')
										end
										local pCity = Neirai_GetNearestCity(pByPlayer, pAdjacentPlot)
										pCity:ChangePopulation(1)
										break
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
-----------------------------------------------------------------------------
-- UU can be expended to claim all adjacent naval tiles
-----------------------------------------------------------------------------
function JWW_CanClaimTheSea(unit)
	local pBool = false;
	local pPlot = unit:GetPlot();
	if unit:GetUnitType() ~= iSCGCruiser then return pBool end
	if unit:MovesLeft() <= 1 then return pBool end
	if unit:GetOwner() ~= pPlot:GetOwner() then return pBool end
	if pPlot ~= nil then
		if (not pPlot:IsCity()) then
			if not pPlot:GetTerrainType() == iCoast or (not pPlot:GetTerrainType() == iOcean) then return pBool end
			for direction = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do
				local pAdjacentPlot = Map.PlotDirection(unit:GetX(), unit:GetY(), direction)
				if (not pAdjacentPlot:IsOwned()) or (pPlot:GetOwner() ~= pAdjacentPlot:GetOwner()) then
					pBool = true;
					break
				end
			end
		end
	end
	return pBool
end

function JWW_ClaimTheSea(pActivePlayer, pUnit)
	local playerID = Game.GetActivePlayer()
	local pPlayer = Players[Game.GetActivePlayer()]
	if JWW_CanClaimTheSea(pUnit) then
		for direction = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do
			local pAdjacentPlot = Map.PlotDirection(pUnit:GetX(), pUnit:GetY(), direction)
			if pAdjacentPlot and (pAdjacentPlot:GetTerrainType() == iCoast or pAdjacentPlot:GetTerrainType() == iOcean) then
				local pCity = Neirai_GetNearestCity(pPlayer, pAdjacentPlot)
				pAdjacentPlot:SetOwner(playerID, pCity:GetID())
			end
		end
		pUnit:Kill()
	end
end

function ClaimTheSea_UnitActionButton()
	local uUnit = UI.GetHeadSelectedUnit();
	JWW_ClaimTheSea(pActivePlayer, uUnit)
end

function ClaimTheSea_SerialEventUnitInfoDirty()
	local uUnit = UI.GetHeadSelectedUnit();
	if (not uUnit) then return end
	if JWW_CanClaimTheSea(uUnit) then
		Controls.UnitActionButton:SetHide(false)
	else
		Controls.UnitActionButton:SetHide(true)
	end
	
	local buildCityButtonActive = uUnit:IsFound();
				
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

local function ClaimTheSea_UpdateUnitInfoPanel()
	if (not OptionsManager.GetSmallUIAssets()) then
		Controls.UnitActionButton:SetSizeVal(50,50)
		Controls.UnitActionIcon:SetSizeVal(64,64)
		Controls.UnitActionIcon:SetTexture("SeychellesClaimAtlas45.dds")
	else
		Controls.UnitActionButton:SetSizeVal(36,36)
		Controls.UnitActionIcon:SetSizeVal(45,45)
		Controls.UnitActionIcon:SetTexture("SeychellesClaimAtlas45.dds")
	end
	Controls.UnitActionIcon:LocalizeAndSetToolTip("TXT_KEY_JWW_CLAIM_THE_SEA_HELP")
	Controls.UnitActionButton:ChangeParent(ContextPtr:LookUpControl("/InGame/WorldView/UnitPanel/PrimaryStack"))
end

local function Initialize()	
	Events.LoadScreenClose.Add(ClaimTheSea_UpdateUnitInfoPanel);
	Events.SerialEventUnitInfoDirty.Add(ClaimTheSea_SerialEventUnitInfoDirty);
end

function AIClaimTheSea_DoTurn(playerID)
	local aPlayer = Players[playerID]
	local aTeam = Teams[aPlayer:GetTeam()]
	if aPlayer:IsHuman() then return end
	if (aPlayer:GetCivilizationType() == iSeychelles) and aPlayer:HasUnitOfClassType(iDestroyerClass) then
		for aUnit in aPlayer:Units() do
			if aUnit:GetUnitType() == iSCGCruiser then
				if JWW_CanClaimTheSea(aUnit) then
					if aTeam:IsAtWar() == false then
						if JFD_GetRandom(1, 10) == 1 then
							for direction = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do
								local pAdjacentPlot = Map.PlotDirection(aUnit:GetX(), aUnit:GetY(), direction)
								if pAdjacentPlot and (pAdjacentPlot:GetTerrainType() == iCoast or pAdjacentPlot:GetTerrainType() == iOcean) then
									local pCity = Neirai_GetNearestCity(aPlayer, pAdjacentPlot)
									pAdjacentPlot:SetOwner(playerID, pCity:GetID())
								end
							end
							aUnit:Kill()
						end						
					end
				end
			end
		end
	end
end
-----------------------------------------------------------------------------
if bIsActive then
	GameEvents.UnitPrekill.Add(JWW_IfDedNextToUUThenSwitchSides)
	GameEvents.PlayerDoTurn.Add(AIClaimTheSea_DoTurn)
	Controls.UnitActionButton:RegisterCallback(Mouse.eLClick, ClaimTheSea_UnitActionButton);
	IconHookup(0, 45, "UNIT_JWW_SEYCHELLES_CLAIM_ATLAS", Controls.UnitActionIcon)
	Initialize();
end
--===========================================================================