---
title: Types
author: Keith A. Lewis
abstract: Types - syntax for categories
---

\newcommand\cat[1]{\mathbf{#1}}
\newcommand\NN{\bs{N}}
\newcommand\RR{\bs{R}}
\newcommand\ZZ{\bs{Z}}

A _type_ is a set with _operations_ that satisfy _axioms_.  The operations
are functions between sets and axioms are statements that are assumed
to be true.

In mathematics the set $\NN = \{0, 1, 2, \ldots\}$ of non-negative integers has operations
of addition and multiplication that are commutative, associative, and satisfy
the distributive law.

Computers use integer types that are a finite number
of bits in their base 2 representation. The operations
on integers are addition, subtraction, and multiplication.

This goes back to Euclid where the types are
points, lines, and planes and the operations
involve a ruler and compass.
His five postulates, what we now call axioms,
specify how to construct types from existing types.

His first axiom is "Things that are equal to the same thing are also equal to one another."
Euler distinguished axioms from postulates. He called his five axioms 
"common notions" (κοιναὶ ἔννοιαι), something he
thought every rational person would agree with.

His fifth postulate was "That, if a straight line falling on two
straight lines makes the interior angles on the same side less than
two right angles, the two straight lines, if produced indefinitely,
meet on that side on which the angles are less than two right angles."

> Καὶ ἐὰν εὐθεῖαι δύο τῇ αὐτῇ ἐμπίπτουσαι εὐθείᾳ
τὰ ἐντὸς καὶ ἐπὶ τὴν αὐτὴν πλευρὰν γινόμενα
τῶν ἐντός γωνιῶν δύο ἔλαττον δύο ὀρθῶν ᾖ,
ἐκβαλλομένας τὰς δύο εὐθείας ἐπ᾽ ἄπειρον
συναντᾶν ἐπὶ τὴν πλευρὰν ἐκείνην, ἐφ᾽ ἣν
εἰσὶν αἱ δύο τῶν ἐντὸς γωνιῶν ἔλαττον δύο ὀρθῶν.


Two millennia later we have [Homotopic Type Theory](https://homotopytypetheory.org/book/)
invented by Fields Medal winner Vladimir Voevodsky after he regretted
a theorem he "proved" that turned out to be wrong, but was cited
by many other mathematicians. Math is just following your nose and
thinking clearly. It is remarkably difficult to do that.

Category Theory. Sets too simple.




Some people think mathematics is abstract nonsense.
Many mathematicians think category theory is
generalized abstract nonsense.
When I told my colleague Andy Browder at Brown I was
looking into it he said, "Don't waste your time on that!
It doesn't _do_ anything."

## Semigroup

For example, a _semigroup_ is a set with a binary
operation that is associative. If $m\colon S\times S\to S$ is the binary operation
then it is associative if $m(a,m(b,c)) = m(m(a,b),c)$ for
all $a,b,c\in S$. Writing $m(a,b)$ as $ab$ we have
$a(bc) = (ab)c$ so $abc$ reads unambiguously in a semigroup.

This may seem to be too simple to be useful, but it is the foundation of Google's
[MapReduce](https://static.googleusercontent.com/media/research.google.com/en//archive/mapreduce-osdi04.pdf).
Assume a semigroup product $a_1\cdots a_n$ takes time proportional to $n$.
Dividing the product into $k$ pieces 
and running each piece in parallel takes time proportional to $n/k$.
The $k$ results can be multiplied to get the final result. 
This takes time proportional to $n/k + k$.  Since the
derivative with respect to $k$ is -n/k^2 + 1$ we see $k = \sqrt{n}$
is the optimal number of pieces to minimize execution time.

## Monoid

A _monoid_ is a semigroup with an _identity_
$e$ satifying $em = m = me$ for all $m$.
If $S$ is a semigroup we can make it into a monoid
by adjoining $e\not\in S$ and define
$se = s = es$ for $s\in M = S\cup\{e\}$.

__Exercise__. _Show if $e'$ satisfies $e'm = m = me'$ for
all $m\in M$ then $e' = e$_.

_Hint_: Use $e' = e'e$.

__Exercise__. _Show if $em = m$ for all $m$ in a monoid
$M$ then $me = m$ for all $m\in M$_.

_Hint_: $me = e(me) = (em)e = me$.$

Monoids are ubiquitous. Addition and multiplication of integers, rational and real numbers
form a monoid. Their maximum and minimum with identity $-\infty$ and $+\infty$a, respectively
also form a commutative monoid. String concatenation with identity the empty string is an
example of a noncommutative monoid.

__Exercise__. _Show $\NN\times\RR$ with product $(m,r)(n,s) = (m + n, (mr + ns)/(m + n))$
is a monoid with identity $(0,0)$_.

__Exercise__. _Show $(1,m_1)\cdots(1,m_n) = (n, (m_1 + \cdots + m_n)/n)$_.

This is how pivot tables do averages.
Monoids are essential to pivot tables that make large amounts of data more accessible.
A monoid product allows arbitrarily large amounts of data to be summarized.

Given a function $f\colon D\to M$ where $M$ is a monoid, we can define
a function from subsets of $D$ to $M$. The product of the
elements of $f(D) = \{f(d)\mid d\in D\}$ is well-defined by any commutative monoid.



## mono, epi, iso

$f\colon A\to B$ is _mono_ if there exists $g\colon B\to A$ with $gf = 1_A$.

$f\colon A\to B$ is _epis_ if there exists $g\colon B\to A$ with $fg = 1_B$.

An arrow that is mono and epi is _iso_.

__Exercise__. _What does this mean in $\cat{Set}$, $\cat{Par}$, $\cat{Rel}$_?

## product

The _product_ of $A$ and $B$ is an object with two arrows $\pi_A\colon A\boxtimes B\to A$
and $\pi_B\colon A\boxtimes B\to B$ with the property if
$\alpha\colon C\to A$ and $\beta\colon C\to B$ there exists
$\alpha\boxtimes\beta\colon C\to A\boxtimes B$ with
$\pi_A(\alpha\boxtimes\beta) = \alpha$ and $\pi_B(\alpha\boxtimes\beta) = \beta$.

__Exercise__. _In $\cat{Set}$ show show $A\times B \cong \{(a,b)\mid a\in A, b\in B\}$_.

_Hint_: Let $\pi_A(a,b) = a$ and $\pi_B(a,b) = b$.

The _coproduct_ of $A$ and $B$ is an object with two arrows $\nu_A\colon A\to A\boxplus B$
and $\nu_B\colon B\to A\boxplus B$ with the property if
$\alpha\colon A\to C$ and $\beta\colon B\to C$ there exists
$\alpha\boxplus\beta\colon A\boxplus B\to C$ with
$(\alpha\boxplus\beta)\nu_A = \alpha$
and $(\alpha\boxplus\beta)\nu_B = \beta$.

__Exercise__. _In $\cat{Set}$ show $A\sqcup B \cong (\{0\}\times A)\cup (\{1\}\times B)$_.

_Hint_: Let $\nu_A(a) = (0, a)$ and $\nu_B(b) = (1, b)$.

## exponential

The exponential $B^A$ in a category with products has a monomorphism $e\colon B^A\times A\to B$
with the property for exery $f\colon C\times A\to B$ there exists
unique $g\colon C\to B^A$ with $e(gf\times 1_A) = f$.

$g\colon C\to B^A$, $f\colon C\times A\to B$, $1_A\colon A\to A$,

__Exercise__. _Show $f(a,c) = e(g(c), a)$_.

## Set

We start with the naive view of a set as a collection of _elements_.
If $s$ is an element of the set $S$ we write $s\in S$.
If $S$ and $T$ are sets we say $S$ is a _subset_ of $T$, written $S\subseteq T$, if
every element of $S$ also in an element of $T$ and write $S\subseteq T$.
Clearly $S\subseteq S$ for any set $S$.
Two sets are _equal_ if $S\subseteq T$ and $T\subseteq S$.
We say $A$ is a _strict subset_ of $B$, written $A\subset B$, if $A\subseteq B$ and $A\not=B$.
We say $A$ is a _strict superset_ of $B$, written $A\supset B$, if $A\subseteq B$ and $A\not=B$.

__Exercise__. _Show $S = S$ for any set $S$_.

_Hint_: Equality is defined using subsets.

__Exercise__. _Show if $S\subseteq T$ and $T\subseteq U$ then $S\subseteq U$_.

_Hint_: If $v\in S$ then $v\in T$ so $v\in U$.

...Category Theory...???

Frege's original theory was that a set is defined by _comprehension_:
the elements of the set satisfy a _proposition_ that is either
true or false.

__Exercise__. (Russell's Paradox) _Show $S = \{s\mid s\not\in s\}$ is not a set_.

_Hint_. Show $S\in S$ implies $S\not\in S$ and $S\not\in S$ implies $S\in S$.

This shows $S\in S$ if and only if $S\not\in S$, a contradiction.
To resolve this we need to build sets from the ground up.
The _empty set_, $\emptyset$, is the set containing no elements.
The statement $s\in\emptyset$ is always false.

pairing axiom

powerset axiom

cartesian product

We can define $S = \{s\in\Omega\mid s\not\in s\}$. Now if we ask if
$S\in S$ then we must have $S\in\Omega$

## Relation

A _relation_ on sets $A$ and $B$ is a subset $R\subseteq A\times B$.
We write $aRb$ for $(a,b)\in R$, $a\in A$, $b\in B$.
The _domain_ of $R$ is $A$ and the _codomain_ is $B$.

The _composition_ of $R\subseteq A\times B$ with the relation $S\subseteq B\times C$ is defined by
$c(SR)a$ if and only if there exists $b\in B$ with
$aRb$ and $bSc$. This is closely related to the
[`JOIN`](https://en.wikipedia.org/wiki/Join_(SQL)) of relational databases.
The _inner join_ of $R$ and $S$ on $B$ is the set $\{(a,b,c)\mid aRb, bSc, a\in A, b\in B, c\in C\}$.

Define the _left coset_ $aR = \{b\in B\mid aRb\}$ and
the _right coset_ $Rb = \{a\in A\mid aRb\}$.
The _range_ of $R$ is $AR = \cup_{a\in A} aR$.
The set $RB = \cup_{b\in B} Rb$ is also called the domain of $R$.

__Exercise__. _Find a relation $R\subseteq A\times B$ where $RB\subset A$.

__Exercise__. _Show $a(SR)c$ if and only if the intersection of the left coset
$aR$ and right coset $Sc$ is not empty_.

For any set $A$ define the _diagonal_ $\Delta_A = \{(a,a)\mid a\in A\}\subseteq A\times A$.

__Exercise__ _Show if $R\subseteq A\times B$ then 
$\Delta_AR = R$ and $R\Delta_B = R$_.

Define the l

## Function

A _function_ $f\colon A\to B$ is a relation $f\subseteq A\times B$ where
every left coset $af$ has exactly one element. If $af = \{b\}$ we write
$f(a) = b$.

__Exercise__ _Show if $f\colon A\to B$ and $g\colon B\to C$ then
$(gf)(a) = g(f(a))$_.

Given functions $f\colon A\to B$ and $g\colon B\to C$
the _compostion_ $g\circ f$ is defined by $g\circ f(a) = g(f(a))$.
we can define a binary operation using function compo $m(f,g) = g\circ f$.

Category Theory provides a way of talking about sets and
functions without mentioning elements of sets.
This dicipline clarifies essention structure by
preventing incidental artifacts involving elements.

We express this in a categorical way as an $F$-algebra
in the category Set with the functor $F(S) = S\times S$
and the commutative diagram 

## Group

## Vector Space
