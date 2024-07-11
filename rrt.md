---
title: Ross Recovery Theorem
author: Keith A. Lewis
classoption: fleqn
fleqn: true
---

\newcommand\RR{\bm{R}}
\newcommand\NN{\bm{N}}
\renewcommand\AA{\mathcal{A}}

The _one-period model_ specifies prices $x\in\RR^I$ for instruments $I$
at the beginning of the period
and prices $X\in B(\Omega,\RR^I)$ at the end of the period depending
on what outcome $\omega\in\Omega$ occured,
where $B(\Omega,\RR^I)$ is the set of all bounded $\RR^I$
valued functions on $\Omega$. Let $P\in ba(\Omega)$ ($F$ in Ross's notation) be
the "real-world" probabilty measure on outcomes in $\Omega$, where
$ba(\Omega)$ is the set of bounded finitely-additive measures on $\Omega$.

The FTAP states there is no arbitrage if and only if there exists a
positive measure ${D\in ba(\Omega)}$ with
${x = \int_\Omega X\,dD}$. In general $D$ is not unique.
Define a "probability measure" $Q = D/D(\Omega)$ that is not
the probability of anything. Under this _risk neutral_ probabilty measure
we have $x = E^*[X]D(\Omega)$. 

If there exists $\zeta\in\RR^I$ with
${\zeta^*X(\omega) = 1}$ for
$\omega\in\Omega$ then ${\zeta^*x = \int_\Omega dD = D(\Omega)}$.
The _discount_ $D = D(\Omega)$ is the price of the _zero coupon bond_ $\zeta$.

Given the "real-world" measure $P$ and a risk-neutral measure $Q$ the _pricing kernel_ is $\phi = dQ/dP$ is

Put Ross's notation on a rigorous foundation. 

I. Basic Framework

$$
\tag{1}p_g = \int g(\theta)\,dP(\theta)
\quad\leftrightarrow\quad x = \int_\Omega X(\omega)\,dQ(\omega)
$$
where $g$ corresponds to $X$ and $Q$ is Ross's $P$.

$$
\tag{2}	p_g = e^{-r(\theta^0)T}E^*[g(\theta)] = E[g(\theta)\phi(\theta)]
\quad\leftrightarrow\quad x = DE^*[X] = E[X\phi]
$$
where $\phi = D dQ^*/dP = dQ/dP$.

Ross goes from a one-period model to a multi-period model to claim
$$
\tag{3}	Q(\theta_i, \theta_j, T) = \int_\theta Q(\theta_i, \theta, t) Q(d\theta, \theta_j, T - t)
$$
"where $Q(\theta_i, \theta_j, T)$ is the forward martingale probability
transition function for going from state $\theta_i$ to state $\theta_j$.
in $T$ periods and where the integration is over the intermediate state
$\theta$ at time $t$. Notice that the transition function depends on the
time interval and is independent of calendar time."

The _multi-period model_ specifies prices $X_{t_j}\in B(\AA_j,\RR^I)$, $j\in\NN$,
where $\AA_j$ is the information available at time $t_j$, and
a probability measure $P$ on the set of outcomes $\Omega$.
The information available at time $t_j$ is a _partition_ $\AA_j$ of $\Omega$.

The FTAP for multi-period models states there is no arbitrage if and only if
there exist positive measures $D_j\in ba(\AA_j)$ making $X_j D_j$ a _martingale measure_ 
$$
	X_j D_j = (X_k D_k)|\AA_j, j \le k
$$

__Exercise__. _Show $Y = E[X\mid\AA]$ if and only if $Y(P\mid\AA) = (XP)\mid\AA$_.

_Hint_: $Y = E[X\mid\AA]$ if and only if $Y$ is $\AA$-measurable
and $\int_A Y\,dP = \int_A X\,dP$ for all $A\in\AA$.

A process $(X_j)$ is a _martingale_ if $X_j = E[X_k\mid\AA_j]$, $j\le k$.
A process is _Markov_ is $Y_j = E[Y_k\mid \AA(X_j)]$, $j\le k$ where
$\AA(X)$ is the smallest algebra for which $X$ is measurable.


### Binomial Model

The _binomial model_ has sample space $\Omega = [0, 1)$. The probability
measure is Lesbegue measure.  The information available at time $t_j =
j$ is the partition $\AA_j = \{A_{ij}\mid 0\le i < 2^j\}$ where $A_{ij} =
[i/2^j, (i + 1)/2^j)$. Each atom of the partition determines the first $j$
digits of the base 2 expansion of $\omega\in\Omega$.  Define $V_j(\omega)
= \omega_1 + \cdots + \omega_j$ where $\omega = \sum_{i>0} \omega_i 2^-i$
and $\omega_i\in\{0,1\}$ is the base 2 expansion of $\omega$.

__Exercise__. _Show $V_jP = (V_{j+1}P)|A_j$ + 1/2_.

_Hint_: $V_{j+1} = V_j + \omega_{j+1}$ and $\omega_{j+1}P(A_{j,j+1}) = 1/2$.
## Markov Process

Let $S$ be a finite set of _states_ and non-negative _transition probabilties_ $\pi_{st}$ for $s,t\in S$
with $\sum_{t\in S} \pi_{st} = 1$, $s\in S$.

and $\Omega = S^\NN$.
Define $X_j\colon\Omega\to\RR$ by $X_0 = x_0$ and 
