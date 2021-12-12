---
title: Iterables
author: Keith A. Lewis
institute: KALX, LLC
classoption: fleqn
fleqn: true
abstract: Possibly infinite streams
...

\newcommand\dom{\operatorname{dom}}
\newcommand\cod{\operatorname{cod}}
\newcommand\ker{\operatorname{ker}}
\newcommand\ran{\operatorname{ran}}
\newcommand\cat[1]{\mathbf{#1}}
\newcommand\mb[1]{\mathbf{#1}}
\newcommand\Bool{\bm{B}}
\newcommand\NN{\bm{N}}
\newcommand\RR{\bm{R}}
\newcommand\more{?}
\newcommand\curr{*}
\newcommand\next{+}
\newcommand\length{\operatorname{length}}
\newcommand\u[1]{\underline{#1}}
\newcommand\union{\amalg}
\newcommand\if{\operatorname{if}}
\newcommand\then{\operatorname{then}}
\newcommand\else{\operatorname{else}}

Let $T = \{t_j\}_{j\in\NN}$ where $t_j < t_k$ if $j < k$
be a totally ordered discrete set.
For $U\subseteq T$ define $\more U$ by $U \neq \emptyset$.
If $\more U$ define $\curr U = \min U = \min\{u\mid u\in U\}\in T$.
Define $\next U = U\setminus\{\curr U\}$
and $\next^n U = U$, if $n = 0$, $\next^n U = \next^{n-1}(\next U)$ if $n > 0$.

__Exercise__. _Show $U = \{*U\}\cup(\next U)$ and $\{*U\}\cap(\next U) = \emptyset$_.

## Iterable

The collection of iterables on $T$, $\NN(T)$, has operations
$\more\colon \NN(I)\to\Bool$,
$\curr\colon \NN(I)\to T$, and
$\next\colon \NN(I)\to \NN(I)$
satisfying $\curr i < \curr\next i$ for $i\in\NN(T)$ whenever $\more i$.

We write $U \square V$, $U,V\subseteq T$, to indicate $\more U$, $\more V$,
and $(\curr U) \square (\curr V)$ for any binary relation $\square$ on $T$.

We write $U \square t = \{u\in U\mid u \square t\}$, $U\subseteq T$, $t\in T$.

__Exercise__. _Show $\next U$ is equal to $U\neq(\curr U)$_.

Recall the _disjoint union_ of sets $U_i$, $0\le i < n$, 
is $\union_i U_i = \cup_i \{i\}\times U_i$.
The element $(j,u)$ belongs to $\union_i U_i$ if and only if
$u\in U_j$. Define $λ(j,u) = j$ and $ρ(j, u) = u$.

Define $\curr(\union_i U_i) = (j,u)$ where $u = \min_i \curr U_i$
and $j$ is the first index with $u = \curr U_j$.
Define $\next(\union_i U_i) = (\union_i U_i)\setminus\{\curr (\union_i U_i)\}$
as above.

__Exercise__. _Show $\{\curr\next^n(\union_i U_i)\mid n\ge 0\} = \cup_j U_j$_.

## Zig

For $U_i\subseteq T$ with $\{\curr U_j\} \le U_i$ for all $i$,
define $(j, \uparrow_i U_i)$ as follows:
$\curr (j, \uparrow_i U_i) = (j, \curr U_j) = (j,u)$.
Let $\next(j, \uparrow_i U_i) = (k, \uparrow_i (U_i > u))$,
where $k = j$ if $\curr\next U_j \le \curr(U_{j+i} > u)$
and $k = j + 1$ otherwise.

## Functions

If $f\colon T\to\RR$ define $f|_U$ to be $f$ restricted to $U$.

$\curr f|_U = (\curr U, f(\curr U))$. $\next (f|_U) = f|_{\next U\}$.

If $U = \{u_j\}$ we get \{(u_j, f(u_j)\}$.

define $f^{\rightarrow}(t) = f(u_j)$, $u_j \le t < u_{j+1}$.



$T$ is trading times. $O$ is open times. $C$ is closing times. $B$ is beginning of week.
$E$ is end of week. $X\colon T\to\RR$ are prices.

Stop loss start gain. Buy one share at beginning of week. If close is greater than
open or end of week then sell.

$x > y\colon\dom x\cap\dom y\to\Bool$.

$B \uparrow -(((X|_B)^\rightarrow < X|_C)\union E)\uparrow$
