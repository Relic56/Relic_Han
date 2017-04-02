--===============================================================================================
--Events and Decisions support
--===============================================================================================

--===============================================================================================
--Consolidate Power
--There are far too many splintered states in our kingdom. Replaceing their heads with family members will make our empire more productive, happier, and safer.
--Requirements: Must have at least 3 puppeted cities.
--Cost: 2 Magistrates, [250 * Number Puppeted Cities], [25*Number Puppeted Cities] Culture
--Rewards: 
--All puppeted cities are annexed immediately and courthouses are built. Cities in resistance stop being in resistance. Courthouses provide +10% production when building military units. 
--May only be enacted once per era.
--================================================================================================

-- JFD_GetUserSetting
function JFD_GetUserSetting(type)
	for row in GameInfo.JFD_GlobalUserSettings("Type = '" .. type .. "'") do -- Create this table; you can find in the MSF
		return row.Value
	end
end
local bIsColonies = JFD_GetUserSetting("JFD_CID_COLONIES_CORE") == 1 

local iGovernorMansion = GameInfoTypes["BUILDING_JFD_GOVERNORS_MANSION"]
local DecisionsRelicHanPuppet = {}
DecisionsRelicHanPuppet.Name ="TXT_KEY_DECISION_RELIC_HAN_PUPPET_NAME"
DecisionsRelicHanPuppet.Desc ="TXT_KEY_DECISION_RELIC_HAN_PUPPET_DESC"
HookDecisionCivilizationIcon(DecisionsRelicHanPuppet, 'CIVILIZATION_RELIC_HAN')
DecisionsRelicHanPuppet.CanFunc = {
function(pPlayer)
	if pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_RELIC_HAN then --Am I actually playing Han? :P
		return false, false
	end
	local iEra = load(pPlayer, "DecisionsRelicHanPuppet")--Once per era
	local iCurrentEra = pPlayer:GetCurrentEra()
	if iEra ~= nil then
		if iEra < iCurrentEra then
			save(pPlayer, "DecisionsRelicHanPuppet", nil)
		else
			DecisionsRelicHanPuppet.Desc = Locale.ConvertTextKey("TXT_KEY_DECISION_RELIC_HAN_PUPPET_DESC")
			return false, false, true --It's been enacted this era
		end
	end
	local iPuppets = 0
	for pCity in pPlayer:Cities() do--Get all the puppets
		if pCity:isPuppet() then
			iPuppets = iPuppets + 1
		end
	end
	local iCostGold = math.ceil(iPuppets * 250 * iMod)--Cost
	local iCostCult = math.ceil(iPuppets * 25 * iMod)
	if iPuppets < 3 then --self explanatory
		return true, false
	end
	DecisionsRelicHanPuppet.Desc = Locale.ConvertTextKey("TXT_KEY_DECISION_RELIC_HAN_PUPPET_DESC", iCostGold, iCostCul)
	if pPlayer:GetJONSCulture() < iCostCult then
		return true, false
	end
	if pPlayer:GetGold() < iCostGold then
		return true, false
	end
	if pPlayer:GetNumResourceAvailable(iMagistrate, false) < 2 then
		return true, false
	end
	return true, true
end
}
DecisionsRelicHanPuppet.DoFunc = {
function(pPlayer)--Credit to Chrisy15
	local iPuppetCount = 0
	for pCity in pPlayer:Cities() do
		local bColony = false
		if bIsColonies then
			if IsColony then -- I think this is what it's gonna be called; gonna have to check with Jiff
				bColony = pCity:IsColony()
			else
				bColony = pCity:IsHasBuilding(iGovernorMansion)
			end
		end
		if not bColony and pCity:IsPuppet() then
			pCity:SetPuppet(false)
			iPuppetCount = iPuppetCount + 1
		end
		if pCity:IsResistance() then
			pCity:ChangeResistance(-pCity:GetResistance())
		end
	end
	DecisionsRelicHanPuppet.Monitors[GameEvents.PlayerDoTurn](pPlayer:GetID())
    local iCostGold = math.ceil(iPuppetCount * 250 * iMod)
    local iCostCult = math.ceil(iPuppetCount * 25 * iMod)
    pPlayer:ChangeNumResourceTotal(iMagistrate, -2)
    pPlayer:ChangeJONSCulture(-iCostCult)
    pPlayer:ChangeGold(-iCostGold)
	pPlayer:SetHasPolicy(GameInfoTypes['POLICY_RELIC_HAN_DEC_1_DUMMY'], true)
end
}
DecisionsRelicHanPuppet.Monitors = {}
DecisionsRelicHanPuppet.Monitors[GameEvents.PlayerDoTurn] = (
function(playerID)
	local pPlayer = Players[playerID]
	if pPlayer:IsAlive() and pPlayer:HasPolicy(GameInfoTypes['POLICY_RELIC_HAN_DEC_1_DUMMY']) then
		for pCity in pPlayer:Cities() do -- Dunno why you're tabling stuff; just iterate all cities and handle stuff from there
			if pCity:IsHasBuilding(iCourthouse) then
				pCity:SetNumRealBuilding(iCourthouseProduction, 1)
			else
				pCity:SetNumRealBuilding(iCourthouseProduction, 0)
			end
		end
	end
end
)
--=======================================================================================
--Decision 2
--=======================================================================================
--Establish the Heqin System with [Civ]
--The [Civ] Empire is much more powerful than we are. We must ensure peace at any cost.
--Requirements: There must be a player on an opposing team with higher military strength than you.
--Cost: 1 Magistrate, [x] Gold, [x] Culture
--Rewards:
--Golden Age begins for both players, and war cannot be declared between them for [some number] of turns. Can only be enacted once per era.
--========================================================================================
local DecisionsRelicHanHeqin = {}
DecisionsRelicHanHeqin.Name = "TXT_KEY_RELIC_HAN_HEQIN_NAME"
DecisionsRelicHanHeqin.Desc = "TXT_KEY_RELIC_HAN_HEQIN_DESC"
HookDecisionCivilizationIcon(Decisions_HunsRansom, "CIVILIZATION_RELIC_HAN")
DecisionsRelicHanHeqin.CanFunc = {
function(pPlayer)
	if(pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_RELIC_HAN then
		return false, false
	endlocal iEra = load(pPlayer, "DecisionsRelicHanPuppet")--Once per era
	local iCurrentEra = pPlayer:GetCurrentEra()
	if iEra ~= nil then
		if iEra < iCurrentEra then
			save(pPlayer, "DecisionsRelicHanPuppet", nil)
		else
			DecisionsRelicHanPuppet.Desc = Locale.ConvertTextKey("TXT_KEY_DECISION_RELIC_HAN_PUPPET_DESC")
			return false, false, true --It's been enacted this era
		end
	end
	local pTeam = Teams[Player:GetTeam()]
	--Generate all decisions, one for each civ with higher military power
	for iPlayer = 0, GameDefines.MAX_MAJOR_CIVS -1, 1 do
		if iPlayer ~= pPlayer:GetID() then
			local pEnemy = Players[iPlayer]
			if pEnemy:IsEverAlive() and pEnemy:IsActive() and pTeam:IsHasMet(pEnemy:GetTeam()) and pPlayer:GetTeam() ~= pEnemy:GetTeam() then
				local sKey = "DecisionsRelicHanHeqin" .. iPlayer
				local tData = {}
					tData.Civ = iPlayer
					tData.Name = pEnemy:GetName()
				tTempDecisions[sKey] = {}
				tTempDecisions[sKey].Name = Locale.ConvertTextKey("TXT_KEY_DECISIONS_RELIC_HAN_HEQIN", tData.Name)
				tTempDecisions[sKey].Desc = "TXT_KEY_DECISIONS_RELIC_HAN_EXAMPLE_DESC"
				tTempDecisions[sKey].Data1 = tData
				tTempDecisions[sKey].Type = "Civilization"
				HookDecisionCivilizationIcon(tTempDecisions[sKey], "CIVILIZATION_RELIC_HAN")
				tTempDecisions[sKey].CanFunc = (
				function(pPlayer, tData)
					local sName = tData.Name	
					if load(pPlayer, sKey) == true then
						tTempDecisions[sKey].Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_RELIC_HAN_HEQIN_ENACTED_DESC", sName)
						return false, false, true
					end
					local pTeam = Teams[pPlayer:GetTeam()]
					local iEnemy = tData.Civ
					local pEnemy = Players[iEnemy]
					local iEnemyTeam = pEnemy:GetTeam()
					local sKey = "DecisionsRelicHanHeqin" .. iEnemy
					local iCostGold = math.ceil(500 * iMod)
					local iCostCult = math.ceil(500 * iMod)
					if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 2) then return true, false end
					if pPlayer:GetMilitaryMight() > pEnemy:GetMilitaryMight() then return true, false end
					if pTeam:IsAtWar(iEnemyTeam) then return true, false end
					return true, true

				end
				)
				tTempDecisions[sKey].DoFunc = (
				function(pPlayer)
					for eEvent, fFunc in pairs(DecisionsRelicHanHeqin.Monitors) do
						eEvent.Remove(fFunc)
						eEvent.Add(fFunc)
					end
					
}
