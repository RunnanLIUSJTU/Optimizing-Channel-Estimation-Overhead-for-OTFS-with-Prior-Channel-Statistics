function [Delay_sort , Power_sort] = fun_gen_path_WINNER

load Fun1Para
% generate X
X = rand(PathNum,1);

% generate tau and power
Delay = - r_tau * DelaySpread_s * log(X);
PowerInitial = exp(-Delay * (r_tau - 1) / (r_tau*DelaySpread_s));
Power = PowerInitial / sum(PowerInitial);

[Delay_sort,Index_D] = sort(Delay);
[Power_sort,Index_P] = sort(Power,'descend');