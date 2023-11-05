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
We show that if $R$ is the realized return of any efficient portfolio
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
specifies the initial instrument prices $x\in\R^I$[^1] and the final
instrument prices $X\colon\Omega\to\R^I$ depending on the outcome
$\omega\in\Omega$ that occurs.
The one period model also specifies a probability
measure $P$ on the space of outcomes, by hook or by crook.

[^1]: If $A$ and $B$ are sets then $B^A = \{f\colon A\to B\}$ is the set of all
functions from $A$ to $B$. We can write $f_a$ for $f(a)$.

A _portfolio_ $\xi\in\R^I$ is the number of shares initially purchased in each instrument.
It costs ${\xi^T x = \sum_{i\in I} \xi_i x_i}$ to acquire the portfolio at the beginning of the period
and returns $\xi^T X(\omega)$ when liquidated at the end of the period if $\omega\in\Omega$ occurs.

The _realized return_ of $\xi$ is $R_\xi = \xi^T X/\xi^T x$ when $\xi^T x \not= 0$.

Note $R_\xi = R_{t\xi}$ for any non-zero $t\in\R$ so
there is no loss in assuming $\xi^T x = 1$.
In this case $R_\xi = \xi^T X$ is the realized return of the portfolio.
It is common to use _returns_ instead of realized returns
where the return $r$ is defined by $R = 1 + r\Delta t$ or
$R = \exp(r\Delta t)$ where $\Delta t$ is the time in years or a day count fraction for the period.
Since we are considering a one period model there is no need to drag $\Delta t$ into consideration.

## Efficient Portfolio

A portfolio $\xi\in\RR^I$ is _efficient_ if $\Var(R_\xi) \le
\Var(R_\eta)$ for every portfolio $\eta$ having the same expected
realized return as $\xi$.

If $\xi^T x = 1$ then $\Var(R_\xi) = \xi^T V\xi$,
where ${V = \Var(X) = E[XX^T] - E[X]E[X^T]}$, and ${R_\xi = \xi^T E[X]}$.
For a given expected realized return $R\in\RR$ we minimize
$$
	\frac{1}{2}\xi^T V\xi - \lambda(\xi^T x - 1) - \mu(\xi^T E[X] - R)
$$
over $\xi\in\RR^I$, $\lambda\in\RR$, and $\mu\in\RR$.
The [Appendix](#appendix) shows we may assume $V$ is invertable and
$$
		\xi =  \lambda V^{-1}x + \mu V^{-1} E[X] \\
$$
where $\lambda = (C - R B)/D$, $\mu = (-B + R A)/D$, and
${A = x^T V^{-1}x}$, ${B = x^T V^{-1}E[X] = E[X^T]V^{-1}x}$, ${C = E[X^T]V^{-1}E[X]}$,
where ${D = AC - B^2}$.
Note that $A$, $B$, $C$, and $D$ depend only on $x$, $E[X]$, and
$E[XX^T]$. Classical literature focuses mainly on the latter three which
may explain why prior authors overlooked our elementary but stronger
result.

This shows every efficient porfolio is in the span of 
$V^{-1}x$ and $V^{-1} E[X]$.
If $\xi_0$ and $\xi_1$ are any two independent efficient portfolios then
${\xi = \beta_0\xi_0 + \beta_1\xi_1}$ for some scalars $\beta_0$ and $\beta_1$.
Assuming $\xi_j^T x = 1$ for $j = 0,1$ then $R_{\xi_j} = \xi_j^T X$.

Assuming $\xi^T x = 1$ then $1 = \beta_0 + \beta_1$ and
$\xi^T X = \beta_0\xi_0^T X + \beta_1\xi_1^T X$ so
$$
	R_\xi - R_{\xi_0} = \beta(R_{\xi_1} - R_{\xi_0})
$$
as functions on $\Omega$, where 
$$
	\beta = \Cov(R_\xi - R_{\xi_0}, R_{\xi_1} - R_{\xi_0})/\Var(R_{\xi_1} - R_{\xi_0}).
$$
The classical CAPM formula follows from taking expected values
of both sides when $\xi_1$ is the "market portfolio" and $\xi_0$ is a
_riskless portfolio_.

A portfolio $\zeta$ is _riskless_ if its realized return is constant. In this case
$\Var(R_\zeta) = 0$ so it is efficient.

## Appendix

We can assume $V = E[XX^T] - E[X] E[X^T]$ is invertible.
If $V\xi = 0$ then $\xi^T V\xi=0 = \|V^{1/2}\xi\| = 0$.

### Lagrange Multiplier Solution

Let's find the minimum value of $\Var(R_\xi)$ given $E[R_\xi] =
R$.  If $\xi^T x = 1$ then $R_\xi = \xi^T E[X]$ and $\Var(R_\xi)
= \xi^T V\xi$ where $V = E[XX^T] - E[X]E[X^T]$.

We use Lagrange multipliers and solve
$$
		\min \frac{1}{2}\xi^T V\xi - \lambda(\xi^T x - 1) - \mu(\xi^T E[X] - R)
$$
for $\xi$, $\lambda$, and $\mu$.
    
The first order conditions for an extremum are
$$
\begin{aligned}
		0 &= V\xi - \lambda x - \mu E[X] \\
		0 &= \xi^T x - 1 \\
		0 &= \xi^T E[X] - R \\
\end{aligned}
$$
Assuming $V$ is invertible $\xi = V^{-1}(\lambda x + \mu E[X])$.
Note every extremum lies in the (at most) two dimensional subspace
spanned by $V^{-1}x$ and $V^{-1}E[X]$.
    
The constraints $1 = x^T\xi$ and $R = E[X^T]\xi$ can be written
$$
\begin{bmatrix}
1 \\
R \\
\end{bmatrix}
=
\begin{bmatrix}
\lambda x^TV^{-1}x + \mu x^TV^{-1}E[X] \\
\lambda E[X^T]V^{-1}x + \mu E[X^T]V^{-1}E[X] \\
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
with $A = x^T V^{-1}x$, $B = x^T V^{-1}E[X] = E[X^T]V^{-1}x$, and $C = E[X^T] V^{-1}E[X]$.
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
R
\end{bmatrix}
=
\begin{bmatrix}
(C - R B)/D \\
(-B + R A)/D\\
\end{bmatrix}
$$
where $D = AC - B^2$. The solution is
$\lambda = (C - R B)/D$, $\mu = (-B + R A)/D$, and
$$
    \xi = \frac{C - R B}{D} V^{-1}x + \frac{-B + R A}{D} V^{-1}E[X].
$$

A straightforward calculation shows the variance is
$$
\Var(R_\xi) = \xi^T V\xi = (C - 2BR + AR^2)/D.
$$

### Fundamental Theorem of Asset Pricing

## Risk-neutral Measure

???

If $x$ belongs to the smallest closed cone containing the range of $X$ then
$x = \int_\Omega X dD$ for some positive finitely-additive measure $D$ on $\Omega$.
If we define $P = D/D(\Omega)$ then $P$ is a positive measure with mass 1.

The one-period Fundamental Theorem of Asset Pricing states there is no model
arbitrage if and only if there exists a positive measure $\Pi$ on
$\Omega$ with $x = \int_\Omega X(\omega)\,d\Pi(\omega)$.  We assume $X$
is bounded, as it is in the real world, and $\Pi$ is
finitely additive.

If such a measure exists and $\xi^T X\ge0$ then
$\xi^T x = \int_\Omega \xi^T X\,d\Pi \ge0$ so arbitrage
cannot occur. The other direction is less trivial.

**Lemma.** _If $x\in\R^n$ and $C$ is a closed cone in
$\R^n$ with $x\not\in C$ then there exists $\xi\in\R^n$
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
$\xi^T x < 0$ and $\xi^T X(\omega) \ge0$ for all $\omega\in\Omega$:
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
This follows from $E[\xi^T X] = \xi^T x/\|\Pi\| = R\xi^T x$ for any portfolio $\xi$.

Note $Q$ is not the probability of anything, it is simply a positive
measure with mass 1. The above statements are geometrical, not probabilistic.

<!--
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
