---
title: A Unified Model of Derivative Securities
author: Keith A. Lewis
institution: KALX, LLC
email: kal@kalx.net
classoption: fleqn
abstract: Value, hedge, and manage risk of any portfolio
...

Instruments have _prices_ and _cash flows_.
Stocks have dividends, bonds have coupons, futures have daily margin adjustments.
An European option has a single cash flow at expiration.
Currencies and commodities do not have cash flows.

Let $X_t$ denote the prices and $C_t$ denote the cash flows of all instruments at time $t$.
Prices and cash flows are vectors indexed by the set of instruments.
This model does not incorporate the fact that instruments have bid-ask spreads.
The spread also depends on the amount being transacted and the credit quality of the two
parties involved in the transaction.
Cash flows are determined by the _issuer_ of the instrument and are usually zero.
Transactions often involve cash flows with third parties such as broker commissions
or borrowing costs. These will be ignored, for now.

Every arbitrage-free model is parameterized by a vector-valued martingale $M_t$ and
a positive _deflator_ $D_t$. Prices and cash flows satisfy
$$
	X_t D_t = M_t - \sum_{s\le t}C_s D_s.
$$
For example, $M_t = (r, se^{\sigma B_t - \sigma^2 t/2})$ and $D_t = e^{-\rho t}$ is the
Black-Scholes/Merton model where $B_t$ is standard Brownian motion.
Note if there are no cash flows then this implies $X_t D_t$ is a martingale. 
Multiplying $D_t$ by a non-zero constant does affect the formula
so we can assume $D_0 = 1$.

A consequence of this formula is
$$
X_t D_t = E_t[X_u D_u + \sum_{t\le s < u}C_s D_s]
$$
where $E_t$ is conditional expectation at time $t$ and $u > t$.
Note if $X_t D_t$ goes to zero as $t$ goes to infinity then
$X_0 = E[\sum_{t \ge 0} C_t D_t]$. Price is the expected value
of deflated future cash flows.

The formula follows from
$$
\begin{aligned}
E_t[X_u D_u + \sum_{t\le s < u}C_s D_s] 
&= E_t[(M_u - \sum_{s\le u}C_s D_s) + \sum_{t\le s < u}C_s D_s] \\
&= E_t[M_u - \sum_{s\le t}C_t D_s] \\
&= M_t - \sum_{s\le t}C_s D_s \\
&= X_t D_t \\
\end{aligned}
$$


Market participants _trade_ instruments. Let $\Gamma_t$ be the vector of amounts in
each instrument traded by a participant at time $t$. The initial trade at time $t_0$ involves
$A_{t_0} = -\Gamma_{t_0}\cdot X_{t_0}$ being debited from the participants _account_.
The _value_, or _mark-to-market_ of the position at time $t > t_0$ is
$V_t = \Gamma_{t_0}\cdot (X_t + \sum_{t_0 < s < t} C_s)$
if no further trading occurs between $t_0$ and $t$.

If a stock pays dividend $d$ per share at time $t$ then a cash flow of $dS_t$ in the
native currency occurs.

$\Delta_t = \sum_{s < t} \Gamma_s$

$V_t = (\Delta_t + \Gamma_t)\cdot X_t$.

$A_t = \Delta_t\cdot C_t - \Gamma_t\cdot X_t$.
