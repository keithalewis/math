---
title: Unified Finance
author: Keith A. Lewis
institute: KALX, LLC
classoption: fleqn
fleqn: true
abstract: Unified Finance &ndash; holding, exchange, portfolios, trading
...

\newcommand\RR{\bm{R}}
\newcommand\ZZ{\bm{Z}}

amount -- $A$ number of shares

instrument -- $I$ all market instruments

owner -- $O$

holdings -- $h = (a, i, o) \in H = A\times I\times O$.

exchange -- Buyer exchanges $h$ with seller $h'$,
$(h, h')\in H\times H$ by $\chi((a,i,o),(a',i',o')) = ((a',i',o),(a,i,o'))$.

price -- Price of $((a,i,o),(a',i',o'))\mapsto ((a',i',o),(a,i,o'))$ is $X^i_{i'} = a/a'$.

portfolio -- Any set of holdings. 

value -- (mark-to-market) net amount given instrument and owner, ${V(i,o) = \sum_a\{a\mid h = (a, i, o)\}}$.
If $X^i_{i_0}$ is the price of $i$ in units of numeraire $i_0$ and $X^{i_0}_{i_0} = 1$,
then the mark-to-market is
${V(o) = \sum_{a,i} \{ aX^i_{i_0} \mid h = (a, i, o)\}}$ in units of the numeraire.

time -- $T$ trading times

trading -- increasing stopping times $\tau_j$ and holdings $h_j$, $h_j'$.
