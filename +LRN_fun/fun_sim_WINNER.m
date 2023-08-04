function C = fun_sim_WINNER(C, Beta)
load Fun1Para
for Num = 1 : TestNum
    [Delay , Power] = LRN_fun.fun_gen_path_WINNER;
    FlagEage = Beta * DelaySpread_s;
    Index = find(Delay > FlagEage);
    % initialization
    PowerInterf = 0;
    if ~isempty(Index)
        PowerInterf = sum(Power(Index));
    end
    % set SINR
    SINR = (1 - 1/SNR_1 - PowerInterf)/(2/SNR_1 + PowerInterf);
    % channel capacity
    C_Num = (1-Para_k*Beta) * log2(1+SINR);
    % record channel capacity
    C = [C, C_Num];
    Num / TestNum
end


