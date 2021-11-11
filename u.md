---
title: A Simple Model of Derivative Securities
author: Keith A. Lewis
institution: KALX, LLC
email: kal@kalx.net
classoption: fleqn
abstract: Value, hedge, and manage risk of any portfolio
...

\renewcommand\AA{\mathcal{A}}
\renewcommand\DD{\mathcal{D}}
\renewcommand\RR{\mathbf{R}}

Instruments have _prices_ and _cash flows_. Trading instruments result
in cash flows to the _trading account_; you buy and sell at
prevailing prices and receive cash flows associated with
each instrument proportional to your current position.
The mark-to-market of a position and cash flows associated with
trading correspond to the price and cash flows of a synthetic instrument.

A _derivative_ is a contract specifying cash flows. If a trading strategy
replicates the cash flows then the value of the derivative is the cost
of the initial hedging position. Risk management involves measuring
how well a trading strategy replicates cash flows specified by
the contract.

A _money market_ account is assumed to be available for financing trading strategies.
The price of the money market at time $t$ is denoted $R_t$ and has no cash flows.
Let $D_t = 1/R_t$ be the _deflator_. 

## Price and Cash Flow

Given a deflator, every model is specified by a vector-valued _martingale_ $M_t$ indexed by instruments.
Prices $X_t$ and cash flows $C_t$ must satisfy
$$
	X_t D_t = M_t - \sum_{s\le t} C_s D_s
$$
in any arbitrage-free model.
Note if there are no cash flows then this implies the deflated prices, $X_t D_t$, are a martingale. 
In general, $C_t = 0$ except at a discrete set of times.

For example, the Black-Scholes/Merton model has money market $R_t = e^{\rho t}$ and martingale
$S_t = s e^{\sigma B_t - \sigma^2t/2}$ where $B_t$ is standard Brownian motion.

Let $I$ be a set of instruments and $T$ be a (totally ordered) set of trading times.
Assume the standard setup $\langle\Omega,P,(\AA_t)_{t\in T}\rangle$ where
$\Omega$ is the sample space of all possible outcomes, $P$ is a probability
measure on $\Omega$, and $\AA_t$ is an algebra of sets on $\Omega$ indicating the
information available at time $t$.

We use the notation $X\colon\Omega\to\AA$ to indicate $X\colon\Omega\to\RR$
is $\AA$-measurable where $\AA$ is an algebra of sets.
If the algebra is finite then $X$ is $\AA$-measurable if and only if it is
constant on atoms of $\AA$ so $X$ _is_ a function from $\Omega$ to
the atoms of $\AA$.

Let $X_t^i\colon\Omega\to\AA_t$ be the price and
$C_t^i\colon\Omega\to\AA_t$ be the cash flow of instrument $i\in I$ at time $t\in T$.
We also write this as $X_t,C_t\colon\Omega\to\AA_t$ where $X_t$ and $C_t$
are vectors indexed by the set of instruments when that is understood.

A consequence of the formula $X_t D_t = M_t + \sum_{s\le t} C_s D_s$ is
$$
X_t D_t = E_t[X_u D_u + \sum_{t\le s < u}C_s D_s]
$$
where $E_t$ is conditional expectation at time $t$ and $u > t$.
Note if $X_t D_t$ goes to zero as $t$ goes to infinity then
$X_0 = E[\sum_{t \ge 0} C_t D_t]$. In this case price is the expected value
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

## Value and Account

Market participants _trade_ instruments. We assume an initial position $M_0$
in the money market instrument. A _trading strategy_ is a finite sequence
of strictly increasing (stopping) times $\tau_j$ and vector-valued random variables
$\Gamma_j\colon\Omega\to\AA_{\tau_j}$ of amounts amounts purchased in each instrument at these times.
Trades accrue to a _position_ $\Delta_t = \sum_{s < t} \Gamma_s$,
where $\Gamma_s = \Gamma_j$ if $s = \tau_j$ and is zero otherwise.
The trades show up in the trade _account_ as cash flows
$$
A_t = \Delta_t\cdot C_t - \Gamma_t\cdot X_t.
$$
You receive all cash flows in proportion to your existing position
and pay for the trades just executed.
Let
$$
V_t = (\Delta_t + \Gamma_t)\cdot X_t
$$
be the _value_, or _marked-to-market_, of the strategy at time $t$.
It is the amount in terms of the money market instrument of unwinding
the current position and trades just executed at prevailing prices.

__Lemma__. _Using the definitions above_
$$
V_t D_t = E_t[V_u D_u + \sum_{t\le s < u}A_s D_s].
$$
Note how $V_t$ and $A_t$ play the role of price and cash flow respectively.
Trading strategies create synthetic market instruments.

__Proof__. If $u > t$ is sufficiently small then
$Δ_t + Γ_t = Δ_u$ is $\AA_t$-measurable.
Since $X_t D_t = E_t[(X_u + C_u) D_u]$ we have
$$
\begin{aligned}
	V_t D_t &= (Δ_t + Γ_t)\cdot X_t D_t\\
	        &= Δ_u\cdot X_t D_t\\
	        &= Δ_u\cdot E_t[(X_u + C_u) D_u]\\
	        &= E_t[Δ_u\cdot(X_u + C_u) D_u]\\
			&= E_t[(Δ_u\cdot X_u + Δ_u\cdot C_u) D_u]\\
	        &= E_t[(Δ_u\cdot X_u + Γ_u\cdot X_u + A_u) D_u] \\
	        &= E_t[(V_u + A_u)D_u],\\
\end{aligned}
$$
where we use $Δ_u\cdot C_u =  Γ_u\cdot X_u + A_u$.
The displayed formula above follows by induction. $\blacksquare$

## Recap

A model is specified by a deflator $D_t$ and a martingale $M_t$.
The reciprocal of the deflator $R_t = 1/D_t$ is the money market insturment and has no cash flows.
Prices $X_t$ and cash flows $C_t$ under the model satisfy $X_t D_t = M_t - \sum_{s\le t} C_s D_s$.
A consequence is
$$
X_t D_t = E_t[X_u D_u + \sum_{t\le s < u}C_s D_s].
$$
A trading strategy $(\tau_j, \Gamma_j)$ has value $V_t = (\Delta_t + \Gamma_t)\cdot X_t$
and account cash flows $A_t = \Delta_t\cdot C_t - \Gamma_t\cdot X_t$ where
$\Delta_t = \sum_{\tau_j < t} \Gamma_j = \sum_{s < t} \Gamma_s$.
A consequence is
$$
V_t D_t = E_t[V_u D_u + \sum_{t\le s < u}A_s D_s].
$$

## Arbitrage

_Arbitrage_ exists (given $D_t$ and $M_t$) if there is a finite trading strategy $(\tau_j, \Gamma_j)$
with $A_{\tau_0} > 0$, $A_t \ge 0$ for $t > \tau_0$, and $\sum \Gamma_j = 0$;
you make money on the initial trade and never lose money after that.
The position must eventually be _closed out_, $\sum_j \Gamma_j = 0$.

For a trading strategy that closes out
$V_{τ_0} D_{τ_0} = E_{τ_0}[\sum_{t > τ_{0}}{A_{t}D_{t}] \ge 0}$. 
Since $V_{τ_0} = Γ_{τ_0} \cdot X_{τ_0}$, $A_{τ_0} = - Γ_{τ_0} \cdot X_{τ_0}$
and $D_{τ_0} > 0$ we have $A_{τ_0} \le 0$. This shows no arbitrage can exist
for models where prices and cash flows satisfy $X_t D_t = M_t - \sum_{s\le t}C_s D_s$.

## Hedging

Given cash flows $(A_t)_{t\in T}$ does there exist a trading strategy $(\tau_j, \Gamma_j)$
producing such $A_t$? Assume $T = \{t_j\}$ with $t_j$ increasing.
Using $V_0 = (\Delta_0 + \Gamma_0)\cdot X_0$ and $V_0 = E[\sum_{t\ge 0}A_t D_t]$
we have $\Delta_0 + \Gamma_0 = \DD_{X_0} E[\sum_{t\ge 0}A_t D_t]$, where
$\DD_X$ denotes the Fréchet derivative with respect to $X$.
Similarly, $\Delta_j + \Gamma_j = \DD_{X_j} E_{t_j}[\sum_{t\ge t_j}A_t D_t]$.
Since $\Delta_0 = 0$ this gives necessary conditions for determining $\Gamma_j$.
The value of a derivative is the cost of setting up the initial hedge.
$\Delta$ is the derivative of value with respect to underlying and
$\Gamma$ the amount by which the delta hedge must be changed.

These are not sufficient conditions.
By definition we always have $V_j = (\Delta_j + \Gamma_j)\cdot X_j$.
The position will accrue to $(\Delta_j + \Gamma_j)\cdot X_{j+1}$ at time $t_{j+1}$
but there is no guarantee this will equal $V_{j+1}$.
The difference is the _profit and loss_ for the
hedge over the period from $t_j$ to $t_{j + 1}$. Since $V_t$ is a function of $X_t$ and $D_t$
we can write a Taylor expansion for $\Delta V_t = V_{t + \Delta t} - V_t$ in terms of
powers of $\Delta X_t$ and $\Delta D_t$. Risk managers use the higher order derivatives
to "explain" profit and loss. Traders have to deal with the fact that the imperfect
hedge throws off their replication. Quants have not yet devised a coherent theory
to help traders deal with the various heuristics they have invented to account for this.

## Instruments

We now apply the model to various instruments.

### Futures

A _futures_ contract is specified by an underlying
and an expiration. If $S_t$ is the price of the underlying at time $t$ and $T$ is
the expiration of the futures then the futures _quote_ $\Phi_T$ at $T$ is $S_T$.
Prior to that the futures quote $\Phi_t$, $t < T$, is determined by the exchange
issuing the futures contract.

When trading on an exchange an initial margin must be provided.
The exchange specifies _margin adjustment_ times $t_j$
that cause cash flows in margin accounts $C_{t_j} = \Phi_{t_j} - \Phi_{t_{j-1}}$.
The price of a futures is always zero so $0 = E_{t_{j-1}}[C_{t_j}D_{t_j}]$.
Assuming $D_{t_j}$ is $\AA_{t_{j-1}}$-measurable then
$\Phi_{t_{j-1}} = E_{t_{j-1}}[\Phi_{t_j}]$. This provides justification for
assuming futures quotes are a martingale, $\Phi_t = E_t[S_T]$, $t\le T$.

One might think the problem of modeling instrument prices can be solved by
specifying the price at some future time $T$ and let
$S_t D_t = E_t[S_T] - \sum_{t < s \le T} C_s D_s$. This only moves the
question of price dynamics to computing the conditional expectations $E_t$.
In order to do that we need to specify the filtration $\(\AA_t)\) however
this is a highly underdetermined problem, albiet worthwhile to consider.

### Zero Coupon Bonds

A _zero coupon bond_ $D(t)$ has cash flow 1 at $t$. Its value at time zero is
is $V_0 = E[1 D_t]$. Its value at time $s \le t$, $D_s(t)$, satifies
$D_s(t) D_s = E_s[1 D_t]$ so 
$$
	D_s(t) = E_s[D_t]/D_s.
$$
We write $D(t)$ for $D_0(t)$ to usefully confuse it with the name of the instrument.

### Forward Rate Agreements

A _forward rate agreement_ has two cash flows: $C_t = -1$ at the _effective date_ $t$
and $C_u = 1 + f\delta(t,u)$ at the termination date $u$, where $f$ is the _rate_ and $\delta(t,u)$ is
the _day count fraction_. The day count fraction uses a _day count basis_ to convert
an interval of time into a number approximately equal to $u - t$ in years.
For example the _Actual/360_ day count basis is the difference in days from $t$ to $u$
divided by 360.

The _par forward rate_ is the rate that makes the initial value zero
$0 = E[-1 D_t + (1 + f\delta)D_u]$. The par forward rate at time $s\le t$, $F_s^\delta(t,u)$, satisfies
$$
	0 = E_s[-1 D_t + (1 + F_s^\delta(t,u)) D_u]
$$
so $F_s^\delta(t,u) = (E_s[D_t]/E_s[D_u] - 1)/\delta(t,u) = (D_s(t)/D_s(u) - 1)/\delta(t,u)$.

### Swaps

Fixed leg... portfolio of zero coupon bonds.

### Stock Dividends

Some stocks pay dividends that are determined by the issuer.
A _cash dividend_ is a fixed amount $d_u$ paid at time $u$. 
The stock price satisfies $S_t D_t = M_t - \sum_{t_i\le t} d_i D_{t_i}$ so
$$
	E[S_t] = 
$$
Let $f_j = E[S_{t_j} D_{t_j}]$.

A _proportional dividend_ pays $\delta_u S_u$ at time $u$ where $S_u$ is the
stock price at time $u$. Short term dividends are usually announced several months
in advance. Longer term dividends are unknown but it is reasonable to assume
the dividends will be larger if the stock increases in price and smaller if it decreases.

A _hybrid model_ specifies both proportional and discrete dividends; the stock
pays $\delta_u S_u + d_u$ at time $u$. A schedule can be specified to weight
short term cash dividends higher than proportional dividends and weight
long term proportional dividends higher than cash dividends.

The stock price satisfies
$$
	S_j D_j = M_j - \sum_{i\le j} (\delta_i S_i + d_i)D_i
$$
$$
	E[S_j D_j] = M_0 - \sum_{i\le j} \delta_i E[S_i D_i] + d_i E[D_i]
$$
$f_t = E[S_t D_t]$, $f_j = f_{t_j}$, $D(j) = D_{t_j}$
$$
	f_j = M_0 - \sum_{i\le j} \delta_i f_i + d_i D(i)
$$
$$
	f_j - f_{j-1} = - \delta_j f_j - d_j D(j)
$$
$$
	(1 + \delta_j)f_j = f_{j-1} - d_j D(j)
$$
$$
	f_j = (f_{j-1} - d_j D(j))/(1 + \delta_j)
$$
$$
	f_j = f_{j-1}/(1 + \delta_j) - d_j D(j)/(1 + \delta_j)
$$
$$
	f_j = \frac{f_{j-1}}{(1 + \delta_j)} - \frac{d_j D(j)}{(1 + \delta_j)}
$$
$$
	f_j = \frac{
		\frac{f_{j-2}}{(1 + \delta_{j-1})} - \frac{d_{j-1} D({j-1})}{(1 + \delta_{j-1})}
		}{(1 + \delta_j)} - \frac{d_j D(j)}{(1 + \delta_j)}
$$
$$
	f_j = \frac{f_{j-2}}{(1 + \delta_{j-1})(1 + \delta_j)}
		- \frac{d_{j-1} D({j-1})}{(1 + \delta_{j-1})(1 + \delta_j)}
		- \frac{d_j D(j)}{(1 + \delta_j)}
$$
$$
	f_j = \frac{f_0}{\Pi_{i=0}^j (1 + \delta_i)} - \sum_{i=0}^j \frac{d_i D(i)}{\Pi_{k=i}^j (1 + \delta_k)}
$$

## Remarks

Repurchase agreements determine the deflator.

Stocks have dividends, bonds have coupons, futures have daily margin adjustments.
An European option has a single cash flow at expiration.
Currencies and commodities do not have cash flows.

This model does not incorporate bid-ask spreads.
The spread also depends on the amount being transacted and the credit quality of the two
parties involved in the transaction.
Cash flows are determined by the _issuer_ of the instrument and are usually zero.
Transactions often involve cash flows with third parties such as broker commissions
or borrowing costs. These considerations will be ignored, for now.

Conditional expectation $E[X|\AA]$ is the Radon-Nykodym derivative of $(XP)|_\AA$ with respect to $P$.

Margin on futures and interest paid on those.
