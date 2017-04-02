--Building Classes
INSERT INTO BuildingClasses
			(Type,						DefaultBuilding,			Description)
VALUES		('BUILDINGCLASS_RELIC_HAN',	'BUILDING_RELIC_HAN',		'TXT_KEY_BUILDING_RELIC_HAN');
--================================================================
--Building Definitions
--================================================================
--Culture Dummy
INSERT INTO Buildings 
		(Type, Description, Cost, FaithCost, PrereqTech, BuildingClass, GreatWorkCount, IconAtlas, PortraitIndex)
VALUES	('BUILDING_RELIC_HAN_CULTUREDUMMY', 'TXT_KEY_BUILDING_RELIC_CULTUREDUMMY_DESC', -1, -1, NULL, 'BUILDINGCLASS_RELIC_HAN', -1, 13, 'BW_ATLAS_1');

INSERT INTO Building_YieldChanges 
		(BuildingType, YieldType, Yield)
VALUES	('BUILDING_RELIC_HAN_CULTUREDUMMY', 'YIELD_CULTURE', 1);
--Science Dummy
INSERT INTO Buildings
		(Type, Description, Cost, FaithCost, PrereqTech, BuildingClass, GreatWorkCount, IconAtlas, PortraitIndex)
VALUES	('BUILDING_RELIC_HAN_SCIENCEDUMMY', 'TXT_KEY_BUILDING_RELIC_SCIENCEDUMMY_DESC', -1, -1 NULL, 'BUILDINGCLASS_RELIC_HAN', -1, 13, 'BW_ATLAS_1');
INSERT INTO Building_YieldChanges
		(BuildingType, YieldType, Yield)
VALUES	('BUILDING_RELIC_HAN_SCIENCEDUMMY', 'YIELD_SCIENCE', 1);

INSERT INTO Buildings 	
		(Type, 										BuildingClass, Cost, SpecialistType, Happiness,	SpecialistCount, GoldMaintenance, PrereqTech, Description, 							Help, 									Civilopedia, 							 Strategy,								 		ArtDefineTag, MinAreaSize, NeverCapture, Espionage, EspionageModifier, HurryCostModifier, PortraitIndex, 	IconAtlas)
SELECT	'BUILDING_RELIC_SILU_YIZHAN',				BuildingClass, Cost, SpecialistType, Happiness,	SpecialistCount, GoldMaintenance, PrereqTech, 'TXT_KEY_BUILDING_RELIC_SILU_YIZHAN', 'TXT_KEY_BUILDING_SILU_YIZHAN_HELP',	'TXT_KEY_CIV5_RELIC_SILU_YIZHAN_TEXT',  'TXT_KEY_BUILDING_RELIC_SILU_YIZHAN_STRATEGY',	ArtDefineTag, MinAreaSize, NeverCapture, Espionage, EspionageModifier, HurryCostModifier, 3, 				'RELIC_HAN_ATLAS'
FROM Buildings WHERE Type = 'BUILDING_CARAVANSARY';	

--Flavors, wut do these do?
INSERT INTO Building_Flavors 	
		(BuildingType, 					FlavorType,	Flavor)
SELECT	'BUILDING_RELIC_SILU_YIZHAN',	FlavorType,	Flavor
FROM Building_Flavors WHERE BuildingType = 'BUILDING_CARAVANSARY';	
--Text
INSERT INTO Language_en_US
			(Tag,											Text)
VALUES		('TXT_KEY_BUILDING_RELIC_SILU_YIZHAN',		'Silu Yizhan'),
			('TXT_KEY_CIV5_RELIC_SILU_YIZHAN_TEXT',		'The Silk Road was dotted with outposts dedicated to trade. In these bustling hubs, ideas and gold flowed freely, leading to a distinct culture and significant scientific advancements from sharing.'),
			('TXT_KEY_BUILDING_SILU_YIZHAN_STRATEGY',	'Silu Yizhan'),
			('TXT_KEY_BUILDING_RELIC_SILU_YIZHAN_HELP',	'Replaces the Caravansary. Gain 50% extra [ICON_SCIENCE] and +1 [ICON_CULTURE] from each trade route.'),
		