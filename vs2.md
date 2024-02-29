---
title: Vector Space
author: Keith A. Lewis
institution: KALX, LLC
email: kal@kalx.net
classoption: fleqn
abstract: Abelian group with scalar multiplication satisfying the distributed law.
...

\newcommand\mb[1]{\boldsymbol{#1}}
\newcommand\bm[1]{\boldsymbol{#1}}
\newcommand\RR{\bm{R}}
\newcommand\FF{\bm{F}}
\newcommand\NN{\bm{N}}
\newcommand\LL{\mathcal{L}}
\newcommand\BB{\mathcal{B}}
\newcommand\ran{\operatorname{ran}}
\renewcommand\ker{\operatorname{ker}}
\newcommand\span{\operatorname{span}}

A _vector_ is a function from an index set $I$ to the real numbers, $x\colon I\to\RR$.
Functions can be multiplied by a scalar, $(ax)(i) = (xa)(i) = a(x(i))$, and
added, $(x + y)(i) = x(i) + y(i)$, $a\in\RR$, $i,j\in I$.

If $A$ and $B$ are sets then the _set exponential_ $B^A = \{f\colon A\to B\}$ is
the set of all functions from $A$ to $B$.

__Exercise__. _If $A$ and $B$ are finite show $#(B^A) = #B^{#A}$_.

_Hint_: $#A$ is the number of elements in set $A$.

Define the _standard basis_ $e_i\in\RR^I$ by $e_i(j) = 1$ if $i = j$ and $e_i(j) = 0$ if $i\not=j$.
