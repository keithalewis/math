---
title: Relation
author: Keith A. Lewis
institute: KALX, LLC
classoption: fleqn
fleqn: true
abstract: Relation &ndash; comparing two things.
...

\renewcommand{\dom}{\operatorname{dom}}
\renewcommand{\cod}{\operatorname{cod}}

The notion of a _relation_ is a fundamental concept of mathematics. Given
two things are they equivalent in some sense even if they are not
equal?  Is one bigger than the other? Is it even possible to compare
them? Relations provide a systematic way to get insight into these questions.
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
and the relation $S\subseteq Y\times Z$ is $SR\subseteq X\times Z$ defined
by $x(SR)z$ if and only if there exists $y\in Y$ with $xRy$ and $ySz$.

The _right coset_ of $x\in\dom R$ is $xR = \{y\in Y: xRy\}$
and the _left coset_ of $y\in\cod R$ is $Ry = \{x\in X: xRy\}$.

The _kernel_ of a relation is $\ker R = \{(x,x')\in X\times X:xR = x'R\}\subseteq X\times X$.
The _cokernel_ of a relation is $\coker R = \{(y,y')\in Y\times Y:Ry = Ry'\}\subseteq Y\times Y$.

__Exercise__. _Show $x(SR)z$ if and only if the intersection of the cosets $xR$ and $Sz$ is nonempty_.

Let $I_Z = \{(z,z):z\in Z\}\subseteq Z\times Z$ be the _identity_, or _diagonal_, relation on $Z$.

__Exercise__. _Show for any relation $R\subseteq X\times Y$ that
$I_XR = R$ and $RI_Y = R$_.

The identity element for composition is $I$.

__Exercise__. _Show if $J\subseteq X\times X$ and $JR = R$ for all $R\subseteq X\times Y$
then $J = I_X$_.
<details>
<summary>Solution</summary>

If $R = I_X$ then $J = JI_X = I_X$.

</details>

__Exercise__. _Show if $J\subseteq Y\times Y$ and $RJ = R$ for all $R\in X\times Y$
then $J = I_Y$_.

The identity element is unique.

__Exercise__. _Show for any relations $R\subseteq X\times Y$, $S\subseteq Y\times Z$,
and $T\subseteq Z\times W$ that $(TS)R = T(SR)$_.

Composition is associative. 

_Rel_ is the _category_ where the objects are sets and the arrows are relations.

The _transpose_, or _converse_, of the relation $R\subseteq X\times Y$
is the relation $R' = \{(y,x):(x,y)\in R\} \subseteq Y\times X$.
Obviously $\dom R' = \cod R$ and $\cod R' = \dom R$.

__Exercise__. _Show for any relation $R\subseteq X\times Y$ that
$I_{\dom R} \subseteq R'R$ and
$I_{\cod R} \subseteq RR'$_.

<details>
<summary>Solution</summary>

If $x\in\dom R$ then $(x,y)\in R$ for some $y\in Y$ so $(y,x)\in R'$ and $(x,x)\in RR'$.
A similar argument applies to $y\in\cod R$.

</details>

If $RS = I$ then $R$ is a _left inverse_, or _retract_, of $S$
and $S$ is a _right inverse_, or _section_, of $R$.

__Exercise__. _If $R\subseteq X\times Y$ has a section show $UR = VR$ implies $U = V$ for any $U,V\in Z\times X$_.

A relation satifying right cancellation is called _mono_.

__Exercise__. _Find a relation that is mono but does not have a section_.

__Exercise__. _If $S\subseteq Y\times Z$ has a retract show $SU = SV$ implies $U = V$ for any $U,V\in Z\times X$_.

A relation satifying _left cancellation_ is called _epi_.

__Exercise__. _Find a relation that is epi but does not have a retract_.

If $RS = I$ and $SR = I$ then $R$ is _invertible_ with _inverse_ $S$. Likewise, $S$ is
invertible with inverse $R$. A relation that is both epi and mono is called _iso_.

__Exercise__. _Show inverses are unique_.
<details>
<summary>Solution</summary>

If $S$ and $T$ are inverses of $R$ then $S = S(RT) = (SR)T = T$. 

</details>

A _partial function_ is a relation $R\subseteq X\time Y$ where $xR$ has exactly one
element $y\in Y$ when $x\in\dom R$ so we can unambiguously write $R(x) = y$ for $xRy$.
A _function_ is a partial function with $\dom R = X$.

Every partial function can be extended
to a function by introducing an element $\bot\not\in Y$ and defining
$\overline{R} = R\cup\{(x',\bot):x'\not\in\dom R\}\subseteq X\times
(Y\cup\{\bot\})$.

__Exercise__. _Show if $R$ is a partial function then $\overline{R}$ is a function_.
<details>
<summary>Solution</summary>

If $x\in\dom R$ then $x\overline{R} = xR$ has one element. If $x\not\in\dom R$
then $x\overline{R} = \{\bot\}$ has one element.

</details>

__Exercise__. If $R$ and $S$ are (partial) functions show $(x,z)\in RS$ if and only if $S(R(x)) = z$.

A mono (partial) function is called _injective_, or _one-to-one_,
and an epi (partial) function is called _surjective_, or _onto_.

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

__Exercise__. _If $R,S\subseteq X\times X$ then $(R\cup I)S = (RS)\cup I = R(I\cup S)$

Adding the diagonal to any relation makes it reflexive.

__Exercise__. _If $R$ is transitive then $R\cup I$ is also transitive_.
<details>
<summary>Solution</summary>

We have $(R\cup I)(R\sup I) = (R(R\cup I)\cup I$ = (RR)\cup I\subseteq R\cup I$.

</details>

A relation that is transitive and reflexive is called a _preorder_.
 
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

A _net_ is a directed poset. They can be used to define limits.

If $N$ is a net and $f_\nu\colon X\to X$ where $X$ is any topological space
then $\lim_{\nu\in N} f_\nu(x) = y$ if and only if for every neighborhood $U$
of $y$ there exists $\nu_0\in N$ such that
$f_\nu(x)\in U$ when $\nu\ge\nu_0$.

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
