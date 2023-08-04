function N_D = fun_gen_N_D(M, N, BandWidth_Hz, TransFreq_Hz, MaxSpeed_ms, LightSpeed)

MaxDoppler = TransFreq_Hz * MaxSpeed_ms / LightSpeed;
DopplerResolution = fun_gen_DopplerResolution(M, N, BandWidth_Hz);
N_D = 4 * ceil(MaxDoppler/DopplerResolution);  % the length of N_D is four times of doppler length

function DopplerResolution = fun_gen_DopplerResolution(M, N, BandWidth_Hz)
Ts = 1 / BandWidth_Hz;
Latency = N * M * Ts;
DopplerResolution = 1 / Latency;