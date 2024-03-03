---
title: Efficient Portfolios
author: Keith A. Lewis
institute: KALX, LLC
classoption: fleqn
fleqn: true
Header-includes:
  - \usepackage{unicode-math}
abstract: CAPM holds as equality of random variables, not just their expected value.
thanks: |
	Kevin Atteson, Peter Carr, Dilip Madan, David Shimko, and Ed Weinberger gave insightful feedback to
	make the exposition more accessible to finance professionals.
	Any remaining infelicities or omissions are my fault.
---

\newcommand\RR{\mathbf{R}}
\newcommand\BB{\mathcal{B}}
\newcommand\LL{\mathcal{L}}
\newcommand\Var{\operatorname{Var}}
\newcommand\Cov{\operatorname{Cov}}

Given two random realized returns on an investment, which is to
be preferred?  This is a fundamental problem in finance that has no
definitive solution except in the case one investment always returns
more than the other, in which case arbitrage exists.
In 1952 Markowitz[@Mar1952] and Roy[@Roy1952] introduced a criterion for risk vs. return
in portfolio selection:
if two portfolios have the same expected realized return
then prefer the one with smaller variance.
An efficient portfolio has the least variance among all portfolios
having the same expected realized return.
This was developed into the Capital Asset Pricing Model by Treynor[@Tre1961],
Sharp[@Sha1964], Lintner[@Lin1965], and many others.

The CAPM places a constraint on the expected excess realized return of efficient portfolios.
$$
\tag{1}	E[R] - R_0 = \beta(E[R_1] - R_0)
$$
where $R$ is the realized return of an efficient portfolio,
$R_0$ is the realized return of a risk-less portfolio,
$R_1$ is the realized return of the "market portfolio",
and $\beta = \Cov(R, R_1)/\Var(R_1)$.

This short note points out
$$
\tag{2}	R - R_0 = \beta(R_1 - R_0)
$$
where $R_0$ and $R_1$ are the realized returns of any two independent efficient portfolios.
This implies $\beta = \Cov(R - R_0, R_1 - R_0)/\Var(R_1 - R_0)$.
Taking expected values of both sides
when $R_0$ has zero variance and $R_1$ is the "market" portfolio gives
the classical CAPM formula

Equation (2) can be used to compute the value-at-risk, or any risk
measure, of efficient portfolios, something not possible using the
classical result that only holds for expected values. 
This result follows directly from writing down a mathematical model for one period
investments.  Prior work does not explicitly specify a sample space and
probability measure, the first step in any model involving probability
since Kolomogorov legitimized probability as a branch of measure theory
[@Kol1956].

## One-Period Model

Let $I$ be the set of _market instruments_ and $\Omega$ be the set of
possible _market outcomes_ over the period.  The _one-period model_
specifies the initial instrument prices $x\in\RR^I$ and the final
instrument prices $X\colon\Omega\to\RR^I$ depending on the outcome
$\omega\in\Omega$ that occurs.
The one period model also specifies a probability
measure on the space of outcomes. Addressing this fundamental and
important problem is outside the scope of this short note.

A _portfolio_ $\xi\in\RR^I$ is the number of shares initially purchased
in each instrument.  It costs ${\xi^* x = \sum_{i\in I} \xi_i x_i}$ to
acquire the portfolio at the beginning of the period and returns
${\xi^* X(\omega) = \sum_{i\in I} \xi_i X_i(\omega)}$ when liquidated at the
end of the period if $\omega\in\Omega$ occurs.  The _realized return_
of $\xi$ is ${R_\xi = \xi^* X/\xi^* x}$ when $\xi^* x \not= 0$.

A portfolio is _efficient_ if its variance is less than or equal to
the variance of any portfolio having the same expected realized return.
Note $R_\xi = R_{t\xi}$ for any non-zero $t\in\RR$ so there is no loss in
assuming $\xi^* x = 1$.  In this case $R_\xi = \xi^* X$ is the realized
return of the portfolio.  If $\xi^* x = 1$ then the variance of the
realized return is $\Var(R_\xi) = \xi^*V\xi$ where ${V = E[X X^*] -
E[X] E[X]^*}$.

For a given expected realized return $r\in\RR$ we can use Lagrange multipliers to minimize
${\frac{1}{2}\xi^* V\xi - \lambda(\xi^* x - 1) - \mu(\xi^* E[X] - r)}$
over $\xi\in\RR^I$, $\lambda\in\RR$, and $\mu\in\RR$.

As is well-known, the first order condition on $\xi$ is
$$
	0 = V\xi - \lambda x - \mu E[X].
$$

If $V$ is invertable then
$$
	\xi =  \lambda V^{-1}x + \mu V^{-1} E[X].
$$
This shows every efficient portfolio is in the span of 
$V^{-1}x$ and $V^{-1} E[X]$.

If $\xi_0$ and $\xi_1$ are any two independent efficient portfolios then
${\xi = \beta_0\xi_0 + \beta_1\xi_1}$ for some scalars $\beta_0$ and $\beta_1$.
Assuming, as we may, that $\xi_j^* x = 1$ for $j = 0,1$ then ${\xi^* x = \beta_0 + \beta_1}$
and ${\xi^* X = \beta_0 R_{\xi_0} + \beta_1 R_{\xi_1}}$
so ${R_\xi = (\beta_0 R_{\xi_0} + \beta_1 R_{\xi_1})/(\beta_0 + \beta_1)}$.
This shows
$$
	R_\xi - R_{\xi_0} = \beta(R_{\xi_1} - R_{\xi_0}) \tag{1}
$$
as random variables on $\Omega$, where $\beta = \beta_1/(\beta_0 + \beta_1)$.
Taking the covariance with ${R_{\xi_1} - R_{\xi_0}}$ on both sides gives
$$
	\beta = \Cov(R_\xi - R_{\xi_0}, R_{\xi_1} - R_{\xi_0})/\Var(R_{\xi_1} - R_{\xi_0}).
$$

If $V$ is not invertable then there exists $\zeta\in\RR^I$ with ${V\zeta = 0}$.
The first order condition gives ${0 = -\lambda x - \mu E[X]}$
so the expected realized return for every portfolio ${\xi\in\RR^I}$
is ${E[R_\xi] = E[\xi^*X] = -\lambda/\mu}$.  In this case $\zeta$ is
clearly efficient.

There may be two independent portfolios having variance zero. If they
have different returns then arbitrage exists. If they have the same
return then the model has redundant assets.

## References
<!--

As Black[@Bla1972] showed, there is no need to assume
a zero coupon bond is available.







We show that if $R$ is the (random) realized return of any efficient portfolio
and $R_0$ and $R_1$ are the (random) realized returns of any two linearly independent efficient
portfolios then 
$$
\tag{1}	R - R_0 = \beta(R_1 - R_0)
$$
where $\beta = \Cov(R - R_0, R_1 - R_0)/\Var(R_1 - R_0)$.
Taking expected values of both sides
when $R_0$ is a zero coupon bond and $R_1$ is the "market" portfolio gives
the classical CAPM formula

This short note proves the CAPM formula holds as equality of
realized returns as random variables, not just their expectations.
This follows directly from writing down a mathematical model for one period
investments.  Prior work does not explicitly specify a sample space and
probability measure, the first step in any model involving probability
since Kolomogorov legitimized probability as a branch of measure theory
[@Kol1956].

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


## Efficient Portfolio

A portfolio is _efficient_ if its variance is
less than or equal to the variance of any portfolio having the same expected
realized return.

Note $R_\xi = R_{t\xi}$ for any non-zero $t\in\RR$ so there is no loss in
assuming $\xi^* x = 1$.  In this case $R_\xi = \xi^* X$ is the realized
return of the portfolio.  If $\xi^* x = 1$ then the variance of the
realized return is $\Var(R_\xi) = \xi^*V\xi$ where ${V = E[X X^*] -
E[X] E[X]^*}$.

For a given expected realized return $r\in\RR$ we use Lagrange multipliers and minimize
$$
	\frac{1}{2}\xi^* V\xi - \lambda(\xi^* x - 1) - \mu(\xi^* E[X] - r)
$$
over $\xi\in\RR^I$, $\lambda\in\RR$, and $\mu\in\RR$.

If $V$ is invertable then
$$
	\xi(r) =  \lambda V^{-1}x + \mu V^{-1} E[X]
$$
where $\lambda = (C - r B)/D$, $\mu = (-B + r A)/D$, where
${A = x^* V^{-1}x}$, ${B = x^* V^{-1}E[X] = E[X^*]V^{-1}x}$, ${C = E[X^*]V^{-1}E[X]}$,
and ${D = AC - B^2}$.
Note that $A$, $B$, $C$, and $D$ depend only on $x$, $E[X]$, and
$E[XX^*]$.

This shows every efficient portfolio is in the span of 
$V^{-1}x$ and $V^{-1} E[X]$.

As Black[@Bla1972] showed, there is no need to assume
a zero coupon bond is available.

If $\xi_0$ and $\xi_1$ are any two independent efficient portfolios then
${\xi = \beta_0\xi_0 + \beta_1\xi_1}$ for some scalars $\beta_0$ and $\beta_1$.
Assuming, as we may, that $\xi_j^* x = 1$ for $j = 0,1$ then ${\xi^* x = \beta_0 + \beta_1}$
and ${\xi^* X = \beta_0 R_{\xi_0} + \beta_1 R_{\xi_1}}$
so ${R_\xi = (\beta_0 R_{\xi_0} + \beta_1 R_{\xi_1})/(\beta_0 + \beta_1)}$.
This shows
$$
	R_\xi - R_{\xi_0} = \beta(R_{\xi_1} - R_{\xi_0}) \tag{1}
$$
as functions on $\Omega$, where $\beta = \beta_1/(\beta_0 + \beta_1)$.
Taking the covariance with ${R_{\xi_1} - R_{\xi_0}}$ on both sides gives
$$
	\beta = \Cov(R_\xi - R_{\xi_0}, R_{\xi_1} - R_{\xi_0})/\Var(R_{\xi_1} - R_{\xi_0}).
$$


The [Appendix](#appendix) shows the first order condition on $\xi$ is
$$
	0 = V\xi - \lambda x - \mu E[X].
$$

If $V\zeta = 0$ for some $\zeta\in\RR^I$ then $\zeta$ is a zero coupon bond
and $x = E[X]D$ where $D = -\mu/\lambda$.
In this case every portfolio $\xi\in\RR^I$
has the same expected realized return
${E[R_\xi] = E[\xi^*X/\xi^*x] = 1/D}$ and $\zeta$ is clearly optimal.

Equation (1) makes it possible to compute value at risk, or any risk measure, for
an efficient portfolio using the joint distribution of $R_0$ and $R_1$.
Note this is not possible using the classical CAPM model.

## Appendix

We use the notation $\xi^*$ for what is usually denoted
by the transpose $\xi^T$.  It is simpler and more illuminating to work with abstract
vector spaces and linear operators between them
than with $\RR^n$ and matrices. Matrix multiplication is just composition of linear operators.

Recall $\RR^I = \{x\colon I\to\RR\}$ is the vector space of all
functions from the set $I$ to $\RR$ with scalar multiplication and
vector addition defined point-wise: ${(ax)(i) = ax(i)}$ and
${(x + y)(i) = x(i) y(i)}$ for $a\in\RR$, ${x,y\in\RR^I}$, and $i\in I$.

For $\xi\in\RR^I$ define $\xi^*\in(\RR^I)^*$
by $\xi(x) = \xi^*x = \sum_{i\in I} \xi_i x_i$ if $I$ is finite.
Note $\xi^*x = x^*\xi$ and this identifies $(\RR^I)^*$ with $\RR^I$.
The Euclidean norm on $\RR^I$ is $\|x\| = \sqrt{x^*x}$. 

Let $\BB(V,W)$ be the set of bounded linear operators between normed linear spaces $V$
and $W$. A linear operator $T\colon V\to W$ is bounded if
there exists $C\in\RR$ with $\|Tv\| \le C\|v\|$ for all $v\in V$.
The least upper bound of such constants is the _norm_ of $T$.
Note $\BB(V,W)$ is also a normed vector space with scalar multiplication
and addition defined point-wise.

Define the _dual_ of a vector space $V$ to be all _bounded linear functionals_ from
$V$ to $\RR$: $V^* = \BB(V,\RR)$. If $T\in\LL(V,W)$ define
the _adjoint_ $T^*\in\BB(W^*,V^*)$ by $T^*w^*\in V^*$
where $T^*w^*(v) = w^*(Tv)$, $w^*\in W^*$, $v\in V$.
If $S\in\LL(W,U)$ then $ST\in\LL(V,U)$ and $(ST)^* = T^*S^*$.

### Fréchet derivative

If $F\colon V\to W$ is a function between normed vector spaces its Fréchet derivative
${DF\colon V\to \BB(V,W)}$ is defined by
$$
	F(\xi + h) = F(\xi) + DF(\xi)h + o(\|h\|).
$$
If the Fréchet derivative exists at $\xi$ then $F$ can be approximated by a linear
operator near $\xi$. 

Given $x\in\RR^I$
define $F\colon\RR^I\to\RR$ by $F(\xi) = \xi^*x$.
We have ${F(\xi + h) = \xi^*x + h^*x + 0}$
so $DF(\xi) = x^*$ since $h^*x = x^*h$.

Given $T\colon\RR^I\to\RR^I$
define $F\colon\RR^I\to\RR$ by $F(\xi) = \xi^*T\xi$.
We have
$$
\begin{aligned}
	F(\xi + h) &= (\xi + h)^*T(\xi + h) \\
		&= \xi^*T\xi + \xi^*Th + h^*T\xi + h^*h \\
		&= \xi^*T\xi + \xi^*Th + \xi^*T^*h + o(\|h\|). \\
\end{aligned}
$$
This shows $DF(\xi) = \xi^*(T + T^*)$.

### Lagrange Multiplier

To find the minimum value of $\Var(R_\xi)$ given $E[R_\xi] = r$
we use Lagrange multipliers and solve
$$
		\min \frac{1}{2}\xi^* V\xi - \lambda(\xi^* x - 1) - \mu(\xi^* E[X] - r)
$$
for $\xi$, $\lambda$, and $\mu$.
If ${\xi^* \xi = 1}$ then ${R_\xi = \xi^* E[X]}$ and
${\Var(R_\xi) = \xi^* V\xi}$ where ${V = E[XX^*] - E[X]E[X^*]}$.
    
The first order conditions for an extremum are
$$
\begin{aligned}
		0 &= \xi^*V - \lambda x^* - \mu E[X]^* \\
		0 &= \xi^* x - 1 \\
		0 &= \xi^* E[X] - r \\
\end{aligned}
$$
Assuming $V$ is left invertible $\xi = V^{-1}(\lambda x + \mu E[X])$.
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
\Var(R_\xi) = \xi^* V\xi = (C - 2Br + Ar^2)/D.
$$



### Fundamental Theorem of Asset Pricing

It may be the case $V^{-1}x$ and $V^{-1}E[X]$ are dependent.
In this case $x = E[X]D$ for some $D\in\RR$. This
ensures the model is _arbitrage free_.

Arbitrage exists in the one-period model if
there is a $\xi\in\RR^I$ with $\xi^* x < 0$ and $\xi^* X(\omega)\ge0$
for $\omega\in\Omega$: you make money putting on the position
and never lose money unwinding it.

The one-period Fundamental Theorem of Asset Pricing states there is no model
arbitrage if and only if there exists a positive measure $D$ on
$\Omega$ with $x = \int_\Omega X(\omega)\,dD(\omega)$.  We assume $X$
is bounded, as it is in the real world, and $D$ is
finitely additive.

If $x = \sum_j X(\omega_j) d_j$ where $\omega_j\in\Omega$ and $d_j\ge0$ then
$$
	\xi*x = \sum_j \xi^*X(\omega_j) d_j \ge0
$$
if $\xi^*X\ge0$ on $\Omega$.

If $x$ belongs to the smallest closed cone containing the range of $X$ then
$x = \int_\Omega X dD$ for some positive finitely-additive measure $D$ on $\Omega$.
If we define $P = D/D(\Omega)$ then $P$ is a positive measure with mass 1.


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
$0 < \|x^* - x\| \le \|y - x\|$ for all $y\in C$.  Let $\xi = x^* - x$.
For any $y\in C$ and $t > 0$ we have $ty + x^*\in C$ so $\|\xi\| \le \|ty + \xi\|$. 
Simplifying gives $t^2\|y\|^2 + 2t\xi^* y\ge 0$. 
Dividing by $t > 0$ and letting $t$ decrease to 0 shows $\xi^* y\ge 0$. 
Take $y = x^*$ then $tx^* + x^*\in C$ for $t \ge -1$. By similar reasoning,
letting $t$ increase to 0 shows $\xi^* x^*\le 0$ so $\xi^* x^* = 0$. 
Because $0 < \|\xi\|^2 = \xi^* (x^* - x) = -\xi^* x$ we have $\xi^* x < 0$.

Since the set of non-negative finitely additive measures is a closed
cone and $X\mapsto \int_\Omega X\,dD$ is positive, linear, and continuous
$C = \{\int_\Omega X\,dD : D\ge 0\}$ is also a closed cone.
The contrapositive follows from the lemma.

The proof also shows how to find an arbitrage when one exists.
-->

