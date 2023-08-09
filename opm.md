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

Let $I$ be the set of _instruments_ available over a time period
and $\Omega$ be the set of possible outcomes.
The _prices_ at the beginning of the period are a vector $x\in\RR^I$.
The prices at the end of the period are a function $X\colon\Omega\to
\RR^I$ where $X(\omega)\in\RR^I$ are the instrument prices if
$\omega\in\Omega$ occurred.

## Example

For example, the _binomial model_ has a bond and stock where $x = (1, s)$,
$X(\omega) = (R, \omega)$, and $\Omega = \{S^-, S^+\}$ where $R > 0$, and
${S^- < S^+}$.
The bond has realized return $R$ and the stock can go from price $s$
to either $S^-$ or $S^+$.  A slightly more realistic model is
${\Omega = [S^-, S^+]}$ where the final stock price can be any value in the interval.

## Arbitrage

A _position_ $\xi\in\RR^I$ is the number of shares held in each instrument.
The cost of acquiring the initial position is $\xi\cdot x$.
The value of liquidating the final position is $\xi\cdot X(\omega)$ if $\omega\in\Omega$ occurred.

_Arbitrage_ exists in a one-period model if there is a position $\xi\in\RR^I$
with $\xi\cdot x < 0$ and $\xi\cdot X(\omega)\ge0$ for all $\omega\in\Omega$:
you make money acquiring the initial position and never lose money when
unwinding it at the end.

__Exercise__. _If $sR\notin [S^-,S^+]$ in the binomial model there is an arbitrage_.

_Hint_: If $sR > S^+$ the bond is always more valuable than the stock
so short the the stock and buy bond with $\xi = (S^+, -R)$.
If $Rs < S^-$ the bond is always less valuable than the stock
so short the bond and buy the stock with with $\xi = (-S^-, R)$.

<details><summary>Solution</summary>
In the first case, $\xi\cdot x = S^+ - sR < 0$,
${\xi\cdot X(S^-) = S^+R - RS^- > 0}$,
and ${\xi\cdot X(S^+) = S^+R - RS^+ = 0}$,
so $\xi\cdot X\ge0$ on $\{S^-,S^+\}$.

In the second case, $\xi\cdot x = -S^- + sR < 0$,
${\xi\cdot X(S^-) = -S^-R + RS^- = 0}$,
and ${\xi\cdot X(S^+) = -S^-R + RS^+ > 0}$,
so $\xi\cdot X\ge0$ on $\{S^-,S^+\}$.
</details>

## Cone

Suppose $x = \sum_i X(\omega_i) \pi_i$ is a finite linear combination
with $\pi_i\in\RR$ positive, $\omega_i\in\Omega$. 
If ${\xi\cdot X(\omega)\ge0}$ for $\omega\in\Omega$ then ${\xi\cdot x\ge 0}$,
so no arbitrage exists.

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
If $\xi$ is an arbitrage then $t\xi$ is an arbtrage for $t > 0$.
If $\xi$ and $\eta$ are arbitrages then so is $\xi + \eta$.
</details>

__Exercise__. _If $x$ belongs to the smallest cone containing
the range of $X$ then there is no arbitrage_.

_Hint_: The range of $X$ is $\ran X = \{X(\omega)\mid\omega\in\Omega\}$.
The smallest cone containing the range of $X$ is the set of finite
linear combinations $\sum_i X(\omega_i) \pi_i$, $\pi_i > 0$, $\omega_i\in\Omega$.

<details><summary>Solution</summary>
If $x_n\in C$ converge to $x$ in norm and $\xi\cdot x_n\ge0$ then $\xi\cdot x\ge0$.
</details>

## Fundamental Theorem of Asset Pricing

__Theorem__.  _Arbitrage exists in
the one-period model if and only if $x$ does not belong to the smallest
closed cone containing the range of $X$_.

The previous exercise proves the "easy" direction.
The contrapositive follows from 

__Lemma__. _If $x\in\RR^n$ and $C$ is a closed cone in
$\RR^n$ with $x\not\in C$ then there exists ${\xi\in\RR^n}$
with ${\xi\cdot x < 0}$ and ${\xi\cdot y \ge0}$ for ${y\in C}$._

_Proof._ Let $x^*$ be the point in $C$ closest to $x$.
It exists since $C$ is closed and is unique since $C$ is convex.

Since $ty + x^*\in C$ for any $t > 0$ and $y\in C$ 
we have $\|x^* - x\| \le \|ty + x^* - x\|$.
Simplifying gives ${t^2||y||^2 + 2t\xi\cdot y\ge 0}$. 
Dividing by $t > 0$ and letting $t$ decrease to 0 shows ${\xi\cdot y\ge 0}$.

We also have $\|x^* - x\| \le \|tx^* + x^* - x\|$ for $t + 1 > 0$.
Simplifying gives ${t^2||x^*||^2 + 2t\xi\cdot x^*\ge 0}$ for  $t > -1$.
Dividing by $t < 0$ and letting $t$ increase to 0 shows ${\xi\cdot x^*\le 0}$ so
${0 < ||\xi||^2 = \xi\cdot (x^* - x) \le -\xi\cdot x}$ hence ${\xi\cdot x < 0}$.

The lemma proves the "hard" direction of the FTAP
and $\xi = x^* - x$ implements an arbitrage.

Note the lemma is a purely geometric fact.
It is similar to Farkas' lemma and is a special case of the Hahn-Banach theorem
in finite dimensional space.

## Application

For the binomial model the smallest closed cone containing the range of $X$
is $\{X(S^-)\pi^- + X(S^+)\pi^+\mid \pi^-,\pi^+\ge0\}$.
If $(1, s)$ is in the cone then ${(1,s) = (R, S^-)\pi^- + (R, S^+)\pi^+}$
for some $\pi^-,\pi^+\ge0$. Solving for $\pi^-$ and $\pi^+$ gives
the no arbitrage condition $S^- \le Rs \le R^+$.

__Exercise__. _Show $\pi^- = (S^+ - Rs)/R(S^+ - S^-)$ and $\pi^+ = (Rs - S^-)/R(S^+ - S^-)$_.

If $Rs > S^+$ then $(R, s)$ is above the line through the origin with
slope $R/S^+$ so $\xi$ should be proportional to $(S^+, -R)$.
If $Rs < S^-$ then $(R, s)$ is below the line through the origin with
slope $R/S^-$ so $\xi$ should be proportional to $(-S^-, R)$.

If we add an option with payoff $\nu$ to the binomial model then
$x = (1, s, c)$ and $X(\omega) = (R, \omega, \nu(\omega))$, $\omega\in\{S^-,S^+\}$.
There is no arbitrage if and only if $(1, s, c) = X(S^-)\pi^- + X(S^+)\pi^+$
for some $\pi^-,\pi^+\ge0$. The first two equations determine $\pi^-$ and $\pi^+$ as
above so $v = \nu(S^-)\pi^- + \nu(S^+)\pi^+$.
Every option payoff is linear in the binomial model.

A slightly more interesting model is a bond with zero interest rate, a stock that
can go from 100 to 90, 100, or 110, and an at-the-money call option with price $v$.
The model is $x = (1, 100, v)$, $X(\omega) = (1, \omega, \max\{\omega - 100, 0\})$,
$\omega\in\{90, 100, 110\}$.
The smallest closed cone containing the range of $X$
is $\{X(90) a + X(100) b + X(110) c\mid a,b,c\ge0\}$. If $x$ belongs to the cone then
$$
\begin{aligned}
	1 &= a + b + c \\
	100 &= 90a + 100b + 110 c \\
	v &= 10c \\
\end{aligned}
$$
for some $a,b,c\ge0$ so
$$
\begin{aligned}
	1 - c &= a + b \\
	100 - 110c &= 90a + 100b \\
\end{aligned}
$$

__Exercise__. _Show $a = c$ and $b = 1 - 2c$_.

_Hint_: Multiply the first equation by 90 and subtract the second. 

The FTAP proves the model is arbitrage-free if and only if the option value is between $0$ and $5$
since $b\ge0$ implies $0\le c\le 1/2$ and $v = 10c$.

__Exercise__. _Show the model without the bond is arbitrage-free if and only the option value
is between $0$ and $100/11 < 10$_.

_Hint_: Consider $\{(90, 0)a + (100, 0)b + (110, 10)c\mid a,b,c\ge0\}$.
The smallest closed convex cone is bounded below by $y = 0$ and above
by $y = (10/110)x$.

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

If $x\in\RR^I$ and $X\colon\Omega\to\RR^I$ is bounded then there is no arbitrage
if and only if $x = \int_\Omega X(\omega)\,d\Pi(\omega)$ for some positive, bounded, finitely additive
measure on $\Omega$, but this requires a bit more math to establish.

If there exists a _zero coupon bond_ $\zeta\in\RR^I$ with $\zeta\cdot
X(\omega) = 1$ for all ${\omega\in\Omega}$ then
${D = \zeta\cdot x = \int_\Omega \zeta\cdot X(\omega)\,d\Pi(\omega) = \Pi(\Omega)}$
is the cost of the bond, aka _discount_.  The measure ${P = \Pi/D}$ is
positive and has mass 1 so ${x = E[XD]}$ if we pretend it is a probability
measure.

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
