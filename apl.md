---
title: APL
author: Keith A. Lewis
institute: KALX, LLC
classoption: fleqn
fleqn: true
abstract: A Programming Language
...


The programming language _APL_ was invented by Ken E. Iverson, a mathematician
unsatisfied by the limited expressiveness of FORTRAN when it came to manipulating
multidimensional arrays. What follows is a mathematical description of
the objects and operations on them he invented to scratch that itch.
It is simply a matter of giving explicit names to the operations that can be
performed on collections of data; what Iverson called "tools of thought."

## Preliminaries

A _relation_ on the sets $A$ and $B$ is a subset $R\subseteq A\times B$.
It is customary to write $aRb$ for $(a,b)\in R$.  The _right coset_
of $a\in A$ under $R$ is $aR = \{b\in B:aRb\}$ and the _left coset_ of $b\in B$
under $R$ is $Rb = \{a\in A:aRb\}$.  If $X\subseteq A$ we define the _push forward_
of $X$ under $R$ to be $XR = \cup_{x\in X}xR\subseteq B$ If $Y\subseteq B$
the _pull back_ of $Y$ under $R$ is $RY = \cup_{y\in Y}Ry\subseteq A$.
The _domain_ of a relation $R\subseteq A\times B$ is $\dom R = RB$ and the
_range_, or _codomain_, is $\cod R = AR$.

A relation is a _function_ if and only if all right cosets are
singletons. In this case we write $R\colon A\to B$ and $R(a) = b$ for
$aRb$ where $b$ is the unique element of the right coset $aR$.
The push forward of $X\subseteq A$ is written $R(X)$ if $R$ is a function.

If all right cosets are singletons or empty we call $R$ a _partial function_.
Every partial function can be augmented to a function by adding a special
element $\bot\not\in B$ to $B$ and defining $\hat{R}\colon A\to B\cup\{\bot\}$
by $\hat{R}(a) = R(a)$ if $a\in\dom R$ and $\hat{R}(a') = \bot$ if $a'\not\in\dom R$.

## Exponential

If $A$ and $B$ are sets then the _exponential_ is the set of all functions
from $B$ to $A$, $A^B = \{f\colon B\to A\}$.
If $n\in\bm{N}$ is a natural numbers we identify it with the set $\{0,\ldots, n - 1\}$
so $A^n = \{(a_1,\ldots,a_n)\colon a_i\in A, 1\le i\le n\}$ represents the
functions $a\colon n\to A$ where $a(i) = a_i$.

## Product

The _cartesian product_ of the sets $A_0$ and $A_1$ is the set of all pairs
of element where the first item belongs to $A_0$ and the second item belongs
to $A_1$, $A_0\times A_1 = \{(a_0,a_1):a_0\in A_0 \text{ and } a_1\in A_1\}$.
It is equipped with two
_projections_ $\pi_0\colon A_0\times A_1\to A_0$ where $\pi_0((a_0,a_1)) = a_0$
and $\pi_1\colon A_0\times A_0\to A_1$ where $\pi_1((a_0,a_1)) = a_1$.

__Exercise__. _Show if $p_0\colon B\to A_0$ and $p_1\colon B\to A_1$ are functions
then there exists a function $t\colon B\to A_0\times A_1$ with $p_0 = \pi_0 t$
and $p_1 = \pi_1 t$_.

Any set having this property can be identified with $A_0\times A_1$.

Products and unions can be defined for any collection of sets $X_i$, $i\in I$.
The product $\Pi X_I = \Pi_{i\in I} X_i$ has projections $\pi_i\colon \Pi X_I\to X_i$
where $\pi_i(x) = x_i$.

Given $\sigma\colon I\to I$ define $x\sigma\in\Pi X_{\sigma(I)}$ by
$(x\sigma)_i = x_{\sigma(i)}$.

__Exercise__. _Show if $\sigma$ is bijective then so is $\Sigma$.

The function $\sigma\colon\{0,1}\}\to \{0,1\}$ were $\sigma(0) = 1$
and $\sigma(1) = 0$ shows $A_0\times A_1$ is isomorphic to $A_1\times A_0$.

Show $A_0\times(A_1\times A_2)$ is isomorphic to $(A_0\times A_1)\times A_2$.

Cartesian product is commutative and associative-ish.

Given collections $X_i$, $i\in I$ and $Y_j$, $j\in J$

## Curry

Exponentials and cartesian products have the property that every function
$f\colon A\times B\to C$ corresponds to a function $g\colon A\to C^B$
via $f(a,b) = c$ if and only if $g(a)(b) = (g(a))(b) = c$. This is called _currying_
and the reverse process is _uncurrying_. Using $B\to A$ for $A^B$ this
becomes $g\colon A\to (B\to C)$.

In general, if $f\colon\Pi X_I\to Y$ we can curry on $J\subseteq I$ to
get $f_J\colon\Pi X_J\to (\Pi X_{I\setminus J} \to Y)$.

We write $f(a,-)\colon B\to C$ when currying the second argument and
$f(-,b)\colon A\to C$ when currying the first argument. Using this
notation $f = f(-,-)$.

## Application

Given functions $f_i\colon X_i\to Y_i$ define _componentwise
application_ by $\Pi f_I\colon \Pi X_I\to \Pi Y_I$ where
$\pi_i^Y(\Pi f_I(x)) = f_i(\pi_i^X(x))$ or more simply,
$\pi_i^Y(\Pi f_I) = f_i\pi_i^X$.

More generally, if $\sigma\colon I\to J$ and $f_i\colon X_i\to
Y_{\sigma(i)}$ then $\Pi f_{I,\sigma}\colon X_I\to Y_{\sigma(I)}$ by
$\pi_{\sigma(i)}^Y(\Pi f_{I,\sigma}) = f_i \pi_i^X$.

If we want to be more careful about notation, as Iverson was, we should distinguish between
a function $f\colon A\to B$ and its _push forward_ $f^*\colon\mathcal{P}(A)\to\mathcal{P}(B)$
defined by $f^*(S) = \{f(s):s\in S\}\subseteq B$ for $S\subseteq A$ where
the _power set_ of $A$ is the set of all subsets of $A$, $\mathcal{P}(A) = \{S\subseteq A\}$.
Similarly, the _pull back_ of $f$ is $f_*\colon\mathcal{P}(B)\to\mathcal{P}(A)$
defined by $f_*(T) = \{s\in A:f(s)\in T\}\subseteq A$ for $T\subseteq B$.

If all $X_i$ have the common data type $X$ and $f\colon X\to Y$ we can apply the single
function $f$ to all components $f_\_\colon X_I\to Y_I$ so $f_\_(x)(i) = f(x_i)$.
In APL this is written using diaeresis $f_\_ = f¨$.


## Union

The _union_ of the sets $A_0$ and $A_1$ is the collection of elements belonging to either
$A_0$ or $A_1$, $A_0\cup A_1 = \{b:b\in A_0 \text{ or } b\in A_1\}$.
The _disjoint union_ is similar to the union but includes
information about where elements in the union originated.
$A_0\sqcup A_1 = (\{0\}\times A_0)\cup (\{1\}\times A_1)$.
It is equipped with two _inclusions_ $\nu_0\colon A_0\to A_0\sqcup A_1$ by
$\nu_0(a_0) = (0,a_0)$ and $\nu_1\colon A_1\to A_0\sqcup A_1$ by
$\nu_1(a_1) = (1,a_1)$.
Note $A_i$ is in one-to-one correspondence with $\{i\}\times A_i$
via $a_i \leftrightarrow (i, a_i)$ for $a_i\in A_i$ for $i = 0,1$.

__Exercise__. _Show if $n_0\colon A_0\to B$ and $n_1\colon A_1\to B$ are functions
then there exists a function $i\colon A_0\sqcup A_1\to B$ with $n_0 = i\nu_0$
and $n_1 = i\nu_1$_.

Any set having this property can be identified with $A_0\sqcup A_1$.

A _pair_ can be identified with an element $a\in (A_0\sqcup A_1)^2$.
The pair $a = (a_0,a_1)$  corresponds to the function with $a(0) = (0,a_0)$
and $a(1) = (1,a_1)$. Note that not every function in $(A_0\sqcup A_1)^2$
corresponds to a pair unless $A_0 = A_1$.

__Exercise__. _Show $A^2$ is in one-to-one correspondence with $A\times A$_.

The disjoint union $\sqcup X_I = \sqcup_{i\in I}(\{i\}\times X_i)$
has inclusions $\nu_i\colon X_i\to \sqcup X_I$ where $\nu_i(x_i) = (i, x_i)$.

An element $x\in\Pi X_I$ corresponds to a function $I\to\sqcup X_I$
where $x(i) = (i,\pi_i(x))$.
An element $x\in\sqcup X_I$ corresponds to a function $I\to\sqcup X_I$
where $x(i) = (i, x_i)$.

Elements of a product are _tuples_. If all the sets in the product
are the same we call the element an _array_. They are sometimes called
vectors, but that collides with the term for elements of a vector space.

If $J\subseteq I$ let $\pi_{J}\colon X_I\to X_J$ be the _projection_ that
selects elements of $J$. If $I = n$ we write $\pi_j$ instead of $\pi_{\{j\}}$ for $j\in n$.
A _pointed set_ is a set $X$ with a special element $\star\in X$.
If the $X_i$ are pointed sets we can define the _injection_ $\nu{J}\colon X_J\to X_I$ by
replacing missing indices with the $\star$ for $X_i$, $i\not\in J$.
In APL this is written using the _backslash_ operator $J\setminus = \nu$.


A _data type_ is a set $X$ together with a collection of operations involving $X$.
We assume $X$ is finite in what follows since we
are concerned with computer implementation.
Given data types from some index set $X_i$, $i\in I$,
their cartesian product is $X_I = \Pi_{i\in I}X_i$. The projections
$\pi_i\colon X_I\to X_i$ are defined by $\pi_i(x) = x_i$ for
$x\in X_I$. 

## One Dimension

### Sequence

The set of all sequences from $X$ is $X^* = \cup_{n\in \bm{N}} X^n$.
Each element has the form $(x_0,\ldots,x_{n-1})$ for $x_i\in X$ but
it does not necessarily mean all elements are stored somewhere.
The unary operator `?:X^* -> bool` tests if a seqence is not empty.
The binary operator `@`
returns the first element of the sequence.
More generally, `@:N x X^* -> X` returns the $n$-th element
and is called _pick_. Its default argument is `0`.
Use `n @` to return the $n$-th element.
The operator `<` removes
the first element of the sequence and is called _take_. Use `n <` to remove the first
$n$ elements.

Let `s:N -> N`, then `xs` is `xs(i) = x(s(i))`.

### Iota

We have been using the convention that the natural number $n$ represents the
set $\{0,1,\ldots,n-1\}$. In APL this is given the name $\iota n$.

The function _take_ is $\uparrow \bm{N}\times X^{\iota n}\to X

A table $R\in X^n$ is _one dimensional_. The projections $\pi_i$ select elements
from $R$. In APL $\pi_i x = x_i$ is written $x[i]$. Elements of $R$ can be
_taken_ from the front or back using projections. The table $R|_{m} = (x_1,\ldots,x_m$
is the pro

# Reduce

If a data type $X$ is an _abelian monoid_ then we can define a measure on the
$\mathcal{P}(X)$ by $\oplus(\{x_j\})
= \oplus_j x_j$ where $\oplus$ is the binary monoid operation
and $\oplus(\emptyset) = 0$ is the identity element of the monoid.
Monoids are pointed sets with their identity being the special element.

Every abelian group is a moniod if we ignore the condition that groups
are required to have inverses. Monoids are only required to have an
associative and commutative binary operation, and an identity element.
Addition and multiplication of numbers are abelian groups.
The set $[-\infty,\infty)$ with binary
operation $x\vee y = \max\{x,y\}$ is an abelian monoid with identity
$-\infty$.  Similarly, $(-\infty,\infty]$ with $x\wedge y = \min\{x,y\}$
and identity $\infty$ is an abelian monoid.

__Exercise__. _Show $\oplus(\{s_j\}) = \oplus_j s_j$ is a well-defined measure on $X$_.

Technically we should write this as $\oplus(\{(j, s_j)\}) = \oplus_j s_j$
to avoid collapsing set elements.

Hint: Since monoid operations are associative and commutative
$\oplus(\{x_1,\ldots,x_n\}) = x_1\oplus\cdots\oplus x_n$ is well-defined.
You need to show $\oplus(U\cup V) = (\oplus(U))\oplus(\oplus(V))$ if
$U\cap V = \emptyset$ for $U,V\subseteq X$.
Start with $\oplus(U\cup \emptyset) = \oplus(U) =
(\oplus(U))\oplus 0 = (\oplus(U))\oplus(\oplus\emptyset)$ and use induction
on the number of elements of $V$.

If $R\in X^n$ then $\oplus R$ is an element of $X$. If $R\in X_I^n$
is a table and $X_i$ is an abelian monoid we can apply its operation at index $i$
to get $\oplus_i R\in X_I^n$ where the rows of $R$ have their $i-th$
component replaced by the constant value $\oplus R_{\{i\}}$.
This is called _reduction_ along column $i$ and in APL it is written using
the _forward slash_ operator $\oplus_i/R$.

## Expand

If an abelian monoid has a total ordering that is discrete with elements
$0 = x_0 < x_1 < \cdots $ define $\iota\colon \bm{N}\to $X^\infty$
by $\iota n = (x_0,\ldots,x_n)$.

## Notation

tuple $\Pi_{i\in I} X_i\subseteq (\sqcup_{i\in I} X_i)^I$.

projection $\pi_i\colon\Pi_{i\in I} X_i\to X_i$ where $\pi_i(x) = x_i$.

array $X^I$

## Remarks

A pair $(a,b)$ must satisfy the property $(a,b) = (c,d)$ if and only
if $a = c$ and $b = d$.  Everything in mathematics is a set. What
set is the pair $(a,b)$?  This is a subtle problem with no unique
solution. Kuratowski defined it to be the set $\langle a,b\rangle
= \{\{a\},\{a,b\}\}$.  Clearly if $a = c$ and $b = d$ then $\langle
a,b\rangle$ and $\langle c,d\rangle$ are equal sets. The other direction
is not so trivial. If $a = b$ then $\langle a,b\rangle
=\{\{a\},\{a,a\}\} = \{\{a\},\{a\}\} = \{\{a\}\}$ so $\langle c,d\rangle$
must be a singleton and $\{c\} = \{c,d\}$. This can only
be true if $c = d$, hence $\{a\} = \{c\}$ and $a = c$.

__Exercise__. _Prove the case $a\not= b$_.

Category Theory uses _objects_ and _arrows_ instead of sets.  The
_product_ of sets is defined in terms of objects and arrows.  An object
$C$ with arrows $p\colon C\to A$ and $q\colon C\to B$ is the product of
$A$ and $B$ if and only if for every object $D$ having arrows $r\colon
D\to A$ and $s\colon D\to B$ there exists an arrow $t\colon D\to C$
with $rt = p$ and $st = q$. The product is unique up to isomorphism.

Objects do not have elements in Category Theory, everything must be
defined in terms of objects and arrows. In the category Set we
can define all subsets of the object $S$ as $\hom(S,\{0,1\})$,
the arrows $a\colon S\to\{0,1\}$.
The arrow corresponds to the subset $A = \{s\in S:a(s) = 1\}$.

A _terminal object_ is an object
that always has exactly one arrow from any other object.  In category
Set the terminal objects are singletons and the corresponding arrow can
be thought of as selecting an element from its domain.
If $a\in\hom(S,\{0,1\})$ is terminal then it corresponds to picking
one element from $A$.

The "pairs" of $C$ are terminal objects having domain $C$.
Let $t\colon C\to T$ and $t'\colon C\to T'$ be the unique arrows for $T$ and $T'$.
We also have unique arrows $a\colon A\to T$, $a'\colon A\to T'$
and $b\colon B\to T$, $b'\colon B\to T'$. Since $ap\colon C\to T$
and $a'p\colon C\to T$ we have $ap = a'p$. Likewise $bq = b'q$.


...product as terminal object...
