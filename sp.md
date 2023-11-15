---
title: Stochastic Process
author: Keith A. Lewis
institute: KALX, LLC
classoption: fleqn
fleqn: true
abstract: Random variables indexed by time
...

\newcommand{\AA}{\mathcal{A}}
\newcommand{\BB}{\mathcal{A}}
\newcommand{\RR}{\boldsymbol{R}}

A _stochastic process_ is a collection of random variables indexed by time.
A stochastic process is completely specified by its finite joint distributions.
The _standard setup_ specifies a _sample space_ $\Omega$, and a probability measure $P$
defined on each _algebra_ $\AA_t$, $t\in T$. It is also common to assume
$T$ is _totally ordered_ and $\AA_t\subseteq$\AA_u$ whenever $t\le u$
in the ordering.

We write $X_t\colon\AA_t\to\RR$, $t\in T$, to indicate $X_t$ is a function from
$\Omega$ to the real numbers that is $\AA_t$-measurable.
If $\AA$ is an algebra of sets then $A\in\AA$ is an _atom_ of $\AA$ if $B\in\AA$ and
$B\subseteq A$ then either $B = A$ or $B = \emptyset$.

__Exercise__. _If $\AA$ is a finite algebra of sets on $\Omega$ then the atoms of $\AA$
are a partition of $\Omega_.

_Hint_: A collection $\BB$ of subsets of $\Omega$ is a _partition_ if the sets in $\BB$
are pairwise disjoint and the union of all sets in $\BB$ equals $\Omega$. Given
$\omega\in\Omega$ let $A_\omega = \cap\{A\in\AA\mid \omega\in\AA\}$.

In the finite case the atoms of $\AA$ determine the algeba $\AA$ so we can identify
$\AA$ with its atoms.

Recall that a function $X\colon\Omega\to\RR$ is $\AA$-measurable if $\{\omega\in\Omega\mid f(\omega)\le x\}$
belongs to $\AA$ for all $x\in\RR$.

__Exercise__. _If $\AA$ is finite show $f$ is measurable if and only if it is constant on atoms of $\AA$_.

A consequence of this exercise is that $f\colon\Omega\to\RR$ is $\AA$-measurable if and only if
$f\colon\AA\to\RR$ _is_ a function from the atoms of $\AA$ to the real numbers.
