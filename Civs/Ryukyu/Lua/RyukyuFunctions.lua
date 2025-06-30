--=======================================================================================================================
-- Sas's Ryukyu Kingdom
-- Lua by PorkBean
--=======================================================================================================================
include("PlotIterators")
include("C15_IteratorPack_v4")
include("FLuaVector.lua")
include("IconSupport.lua")
include("InstanceManager.lua")

local iRyukyuCiv = GameInfoTypes.CIVILIZATION_SAS_RYUKYU

------------------------------------------------------------------------------------------------------------------------
-- JFD_IsCivilisationActive
------------------------------------------------------------------------------------------------------------------------
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

local isRyukyuCivActive = JFD_IsCivilisationActive(iRyukyuCiv);

------------------------------------------------------------------------------------------------------------------------
-- DMS_toBits
------------------------------------------------------------------------------------------------------------------------
function DMS_toBits(iNum)
    tBits={}
    while iNum and iNum > 0 do
        local iRest = math.fmod(iNum, 2)
        tBits[#tBits + 1] = iRest
        iNum = (iNum - iRest) / 2
    end
    return tBits
end


--=======================================================================================================================
-- UA: Great Days of Chuzan
--=======================================================================================================================
local iGPPDummy = GameInfoTypes.BUILDING_SAS_RYUKYU_GPP_DUMMY
------------------------------------------------------------------------------------------------------------------------
-- IsHasReciprocalRoute
------------------------------------------------------------------------------------------------------------------------
function IsHasReciprocalRoute(pPlayer, pCity)
	local bIsHasReciprocal = false
	local tRoutesOut = {}
	for i, route in ipairs(pPlayer:GetTradeRoutes()) do
		if route.FromCity == pCity then
			if route.ToID ~= route.FromID then
				table.insert(tRoutesOut, {pToPlayer = Players[route.ToID], pToCity = route.ToCity})
			end
		end
	end
	for i, route in ipairs(pPlayer:GetTradeRoutesToYou()) do
		if route.ToCity == pCity then
			if route.ToID ~= route.FromID then
				for i, v in pairs(tRoutesOut) do
					if v.pToCity == route.FromCity then
						bIsHasReciprocal = true
						break;
					end
				end
			end
		end
	end
	return bIsHasReciprocal
end

------------------------------------------------------------------------------------------------------------------------
-- DoBoostGPP
------------------------------------------------------------------------------------------------------------------------
function DoBoostGPP(iPlayer)
	local pPlayer = Players[iPlayer]
	if pPlayer:GetCivilizationType() == iRyukyuCiv then
		local iCapitalTotal = 0
		for pCity in pPlayer:Cities() do
			pCity:SetNumRealBuilding(iGPPDummy, 0)
			local bIsHasReciprocal = IsHasReciprocalRoute(pPlayer, pCity)
			if bIsHasReciprocal then
				pCity:SetNumRealBuilding(iGPPDummy, 1)
				iCapitalTotal = iCapitalTotal+1
			end
		end
		local pCapital = pPlayer:GetCapitalCity()
		pCapital:SetNumRealBuilding(iGPPDummy, iCapitalTotal)
	end
end

if isRyukyuCivActive then
	GameEvents.PlayerDoTurn.Add(DoBoostGPP)
end

--=======================================================================================================================
-- UU: Yukatchu
--=======================================================================================================================
local iYukatchu = GameInfoTypes.UNIT_SAS_YUKATCHU
------------------------------------------------------------------------------------------------------------------------
-- YukatchuExpended
------------------------------------------------------------------------------------------------------------------------
function YukatchuExpended(iPlayer, iUnit, iUnitType, iX, iY, bDelay, iByPlayer)
	if not bDelay then
		if iByPlayer == -1 then
			if iUnitType == iYukatchu then
				local pPlayer = Players[iPlayer]
				local pPlot = Map.GetPlot(iX, iY)
				if pPlot:IsCity() then
					DoBoostCulture(pPlayer, pPlot:GetPlotCity())
				end
			end
		end
	end
end

------------------------------------------------------------------------------------------------------------------------
-- DoBoostCulture
------------------------------------------------------------------------------------------------------------------------
function DoBoostCulture(pPlayer, pCity)
	local iTrade = 0
	for i, route in ipairs(pPlayer:GetTradeRoutes()) do
		if route.FromCity == pCity then
			iTrade = iTrade+(route.FromGPT/100)
		end
	end
	local iCulture = math.ceil(iTrade*1)
	pPlayer:ChangeJONSCulture(iCulture)
	if pPlayer:IsHuman() then
		Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(pCity:GetX(), pCity:GetY()))), Locale.ConvertTextKey("+{1_Num}[ICON_CULTURE]", iCulture), 0)
	end
end	
			
GameEvents.UnitPrekill.Add(YukatchuExpended)

--=======================================================================================================================
-- UI: Gusuku
--=======================================================================================================================
local iGusuku = GameInfoTypes.IMPROVEMENT_SAS_GUSUKU
local iDomainSea = GameInfoTypes.DOMAIN_SEA

------------------------------------------------------------------------------------------------------------------------
-- DamageNearGusuku
------------------------------------------------------------------------------------------------------------------------
function DamageNearGusuku(iPlayer)
	local pPlayer = Players[iPlayer]
	local pTeam = Teams[pPlayer:GetTeam()]
	if pTeam:GetAtWarCount(false) > 0 then
		for pUnit in pPlayer:Units() do
			if pUnit:GetDomainType() == iDomainSea then
				if pUnit:IsCombatUnit() then
					local bAdjacentGusuku = false
					local pPlot = pUnit:GetPlot()
					for pAdjacentPlot in PlotAreaSweepIterator(pPlot, 1, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
						if pAdjacentPlot and pAdjacentPlot:GetImprovementType() == iGusuku then
							local pOtherPlayer = Players[pAdjacentPlot:GetOwner()]
							local iOtherTeam = pOtherPlayer:GetTeam()
							if pTeam:IsAtWar(iOtherTeam) then
								bAdjacentGusuku = true
								break;
							end
						end
					end
					if bAdjacentGusuku then
						pUnit:ChangeDamage(35)
					end
				end
			end
		end
	end
end

GameEvents.PlayerDoTurn.Add(DamageNearGusuku)

--=======================================================================================================================
-- UU: Chinkunshin
--=======================================================================================================================
local iChinkunshin = GameInfoTypes.UNIT_SAS_CHINKUNSHIN
local iGoldPromotion = GameInfoTypes.PROMOTION_SAS_CHINKUNSHIN_GOLD
local iMovesPromotion = GameInfoTypes.PROMOTION_SAS_CHINKUNSHIN_MOVES

local tBinaryProductionDummies = {
    [1] = GameInfoTypes.BUILDING_SAS_RYUKYU_CHINKUNSHIN_DUMMY_1,
    [2] = GameInfoTypes.BUILDING_SAS_RYUKYU_CHINKUNSHIN_DUMMY_2,
    [3] = GameInfoTypes.BUILDING_SAS_RYUKYU_CHINKUNSHIN_DUMMY_4,
    [4] = GameInfoTypes.BUILDING_SAS_RYUKYU_CHINKUNSHIN_DUMMY_8,
	[5] = GameInfoTypes.BUILDING_SAS_RYUKYU_CHINKUNSHIN_DUMMY_16,
	[6] = GameInfoTypes.BUILDING_SAS_RYUKYU_CHINKUNSHIN_DUMMY_32,
	[7] = GameInfoTypes.BUILDING_SAS_RYUKYU_CHINKUNSHIN_DUMMY_64,
	[8] = GameInfoTypes.BUILDING_SAS_RYUKYU_CHINKUNSHIN_DUMMY_128
}

local iCargoShip = GameInfoTypes.UNIT_CARGO_SHIP

local iScientist = GameInfoTypes.SPECIALIST_SCIENTIST
local iScientistPoints = 2

------------------------------------------------------------------------------------------------------------------------
-- GetNumNavalTradeRoutesOut
------------------------------------------------------------------------------------------------------------------------
function GetNumNavalTradeRoutesOut(pPlayer, pCity)
	local iNumTradeRoutes = 0
	for i, route in ipairs(pPlayer:GetTradeRoutes()) do
		if route.FromCity == pCity then
			if route.Domain == iDomainSea then
				iNumTradeRoutes = iNumTradeRoutes+1
			end
		end
	end
	return iNumTradeRoutes
end

------------------------------------------------------------------------------------------------------------------------
-- ChinkunshinBuiltFaster
------------------------------------------------------------------------------------------------------------------------
function ChinkunshinBuiltFaster(iPlayer)
	local pPlayer = Players[iPlayer]
	for pCity in pPlayer:Cities() do
		if pCity:CanTrain(iChinkunshin) then
			local iNumTradeRoutes = (GetNumNavalTradeRoutesOut(pPlayer, pCity)*10)
			local tBits = DMS_toBits(iNumTradeRoutes)
			for i, v in pairs(tBinaryProductionDummies) do
				pCity:SetNumRealBuilding(v, tBits[i] or 0)
			end
		else
			for i, v in pairs(tBinaryProductionDummies) do
				pCity:SetNumRealBuilding(v, 0)
			end
		end
	end
end

------------------------------------------------------------------------------------------------------------------------
-- ChinkunshinGoldAndSciencePromotions
------------------------------------------------------------------------------------------------------------------------
function ChinkunshinGoldAndSciencePromotions(iPlayer)
	local pPlayer = Players[iPlayer]
	for pUnit in pPlayer:Units() do
		if pUnit:GetUnitType() == iChinkunshin then
			local bNearGusuku = false
			local bNearCargoShip = false
			local pPlot = pUnit:GetPlot()
			for pAdjacentPlot in PlotAreaSweepIterator(pPlot, 2, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_INCLUDE) do
				if pAdjacentPlot:GetImprovementType() == iGusuku then
					bNearGusuku = true
				end
				for pByUnit in C15_PlotUnitsIterator(pAdjacentPlot) do
					if pByUnit:GetUnitType() == iCargoShip then
						bNearCargoShip = true
					end
				end
			end
			pUnit:SetHasPromotion(iGoldPromotion, bNearGusuku)
			pUnit:SetHasPromotion(iMovesPromotion, bNearCargoShip)
			if bNearCargoShip then
				local pCapital = pPlayer:GetCapitalCity()
				if pCapital then
					pCapital:ChangeSpecialistGreatPersonProgressTimes100(iScientist, iScientistPoints*100)
					if pPlayer:IsHuman() then
						Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(pCapital:GetX(), pCapital:GetY()))), Locale.ConvertTextKey("+{1_Num}[ICON_GREAT_PEOPLE]", iScientistPoints), 0)
					end
				end
			end
		end
	end
end

------------------------------------------------------------------------------------------------------------------------
-- ChinkunshinGoldFromKills
------------------------------------------------------------------------------------------------------------------------
local iGoldPercent = 10

------------------------------------------------------------------------------------------------------------------------
-- ChinkunshinGoldFromKills
------------------------------------------------------------------------------------------------------------------------
function ChinkunshinGoldFromKills(iPlayer, iUnit, iUnitType, iX, iY, bDelay, iByPlayer)
	if not bDelay then
		local pPlot = Map.GetPlot(iX, iY)
		local pPlayer = Players[iPlayer]
		local pUnit = pPlayer:GetUnitByID(iUnit)
		if pUnit:IsCombatUnit() then
			for pByUnit in C15_PlotUnitsIterator(pPlot) do
				if pByUnit:IsHasPromotion(iGoldPromotion) and pByUnit ~= pUnit then
					local pByPlayer = Players[pByUnit:GetOwner()]
					local iGold = math.ceil(GameInfo.Units[iUnitType].Combat*iGoldPercent)
					pByPlayer:ChangeGold(iGold)
					if pByPlayer:IsHuman() then
						Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(iX, iY))), Locale.ConvertTextKey("+{1_Num}[ICON_GOLD]", iGold), 0)
					end
				end
			end
		end
	end
end

GameEvents.PlayerDoTurn.Add(ChinkunshinBuiltFaster)
GameEvents.PlayerDoTurn.Add(ChinkunshinGoldAndSciencePromotions)
GameEvents.UnitPrekill.Add(ChinkunshinGoldFromKills)

--------------------------------------------------------------------------------------------------------------------------

local iAtoll = GameInfoTypes.FEATURE_ATOLL
local iGSClass = GameInfoTypes.UNITCLASS_SCIENTIST
local pActivePlayer = Players[Game.GetActivePlayer()]

--------------------------------------------------------------------------------------------------------------------------
-- JFD_GetRandom
--------------------------------------------------------------------------------------------------------------------------
function JFD_GetRandom(lower, upper)
    return Game.Rand((upper + 1) - lower, "") + lower
end

------------------------------------------------------------------------------------------------------------------------
-- IsButtonPossible
------------------------------------------------------------------------------------------------------------------------
function IsButtonPossible(uUnit)
	if uUnit:GetUnitType() == iYukatchu then
		local pPlot = uUnit:GetPlot()
		if pPlot and pPlot:GetFeatureType() == iAtoll then
			return true
		end
	end
	return false
end

------------------------------------------------------------------------------------------------------------------------
-- DoExpendYukatchu
------------------------------------------------------------------------------------------------------------------------
function DoExpendYukatchu(pPlayer, uUnit)
	local pPlot = uUnit:GetPlot()
	pPlot:SetImprovementType(iGusuku)
	uUnit:Kill()
end

------------------------------------------------------------------------------------------------------------------------
-- Yukatchu_UnitActionButton
------------------------------------------------------------------------------------------------------------------------
function Yukatchu_UnitActionButton()
	local uUnit = UI.GetHeadSelectedUnit();
	DoExpendYukatchu(pActivePlayer, uUnit)
end

------------------------------------------------------------------------------------------------------------------------
-- Yukatchu_SerialEventUnitInfoDirty
------------------------------------------------------------------------------------------------------------------------
function Yukatchu_SerialEventUnitInfoDirty()
	local uUnit = UI.GetHeadSelectedUnit();
	if (not uUnit) then return end
	if IsButtonPossible(uUnit) then
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

------------------------------------------------------------------------------------------------------------------------
-- Yukatchu_UpdateUnitInfoPanel
------------------------------------------------------------------------------------------------------------------------
local function Yukatchu_UpdateUnitInfoPanel()
	if (not OptionsManager.GetSmallUIAssets()) then
		Controls.UnitActionButton:SetSizeVal(50,50)
		Controls.UnitActionIcon:SetSizeVal(64,64)
		Controls.UnitActionIcon:SetTexture("Gusuku_Flag64.dds")
	else
		Controls.UnitActionButton:SetSizeVal(36,36)
		Controls.UnitActionIcon:SetSizeVal(45,45)
		Controls.UnitActionIcon:SetTexture("Gusuku_Flag45.dds")
	end
	Controls.UnitActionIcon:LocalizeAndSetToolTip("TXT_KEY_SAS_YUKATCHU_ACTION_HELP")
	Controls.UnitActionButton:ChangeParent(ContextPtr:LookUpControl("/InGame/WorldView/UnitPanel/PrimaryStack"))
end

------------------------------------------------------------------------------------------------------------------------
-- AI_Yukatchu_DoTurn
------------------------------------------------------------------------------------------------------------------------
function AI_Yukatchu_DoTurn(iPlayer)
	local pPlayer = Players[iPlayer]
	if not pPlayer:IsHuman() then
		if pPlayer:HasUnitOfClassType(iGSClass) then
			for uUnit in pPlayer:Units() do
				if IsButtonPossible(uUnit) then
					if JFD_GetRandom(1, 2) >= chance then
						DoExpendYukatchu(pPlayer, uUnit)
					end
				end
			end
		end
	end
end

------------------------------------------------------------------------------------------------------------------------
-- Initialize
------------------------------------------------------------------------------------------------------------------------
local function Initialize()	
	Events.LoadScreenClose.Add(Yukatchu_UpdateUnitInfoPanel);
	Events.SerialEventUnitInfoDirty.Add(Yukatchu_SerialEventUnitInfoDirty);
end

if isRyukyuCivActive then
	Controls.UnitActionButton:RegisterCallback(Mouse.eLClick, Yukatchu_UnitActionButton);
	IconHookup(5, 45, "SAS_RYUKYU_ICON_ATLAS", Controls.UnitActionIcon)
	Initialize();
end

GameEvents.PlayerDoTurn.Add(AI_Yukatchu_DoTurn)