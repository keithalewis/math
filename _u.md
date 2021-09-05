# _u

_Instruments_ have _prices_ $X_t$ and _cash flows_ $C_t$ at _trading times_ $t\in T$.

Assume there is an instrument $R$ with prices $X^R_t = R_t > 0$ and no cash flows $C^R_t = 0$.
We call $D_t = 1/R_t$ a _deflator_ or _numeraire_.

Every arbitrage-free model is specified by a vector-valued martingale $M_t$.
Prices and cash flows satisfy
$$
	X_t D_t = M_t - \sum_{s\le t}C_s D_s.
$$
A consequence is
$$
	X_t D_t = E_t[X_u D_u + \sum_{u > t} C_u D_u]
$$
where $E_t$ is conditional expectation at time $t$.

For example, the Black-Scholes/Merton model specifies $R_t = e^{\rho t}$
and a stock $S$ with $M^S_t = se^{\sigma B_t - \sigma^2 t/2}}$ where $B_t$ is standard Brownian motion.

A _trading strategy_ is a finite set $(\tau_j, \Gamma_j)$ where the $\tau_j$ are
increasing stopping times and $\Gamma_j$ is the number of shares traded at $\tau_j$.
Trades accumulate to a _position_ $\Delta_t = \sum_{\tau_j < t} \Gamma_j = \sum_{s<t} \Gamma_s$
where $\Gamma_s = \Gamma_j$ when $s = \tau_j$.

The _value_, or _mark-to-market_, of a position at time $t$ is $V_t = (\Delta_t + \Gamma_t)\cdot X_$.
The _amounts_ associated with trading are $A_t = \Delta_t\cdot C_t - \Gamma_t\cdot X_t$.
A consequence is
$$
	V_t D_t = E_t[V_u D_u + \sum_{u > t} A_u D_u].
$$
