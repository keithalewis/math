---
title: Function, Measure, Integral
author: Keith A. Lewis
institute: KALX, LLC
fleqn: true
classoption: fleqn
abstract: Finitely additive measures are the dual of the vector space of bounded functions.
---

\newcommand\bs[1]{\boldsymbol{{#1}}}
\newcommand\RR{\bs{{R}}}
\renewcommand\o[1]{\overline{#1}}
\renewcommand\AA{\mathcal{A}}
\renewcommand\PP{\mathcal{P}}

Integration is a _linear functional_. The integral of a constant times a function
is the constant times the intergral of the function and the integral of a
sum of functions is the sum of the integrals.
The Riemann integral of a continuous function on a finite interval is
defined as a limit:
$$
	\int_a^b f(x)\,dx = \lim_{\Delta x\to 0} \sum_j f(x_j^*)\,Delta x_j
$$
where $a = x_0 < \cdots < x_n = b$, $\Delta x_j = x_{j+1} - x_j$, and $x_j^*\in [x_j, x_{j+1}]$.
The precise definition of the limit is a bit complicated and it is not trivial to
show it exists and is unique. <F6>

A _function_ from a set $S$ to the real numbers, $f\colon S\to\RR$,
associates each $s\in S$ with a unique $f(s)\in\RR$.
A _(finitely additive) measure_ is a function from the set of all subsets of $S$,
_power set_ of $S$, $\PP(S) = \{A\subseteq S\}$,
to the real numbers $\phi\colon\PP(S)\to\RR$ that satisfies $\phi(\emptyset) = 0$
and $\phi(A\cup B) = \phi(A) + \phi(B) - \phi(A\cap B)$.
The measure of the empty set is 0 and measures don't count things twice.

## Set Exponential

If $A$ and $B$ are sets then the _set exponential_ $B^A$ is the set
of all functions from $A$ to $B$, $B^A = \{f\colon B\to A$.

Denote the _bounded functions_ on $S$ by $B(S) = \{f\colon S\to\RR\mid \|f\| = \sup_{s\in S} |f(s)| < \infty\}$.
The dual of $B(S)$ is the set of _linear functionals_ on $B(S)$,
$B(S)^* = \{F\colon B(S)\to\RR\mid F\text{ is linear}\}$.
Every $F\in B(S)^*$ determines a measure $\phi(A) = F(1_A)$
where $1_A\colon S\to\RR$ is the _characteristic function_
$1_A(s) = 1$ if $s\in A$ and $1_A(s) = 0$ if $s\not\in A$.

__Exercise__. _Show $\phi$ is a measure_.

_Hint_. Use $1_\emptyset = 0$ and $1_{A\cup B} = 1_A + 1_B - 1_{A\cap B}$.

The integral of $f$ with respect to $\phi$ is $\int_S f\,d\phi = F(f)$.
