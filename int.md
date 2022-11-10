---
title: Integration
author: Keith A. Lewis
institution: KALX, LLC
email: kal@kalx.net
classoption: fleqn
abstract: Integration is a linear functional on a vector space of functions.
...

\newcommand{\RR}{\mathbf{R}}
\newcommand{\FF}{\mathbf{F}}
\renewcommand{\AA}{\mathcal{A}}
\newcommand{\BB}{\mathcal{B}}
\newcommand{\Alg}{\mathop{\rm{Alg}}}

A function and a measure determine an integral. Integrals are
linear in both the function and the measure.
Measures are functions on subsets of the domain of the function
that do not count things twice. They can be identified with
the dual of the vector space of functions.

## Function

If $A$ and $B$ are sets then $A^B = \{f\colon B\to A\}$ is the set of
all functions from $B$ to $A$.

__Exercise__. _If $\#A$ is the number of elements of the set $A$ show
$\#A^B = \#A^{\#B}$ when $A$ and $B$ are finite_.

<details>
<summary>Solution</summary>
A function $f\colon B\to A$ assigns elements of $B$ to elements of $A$.
For each of the $\#B$ elements of $B$ we have $\#A$ choices from $A$.
</details>

The set $\RR^\Omega$ is a vector space of
real-valued functions on $\Omega$ where scalar multiplication and addition
are defined pointwise:
$$
\begin{aligned}
(af)(\omega) &= af(\omega) \\
(f + g)(\omega) &= f(\omega) + g(\omega), \\
\end{aligned}
$$
for $a\in\RR$, $f,g\in\RR^\Omega$, $\omega\in \Omega$.
We can replace $\RR$ by any field $\FF$ and get a vector space over $\FF$.

## Measure

The set of all subsets of a set $\Omega$ is $\mathcal{P}(\Omega) = \{A\mid A\subseteq\Omega\}$.
A _measure_ on a set $\Omega$ is a function $\mu\colon \mathcal{P}(\Omega)\to\RR$ satisfying
$\mu(A\cup B) = \mu(A) + \mu(B) - \mu(A\cap B)$, $A,B\subseteq\Omega$
and $\mu(\emptyset) = 0$. Measures do not count things twice and the
measure of nothing is zero.

__Exercise__ _If $\nu\colon \mathcal{P}(\Omega)\to\RR$ and
$\nu(A\cup B) = \nu(A) + \nu(B) - \nu(A\cap B)$, $A,B\subseteq\Omega$,
then $\mu(A) = \nu(A) - \nu(\emptyset)$ is a measure_.

_Hint_: $c = c + c - c$.

__Exercise__. _If $\Omega$ is finite show $\mu(A) = \#A$ is a measure_.

__Exercise__. _If $\Omega$ is finite show $\mu(A) = \sum_{\omega\in A} \mu(\{\omega\})$_.

This shows measures on finite sets are determined by the measure of each singleton $\{\omega\}$, $\omega\in\Omega$.
In this case a measure can be identified with an element of $\RR^\Omega$.

The set $ba(\Omega)$ of all measures on $\Omega$ is a vector space
where scalar multiplication and addition are defined setwise:
$$
\begin{aligned}
(a\mu)(A) &= a\mu(A) \\
(\mu + \nu)(A) &= \mu(A) + \nu(A), \\
\end{aligned}
$$
for $a\in\RR$, $\mu,\nu\in ba(\Omega)$, $A\subseteq\Omega$.

## Integration

Integration is a linear functional $M\colon\RR^\Omega\to\RR$:
$M(af) = aMf$ and $M(f + g) = Mf + Mg$, $a\in\RR$, $f,g\in\RR^\Omega$.
Each linear functional $M$ determines a measure $\mu$ by
$\mu(A) = M1_A$, $A\subseteq\Omega$, where $1_A\in\RR^\Omega$ is
the _indicator function_ defined by
$1_A(\omega) = 1$ if $\omega\in A$ and $1_A(\omega) = 0$ if $\omega\not\in A$.

__Exercise__. _Show $\mu$ is a measure_.

_Hint_: $1_{A\cup B} = 1_A + 1_B - 1_{A\cap B}$ and $1_\emptyset = 0$.

__Exercise__. _Show $\mathcal{P}(\Omega)$ can be identified with $\{0,1\}^\Omega$_.

_Hint_: $A\subset\Omega$ corresponds to $1_A\in \{0,1\}^\Omega$.
We also write $2^\Omega$ for this where $2 = \{0,1\}$.

Each measure $\mu$ determines a linear functional on a subspace of $\RR^\Omega$.
Functions that are finite linear combinations of indicator functions are called _elementary_.
If $f = \sum_j a_j 1_{A_j}$, $a_j\in\RR$, $A_j\subseteq\Omega$ is elementary then
define $Mf = \sum_j a_j \mu(A_j)$.
For this to be well-defined we must show if $\sum_j a_j 1_{A_j} = \sum_k b_k1_{B_k}$ 
are elementary functons then $\sum_j a_j \mu(A_j) = \sum_k b_k\mu(B_k)$.
Since $M$ is linear this is equivalent to showing if $\sum_j a_j 1_{A_j} = 0$
then $\sum_j a_j \mu(A_j) = 0$.

__Exercise__. _If $T\colon V\to W$ is a linear transformation between vector spaces then
$Tf = Tg$ if and only if $T(f - g) = 0$, $f,g\in V$_.

_Hint_: $T(f - g) = Tf - Tg$.

Every elementary function can be written as $\sum_j a_j 1_{A_j}$ where $(A_j)$ are pairwise disjoint.

__Exercise__. _If $f = a_1 1_{A_1} + a_2 1_{A_2}$ show
$f = a_1 1_{A_1\setminus A_2} + a_2 1_{A_2\setminus A_1} + (a_1 + a_2) 1_{A_1\cap A_2}$_.

_Hint_: Recall the _set difference_ is defined by $A\setminus B = \{a\in A\mid a\not\in B\}$.

__Exercise__. _Show $a_1\mu(A_1) + a_2\mu(A_2)
= a_\mu(A_1\setminus A_2) + a_2\mu(A_2\setminus A_1) + (a_1 + a_2)\mu(A_1\cap A_2)$_.

_Hint_: $A = (A\setminus B)\cup(A\cap B)$ is a disjoint union so
$\mu(A) = \mu(A\setminus B) + \mu(A\cap B)$.

The case for any finite linear combination can be proved by induction.

__Exercise__. _If $\sum_j a_j 1_{A_j} = 0$ and $(A_j)$ are pairwise disjoint
then $a_j = 0$ for all $j$_.

_Hint_: Consider when $\omega\in A_j$.

This shows $M$ is well-defined.

Given a linear functional $M$ on $\RR^\Omega$ we always have a measure $\mu$ on $\Omega$
given by $\mu(A) = M1_A$. A measure only determines a linear functional on the subspace
of elementary functions in $\RR^\Omega$.

If $\Omega$ is finite then every function is elementary since
$f = \sum_{\omega\in\Omega} f(\omega) 1_{\{\omega\}}$

We write $Mf = \int_\Omega f\,d\mu$.

## Bounded Function

A function $f\in\RR^\Omega$ is _bounded_ if there exists $N\in\RR$
with $|f(\omega)| < N$ for $\omega\in\Omega$.  The set of all bounded
functions is denoted $B(\Omega)$.  The _norm_ of a bounded function is the
_greatest lower bound_ (_infimum_) $\|f\| = \inf\{N\in\RR\mid |f| < N\}$,
where $|f| < N$ is shorthand for $|f(\omega)| < N$ for all $\omega\in\Omega$.

__Exercise__. _Show $\|f\| = \sup\{|f(\omega)|\mid \omega\in\Omega\}$_.

__Exercise__. _Show $\|f\| = 0$ implies $f = 0$, $\|af\| = |a|\|f\|$
and $\|f + g\| \le \|f\| + \|g\|$, $a\in\RR$, $f,g\in B(\Omega)$_.

A vector space having a norm is a _normed linear space_. It is also a metric space with
distance defined by $d(f,g) = \|f - g\|$.

__Exercsie__. _Show $d(f,g) = 0$ implies $f = g$ and $d(f,g) \le d(f,h) + d(h,g)$ for $f,g,h\in B(\Omega)$_.

A metric space is _complete_ if every Cauchy sequence converges to a point in the space.

__Exercise__. _If $(f_n)$ is a Cauchy sequence in $B(\Omega)$ show it converges to some $f\in B(\Omega)$_.

_Hint_: $(f_n(\omega))$ is a Cauchy sequence in $\RR$ for each $\omega\in\Omega$ and $\RR$ is complete.

## Continuous Integral

Let $B(\Omega)^*$ be the space of all linear functionals on $B(\Omega)$ that are continuous in
the metric topology: $M\colon B(\Omega)\to\RR$ where $f_n\to f$ implies $Mf_n \to Mf$.
Note $B(\Omega)^*$ is a vector space and we can define a norm for each $M\in B(\Omega)^*$
by $\|M\| = \sup\{|Mf|\mid f\in B(\Omega), \|f\| \le 1\}$.

__Exercise__. _Show this ia a norm_.

_Hint_: Show $\|M\| = 0$ implies $M = 0$, $\|aM\| = |a| \|M\|$, and
$\|M + N\| \le \|M\| + \|N\|$, $a\in\RR$, $M,N\in B(\Omega)^*$.

As before, each $M\in B(\Omega)^*$ defines a measure $\mu\in ba(\Omega)$
by $\mu(A) = M1_A$. Again, each measure $\mu\in ba(\Omega)$ defines a
linear functional on the subspace of elementary functions by $M(\sum_j
a_j 1_{A_j}) = \sum_j a_j \mu(A_j)$. This can be extended to
all of $B(\Omega)$ by continuity.

The set of elementary functions in $B(\Omega)$ is _dense_:
given $f\in B(\Omega)$ and $\epsilon > 0$ there exists
an elementary function $e$ with $\|f - e\| < \epsilon$.
Suppose $\|f\| < N$ and let $-N = a_0 < a_1 < \cdots < a_n = N$, $a_j\in\RR$ be any partition
of $[-N, N]$. Define $A_j = \{\omega\in\Omega\mid a_j \le f(\omega) < a_{j+1}\}$, $0\le j < n$.

__Exercise__. _Show $\|f - \sum_j a_j 1_{A_j}\| \le \max_{0\le j < n} a_{j + 1} - a_j$_.

For any $N$ and any $\epsilon > 0$ we can find a partition with $\max_{0\le j < n} a_{j + 1} - a_j < \epsilon$.

This shows $B(\Omega)^*$ is in 1-to-1 correspondence with $ba(\Omega)$.
The map $M\mapsto\mu$ is linear and continuous.

__Exercise__. _Show the map is isometric_.

_Hint_: Show if $M\mapsto\mu$ then $\|M\| = \|\mu\|$.

This establishes the fact bounded linear functionals on $B(\Omega)$ are
isometrically isomorphic to measures on $\Omega$.

## Partial Information

Possible outcomes are modeled by a set $\Omega$.  For example, the
outcome of rolling a six-sided die can be modeled by the set
$\Omega = \{1,2,3,4,5,6\}$.  Subsets of $\Omega$ are called events.
The event "rolling an even number" corresponds to the subset
$\{2,4,6\}$. Partial information is modeled by a partition of $\Omega$.
The partition $\{\{1,3,5\},\{2,4,6\}\}$ represents knowing whether
the roll was odd or even.  Partial information is knowing only whether
$\omega\in\{1,3,5\}$ or $\omega\in\{2,4,6\}$.

Full information corresponds to the partition of singletons
$\{\{\omega\}\mid\omega\in\Omega\}$. No information corresponds
to the singleton partition $\{\Omega\}$.

### Partition

Partial information is modeled by a _partition_ of a set $\Omega$:
a collection of subsets of $\Omega$ that are pairwise disjoint and
have union $\Omega$. Every $\omega\in\Omega$ belongs to a unique set,
$A_\omega$, in the partition.  We call $A_\omega$ the _atom_ containing
$\omega$.

__Exercise__. _Show either $A_\omega = A_{\omega'}$ or $A_\omega\cap A_{\omega'} = \emptyset$
for $\omega,\omega'\in\Omega$_.

Define a relation on $\Omega$ by $\omega\sim\omega'$ if and only if $A_\omega = A_{\omega'}$.

__Exercise__. _Show $\sim$ is an equivalence relations_.

_Hint_: Show $\omega\sim\omega$, $\omega\sim\omega'$ imples $\omega'\sim\omega$, and
$\omega\sim\omega'$, $\omega'\sim\omega''$ imply $\omega\sim\omega''$.

__Exercie__. _Show every equivalence relation determines a partition_.

_Hint_: Let $A_\omega = \{\omega'\in\Omega\mid \omega'\sim\omega\}$ and
show $\{A_\omega\mid\omega\in\Omega\}$ is a partition.

### Algebra of Sets

An _algebra of sets_ on $\Omega$ is a subset of the power set of $\Omega$
that is closed under complement and union.  Sets in the algebra are
called _events_.  These conditions are necessary in order to talk about
an event not occuring or either of two events occuring.
If $E$ is an event then "not E" corresponds to $\Omega\setminus E$.
if $E$ and $F$ are events then "E or F" corresponds to $E\cup F$.

__Exercise__. _Show algebras are closed under intersection_.

_Hint_: De Morgan.

If $E$ and $F$ are events in the algebra then "E and F" corresponds
to the event $E\cap F$.

__Exercise__. _If $\AA$ and $\AA'$ are algebras then $\AA\cap\AA'$ is an algebra_.

__Extra Credit__. _Find algebras $\AA$ and $\AA'$ where $\AA\cup\AA'$ is not an algebra_.

Given any collection of subsets $\BB$ of $\Omega$ define $\Alg\BB$ to be
the smallest algebra containing $\BB$.

__Exercise__ _Show $\Alg\BB$ is the intersection of all algebras containing $\BB$_.

If $\AA$ is an algebra let $A_\omega = \cap\{A\in\AA\mid\omega\in A\}$, $\omega\in\Omega$.

__Exercise__. _Show either $A_\omega = A_{\omega'}$ or $A_\omega\cap A_{\omega'} = \emptyset$
for $\omega,\omega'\in\Omega$_.

__Exercise__. _If $\AA$ is an algebra then $\{A_\omega\mid\omega\in\Omega\}$ is a parition_.

__Exercise__. _If $\AA$ is an algebra show $\AA = \Alg\{A_\omega\mid\omega\in\Omega\}$_.

This shows algebras are in 1-to-1 correspondence with their partition of atoms.
We will use $\AA$ to denote either the algebra or partition.

## Measurable

If $\AA$ is an algebra on $\Omega$ and $f\colon\Omega\to\RR$ then
$f$ is $\AA$-measurable if $\{\omega\mid f(\omega) \le a\}$ belongs
to $\AA$ for every $a\in\RR$.

__Exercise__. _If $\AA$ is finite then $f\colon\Omega\to\RR$ is
measurable if and only if $f$ is constant on the atoms of $\AA$_.

This shows $f$ is measurable if and only if $f\colon\AA\to\RR$ is
a function on the atoms of $\AA$.

The atoms of $\AA$ are a set so the theory of integration above applies.
$B(\AA)$ is the set of bounded $\AA$ measurable functions. Its
dual $B(\AA)^*$ is isometrically isomorphic to $ba(\AA)$, the
set of all measures on $\AA$.


<!--

Every function implemented on a computer is bounded. 
The proxy for the set of real numbers $\RR$ are floating point numbers
that can be represented in a finite number of bits.
The largest floating point nummber that can be represented using 64 bits
in the [IEEE 754 standard](https://www.computer.org/csdl/magazine/co/2019/12/08909942/1f8KFWxbTCU)
is approximately `1.79769e+308`.

-->
