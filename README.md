# OTFS_Overhead_Optimization

This code is for paper: [R. Liu, Y. Huang, D. He, Y. Xu, W. Zhang, “Optimizing Channel Estimation Overhead for OTFS with Prior Channel Statistics,” in Proc. IEEE Wireless Communications and Networking Conference (WCNC), 2021.]

# Abstract
The recently proposed orthogonal time-frequency space (OTFS) modulation scheme is able to provide significant performance gain over orthogonal frequency division multiplexing (OFDM) in high Doppler spread scenarios. Qualified channel estimation in delay-Doppler domain is the prerequisite for such good performance, but it requires a large number of guard and pilot symbols, which degrades channel capacity significantly. In this paper, a prior channel statistics based scheme is proposed to maximize the system ergodic capacity by optimizing the channel estimation overhead while ensuring the high-quality performance of the OTFS over delay-Doppler channels. We first investigate the signal-to-interference-plus-noise ratio (SINR) performance of the proposed scheme and derive the closed-form ergodic capacity of the OTFS system on its basis. And then, the capacity maximization problem is studied given the root-mean-square (RMS) delay spread rather than a request for instantaneous perfect channel state information (CSI). In addition, we
reveal that the additive white Gaussian noise (AWGN) power has an impact on the solution to the optimization problem, so optimization instances are proposed to treat differently according to SNR levels. Extensive simulations are carried out to evaluate the performance of the proposed overhead reduction scheme. Numerical results demonstrate the superiority of the proposed scheme, and the effect of channel characteristics and system parameters are also revealed.


# Main functions
1> ./Fig3.m for Fig. 3.<br>
2> ./Fig4.m for Fig. 4.<br>
3> ./Fig5.m for Fig. 5.<br>
4> ./Fig6.m for Fig. 6.<br>
5> ./Fig7.m for Fig. 7.<br>


# Citation
@INPROCEEDINGS{9417384,
  author={Liu, Runnan and Huang, Yihang and He, Dazhi and Xu, Yin and Zhang, Wenjun},
  booktitle={IEEE Wireless Communications and Networking Conference (WCNC)}, 
  title={Optimizing Channel Estimation Overhead for OTFS with Prior Channel Statistics}, 
  year={2021},
  volume={},
  number={},
  pages={1-6}
}

# Note
The code is provided for the benefit of better understanding the results, and is not meant to be used in production.
