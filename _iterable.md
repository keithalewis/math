---
title: Iterable
author: Keith A. Lewis
institute: KALX, LLC
classoption: fleqn
fleqn: true
abstract: Linear sequence of elements
...

\newcommand\NN{\bm{N}}

An _iterable_ $i$ is an ordered sequence of elements from a set $X$.
Iterables can be identified with functions $i\colon\NN\to X$,
possibly restricted to an initial segment of $\NN$.
Let $n = \{i:i < n\}$, $n\in\NN$, denote the initial
segment of $\NN$ having $n$ elements.
For $i\colon\NN\to X$ let $i|_n$ be $i$ restricted to $n$.
The collection of such iterables is denoted $X^n$.

Define $+\colon\NN\to\NN$ via $+(n) = 1 + n$, $n\in\NN$.
Given an iterable $i\colon n\to X$ define $i+\colon n-1\to X$
by the composition $(i+)(m) = i(1 + m)$, $m < n - 1$.
Similarly, define $+m\colon\NN\to\NN$ via $+m(n) = m+n$, $n,m\in\NN$
and $(i+m)(k) = i(m + k)$, $k < n - m$.

Let $*i = i(0)\in X$ denote the first element of the iterable.
An iterable has empty domain if and only if $!i$.

## Map

Given $f\colon X\to Y$ define $\map(i)\colon X^n\to Y^n$ by
