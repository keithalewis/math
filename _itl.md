---
title: Iterables
author: Keith A. Lewis
institute: KALX, LLC
classoption: fleqn
fleqn: true
abstract: Possibly finite streams
...

\newcommand\dom{\operatorname{dom}}
\newcommand\cod{\operatorname{cod}}
\newcommand\ker{\operatorname{ker}}
\newcommand\ran{\operatorname{ran}}
\newcommand\cat[1]{\mathbf{#1}}
\newcommand\mb[1]{\mathbf{#1}}
\newcommand\Bool{\bm{B}}
\newcommand\NN{\bm{N}}
\newcommand\more{?}
\newcommand\curr{*}
\newcommand\next{+}
\newcommand\u[1]{\underline{#1}}

Let $\NN$ be the natural numbers with its standard ordering and
define $\check{\NN} = \NN\cup\{\omega\}$ to be the natural numbers augmented by infinty.
An _initial segement_ is a interval $[0,n) = \{m\in\NN: 0\le m\lt n\}$.
The segment $[0,0)$ is empty and $\NN = [0,\omega)$.

An _iterable_ on $T$ is a function $i\colon[0,n)\to T$. We write $n$ for $[0,n)$
when convenient so, for example, $i = (t_0,\ldots,t_{n - 1})\in T^n$.
The set of all iterables on $T$ is $I = I\langle T\rangle = T^* = \cup_{n\ge0}T^n$.
Define _more_ by $?i$ if and only if $i$ is not empty,
_curr_ by $*i = t_0$, and _next_ by $+i = (t_1,\ldots)$.
Note $\more$ is a function from iterables to booleans, $\curr\colon I\langle T\rangle\to T$
and $\next\colon I\langle T\rangle\to I\langle T\rangle$. We
use the convention $*i = \bot$ and $+i = i$ if $i$ is empty, where $\bot$ denotes
some unique element not in $T$. In particlar $\more i$ if and only if $\star i\not=\bot$.

An _iterable transformation_ is a function $f\colon I\langle T\rangle\to I\langle U\rangle$
such that $f(+i) = +(fi)$, $i\in I\langle T\rangle$.

__Exercise__. _Show $?(fi) = ?i$ and $*f(+i) = *(+(fi)$.

As a special case, if $f\colon T\to U$ we write $fi$ for the compostion of $i$ with $f$.

__Exercise__. _Show this is an interable transformation_.

It is useful to consider iterables of iterables.
Define $\iota\colon I\langle T\rangle\to I\langle I\langle T\rangle\rangle$ by ...
