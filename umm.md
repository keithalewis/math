---
title: A Unified Market Model
author: Keith A. Lewis
institution: KALX, LLC
email: kal@kalx.net
classoption: fleqn
abstract: Value, hedge, and manage risk of any portfolio
...

\newcommand\RR{\mathbf{R}}
\renewcommand\AA{\mathcal{A}}
\newcommand\bm[1]{\boldsymbol{#1}}

$USD/JPY = 123$ means $a$ USD can be exchanged for $123a$ JPY.

Price of Ford is 8 means $a$ shares of can be exchanged for $8a$ dollars.

$F/\$ = 8$.

time

amount

instrument

entity

Time $T$.

Amount $A = \RR$

Instruments $I$ market instruments.

Entities $E$ legal entities.

A _holding_ is an element $h = (t, a, i, e)\in T\times A\times I\times E$.
At time $t$ entity $e$ owns $a$ units of instrument $i$.

A _market_ is a (multi-)set of holdings.

_Issuers_ can add holdings to a market.

A _transaction_ is a function $\xi$

$M\mapsto M + \xi$.

Portfolios can be _netted_ by measures on finite subsets of holdings.

Define a $\RR^{I\times E}$ measure on $A\times I\times E$
by $A(\Pi)(i, e) = \sum\{ \pi.a\mid \pi\in\Pi, \pi.i = i, \pi.e = e\}$.

A _market_ is a subset of $\RR\times I\times E$.

Define $A(\Pi) = \{(A(\Pi)(i,e),i,e)\mid i\in I, e\in E\}$

An _exchange_ is $\xi = (\pi, \pi')$, where $e$ is the buyer and $e'$ is the seller.

Define $\xi\colon I\times E\to \RR$ by
$\xi(j,f) = -a$  if $j = i$ and $f = e$,
$\xi(j,f) = a'$  if $j = i'$ and $f = e$,
$\xi(j,f) = a$   if $j = i$ and $f = e'$,
$\xi(j,f) = -a'$ if $j = i'$ and $f = e'$,
and $\Xi(j,f) = 0$ otherwise.

Exchanges act on markets by $\xi\Pi = \Pi + \xi = \{\pi + \xi\mid \pi\in\Pi\}$.

Prices are a function $X\colon I\times I\to\RR$.
Amount $a$ of instrument $i$ can be exchanged for $X(i,i')a$ of instrument $i'$.

A market model is a function from time to prices.
$X_t\colon\AA_t\to R^{I\time I}$.

A trading strategy is a finite set of increasing stopping times $\tau_j$
and trades $\Gamma_j\in \RR^{I\times E}$.

Trades accumulate to a _position_ $\Delta_t = \sum_{\tau_j \le t} \Gamma_j$.



