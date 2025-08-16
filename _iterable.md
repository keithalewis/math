---
title: Iterable
author: Keith A. Lewis
institute: KALX, LLC
classoption: fleqn
fleqn: true
abstract: Sequence of elements
...

\newcommand\NN{\bm{N}}
\newcommand{\Bool}{\bm{B}}

For any set $T$ the collection of one or more elements of $T$ is the
_Kleene plus_ $T^+ = \cup_{n > 0} T^n$ and the collection of zero or
more elements of $T$ is the _Kleene star_ $T^* = \cup__n \ge 0} T^n$.

An _iterable_ over $T$ is an element of $T^*$.
Define $?\colon T^*\to\Bool$, the set of Boolian values true or false,
by $?i$ is true if $i\in T^+$ and false otherwise.
Define $*\colon T^+\to T$ by $*(t_0, t_1, \ldots) = t_0$.
Define $+\colon T^+\to T^*$ by $+(t_0, t_1, \ldots) = (t_1, t_2, \ldots)$.

Define $+\colon\NN\to\NN$ via $+(n) = 1 + n$, $n\in\NN$.
Given an iterable $i\colon n\to X$ define $i+\colon n-1\to X$
by the composition $(i+)(m) = i(1 + m)$, $m < n - 1$.
Similarly, define $+m\colon\NN\to\NN$ via $+m(n) = m+n$, $n,m\in\NN$
and $(i+m)(k) = i(m + k)$, $k < n - m$.

Let $*i = i(0)\in X$ denote the first element of the iterable.
An iterable has empty domain if and only if $!i$.

## Map

Given $f\colon X\to Y$ define $\map(i)\colon X^n\to Y^n$ by
