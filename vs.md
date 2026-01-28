---
title: Vector Space
author: Keith A. Lewis
institute: KALX, LLC
classoption: fleqn
fleqn: true
abstract: A mathematical sweet spot
header-includes:
	- \usepackage{bm}
...

\newcommand\bs[1]{\boldsymbol{{#1}}}
\newcommand\FF{\bs{F}}
\newcommand\CC{\bs{C}}
\newcommand\RR{\bs{R}}
\newcommand\NN{\bs{N}}
\newcommand\ZZ{\bs{Z}}
\newcommand\QQ{\bs{Q}}
\newcommand\LL{\mathcal{L}}
\newcommand\TT{\mathcal{T}}
\newcommand\PP{\mathcal{P}}
\newcommand\dom{\operatorname{dom}}
\newcommand\cod{\operatorname{cod}}
\newcommand\eval{\operatorname{eval}}
\newcommand\coeval{\operatorname{coeval}}
\newcommand\first{\operatorname{first}}
\newcommand\second{\operatorname{second}}
\renewcommand\ker{\operatorname{ker}}
\newcommand\ran{\operatorname{ran}}
\renewcommand\span{\operatorname{span}}
\newcommand\graph{\operatorname{graph}}
\renewcommand{\implies}{\Rightarrow}
\newcommand\zero{\bs{0}}

<!--
In Derrida's "Diseminations" he pointed out a preface to a book was
typically the last thing an author wrote. He thought clearly
about philosopy and was fond of Husserl, as was Gian-Carlo Rota.
-->

Everything in classical mathematics consists of sets with structure.
The structure is one or more functions on sets that satisfy given axioms.

Vector spaces occupy a sweet spot in mathematics. A vector space
over a field has a scalar multiplication and commutative vector addition
that satisfy distributive laws, and a couple of other axioms.

Functions between sets with structure that preserve the structure
are homomorphisms (like form). If the homomorphism is injective (one-to-one)
and surjective (onto) then it is an isomorphism.

Two vector spaces are isomorphic (same form) if and only if they have the same dimension.

The vector space of $n$-tuples of real numbers is the $n$-fold product
${\RR^n = \RR\times\cdots\times\RR = \{x = (x_1,\ldots,x_n)\mid x_1,\ldots,x_n\in\RR\}}$.
If ${\bm{n} = \{1,\ldots,n\}}$ this is equivalent to the set exponential 
${\RR^{\bm{n}} = \{\bm{n}\to\RR\} = \{\bm{x}\colon\bm{n}\to\RR\}}$, the set of all functions
from $\bm{n}$ to the real numbers.  The tuple
$x$ corresponds to the function $\bm{x}$
by ${\bm{x}(i) = x_i}$, ${i\in\bm{n}}$.  Going forward, we will drop
using bold face for the function $\bm{x}$ and distinguish this unexpected,
but useful, coincidence by saying tuple $x$ or function $x$ when it is
not clear from context.

This can be generalized from $\bm{n}$ to any finite set I.
The tuple version is the Cartesian product $\Pi_{i\in I} \RR$
and the function version is $\RR^I$.

A linear transformation is a function between vector spaces that preserves
scalar multiplication and vector addition. 

We work our way up to the definition of vector spaces by
considering some simpler sets with structures.

## Semigroup

The simplest useful set with structure is a _semigroup_. 
A semigroup is a set $S$ and a binary operator
$m\colon S\times S\to S$ that is _associative_, ${m(a,m(b,c)) = m(m(a,b),c)}$.
If we write $ab$ for $m(a,b)$
then $a(bc) = (ab)c$ so $abc$ is unambiguous.

Examples of semigroups are the integral, natural, real, and rational numbers
under multiplication and addition. They are also semigroups under
maximum and minimum values.

__Exercise__. _Show $\max\{a,\max\{b,c\}\} = \max\{\max\{a,b\},c\}$_.

Strings are a semigroup under concatenation.

## Monoid

A _monoid_ is a semigroup with an _identity element_. If $M$ is a monoid then
$e\in M$ is the identity element if $em = m = me$ for $m\in M$.

__Exercise__. _Show the identity element is unique_.

<details><summary>Solution</summary>
If $e$ and $e'$ are identity elements then $e' = e'e = e$.
</details>

If $S$ is a semigroup and $e\not\in S$ define $es = s = se$ for $s\in S$.

__Exercise__. _Show this makes $S$ into a monoid_.

_Hint_. Show $(ab)c = a(bc)$ for $a,b,c\in S\cup\{e\}$.

## $\RR^n$

You are probably familiar with the vector space of $n$-tuples of
real numbers
$$
\RR^n = \{x = (x_1,\dots,x_n)\mid x_j\in\RR, 1\le j \le n\}.
$$
_Scalar multiplication_ by $a\in\RR$ is
$$
a(x_1,\ldots,x_n) = (ax_1,\ldots,ax_n)
$$
and _vector addition_ is 
$$
(x_1,\dots,x_n) + (y_1,\dots,y_n) = (x_1 + y_1,\dots,x_n + y_n).
$$
The _standard basis_ is ${e_i = (0,\ldots,1,\ldots,0)}$, ${1\le i\le n}$,
where all entries are 0 except the $i$-th which is 1.

We can write this without $\ldots$'s using _projections_
${\pi_i^n\colon\RR^n\to\RR}$ where ${\pi_i(x) = x_i}$.
We write ${\pi_i^n}$ as $\pi_i$ when $n$ is evident from the context.
Note ${x = y}$ if and only if ${\pi_i(x) = \pi_i(y)}$, ${1\le i\le n}$ for ${x,y\in\RR^n}$.

__Exercise__. Show $\pi_i(ax) = a\pi_i(x)$ and
$\pi_i(x + y) = \pi_i(x) + \pi_i(y)$ for $a\in\RR$, $x,y\in\RR^n$.

Projections preserve the linear structure of $\RR^n$.

__Exercise__. _Show the standard basis satisfies $\pi_i(e_j) = \delta_{ij}$_.

_Hint_. Recall the Kronecker delta $\delta_{ij}$ is 1 if $i = j$ and 0 if $i\not=j$.

Every element of $\RR^n$ is a _linear combination_ of standard basis vectors.

__Exercise__. _Show $x = \sum_j x_j e_i$ for $x\in\RR^n$_.

_Hint_. Apply $\pi_i$ to each side and use the definition of the Kronecker delta.

Define $\zero\in\RR^n$ by $\pi_i(\zero) = 0$ for $1\le i\le n$.

__Exercise__. _Show $0x = \zero$ for $x\in\RR^n$_.

__Exercise__. _Show $x + \zero = x = \zero + x$ for all $x\in\RR^n$_.

This shows $\zero$ is the _identity element_ for vector addition.

__Exercise__. _Show $(a + b)x = ax + bx$ and $a(x + y) = ax + ay$ for $a,b\in\RR$ and $x,y\in\RR^n$_.

_Hint_. Consider $\pi_i((a + b)x)$ and $\pi_i(a(x + y))$.

This establishes the _distributive laws_ satisfied by scalar multiplication and vector addition.

__Exercise__. _Show $-x = -1x$ satisfies $x + (-x) = \zero$_.

_Hint_. Consider $x + (-x) = 1x + (-1x) = (1 + (-1))x$.

This shows $-x$ is the _additive inverse_ of $x\in\RR^n$.

__Exercise__. _Show $a(bx) = (ab)x$ for $a,b\in\RR$, $x\in\RR^n$_.

_Hint_: Use the fact multiplication is associative in $\RR$
so $\pi_(a(bx)) = a(\pi_i(bx)) = a(b\pi_i(x)) = (ab)\pi_(i)(x)$.

## Vector Space

There exist vector spaces beyond the special case of $\RR^n$.
A more powerful approach is to extract the essential properties and define
them through abstract axioms, allowing for a clearer and more general
perspective. A vector space is any set equipped with scalar multiplication
and vector addition, provided they satisfy fundamental rules established
in the preceding exercises. Specifically, vector addition forms an
abelian (commutative) group, while scalar multiplication adheres to the
distributive laws: $a(x + y) = ax + ay$ and $(a + b)x = ax + bx$,
for all $a, b \in \RR$ and $x, y \in V$. Additionally,
scalar multiplication must satisfy the associativity condition,
$a(bx) = (ab)x$, and the identity property, $1x = x$, for all $a, b \in \RR$
and $x \in V$.

A _subspace_ is a subset $W\subseteq V$ that is also a vector space.
Define the notation $\RR W = \{ax\mid a\in\RR, x\in W\}$ and 
$W + W = \{x + y\mid x,y\in W\}$.

__Exercise__ _Show if $W\subseteq V$, $\RR W\subseteq W$, and $W + W\subseteq W$
then $W$ is a vector space.

_Hint_: The assumptions guaranted scalar multiplication and vector addition are well-defined on $W$.
The other axioms follow from $V$ being a vector space.

The _span_ of a finite collection $\{v_i\}$, $i\in I$, is the set of all
linear combinations $\span \{v_i\} = \{\sum_{i\in I} a_i v_i\mid a_i\in\RR\}$.

__Exercise__. _Show $\span \{v_i\}_{i\in I}$ is a subspace_.

_Hint_: Use $a(\sum_i a_i v_i) = \sum_i a a_i v_i$
and $(\sum_i a_i v_i) + (\sum_i b_i v_i) = \sum_i (a_i + b_i) v_i$.

__Exercise__. _If $v_1,\ldots v_m$ are independent and $v$ is not in the
span of $v_i$ then $v_1,\ldots,v_m,v$ are independent_. 

_Hint_.  Suppose $a v + \sum_i a_i v_i = \zero$. If $a = 0$ 
then $a_i = 0$ for all $i$. If $a\not=0$ then $v$ is
in the span of the $v_i$.

This shows any finite-dimensional subspace is the span of independent vectors.


A _vector space_ is a set $V$ with scalar multiplication $\RR\times V\to V$
and
vector addition $V\times V\to V$

The _span_ of a collection of vectors $v_i\in\RR^n$, $i\in I$, is the set
of all finite linear combinations $\sum_{i\in I} a_i v_i$, $a_i\in\RR$.
A collection of vectors is _independent_ if $\sum_i a_i v_i = \zero$ implies $a_i = 0$ for all $i$.
A _basis_ of $\RR^n$ is a collection of vectors that are independent and span $\RR^n$.

__Exercise__. _If $(v_i)_{i\in I}$ are dependent then there exists $j\in I$
with $v_j = \sum_{i\not=j} b_i v_i$_.

_Hint_. Dependent means not independent. If $\sum_i a_i v_i = \zero$ but not
all $a_i = 0$ then there exists $j\in I$ with $a_j\not=0$. Show $b_i = -a_i/a_j$ for $i\not=j$.

## Vector Space

$\RR^n$ is a special case of the vector space of all functions from a
set $I$ to $\RR$, $\RR^I = \{x\colon I\to\RR\}$ where $I = \{1,\ldots,n\}$.
Scalar multiplication is ${(ax)(i) = ax(i)}$ and vector addition
is ${(x + y)(i) = x(i) + y(i)}$ for $i\in I$.

### Examples

A _linear ordinary differential equation_ constrains a function $y = y(x)$ 
by requiring its
derivatives satisfy $\sum_{i=0}^n a_n(x) d^ny/dx^n = b(x)$.
If $b(x) = 0$ we say the solution is _homogeneous_.

__Exercise__. _The set of homogeneous solutions of a linear ODE form a vector space_.

_Hint_ If $y$ is a homogeneous solution then so is $ay$ for $a\in\RR$.
If $y$ and $z$ are homogeneous solutions then so is $y + z$.

If, by hook or by crook, we can find a single inhomogeneous solution $y_b$
then we can find all solutions.

__Exercise__. _Show every solution to the inhomogeneous equation has
the form $y_b + z$ where $z$ is a homogeneous solution_.

_Hint_. If $y$ is any solution to the inhomogeneous equation
then $y_b - y$ is a homogeneous solution.

For first order linear ordinary differential equations we can assume the
coefficient of $dy/dx$ is $a_1(x) = 1$ and normalize to 
$dy/dx + a(x) y = b(x)$.

__Exercise__. _If $A'(x) = a(x)$ then $d(e^{A(x)}y)/dx = e^{A(x)}(dy/dx + a(x)y)$_.

Multiplying both sides of $dy/dx = a(x)y$ by the _integrating factor_ $e^{A(x)}$
shows $e^{A(x)}y = \int e^{A(x)} b(x)\,dx + C$ for some constant $C$.

__Exercise__. _Show every solution of $dy/dx + a(x)y = b(x)$ has
the form $y = ce^{-A(x)}\int e^{A(x)} b(x)\,dx$ for some constant $c$_.

In the case of second order linear ODE's there is a wonderland
of solutions. 

## Linear Transformation

A _linear transformation_ is a function $T\colon\RR^n\to\RR^m$ that
respects the vector space structure: $T(ax) = a(Tx)$ and $T(x + y) = Tx + Ty$
for $a\in\RR$, $x,y\in\RR^n$. 

__Exercise__. _Show if $T$ is linear then $T\zero = \zero$_.

_Hint_. Note $T\zero + T\zero = T(\zero + \zero) = T\zero$
and add $-T\zero$ to both sides.

__Exercise__. _If $T$ is linear show $T(ax + y) = aTx + y$, $a\in\RR$, $x,y\in\RR^n$_.

_Proof_: Note $T(ax + y) = T(ax) + Ty = aTx + Ty$.

__Exercise__. _Show $T$ is linear if $T(ax + y) = aTx + y$ for $a\in\RR$, $x,y\in\RR^n$_.

_Hint_. Take $y = \zero$ and $a = 1$ noting $1x = x$.

The collection of all linear transformations from $\RR^n$ to $\RR^m$
also form a vector space. Scalar multiplication is
$(aT)x = a(Tx)$ and vector addition is $(T + U)x = Tx + Ux$ for $a\in\RR$,
$T,U\colon\RR^n\to\RR^m$ linear, and $x\in\RR^n$. This is our first inkling that there is more
to vector spaces than just $\RR^n$.

The _matrix_ of a linear transformation $T\colon\RR^n\to\RR^m$ under
the standard basis is $[t_{ij}]$ where $t_{ij}\in\RR$, $1\le i\le n$,
$1\le j\le m$ are defined by $Te^n_i = \sum_j t_{ij}e^m_j$.
This follow from $Te^n_i\in\RR^m$ being a linear combination of $e^m_j$, $1\le j\le m$.

If $S\colon\RR^m\to\RR^k$ is a linear transformation then the matrix
of the composition $U = ST\colon\RR^n\to\RR^k$ is ${u_{ik} = \sum_j t_{ij}s_{jk}}$_.

__Exercise__. _Prove this_.

_Hint_. Start with $STx = S(\sum_i t_{ij}e_i) = \sum_i t_{ij}Se_i = \sum_i t_{ij}\sum_j s_{jk}e_k$.

This shows matrix multiplication is just composition of linear transformations.
It also shows calculations involving the standard basis are cumbersome.

Werner Heisenberg reinvented matrix multiplication.
His theory of the orbital levels of a hydrogen atom used $e_{ij}$ to
represent a jump of an electron from orbital level $i$ to orbital level $j$.
His physical intuition led him to the rule $e_{ij}e_{kl}$ was a jump
from level $i$ to level $l$ if and only if $j = k$ so
$e_{ij}e_{kl} = \delta_{jk}e_{il}$.

__Exercise__. _Show $(\sum_{ij} t_{ij}e_{ij})(\sum_{kl} s_{kl} e_{kl})
= \sum_j t_{ij}s_{jl} e_{il}$_.

This shows we can identify the vector space of linear transformations from $\RR^n$
to $\RR^m$ with ${\{(t_{ij})\mid 1\le i\le n, 1\le j\le m\}}$.
In basic linear algebra courses it is common to define row vectors and column
vectors of a matix. Row $i$ is the vector having $j$-th projection $t_{ij}$
and columns $j$ is the vector having $i$-th projection $t_{ij}$, but this does
not generalize to higher dimensions.

## Tensor

Given two sets $A$ and $B$ the set exponential ${B^A = \{f\colon A\to B\}}$
is the set of all functions from $A$ to $B$. The _exponential tensor_ with index set
$I$ is $R^I$.
It is a vector space with scalar multiplication $(ax)(i) = ax(i)$ and
vector addition $(x + y)(i) = x(i) + y(i)$, $a\in\RR$, $x,y\in\RR^I$, $i\in I$.

__Exercise__. _Show $\RR^n$ can be identified with $\RR^{\bs{n}}$ where $\bs{n} = \{1,\ldots,n\}$_.

_Hint_. The vector $x\in\RR^n$ corresponds to the function $\bs{x}\in\RR^\bs{n}$ via
$x_i = \bs{x}(i)$, $i\in\bs{n}$.

__Exercise__. _Show linear transformations from $\RR^n$ to $\RR^m$ can be
identified with $\RR^{\bs{n}\times\bs{m}}$_.

_Hint_. Recall $\bs{n}\times\bs{m} = \{(i,j)\mid 1\le i\le n, 1\le j\le m\}$.
The matrix $[t_{ij}]$ can be identifed with $\bs{t}\in\RR^{\bs{n}\times\bs{m}}$
by $t_{ij} = \bs{t}(i,j)$.


A _linear functional_ is a function $f\colon\RR^n\to\RR$, i.e., a linear
transformation where $m = 1$.

Projections are linear tranformations. In this case $m = 1$ and we call them _linear functionals_.

A vector space is more than a $n$-tuple of real numbers,
$\RR^n = \{(x_1,\ldots,x_n)\mid x_j\in\RR, 1\le j\le n\}$.

Given two sets $A$ and $B$ the set exponential ${B^A = \{f\colon A\to B\}}$
is the set of all functions from $A$ to $B$.  Let's write $B^A$
suggestively as ${f\in\{A\to B\}}$.
If $A$ and $B$ are sets with structure
we want to consider functions that preserve the structure
and write that as ${[A\to B]}$.  A function ${f\in [A\to B]}$ is a
_homomorphism_, derived from the Greek homos(ὁμός), meaning alike,
and morphe(μορφή), meaning form.

A homomorphism $f\in [A\to B]$ that is one-to-one(injective) and
onto(surjective) is a one-to-one correspondence(isomorphism).
We use the notation $A\cong B$ to denote the existence of
a bijection.

__Exercise__. _Show $A\cong A$, $A\cong B$ implies $B\cong A$,
and $A\cong B$, $B\cong C$ imply $A\cong C$_.

The exercise shows $\cong$ is an _equivalence relation_.
This generalizes the notion of equality. Two things can
be the "same" without being equal. In the case of sets,
two sets are isomorphic if and only if they have the
same cardinality.

A game mathematicians like to play is to determine when
sets with structure are isomorphic.  Sets and vector spaces hold a sweet spot in
the mathematical world of sets with structure. Sets have no
structure, they are just a bag of _elements_ that are _members_ of the set.
Two sets have the same _cardinality_ if and only if there is a bijection
between them.

Two vector spaces are
isomorphic if and only if they have the same dimension.  This is very
different from the case for, e.g., groups, rings, and fields.  Only a
Dedekind complete totally ordered Archemedian field can top this; it must be isomorphic
to the real numbers. Lie groups take a distant second. If a group has a
topology making the multiplication continuous there is a very beautiful
theory due to Killing, fixed up in Elie Cartan's PhD thesis, providing
a complete classification.

The next game they like to play is determining when two homomorphisms
are equivalent. A homomorphism between vector spaces is called a _linear
operator_.  Keep reading to find out how the Jordan canonical form solves
this in finite dimensions. Along the way we will develop a theory that can be widely applied
to any linear system.

## Set

Everything in math is a set.
We write $a\in A$ to indicate $a$ is an _element_, or _member_, of $A$.
The set of function from $A$ to $B$ is the
_set exponential_ $B^A = \{f\colon A\to B\}$. 
A function is a set defined by its _graph_ $\{(a,f(a))\mid a\in A\}$
contained in the _cartesion product_ $A\times B$.
Kazimierz Kuratowski improved Norbert Wiener's definition of
an _ordered pair_ $(a,b)\in A\times B$ 
as the set $\{a,\{a,b\}\}$.

__Exercise__. _Show $\cap\{a,\{a,b\}\} = \{a\}$ and $\cup\{a,\{a,b\}\} = \{a,b\}$_.

_Hint_ For any set $A$, $\cap A$ is the intersection $\cap\{x\mid x\in A\}$;
$x$ belongs to $\cap A$ if and only if $x$ is a member of every element of $A$.
For any set $A$, $\cup A$ is the union $\cup\{x\mid x\in A\}$;
$x$ belongs to $\cup A$ if and only if $x$ is a member of some element of $A$.

The intersection identifies the first item of the pair. If the union is
a _singleton_, a set containing only one element, then the second item is equal to the first item,
otherwise we remove the first item to identify the second item.

Functions $f\colon A\to B$ and $g\colon B\to C$ can be _composed_.
The composition of $f$ and $g$ is $g\circ f\colon A\to C$ defined
by $g\circ f(a) = g(f(a))$, $a\in A$.
We also write $gf$ for $g\circ f$.

__Exercise__. _If in additon $h\colon C\to D$ show
$h(gf) = (hg)f$_.

Function composition is _associative_.
Every set has an _identity_ function $1_A\colon A\to A$ defined by
$1_A(a) = a$, $a\in A$.

__Exercise__. _If $f\colon A\to B$ show $f1_A = f$
and $1_B f = f$_.

A function $f\colon A\to B$ is _one-to-one_, or _injective_,
if $f(a) = f(a')$ implies $a = a'$, $a,a'\in A$.
A function is _onto_, or _surjective_, if for every
$b\in B$ there exists an $a\in A$ with $f(a) = b$.
A function is a _one-to-one correspondence_, or _bijective_,
if it is one-to-one and onto. Two finite sets are the same size
if they have the same number of elements. Bijections classify
possibly infinite sets by _cardinality_.

## Category

Okay, I lied.  Not everything in math is a set. There is an alternate foundation of
mathematics called _category theory_ involving _objects_ and _arrows_
having an associative composition for arrows and identity arrows for each object. The
above exercises show sets and functions are objects and arrows for the category $\mathbf{Set}$.
Samuel Eilenberg and Saunders Mac Lane noticed many proofs in their area, algebraic
topology, were based on these simple notions. The goal of algebraic topology is
to classify when two topologial spaces are isomorphic, i.e., there is 
a continuous bijection between them. As of 2025, this problem remains unsolved.

A funny thing happened when people tried to define sets using only objects
and arrows. Logicians like to say, "The language of set theory is epsilon."
By that they mean set theory can be defined using first-order logic and axioms
for set membership. It turned out the notion of membership
in category theory is a little tricky.

Topos Theory theory tries to define sets using only objects and arrows.
The best anyone has come up with so far for membership is a _subobject
classifier_ $\Omega$ for which there exists (fasten your seatbelt)
a morphism from a terminal object $1\to\Omega$ such that for each
monomorphism $j\colon U\to X$ there exists a unique $\chi_j\colon
X\to\Omega$ such that $\chi_j j\colon U\to\Omega$ is equal to the composition of
$U\to 1$ and $1\to\Omega$. Phew!
No wonder some people think category theory is useless.

Putting on your category theory glasses can help see classical set theory results
more clearly.
It turns out set membership is a special case. For example,
the points of a sphere are members of the sphere, but each
point also determines a unique tangent plane to the sphere.
This is an example of a [_sheaf_](https://ncatlab.org/nlab/show/sheaf)
that generalizes set membership.

The axioms of category theory are so simple compared to set theory it
is no surprise their application is more complicated. 
Fighting to establish true statements with one hand tied behind your
back forces you to get to the bottom of what is essential.

We can define one-to-one and onto using only functions.

__Exercise__. _Show $f\colon A\to B$ is one-to-one if and only if $fg = fh$ implies
$g = h$ for $g,h\colon C\to A$_.

_Hint_: $fg = fh$ if and only if $f(g(c)) = f(h(c))$ for all $c\in C$.

__Exercise__. _Show $f\colon A\to B$ is onto if and only if $gf = hf$ implies
$g = h$ for $g,h\colon B\to C$_.

_Hint_: $gf = hf$ if and only if $g(f(a)) = h(f(a))$ for all $a\in A$.
For all $b\in B$ there exists $a\in A$ with $f(a) = b$.

In a general category these two cancellation properties define _mono_ and _epi_ arrows.
In the category $\mathbf{Set}$ these turn out to be the same
as injective and surjective.

__Exercise__. _Show $f\colon A\to B$ is one-to-one if and only if
it has a left inverse_(retraction).

_Hint_: A _left inverse_ is a function $f^\dashv\colon B\to A$ with $f^\dashv f = 1_A$.

<details><summary>Solution</summary>
If $f$ is one-to-one and $f(a) = b$ define $f^\dashv(b) = a$. This is well-defined
since $f$ is one-to-one, i.e., if $f(a') = b$ then $a = a'$.
</details>

__Exercise__. _Show if $f\colon A\to B$ is a retraction then $f$ is mono_.

_Hint_: If a left inverse exists and $fg = fh$ then pre-compose the left inverse to get $g = h$.

__Exercise__. _Show $f\colon A\to B$ is onto if and only if
it has a right inverse_(section).

_Hint_: A _right inverse_ is a function $f^\vdash\colon B\to A$ with $ff^\vdash = 1_B$.

__Exercise__. _Show if $f\colon A\to B$ is a section then $f$ is mono_.

_Hint_: If a right inverse exists and $gf = hf$ then post-compose the right inverse to get $g = h$.

It is also possible to define an ordered pair using only functions.
Define _projections_ $\pi_A\colon A\times B\to A$ by $\pi_A(a,b) = a$ and 
$\pi_B\colon A\times B\to B$ by $\pi_B(a,b) = b$.

__Exercise__. _If $f\colon C\to A$ and $g\colon C\to B$ show there
exists $h\colon C\to A\times B$ with $\pi_A h = f$
and $\pi_B h = g$_.

_Hint_: Of course $h(c) = (f(c), g(c))$, $c\in C$.

This characterizes the cartesian product $A\times B$. Let $P$ be any set
with functions $p_A\colon P\to A$, $p_B\colon P\to B$
with the property in the previous exercise, then $P$
is in one-to-one correspondence with $A\times B$.

__Exercise__. _Prove this_.

<details><summary>Solution</summary>
Since $p_A\colon P\to A$ and $p_B\colon P\to B$ there exists
$h\colon P\to A\times B$ with $\pi_A h = p_A$ and $\pi_B h = p_B$.
Likewise, there exists $k\colon A\times B\to P$ with $p_A k = \pi_A$ and $p_B k = \pi_B$.
Show $h$ is a left inverse of $k$ and $k$ is a right inverse of $h$.
???
</details>

Set product and exponential are connected by _currying_. Functions from
$A\times B$ to $C$ are in one-to-one correspondence with functions
from $A$ to functions from $B$ to $C$.
If $f\colon A\times B\to C$ define $f,\colon A\to(B\to C)$
by $f,a(b) = f(a,b)$.
If $g\colon A\to(B\to C)$ define $g`\colon A\times B\to C$
by $g`(a,b) = ga(b)$.

__Exercise__. _If $f\colon A\times B\to C$ show $(f,)` = f$
and if $g\colon A\to(B\to C)$ show $(g`), = g$_.

Evaluation of a function is defined by $\eval = \eval_A^B\colon A^B\times B\to A$ with
$\eval(f,b) = f(a)$.

__Exercise__. !!!connect currying and eval!!!

Our theme is to define everything in terms of sets and
functions with an eye toward computer implementation.  Every programming
language allows you to define functions and call them on types belonging
to a set. We provide mathematical names that can be translated into
any computer language.

## $\RR^n$

There are two ways to think about $\RR^n$, one is as a set of tuples,
the other is as a set of functions. These two perspectives are a source of confusion and insight.

An impoverished notion of a vector is that it is a tuple of real numbers
${x = (x_1,\ldots,x_n)}$.  Given a natural number $n\in\NN$, let
${\RR^n = \{(x_1,\ldots,x_n)\mid x_i\in\RR, 1\le i\le n\} = \prod_{1\le i\le n}\RR}$
be the cartesian product of $n\in\NN$ copies of the real numbers.
If bold ${\bs{n}}$ is the set ${\{1,\ldots,n\}}$ then ${i\in\bs{n}}$ is a shorter
notation for ${1\le i\le n}$. 
We can identify $\RR^n$ with $\RR^{\bs{n}}$ where the
tuple ${(x_i)_{i\in\bs{n}}}$ corresponds to the function
$\bs{x}\colon\bs{n}\to\RR$ defined by $\bs{x}(i) = x_i$, $i\in\bs{n}$.

__Exercise__. _Show $\prod_{i\in\bs{n}}\RR$ is in one-to-one correspondence with $\RR^{\bs{n}}$_.

_Hint_: If ${\pi_i\colon\prod_{i\in\bs{n}}\RR\to\RR}$ are the projections $\pi_i(x) = x_i$, $i\in I$
define $x\mapsto\bs{x}$ by $\bs{x}(i) = \pi_i(x)$ and show it is bijective.

A more powerful notion is to consider a vector as an element of the _vector space_ of all functions
from an _index set_ $I$ to the real numbers, $\RR^I$.
The tuple $x = (x_i)_{i\in I}$ in $\prod_{i\in I}\RR$ corresponds to a function
${\bs{x}\colon I\to\RR}$ in $\RR^I$ defined by $\bs{x}(i) = x_i$, $i\in I$.
In what follows we just write $x$ for $\bs{x}$ and leave it to you to figure
out from context if a vector is a tuple or a function.

__Exercise__. _For any set $I$, show $\prod_{i\in I}\RR$ is in one-to-one correspondence with $\RR^{I}$_.

_Hint_: If $\pi_i\colon \prod_{i\in I}\RR\to\RR$ are the projections defining the product
then $\bs{x}(i) = \pi_i(x)$.

I -> (Pi_i R -> R)

### Scalar Multiplication and Vector Addition

Scalar multiplication and vector addition on $\RR^I$ are defined _pointwise_ by
${(ax)(i) = a(x(i))}$ and ${(x + y)(i) = x(i) + y(i)}$, $a\in\RR$, $x,y\in\RR^I$.

### Axioms

For any set $I$, $a,b\in\RR$, and $x, y, z\in\RR^I$ show the following:

__Exercise__. _$x + (y + z) = (x + y) + z$_.

__Exercise__. _$x + y = y + x$_.

__Exercise__. _$\zero + x = x$ where $\zero(i) = 0$, $i\in I$_.

__Exercise__. _$x + (-x) = \zero$ where $(-x)(i) = -(x(i))$, for $i\in I$_.

__Exercise__. _$a(bx) = (ab)x$_.

__Exercise__. _$1x = x$_.

__Exercise__. _$a(x + y) = ax + ay$_.

__Exercise__. _$(a + b)x = ax + bx$_.

_Hint_: Use the pointwise definitions and the properties of real numbers.

The exercises are the axioms for an _abstract vector space_ with scalar
multiplication ${\RR\times V\to V}$ where ${(a,x)\mapsto ax = xa}$ and
binary addition ${V\times V\to V}$ where ${(x,y)\mapsto x + y}$. The
first four axioms show vector addition is an abelian (commutative)
group. The last two axioms are the _distributive laws_ connecting scalar
multiplication and vector addition. Every abstract vector space
can be represented by $\RR^I$ for some set $I$, but this is not a trivial result.

Proofs involving only the abstract axioms are considered more elegant.

If $x\in\RR^I$ then $(0x)(i) = 0(x(i)) = 0$ and $(1x)(i) = 1(x(i)) = x(i)$ for all $i\in I$ so
$0x = \zero$ and $1x = x$. These hold for any vector space, not just $\RR^I$.

__Exercise__. (Zero is unique) _Show if $\zero' + v = v$ for all $v\in V$ then $0' = 0$_.

_Hint_: $\zero + v = v$ so $\zero' + v = \zero + v$. Add $-v$ to both sides.

__Exercise__. _Show $0v = \zero$ for all $v\in V$_.

_Hint_: Show $0v + v = v$ and use the previous exercise.

__Exercise__. _For any vector space $V$ show ${v + v = v}$ implies ${v = \zero}$ for all ${v\in V}$_.

<details>
<summary>Solution</summary>
$$
\begin{aligned}
v + v &= v \\
	&\quad\langle x = y\implies x + z = y + z\mid x\leftarrow v + v,y\leftarrow v,z\leftarrow -v\rangle\\
(v + v) + (-v) &= v + (-v) \\
	&\quad\langle (x + y) + z = x + (y + z)\mid x\leftarrow v, y\leftarrow v, z\leftarrow -v\rangle\\
v + (v + (-v)) &= v + (-v) \\
	&\quad\langle x + (-x) = \zero\mid x\leftarrow v\text{ twice }\rangle\\
v + \zero &= \zero \\
	&\quad\langle x + \zero = x\mid x\leftarrow v\rangle\\
v &= \zero
\end{aligned}
$$
</details>

This may seem to be a tedoious way to prove an obvious result, but it is a simple
example of the power of mathematics. Unlike other areas of human endeavour,
whenever two mathematicians disagree it is possible to get to the bottom of things.

### Standard Basis

The _standard basis_ of $\RR^n$ is ${e_i\in\RR^n}$, ${i\in\bs{n}}$,
where ${e_i = (0,\ldots,1,\ldots,0)}$ with all elements $0$ except for a
$1$ in the $i$-th position.  It is plausible that ${x = (x_1,\ldots,x_n)
= x_1 e_1 + \cdots + x_n e_n}$ for ${x\in\RR^n}$, but you should always
be wary of definitions involving dots.

More generally, the standard basis of $\RR^I$ is ${e_i\in\RR^I}$,
${i\in I}$, where ${e_i(j) = \delta_{ij}}$ for $j\in I$, where $\delta_{ij}$ is
the _Kronecker delta_ defined by ${δ_{ij} = 1}$ if ${i=j}$ and
${δ_{ij} = 0}$ if ${i\not=j}$. We write $e^I_j$ to indicate
the domain if needed.

__Exercise__. _If $I$ is finite, show $x = \sum_{i\in I} x(i)e_i$ for $x\in\RR^I$_.

_Hint_: Evaluate the putative equality at $j\in I$.

## Linear Transformation

A _linear transformation_ between vector spaces is a function ${T\colon V\to W}$
that preserves the scalar multiplication and vector addition: $T(ax) = aTx$ and
${T(x + y) = Tx + Ty}$, ${a\in\RR}$, ${x,y\in V}$.
The collection of all linear operators from $V$ to $W$ is denoted $\LL(V,W)$.

__Exercise__. _Show if $T\colon V\to W$ is a function with ${T(ax + y) = aTx + y}$, ${a\in\RR}$, ${x,y\in V}$
then $T$ is a linear operator_.

_Hint_: Take $y = \zero$ and $a = 1$.

The collection $\LL(V,W)$ can be made into a vector space. Define scalar multiplication
by $(aT)v = a(Tv)$ and vector addition by $(T + S)v = Tv + Sv$, $a\in\RR$, $T,S\in\LL(V,W)$.
One could check the scalar multiplication and vector addition satisfy
the axioms for an abstract vector space but we will show a simple way to establish this 
once we define _matrix_.

### Matrix

If $T\in\LL(\RR^I,\RR^J)$ then the image of the $i$-th standard basis
element in $\RR^I$ under $T$ can be written
$Te^I_i = \sum_{j\in J} t_{ij} e^J_j$
for some scalars $t_{ij}\in\RR$ when $I$ and $J$ are finite.
The _matrix_ of $T$ is $[t_{ij}]_{i\in I, j\in J}$.

If $S\colon\RR^J\to\RR^K$ then $U = ST\colon\RR^I\to\RR^K$.

__Exercise__. _Show the matrix of the composition $U = ST$ is
${u_{ik} = \sum_{j\in J} s_{ij}t_{jk}}$, for $i\in I$, $k\in K$_.

Matrix multiplication is just composition of linear operators.
Define $E_{ij}\colon\RR^I\to\RR^J$ to be the linear operator
with matrix $[\delta_{ij}]$.

__Exercise__. _Show $E_{ij}E_{k,l} = \delta_{jk}E_{il}$_.

Werner Heisenberg reinvented matrix multiplication.
His interpretation was $E_{ij}$ represented a jump of an
electron from orbital
level $i$ in a hydrogen atom to orbital level $j$. He positied
$E_{ij}E_{kl}$ was a jump from level $i$ to level $l$ if and
only if $j = k$. Eventually Pascual Jordan pointed this out to him.

This shows linear operators from $\RR^I$ to $\RR^J$ are in one-to-one correspondence
with $\RR^{I\times J}$. Define a function from $T\in\LL(\RR^I,\RR^J)$
to $\bs{T}\in\RR^{I\times J}$ by $\bs{T}(i,j) = t_{ij}$ where $[t_{ij}]$
is the matrix of $T$.

__Exercise__. _Show $\LL(\RR^I,\RR^J)$ is isomorphic to $\RR^{I\times J}$_.

Since $I\times J$ is a set, $\RR^{I\times J}$ is a vector space.
This shows $\LL(\RR^I,\RR^J)$ is a vector space.

### Dual

The _dual_ of a vector space $V$ is the set of all _linear functionals_
from $V$ to $\RR$, $V^* = \LL(V,\RR)$.
We write the _dual pairing_ $\langle v, v^*\rangle = v^*(v)$ for $v\in V$, $v^*\in V^*$.

The _standard dual basis_ of $\RR^I$, $e_i^*\colon\RR^I\to\RR$ is
defined by $e_i^*(x) = x(i)$, $i\in I$.

__Exercise__. _Show $e_i^*$ is linear for all $i\in I$_.

__Exercise__. _Show $\langle e_i, e^*_j\rangle = \delta_{ij}$, $i,j\in I$_.

__Exercise__ _Show the matrix of $T\in\LL(\RR^I,\RR^J)$ is ${t_{ij} = \langle Te_i, e^*j\rangle}$,
$i\in I$, $j\in J$_.

## Operator Structure

We now turn to the problem of characterizing linear operators up to similarity.
Operators $T,U\colon V\to V$ are similar if and only if there exists an
invertible $S\colon V\to V$ with $T = S^{-1}US$.

__Exercise__. _The matrix of $T$ under any basis $(v_i)$ equals the matrix of $U$
under the basis $(Sv_i)$_.

_Hint_: The matrix of $T$ is $t_{ij} = v_j^*Tv_i$ where $(v_j^*)$ is the dual basis.

Linear operators are overgrown numbers.
We can add and multiply them. Addition is commutative but multiplication might not be.

If $V$ is one-dimensional then $Tv = t v$, $v\in V$, for some number $t \in\CC$.
The number $t$ corresponds to the linear operator of scalar multiplication
by $t$.

__Exercise__. _Prove this_.

_Hint_: Pick any $v\in V$ that is not the zero vector. Since $Tv\in V$
there exists $\lambda\in\CC$ with $Tv = \lambda v$.

We say $T$ is diagonalizable (d'able for short) if there exists a basis $(v_i)$ of $V$
with $Tv_i = t_i v_i$ for some $t_i\in\CC$. We say $v_i$ is and _eigenvector_
with _eigenvalue_ $t_i$.

__Exercise__. _Show the matrix of $T$ under the basis $(v_i)$ is $t_{ij} = t_i\delta_{ij}$_.

$$
T = \begin{bmatrix}
t_1 & 0 & 0 \\
0 & \ddots & 0 \\
0 & 0 & t_n \\
\end{bmatrix}
$$

We will prove later that every operator $T\colon V\to V$
is almost d'able in the sense that given $\epsilon > 0$ there exists
d'able $T_\epsilon\colon V\to V$ with $\|T_\epsilon - T\| < \epsilon$.

You will prove now that Every d'able operator is near to a d'able operator with distinct eigenvalues.

__Exercise__. _If $T$ is d'able and $\epsilon > 0$ then there exists $T_\epsilon$
with distinct eigenvalues satisfying ${\|T_\epsilon - T\| < \epsilon}$_.

_Hint_: The norm of a d'able operator is the maximum of the modulus of every eigenvalue.

!!!Uses vector space norm.

if the dimension of $V$ is greater than 1.
For any $T\colon V\to V$ we say $v\in V$ is an _eigenvector_ corresponding
to the _eigenvalue_ $\lambda\in\CC$ if ${v\not=\zero}$ and ${Tv = \lambda v}$.
The first important fact about eigenvectors is that if they have different
corresponding eigenvalues they must be independent.

__Exercise__. _If $Tv = \lambda v$, $Tw = \mu w$, $\lambda,\mu\in\CC$, $v, w\in V$, and $\lambda\not=\mu$,
then $v$ and $w$ are independent_.

_Hint_:
If $av + bw = \zero$ then $T(av + bw) = a\lambda v + b\mu w = \zero$.
Subtract $\lambda(av + bw) = 0$ from
both sides to get $b(\mu - \lambda)w = \zero$.
Conclude $b = 0$ and $a = 0$.

In general, if $(\lambda_j)$ are $m$ distinct eigenvalues corresponding to
eigenvectors $(v_j)$ then the eigenvectors are linearly independent.
The previous exercise establishes this for $m = 2$ and the induction
step is similar to proof for two distinct eigenvalues.

__Exercise__. _Show $(T - \lambda I)\zero = \zero$ for any
linear operator $T$ and $\lambda\in\CC$_.

_Hint_: $\zero$ is in the kernel of every linear operator.

__Exercise__. _Show non-zero $v\in V$ is an eigenvector corresponding
to the eigenvalue $\lambda\in\CC$ if and only if $v\in\ker T - \lambda I$_.

The _spectrum_ of an operator is $\sigma(T) = \{\lambda\in\CC\mid T - \lambda I\text{ is not invertible}\}$.
Recall $T - \lambda I$ is not invertible if and only if $\ker T - \lambda I \not= \{\zero\}$. 

__Exercise__. _Show if $\lambda\in\sigma(T)$ there exists an eigenvector
having eigenvalue $\lambda$_.

If the cardinality of $\sigma(T)$ equals the dimension of $V$ we
say $T$ is _diagonalizable_. Let's abbreviate this to _d'able_.
If $V$ has dimension $n$ and $\sigma(T) = \{\lambda_1,\ldots,\lambda_n\}$
then there are independent eigenvectors $\{v_1,\ldots,v_n\}$ with $Tv_j = \lambda_j v_j$.

__Exercise__. _Show $\{v_1,\ldots,v_n\}$ is a basis of $V$_.

If $T$ is d'able then the spectrum completely determines $T$.
For $\lambda\in\sigma(T)$ there exists $v_\lambda\not=\zero$ with $Tv_\lambda = \lambda v_\lambda$.
Since $\{v_\lambda\mid\lambda\in\sigma(T)\}$ is a basis of $V$
every $v\in V$ can be written $v = \sum_{\lambda\in\sigma(T)} t_\lambda v_\lambda$
for some $t_\lambda\in\CC$.
The overgrown number $T$ satifies $Tv = \sum_{\lambda\in\sigma(T)} t_\lambda \lambda v_\lambda$.

You might be thinking d'able operators are a special case, but we will prove later that
every linear operator can be appoximated by them. Not every result about d'able operators
can be used for the general theory but it is easy to prove some results for d'able operators.

If $T\colon V\to V$ then $I, T, T^2, \ldots, T^{n^2}$ must be dependent
since $[T\to T]$ is a vector space with dimension $n^2$ where $n$
is the dimension of $V$.  Hence there exists a polynomial $p$ of order
$n^2$ with $p(T) = 0$.  For a d'able operator $T$ there is a more
drastic result that there is a polynomial of order $n$ with $p(T) = 0$.

__Exercise__. _If $T\colon V\to V$ is d'able and $p(z) = \prod_{\lambda\in\sigma(T)} (z - \lambda)$
then $p(T) = 0$_.

_Hint_: Show $p(T)v_\lambda = 0$ if $Tv_\lambda = \lambda v_\lambda$.

If it is true that every linear operator can be approximated by
a d'able operators then this holds for all operators.

__Exercise__. _If $T_n\to T$ in norm then $p(T_n) \to p(T)$ in norm
for any polynomial $p$_.



If $T$ is a linear operator on $V$ and $TM\subseteq M$ is an invariant
subspace define $T/M\colon V/M\to V/M$ by
$v + M \mapsto Tv + M$.

__Exercise__. _Show $T/M$ is well-defined_.

_Hint_: Show if $v + M = w + M$ then $Tv + M = Tw + M$.
Since $v - w\in M$ we have $T(v - w)\in M$.

Show $T\oplus M\colon M\oplus V/M\to M\oplus V/M$ is equivalent to $T$

$T\colon V\to V$ and $U\colon W\to W$ are _equivalent_ if
there exists an isomorphism $E\colon V\to W$
with $ET = UE$.

Every linear operator $T\colon\RR^I\to\RR^I$ is an element of the vector space
$\RR^{I\times I}$ so $I, T, T^2,\ldots,T^{|I\times I|}$ are linearly dependent
and there exists a polynomial $p$ of degree $|I\times I|$ with $p(T) = 0$.
But there is a drastic reduction. For every linear operator $T\colon\RR^I\to\RR^I$

<!--

## Tensor

A _tensor_[^1] of _rank_ $m$ is a vector space where the index set is a cartesian product
of $m$ index sets ${I = I_1\times\cdots\times I_m = \prod_{j\in\bs{m}} I_j}$.
A rank 1 tensor is a vector.
The _shape_ of a tensor is its index set.
First we consider rank 2 tensors with natual number index sets.
More precisely, if $n\in\NN$ is a natural number we use
the index set $\bs{n} = \{1,\ldots,n\}$
or $\bs{n} = \{0,\ldots,n-1\}$ if we are considering computer applications.

[^1]: This is the definition of a tensor common in machine learning. The mathematical
definition of a tensor is quite different.

### Rank 2

A rank 2 tensor is a _matrix_.
If $x\in\RR^{n\times m}$, $n,m\in\NN$, then
the $i$-th row is a vector in $\RR^m$ with $j\mapsto x(i, j)$, $j\in\bs{m}$,
and the $j$-th column is a vector in $\RR^n$ with $i\mapsto x(i, j)$, $i\in\bs{n}$.

we can define
$x_{i,j} = x(i, j)$, $i\in\bs{n}$, $j\in\bs{m}$. 
Thinking of $x$ as the two-dimensional matrix $[x_{i,j}]$,
the $i$-th row of $x$ is ${(x_{i,j})_{j\in\bs{m}}}$
and the $j$-th column is ${(x_{i,j})_{i\in\bs{n}}}$.
In the Python [numpy](https://numpy.org/doc/stable/reference/arrays.ndarray.html)
package the $i$-th row is expressed as $x[i,:]$ and the $j$-th column as $x[:,j]$.

__Exercise__. _Show $\RR^{\bs{n}\times\bs{m}}$ is
in one-to-one correspondence with $\RR^{nm}$, $n,m\in\NN$_.

Note selecting a row is a function $\RR^{n\times m}\times\bs{n}\to\RR^{m}$
where $(x, i)$ is associated with the function $j\mapsto x(i,j)$ in $\RR^m$.

This is an example of _currying_.

Selecting a row is currying.
If $g\colon\RR^{n\times m}\times\bs{n}\to\RR^m$ then
$,g\colon\RR^{n\times m}\to(\bs{n}\to\RR^m)$.
We write this using square brackets without mentioning $g$ or its curried value $g,$
as $x[i,.]\colon\bs{m}\to\RR$ defined by $x[i,.](j) = x(i,j)$.
Similarly, selecting a column $x[.,j]\colon\bs{m}\to\RR$ is defined by $x[.,j](i) = x(i,j)$.

Define the _transpose_ operator ${}^T\colon A\times B\to B\times A$ by
${}^T(a,b) = (b,a)$. We
decorate this as ${{}^{T^{A,B}}}$ when we want to make the sets involved explicit.

__Exercise__. _For $x\in\RR^{n\times m}$ show
${x^{T^{\bs{m},\bs{n}}}(j,i) = x(i,j)}$ for $i\in\bs{n}$, $j\in\bs{m}$_.

_Hint_. $x^{T^{\bs{m},\bs{n}}}$ is the composition of ${}^{T^{\bs{m},\bs{n}}}$ with $x$.

When the indices are understood we write $x^T(j,i) = x(i,j)$.

__Exercise__. _Show $x^T[.,k] = x[k,.]$ for $x\in\RR^{n\times m}$, $k\in\bs{n}$_.

### Arbitrary Rank

Let's extend the notation to handle tensors of any rank, not just rank 2.
Let $\TT_m$ be the collection of rank $m$ tensors.
Define $[]\colon\TT_m\times\bf{m}\to\TT_{m-1}$


More rigourously, define $[]\colon \RR^{\prod_{i\in\bs{m}}}\times\bs{m}\to\

If $\iota\colon J\to I$ and $x\in\RR^I$ we have $x\iota\in\RR^J$
for any index sets $I$, $J$. The name for composition on the right by $\iota$
is $\c$\mathbf{Set}$irc\iota\colon\RR^I\to\RR^J$ so $\circ\iota(x) = x\iota$, $x\in\RR^I$.


Even with this minimal material we can consider interesting operations to perform on $\RR^I$.
For any function $\iota\colon J\to I$ we have a mapping $\RR^I\to\RR^J$ 
$x\mapsto x\iota$. We call $\iota$ a _view_ of $I$.
Element of $x\in\RR^I$ are extracted from a view by function application $x(J(j))$, $j\in J$.

__Exercise__ _If $J$ is the_ singleton $\{i\}$ _for some $i\in I$ then the inclusion $\iota\colon J\to I$
selects the $i$-the element of $x$_.

_Hint_. Show $x(\iota(i)) = x(i)$.

More generally, if $J\subseteq I$ then the inclusion selects $(x_j)_{j\in J}$.

If $J$ is a _multiset_ then elements can be duplicated.
For example if $J = \{i,i,i\}$ then $x\iota = (x_i,x_i,x_i)$.

Many computer languages use 0-based array indexing.
In this case we define $\bs{n} = \{0,\ldots,n-1\}$.
We often want to select a _slice_ of $k$ elements starting at index $i$
in increments of $j$,
${(x_i, x_{i + j},\ldots, x_{i + j(k-1)})}$

__Exercise__ _What is the largest value of $k$ for which $0 \le i + j(k-1) < n$_?

_Hint_: The increment $j$ may be negative.

Some low level languages do not have any guards aginst indexing an array
out of bounds. The onus is on the programmer to use their tools correctly
if performance is an issue.

If $n = 1$ we can identify $\RR$ with $\RR^1$ by $x\in\RR$ corresponds to $(x)\in\RR^1$.
We can also identify every $y\in\RR$ with the linear function from $\RR$ to $\RR$
of multiplication by $y$ denoted by $y^*x = xy$, for $x\in\RR$.
These trivial definitions are the foundation of a systematic notation for
higher dimensional calculations. There is no need for "row" and "column"
vectors, the dual of a vector space and composition of linear functions
generalizes the Einstein summation convention and various "tensor"
notations invented by less brilliant people. Standard mathematical notation suffices.

### Standard and Dual Basis
Define the _dual basis_ by $e^*_j\colon\RR^I\to\RR$ by ${e^*_j(x) = x(j)}$, ${j\in I}$.
The standard and dual bases allows us to identify $\RR^I$ with its _dual_
$(\RR^I)^*$, the linear functionals from $\RR^I\to\RR$.
The _dual pairing_ of $x\in\RR^I$ and ${y\in\RR^I}$ is defined by
$y^*(x) = \langle x, y^*\rangle = \sum_{i\in I} x(i)y(i)$.

If ${x,y\in\RR^I}$ the _inner product_, or _dot product_ is
${(x,y) = x\cdot y = \sum_{i\in I}x_i y_i}$. This is similar, but different
from, the dual pairing is a
function $\langle\cdot,\cdot\rangle\colon\RR^I\times(\RR^I)^*\to\RR$ while
the dot product is a function $(\cdot,\cdot)\colon\RR^I\times\RR^I\to\RR$.

### Tensor

Write $\RR^{-n}$ for $(\RR^n)^*$ for $n\in\NN$. A _tensor_
is a cartesian product $\RR^{n_1}\times\cdots\times\RR^{n_m}$ where the $n_i$ are
integers $n_i\in\ZZ$ for $i\in m$.

### Inner Product

The _inner product_, or _dot product_, of $x,y\in\RR^n$ is $(x,y) = x\cdot y = \sum_{1\le i\le n}x_i y_i$.
This is used to define a _norm_ on $\RR^n$ by $\|x\| = \sqrt{x\cdot x}$.

The _Cauchy-Schwartz inequality_ is ${|(x, y)|\le\|x\|\|y\|}$, ${x,y\in\RR^n}$.
Since ${-1\le (x, y)/\|x\|\|y\|\le 1}$ there exists ${\theta\in[0, 2\pi)}$
with ${\cos\theta = (x, y)/\|x\|\|y\|}$. This defines the _angle_ between two vectors.

__Exercise__ _Show $\|x\| \ge 0$, $\|ax\| = |a|\|x\|$, and $\|x + y\|
\le \|x\| + \|y\|$, for $a\in\RR$, $x,y\in\RR^n$_.

_Hint_: Use $\|x + y\|^2 = \|x\|^2 + 2x\cdot y + \|y\|^2$ and the Cauchy-Schwartz inequality.

__Exercise__. _Show $\|x\| = 0$ implies $x = 0$, $x\in\RR^n$_.

__Exercise__. _Show equality holds in the Cauchy-Schwartz inequality if and only if
$x$ is a scalar multiple of $y$_.

_Hint_: TODO Sid. Use $0\le\|x - ty\|^2$ for $t\in\RR$, $x,y\in\RR^n$.

__Exercise__. _Show if $\lim_{n\to\infty} \|x_n - x\| = 0$ show $x\in\RR^n$_.

_Hint_: The real numbers with absolute value norm is complete.

A norm defines a _metric_ ${d(x,y) = \|x - y\|}$

__Exercise__. _Show ${d(x, y) \le d(x,z) + d(z,y)}$, ${x,y,z\in\RR^n}$ and
${d(x,y) = 0}$ implies ${x = y}$_.
-->

<!--
A homomorphism $T\colon V\to W$ from a vector space $V$ to a vector space $W$ is a _linear operator_.

__Exercise__. _If $T$ is a linear operator then $T\zero = \zero$_.

_Hint_: Show $T\zero + T\zero = T\zero$ and use the previous exercise. Note
the $\zero$s on the left hand side are the additive identity of $V$
and the $\zero$ on the right hand side is the additive identity of $W$.

<details>
<summary>Solution</summary>
Since ${Tv + Tw = T(v + w)}$ and ${\zero + v = v}$ we have
${T\zero + T\zero = T(\zero + \zero) = T\zero}$.
</details>

The collection of all linear operators from a vector space $V$ to a
vector space $W$ is denoted $\LL(V,W)$. It is a vector space with scalar
multiplication and vector addition defined by ${(aT)v = a(Tv)}$ and
${(T + U)v = Tv + Tv}$ for $T\in\LL(V,W)$, $a\in\RR$, $v\in V$.

__Exercise__. _Show linear operators form a vector space_.

An important special case is when the range is the one-dimensional vector space $\RR$.
Define the _dual_ of the vector space $V$ by $V^* = \LL(V,\RR)$.
We write the _dual pairing_ using angle brackets
${\langle v,v^*\rangle = v^*v}$ for ${v^*\in V^*}$, ${v\in V}$.

If $T\colon V\to W$ is a linear transformation define its _adjoint_
${T^*\colon W^*\to V^*}$ by ${\langle v, T^*w^*\rangle = \langle Tv, w^*\rangle}$,
${v\in V}$, ${w^*\in W^*}$.

The set of all functions from a (possibly infinite) set $I$ to the real numbers,
${\RR^I = \{x\colon I\to\RR\}}$, is a vector space over $\RR$.
Scalar multiplication and vector addition are defined pointwise:
${(ax)(i) = ax(i)}$ and ${(x + y)(i) = x(i) + y(i)}$ for ${i\in I}$.
This generalizes $\RR^n$ when ${I = \{1,\ldots,n\}}$.
We can identify $x\colon\{1,\ldots,n\}\to\RR$
with $(x_1,\ldots,x_n)$ by $x(i) = x_i$, $i\in I$.

__Exercise__. _Show $\RR^I$ satisfies the abstract vector space axioms._

The _standard basis_ $e_i\in\RR^I$, $i\in I$, is defined by $e_i(j) = δ_{ij}$, $j\in I$,
where $δ_{ij} = 1$ if $i=j$ and $δ_{ij} = 0$ if $i\not= j$ is the _Kronecker delta_.

__Exercise__. _Show if $I$ is finite then $v = \sum_i v(i) e_i$_.

_Hint_. Show $v(j) = (\sum_i v(i) e_i)(j)$ for $j\in I$.

We define the _dual basis_ $e_j^*\in(\RR^I)^*$ by $e_j^*e_i = \delta_{ij}$.

__Exercise__. _Show if $I$ is finite then $v^* = \sum_i v^*e_i e^*_i$_.

_Hint_. Consider $v^*e_j$.

We omit the non-trivial result these axioms imply there exists
a set $I$ where $V$ can be identified with $\RR^I$. The cardinality of $I$
is the _dimension_ of $\RR^I$.

### Subspace

A subset $U\subseteq V$ of a vector space $V$ is a _subspace_ if $U$ is also a vector space.

__Exercise__. _Let $U$ be a subset of $V$. If $\RR U\subseteq U$ and $U + U\subseteq U$ then
$U$ is a subspace of $V$_.

_Hint_. $\RR U = \{au\mid a\in\RR, u\in U\}$ and $U + U = \{v + w\mid v\in U, w\in U\}$.

<details><summary>Solution</summary>
If $u\in U$ and $a\in\RR$ then $au\in\RR U\subseteq U$.
If $v\in U$ and $w\in U$ then $v + w\in U + U\subseteq U$.
</details>

__Exercise__. _Show the intersection of two subspaces is a subspace_.

_Hint_. Show if $v$ is in the intersection then $av$ is also in the intersection for $a\in\RR$
and if $u$ and $w$ are in the intersection then $u + w$ is also in the intersection.

<details><summary>Solution</summary>
If $v\in U\cap V$ then $au\in U$ and $av\in V$ so $au\in U\cap V$.
If $u,w\in U\cap V$ then $u + w\in U$ and $u + w\in V$ so $u + w\in U\cap V$.
</details>

__Exercise__. _Show the sum of two subspaces is a subspace_.

_Hint_. The sum of subspaces $U, W\subseteq V$ is $U + W = \{u + w\mid u\in U, w\in W\}$.

### Quotient

If $U$ is a subspace of $V$ define ${V/U = \{v + U\mid v\in V\}}$.
Define scalar multiplication by ${a(v + U) = av + U}$ and vector addition
by ${(v + U) + (w + U) = (v + w) + U}$, ${a\in\RR}$, ${v,w\in V}$.

__Exercise__. _Show $v + U = w + U$ if and only if $v - w\in U$, $v,w\in V$_.

__Exercise__. _Show scalar multiplication and vector multiplication are well-defined_.

_Hint_: Show $v + U = v' + U$ implies $a(v + U) = a(v' + U)$, and
$v + U = v' + U$, $w + U = w' + U$, imply $(v + w) + U = (v' + w') + U$.

__Exercise__. _Show $V/U$ is a vector space with identity $\zero + U = U$_.

### Span

The _span_ of a subset of a vector space is the smallest subspace
containing the subset.

A _linear combination_ of vectors $v_i\in V$, $i\in I$, is a sum $\sum_i a_i v_i$ where
a finite number of $a_i\in\RR$ are non-zero. The _span_ of $\{v_i\}_{i\in I}$
is the set of all linear combinations,
$$
\span\{v_i\} = \{\sum_i a_i v_i\mid a_i\in\RR\}.
$$

__Exercise__. _Show the span is a vector space_.

_Hint_. Show if $u$ is in the span then $au$ is also in the span for $a\in\RR$
and if $v$ and $w$ are in the span then $v + w$ is also in the span.

<details><summary>Solution</summary>
If $u = \sum_j a_j v_j$ then ${au = \sum_j a(a_j v_j) = \sum_j (aa_j)v_j}$ is in the span.
If ${v = \sum_j b_j v_j}$ and ${w = \sum_j c_j v_j}$ then
${v + w = \sum_j (b_j + c_j) v_j}$ is in the span.
</details>

### Independent

A set of vectors $\{v_i\}_{i\in I}$ are _independent_ if
for any finite sum $\sum a_i v_i = 0$ implies $a_i = 0$ for all $i$.

__Exercise__. _If $\{v_i\}_{i\in I}$ are independent and ${\sum_i a_i v_i = \sum_i b_i v_i}$
then ${a_i = b_i}$ for all ${i\in I}$_.

_Hint_: $\sum_i (a_i - b_i) v_i = \zero$.

<details><summary>Solution</summary>
If ${\sum_i a_i v_i = \sum_i b_i v_i}$ then
$\zero = \sum_i a_i v_i - \sum_i b_i v_i = \sum_i (a_i - b_i)v_i$ so $a_i - b_i = 0$ for $i\in I$.
</details>

__Exercise__. _If $\{v_i\}$ are not independent then
$v_j = \sum_{i\not= j} b_i v_i$ for some $j\in I$ and $b_i\in\RR$_.

_Hint_: If $\sum a_i v_i = \zero$ and $a_j\not= 0$ for some $j\in I$ then
$a_j v_j = -\sum_{i\not=j} a_i v_i$.

<details><summary>Solution</summary>
$v_j = -\sum_{i\not=j} a_i/a_j v_i$.
</details>

### Basis

A collection of vectors $\{v_i\}_{i\in I}$, $v_i\in V$, is a _basis_ of $V$ if
they are independent and span $V$. Since they span $V$ every
vector $v\in V$ can be written as a linear combination $v = \sum_{i\in I} a_i v_i$.
This shows how to identify any vector space $V$ with $\RR^I$ given a basis $(v_i)_{i\in I}$.

The _dimension_ of a vector space is the number of elements of a basis.
A vector space has many collections of vectors that are a basis but
every basis has the same number of vectors. This is not trivial to prove.

## Linear Transformation

A _linear transformation_, or _linear operator_, is a function $T\colon V\to W$, where $V$ and
$W$ are vector spaces that satisfies preserves the vector space structure: ${T(au + v) = aTu + Tv}$, $a\in\RR$,
$u,v\in V$. Note that the addition ${au + v}$ occurs in $V$ and
${aTu + Tv}$ occurs in $W$.  The space of all such linear transformations is
denoted $\LL(V,W)$.

__Exercise__. _Show if $T$ is a linear transformation then $T\zero = \zero$_.

__Hint__: Consider $T(\zero + \zero)$ and $v + v = v$ implies $v = \zero$.

<details><summary>Solution</summary>
$T(\zero + \zero) = T(\zero) + T(\zero)$ and $T(\zero + \zero) = T(\zero)$ so $T(\zero) = \zero$.
</details>

__Exercise__. _Show $T(av) = aTv$, $a\in\RR$, $v\in V$_.

<details>
<summary>Solution</summary>
Using $T(av + w) = aTv + Tw$,
$T(av) = T(av + 0) = aTv + T0 = aTv + 0 = aTv$.
</details>

__Exercise__. _Show $T(av + bw) = aTv + bTw$, $a,b\in\RR$, $v,w\in V$_.

<details>
<summary>Solution</summary>
$T(av + bw) = aTv + T(bw) = aTv = bTw$.
</details>

A linear transformation $T\colon V\to W$ is _one-to-one_, or _injective_,
if $Tu = Tv$ implies $u = v$.

__Exercise__. _Show if $Tv = \zero$ implies $v = \zero$ then $T$ is one-to-one_.

_Hint_. Use linearity.

<details><summary>Solution</summary>
If $Tu = Tv$ then $T(u - v) = \zero$ so $u - v = \zero$ and $u = v$.
</details>

Define the _kernel_ of a linear transformation $\ker T = \{v\in V\mid Tv = \zero\}$.

__Exercise__. _Show $\ker T$ is a subspace_.

__Exercise__. _Show $T$ is one-to-one if and only if $\ker T = \{\zero\}$_.

Define $\pi_T\colon V\to V/\ker T$ by $\pi_T v = v + \ker T$.

__Exercise__. _Show $\pi_T$ is a well-defined linear transformation_.

A linear transformation $T\colon V\to W$ is _onto_, or _surjective_,
if for every $w\in W$ there exists $v\in V$ with $Tv = w$.

Define the _range_ of a linear transformation
${\ran T = TV = \{w\mid w = Tv\text{ for some }v\in V\}}$
and let $\nu_T\colon V/\ker T\to\ran T$ by $\nu_T(v + \ker T) = Tv$.

__Exercise__ _Show $\nu_T$ well-defined, one-to-one, and onto_.

A linear transformation that is one-to-one and onto, or _bijective_, is an _isomorphism_.
If $T\colon V\to W$ is an isomorphism then $V$ and $W$ are _isomorphic_, $V\cong W$.

__Exercise__. _Show if $T$ is an isomorphism then $T^{-1}$ is linear_.

__Exercise__. _Show $V\cong W$ is an equivalence relation_.

_Hint_: This means $V\cong V$, $V\cong W$ implies $W\cong V$, and $V\cong W$, $W\cong U$ implies $V\cong U$.

<details><summary>Solution</summary>
The identity transformation $I\colon V\to V$ defined by $I(v) = v$ shows $V\cong V$.
If $T\colon V\to W$ is an isomorphism then its inverse $T^{-1}\colon W\to V$ shows
$W\cong V$. If $T\colon V\to W$ and $S\colon W\to U$ are isomorphisms then
so is $ST$ and $V\cong U$.
</details>

The space of linear transformations $\LL(V,W)$ is also a vector
space under pointwise scalar multiplication ${(aT)v = a(Tv)}$
pointwise addition ${(T + S)v = Tv + Sv}$, $a\in\RR$, $v,w\in V$.
The space $\LL(\RR^n,\RR^m)$ can be identified with $\RR^{n\times m}$.
If ${T\colon\RR^n\to\RR^m}$ then ${Te_i = \sum_j t_{ij} e_j}$
for some $t_{ij}\in\RR$.

__Exercise__. _If $T\colon\RR^k\to\RR^n$ and $S\colon\RR^n\to\RR^m$ then the composition
$U = ST\colon\RR^k\to\RR^m$. Show $u_{ij} = \sum_k t_{ik} s_{kj}$_.

<details><summary>Solution</summary>
$R(e_i) = ST(e_i)
	= S(\sum_k t_{ik} e_k)
	= \sum_k t_{ik} Se_k
	= \sum_k t_{ik} \sum_j s_{kj} e_j
	= \sum_j \sum_k t_{ik} s_{kj} e_j
	= \sum_j u_{ij} e_j$
</details>

Matrix multiplication is composition of linear transformations.

Another way to see this is to use $A\times B\to C$ is isomorphic to
$A\to(B\to C)$ for any sets $A, B, C$. This is called _currying_ after Haskell Curry.
If $f\colon A\times B\to C$ define $f,\colon A\to(B\to C)$
by $(f,a)b = f(a,b)$.
If $g\colon A\to(B\to C)$ define $g`\colon A\times B\to C$
by $g`(a,b) = (ga)b$.

__Exercise__. _If $f\colon A\times B\to C$ show $(f,)` = f$
and if $g\colon A\to(B\to C)$ show $(g`), = g$_.

This shows a bijection???

We can identify $(I\to\RR)\to(J\to\RR)$ with $I\times J\to\RR$.

Let $\LL(V) = \LL(V,V)$ be the space of linear transformations from
a vector space to itself. It is also an _algebra_ with multiplication
defined by composition with identity ${I_V = I\colon V\to V}$ defined by ${Iv = v}$, ${v\in V}$.

__Exercise__. _Show $IT = TI$ and $T(U + V) = TU + TV$, ${T,U,V\in\LL(V)}$_.

### Indexing

For every _change of index function_ $s\colon I\to J$ define $\circ s\colon \RR^J\to\RR^I$
define $\circ s v = vs\in\RR^I$, for $v\in\RR^J$.

__Exercise__. _Show $\circ s$ is a linear operator_.

_Hint_: $\circ s v(i) = v(s(i))$ for $v\in\RR^J$.

### Sum

If $U$ and $W$ are vector spaces define the _external direct sum_
$U\oplus W = \{u\oplus w)\mid u\in U, w\in W\}$, where
$u\oplus w$ is the pair $(u,w)$.
Define scalar multiplication
$a(u\oplus w) = (au)\oplus (aw)$ and
vector addition $(u\oplus w) + (u'\oplus w') = (u + u')\oplus (w + w')$.

__Exercise__. _Show $U\oplus W$ is a vector space_.

If $U$ and $W$ are subspaces of the vector space $V$ with
$U\cap W = \{\zero\}$  then the _interal direct sum_
$U + V\cong U\oplus V$.

__Exercise__. _Show this!!!_.

Claim: $V\cong U\oplus V/U$.

Define $T\colon U\oplus V/U\to V$ by $T(u\oplus v+W) = u + v$.

If $U$ is invariant for $T$ then $U$ is invariant for $T - \lambda I$.

_Hint_: If $Tu = v$, $u,v\in U$ then $(T - \lambda I)u\in U$.

If $T\in\LL(U,V)$ define $\graph T = \{u\oplus Tu\mid u\in U\}$.

__Exercise__. _Show $T$ is linear if and only if $\graph T$ is a subspace_.

### Invariant Subspace

An _invariant subspace_ of a linear operator $T\colon V\to V$ is a subspace $U\subseteq V$ with $TU\subseteq U$.
Similar to prime factorizaton of numbers, invariant subspaces break down linear operators
into smaller pieces.

__Exercise__. _If $T\colon V\to V$ is a linear operator show $\ker T$ and $\ran T$ are invariant subspaces_.

If $U$ is a 1-dimensional invariant subspace spanned by $e\in V$ then $e$ is an _eigenvector_
and $Te = \lambda e$ for some $\lambda\in\RR$, the _eigenvalue_ corresponding to $u$.

If the eigenvectors of $T$ are independent they and their corresponding eigenvalues determine $T$.
Let $(e_i)$, $(\lambda_i)$ be the eigenvectors and corresponding eigenvalues. Every vector $v\in V$
can be written $v = \sum_i a_i e_i$ so $Tv = \sum_i a_i Te_i = \sum_i \lambda_i a_i v_i$.
In this case we say $T$ is _diagonalizable_. Using the eigenvectors as a basis,
$t_{ij} = \lambda_i δ_{ij}$.

If $e$ is an eigenvector with eigenvalue $\lambda$ then $Te = \lambda e$ so $(T - \lambda I)e = 0$
and $e\in\ker (T - \lambda I)$. There may be vectors that are not eigenvectors
that belong to $\ker (T - \lambda I)$.

__Exercise__. _If the matrix of $T$ is $[0, 1; 0, 0]$ then 




__Exercise__. _If the eigenvectors of $T$ form a basis then $(T-\lambda_1I)\cdots(T-\lambda_nI) = 0$_.

The dimension of $\LL(\RR^n,\RR^n)$ is $n^2$ so we know
$I$, $T$, $T^2$, \dots, $T^{n^2}$ must be linearly dependent so there is a polynomial
of order at most $n^2$ with $p(T) = 0$. If $T$ is diagonalizable the above exercise shows there is
a polynomial of order $n$ satisfying this. The Cayley-Hamilton states this is true for any $T$
where $p(\lambda) = \det(T - \lambda I)$.

## Dual

The _dual_ of a vector space is $V^* = \LL(V,\RR)$, the space of _linear functionals_ on $V$.
Define the _dual pairing_ by $\langle v,v^*\rangle = v^*(v)$ for $v\in V$ and $v^*\in V^*$.

If $V = \RR^n$ we can identify $V^*$ with $\RR^n$ using the standard basis.
Define the _dual basis_ $e_j^*\colon\RR^n\to\RR$ by $e_j^*(e_k) = δ_{jk}$.

__Exercise__. _Show $v = \sum_j e_j^*(v) e_j$, $v\in\RR^n$_.

<details><summary>Solution</summary>
If $v = \sum_j v_j e_j$ then $e_i^*(v) = v_i$.
</details>

__Exercise__. _Show $v^* = \sum_j v^*(e_j) e_j^*$, $v^*\in(\RR^n)^*$_.

<details><summary>Solution</summary>
If $v^* = \sum_j v_j e_j^*$ then $e_i^*(v) = v_i$.
</details>

If $V$ has _any_ basis $e_j$ then every $v\in V$ can be written $v = \sum v_j e_j$ for some $v_j\in\RR$. 
Define the _dual basis_ $e_j^*\colon V\to\RR\in V^*$ by $e_j^*(v) = v_j$. 
The map $V\to V^*$ by $v = \sum_j v_j e_j\mapsto \sum v_j e_j^* = v^*$
is one-to-one and onto (an _isomorphism_).

Functions are vectors. They can be added and scalar multiplication satisfies the distributed law.
Integration is a linear functional on a space of functions.
Given a set $\Omega$ let $B(\Omega) = \{f\colon\Omega\to\RR : \|f\| = \sup_{\omega\in\Omega}|f(\omega)| < \infty\}$.

If $L\colon B(\Omega)\to\RR$ is a linear functional define $\lambda(E) = L(1_E)$ for $E\subseteq\Omega$.

__Exercise__. _If $E,F\subseteq\Omega$ are disjoint the $1_{E\cup F} = 1_E + 1_F$_.

This shows $\lambda(E\cup F) = \lambda(E) + \lambda(F)$ if $E\cap F=\emptyset$.
Since $1_\emptyset = 0$ we have $\lambda(\emptyset) = 0$ so
$\lambda$ is a (finitely additive) measure.

Given a finitely additive measure $\lambda$ on subsets of $\Omega$ define a linear functional
$L\colon B(\Omega)\to\RR$ by $L(\sum_i a_i 1_{E_i}) = \sum_i a_i \lambda(E_i)$.

__Exercise__. _Show this is well-defined_.

_Hint_: $\sum_i a_i 1_{A_i} = \sum_j b_j 1_{B_j}$ where $(B_j)$ are pairwise disjoint.
Note $1_A + 1_B = 1_{A\setminus B} + 1_{A\cap B} + 1_{B\setminus A}$ is a sum of
pairwise disjoint sets.

__Exercise__. _Given $f\in B(Ω)$ and $ε > 0$ show there exist a finite number of $a_i\in\RR$
and $A_i\subseteq Ω$ with $\|f - \sum_i a_i 1_{A_i}\| < ε$_.

This shows the linear functional can be extended to $B(\Omega)$
and $B(\Omega)^*$ is isomorphic to the space of finitely additive measures on $\Omega$, $ba(\Omega)$.

If $\Omega$ has a sufficiently rich topology (e.g., compact and Hausdorff) then
$C(\Omega)^*$ can be identfied with the space of countably additive Borel measures on $\Omega$, $M(\Omega)$.
If $\mu\in M(\Omega)$ define $L^p(\mu) = \{f\colon\Omega\to\RR : \int_\Omega |f|^p\,d\mu < \infty\}$.
It is true that $L^p(\mu)^*\cong L^q(\mu)$ where $1/p + 1/q = 1$ and $p > 1$.
It is not true that $L^\infty(\mu)^* \cong L^1(\mu)$ in general.
Proving these claims is non-trivial.

## Grassmann

For $I \subset V$ let $I\colon I\to V$ be injective.

Define $\vee I$ to be the span of $I$.

$t\colon I\to J$. $T\colon\RR^J\to\RR^I$.
$v\colon J\to\RR$ mapsto $Tv\colon I\to\RR$ by $Tv(i) = v(t(i)$.

$f\colon A\to B$

$\circ f\colon C^B\to C^A$ by $(\circ f)g = gf$.

$f\circ\colon A^C\to B^C$ by $(f\circ)h = fh$.

A function $f\colon I\to J$ determines a linear transformation
$F\colon\RR^J\to\RR^I$.

$I^n\to\RR$.

$d_i\colon I^n\to I^n\setminus\{i\}$

$\partial\colon I^n\to\RR^{I^{n-1}}$.

## Heisenberg

Werner Heisenberg rediscovered matrix multiplication by considering
orbital levels of the hydrogen atom. If $e_{ij}$ represents a jump
from level $i$ to level $j$, he posited
$e_{ij}e_{kl} = e_{il}$ if $j = k$ and equals $e_{ij}e_{kl} = 0$ if $j\not= k$. [@cite Hei]
An electron can jump from $i$ to $j$, then $j$ to $l$, but not
from $i$ to $j$, then $k$ to $l$ if $k\not= j$.

__Exercise__. _If $S = \sum_{i,j}s_{ij}e_{ij}$ and $T = \sum_{k,l} t_{kl}e_{kl}$ show
$TS = \sum_{i,j} (\sum_k t_{ik} s_{kj}) e_{ij}$_.

<details><summary>Solution</summary>
$$
\begin{aligned}
TS &= (\sum_{kl} t_{kl}e_{kl})(\sum_{ij}s_{ij}e_{ij}) \\
&= \sum_{ij} \sum_{kl} s_{ij} t_{kl} e_{ij}e_{kl} \\
&= \sum_{ij} \sum_{kl} s_{ij} t_{kl} e_{il}\delta_{jk} \\
&= \sum_{ij} \sum_k s_{ik} t_{kl} e_{il} \\
\end{aligned}
$$
</details>

The _kernel_ of a linear transformation $T\colon V\to W$ is
$\ker T = \{v\in V\mid Tv = 0\}\subseteq V$.

__Exercise__. _The kernel of a linear transformation is a subspace_.

_Hint_: $T(av + w) = aTv + Tw = 0$ for $a\in\RR$, $v,w\in \ker T$.

__Exercise__. _$T$ is one-to-one if and only if $\ker T = \{0\}$_.

_Hint_: Consider $T(v - v')$.

The _range_ of a linear transformation $T\colon V\to W$ is
$\ran T = \{Tv\mid v\in V\}\subseteq W$.

__Exercise__. _The range of a linear transformation is a subspace_.

_Hint_: $aTv + Tw = T(av + w)\in\ran T$.

If $\ran T = W$ then $T$ is _onto_, or _surjective_.

Every linear transformation $T\colon V\to W$ factors through the quotient space $V/\ker T$.
Define $π\colon V\to V/\ker T$ by $πv = v + \ker T$.

__Exercise__. _Show $π$ is a surjective linear transformation_.

Define $ν\colon V/\ker T\to\ran T$ by $ν(v + \ker T) = Tv$.

__Exercise__. _Show $ν$ is a well-defined injective linear transformation_.

_Hint_: Start by showing it is well-defined; if $v + \ker T = v' + \ker T$ then $Tv = Tv'$, $v,v'\in V$.

<details>
<summary>Solution</summary>
Since $v + \ker T = v' + \ker T$ if and only if $v - v'\in\ker T$ we have
$T(v - v') = 0$ so $Tv = Tv'$ and $ν$ is well-defined.
If $Tv = Tv'$ then $v - v'\in\ker T$ so $v + \ker T = v' + \ker T$
showing $ν$ is injective.
</details>


### Quotient

If $U$ is a subspace of $V$ and $v\in V$ define the _coset_ of $U$ containing $v$
by $v + U = \{v + u\mid u\in U\}$. Subspaces factor vector spaces into smaller vector spaces.

__Exercise__. _Show $v\in v+U$ for $v\in V$_.

_Hint_: $U$ is a vector space so $0\in U$.

__Exercise__. _Show $u + U = U$ if and only if $u\in U$_.

<details>
<summary>Solution</summary>
If $u + U = U$ then $u + u' = u''$ for some $u',u''\in U$
so $u = u'' - u'\in U$.

If $u\in U$ then $u + u'\in U$ for all $u'\in U$ so $u + U \subseteq U$
and if $u'\in U$ then $u' = u + (u' - u)\in u + U$ so $U\subseteq u + U$.
</details>

__Exercise__. _Show $v + U = w + U$ if and only if $v - w\in U$_.

<details>
<summary>Solution</summary>
If $v + U = w + U$ then $v + u = w + u'$ for some $u,u'\in U$
so $v - w = u' - u\in U$.

If $v - w\in U$ then $v - w = u$ for some $u\in U$
so $v + U = w + u + U = w + U$.
</details>

__Exercise__. _Show $v\cong_U w$ if and only if $v + U = w + U$ is
an equivalence relation_.

_Hint_: Show $v\cong v$ (reflexive), $v\cong w$ implies $w\cong v$ (symmetric), and
$v\cong w$ and $w\cong x$ implies $v\cong x$ (transitive).

The _quotient space_ $V/U = \{v + U\mid v\in V\}$ is a vector
space with scalar multiplication $a(v + U) = av + U$ and
addition $(v + U) + (w + U) = (v + w) + U$.

__Exercise__. _Show $v + U = w + U$ implies $av + U = aw + U$, $a\in\RR$, $v,w\in V$_.

_Hint_: $av - aw\in U$.

<details>
<summary>Solution</summary>
If $v + U = w + U$ then $v - w\in U$, so $a(v - w)\in U$ and $av + U = aw + U$.
</details>

__Exercise__. _Show $v + U = v' + U$ and $w + U = w' + U$ implies
$v + u + U = v' + w' + U$, $v,v',w,w'\in V$_.

_Hint_: $v - v', w - w'\in U$.

The last two exercises show scalar multiplication and addition are well-defined in $V/U$.

__Exercise__. _Show $(u + U) + (v + U) = (v + U) + (u + U)$ and
$a((u + U) + (v + U)) = a(u + U) + a(v + U)$_.

This shows addition is commutative and scalar multiplication distributes over addition,
hence the quotient space $V/U$ is a vector space where
the cosets are the vectors. A subspace $U$ and the quotient space $V/U$
determine $V$ up to isomorphism, but that requires more machinery.

$T\colon U\to V$

$0\to\ker T\to U\to \ran T\to V\to 0$

$0\to U\to V\to V/U\to 0$.

## Norm

A _norm_ on a vector space is a function $\|\cdot\|\colon V\to[0,\infty)$ with
$\|av\| = |a|\|v\|$, $\|v + w\| \le \|v\| + \|w\|$, $a\in\RR$, $v,w\in V$,
and $\|v\| = 0$ implies $v = 0$.

If $V=\CC^n$ then $\|v\|_\infty = \max_i |v_i|$ and $\|v\|_p = (\sum_i |v_i|^p)^{1/p}$
are the _sup norm_ and $p$-_norm_, $p\ge 1$.

__Exercise__. _Show $\lim_{p\to\infty}\|v\|_p = \|v\|_\infty$_.

If $T\colon V\to W$ is a linear transformation between normed vector spaces then
the _operator norm_ is $\|T\| = \sup_{\|v\|\le 1}\|Tv\|$.

__Exercise__. _Show $\|aT\| = |a|\|T\|$, $\|T + S\|\le \|T\| + \|S\|$ and $\|T\| = 0$ implies $T = 0$,
$a\in\RR$, $T,S\in\LL(V,W)$_.

## Inner Product

An _inner product_ on a vector space is a bilinear function $V\times V\to\RR$.
The pair $(u,v)$ is sent to $v\cdot w$, $v, w\in V$. The inner product satisfies
$v\cdot v \ge 0$ and $v\cdot v = 0$ implies $v = 0$.

__Exercise__. _Show $\|v\| = v\cdot v$ is a norm_.

__Theorem__ (Cauchy-Schwartz) _$|u\cdot v| \le \|u\| \|v\|$ and equality
holds if and only if $u$ and $v$ are colinear_.

_Proof_. Since $0\le\|au - v\|^2 = a^2\|u\|^2 - 2au\cdot v + \|v\|^2$
the discriminat $|u\cdot v|^2 - \|u\|^2 \|v\|^2\ge 0$. The discriminant
is 0 if and only if $au - v = 0$.

## Spectrum

If $V$ is a finite dimensional normed space over $\CC$ then every operator $T\colon V\to V$ has
and eigenvector.

The _spectrum_, $σ(T)$, of a linear operator $T\colon V\to V$ is the set of all $\lambda\in\CC$
such that $\ker(T - \lambdaI)$ is not invertable. The _spectral radius_ is
$ρ(T) = \max\{|\lambda|\mid \lambda\in σ(T)\}$.

__Exercise__. _Show if $V$ is finite dimensional then the spectrum is the set of eigenvalues_.

_Hint_: $\ker(T - \lambdaI)\neq 0$ if and only if $Te = \lambdae$ for some $e\in V$.

Define $E_\lambda = \ker(T - \lambdaI)$.

__Exercise__. _Show $E_\lambda\cap E_μ = 0$ if $\lambda\ne μ$_.

__Exercise__. _Show $\sum_{\lambda\in σ(T)} E_\lambda = V$_.

Define the _multiplicity_ of $\lambda\in\CC$ by $m(\lambda) = \dim\ker(T - \lambdaI)$.

__Exercise__. _Show there exists $e\in V$ with $(T - \lambdaI)^ke\neq 0$ for $0\le k < m(\lambda)$
and $(T - \lambdaI)^{m(\lambda)}e = 0$_.

### Adjoint

The _adjoint_ of a linear operator $T\colon V\to W$ is $T^*\colon W^*\to V^*$ defined
by $\langle v, T^* w\rangle = \langle Tv, w^*\rangle$, $v\in V$, $w^*\in W^*$.

## Fréchet Derivative

If $F\colon X\to Y$ is a function between normed vector spaces the _Fréchet_ derivative
$DF\colon X\to\LL(X,Y)$ is defined by
$$
	F(x + h) - F(x) = DF(x)h + o(\|h\|).
$$

Recall $F(x) = G(x) + o(\|h\|)$ means $\lim_{\|h\|\to 0} \|F(x) - G(x)\|/\|h\| = 0$.

__Exercise__. _If $F(x) = x^2$ where $x$ is a square matrix show $DF(x) = L_x + R_x$ where
$L_xy = xy$ and $R_xy = yx$_.

A suggestive way to write this is $D(x^2) = x(Dx) + (Dx)x$.

_Hint_: $(x + h)^2 = x^2 + xh + hx + h^2$ and $h^2 = o(\|h\|)$.

<details><summary>Solution</summary>
Since $(x + h)^2 = xx + xh + hx + hh$ and $\|h^2\| = o(\|h\})$ we have
$D(x^2)h = L_x h + R_x h$.
</details>

__Exercise__. _If $F(x) = x^n$ where $x$ is a square matrix and $n\in\NN$ show
$DF(x) = \sum_{i=0}^{n-1} L_x^{n-i-1}R_x^{i}$_.

_Hint_: What are the terms in $(x + h)^n$ containing exactly one $h$?

__Exercise__. _If $F\colon\RR^n\to\RR$ is
$F(x) = \|x\|^p$ show $DF(x) = p\|x\|^{p-2}x^*$._

_Hint_. Show $D\|x\|^2 = 2x^*$ and note $\|x\|^p = (\|x\|^2)^{p/2}$.
By the chain rule $D\|x\|^p = (p/2)\|x\|^{2(p/2 - 1)}2x^* = p\|x\|^{p - 2}x^*$.

For example, a _semigroup_ is a set $S$ and binary operation ${m\colon S\times S\to S}$
that is associative: ${m(a,m(b,c)) = m(m(a,b),c)}$ for ${a,b,c\in S}$,
or ${a(bc) = (ab)c}$ if we write $ab$ for $m(a,b)$.
While this may seem trivial, is allows us to write $abc$ without parentheses.
This is the foundation of [MapReduce](https://en.wikipedia.org/wiki/MapReduce).

We can add an _identity_ $e$, not in the semigroup $S$, that satisfies
${es = s = se}$ for all $s\in S$ to turn a semigroup into a monoid
${M = S\cup\{e\}}$.

__Exercise__. _Show ${a(bc) = (ab)c}$ for ${a,b,c\in M}$_.

_Hint_: There are seven boring cases when $a$, $b$, and $c$ are $e$.

A _monoid_ is a semigroup with an identity for the binary operation.
The identity is unique.

__Exercise__. _If $M$ is a monoid and $e'\in M$ satisfies $e'm = m = me'$, $m\in M$, then $e' = e$_.

<details>
<summary>Solution</summary>
$e' = ee' = e$
</details>

__Exercise__. _Show $\max\{a,b\}$, $a,b\in\RR$ is a monoid with
identity $-\infty$_.

_Hint_: $-\infty < a$ for all $a\in\RR$.

__Exercise__. _Show $\min\{a,b\}$, $a,b\in\RR$ is a monoid with
identity $+\infty$_.

_Hint_: $\infty > a$ for all $a\in\RR$.

__Exercise__. _Show string concatenation is a monoid with
identity the empty string_.

The _Kleen star_ of a set is the union of the cartesian product of ${n\in\NN}$ copies of of the set.
If $M$ is a monoid 
where ${M^0 = \{e\}}$ and ${M^n = \{(m_1,\ldots,m_n)\mid m_j\in M, 1\le j\le n\}}$.
Define _fold_ ${f\colon M^*\to M}$ by ${f(e) = e}$ and ${f((m_1,\ldots,m_n)) = m_1\cdots m_n}$.




Every function $f\colon A\to B$ gives rise to two functions defined
on exponentials. Given any set $C$ define
$f\circ\colon A^C\to B^C$ by $g\mapsto f\circ g$, $g\in A^C$.
and $\circ f\colon C^B\to C^A$ by $h\mapsto h\circ f$, $h\in C^B$.

__Exercise__: Show if $f\colon A\to B$ is one-to-one then so is $f\circ\colon A^C\to B^C$_.

_Hint_: If $f\circ g = f\circ h$ for $g,h\in A^C$ then $g = h$ if $f$ is one-to-one.

__Exercise__: Show if $f\colon A\to B$ is onto then so is $\circ f\colon C^A\to C^B$_.

_Hint_: If $(\circ f)g = (\circ f)h$ for $g,h\in C^A$ then $g\circ f = h\circ f$
and $g = h$ if $f$ is onto.
The _power set_ of a set $A$ is the set of all subsets of $A$,
$\PP(A) = \{E\mid E\subseteq A\}$,
Every subset $E$ of a set $A$ corresponds to an _indicator_ function $1_E$
defined by $1_E(a) = 1$ if $a\in E$ and $1_E(a) = 0$ if $a\not\in E$.
Set exponential allows us to express all indicator functions as elements of ${\{0,1\}}^A$.
It is more common to write this as $2^A$ where $2 = \{0,1\}$.

!!! This is the subobject classifier for sets.

__Exercise__. _Show $\PP(A)$ is in one-to-one correspondence with $2^A$_.

__Exercise__. _Show $\PP(A)$ is not in one-to-one correspondence with $A$ if $A$ is non-empty_.

_Hint_: If $f\colon A\to\PP(A)$ is onto consider the set
$S = \{a\in A\mid a\not\in f(a)\}$. Since $f$ is onto there exists
$b\in A$ with $S = g(b)$. Is $b\in S$? Conclude no such $f$ exists.

### Logic

There is a close connection between set theory and _propositional logic/calculus_.
A _proposition_ is a statement that is either true or false.
Propositional _connectives_ define new propositions in terms of existing propositions.
The connective 'not' defines $\neg P$ to be false if $P$ is true and
true if $P$ is false. The connective 'and' defines $P\wedge Q$ to be true if
both $P$ and $Q$ are true, otherwise $P\wedge Q$ is false.
These can be combined to define 'nand' $P\uparrow Q = \neg(P\wedge Q)$
to be the negation of 'and'.

__Exercise__. _Show $P\uparrow P = \neg P$_.

Every logical connective can be defined in terms of nand. Since $\neg(\neg P) = P$
we have $P\wedge Q = \neg(P\uparrow Q)$.
The connective 'or' defines $P\vee Q$ to be true if
either $P$ or $Q$ are true, otherwise $P\vee Q$ is false.

__Exercise__. _Show $P\vee Q = (\neg P)\uparrow(\neg Q)$_.

_Logical implication_ is defined by $P\imples Q = (\neg P)\vee Q$.
Note this is true if $P$ is false so we conclude a false proposition
implies any proposition. This mathematical definition of implication is quite different from the standard
usage of the word 'implies.'

Logical connectives between propositions can be modeled using set theory. 
If $A,B$ are sets then the set intersection $A\cap B$ corresponds to the logical connective
$A\wedge B$.
To model negation we need a fixed _universal_ set $S$.
If $A\subseteq S$ then the set difference $S\setminus A = \{s\in S\mid a\not\in A\}$
corresponds to $\neg A$.

Let $\top$ (top) stand for the proposition that is always true and $\bot$ (bottom) for the
proposition that is always false. These are also written $T$, $\text{true}$, or $1$
and $F$, $\text{false}$, or $0$, respectively$. 
The inclusion $\iota\colon\{0,1\}\to\RR$ into the real numbers gives rise to
$\circ\iota\colon 2^I\to\RR^I$ for any set $I$.
Since $\RR^I$ is the set of functions from $I$ to $\RR$ we
can add and multiply them.

__Exercise__. _Show $1_{A\cap B} = 1_A 1_B$ and $1_{A\cup B} = 1_A + 1_B - 1_{A\cap B}$_.

__Exercise__. _Show $1_{I\setminus A} = 1 - 1_A$_.

_Hint_: The _set difference_ $A\setminus B = \{a\in A\mid a\not\in B\}$.

We can reduce set identities to algebraic operatons.
For example, De Mogan's Laws are 
Two sets $A$ and $B$ are _equivalent_ (as sets), $A\cong B$,
if there exists a one-to-one correspondence between them.

__Exercise__. _Show $\cong$ is an_ equivalence _relation_.

_Hint_. Establish $A\cong A$, $A\cong B$ implies $B\cong A$,
and $A\cong B$, $B\cong C$ imply $A\cong C$ for sets $A,B,C$.

<details><summary>Solution</summary>
Show the identity function from $A$ to $A$ is bijective.
Show if $f\colon A\to B$ is bijective, so is $f^{-1}\colon B\to A$.
Show if $f\colon A\to B$ and $g\colon B\to C$ are bijective then so is $gf\colon A\to C$.
</details>

### Relation

Given sets $A$ and $B$ a _relation_ is a subset of the cartesian product
of $A$ and $B$, $R\subseteq A\times B$. We write $aRb$ if $(a,b)\in R$.
The _domain_ of a relation is $\dom R = \{a\in A\mid aRb\text{ for some }b\in B\}$.
The _codomain_ of a relation is $\cod R = \{b\in B\mid aRb\text{ for some }a\in A\}$.
The _left coset_ of $b\in\cod B$ is $Rb = \{a\in A: aRb\}$.
The _right coset_ of $a\in\dom A$ is $aR = \{b\in B: aRb\}$.

__Exercise__. _Show $\dom R = \cup_{b\in B} Rb$ and $\cod R = \cup_{a\in A} aR$_.

__Exercise__. _Show $\dom R = first(R)$ and $\cod R = \second(R)$_.

_Hint_: $\first(R) = \{\first(a,b)\mid (a,b)\in R\}$

An equivalence relation on a set $S$ is a subset $R\subseteq S\times S$ with
$aRa$ (reflexive), $aRb$ implies $bRa$ (symmetric),
and $aRb$, $bRc$ imply $aRc$ (transitive), $a,b,c\in S$,
where we write $aRb$ for $(a,b)\in R$. The _equivalence class_ of $a\in S$
is $[a] = \{b\in S\mid aRb\}$.

__Exercise__. _Show either $[a] = [b]$ or $[a]\cap [b] = \emptyset$ for $a,b\in S$_.

A _partition_ of a set is a collection of disjoint subsets whose union is the entire set.
This exercise shows $\{[a]\mid a\in A\}$ is a partition of $S$.

__Exercise__. _If $\Sigma$ is a partions of $S$ then $\cup_{s\in\Sigma} s\times s$ is
an equivalence relation on $S$_.

Equivalence allows us to simplify considerations. Two things are "the same" in a
particular sense even if they are not equal.

### Structure

Functions between sets with structure that preserve the structure are
_homomorphisms_. A homomorphism that is bijective (one-to-one and
onto) is an _isomorphism_. 

For example, a _semigroup_ is a set $S$ with a binary operation
$m_S = m\colon S\times S\to S$ that is _associative_:
$m(a,m(b,c)) = m(m(a,b),c)$, $a,b,c\in S$.
If we write $ab$ for $m(a,b)$ this becomes $a(bc) = (ab)c$.
This allows us to write $abc$ unambigously for either term.
A function $f\colon S\to T$ between semigroups is a homomorphism
if and only if $f(m_S(a,b)) = m_T(f(a), f(b)$ for all $a,b\in S$.
We write this $f(ab) = f(a)f(b)$ for all $a,b\in S$
and expect you to keep in mind the binary operation in the argument
to $f$ occurs in $S$ and binary operation on the right occurs in $T$.

You might think this is too simple to be useful, but you would be wrong.
Semigroups are the basis of the Map-Reduce algorithm.
A computation $a_1a_2\cdots a_n$ can be partitioned into
$(a_1\cdots a_{n_1})(a_{n_1+1}\cdots a_{n_2})\cdots(a_{n_k+1}\cdots a_n)$
where $1 < n_1 < \cdots < n_k < n = n_{k+1}$. The partitioned calculations
can be performed in parallel and
the $k + 1$ calculations can be combined to get the final result.
The computation time is proportional to $\max_{1\le j\le k}\{n_{j+1} - n_j\} + k + 1$.

__Exercise__. _What is the optimal partition size for the product of $n$ terms_?

_Hint_: Back of the envelope, if there are $k$ partitions of equal
size the time is proportional to $n/k + k$.

Semigroups don't have enough structure to have a convenient
classification up to isomorphism.
Vector spaces are a mathematical sweet spot. Two vector spaces
are isomorphic if and only if they have the same _dimension_.

Currying is quite common in mathematics and is often done implicity.
Although currying is common, there is no generally accepted notation for it, so let's define one
for our purposes.
If $f\colon A\to(B\to C)$ define $f,\colon A\times B\to C$ by
$f,(a, b) = (f(a))(b) = fa(b)$ for $a\in A$, $b\in B$. If $g\colon A\times B\to C$
define $,g\colon A\to(B\to C)$ by $,ga(b) = g(a,b)$.

__Exercise__. _Show $,(f,) = f$ and $(,g), = g$_.

Currying shows $(B\times C)^A$ is equavalent to $(B^C)^A$.

If $h\in B^A$ and $a\in A$ then evaluating $h$ at $a$ results in $h(a)\in B$.
We reify this by defining the $\eval$ function
${\eval\colon B^A\times A\to B}$ by $\eval(h,a) = h(a)$. We
decorate this as ${\eval^{A,B}}$ when we want to make the sets involved explicit.

__Exercise__. _If $f\in (C^B)^A$ show $f, = \eval(\eval(f, a), b)$_.

__Exercise__. _If $g\in (B\times C)^A$ show $,g = \eval(\eval(g, a), b)$_.
-->

<!--
$\RR^n$ - vector space axioms

$\RR^{n_1\times \cdots n_d}$ "tensor", also a vector

Shape $\rho x = n_1\times \cdots n_d$ if $x\in\RR^{n_1\times \cdots n_d}

APL/kdb operations

$\rho\colon \RR\times n_1\times \cdots n_d\to \RR^{n_1\times \cdots n_d}$.

$f\colon\RR\to\RR$ then $f^I\colon\RR^I\to\RR^I$ by $f(x)(i) = f(x(i))$.

$a + x = x + a$ where $(x + a)(i) = x(i) + a$.

If $R$ is a relation then $x R y$ is $(x R y)(i) = x(i) R y(i)$, $i\in I$.

If $m$ is a monoid operation then $m/x = \prod_{i\in I} m(i)$

Index reduction $m_i/x$

Product. Dual space. Composition of functions.

Concatenation. x,y

Mask

Flatten

Expansion

Indexing

Rotation/Shift

Special vectors: constant, characteristic, prefix, suffix, random, interval





$\sigma(T)$, $m\colon\sigma(T)\to\NN$

$\Alg(T) \cong P(\sigma(T), m)$.
-->

## Polynomial Functional Calculus

Given $T\in\LL(V)$ define $\Phi_T\colon\PP\to\LL(V)$ by $p\mapsto p(T)$ where
$p\in\PP$ is a polynomial.

We have $\PP/\ker\Phi_T\to\ran\Phi_T$ is a isomorphism.

Claim $\ker\Phi_T$ is an ideal: If $q\in\PP$ and $p\in\ker\Phi_T$ then $qp\in\ker\Phi_T$.

Since $\PP$ is a PID we have $\ker\Phi_T = (m)$ for some polynomial $m$, the _minimal polynomial_.

For $p\in\PP$ we have the inverse image of $p(T)$ is $q + (m)$

Suppose $\tau\colon\LL(V)\to\RR$ is a linear operator, $\tau(AB) = \tau(BA)$, and $\tau(I) = \dim V$.

__Exercise__. _If $A$ is similar to $B$ then $\tau(A) = \tau(B)$_.

Trace is a natural transformation from $\End(-)$ to $\RR$.

$\eval_V\colon V^*\otimes V\to\FF$. $v\otimes v^* = v^*(v)$.

$\coeval_\FF\colon\FF\to V\otimes V^*$

$\otimes\colon V\times W\to V\otimes W$.
If $\beta\colon V\times W\to X$ there exists a unique linear map
$\hat\beta V\otimes W \to X$.

$\nu_V\colon I\to **$ is a natural transformation.

$x[J_1,\ldots,J_k]$

