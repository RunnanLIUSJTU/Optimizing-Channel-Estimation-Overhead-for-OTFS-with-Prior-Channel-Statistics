% Fig. 5 simulation
close all
clear all
clc
%% load system parameters

load('SysPara.mat')

%% Low SNR
% regenerate SNR
SNR_dB = 15;
SNR_1 = 10^(SNR_dB/10);

% save system parameters
filename = 'Fun2Para.mat';
if exist(filename,'file')
    delete(filename)
end
save(filename)


% generate Intermediate variable
Gama = r_tau * LRN_fun.fun_gen_GamaIndexForFun2;
N_Delay = 2 * BandWidth_Hz * DelaySpread_s;
Para_k       =  N_Delay * N_Doppler /N /M;
Para_alpha = log2(Gama / r_tau);

% save system parameters
filename = 'Fun2Para.mat';
if exist(filename,'file')
    delete(filename)
end
save(filename)

PlotEnd = M/6;

[Low_DelayGrid1, F1_DS1] = LRN_fun.fun_plot_Capacity(PlotEnd);

% high SNR
High_DelayGrid1 = 1/BandWidth_Hz * (1:2:PlotEnd);
beta = High_DelayGrid1 / DelaySpread_s;
F2_DS1 = (-1 + Para_k * beta) .* (log2(Gama/r_tau)-beta/log(2));



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  2 times
DelaySpread_s = DelaySpread_s * 2;

% save system parameters
filename = 'Fun2Para.mat';
if exist(filename,'file')
    delete(filename)
end
save(filename)

% generate Intermediate variable
Gama = r_tau * LRN_fun.fun_gen_GamaIndexForFun2;
N_Delay = 2 * BandWidth_Hz * DelaySpread_s;
Para_k       =  N_Delay * N_Doppler /N /M;
Para_alpha = log2(Gama / r_tau);

% save system parameters
filename = 'Fun2Para.mat';
if exist(filename,'file')
    delete(filename)
end
save(filename)

PlotEnd = M/3.7;

[Low_DelayGrid2, F1_DS2] = LRN_fun.fun_plot_Capacity(PlotEnd);

% high SNR
High_DelayGrid2 = 1/BandWidth_Hz * (1:2:PlotEnd);
beta = High_DelayGrid2 / DelaySpread_s;
F2_DS2 = (-1 + Para_k * beta) .* (log2(Gama/r_tau)-beta/log(2));




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   3 times
DelaySpread_s = DelaySpread_s * 1.5;

% save system parameters
filename = 'Fun2Para.mat';
if exist(filename,'file')
    delete(filename)
end
save(filename)

% generate Intermediate variable
Gama = r_tau * LRN_fun.fun_gen_GamaIndexForFun2;
N_Delay = 2 * BandWidth_Hz * DelaySpread_s;
Para_k       =  N_Delay * N_Doppler /N /M;
Para_alpha = log2(Gama / r_tau);

% save system parameters
filename = 'Fun2Para.mat';
if exist(filename,'file')
    delete(filename)
end
save(filename)

PlotEnd = M/3;

[Low_DelayGrid3, F1_DS3] = LRN_fun.fun_plot_Capacity(PlotEnd);

% high SNR
High_DelayGrid3 = 1/BandWidth_Hz * (1:2:PlotEnd);
beta = High_DelayGrid3 / DelaySpread_s;
F2_DS3 = (-1 + Para_k * beta) .* (log2(Gama/r_tau)-beta/log(2));




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   0.5 times
DelaySpread_s = DelaySpread_s /6;

% save system parameters
filename = 'Fun2Para.mat';
if exist(filename,'file')
    delete(filename)
end
save(filename)

% generate Intermediate variable
Gama = r_tau * LRN_fun.fun_gen_GamaIndexForFun2;
N_Delay = 2 * BandWidth_Hz * DelaySpread_s;
Para_k       =  N_Delay * N_Doppler /N /M;
Para_alpha = log2(Gama / r_tau);

% save system parameters
filename = 'Fun2Para.mat';
if exist(filename,'file')
    delete(filename)
end
save(filename)

PlotEnd = M/10;

[Low_DelayGridHalf, F1_DSHalf] = LRN_fun.fun_plot_Capacity(PlotEnd);

% high SNR
High_DelayGridHalf = 1/BandWidth_Hz * (1:2:PlotEnd);
beta = High_DelayGridHalf / DelaySpread_s;
F2_DSHalf = (-1 + Para_k * beta) .* (log2(Gama/r_tau)-beta/log(2));



%% Plot
figure(1)
P1 = plot(Low_DelayGrid1,F1_DS1,'Color','blue','LineWidth', 1.5, 'LineStyle', '-', 'Marker','x');
hold on
plot(Low_DelayGrid2,F1_DS2, 'Color','blue','LineWidth', 1.5, 'LineStyle', '-', 'Marker','x')
hold on
plot(Low_DelayGrid3,F1_DS3, 'Color','blue','LineWidth', 1.5, 'LineStyle', '-', 'Marker','x')
hold on
plot(Low_DelayGridHalf,F1_DSHalf, 'Color','blue','LineWidth', 1.5, 'LineStyle', '-', 'Marker','x')
hold on
P2 = plot(High_DelayGrid1,F2_DS1,'Color','red','LineWidth', 1.5, 'LineStyle', '-','Marker','o');
hold on
plot(High_DelayGrid2,F2_DS2,'Color','red','LineWidth', 1.5, 'LineStyle', '-','Marker','o')
hold on
plot(High_DelayGrid3,F2_DS3,'Color','red','LineWidth', 1.5, 'LineStyle', '-','Marker','o')
hold on
plot(High_DelayGridHalf,F2_DSHalf,'Color','red','LineWidth', 1.5, 'LineStyle', '-','Marker','o')
hold off

grid on
ylim([0.9, inf])

%%
xlabel('{\itl}_\tau length (s)')
ylabel('Channel capacity measure (bps/Hz)')
set(gca,'FontSize',12);
h = legend([P2,P1],'SNR = 40dB','SNR = 15dB','Box','off','Location','east');
h.FontSize = 14;
