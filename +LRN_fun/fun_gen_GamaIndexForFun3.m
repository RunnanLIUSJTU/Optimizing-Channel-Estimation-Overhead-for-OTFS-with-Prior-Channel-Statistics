function GamaIndex = fun_gen_GamaIndexForFun3

load('Fun3Para.mat')

% DelaySpread_s = DelaySpread_s*4;
Gama = r_tau;
N_Delay = 2 * BandWidth_Hz * DelaySpread_s;
Para_k       =  N_Delay * N_Doppler /N /M;
Para_alpha = log2(Gama / r_tau);

% save system parameters
filename = 'Fun3Para.mat';
if exist(filename,'file')
    delete(filename)
end
save(filename)

InitialBeta = 1;
[OptimalBeta, OptimalResult] = LRN_fun.fun_opt_NewtonForFun3(InitialBeta);

Gama = exp(-OptimalBeta *DelaySpread_s / r_tau / DelaySpread_s) * r_tau;

% save system parameters
filename = 'Fun3Para.mat';
if exist(filename,'file')
    delete(filename)
end
save(filename)
InitialBeta = 1;
[OptimalBeta, OptimalResult] = LRN_fun.fun_opt_NewtonForFun3(InitialBeta);

GamaIndex = exp(-OptimalBeta *DelaySpread_s / r_tau / DelaySpread_s);