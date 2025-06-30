--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--////- - MC's Polynesia Split: Lua Functions - -\\\\
--///- - - - - Various authors as stated - - - - -\\\
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--==========================================================================================================================
-- Civ Defines
--==========================================================================================================================
local iHawaii = GameInfoTypes.CIVILIZATION_POLYNESIA
local iTonga = GameInfoTypes.CIVILIZATION_MC_TONGA
local iMaori = GameInfoTypes.CIVILIZATION_MC_MAORI
local iRapaNui = GameInfoTypes.CIVILIZATION_MC_RAPA_NUI

--=======================================================================================================================
-- Polynesian embarkation graphics
-- Author: The mists of time (maybe Leugi idk I stole it from the Inca and that was like 5 years ago)
--=======================================================================================================================
local pPlayer = Players[Game.GetActivePlayer()]
if pPlayer:GetCivilizationType() == iTonga or pPlayer:GetCivilizationType() == iMaori or pPlayer:GetCivilizationType() == iRapaNui then
  pPlayer:SetEmbarkedGraphicOverride("ART_DEF_UNIT_U_POLYNESIAN_WAR_CANOE")
end

--=======================================================================================================================
-- Give all Polynesian civs and Indonesia ocean embarkation with YnAEMP
-- Author: JFD
--=======================================================================================================================
--Note: I've commented this out but removing the comment section will re-enable the code
--------------------------------------------------------------
-- isUsingYNAEMPMod
--------------------------------------------------------------
--[[    local ynaempModID = "36e88483-48fe-4545-b85f-bafc50dde315"
    local isUsingYNAEMPMod = false
     
    for _, mod in pairs(Modding.GetActivatedMods()) do
      if (mod.ID == ynaempModID) then
        isUsingYNAEMPMod = true
        break
      end
    end
     
    function JFD_EmbarkationAllWater(playerID, unitID)
        local player = Players[playerID];
        if player:IsEverAlive() and isUsingYNAEMPMod then
			if  player:GetArtStyleType() == GameInfoTypes["ARTSTYLE_POLYNESIAN"] or player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_INDONESIA"] then
			local unit = player:GetUnitByID(unitID)
					if unit:GetDomainType() == GameInfoTypes["DOMAIN_LAND"] then
							local promotionID 
							if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_INDONESIA"] or player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_MC_TONGA"] or player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_MC_MAORI"] then
								promotionID = GameInfoTypes["PROMOTION_EMBARKATION"]
							else
								promotionID = GameInfoTypes["PROMOTION_ALLWATER_EMBARKATION"]
							end
							if not unit:IsHasPromotion(promotionID) then
									unit:SetHasPromotion(promotionID, true)
							end
				end
			end
        end
    end
    Events.SerialEventUnitCreated.Add(JFD_EmbarkationAllWater)
]]