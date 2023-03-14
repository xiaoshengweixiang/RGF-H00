# RGF-H00

A code provides simplest Green-Function calculation.
Focus on system has such a form, under tight-binding model.

$$
\begin{equation*}
H=\sum _{i} \epsilon _{i} \ a_{i}^{\dagger } a_{i} +\sum _{i}\left( t_{x} a_{i+x}^{\dagger } a_{i} +t_{y} a_{i+y}^{\dagger } a_{i} +t_{\delta } a_{i+x-y}^{\dagger } a_{i} +h.c.\right)
\end{equation*}
$$

For these systems if we can divide it into columns, each column has hamiltonian $H00$, among columns there is $H01$

$$
\begin{equation*}
H=H00 +H01e^{ik_x} +H01^{\dagger}e^{-ik_x}
\end{equation*}
$$

![1](https://user-images.githubusercontent.com/84439883/224984025-1bcb6d01-4be2-4a33-8649-90721e6471cd.png)



If you provide the correspond $H00$, $H01$, $N$, you can get the band stucture $E(k_x)$ and Transmittance with different fermi-energy $T_{LR}(E_f)$ .
# How to use
Just follow the steps show in example:

1.input correspond $H00$, $H01$, $N$.
N is the width of the system.

2.use bands function to obtain band structure.

3.use transmission function to obtain Transmittance.
# Detail information

Is code don't consider the contracts/leads of the sample, which means the two leads are sample itself.

basic princple
https://arxiv.org/pdf/cond-mat/0210519.pdf

# More calculations

1.This work origins from these basic one.
https://github.com/xiaoshengweixiang/RGF-matlab

2.For Nonequilibrium green function calculation, we needs contracts with different chemical potential to generate electric current.Furthermore, two contracts system and six contracts system have different information.

