
---
title: Survival of the Fittest
author: Keith A. Lewis
---
\newcommand\RR{\boldsymbol{R}}
\newcommand\ZZ{\boldsymbol{Z}}
\newcommand\PP{\mathcal{P}}

Assume a finite number of stategies $S = \{s_1,\ldots,s_k\}$ and a fitness function\
$\phi\colon S\times S\to\RR$. Assume $n$ players at elements if $\ZZ_n$
and an initial distribution of strategies $\Delta_0\ZZ_n\to S$.

At each round player $i$ gets a payoff of $\phi_i = \phi(s_{i-1},s_i) + \phi(s_i, s_{i+1})$
from its nearest neighbors
where $s_i = \Delta_0(i)$ is the strategy of player $i$. I.e., everyone plays their
nearest neighbor. The distribution at time 1 is determined by competition. In the 
_deterministic_ case $\Delta_1(i)$ the strategy having the greatest fitness in
the $[i-1,i,i+1]$ arena. In the _Malthusian_ case the strategy is choosen at
random from $\{s_{i-1},s_i,s_{i+1}\}$ weighted by the corresponding fitness.
The distribution $\Delta_t$ takes positions to a probability density on $S$.

$\delta_a\star\delta_b = \delta_{a + b}$.

$\delta_a\star\delta_b(E) = \int_x\int_y 1_E(x+y)\,\delta_a(x)\star\delta_b(y) = 1_E(a+b)$.

Distribution is $\Delta\ZZ_n\to\P(S)$ where $\Delta(i)$ is a probability measure on $S$.

The distribution (assuming independence) of $\phi(s_{i-1},s_i) + \phi(s_i, s_{i+1})$
is the convolution of measures.

$\Delta_t \in B(S)^n$ where $\PP(S)$ is all probability measures on $S$.

Play $P\colon\PP(S)^n\to\PP(S)^n$ by $P\Delta_(i) = \phi(s_{i-1},s_i) + \phi(s_i, s_{i+1})$
