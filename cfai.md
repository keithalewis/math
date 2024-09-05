---
title: Portfolio construction
author: Keith A. Lewis
classoption: fleqn
fontsize: 12pt
...

<!--
:!pandoc % -s --katex --css math.css -o %:r.html
:!pandoc % --pdf-engine=xelatex -o %:r.pdf
-->

\newcommand\RR{\mathbf{R}}
\newcommand\MM{\mathcal{M}}
\newcommand\Var{\operatorname{Var}}
\newcommand\Cov{\operatorname{Cov}}
\newcommand\corr{\operatorname{corr}}
\newcommand\ran{\operatorname{ran}}
\newcommand\diag{\operatorname{diag}}

<nav>
<ul>
<li><a href=#preliminaries>Preliminaries</li>
<ul>
<li><a href=#set-exponential>Set exponential</a></li>
<li><a href=#vector-space>Vector space</a></li>
<li><a href=#probability-space>Probability space</a></li>
</ul>
<li><a href=#one-period-model>One-Period Model</a></li>
<li><a href=#portfolio>Portfolio</a></li>
<li><a>return</a></li>
<li><a>portfolio</a></li>
<li><a>feasible</a></li>
<li><a>realized return</a></li>
<li><a>risk-free</a></li>
<li><a>market</a></li>
<li><a>capital allocation/market line</a></li> 
</ul>
</nav>

Portfolio managers adjust their positions by trading to tailor risk and return.
In general, lower volatility and higher returns are preferred.
They also have to consider multi-period risk management,
transaction costs, counterparty risk, tax considerations, and other messy details
salient to being successful in their career.
We have nothing to say about these important matters and only consider the simplest case:
a one-period model that permits rigorous mathematical results.

Our model allows for any return distribution, not just multivariate normal. 
However, we do not address the difficult and crucial problem of
determining the distribution of returns.
See [this](https://github.com/microprediction/precise/blob/main/LITERATURE.md)
for recent literature on this topic.

We define the one-period model, portfolio, return, and realized return.
In general, there is a unique portfolio having minimum realized return.
If that has zero variance it is a zero coupon bond.
This can be used to tailor the standard
deviation and return of a portfolio.

An efficient portfolio has the minimum variance for a given return.
The Capital Asset Pricing Model shows every efficient portfolio
is a linear combination of any two independent efficient portfolios.
A zero coupon bond is clearly efficient. Classical literature assumes
the "market" portfolio is efficient, usually accompanied with hand
waving arguments involving "equilibrium."

The key insight of Markowitz was to move from Graham and Todd's
detailed Security Analysis of individual stocks to leveraging
market wisdom. There are many people who get up every day and
try to beat the market. The prices they pay for instruments
indicate what people with skin in the game believe.
How to make use of that information is an ongoing topic of research.

## Preliminaries

<details><summary>Details</summary>

### Set Exponential

Recall if $A$ and $B$ are sets, then the _set exponential_ ${B^A = \{f\colon A\to B\}}$
is the set of all functions from $A$ to $B$.

__Exercise__. _If $A$ and $B$ are finite, then $\#(B^A) = \#B^{\#A}$_.

_Hint_. Where $\#$ counts the number of elements in a set.

### Vector Space

If $S$ is a set then $\RR^S$ is a vector space over the real
numbers $\RR$ with scalar multiplication
and vector addition defined pointwise: $(ax)(s) = a(x(s))$ and
$(x + y)(s) = x(s) + y(s)$, $a\in\RR$, $x,y\in\RR^S$.
The _dimension_ of $\RR^S$ is the cardinality of $S$.
For $x\in\RR^S$, we write $x(s)$ as $x_s$ and ${x = (x_s)_{s\in S}}$.

A _subspace_ of a vector space is a subset closed under
scalar multiplication and vector addition.

__Exercise__. _Show if $U$ and $V$ are subspaces then
${U + V = \{u + v\mid u\in U, v\in V\}}$ is a subspace_.

_Hint_: Show $a(u + v) \in U + V$, $a\in\RR$,
and $u + v\in U + V$.

A _cone_ is a subset closed under
positive scalar multiplication and vector addition.

__Exercise__. _Show if $U$ and $V$ are cones then
${U + V = \{u + v\mid u\in U, v\in V\}}$ is a cone_.

_Hint_: Same as the previous hint using $a > 0$.

If $S$ is finite define the _inner/dot product_ to be the scalar
${x^*y = \sum_{s\in S} x_s y_s}$
and the _outer product_ to be the matrix $xy^* = [x_s y_t]_{s,t\in S}$
for $x,y\in\RR^S$.

### Probability Space

A _probability space_ is a set $\Omega$, the _sample space_,
and a _probability measure_ $P$ on $\Omega$.
The elements of the sample space are the possible outcomes.
A measure is a function from _events_, subsets of $\Omega$,
to the real numbers $\RR$ satisfying
$P(E\cup F) = P(E) + P(F) - P(E\cap F)$, $E, F\subseteq\Omega$;
measures don't count things twice.
Measures must also satisfy $P(\emptyset) = 0$; the measure
of nothing is zero.
A measure is a probability measure if $P(E)\ge0$ for $E\subseteq\Omega$
and $P(\Omega) = 1$.

__Exercise__. _If $\Omega$ is finite then $p_j = P(\{\omega\})$, $\omega_j\in\Omega$
determine the probability measure $P$_.

_Hint_: Show $P(E) = \sum_{\omega_j\in E} p_j$ for $E\subseteq\Omega$.

</details>

## One-Period Model

The one-period model consists of a probability space $(\Omega, P)$,
a set of instruments $I$,
their prices $x\in\RR^I$ at the beginning of the period,
and their random prices ${X\colon\Omega\to\RR^I}$ at the end of the period.
If outcome ${\omega\in\Omega}$ occurs, the prices at the end of
the period are ${X(\omega)\in\RR^I}$.

Holding an instrument may entail _cash flows_. For example, bonds have coupons
and stocks have dividends.
We implicitly assume these are added to the prices at the end of the period.

Estimating the probability measure $P$ is a difficult and important
problem having no canonical solution. Often it is assumed to be
multivariate normal. The mean and covariance can be estimated from
historical returns assuming independent increments and stationarity.
Even then, there are still questions. How far back in history?
Should the estimates use exponential weighting? What parameter
should be used in the exponential weighting?

We will assume the one-period model is arbitrage-free.
_Arbitrage_ exists (for a model) if there is a portfolio $\xi\in\RR^I$
with negative cost $\xi^*x < 0$ and non-negative return $\xi^*X\ge0$.
You make money acquiring the portfolio and never lose money
when it is liquidated.

The Fundamental Theorem of Asset Pricing states there is no arbitrage
if and only if $x$ belongs to the smallest closed cone containing the range of $X$.
This is equivalent to the existence of a positive measure $D$ on $\Omega$
with $x = \int_\Omega X,dD$. In general, $D$ is not unique.
If we let $P = D/D(\Omega)$ then $P$ is a positive measure with weight 1
and $x = E[X]D(\Omega)$.

__Exercise__: _Show if there exists $\zeta\in\RR^I$ with
$\zeta^*X = 1$ then $D(\Omega) = \zeta^*x$_.

_Hint_: $\zeta^*x = \int_\Omega \zeta^*X dD$.

We call this portfolio a _zero coupon bond_. Its price
$\zeta^*x$ is the _discount_ over the period.

### Binomial

<details><summary>Details</summary>

The _binomial model_ is when $\Omega$ has only two possibilities.

__Exercise__: _If $X_i$ is not constant for some $i\in I$ show every $X_j$ is a linear function of $X_i$_.

_Hint_: Evaluating $X_j = a + b X_i$ at each point gives two linear equations in two unknowns.

This limits the usefulness of one-period binomial models.

A two instrument model of a bond and a stock is $\Omega = \{L,H\}$,
$x = (1, s)$, and $X(\omega) = (R,\omega)$. The bond has realized return $R$
and the stock can go to either a high or low price.

__Exercise__. _Show every payoff $Y\colon\Omega\to\RR$ is a linear combination
of the bond and stock_.

_Hint_: Find $a,b\in\RR$ with $Y(L) = aR + bL$ and $Y(H) = aR + bH$.

</details>

### Interval

<details><summary>Details</summary>

The _interval model_ is a two instrument model where the stock can
go to any price between a given low and high price.
Its sample space is the interval $\Omega = [L, H]$ with
$x = (1, s)$, and $X(\omega) = (R,\omega)$. 

</details>

### Jointly Normal

<details><summary>Details</summary>

The _jointly normal model_ has sample space ${\Omega = \RR^I}$,
any vector of terminal prices is possible, and $P$ is a jointly normal distribution on $\RR^I$.
Every jointly normal
distribution is uniquely determined by the expected prices ${E[X] = (E[X_i])_{i\in I}}$
and the covariance matrix $\Var(X) = \Cov(X,X) = {[\Cov(X_i, X_j)]_{i,j\in I}}$.

__Exercise__ _Show $\Var(X) = E[(X - E[X])(X - E[X])^*] = E[XX^*] - E[X]E[X]^*$_.

_Hint_: $XX^*(\omega) = X(\omega)X(\omega)^*$.

If $I$ has $n$ instruments, then the jointly normal model is specified
by $n + n(n-1)/2$ numbers since the covariance matrix is symmetric.

</details>

## Portfolio

A _portfolio_ is a vector $\xi\in\RR^I$ representing the number of
shares held in each instrument.
We assume perfect liquidity so the _cost_ of acquiring $\xi$
is $\xi^*x$.
The _return_ on $\xi$ at the end of the period is the random variable
$\xi^*X\colon\Omega\to\RR$. In the one-period model it is
implicitly assumed the portfolio is liquidated at the end of the period.

The _market_ is the set of all possible portfolio returns
${\MM = \MM_X = \{\xi^*X\mid\xi\in\RR^I\} \subseteq \RR^\Omega}$.
The model is _complete_ if $\MM = \RR^\Omega$; every possible
return is attainable from some portfolio.

If $\xi^*X = 0$ for some $\xi\not=0$ then
$X_i = -\sum_{j\not= i}\xi_j/\xi_i X_j$ where $\xi_i$ is
a non-zero component of $\xi$. In this case we
can remove instrument $i\in I$ and still have the same market.

Assuming we have done this for all instruments,
the market is a vector space of dimension $\#I$.
The one period model is not complete if $\#\Omega$ is larger this.
The number of possible outcomes are
vastly larger than the number of instruments
in any realistic model.

If $x_i\not=0$ we can replace $x_i$ by 1
and $X_i$ by $X_i/x_i$ without affecting the market.

### Feasible

A portfolio $\xi\in\RR^I$ is _feasible_ if its cost at the beginning of the period
is one unit, i.e., $\xi^*x = 1$.

__Exercise__: _Show if $\xi^*x$ is not zero then $\xi/\xi^*x$ is feasible_.

The _realized return_ of a portfolio $\xi\in\RR^I$ is
${R_\xi = \xi^*X/\xi^*x}$ when ${\xi^*x\not=0}$.
Note $R_{w\xi} = R_\xi$ for any non-zero $w\in\RR$.

__Exercise__: _Show the return of a feasible portfolio equals its realized return_.

_Hint_: If $\xi$ is feasible then $\xi^*x = 1$.

Assuming a portfolio is feasible simplifies formulas.

__Exercise__. _If $\xi_0$ and $\xi_1$ are feasible portfolios,
then $\xi_w = (1 - w)\xi_0 + w\xi_1$ is
a feasible portfolio for any $w\in\RR$_.

_Hint_: $(1 - w) + w = 1$.

__Exercise__. _Show $\xi_w = \xi_0$ if $w = 0$ and $\xi_w = \xi_1$ if $w = 1$_.

We begin by considering how to use two portfolios to tailor return and standard deviation
over a single time period. Portfolio managers do not buy or sell a fraction
of every instrument in a portfolio.

The (realized) return of $R_w = \xi_w^*X$ is
$$
	R_w = (1 - w)R_0 + w R_1 = R_0 + w(R_1 - R_0)
$$
and has variance
$$
	\Var(R_w) 
		 = \Var(R_0) + 2w\Cov(R_0, R_1 - R_0) + w^2\Var(R_1 - R_0)
$$

If $E[R_0] = E[R_1]$, then  $E[R_w]$ is constant.
We assume $E[R_0] \not= E[R_1]$ in what follows.

Given a target return $R$ we can find a weight $w\in\RR$ with $R = E[R_w]$.

__Exercise__. _Show the expected return of $R_w$ is $R$
if $w = (R - E[R_0])/(E[R_1] - E[R_0])$_.

_Hint_: Solve $R = E[R_0] + w(E[R_1] - E[R_0])$ for $w$.

If $R_0$ and $R_1$ have correlation 1 then $\Var(R_0 - R_1) = 0$.
If $R_0$ and $R_1$ have correlation -1 then $\Var(R_0 + R_1) = 0$.
In either case we have a redundant securities.
We assume $R_0$ and $R_1$ are not perfectly correlated in what follows.

Given a target standard deviation $\sigma$ it might not be possible
to find a weight $w$ with $\sigma = \sigma_w$, where
$\sigma_w^2$ is the variance of $R_w$.
Variance is quadratic in $w$ so there is a minimum.

__Exercise__: _Show $A - 2Bw + Cw^2$ is minimized when ${w = B/C}$ and the
minimum is ${A - B^2/C}$_.

_Hint_: Show $A - 2Bw + Cw^2 = A + (B/\sqrt{C} - w\sqrt{C})^2 - B^2/C$.

__Exercise__. _Show $\sigma_w$ is minimized when
${w = (\Var(R_0) - \Cov{R_0,R_1})/(\Var(R_0) - 2\Cov(R_0, R_1) + \Var(R_1))}$
and the minimum is ${\Var(R_0) - (\Var(R_0) - \Cov(R_0, R_1))^2/(\Var(R_0) - 2\Cov(R_0, R_1) + \Var(R_1))}$_.

For any values of $\sigma$ greater than the minimum there will be two weights
giving the same standard deviation.

__Exercise__: _If $\xi_0$ is risk-free show $\Var(R_w) = w^2\Var(R_1)$_.

This shows if a risk-free instrument is available,
we can achieve any non-negative target standard deviation.

__Exercise__. _Show $R_0 + (R_1 - R_0)\sigma/\sigma_1$ has standard deviation $\sigma$_.

This is called the _capital allocation line_ in the literature.
We call it matching a standard deviation target.

__Exercise__. _Show $(E[R_{\sigma/\sigma_1}] - R_0)/\sigma = (E[R_1] - R_0)/\sigma_1$
for any $\sigma > 0$_.

The _Sharpe ratio_ of a realized return $R$ is $S(R) = (E[R] - R_0)/\sigma$
where $R_0$ is the risk-free realized return. 
The exercise shows we cannot use a risk-free instrument to change the Sharpe ratio.


### Efficient

A portfolio is _efficient_ if its variance is less than or equal to all
other portfolios having the same expected realized return.
If $\Var(R_\zeta) = 0$ for some $\zeta\in\RR^I$ then $\zeta$
is clearly efficient and we say $\zeta$ is a _risk-free_
_zero coupon bond_.

Recall $\Var(\xi^*X) = \xi^*V\xi$ where $V = \Var(X)$.
If there is no risk-free security then $V$ is invertible.

Minimizing $\Var(R_\xi)$ given $\xi^*x = 1$ and $E[R_\xi] = \rho$ yields
$$
	\xi =  \lambda V^{-1}x + \mu V^{-1} E[X],
$$
where $V = \Var(X)$, $\lambda = (C - \rho B)/D$, $\mu = (-B + \rho A)/D$ with
$$
\begin{aligned}
A &= x^* V^{-1}x \\
B &= x^* V^{-1}E[X] = E[X]^*V^{-1}x \\
C &= E[X]^* V^{-1}E[X] \\
\end{aligned}
$$
and $D = AC - B^2$.
Note that $A$, $B$, $C$, and $D$ depend only on $x$, $E[X]$, and $E[XX^*]$.
This shows every efficient portfolio is a linear combination
of $V^{-1}x$ and $V^{-1} E[X]$.

The minimum variance solution is
$$
    \xi = \frac{C - \rho B}{D} V^{-1}x + \frac{-B + \rho A}{D} V^{-1}E[X].
$$
with variance
$$
	\Var(R_\xi) = \xi^* V\xi = (C - 2B\rho + A\rho^2)/D.
$$

## Rank one perturbation

$(A + vw^*)^{-1} = A^{-1} - A^{-1}vw^*A^{-1}/(1 + w^*A^{-1}v)$.

$((1 - \rho)I + \rho 11^*)^{-1} = \frac{1}{1 - \rho} I - \frac{1}{(1 - \rho)(1 - \rho + n)} 11^*$

$x = 1$, $X = R + Z$ where $R\in\RR^I$ and $E[Z] = 0$.

$\Var(X) = \Var(Z) = E[Z^*Z] = \delta(\sigma)((1 - \rho)I + \rho 11^*)\delta(\sigma)$.

$V^{-1} = 1/(1 - \rho)\delta(1/\sigma)(I - 11^*/(1 - \rho + n))\delta(1/\sigma)$

$V^{-1}1 = 1/(1 - \rho)\delta(1/\sigma)(1 - n1)/(1 - \rho + n))\delta(1/\sigma)$

$1^*V^{-1}1 = 1/(1 - \rho)\delta(1/\sigma)(n - n^2)/(1 - \rho + n))\delta(1/\sigma)$

<!--
### Arbitrage

_Arbitrage_ exists (for a model) if there is a portfolio $\xi\in\RR^I$
with negative cost $\xi^*x < 0$ and non-negative return $\xi^*X\ge0$.
You make money acquiring the portfolio and never lose money
when it is liquidated.

__Exercise__: _Let $x = \sum_j w_j X_j(\omega_j)$ where $w_j > 0$ and $\omega_j\in\Omega$.
Show if $\xi^*X\ge0$ then $\xi^*x \ge0$_.

This shows if $x$ belongs to the smallest cone containing the range of $X$,
${\ran X = \{X(\omega)\mid\omega\in\Omega\}}$,
then the model is arbitrage-free.

The Fundamental Theorem of Asset Pricing states there is no arbitrage
if and only if $x$ belongs to the smallest closed cone containing the range of $X$.
This is equivalent to the existence of a positive measure $D$ on $\Omega$
with $x = \int_\Omega X,dD$. In general, $D$ is not unique.

Let $Q = D/D(\Omega)$ so $Q(\Omega) = 1$
and $Q$ is called a _risk neutral_ probability measure.
We have $x = E[X]D(\Omega)$ under this measure.

__Exercise__. _Show the expected realized return of every portfolio under
a risk-neutral probability measure is $1/D(\Omega)$_.

_Hint_: $\xi^*x = E[\xi^*X]D(\Omega)$ so $E[R_\xi] = 1/D(\Omega)$.

__Exercise__: _If a one-period model admits a zero coupon bond, then
the discount is $D(\Omega)$_.

_Hint_: $\zeta^*X = 1$.

-->


<!--
Define the _standard basis_ vector $e_i\in\RR^I$, $i\in I$,
by $e_i(j) = 1$ if $i = j$ and $e_i(j) = 0$ if $i\not=j$.

__Exercise__. _Show $x = \sum_{i\in I} (e_i^*x) e_i$_.

_Hint_: Use $x_i = e_i^*x$.
-->

<!--
## Portfolio Construction
### Sharpe Ratio
The _Sharpe ratio_ of a portfolio $\xi$ is defined by
$$
	S_\xi = \frac{\rho_\xi - \rho_\zeta}{\sigma_\xi}.
$$
It is a measure of the tradeoff between return and risk as measured by the variablity of the return.

In general, portfolios with high return and low standard deviation are preferred.
One measure of this is the _Sharpe ratio_ 

Portfolio managers have existing postions constructed to 
achieve desired risk and return characteristics.
As markets change they need to adjust
their position to accomodate this.

## Efficient
### Efficient

A portfolio is _efficient_ if its variance is less than or equal to all
other portfolios having the same expected realzied return.
To find the most efficient feasible portfolio we minimize $\Var(R_\xi)$
subject to $\xi^*x = 1$.

__Exercise__. _Show $\Var(\xi^*X) = \xi^*\Var(X)\xi$_.

$\min (1/2)\Var(R_\xi) - \lambda(\xi^*x - 1)$

$0 = \xi^*V - \lambda x^*$

$\xi_0 = V^{-1}x/x^*V^{-1}x$.

$\min (1/2)\Var(R_\xi) - \lambda(\xi^*E[X] - r)$

$0 = \xi^*V - \lambda x^*$

$\xi_0 = V^{-1}x/x^*V^{-1}x$.

An efficient portfolio has the minimum variance for a given return.
The Capital Asset Pricing Model shows every efficient portfolio
is a linear combination of any two independent efficient porfolios.
-->
<!--
### Arbitrage

_Arbitrage_ exists (for a model) if there is a portfolio $\xi\in\RR^I$
with negative cost $\xi^*x < 0$ and non-negative return $\xi^*X\ge0$.
You make money acquiring the portfolio and never lose money
when it is liquidated.

__Exercise__: _Let $x = \sum_j w_j X_j(\omega_j)$ where $w_j > 0$ and $\omega_j\in\Omega$.
Show if $\xi^*X\ge0$ then $\xi^*x \ge0$_.

This shows if $x$ belongs to the smallest cone containing the range of $X$,
${\ran X = \{X(\omega)\mid\omega\in\Omega\}}$,
then the model is arbitrage-free.

The Fundamental Theorem of Asset Pricing states there is no arbitrage
if and only if $x$ belongs to the smallest closed cone containing the range of $X$.
This is equivalent to the existence of a positive measure $D$ on $\Omega$
with $x = \int_\Omega X,dD$. In general, $D$ is not unique.

Let $Q = D/D(\Omega)$ so $Q(\Omega) = 1$
and $Q$ is called a _risk neutral_ probability measure.
We have $x = E[X]D(\Omega)$ under this measure.

__Exercise__. _Show the expected realized return of every portfolio under
a risk-neutral probability measure is $1/D(\Omega)$_.

_Hint_: $\xi^*x = E[\xi^*X]D(\Omega)$ so $E[R_\xi] = 1/D(\Omega)$.

__Exercise__: _If a one-period model admits a zero coupon bond, then
the discount is $D(\Omega)$_.

_Hint_: $\zeta^*X = 1$.

-->


<!--
Define the _standard basis_ vector $e_i\in\RR^I$, $i\in I$,
by $e_i(j) = 1$ if $i = j$ and $e_i(j) = 0$ if $i\not=j$.

__Exercise__. _Show $x = \sum_{i\in I} (e_i^*x) e_i$_.

_Hint_: Use $x_i = e_i^*x$.
-->

$x = (1, 1)$, $X = R + Z$, $E[Z] = 0$

$$
V = 
\begin{bmatrix}
\Var(R_0) & \sigma_0\sigma_1\rho \\
\sigma_0\sigma_1\rho & \Var(R_1) \\
\end{bmatrix}
$$
$$
V^{-1} = \frac{1}{\Var(R_0)\Var(R_1)(1 - \rho^2)}
\begin{bmatrix}
\Var(R_1) & -\sigma_0\sigma_1\rho \\
-\sigma_0\sigma_1\rho & \Var(R_0) \\
\end{bmatrix}
$$

$$V^{-1}x = \frac{1}{\Var(R_0)\Var(R_1)(1 - \rho^2)}
\begin{bmatrix}
\Var(R_1) - \sigma_0\sigma_1\rho \\
-\sigma_0\sigma_1\rho + \Var(R_0) \\
\end{bmatrix}
$$

$$
x^*V^{-1}x = \frac{1}{\Var(R_0)\Var(R_1)(1 - \rho^2)}
(\Var(R_1) - 2\sigma_0\sigma_1\rho + \Var(R_0))
$$



