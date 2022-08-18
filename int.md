---
title: Integration
author: Keith A. Lewis
institution: KALX, LLC
email: kal@kalx.net
classoption: fleqn
abstract: Integration is a linear functional on a vector space of functions.
...

\newcommand{\RR}{\mathbf{R}}

Integration is a linear functional on a vector space of functions.
The integral of a constant times a function is the constant times the
integral of the function and the integral of the sum of two functions
is the sum of the integrals of each function.

If $A$ and $B$ are sets then $A^B = \{f\colon B\to A\}$ is the set
of all functions from $B$ to $A$. The set $\RR^B$ is a vector
space where scalar multiplication and addition are defined pointwise:
$(af)(b) = af(b)$ and $(f + g)(b) = f(b) + g(b)$, for $a\in\RR$,
$f,g\in\RR^B$, $b\in B$.

Given a set $\Omega$ let $B(\Omega)$ be the vector space of bounded
functions on $\Omega$. A function $f\colon\Omega\to\RR$ is bounded
if there exists $M\in\RR$ with $|f(\omega)| \le M$ for all $\omega\in\Omega$.
The _norm_ of $f\in B(\Omega)$ is $\|f\| = \sup\{|f(\omega)|\mid \omega\in\Omega\}$.
The norm is _complete_ so $B(\Omega)$ is a Banach space.

__Exercise__. _Show the set of finite linear combinations $\sum_j a_j 1_{A_j}$
is dense in $B(\Omega)$_.

_Hint_: If $f\in B(\Omega)$ and $\epsilon > 0$ ...

Every function implemented on a computer is bounded. 
The proxy for the set of real numbers $\RR$ are floating point numbers
that can be represented in a finite number of bits.
The largest floating point nummber that can be represented using 64 bits
in the [IEEE 754 standard](https://www.computer.org/csdl/magazine/co/2019/12/08909942/1f8KFWxbTCU)
is approximately `1.79769e+308`.

A linear functional on a vector space $V$ is a linear transformation from $V$ to $\RR$.
The dual $V^*$ is the set of all linear functionals on $V$.
If $V$ is a Banach space then $V^*$ is the set of bounded linear functional.

For $A\subseteq\Omega$ define the _indicator function_ $1_A$ by
$1_A(\omega) = 1$ if $\omega\in A$ and $1_A(\omega) = 0$ if $\omega\not\in A$.

If $F\in B(\Omega)^*$ then we can define a function from subsets of $\Omega$ to $\RR$.
by $\phi(A) = F1_A$.

__Exercise__. _Show $\phi(A\cup B) = \phi(A) + \phi(B) - \phi(A\cap B)$ and $\phi(\emptyset) = 0$_.

_Hint_: Use $1_{A\cup B} = 1_A + 1_B - 1_{A\cap B}$ and $1_\emptyset = 0$.

Any function from subsets of $\Omega$ to $\RR$ satisfying these conditions
is a _measure_. Measures do not count things twice and the measure
of nothing is zero.  The set of measures on $\Omega$
form a vector space under setwise scalar multiplication and addition:
$(a\phi)(A) = a\phi(A)$ and $(\phi + \psi)(A) = \phi(A) + \psi(A)$,
for $a\in\RR$, $\phi,\psi$ measures, $A\subseteq\Omega$.

If $\phi$ is a measure on $\Omega$ we can define a linear functional on $F\colon B(\Omega)\to\RR$
by $F(1_A) = \phi(A)$, $A\subseteq\Omega$, and extend it using linearity.

__Exercise__. _Show $\sum_j a_j 1_{A_j} = \sum_k b_k 1_{B_k}$ where $\{B_k\}$ are pairwise disjoint_.
