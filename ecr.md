---
title: Composition of Relations
author: Keith A. Lewis
institute: KALX, LLC
classoption: fleqn
fleqn: true
abstract: Computation is the composition of relations
...

\newcommand{\st}{\mid}
\renewcommand{\dom}{\operatorname{dom}}
\renewcommand{\cod}{\operatorname{cod}}
\renewcommand{\ker}{\operatorname{ker}}
\renewcommand{\coker}{\operatorname{coker}}
\newcommand\cat[1]{\mathbf{#1}}

A _relation_ is a subset of the cartesion product of sets. 
The _domain_ of a relation $R\subseteq X\times Y$ is
$\dom R = \{x\in X\st (x,y)\in R\text{ for some }y\in Y\}$.
The _codomain_ is $\cod R = \{y\in Y\st (x,y)\in R\text{ for some }x\in X\}$. 
Write $xRy$ for $(x,y)\in R$. The _right coset_ of $x\in X$ is $xR = \{y\in Y\st xRy\}\subseteq Y$
and $XR = \cup_{x\in X}xR = \cod R$.  The _left coset_ of $y\in Y$ is
$Ry = \{x\in X\st xRy\}\subseteq X$ and $RY = \cup_{y\in Y}Ry = \dom R$.

If $R\subseteq X\times Y$ and $S\subseteq Y\times Z$ are relations
their _composition_ is $SR\subseteq X\times Z$ where
$x(SR)z$ if and only if $xRy$ and $ySz$
for some $y\in Y$. This is equivalent to $xR\cap Sz$ not being empty.
If $1_U$ is the _identity_ relation $\{(u,u)\st u\in U\}$,
then $R1_X = R$ and $1_YR = R$.

__Exercise__. _If $R\subseteq X\times Y$, $S\subseteq Y\times Z$, and $T\subseteq Z\times W$
then $(TS)R = T(SR)$_.

The set of all relations $\cat{Rel}$ is a category.

The _transpose_, or _conjugate_, of a relation $R\subseteq X\times Y$
is $R'\subseteq Y\times X$ where $yR'x$ if and only if $xRy$, $x\in X$, $y\in Y$.

__Exercise__. _If $R\subseteq X\times Y$ and $S\subseteq Y\times Z$ are relations then $(SR)' = R'S'$_.  

A monoid is a set $M$ with an associative binary operation $μ\colon
M\times M\to M$ and an identity element $1\in M$; $μ(a,μ(b,c)) =
μ(μ(a,b),c)$ and $μ(m,1) = m = μ(m,1)$, $m\in M$.  The set of
relations on $X\times X$ is a monoid.


A relation $R\subseteq X\times X$ is _transitive_ if $RR \subseteq R$.
A relation $R\subseteq X\times X$ is _reflexive_ if $1_X \subseteq R$.

A relation $R\subseteq X\times X$ is _symmetric_ if $R = R'$ and _antisymetric_ if $R\cap R' = 1_X$.

## Remarks

Product projections are indexing.

A set is the coproduct of its elements.

Total order is bijection $n \leftrightarrow S$.

$X^n$ is $n\to X$. $π_i\colon X^n\to X$. $X^{n\times m}$ is $n\times m\to X$ is $n\to(m\to X)$.
Multidimensional indexing is currying.

Currying does not have a good notation.

$F_A(X) = X \times A$, $G_B(Y) = Y^B = B\to Y$ are adjoint functors.

The adjunction is an isomorphism so left or right doesn't matter.

$f\colon X\times Y\to Z$, $f_1\colon X\to(Y\to Z)$.

$f\colon F_Y(X)\to Z$, $f_1\colon X\to G_Y(Z)$.

$g\colon X\to(Y\to Z)$, $g^1\colon X\times Y\to Z$.

$g\colon X\to G_Y(Z)$, $g^1\colon F_Y(X)\to Z$.
