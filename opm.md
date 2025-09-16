---
title: One-Period Model
author: Keith A. Lewis
institution: KALX, LLC
email: kal@kalx.net
classoption: fleqn
abstract: Buy now, sell later.
...

\newcommand\RR{\boldsymbol{R}}
\newcommand\ran{\operatorname{ran}}
\newcommand\Var{\operatorname{Var}}
\newcommand\Cov{\operatorname{Cov}}
\newcommand\BB{\mathcal{B}}
\newcommand\GG{\mathcal{G}}

The One‑Period Model provides the simplest formal framework for
describing a financial market. It specifies the initial prices of
available instruments at the beginning of a period and their terminal
prices at the end, depending on what occured.
We make the usual unrealistic assumptions that prices are real numbers
instead of integral multiples of each instrument's minimum trading amount, 
and there is no bid-ask spread depending on the amount being bought or sold,
much less the counterparties involved in trading that affect pricing.

Let $I$ be the set of market _instruments_ available at the beginning and end of a time period
and let $\Omega$ be the set of possible outcomes.

The _One Period Model_ consists of a set or market _instruments_, $I$,
available for trading at the beginning and the end of a period.
The set of possible _outcomes_, $\Omega$, is what can happen over the period.
The _prices_ at the beginning of the period are a vector $x\in\RR^I$[^1].
The prices at the end of the period are a function $X\colon\Omega\to
\RR^I$ where $X(\omega)\in\RR^I$ are the instrument prices if
$\omega\in\Omega$ occurred.

[^1]: Recall the _set exponential_ $B^A = \{f\colon A\to B\}$ is the
set of all functions from the set $A$ to the set $B$.
If $x\colon I\to\RR$ then $x(i)$ is the price of instrument $i\in I$.
The _dot product_ of $x,y\in\RR^I$ is $x\cdot y = \sum_{i\in I}x_i y_i$
if $I$ is finite. The _Euclidean norm_ of $x\in\RR^I$ is defined by $\|x\| = \sqrt{x\cdot x}$.

## Binomial Model

The _binomial model_ has a bond and stock where $x = (1, s)$,
$X(\omega) = (R, \omega)$, and $\Omega = \{L, H\}$ with
${L < H}$.
The bond has realized return $R$ and the stock can go from price $s$
to either $L$ or $H$.  A somewhat more realistic model is
${\Omega = [L, H]}$ where the final stock price can be any value in the interval.

## Arbitrage

A _position_ $\xi\in\RR^I$ is the number of shares held in each instrument.
The cost of acquiring the initial position is $\xi\cdot x$.
The value of liquidating the final position is $\xi\cdot X(\omega)$ if $\omega\in\Omega$ occurred.

_Arbitrage_ exists in a one-period model if there is a position $\xi\in\RR^I$
with $\xi\cdot x < 0$ and ${\xi\cdot X(\omega)\ge0}$ for all $\omega\in\Omega$:
you make money acquiring the initial position and don't lose money when
unwinding it at the end of the period.

Some authors define arbitrage as a portfolio with $\xi\cdot x = 0$ and
$\xi\cdot X$ is non-negative and strictly positive on some set having positive probability.
We haven't specified a probability measure so we can't use this definition.
No trader would consider that to be an arbitrage anyway. 
Even though the position costs nothing to put on, that definition has nothing
to say about how much they will make nor how likely it is they will make it.

Even our stronger definition is still not good enough for traders
and risk managers.
Even though $\xi\cdot x$ is strictly negative they will consider
how much capital will be tied up putting on that position and compute
the ratio $\xi\cdot x/|\xi|\cdot |x|$. If it is small
they will take a pass on that "arbitrage" opportunity.
No business would approve using a million dollars from their funding account
to make at a penny even though that satisfies the mathematical definition of arbitrage.

__Exercise__. _If $Rs\notin [L,H]$ in the binomial model then there is an arbitrage_.

_Hint_: If $Rs > H$ the bond is always more valuable than the stock
so short the stock and buy bond.
If $Rs < L$ the bond is always less valuable than the stock
so short the bond and buy the stock.

<details><summary>Solution</summary>
If $Rs > H$ take $\xi = (H, -R)$ so $\xi\cdot x = H - Rs < 0$,
${\xi\cdot X(L) = HR - RL > 0}$,
and ${\xi\cdot X(H) = HR - RH = 0}$,
so $\xi\cdot X\ge0$ on $\{L,H\}$.

If $Rs < L$ take $\xi = (-L, R)$ so $\xi\cdot x = -L + Rs < 0$,
${\xi\cdot X(L) = -LR + RL = 0}$,
and ${\xi\cdot X(H) = -LR + RH > 0}$,
so $\xi\cdot X\ge0$ on $\{L,H\}$.

This argument also holds for the somewhat more realistic model
with $\Omega = [L, H]$.
</details>

## Cone

A _cone_ $C$ is a subset of a vector space closed under positive scalar
multiplication and vector addition.

__Exercise__. _A cone is convex_.

_Hint_: Show $x,y\in C$ implies $tx + (1-t)y\in C$ for $0 < t < 1$.

<details><summary>Solution</summary>
Since $t > 0$ and $1 - t > 0$ both $tx$ and $(1 - t)y$ belong to $C$,
hence $tx + (1 - t)y\in C$.
</details>

__Exercise__. _The set of arbitrage positions is a cone_.

<details><summary>Solution</summary>
If $\xi$ is an arbitrage then $t\xi$ is an arbitrage for $t > 0$.
If $\xi$ and $\eta$ are arbitrages then so is $\xi + \eta$.
</details>

The smallest cone containing the range of $X$,
$\ran X = X(\Omega) = \{X(\omega)\mid \omega\in\Omega\}$, is the set of finite
linear combinations $\sum_i X(\omega_i) \pi_i$, $\pi_i > 0$, $\omega_i\in\Omega$.
If $x = \sum_i X(\omega_i) \pi_i$ is in the cone
and $\xi\cdot X$ is non-negative on $\Omega$ then ${\xi\cdot x\ge 0}$
so no arbitrage exists.

__Exercise__. _If $x$ belongs to the smallest_ closed _cone containing
the range of $X$ then there is no arbitrage_.

<details><summary>Solution</summary>
If $x_n\in C$ converge to $x$ in norm and $\xi\cdot x_n\ge0$ then $\xi\cdot x\ge0$.
</details>

## Fundamental Theorem of Asset Pricing

__Theorem__.  _Arbitrage exists in
the one-period model if and only if $x$ does not belong to the smallest
closed cone containing the range of $X$. If $x^*$ is the closest point
in the cone then $\xi = x^* - x$ is an arbitrage_.

The previous exercise proves the "easy" direction.
The contra-positive follows from the

__Lemma__. _If $x\in\RR^n$ and $C$ is a closed cone in
$\RR^n$ with $x\not\in C$ then there exists ${\xi\in\RR^n}$
with ${\xi\cdot x < 0}$ and ${\xi\cdot y \ge0}$ for ${y\in C}$._

_Proof._ Let $x^*$ be the point in $C$ closest to $x$.
It exists since $C$ is closed and is unique since $C$ is convex.

Since $ty + x^*\in C$ for any $t > 0$ and $y\in C$ 
we have $\|x^* - x\| \le \|ty + x^* - x\|$.
Simplifying gives ${t^2||y||^2 + 2t\xi\cdot y\ge 0}$. 
Dividing by $t > 0$ and letting $t$ decrease to 0 shows ${\xi\cdot y\ge 0}$
for all $y\in C$.

We also have $\|x^* - x\| \le \|tx^* + x^* - x\|$ for $t + 1 > 0$.
Simplifying gives ${t^2||x^*||^2 + 2t\xi\cdot x^*\ge 0}$ for  $t > -1$.
Dividing by $t < 0$ and letting $t$ increase to 0 shows ${\xi\cdot x^*\le 0}$ so
${0 < ||\xi||^2 = \xi\cdot (x^* - x) \le -\xi\cdot x}$ hence ${\xi\cdot x < 0}$.

The lemma proves the "hard" direction of the FTAP
and that $\xi = x^* - x$ implements an arbitrage.

Note the lemma is a purely geometric fact.
It is similar to Farkas' lemma and is a special case of the Hahn-Banach theorem
in finite dimensional space.

## Application

For the binomial model the smallest closed cone containing the range of $X$
is ${\{X(L)\pi^- + X(H)\pi^+\mid \pi^-,\pi^+\ge0\}}$.
If $(1, s)$ is in the cone then ${(1,s) = (R, L)\pi^- + (R, H)\pi^+}$
for some $\pi^-,\pi^+\ge0$. Solving for $\pi^-$ and $\pi^+$ gives
the no arbitrage condition $L \le Rs \le R^+$.

__Exercise__. _Show $\pi^- = (H - Rs)/R(H - L)$ and $\pi^+ = (Rs - L)/R(H - L)$_.

If $Rs > H$ then $(R, s)$ is above the line through the origin with
slope $R/H$ so $\xi$ should be proportional to $(H, -R)$.
If $Rs < L$ then $(R, s)$ is below the line through the origin with
slope $R/L$ so $\xi$ should be proportional to $(-L, R)$.

If we add an option with payoff $\nu$ to the binomial model then
$x = (1, s, c)$ and $X(\omega) = (R, \omega, \nu(\omega))$, $\omega\in\{L,H\}$.
There is no arbitrage if and only if $(1, s, c) = X(L)\pi^- + X(H)\pi^+$
for some $\pi^-,\pi^+\ge0$. The first two equations determine $\pi^-$ and $\pi^+$ as
above so $v = \nu(L)\pi^- + \nu(H)\pi^+$.
Every option payoff is linear in the binomial model.

__Exercise__. _Find $a,b\in\RR$ with $aR + b\omega = \nu(\omega)$ for $\omega\in\{L,H\}$_.

A slightly more interesting model is a bond with zero interest rate, a stock that
can go from 100 to 90, 100, or 110, and an at-the-money call option with price $v$.
The model is $x = (1, 100, v)$, $X(\omega) = (1, \omega, \max\{\omega - 100, 0\})$,
$\omega\in\{90, 100, 110\}$.
The smallest closed cone containing the range of $X$
is $\{aX(90)  + bX(100) + cX(110)\mid a,b,c\ge0\}$.

__Exercise__. _Show $x$ belongs to the cone if and only if $0\le v\le 5$.

_Hint_. $1 = a + b + c$, $s = 90a + 100b + 110c$ and $v = 10c$.
Show $a = c$ and $b = 1 - 2c$.

The FTAP proves the model is arbitrage-free if and only if the option value is between $0$ and $5$

__Exercise__. _Show the model without the bond is arbitrage-free if and only the option value
is between $0$ and $100/11 < 10$_.

_Hint_: Consider $\{(90, 0)a + (100, 0)b + (110, 10)c\mid a,b,c\ge0\}$.
The smallest closed cone is bounded below by $y = 0$ and above
by $y = (10/110)x$.

<!--
### Grassmann Algebra

We can also solve this using Grassmann Algebra. If $E$ is Euclidean
space define $\GG(E)$ to be the (associative) algebra of points in $E$ with the
condition $PQ = 0$ if and only if $P = Q$ so $PP = 0$. Note $PQ = -QP$
since $(P + Q)(P + Q) = 0$. If $PQ = aRS$ for some scalar $a$ we
say $PQ$ is _congruent_ to $RS$ and write $a = \frac{PQ}{RS}$. If $R = aP + bQ$ then $RPQ = 0$.
Furthermore $PR = bPQ$ and $RQ = aPQ$ so
$R = \frac{RQ}{PQ} P + \frac{PR}{PQ} Q$.

This generalizes to any number of dimensions. If $P_0\cdots P_k = aQ_0\cdots Q_k$
then $a = \frac{P_0\cdots P_k}{Q_0\cdots Q_k}$ and if $PP_0\cdots P_k = 0$ then
$$
	P = \sum_{j=0}^k \frac{P_0\cdots P\cdots P_k}{P_0\cdots P_k} P_j
$$
if $P_0\cdots P_k\not=0$ where $P$ in the numerator takes the $j$-th spot.
Note if $\sum_{j=0}^k a_j P_j = 0$ then $a_j = 0$ for $0\le j\le k$
and we say the $P_j$ are _linearly independent_.
Note the sum of the coefficients is 1 and $P$ is in the convex hull
of $P_0,\ldots,P_n$ if and only if all coefficients are non-negative.

The _weight_ of $aP + bQ$ is $a + b$. Every point having weight 1 on the line determined
by the points $P$ and $Q$ has the form ${R(t) = (1 - t)P + tQ = P + t(Q - P)}$.
Note $Q - P\not= R(t)$ for any $t$. As $t$ goes to infinity $(1 - t)/t$ goes to $-1$
and we interpret $R(\infty) = Q - P$ as the point at infinity determined by $P$ and $Q$
and call it the _vector_ from $P$ to $Q$. As $t$ goes to negative infinity
we get $R(-\infty) = P - Q = -R(\infty)$.

In the last problem above using only the stock and option,
let $O = (0,0)$ be the origin, $P_1 = (0,1)$, and $P_2 = (1,0)$.
We call $E_1 = P_1 - O$ the _stock direction_ and $E_2 = P_2 - O$ the _option direction_.
Note
${X(90) = (90, 0) = O + 90E_1 + E_2}$,
${X(100) = (100, 0) = O + 100E_1 + E_2}$, and
${X(110) = (110, 1) = O + 110E_1 + E_2}$.
Since $OX(90)X(100) = 0$ we know $X(100)$ is a linear combination of $O$ and $X(90)$

The smallest cone containing the range of $X$ is the set of all linear
combinations of $X(\omega) - O$, $\omega\in\{90,100,110\}$, with non-negative
coefficients. Since $X(90) - O = .9(X(100) - O)$ we need only
consider $\omega\in\{90,110\}$ so the cone is
$$
\{O + t_{90} 90 E_1 + t_{100} 100 E_1 + t_{110}(110E_1 + 10E_2)\mid t_{90},t_{100},t_{110}\ge 0\}
$$
This is clearly the same a $\{O + tE_1 + u(11E_1 + E_2)\mid t,u\ge0\}$.
Note $x = O + 100E_1 + vE_2$ if the initial option price is $v$
and $v = \frac{OE_1x}{OE_1E_2}$.

By Grassmann Algebra, $t = \frac{Ox(11E_1+E_1)}{OE_1(11E_1 + E_2)}$
and $u = \frac{OE_1x}{OE_1(11E_1 + E_2)}$.
Since $Ox(11E_1+E_1)
= O(O + 100E_1 + vE_2)(11E_1+E_2)
= 100 OE_1E_2 + 11v OE_2E_1 = (100 - 11v) OE_1E_2$ we have $t = 100 - 11v$.
Since $O E_1 x = O E_1 (O + 100E_1 + vE_2) = v O E_1 E_2$
we have $u = v$ so $x$ is in the cone if and only
if $100 - 11v \ge0$ and $v\ge0$ hence $0\le v\le 100/11$.

A more interesting example is the case of options at multiple strikes.
By put-call parity we can assume they are all calls. The sample space is
$\Omega = [L, H]$ containing all strikes and $\omega\in\Omega$ is the final stock price.
The initial prices are $x = (1, s, v_1,\ldots,v_n)$
and the final prices are $X(\omega) = (R, \omega, (\omega - K_1)^+,\ldots,(\omega - K_n)^+)$
The range of $X$ is $\{X(\omega)\mid L\le \omega\le H\}$.
The smallest cone containing the range of $X$ is
$$
	\{tX(L) + uX(H) \sum_{j=1}^n t_n X(K_j)\mid t,u,t_j\ge0\}
$$
where $L < K_1 < \cdots < K_n < H$. If $E_0 = P_0 - O$ is the bond direction
-->

## Reality

If you are willing to assume prices are bounded, as they are in the real world, then
the one-period model should require $X\colon\Omega\to\RR^I$ is bounded.
This is not the case in the Black-Scholes/Merton continuous time model of lognormal stock prices.
Scholes and Merton won a Nobel prize "for a new method to determine the value of derivatives."
Their assumptions eliminated the need to measure the real-world return on a stock. 
There is still a Nobel prize to be won by someone who can come up with a generally accepted
way to determine the volatility of a stock.
And perhaps multiple future prizes for those who develop theories
not founded on the mathematical fictions of continuous time trading and unbounded prices.

## FTAP

We will assume $X\colon\Omega\to\RR^I$ is bounded so $\|X\| = \sup_{\omega\in\Omega}|X(\omega)|$ is finite,
just as it is in the real world. We write this ${X\in B(\Omega,\RR^I)}$, the normed vector space
of bounded $\RR^I$-valued functions.
If $x\in\RR^I$ and $X\colon\Omega\to\RR^I$ is bounded then there is no arbitrage
if and only if $x = \int_\Omega X(\omega)\,dD(\omega)$ for some positive, bounded, finitely additive
measure $D\in ba(\Omega)$ on $\Omega$, but this requires a bit more math to establish.
See [@DunSch1958].
We call any such measure _risk-neutral_, although _risk-blind_ might be more appropriate.
In general, risk-neutral measures are not unique.

If a zero coupon bond exists then $D(\Omega)$ is its price.
A _zero coupon bond_ is a portfolio $\zeta\in\RR^I$ with 
${\zeta\cdot X(\omega) = 1}$ for all ${\omega\in\Omega}$.
The _price_, or _discount_, of a zero coupon bond is
${\zeta\cdot x = \int_\Omega \zeta\cdot X(\omega)\,dD(\omega) = D(\Omega) = D}$.
The measure ${D/D(\Omega)}$ is positive and has mass 1 so ${x = E[X]D}$ if we pretend it is a probability
measure.

Define the map $M_X\colon\RR^I\to B(\Omega)$ by $M_X(\xi) = \xi\cdot X$.
We can and do assume $M_X$ is one-to-one, otherwise there would be redundant market instruments.
We say prices $X$ form a _complete market_ if $M_X$ is _onto_.

__Exercise__. _Show the market is complete implies the cardinality of $\Omega$
is less than or equal to the cardinality of $I$_.

_Hint_: If $T\colon V\to W$ is a linear operator between 
vector spaces that is onto, then the dimension of $V$ is greater than
or equal to the dimension of $W$.

<details><summary>Solution</summary>
The image of a basis of $V$ under any linear operator cannot be a basis of $W$ if the dimension
of $V$ is less than the dimension of $W$.
</details>

Although complete markets are common in mathematical finance books, they almost
never occur in models faithful to the real world.

## Return

The _realized return_ on a portfolio $\xi\in\RR^I$ is ${R_\xi = \xi\cdot X/\xi\cdot x}$
whenever ${\xi\cdot x\not=0}$.

__Exercise__. _Show $R_\xi = R_{t\xi}$ for any non-zero $t\in\RR$_.

If $\xi\cdot x = 1$ then $R_\xi = \xi\cdot X$. One unit invested at the beginning
of the period results in ${R_\xi\colon\Omega\to\RR}$ at the end of the period.
Every portfolio has the same expected realized return under a risk-neutral measure.
This is why I suggest the term _risk-blind_ instead.

__Exercise__. _If $D$ is a risk-neutral measure then $R = E[R_\xi] = 1/D(\Omega)$
is constant for any portfolio $\xi\in\RR^I$_.

_Hint_: The expectation is with respect to the "probability" measure $DR = D/D(\Omega)$.

This shows $\xi\cdot X = E[\xi\dot X D(\Omega)]$.

## Hedging

Let $\nu\colon\RR^I\to\RR$ be the _payoff_ of a derivative instrument.
If there exists $\gamma\in\RR^I$ with $\nu(X) = \gamma\cdot X$ then
$E[\nu(X)/R] = \gamma\cdot x$
so the cost of setting up the perfect hedge is $E[\nu(X)/R]$.

We can always compute $\gamma = (d/dx)E[\nu(X)/R]$ and the above shows
$E[\nu(X)/R] = \gamma\cdot X$.
The variance $\Var(\nu(X) - \gamma\cdot X)$ is a measure of how
good the hedge is.




## Probability

We now assume there is a probability measure $P$ on $\Omega$ representing
the real-world event probabilities.

Let $U\colon B(\Omega)\to\RR$ be a _utility function_.
A common choice is $U(Y) = E[Y] - \alpha \Var(Y)$ for some positive risk parameter $\alpha\in\RR$.
Note if $Y\in B(\Omega)$ then moments of all orders exist.

To find a portfolio that maximizes the utility of the realized return we use Lagrange multipliers
to solve
$$
	\max_\xi U(\xi\cdot X) - \lambda(\xi\cdot x - 1).
$$

We need to compute the [Fréchet Derivatives](fd.html) of $D(UM_X)$ where $M_X\xi = \xi\cdot X$ is
the market map as above. The chain rule gives $D(UM_X)\xi = DU(M_x\xi)DM_X\xi = DU(M_x\xi)M_X\xi$
since $DM_X = M_X$.
Note $DU(M_x\xi)$ is in $B(\Omega)^*$ and $M_X\xi\in B(\Omega)$.

The first order condition is $0 = DU(\xi\cdot X)M_X\xi - \lambda x^*$ for all $\xi\in\RR^I$.

$\Var(\xi^T X - \nu(X)) = \xi^T\Var(X)\xi - 2\Cov(X^T, \nu(X))\xi + \Var(\nu(X))$.

$\|A\xi - b\|^2 = \xi^T A^TA \xi - 2b^TA\xi + \|b\|^2$

$\Var(X) = \Cov(X,X) = A^T A$. $\Cov(X^T, \nu(X)) = E[X^T,\nu(X)] = E[X]^TE[\nu(X)]$.

## References

<!--

## Maximum Entropy

The _entropy_ of a measure on a finite set $Ω = \{ω_j\}$ with $P(\{ω_j\}) = p_j$, $p_j \ge0$,
is $H = -\sum_j p_j \log p_j$.

$Φ = -\sum_j p_j \log p_j - λ(\sum_j p_j - 1) - μ'(E[X] - Rx)$

$\partial Φ/\partial p_j = -1 - \log p_j - λp_j - μ_j X(ω_j)$

$\partial Φ/\partial λ = \sum_j p_j - 1$

$\partial Φ/\partial μ = E[X] - Rx$

$p_j = \exp(-1 - λ(\sum_j p_j - 1) - μ'(E[X] - Rx))$

$1 = \sum_j p_j = \sum_j \exp(-1 - λ(\sum_j p_j - 1) - μ'(E[X] - Rx))$

$Rx = E[X] = \sum_j X(ω_j) \exp(-1 - λ(\sum_j p_j - 1) - μ'(E[X] - Rx))$

-->
