% Fig. 7 simulation

clear all
close all
clc

%% load system parameters

load('SysPara.mat')

% SNR
SNR_dB = 5;
SNR_1 = 10^(SNR_dB/10);

BW_1 = BandWidth_Hz;

Capacity = [];
RangeBandWidth = BW_1 * (0.1:0.1:2);
for BWIndex = 1:length(RangeBandWidth)
    BandWidth_Hz = RangeBandWidth(BWIndex);
    
    % save system parameters
    filename = 'Fun4Para.mat';
    if exist(filename,'file')
        delete(filename)
    end
    save(filename)
    
    % generate Intermediate variable
    Gama = r_tau * LRN_fun.fun_gen_GamaIndexForFun4;
    N_Delay = 2 * BandWidth_Hz * DelaySpread_s;
    Para_k       =  N_Delay * N_Doppler /N /M;
    Para_alpha = log2(Gama / r_tau);
    
    % resave Parameters
    delete(filename)
    save(filename)
    
    % optimization
    InitialBeta = 1;
    [OptimalBeta, OptimalResult] = LRN_fun.fun_opt_NewtonForFun4(InitialBeta);
    
    % record optimization result
    Capacity = [Capacity, OptimalResult];
end

plot(RangeBandWidth/(1024^2), Capacity, 'Color', 'red','LineWidth', 2,'Marker','*','MarkerSize',8)

hold on

Capacity = [];
M = M*2;
N = N;
RangeBandWidth = BW_1 * (0.1:0.1:2);
for BWIndex = 1:length(RangeBandWidth)
    BandWidth_Hz = RangeBandWidth(BWIndex);
    
    % save system parameters
    filename = 'Fun4Para.mat';
    if exist(filename,'file')
        delete(filename)
    end
    save(filename)
    
    % generate Intermediate variable
    Gama = r_tau * LRN_fun.fun_gen_GamaIndexForFun4;
    N_Delay = 2 * BandWidth_Hz * DelaySpread_s;
    Para_k       =  N_Delay * N_Doppler /N /M;
    Para_alpha = log2(Gama / r_tau);
    
    % resave Parameters
    delete(filename)
    save(filename)
    
    % optimization
    InitialBeta = 1;
    [OptimalBeta, OptimalResult] = LRN_fun.fun_opt_NewtonForFun4(InitialBeta);
    
    % record optimization result
    Capacity = [Capacity, OptimalResult];
end

plot(RangeBandWidth/(1024^2), Capacity, 'Color', [0.04,0.09,0.27],'LineWidth', 2,'Marker','o','MarkerSize',8)

hold on

Capacity = [];
M = M ;
N = N *2;
RangeBandWidth = BW_1 * (0.1:0.1:2);
for BWIndex = 1:length(RangeBandWidth)
    BandWidth_Hz = RangeBandWidth(BWIndex);
    
    % save system parameters
    filename = 'Fun4Para.mat';
    if exist(filename,'file')
        delete(filename)
    end
    save(filename)
    
    % generate Intermediate variable
    Gama = r_tau * LRN_fun.fun_gen_GamaIndexForFun4;
    N_Delay = 2 * BandWidth_Hz * DelaySpread_s;
    Para_k       =  N_Delay * N_Doppler /N /M;
    Para_alpha = log2(Gama / r_tau);
    
    % resave Parameters
    delete(filename)
    save(filename)
    
    % optimization
    InitialBeta = 1;
    [OptimalBeta, OptimalResult] = LRN_fun.fun_opt_NewtonForFun4(InitialBeta);
    
    % record optimization result
    Capacity = [Capacity, OptimalResult];
end
figure(1)
plot(RangeBandWidth/(1024^2), Capacity, 'Color', [0.19,0.5,0.08],'LineWidth', 2,'Marker','>','MarkerSize',8)

hold off

grid on

xlabel('Band width (MHz)')
ylabel('Capacity (bps/Hz)')
h = legend('M = 512, N = 128', 'M = 1024, N = 128', 'M = 1024, N = 256','Location','Southwest','Box','off');
set(h, 'Fontsize',14)