--==========================================================================================================================	
-- Leaders
--==========================================================================================================================			
INSERT INTO Leaders 
			(Type, 						Description, 						Civilopedia, 								CivilopediaTag, 								ArtDefineTag, 					VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 				PortraitIndex)
VALUES		('LEADER_RELIC_GAOZU',		'TXT_KEY_LEADER_RELIC_GAOZU', 		'TXT_KEY_LEADER_RELIC_GAOZU_PEDIA', 		'TXT_KEY_CIVILOPEDIA_LEADERS_RELIC_GAOZU', 		'RELIC_GAOZU_Scene.xml',		8, 						5, 						9, 							6, 			5, 				3, 				5, 						8, 				9, 			3, 			6, 				3, 			3, 			'RELIC_HAN_ATLAS', 		1);
--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================						
INSERT INTO Leader_MajorCivApproachBiases 
			(LeaderType, 				MajorCivApproachType, 				Bias)
VALUES		('LEADER_RELIC_GAOZU', 	'MAJOR_CIV_APPROACH_WAR', 				4),
			('LEADER_RELIC_GAOZU', 	'MAJOR_CIV_APPROACH_HOSTILE', 			6),
			('LEADER_RELIC_GAOZU', 	'MAJOR_CIV_APPROACH_DECEPTIVE', 		4),
			('LEADER_RELIC_GAOZU', 	'MAJOR_CIV_APPROACH_GUARDED', 			6),
			('LEADER_RELIC_GAOZU', 	'MAJOR_CIV_APPROACH_AFRAID', 			2),
			('LEADER_RELIC_GAOZU', 	'MAJOR_CIV_APPROACH_FRIENDLY', 			7),
			('LEADER_RELIC_GAOZU', 	'MAJOR_CIV_APPROACH_NEUTRAL', 			6);
--==========================================================================================================================	
-- Leader_MinorCivApproachBiases
--==========================================================================================================================						
INSERT INTO Leader_MinorCivApproachBiases 
			(LeaderType, 				MinorCivApproachType, 				Bias)
VALUES		('LEADER_RELIC_GAOZU', 		'MINOR_CIV_APPROACH_IGNORE', 		2),
			('LEADER_RELIC_GAOZU', 		'MINOR_CIV_APPROACH_FRIENDLY', 		9),
			('LEADER_RELIC_GAOZU', 		'MINOR_CIV_APPROACH_PROTECTIVE', 	9),
			('LEADER_RELIC_GAOZU', 		'MINOR_CIV_APPROACH_CONQUEST', 		2),
			('LEADER_RELIC_GAOZU', 		'MINOR_CIV_APPROACH_BULLY', 		2);
--==========================================================================================================================	
-- Leader_Flavors
--==========================================================================================================================						
INSERT INTO Leader_Flavors 
			(LeaderType, 				FlavorType, 						Flavor)
VALUES		('LEADER_RELIC_GAOZU', 		'FLAVOR_OFFENSE', 					5),
			('LEADER_RELIC_GAOZU', 		'FLAVOR_DEFENSE', 					7),
			('LEADER_RELIC_GAOZU', 		'FLAVOR_CITY_DEFENSE', 				6),
			('LEADER_RELIC_GAOZU', 		'FLAVOR_MILITARY_TRAINING', 		8),
			('LEADER_RELIC_GAOZU', 		'FLAVOR_RECON', 					2),
			('LEADER_RELIC_GAOZU', 		'FLAVOR_RANGED', 					6),
			('LEADER_RELIC_GAOZU', 		'FLAVOR_MOBILE', 					5),
			('LEADER_RELIC_GAOZU', 		'FLAVOR_NAVAL', 					4),
			('LEADER_RELIC_GAOZU', 		'FLAVOR_NAVAL_RECON', 				3),
			('LEADER_RELIC_GAOZU', 		'FLAVOR_NAVAL_GROWTH', 				4),
			('LEADER_RELIC_GAOZU', 		'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	6),
			('LEADER_RELIC_GAOZU', 		'FLAVOR_AIR', 						7),
			('LEADER_RELIC_GAOZU', 		'FLAVOR_EXPANSION', 				5),
			('LEADER_RELIC_GAOZU', 		'FLAVOR_GROWTH', 					6),
			('LEADER_RELIC_GAOZU', 		'FLAVOR_TILE_IMPROVEMENT', 			8),
			('LEADER_RELIC_GAOZU', 		'FLAVOR_INFRASTRUCTURE', 			6),
			('LEADER_RELIC_GAOZU', 		'FLAVOR_PRODUCTION', 				7),
			('LEADER_RELIC_GAOZU', 		'FLAVOR_GOLD', 						8),
			('LEADER_RELIC_GAOZU', 		'FLAVOR_SCIENCE', 					9),
			('LEADER_RELIC_GAOZU', 		'FLAVOR_CULTURE', 					5),
			('LEADER_RELIC_GAOZU', 		'FLAVOR_HAPPINESS', 				8),
			('LEADER_RELIC_GAOZU', 		'FLAVOR_GREAT_PEOPLE', 				6),
			('LEADER_RELIC_GAOZU', 		'FLAVOR_WONDER', 					8),
			('LEADER_RELIC_GAOZU', 		'FLAVOR_RELIGION', 					6),
			('LEADER_RELIC_GAOZU', 		'FLAVOR_DIPLOMACY', 				5),
			('LEADER_RELIC_GAOZU', 		'FLAVOR_SPACESHIP', 				7),
			('LEADER_RELIC_GAOZU', 		'FLAVOR_WATER_CONNECTION', 			6),
			('LEADER_RELIC_GAOZU', 		'FLAVOR_NUKE', 						4),
			('LEADER_RELIC_GAOZU', 		'FLAVOR_USE_NUKE', 					4),
			('LEADER_RELIC_GAOZU', 		'FLAVOR_ESPIONAGE', 				5),
			('LEADER_RELIC_GAOZU', 		'FLAVOR_AIRLIFT', 					9),
			('LEADER_RELIC_GAOZU', 		'FLAVOR_I_TRADE_DESTINATION', 		9),
			('LEADER_RELIC_GAOZU', 		'FLAVOR_I_TRADE_ORIGIN', 			9),
			('LEADER_RELIC_GAOZU', 		'FLAVOR_I_SEA_TRADE_ROUTE', 		6),
			('LEADER_RELIC_GAOZU', 		'FLAVOR_I_LAND_TRADE_ROUTE', 		6),
			('LEADER_RELIC_GAOZU', 		'FLAVOR_ARCHAEOLOGY', 				4),
			('LEADER_RELIC_GAOZU', 		'FLAVOR_AIR_CARRIER', 				9);
--==========================================================================================================================	
-- Leader_Traits
--==========================================================================================================================	
INSERT INTO Leader_Traits 
			(LeaderType, 				TraitType)
VALUES		('LEADER_RELIC_GAOZU', 		'TRAIT_VASSAL_KINGS');
--==========================================================================================================================				
--==========================================================================================================================		

--==========================================================================================================================	
-- Language_en_US
--==========================================================================================================================		
INSERT INTO Language_en_US
			(Tag,													Text)
VALUES		('TXT_KEY_LEADER_RELIC_GAOZU',							'Gaozu'),
			('TXT_KEY_LEADER_RELIC_GAOZU_PEDIA',					'Gaozu'),
			('TXT_KEY_CIVILOPEDIA_LEADERS_RELIC_GAOZU',				'Gaozu'),
			('TXT_KEY_CIVILOPEDIA_LEADERS_RELIC_GAOZU_NAME',		'Gaozu'),
			('TXT_KEY_CIVILOPEDIA_LEADERS_RELIC_GAOZU_SUBTITLE',	'Peasant Emperor'),
			('TXT_KEY_CIVILOPEDIA_LEADERS_RELIC_GAOZU_HEADING_1',	'Gaozu'),
			('TXT_KEY_CIVILOPEDIA_LEADERS_RELIC_GAOZU_TEXT_1',		'Born Liu Bang, blah blah blah', 'Gaozu'),
			('TXT_KEY_CIVILOPEDIA_LEADERS_RELIC_GAOZU_TITLES_1', 'Emperor'),
			('TXT_KEY_CIVILOPEDIA_LEADERS_RELIC_GAOZU_LIVED', '256-195 BC');