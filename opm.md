---
title: One Period Model
author: Keith A. Lewis
institution: KALX, LLC
email: kal@kalx.net
classoption: fleqn
abstract: Buy now, sell later
...

\newcommand\RR{\bm{R}}

Let $I$ be the set of _instruments_ available for trading.
The _prices_ at the beginning of the period are $x\in\RR^I$ where $x_i\in\RR$ is the initial
price of instrument $i\in I$.
Let $\Omega$ be what can happen over the period.
The prices at the end of the period are $X\colon\Omega\to \RR^I$ where $X(\omega)\in\RR^I$
are the instrument prices if $\omega\in\Omega$ occurred.

## Derivative

A _derivative instrument_ is a function $A\colon\Omega\to\RR$ that pays some _amount_
at the end of the period depending on what happened.
If there is a $γ\in\RR^I$ with
$γ\cdot X = A$ then there is a perfect hedge. The _cost_ of
setting up the hedge at the beginning of the period is $γ\cdot x$.

If more things can happen than the number of instruments then it is not
the case perfect hedges always exist.  The usual case is that they do
not and risk management involves the study of how well a derivative can
be hedged.

## Arbitrage

The cost of acquiring $γ$ shares of each instrument at the beginning
of the period is $γ\cdot x$. If that is negative then you make money.
At the end of the period you close the position by selling all of your
shares.  This results in a cash flow of $γ\cdot X$ to your account.
If that is non-negative then you don't lose money.  A one period model
has _arbitrage_ if there exists $γ\in \RR^I$ with $γ\cdot x <
0$ and $γ\cdot X(\omega)\ge0$, $\omega\in\Omega$.

## FTAP

The one-period Fundamental Theorem of Asset Pricing states that there is no
arbitrage if and only if there exists a non-negative measure $\Pi$ on $\Omega$
such that $\int_\Omega X\,d\Pi = x$. If such a measure exists and
$γ\cdot X\ge 0$ then $γ\cdot x \ge 0$ so there is no arbitrage.

We assume $X$ is bounded and $\Pi$ is finitely additive.

**Lemma.** _If $x\in\bm{R}^n$ and $C$ is a closed cone in
$\bm{R}^n$ with $x\not\in C$ then there exists $\xi\in\bm{R}^n$
with $\xi\cdot x < 0$ and $\xi\cdot y \ge0$ for $y\in C$._

Recall that a _cone_ is a subset of a vector space closed under addition
and multiplication by a positive scalar, that is, $C + C\subseteq C$
and $tC\subseteq C$ for $t > 0$.
For example, the set of arbitrage positions is a cone.

_Proof._ Since $C$ is closed and convex there exists $x^*\in C$ with
$0 < ||x^* - x|| \le ||y - x||$ for all $y\in C$.  Let $\xi = x^* - x$.
For any $y\in C$ and $t > 0$ we have $ty + x^*\in C$ so $||\xi|| \le ||ty + \xi||$. 
Simplifying gives $t^2||y||^2 + 2t\xi\cdot y\ge 0$. 
Dividing by $t > 0$ and letting $t$ decrease to 0 shows $\xi\cdot y\ge 0$. 
Take $y = x^*$ then $tx^* + x^*\in C$ for $t \ge -1$. By similar reasoning,
letting $t$ increase to 0 shows $\xi\cdot x^*\le 0$ so $\xi\cdot x^* = 0$. 
Since $0 < ||\xi||^2 = \xi\cdot (x^* - x) = -\xi\cdot x$ we have $\xi\cdot x < 0$.
$\blacksquare$

The set of non-negative finitely additive measures is a closed
cone and $X\mapsto \int_\Omega X\,d\Pi$ is positive, linear, and continuous
so $C = \{\int_\Omega X\,d\Pi : \Pi\ge 0\}$ is also a closed cone.
The contrapositive of the FTAP follows from the lemma.

The proof also shows how to find an arbitrage when one exists.
Note that the lemma is a purely geometric fact that does not involve measures.
It is usually called Farkas' lemma and is a special case of the Hahn-Banach theorem
in finite dimensional space.

## Hedging

Given a derivative payoff $A$ at the end of the period we wish to
minimize, in some sense, $γ\cdot X - A$ over available hedges $γ\in\RR^I$.

__Lemma__. _Using the notation above $(γ\cdot X - A)^2 = \|(XX')^{1/2}(γ - XA/X'X)\|^2$ on $Ω$_.

Letting $Σ = (XX')^{1/2}$ we have 
$$
\|Σγ - Σ^{-1}XA\|^2 = γ'XX'γ - 2γ'XA + X'(XX')^{-1}X A^2
$$
so 
$$
\begin{aligned}
(γ\cdot X - A)^2 &= γ'XX'γ - 2γ'XA + A^2 \\
	&= \|Σγ - Σ^{-1}XA\|^2 - X'(XX')^{-1}X A^2 + A^2.\\
\end{aligned}
$$
Since $(XX')X = X(X'X)$ the matrix $XX'$ has eigenvector $X$ with eigenvalue $\sigma^2 = X'X$.
This implies $Σ^{-1}X = X/\sigma$ and $X'(XX')^{-1}X = 1$ hence
$$
(γ\cdot X - A)^2 = \|Σ γ - XA/\sigma\|^2 = \|Σ(γ - XA/σ^2)\|^2.
$$

Recall $E[(γ\cdot X - A)^2]$ is minimized when $γ - E[XX']^{-1}E[XA] = 0$
which is analogous to $γ - XA/X'X$ being "minimized" over $Ω$.

<!--

Fix a probability measure and let $\Sigma = E[XX']^{1/2}$ so
$$
\begin{aligned}
E[(γ\cdot X - A)^2] &= γ'E[XX']γ - 2E[X'A]γ + E[A^2]\\
	&= \|\Sigmaγ - \Sigma^{-1}E[XA]\|^2 - \|\Sigma^{-1}E[XA]\|^2 + E[A^2].\\
\end{aligned}
$$
This has minimum value $E[A^2] - E[X'A]E[XX']^{-1}E[XA]$ when $γ = E[XX']^{-1}E[XA]$.
The least squares minimum does not depend on initial prices $x$, but we are only
interested in arbitrage free models. In this case we have $x = \int X\,dΠ = E[X]\|Π\|$
where we use the probability measure $P = Π/\|Π\|$.

$$
	γ = E[XX']
$$
### Two Instruments

Let $x = (r, s)$, $r,s\in\RR$ and $X = (R, S)$, $R,S\colon\Omega\to\RR$.
We may assume $r = s = 1$. The matrix $XX'$ has eigenvectors
$(R/S, 1)$ and $(-S/R, 1)$ with eigenvalues $R^2 + S^2$ and $0$, respectively.
-->
