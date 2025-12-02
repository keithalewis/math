---
title: Vector Spaces
author: Keith A. Lewis
---
\newcommand\bs[1]{\boldsymbol{{#1}}}
\newcommand\FF{\bs{F}}
\newcommand\CC{\bs{C}}
\newcommand\RR{\bs{R}}
\newcommand\zero{\bs{0}}

relation, cosets, 

functions, 1-1, onto, 1-1 correspondence

Let $\FF$ be a field and the set exponential ${\FF^I = \{x\colon I\to\FF\} = \{I\to\FF\}}$
be the set of all functions from the set $I$ to the field. 
Define scalar multiplication $\FF\times\FF^I\to\FF^I$
where ${(a,x)\mapsto ax = xa}$ by ${(ax)(i) = a(x(i)) = (x(i))a}$ and vector addition
${\FF^I\times\FF^I\to\FF^I}$ where ${(x,y)\mapsto x + y}$ by
${(x + y)(i) = x(i) + y(i)}$, $i\in I$.

<details><summary>Vector Space Axioms</summary>

Define $\zero\in\FF^I$ by $\zero(i) = 0$ for $i\in I$.

__Exercise__. _Show $0x = \zero$ for $x\in\FF^I$_.

__Exercise__. _Show $x + \zero = x = \zero + x$ for all $x\in\FF^I$_.

This shows $\zero$ is the _identity element_ for vector addition.

__Exercise__. _Show $x + y = y + x$ for $x, y\in\FF^I_.

Vector addition is commutative.

__Exercise__. _Show $(a + b)x = ax + bx$ and $a(x + y) = ax + ay$ for $a,b\in\FF$ and $x,y\in\FF^I$_.

_Hint_. Consider $(a + b)x(i)$ and $a(x + y)(i)$.

This establishes the _distributive laws_ satisfied by scalar multiplication and vector addition.

__Exercise__. _Show $-x = -1x$ satisfies $x + (-x) = \zero$_.

_Hint_. Consider $x + (-x) = 1x + (-1x) = (1 + (-1))x$.

This shows $-x$ is the _additive inverse_ of $x\in\FF^I$
and vector addition is a commutative group.

__Exercise__. _Show $a(bx) = (ab)x$ for $a,b\in\FF$, $x\in\FF^n$_.

_Hint_: Use the fact multiplication is associative in $\FF$.

</details>

## Abstract Vector Space

Any set $V$ with a scalar multiplication and
vector addition satisfying 
the above axioms is a vector space. We will eventually prove
every vector space is isomorphic to $\FF^I$ for some set $I$
but proofs involving only the axioms are more insightful.

The _standard basis_ of $F^I$ is the set of vectors $e_i\colon I\to\FF$
defined by $e_i(j) = 1(i = j)$, $i,j\in I$, where $1(i = j) = 1$ if $i = j$
and $1(i = j) = 0$ if $i\not=j$. This is also called the Kronecker delta $\delta_{ij}$.

__Exercise__. _Show $x = \sum_{i\in I} x(i) e_i$, $x\in\FF^I$ if $I$ is finite._

_Hint_. Compute $(\sum_{i\in I} x(i) e_i)(j) = \sum_{i\in I} x(i) e_i(j)$.

$\FF^I$ can be identifed with the cartesian product of $I$
copies of $\FF$.

Define _projections_ $e_i^*\colon\FF^I\to\FF$ by $\e_i^*(x) = x(i)$.

__Exercise__. _Show if $p_i\colon V\to\FF$, $i\in I$, then there exists
$p\colon V\to\FF^I$ with $p_i = e_i^*p$._

_Hint_: Define $(pv)(i) = p_i(v)$ and note $(pv)(i) = e_i^*(pv)$.

??? R^I iso to \Pi_i R ???


A _linear operator_ $T\colon\FF^I\to\FF^J$ is a function
satisfying $T(ax + y) = aT(x) + T(y)$, $a\in\FF$, $x,y\in\FF^I$.
The set of all such operators is denoted $[\FF^I\to\FF^J]$.
It is a vector space with scalar multiplication $(aT)(x) = a(T(x))$
and vector addition $(T + U)(x) = Tx + Ux$, $a\in\FF$, $x\in\FF^I$, $T,U\in[\FF^I\to\FF^J]$.

Since $e_i\in\FF^I$ we have $Te_i = \sum_{j\in I} (Te_i)(j)e_j$
and we define $t(i,j) = Te_i(j)\in\FF$.

If $T\colon\FF^I\to\FF^J$ and $S\colon\FF^J\to\FF^K$ then 

$\sigma\colon I\to J$ then $\circ\sigma\colon\FF^J\to\FF^I$ by $x\mapsto x\circ\sigma$.
