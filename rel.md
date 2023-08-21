---
title: Relation
author: Keith A. Lewis
institute: KALX, LLC
classoption: fleqn
fleqn: true
abstract: Relation &ndash; comparing two things.
...

\newcommand{\dom}{\operatorname{dom}}
\newcommand{\cod}{\operatorname{cod}}
\newcommand{\coker}{\operatorname{coker}}

When are two things equivalent in some sense even if they are
not equal?  Is one thing bigger than another? Is it even possible to
compare them? Relations provide a systematic way to get insight into
these questions.  Partial functions are a special case of relations and
functions are a special case of partial functions.

## Relation

Given sets $X$ and $Y$ a _relation_ is a subset of the cartesian product
of $X$ and $Y$, $R\subseteq X\times Y$. We write $xRy$ if $(x,y)\in R$.
The _domain_ of a relation is $\dom R = \{x\in X\mid xRy\text{ for some }y\in Y\}$.
The _codomain_ of a relation is $\cod R = \{y\in Y\mid xRy\text{ for some }x\in X\}$.
The _left coset_ of $y\in Y$ is $Ry = \{x\in X: xRy\}$.
The _right coset_ of $x\in X$ is $xR = \{y\in Y: xRy\}$.

__Exercise__. _Show $\dom R = \cup_{y\in Y} Ry$ and $\cod R = \cup_{x\in X} xR$_.

<!--
It is equivalent to think of relations as a function $R\colon X\times Y\to\{0,1\}$
where $R(x,y) = 0$ if $(x,y)\notin R$ and $R(x,y) = 1$ if $(x,y)\in R$.
Writing $2$ for $\{0,1\}$, $R\colon X\times Y\to 2$.
It is equivalent to think of a relation as a function $R,\colon X\to (Y\to 2)$
where $R,(x)\colon Y\to 2$ by $R,(x)(y) = R(x,y)$. This is called _currying_.
The notation $R,$ is non-standard.
-->

### Composition

If $R\subseteq X\times Y$ and $S\subseteq Y\times Z$ are relations define
the _composition_ $SR\subseteq X\times Z$ by
$x(SR)z$ if there exists $y\in Y$ with $xRy$ and $ySz$.
It may seem more natural to denote the composition by $RS$ instead
of $SR$, and you would be right, but that is not the usual mathematical convention.

__Exercise__. _Show $x(SR)z$ if and only if the intersection of the cosets $xR$ and $Sz$ is nonempty_.

Composition is closely related to the E. F. Codd definition of the _join_ of two relations.
The join of $R$ and $S$ on $Y$ is $\{(x,y,z)\mid xRy\text{ and } ySz\text{ for some }y\in Y\}$.

### Transpose

The _transpose_ of a relation $R\subseteq X\times Y$
is the relation $R'\subseteq Y\times X$ defined by $yR'x = xRy$, $x\in X$, $y\in Y$.

__Exercise__. _If $R$ is a relation on $X\times Y$ and $S$ is
a relation on $Y\times Z$ then $(SR)' = R'S'$_.

### Associative

Composition is _associative_.

__Exercise__. _If $R\subseteq X\times Y$, $S\subseteq Y\times Z$,
and $T\subseteq Z\times W$ then $(TS)R = T(SR)$_.

### Identity

If $X$ is a set then the _identity_ relation is $I_X = I = \{(x,x)\mid x\in X\$}.

__Exercise__. _If $R\subseteq X\times Y$ is a relation then $RI_X = R$_.

__Exercise__. _If $T\subseteq W\times X$ is a relation then $I_XT = T$_.

## Properties

We say $R$ is a relation on $X$ if $R\subseteq X^2 = X\times X$.
A relation on $X$ is _transitive_ if $xRy$ and $yRz$ implies $xRz$, $x,y,z\in X$.
Transitivity is the basic notion of _ordering_.

__Exercise__. _$R$ is transitive if and only if $R^2 = RR\subseteq R$_.

Since composition is associative, the set of all transitive relations is a _semigroup_.

Given a set $X$ let $I^X = \{(x,x)\mid x\in X\}$. We write $I$ for $I^X$ if $X$ is clear
from the context.

__Exercise__. _Show $I$ is transitive_.

__Exercise__. _Show $RI = R = IR$ for any relation $R$_.

This shows the set of transitive relations on a set $X$ is a monoid with identity $I$.

A relation on $X$ is _reflexive_ if $xRx$, $x\in X$.

__Exercise__. _$R$ is reflexive if and only if $I\subseteq R$_.

A relation on $X$ is _symmetric_ if $xRy$ implies $yRx$, $x,y\in X$.

__Exercise__. _A relation on $X$ is _symmetric_ if and only if $R' = R$_.

A relation that is reflexive, symmetric, and transitive is an _equivalence_ relation.

__Exercise__. _If $R$ is an equivalence relation then the left and
right cosets ${\{xR\mid x\in X\}
= \{Ry\mid y\in Y\}}$ are a partition of $X$._

This is how to mathematically model equivalent but not equal things.

_Hint_: A _partition_ of a set is a collection of pairwise disjoint
subsets with union equal to the set.

<!--

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

__Exercise__. _Show for any relations $R\subseteq X\times Y$, $X\subseteq Y\times Z$,
and $T\subseteq Z\times W$ that $(TS)R = T(SR)$_.

Composition is associative. 

_Rel_ is the _category_ where the objects are sets and the arrows are relations.

The _transpose_, or _converse_, of the relation $R\subseteq X\times Y$
is the relation $R' = \{(y,x):(x,y)\in R\} \subseteq Y\times X$.
Obviously $\dom R' = \cod R$ and $\cod R' = \dom R$.

__Exercise__. _Show for any relation $R\subseteq X\times Y$ that
$I_{RY} \subseteq R'R$ and
$I_{XR} \subseteq RR'$_.

<details>
<summary>Solution</summary>

If $x\in RY$ then $(x,y)\in R$ for some $y\in Y$ so $(y,x)\in R'$ and $(x,x)\in RR'$.
A similar argument applies to $y\in XR$.

</details>

If $RS = I_S$ then $R$ is a _left inverse_, or _retract_, of $X$
and $X$ is a _right inverse_, or _section_, of $R$.

__Exercise__. _If $R\subseteq X\times Y$ has a section show $UR = VR$ implies $U = V$ for any $U,V\in Z\times X$_.

A relation satifying right cancellation is called _mono_.

__Exercise__. _Find a relation that is mono but does not have a section_.

__Exercise__. _If $S\subseteq Y\times Z$ has a retract show $SU = SV$ implies $U = V$ for any $U,V\in Z\times X$_.

A relation satifying _left cancellation_ is called _epi_.

__Exercise__. _Find a relation that is epi but does not have a retract_.

If $RS = I_S$ and $SR = I_R$ then $R$ is _invertible_ with _inverse_ $S$. Likewise, $S$ is
invertible with inverse $R$. A relation that is both epi and mono is called _iso_.

__Exercise__. _Show inverses are unique_.
<details>
<summary>Solution</summary>

If $S$ and $T$ are inverses of $R$ then $S = S(RT) = (SR)T = T$. 

</details>

A _partial function_ is a relation $R\subseteq X\times Y$ where $xR$ has exactly one
element $y\in Y$ when $x\in RY$ so we can unambiguously write $R(x) = y$ for $xRy$.
Partial functions use $R\colon X\hookrightarrow Y$ instead of $R\subseteq X\times Y.
A _function_ is a partial function with $RY = X$ and we write $R\colon X\to Y$.

Every partial function can be extended to a function by introducing an
element $\bot\not\in Y$ and defining
$\underline{R} = R\cup((X\setminus RY)\times \{\bot\})\subseteq R\times (S\cup\{\bot\})$.

__Exercise__. _Show if $R$ is a partial function then $\underline{R}$ is a function_.
<details>
<summary>Solution</summary>

If $x\in RY$ then $x\overline{R} = xR$ has one element. If $x\not\in RY$
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


### Lattice Structure

Relations on $X\times X$ are ordered by set inclusion. If $R\subset S$
then $RT\subset ST$ and $TR\subset TS$ for any $T\subseteq X\times X$.
This shows $(R\cap S)T \subseteq RT\cap ST$ and $T(R\cap S) \subseteq TR\cap TS$.
Similarly $(R\cup S)T \supseteq RT\cup ST$ and $T(R\cup S) \supseteq TR\cup TS$.

This shows $(R\cap I)S \subseteq RS \cap S$ and $(R\cup I)S \supset RS\cup R$
so $(R\cup I)R\supseteq R^2\cup R$.

If $R,S,T\subseteq X\times X$ then $(R\cup S)T \subseteq RT\cup ST$
since $(R\cup S)T \supseteq RT$ and $(R\cup T)\supset

A relation $R\subseteq X\times X$ is _transitive_ if $R^2\subseteq R$, that is,
$xRy$ and $yRz$ imply $xRz$ for $x,y,z\in X$.

A relation $R\subseteq X\times X$ is _reflexive_ if $I_X\subseteq R$, that is,
$xRx$ for all $x\in X$.

__Exercise__. _If $R,S\subseteq X\times X$ then $(R\cup I)S = (RS)\cup I = R(I\cup S)$_.

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
-->
