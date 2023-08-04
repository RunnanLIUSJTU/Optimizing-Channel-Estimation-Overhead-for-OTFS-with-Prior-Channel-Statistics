function [delay_grid, F1] = fun_plot_Capacity (EndIndex)

% load parameters
load('Fun2Para.mat')

% plot
delay_grid = 1/BandWidth_Hz * (1:3:EndIndex);
beta = delay_grid/DelaySpread_s;
F1 = (1 - Para_k * beta) .* (log2(1+1/SNR_1) - log2(2/SNR_1 + Gama/r_tau*exp(-beta)));
