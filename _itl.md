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
\newcommand\union{\sqcup}
\newcommand\if{\operatorname{if}}
\newcommand\then{\operatorname{then}}
\newcommand\else{\operatorname{else}}

## Iterable

An _iterable_ is a generalization of a sequence. Let $i$ be a
subset of a totally ordered set $T$ that has a lower bound. Define
$?i$ by $i\neq\emptyset$, $*i = \inf\{t\mid t\in i\}$ when $?i$, and $+i =
i\setminus\{*i\}$. The set $i$ is iterable if $?i$ is false or $*i\in i$
and $+i$ is iterable. An iterable gives rise to a sequence $t_0 = *i$,
$t_1 = *+i$, ..., $t_n = *+^ni$. It terminates when $?+^ni$ is false.

__Exercise__. _Every countable set $i\subseteq T$ is iterable_.

__Exercise__. _If $i = \{t_j\}_{j\ge0}$ is increasing then $t_n = *+^ni$_.

__Exercise__. _If $i$ and $j$ are iterable then so are $i\cap j$ and $i\cup j$_.

## Operations

If $R$ is a relation on $T$ define $i RU$ by $i = i\cap RU$,
where $RU = \{t\in T\mid tRu, \rm{ some }u\in U\}$. If $t\in T$
define $iR t = i R \{t\}$.

If $i$ and $j$ are iterables on $T$ define
$i\sqcup j$ to be an iterable on $T\sqcup T$, the disjoint union of $T$ with itself,
by $?i\sqcup j$ if and only if $?i$ or $?j$, $*i\sqcup j$ = \min\{*i, *j\}$



Let $(T,\le)$ be a set with a preorder (reflexive, transitive:
$I\subseteq \le$, $\le^2\supseteq\le$).
For $U\subseteq T$ define $\wedge U = \{v\in U\mid v\le u, u\in U\}$.
If $\wedge U = \{u\}$ is a singleton define $*U = u$.

__Exercise__. _If $\le$ is a partial order then $\wedge U$ is a singleton_.

_Hint_: If $\le$ is a partial order then $u\le v$ and $v\le u$ imply $u = v$.

Let $+U = U\setminus\wedge U$. As usual, $u\ge v$ means $v\le u$,
$u<v$ means $u\le v$ and $u\neq v$, and $u > v$ is $v < u$.
For $V\subseteq T$ define $U>V = \{u\in U\mid u>v, v\in V\}$. If $t\in T$
define $U>t = U>\{t\}$.

__Exercise__. _Show $+U$ equals $U>\wedge U$_.

If $U_j\subseteq T$, $j\in J$,
let $\sqcup_{j\in J} U_j = \{(j,u_j)\mid j \in J, u_j\in U_j\}$ be the disjoint union.
The injection $ν_j\colon U_j\to\sqcup_j U_j$ is $ν_j(u) = (j, u)$.
Define left and right projections $λ\colon\sqcup_j U_j\to J$
by $λ(j,u) = j$, $ρ\colon\sqcup_j U_j\to T$ by $ρ(j,u) = u$.
If $J$ has a partial order (antisymmetric, preorder: $\le \cap \ge = I$)
define $(j,u)\sqsubseteq (k,v)$ by $j<k$ or $j=k$ and $u\le v$.

__Exercise__. _Show $\wedge\sqcup_j U_j = \{(k,u_k)\mid u_k\in U_k\cap\wedge\cup_j U_j\}$_.

For $k\in J$ let $(k, U) = (k,\sqcup_j U_j) = \{(k, u)\mid u\in U_k\} = \{u\in\sqcup_j U_j\mid λu = k\}$,
or $λU = k$.

Define $k\wedge U = \wedge(k, U)$ and $k*U = (k,u)$ if $k\wedge U = \{(k,u)\}$.

When $J = n = \{0,\ldots,n-1\}$ and
$U = \sqcup_{j<n} U_j$ define $(k + m, u_m) = (k + m, (k+m)*(+^mU))$, $k\in n$, $m\ge 0$,
where addition is modulo $n$. Define $k + U = \sqcup_j (U_j > k*U)$.
