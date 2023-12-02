---
title: Unified Model for Derivative Instruments
author: Keith A. Lewis
institute: KALX, LLC
fleqn: true
classoption: fleqn
abstract: Value, hedge, and manage the risk of any instruments
...

\newcommand{\RR}{\boldsymbol{R}}
\renewcommand{\AA}{{\mathcal{A}}}
\newcommand{\ran}{\operatorname{ran}}
\newcommand{\Var}{\operatorname{Var}}
\newcommand{\Cov}{\operatorname{Cov}}

The intended customers of mathematical finance are businesses
writing checks for tools they find useful.
This has become obscured by the plethora of literature
produced for academic purposes.
Businesses find little value in pure mathematics,
it must be turned into software producing numbers 
relevant to their operation.

This short note is an attempt to provide a rigorous mathematical
foundation for reasoning about problems pertinent to businesses.
The classical theory of mathematical finance does not account for
trading realities. Every transaction has a buyer and a seller.
The seller offers possible exchanges and the buyer decides which
to take. Issuers make securities available for trading.
Exchanges provide instruments to facilitate this.

We consider the fundamental problem 
of how to devise a trading strategy that replicates derivative payoffs.
Continuous time trading is a mathematical fiction. Traders need to
execute a finite number of trades and manage the associated risks.

Market instruments have prices and cash flows.
Trading involves valuing positions and accounting for transaction costs.
Quants provide arbitrage-free models of market dynamics.

Most models assume there is a money market account available to finance
trading strategies.  The Unified Model does not. 
All instruments used in trading must be explicitly specified.
Realistic models must allow for non-optimal trading strategies.

Traders decide when and how much to trade at discrete times based on
available information.  Managing risk involves trading strategies used
for hedging.  The Unified Model forces you to consider the decisions
traders must make every day.

See [Mathematical Prerequisites](#mathematical-prerequisites)
for the elementary mathematics required.

## Market

Instruments have _prices_ and _cash flows_.  We make the usual unrealistic
assumption that any instrument can be bought or sold at any time in any amount
at the market price.  Owning an instrument entails cash flows from
the issuer or exchange.
Unlike prices, cash flows are almost always 0.  Stocks pay dividends,
bonds pay coupons, futures pay the daily difference of their market
quotes and always have price 0.  Futures quotes are naturally occurring
martingales.

### Model

A model of the market assumes a set of _outcomes_ $\Omega$ of all possible
things that can occur. Information available at trading time $t\in T$
is modeled by a _partition_ $\AA_t$ of $\Omega$.

#### Price, Cash Flow

Let $I$ be the set of all instruments, $X_t\colon\AA_t\to \RR^I$ be
the _prices_, and $C_t\colon\AA_t\to \RR^I$ be the _cash flows_ of each
instrument given information $\AA_t$ at trading time $t$.
In particular, $X_t(i) = X_t^i$ is the price at time $t$ of instrument $i\in I$.

### Trading

Trades are based on information available at the time of the trade.
The buyer decides how much of each instrument to buy or sell at offered
market prices.  Trades accumulate to positions and cash flows proportional
to existing positions are credited.

#### Trade, Position

A _trading strategy_ is a finite number of increasing stopping times[^4]
$(\tau_j)$ and corresponding trades ${\Gamma_j\colon\AA_{\tau_j}\to \RR^I}$
in each instrument with ${\sum_j \Gamma_j = 0}$.  Trading
strategies must eventually close out.

Trades accumulate to _positions_ ${\Delta_t = \sum_{\tau_j < t}\Gamma_j = \sum_{s < t}\Gamma_s}$
where $\Gamma_s = \Gamma_j$ if $s = \tau_j$.
Note the strict inequality. Trades done at time $t$ must settle before
belonging to a position.

[^4]: A function $\tau\colon\Omega\to\RR$ is a stopping time
if $\{\tau\le t\}$ is $\AA_t$ measurable for all $t$.
If $(\AA_t)_{t\in T}$ are algebras indexed by time then
$\AA_\tau = \{A\cap\{\tau\le t\}\mid A\in\AA_t, t\in T\}$.

#### Value, Account

The _value_, or _mark-to-market_, of a trading
strategy at time $t$ is
$$
	V_t = (\Delta_t + \Gamma_t)\cdot X_t.
$$
It is the value of liquidating the existing positions, and the trades just
done, at current prices.

The _(brokerage) account_, or _(trade) blotter_, is
$$
	A_t = \Delta_t\cdot C_t - \Gamma_t\cdot X_t.
$$
Cash flows are credited in proportion to existing positions and trades just executed are debited.

The net _profit and loss_ over the period from time $t$ to time $u$ is
${N(t,u) = V_u - V_t + \sum_{t < s \le u} A_s}$. A strategy is _self-financing_
at $t$ if $A_t = 0$. The Unified Model does not assume account payments
are reinvested in a money-market account.

## Arbitrage

A model admits _arbitrage_ if there is a trading strategy with 
$A_{\tau_0} > 0$ and $A_t\ge0$ for $t > \tau_0$:
you make money on the first trade and never lose money.
Note that this definition does not require a "probability" measure.
Traders and risk managers also compare ${A_{\tau_0} = -\Gamma_{\tau_0}\cdot X_{\tau_0}}$
to $|\Gamma_{\tau_0}|\cdot |X_{\tau_0}|$ as a gauge of return on investment.
If they are savvy, they will also consider $A_t$ over the life of the trading strategy.

Every arbitrage-free model of prices and cash flows is parameterized by 
positive _discount measures_ ${D_t\in ba(\AA_t)}$ and functions
${M_t\colon\AA_t\to\RR^I}$
satisfying ${M_tD_t = (M_u D_u)|_{\AA_t}}$, $t \le u$.
If prices and cash flows satisfy
$$
\tag{0}	X_t D_t = M_t D_0 - \sum_{s\le t} C_s D_s
$$
then the model is arbitrage-free.
We can multiply the discount measure by a positive constant without affecting
this equation so we assume $D_0$ has mass 1.

__Lemma__. _Under this parameterization_
$$
\tag{1}	X_t D_t = (X_u D_u + \sum_{t < s \le u}C_s D_s)|_{\AA_t}, u \ge t,
$$

This follows immediately from replacing $X_u D_u$ by ${M_u - \sum_{s\le u}C_s D_s}$.

__Theorem__. _Under this parameterization
the model of prices $X_t$ and cash flows $C_t$ does not admit arbitrage._

_Proof_. If $(\tau_j, \Gamma_j)$ is a trading strategy with $A_t\ge 0$ for $t > \tau_0$
then $V_{\tau_0} D_{\tau_0} = E_{\tau_0}[\sum_{t > \tau_0} A_t D_t] \ge 0$
since $D_t > 0$.
Using $V_{\tau_0} = \Gamma_{\tau_0}\cdot X_{\tau_0} = -A_{\tau_0}$ and $D_{\tau_0} > 0$
we have $A_{\tau_0} \le 0$.

The Fundamental Theorem of Asset Pricing states the converse is true, but who cares?
The job of a quant is to provide arbitrage-free models to their employers.
The trick is to find martingales that can fit market prices.

__Lemma__. _Using the above definitions_
$$
\tag{2}	V_t D_t = (V_u D_u + \sum_{t < s \le u}A_s D_s)|_{\AA_t}.
$$
Note how trading strategies create synthetic instruments where value $V_t$ corresponds to prices
$X_t$ and account $A_t$ corresponds to cash flows $C_t$.

_Proof_. Assuming discrete time $(t_j)$ we only need 
$V_j D_j = (V_{j+1} + A_{j+1})D_{j+1}|_{\AA_{j}}$ and induction.
Using $\Delta_{j+1}\cdot C_{j+1} =  \Gamma_{j+1}\cdot X_{j+1} + A_{j+1}$ we have
$$
\begin{aligned}
	V_j D_j &= (\Delta_j + \Gamma_j)\cdot X_j D_j \\
	&= \Delta_{j+1}\cdot X_j D_j \\
	&= \Delta_{j+1}\cdot (X_{j+1} + C_{j+1})D_{j+1}|_{\AA_{j}} \\
	&= (\Delta_{j+1}\cdot X_{j+1} + \Gamma_{j+1}\cdot X_{j+1} + A_{j+1}) D_{j+1}|_{\AA_{j}} \\
	&= (V_{j+1} + A_{j+1})D_{j+1}|_{\AA_{j}} \\
\end{aligned}
$$

In continuous time the same argument holds path-wise if we take $u > t$
sufficiently small.

Formulas (1) and (2) are the foundation of derivative pricing.  A derivative is a
contract specifying payments $A_j$ at times $\tau_j$.  If there is a trading
strategy replicating these payments, and $A_t = 0$ when $t\not=\tau_j$,
then its value is the cost of setting up the initial hedge.

## Hedge

Given a derivative instrument, how does one find a trading strategy that replicates its payments?
Let's assume trades occur at discrete times $(t_j)$.  Since ${V_{t_0}
= (\sum_{t_j > t_0} A_{t_j} D_{t_j})|_{\AA_t}}$ and ${V_{t_0} = \Gamma_{t_0}\cdot
X_{t_0}}$ we have
$$
	\Gamma_0 = \frac{d}{dX_{0}}(\sum_{j > 0} A_j D_j)|_{\AA_0},
$$
where $d/dX_0$ is the Fréchet derivative.

At subsequent times we have 
${V_j D_j = E_j[\sum_{k > j} A_k D_k]}$ and ${V_j = (\Delta_j + \Gamma_j)\cdot X_j}$ so
$$
	(\Delta_j + \Gamma_j) D_j = \frac{d}{dX_{j}}\sum_{k > j} A_k D_k.
$$
Since $\Delta_j = \sum_{i < j}\Gamma_i$ this determines $\Gamma_j$ by induction.
Note $\Delta$ is delta and $\Gamma$ is gamma.

Of course, this does not guarantee the trading strategy will replicate the payments.
More work remains to be done in assessing the risk involved with realistic
trading strategies.

## Discount Measure

Repurchase agreements determine a _canonical discount measure_.

If a _repurchase agreement_ has price $X_t = 1$ and cash flow
${C_{t + \Delta t} = \exp(f_t\Delta t)}$ then
by equation (1) ${1D_t = \exp(f_t\Delta t)D_{t + \Delta t}|_{\AA_t}}$.
If $D_{t + \Delta t}$ is $\AA_t$ measurable then
$D_{t + \Delta t}/D_t = \exp(-f_t\Delta t)$.
In discrete time
$D_j = \exp(-\sum_{i < j} f_i\Delta t_i)D_0$ so the canonical discount measure.
is determined by repo rates.  
The continuous time version of this is $D_t = \exp(-\int_0^t f_s\,ds)$
where $f_t$ is the _(continuously compounded) stochastic forward rate_.

Traders assume there is a money market account available for funding,
but other traders on the repo desk get paid a couple of basis points
for providing that abstraction.  If you are doing day trading funded by
your credit card then you need to use a discount based on the APR you
are being charged.

## Examples

Applications of formula (1). We use the customary notation
$E_t[X] = E[X\mid\AA_t]$ for $(XP)|_{\AA_t}$ when $P$ is a positive
measure having mass 1. Unlike classical models $E_t[X]$ is a measure,
not a random variable.

### Black-Scholes/Merton

The Black, Scholes, and Merton model is $D_t = e^{-\rho t}P$ where $P$ is Wiener measure
on the sample space of continuous functions $C[0,\infty)$
and ${M_t = (r, se^{\sigma B_t - \sigma^2t/2})}$.
There is no need for Ito's formula
or partial differential equations when using the Unified Model.

### Transaction

Purchasing $a$ shares of instrument $X$ having price $X_t$ at time $t$
is a cash flow ${C_t = (-aX_t, a)}$ involving a currency and $X$.  This is
a mathematical idealization. 
Transactions in the real world occur on _exchanges_ and involve
_order books_, _limit orders_, and _market orders_.

### Limit Orders

A _limit order_ $L^{x,a,t}$ is specified by a _level_ $x$ of an instrument $X$,
an amount $a$ in shares of $X$, and the time $t$ it is made available.
After the limit order is submitted the buyer must wait until the underlying
instrument reaches level $x$. When it does the buyer receives $a$ shares of $X$
in exchange for $ax$ dollers.
Limit orders always have price 0 and a single cash flow
$C^L_\tau = (-ax, a)$ at the first time the underlying reaches level $x$.
If $X_t < x$ then ${\tau = \inf\{u > t\mid X_u \ge x\}}$.
If $X_t > x$ then ${\tau = \inf\{u > t\mid X_u \le x\}}$.

Limit orders guarantee the price but not the time of transaction.

### Market Orders

A _market order_ $M^{X,a,t}$ is specified by an instrument $X$,
an amount $a$ in shares of $X$, and the time it is executed.
After the market order is submited the buyer receives $a$ share of $X$
at time $t$ in exchange for $a(X_t + \Delta X_t)$ dollars
where $\Delta X_t$ is the _slippage_
that depends on the mechanics of how order books operate.
Market orders always have price 0 and a single cash flow
${C^M_t = (-a(X_t + \Delta X_t), a)}$.

Market orders guarantee the time but not the price of the transaction.


### Forwards

Let $S_t$ be the stock price at time $t$. A forward contract with strike
$k$ expiring at time $t$ has a single non-zero cash flow ${C_t = S_t - k}$.
From formula (1) its value at time $t = 0$ is $E[(S_t - k)D_t]$. The
(at-the-money) _forward_ $f(t)$ is the strike making this value 0,
hence $f(t) D(t) = E[S_t D_t] = S_0$ if there are no dividends.
This is called _the cost of carry_.

It becomes more complicated if the stock has dividends $d_j$ at times $t_j$.
By formula (0) we have ${S_tD_t = M_t - \sum_{t_j\le t} d_j D_{t_j}}$ where $M_t$ is
a martingale with $E[M_t] = S_0$ hence
${f(t) D(t) = S_0 - \sum_{t_j\le t}E[d_jD_{t_j}]}$.

If the dividends are constant then ${f(t) D(t) = S_0 - \sum_{t_j\le t} d_j D(t_j)}$

If the dividends are proportional with $d_j = p_j S_{t_j}$ then
${f(t)D(t) = S_0 - \sum_{t_j\le t} p_j E[S_{t_j} D_{t_j}]}$. 
Let ${f_j = E[S_{t_j} D_{t_j}] = S_0 - \sum_{i\le j} p_i E[S_{t_i} D_{t_i}]}$.
We have $f_0 = S_0$ and
${f_{j} - f_{j-1} = -p_j E[S_{t_j} D_{t_j}] = p_j f_j}$, $j > 0$ so
$f_j = f_{j-1}/(1 + p_j)$. This shows
$$
\begin{aligned}
f(t)D(t) &= S_0 - \sum_{t_j\le t} p_j E[S_{t_j} D_{t_j}] \\
	&= S_0 - \sum_{t_j\le t} p_jS_0/\prod_{i\le j} (1 + p_i) \\
\end{aligned}
$$

<!--
Companies only announce dividends for a short time into the future.
It is reasonable to assume propor
-->

These formulas are used for _dividend adjusted_ stock prices.


### Futures

A _futures_ contract $\Phi^{X,T}$ is specified by an instrument $X$, an expiration $T$,
and a set of _calculation times_ $t_0 < \cdots < t_n$ where $t_n = T$.
The futures _quote_ $\Phi_{t_n}$ is equal to the instrument price $X_{t_n}$ at expiration.
Prior to that the quote is determined by the market.
The price of a futures is always 0 and has cash flows $C_j = \Phi_{t_j} - \Phi_{t_{j-1}}$
at time $t_j$, $0 < j \le n$. In an arbitrage-free model
${0D_{t_j} = E_{t_j}[(\Phi_{t_{j+1}} - \Phi_{t_j}) D_{t_{j+1}}]}$.
If $D_t$ is the canonical discount then $D_{t_{j+1}}$ is known at time $t_j$
so $\Phi_{t_j} = E_{t_j}[\Phi_{t_{j+1}}]$.
Futures are naturally occuring martingales.
### Zero Coupon Bonds

Let $D(u)$ be (the symbol for) a _zero coupon bond_ with a single
non-zero cash flow ${C^{D(u)}_u = 1}$ at _maturity_ $u$.  If $D_t$ is a
discount measure then the price at time $t$ of $D(u)$ satisfies $X^{D(u)}_t D_t =
(C^{D(u)}_u D_u)|_{\AA_t} = (D_u)|_{\AA_t}$ for $t \le u$ so
$$
	D_t(u) = X^{D(u)}_t = E_t[D_u]/D_t.
$$
We use the helpfully confusing notation $D(u)$ for $D_0(u) = E[D_u]$.

The discount measure/stochastic discount determines the price dynamics of zero coupon bonds.

#### Risky Bonds

A _risky zero coupon bond_ with _recovery_ $R$ and _default time_ $T$
has a single cash flow $C_u = 1$ if default occurs after maturity or
$C_u = R$ if $T \le u$. It is customary to assume $R$ is constant.
We write $D_t^{R,T}(u)$ for the price $X_t^{D^{R,T}(u)}$ of the risky zero coupon bond at time $t$.
The dynamics of a risky zero are determined by
$$
	D_t^{R,T}(u) D_t = E_t[R 1(T \le u) D_u + 1(T > u) D_u].
$$
The _credit spread_ $s_t = s_t^{R,T}(u)$ defined by $D_t^{R,T}(u) = D_t(u) e^{-u s_t}$
incorporates both recovery and default.

If default is independent of the discount measure we have at time $t = 0$
${D_0^{R,T}(u) = (RP(T\le u) + P(T > u))D(u)}$.
The credit spread is 0 when $R = 1$ or $T = \infty$.
If $T$ is exponentially distributed with hazard rate $\lambda$ then $P(T > t) = e^{-\lambda t}$.

__Exercise__. _Show $s_0^{T,R}\approx \lambda(1 - R)$ for small $\lambda$_. 

We can also consider risky forward rate agreements.

<!--
We must expand the sample space to $\Omega\times (0,\infty]$
where $(ω,t)\in \Omega\times (0,\infty]$ indicates default occurred at time $t$ on path $\omega$.
The partition of $(0, \infty]$ representing information available at time $t$ for the default time is
$\{(t,\infty]\} \cup \{\{s\}:s \le t\}$. If default has
not occurred prior to $t$ we only know $T > t$. If default occurred prior
to time $t$ we know exactly when it happened.

Unlike in the credit default swap market where recovery happens shortly after
a credit event, mathematical finance literature likes to
assume recovery is delayed until maturity. It is also popular to make the unrealistic
assumption that default time is independent of the discount measure. Under these assumptions
we have
$$
	D_t^{R,T}(u) = D_t(u)\bigl(R P(T \le u | T > t) 1(t < T \le u) + P(T > u | T > t) 1(T > u)\bigr).
$$
In principal, $R$ could be random and joint distributions involving the default time
and discount measure could be specified.

-->


### Forward Rate Agreement

A _forward rate agreement_ $F^\delta(u,v)$ specifies a rate $f$,
an _effective date_ $u$, a _termination date_ $v$ and a _day count
basis_ $\delta$. It has cash flows $C^{F^\delta(u,v)}_u = -1$ and
$C^{F^\delta(u,v)}_v = 1 + f\delta(u,v)$ where $\delta(u,v)$ is the
_day count fraction_.[^5] The _par coupon_ is the value of $f$ for which
${X^{F^\delta(u,v)}_t = E_t[-D_u + (1 + f\delta(u,v)D_v] = 0}$
$$
	F_t^\delta(u,v) = \frac{1}{\delta(u,v)}\left(\frac{D_t(u)}{D_t(v)} - 1\right).
$$

__Exercise__. _Show $0 = E_t[(F_t^\delta(u,v) - F_u^\delta(u,v))\delta(u,v)D_v]$ for $t\le u < v$_.

_Hint_: Note $F_t^\delta(u,v)\delta(u,v)E_t[D_v] = E_t[-D_u + D_v)]$ 
so $F_u\delta E_u[D_v] = E_u[-D_u + D_v]$.
Use $E_t[E_u[X]] = E_t[X]$ if $t \le u$.

This show a forward rate agreement with a single cash flow
${C_v = (F_t^\delta(u,v) - F_u^\delta(u,v))\delta(u,v)}$ has the same price 
as an FRA with an exchange of principal but they have different risk profiles
if default occures between time $u$ and $v$.

[^5]: The day count fraction $\delta(u, v)$ is approximately equal to time from $u$ to $v$ in years.
For example, the Actual/360 day count is the number of days from $u$ to $v$
divided by 360.

### Convexity

_Convexity_ is the difference between the quote on interest rates futures
and the corresponding par forward rate.  If $F = F^{\delta(u,v)}_u$ is the
forward rate over $[u,v]$ at time $u$ then the corresponding futures quote is $\phi = E[F]$.
Let $f = F^{\delta(u,v)}_0$ be the par forward.

__Exercise__. _Show ${\phi - f = -\Cov(F,D_v)/D(v)}$_.

_Hint_: $0 = E[(F - f)D_v]$

Since foward rates and discounts are
negatively correlated the convexity is positive.

### Swap

A _(interest rate) swap_ $F^\delta(\{t_j\})$ specifies a coupon $c$,
_calculation dates_ $\{t_j\}_{j=0}^n$, and a _day count
basis_ $\delta$. It has cash flows $C^{F^\delta(\{t_j\})}_{t_0} = -1$ and
$C^{F^\delta(\{t_j\})}_{t_j} = c\delta(t_{j-1},t_j)$ for $0 < j < n$,
and $C^{F^\delta(\{t_j\})}_{t_n} = 1 + c\delta(t_{n-1},t_n)$.
The _par coupon_ $F^\delta(\{t_j\})_t$ is the value of $c$ for which the price of the
swap is 0 at $t$.

__Exercise__. _Show $F^\delta(\{t_j\})_0 = (1 - D(t_n))/(\sum_{0<j\le n} \delta(t_{j-1},t_j) D(t_j))$_.

Post 2008, swaps having different payment frequencies started being quoted at different
par coupons. A simple default model having constant recovery and hazard rate can
fit market prices remakably well.

## Mathematical Prerequisites

If $A$ and $B$ are sets then $B^A = \{f\colon A\to B\}$ is the set of all functions
from $A$ to $B$. We can identify $\{0,1\}^A = 2^A$ with the the set of all subsets of $A$.
If $B\subseteq A$ let $1_B(x) = 1$ if $x\in B$ and $1_B(x) = 0$ if $x\notin B$
be the _indicator function_ of $B$.

Instead of countably additive "probability" measures and martingales that involve conditional
expectation we use the more elementary notion of finitely additive
measures and restriction of measures to subalgebras of sets.

Dunford and Schwartz use $ba(\Omega)$ to denote the Banach space
of bounded finitely additive measures on $\Omega$. It is the dual of $B(\Omega)$,
the Banach algebra of bounded functions on $\Omega$ having
norm ${\|f\| = \sup_{\omega\in\Omega} |f(\omega)|}$.

If $L\colon B(\Omega)\to\RR$ is a bounded linear functional then we can define
a measure $\lambda\in ba(\Omega)$ by $\lambda(A) = L1_A$.

For $A,B\subseteq\Omega$ we have $1_{A\cup B} = 1_A + 1_B - 1_{A\cap B}$
so $\lambda(A\cup B) = \lambda(A) + \lambda(B) - \lambda(A\cap B)$.
Since $\lambda(\emptyset) = L1_\emptyset = L0 = 0$ this shows
$\lambda$ is a finitely additive measure.

If $\lambda\in ba(\Omega)$ we can define a linear functional on
_elementary functions_, finite linear combinations of indicator
functions, by ${L(\sum_j a_j 1_{A_j}) = \sum_j a_j\lambda(A_j)}$,
$a_j\in\RR$, $A_j\subseteq\Omega$. If $(A_j)$ are pairwise disjoint this
is well defined.

__Exercise__. _Show every elementary function $\sum_j a_j 1_{A_j}
= \sum_k b_k 1_{B_k}$ where $(B_k)$ are pairwise disjoint_.

_Hint_: $a1_A + b1_B = a1_{A\setminus B} + (a + b)1_{A\cap B} + b1_{B\setminus A}$.

If $f = \sum_j a_j 1_{A_j}$ where $(A_j)$ are pairwise disjoint then
${|Lf| \le \max_j\{|a_j|\} \sum_j |\lambda(A_j)| \le \|f\|\|\lambda\|}$ so $L$ is continuous.
Elementary functions are norm dense in $B(\Omega)$ so we can extend $L$ to the entire space.

__Exercise__. _Show $\|L\| = \|\lambda\|$_.

_Hint_: $\|\lambda\| = \sup \sum_j |\lambda(A_j)|$ where $(A_j)$ are disjoint
subsets of $\Omega$.

This shows $B(\Omega)^*$ is isometrically isomorphic to $ba(\Omega)$.

For any $g\in B(\Omega)$ the multiplication operator $M_g\colon B(\Omega)\to B(\Omega)$
defined by $M_gf = fg$ is bounded with norm $\|g\|$. Its adjoint
$M_g^*\colon ba(\Omega)\to ba(\Omega)$ defines multiplication of a measure by a bounded function.
We write $g\lambda$ for $M_g^*\lambda$, $g\in B(\Omega)$, $\lambda\in ba(\Omega)$.

Information at time $t$ is modeled by an algebra $\AA$ of sets on the
sample space $\Omega$ of all possible outcomes. If $\AA$ is finite then
its atoms form a partition of $\Omega$ and generate the algebra. Complete
information is knowing $\omega\in\Omega$.  Partial information is knowing
only which atom $\omega$ belongs to. No information is knowing only $\omega\in\Omega$.

A partition $\AA$ of $\Omega$ is also a set and $B(\AA)$ is the Banach algebra of
$\AA$-_measurable_ sets. If $\lambda$ is a measure and $X\in B(\Omega)$
define $Y\in B(\AA)$ by $Y(\lambda|_\AA) = (X\lambda)|_\AA$.
If $\lambda$ is a positive measure with mass 1 this can be written $Y = E[X\mid\AA]$,
the conditional expectation of $X$ with respect to the algebra $\AA$, where
$Y$ is the Radon-Nykodym derivative.

## Acknowledgments

The main impetus for this work was Peter Carr who invited me back into the academic
world in 2008 to teach Derivative Securities at NYU Courant. I was chagrined to
find there was no proof of the Fundamental Theorem of Asset Pricing accessible
at the masters level, so I [came up with one](https://arxiv.org/pdf/1912.01091.pdf). 

I thank
Kevin Atteson,
Bill Goff,
Stewart Inglis,
Andrew Kalotay,
Alex Mayus,
and Robert Merton III
for helpful insights and feedback.
