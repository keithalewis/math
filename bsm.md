---
title: Black-Scholes/Merton
author: Keith A. Lewis
institute: KALX, LLC
fleqn: true
classoption: fleqn
abstract: Valuation formula.
...

\newcommand{\RR}{\boldsymbol{R}}
\newcommand{\Var}{\operatorname{Var}}
\newcommand{\Cov}{\operatorname{Cov}}
\renewcommand{\o}[1]{\bar{#1}}

The theory developed by Fischer Black, Myron Scholes, and Robert Merton III is the foundation
of modern mathematical finance. They showed an option can be replicated by executing a
dynamic hedge using a money market account and the underlying specified in the option payoff.
The value of the option is the cost of setting up the initial hedge.
Their theory relies heavily on [Ito](ito.html) processes.

Assume a money market account with price $R_t$ at time $t$ satisfying $dR = Rρ\,dt$, $R_0 = 1$.
For constant $ρ$ the solution is $R_t = e^{ρ t}$.
Assume a stock with price $S_t$ at time $t$ paying no dividends satisfying $dS = S\mu\,dt + Sσ\,dB$, $S_0 = s$.
For constant $\mu$ and $σ$ the solution is $S_t = se^{\mu t}e^{σ B_t - σ^2 t/2}$.

At time $t$ assume amount $M_t$ is held in the money market account and $N_t$ shares are held in the stock
where $M_t$ and $N_t$ are Ito diffusions.
The evolution of the portfolio value $V = MR + NS$ is
$$
\begin{aligned}
	dV_t &= d(M_t R_t + N_t S_t) \\
	&= (M_t dR_t + R_t dM_t + dM_t dR_t)
		+ (N_t dS_t + S_t dN_t + dN_t dS_t) \\
	&= M_t dR_t + dM_t(R_t + dR_t) 
		+ N_t dS_t + dN_t(S_t + dS_t) \\
\end{aligned}
$$

## Self-financing condition

The cost of re-hedging the position $(M,N)$ at $t$ to $(M + dM, N + dN)$ at the prices
prevailing at $t + dt$ is $dM(R + dR) + dN(S + dS)$. 
The _self-financing_ condition is $0 = dM(R + dR) + dN(S + dS)$.
For a self-financing strategy $(M,N)$
$$
	dV = M\,dR + N\,dS = (MRρ + NS\mu)\,dt + {\color{blue} NSσ\,dB}.
$$

The sum and product of Ito diffusions are Ito diffusions so
$V_t$ is an Ito diffusion and $V_t = v(t, R_t, S_t)$ for some function
$v\colon[0,\infty)\times\RR^2\to\RR$. Using the Ito formula and $(dR)^2 = 0$. We have
$$
\begin{aligned}
	dV_t &= v_t\,dt + v_r\,dR + v_s\,dS + \frac{1}{2} v_{ss}\,(dS)^2 \\
	&= v_t\,dt + v_r\,Rρ\,dt + v_s\,(S\mu\,dt + Sσ\,dB) + \frac{1}{2} v_{ss}S^2σ^2\,dt \\
	&= (v_t + v_r Rρ + v_s S\mu + \frac{1}{2} v_{ss}S^2σ^2)\,dt
		+ {\color{blue} v_s Sσ\,dB} \\
\end{aligned}
$$

## Black-Scholes/Merton PDE

Equating $dt$ terms we see
$$
	MRρ + NS\mu = v_t + v_r Rρ + v_s S\mu + \frac{1}{2} v_{ss}S^2σ^2.
$$
Since $V = MR + NS$ we have
$$
	(V - NS)ρ + NS\mu = v_t + v_r Rρ + v_s S\mu + \frac{1}{2} v_{ss}S^2σ^2.
$$
Equating ${\color{blue} dB}$ terms we have $N = v_s$ so
$$
	(V - v_s S)ρ = v_t + v_r Rρ + \frac{1}{2} v_{ss}S^2σ^2.
$$

since the $NS\mu = V_s S\mu$ terms, remarkably, cancel. The PDE does not
involve $\mu$.  This key fact was one of the reasons Scholes and Merton
were awarded a Nobel prize.  They were the first to show valuing an option
on a stock does not require estimating the growth rate of the stock.

Note the B-S/M PDE is a _necessary_ condition of a self-financing strategy but is it also _sufficient_?

Note that the PDE above involves a $v_r Rρ$ term. This term does
not appear in the original Black and Scholes paper [@BlaSch73]. It does appear in
Merton's original treatment [@Mer73].  He also assumes the bond has a non-zero diffusion
term to derive a PDE and then takes a limit as the diffusion coefficient
tends to zero. His later treatment [@Mer75] showed this was not necessary.

__Exercise__. _Define $\o{v}(t, s) = v(t, R_t, s)$ where $R_t = e^{ρ t}$.
Show_
$$
	(\o{V} - \o{v}_s S)ρ = \o{v}_t + \frac{1}{2} \o{v}_{ss}S^2σ^2.
$$
_where $\o{V}_t = \o{v}(t, S_t)$_.

_Hint_: What is the partial derivative of $\o{v}$ with respect to $t$?

<details>
<summary>Solution</summary>
$\o{v}_t = v_t + v_r \partial R_t/\partial t = v_t + v_r R_t ρ$.
</details>

Note that when $ρ = 0$ we have $0 = \o{v}_t + \frac{1}{2} \o{v}_{ss}S^2σ^2$.

### Martingale Method

Replacing $\mu$ by $ρ$ in the stock price process is related to _change of measure_
and involves [_Girsanov's Theorem_](https://en.wikipedia.org/wiki/Girsanov_theorem).
A fundamental problem is specifying models that are _arbitrage-free_.
A clever trader will find ways to book a "profit" given a model that is not arbitrage-free.

A simple way to do this is to specify a model of stock price where $S_t/R_t$ is a martingale.

__Exercise__. _Show $S/R$ is a martingale if and only if $dS/S = dR/R + σ\,dB$_.

_Hint_. Let $dS/S = \mu\,dt + σ\,dB$. Show $d(S/R) = dS/R - (S/R)\,dR/R$ since $(dR)^2 = 0$.
Use this to show $d(S/R) = (S/R)((\mu - ρ)\,dt + σ\,dB)$.

<details>
<summary>Solution</summary>
Since $(dR)^2 = 0$, $d(1/R) = -1/R^2\,dR$ so $d(S/R) = dS/R + S\,d(1/R) = dS/R + S(-1/R^2\,dR)
= dS/R - (S/R)dR/R = S(μ dt + σ dB)/R - (S/R)dR/R = (S/R)((\mu - ρ)\,dt + σ\,dB)$.
</details>

__Exercise__. _If $S/R$ is a martingale, V = MR + NS$, and (M, N)$ is self-financing 
then $V/R$ is a martingale_.

_Hint_. For any Ito process $V$ we have $d(V/R) = dV/R - (V/R)\,dR/R$ when $(dR)^2 = 0$.
Substitute $dV = M\,dR + N\,dS$ and $V/R = M + NS/R$ to show
$d(V/R) = -NS\,dR/R + (N/R)\,dS$. Use $dS = S\,dR/R + Sσ\,dB$.

<details>
<summary>Solution</summary>
$$
\begin{aligned}
d(V/R) &= (M\,dR + N\,dS)/R - (M + NS/R)\,dR/R \\
	&= (M - M - NS/R)\,dR/R + (N/R)\,dS \\
	&= - NS/R\,dR/R + (N/R)\,dS \\
	&= - NS/R\,dR/R + (N/R)S(dR/R + Sσ\,dB) \\
	&= (N/R)Sσ\,dB \\
\end{aligned}
$$
100% on the next homework for the first person to come up with a simpler proof.
</details>

There is no need to solve a PDE when using the martigale method.

## Black-Scholes/Merton formula

If an option pays $\nu(S_T)$ at expiration $T$ and there is a self-financing strategy
$(M_t, N_t)$ with $V_T = \nu(S_T)$
then the value of the option is the cost of the initial hedge, $V_0$.
Since $V_t/R_t$ is a martingale the cost is $V_0 = E[\nu(S_T)/R_T]$.
This is a subtle but important point. The option value can be computed without
specifying the details of the hedging process. However, it assumes a perfect
hedge exists. In reality, no hedge is perfect and _risk management_ involves measuring
how imperfect it is. Given a money market account it is trivial to construct
a self-financing hedge, but $V_T$ is almost never exactly equal to $\nu(S_T)$.

In the B-S/M model with constant rate and volatility the stock price
$S_t = se^{ρ t}e^{σ B_t - σ^2 t/2}$ is log-normal.
As Fischer Black noted, mathematical formulas for option valuation
become simpler when working with _forward_
values instead of _spot_ values since the interest rate disappears.

Let $F_t = fe^{σ B_t - σ^2 t/2}$ where $f = se^{ρ t}$ is the forward value of the stock.
We can replace $σ B_t$ by any random variable with mean zero and variance $σ^2 t$.
Let $X$ have mean zero and variance one and set $s = σ\sqrt{t}$
We can value any option with expiration price $F = fe^{sX - κ(s)}$,
where $κ^X(s) = \log E[e^{sX}]$ is the _cumulant_ of $X$, 

__Exercise__. _Show $E[F] = f$ and $\Var(\log F) = s^2$_.

<details>
<summary>Solution</summary>
$E[F] = E[fe^{sX - κ(s)}] = fe^{-κ(s)}E[e^{sX}] = f$.
$\Var(\log F) = \Var(\log f + sX - κ(s)) = s^2\Var(X) = s^2$.
</details>

__Exercise__. _If $F$ is a positive random variable then there exists a random variable $X$
having mean zero and variance one with $F = fe^{sX - κ(s)}$_.

<details>
<summary>Solution</summary>
Since $F$ is positive $\log F = μ + s X$ where $X$ has mean zero and variance one.
We have $f = E[F] = E[e^{μ + s X}] = e^μ e^{κ(s)}$ so $e^μ = fe^{-κ(s)}$.
</details>

__Exercise__. _Show $κ^X(s) = s^2/2$ if $X$ is standard normal_.

<details>
<summary>Solution</summary>
This follows from $E[e^N] = e^{E[N] + \Var(N)/2}$ if $N$ is normal
and $\Var(sX) = s^2$.
</details>

If $h(F)$ is the payoff of an option in shares of $F$ then $Fh(F)$ is the
dollar amount of the payoff when converted at price $F$. It is trivial
that $E[Fh(F)] = E[F] E[(F/E[F])h(F)]$. We can define _share measure_ 
$E_*$ by $E_*[Y] = E[(F/E[F])Y]$. Since $F/E[F] > 0$ and $E[F/E[F]] = 1$ this is a probability
measure.

If $F = fe^{sX - κ(s)}$ then $F/E[F] = e^{sX - κ(s)}$ so share measure
is $E_*[Y] = E[e^{sX - κ(s)}Y]$ and we write $E_s$ for $E_*$.
This is also referred to as the _forward measure_ or the _Esscher transform_.

__Exercise__. _If $X$ is standard normal show $E_s[g(X)] = E[g(X + s)]$_.

_Hint_: $E[e^N g(M)] = E[e^N]E[g(M + \Cov(N, M))]$ if $N$ and $M$ are jointly normal.

<details>
<summary>Solution</summary>
Let $N = sX - κ(s)$ and $M = X$. 
</details>

### Value

A put with strike $k$ pays $\max\{k - F,0\} = (k - F)^+$ at expiration.
Its forward value $p$ is
$$
\begin{aligned}
	p &= E[\max\{k - F, 0\}] \\
		&= E[(k - F)1(F\le k)] \\
		&= k P(F\le k) - E[F1(F\le k)] \\
		&= k P(F\le k) - fP_s(F\le k) \\
\end{aligned}
$$
_Moneyness_ $x$ is defined by $F = k$ if and only if $X = x$.
The value of a put option in terms of the distribution for $X$ is
$$
	p = kP(X\le x) - fP_s(X\le x).
$$

__Exercise__. _Show moneyness $x = x(k) = (\log(k/f) + κ(s))/s$_.

_Hint_. Solve $k = fe^{sx - κ(s)}$ for $x$.

__Exercise__. _Show $F\le k$ if and only if $X\le x$_.

_Hint_: $dx/dk = 1/ks > 0$.

__Exercise__. _If $X$ is standard normal show $x = \log(k/f)/s + s/2$_.

Black and Scholes defined $d_2 = \log(f/k)/s - s/2$ where $s = σ\sqrt{t}$.

__Exercise__. _Show $-d_2 = x$_.

__Exercise__. _If $X$ is standard normal show $P_s(X\le x) = P(X\le x - s)$_.

Black and Scholes defined $d_1 = \log(f/k)/s + s/2$ where $s = σ\sqrt{t}$.

__Exercise__. _Show $-d_1 = x - s$_.

This shows the forward put value is $p = k\Phi(-d_2) - f\Phi(-d_1)$ where
$\Phi$ is the standard normal cumulative distribution.

Since $\max\{F - k, 0\} - \max\{k - F, 0\} = F - k$ we have $c - p = f - k$
where $c = E[\max\{F - k, 0\}]$ is the call value.

__Exercise__. _Show the forward value of a call is $c = fP_s(F\ge k) - kP(F\ge k)$_.

### Delta

_Delta_ is the derivative of option value with respect to the forward.
The delta of a put option is
$$
	\begin{aligned}
		\partial_f p &= \partial_ f E[\max\{k - F, 0\}] \\
			&= E[-1(F \le k)\partial_f F] \\
			&= -E[1(F \le k)e^{sX - κ(s)}] \\
			&= -P_s(F \le k) \\
	\end{aligned}
$$
Where $\partial_f p = \partial p/\partial f$ is the partial derivative of
put value with respect to forward.

__Exercise__. _Show $\partial_ f E[\max\{k - F, 0\}] = -E[1(F \le k)]\partial_f F]$_.

_Hint_ Show $d(\max\{k - x, 0\})/dx = -1(x\le k)$ and $dF/df = e^{sX - κ(s)}$.

__Exercise__. _If $X$ is standard normal then $\partial_f v = -\Phi(-d_1)$_.

The derivative of $p = k\Phi(-d_2) - f\Phi(-d_1)$ with respect to $f$ is
$\partial_f v = k\nu(-d_2)\partial_f(-d_2) - f\nu(-d_1)/\partial_f(-d_1) - \Phi(-d_1)$
where $\nu = \Phi'$ is the standard normal density.
The calculation showing the first two terms on the right hand side cancel is not trivial.
Our more general approach avoids this.

Taking the derivative of $c - p = f - k$ with respect to $f$ we have
$\partial_f c - \partial_f p = 1$ so call delta equals
put delta plus one.

### Gamma

_Gamma_ is the second derivative of option value with respect to the forward.

$$
\begin{aligned}
	\partial_f^2 p &= -\partial_f P_s(F \le k) \\
	&= -\partial_f P_s(X \le x) \\
	&= -\partial_m P_s(X \le x)\partial_f x \\
	&= -\partial_m P_s(X \le x)/\partial_x f \\
	&= \partial_m P_s(X \le x)/f s\\
\end{aligned}
$$

### Vega

_Vega_ is the derivative of option value with respect to volatility.
The vega of a put option is
$$
\begin{aligned}
	\partial_s p &= \partial_s E[\max\{k - F, 0\}] \\
		&= E[-1(F \le k)\partial_s F] \\
		&= -E[1(F \le k)F(X - κ'(s))] \\
		&= -\partial_s P_s(X \le x)f \\
\end{aligned}
$$

__Exercise__. _Show $\partial_s P_s(X\le x) = E[1(X \le x)F(X - κ'(s))]/f$_.

<details>
<summary>Solution</summary>
$$
\begin{aligned}
\partial_s P_s(X\le x) &= \partial_s E[1(X\le x) e^{sX - κ(s)}] \\
	&= E[1(X\le x) e^{sX - κ(s)}(X - κ'(s))] \\
	&= E[1(X\le x) fe^{sX - κ(s)}(X - κ'(s))]/f \\
	&= E[1(X\le x) F(X - κ'(s)]/f \\
\end{aligned}
$$
</details>

### Theta

_Theta_ is the derivative of option value with respect to time. Using $s = σ\sqrt{t}$
the theta of a put option is
$$
\begin{aligned}
	\partial_t p &= \partial_s p\,\partial_t s \\
		&= \partial_s p\,σ/2\sqrt{t} \\
		&= -\partial_s P_s(X \le x)fσ/2\sqrt{t}. \\
\end{aligned}
$$

Traders think in terms of _time decay_ of the option value so increasing time
means shorter time to expiration and use the negative of this value, and sometimes
divide that by 250 (business days per year) to approximate 1 day time decay.

### Kappa

_Kappa_ is the derivative of option value with respect to strike
$$
	\partial_k p = \partial_k E[\max\{k - F\}, 0\}] = P(F\le k),
$$
which is the cumulative distribution of the underlying.
This implies the distribution of the underlying can be inferred from option prices [@BreLin].

Note value and all greeks can be expressed in terms of the share distribution
function $P_s(X\le x)$ and its derivatives with respect to $x$ and $s$.

### Implied Volatility

Market traded options have a _price_ based on strike and expiration.
Given a strike and expiration the Black-Sholes/Merton formula produces a _value_
as a function of volatility. The volatility matching the market price
is called the (Black-Scholes) _implied volatility_.
It is used as a proxy for the price under the convention that the B-S/M
formula is used for computation.

The implied volatility at a fixed expiration as a function of strike is
the _volatility curve_ for that expiration. If the B-S/M model of stock price dynamics
were correct the volatility curve would be constant. It is a market fact
that this is not the case.

## Discrete time

Continuous time trading is physically impossible.
The speed of light is $3\times 10^8$ meters per second so it
travels $0.3$ meters, or approximately 1 foot, in a nanosecond.
Electrons traveling over a wire are are much slower.
In reality trades occur at a finite number of discrete times.

The B-S/M model assumes continuous time trading and stock price is
geometric Brownian motion. These assumptions allow a mathematical
proof that options can be perfectly hedged. In practice traders put on
a hedge for some period of time before adjusting it based on market movements.
One measure of _risk_ is the difference between the actual value of the hedge
at the end of the period and the theoretical model value.

For simplicity we assume zero funding rate so $R_t = 1$ 
and $S_t$ is the price of a stock at time $t$.
The market model is $X_t = (R_t, S_t)$, $C_t = 0$, and the position
is $\Delta_t = (M_t, N_t)$. 

A European option paying $\nu(S_T)$ at expiration $T$ has _model value_
$\o{V}_t = E_t[\nu(S_T)]$, for $t\le T$.
Let $\o{v}(t, s) = E[\o{V}_t\mid S_t = s]$.
Note $\o{V}_t$ is a stochastic process and $\o{v}(t,s)$ is a function.
The risk involved with
discrete time hedging over the interval $[t, t + \Delta t]$
is the difference $V_{t + \Delta t} - \o{V}_{t + \Delta t}$.

Let $\o{v}(S, T) = E[\nu(S e^{σ B_T - σ^2T/2})]$.
Note $\o{V}$ is a stochastic process and $\o{v}$ is a function.

__Exercise__. _Show $E_t[\nu(S_T)\mid S_t = S] = \o{v}(S, T - t)$_.

<details>
<summary>Solution</summary>
$$
\begin{aligned}
E_t[\nu(S_T)\mid S_t = S] &= E_t[\nu(se^{σ B_T - σ^2 T/2})\mid S_t = S] \\
	&= E_t[\nu(se^{σ (B_T - B_t + B_t) - σ^2(T - t + t)/2})\mid S_t = S] \\
	&= E_t[\nu(se^{σ B_t - σ^2t/2}e^{σ (B_T - B_t) - σ^2(T - t)/2})\mid S_t = S] \\
	&= E_t[\nu(S_te^{σ (B_T - B_t) - σ^2(T - t )/2})\mid S_t = S] \\
	&= E_t[\nu(Se^{σ (B_T - B_t) - σ^2(T - t)/2})] \\
	&= E_0[\nu(Se^{σ B_{T - t} - σ^2(T - t)/2})] \\
	&= \o{v}(S, T - t) \\
\end{aligned}
$$
</details>

Note $\partial_t E_t[\nu(S_T)\mid S_t = S] = -\partial_t \o{v}(S, T - t)$.

Suppose you are given $V_0$ in cash and it is now your job to replicate
the option payoff.  At each time $t_j$ you can use the money market
account to put on a position of $N_j$ shares in the stock.  The value
of your hedge at time $t_j$ is $V_j = M_j + N_j S_j$.  Your initial
position $N_0$ in the stock will be deducted from $V_0$ and result in
a money market position $M_0 = V_0 - N_0 S_0$.

At time $t_j$, $0 < j < n$, you change the stock position from $N_{j-1}$ to $N_j$.
Using the money market account to finance this results in $M_j = M_{j-1} - (N_j - N_{j-1})S_j$;
the cost of the shares purchased are deducted based on the prevailing stock price.

At time $t_n = T$ the position in the stock is closed out so the
accumulated shares $N_{n-1}$ are sold and the money market position becomes
$M_n = M_{n-1} + N_{n-1}S_n$.

A successful hedge would result in $V_T = V_n = M_n R_n = \nu(S_T)$.
How should you choose $N_0,\ldots,N_{n-1}$?

The progress of a hedge over time can be tracked by comparing the hedge
value $V_t = M_t + N_t S_t$ to the model value $\o{V}_t = \o{v}(S_t, T - t)$.

### Profit and Loss

The difference between the hedge value and the model value is the _profit and loss_.
The change in the hedge value over the interval $[t_{j-1},t_j]$ is the _backward difference_
$\nabla V_j = V_j - V_{j-1}$.

__Exercise__. _Show $\nabla V_j = N_{j-1}\nabla S_j$_.

<details>
<summary>Solution</summary>
$$
\begin{aligned}
\nabla V_j &= V_j - V_{j-1} \\
	&= M_j - M_{j-1} + N_j S_j - N_{j-1} S_{j-1} \\
	&= - (N_j - N_{j-1})S_j + N_j S_j - N_{j-1} S_{j-1} \\
	&= N_{j-1}S_j - N_{j-1} S_{j-1} \\
	&= N_{j-1}(S_j  -  S_{j-1}) \\
	&= N_{j-1}\nabla S_j \\
\end{aligned}
$$
</details>

The change in model value over the interval is $\nabla\o{V}_j = \o{V}_j - \o{V}_{j-1}$.
Since $σ$ and $T$ are fixed this can be computed using Taylor's formula
$$
\begin{aligned}
	\nabla \o{V}_j &= -\partial_t\o{v}_j\,\nabla t_j + \partial_s\o{v}_j\,\nabla S_j \\
	&\quad + \frac{1}{2}\partial_t^2\o{v}_j\,(\nabla t_j)^2
	- \partial_t\partial_s \o{v}_j(\nabla t_j)(\nabla S_j)
	+ \frac{1}{2}\partial_s^2\o{v}_j(\nabla S_j)^2 \\
	&\qquad + \mathrm{higher\ order\ terms}
\end{aligned}
$$
where the partial derivatives are evaluated at $t = t_{j-1}$ and $S = S_{j-1}$.
Ignoring $(\nabla t_j)(\nabla S_j) = 0$, $(\nabla t_j)^2 = 0$,
and higher order terms we have

#### Explanation

$$
\begin{aligned}
	\nabla V_j - \nabla \o{V}_j &= N_{j-1}\nabla S_j - \nabla \o{V}_j \\
	&\approx N_{j-1}\nabla S_j - (-\partial_t\o{v}_j\,\nabla t_j + \partial_s\o{v}_j\,\nabla S_j
	+ \frac{1}{2}\partial_s^2\o{v}_j(\nabla S_j)^2) \\
	&= \partial_t\o{v}_j\,\nabla t_j - \frac{1}{2}\partial_s^2\o{v}_j(\nabla S_j)^2 \\
\end{aligned}
$$
if we choose $N_{j-1} = \partial_s\o{V}_j$.
The P&L on a delta hedged trade can be approximated using theta and gamma.
The term $(1/2)\partial_s^2\o{v}_j (\nabla S)^2$ is called _dollar gamma_.

__Exercise__. _Show $\nabla V_j = N_{j-1}\nabla S_j$_.

__Exercise__. _Show if $N$, $M$, and $K$ are jointly normal then_
$$
	E[e^N 1(M \ge K)] = E[e^N] P(M + \Cov(N,M) \ge K + \Cov(N,K)).
$$

_Hint_. Use $E[e^N g(N_1,\ldots)] = E[e^N] E[g(N_1 + \Cov(N, N_1), \ldots)]$.

<details>
<summary>Solution</summary>
$$
\begin{aligned}
E[e^N 1(M \ge K)] &= E[e^N] E[1(M + \Cov(N,M) \ge K + \Cov(N,K))] \\
	&=  E[e^N] P(M + \Cov(N,M) \ge K + \Cov(N,K))
\end{aligned}
$$
</details>

__Exercise__. (Margrabe) _Show if $N$ and $M$ are jointly normal then $E[\max\{e^N - e^M, 0\}]$ is_
$$
E[e^N] P(N - M \ge - \Var(N) + \Cov(N,M)) - E[e^M] P(N - M \ge - \Cov(M, N) + \Var(M)).
$$

_Hint_. $E[\max\{e^N - e^M, 0\}] = E[(e^N - e^M) 1(N \ge M)]$.

<details>
<summary>Solution</summary>
$$
\begin{aligned}
E[\max\{e^N - e^M, 0\}] &= E[(e^N - e^M) 1(N \ge M)] \\
	&= E[e^N 1(N \ge M)] - E[e^M 1(N \ge M)] \\
	&= E[e^N] P(N + \Var(N) \ge M + \Cov(N,M))
		- E[e^M] P(N + \Cov(M, N) \ge M + \Var(M)) \\
	&= E[e^N] P(N - M \ge - \Var(N) + \Cov(N,M))
		- E[e^M] P(N - M \ge -\Cov(M, N) + \Var(M)) \\
\end{aligned}
$$
</details>

__Exercise__. _Show $E[\max\{S_T - S_t, 0\}] = s (Φ(σ\sqrt(T - t)/2) - Φ(-σ\sqrt(T - t)/2))$
where $Φ$ is the standard normal cumulative distribution_.

_Hint_. Recall $S_t = se^{σB_t - σ^2 t/2}$ and $t < T$ then
use the previous exercise.
