# Relation

\renewcommand{\dom}{\operatorname{dom}}
\renewcommand{\cod}{\operatorname{cod}}

A _relation_ on a sets $X$ and $Y$ is a subset $R\subseteq X\times Y$.
We write $xRy$ for $(x,y)\in R$.  
he _domain_ of a relation is $\dom R = \{x\in X:xRy\mathrm{\ for\ some\ }y\in Y\}$.
If $\pi_1\colon X\times Y\to X$ by $\pi_1(x,y) = x$ then $\pi_1(R) = \dom R\subseteq X$. 
The _codomain_, or _range_ of a relation is $\cod R = \{y\in Y:xRy\mathrm{\ for\ some\ }x\in X\}$.
If $\pi_2\colon X\times Y\to Y$ by $\pi_2(x,y) = y$ then $\pi_2(R) = \cod R\subseteq Y$.

A relation is a _function_ if for every $x\in X$ there exists exactly one $y\in Y$ with $xRy$.
In this case $\dom R = X$ and we write $xRy$ as $R(x) = y$. A function is
_injective_, or _one-to-one_, if $R(x) = R(x')$ imples $x = x'$, for $x,x'\in X$.
A function is _surjective_, or _onto_, if for all $y\in Y$ there exists $x\in X$ with $y = R(x)$.
A function is _bijective_ if it is both injective and surjective.

A relation is a _partial function_ if for every $x\in X$ there exists
at most one $y\in Y$ with $xRy$.  In this case we write $xRy$ as $R(x)
= y$ when $x\in\dom R$.  We can turn partial functions into functions
by introducing a special symbol $\perp\not\in S$, called _bottom_,
and extending $Y$ to $\overline{Y} = Y\cup\{\perp\}$.
Define $\overline{R}(x) = \perp$ when $x\not\in\dom R$ and $\overline{R}(\perp) = \perp$.

__Exercise__. _Show $\overline{R}\subseteq \overline{X}\time \overline{X}$ is a
function if $R\subseteq X\times Y$ is a partial function_.

The _transpose_, or _converse_, of the relation $R$ is the relation $R'\subseteq Y\times X$
defined by $yR'x$ if and only if $xRy$.
Obviously $\dom R' = \cod R$ and $\cod R' = \dom R$.
If both $R$ and $R'$ are functions we write $R' = R^{-1}$ and $R(x) = y$ if and only if
$R^{-1}(y) = x$.
If both $R$ and $R'$ are partial functions we write $R' = R^{\dashv}$ and $R(x) = y$ if and only if
$R^{\dashv}(y) = x$ when $x\in\dom R$ and $y\in\cod R$.

The _product_ of the relation
$R\subseteq X\times Y$ and the relation $S\subseteq Y\times Z$ 
is defined by $x(RS)z$ if and only if
there exists $y\in Y$ with $xRy$ and $ySz$. If $R$ and $S$ are functions then
the product is also a function and is called the _composition_.

__Exercise__. If $R$ and $S$ are functions show $(x,z)\in RS$ if and only if $z = S(R(x))$.

For $a,b,c\in S$ a relation $R$ is _reflexive_
if $aRa$, _symmetric_ if $aRb$ implies $bRa$, _antisymmetric_ if $aRb$
and $bRa$ imply $a = b$, and _transitive_ if $aRb$ and $bRc$ imply $aRc$
Let $I = I_S$ be the _identity_, or _diagonal_ relation $\{(a,a):a\in S\}$.

A relation $R$ is reflexive if $I\subseteq R$, symmetric if
$R' = R$, antisymetric if $R\cap R' = I$, and transitive if $R^2 =
RR \subseteq R$.

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

_Equivalence Relation_
  ~ reflexive, symmetric, and transitive
 
The common theme here is transitive. It's what makes an order an order.

A relation is _total_ either $aRb$ or $bRa$ for all $a,b\in S$.
A total relation satisfies $R\cup R' = S\times S$.

A relation is _directed_ if for every $a,b\in S$ there exists $c\in S$
with $aRc$ and $bRc$.

__Exercise__. _Total orders are directed_.

A _net_ is a directed poset.

An _equivalence relation_ partitions the set $S$ into
_cosets_ $[a] = \{b\in S:aRb\}$ and we write $S/R$ ($S$ _modulo_ $R$)
for the collection of all cosets.
The union of all cosets is $S$ and they are pairwise disjoint.

__Exercise__. _Show $a\in [a]$ for every $a\in S$_.

__Exercise__. _Show if $[a]\cap [b]\not=\emptyset$ then $[a] = [b]$.


# Remarks

Partial functions show up often without getting the recognition they
deserve.  For example, $f(x) = 1/x$ where $x$ is a real number is a
partial function with domain $x \not= 0$.
