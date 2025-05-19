function [] = Battery_Curves()
% UR18650ZTA 18650 Li‑ion cell — reproduce discharge & charge curves

%% 1) Discharge rate characteristics @ 20 °C
Ccap = [0 500 1000 1500 2000 2500 3000];  

V_02C = [4.20 4.15 4.05 3.90 3.70 3.40 2.90];  
V_05C = [4.20 4.10 4.00 3.85 3.60 3.25 2.85];  
V_1C  = [4.20 4.05 3.90 3.70 3.45 3.10 2.80];  
V_2C  = [4.20 3.95 3.75 3.50 3.20 2.85 2.60];  

figure;
plot(Ccap, V_02C,'-o', Ccap, V_05C,'-s', Ccap, V_1C,'-d', Ccap, V_2C,'-^','LineWidth',1.5);
xlabel('Discharge capacity (mAh)');
ylabel('Cell voltage (V)');
title('Discharge rate characteristics @ 20°C');
legend('0.2 C (0.6 A)','0.5 C (1.45 A)','1 C (3 A)','2 C (6 A)','Location','SouthWest');
grid on;

%% 2) Discharge temperature characteristics @ 1 C
Tcap = Ccap;  % same capacity axis

V_40C  = [4.20 4.10 4.00 3.85 3.60 3.30 2.90];
V_20C  = V_1C;  % reuse 1 C @20°C
V_0C   = [4.20 3.90 3.60 3.30 3.00 2.60 2.20];
V_m10C = [4.20 3.80 3.40 3.00 2.60 2.30 2.00];
V_m20C = [4.20 3.70 3.20 2.80 2.40 2.10 2.00];

figure;
plot(Tcap, V_40C,'-o', Tcap, V_20C,'-s', Tcap, V_0C,'-d', Tcap, V_m10C,'-^', Tcap, V_m20C,'-v','LineWidth',1.5);
xlabel('Discharge capacity (mAh)');
ylabel('Cell voltage (V)');
title('Discharge temperature characteristics @ 1 C');
legend('+40 °C','+20 °C','0 °C','−10 °C','−20 °C','Location','SouthWest');
grid on;

%% 3) Charge characteristics CC–CV (0.5 C → CV 4.35 V) at various temps
t = [0 30 60 90 120 150 180 210 240];  % minutes

% Voltage vs time
V20 = [2.8 3.8 4.1 4.2 4.2 4.2 4.2 4.2 4.2];
V0  = [2.8 3.7 3.9 4.05 4.1 4.15 4.18 4.20 4.20];
Vm10= [2.8 3.6 3.8 3.95 4.0 4.05 4.08 4.10 4.10];

% Current vs time (mA)
I20 = [1450 1450 1450 600  200  80   30   10   5];
I0  = [1450 1450 1400 500  150  60   20   8    5];
Im10= [1450 1400 1200 400  100  40   15   5    2];

% Capacity vs time (mAh)
Q20 = [0  725 1450 1900 2250 2500 2750 2950 3000];
Q0  = [0  700 1400 1800 2100 2350 2600 2850 2900];
Qm10= [0  650 1300 1650 1950 2200 2450 2700 2750];

figure;
yyaxis left
plot(t, V20,'-o', t, V0,'-s', t, Vm10,'-d','LineWidth',1.5);
ylabel('Cell voltage (V)');
yyaxis right
plot(t, Q20,'--o', t, Q0,'--s', t, Qm10,'--d','LineWidth',1.5);
ylabel('Capacity (mAh)');
xlabel('Charge time (min)');
title('Charge characteristics CC–CV at different temperatures');
legend('+20 °C V','0 °C V','−10 °C V','+20 °C Q','0 °C Q','−10 °C Q','Location','SouthEast');
grid on;
end