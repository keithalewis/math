---
title: Three Kinds of Random Variables
author: Keith A. Lews
classoption: fleqn
fleqn: true
abstract: Try the third kind. You'll like it.
header-includes:
	- \usepackage{bm}
---
\newcommand\bs[1]{\boldsymbol{{#1}}}
\newcommand\RR{\bs{R}}
\renewcommand\AA{\mathcal{A}}
\newcommand\Hom{\operatorname{Hom}}

Some Wisenheimer once remarked there are two kinds of random variables:
a "physicists" random variable and a "mathematicians" random variable.

The physicists definition of a random variable $X$ is the
_cumulative distribution function_ (or _law_) $F$ defined by ${F(x) = P(X \le x)}$,
the probability $X$ is less than or equal to $x\in\RR$.
Two (not necessarily equal) random variables with the same law
have identical statistics -- same mean, variance, mode, quantiles, etc.
There is no statistical test that can distinguish random variables
having the same law.

The mathematicians definition
specifies a _sample space_ $\Omega$ of possible outcomes, 
a positive, countably additive measure $P$ having mass 1 on
a $\sigma$-algebra of sets $\AA$ on $\Omega$.
A _random variable_ is a function $X\colon\Omega\to\RR$ that
is $\AA$-measurable.
Its cumulative distribution function is $F(x) = P(\{\omega\in\Omega\mid F(\omega)\le x\})$.

> “Mathematicians are like Frenchmen: whatever you say to them they
translate into their own language and forthwith it is something entirely
different.” ― Johann Wolfgang von Goethe

Or as my thesis advisor Scott Brown put it more succinctly, "There you have it, clear as mud."

This Wisenheimer claims there is a third kind: a random variable can
also be identified with a _measure_.  The random variable $X$ defined
using a probability measure $P$ can be identified with the measure $XP$.
A function times a measure is a measure.
Real-valued functions take elements of a set to a real number.
Measures take subsets of a set to a number and don't count things twice.
The measure of the emptyset to $0$.

One of my NYU colleagues is the son of Irving Segal
who had a profound impact on my thoughts
about integration. He was motivated by John von Neumann's
dissatisfaction with the theory of quantum mechanics at the time.
Von Neumann figured out Heisenberg's and Schrodinger's theories
were equivalent. They were special cases of the theory of
unbounded self-adjoint operators on Hilbert spaces.

Before von Neumann set his sights on building computers to
help with the Manhattan Project, and convincing politicians
to back his notion of mutually assured destruction, he came up with von Neumann algebras.

to address that.
Segal's papers showing to move that forward were
a revelation to me how far you can get with
an algebraic approach to integration to replace all the complicated
machinery of $\sigma$-algebras and measurable sets.

This goes back to [@Boo1854].
The set of functions from a set $S$ to $\{0,1\}$, $2^S$, where
$2 = \{0,1\}$ is a Boolean algebra.

If $S$ is a set
and $B(S)$ is the set of bounded functions on $S$ 


The random variable $X$ can be identified with the measure $XP$
using the Radon-Nykodym derivative: $X = d(XP)/dP$.

As [@Ive1980] pointed out, notation is a tool of thought.
It is useful to have distinct notation for equivalent, but different, things.

<!--
One example is there are two ways to think about vector spaces.
When I first learned about them I was told they were tuples of real numbers
${\RR^n = \{(x_1,\ldots,x_n)\mid x_i\in\RR\}}$.
It is not a deep mathematical fact that we can identify
$\RR^n$ with the set of function $\bs{x}\colon\{1,\ldots,n\}\to\RR$
where $\bs{x}(i) = x_i$.

A _linear transformation_ is a function $T\colon\RR^I\to\RR^J$ that
preserves the vector space structure:
$T(a x + y) = a(Tx) + Ty$ for $a\in\RR$, $x,y\in\RR^I$.
The set of all such linear transformations is denoted $\Hom(\RR^I,\RR^J)$.
It is easy to show this is also a vector space under pointwise scalar multiplication
$(aT)(i) = a(T(i))$ and addition addition $(T + U)(i) = T(i) + U(i)$.
The _matrix_ of a linear transformation is $t_{i,j} = T(i)?$.

__Exercise__: _Show $\Hom(\RR^I,\RR^J)$ is isomorphic to $\RR^{I\times J}$_.

Iverson figured that out long ago. He was unhappy about the lack
of expressive power of Fortran
-->


The mathematician definition starts with "What is P?"

DiFinnetii

Kolmogorov

defined a probability space to be a set $S$ and a function
$P$ from subsets of $S$ to a number between 0 and 1 that is a _measure_.

People just throw in cites.

Suppose $P(X = 1) = P(X = 6) = 1/6$

$E[(k_j - X)^+] = p_j = \sum_{k_i < k_j} (k_j - k_i)q_i$.

find $q_j$ where $P(X = k_j) = q_j$, $q_j > 0$, $\sum_j q_j = 1$ minimizing $1 - \sum_j q_j^2$

$\Phi = (1/2)(1 - \sum q_j^2) - \lambda(\sum_j q_j - 1) - \sum_j \mu_j (E[(k_j - X)^+ - p_j)$.

$0 = -q_j - \lambda - \sum_j \mu_j \sum_{k_i < k_j} (k_j - k_i)$.

$q_j = - \lambda - \sum_j \mu_j \sum_{k_i < k_j} (k_j - k_i)$.

$1 = \sum_j q_j$, $p_j = \sum_{k_i < k_j} (k_j - k_i)q_i$.
