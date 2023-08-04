function [OptimalBeta, OptimalResult] = fun_opt_NewtonForFun2(InitialBeta)
load Fun2Para
%% parameters
beta = InitialBeta;
acc = 1e-4;

%% function
while 1
    % F123
    % F1 = fun_gen_F1(Para_k, Para_alpha, SNR_1,Gama, r_tau, beta);
    F2 = fun_gen_F2(Para_k, Para_alpha, SNR_1, Gama, r_tau, beta);
    F3 = fun_gen_F3(Para_k, Para_alpha, SNR_1, Gama, r_tau, beta);
    beta_1 = fun_gen_beta(beta,F2,F3);
    acc_temp = abs(beta-beta_1);
    if acc_temp < acc
        break
    else
        beta = beta_1;
%         acc_temp
    end
end
OptimalBeta = beta;
OptimalResult = fun_gen_F1(Para_k, Para_alpha, SNR_1,Gama, r_tau, beta);

function F1 = fun_gen_F1(Para_k, Para_alpha, SNR_1, Gama, r_tau, beta)
F1 = (1 - Para_k * beta) .* (log2(1+1/SNR_1) - log2(2/SNR_1 + Gama/r_tau*exp(-beta)));

function F2 = fun_gen_F2(Para_k, Para_alpha, SNR_1, Gama, r_tau, beta)
A = log2(1 + 1/SNR_1);
B = 2 / SNR_1;
C = Gama/r_tau;
F2 = -Para_k * (A - log2(B+ C*exp(-beta))) + (-Para_k*beta+1).*C.*exp(-beta)./((B+C*exp(-beta))*log(2));

function F3 = fun_gen_F3(Para_k, Para_alpha, SNR_1, Gama, r_tau, beta)
A = log2(1 + 1/SNR_1);
B = 2 / SNR_1;
C = Gama/r_tau;
F3 = (-(2*Para_k-Para_k*beta+1)*C.*exp(-beta))./((B+C*exp(-beta))*log(2)) + ((-Para_k*beta+1)*C^2.*(exp(-beta)).^2)./((B+C*exp(-beta)).^2*log(2));

function beta_1 = fun_gen_beta(beta,F2,F3)
beta_1 = beta-F2/F3*0.5;