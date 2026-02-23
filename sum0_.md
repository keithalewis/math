Instruments $I$ have prices and cash flows at trading times $T$.
Market: prices $X_t$, cash flows $C_t$ taking values in $\RR^I$.

Every arbitrage-free model is paramterized by a $\RR^I$-valued
martingale $(M_t)$ and positive adapted measures $(D_t)$.
$$
	X_t D_s = M_t - \sum_{s\le t} C_s D_s
$$

B-S/M is $M_t = (r, se^{\sigma B_t - \sigma^2 t/2})P$ and $D_t = e^{-\rho t}P$,
where $P$ is Wiener measure on $\Omega = C([0,\infty))$ and 
$B_t(\omega) = \omega(t)$ is standard Brownian motion.
