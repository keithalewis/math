---
title: One-Period Model
author: Keith A. Lewis
institution: KALX, LLC
email: kal@kalx.net
classoption: fleqn
abstract: Simplest formal model of a financial market.
...

\newcommand\RR{\boldsymbol{R}}
\newcommand\ZZ{\boldsymbol{Z}}
\newcommand\ran{\operatorname{ran}}
\newcommand\Var{\operatorname{Var}}
\newcommand\Cov{\operatorname{Cov}}
\newcommand\co{\operatorname{co}}
\newcommand\sgn{\operatorname{sgn}}
\newcommand\cone{\operatorname{cone}}
\newcommand\BB{\mathcal{B}}
\newcommand\GG{\mathcal{G}}


The One‑Period Model provides the simplest formal framework for
describing a financial market over a single period where
trading is allowed only at the start and end of the period.
It specifies the prices of
available instruments at the start of the period and their
prices and cash flows at the end depending on what occurred.
We make the usual unrealistic assumptions that prices are real numbers
instead of integral multiples of each instrument's minimum trading increment/tick size
and there is no bid-ask spread depending on the amount being bought or sold,
much less any consideration of the credit rating of counterparties involved or tax issues.
We also ignore the fact instruments can only be purchased in integral multiples
of their minimum share/lot size.
The [appendix](#appendix) proposes a model that can incorporate more realistic assumptions.

Quants turn mathematical models into software that traders use.
If they roll out a model that is not arbitrage-free then
customers will go long on trades that are underpriced and
short trades that are over overpriced. Eventually trading
reality catches up and the firm loses money.
Even worse, a "clever" trader might find an internal arbitrage in
the system they use to give the appearance of making profit.

The Fundamental Theorem of Asset Pricing identifies arbitrage-free models
and provides an arbitrage if they are not. As [@Ros1978] showed, this is
a purely geometric result having nothing to do with probability.
Positive measures with mass one make an appearance, but they are not
the probability of anything.

## One-Period Model

The _One-Period Model_ consists of a finite set of market _instruments_, $I$,
available for trading at the start and end of a period.
The set of possible _outcomes_, $\Omega$, is what can happen over the period.
The _prices_ at the beginning of the period are a vector ${x\in\RR^I}$[^1].
The prices at the end of the period are a function ${X\colon\Omega\to
\RR^I}$ where ${X(\omega)\in\RR^I}$ are the instrument prices if
${\omega\in\Omega}$ occurred. Instruments can have associated
cash flows such as bond coupons or stock dividends. We use
${C\colon\Omega\to\RR^I}$ to denote the cash flows paid at the end of the period.

[^1]: Recall the _set exponential_ ${B^A = \{f\colon A\to B\}}$ is the
set of all functions from the set $A$ to the set $B$.
If ${x\colon I\to\RR}$ then $x(i)$ is the price of instrument $i\in I$.
We can identify $\RR^I$ with the cartesian product of $I$ copies of $\RR$.
The function $x\colon I\to\RR$ corresponds to the $I$-tuple
$(x_i)_{i\in I}$ by $x_i = x(i)$. The vector space $\RR^n$ is defined
as the set of all $n$-tuples ${(x_1,\ldots,x_n)}$ where ${x_i\in\RR}$.
This corresponds the to set exponential ${\RR^{\{1,\ldots,n\}}}$.

### Binomial Model

The _binomial model_ (with no dividends) has instruments a bond and stock where ${x = (1, s)}$,
${X(\omega) = (R, \omega)}$, and ${\Omega = \{L, H\}}$ with ${L < H}$.
The bond has realized return $R$ and the stock can go from price $s$
to either $L$ or $H$.  A somewhat more realistic model is
${\Omega = [L, H]}$ where the final stock price can be any value in the interval.

The bond could be a cash deposit or Treasury bill that has a cash flow at the end of the period.
These are typically quoted as a _yield_ having a _day count basis_ that can be used
to calculate the realized return. T-bills use Actual/360 day count basis. The quoted
yield $y$ indicates the price now of unit notional received in $t$ days is ${1 - yt/360}$.
The realized return $R$ is the reciprocal of this.

## Arbitrage

A _position_ $\xi\in\RR^I$ is the number of shares purchased in each
instrument. The cost of acquiring the initial position is the inner product
${\xi\cdot x = \sum_{i\in I}\xi(i) x(i)}$.
The value of liquidating the position at the end of the period is ${\xi\cdot(X(\omega) + C(\omega))}$
if $\omega\in\Omega$ occurred. The one-period model implicitly
assumes the position is liquidated and the prices and cash flows are
received in proportion to the position at the end of the period.

_Arbitrage_ exists in a one-period model if there is a position $\xi\in\RR^I$
with ${\xi\cdot x < 0}$ and ${\xi\cdot (X(\omega) + C(\omega))\ge0}$ for all ${\omega\in\Omega}$:
you make money acquiring the initial position and don't lose money when
unwinding it at the end of the period.

Some authors define arbitrage as a portfolio with ${\xi\cdot x = 0}$ and
${\xi\cdot X}$ is non-negative and strictly positive on some set having positive probability.
We haven't specified a probability measure so we can't use this definition.
No trader would consider that to be an arbitrage anyway. 
Even though the position costs nothing to put on, that definition has nothing
definite to say about how much they will make nor how likely it is they will make it.

Even our stronger definition is still not good enough for traders
and risk managers.
Even though ${\xi\cdot x}$ is strictly negative they will compute ${|\xi|\cdot|x|}$
as a measure of how much capital will be tied up putting on the position.
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
where the final stock price can be any value between the low and the high,
i.e., $\Omega = [L, H]$.
</details>

## Fundamental Theorem of Asset Pricing

A _cone_ $C$ is a subset of a vector space closed under positive scalar
multiplication and vector addition: if $x\in C$ then $tx\in C$ for $t > 0$
and if $x,y\in C$ then ${x + y\in C}$.

__Exercise__. _A cone is convex_.

_Hint_: Show $x,y\in C$ implies ${tx + (1-t)y\in C}$ for ${0 < t < 1}$.

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
linear combinations of point in the range with positive coefficient,
$\sum_i X(\omega_i) \pi_i$, $\pi_i > 0$, $\omega_i\in\Omega$.
If $x = \sum_i X(\omega_i) \pi_i$ is in the cone
and $\xi\cdot X$ is non-negative on $\Omega$ then ${\xi\cdot x\ge 0}$
so no arbitrage exists.

__Exercise__. _If $x$ belongs to the smallest_ closed _cone containing
the range of $X$ then there is no arbitrage_.

<details><summary>Solution</summary>
If $x_n\in C$ converge to $x$ in norm and $\xi\cdot x_n\ge0$ then $\xi\cdot x\ge0$.
</details>

The contrapositive is also true.

__Theorem__.  _Arbitrage exists in
the one-period model if $x$ does not belong to the smallest
closed cone containing the range of $X$. If $x^*$ is the closest point
in the cone then $\xi = x^* - x$ is an arbitrage_.

In general, the arbitrage is not unique. We will establish the theorem using
the purely geometric

__Lemma__. _If $x\in\RR^n$ and $C$ is a closed cone in
$\RR^n$ with $x\not\in C$ then there exists ${\xi\in\RR^n}$
with ${\xi\cdot x < 0}$ and ${\xi\cdot y \ge0}$ for ${y\in C}$._

_Proof._ Let $x^*$ be the point in $C$ closest to $x$.
It exists since $C$ is closed and is unique since $C$ is convex.

Since $ty + x^*\in C$ for any $t > 0$ and $y\in C$ 
we have $\|x^* - x\| \le \|ty + x^* - x\|$.
Simplifying gives ${t^2||y||^2 + 2t\xi\cdot y\ge0}$. 
Dividing by $t > 0$ and letting $t$ decrease to 0 shows ${\xi\cdot y\ge0}$
for all $y\in C$.

Since $(t + 1)x^*\in C$ for $t + 1 > 0$
we have $\|x^* - x\| \le \|(t + 1)x^* - x\|$.
Simplifying gives ${t^2||x^*||^2 + 2t\xi\cdot x^*\ge 0}$ for  $t > -1$.
Dividing by $t < 0$ and letting $t$ increase to 0 shows ${\xi\cdot x^*\le 0}$ so
${0 < ||\xi||^2 = \xi\cdot (x^* - x) \le -\xi\cdot x}$ hence ${\xi\cdot x < 0}$.

The lemma proves the FTAP and that $\xi = x^* - x$ implements an arbitrage.

If we assume prices are bounded, as they are in the real world, then every point 
in the closed convex cone generated by the range of $X$ can
be written $\int_\Omega X(\omega)\,dD(\omega)$ for some positive, bounded, finitely additive
measure $D\in ba(\Omega)$ on $\Omega$,
but this requires a bit more math to establish.
See [@DunSch1958].
We call any such measure _risk-neutral_.
Risk-neutral measures are not generally unique.

A _zero coupon bond_ pays 1 unit at the end of the period on every outcome.
A portfolio $\zeta\in\RR^I$ with 
${\zeta\cdot X(\omega) = 1}$ for all ${\omega\in\Omega}$
is a zero coupon bond.
The _price_, or _discount_, of a zero coupon bond is
${\zeta\cdot x = \int_\Omega \zeta\cdot X(\omega)\,dD(\omega) = D(\Omega)}$.
The measure ${D/D(\Omega)}$ is positive and has mass 1 so ${x = E[X]D(\Omega)}$
if we pretend it is a probability measure.

__Exercise__. _If $\zeta$ is a zero coupon bond with only one non-zero component then
that component is equal to the discount_.

If $\xi\cdot X = 0$ then one instrument is a linear combination of the others
and can be removed. This can be repeated until $\xi\cdot X\not=0$ for
any $\xi\in\RR^I$. If so the map $\xi\mapsto\xi\cdot X$ is one-to-one.
A model is _complete_ if this map is _onto_. This cannot be the
case if the cardinality of $I$ is less than the cardinality of $\Omega$.
In general the number of instruments is much smaller than the
number of outcomes.
Although complete markets are common in mathematical finance books, they
never occur in models faithful to the real world.

### Realized Return

The _realized return_ on a portfolio $\xi\in\RR^I$ is ${R_\xi = \xi\cdot X/\xi\cdot x}$
whenever ${\xi\cdot x\not=0}$.

__Exercise__. _Show $R_\xi = R_{t\xi}$ for any non-zero $t\in\RR$_.

This is actually a deleterious feature of the model. Going long or short typically
git diff main origin/maingit diff main origin/mainaffects the realized return. It also implies a portfolio strategy can be scaled
to arbitrarily large positions. At some point you will run out of instruments to buy
and sell.

If $\xi\cdot x = 1$ then $R_\xi = \xi\cdot X$. One unit invested at the beginning
of the period results in ${R_\xi\colon\Omega\to\RR}$ at the end of the period.
Every portfolio has the same expected realized return under a risk-neutral measure
so perhaps this should be called a _risk-blind_ measure.

__Exercise__. _If $D$ is a risk-neutral measure then the expected realized return
$R = E[R_\xi] = 1/D(\Omega)$ is constant for any portfolio $\xi\in\RR^I$_.

_Hint_: The expectation is with respect to the "probability" measure $DR = D/D(\Omega)$.

## CAPM

The [Capital Asset Pricing Model](capm.html) is the one-period model with a probability measure
specified on $\Omega$. [@Mar1952] assumed the probability measure was a jointly normal
distribution on final prices, 

## Grassmann Algebra

We now show how to use the geometric algebra [@Gra1844] invented to solve problems
involving arbitrage free models.

Let $E$ be the set of points in space. The Grassmann algebra $\GG(E)$
is the algebra over the real numbers generated by points in $E$ with the condition
$PQ = 0$ if and only if $P = Q$ for $P,Q\in E$. In particular $PP = 0$. Multiplication is
associative so $(PQ)R = P(QR)$ and we can write $PQR$ unambiguously.

__Exercise__. _Show $PQ = -QP$_.

_Hint_: $0 = (P + Q)(P + Q) = PP + PQ + QP + QQ$.

__Exercise__. _Show $P(Q + R)(P + Q + R) = 0$_.

Congratulations! You have just proved the medians of a triangle intersect its centroid.
In Grassmann Algebra the centroid of a triangle determined by points $P$, $Q$, and $R$
is $(P + Q + R)/3$, the midpoint of $Q$ and $R$ is $(Q + R)/2$ and the median
from $P$ to the midpoint is $P(Q + R)/2$. Permuting $P$, $Q$, and $R$ shows all
three medians meet at the centroid. Grassmann used algebra instead of Euclid's ruler
and compass. It was the greatest invention in mathematics following René Descartes 
introduction of coordinates to specify points in two and three dimensions. Grassmann
got rid of coordinates and used points in space directly. His algebra
works in any number of dimensions and
predated Einstein 
in not assuming an absolute origin of points in space. Vectors come
along for free as the difference of two points.

Descartes assumed an origin for his coordinate system. Given an origin $O\in E$
and points $P_1,\ldots,P_n\in E$ is is possible to write any point in their span
as $P = (1 - \sum_j t_j)O + \sum_j t_j P_j$, as we will see shortly.
The Cartesian coordinates of the $P_j$ relative to origin $O$ are
git diff main origin/mainthe tuple $(t_1,\ldots,t_n)$. Note the coefficient of $O$ is determined by the tuple.

If $PQ = tRS$ for some scalar $t$ (with $P\not=Q$ and $R\not=S$)
then $PQ$ and $RS$ are _congruent_ and we write $t = \frac{PQ}{RS}$.
If $R(t) = (1 - t)P + tQ = P + t(Q - P)$ we can think of $R(t)$ as the point $P$
plus a scalar multiple of the _vector_ $Q - P$.

__Exercise__. _Show $R(t) = Q + (1 - t)(P - Q)$_.

Since $R(t)Q = (1 - t)PQ$ and $PR(t) = tPQ$.
we have $R(t) = \frac{RQ}{PQ}P + \frac{PR}{PQ}Q$.

__Exercise__. _Show $PQR = 0$_.

__Exercise__. _Show $R(t) \not= Q - P$ for any $t$_.

Note $PQ(Q - P) = 0$.

__Exercise__. _Show $\frac{(Q - P)Q}{PQ} = -1$ and $\frac{P(Q - P)}{PQ} = 1$_.

In general if $P_0\cdots P_k \not=0$ and $P_0\cdots P_kR = 0$ then
$$
	R = \sum_{j=0}^k \frac{P_0\cdots R \cdots P_k}{P_0\cdots P_k} P_j
$$
where $R$ takes the place of $P_j$ in the numerator of each congruence ratio.

__Exercise__. _Show ${P_1\cdots R \cdots P_k = (-1)^jR\prod_{i\not=j}P_i}$_.

_Hint_: $PQ = -QP$

The _convex hull_ of points $P_0,\ldots,P_k$ in $E$ is
$$
	\co(P_0,\ldots,P_k) = \{\sum_{j=0}^k t_j P_j\mid t_j \ge 0, \sum_j t_j = 1\}. 
$$
Clearly $P_j$ is in the convex hull for all $j$.

__Exercise__. _Show if $Q$ and $R$ are in the hull then
every convex combination of $Q$ and $R$ is also in the hull_.

This gives a simple way to detect if a point is in the convex hull of a set of points
whose product is not 0. Given a candidate point $P\in E$ calculate
$P_0\cdots P\cdots P_k$ where $P$ replaces $P_j$, $0\le j\le k$ in the product.
The point $P\in E$ is in the convex hull if and only if
all the congruent ratios are non-negative.

Since there is no origin in Euclidean space we have to define a cone relative to some point $O\in E$.
We say $C\subseteq\GG(E)$ is a cone with _origin_ $O$ if $C$ is convex and for every $P\in C$
we have the ray from $O$ through $P$, $O + t(P - O)$ for $t\ge0$, is in $C$.

__Exercise__. _Show the smallest cone with origin $O$ containing $P_1, \ldots, P_k$ is_
$$
\begin{aligned}
	\cone_O(P_1,\ldots,P_k) &= \{O + \sum_{j=1}^k t_j (P_j - O)\mid t_j\ge0\} \\
		&= \{(1 - \sum_{j=1}^n t_j) O + \sum_{j=0}^k t_j P_j\mid t_j\ge0\}. \\
\end{aligned}
$$
Note the similarity to the convex hull, however the coefficient of $O$ might be negative.

In the binomial model we have $x = (1, s)$ and $X(\omega) = \omega$ for $\omega\in\{L,H\}$. Let
$P_b$ be the point in the bond dimension and $P_s$ be the point in the stock dimension
so $x = (1 - 1 - s)O + P_b + s\,P_s$,
$X(L) = (1 - R - L )O + R\,P_b + L\,P_s$, and
$X(H) = (1 - R - H )O + R\,P_b + H\,P_s$.
Since
$$
	x = \frac{xX(L)X(H)}{OX(L)X(H)} O + \frac{OxX(H)}{OX(L)X(H)} X(L) + \frac{OX(L)x}{OX(L)X(H)} X(H)
$$
we can find the no arbitrage conditions by a simple, if somewhat tedious, calculation.
$$
\begin{aligned}
OX(L)X(H) &= (R\,OP_b + L\,OP_s)X(H) \\
	&= (R\,OP_b + L\,OP_s)( (1 - R - H )O + R\,P_b + H\,P_s) \\
	&= RH\,OP_bP_s + LR\,OP_sP_b \\
	&= R(H-L)\,OP_bP_s \\
\end{aligned}
$$
The coefficient of $O$ is determined by the other two coefficient so we write $\_O$ to streamline calculations.
For the bond coefficient we compute
$$
\begin{aligned}
OxX(H) &= (OP_b + s\,OP_s)X(H) \\
	&= (OP_b + s\,OP_s)(\_O + R\,P_b + H\,P_s) \\
	&= H\,OP_bP_s + sR\,OP_sP_b \\
	& = (H - sR)\,OP_bP_s \\
\end{aligned}
$$
For the stock coefficient we compute
$$
\begin{aligned}
OX(L)x &= (R\,OP_b + L\,OP_s)x \\
	&= (R\,OP_b + L\,OP_s)(\_O + P_b + s\,P_s) \\
	&= Rs\,OP_bP_s + L\,OP_sP_b \\
	&= (Rs - L)OP_bP_s \\
\end{aligned}
$$
Since $R$ and $H - L$ are positive
the no arbitrage condition are ${H - sR\ge0}$ and ${Rs - L\ge0}$
so $L \le Rs \le H$.

__Exercise__. _What is the cone with origin $O$ generated by $\{X(\omega)\mid L\le\omega\le H\}$_.

_Hint_: It is the same as the cone with origin $O$ generated by $X(L)$ and $X(H)$.

We have already established this without using Grassmann algebra
but generalizations to higher dimensional cases can be reduced to a calculation.

We can add a call option with price $v$ and strike $K\in(L,H)$.
The one period model is now ${x = (1, s, v)}$ and ${X(\omega) = (R, \omega, \max\{\omega - K, 0\})}$
for ${\omega\in[L,H]}$.
It in not obvious the no arbitrage conditions are ${s\le K}$ and ${0\le v\le\frac{(Rs - L)(H - K)}{R(H - L)}}$
but this can be reduced to a straightforward calculation.

__Exercise__. _Show the cone with origin $O$ generated by the range of $X$ is
the same as that generated by $X(L)$, $X(K)$, and $X(H)$_.

_Hint_: Every $X(\omega)$ is a convex combination of either $X(L)$ and $X(K)$
if $L\le\omega\le K$ or $X(K)$ and $X(H)$ if $K\le\omega\le H$.

If $P_o$ is a point in the option dimension then
${x = \_O + P_b + s\,P_s + v\,P_o}$ and
${X(\omega) = \_O + R\,P_b + \omega\,P_s + (\omega - K)^+\,P_o}$.

The arbitrage free conditions are reduced to calculating congruence ratios as above.
$$
\begin{aligned}
OX(L)X(K)X(H) &= (R\,OP_b + L\,OP_s)X(K)X(H) \\
	&= (R\,OP_b + L\,OP_s)(\_O + R\,P_b + K\,P_s)X(H) \\
	&= (RK\,OP_b P_s + LR\,OP_s P_b)(\_O + R\,P_b + H\,P_s + (H - K)\,P_o) \\
	&= RK(H - K)\,OP_b P_s P_o + LR(H - K)\,OP_s P_b P_o \\
	&= R(H - K)(K - L)\,OP_b P_s P_o \\
\end{aligned}
$$
The coefficient of $X(L)$ is
$$
\begin{aligned}
OxX(K)X(H) &= (OP_b + s\,OP_s + v\,OP_o)X(K)X(H) \\
	&= (OP_b + s\,OP_s + v\,OP_o)(\_O + R\,P_b + K\,P_s)X(H) \\
	&= (RK\,OP_b P_s + sR\,OP_s P_b)(\_O + R\,P_b + H\,P_s + (H - K)\,P_o) \\
	&= RK(H - K)\,OP_b P_s P_o + sR(H - K)\,OP_s P_b P_o \\
	&= R(H - K)(K - s)\,OP_b P_s P_o \\
\end{aligned}
$$
The coefficient of $X(K)$ is
$$
\begin{aligned}
OX(L)xX(H) &= (R\,OP_b + L\,OP_s)xX(H) \\
	&= (R\,OP_b + L\,OP_s)(P_b + s\,P_s + v\,P_o)X(H) \\
	&= (Rs\,OP_b P_s + Rv\,OP_b P_o + L\,OP_s P_b + Lo\,OP_s P_o)X(H) \\
	&= (Rs - L)OP_b P_s + Rv\,OP_b P_o + Lo\,OP_s P_o)( R\,P_b + H\,P_s + (H - K)\,P_o) \\
	&= ((Rs - L)(H - K) - RvH + LoR) OP_b P_s P_o \\
	&= ((Rs - L)(H - K) - Rv(H - L)) OP_b P_s P_o \\
\end{aligned}
$$
The coefficient of $X(H)$ is
$$
\begin{aligned}
OX(L)X(K)x &= (R\,OP_b + L\,OP_s)X(K)x \\
	&= (R\,OP_b + L\,OP_s)(R\,P_b + K\,P_s)x \\
	&= (RK\,OP_b P_s + LR\,OP_sP_b)x \\
	&= R(K - L)OP_b P_s(P_b + s\,P_s + v\,P_o) \\
	&= (R(K - L)v\,OP_b P_s P_o \\
\end{aligned}
$$
The no arbitrage conditions are ${s\le K}$ and ${0\le v\le\frac{(Rs - L)(H - K)}{R(H - L)}}$.
Of course the condition ${L\le Rs \le H}$ holds from the model not containing the option.

__Exercise__. _Consider a model with a bond having zero interest, and a stock that starts
at 100 and can go to either 90, 100, or 110. What are the arbitrage-free values
of an at-the-money call_?

_Hint_. The model is $x = (1, 100, v)$, $X(\omega) = (1, \omega, \max\{\omega - 100, 0\})$
where $\omega\in\{90,100,110\}$. Show $0\le v\le 5$.

__Exercise__. _Remove the bond from the above model and answer the same question_.

_Hint_: The answer is $0\le v\le 100/11 = 9.090\ldots$.

Grassmann algebra can also be used to detect and find an arbitrage when it exists.
If any of the coefficients are negative then arbitrage exists. If only one
coefficient is negative the arbitrage is perpendicular the the hyperplane determined
by the points having positive coefficients.

We can also extend this to an arbitrary number of call options with strikes between the
low and high values for the underlying instrument. The author implemented this
for the option trading book at Banc of America Securities. We found the only arbitrage
opportunities were negative price butterfly spreads at adjacent traded strikes, but the bid/ask
spread turned the price positive.

## Appendix

We can make the one-period model more realistic. The price of an instrument must
be an integral multiple of its minimal trading increment, or _tick size_.
Let $\epsilon(i)$ be the tick size 
of instrument $i\in I$. Initial prices $x\in\ZZ^I$ correspond
to actual prices $x(i)\epsilon(i)$. Likewise for final prices $X\colon\Omega\to\ZZ^I$.

The amount must be an
integral multiple of its minimum share size, or _lot size_.
Let $\delta(i)$ be the lot size 
of instrument $i\in I$. Amounts $\xi\in\ZZ^I$ correspond
to actual amounts $\xi(i)\delta(i)$.

Price can depend on the amount being bought or sold (among other things).
The bid and ask price can be a function of each instrument
and the amount being purchased.
Initial price is a function
$x\colon\ZZ^I\to\ZZ^I$ where $x(\xi)$ is the price of $\xi$ lot sizes.
Typically the price of the $i$-th instrument is a function of
the $i$-th lot size so $x_i(\xi) = x_i(\xi_i)$.
Final price is a function $X\colon\Omega\times\ZZ^I\to\ZZ^I$ where
$X(\omega,-\xi)$, $\omega\in\Omega$.
Recall the one period model assumes
the initial position is liquidated at the end of the period.

For exchange traded instruments the price is determined by the existing limit orders,
if that information is available.

To be even more realistic, the domain of the price function should be restricted.
It is not possible to buy more shares of an instrument than have been issued
and there are often furthur restrictions when shorting an instrument.

## References

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
We call $E_1 = P_1 - O$ the _stock dimension and $E_2 = P_2 - O$ the _option dimension.
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
where $L < K_1 < \cdots < K_n < H$. If $E_0 = P_0 - O$ is the bond dimension

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

## Liquidity and Risk

It is possible to define a model that takes into account bid/ask spreads involving
the amount traded and the counterparties involved.
A _holding_ is a triple $(a,i,e)$ specifying an integer amount, instrument, and legal entity.
It indicates $e$ is the legal owner of amount $a$ of instrument $i$.
The amount is an integral number of (minimum fractional) shares of the instrument.
-->

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
<!--

The Capital Asset Pricing Model assumes that a probability measure is
specified on the sample space of possible outcomes.
[@Mar1952] and [@Roy1952] developed Modern
Portfolio Theory by introducing the concept of an efficient portfolio:
one for which no alternative portfolio offers a higher expected return
at the same level of risk, or a lower level of risk for the same expected
return. In their framework, risk is quantified using the variance of realized
returns.

A common parameterization is to assume returns are jointly normal.
This reduces parameter estimation to the mean and covariance matrix.
If we assume a multi period model where the returns are stationary and independent
(i.e., a random walk)
then standard linear regression can be used to estimate the parameters
based on historical prices. There are still some practical questions
to answer: How far back do you go? Do you use exponential weights?
What exponent should you use?

[@Ros1976] invented Arbitrage Pricing Theory as a systematic approach to estimate
a CAPM probability distribution that depends on information other than historical prices.

After reseachers noted empirical contradictions of the CAPM [@FamFre1992] introduced
specific factors. In addition to excess return over the risk-free rate they used the excess returns
of small‑cap stocks over large‑cap stocks (SMB) and the excess returns of value stocks
over growth stock (HML). They also assume stationary and independent returns
and use linear regression to estimate their model parameters.

If the sample space consists of two point we get the binomial model.
It is not at all realistic, but it can illustrate the concept of arbitrage.
Models that are not arbitrage free are useless so we need a way of
detecting the. The Fundamental Theorem of asset pricing for the one-period
model states there is no arbitrage if and only if the initial prices belong
so the smallest closed cone containing all possible final prices.

-->

=======
---
title: One-Period Model
author: Keith A. Lewis
institution: KALX, LLC
email: kal@kalx.net
classoption: fleqn
abstract: Simplest formal model of a financial market.
...

\newcommand\RR{\boldsymbol{R}}
\newcommand\ZZ{\boldsymbol{Z}}
\newcommand\ran{\operatorname{ran}}
\newcommand\Var{\operatorname{Var}}
\newcommand\Cov{\operatorname{Cov}}
\newcommand\co{\operatorname{co}}
\newcommand\sgn{\operatorname{sgn}}
\newcommand\cone{\operatorname{cone}}
\newcommand\BB{\mathcal{B}}
\newcommand\GG{\mathcal{G}}

The One‑Period Model provides the simplest mathematical framework for
describing a financial market over a single period of time.  It specifies the
prices of available instruments at the beginning of the period and
their cash flows at the end depending on what occurred.  We make the
usual unrealistic assumptions that prices are real numbers instead of
integral multiples of each instrument's minimum trading increment/tick
size and there is no bid-ask spread depending on the amount being bought
or sold, much less any consideration of credit or tax issues. 
We also ignore the fact instruments can only
be purchased in integral multiples of their minimum share/lot size.
The [Appendix](#appendix) proposes a model that can incorporate more
realistic assumptions.

Quants turn mathematical models into software that traders use.
If they roll out a model that is not arbitrage-free then
buy side customers go long on trades that are underpriced and
short on trades that are over overpriced. Eventually trading
reality catches up and the sell side firm loses money.
Even worse, a "clever" trader might find an internal arbitrage
that gives the illusion of making profits.

The Fundamental Theorem of Asset Pricing identifies arbitrage-free models
and provides an arbitrage if they are not. As [@Ros1978] showed, this is
a purely geometric result having nothing to do with probability.
Positive measures having mass one make an appearance, but they are not
the probability of anything.

Ross made the untenable assumption that continuous time trading is
possible and the category error of defining a cash flow as a jump
in price. A cash flow is a payment made by the instrument issuer
to every instrument holder. Stocks pay dividends, bonds pay coupons,
futures pay the change in end-of-day quotes and always have price zero.

The Fundamental Theorem of Asset Pricing shows models of cash flows
entail geometric constraints on arbitrage-free prices.

## One-Period Model

The _One-Period Model_ consists of a finite set of market _instruments_, $I$,
available for trading.
The set of possible _outcomes_, $\Omega$, is what can happen over the period.
The _prices_ at the beginning of the period is a vector ${x\in\RR^I}$[^1]
indexed by the available instruments.
The _cash flows_ at the end of the period are a vector-valued function
${C\colon\Omega\to \RR^I}$
where ${C(\omega)\in\RR^I}$ are the cash flows if ${\omega\in\Omega}$ occurred.

A _position_ $\xi\in\RR^I$ is the number of shares purchased in each
instrument at the beginning of the period.  The _cost_ of acquiring the
position is ${\xi\cdot x = \sum_{i\in I}\xi(i) x(i)}$ and results in
${\xi\cdot C(\omega)}$ at the end of the period.  The _realized return_
of a position $\xi\in\RR^I$ is ${R_\xi = \xi\cdot C/\xi\cdot x}$ if
$\xi\cdot x\not=0$.

__Exercise__. _Show $R_{t\xi} = R_{\xi}$ for any non-zero $t\in\RR$_.

This is actually a deleterious feature of the model. Going long or short typically
affects the realized return. It also implies a portfolio strategy can be scaled
to arbitrarily large positions. At some point you will run out of instruments to buy
and sell.

A position $\xi$ is _feasible_ if the cost of acquiring it is 1
so its realized return is $R_\xi = \xi\cdot C$.  If $\xi$ is any
position with $\xi\cdot x\not=0$ then $\xi/\xi\cdot x$ is feasible.
Assuming feasibility simplifies computations involving realized return.

Classical literature specifies prices $X\colon\Omega\to\RR^I$ at the end
of the period instead of cash flows $C$. If one is being intellectually
honest, prices do not exist at the end of the period since there is no
further economic activity available.  The classical approach implicitly
assumes the initial position is liquidated at the end of the period
resulting in a payment of $\xi\cdot X$. In reality
cash flows are paid in proportion to position.

The [Multi-period model](mpm.html) clarifies the relationship
between prices and cash flows.

The [Capital Asset Pricing Model](capm.html) is a one-period model
where a probability measure on possible outcomes is specified.

[^1]: Recall the _set exponential_ ${B^A = \{f\colon A\to B\}}$ is the set
of all functions from the set $A$ to the set $B$.  If ${x\in\RR^I}$ then
$x(i)\in\RR$ is the price of instrument $i\in I$.  If $I = \{1,\ldots,n\}$
we can identify $\RR^I$ with the vector space of $n$-tuples
${\RR^n = \prod_{i=1}^n\RR = \{(x_1,\ldots,x_n)\mid x_i\in\RR\}}$
by $x(i) = x_i$, $1\le i\le n$.

## Arbitrage

_Arbitrage_ exists in a one-period model if there is a position $\xi\in\RR^I$
with ${\xi\cdot x < 0}$ and ${\xi\cdot C(\omega)\ge0}$ for all ${\omega\in\Omega}$:
you make money acquiring the initial position and never lose money
at the end of the period.

If you are uncomfortable using cash flows $C$ instead of prices $X$ when the
instrument is a stock consider $C$ to be the liquidation value
or a stock buy back by the company at the end of the period.

Some authors define arbitrage as a portfolio with ${\xi\cdot x = 0}$ and
${\xi\cdot C}$ is non-negative and positive on some set having positive probability.
We haven't specified a probability measure so we can't use this definition.
No trader would consider that to be an arbitrage anyway. 
Even though the position costs nothing other than agita to put on,
that definition has nothing definite to say about how much they will
make nor how likely it is they will make it.

Our stronger probability-free definition is still not good enough
for traders and risk managers.  Even though ${\xi\cdot x}$ is strictly
negative they will slap absolute value signs around every number and
compute ${|\xi|\cdot|x|}$ as a measure of how much capital will be tied
up putting on the position.  No business would approve using a million
dollars from their funding account just to make a penny up front even though that
technically satisfies our mathematical definition of arbitrage.

## Fundamental Theorem of Asset Pricing

<!--
A derivative instrument is a contract: I will give you this on these dates if
you will give me that on those dates. Derivatives differ from bartering in that they
involve future transactions instead of immediate exchanges.
Caveman Korg may have asked caveman Grok for as many arrowheads as the fingers on
both hands and promised to give him a bear skin before the moon is big in the sky.
Korg might not be able to make delivery if the bear has a say in the matter so
Grok must take this into account when offering arrowheads.

-->

The assumption of no arbitrage places constraints on initial prices
that are determined by possible cash flows. The constraints involve a cone.

Recall a _cone_ $K$ is a subset of a vector space closed under positive scalar
multiplication and vector addition: if $x\in K$ then $tx\in K$ for $t > 0$
and if $x,y\in K$ then ${x + y\in K}$.

__Exercise__. _A cone is convex_.

_Hint_: Show $x,y\in K$ implies ${tx + (1-t)y\in K}$ for ${0 < t < 1}$.

<details><summary>Solution</summary>
Since $t > 0$ and $1 - t > 0$ both $tx$ and $(1 - t)y$ belong to $K$
hence $tx + (1 - t)y\in K$.
</details>

__Exercise__. _The set of arbitrage positions is a cone_.

<details><summary>Solution</summary>
If $\xi$ is an arbitrage then $t\xi$ is an arbitrage for $t > 0$.
If $\xi$ and $\eta$ are arbitrages then so is $\xi + \eta$.
</details>

The smallest cone containing the possible cash flows $C$ is the set
of finite linear combinations with positive coefficents
${\{\sum_i C(\omega_i) \pi_i\mid \omega_i\in\Omega, \pi_i > 0\}}$.
If $x = \sum_i C(\omega_i) \pi_i$ is in the cone
and $\xi\cdot C$ is non-negative on $\Omega$ then ${\xi\cdot x\ge 0}$
so no arbitrage exists.

__Exercise__. _If $x$ belongs to the smallest_ closed _cone containing
the range of $C$ then there is no arbitrage_.

<details><summary>Solution</summary>
If $x_n\in C$ converge to $x$ in norm and $\xi\cdot x_n\ge0$ then $\xi\cdot x\ge0$.
</details>

The contrapositive is also true.

__Theorem__.  _Arbitrage exists in
the one-period model if $x$ does not belong to the smallest
closed cone containing the range of $C$. If $x^*$ is the closest point
in the cone then $\xi = x^* - x$ is an arbitrage_.

In general, the arbitrage is not unique. We will establish the theorem using
the purely geometric

__Lemma__. _If $x\in\RR^n$ and $K$ is a closed cone in
$\RR^n$ with $x\not\in K$ then there exists ${\xi\in\RR^n}$
with ${\xi\cdot x < 0}$ and ${\xi\cdot y \ge0}$ for ${y\in K}$._

_Proof._ Let $x^*$ be the point in $K$ closest to $x$.
It exists since $K$ is closed and is unique since $K$ is convex.

Since $ty + x^*\in K$ for any $t > 0$ and $y\in K$ 
we have $\|x^* - x\| \le \|ty + x^* - x\|$.
Simplifying gives ${t^2||y||^2 + 2t\xi\cdot y\ge0}$. 
Dividing by $t > 0$ and letting $t$ decrease to 0 shows ${\xi\cdot y\ge0}$
for all $y\in K$.

Since $(t + 1)x^*\in K$ for $t + 1 > 0$
we also have $\|x^* - x\| \le \|tx^* + x^* - x\|$.
Simplifying gives ${t^2||x^*||^2 + 2t\xi\cdot x^*\ge 0}$ for  $t > -1$.
Dividing by $t < 0$ and letting $t$ increase to 0 shows ${\xi\cdot x^*\le 0}$.

We have ${0 < ||\xi||^2 = \xi\cdot (x^* - x) \le -\xi\cdot x}$ hence ${\xi\cdot x < 0}$.

The lemma proves the FTAP and that $\xi = x^* - x$ implements an arbitrage.

If we assume prices are bounded, as they are in the real world, then every point 
in the closed convex cone generated by the range of $X$ can
be written $\int_\Omega X(\omega)\,dD(\omega)$ for some positive, bounded, finitely additive
measure $D\in ba(\Omega)$ on $\Omega$,
but this requires a bit more math to establish.
See [@DunSch1958].
We call any such measure _risk-neutral_.
Risk-neutral measures are not generally unique.

A _zero coupon bond_ pays 1 unit at the end of the period on every outcome.
A portfolio $\zeta\in\RR^I$ with 
${\zeta\cdot X(\omega) = 1}$ for all ${\omega\in\Omega}$
is a zero coupon bond.
The _price_, or _discount_, of a zero coupon bond is
${\zeta\cdot x = \int_\Omega \zeta\cdot X(\omega)\,dD(\omega) = D(\Omega)}$.
The measure ${D/D(\Omega)}$ is positive and has mass 1 so ${x = E[X]D(\Omega)}$
if we pretend it is a probability measure.

__Exercise__. _If $\zeta$ is a zero coupon bond with only one non-zero component then
that component is equal to the discount_.

If $\xi\cdot X = 0$ then one instrument is a linear combination of the others
and can be removed. This can be repeated until $\xi\cdot X\not=0$ for
any $\xi\in\RR^I$. If so the map $\xi\mapsto\xi\cdot X$ is one-to-one.
A model is _complete_ if this map is _onto_. This cannot be the
case if the cardinality of $I$ is less than the cardinality of $\Omega$.
In general the number of instruments is much smaller than the
number of outcomes.
Although complete markets are common in mathematical finance books, they
never occur in models faithful to the real world.


## Examples

We now apply the FTAP to particular models. 

### 1-2-3 Model

A very simple and unrealistic one-period model of a bond 
returning double and a stock with price 1 that can go
to either 1 or 3 is is $x = (1, 1)$
and $C(\omega) = (2, \omega)$ where $\omega\in\{1,3\}$.




### Binomial Model

The _binomial model_ has instruments a bond and stock where ${x = (1, s)}$,
${C(\omega) = (R, \omega)}$, and ${\Omega = \{L, H\}}$ with ${L < H}$.
The bond has realized return $R$ and the stock can go from price $s$
to either $L$ or $H$. 

The bond could be a cash deposit or Treasury bill that has a cash flow at the end of the period.
These are typically quoted as a _yield_ having a _day count basis_ that can be used
to calculate the realized return. T-bills use Actual/360 day count basis. The quoted
yield $y$ indicates the price now of unit notional received in $t$ days is ${1 - yt/360}$.
The realized return $R$ is the reciprocal of this.

### Interval Model

A somewhat more realistic model is
${\Omega = [L, H]}$ where the final stock price can be any value in the interval.

-->
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
where the final stock price can be any value between the low and the high,
i.e., $\Omega = [L, H]$.
</details>

### Realized Return

The _realized return_ on a portfolio $\xi\in\RR^I$ is ${R_\xi = \xi\cdot X/\xi\cdot x}$
whenever ${\xi\cdot x\not=0}$.

__Exercise__. _Show $R_\xi = R_{t\xi}$ for any non-zero $t\in\RR$_.

This is actually a deleterious feature of the model. Going long or short typically
affects the realized return. It also implies a portfolio strategy can be scaled
to arbitrarily large positions. At some point you will run out of instruments to buy
and sell.

If $\xi\cdot x = 1$ then $R_\xi = \xi\cdot X$. One unit invested at the beginning
of the period results in ${R_\xi\colon\Omega\to\RR}$ at the end of the period.
Every portfolio has the same expected realized return under a risk-neutral measure
so perhaps this should be called a _risk-blind_ measure.

__Exercise__. _If $D$ is a risk-neutral measure then the expected realized return
$R = E[R_\xi] = 1/D(\Omega)$ is constant for any portfolio $\xi\in\RR^I$_.

_Hint_: The expectation is with respect to the "probability" measure $DR = D/D(\Omega)$.

## Grassmann Algebra

We now show how to use the geometric algebra [@Gra1844] invented to solve problems
involving arbitrage free models.

Let $E$ be the set of points in space. The Grassmann algebra $\GG(E)$
is the algebra over the real numbers generated by points in $E$ with the condition
$PQ = 0$ if and only if $P = Q$ for $P,Q\in E$. In particular $PP = 0$. Multiplication is
associative so $(PQ)R = P(QR)$ and we can write $PQR$ unambiguously.

__Exercise__. _Show $PQ = -QP$_.

_Hint_: $0 = (P + Q)(P + Q) = PP + PQ + QP + QQ$.

__Exercise__. _Show $P(Q + R)(P + Q + R) = 0$_.

Congratulations! You have just proved the medians of a triangle intersect its centroid.
In Grassmann Algebra the centroid of a triangle determined by points $P$, $Q$, and $R$
is $(P + Q + R)/3$, the midpoint of $Q$ and $R$ is $(Q + R)/2$ and the median
from $P$ to the midpoint is $P(Q + R)/2$. Permuting $P$, $Q$, and $R$ shows all
three medians meet at the centroid. Grassmann used algebra instead of Euclid's ruler
and compass. It was the greatest invention in mathematics following René Descartes 
introduction of coordinates to specify points in two and three dimensions. Grassmann
got rid of coordinates and used points in space directly. His algebra
works in any number of dimensions and
predated Einstein 
in not assuming an absolute origin of points in space. Vectors come
along for free as the difference of two points.

Descartes assumed an origin for his coordinate system. Given an origin $O\in E$
and points $P_1,\ldots,P_n\in E$ is is possible to write any point in their span
as $P = (1 - \sum_j t_j)O + \sum_j t_j P_j$, as we will see shortly.
The Cartesian coordinates of the $P_j$ relative to origin $O$ are
the tuple $(t_1,\ldots,t_n)$. Note the coefficient of $O$ is determined by the tuple.

If $PQ = tRS$ for some scalar $t$ (with $P\not=Q$ and $R\not=S$)
then $PQ$ and $RS$ are _congruent_ and we write $t = \frac{PQ}{RS}$.
If $R(t) = (1 - t)P + tQ = P + t(Q - P)$ we can think of $R(t)$ as the point $P$
plus a scalar multiple of the _vector_ $Q - P$.

__Exercise__. _Show $R(t) = Q + (1 - t)(P - Q)$_.

Since $R(t)Q = (1 - t)PQ$ and $PR(t) = tPQ$.
we have $R(t) = \frac{RQ}{PQ}P + \frac{PR}{PQ}Q$.

__Exercise__. _Show $PQR = 0$_.

__Exercise__. _Show $R(t) \not= Q - P$ for any $t$_.

Note $PQ(Q - P) = 0$.

__Exercise__. _Show $\frac{(Q - P)Q}{PQ} = -1$ and $\frac{P(Q - P)}{PQ} = 1$_.

In general if $P_0\cdots P_k \not=0$ and $P_0\cdots P_kR = 0$ then
$$
	R = \sum_{j=0}^k \frac{P_0\cdots R \cdots P_k}{P_0\cdots P_k} P_j
$$
where $R$ takes the place of $P_j$ in the numerator of each congruence ratio.

__Exercise__. _Show ${P_1\cdots R \cdots P_k = (-1)^jR\prod_{i\not=j}P_i}$_.

_Hint_: $PQ = -QP$

The _convex hull_ of points $P_0,\ldots,P_k$ in $E$ is
$$
	\co(P_0,\ldots,P_k) = \{\sum_{j=0}^k t_j P_j\mid t_j \ge 0, \sum_j t_j = 1\}. 
$$
Clearly $P_j$ is in the convex hull for all $j$.

__Exercise__. _Show if $Q$ and $R$ are in the hull then
every convex combination of $Q$ and $R$ is also in the hull_.

This gives a simple way to detect if a point is in the convex hull of a set of points
whose product is not 0. Given a candidate point $P\in E$ calculate
$P_0\cdots P\cdots P_k$ where $P$ replaces $P_j$, $0\le j\le k$ in the product.
The point $P\in E$ is in the convex hull if and only if
all the congruent ratios are non-negative.

Since there is no origin in Euclidean space we have to define a cone relative to some point $O\in E$.
We say $C\subseteq\GG(E)$ is a cone with _origin_ $O$ if $C$ is convex and for every $P\in C$
we have the ray from $O$ through $P$, $O + t(P - O)$ for $t\ge0$, is in $C$.

__Exercise__. _Show the smallest cone with origin $O$ containing $P_1, \ldots, P_k$ is_
$$
\begin{aligned}
	\cone_O(P_1,\ldots,P_k) &= \{O + \sum_{j=1}^k t_j (P_j - O)\mid t_j\ge0\} \\
		&= \{(1 - \sum_{j=1}^n t_j) O + \sum_{j=0}^k t_j P_j\mid t_j\ge0\}. \\
\end{aligned}
$$
Note the similarity to the convex hull, however the coefficient of $O$ might be negative.

In the binomial model we have $x = (1, s)$ and $X(\omega) = \omega$ for $\omega\in\{L,H\}$. Let
$P_b$ be the point in the bond dimension and $P_s$ be the point in the stock dimension
so $x = (1 - 1 - s)O + P_b + s\,P_s$,
$X(L) = (1 - R - L )O + R\,P_b + L\,P_s$, and
$X(H) = (1 - R - H )O + R\,P_b + H\,P_s$.
Since
$$
	x = \frac{xX(L)X(H)}{OX(L)X(H)} O + \frac{OxX(H)}{OX(L)X(H)} X(L) + \frac{OX(L)x}{OX(L)X(H)} X(H)
$$
we can find the no arbitrage conditions by a simple, if somewhat tedious, calculation.
$$
\begin{aligned}
OX(L)X(H) &= (R\,OP_b + L\,OP_s)X(H) \\
	&= (R\,OP_b + L\,OP_s)( (1 - R - H )O + R\,P_b + H\,P_s) \\
	&= RH\,OP_bP_s + LR\,OP_sP_b \\
	&= R(H-L)\,OP_bP_s \\
\end{aligned}
$$
The coefficient of $O$ is determined by the other two coefficient so we write $\_O$ to streamline calculations.
For the bond coefficient we compute
$$
\begin{aligned}
OxX(H) &= (OP_b + s\,OP_s)X(H) \\
	&= (OP_b + s\,OP_s)(\_O + R\,P_b + H\,P_s) \\
	&= H\,OP_bP_s + sR\,OP_sP_b \\
	& = (H - sR)\,OP_bP_s \\
\end{aligned}
$$
For the stock coefficient we compute
$$
\begin{aligned}
OX(L)x &= (R\,OP_b + L\,OP_s)x \\
	&= (R\,OP_b + L\,OP_s)(\_O + P_b + s\,P_s) \\
	&= Rs\,OP_bP_s + L\,OP_sP_b \\
	&= (Rs - L)OP_bP_s \\
\end{aligned}
$$
Since $R$ and $H - L$ are positive
the no arbitrage condition are ${H - sR\ge0}$ and ${Rs - L\ge0}$
so $L \le Rs \le H$.

__Exercise__. _What is the cone with origin $O$ generated by $\{X(\omega)\mid L\le\omega\le H\}$_.

_Hint_: It is the same as the cone with origin $O$ generated by $X(L)$ and $X(H)$.

We have already established this without using Grassmann algebra
but generalizations to higher dimensional cases can be reduced to a calculation.

We can add a call option with price $v$ and strike $K\in(L,H)$.
The one period model is now ${x = (1, s, v)}$ and ${X(\omega) = (R, \omega, \max\{\omega - K, 0\})}$
for ${\omega\in[L,H]}$.
It in not obvious the no arbitrage conditions are ${s\le K}$ and ${0\le v\le\frac{(Rs - L)(H - K)}{R(H - L)}}$
but this can be reduced to a straightforward calculation.

__Exercise__. _Show the cone with origin $O$ generated by the range of $X$ is
the same as that generated by $X(L)$, $X(K)$, and $X(H)$_.

_Hint_: Every $X(\omega)$ is a convex combination of either $X(L)$ and $X(K)$
if $L\le\omega\le K$ or $X(K)$ and $X(H)$ if $K\le\omega\le H$.

If $P_o$ is a point in the option dimension then
${x = \_O + P_b + s\,P_s + v\,P_o}$ and
${X(\omega) = \_O + R\,P_b + \omega\,P_s + (\omega - K)^+\,P_o}$.

The arbitrage free conditions are reduced to calculating congruence ratios as above.
$$
\begin{aligned}
OX(L)X(K)X(H) &= (R\,OP_b + L\,OP_s)X(K)X(H) \\
	&= (R\,OP_b + L\,OP_s)(\_O + R\,P_b + K\,P_s)X(H) \\
	&= (RK\,OP_b P_s + LR\,OP_s P_b)(\_O + R\,P_b + H\,P_s + (H - K)\,P_o) \\
	&= RK(H - K)\,OP_b P_s P_o + LR(H - K)\,OP_s P_b P_o \\
	&= R(H - K)(K - L)\,OP_b P_s P_o \\
\end{aligned}
$$
The coefficient of $X(L)$ is
$$
\begin{aligned}
OxX(K)X(H) &= (OP_b + s\,OP_s + v\,OP_o)X(K)X(H) \\
	&= (OP_b + s\,OP_s + v\,OP_o)(\_O + R\,P_b + K\,P_s)X(H) \\
	&= (RK\,OP_b P_s + sR\,OP_s P_b)(\_O + R\,P_b + H\,P_s + (H - K)\,P_o) \\
	&= RK(H - K)\,OP_b P_s P_o + sR(H - K)\,OP_s P_b P_o \\
	&= R(H - K)(K - s)\,OP_b P_s P_o \\
\end{aligned}
$$
The coefficient of $X(K)$ is
$$
\begin{aligned}
OX(L)xX(H) &= (R\,OP_b + L\,OP_s)xX(H) \\
	&= (R\,OP_b + L\,OP_s)(P_b + s\,P_s + v\,P_o)X(H) \\
	&= (Rs\,OP_b P_s + Rv\,OP_b P_o + L\,OP_s P_b + Lo\,OP_s P_o)X(H) \\
	&= (Rs - L)OP_b P_s + Rv\,OP_b P_o + Lo\,OP_s P_o)( R\,P_b + H\,P_s + (H - K)\,P_o) \\
	&= ((Rs - L)(H - K) - RvH + LoR) OP_b P_s P_o \\
	&= ((Rs - L)(H - K) - Rv(H - L)) OP_b P_s P_o \\
\end{aligned}
$$
The coefficient of $X(H)$ is
$$
\begin{aligned}
OX(L)X(K)x &= (R\,OP_b + L\,OP_s)X(K)x \\
	&= (R\,OP_b + L\,OP_s)(R\,P_b + K\,P_s)x \\
	&= (RK\,OP_b P_s + LR\,OP_sP_b)x \\
	&= R(K - L)OP_b P_s(P_b + s\,P_s + v\,P_o) \\
	&= (R(K - L)v\,OP_b P_s P_o \\
\end{aligned}
$$
The no arbitrage conditions are ${s\le K}$ and ${0\le v\le\frac{(Rs - L)(H - K)}{R(H - L)}}$.
Of course the condition ${L\le Rs \le H}$ holds from the model not containing the option.

__Exercise__. _Consider a model with a bond having zero interest, and a stock that starts
at 100 and can go to either 90, 100, or 110. What are the arbitrage-free values
of an at-the-money call_?

_Hint_. The model is $x = (1, 100, v)$, $X(\omega) = (1, \omega, \max\{\omega - 100, 0\})$
where $\omega\in\{90,100,110\}$. Show $0\le v\le 5$.

__Exercise__. _Remove the bond from the above model and answer the same question_.

_Hint_: The answer is $0\le v\le 100/11 = 9.090\ldots$.

Grassmann algebra can also be used to detect and find an arbitrage when it exists.
If any of the coefficients are negative then arbitrage exists. If only one
coefficient is negative the arbitrage is perpendicular the the hyperplane determined
by the points having positive coefficients.

We can also extend this to an arbitrary number of call options with strikes between the
low and high values for the underlying instrument. The author implemented this
for the option trading book at Banc of America Securities. We found the only arbitrage
opportunities were negative price butterfly spreads at adjacent traded strikes, but the bid/ask
spread turned the price positive.

## Appendix

We can make the one-period model more realistic. The price of an instrument must
be an integral multiple of its minimal trading increment, or _tick size_.
Let $\epsilon(i)$ be the tick size 
of instrument $i\in I$. Initial prices $x\in\ZZ^I$ correspond
to actual prices $x(i)\epsilon(i)$. Likewise for final prices $X\colon\Omega\to\ZZ^I$.

The amount must be an
integral multiple of its minimum share size, or _lot size_.
Let $\delta(i)$ be the lot size 
of instrument $i\in I$. Amounts $\xi\in\ZZ^I$ correspond
to amounts $\xi(i)\delta(i)$.

Price can depend on the amount being bought or sold (among other things).
The bid and ask price can be a function of each instrument
and the amount being purchased. Initial price is a function
$x\colon\ZZ\times I\to\RR$ where $x(\xi,i)$ is the price of $\xi_i$ lot sizes
of $i\in I$. Final price is $X_i(\omega,-\xi_i)$ where $\omega\in\Omega$
is what occured over the interval. Recall the one period model assumes
the initial position is liquidated at the end of the period.

For example $x_i(\xi,i) = x_i + \sgn(\xi_i)\eta$ where
$x_i$ is the mid price models a fixed bid/ask spread $\eta$.
Recall the _signum_ $\sgn(\xi) = 1$ if $\xi > 0$, $\sgn(\xi) = -1$ if $\xi < 0$,
and $\sgn(0) = 0$.

A more realistic model is $x_i(\xi,i) = x_i + \xi_i\eta$
when the bid/ask spread is proportional to how much is being transacted
or $x(\xi,i) = x_i + \phi(\xi)\eta$ where $\phi(\xi)$ is an increasing function
of $\xi$ with $\phi(0) = 0$.

For exchange traded instruments the price is determined by the existing limit orders,
if that information is available.

To be even more realistic, the domain of the price function should be restricted.
It is not possible to buy more shares of an instrument than have been issued
and there are furthur restrictions when shorting an instrument.

## References

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
We call $E_1 = P_1 - O$ the _stock dimension and $E_2 = P_2 - O$ the _option dimension.
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
where $L < K_1 < \cdots < K_n < H$. If $E_0 = P_0 - O$ is the bond dimension

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

## Liquidity and Risk

It is possible to define a model that takes into account bid/ask spreads involving
the amount traded and the counterparties involved.
A _holding_ is a triple $(a,i,e)$ specifying an integer amount, instrument, and legal entity.
It indicates $e$ is the legal owner of amount $a$ of instrument $i$.
The amount is an integral number of (minimum fractional) shares of the instrument.
-->

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
<!--

The Capital Asset Pricing Model assumes that a probability measure is
specified on the sample space of possible outcomes.
[@Mar1952] and [@Roy1952] developed Modern
Portfolio Theory by introducing the concept of an efficient portfolio:
one for which no alternative portfolio offers a higher expected return
at the same level of risk, or a lower level of risk for the same expected
return. In their framework, risk is quantified using the variance of realized
returns.

A common parameterization is to assume returns are jointly normal.
This reduces parameter estimation to the mean and covariance matrix.
If we assume a multi period model where the returns are stationary and independent
(i.e., a random walk)
then standard linear regression can be used to estimate the parameters
based on historical prices. There are still some practical questions
to answer: How far back do you go? Do you use exponential weights?
What exponent should you use?

[@Ros1976] invented Arbitrage Pricing Theory as a systematic approach to estimate
a CAPM probability distribution that depends on information other than historical prices.

After reseachers noted empirical contradictions of the CAPM [@FamFre1992] introduced
specific factors. In addition to excess return over the risk-free rate they used the excess returns
of small‑cap stocks over large‑cap stocks (SMB) and the excess returns of value stocks
over growth stock (HML). They also assume stationary and independent returns
and use linear regression to estimate their model parameters.

If the sample space consists of two point we get the binomial model.
It is not at all realistic, but it can illustrate the concept of arbitrage.
Models that are not arbitrage free are useless so we need a way of
detecting the. The Fundamental Theorem of asset pricing for the one-period
model states there is no arbitrage if and only if the initial prices belong
so the smallest closed cone containing all possible final prices.

-->
