INSERT INTO Civilizations 		
			(Type, 						Description,					ShortDescription, 					Adjective, 							Civilopedia,					CivilopediaTag,				DefaultPlayerColor,			ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas, 			PortraitIndex, 	AlphaIconAtlas, 	SoundtrackTag,		MapImage, 			DawnOfManQuote, 					DawnOfManImage)
SELECT		'CIVILIZATION_RELIC_HAN', 	'TXT_KEY_CIV_RELIC_HAN_DESC',	'TXT_KEY_CIV_RELIC_HAN_SHORT_DESC',	'TXT_KEY_CIV_RELIC_HAN_ADJECTIVE',	'TXT_KEY_CIV5_RELIC_HAN_TEXT_1','TXT_KEY_CIV5_RELIC_HAN', 	'PLAYERCOLOR_RELIC_HAN',	ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, 'RELIC_HAN_ATLAS', 	0, 				'RELIC_HAN_ALPHA',	'Han', 				'RelicHanMap.dds',	'TXT_KEY_CIV5_DOM_RELIC_HAN_TEXT',	'Gaozu_DoM.dds'
FROM Civilizations WHERE (Type = 'CIVILIZATION_CHINA');

--------------------------------	
-- Ethnic Units Support
--------------------------------	
UPDATE Civilizations 
SET ArtStyleSuffix = (CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = '_CHINA' )
	THEN '_CHINA'
	ELSE '_KOREA' END) 
WHERE Type = 'CIVILIZATION_RELIC_HAN';

--==========================================================================================================================	
-- Civilization_CityNames
--==========================================================================================================================	
INSERT INTO Civilization_CityNames 
			(CivilizationType, 			CityName)
VALUES		('CIVILIZATION_RELIC_HAN', 	'TXT_KEY_CITY_NAME_RELIC_HAN_01'),
			('CIVILIZATION_RELIC_HAN', 	'TXT_KEY_CITY_NAME_RELIC_HAN_02'),
			('CIVILIZATION_RELIC_HAN', 	'TXT_KEY_CITY_NAME_RELIC_HAN_03'),
			('CIVILIZATION_RELIC_HAN', 	'TXT_KEY_CITY_NAME_RELIC_HAN_04'),
			('CIVILIZATION_RELIC_HAN', 	'TXT_KEY_CITY_NAME_RELIC_HAN_05'),
			('CIVILIZATION_RELIC_HAN', 	'TXT_KEY_CITY_NAME_RELIC_HAN_06'),
			('CIVILIZATION_RELIC_HAN', 	'TXT_KEY_CITY_NAME_RELIC_HAN_07'),
			('CIVILIZATION_RELIC_HAN', 	'TXT_KEY_CITY_NAME_RELIC_HAN_08'),
			('CIVILIZATION_RELIC_HAN', 	'TXT_KEY_CITY_NAME_RELIC_HAN_09'),
			('CIVILIZATION_RELIC_HAN', 	'TXT_KEY_CITY_NAME_RELIC_HAN_10'),
			('CIVILIZATION_RELIC_HAN', 	'TXT_KEY_CITY_NAME_RELIC_HAN_11'),
			('CIVILIZATION_RELIC_HAN', 	'TXT_KEY_CITY_NAME_RELIC_HAN_12'),
			('CIVILIZATION_RELIC_HAN', 	'TXT_KEY_CITY_NAME_RELIC_HAN_13'),
			('CIVILIZATION_RELIC_HAN', 	'TXT_KEY_CITY_NAME_RELIC_HAN_14'),
			('CIVILIZATION_RELIC_HAN', 	'TXT_KEY_CITY_NAME_RELIC_HAN_15'),

--==========================================================================================================================	
-- Civilization_FreeBuildingClasses
--==========================================================================================================================			
INSERT INTO Civilization_FreeBuildingClasses 
			(CivilizationType, 				BuildingClassType)
VALUES		('CIVILIZATION_RELIC_HAN',		'BUILDINGCLASS_PALACE');
--==========================================================================================================================	
-- Civilization_FreeTechs
--==========================================================================================================================		
INSERT INTO Civilization_FreeTechs 
			(CivilizationType, 				TechType)
SELECT		'CIVILIZATION_RELIC_HAN', 	TechType
FROM Civilization_FreeTechs WHERE (CivilizationType = 'CIVILIZATION_ROME');
--==========================================================================================================================	
-- Civilization_FreeUnits
--==========================================================================================================================		
INSERT INTO Civilization_FreeUnits 
			(CivilizationType, 					UnitClassType, Count, UnitAIType)
SELECT		'CIVILIZATION_RELIC_HAN',		UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE (CivilizationType = 'CIVILIZATION_ROME');
--==========================================================================================================================	
-- Civilization_Leaders
--==========================================================================================================================		
INSERT INTO Civilization_Leaders 
			(CivilizationType, 				LeaderheadType)
VALUES		('CIVILIZATION_RELIC_HAN', 	'LEADER_GAOZU');
--==========================================================================================================================	
-- Civilization_BuildingClassOverrides 
--==========================================================================================================================		
INSERT INTO Civilization_BuildingClassOverrides 
			(CivilizationType, 			BuildingClassType, 				BuildingType)
VALUES		('CIVILIZATION_RELIC_HAN', 	'BUILDINGCLASS_CARAVANSARY',	'BUILDING_SILU_YIZHAN');
--==========================================================================================================================	
-- Civilization_UnitClassOverrides 
--==========================================================================================================================		
INSERT INTO Civilization_UnitClassOverrides 
			(CivilizationType, 			UnitClassType, 				UnitType)
VALUES		('CIVILIZATION_RELIC_HAN', 'UNITCLASS_SPEARMAN',		'UNIT_RELIC_JI');
--==========================================================================================================================	
-- Civilization_Religions
--==========================================================================================================================		
INSERT INTO Civilization_Religions 
			(CivilizationType, 				ReligionType)
VALUES		('CIVILIZATION_RELIC_HAN', 		'RELIGION_CONFUCIANISM');
--==========================================================================================================================	
-- Colors
--==========================================================================================================================		
INSERT INTO PlayerColors 
			(Type,			 			PrimaryColor,					SecondaryColor,								TextColor)
VALUES		('PLAYERCOLOR_RELIC_HAN', 	'COLOR_PLAYER_RELIC_HAN_ICON',	'COLOR_PLAYER_RELIC_HAN_BACKGROUND',	'COLOR_PLAYER_WHITE_TEXT');

INSERT INTO Colors
			(Type,									Red,	Green,	Blue,	Alpha)
VALUES		('COLOR_PLAYER_RELIC_HAN_ICON',			0.02,	0 ,		.54,	1.0),
			('COLOR_PLAYER_RELIC_HAN_BACKGROUND',	0.61,	0.52,	0.78,	1.0);

--==========================================================================================================================	
-- Civilization_Start_Along_River
--=========================================================================================================================	
INSERT INTO Civilization_Start_Along_River
			(CivilizationType,						StartAlongRiver)
VALUES		('CIVILIZATION_RELIC_HAN',				2);
--==========================================================================================================================	
-- Civilization_SpyNames
--==========================================================================================================================	
INSERT INTO Civilization_SpyNames 
			(CivilizationType, 			SpyName)
VALUES		('CIVILIZATION_RELIC_HAN', 	'TXT_KEY_SPY_NAME_RELIC_HAN_0'),	
			('CIVILIZATION_RELIC_HAN', 	'TXT_KEY_SPY_NAME_RELIC_HAN_1'),
			('CIVILIZATION_RELIC_HAN', 	'TXT_KEY_SPY_NAME_RELIC_HAN_2'),
			('CIVILIZATION_RELIC_HAN', 	'TXT_KEY_SPY_NAME_RELIC_HAN_3'),
			('CIVILIZATION_RELIC_HAN', 	'TXT_KEY_SPY_NAME_RELIC_HAN_4'),
			('CIVILIZATION_RELIC_HAN', 	'TXT_KEY_SPY_NAME_RELIC_HAN_5'),
			('CIVILIZATION_RELIC_HAN', 	'TXT_KEY_SPY_NAME_RELIC_HAN_6'),
			('CIVILIZATION_RELIC_HAN', 	'TXT_KEY_SPY_NAME_RELIC_HAN_7'),
			('CIVILIZATION_RELIC_HAN', 	'TXT_KEY_SPY_NAME_RELIC_HAN_8'),
			('CIVILIZATION_RELIC_HAN', 	'TXT_KEY_SPY_NAME_RELIC_HAN_9');
--==========================================================================================================================		
--==========================================================================================================================						

--==========================================================================================================================	
-- Language_en_US
--==========================================================================================================================		
INSERT INTO Language_en_US
			(Tag,										Text)
VALUES		('TXT_KEY_CIV_RELIC_HAN_DESC',				'Han'),
			('TXT_KEY_CIV_RELIC_HAN_SHORT_DESC',		'Han'),
			('TXT_KEY_CIV_RELIC_HAN_ADJECTIVE',			'Han'),
			('TXT_KEY_CIV5_RELIC_HAN',					'The Han Dynasty'),
			('TXT_KEY_CIV5_DOM_GAOZU_TEXT',				'May Heaven''s blessings be upon you, Gaozu, legendary emperor and founder of the Han Dynasty. From humble peasant to rebel leader to one of China''s greatest emperors, your story is a true rags-to-riches tale. Great Gaozu, when you claimed your throne, you were a benevolent leader. You temporarily exempted those that you had conquered from tax, and lowered taxes across your empire. You promoted Confucianism across your empire, bringing a new era of religious enlightenment, and your shrewd diplomacy with the Xiongnu and other enemies led to a long period of relative peace and prosperity. But it was not to last. Caught by a stray arrow in your attempts to suppress Ying Bu''s rebellion, you later died of an infected wound. [NEWLINE][NEWLINE] Mighty Gaozu, your enemies once again seek to dismantle your peace. Your people cry out in the name of Gaozu and Han. Will you listen to them? Will you build a great and enlightened peace, advancing the sciences and becoming a bastion of trade and diplomacy? Or will you conquer those who dare to threaten your great empire? Can you build a civilization that will stand the test of time?'),
			('TXT_KEY_CITY_NAME_RELIC_HAN_01',			'Chang''an'),
			('TXT_KEY_CITY_NAME_RELIC_HAN_02',			'Luoyang'),
			('TXT_KEY_CITY_NAME_RELIC_HAN_03',			'Chengdu'),
			('TXT_KEY_CITY_NAME_RELIC_HAN_04',			'Changsha'),
			('TXT_KEY_CITY_NAME_RELIC_HAN_05',			'Suzhou'),
			('TXT_KEY_CITY_NAME_RELIC_HAN_06',			'Linzi'),
			('TXT_KEY_CITY_NAME_RELIC_HAN_07',			'Beijing'),
			('TXT_KEY_CITY_NAME_RELIC_HAN_08',			'Dunhuang'),
			('TXT_KEY_CITY_NAME_RELIC_HAN_09',			'Taierzhuang'),
			('TXT_KEY_CITY_NAME_RELIC_HAN_10',			'Shanghai'),
			('TXT_KEY_CITY_NAME_RELIC_HAN_11',			'Shijiazhuang'),
			('TXT_KEY_CITY_NAME_RELIC_HAN_12',			'Shenzhen'),
			('TXT_KEY_CITY_NAME_RELIC_HAN_13',			'Tianjin'),
			('TXT_KEY_CITY_NAME_RELIC_HAN_14',			'Hangzhou'),
			('TXT_KEY_CITY_NAME_RELIC_HAN_15',			'Guangzhou'),
				
			('TXT_KEY_SPY_NAME_RELIC_HAN_0',			'Liu Ying'),
			('TXT_KEY_SPY_NAME_RELIC_HAN_1',			'Liu Fei'),
			('TXT_KEY_SPY_NAME_RELIC_HAN_2',			'Liu Jian'),
			('TXT_KEY_SPY_NAME_RELIC_HAN_3',			'Liu Ruyi'),
			('TXT_KEY_SPY_NAME_RELIC_HAN_4',			'Liu Heng'),
			('TXT_KEY_SPY_NAME_RELIC_HAN_5',			'Liu Hui'),
			('TXT_KEY_SPY_NAME_RELIC_HAN_6',			'Liu You'),
			('TXT_KEY_SPY_NAME_RELIC_HAN_7',			'Liu Chang'),
			('TXT_KEY_SPY_NAME_RELIC_HAN_8',			'Liu Pi'),
			('TXT_KEY_SPY_NAME_RELIC_HAN_9',			'Liu Yingke'),
			('TXT_KEY_CIV5_RELIC_HAN_FACTOID_HEADING',	'Han Dynasty'),
			('TXT_KEY_CIV5_RELIC_HAN_FACTOID_TEXT',		'Placeholder, please ignore'),
			('TXT_KEY_CIV5_RELIC_HAN_HEADING_1',		'Placeholder, please ignore'),
		