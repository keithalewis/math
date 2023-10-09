---
title: Efficient Portfolios
author: Keith A. Lewis
institute: KALX, LLC
classoption: fleqn
fleqn: true
abstract: CAPM holds for random variables
thanks: |
	Peter Carr and David Shimko gave insightful feedback to
	make the exposition more accessible to finance professionals.
	Any remaining infelicities or omissions are my fault.
---

\newcommand\bm[1]{\boldsymbol{#1}}
\newcommand\Var{\operatorname{Var}}
\newcommand\Cov{\operatorname{Cov}}

Given two random realized returns on an investment, which is to
be preferred?  This is a fundamental problem in finance that has no
definitive solution except in the case one investment always returns
more than the other.
In 1952 Markowitz[@Mar52] and Roy[@Roy52] introduced the following criterion for risk vs. return
in portfolio selection:
if two portfolios have the same expected realized return
then prefer the one with smaller variance.
An _efficient portfolio_ has the least variance among all portfolios
having the same expected realized return.

In the one-period model every efficient portfolio belongs to a two-dimensional
subspace and is uniquely determined given its expected realized return.
We show that if $R$ is the (random) realized return of any efficient portfolio
and $R_0$ and $R_1$ are the realized returns of any two linearly independent efficient
portfolios then 
$$
	R - R_0 = \beta(R_1 - R_0)
$$
where $\beta = \Cov(R - R_0, R_1 - R_0)/\Var(R_1 - R_0)$.
This generalizes the classical Capital Asset Pricing
Model formula for the expected realized return of efficient portfolios.
Taking expected values of both sides
when $\Var(R_0) = 0$ and $R_1$ is the "market" portfolio gives
the classic CAPM formula
$$
	E[R] - R_0 = \beta(E[R_1] - R_0)
$$
where $\beta = \Cov(R, R_1)/\Var(R_1)$.

The primary contribution of this short note is the observation that the CAPM formula
holds for realized returns as random variables, not just their expectations.
This follows directly from writing down a mathematical model for one period investments.

## One-Period Model

The one-period model is parameterized directly by instrument prices.

Let $I$ be the set of _market instruments_ and $\Omega$ be the set of
possible market outcomes over a single period.  The _one-period model_
specifies the initial instrument prices $x\in\bm{R}^I$ and the final
instrument prices $X\colon\Omega\to\bm{R}^I$ depending on the outcome.
The prices are bounded by the total amount of currency in the world
they are quoted in.
The one period model also specifies, by hook or by crook, a "probability"
measure $P$ on the space of outcomes.

A _portfolio_ $\xi\in\bm{R}^I$ is the number of shares initially purchased in each instrument.
It costs $\xi^T x$ to acquire the portfolio at the beginning of the period
and returns $\xi^T X(\omega)$ when sold at the end of the period if $\omega\in\Omega$ occurs,
where superscript $T$ indicates transpose.

The _realized return_ is $R(\xi) = \xi^T X/\xi^T x$ when $\xi^T x \not= 0$.
Note $R(\xi) = R(t\xi)$ for any non-zero $t\in\bm{R}$ so
there is no loss in assuming $\xi^T x = 1$ when considering returns.
In this case $R(\xi) = \xi^T X$ is the realized return on the portfolio.
It is common in the literature to use _returns_ instead of realized returns
where the return $r$ is defined by $R = 1 + r\Delta t$ or
$R = \exp(r\Delta t)$ where $\Delta t$ is the time in years or a day count fraction for the period.
Since we are considering a one period model there is no need to drag $\Delta t$ into consideration.

## Risk-neutral Measure

If $x$ belongs to the smallest closed cone containing the range of $X$ then
$x = \int_\Omega X dD$ for some positive finitely-additive measure $D$ on $\Omega$.
If we define $P = D/D(\Omega)$ then $P$ is a positive measure with mass 1.

## Efficient Portfolio

A portfolio $\xi$ is _efficient_ if $\Var(R(\xi)) \le
\Var(R(\nu))$ for every portfolio $\nu$ having the same expected
realized return as $\xi$.

If $\xi^T x = 1$ then $\Var(R(\xi)) = \xi^t V\xi$,
where $V = \Var(X) = E[XX^T] - E[X]E[X^T]$.

We can find efficient portfolios using Lagrange multipliers.
For a given realized return $\rho$ we minimize
$$
	\Phi(\xi,\lambda,\mu) = \frac{1}{2}\xi^T V\xi - \lambda(\xi^T \xi - 1) - \mu(\xi^T E[X] - \rho)
$$
over $\xi$, $\lambda$, and $\mu$.
Since $V$ is semi-definite we can use the Cholesky decomposition $V = U^T U$
and $\|Ux - b\|^2 = x^T U^T U x - 2 x^T U b^T + \|b\|^2$ to obtain
$$
\begin{aligned}
	\Phi(\xi,\lambda,\mu) &= \frac{1}{2}\xi^T V\xi - \lambda(\xi^T x - 1) - \mu(\xi^T E[X] - \rho)\\
	&= \frac{1}{2}\xi^T U^T U \xi - \xi^T U b^T + \frac{1}{2}\|b\|^2
		 - \lambda(\xi^T x - 1) - \mu(\xi^T E[X] - \rho)\\
\end{aligned}
$$

The first order conditions for an extremum are
$V\xi - \lambda x - \mu E[X] = 0$, $\nux = 1$, and $\nuE[X] = \rho$.


### Riskless Portfolio

A portfolio $\zeta$ is _riskless_ if its realized return is constant. In this case
$0 = \Var(R(\zeta)) = \zeta'V\zeta$ assuming, as we may, $\zeta'x = 1$.
If another riskless portfolio exists with different realized
return then arbitrage exists.  By removing redundant assets we can assume
there is exactly one riskless portfolio $\zeta$ with $\zeta'x = 1$.

Let $P_\parallel = \zeta\zeta'/\zeta'\zeta$. Note $P_\parallel\zeta = \zeta$ and
$P_\parallel\xi = 0$ if $\zeta'\xi = 0$ so it is the orthogonal projection 
onto the space spanned by $\zeta$.
Let $P_\perp = I - P_\parallel$
be the projection onto its orthogonal complement,
$\{\zeta\}^\perp = \{y\in\bm{R}^I:\zeta'y = 0\}$, so
$V = VP_\perp + VP_\parallel$. Below we analyze the first order conditions for
an extremum on each subspace. Note $P_\parallel$ commutes with $V$ so these
subspaces are invariant under $V$.
Let $y_\parallel = P_\parallel y$ be the component of $y$ parallel to $\zeta$
and $y_\perp = P_\perp y$ be the component of $y$ orthogonal to $\zeta$ for $y\in\bm{R}^I$.

The first order condition $V\xi = \lambda x + \mu E[X]$ implies
$V\xi_\parallel = \lambda x_\parallel + \mu E[X]_\parallel$. Since $\xi_\parallel$
is a scalar multiple of $\zeta$ we have $0 = \lambda + \mu R$ so $\lambda = -\mu R$.
On the orthogonal complement $V\xi_\perp = -\mu R x_\perp + \mu E[X]_\perp$ so
$\xi_\perp = V^\dashv(E[X] - Rx)$ where $V^\dashv$ is the generalized (Moore-Penrose) inverse of $V$.
Letting $\alpha = \xi_\perp = V^\dashv(E[X] - Rx)$, every efficient portfolio can be written
$\xi = \mu \alpha + \nu\zeta$.
We can and do assume $\alpha'x = 1$ so
$1 = \mu + \nu$ and $\xi = \mu \alpha + (1 - \mu)\zeta$.
Multiplying both sides by $X$ we have $\nuX = \mu \alpha'X + (1 - \mu)R$ hence
$$
	R(\xi) - R = \mu(R(\alpha) - R).
$$
This implies the classical CAPM formula by taking expected values where $\alpha$ is the "market portfolio".
It also shows the Lagrange multiplier
$\mu = \Cov(R(\xi),R(\alpha))/\Var(R(\alpha))$ is the classical beta.

### Non-singular Variance

If $V$ is invertible the [Appendix](#lagrange-multiplier-solution)
shows solution is
$\lambda = (C - \rho B)/D$, $\mu = (-B + \rho A)/D$, and
$$
\xi = \frac{C - \rho B}{D}V^{-1}x + \frac{-B + \rho A}{D}V^{-1}E[X]
$$
where $A = xV^{-1}x$, $B = x'V^{-1}E[X] = E[X']V^{-1}x$,
$C = E[X]V^{-1}E[X]$, and $D = AC - B^2$.
The variance of the efficient portfolio is
$$
\Var(R(\xi)) = (C - 2B\rho + A\rho^2)/D.
$$ 

If $\xi_0$ and $\xi_1$ are any two independent efficient portfolios then
they belong to the subspace spanned by $V^{-1}x$ and $V^{-1}E[X]$.
Every efficient portfolio can be written $\xi = \beta_0\xi_0 + \beta_1\xi_1$ for some
scalars $\beta_0$ and $\beta_1$.
Assuming $\xi_j'x = 1$ for $j = 0,1$ then $R(\xi_j) = \xi_j'X$.
Assuming $\nux = 1$ so $R(\xi) = \nuX$ then $\beta_0 + \beta_1 = 1$ and
$\xi = (1 - \beta)\xi_0 + \beta\xi_1$ where $\beta = \beta_1$.
Multiplying both sides by $X$ we have $\nuX = (1 - \beta)\xi_0'X + \beta\xi_1'X$ hence
$$
	R(\xi) - R(\xi_0) = \beta(R(\xi_1) - R(\xi_0))
$$
as functions on $\Omega$ where 
$\beta = \Cov(R(\xi) - R(\xi_0), R(\xi_1) - R(\xi_0))/\Var(R(\xi_1) - R(\xi_0))$.
The classical CAPM formula follows from taking expected values
of both sides when $\xi_1$ is the "market portfolio" and $\xi_0$ is a
[_riskless portfolio_](#riskless-portfolio).

Note that $A$, $B$, $C$, and $D$ depend only on $x$, $E[X]$, and
$E[XX']$. Classical literature focuses mainly on the latter three which
may explain why prior authors overlooked our elementary but stronger
result.

## Appendix

### Lagrange Multiplier Solution

Let's find the minimum value of $\Var(R(\xi))$ given $E[R(\xi)] =
\rho$.  If $\nux = 1$ then $R(\xi) = \nuE[X]$ and $\Var(R(\xi))
= \nuV\xi$ where $V = E[XX'] - E[X]E[X']$.

We use Lagrange multipliers and solve
$$
		\min \frac{1}{2}\nuV\xi - \lambda(\nux - 1) - \mu(\nuE[X] - \rho)
$$
for $\xi$, $\lambda$, and $\mu$.
    
The first order conditions for an extremum are
$$
\begin{aligned}
		0 &= V\xi - \lambda x - \mu E[X] \\
		0 &= \nux - 1 \\
		0 &= \nuE[X] - \rho \\
\end{aligned}
$$
Assuming $V$ is invertible $\xi = V^{-1}(\lambda x + \mu E[X])$.
Note every extremum lies in the (at most) two dimensional subspace
spanned by $V^{-1}x$ and $V^{-1}E[X]$.
    
The constraints $1 = x'\xi$ and $\rho = E[X']\xi$ can be written
$$
\begin{bmatrix}
1 \\
\rho \\
\end{bmatrix}
=
\begin{bmatrix}
\lambda x'V^{-1}x + \mu x'V^{-1}E[X] \\
\lambda E[X']V^{-1}x + \mu E[X']V^{-1}E[X] \\
\end{bmatrix}
= \begin{bmatrix}
A & B \\
B & C\\
\end{bmatrix}
\begin{bmatrix}
\lambda \\
\mu
\end{bmatrix}
$$
with $A = xV^{-1}x$, $B = x'V^{-1}E[X] = E[X']V^{-1}x$, and $C = E[X]V^{-1}E[X]$.
Inverting gives
$$
\begin{bmatrix} \lambda \\ \mu \end{bmatrix}
= \frac{1}{D}
\begin{bmatrix}
C & -B \\
-B & A\\
\end{bmatrix}
\begin{bmatrix}
1 \\
\rho
\end{bmatrix}
=
\begin{bmatrix}
(C - \rho B)/D \\
(-B + \rho A)/D\\
\end{bmatrix}
$$
where $D = AC - B^2$. The solution is
$\lambda = (C - \rho B)/D$, $\mu = (-B + \rho A)/D$, and
$$
    \xi = \frac{C - \rho B}{D} V^{-1}x + \frac{-B + \rho A}{D} V^{-1}E[X].
$$

A straightforward calculation shows the variance is
$$
\Var(R(\xi)) = \nuV\xi = (C - 2B\rho + A\rho^2)/D.
$$

### Fundamental Theorem of Asset Pricing

The one-period Fundamental Theorem of Asset Pricing states there is no model
arbitrage if and only if there exists a positive measure $\Pi$ on
$\Omega$ with $x = \int_\Omega X(\omega)\,d\Pi(\omega)$.  We assume $X$
is bounded, as it is in the real world, and $\Pi$ is
finitely additive.

If such a measure exists and $\xi^T X\ge0$ then
$\xi^T x = \int_\Omega \xi^T X\,d\Pi \ge0$ so arbitrage
cannot occur. The other direction is less trivial.

**Lemma.** _If $x\in\bm{R}^n$ and $C$ is a closed cone in
$\bm{R}^n$ with $x\not\in C$ then there exists $\xi\in\bm{R}^n$
with $\xi^T x < 0$ and $\xi^T y \ge0$ for $y\in C$._

Recall that a _cone_ is a subset of a vector space closed under addition
and multiplication by a positive scalar, that is, $C + C\subseteq C$
and $tC\subseteq C$ for $t > 0$. The set of arbitrage
portfolios is a cone.

_Proof._ Since $C$ is closed and convex there exists $x^*\in C$ with
$0 < ||x^* - x|| \le ||y - x||$ for all $y\in C$.  Let $\xi = x^* - x$.
For any $y\in C$ and $t > 0$ we have $ty + x^*\in C$ so $||\xi|| \le ||ty + \xi||$. 
Simplifying gives $t^2||y||^2 + 2t\xi^T y\ge 0$. 
Dividing by $t > 0$ and letting $t$ decrease to 0 shows $\xi^T y\ge 0$. 
Take $y = x^*$ then $tx^* + x^*\in C$ for $t \ge -1$. By similar reasoning,
letting $t$ increase to 0 shows $\xi^T x^*\le 0$ so $\xi^T x^* = 0$. 
Now $0 < ||\xi||^2 = \xi^T (x^* - x) = -\xi^T x$ hence $\xi^T x < 0$.
$\blacksquare$

Since the set of non-negative finitely additive measures is a closed
cone and $X\mapsto \int_\Omega X\,d\Pi$ is positive, linear, and continuous
$C = \{\int_\Omega X\,d\Pi : \Pi\ge 0\}$ is also a closed cone.
The contrapositive follows from the lemma.

The proof also shows how to find an arbitrage when one exists.

## References

# Notes

Realized returns are not just identically distributed, they are equal.

## Model Arbitrage

There is _model arbitrage_ if there exists a portfolio $\xi$ with
$\nux < 0$ and $\nuX(\omega) \ge0$ for all $\omega\in\Omega$:
you make money on the initial investment and never lose money
when unwinding at the end of the period. This definition does
not require a measure on $\Omega$.

The one-period
[Fundamental Theorem of Asset Pricing](#fundamental-theorem-of-asset-pricing)
states there is no model arbitrage if and only if there exists a positive measure $\Pi$ on $\Omega$ with
$x = \int_\Omega X(\omega)\,d\Pi(\omega)$. We assume $X$ is
bounded, as it is in the real world, and $\Pi$ is a
finitely additive measure.
The dual space of bounded functions on $\Omega$ is the space of finitely additive measures
on $\Omega$
with the dual pairing $\langle X,\Pi\rangle = \int_\Omega X\,d\Pi$ [@DunSch63]
Chapter III.

If $x = \int_\Omega X\,d\Pi$ for a positive measure $\Pi$ then all portfolios
have the same expected realized return $R = 1/\|\Pi\|$ where $\|\Pi\| = \int_\Omega
1\,d\Pi$ is the mass of $\Pi$ and the expected value is with respect to
the _risk-neutral_ probability measure $Q = \Pi/\|\Pi\|$.
This follows from $E[\nuX] = \nux/\|\Pi\| = R\nux$ for any portfolio $\xi$.

Note $Q$ is not the probability of anything, it is simply a positive
measure with mass 1. The above statements are geometrical, not probabilistic.

