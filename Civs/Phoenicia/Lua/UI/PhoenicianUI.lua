-- TyrianMerchantCode
-- Author: Sukritact
--==========================================================================================================================

print("loaded")

include( "Sukritact_SaveUtils.lua" ); MY_MOD_NAME = "TyrianMerchantCode";
include("IconSupport")

--==========================================================================================================================
-- Initial Processes
--==========================================================================================================================
local iMerchant = GameInfoTypes.UNIT_MC_TYRIAN_MERCHANT
local iTyrianDye = GameInfoTypes.RESOURCE_MC_TYRIAN_DYES
local iMaxCivID = (GameDefines.MAX_MAJOR_CIVS - 1)
local tUnitsCreated = {}
local bIsPopupOpen = false

for iPlayer = 0, iMaxCivID do
	local pPlayer = Players[iPlayer]
	if pPlayer:IsEverAlive() then
		for pUnit in pPlayer:Units() do
			local iUnitType = pUnit:GetUnitType()
			if iUnitType == iMerchant then
				local iUnit = pUnit:GetID()
				tUnitsCreated["P"..iPlayer.."U"..iUnit ] = 1
			end
		end
	end
end
--=======================================================================================================================
-- Open/Close Functions
--=======================================================================================================================
ButtonPopupTypes.BUTTONPOPUP_KHMERUA = "BUTTONPOPUP_MC_TYRIAN_MERCHANT"
g_PopupInfo = {["Type"] = ButtonPopupTypes.BUTTONPOPUP_MC_TYRIAN_MERCHANT}

function ShowHideHandler(bIsHide, bInitState)
    if(not bInitState) then
       if(not bIsHide) then
        	UI.incTurnTimerSemaphore()
        	Events.SerialEventGameMessagePopupShown(g_PopupInfo)
        else
            UI.decTurnTimerSemaphore()
            if(g_PopupInfo ~= nil) then
				Events.SerialEventGameMessagePopupProcessed.CallImmediate(g_PopupInfo.Type, 0)
			end
        end
    end
end
ContextPtr:SetShowHideHandler(ShowHideHandler)
--==========================================================================================================================
-- Main Code
--==========================================================================================================================

function TyrianMerchantCode(iPlayer, iUnit, iX, iY)
	--if Popup open then return
	if bIsPopupOpen then
		return
	end
	--prevent trigger for just-killed units
	if (iX < 0) and (iY < 0) then
		return
	end

	--Don't trigger for Barbarians or CSs
	local pPlayer = Players[iPlayer]
	if (pPlayer:IsMinorCiv() or pPlayer:IsBarbarian()) then
		return
	end
	
	--prevent trigger for just-created units	
	if tUnitsCreated["P"..iPlayer.."U"..iUnit ] == nil and pPlayer:IsHuman() then
		tUnitsCreated["P"..iPlayer.."U"..iUnit ] = 1
		return
	end
	
	--check if merchant
	local pUnit = pPlayer:GetUnitByID(iUnit)
	local iUnitType = pUnit:GetUnitType()
	if iUnitType ~= iMerchant then
		return
	end
	
	--check if trigger enabled
	local bTrigger = load(pPlayer, iUnit)
	if bTrigger == nil then
		bTrigger = true
	end
	
	local pPlot = Map.GetPlot(iX, iY)
	if pPlot == nil then
		return
	end

	-- Is this a CS and has an Outpost been established?
	local iPlotOwner = pPlot:GetOwner()
	local pPlotOwner = Players[iPlotOwner]
	local bEstablished = nil
	if iPlotOwner <= iMaxCivID then
		save(pPlayer, iUnit, true)
		return
	elseif pPlotOwner:IsMinorCiv() then
		bEstablished = load(pPlayer, "C_" .. iPlotOwner)
	end

	if (bTrigger) and not(bEstablished) then
		--Give 1 or 2 copies?
		local iDelta = 1
		if load(pPlayer, "Tyrian Dyes") ~= true then
			iDelta = 2
		end
		--Disable trigger for next time
		save(pPlayer, iUnit, false)
		--Trigger
		if pPlayer:IsHuman() then
			bIsPopupOpen = true
			TyrianPopup(iPlayer, iPlotOwner, iUnit, iDelta)
		else
			pUnit:SetDamage(999)
			LuaEvents.GreatPersonExpended(iPlayer, iMerchant)
			pPlayer:ChangeNumResourceTotal(iTyrianDye, iDelta)
			save(pPlayer, "C_" .. iPlotOwner, true)
			save(pPlayer, "Tyrian Dyes", true)
		end
	end
end
GameEvents.UnitSetXY.Add(TyrianMerchantCode)

function UnitDestroyed(iPlayer, iUnit)
	local pPlayer = Players[iPlayer]
	local pUnit = pPlayer:GetUnitByID(iUnit)
	if pUnit == nil then
		save(pPlayer, iUnit, nil)
		tUnitsCreated["P"..iPlayer.."U"..iUnit ] = nil
	end
end
Events.SerialEventUnitDestroyed.Add(UnitDestroyed)

--==========================================================================================================================
-- Popup Behaviour
--==========================================================================================================================

local pPopupPlayer = nil
local iPopupOwner = nil
local pPopupUnit = nil
local iPopupDelta = nil

function TyrianPopup(iPlayer, iPlotOwner, iUnit, iDelta)
	local pPlayer = Players[iPlayer]
	local pPlotOwner = Players[iPlotOwner]
	local pUnit = pPlayer:GetUnitByID(iUnit)
	
	pPopupPlayer = pPlayer
	iPopupOwner = iPlotOwner
	pPopupUnit = pUnit
	iPopupDelta = iDelta
	
	Controls.Message:LocalizeAndSetText("TXT_KEY_PHOENICIAN_DIALOG", pPlotOwner:GetName(), iDelta)
	CivIconHookup(iPlayer, 64, Controls.Icon, Controls.CivIconBG, Controls.CivIconShadow, false, true )
	UIManager:QueuePopup(ContextPtr, PopupPriority.WonderPopup)
end

Controls.Yes:RegisterCallback(Mouse.eLClick, function()
	pPopupPlayer:ChangeNumResourceTotal(iTyrianDye, iPopupDelta)
	pPopupUnit:SetDamage(999)
	LuaEvents.GreatPersonExpended(pPopupPlayer:GetID(), iMerchant)
	save(pPopupPlayer, "Tyrian Dyes", true)
	save(pPopupPlayer, "C_" .. iPopupOwner, true)
	UIManager:DequeuePopup(ContextPtr)
	bIsPopupOpen = false
end)
	
Controls.No:RegisterCallback(Mouse.eLClick, function()
	UIManager:DequeuePopup(ContextPtr)
	bIsPopupOpen = false
end)
	
Controls.Never:RegisterCallback(Mouse.eLClick, function()
	save(pPopupPlayer, "C_" .. iPopupOwner, true)
	UIManager:DequeuePopup(ContextPtr)
	bIsPopupOpen = false
end)
--=======================================================================================================================
-- Initialise
--=======================================================================================================================
UIManager:QueuePopup(ContextPtr, PopupPriority.WonderPopup)
UIManager:DequeuePopup(ContextPtr)
--=======================================================================================================================
--=======================================================================================================================