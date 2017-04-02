--==================================================================================
--Unit Info
--==================================================================================
--Basic definition
INSERT INTO Units
			(Class, Type,				Prereq Tech, Range, RangedCombat, Combat,	FaithCost, RequiresFaithPurchaseEnabled, Cost, Moves, CombatClass, Domain, DefaultUnitAI, Description,				Civilopedia,					Strategy,							Help,						MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, AdvancedStartCost, GoodyHutUpgradeUnitClass, CombatLimit, XPValueAttack, XPValueDefense, Conscription, UnitArtInfo,				UnitFlagAtlas,		UnitFlagIconOffset, PortraitIndex,	IconAtlas,			WorkRate)
SELECT		 Class, 'UNIT_RELIC_JI',	Prereq Tech, Range, RangedCombat, Combat+2,	FaithCost, RequiresFaithPurchaseEnabled, Cost, Moves, CombatClass, Domain, DefaultUnitAT, 'TXT_KEY_UNIT_RELIC_JI',	'TXT_KEY_CIV5_RELIC_JI_TEXT',	'TXT_KEY_UNIT_RELIC_HAN_STRATEGY',	'TXT_KEY_RELIC_JI_HELP',	MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, AdvancedStartCost, GoodyHutUpgradeUnitClass, CombatLimit, XPValueAttack, XPValueDefense, Conscription, 'ART_DEF_UNIT_RELIC_JI',	'RELIC_HAN_JI_FLAG',	0,					2,				'RELIC_HAN_ATLAS',	WorkRate)
From Units WHERE (Type = 'UNIT_SPEARMAN');
--Unit AI Type
INSERT INTO UNIT_AITypes
				(UnitType,			UnitAIType)
SELECT			'UNIT_RELIC_JI',	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_SPEARMAN');
-- Unit_Flavors
INSERT INTO Unit_Flavors 	
			(UnitType, 			FlavorType, Flavor)
SELECT		'UNIT_RELIC_JI', 	FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_SPEARMAN');
--Free Promotions, see below for definition
INSERT INTO Unit_FreePromotions 
			(UnitType, 			PromotionType)
VALUES		('UNIT_RELIC_JI', 	'PROMOTION_NO_ATTACK'),
			('UNIT_RELIC_JI',	'PROMOTION_DRILL_1'),
			('UNIT_RELIC_JI',	'PROMOTION_DRILL_2');
INSERT INTO Unit_FreePromotions
			(UnitType,			PromotionType)
SELECT		 'UNIT_RELIC_JI',	PromotionType
From Unit_FreePromotions WHERE (UnitType = 'UNIT_SPEARMAN');
--Unit Class Upgrades
INSERT INTO Unit_Class_Upgrades
			(UnitType,			UnitClassType);
SELECT		('UNIT_RELIC_JI',	UnitClassType);
From Unit_Class_Upgrades WHERE (UnitType = 'UNIT_SPEARMAN');
--==================================================================================
--Promotions
--==================================================================================
INSERT INTO UnitPromotions
			(Type,					Description,					Help								Sound,				LostWithUpgrade,	CannotBeChosen, PortraitIndex,	IconAtlas,			PediaType,		PediaEntry)
	VALUES	('PROMOTION_DID_ATTACK','TXT_KEY_RELIC_ATTACK_PROMO',	'TXT_KEY_RELIC_ATTACK_PROMO_HELP', 'AS2D_IF_LEVELUP',	0,					1,			59,				'ABILITY_ATLAS',	'PEDIA_SHARED', 'TXT_KEY_RELIC_ATTACK_PROMO')
			('PROMOTION_NO_ATTACK',	'TXT_KEY_RELIC_ATTACK_PROMO',	'TXT_KEY_RELIC_ATTACK_PROMO_HELP', 'AS2D_IF_LEVELUP',	0,					1,			59,				'ABILITY_ATLAS',	'PEDIA_SHARED', 'TXT_KEY_RELIC_ATTACK_PROMO');
INSERT INTO UnitPromotions_PostCombatRandomPromotion(PromotionType, NewPromotion)
	VALUES ('PROMOTION_NO_ATTACK', 'PROMOTION_DID_ATTACK');
INSERT INTO UnitPromotions_UnitCombats( PromotionType, UnitCombatType)
	VALUES ('PROMOTION_DID_ATTACK', 'UNITCOMBAT_MELEE')
		   ('PROMOTION_NO_ATTACK',	'UNITCOMBAT_MELEE');

--==================================================================================
--Art Defines
--==================================================================================
INSERT INTO ArtDefine_UnitInfos(Type, DamageStates, Formation)
  	VALUES ('ART_DEF_UNIT_RELIC_JI', 1, 'Phalanx');
INSERT INTO ArtDefine_UnitInfoMemberInfos(UnitInfoType, UnitMemberInfoType, NumMembers)
	VALUES ('ART_DEF_UNIT_RELIC_JI', 'ART_DEF_UNIT_MEMBER_RELIC_JI', 12);
INSERT INTO ArtDefine_UnitMemberInfos(TYPE, Scale, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
	SELECT 'ART_DEF_UNIT_MEMBER_RELIC_JI', Scale, 'Han_Spearman.fxsxml', MaterialTypeTag, MaterialTypeSoundOverrideTag
	FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_SPEARMAN';
INSERT INTO ArtDefine_UnitMemberCombats(UnitMemberType, EnableActions, ShortMoveRadius, ShortMoveRate, TargetHeight, HasRefaceAfterCombat, ReformBeforeCombat)
	VALUES ('ART_DEF_UNIT_MEMBER_RELIC_JI', 'Idle Attack RunCharge AttackCity Bombard Death BombardDefend Run Fortify CombatReady Walk AttackCharge', 12.0, 0.349999994039536, 8.0, 1, 1);
INSERT INTO ArtDefine_UnitMemberCombatWeapons(UnitMemberType, "Index", SubIndex, WeaponTypeTag, WeaponTypeSoundOverrideTag)
	VALUES ('ART_DEF_UNIT_MEMBER_RELIC_JI', 0, 0, 'METAL', 'SPEAR');
INSERT INTO ArtDefine_UnitMemberCombatWeapons(UnitMemberType, "Index", SubIndex, VisKillStrengthMin, VisKillStrengthMax, WeaponTypeTag, MissTargetSlopRadius)
  	VALUES ('ART_DEF_UNIT_MEMBER_RELIC_JI	', 1, 0, 10.0, 20.0, 'FLAMING_ARROW', 10.0);
INSERT INTO ArtDefine_StrategicView(StrategicViewType, TileType, Asset)
  	VALUES ('ART_DEF_UNIT_RELIC_JI', 'Unit', 'SVJi.dds');
--==================================================================================
--Lang
--==================================================================================
INSERT INTO Language_en_US
			(Tag,											Text)
VALUES		('TXT_KEY_UNIT_RELIC_JI',						'Ji'),
			('TXT_KEY_CIV5_RELIC_JI_TEXT',					'The Ji is a specialized polearm, a hybrid between a spear and dagger axe.'),
			('TXT_KEY_UNIT_RELIC_JI_STRATEGY',				'The Ji is an anti cavalry unit specialized in rough terrain. It also gains influence on kill. Use it to defend your borders or press an attack.'),
			('TXT_KEY_UNIT_RELIC_JI_HELP',					'Replaces the Spearman. Gains 5 influence with a random met city state on kill. Fights better on rough terrain.'),
			('TXT_KEY_RELIC_ATTACK_PROMO',					'Peacekeeper'),
			('TXT_KEY_RELIC_ATTACK_PROMO_HELP',				'Gain influence on kill');