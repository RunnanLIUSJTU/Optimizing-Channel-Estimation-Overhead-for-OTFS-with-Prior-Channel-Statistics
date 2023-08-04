function Gama = fun_gen_gama(DelaySpread_s, r_tau)

NumPath = 20;

% generate X
X = rand(NumPath,1000);

tau = - r_tau * DelaySpread_s * log(X);
P = exp(-tau * (r_tau - 1) / (r_tau*DelaySpread_s));
SumPower = sum(P);
Gama = mean(SumPower);


