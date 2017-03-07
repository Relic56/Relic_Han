INSERT INTO ArtDefine_UnitInfos(Type, DamageStates, Formation)
  	VALUES ('ART_DEF_UNIT_SPEARMAN', 1, 'Phalanx');
INSERT INTO ArtDefine_UnitInfoMemberInfos(UnitInfoType, UnitMemberInfoType, NumMembers)
	VALUES ('ART_DEF_UNIT_SPEARMAN', 'ART_DEF_UNIT_MEMBER_SPEARMAN', 12);
INSERT INTO ArtDefine_UnitMemberInfos(TYPE, Scale, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
	SELECT 'ART_DEF_UNIT_MEMBER_JI', Scale, 'Han_Spearman.fxsxml', MaterialTypeTag, MaterialTypeSoundOverrideTag
	FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_SPEARMAN';
INSERT INTO ArtDefine_UnitMemberCombats(UnitMemberType, EnableActions, ShortMoveRadius, ShortMoveRate, TargetHeight, HasRefaceAfterCombat, ReformBeforeCombat)
	VALUES ('ART_DEF_UNIT_MEMBER_SPEARMAN', 'Idle Attack RunCharge AttackCity Bombard Death BombardDefend Run Fortify CombatReady Walk AttackCharge', 12.0, 0.349999994039536, 8.0, 1, 1);
INSERT INTO ArtDefine_UnitMemberCombatWeapons(UnitMemberType, "Index", SubIndex, WeaponTypeTag, WeaponTypeSoundOverrideTag)
	VALUES ('ART_DEF_UNIT_MEMBER_SPEARMAN', 0, 0, 'METAL', 'SPEAR');
INSERT INTO ArtDefine_UnitMemberCombatWeapons(UnitMemberType, "Index", SubIndex, VisKillStrengthMin, VisKillStrengthMax, WeaponTypeTag, MissTargetSlopRadius)
  	VALUES ('ART_DEF_UNIT_MEMBER_SPEARMAN', 1, 0, 10.0, 20.0, 'FLAMING_ARROW', 10.0);
INSERT INTO ArtDefine_StrategicView(StrategicViewType, TileType, Asset)
  	VALUES ('ART_DEF_UNIT_SPEARMAN', 'Unit', 'HanSpearman_China.dds');
