--Tlingit decisions
 
--Raid <City State> for slaves
--We require workers to toil under our demense. The people of _____ have become lazy and well-fed. We will strike swiftly from the seas, without mercy!
-- COSTS:
-- 120 Influence
-- 1 Magistrate
-- REQUIRES:
-- Player must be the Tlingit
-- The target minor civ must be a coastal city and must have a neutral or better Influence level.
-- You must have researched Sailing
-- Can only be activated 4 times
-- REWARDS:
-- A free Worker appears in your capital
---------------------------------------------------------------------------------------------------------------------------------------------------------
 
local Decisions_CLTLINGITSLAVERAID = {}
print('Loading the Tlingit Slave Mod')
Decisions_CLTLINGITSLAVERAID.Name = Locale.ConvertTextKey("TXT_KEY_DECISIONS_CLTLINGITSLAVERAID_NO_NAME")
Decisions_CLTLINGITSLAVERAID.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_CLTLINGITSLAVERAID_NO_DESC")
HookDecisionCivilizationIcon(Decisions_CLTLINGITSLAVERAID, 'CIVILIZATION_CL_TLINGIT')
Decisions_CLTLINGITSLAVERAID.tTarget = {}
Decisions_CLTLINGITSLAVERAID.CanFunc = (
    function(pPlayer)
        if pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_CL_TLINGIT then
            return false, false
        end
        if load(pPlayer, "Decisions_CLTLINGITSLAVERAID") == 4 then
            Decisions_CLTLINGITSLAVERAID.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_CLTLINGITSLAVERAID_OVER")
            return false, false, true
        end
        for targ = 0, GameDefines.MAX_MAJOR_CIVS - 1, 1 do
            local pTarget = Players[targ]
            if pTarget:IsMinorCiv() then
                pCity = pTarget:GetCapitalCity()
                if pCity ~= nil and pCity:IsCoastal() then
                    table.insert(Decisions_CLTLINGITSLAVERAID.tTarget, pCity)
                end
            end
        end
        if not Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_SAILING) then
            Decisions_CLTLINGITSLAVERAID.Name = Locale.ConvertTextKey("TXT_KEY_DECISIONS_CLTLINGITSLAVERAID_NO_NAME")
            Decisions_CLTLINGITSLAVERAID.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_CLTLINGITSLAVERAID_NO_DESC")
            return true, false
        end
        --Decision Generation
        for iTarget, _ in pairs(Decisions_CLTLINGITSLAVERAID.tTarget) do
            local sKey = "Decisions_CLTLINGITSLAVERAID" .. pCity:GetName()
            local tTarget = pCity:GetName()
            tTempDecisions[sKey] = {}
            tTempDecisions[sKey].Name = Locale.ConvertTextKey("TXT_KEY_DECISIONS_CLTLINGITSLAVERAID_NAME", tTarget)
            tTempDecisions[sKey].Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_CLTLINGITSLAVERAID_DESC", tTarget)
            tTempDecisions[sKey].Data1 = pCity
            tTempDecisions[sKey].Type = "Civilization"
            HookDecisionCivilizationIcon(tTempDecisions[sKey], "CIVILIZATION_CL_TLINGIT")
            tTempDecisions[sKey].CanFunc = (
            function(pPlayer, pCity)
                local sKey = "Decisions_CLTLINGITSLAVERAID" .. pCity:GetName()
                tTempDecisions[sKey].Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_CLTLINGITSLAVERAID_DESC", pCity:GetName())
                if (pPlayer:GetNumResourceAvailable(GameInfoTypes.RESOURCE_MAGISTRATES, false) < 1) then return true, false end
                if Players[pCity:GetOwner()]:GetMinorCivFriendshipWithMajor(pPlayer) <= -1 then return true, false end
                return true, true
            end
            )
            tTempDecisions[sKey].DoFunc = (
            function(pPlayer, pCity)
                pPlayer:ChangeNumResourceTotal(GameInfoTypes.RESOURCE_MAGISTRATES, -1)
                local pCap = pPlayer:GetCapitalCity()
                local pPlot = pCap:Plot()
                local pNew = pPlayer:InitUnit(GameInfoTypes.UNIT_WORKER, pPlot:GetX(), pPlot:GetY(), GameInfoTypes.UNITAI_WORKER)
                Players[pCity:GetOwner()]:ChangeMinorCivFriendshipWithMajor(pPlayer, -120)
                local num = load(pPlayer, "Decisions_CLTLINGITSLAVERAID")
                if num == nil then
                    save(pPlayer, "Decisions_CLTLINGITSLAVERAID", 1)
                else
                    save(pPlayer, "Decisions_CLTLINGITSLAVERAID", num + 1)
                end
            end
            )
        end
    end
)
Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_CL_TLINGIT, "Decisions_CLTLINGITSLAVERAID", Decisions_CLTLINGITSLAVERAID)
 
--Raise a Shame Totem Against ______
--________ has done us a great dishonor. In order to shame him into repentance, we will raise a totem with his likeness inscribed on it for all to see.
--COSTS:
--  80 Gold
--  1 Magistrate
--REQUIRES:
--  Player must be the Tlingit
--  Target must be denouncing us.
--  Can only have one Shame Totem at a time
--REWARDS:
--  The next time the ______ have a Golden Age, it will end abruptly when the Golden Age has 7 turns left.
--  This will consume the Shame Totem
--
 
 
function Listenallyallitsasabatoge(pPlayer)
    for other = 0, GameDefines.MAX_MAJOR_CIVS - 1, 1 do
        local pOther = Players[other]
        if pPlayer ~= pOther then
            if pPlayer == load(pOther, "ShameHead") then
                if pPlayer:GetGoldenAgeTurns() == 7 then
                    pPlayer:ChangeGoldenAgeTurns(-7)
                    if pPlayer:IsHuman() then
                        Events.GameplayAlertMessage('The public has learned of our prior sins against the Tlingit. This awful revelation has brought our Golden Age to a screeching halt!')
                    end
                    save(pOther, "Decisions_CLTLINGITSHAMETOTEM", nil)
                    save(pOther, "ShameHead", nil)
                end
            end
        end
    end
end
GameEvents.PlayerDoTurn.Add(Listenallyallitsasabatoge)
 
local Decisions_CLTLINGITSHAMETOTEM = {}
print('Loading the Tlingit Shame Totem')
Decisions_CLTLINGITSHAMETOTEM.Name = Locale.ConvertTextKey("TXT_KEY_DECISIONS_CLTLINGITSHAMETOTEM_NO_NAME")
Decisions_CLTLINGITSHAMETOTEM.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_CLTLINGITSHAMETOTEM_NO_DESC")
HookDecisionCivilizationIcon(Decisions_CLTLINGITSHAMETOTEM, 'CIVILIZATION_CL_TLINGIT')
Decisions_CLTLINGITSHAMETOTEM.tTarget = {}
Decisions_CLTLINGITSHAMETOTEM.CanFunc = (
    function(pPlayer)
        if pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_CL_TLINGIT then
            return false, false
        end
        if load(pPlayer, "Decisions_CLTLINGITSHAMETOTEM") then
            local Target = load(pPlayer, "ShameHead")
            Decisions_CLTLINGITSHAMETOTEM.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_CLTLINGITSHAMETOTEM_ADOPTED", Target:GetName(), Target:GetCivilizationShortDescription())
            return false, false, true
        end
        for targ = 0, GameDefines.MAX_MAJOR_CIVS - 1, 1 do
            local pTarget = Players[targ]
            if pTarget:IsDenouncedPlayer(pPlayer:GetID()) then
                table.insert(Decisions_CLTLINGITSHAMETOTEM.tTarget, pTarget)
            end
        end
        --Decision Generation
        for iTarget, _ in pairs(Decisions_CLTLINGITSHAMETOTEM.tTarget) do
            local sKey = "Decisions_CLTLINGITSHAMETOTEM" .. pTarget:GetName()
            tTempDecisions[sKey] = {}
            tTempDecisions[sKey].Name = Locale.ConvertTextKey("TXT_KEY_DECISIONS_CLTLINGITSHAMETOTEM_NAME", pTarget:GetName())
            tTempDecisions[sKey].Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_CLTLINGITSHAMETOTEM_DESC", pTarget:GetName(), Target:GetCivilizationShortDescription())
            tTempDecisions[sKey].Data1 = pTarget
            tTempDecisions[sKey].Type = "Civilization"
            HookDecisionCivilizationIcon(tTempDecisions[sKey], "CIVILIZATION_CL_TLINGIT")
            tTempDecisions[sKey].CanFunc = (
            function(pPlayer, pTarget)
                local sKey = "Decisions_CLTLINGITSHAMETOTEM" .. pTarget:GetName()
                tTempDecisions[sKey].Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_CLTLINGITSHAMETOTEM_DESC", pTarget:GetName(), Target:GetCivilizationShortDescription())
                if (pPlayer:GetNumResourceAvailable(GameInfoTypes.RESOURCE_MAGISTRATES, false) < 1) then return true, false end
                if pPlayer:GetGold() < 80 then return true, false end
                return true, true
            end
            )
            tTempDecisions[sKey].DoFunc = (
            function(pPlayer, pTarget)
                pPlayer:ChangeNumResourceTotal(GameInfoTypes.RESOURCE_MAGISTRATES, -1)
                pPlayer:SetGold(-80)
                save(pPlayer, "Decisions_CLTLINGITSHAMETOTEM", true)
                save(pPlayer, "ShameHead", pTarget)
            end
            )
        end
    end
)
Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_CL_TLINGIT, "Decisions_CLTLINGITSHAMETOTEM", Decisions_CLTLINGITSHAMETOTEM)
function Listenallyallitsasabatoge(pPlayer)
    for other = 0, GameDefines.MAX_MAJOR_CIVS - 1, 1 do
        local pOther = Players[other]
        if pPlayer ~= pOther then
            if pPlayer == load(pOther, "ShameHead") then
                if pPlayer:GetGoldenAgeTurns() == 7 then
                    pPlayer:ChangeGoldenAgeTurns(-7)
                    if pPlayer:IsHuman() then
                        Events.GameplayAlertMessage('The public has learned of our prior sins against the Tlingit. This awful revelation has brought our Golden Age to a screeching halt!')
                    end
                    save(pOther, "Decisions_CLTLINGITSHAMETOTEM", nil)
                    save(pOther, "ShameHead", nil)
                end
            end
        end
    end
end
GameEvents.PlayerDoTurn.Add(Listenallyallitsasabatoge)
 
local Decisions_CLTLINGITSHAMETOTEM = {}
print('Loading the Tlingit Shame Totem')
Decisions_CLTLINGITSHAMETOTEM.Name = Locale.ConvertTextKey("TXT_KEY_DECISIONS_CLTLINGITSHAMETOTEM_NO_NAME")
Decisions_CLTLINGITSHAMETOTEM.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_CLTLINGITSHAMETOTEM_NO_DESC")
HookDecisionCivilizationIcon(Decisions_CLTLINGITSHAMETOTEM, 'CIVILIZATION_CL_TLINGIT')
Decisions_CLTLINGITSHAMETOTEM.tTarget = {}
Decisions_CLTLINGITSHAMETOTEM.CanFunc = (
    function(pPlayer)
        if pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_CL_TLINGIT then
            return false, false
        end
        if load(pPlayer, "Decisions_CLTLINGITSHAMETOTEM") then
            local Target = load(pPlayer, "ShameHead")
            Decisions_CLTLINGITSHAMETOTEM.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_CLTLINGITSHAMETOTEM_ADOPTED", Target:GetName(), Target:GetCivilizationShortDescription())
            return false, false, true
        end
        for targ = 0, GameDefines.MAX_MAJOR_CIVS - 1, 1 do
            local pTarget = Players[targ]
            if pTarget:IsDenouncedPlayer(pPlayer:GetID()) then
                table.insert(Decisions_CLTLINGITSHAMETOTEM.tTarget, pTarget)
            end
        end
        --Decision Generation
        for iTarget, _ in pairs(Decisions_CLTLINGITSHAMETOTEM.tTarget) do
            local sKey = "Decisions_CLTLINGITSHAMETOTEM" .. pTarget:GetName()
            tTempDecisions[sKey] = {}
            tTempDecisions[sKey].Name = Locale.ConvertTextKey("TXT_KEY_DECISIONS_CLTLINGITSHAMETOTEM_NAME", pTarget:GetName())
            tTempDecisions[sKey].Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_CLTLINGITSHAMETOTEM_DESC", pTarget:GetName(), Target:GetCivilizationShortDescription())
            tTempDecisions[sKey].Data1 = pTarget
            tTempDecisions[sKey].Type = "Civilization"
            HookDecisionCivilizationIcon(tTempDecisions[sKey], "CIVILIZATION_CL_TLINGIT")
            tTempDecisions[sKey].CanFunc = (
            function(pPlayer, pTarget)
                local sKey = "Decisions_CLTLINGITSHAMETOTEM" .. pTarget:GetName()
                tTempDecisions[sKey].Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_CLTLINGITSHAMETOTEM_DESC", pTarget:GetName(), Target:GetCivilizationShortDescription())
                if (pPlayer:GetNumResourceAvailable(GameInfoTypes.RESOURCE_MAGISTRATES, false) < 1) then return true, false end
                if pPlayer:GetGold() < 80 then return true, false end
                return true, true
            end
            )
            tTempDecisions[sKey].DoFunc = (
            function(pPlayer, pTarget)
                pPlayer:ChangeNumResourceTotal(GameInfoTypes.RESOURCE_MAGISTRATES, -1)
                pPlayer:SetGold(-80)
                save(pPlayer, "Decisions_CLTLINGITSHAMETOTEM", true)
                save(pPlayer, "ShameHead", pTarget)
            end
            )
        end
    end
)
 
    Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_CL_TLINGIT, "Decisions_CLTLINGITSHAMETOTEM", Decisions_CLTLINGITSHAMETOTEM)