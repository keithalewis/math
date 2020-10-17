---
title: Relation
author: Keith A. Lewis
institute: KALX, LLC
classoption: fleqn
fleqn: true
---

\renewcommand{\dom}{\operatorname{dom}}
\renewcommand{\cod}{\operatorname{cod}}

Given the cartesian product of two sets $X\times Y = \{(x,y):x\in X, y\in Y\}$
the _left projection_ is $\lambda\colon X\times Y\to X$ by $\lambda(x,y) = x$
and the _right projection_ is $\rho\colon X\times Y\to Y$ by $\rho(x,y) = y$
for $x\in X$, $y\in Y$.

__Exercise__. _If $l\colon Z\to X$ and $r\colon Z\to Y$ are functions
show there exists a function $t\colon Z\to X\times Y$ with
$\lambda(t(z)) = l(z)$ and $\rho(t(z)) = r(z)$ for $z\in Z$_.
<details>
<summary>Solution</summary>
Define $t(z) = (l(z),r(z))\in X\times Y$ for $z\in Z$.
</details>

A _relation_ on a sets $X$ and $Y$ is a subset $R\subseteq X\times Y$.
We write $xRy$ for $(x,y)\in R$.
The _domain_ of a relation is $\dom R = \lambda(R) = \{\lambda(x,y):(x,y)\in R\}$.
The _codomain_, or _range_, of a relation is $\cod R = \rho(R) = \{\rho(x,y):(x,y)\in R\}$.
The _right coset_ of $x\in\dom R$ is $xR = \{y\in Y: xRy\}$
and the _left coset_ of $y\in\cod R$ is $Ry = \{x\in X: xRy\}$.

__Exercise__. _Show $xR = ?$ and $Ry = ?$_.

The _product_ of the relation $R\subseteq X\times Y$ and the relation
$S\subseteq Y\times Z$ is defined by $x(RS)z$ if and only if there exists
$y\in Y$ with $xRy$ and $ySz$.

__Exercise__. _Show $x(RS)z$ if and only if the intersection of $xR$ and $Sz$ is nonempty_.

Let $I_Z = \{(z,z):z\in Z\}\subseteq Z\times Z$ be the _identity_, or _diagonal_, relation on $Z$.

__Exercise__. _Show for any relation $R\subseteq X\times Y$ that
$I_XR = R$ and $RI_Y = R$_.


The _transpose_, or _converse_, of the relation $R\subseteq X\times Y$
is the relation $R' = \{(y,x):(x,y)\in R\} \subseteq Y\times X$.
Obviously $\dom R' = \cod R$ and $\cod R' = \dom R$.

__Exercise__. _Show for any relation $R\subseteq X\times Y$ that
$I_{\dom R} \subseteq RR'$ and $I_{\cod R} \subseteq R'R$_.

<details>
<summary>Solution</summary>
If $x\in\dom R$ then $(x,y)\in R$ for some $y\in Y$ so $(y,x)\in R'$ and $(x,x)\in RR'$.
A similar argument applies to $y\in\cod R$.
</details>

A _partial function_ is a relation $R$ with $xR$ having exactly one
element $y$ when $x\in\dom R$ so we can write $R(x) = y$.  If $\dom R =
X$ then $R$ is a _function_. Every partial function can be extended
to a function by introducing an element $\bot\not\in Y$ and defining
$\overline{R} = R\cup\{(x',\bot):x'\not\in\dom R\}\subseteq X\times
(Y\cup\{\bot\})$.

__Exercise__. _Show if $R$ is a partial function then $\overline{R}$ is a function_.
<details>
<summary>Solution</summary>
If $x\in\dom R$ then $x\overline{R} = xR$ has one element. If $x\not\in\dom R$
then $x\overline{R} = \{\bot\}$ has one element.
</details>

A relation $S\subseteq Y\times X$ is a _right inverse_ of $R$ if $RS = I_X$
and a _left inverse_ of $R$ if $SR = I_Y$.

A relation is _injective_, or _one-to-one_, if 

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
