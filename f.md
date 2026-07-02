---
title: F
author: Keith A. Lewis
---

\newcommand\bs[1]{\boldsymbol{{#1}}}
\newcommand\RR{\bs{R}}
\newcommand\dom{\operatorname{dom}}
\newcommand\cod{\operatorname{cod}}

A notation for computing with types.

Types are sets with operations that determine the type. 
For example, the set of integers defines commutative and
associative addition and multiplication that satisfy
the distributive law, and have an additive identity $0$
and multiplicative identity $1$.

## Set

We assume the reader is familiar with basic operations
involving sets. Given sets $A$ and $B$ the
union ${A\cup B = \{c\mid c\in A\text{ or }c\in B\}}$,
intersection $A\cap B = {\{c\mid c\in A\text{ and }c\in B\}}$,
product ${A\times B = \{(a,b)\mid a\in A, b\in B}$, and
exponential ${B^A = \{f\colon A\to B\}}$ consisting of
all functions from $A$ to $B$.

__Exercise__. _Show if $A$ and $B$ are finite then the number
of elements in the exponetial ${\#B^A = \#B^{\# A}}$_.

Functions are typically thought of as an algorithm for taking an element $a\in A$
and producing an element $f(a)\in B$.
The _graph_ of a function from $A$ to $B$ is $\{(a,b)\mid f(a) = b\}\subseteq A\times B$.
If $A$ is finite then this is a _map_, _dictionary_, or set of _key-value pairs_.
If $A$ is infinite the graph hides the algorithm for computing $f(a)$ given $a\in A$.
Suppose an oracle could tell you whether or not a given pair $(a,b)$ belongs to
the graph, or even tell you $b = f(a)$ given $a\in A$. There is no known
way to convert this to an algorithmic formula for $f$.

Injective, surjective, bijective.

Two sets a equal if they have the same elements. Two sets are
_equivalent_ if there is a bijection from one to the other.

__Exercise__. (reflexive) _Show every set $A$ is equivalent to $A$_.

__Exercise__. (symmetric) _Show if $A$ is equivalent to $B$ then $B$ is equivalent to $A$_.

__Exercise__. (transitive) _Show if $A$ is equivalent to $B$ and $B$ is equivalent to $C$
then $A$ is equivalent to $C$_.

<details><summary>Zero knowledge proofs</summary>
</details>

## Relation

A _relation_ is a subset $R\subseteq A\times B$. We write $aRb$ for ${(a,b)\in R}$.
Define the _left coset_ ${Rb = \{a\in A\mid aRb\}\subseteq A}$ for $b\in B$ and the right coset
${aR = \{b\in B\mid aRb\}\subseteq B}$ for $a\in A$.
The _domain_ of a relation is ${\dom R = RB = \{Rb\mid b\in B\}\subseteq A}$.
The _codomain_ of a relation is ${\cod R = AR = \{aR\mid a\in A\}\subseteq B}$.

__Exercise__. _Show $\dom R = \cup_{b\in B}Rb$ and $\cod R = \cup_{a\in A} aR$_.

__Exercise__. _Show $R$ is a function if and only if $\dom R = A$ and $aR$ has
exactly one element for ${a\in A}$_.

A _partial function_ drops the requirement ${\dom f = A}$.
Every partial function can be turned into a function by selecting an element $\bot\not\in B$
and defining $f(a) = \bot$ for $a\not\in\dom f$.
Partial functions are quite common. For instance $f\colon\RR\to\RR$ by $f(x) = 1/x$ is
not defined at $x = 0$.

### Composition

Given relations $R\subseteq A\times B$ and $S\subseteq B\times C$ their
_composition_ ${SR = \{(a,c)\mid aRb\text{ and }bRc\text{ for some }b\in B\}}$.

This is closely related to the join operation in relational databases
which provides $(a,b,c)$.

__Exercise__. _Show if $R\subseteq A\times B$, $S\subseteq B\times C$, and
$T\subseteq C\times D$ then $T(RS) = (TR)S_.

This shows we can write $TRS$ unambiguously.

Given a set $A$ define the _diagonal_ $1_A = \{(a,a)\mid a\in A\}\subseteq A\times A$.

__Exercise__ _Show if $R\subseteq A\times B$ then $R1_A = R = 1_BR$_.

This shows every relation has a left and a right identity relation.

The _transpose_ of a relation $R\subseteq A\times B$ is
${R' = \{(b,a)\mid aRb\}\subseteq B\times A}$

__Exercise__. _Show $(SR)' = R'S'$ if $R\subseteq A\times B$ and $S\subseteq B\times C$_.

### Properties

Relations on $R = A\times A$ are classified by various properties.
A relation is _reflexive_ if $aRa$ for all $a\in A$.

__Exercise__. _Show $R$ is reflexive if and only if $1_A\subseteq R$_.

We can make any relation reflexive by taking its union with $1_A$.

A relation is _symmetric_ if $aRb$ implies $bRa$ for $a,b\in A$.

__Exercise__. _Show $R$ is symmetric if and only if $R = R'$_.

We can make any relation symmetric by taking the union with its transpose.

A relation is _transitive_ if $aRb$ and $bRc$ imply $aRc$.

__Exercise__. _Show $R$ is transitive if and only if $RR = R^2\subseteq R$_.

We can make any relation transitive by taking the union of all powers of $R$.
Define $R^+ = \cup_{n > 0} R^n$.

__Exercise__. _Show $R^+$ is transitive_.

An _equivalence relation_ is reflexive, symmetric, and transitive.

R+ cup R+' is still transitive.

They provide a weaker but more powerful abstraction than equality.
Equality is also an equivalence relation so it is stronger, but
equivalence relations are more powerful because they provide an
abstraction of equality useful for simplifying mathematics.

A prime example comes from set theory. Two sets are equal if and
only if they have the same elements. Two sets are equivalent
if and only if they have the same number of elements.
The number 3 is a succinct way of discussing all 3 element sets.

The set diagonal $1_A$ represents equality. An equivalence
relation fattens the skinny diagonal to blocks along the diagonal.


If $\sigma\colon I\to J$ we can define
$f^\sigma\colon X^J\to X^I$ by $(f^\sigma g)(i) = g(\sigma(i))$.


<!--
For example, an _array_ (or _vector_) is an exponential type $T^n$ where $T$ is a type and
$n$ is positive integer where we identify $n$ with the set ${0,1,\ldots,n-1}$
or $\{1,2,\ldots,n}$. A matrix is an exponential $T^{n\times m}$ where
$n\times m$ is the product.

A _tuple_ is a product type $t\in T_1\times\cdots\times T_n$ where $T_j$ are types.
We use $t[i]$ for the projection of the $i-th$ element.

__Exercise__. _If $T_i$ are all the same type then tuples correspond to arrays_.

_Hint_ $x[i]$ corresponds to $x(i)$.

For exponential types $Y^X$ define _evaluation_ $\epsilon\colon Y^X\times X\to Y$ by
$e(f, x) = f(x)$.

It is useful to promote functions on basic types to functions on complex types.
(And later to general types.)

For example, if $f\colon X\to Y$ is in $Y^X$ we can define
a vectorized version
$f^I\colon X^I\to Y^I$ by $(f^Ig)(i) = f(g(i)$ where $g\in X^I$.

We can also define vectorized versions
$f^{I\times I}\colon X^I\times Y^I\to (X\times Y)^I$ by $(f^{I\times J}(g,h)(i) = (g(i), h(i))$
for $g\in X^I$ and $h\in Y^I$.

This is a special case of if $\sigma\colon I\to J$ we can define
$f^\sigma\colon X^J\to X^I$ by $(f^\sigma g)(i) = g(\sigma(i))$
for $g\in X^J$. Note $f^\sigma g = g\circ\sigma$ is post composition with $\sigma$.
(Same base.)

__Exercise__. _Show vectorization is $I = J$ and $\sigma$ the identity function_.

???

A related construction is given $\sigma\colon J\to I$ 
we can define $f_\sigma I^X\to I^Y$
by $(f_\sigma g)(x) = \sigma(g(x))$ for $g\in I^X$.
(Same exponent.)

Binary function $f\colon X\times Y\to Z$ have matrix version
$f^{I\times J}\colon Z^{X\times Y}$\to Z^{I\times J}$
defined by $(f^{I\times J}g)(i, j) = f(g(i,j))$.
-->
