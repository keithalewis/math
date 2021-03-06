---
title: Conditional Expectation
author: Keith A. Lewis
institute: KALX, LLC
classoption: fleqn
fleqn: true
abstract: Probability given information
...

Let $\langle \Omega, P, \mathcal{A}\rangle$ be a _probability space_.
The _conditional expectation_ of a random variable $X$ with respect
to a subalgebra $\mathcal{B}\subseteq\mathcal{A}$ is the $\mathcal{B}$
measurable random variable $Y$ satisfying $\int_B Y\,dP = \int_B X\,dP$
for all $B\in\mathcal{B}$ and we write $Y = E[X\mid\mathcal{B}]$.

Note $XP$ is a measure if $X$ is integrable. An equivalent definition of
conditional expectation can be given by restricting measures to the
subaglebra $\mathcal{B}$: $Y(P|_\mathcal{B}) = (XP)|_\mathcal{B}$.
Evaluating each measure on $B\subseteq\mathcal{B}$ results in the
equality of the above integrals.

If $\mathcal{A}$ is finite the atoms of $\mathcal{A}$ are a
partition of $\Omega$ and $\mathcal{A}$ is the smallest algebra
containing the atoms.
A function $X\colon\Omega\to\bm{R}$ is
$\mathcal{A}$ measurable if and only if it is constant on atoms so
$X\colon\mathcal{A}\to\bm{R}$ is a function on atoms.

For any $B\in\mathcal{A}$ we have $(XP)(B) = \sum_{A\subseteq B} X(A)P(A)$
where the sum is over atoms of $\mathcal{A}$. If $Y$ is constant on $B$
then $Y(B)P(B) = (XP)(B)$ if and only if $Y(B) = \sum_{A\subseteq B} X(A)P(A)/P(B)$
is the average of $X$ over atoms contained in $B$.

It is useful to think of algebras as _partial information_. In the finite case
the algebra is determined by its atoms. Full information is knowing which $\omega\in\Omega$
occured. Partial information is knowing only what atom $\omega$ belongs to.
The partition consisting of singletons represents complete information.
The partition $\{\Omega\}$ represents no information.
