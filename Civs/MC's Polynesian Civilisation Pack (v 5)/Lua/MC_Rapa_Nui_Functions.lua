--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ /// Rapa Nui functions \\\ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ///                      \\\ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--~~~ UA: Kai Kai Lore - Every time a citizen is born, receive faith. Every 10 faith output of a city   ~~~
--~~~                    generates +1 Cultural Great Person point, including faith from new citizens.   ~~~
--~~~     UU: Matato'a - Replaces Composite Bowman. +1 sight and range (lost on upgrade). May collect a ~~~
--~~~                    Manu Tara egg from an unimproved coastal hill tile without resources, turning  ~~~
--~~~                    the unit into the stronger Tangata-Manu. This process also generates +40       ~~~
--~~~                    cultural Great People points and starts a 5 turn We Love the King Day in the   ~~~
--~~~                    city.                                                                          ~~~
--~~~         UI: Moai - Requires Construction. +2 Faith. Provides +1 Culture for each adjacent Moai,   ~~~
--~~~                    and +1 faith when built on a Manu Tara egg site.                               ~~~
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\\\ ///~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

--=====================================================================================================
-- UA: Kai Kai Lore (Faith boost for new citizens)
-- Author: JFD
--=====================================================================================================
local ArtistSp = GameInfoTypes.SPECIALIST_ARTIST
local MusicianSp = GameInfoTypes.SPECIALIST_MUSICIAN
local WriterSp = GameInfoTypes.SPECIALIST_WRITER

function JFD_GetRandom(lower, upper)
	return Game.Rand((upper + 1) - lower, "") + lower
end

function JFD_RapaNuiFaith(iX, iY, oldPopulation, newPopulation)
        local city = Map.GetPlot(iX, iY):GetPlotCity()
        if (not city) then return end 
		local player = Players[city:GetOwner()]
        if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_MC_RAPA_NUI"] then
                local faithBoost = (newPopulation - 1)*5
                player:ChangeFaith(faithBoost)
 		local CultureGPBoost = ( faithBoost / 10 ) * 100
		if CultureGPBoost > 0 then
			if JFD_GetRandom(1, 3) == 1 then city:ChangeSpecialistGreatPersonProgressTimes100(ArtistSp, CultureGPBoost)
			elseif JFD_GetRandom(1, 3) == 2 then city:ChangeSpecialistGreatPersonProgressTimes100(MusicianSp, CultureGPBoost)
			else city:ChangeSpecialistGreatPersonProgressTimes100(WriterSp, CultureGPBoost) end
		end


                if player:IsHuman() and faithBoost > 0 then
                        local alertmessage = Locale.ConvertTextKey("TXT_KEY_MC_RAPA_NUI_FAITH", faithBoost, city:GetName())
                        Events.GameplayAlertMessage(alertmessage)
                end
        end
end
GameEvents.SetPopulation.Add(JFD_RapaNuiFaith)

--=====================================================================================================
-- UA: Kai Kai Lore (Cultural GP points from faith per turn)
-- Author: Leugi
--=====================================================================================================

function RapaNuiGrantGPPoints(iPlayer)
	local pPlayer = Players[iPlayer];
	if (pPlayer:IsEverAlive()) then
		 if pPlayer:GetCivilizationType() == GameInfoTypes["CIVILIZATION_MC_RAPA_NUI"] then
			for pCity in pPlayer:Cities() do
				local iFaithPerTurn = pCity:GetFaithPerTurn();
				local CultureGPBoostFPT = iFaithPerTurn * 10
				if CultureGPBoostFPT > 0 then
					pCity:ChangeSpecialistGreatPersonProgressTimes100(ArtistSp, CultureGPBoostFPT)
					pCity:ChangeSpecialistGreatPersonProgressTimes100(MusicianSp, CultureGPBoostFPT)
					pCity:ChangeSpecialistGreatPersonProgressTimes100(WriterSp, CultureGPBoostFPT)
				end
			end
		end
	end
end

GameEvents.PlayerDoTurn.Add(RapaNuiGrantGPPoints)

--=====================================================================================================
-- UU: Matato'a (Manu Tara functions and all that)
-- Author: Leugi
--=====================================================================================================
    local iUnitID = GameInfo.Units.UNIT_MC_RAPA_NUI_MATATOA.ID
    local iTangataID = GameInfo.Units.UNIT_MC_RAPA_NUI_TANGATA_MANU.ID
    local iManuID = GameInfoTypes["RESOURCE_MANUTARA_EGG"]
    local iCivType = GameInfo.Civilizations["CIVILIZATION_MC_RAPA_NUI"].ID


function TangataManify(iPlayer)
	local pPlayer = Players[iPlayer];
	for unit in pPlayer:Units() do
               	if (unit:GetUnitType() == iUnitID) then
			local plot = unit:GetPlot();
			local ImpID = plot:GetImprovementType()
                        if ImpID == GameInfoTypes.IMPROVEMENT_MANUTARA_SITE then
 				if (plot:GetNumResource() > 1) then
					 if (pPlayer:IsHuman()) then
 						local title =  Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_NOEGG_TITLE");
						local descr =  Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_NOEGG");
						pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, descr, title, plot:GetX(), plot:GetY());
					end
 					plot:SetImprovementType(-1);
				else
					local newUnit = pPlayer:InitUnit(iTangataID, unit:GetX(), unit:GetY())
                                        newUnit:Convert(unit);
                                        plot:SetImprovementType(-1);
                                        plot:SetResourceType(iManuID, 1);
	           			if pPlayer:IsHuman() then
						local alertmessage = Locale.ConvertTextKey("TXT_KEY_MC_TANGATAMANU_ALERT")
                       				Events.GameplayAlertMessage(alertmessage)
					end
                                end
                         end
                end
         end
end


GameEvents.PlayerDoTurn.Add(TangataManify);

function DestroyEggs(iPlayer)
	local pPlayer = Players[iPlayer];
	if (pPlayer:GetCivilizationType() ~= iCivType) then
		for pCity in pPlayer:Cities() do
			local i;
			for i = 0, pCity:GetNumCityPlots() - 1, 1 do
				local plot = pCity:GetCityIndexPlot( i );
				if (plot ~= nil) then
  					if ( plot:GetOwner() == pCity:GetOwner() ) then
						if (plot:GetResourceType() == iManuID) then
							plot:SetResourceType(-1);
						end
					end
				end
			end
		end
	end
end


GameEvents.PlayerDoTurn.Add(DestroyEggs);