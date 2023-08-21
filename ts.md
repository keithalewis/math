---
title: Trading Strategies
author: Keith A. Lewis
institution: KALX, LLC
email: kal@kalx.net
classoption: fleqn
abstract: Primative operations
...

\newcommand{\RR}{\boldsymbol{R}}
\renewcommand{\AA}{{\mathcal{A}}}

The [Unified Model](um0.html) describes prices and cash flows.

A _trading strategy_ is an increasing sequence of stopping times $τ_j$
and functions $Γ_j\colon\AA_{τ_j}\to\RR^I$ indicating how much of
each instrument to purchase at $τ_j$.

Consider the strategy of purchasing a stock when it goes below some level $L$
then selling the stock when it goes above some level $H > L$.
Let $(S < L) = \{(t,ω)\in [0,\infty)\times Ω| S_t(ω) < L\}$ and
$(S < H) = \{(t,ω)\in [0,\infty)\times Ω| S_t(ω)\}$ where $S_t$ is the stock price at
time $t$ and $ω$ is the outcome determining the stock trajectory.
The first trading time is $τ_0(ω) = \inf\{t|S_t(ω) < L\}$ when we
buy one share.
The second trading time is $τ_1(ω) = \inf\{t > τ_0(ω)|S_t(ω) > H\}$
when we sell one share.

If we have an increasing sequence of numbers $t_0 < t_1 < t_2 < \cdots$ let $I = \{t_j\}$.
We can recover the sequence by defining $*I = \min\{t\in I\}$ and
$+I = I>*I = \{t\in I\mid t > *I\}$. Clearly $t_0 = *I$, $t_1 = *(+I)$,
$t_2 = *(+(+I))$, etc.

This can be generalized from a sequence of numbers to 
subsets of a totally ordered set. If $I$ is a subset of a totally ordered
set define $*I = \inf\{t\in I\}$ and $+I = I > *I$. If $I$ has no
accumulation points this determines a sequence $t_j = *(+^jI)$, $j\ge0$.

Recall the _disjoint union_ of $I_0$ and $I_1$ is
$(\{0\}\times I_0)\cup(\{1\}\times I_1)$. It has elements of the
form $(j,i)$ where $j\in\{0,1\}$ and $i\in I_0$ if $j = 0$ and
$i\in I_1$ if $j = 1$. If $i\in I_0\cup I_1$ then we don't know
if $i$ belongs to $I_0$ or to $I_1$, or both.
The disjoint union preserves this information.

Let $I = (j, I_0\sqcup I_1)$, $j\in\{0,1\}$. Define $*I = (j, *I_j)$
and 
$$
	+(j, I_0\sqcup I_1) = (j + 1\mod 2, (I_0 > *I_j)\sqcup (I_1 > *I_j)).
$$

Getting back to our trading example, we can define ${(S < L), (S > H)
= (0, (S < L)\sqcup(S > H))}$.
The first trade is determined by $(*(S < L), (S > H))(ω) = (0, τ_0(ω))$.
The second trade is determined by $(*(+(S < L), (S > H)))(ω) = (1, τ_1(ω))$.
