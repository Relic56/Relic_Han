CREATE TABLE IF NOT EXISTS 
JFD_GlobalUserSettings (
    Type                 text             default null,
    Value                 integer         default 1);

INSERT INTO Policies
      (Type, Description)
VALUES ('POLICY_RELIC_HAN_DEC_1_DUMMY', 'TXT_KEY_POLICY_RELIC_HAN_DEC_1_DUMMY_DESC');
INSERT INTO Policy_BuildingClassProductionModifiers
  (PolicyType, BuildingClassType, ProductionModifier)
VALUES ('POLICY_RELIC_DUMMY', 'BUILDINGCLASS_COURTHOUSE', 10);