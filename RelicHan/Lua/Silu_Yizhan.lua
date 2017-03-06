local civID = GameInfoTypes.CIVILIZATION_RELIC_HAN

--Thanks Chrisy15 for writing this
function C15_GetScientistPoints(pCity)
    local iGPP = 0
    for pSpecialist in DB.Query("SELECT * FROM Specialists WHERE GreatPeopleUnitClass = 'UNITCLASS_SCIENTIST'") do
        iGPP = iGPP + (pCity:GetSpecialistCount(pSpecialist.ID) * pSpecialist.GreatPeopleRateChange * 100)
        for pBuilding in DB.Query("SELECT * FROM Buildings WHERE SpecialistType = '" .. pSpecialist.Type .."'") do
            iGPP = iGPP + (pCity:GetNumRealBuilding(pBuilding.ID) * pBuilding.GreatPeopleRateChange * 100)
        end
    end
    return iGPP
end
        

function stuff(playerID)
    local pPlayer = Players[playerID]
    if pPlayer:IsAlive() and pPlayer:GetCivilizationType() == civilizationID then
        local tCities = {}
        for k, v in ipairs(pPlayer:GetTradeRoutes()) do
            if (v.FromID == playerID) and (v.ToID ~= playerID) then
                if not tCities[v.FromCity] then
                    tCities[v.FromCity] = {["Science"] = 0, ["Culture"] = 0}
                end
                tCities[v.FromCity].Science = tCities[v.FromCity].Science + C15_GetScientistPoints(v.ToCity)
                tCities[v.FromCity].Culture = tCities[v.FromCity].Culture + 1
            elseif (v.ToID == playerID) and (v.FromID ~= playerID) then
                if not tCities[v.ToCity] then
                    tCities[v.ToCity] = {["Science"] = 0, ["Culture"] = 0}
                end
                tCities[v.ToCity].Science = tCities[v.ToCity].Science + C15_GetScientistPoints(v.FromCity)
                tCities[v.ToCity].Culture = tCities[v.ToCity].Culture + 1
            end
        end
        for k, v in pairs(tCities) do
            k:ChangeSpecialistGreatPersonProgressTimes100(GameInfoTypes["SPECIALIST_SCIENTIST"], v.Science)
            k:SetNumRealBuilding(iCultureDummy, v.Culture)
        end
    end
end

GameEvents.PlayerDoTurn.Add(stuff)