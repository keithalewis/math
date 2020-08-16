---
title: Linear Algebra
author: Keith A. Lewis
institute: KALX, LLC
classoption: fleqn
fleqn: true
---

\renewcommand{\ker}{\operatorname{ker}}
\renewcommand{\ran}{\operatorname{ran}}
\renewcommand{\span}{\operatorname{span}}
\renewcommand{\Re}{\operatorname{Re}}
\renewcommand{\CC}{\bm{C}}
\renewcommand{\FF}{\bm{F}}
\renewcommand{\RR}{\bm{R}}
\renewcommand{\NN}{\bm{N}}

This is not a beginners guide to linear algebra. It is a breviloquent
collection of pertinent facts about vector spaces and the linear
transformations between them.  Although it is complete and self-contained
you should already be familiar with basic linear algebra before reading
this. Statements and proofs are brief, so read them twice.  Do the
exercises to confirm your understanding.  Think of it like the Tao
Te Ching: this is not an instruction manual, it enables the consolidation and
verification of your pre-existing partial knowledge of linear algebra.

I make no apologies for the shamelessly mathematical exposition and hope
it engenders an appeciation for the thrill of literally 'doing the math'
to unequivocally establish absolute truth.

Vector spaces occupy a sweet spot in the menagerie of mathematical
structures.  They are completely classified up to _isomorphism_ by their
_dimension_.  A _vector space_ is an _abelian group_ with a _scalar
multiplication_ that satisfies a _distributive law_ with respect
to the vector addition. A vector is
not just a list of numbers, it is a mathematical object that satisfies
certain axioms. Vectors can be anything with an addition and scalar
multiplication that satisfy these axioms.  For example, _functions_
are vectors and _linear transformations_ between vector spaces are
also vectors.

Linear transformations from a finite dimensional vector space to
itself are categorized up to _similariy_ by a list of _eigenvalues_
together with their _multiplicities_. Each eigenvalue and multiplicity
is associated with an _invariant subspace_ having dimension equal to
the multipicity.  If the multiplicity is 1 then $Tv = \lambda v$ where
$v$ is an eigenvector corresponding to the eigenvalue $\lambda$.  We can
write this as $(T - \lambda I)v = 0$ where $I$ is the _identity operator_.
The associated invariant subspace is spanned by $v$.  If the multiplicity
is $m$ then $(T - \lambda I)^m v = 0$ for the generalized eigenvector $v$
and $(T - \lambda I)^k v\not= 0$ for $k < m$.  The associated invariant
subspace is spanned by $v$, $Tv$, \ldots, $T^{m-1}v$.

This probably makes no sense to you at this point, but it describes the
Jordan canonical form of a linear transformation. After you master the
following material these statements will become completely obvious.

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

A vector space also specifies a _field_ of _scalars_ $\FF$ (usually
the real $\RR$ or complex $\CC$ numbers) and a scalar
multiplication that satisfies the _distributive law_ 
$$
	\alpha (x + y) = \alpha x + \alpha y, \mathrm{\ for\ } \alpha\in\FF \mathrm{\ and\ } x,y\in V.
$$

To prove '$A$ implies $B$' ($A\Rightarrow B$) start by writing down $A$. On succeeding lines
write the result of applying an axiom to any previous lines followed
by the axiom used.
If a proof contains a line $C$ and a line $C\Rightarrow D$ then you can
write $D$ using _modus ponens_.
If the last line is $B$ then you have proved '$A$ implies $B$'.
The statement 'if $A$ then $B$' is equivalent to '$A$ implies $B$'.

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
substitutions $a \mapsto x + x$, $b \mapsto x$, and $c \mapsto -x$
then use modus ponens.

__Exercise__. _Show the additive identity is unique_.

_Hint_. If $0'$ is another identity then $0 = 0 + 0'$. Your proof can be
used for any group, abelian or not.

__Exercise__. _Show for $x\in V$ that $(-1)x = -x$_.

_Hint_. The left hand side is the scalar multiplication of $-1\in\FF$ by $x$.
The right hand side is the additive inverse of $x$. You need to show
$x + (-1)x = 0$. Use the distributed law.

__Exercise__. _Show for $x\in V$ that $-(-x) = x$_.

### Subspace

Just as factoring an integer into its prime factors can provide useful
information about the integer, vector spaces can be usefully broken down into
smaller subspaces.

A subset $U$ of a vector space $V$ is a _subspace_ if it is also a vector space.

__Exercise__. _Show $U\subseteq V$ is a subspace if and only if $U + U\subseteq U$ and
$\FF U\subseteq U$_.

We use the notation $U + U = \{x + y:x\in U, y\in U\}$
and $\FF U = \{\alpha x:\alpha \in\FF, x\in U\}$.

__Exercise__. _If $U$ and $W$ are subspaces then $U + W$ and $U\cap W$ are also subspaces_.

Subspaces of a vector space form a _lattice_ where $+$ is the _join_ and $\cap$ is the _meet_.

__Exercise__. (Absorbtion laws) _If $U$ and $W$ are subspacs then $U + (U \cap W) = U$ and $U\cap(U + W) = U$_.

The lattice is also _distributive_.

__Exercise__. (Distributive laws) _If $U$, $V$, and $W$ are subspaces then
$U \cap (V + W) = (U \cap V) + (U \cap W)$ and $U + (V\cap W) = (U + V)\cap(U + W)$_.

Either of these implies the other in any lattice. [cite??]

It is also a _bounded lattice_ with _top element_ $V$ and _bottom element_ $\{0\}$.
$V$ is the identity for the join and $\{0\}$ is the identity element for the meet
since $U + V = V$ and $U\cap\{0\} = \{0\}$ for any subspace $U\subseteq V$.

[Applications???]

### Span

If $v\in V$ then $\FF\{v\} = \{\alpha v:\alpha \in\FF\}$ is a subspace.
It is the one-dimensional subspace _spanned_ by $v$.

More generally, let $X$ be any collection of vectors in $V$.
The _span_ of the collection is 
$$
	\span X = \vee X = \{\sum_{x\in X} \alpha_x x\},
$$
where the sum is over any $\{\alpha_x\}_{x\in X}$ where $\alpha_x\in \FF$.

We could say $X = \{x_i\}_{i\in I}$ where $x_i\in V$ for all $i\in I$
but it is simpler to say $X = \{x\}_{x\in X}$ where $x\in V$ without
dragging in an index set $I$.

__Exercise__. _Show the span of $X$ is the smallest subspace of $V$ containing $X$_.

### Independent

A key property of a collection of vectors is _independence_.  A collection
of vectors $X\subseteq V$ are independent if every _linear combination_
$\sum_{x\in X} \alpha_x x = 0$ implies $\alpha_x = 0$ for all $x\in X$.
Note that the empty set is independent.
If $\alpha_x\not = 0$ for some $x$ then
$x = -(1/\alpha_x)\sum_{y\not = x} \alpha_y y$ is a linear combination
of vectors in $X\setminus \{x\}$.
In this case $X$ is _linearly dependent_ and $X\setminus\{x\}$
has the same span. We use _reverse solidus_ for $A\setminus B = \{x\in A: x\notin B\}$.

If $X\subseteq V$ is independent but its span is not $V$ we can find $y\in V$
such that $X\cup\{y\}$ is independent by choosing any $y\in V$ not in the span.

__Exercise__. _If $X\subseteq V$ is independent and $y\not\in\vee X$ show $X\cup\{y\}$ is independent_.

__Exercise__. _Every $X\subseteq V$ contains a subset $Y\subseteq X$
that is independent_.

_Hint_. Zorn's lemma using $Y\preceq X$ if and only if $X\subseteq Y$.

Independence ensures unique representations.

__Exercise__. _If $X$ are independent and $\sum_{x\in X}\alpha_x x
= \sum_{x\in X}\beta_x x$ then $\alpha_x = \beta_x$ for all $x\in X$_.

### Basis

A collection of vectors $X\subseteq V$ is a _basis_
of $V$ if they are independent and their span is $V$.

__Exercise__. _If $X$ is a basis show every vector $v\in V$ can be
uniquely written as $v = \sum_{x\in X}\alpha_x x$ for some $\alpha_x\in\FF$_.

Every independent set of vectors can be extended to a basis.  If $X$ is
independent let $\mathcal{P}$ be the collection of supersets of $X$
that are independent.  If $\mathcal{C}\subseteq\mathcal{P}$ is totally
order by inclusion then $Y = \cup\mathcal{C}$ is also independent.

Starting with $X = \emptyset$ this shows every vector space has a basis.
If $U$ is a subspace and $X$ is a basis of $U$

### Dimension

The _dimension_ of $V$ is the cardinality of a basis $X$. The
fundamental fact about vector spaces is that every basis has the same
cardinality. This shows the definition of dimension is well-defined.
Classical texts prove this for finite dimensional vector spaces
using the Steinitz exchange lemma. We prove this below for
vector spaces of any dimension.

### Quotient Space

If $U\subseteq V$ is a subspace we define the _quotient space_
$V/U = \{x + U:x\in V\}$ where the _coset_ $x + U = \{x + u:u\in U\}$. 

Define quotient space addition by $(x + U) + (y + U) = (x + y) + U$
and scalar multiplication by $\alpha (x + U) = \alpha x + U$.

__Exercise__. _Show quotient space addition and scalar multiplication are well-defined_.

__Exercise__. _Show the quotient space is a vector space_.

The relation $x\sim y$ if and only if $x - y\in U$ is an _equivalence relation_.

__Exercise__. _Show $x \sim x$, if $x \sim y$ then $y \sim x$, and
if $x \sim y$ and $y \sim z$ then $x \sim z$_.

__Exercise__. _Show $x\sim y$ if and only if $x + U = y + U$_.

__Exercise__. _If $(x + U)\cap (y + U)$ is not empty then $x + U = y + U$_.

Cosets form _partition_ of $V$.
Every equivalence relation determines a partition and every partition
determines an equivalence relation. (Exercise or more exposition???)

Quotient spaces split vector spaces into two _complementary_ vector spaces.

#### External Sum

The _external sum_ of vector spaces $U$ and $W$, $U\oplus W$, is the set $U\times W$
with addition $(u,w) + (x, y) = (u + x, w + y)$, where $u,x\in U$
and $w,y\in W$, and scalar multiplication $\alpha (u, w) = (\alpha u,
\alpha w)$ for $\alpha \in\FF$.  The external sum addition and scalar
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

#### Internal Sum

If $U$ and $W$ are subspaces of $V$ then $U + W$ is also as subspace of $V$.
If $U\cap W = \{0\}$ it is called an _interal sum_.

__Exercise__. _Let $U$ and $W$ be subspaces of $V$ with $U\cap W = \{0\}$.
If $u + w = u' + w'$ with $u,u'\in U$ and $w,w'\in W$ show
$u = u'$ and $w = w'$_.

_Hint_. $u - u'\in U$ and $w' - w\in W$.

This shows every vector $v\in U + W$ has a unique decomposition $v = u + w$
with $u\in U$ and $w\in W$ when $U\cap W = \{0\}$.

Internal sums do not require the notion of isomorphic linear transformations.

## Linear Transformation

When studying mathematical objects it is useful to study functions
between them that preserve the structure of the objects.

If $V$ and $W$ are vector spaces over the same field $\FF$ then
a function $T\colon V\to W$ is a _linear transformation_ if $T(\alpha x + y)
= \alpha Tx + T y$ for $\alpha \in\FF$ and $x,y\in V$.  Note $Tx$ and $Ty$
are in $W$. The set of all linear transformations from $V$ to $W$ is
denoted $\mathcal{L}(V,W)$. If $W = V$ we write $\mathcal{L}(V)$
and call the elements _endomorphisms_ of $V$.

If $U$ is a subpace of $V$ and $T\in\mathcal{L}(V)$ we say $U$
is an _invariant subspace_ if $TU\subseteq U$. In this case
the restriction of $T$ to $U$ is in $T\in\mathcal{L}(U)$.

If $U$ is a one-dimensional invariant subspace, $U = \FF\{u\}$ for some
non-zero vector $u$, we say $u$ is an _eigenvector_ of $T$. We have $Tu =
\lambda u$ for some $\lambda\in\FF$ and call $\lambda$ the _eigenvalue_
corresponding to the eigenvector $u$.

__Exercise__. _If $w\in U = \FF\{u\}$ and $Tu = \lambda u$ show $Tw = \lambda w$_.

This shows $T$ is completely determined by an eigenvector and
its corresponding eigenvalue on one-dimensional invariant subspaces.

__Exercise__. _Show $T(0) = 0$ for $T\in\mathcal{L}(V,W)$_.

_Hint_: The $0$ on the left-hand side is the additive identity of $V$
and the $0$ on the right-hand side is the additive identity of $W$.
Use $x + x = x$ implies $x = 0$.

__Exercise__. _Show $T(\alpha x) = \alpha (Tx)$ for $\alpha \in\FF$ and $x\in V$.
and $v,w\in V$_.

_Hint_: Use $T(0) = 0$.

__Exercise__. _Show $T(\alpha x + \beta y) = \alpha (Tx) + \beta (Ty)$
for $\alpha ,\beta \in\FF$ and $x,y\in V$_.

_Hint_: You don't need a hint if you have solved the previous exercises.

If $T,S\in\mathcal{L}(V,W)$
define addition $T + S$ by $(T + S)x = Tx + Sx$ and scalar
multiplication by $(\alpha T)x = \alpha (Tx)$ for $\alpha \in\FF$ and
$x\in V$.  The left-hand sides are defined in terms of vector addition
and scalar multiplication in $W$ on the right-hand sides.

__Exercise__. _Show $\mathcal{L}(V,W)$ is a vector space_.

The _kernel_ of a linear transformation $T\in\mathcal{L}(V,W)$ is
$$
	\ker T = \{x\in V:Tx = 0\}\subseteq V
$$
and its _range_ is 
$$
	\ran T = \{Tx:x\in V\}\subseteq W.
$$
If $\ker T = \{0\}$ then $T$ is _one-to-one_, or _injective_.
If $\ran T = W$ then $T$ is _onto_, or _surjective_.

__Exercise__. _Show $\ker T$ is a subspace of $V$ and $\ran T$
is a subspace of $W$ for any $T\in\mathcal{L}(V,W)$_.

__Exercise__. _Show the kernel and range of a linear tranformation are invariant subspaces
of the linear transformation_. 

__Exercise__. _If $T$ is injective show $Tx = Ty$ implies $x = y$ for all $x,y\in V$_.

_Hint_: The definition of injective for any function $f$ is usually defined by
$f(x) = f(y)$ implies $x = y$. Your job is to show this follows from $\ker T = \{0\}$
when $T$ is a linear transformation. 

__Exercise__. _If $X\subseteq V$ is independent and $T\in\mathcal{L}(V,W)$ is injective
then $TU\subseteq W$ is independent_.

__Exercise__. _If $T$ is surjective and the span of $X\subseteq V$ is $V$
show the span of $TX = \{Tx:x\in X\}$ is $W$_.

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

Two transformations $R,T\in\mathcal{L}(V)$ are _similar_ if there exists
an isomorphism $S\in\mathcal{L}(V)$ with $R = S^{-1}TS$.

__Exercise__. _Show similarity is an equivalence relation on linear transformations_.

_Hint_. $T$ is similar to itself via $S = I$, the identity transformation,
where $Ix = x$ for $x\in V$. The other two equivalence relation conditions follow from
isomorphism being invertible.

We can now show $V$ is isomorphic to the external sum of $U$ and $V/U$ for
any subspace $U\subseteq V$.

For $v\in V$ and $u\in U$ $v = u + (v - u)$. Define $J$ by...

__Exercise__. _Show $J$ is surjective_.

__Exercise__. _Show $J$ is injective_.


### Ring of Endomorphisms

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
in one variable $\FF[t] = \{p(t) = \sum_{n\ge0} \alpha_n t^n\}$, where $\alpha
_n\in\FF$ is a ring.

For any endomorphism $T\in\mathcal{V}$ there is a _functional calculus_
$\Phi_T\colon\FF[t]\to\mathcal{F}(V)$ defined by $p(t)\mapsto p(T)$
that preserves the ring structure.

Note: If we replace the requirement that the scalars are a field by
the requirement they are a ring we have a _module_ instead of a vector space.
Modules are not (by a long shot) characterized by their dimension.

### Dual Space

The _dual vector space_ of the vector space $V$ is the space of
_linear functionals_ $V^* = \mathcal{L}(V,\FF)$.
For $v\in V$ and $v^*\in V^*$ we write the _dual pairing_
$\langle v, v^*\rangle = v^*(v)\in\FF$.

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
and $\|x\| = 0$ implies $x = 0$, $\alpha\in\FF$, $x,y\in V$.
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

For any set $I$ the set of all functions from $I$ to a field $\FF$
is $\FF^I = \{x\colon I\to\FF\}$. It is a vector space, the _free vector space_ on
$I$, and has a basis $\{e_i\}_{i\in I}$ where $e_i(i) = 1$ and $e_i(j) = 0$ for $j\not=i$.
This is not a normed space.

The vectors $x\in\FF^I$ with $\|x\|_\infty = \sup_{i\in I}|x(i)| < \infty$
are the Banach space $\mathcal{l}^\infty(I)$.

If $I$ is totally ordered (or a net) define the Banach spaces
$c(I) = \{x\in\FF^I:\lim_i x(i) \mathrm{\ exists}\}$
and $c_0(I) = \{x\in\FF^I:\lim_i x(i) = 0\}$.

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

A function $(.,.)\colon V\times V\to\FF$ with $y\mapsto (x,y)$
and $y\mapsto (y,x)$ linear in $y$ for each $x\in V$ is a _bilinear_
function. If also $(\alpha x,y) = (x, \bar{\alpha } y)$ for $\alpha \in\FF$ and
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

If $(x,y) = \|x\| \|y\|$ then $\alpha x = y$ for some $\alpha \in\FF$.

There exists $x^*$ such that $\|x*\| \ge \|T e\|$ for $\|e\| = 1$.



## Polynomial Functional Calculus

Let $\FF[t]$ be the _ring_ of polynomials in the variable $t$ over the
scalar field $\FF$. Define $\Phi\FF[t]\to \mathcal{L}(V)$
by $\Phi(p) = p(T)$ where $p(t) = \sum_{n\ge0} \alpha_n t^n$.

__Exercise__. _Show $\Phi$ is a ring homomorphism_.

# Remarks

$I\supset R$, $R' = R$, $R^2\subseteq R$.

Infinite sums. What does $\sum_{x\in X} \alpha_x x$ for $\alpha_x\in\FF$ mean?
Define $+\colon \FF^I\times V^I\to V$ for any $I$ as follows: ...
We introduce $I$ since the scalars and vectors must be indexed by the same set.
We are really defining $+\colon 2^V\times\FF^I\times V^I\to V$...


[Grobner basis...]
