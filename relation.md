# Relation

\renewcommand{\dom}{\operatorname{dom}}
\renewcommand{\cod}{\operatorname{cod}}

A _relation_ on a set $S$ is a subset $R\subseteq S\times S$. We write
$aRb$ for $(a,b)\in R$.  For $a,b,c\in S$ a relation $R$ is _reflexive_
if $aRa$, _symmetric_ if $aRb$ implies $bRa$, _antisymmetric_ if $aRb$
and $bRa$ imply $a = b$, and _transitive_ if $aRb$ and $bRc$ imply $aRc$

The _domain_ of a relation is $\dom R = \{a\in S:aRb\mathrm{\ for\ some\ }b\in S\}$.
If $\pi_1\colon S\times S\to S$ by $\pi_1(a,b) = a$ then $\pi_1(R) = \dom R$.

The _codomain_, or _range_ of a relation is $\cod R = \{b\in S:aRb\mathrm{\ for\ some\ }a\in S\}$.
If $\pi_2\colon S\times S\to S$ by $\pi_2(a,b) = b$ then $\pi_2(R) = \cod R$.

A relation is a _function_ if for every $a\in S$ there exists exactly one $b\in S$ with $aRb$.
In this case $\dom R = S$ and we write $aRb$ as $R(a) = b$.

A relation is a _partial function_ if for every $a\in S$ there exists
at most one $b\in S$ with $aRb$.  In this case we write $aRb$ as $R(a)
= b$ when $a\in\dom R$.  We can turn partial functions into functions
by introducing a special symbol $\perp\not\in S$, called _bottom_,
and extending $S$ to $\overline{S} = S\cup\{\perp\}$.
Define $\overline{R}(a) = \perp$ when $a\not\in\dom R$ and $\overline{R}(\perp) = \perp$.

__Exercise__. _Show $\overline{R}$ is a function if $R$ is a partial function_.

The _transpose_, or _converse_, of the relation $R$ is defined by $aR'b$ if and only if $bRa$.
Obviously $\dom R' = \cod R$ and $\cod R' = \dom R$.

If both $R$ and $R'$ are functions we write $R' = R^{-1}$ and $R(a) = b$ if and only if
$R^{-1}(b) = a$.

If both $R$ and $R'$ are partial functions we write $R' = R^{\dashv}$ and $R(a) = b$ if and only if
$R^{\dashv}(b) = a$ when $a\in\dom R$ and $b\in\cod R$.

__Exercise__. _If $R$ and $R'$ are partial functions show $\overline{R}^{-1} = \overline{R^{\dashv}}$_.

The _product_ of the relation $Q$ and $R$ is defined by $a(QR)b$ if and only if
there exists $c\in S$ with $aQc$ and $cRb$.

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

_Partial Order_
  ~ reflexive, antisymmetric, and transitive

_Equivalence Relation_
  ~ reflexive, symmetric, and transitive
 
The common theme here is transitive. It's what makes an order an order.

An _equivalence relation_ partitions the set $S$ into
_cosets_ $[a] = \{b\in S:aRb\}$. The union of all cosets is $S$ and they are pairwise disjoint.

__Exercise__. _Show $a\in [a]$ for every $a\in S$_.

__Exercise__. _Show if $[a]\cap [b]\not=\emptyset$ then $[a] = [b]$.


A relation is _total_ either $aRb$ or $bRa$ for all $a,b\in S$.
A total relation satisfies $R\cup R' = S\times S$.

A relation is _directed_ if it is transitive and for every $a,b\in S$ there exists $c\in S$
with $aRc$ and $bRc$.

__Exercise__. _Total orders are directed_.

# Remarks

Partial functions show up often without getting the recognition they
deserve.  For example, $f(x) = 1/x$ where $x$ is a real number is a
partial function with domain $x \not= 0$.
