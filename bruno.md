

Market: $\Omega = [L,H]$, $x = (1, s)$, $X = (R, S)$ where $S(\omega) =  \omega$, $\omega\in\Omega$.

Arbitrage-free if there exists positive $D\in ba([L,H)$ with $(1,s) = \int_\Omega (R,S)\,dD$.

By Carathéodory's theorem $(1,s)$ is a linear combination of extreme points
$(1,s) = (R,L) d_L + (R,H)d_H$, $d_L,d_H>0$. Since $1 = Rd_L + Rd_H$ we
have $s = (1 - t)L/R + tH/R$ for some $0 < t < 1$ so $L < sR < H$.

Call option $C_K$ pays $\max\{S - K, 0\}$ at expiration $t = 1$.

Value at $t = 0$ is $V_0 = \max{L - K, 0}d_L + \max\{H - K, 0}d_H = (H - K)d_H$

$\Gamma_0 = D_{X_0} V_0 = \int_\Omega 1(S > K)\,dD$.

