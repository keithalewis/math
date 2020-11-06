---
title: Linear Algebra
author: Keith A. Lewis
institute: KALX, LLC
classoption: fleqn
fleqn: true
abstract: A guide to Linear Algebra.
...

\newcommand\ran{\operatorname{ran}}
\newcommand\span{\operatorname{span}}


This is not a beginners guide to linear algebra. It is a breviloquent
collection of pertinent facts about vector spaces and the linear
transformations between them.  Although it is complete and self-contained
you should already be familiar with basic linear algebra before reading
this. Statements and proofs are concise, so read them twice.  Do the
exercises to confirm your understanding.

I make no apologies for the shamelessly mathematical exposition and hope
it engenders an appeciation for the thrill of literally 'doing the math'
to unequivocally establish absolute truth.

## Introduction

Vector spaces occupy a sweet spot in the menagerie of mathematical
structures.  They are completely classified up to _isomorphism_ by their
_dimension_.  A _vector space_ is an _abelian group_ with a _scalar
multiplication_ that satisfies a _distributive law_ with respect
to the vector addition. A vector is
not just a list of numbers, it is a mathematical object that satisfies
these axioms.
For example, _functions_
are vectors and _linear transformations_ between vector spaces are
also vectors.

A linear transformation is a function between vector spaces that preserves
the vector space structure. They are completely classified 
up to _similarity_
for finite dimensional vector spaces
by their _eigenvalues_ and the _multiplicity_ of each eigenvalue

<!--
Linear transformations from a finite dimensional vector space to
itself are categorized up to _similariy_ by a list of _eigenvalues_
together with their _multiplicities_. Each eigenvalue and multiplicity
is associated with an _invariant subspace_ having dimension equal to
the multiplicity.  If the multiplicity is 1 then $Tv = \lambda v$ where
$v$ is an eigenvector corresponding to the eigenvalue $\lambda$.  We can
write this as $(T - \lambda I)v = 0$ where $I$ is the _identity operator_.
The associated invariant subspace is spanned by $v$.  If the multiplicity
is $m$ then $(T - \lambda I)^m v = 0$ for the generalized eigenvector $v$
and $(T - \lambda I)^k v\not= 0$ for $k < m$.  The associated invariant
subspace is spanned by $v$, $Tv$, \ldots, $T^{m-1}v$.

This probably makes no sense to you at this point, but it describes the
Jordan canonical form of a linear transformation. After you master the
following material these statements will become completely obvious.
-->

## Vector Space

The ingredients of a _vector space_ are a set $V$ of vectors and a binary
addition that satisfies the abelian group axioms:

_Associative_
  ~ $x + (y + z) = (x + y) + z$ for $x,y,z\in V$.

_Commutative_
  ~ $x + y = y + x$ for $x,y\in V$.  

_Identity_
  ~ There is a $0\in V$ with $x + 0 = x$ for $x\in V$.  

_Inverse_
  ~ Every vector has an additive inverse $-x$ with $x + (-x) = 0$.  

A vector space also specifies a _field_ of _scalars_ $\bm{F}$ (usually
the real $\bm{R}$ or complex $\bm{C}$ numbers) and a scalar
multiplication that satisfies

_Distributive_
  ~ $\alpha (x + y) = \alpha x + \alpha y$, for $\alpha\in\bm{F}$ and $x,y\in V$.

__Lemma__. _For any vector $x$, $x + x = x$ implies $x = 0$_.
$$
\begin{aligned}
	x + x &= x & & \\
	(x + x) + (-x) &= x + (-x) &\mathrm{substitution} \\
	x + (x + (-x)) &= x + (-x) &\mathrm{associative} \\
	x + 0 &= 0 &\mathrm{inverse} \\
	x &= 0 &\mathrm{identity} \\
\end{aligned}
$$

By _substitution_ we mean that if $P(x)$ is a logical statement
containing the symbol $x$ we can replace each occurence of $x$ by any other
symbol $y$, $x\mapsto y$, as long as $y$ does not occur in $P(x)$.
Using the true statement $a = b \Rightarrow a + c = b + c$ we make the
substitutions $a \mapsto x + x$, $b \mapsto x$, and $c \mapsto (-x)$
then use modus ponens.

__Exercise__. _Show the additive identity is unique_.

_Hint_. If $0'$ is another identity then $0 = 0 + 0'$. Your proof can be
used for any group, abelian or not.

__Exercise__. _Show for $x\in V$ that $(-1)x = -x$_.

_Hint_. The left hand side is the scalar multiplication of $-1\in\bm{F}$ by $x$.
The right hand side is the additive inverse of $x$. You need to show
$x + (-1)x = 0$. Use the distributed law.

__Exercise__. _Show for $x\in V$ that $-(-x) = x$_.

If $\bm{F}^X = \{f\colon X\to \bm{F}\}$ is the set of all functions from $X$ to $\bm{F}$
we can define $(f + g)(x) = f(x) + g(x)$ and $(\alpha f)(x) = \alpha f(x)$ for
$f,g\in\bm{F}^X$ and $\alpha\in\bm{F}$. It is customary to write $c(X)$ for this space.

__Exercise__. _Show $c(X)$ is a vector space_.

The functions in $c(X)$ that are zero except at a
finite number of elements of $X$ is customarily written $c_{00}(X)$.
If $X$ is finite then $\bm{F}^X = c_{00}(X)$. If $X$ has $n$
elements it is customary to write
$\bm{F}^n = \{(x_1,\ldots,x_n):x_j\in\bm{F}, 1\le j\le n\}$.

__Exercise__. _Show $c_{00}(X)$ is a vector space_.

If $X = \bm{N}$ is the set of _natural numbers_ define $c_0(\bm{N}) = c_0$
to be the functions $v\in c(\bm{N})$ such that $\lim_{n\to\infty} v(n) = 0$.

__Exercise__. _Show $c_0$ is a vector space_.

The vector space $c_{00}(X)$ has an _inner product_ defined by
$v\cdot w = \sum_{x\in X} v(x) w(x) = \sum_{x\in X} v_x w_x$ for $v,w\in c_{00}(X)$.
Since multiplication in $\bm{F}$ is commutative $v\cdot w = w\cdot v$.

__Exercise__. _Show $(\alpha u + \beta v)\cdot w = \alpha(u\cdot w) + \beta(v\cdot w)$
for $\alpha, \beta\in\bm{F}$ and $u,v,w\in c_{00}(X)$_.

__Exercise__. _Show $v\cdot v = 0$ implies $v = 0$ for $v\in c_{00}(X)$_.

Define the _Kronecker delta function_ $\delta_x\in c_{00}(X)$ by $\delta_x(y) = 1$ if $y = x$
and $\delta_x(y) = 0$ if $y \not= x$.

__Exercise__. _Show $v = \sum_{x\in X} (v\cdot\delta_x) \delta_x$ for $v\in c_{00}(X)$_.

This shows the set $\{\delta_x:x\in X\}$ _spans_ $c_{00}(X)$.

### Span

If $x\in V$ then $\bm{F}\{x\} = \{\alpha x:\alpha \in\bm{F}\}$ is 
the one-dimensional subspace _spanned_ by $x$.

__Exercise__. _Show $\bm{F}\{x\}$ is the smallest subspace of $V$ containing $x$_.

More generally, let $X$ be any collection of vectors in $V$.
The _span_ of the collection is the smallest subspace of $V$
containing $X$ and is denoted $\span X$ or $\vee X$.

A _linear combination_ of vectors is a finite sum $\sum_j \alpha_j x_j$
where $\alpha_j\in\bm{F}$ and $x_j\in V$.

__Exercise__. _Show the span of $X$ is the set of all linear combinations
of vectors from $X$_.

__Exercise__. _Show the span of $X$ is a vector space_.

### Subspace

A subset $U$ of a vector space $V$ is a subspace if $U$ is also a vector space.

__Exercise__. _Show $U\subseteq V$ is a subspace if and only if
$\bm{F} U\subseteq U$ and $U + U\subseteq U$_.

We use the notation $\bm{F} U = \{\alpha x:\alpha \in\bm{F}, x\in U\}$ and
$U + U = \{x + y:x\in U, y\in U\}$.

__Exercise__. _If $U$ and $W$ are subspaces then $U + W$ and $U\cap W$ are also subspaces_.

If $U\cap W = \{0\}$ then $U + W$ is called an _interal sum_.

__Exercise__. _Let $U$ and $W$ be subspaces of $V$ with $U\cap W = \{0\}$.
If $u + w = u' + w'$ with $u,u'\in U$ and $w,w'\in W$ show
$u = u'$ and $w = w'$_.

_Hint_. $u - u'\in U$ and $w' - w\in W$.

This shows every vector $v\in U + W$ has a unique decomposition $v = u + w$
with $u\in U$ and $w\in W$ whenever $U\cap W = \{0\}$.

#### Lattice of Subspaces

Subspaces of a vector space form a _lattice_ where $+$ is the _join_ and $\cap$ is the _meet_.
Since $U + V = V$ for all subspaces $U$, $V$ is the identity element of the join.
Since $U \cap \{0\} = \{0\}$ for all subspaces $U$, $\{0\}$ is the identity element of the meet.

__Exercise__. (Absorbtion laws) _If $U$ and $W$ are subspaces then $U + (U \cap W) = U$ and $U\cap(U + W) = U$_.

The lattice of subspaces is also _distributive_.

__Exercise__. (Distributive laws) _If $U$, $V$, and $W$ are subspaces then
$U \cap (V + W) = (U \cap V) + (U \cap W)$ and $U + (V\cap W) = (U + V)\cap(U + W)$_.

Either of these implies the other in any lattice. This was not
noticed until some time after the the invention of lattice theory. [cite??]

Subspaces of $V$ form a _bounded lattice_ with _top element_ $V$ and _bottom element_ $\{0\}$.

The lattice structure of subspaces is used in Quantum Mechanics. [cite?]

### Independent

A key property of a collection of vectors is _independence_.  A collection
of vectors $X$ in the vector space $V$ are independent if every linear combination
$\sum_j \alpha_j x_j = 0$ where $\alpha_j\in\bm{F}$ and $x_j\in X$
implies $\alpha_j = 0$ for all $j$. Note that the empty set is independent.

__Exercise__. _If $X$ is independent and $\sum_j \alpha_j x_j = \sum_j \beta_j x_j$
where $\alpha_j,\beta_j\in\bm{F}$ and $x_j\in X$ show $\alpha_j = \beta_j$ for all $j$_.

Independence ensures unique representations of linear combinations.

If $\sum_j \alpha_j x_j = 0$ and $\alpha_k\not = 0$ for some $k$ then
$x_k = -(1/\alpha_k)\sum_{j\not=k} \alpha_j x_j$ is a linear combination
of vectors in $X\setminus \{x_k\}$.
In this case $X$ is _linearly dependent_ and $X\setminus\{x_k\}$
has the same span as $X$. We use _reverse solidus_ for $A\setminus B = \{x\in A: x\notin B\}$,
the _set difference_.

### Basis

A _basis_ of $V$ is an independent set $X\subseteq V$ that spans $V$.
Every vector space has a basis. In fact, they have lots of basis'.
The cardinality of the basis is the _dimension_ of the vector space.
To show dimension is well-defined we must show the
cardinality of any two basis' are equal. Neither of these facts are trivial.

__Exercise__. _Show $\{\delta_x:x\in X\}$ is a basis of $c_{00}(X)$_.

__Exercise__. _If $X\subseteq V$ is independent and $y\not\in\vee X$ show $X\cup\{y\}$ is independent_.

If an independent set does not span a vector space we can always add an element to 
the set to get a larger independent set. This process eventually stops if the
vector space is finite dimensional. The proof for (possibly) infinite dimensional
spaces requires more machinery.

Let $\mathcal{C}$ be a collection of independent subsets of $V$ that is totally ordered by inclusion,
that is, given $X,Y\in\mathcal{C}$ either $X\subseteq Y$ or $Y\subseteq X$. Any such collection
is a _chain_.

__Exercise__. _Show for any chain $\mathcal{C}$ that $\cup\mathcal{C} = \cup_{X\in\mathcal{C}} X$ is independent_.

__Exercise__. _Prove every vector space has a basis_.

Hint: Use the previous exercises and Zorn's lemma.

To prove any two basis' have the same cardinality we need _linear transformations_.

## Linear Transformation

A _linear tranformation_ is a function from a vector space to a vector space
that preserves the vector space structure.

If $V$ and $W$ are vector spaces over the same field $\bm{F}$ then
a function $T\colon V\to W$ is a linear transformation if $T(\alpha x + y)
= \alpha Tx + T y$ for $\alpha \in\bm{F}$ and $x,y\in V$.
Note the addition and scalar multiplicate on the left-hand side of the equality
are those of $V$ and on the right-hand side are those of $W$.

__Exercise__. _Show $T(\alpha x + \beta y) = \alpha Tx + \beta T y$
for $\alpha,\beta \in\bm{F}$ and $x,y\in V$_.

The set of all linear transformations from $V$ to $W$ is
denoted $\mathcal{L}(V,W)$.
The sum of $T,S\in \mathcal{L}(V,W)$ is defined by
$(T + S)v = Tv + Sv$ for $v\in V$. If $\alpha\in\bm{F}$ define
$\alpha T$ by $(\alpha T)v = \alpha(T v)$ for $v\in V$.

__Exercise__. _Show $\mathcal{L}(V,W)$ is a vector space_.

If $T\in\mathcal{L}(c_{00}(X), c_{00}(Y))$ then $T\delta_x = \sum_{y\in Y} t_{xy} \delta_y$
for some $t_{xy}\in\bm{F}$ where $\{y\in Y:t_{xy}\not=0\}$ is finite.
If $S\in\mathcal{L}(c_{00}(Y), c_{00}(Z))$ then $S\delta_y = \sum_{z\in Z} s_{yz} \delta_z$
for some $s_{yz}\in\bm{F}$ where $\{z\in Z:s_{yz}\not=0\}$ is finite.

__Exercise__. _Show $(ST)\delta_x = \sum_{z\in Z}(\sum_{y\in Y} t_{xy} s_{yz})\delta_z$_.

This shows if $R = ST$ then $\sum_{y\in Y} t_{xy} s_{yz} = r_{xz}$.
Matrix multiplication calculates composition of linear transformations.

The _kernel_ of a linear transformation $T\colon V\to W$ is
$\ker T = \{v\in V:Tv = 0\}$. 

__Exercise__. _Show the kernel of a linear transformation is a vector space_.

A linear transformation is _injective_ if $Tx = Ty$ implies $x = y$.

__Exercise__. _Show a linear transformation is injective if and only if its kernel is $\{0\}$_.

The _range_ of a linear transformation $T\colon V\to W$ is
$\ran T = \{Tv\in W:v\in V\}$. If $\ran T = W$ we say $T$ is _surjective_.

__Exercise__. _Show the range of a linear transformation is a vector space_.

A linear transformation that is _bijective_ (injective and surjective) is an _isomorphism_
from $V$ to $W$. We write $V\cong W$ if such an operator exists and say
$V$ is isomorphic to $W$.

__Exercise__. _Show $\cong$ is an equivalence relation on vector spaces_.

This means $V\cong V$, $V\cong W$ implies $W\cong V$, and
$U\cong V$ and $V\cong W$ implies $U\cong W$ for vector spaces $U$, $V$, and $W$.

<!--
If $T$ is an endomorphism on $V$ and $Tv = \lambda v$ for some $v\in V$ and
$\lambda\in\bm{F}$ then $v$ is an _eigenvector_ of $T$ with _eigenvalue_ $\lambda$.
These completely determine how $T$ acts on the one-dimensional subspace
$\bm{F}v = \{\alpha v:\alpha\in\bm{F}\}$.

__Exercise__. _Show $\bm{F}v$ is a subspace and $Tu = \lambda u$ for any $u\in\bm{F}v$_.
-->

If $W = V$ we write $\mathcal{L}(V)$ for $\mathcal{L}(V,V)$
and call the tranformations _endomorphisms_ of $V$.
If $U\subseteq V$ and $T$ is an endomorphism on $V$ then $U$ is
_invariant_ for $T$ if $TU\subseteq U$.

__Exercise__. _Show the kernal and range of an endomorphism are invariant_.

__Exercise__. _Show for any linear transformation $T\colon V\to V$ with $T^2 = T$
that $\ker T + \ran T = V$ and $\ker T\cap\ran T = \{0\}$_.

Hint: $v = (v - Tv) + Tv$ for all $v\in V$.

An endomorphism $T$ with $T^2 = T$ is a _projection_. Every vector space is
the internal sum of the kernel and range of any projection.

__Exercise__. _Every subspace is the range of a projection_.

Hint: Let $X$ be a basis of $U$ and $Y\supseteq X$ be a basis of $V$. Every
vector in $v$ can be written $v = \sum_{x\in X}\alpha_x x + \sum_{y\in Y\setminus X} \beta_y y$.
Define $Pv = \sum_{x\in X}\alpha_x x$. Show $U$ is the range of $P$ and $P^2 = P$.

__Exercise__. _If $J\colon U\to V$ is inclusion and $P\colon V\to U$ is a projection,
show $PJ$ is the identity operator on $U$_.

Two endomorphisms $R,T$ on $V$ are _similar_ if there exists an isomorphism
$S$ with $R = S^{-1}TS$. We write $R\simeq T$ if so.

__Exercise__. _Show similarity is an equivlence relation on endomorphisms_.

Hint: $S_0^{-1}S_1 = (S_1^{-1}S_0)^{-1}$ if $S_0$ and $S_1$ are isomorphisms.

<!--

### Dimension

The _dimension_ of $V$ is the cardinality of a basis $X$ for $V$.
A fundamental fact about vector spaces is that every basis has the same
cardinality. This is necessary to show the definition of dimension is well-defined.

If $X\subseteq V$ is a basis of $V$ then every $v\in V$ can be uniquely written as
a finite linear combination $v = \sum_j \alpha_j x_j$ for some
$\alpha_j\in\bm{F}$ and $x_j\in X$. This defines a map
$J_X\colon V\to c_{00}(X)$ where $J_X v(x) = \alpha_j$ if and only if $x = x_j$.

__Exercise__. _Show $J_X$ is an isomorphism if $X$ is a basis_.

This shows for any basis $X$ of $V$ that $V\cong c_{00}(X)$.

If $s\colon X\to Y$ is any function from the set $X$ to the set $Y$
define $S\colon c_{00}(X)\to c_{00}(Y)$ by $S(\sum_j \alpha_j x_j)
= \sum_j \alpha_j s(x_j)$.

__Exercise__. _Show $S$ is linear for any function $s$_.

Every linear transformation $S\colon c_{00}(X)\to c_{00}(Y)$ induces a
function $s\colon X\to Y$ by $s(x) = S(\delta_x) = ???$.

__Exercise__. _Show $S$ is injective if and only if $s$ is injective_.

__Exercise__. _Show $S$ is surjective if and only if $s$ is surjective_.

__Exercise__. _Show $S$ is an isomorphism if and only if $X$ and $Y$ have the same cardinality_.

This shows that if $X$ and $Y$ are basis' of $V$ then
$c_{00}(X) \cong V \cong c_{00}(Y)$. We conclude $X$ and $Y$ have the same cardinality
so dimension is well-defined.

In classical linear algebra texts this fact is proved using the Steinitz exchange
lemma when the vector spaces are finite dimensional. The proof above works for
vector spaces of any dimension.

### Quotient Space

Every subspace $U$ of $V$ determines an equivalence relation on $V$
by $x\sim y$ if and only if $x - y\in U$.

__Exercise__. _Show $\sim$ is an equivalence relation_.

For any $x\in V$ let $x + U = \{x + u:u\in U\}$.

__Exercise__. _Show $x + U = y + U$ if and only if $x\sim y$ for $x,y\in V$_.

This shows $x + U$ can be identified with the coset of $x$ under this equivalence relation.

If $U$ is a subspace of $V$ we define the _quotient space_
$V/U = \{x + U:x\in V\}$.

Define quotient space addition by $(x + U) + (y + U) = (x + y) + U$
and scalar multiplication by $\alpha (x + U) = \alpha x + U$.

__Exercise__. _Show quotient space addition and scalar multiplication are well-defined_.

__Exercise__. _Show the quotient space is a vector space_.

???

Quotient spaces split vector spaces into two _complementary_ vector spaces.

For $U$ a subspace of $V$ define $J:U\to V$ by inclusion, $Ju = u$, so $\ran J = U$.

$v = u + w$ where $u\in U$.

$u\mapsto u \oplus (v  - u) + U$

#### Sum

The _external sum_ of vector spaces $U$ and $W$, $U\oplus W$, is the set $U\times W$
with addition $(u,w) + (x, y) = (u + x, w + y)$, where $u,x\in U$
and $w,y\in W$, and scalar multiplication $\alpha (u, w) = (\alpha u,
\alpha w)$ for $\alpha \in\bm{F}$.  The external sum addition and scalar
multiplication on the left-hand sides are defined in terms of those for $U$
and $W$ in the first and second elements (respectively) of the pairs on
the right-hand sides.

Instead of $(u,w)$ it is customary to write $u\oplus w$. The definitions
above become $(u\oplus w) + (x\oplus y) = (u + x)\oplus(w + y)$ and
$\alpha (u\oplus w) = \alpha u\oplus \alpha w$.

__Exercise__. _Show the external sum is a vector space_.

Every vector space $V$ is _isomorphic_ to the external sum of $U$ and
$V/U$ for any subspace $U\subseteq V$, but we have to define isomorphic
in terms of invertible _linear transformations_ between vector spaces.

If $U\subseteq V$ is a subspace then $V\cong U\oplus V/U$.
Define $I_U\colon U\oplus V/U\to V$ by $u\oplus v+U\mapsto u + v$.

__Exercise__. _Show this is well-defined_.
<details>
<summary>Solution</summary>

> If $I_U u \oplus v + U = 0$ then $u + v = 0$.
Since $v = -u\in U$ we have $v + U = 0 + U$.

</details>

#### Internal

If $U$ and $W$ are subspaces of $V$ then $U + W$ is also as subspace of $V$.
If $U\cap W = \{0\}$ it is called an _interal sum_.

__Exercise__. _Let $U$ and $W$ be subspaces of $V$ with $U\cap W = \{0\}$.
If $u + w = u' + w'$ with $u,u'\in U$ and $w,w'\in W$ show
$u = u'$ and $w = w'$_.

_Hint_. $u - u'\in U$ and $w' - w\in W$.

This shows every vector $v\in U + W$ has a unique decomposition $v = u + w$
with $u\in U$ and $w\in W$ when $U\cap W = \{0\}$.


__Exercise__. _If $X\subseteq V$ is independent and $T\in\mathcal{L}(V,W)$ is injective
then $TX\subseteq W$ is independent_.

__Exercise__. _If $T$ is surjective and the span of $X\subseteq V$ is $V$
show the span of $TX$ is $W$_.

If $T$ is both one-to-one and onto (injective and surjective) it is an
_isomorphism_ between $V$ and $W$. Its _inverse_ is $T^{-1}\colon W\to V$
where $T^{-1}w = v$ if and only if $Tv = w$ for $v\in V$ and $w\in W$.

__Exercise__. _Show the inverse of a linear transformation is linear_.

Isomorphisms induce an equivalence relation on vector spaces.
We write $V\cong W$ to indicate $V$ is isomorphic to $W$.

__Exercise__. Show $V\cong V$, if $V\cong W$ then $W\cong V$,
and if $U\cong V$ and $V\cong W$ then $U\cong W$.

_Hint_: Isomorphisms are invertable.

Every $T\in\mathcal{L}(V,W)$ factors through $V/\ker T$ and $\ran T$.
There are linear transformations $V\to V/\ker T\to \ran T\to W$.
The first, $V\to V/\ker T$, sends $v\mapsto v + \ker T$,
the second, $V/\ker T\to\ran T$, sends $v + \ker T\mapsto Tv$,
and the third, $\ran T\to W$, is just inclusion $Tv\mapsto Tv\in W$.

We already know $(x + U) + (y + U) = (x + y) + U$ and $\alpha (x + U) = \alpha x + U$
for any subspace $U$ so the first map is linear.

__Exercise__. _Show $V\to V/\ker T$ where $v\mapsto + V/\ker T$ is surjective_.

__Exercise__. _Show if $x + \ker T = y + \ker T$ then $Tx = Ty$._

This shows the second map is well-defined.

__Exercise__. _Show second map $V/\ker T\to\ran T$ is injective_.

__Exercise__. _Show second map $V/\ker T\to\ran T$ is surjective_.

This show $V/\ker T \cong \ran T$.

???We can now show $V$ is isomorphic to the external sum of $U$ and $V/U$ for
any subspace $U\subseteq V$.

For $v\in V$ and $u\in U$ $v = u + (v - u)$. Define $J$ by...

__Exercise__. _Show $J$ is surjective_.

__Exercise__. _Show $J$ is injective_.


### Endomorphisms

The endomorphisms $\mathcal{L}(V)$ are more than just a vector space.
They have a _product_ defined by composition $(ST)x = S(Tx)$ for
$S,T\in\mathcal{L}(V)$ and $x\in V$. This makes them a _ring_.
Recall a ring is a vector space with a product that satisfies

_Associative_
  ~ $R(ST) = (RS)T$

_Identity_
  ~ There is a multiplicative identity $I$ with $IR = R$

_Distibutive_
  ~ $R(S + T) = RS + RT$

Composition of linear transformations is associative, the identity is
$Ix = x$ for $x\in V$, and the distibutive law follows from linearity
$R(S+T)x = R(Sx + Tx) = RSx + RTx = (RS + TS)x$.

The integers are the prototypical example of a ring. The set of polynomials
in one variable $\bm{F}[t] = \{p(t) = \sum_{n\ge0} \alpha_n t^n\}$, where $\alpha
_n\in\bm{F}$ is a ring.

For any endomorphism $T\in\mathcal{V}$ there is a _functional calculus_
$\Phi_T\colon\bm{F}[t]\to\mathcal{F}(V)$ defined by $p(t)\mapsto p(T)$
that preserves the ring structure.

Note: If we replace the requirement that the scalars are a field by
the requirement they are a ring we have a _module_ instead of a vector space.
Modules are not (by a long shot) characterized by their dimension.

If $R\in\mathcal{L}(c_{00}(X), c_{00}(Y))$
and $S\in\mathcal{L}(c_{00}(Y), c_{00}(Z))$, then $SR\in\mathcal{L}(c_{00}(X), c_{00}(Z))$.

__Exercise__. _Show $(SR)(\delta_x) = \sum_{y\in Y} R(\delta_x) S(\delta_j)$_.

Composition is matrix multiplication.

### Dual Space

The _dual vector space_ of the vector space $V$ is the space of
_linear functionals_ $V^* = \mathcal{L}(V,\bm{F})$.
For $v\in V$ and $v^*\in V^*$ we write the _dual pairing_
$\langle v, v^*\rangle = v^*(v)\in\bm{F}$.

Obviously, if $x^*,y^*\in V^*$ then $\langle v,x^*\rangle = \langle v,y^*\rangle$
for all $v\in V$ implies $x^* = y^*$.

__Exercise__. _Show if $x,y\in V$ and $\langle x,v^*\rangle = \langle y,v^*\rangle$
for all $v^*\in V^*$ then $x = y$_.

_Hint_. Show if $\langle v,v^*\rangle = 0$ for all $v^*\in V^*$ then $v = 0$.

For any subset $X\subseteq V$ the _annihilator_ is
$X^\perp = \{x^*\in V^*: \langle x, x^*\rangle = 0, x\in X\}\subseteq V^*$.

__Exercise__. _The annihilator of any $X\subseteq V$ is a subspace of $V^*$_.

For any subset $X^*\subseteq V^*$ the _preannihilator_ is
$^\perp X^* = \{x\in V: \langle x, x^*\rangle = 0, x^*\in X^*\}\subseteq V$.

__Exercise__. _The preannihilator of any $X^*\subseteq V^*$ is a subspace of $V$_.

__Exercise__. _For any $X\subseteq V$ $^\perp(X^\perp)$ is the span of $X$_.

__Exercise__. _For any $X^*\subseteq V^*$ $(^\perp X^*)^\perp$ is the span of $X^*$_.

For $T\in\mathcal{L}(V, W)$ the _adjoint_ $T^*\in\mathcal{L}(W^*, V^*)$ is
defined by $\langle Tv, w^*\rangle = \langle v, T^*w^*\rangle$
for $v\in V$ and $w^*\in W^*$.

## Normed Space

A _normed vector space_ is a vector space with a _norm_ $\|.\|\colon V\to [0,\infty)$
where $\|x + y\| \le \|x\| + \|y\|$, $\|\alpha x\| = |\alpha|\|x\|$,
and $\|x\| = 0$ implies $x = 0$, $\alpha\in\bm{F}$, $x,y\in V$.
It provides a _metric_ on $V$ by $d(x,y) = \|x - y\|$.

__Exercies__. _Show $d$ is a metric_.

If a normed space is _complete_ in this topology it is called a _Banach space_.
We use $X$, $Y$, \ldots for vector spaces that are Banach spaces.

If the norm on $V$ does not satisfy $\|x\| = 0$ implies $x = 0$ we say the
norm is _singular_. We can mod out by _null_ vectors to get a non-singular norm.

__Exercise__. _If $W$ is a subspace of a (possibly singular) normed space $V$
show $\|v + W\| = \inf_{w\in W}\|v + w\|$ is a (possibly singular) norm on $V/W$_.

__Exercise__. _Show $Z = \{x\in V\colon \|x\| = 0\}$ is a subspace of $V$ and
$\|x + Z\| = 0$ implies $x + Z = 0 + Z$ in $V/Z$_.

Every normed space can be _completed_ into a Banach space.
Let $V^\NN = \{x\colon\NN\to V\} = \{(x_n)_{n\in\NN}:x_n\in V\}$ be the set of
all sequences of vectors in $V$. Recall $(x_n)_{n\in\NN}$ is a _Cauchy sequence_
if given $\epsilon > 0$ there exists $N\in\NN$ with
$d(x_n, x_m) = \|x_n - x_m\| < \epsilon$
whenever $m,n > N$.

__Exercise__. _Let $C$ be the collection of Cauchy sequences in $V^\NN$ where $V$ is a normed space. Define
$x \sim y$ if $\lim_n x_n = \lim_n y_n$, $x,y\in C$. Show this is an equivalence relation
and $\bar{V} = C/\sim$ is a Banach space_.

__Exercise__. _Let $C_V$ be the collection of constant sequences in $V^\NN$ where $V$ is a normed space.
Show $C_V/\sim$ is dense in $C/\sim$_.

The space of linear transformations between normed spaces has a norm.
Define $\|T\| = \sup_{\|x\|\le 1}\|Tx\|$ for $\mathcal{L}(V, W)$
if both $V$ and $W$ are normed.

A linear transformation is _bounded_ if $\|T\| < \infty$ for $T\in\mathcal{L}(V,W)$.
The bounded linear transformations are denoted $\mathcal{B}(V,W)$. In this case
we call them _linear operators_ or simply _operators_.

__Exercise__. _Show this is a norm on $\mathcal{B}(V,W)$_.

__Exercise__. _Show $\mathcal{B}(V,W)$ is a subspace of $\mathcal{L}(V,W)$_.

Bounded operators are continuous.

__Exercise__. _Show if $T\in\mathcal{B}(V,W)$ then $Tx_n \to 0$ in $W$ as
$x_n\to 0$ in $V$_.

Continuous operators are bounded.

A convenient way of showing an operator is bounded is

__Exercise__. _Show if $T$ is continuous then $T$ is bounded_.

__Theorem__. (Uniform Boundedness Priciple, Banach-Steinhous) _For $T_n\in\mathcal{B}(V,W)$,
$\{\|T_nx\|\}$ is bounded all $x\in V$ implies $\{\|T_n\|\}$ is bounded_.

This is a theorem because the proof is non-trivial. It relies on the Baire Category
Theorem for complete metric spaces. (The intersection of a countable collection of
open dense sets is dense.)

__Theorem__. (Open Mapping Theorem) _The image of the unit ball under a surjective operator
contains an open ball centered at the origin_.

The _graph_ of a linear transformation $T\in\mathcal{L}(V,W)$
is the set $\{(x, Tx):x\in V\}\subseteq V\times W$.

__Theorem__. (Closed Graph Theorem) _An operator is continuous if and only if its graph is closed_.

### Examples

For any set $I$ the set of all functions from $I$ to a field $\bm{F}$
is $\bm{F}^I = \{x\colon I\to\bm{F}\}$. It is a vector space, the _free vector space_ on
$I$, and has a basis $\{e_i\}_{i\in I}$ where $e_i(i) = 1$ and $e_i(j) = 0$ for $j\not=i$.
This is not a normed space.

The vectors $x\in\bm{F}^I$ with $\|x\|_\infty = \sup_{i\in I}|x(i)| < \infty$
are the Banach space $\mathcal{l}^\infty(I)$.

If $I$ is totally ordered (or a net) define the Banach spaces
$c(I) = \{x\in\bm{F}^I:\lim_i x(i) \mathrm{\ exists}\}$
and $c_0(I) = \{x\in\bm{F}^I:\lim_i x(i) = 0\}$.

Clearly $c_0 \subseteq c \subseteq \mathcal{l}^\infty$.

The vectors with $\|x\|_1 = \sum_{i\in I}|x(i)| < \infty$ are the Banach space $\mathcal{l}^1(I)$.
More generally vectors with $\|x\|_p = \bigl(\sum_{i\in I}|x(i)|^p\bigr)^{1/p} < \infty$ define the
Banach space $\mathcal{l}^p(I)$, $1\le p < \infty$.

__Exercise__. _Show if $x\in\mathcal{l}^\infty$ then $x\in\mathcal{l}^p$ for $1\le p < \infty$
and $\lim_{p\to\infty}\|x\|_p = \|x\|_\infty$_.

If $I$ is equipped with a positive measure $\mu$ we can similarly define $L^p(\mu)$ using
$\|f\|_p = \bigl(\int_I |f|^p\,d\mu\bigr)^{1/p}$.

The case when $p = 2$ is special.

## Inner Product Space

A function $(.,.)\colon V\times V\to\bm{F}$ with $y\mapsto (x,y)$
and $y\mapsto (y,x)$ linear in $y$ for each $x\in V$ is a _bilinear_
function. If also $(\alpha x,y) = (x, \bar{\alpha } y)$ for $\alpha \in\bm{F}$ and
$x,y\in V$ it is _sesquilinear_. 
An _inner product_ on a vector space V is a _sesquilinear_ form
that is also _non-singular_, $(x, x) = 0$ implies $x = 0$.

__Exercise__. _If the inner product is singular
then $K = \{x:(x,x) = 0\}$ is a subspace of $V$. The inner product on
$V/K$ defined by $(x + K, y + K) = (x, y)$ is well-defined
and non-singular_.

The _norm_ of a vector is $\|x\| = \sqrt{(x,x)}$. The Cauchy-Schwartz
inequality is $|(x,y)|\le\|x\| \|y\|$ with equality if and only
if $x$ and $y$ are linearly dependent.
This follows from
$0\le \|x - \lambda y\|^2 = \|x\|^2 - 2\Re \lambda (x, y) + |\lambda|^2\|y\|^2$
and taking $\lambda = (x,y)/\|y\|^2$. Equality holds if and only
if $x = \lambda y$.

If $T\in\mathcal{L}(V,V^*)$ then $(x,y) = \langle x, Ty\rangle$ is bilinear.

### Eigenvectors

Every operator on a finite dimensional inner product space has an eigenvector.
The set $\{Tx:\|x\|=1\}$ is closed and bounded so there exists
a unit vector $e$ with $x = Te$ and $|\|Tx\|\ge\|Ty\|$ for all unit vectors $y$.
Since $\|x|\^2 = (Te, x) \le \|Te\| \|x\| = \|x\|^2$
we have $Te = \lambda x$ for some scalar $\lambda$ since equality holds in
the Cauchy-Schwartz inequality.

Not every operator on an infinite dimensional inner product
space has an eigenvector.  Define the _unilateral shift operator_
$S\colon\mathcal{l}^2\to\mathcal{l}^2$ by $S(x_0, x_1, \ldots) = (0,
x_0, x_1, \dots)$. If $Sx = \lambda x$ then $0 = \lambda x_0$, $x_1 =
\lambda x_0$, \ldots, so $x = 0$.

The unilateral shift does have lots of invariant subspaces however.
If the first $m$ components of $x$ are zero then the first $m+1$
components of $Sx$ are zero so $\mathcal{M}_m = \{x\in\mathcal{l}^2:x_j =
0, j < m\}$ are invariant for all $m$.

__Exercise__. _Show $\mathcal{M}_m$ is a subspace of $\mathcal{l}^2$_.

The _unilateral backward shift operator_ is the adjoint of $S$.

__Exercise__. _Show $(S^*x)_j = x_{j + 1}$ for $j\ge 0$_.

__Exercise__. _Show $x = (1,0,0,\ldots)$ is an eigenvector with
eigenvalue 0_.

__Exercise__. _Show $\mathcal{M}_n^\perp = \{x\in\mathcal{l}^2:x_j = 0, j \ge m\}$
is an invariant subspace of $S^*$.

All invariant subspaces of the unilateral shift operator are characterized
by a theorem of Arne Beurling.

## Eigenvector, Eigenvalue

If $Tv = \lambda v$ for some $\lambda\in\F $ then $\lambda$ is
an _eigenvalue_ of $T$ and $v$ is its corresponding _eigenvector_.
If $I$ is the _identity operator_ defined by $Iv = v$ for all $v$
and $\lambda$ is an eigenvalue, then $T - \lambda I$ is not invertable
since $(T - \lambda I)v = 0$.

If the eigenvectors of $T$ are independent ...
And form a basis... 
Then $Tv_i = \lambda_i vi_i$ and $TV = \sum \lambda_i v_i$.
We say $T$ is _diagonalizable_.

If $T$ has only one eigenvalue... (Jordan form)

__Theorem__. If $V$ is finite dimensional every operator in $\mathcal{L}(V)$ has an eigenvector.

If $T\in\mathcal{L}(V)$ and $Tx = 0$ for some $x\in V$ then $x$ is an eigenvector with eigenvalue $0$

If $(x,y) = \|x\| \|y\|$ then $\alpha x = y$ for some $\alpha \in\bm{F}$.

There exists $x^*$ such that $\|x*\| \ge \|T e\|$ for $\|e\| = 1$.

## Polynomial Functional Calculus

Let $\bm{F}[t]$ be the _ring_ of polynomials in the variable $t$ over the
scalar field $\bm{F}$. Define $\Phi\bm{F}[t]\to \mathcal{L}(V)$
by $\Phi(p) = p(T)$ where $p(t) = \sum_{n\ge0} \alpha_n t^n$.

__Exercise__. _Show $\Phi$ is a ring homomorphism_.

# Remarks

$I\supset R$, $R' = R$, $R^2\subseteq R$.

Infinite sums. What does $\sum_{x\in X} \alpha_x x$ for $\alpha_x\in\bm{F}$ mean?
Define $+\colon \bm{F}^I\times V^I\to V$ for any $I$ as follows: ...
We introduce $I$ since the scalars and vectors must be indexed by the same set.
We are really defining $+\colon 2^V\times\bm{F}^I\times V^I\to V$...


[Grobner basis...]
-->
