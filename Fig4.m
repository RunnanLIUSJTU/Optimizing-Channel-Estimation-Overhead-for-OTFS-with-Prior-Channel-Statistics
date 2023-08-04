% Fig. 4 simulation

%% load system parameters

load('SysPara.mat')
CapacityDiffSpreadTime = [];
for DSTimes = [0.5,1,2,3]
    % Delay spread
    DelaySpread_log = -6.63;%log(s)
    DelaySpread_s = 10 ^ (DelaySpread_log);% s
    DelaySpread_s = DSTimes * DelaySpread_s;   %%%%%%%%%%%%%%%%%%%%% 这个参数作出调整 %%%%%%%%%%%%%%%%%%%%%%%%
    
    %%  change Speed
    Capacity  = [];
    Speed = 100:10:350;
    lenSpeed = length(Speed);
    for SpeedIndex = 1:lenSpeed
        % Speed
        MaxSpeed_Kmh = Speed(SpeedIndex); % km/h
        MaxSpeed_ms = MaxSpeed_Kmh / 3.6; % m/s
        LightSpeed = 3*10^8; % m/s
        % Doppler spread length
        N_Doppler = LRN_fun.fun_gen_N_D(M, N, BandWidth_Hz, TransFreq_Hz, MaxSpeed_ms, LightSpeed);
        
        % save system parameters
        filename = 'Fun3Para.mat';
        if exist(filename,'file')
            delete(filename)
        end
        save(filename)
        
        % generate Intermediate variable
        Gama = r_tau * LRN_fun.fun_gen_GamaIndexForFun3;
        N_Delay = 2 * BandWidth_Hz * DelaySpread_s;
        Para_k       =  N_Delay * N_Doppler /N /M;
        Para_alpha = log2(Gama / r_tau);
        
        % resave Parameters
        delete(filename)
        save(filename)
        
        % optimization
        InitialBeta = 1;
        [OptimalBeta, OptimalResult] = LRN_fun.fun_opt_NewtonForFun3(InitialBeta);
        
        % record optimization result
        Capacity = [Capacity, OptimalResult];
    end
    CapacityDiffSpreadTime = [CapacityDiffSpreadTime; Capacity];
    
end

%% plot
figure(1)
ColorRGBMtx = [1, 0, 0; 0.04,0.09,0.27; 0.19,0.5,0.08; 1,0.5,0];
for DSTimes = 1:4
    rec_Marker = ['s','o','>','*'];
    plot(Speed,CapacityDiffSpreadTime(DSTimes,:), 'Color', ColorRGBMtx(DSTimes,:),'LineWidth', 2,'Marker',rec_Marker(DSTimes));
    hold on
end
hold off
grid on

h = legend('0.5\sigma_\tau','\sigma_\tau','2\sigma_\tau','3\sigma_\tau','Location','Southwest','Box','off');
h.FontSize = 14;

xlabel('Resolvable minimum speed (km/h)')
ylabel('Capacity (bps/Hz)')
set(gca,'FontSize',12);