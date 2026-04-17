---
title: Logical Entropy
author: Keith A. Lewis
institute: KALX, LLC
classoption: fleqn
fleqn: true
keywords: entropy
abstract: |
	You've been using Logical Entropy
---

<!--
Authors will need to provide no more than 3 ‘key points’ that summarize the key messages of their paper to be published with their article. The key points should be written with a practitioner audience in mind.
-->


\newcommand\RR{\mathbf{R}}
\newcommand\BB{\mathcal{B}}
\newcommand\LL{\mathcal{L}}
\newcommand\AA{\mathcal{A}}
\newcommand\Var{\operatorname{Var}}
\newcommand\Cov{\operatorname{Cov}}
\newcommand\dom{\operatorname{dom}}
\newcommand\cod{\operatorname{cod}}

With apologies to Molière,

> Vous parlez d'entropie logique depuis plus de quarante ans sans le savoir…

Entropy is a measure of information. [@Sha1948] laid the foundations of
Information Theory by considering the entropy of a measure.
The entropy of a random variable is the entropy of its cumulative distribution function.
If the entropy of a two-stage Markov chain
is the average over the first stage of the entropies of the second stage
then there exists a unique (up to non-zero constant) continuous formula
for entropy: $H(p) = -\sum_j p_j \log p_j$.

[@Ell2011] pointed out a simpler and more general _logical entropy_ as measure of disorder:
$h(p) = \sum_j p_j(1 - pj) = 1 - \sum_j p_j^2$.
Ellerman did not claim originality for this and cited prior authors "Gini, Friedman, Turing, Hirschman,
Herfindahl, and no doubt others."

__Exercise__. _Plot $-p\log p$ and $p(1 - p)$ for $0\le p\le 1$_.

Both graphs contain the points $(0,0)$ and $(1,0)$ and have negative second derivative.
Their derivatives at $p = 1$ are both 1. The first has a maximum of $1/e$ at $p = 1/e$
and the second has a maximum of $1/4$ at $p = 1/2$.

## Partition

Partitions of a set represent partial information.
A _partition_ of a set $S$ is a collection of pair-wise disjoint subsets
having union $S$.
The singleton partition $\{S\}$ represents no information. 
The partition of singletons $\{\{s\}\mid s\in S\}$ represents
complete information. Knowing only which subset in partition
an element of $S$ belongs to is partial information.

For example, if $S = [0,1)$ then $\AA_1 = \{[0, 1/2), [1/2, 1)\}$
represents knowing the first digit in the base 2 representation of $s\in S$.
If $s\in[0, 1/2)$ then its first binary digit is 0. If $s\in[1/2,1)$
then its first binary digit is 1.

__Exercise__. _Show $\AA_2 = \{[0, 1/4), [1/4, 1/2), [1/2,3/4), [3/4,1)\}$
represents knowing the first two digits in the base 2 representation of $s\in S$_.

_Hint_: Every $s\in[0, 1)$ can be written $s = \sum_{n\ge1} s_n/2^n$ where
$s_n$ is either 0 or 1.

## Logical Probability

Given a finite set $S$ and a subset $A\subseteq S$ define the logical
probability $P_S(A) = \#A/\#S$ where $\#$ gives the number of elements in the set.
De Morgan's laws for logic show this is a probability measure.

## Logical Entropy

Logical entropy is defined on partitions of a set. 
For any function $\pi\colon S\to\NN$ define ${A_i = \{s\in S\mid\pi(s) = i\}$, $i\in\NN$.

__Exercise__. _Show $\{A_i\mid i\in\NN\}$ is a partition of $S$_.

$h(\pi) = \#dit(\pi)/#S^2$

## References
