---
title: One-Period Model
author: Keith A. Lewis
institution: KALX, LLC
email: kal@kalx.net
classoption: fleqn
abstract: Buy now, sell later.
...

\newcommand\RR{\bm{R}}
\renewcommand\Var{\operatorname{Var}}
\renewcommand\Cov{\operatorname{Cov}}
\renewcommand\ker{\operatorname{ker}}
\renewcommand\ran{\operatorname{ran}}

Let $I$ be the set of _instruments_ available at the beginning and end
of a time period and $\Omega$ be the set of what can happen over the period.
The _prices_ at the beginning of the period are a vector $x\in\RR^I$.
The prices at the end of the period are a function $X\colon\Omega\to
\RR^I$ where $X(\omega)\in\RR^I$ are the instrument prices if
$\omega\in\Omega$ occurred.

For example, consider a bond and a stock where $x = (1, s)$ and $X(\omega) = (R, \omega)$.
The binomial model is $\Omega = \{S^-, S^+\}$. The bond has realized return $R$
and the stock can go to price $S^-$ or $S^+$. A more realistic model
is $\Omega = [S^-, S^+]$ where the final stock price can be any value in the interval.

A _position_ $\xi\in\RR^I$ is the number of shares held in each intrument.
The cost of acquiring the initial position is $\xi\cdot x$.
The value of liquidating the final position is $\xi\cdot X(\omega)$ if $\omega\in\Omega$ occured.

Arbitrage exists in a one-period model if there is a position $\xi\in\RR^I$
with $\xi\cdot x < 0$ and $\xi\cdot X(\omega)\ge0$ for all $\omega\in\Omega$:
you make money acquiring the initial position and never lose money when
unwinding it at the end.

__Exercise__. _If $Rs\notin [S^-,S^+]$ in the binomial model there is an arbitrage_.

_Hint_: If $Rs > S^+$ take $\xi = (H, -R)$ and if $Rs < S^-$ take $\xi = (-L, R)$.

Suppose $x = \sum_i X(\omega_i) \pi_i$ is a finite linear combination
with $\pi_i\in\RR$ positive, $\omega_i\in\Omega$. 
If $\xi\cdot X(\omega)\ge0$ for $\omega\in\Omega$ then $\xi\cdot x\ge 0$
so no arbitrage exists.

A _cone_ $C$ is a subset of a vector space closed under positive scalar
multiplication and vector addition.

__Exercise__. _A cone is convex_.

_Hint_: Show $x,y\in C$ implies $tx + (1-t)y\in C$ for $0 < t < 1$.

__Exercise__. _The set of arbitrage positions is a cone_.

__Exercise__. _If $x$ belongs to the smallest cone containing
the range of $X$ then there is no arbitrage_.

_Hint_: The range of $X$ is $\ran X = \{X(\omega)\mid\omega\in\Omega\}$.
The smallest cone containg the range of $X$ is the set of finite
linear combinations $\sum_i X(\omega_i) \pi_i$, $\omega_i\in\Omega$, $\pi_i > 0$.


__Theorem__. (Fundamental Theorem of Asset Pricing) _Arbitrage exists in
the one-period model if and only if $x$ does not belong to the smallest
closed cone containing the range of $X$_.

If $x_n\in C$ converge to $x$ in norm and $\xi\cdot x_n\ge0$ then $\xi\cdot x\ge0$.
This proves the "easy" direction.

The contrapositive follows from the 

__Lemma__. _If $x\in\RR^n$ and $C$ is a closed cone in
$\RR^n$ with $x\not\in C$ then there exists ${\xi\in\RR^n}$
with ${\xi\cdot x < 0}$ and ${\xi\cdot y \ge0}$ for ${y\in C}$._

_Proof._ Let $x^*$ be the point in $C$ closest to $x$.
It exists since $C$ is closed and is unique since $C$ is convex.
We show $\xi = x^* - x$ implements an arbitrage.

Since $ty + x^*\in C$ for any $y\in C$ and $t > 0$
we have $\|x^* - x\| \le \|ty + x^* - x\|$.
Simplifying gives ${t^2||y||^2 + 2t\xi\cdot y\ge 0}$. 
Dividing by $t > 0$ and letting $t$ decrease to 0 shows ${\xi\cdot y\ge 0}$, $y\in C$. 

We also have $\|x^* - x\| \le \|tx^* + x^* - x\|$ for $t + 1 > 0$.
Simplifying give ${t^2||x^*||^2 + 2t\xi\cdot x^*\ge 0}$ for  $t > -1$.
Dividing by $t < 0$ and letting $t$ increase to 0 shows ${\xi\cdot x^*\le 0}$ so
${0 < ||\xi||^2 = \xi\cdot (x^* - x) \le -\xi\cdot x}$ hence ${\xi\cdot x < 0}$.

The lemma proves the "hard" direction of the FTAP. \hfill $\blacksquare$

Note the lemma is a purely geometric fact.
It is similar Farkas' lemma and is a special case of the Hahn-Banach theorem
in finite dimensional space.

For the binomial model the smallest closed cone containg the range of $X$
is $\{X(S^-)\pi^- + X(S^+)\pi^+\mid \pi^-,\pi^+\ge0\}$.
If $(1, s)$ is in the cone then ${(1,s) = (R, S^-)\pi^- + (R, S^+)\pi^+}$
for some $\pi^-,\pi^+\ge0$. Solving for $\pi^-$ and $\pi^+$ gives
the no arbitrage condition $S^- \le Rs \le R^+$.

__Exercise__. _Show $\pi^- = (S^+ - Rs)/R(S^+ - S^-)$ and $\pi^+ = (Rs - S^-)/R(S^+ - S^-)$_.

If $Rs > S^+$ then $(R, s)$ is above the line through the origin with
slope $R/S^+$ so $\xi$ should be proportional to $(-S^+,R)$.
If $Rs < S^-$ then $(R, s)$ is below the line through the origin with
slope $R/S^-$ so $\xi$ should be proportional to $(S^-, -R)$.

If we add an option with payoff $\nu$ to the binomial model then
$x = (1, s, c)$ and $X(\omega) = (R, \omega, \nu(\omega))$, $\omega\in\{S^-,S^+\}$.
There is no arbitrage if and only if (1, s, c) = X(S^-)\pi^- + X(S^+)\pi^+$
for some $\pi^-,\pi^+\ge0$. The first two equations determine $\pi^-$ and $\pi^+$ as
above so $c = \nu(S^-)\pi^- + \nu(S^+)\pi^+$.
Every option payoff is linear in the binomial model.

A slightly more interesting model is $x = (1, 100, c)$, $X(\omega) = (1, \omega, \max\{\omega - 100, 0\})$,
$\omega\in\{90, 100, 110\}$.
The smallest closed cone containg the range of $X$
is $\{X(90)\pi_{90} + X(100)\pi_{100} + X(110)\pi_{110}\mid \pi^-,\pi^+\ge0\}$.
