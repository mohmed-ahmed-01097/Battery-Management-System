clear;
clc;

%%
Schedule.BMS_CurrentLimitsCalc_Task = 100e-3;
Schedule.BMS_MainStateMachine_Task  =  50e-3;
Schedule.BMS_BalancingLogic_Task    = 250e-3;
Schedule.BMS_EstimateSOC_Task       = 200e-3;
Schedule.BMS_EstimateSOH_Task       = 200e-3;

Battery_Script;

%%
save('SWE.3 CDD\DataTypes\Data_Script.mat');
clear;
clc;