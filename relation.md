---
title: Relation
author: Keith A. Lewis
institute: KALX, LLC
classoption: fleqn
fleqn: true
---

\renewcommand{\dom}{\operatorname{dom}}
\renewcommand{\cod}{\operatorname{cod}}

The notion of a _relation_ is a fundamental concept of mathematics. Given
two things are they equivalent in some sense even if they are not
equal?  Is one "bigger" than the other? Is it even possible to compare
them? Relations provide a systematic way to get insights into these questions.
Partial functions are special cases of relations and functions are
special cases of partial functions.

Given two things in the cartesian product $X\times Y = \{(x,y):x\in X, y\in Y\}$
the _left projection_ is the first thing $\lambda\colon X\times Y\to X$ by $\lambda(x,y) = x$
and the _right projection_ is the second thing $\rho\colon X\times Y\to Y$ by $\rho(x,y) = y$.

__Exercise__. _If $l\colon Z\to X$ and $r\colon Z\to Y$ are functions
show there exists a function $t\colon Z\to X\times Y$ with
$\lambda(t(z)) = l(z)$ and $\rho(t(z)) = r(z)$ for $z\in Z$_.
<details>
<summary>Solution</summary>
Define $t(z) = (l(z),r(z))\in X\times Y$ for $z\in Z$.
Any set for which such $t$ exists is in one-to-one correspondence with the cartesian product of $X$ and $Y$.
</details>

A _relation_ between sets $X$ and $Y$ is a subset $R\subseteq X\times Y$ and
we write $xRy$ for $(x,y)\in R$.
The _domain_ of a relation is $\dom R = \lambda(R) = \{\lambda(x,y):(x,y)\in R\}$
and the _codomain_, or _range_, of a relation is $\cod R = \rho(R) = \{\rho(x,y):(x,y)\in R\}$.
The _product_, or _composition_, of the relation $R\subseteq X\times Y$
and the relation $S\subseteq Y\times Z$ is $RS\subseteq X\times Z$ defined
by $x(RS)z$ if and only if there exists $y\in Y$ with $xRy$ and $ySz$.
Let $I_Z = \{(z,z):z\in Z\}\subseteq Z\times Z$ be the _identity_, or _diagonal_, relation on $Z$.

The _right coset_ of $x\in\dom R$ is $xR = \{y\in Y: xRy\}$
and the _left coset_ of $y\in\cod R$ is $Ry = \{x\in X: xRy\}$.

__Exercise__. _Show $x(RS)z$ if and only if the intersection of the cosets $xR$ and $Sz$ is nonempty_.

__Exercise__. _Show for any relation $R\subseteq X\times Y$ that
$I_XR = R$ and $RI_Y = R$_.

The identity element for composition is $I$.

__Exercise__. _Show if $J\subseteq X\times X$ and $JR = R$ for all $R\in X\times Y$
then $J = I_X$_.
<details>
<summary>Solution</summary>
If $R = I_Y$ then $J = JI_Y = I_Y$.
</details>

__Exercise__. _Show if $J\subseteq Y\times Y$ and $RJ = R$ for all $R\in X\times Y$
then $J = I_Y$_.

The identity element is unique.

__Exercise__. _Show for any relations $R\subseteq X\times Y$, $S\subseteq Y\times Z$,
and $T\subseteq Z\times W$ that $(RS)T = R(ST)$_.

Composition is associative. Relations are a _category_.

The _transpose_, or _converse_, of the relation $R\subseteq X\times Y$
is the relation $R' = \{(y,x):(x,y)\in R\} \subseteq Y\times X$.
Obviously $\dom R' = \cod R$ and $\cod R' = \dom R$.

__Exercise__. _Show for any relation $R\subseteq X\times Y$ that
$I_{\dom R} \subseteq RR'$ and
$I_{\cod R} \subseteq R'R$_.

<details>
<summary>Solution</summary>
If $x\in\dom R$ then $(x,y)\in R$ for some $y\in Y$ so $(y,x)\in R'$ and $(x,x)\in RR'$.
A similar argument applies to $y\in\cod R$.
</details>

A relation $S\subseteq Y\times X$ is a
_right partial inverse_, or _partial section_ of $R$ if $I_{\dom R} = RS$
and a _left partial inverse_, or _partial retract_, of $R$ if $I_{\cod R} = SR$

A _partial function_ is a relation $R$ where $xR$ has exactly one
element $y\in Y$ when $x\in\dom R$ so we can unambiguously write $R(x) = y$
for $xRy$.

__Exercise__. _If $R$ is a partial function having a partial retract $S$
then $R(x) = R(x')$ implies $x = x'$ for $x,x'\in\dom R$_.
<details>
<summary>Solution</summary>
If $R(x) = R(x')$ for $x,x'\in X$ then $x = SR(x) = SR(x') = x'$.
</details>

A partial function is _injective_ if R(x) = R(x')$ implies $x = x'$ for $x,x'\in\dom R$.
Injective partial functions don't send different things to the same thing.

__Exercise__. If $R\subseteq X\times Y$ is an injective partial function then it has a partial retract_.
<details>
<summary>Solution</summary>
Let $S = \{(R(x), x):x\in\dom R\}\subseteq Y\times X$.
Claim: SR = I_domR$.

(x',x) in SR iff x'Sy and yRx for some y.
ySx iff y = R(x)
</details>




If $\dom R = X$ then $R$ is a _function_. Every partial function can be extended
to a function by introducing an element $\bot\not\in Y$ and defining
$\overline{R} = R\cup\{(x',\bot):x'\not\in\dom R\}\subseteq X\times
(Y\cup\{\bot\})$.

__Exercise__. _Show if $R$ is a partial function then $\overline{R}$ is a function_.
<details>
<summary>Solution</summary>
If $x\in\dom R$ then $x\overline{R} = xR$ has one element. If $x\not\in\dom R$
then $x\overline{R} = \{\bot\}$ has one element.
</details>


__Exercise__. _If a partial function $R\subseteq X\times Y$ has a partial left inverse show
$R(x) = R(x')$ for $x, x'\in\dom R$ implies $x = x'$_.
<details>
<summary>Solution</summary>
If $R$ has partial left inverse $S$ then $SR = I_{\dom R}$ and $R(x) = R(x')$ implies $x = SR(x) = SR(x') = x'$
for $x,x'\in\dom R$.
</details>

__Exercise__. _If a partial function $R\subseteq X\times Y$ has a partial right inverse show
for every $y\in\cod R$ there exists $x\in\dom R$ with $R(x) = y$_.
<details>
<summary>Solution</summary>
If $R$ has partial right inverse $S$ then $RS = I_{\cod R}$ and $y(RS)y$ for $y\in\cod R$
and there exists $x\in X$ with $yRx$ and $xSy$.
</details>

A partial function is _injective_, or _one-to-one_, if $R(x) = R(x')$ implies $x = x'$.

__Exercise__. _Show every injective partial function has a left inverse_.

A relation is a _function_ if for every $x\in X$ there exists exactly one $y\in Y$ with $xRy$.
In this case $\dom R = X$ and we write $xRy$ as $R(x) = y$. A function is
_injective_, or _one-to-one_, if $R(x) = R(x')$ imples $x = x'$, for $x,x'\in X$.
A function is _surjective_, or _onto_, if for all $y\in Y$ there exists $x\in X$ with $R(x) = y$.
A function is _bijective_ if it is both injective and surjective.

A relation is a _partial function_ if for every $x\in X$ there exists
at most one $y\in Y$ with $xRy$.  In this case we write $xRy$ as $R(x)
= y$ when $x\in\dom R$.  We can turn partial functions into functions
by introducing a special symbol $\bot\not\in Y$, called _bottom_,
and extending $Y$ to $\overline{Y} = Y\cup\{\perp\}$.
Define $\overline{R}(x) = y$ if $(x,y)\in R$ and $\overline{R}(x) = \perp$ when $x\not\in\dom R$.

__Exercise__. _Show $\overline{R}\subseteq X\times \overline{Y}$ is a
function if $R\subseteq X\times Y$ is a partial function_.


__Exercise__. If $R$ and $S$ are (partial) functions show $(x,z)\in RS$ if and only if $S(R(x)) = z$.


__Exercise__. _Show a function has a left inverse if and only if it is injective_.
<details>
<summary>Solution</summary>
If $R$ has a left inverse $S$ then $SR = I$. If $R(x) = R(x')$ then $x = SR(x) = SR(x') = x'$.
If $R$ is injective then $R'$ is a left inverse.
</details>

__Exercise__. _Show a function has a right inverse if and only if it is surjective_.
<details>
<summary>Solution</summary>
If $R$ has a left inverse $S$ then $SR = I$. If $R(x) = R(x')$ then $x = SR(x) = SR(x') = x'$.
</details>

A relation $R$ on $X\times X$ is _reflexive_
if $xRx$ for $x\in X$, _symmetric_ if $xRy$ implies $yRx$ for $x,y\in X$,
_antisymmetric_ if $xRy$ and $yRx$ imply $x = y$ for $x,y\in X$,
and _transitive_ if $xRy$ and $yRz$ imply $xRz$

__Exercise__. _Show
a relation $R$ is reflexive if $I\subseteq R$, symmetric if
$R' = R$, antisymetric if $R\cap R' = I$, and transitive if
$RR \subseteq R$_.

__Exercise__. _An antisymmetric relation is reflexive_.

__Exercise__. _Find a symmetric relation that is not reflexive_.

__Exercise__. _If $R$ is both symmetric and antisymmetric then $R = I$_.

The most common categories of relations are

_Preorder_
  ~ reflexive and transitive
 
_Weak Partial Order_
  ~ antisymmetric and transitive

_Partial Order_ (poset)
  ~ reflexive, antisymmetric, and transitive

The common theme here is transitive. It's what makes an order an order.
The _transitive closure_ of any relation $R$ is $R^*$ where
$xR^*y$ if and only if $xR^ny$ for some positive integer $n$.

__Exercise__. _Show the transitive closure of any relation is transitive_.

_Equivalence Relation_
  ~ reflexive, symmetric, and transitive
 

A relation is _total_ either $xRy$ or $yRx$ for all $x,y\in X$.

__Exercise__. _Show a total relation satisfies $R\cup R' = X\times X$_.

A relation is _directed_ if for every $x,y\in X$ there exists $z\in X$
with $xRz$ and $yRz$.

__Exercise__. _Total orders are directed_.

A _net_ is a directed poset.

An _equivalence relation_ partitions the set $X$ into
_cosets_ $x/R = \{y\in X:xRy\}$ and we write $X/R$ ($X$ _modulo_ $R$)
for the collection of all cosets.
The union of all cosets is $X$ and cosets are pairwise disjoint.

__Exercise__. _Show $x\in x/R$ for every $x\in X$_.

__Exercise__. _Show if $x/R\cap y/R\not=\emptyset$ then $x/R = y/R$.

# Remarks

Partial functions show up often without getting the recognition they
deserve.  For example, $f(x) = 1/x$ where $x$ is a real number is a
partial function with domain $x \not= 0$.
