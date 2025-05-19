function [] = Battery_SoC_LUT()

%% 1) Define input sweeps
initialSoC   = [0:100];        % % state-of-charge sweep
ambientTemp  = [-20, -10, 0, 10, 15, 20, 25, 30, 40, 50];        % °C ambient temperature sweep
nSOC  = numel(initialSoC);
nTemp = numel(ambientTemp);

% Pre-allocate output arrays
V_out   = zeros(nSOC, nTemp);     % cell voltage [V]
T_out   = zeros(nSOC, nTemp);     % cell temperature [°C]
SoC_out = zeros(nSOC, nTemp);     % model’s output SoC [%]

clc;

%% 2) Run the model over the grid
for i = 1:nSOC
    fprintf('%03i', i);
    for j = 1:nTemp
        
        % ==== REPLACE THIS LINE with your actual model call ====
        Ta = ambientTemp(j);
        SoC_init = initialSoC(i);
        res = sim("batteryModel.slx");
        V      = mean(res.yout{1}.Values.Data(4001:end));
        Tcell  = mean(res.yout{2}.Values.Data(4001:end));
        SoCnew = mean(res.yout{3}.Values.Data(4001:end));
        % ==============================================================

        V_out(i,j)   = V;
        T_out(i,j)   = Tcell;
        SoC_out(i,j) = SoCnew;
    end
    fprintf('\b\b\b');
end

%% 3) Create the LUT using Curve Fitting

%% 4) plot SoC

BP_OCV    = V_out;
BP_Temp   = T_out;
TableData = SoC_out;

% --- 3D surface plot ---
figure;
surf(BP_OCV, BP_Temp, TableData', 'EdgeColor','none');
grid on; hold on;
view(45,30);
xlabel('OCV (V)');
ylabel('Temperature (°C)');
zlabel('SoC (%)');
title('2‑D LUT Surface: SoC vs. OCV & Temperature');
colorbar;
  
% --- 2D slices: SoC vs OCV at each Temp ---
figure; hold on; grid on;
markers = {'-o','-s','-d','-^','-v'};
for k = 1:length(BP_Temp)
    plot(BP_OCV, TableData(:,k), markers{k}, 'LineWidth',1.5);
end
xlabel('OCV (V)');
ylabel('SoC (%)');
title('SoC vs. OCV at Different Temperatures');
legend(arrayfun(@(T) sprintf('%d°C',T), BP_Temp,'UniformOutput',false), ...
       'Location','NorthWest');

end
