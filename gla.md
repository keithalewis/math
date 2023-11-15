---
title: Geometric Linear Algebra
author: Keith A. Lewis
institute: KALX, LLC
classoption: fleqn
fleqn: true
abstract: Linear algebra is a special case of Geometric Algebra
---

\newcommand\bm[1]{\boldsymbol{#1}}
\newcommand\RR{\boldsymbol{R}}
\newcommand\Var{\operatorname{Var}}
\newcommand\Cov{\operatorname{Cov}}
\newcommand\Alg{\operatorname{Alg}}

In ??? Herman Grassmann invented Geometric Algebra...

Let $E$ be the set of points in space.

Define $\Alg(E)$ by

$\RR\subseteq \Alg(E)$

$E\subseteq \Alg(E)$

If $A,B\in\Alg(E)$ then $A + B = B + A\in\Alg(E)$

If $A,B\in\Alg(E)$ then $AB \in\Alg(E)$

If $a\in\RR$ and $A\in\Alg(E)$ then $aA = Aa$.

If $A\in\Alg(E)$ then $0A = 0$ and $1A = A$.

If $A,B,C\in\Alg(E)$ then $A(B + C) = AB + AC$ and $(A + B)C = AC + BC$.

Graded.

Linear Transformation: $T\colon E\to E$.
$T(aP) = aTP$, $T(P + Q) = TP + TQ$.

Grassmann: $PQ = 0$ if and only if $P = Q$.

$P(\sum_i a_i P_i) = 0$ if and only if $P = \sum_i a_i P_i$.

Independence: $\sum_i a_i P_i = 0$ implies $a_i = 0$ for all $i$.

$P_0\cdots P_n = 0$ iff $(P_j)$ independent.

$\partial P_0 P_1 P_2 = P_1 P_2 - P_0 P_2 + P_0 P_1 = (P_1 - P_0)(P_2 - P_0)$.

$(P_1 - P_0)(P_2 - P_0) = 0$ iff $P_1 - P_0 = a(P_2 - P_0$.
