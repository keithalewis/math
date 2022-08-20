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

## Real-valued Function

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
are defined pointwise: $(af)(\omega) = af(\omega)$ and $(f + g)(\omega) =
f(\omega) + g(\omega)$, for $a\in\RR$, $f,g\in\RR^\Omega$, $\omega\in \Omega$.
We can replace $\RR$ by any field $\FF$ and get a vector space over $\FF$.

## Measure

The set of all subset of a set $\Omega$ can be identified with $\{0,1\}^\Omega$.
A set $A\subseteq\Omega$ corresponds to the _indicator funtion_
$1_A\colon\Omega\to\RR$, where
$1_A(\omega) = 1$ if $\omega\in A$ and $1_A(\omega) = 0$ if $\omega\not\in A$.
The set of all subsets is also written as $2^\Omega$ where $2 = \{0,1\}$.

A _measure_ on a set $\Omega$ is a function on sets $\phi\colon 2^\Omega\to\RR$ satisfying
$\phi(A\cup B) = \phi(A) + \phi(B) - \phi(A\cap B)$, $A,B\subseteq\Omega$
and $\phi(\emptyset) = 0$. Measures do not count things twice and the
measure of nothing is zero.

__Exercise__. _If $\Omega$ is finite show $\phi(A) = \#A$ is a measure_.

__Exercise__ _If $\phi'\colon 2^\Omega\to\RR$ and
$\phi'(A\cup B) = \phi'(A) + \phi'(B) - \phi'(A\cap B)$, $A,B\subseteq\Omega$,
then $\phi(A) = \phi'(A) - \phi'(\emptyset)$ is a measure_.

_Hint_: $c = c + c - c$.

## Partial Information

Possible _outcomes_ are modeled by a set $\Omega$.  For example,
the outcome of rolling a six-sided die can be modeled by $\Omega
= \{1,2,3,4,5,6\}$.  Subsets of $\Omega$ are called events.
The event "rolling an even number" corresponds to the subset
$\{2,4,6\}$. _Partial information_ is modeled by a _partition_
of $\Omega$. The partition $\{\{1,3,5\},\{2,4,6\}\}$ represents
knowing whether the roll was odd or even. 
Partial information is knowing whether
$\omega\in\{1,3,5\}$ or $\omega\in\{2,4,6\}$.

Full information corresponds to the partition of singletons
$\{\{\omega\}\mid\omega\in\Omega\}$. No information corresponds
to the singleton partition $\{\Omega\}$.

### Algebra of Sets

An _algebra of sets_ on $\Omega$ is a subset
of $2^\Omega$ closed under complement and union.
This is necessary in order to talk about an event not
occuring or either of two events occuring.

__Exercise__. _Show algebras are closed under intersection_.

_Hint_: De Morgan.

If $E$ and $F$ are events in the algebra then "E and F" corresponds
to the event $E\cap F$ in the algebra.

__Exercise__. _If $\AA$ and $\AA'$ are algebras
then $\AA\cap\AA'$ is an algebra_.

If $\AA$ is an algebra let $A_\omega = \cap\{A\in\AA\mid\omega\in A\}$
be the _atom_ containing $\omega\in\Omega$.

__Exercise__. _Show either $A_\omega = A_{\omega'}$ or $A_\omega\cap A_{\omega'} = \emptyset$
for $\omega,\omega'\in\Omega$_.

### Partition

A _partition_ of a set $\Omega$ is a collection of subsets of $\Omega$ that
are pairwise disjoint and have union $\Omega$. Given $\omega\in\Omega$ let
$A_\omega$ be the set in the partition containing $\Omega$.

__Exercise__. _Show either $A_\omega = A_{\omega'}$ or $A_\omega\cap A_{\omega'} = \emptyset$
for $\omega,\omega'\in\Omega$_.

Define a relation on $\Omega$ by $\omega\sim\omega'$ if and only if $A_\omega = A_{\omega'}$.

__Exercise__. _Show $\sim$ is an equivalence relations_.

_Hint_: Show $\omega\sim\omega$, $\omega\sim\omega'$ imples $\omega'\sim\omega$, and
$\omega\sim\omega'$, $\omega'\sim\omega''$ imply $\omega\sim\omega''$.

__Exercie__. _Show every equivalence relation determines a partition_.

_Hint_: Let $A_\omega = \{\omega'\in\Omega\mid \omega'\sim\omega\}$ and
show $\{A_\omega\mid\omega\in\Omega\}$ is a partition.

__Exercise__. _If $\AA$ is an algebra then its atoms form a parition_.

Given any collection $\BB$ of subsets of $\Omega$ let $\Alg\BB$ be
the smallest algebra of sets on $\Omega$ containing $\BB$.

__Exercise__. _If $\AA$ is an algebra show $\AA = \Alg\{A_\omega\mid\omega\in\Omega\}$_.

This shows algebras are in 1-to-1 correspondence with their partition of atoms.

## Integration

A _linear functional_ on a vector space $V$ is a linear transformation from $V$ to $\RR$.
The dual $V^*$ is the set of all linear functionals on $V$.

For $A\subseteq\Omega$ define the _indicator function_ $1_A$ by
$1_A(\omega) = 1$ if $\omega\in A$ and $1_A(\omega) = 0$ if $\omega\not\in A$.

If $F$ is a linear functional on $\RR^\Omega$ then we can define a function from subsets of $\Omega$ to $\RR$
by $\phi(A) = F1_A$.

__Exercise__. _Show $\phi$ is a measure_.

_Hint_: Use $1_{A\cup B} = 1_A + 1_B - 1_{A\cap B}$ and $1_\emptyset = 0$ to show
$\phi(A\cup B) = \phi(A) + \phi(B) - \phi(A\cap B)$ and $\phi(\emptyset) = 0$_.

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


If $V$ is a Banach space then $V^*$ is the set of bounded linear functional.

Any function from subsets of $\Omega$ to $\RR$ satisfying these conditions
is a _measure_. Measures do not count things twice and the measure
of nothing is zero.  The set of measures on $\Omega$
form a vector space under setwise scalar multiplication and addition:
$(a\phi)(A) = a\phi(A)$ and $(\phi + \psi)(A) = \phi(A) + \psi(A)$,
for $a\in\RR$, $\phi,\psi$ measures, $A\subseteq\Omega$.

If $\phi$ is a measure on $\Omega$ we can define a linear functional on $F\colon B(\Omega)\to\RR$
by $F(1_A) = \phi(A)$, $A\subseteq\Omega$, and extend it using linearity.

__Exercise__. _Show $\sum_j a_j 1_{A_j} = \sum_k b_k 1_{B_k}$ where $\{B_k\}$ are pairwise disjoint_.
