local civilizationID = GameInfoTypes["CIVILIZATION_RELIC_HAN"]
local iSilkRoadUBThing = GameInfoTypes["BUILDING_RELIC_SILU_YIZHAN"]
local iCultureDummy = GameInfoTypes["BUILDING_RELIC_HAN_CULTUREDUMMY"]
local iScienceDummy = GameInfoTypes["BUILDING_RELIC_HAN_SCIENCEDUMMY"]
--Below code was entirely written by Chrisy15
function C15_Relic_TradeRouteScienceCulture(playerID)
	local pPlayer = Players[playerID]
	if pPlayer:IsAlive() and pPlayer:GetCivilizationType() == civilizationID then
		local tCities = {}
		for k, v in ipairs(pPlayer:GetTradeRoutes()) do
			if (v.FromID == playerID) and (v.ToID ~= playerID) then
				if v.FromCity:IsHasBuilding(iSilkRoadUBThing) then
					if not tCities[v.FromCity] then
						tCities[v.FromCity] = {["Science"] = 0, ["Culture"] = 0}
					end
					tCities[v.FromCity].Science = tCities[v.FromCity].Science + (math.floor((v.FromScience / 100) / 2))
					tCities[v.FromCity].Culture = tCities[v.FromCity].Culture + 1
				end
			elseif (v.ToID == playerID) and (v.FromID ~= playerID) then
				if v.ToCity:IsHasBuilding(iSilkRoadUBThing) then
					if not tCities[v.ToCity] then
						tCities[v.ToCity] = {["Science"] = 0, ["Culture"] = 0}
					end
					tCities[v.ToCity].Science = tCities[v.ToCity].Science + (math.floor((v.ToScience / 100) / 2))
					tCities[v.ToCity].Culture = tCities[v.ToCity].Culture + 1
				end
			end
		end
		for k, v in pairs(tCities) do
			k:SetNumRealBuilding(iScienceDummy, v.Science)
			k:SetNumRealBuilding(iCultureDummy, v.Culture)
			--print("pCity = ", k, "iScience = ", v.Science, "iCulture = ", v.Culture)
		end
	end
end

GameEvents.PlayerDoTurn.Add(C15_Relic_TradeRouteScienceCulture)