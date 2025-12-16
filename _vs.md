---
title: Vector Spaces
author: Keith A. Lewis
---
\newcommand\bs[1]{\boldsymbol{{#1}}}
\newcommand\FF{\bs{F}}
\newcommand\CC{\bs{C}}
\newcommand\RR{\bs{R}}
\newcommand\zero{\bs{0}}
\newcommand{\dfn}[1]{\textit{#1}}

relation, cosets, 

functions, 1-1, onto, 1-1 correspondence

Let $\FF$ be a field and the <dfn>set exponential</dfn> ${\FF^I = \{x\colon I\to\FF\} = \{I\to\FF\}}$
be the set of all functions from the set $I$ to $\FF$.
Define <dfn>scalar multiplication</dfn> $\FF\times\FF^I\to\FF^I$
where ${(a,x)\mapsto ax = xa}$ by ${(ax)(i) = a(x(i)) = (xa)(i)}$ and <dfn>vector addition</dfn>
${\FF^I\times\FF^I\to\FF^I}$ where ${(x,y)\mapsto x + y}$ by
${(x + y)(i) = x(i) + y(i)}$, $i\in I$. We say these are defined <dfn>pointwise</dfn>
since $x,y\in\FF^I$ are equal if and only if $x(i) = y(i)$ for all $i\in I$.

__Exercise__. _Show $x + y = y + x$ for $x,y\in\FF^I$_.

_Hint_ Evaluate at $i\in I$ and use the fact field addition is commutative.

<details><summary>Solution</summary>
We have $(x + y)(i) = x(i) + y(i) = y(i) + x(i) = (y + x)(i)$ for all $i\in I$.
</details>

Define $\zero\in\FF^I$ by $\zero(i) = 0$ for $i\in I$. We write
$\zero^I$ to indicate the domain is $\FF^I$. Note
${\zero^I\not=\zero^J}$ if ${I\not=J}$.

__Exercise__. _Show $x + \zero = x$ for all $x\in\FF^I$_.

Define $-x\in\FF^I$ by $(-x)(i) = -x(i)$ for $x\in\FF^I$ and $i\in I$.

__Exercise__. _Show $-x = (-1)x$ and $x + (-x) = \zero$ for $x\in\FF^I$_.

This shows $\FF^I$ is an abelian group under vector addition with
additive identity $\zero$.

The <dfn>standard basis</dfn> of $\FF^I$ is the set of vectors $e_i\colon I\to\FF$
defined by $e_i(j) = 1(i = j)$, $i,j\in I$, where $1(i = j) = 1$ if $i = j$
and $1(i = j) = 0$ if $i\not=j$. This is also called the Kronecker delta $\delta_{ij} = 1(i = j)$.

__Exercise__. _Show $x = \sum_{i\in I} x(i) e_i$, $x\in\FF^I$, if $I$ is finite._

_Hint_. Compute $(\sum_{i\in I} x(i) e_i)(j) = \sum_{i\in I} x(i) e_i(j)$.

<details><summary>Solution</summary>
We have $(\sum_{i\in I} x(i) e_i)(j) = \sum_{i\in I} x(i) e_i(j) = 
\sum_{i\in I} x(i)1(i = j) = x(j)$.
</details>

This shows every $x\in\FF^I$ is a <dfn>linear combination</dfn> of the standard basis
vectors.

__Exercise__. _Show if $\sum_{i\in I} a_i e_i = \zero$ then $a_i = 0$ for all $i\in I$_.

_Hint_: Evaluate at $j\in I$.

Any set of vectors with this property is called <dfn>independent</dfn>

The _dual space_ of $\FF^I$ is $(\FF^I)^* = \FF^{e_I}$ where
$e_I = \{e_i\mid i\in I\}$. For $x\in\FF^I$ define $x^*\in\FF^{e_I}$
by $x^*(e_i) = x(i)$, $i\in I$.

__Exercise__. _Show $(ax)^* = ax^*$ and $(x + y)^* = x^* + y^*$ for $a\in\FF$, $x,y\in\FF^I$_.

__Exercise__. _Show $x^* = \zero$ implies $x = \zero$ for $x\in\FF^I$
and $(\FF^I)^* = \{x^*\mid x\in\FF^I\}$_.

Any function $T\colon\FF^I\to\FF^J$ satisfying $T(ax) = aTx$ and $T(x + y) = Tx + Ty$ is
called a _linear operator_.

The set exponential $\FF^I$ can be identifed with the cartesian product of $I$
copies of $\FF$.

Define _projections_ $e_i^*\colon\FF^I\to\FF$ by $e_i^*(x) = x(i)$.

__Exercise__. _Show if $p_i\colon V\to\FF$, $i\in I$, then there exists
$p\colon V\to\FF^I$ with $p_i = e_i^*p$._

_Hint_: Define $(pv)(i) = p_i(v)$ and note $(pv)(i) = e_i^*(pv)$.

<details><summary>Vector Space Axioms</summary>

Define $\zero\in\FF^I$ by $\zero(i) = 0$ for $i\in I$.

__Exercise__. _Show $0x = \zero$ for $x\in\FF^I$_.

__Exercise__. _Show $x + \zero = x = \zero + x$ for all $x\in\FF^I$_.

This shows $\zero$ is the _identity element_ for vector addition.

__Exercise__. _Show $x + y = y + x$ for $x, y\in\FF^I$_.

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



A _linear operator_ $T\colon\FF^I\to\FF^J$ is a function
satisfying $T(ax + y) = aT(x) + T(y)$, $a\in\FF$, $x,y\in\FF^I$.
The set of all such operators is denoted $[\FF^I\to\FF^J]$.
It is a vector space with scalar multiplication $(aT)(x) = a(T(x))$
and vector addition $(T + U)(x) = Tx + Ux$, $a\in\FF$, $x\in\FF^I$, $T,U\in[\FF^I\to\FF^J]$.

Since $e_i\in\FF^I$ we have $Te_i = \sum_{j\in I} (Te_i)(j)e_j$
and we define $t(i,j) = Te_i(j)\in\FF$.

If $T\colon\FF^I\to\FF^J$ and $S\colon\FF^J\to\FF^K$ then 

$\sigma\colon I\to J$ then $\circ\sigma\colon\FF^J\to\FF^I$ by $x\mapsto x\circ\sigma$.
