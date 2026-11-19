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
Its cumulative distribution function is ${F(x) = P(\{\omega\in\Omega\mid F(\omega)\le x\})}$.

> “Mathematicians are like Frenchmen: whatever you say to them they
translate into their own language and forthwith it is something entirely
different.” ― Johann Wolfgang von Goethe

Or as my thesis advisor Scott Brown, who solved the invariant subspace problem for bounded normal
operators on a Hilbert space, put it more succinctly, "There you have it, clear as mud."

How do we come up with $\Omega$, $P$, and $\AA$?

This Wisenheimer points out there is a third kind: a random variable can
also be identified with a _measure_.  The random variable $X$ defined
using a probability measure $P$ can be identified with the measure $XP$.
A function times a measure is a measure.
Real-valued functions take elements of a set to a real number.
Measures take subsets of a set to a number, don't count things twice,
and the measure of the emptyset is $0$.
The random variable $X$ gives rise to the linear functional
${f\mapsto E[f(X)]}$ for any bounded function $f$.

## $B(S)^*\cong ba(S)$

Let $S$ be a set and $B(S)$ the set of bounded real-valued functions on $S$,
$\sum_{s\in S} |f(s)| < \infty$ for all $f\in B(S)$.
The vector space dual of the set of bounded functions can be identified
with the space of finitely-additive measures on $S$, $ba(S)$.
Given a linear functional $L\colon B(S)\to\RR$ in the dual define
$\lambda(E) = L(1_E)$ for $E\subseteq S$, where $1_E(s) = 1$ if $s\in E$
and 0 otherwise is the _indicator function_ of $E$.

__Exercise__. _Show $\lambda$ is a finitely-additive measure on $S$_.

_Hint_: Use $1_{E\cup F} = 1_E + 1_F - 1_{E\cap F}$ (measures don't count
things twice) and $1_\emptyset = 0$ (the measure of the emptyset is 0)

Given a finitely-additive measure $\lambda$ on $S$ define the
linear functional ${L\in B(S)^*}$ by ${L(\sum_i a_i 1_{E_i})
= \sum_i a_i \lambda(E_i)}$ for any elementary linear combination
of indicator functions.

__Exercise__. _Show $L$ is well-defined_.

_Hint_: This is clearly true if the $E_i$ are pairwise-disjoint.
Show $E\cup F$ can be written as the
pairwise-disjoint union ${(E\setminus F)\cup(E\cap F)\cup(F\setminus E)}$.

A norm can be defined on $ba(S)$ by $\|\lambda\| = \sup_{\{E_i\}}\sum_{E_i} |\lambda(E_i)|$
where $\{E_i\}$ range over partitions of $S$. 

__Exercise__. _Show $\|L\| = \|\lambda\|$_.

_Hint_: $\lambda(E) = a|\lambda(E)|$ for some $a\in\RR$ with $|a| = 1$.

Since elementary linear combinations of indicator functions are
norm dense in $B(S)$ we can extend $L$ to $B(S)$.
The above shows $B(S)^*$ is isometrically isomorphic to $ba(S)$.

For $g\in B(S)$ define $M_g\colon B(S)\to B(S)$
by $M_g(f) = gf$, $f\in B(S)$. The adjoint of multiplication by $g$
is $M_g^*\colon ba(S)\to ba(S)$ where the dual pairing
${\langle M_g(f),\lambda\rangle = \langle f, M_g^*(\lambda)\rangle}$.
This defines multiplication of a measure by a bounded function.

## Irving Segal

My NYU colleague, William Segal, is the son of Irving Segal who had a
profound impact on my thoughts about integration.


He was motivated by John von Neumann's
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


Let $P(X = k_j) = q_j$, $j = 1,\ldots,n$ and suppose
$f = E[X]$ and $p_j = E[(k_j - X)^+] = \sum_{k_i < k_j} (k_j - k_i)q_i$.
$p = Aq$ where $A_{ij} = (k_j - k_i)^+$.

Minimize
$$
\Phi = (1/2)(1 - q'q) - \lambda(q'1 - 1) - \mu (q'k - f) - \nu'(Aq - p)
$$
so $0 = -q - \lambda 1 - \mu k - \nu'A$.

$1 = 1'q = (-\lambda n - \mu 1'k - 1'\nu'A)$.

$f = k'q = (-\lambda k'1 - mu k'k - \nu 1'A$.

$p = Aq = ... $
