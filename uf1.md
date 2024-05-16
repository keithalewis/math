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

amount -- $A$: number of shares

instrument -- $I$: all market instruments

owner -- $O$: legal entities holding instruments

holding -- $h = (a, i, o) \in H = A\times I\times O$.

time -- $T$: trading times

exchange -- $\chi = (t,h,h')$: at time $t\in T$ buyer exchanges amount and instrument of
$h$ with seller amount and instrument of $h'$,
${(t;a,i,o;a',i',o') \mapsto (t+\Delta t;a',i',o;a,i,o')}$ where
$t + \Delta t$ is settlement time.

price -- Price of exchange $(a,i;a',i')\mapsto (a',i';a,i)$ is $X^i_{i'} = a/a'$.
If seller quotes price $X^i_{i'}$ then buyers can exchange $(a'X^i_{i'}, i)$ for sellers $(a',i')$.

portfolio -- Any set of holdings. 

value -- (mark-to-market) net amount given instrument and owner, ${V(i,o) = \sum_a\{a\mid h = (a, i, o)\}}$.
If $X^i_{i_0}$ is the price of $i$ in units of numeraire $i_0$ and $X^{i_0}_{i_0} = 1$,
then the mark-to-market of an owner is
${V(o) = \sum_{a,i} \{ aX^i_{i_0} \mid h = (a, i, o)\}}$ in units of the numeraire.


trading -- times $t_j$ and pair of holdings $h_j$, $h_j'$.

transaction -- collection of related exchanges. E.g., broker fees, taxes.
