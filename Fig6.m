% Fig. 6 simulation

clear
close all
clc

%% load system parameters
load('SysPara.mat')

% initialization
RecCap = [];
RecOptDelay = [];
RecOptCap = [];

SNRdBList = 5:1:60;
beta = 1:0.5:7.5;
delay_grid = DelaySpread_s * beta;
for SNR_index = 1:length(SNRdBList)
    SNR_dB = SNRdBList(SNR_index);
    SNR_1 = 10^(SNR_dB/10);
    
    % save system parameters
    filename = 'Fun5Para.mat';
    if exist(filename,'file')
        delete(filename)
    end
    save(filename)
    
    Gama = r_tau * LRN_fun.fun_gen_GamaIndexForFun5;
    N_Delay = 2 * BandWidth_Hz * DelaySpread_s;
    Para_k       =  N_Delay * N_Doppler /N /M;
    Para_alpha = log2(Gama / r_tau);
    
    % save system parameters
    delete(filename)
    save(filename)
    
    % optimization
    InitialBeta = 1;
    [OptimalBeta, OptimalResult] = LRN_fun.fun_opt_NewtonForFun5(InitialBeta);
    
    % plot
    F1 = (1 - Para_k * beta) .* (log2(1+1/SNR_1) - log2(2/SNR_1 + Gama/r_tau*exp(-beta)));
    
    %record
    RecCap = [RecCap ; F1];
    RecOptDelay = [RecOptDelay , OptimalBeta*DelaySpread_s];
    RecOptCap = [RecOptCap , OptimalResult];
end
[xx,yy]=meshgrid(delay_grid,SNRdBList);
figure(1)
surf(xx,yy,RecCap)
hold on
plot3(RecOptDelay, SNRdBList, RecOptCap,'-o','Color','red','LineWidth',2)

xlabel('{\itl}_\tau length (s)')
ylabel('SNR(dB)')
zlabel('Channel capacity measure (bps/Hz)')
set(gca,'FontSize',14);
