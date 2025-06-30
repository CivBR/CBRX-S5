--============================================================
-- GLOBALS
--============================================================
print("Xavante Lua Activated")

include("FLuaVector.lua")
include("IconSupport.lua")
include("InstanceManager.lua")

local iXavante = GameInfoTypes["CIVILIZATION_SAS_XAVANTE"]

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
local bIsActive = JFD_IsCivilisationActive(iXavante)

function JFD_GetRandom(lower, upper)
    return Game.Rand((upper + 1) - lower, "") + lower
end

local tPlantationRes = {}
for row in DB.Query("SELECT ResourceType FROM Improvement_ResourceTypes WHERE ImprovementType = 'IMPROVEMENT_PLANTATION'") do
    table.insert(tPlantationRes, row.ResourceType)
end
--===========================================================================
-- UA (Roots, Bloody Roots)
--===========================================================================
-- Known Civilizations who produce more Tourism than the Xavante provide Great Musician points to the Xavante (in capital)
-----------------------------------------------------------------------------
function JWW_Ratamahatta(iPlayer)
	local pPlayer = Players[iPlayer]
	if pPlayer:IsAlive() and (pPlayer:GetCivilizationType() == iXavante) then
		for i = 0, GameDefines.MAX_MAJOR_CIVS - 1, 1 do
			if i and i ~= iPlayer then
				local pNextPlayer = Players[i]
				local pTeam = Teams[pPlayer:GetTeam()]
				if pTeam:IsHasMet(pNextPlayer:GetTeam()) then
					if pPlayer:GetTourism() < pNextPlayer:GetTourism() then
						local iDiff = (pNextPlayer:GetTourism() - pPlayer:GetTourism())
						local pCap = pPlayer:GetCapitalCity()
						pCap:ChangeSpecialistGreatPersonProgressTimes100(GameInfoTypes["SPECIALIST_MUSICIAN"], (iDiff * 200)) --Difference in Tourism times 2 is how many points they get
					end
				end
			end
		end
	end
end
-----------------------------------------------------------------------------
-- Whenever a Great Musician is expended in Xavante territory, recieve a lump sum of Golden Age points.
-----------------------------------------------------------------------------
function JWW_Territory(iPlayer, iUnit, unitType, iX, iY, bDelay, iKiller)
	if not bDelay then return end
	if (iKiller ~= -1) then return end
	if (unitType ~= GameInfoTypes["UNIT_MUSICIAN"]) then return end
	
	local pPlayer = Players[iPlayer]
	if pPlayer:IsAlive() and (pPlayer:GetCivilizationType() == iXavante) then
		local pPlot = Map.GetPlot(iX, iY)
		if pPlot:GetOwner() == iPlayer then
			pPlayer:ChangeGoldenAgeProgressMeter(100) --100 Points, change if needed
	
			if pPlayer:IsHuman() then
				Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(iX, iY))), "+100 [ICON_GOLDEN_AGE]", 0)
			end
		end
	end
end
-----------------------------------------------------------------------------
if bIsActive then
	GameEvents.PlayerDoTurn.Add(JWW_Ratamahatta)
	GameEvents.UnitPrekill.Add(JWW_Territory)
end
--===========================================================================
-- UU (Tsawörö'wa)
--===========================================================================
local iTsaworowa = GameInfoTypes["UNIT_SAS_TSAWOROWA"]
-----------------------------------------------------------------------------
-- During Golden Ages, may be expended in friendly territory to plant a random Plantation-based resource.
-----------------------------------------------------------------------------
function BeneathTheRemains_IsButtonPossible(pUnit)
	if (pUnit:GetUnitType() == iTsaworowa) then
		local pPlayer = Players[pUnit:GetOwner()]
		if pPlayer:IsGoldenAge() then
			local pPlot = pUnit:GetPlot()
			if pPlot and (pPlot:GetOwner() == pUnit:GetOwner()) then
				if (pPlot:GetResourceType() ~= -1) or (pPlot:GetImprovementType() ~= -1) then
					if pPlayer:IsHuman() then
						Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(pPlot:GetX(), pPlot:GetY()))), "[COLOR_WARNING_TEXT]Resource or Improvement exists on this plot already![ENDCOLOR]", 0)
					end
					return false
				end
				return true
			end
		end
	end
	return false
end

function BeneathTheRemains_MakeResource(pPlayer, pUnit)
	local pPlot = pUnit:GetPlot()
	local iRandRes = JFD_GetRandom(1, #tPlantationRes)
	for k, v in ipairs(tPlantationRes) do
		if k == iRandRes then
			pPlot:SetResourceType(GameInfoTypes[v])
		end
	end
	pUnit:Kill()
end

function BeneathTheRemains_DoButtonEffect()
	local pUnit = UI.GetHeadSelectedUnit();
	local pPlayer = Players[Game.GetActivePlayer()]
	BeneathTheRemains_MakeResource(pPlayer, pUnit)
end

function BeneathTheRemains_SerialEventUnitInfoDirty()
	local pUnit = UI.GetHeadSelectedUnit();
	if (not pUnit) then return end
	if BeneathTheRemains_IsButtonPossible(pUnit) then
		Controls.XavanteButton:SetHide(false)
	else
		Controls.XavanteButton:SetHide(true)
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

local function BeneathTheRemains_UpdateUnitInfoPanel()
	if (not OptionsManager.GetSmallUIAssets()) then
		Controls.XavanteButton:SetSizeVal(50,50)
		Controls.XavanteButtonImage:SetSizeVal(64,64)
		Controls.XavanteButtonImage:SetTexture("unitactionsgold360.dds")
	else
		Controls.XavanteButton:SetSizeVal(36,36)
		Controls.XavanteButtonImage:SetSizeVal(45,45)
		Controls.XavanteButtonImage:SetTexture("unitactionsgold360.dds")
	end
	Controls.XavanteButtonImage:LocalizeAndSetToolTip("TXT_KEY_SAS_XAVANTE_BUTTON_TOOLTIP")
	Controls.XavanteButton:ChangeParent(ContextPtr:LookUpControl("/InGame/WorldView/UnitPanel/PrimaryStack"))
end


function BeneathTheRemains_ButtonDoTurn(playerID) -- for AI
	local pPlayer = Players[playerID]
	if pPlayer:HasUnitOfClassType(GameInfoTypes["UNIT_SCOUT"]) then
		if (not pPlayer:IsHuman()) then
	        
			for pUnit in pPlayer:Units() do
				if BeneathTheRemains_IsButtonPossible(pUnit) then
					if (JFD_GetRandom(1, 5) > 4) then --20% chance to do if possible
						BeneathTheRemains_MakeResource(pPlayer, pUnit)
					end
				end
			end
		end
	end
end

local function Initialize()	
	Events.LoadScreenClose.Add(BeneathTheRemains_UpdateUnitInfoPanel)
	Events.SerialEventUnitInfoDirty.Add(BeneathTheRemains_SerialEventUnitInfoDirty)
end

-----------------------------------------------------------------------------
if bIsActive then
	Controls.XavanteButton:RegisterCallback(Mouse.eLClick, BeneathTheRemains_DoButtonEffect)
	GameEvents.PlayerDoTurn.Add(BeneathTheRemains_ButtonDoTurn)
	IconHookup(27, 45, "UNIT_ACTION_GOLD_ATLAS", Controls.XavanteButtonImage)
	Initialize();
end
--===========================================================================
-- UB (Dzomori)
--===========================================================================
local iDzomori = GameInfoTypes["BUILDING_SAS_DZOMORI"]
-----------------------------------------------------------------------------
-- When Great Work of Music slot is filled, Plantation-based Resources yield +1 Food.
-----------------------------------------------------------------------------
function JWW_Arise(iPlayer)
	local pPlayer = Players[iPlayer]
	if pPlayer:IsAlive() and pPlayer:GetCivilizationType() == iXavante then
		for pCity in pPlayer:Cities() do
			local iFood = 0
			if pCity:IsHasBuilding(iDzomori) then
				if (pCity:GetBuildingGreatWork(GameInfoTypes["BUILDINGCLASS_HOSPITAL"], 1) ~= nil) then
					for i = 0, pCity:GetNumCityPlots(), 1 do
						local pPlot = pCity:GetCityIndexPlot(i)
						if pPlot:GetWorkingCity() == pCity then
							for _, v in pairs(tPlantationRes) do
								if pPlot:GetResourceType() == GameInfoTypes[v] then
									iFood = iFood + 1
									break
								end
							end
						end
					end
				end
			end
			pCity:ChangeFood(iFood)
		end
	end
end
-----------------------------------------------------------------------------
-- Constructed faster during Golden Ages.
-----------------------------------------------------------------------------
function JWW_InnerSelf(iPlayer) 
	local pPlayer = Players[iPlayer]
	if pPlayer:IsAlive() and (pPlayer:GetCivilizationType() == iXavante) then
		if pPlayer:IsGoldenAge() then
			for pCity in pPlayer:Cities() do
				if pCity:IsProductionBuilding() then
					local bBonus = true
					if pCity:GetFirstBuildingOrder(iDzomori)==0 then
						pCity:ChangeProduction(20)
					end
				end
			end
		end
	end
end		
-----------------------------------------------------------------------------
if bIsActive then
	GameEvents.PlayerDoTurn.Add(JWW_Arise)
	GameEvents.PlayerDoTurn.Add(JWW_InnerSelf)
end
--===========================================================================