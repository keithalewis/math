---
title: Composition of Relations
author: Keith A. Lewis
institute: KALX, LLC
classoption: fleqn
fleqn: true
abstract: Computation is the composition of relations
...

\newcommand{\st}{\mid}

A _relation_ is a subset of the cartesion product of sets.
The _domain_ of a relation $R\subseteq X\times Y$ is the
set of $x\in X$ such that $(x,y)\in R$ for some $y\in Y$.
The _codomain_ is the
set of $y\in Y$ such that $(x,y)\in R$ for some $x\in X$.
Write $xRy$ for $(x,y)\in R$.

The _right coset_ $xR$ is the set of $y\in Y$ with $xRy$.
The _left coset_ $Ry$ is the set of $x\in X$ with $xRy$.

If $R\subseteq X\times Y$ and $S\subseteq Y\times Z$ are relations then
their _composition_ is $SR\subseteq X\times Z$ where
$x(SR)z$ if and only if $xRy$ and $ySz$
for some $y\in Y$. This is equivalent to $xR\cap Sz\not=\emptyset$.

If $1_U$ is the _identity_ relation $(u,u)\in 1_U$, $u\in U$,
then $R1_X = R$ and $1_YR = R$.

A relation $R\subseteq X\times X$ is _transitive_ if $RR \subseteq R$.
A relation $R\subseteq X\times X$ is _reflexive_ if $1_X \subseteq R$.

The _transpose_, or _conjugate_, of a relation $R\subseteq X\times Y$
is $R'\subseteq Y\times X$ where $yR'x$ if and only if $xRy$, $x\in X$, $y\in Y$.

A relation $R\subseteq X\times X$ is _symmetric_ if $R = R'$ and _antisymetric_ if $R\cap R' = \emptyset$.
