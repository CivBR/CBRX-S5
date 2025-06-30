print ("Norte Chico Check")

local NorteChicoID = GameInfoTypes.CIVILIZATION_NORTE_CHICO_MOD;

for i, player in pairs(Players) do
	if player:IsEverAlive() then
		if player:GetCivilizationType() == NorteChicoID then
			include("Norte Chico Mod Scripts")
			break;
		end
	end
end

--Astronomy Check
local uFisher = GameInfoTypes.UNIT_NORTE_CHICO_MOD;
local tAstronomy = GameInfoTypes.TECH_ASTRONOMY;
local tSteam = GameInfoTypes.TECH_STEAM_POWER;
local pNoOcean = GameInfoTypes.PROMOTION_OCEAN_IMPASSABLE_UNTIL_ASTRONOMY;
local pCaral1 = GameInfoTypes.PROMOTION_CARAL_FISHER;
local pCaral2 = GameInfoTypes.PROMOTION_CARAL_FISHER_2;
local pCaral3 = GameInfoTypes.PROMOTION_CARAL_FISHER_3;

GameEvents.PlayerDoTurn.Add(
function(iPlayer)
	local pPlayer = Players[iPlayer];
	if (pPlayer:IsAlive()) then
		local pTeam = pPlayer:GetTeam();
		local TechCheck = 0;
		if (Teams[pTeam]:IsHasTech(tAstronomy)) then
			TechCheck = 1;
		end
		if (Teams[pTeam]:IsHasTech(tSteam)) then
			TechCheck = 2;
		end
		if TechCheck >= 1 then
			for pUnit in pPlayer:Units() do
				if (pUnit:GetUnitType() == uFisher) then
					if pUnit:IsHasPromotion(pNoOcean) then
						pUnit:SetHasPromotion(pNoOcean, false);
					end
					if TechCheck == 1 then
						if pUnit:IsHasPromotion(pCaral1) then
							pUnit:SetHasPromotion(pCaral1, false);
						end
						if not pUnit:IsHasPromotion(pCaral2) then
							pUnit:SetHasPromotion(pCaral2, true);
							pUnit:SetMoves(240);
						end
					elseif TechCheck == 2 then
						if pUnit:IsHasPromotion(pCaral1) then
							pUnit:SetHasPromotion(pCaral1, false);
						end
						if pUnit:IsHasPromotion(pCaral2) then
							pUnit:SetHasPromotion(pCaral2, false);
						end
						if not pUnit:IsHasPromotion(pCaral3) then
							pUnit:SetHasPromotion(pCaral3, true);
							pUnit:SetMoves(240);
						end
					end
				end
			end
		end
	end
end)