---
title: Efficient Portfolios
author: Keith A. Lewis
institute: KALX, LLC
classoption: fleqn
fleqn: true
abstract: CAPM holds as equality of random variables, not just their expected value.
thanks: |
	Peter Carr and David Shimko gave insightful feedback to
	make the exposition more accessible to finance professionals.
	Any remaining infelicities or omissions are my fault.
---

\newcommand\bm[1]{\boldsymbol{#1}}
\newcommand\RR{\boldsymbol{R}}
\newcommand\BB{\mathcal{B}}
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

In the one-period model every efficient portfolio belongs to a one or two-dimensional
subspace and is uniquely determined given its expected realized return.
We show that if $R$ is the (random) realized return of any efficient portfolio
and $R_0$ and $R_1$ are the (random) realized returns of any two linearly independent efficient
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

<!--
## Background

After the US stock market crash of 1929 the government passed the 1933
Glass-Steagall Act prohibited banks from participating in the stock
market and insurance industry. In 1934 the Securities
and Exchange Commission was established to protect retail investors from market
manipulation by large banks.

In the same year, Benjamin Graham and David Todd, professors at Columbia Business
School at the time, published _Security Analysis_. Their premise was
to value a business based on their current balance sheet and expected future cash flows.

Markowitz was the Marcel Duchamp of portfolio management.  Instead of due
diligence on individual companies he showed how portfolio managers could
use the collective wisdom of publicly available market prices. Market
data and compute power was limited at the time so returns and covariances were based
on daily data.
-->

## One-Period Model

Let $I$ be the set of _market instruments_ and $\Omega$ be the set of
possible market outcomes over the period.  The _one-period model_
specifies the initial instrument prices $x\in\RR^I$ and the final
instrument prices $X\colon\Omega\to\RR^I$ depending on the outcome
$\omega\in\Omega$ that occurs.
Recall if $A$ and $B$ are sets then $B^A = \{f\colon A\to B\}$ is the set of all
functions from $A$ to $B$. We write $x_i$ for $x(i)$ when $x\in\RR^I$.
The one period model also specifies a probability
measure $P$ on the space of outcomes. Solving this fundamental and
important problem is outside the scope of this short note.

<!-- in the modern world -->

A _portfolio_ $\xi\in\RR^I$ is the number of shares initially purchased
in each instrument.  It costs ${\xi^* x = \sum_{i\in I} \xi_i x_i}$ to
acquire the portfolio at the beginning of the period and returns
${\xi^* X(\omega) = \sum_{i\in I} \xi_i X_i(\omega)}$ when liquidated at the
end of the period if $\omega\in\Omega$ occurs.  The _realized return_
of $\xi$ is ${R_\xi = \xi^* X/\xi^* x}$ when $\xi^* x \not= 0$.

_Arbitrage_ exists if there is a portfolio $\xi\in\RR^I$ with $\xi^* x <
0$ and $\xi^* X(\omega) \ge0$, $\omega\in\Omega$.  The cost of acquiring
the porfolio is negative so you make money up front.  The liquidation
value at the end of the period is always non-negative so you never lose
money. Note the definition of arbitrage does not involve the probability measure.
The _Fundamental Theorem of Asset Pricing_ for the one-period model
states there is no arbitrage if and only if there exists a positive
measure $D$ on $\Omega$ with $x = \int_\Omega X\,dD$. See the
[Appendix](fundamental-theorem-of-asset-pricing) for an elementary proof.

If there exists a portfolio $\zeta\in\RR^I$ with $\zeta^* X = 1$ then
a riskless _zero coupon bond_ is available with
return $R_\zeta = 1/\zeta^* x$.

## Efficient Portfolio

A portfolio $\xi\in\RR^I$ is _efficient_ if $\Var(R_\xi) \le
\Var(R_\eta)$ for every portfolio $\eta$ having the same expected
realized return as $\xi$.
Note $R_\xi = R_{t\xi}$ for any non-zero $t\in\RR$ so
there is no loss in assuming $\xi^* x = 1$.
In this case $R_\xi = \xi^* X$ is the realized return of the portfolio.

If $\xi^* x = 1$ then ${\Var(R_\xi) = \xi^* V\xi}$
where ${V = \Var(X) = E[XX^*] - E[X]E[X^*]}$.
For a given expected realized return $r\in\RR$ we use Lagrange multipliers and minimize
$$
	\frac{1}{2}\xi^* V\xi - \lambda(\xi^* x - 1) - \mu(\xi^* E[X] - r)
$$
over $\xi\in\RR^I$, $\lambda\in\RR$, and $\mu\in\RR$.

It is not always the case $V$ is one-to-one. If $V\xi = 0$
then $\Var(R_\xi) = 0$ so $\xi^* X$ is constant
and $\xi$ is a zero coupon bond.
If $\Var(R_\eta) = 0$ and $R_\eta \not= R_\zeta$ then arbitrage
exists so we can assume the kernel of $V$ is at most 1-dimensional.
If $\Var(R_\xi) = 0$ then $\xi$ is obviously efficient.


If $\Var(R_\xi) \not= 0$ then
$$
	\xi =  \lambda V^{\dashv}x + \mu V^{\dashv} E[X] \\
$$
where $V^{\dashv}$ is the Moore-Penrose left inverse of $V$.
The [Appendix](#appendix) shows $\lambda = (C - r B)/D$, $\mu = (-B + r A)/D$, where
${A = x^* V^{\vdash}x}$, ${B = x^* V^{\vdash}E[X] = E[X^*]V^{\vdash}x}$, ${C = E[X^*]V^{\vdash}E[X]}$,
and ${D = AC - B^2}$.
Note that $A$, $B$, $C$, and $D$ depend only on $x$, $E[X]$, and
$E[XX^*]$.

Classical literature makes the implicit assumption $\Omega = \RR^I$, so
any instrument can go to any price, and that returns are jointly normal
to reduce the problem of finding a probability measure to estimating
the mean $E[X]$ and the covariance $E[XX^*] - E[X] E[X^*]$.
This may explain why prior authors overlooked our elementary but stronger
result.

This shows every efficient porfolio is in the span of 
$V^{\vdash}x$ and $V^{\vdash} E[X]$.
If $\xi_0$ and $\xi_1$ are any two independent efficient portfolios then
${\xi = \beta_0\xi_0 + \beta_1\xi_1}$ for some scalars $\beta_0$ and $\beta_1$.
Assuming, as we may, that $\xi_j^* x = 1$ for $j = 0,1$ then $\xi^* x = \beta_0 + \beta_1$
and $\xi^* X = \beta_0 R_{\xi_0} + \beta_1 R_{\xi_1}$
so $R_\xi = \xi^* X/\xi^* x = (\beta_0 R_{\xi_0} + \beta_1 R_{\xi_1})/(\beta_0 + \beta_1)$.
This shows
$$
	R_\xi - R_{\xi_0} = \beta(R_{\xi_1} - R_{\xi_0})
$$
as functions on $\Omega$, where $\beta = \beta_1/(\beta_0 + \beta_1)$.
Taking the covariance with $R_{\xi_1} - R_{\xi_0}$ on both sides gives
$$
	\beta = \Cov(R_\xi - R_{\xi_0}, R_{\xi_1} - R_{\xi_0})/\Var(R_{\xi_1} - R_{\xi_0}).
$$

A portfolio $\zeta$ is _riskless_ if its realized return is constant. In this case
$\Var(R_\zeta) = 0$ so it is efficient.
The classical CAPM formula follows from taking expected values
of both sides when $\xi_1$ is the "market portfolio" and $\xi_0$ is a
_riskless portfolio_.

<!--
$0 = \Var(R(\zeta)) = \zeta^* V\zeta$ assuming, as we may, $\zeta^* x = 1$.
If another riskless portfolio exists with different realized
return then arbitrage exists.  By removing redundant assets we can assume
there is exactly one riskless portfolio $\zeta$ with $\zeta^* x = 1$.

Let $P_\parallel = \zeta\zeta'/\zeta'\zeta$. Note $P_\parallel\zeta = \zeta$ and
$P_\parallel\xi = 0$ if $\zeta'\xi = 0$ so it is the orthogonal projection 
onto the space spanned by $\zeta$.
Let $P_\perp = I - P_\parallel$
be the projection onto its orthogonal complement,
$\{\zeta\}^\perp = \{y\in\RR^I:\zeta'y = 0\}$, so
$V = VP_\perp + VP_\parallel$. Below we analyze the first order conditions for
an extremum on each subspace. Note $P_\parallel$ commutes with $V$ so these
subspaces are invariant under $V$.
Let $y_\parallel = P_\parallel y$ be the component of $y$ parallel to $\zeta$
and $y_\perp = P_\perp y$ be the component of $y$ orthogonal to $\zeta$ for $y\in\RR^I$.

The first order condition $V\xi = \lambda x + \mu E[X]$ implies
$V\xi_\parallel = \lambda x_\parallel + \mu E[X]_\parallel$. Since $\xi_\parallel$
is a scalar multiple of $\zeta$ we have $0 = \lambda + \mu R$ so $\lambda = -\mu R$.
On the orthogonal complement $V\xi_\perp = -\mu R x_\perp + \mu E[X]_\perp$ so
$\xi_\perp = V^\dashv(E[X] - Rx)$ where $V^\dashv$ is the generalized (Moore-Penrose) inverse of $V$.
Letting $\alpha = \xi_\perp = V^\dashv(E[X] - Rx)$, every efficient portfolio can be written
$\xi = \mu \alpha + \mu\zeta$.
We can and do assume $\alpha'x = 1$ so
$1 = \mu + \mu$ and $\xi = \mu \alpha + (1 - \mu)\zeta$.
Multiplying both sides by $X$ we have $\mu X = \mu \alpha'X + (1 - \mu)R$ hence
$$
	R(\xi) - R = \mu(R(\alpha) - R).
$$
This implies the classical CAPM formula by taking expected values where $\alpha$ is the "market portfolio".
It also shows the Lagrange multiplier
$\mu = \Cov(R(\xi),R(\alpha))/\Var(R(\alpha))$ is the classical beta.

-->

## Appendix

Let $\BB(V,W)$ be all bounded operators from normed vector spaces $V$ to $W$.
Define $V^* = \BB(V,\RR)$. If $\xi\in\RR^I$ define $\xi^*\in(\RR^I)^*$
by $\xi^*x = \sum_{i\in I}\xi_i x_i$ if $I$ is finite.
Note $\xi^*x = x^*\xi$ and this identifies $(\RR^I)^*$ with $\RR^I$.

### Fréchet derivative

If $F\colon V\to W$ is a function between normed vector spaces, its Fréchet derivative
${DF\colon V\to \mathcal{B}(V,W)}$ is defined by
$$
	F(x + h) = F(x) + DF(x)h + o(\|h\|).
$$
If the Fréchet derivative exists at $x$ then $F$ can be appoximated by a linear
operator. If $V = W = \RR$ then ${DF(x) = F'(x) = \lim_{h\to0}(F(x + h) - F(x))/h}$.

For $\xi\in\RR^I$ define $F\colon\RR^I\to\RR$ by $F(x) = \xi^* x$.
We have $F(x + h) = \xi^*x + \xi^*h + 0$ so $DF(x) = \xi^*$.

Define $F\colon\RR^I\to\RR$ by $F(x) = x^*Ax$ where $A\colon\RR^I\to\RR^I$
is linear. We have
$$
\begin{aligned}
	F(x + h) &= (x + h)^*A(x + h) \\
		&= x^*Ax + x^*Ah + h^*Ax + h^*h \\
		&= x^*Ax + 2x^*Ah + o(\|h\|). \\
\end{aligned}
$$
This shows $DF(x) = 2x^*A$.

### Lagrange Multiplier

Let's find the minimum value of $\Var(R_\xi)$ given $E[R_\xi] = r$.
If $\xi^* x = 1$ then $R_\xi = \xi^* E[X]$ and $\Var(R_\xi)
= \xi^* V\xi$ where $V = E[XX^*] - E[X]E[X^*]$.

We use Lagrange multipliers and solve
$$
		\min \frac{1}{2}\xi^* V\xi - \lambda(\xi^* x - 1) - \mu(\xi^* E[X] - r)
$$
for $\xi$, $\lambda$, and $\mu$.
    
The first order conditions for an extremum are
$$
\begin{aligned}
		0 &= \xi^*V - \lambda x - \mu E[X] \\
		0 &= \xi^* x - 1 \\
		0 &= \xi^* E[X] - r \\
\end{aligned}
$$
Assuming $V$ is invertible $\xi = V^{-1}(\lambda x + \mu E[X])$.
Note every extremum lies in the (at most) two dimensional subspace
spanned by $V^{-1}x$ and $V^{-1}E[X]$.
    
The constraints $1 = x^*\xi$ and $r = E[X^*]\xi$ can be written
$$
\begin{bmatrix}
1 \\
r \\
\end{bmatrix}
=
\begin{bmatrix}
\lambda x^*V^{-1}x + \mu x^*V^{-1}E[X] \\
\lambda E[X^*]V^{-1}x + \mu E[X^*]V^{-1}E[X] \\
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
with $A = x^* V^{-1}x$, $B = x^* V^{-1}E[X] = E[X^*]V^{-1}x$, and $C = E[X^*] V^{-1}E[X]$.
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
r
\end{bmatrix}
=
\begin{bmatrix}
(C - r B)/D \\
(-B + r A)/D\\
\end{bmatrix}
$$
where $D = AC - B^2$. The solution is
$\lambda = (C - r B)/D$, $\mu = (-B + r A)/D$, and
$$
    \xi = \frac{C - r B}{D} V^{-1}x + \frac{-B + r A}{D} V^{-1}E[X].
$$

A straightforward calculation shows the variance is
$$
\Var(R_\xi) = \xi^* V\xi = (C - 2BR + AR^2)/D.
$$

### Fundamental Theorem of Asset Pricing

It may be the case $V^{-1}x$ and $V^{-1}E[X]$ are dependent.
In this case $x = E[X]D$ for some $D\in\RR$. This
ensures the model is _arbitrage free_. Arbitrage exists if
there is a $\xi\in\RR^I$ with $\xi^* x < 0$ and $\xi^* X(\omega)\ge0$
for $\omega\in\Omega$: you make money putting on the position
and never lose money unwinding it.

If $x$ belongs to the smallest closed cone containing the range of $X$ then
$x = \int_\Omega X dD$ for some positive finitely-additive measure $D$ on $\Omega$.
If we define $P = D/D(\Omega)$ then $P$ is a positive measure with mass 1.

The one-period Fundamental Theorem of Asset Pricing states there is no model
arbitrage if and only if there exists a positive measure $D$ on
$\Omega$ with $x = \int_\Omega X(\omega)\,dD(\omega)$.  We assume $X$
is bounded, as it is in the real world, and $D$ is
finitely additive.

If such a measure exists and $\xi^* X\ge0$ then
$\xi^* x = \int_\Omega \xi^* X\,dD \ge0$ so arbitrage
cannot occur. The other direction is less trivial.

__Lemma.__ _If $x\in\RR^n$ and $C$ is a closed cone in
$\RR^n$ with $x\not\in C$ then there exists $\xi\in\RR^n$
with $\xi^* x < 0$ and $\xi^* y \ge0$ for $y\in C$._

Recall that a _cone_ is a subset of a vector space closed under addition
and multiplication by a positive scalar, that is, $C + C\subseteq C$
and $tC\subseteq C$ for $t > 0$. Note the set of arbitrage
portfolios is a cone.

_Proof._ Since $C$ is closed and convex there exists $x^*\in C$ with
$0 < ||x^* - x|| \le ||y - x||$ for all $y\in C$.  Let $\xi = x^* - x$.
For any $y\in C$ and $t > 0$ we have $ty + x^*\in C$ so $||\xi|| \le ||ty + \xi||$. 
Simplifying gives $t^2||y||^2 + 2t\xi^* y\ge 0$. 
Dividing by $t > 0$ and letting $t$ decrease to 0 shows $\xi^* y\ge 0$. 
Take $y = x^*$ then $tx^* + x^*\in C$ for $t \ge -1$. By similar reasoning,
letting $t$ increase to 0 shows $\xi^* x^*\le 0$ so $\xi^* x^* = 0$. 
Because $0 < ||\xi||^2 = \xi^* (x^* - x) = -\xi^* x$ we have $\xi^* x < 0$.

Since the set of non-negative finitely additive measures is a closed
cone and $X\mapsto \int_\Omega X\,dD$ is positive, linear, and continuous
$C = \{\int_\Omega X\,dD : D\ge 0\}$ is also a closed cone.
The contrapositive follows from the lemma.

The proof also shows how to find an arbitrage when one exists.

<!--

## References

# Notes

Realized returns are not just identically distributed, they are equal.

## Appendix

There is _model arbitrage_ if there exists a portfolio $\xi$ with
$\xi^* x < 0$ and $\xi^* X(\omega) \ge0$ for all $\omega\in\Omega$:
you make money on the initial investment and never lose money
when unwinding at the end of the period. This definition does
not require a measure on $\Omega$.

The one-period
[Fundamental Theorem of Asset Pricing](#fundamental-theorem-of-asset-pricing)
states there is no model arbitrage if and only if there exists a positive measure $D$ on $\Omega$ with
$x = \int_\Omega X(\omega)\,dD(\omega)$. We assume $X$ is
bounded, as it is in the real world, and $D$ is a
finitely additive measure.
The dual space of bounded functions on $\Omega$ is the space of finitely additive measures
on $\Omega$
with the dual pairing $\langle X,D\rangle = \int_\Omega X\,dD$ [@DunSch63]
Chapter III.

If $x = \int_\Omega X\,dD$ for a positive measure $D$ then all portfolios
have the same expected realized return $R = 1/\|D\|$ where $\|D\| = \int_\Omega
1\,dD$ is the mass of $D$ and the expected value is with respect to
the _risk-neutral_ probability measure $Q = D/\|D\|$.
This follows from $E[\xi^* X] = \xi^* x/\|D\| = R\xi^* x$ for any portfolio $\xi$.

Note $Q$ is not the probability of anything, it is simply a positive
measure with mass 1. The above statements are geometrical, not probabilistic.

Erdos. Hawaii.
Thought he played chess, turned out to be go.
Misspent youth playing chess for quarters in the ASU student union.
Worst talk ever. Stood in front of what he was writing and turned to tell a story that occured to him, still covering the board.

At the memorial I found out John was not a good housekeeper.
I worked with him at Brown and had been to his house on occasion, and
even to his cabin in Enfield when Christine was still with us.

Even before I came to Brown I found his papers to be perfectly orderly. He
would state assumptions and prove lemmas in the order required, and by
the time you got to the proof of his main result everything was perfectly clear.

That made a big impression on me as a fledgling mathematician.
When I started attending his Wednesday analysis seminars I was shocked when I
heard him asking dumb questions. They had to be dumb, I knew the answer!

After each talk he would buttonhole the person he invited and get a brain dump
of the key ideas behind their result. Mathematicians start with simple examples
and generalize to the largest set of axioms for which they hold. 
An observation about integers can turn into a theorem about Noetherian rings.

John taught me how to learn new things after you got a PhD. Be humble,
ask questions, and be genuinely interested in acquiring new knowledge.
His seminar participants were happy to share their hard-won knowledge with him.

I am no longer a practicing mathematician. People in the business world
don't care about math. They have 99 problems to solve every day and maybe 1
of those can benefit them from mathematical treatment.

but I endeavor to replicate the same claity when communicating mathematics to business people who
could not care less about math.


-->
