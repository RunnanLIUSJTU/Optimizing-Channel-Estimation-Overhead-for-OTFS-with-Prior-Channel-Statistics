function GamaIndex = fun_gen_GamaIndexForFun2

load('Fun2Para.mat')

% DelaySpread_s = DelaySpread_s*4;
Gama = r_tau;
N_Delay = 2 * BandWidth_Hz * DelaySpread_s;
Para_k       =  N_Delay * N_Doppler /N /M;
Para_alpha = log2(Gama / r_tau);

% %% test
% % plot
% delay_grid = 1/BandWidth_Hz * (1:M/2);
% beta = delay_grid/DelaySpread_s;
% F1 = (1 - Para_k * beta) .* (log2(1+1/SNR_1) - log2(2/SNR_1 + Gama/r_tau*exp(-beta)));
% figure(1)
% plot(beta,F1)

%%
% save system parameters
filename = 'Fun2Para.mat';
if exist(filename,'file')
    delete(filename)
end
save(filename)

InitialBeta = 1;
[OptimalBeta, OptimalResult] = LRN_fun.fun_opt_NewtonForFun2(InitialBeta);

Gama = exp(-OptimalBeta *DelaySpread_s / r_tau / DelaySpread_s) * r_tau;

% save system parameters
filename = 'Fun1Para.mat';
if exist(filename,'file')
    delete(filename)
end
save(filename)
InitialBeta = 1;
[OptimalBeta, OptimalResult] = LRN_fun.fun_opt_NewtonForFun2(InitialBeta);

GamaIndex = exp(-OptimalBeta *DelaySpread_s / r_tau / DelaySpread_s);