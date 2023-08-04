function GamaIndex = fun_gen_GamaIndexForFun4

load('Fun4Para.mat')

% DelaySpread_s = DelaySpread_s*4;
Gama = r_tau;
N_Delay = 2 * BandWidth_Hz * DelaySpread_s;
Para_k       =  N_Delay * N_Doppler /N /M;
Para_alpha = log2(Gama / r_tau);

% save system parameters
filename = 'Fun4Para.mat';
if exist(filename,'file')
    delete(filename)
end
save(filename)

InitialBeta = 1;
[OptimalBeta, OptimalResult] = LRN_fun.fun_opt_NewtonForFun4(InitialBeta);

Gama = exp(-OptimalBeta *DelaySpread_s / r_tau / DelaySpread_s) * r_tau;

% save system parameters
filename = 'Fun4Para.mat';
if exist(filename,'file')
    delete(filename)
end
save(filename)
InitialBeta = 1;
[OptimalBeta, OptimalResult] = LRN_fun.fun_opt_NewtonForFun4(InitialBeta);

GamaIndex = exp(-OptimalBeta *DelaySpread_s / r_tau / DelaySpread_s);