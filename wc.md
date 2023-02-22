---
title: Why Category Theory?
author: Keith A. Lewis
institution: KALX, LLC
email: kal@kalx.net
classoption: fleqn
abstract: 
...

\newcommand\cat[1]{\mathbf{#1}}

I came across Category Theory when I was a fledgling assistant professor at Brown.
One requirement of getting a PhD in mathematics is to take a course in Set Theory.
If you held a gun to my head and told me to write down all the axioms
of Zermelo-Frankel set theory, I would be a dead man.
The simplicity of Category Theory was a revelation. I made the mistake
of telling one of my colleagues about my interest and
was shocked by his angry reply, "Category Theory
doesn't **do** anything. Stop wasting your time on it!"

Many people think math is abstract nonsence. Most mathematicians seem
to regard Category Theory as generalized abstract nonsense.
It is definitely something that is difficult to appreciate until
you've learned a lot of mathematics. Samuel Eilenberg and
Saunders Mac Lane invented it to unify common themes shared
by many mathematical objects.

Category Theory involves _objects_ and _arrows_ from one object to another.
The discipline of defining mathematical concepts using them
clarifies classical definitions. One surprising result is that
set membership cannot be defined using only objects and arrows.

I'm sure Sammy and Saunders had no idea that Category Theory
would become the basis for modern functional programming languages.
Classical logic casually uses $\forall$ and $\exists$ to
quantify over propositions that are either true of false.
It turns out it is sometimes not possilbe to write a computer program to determine this.

A truely astounding result is the Curry-Howard correspondence.
Proofs using the axioms of Hilbert stye deduction for intuitional logic
are the "same" as a the computational model of lambda calculus.

Math true false statemts caveats. !!!

"equal" is a problem

"equivaltent" is better

HOTT


## Set

Everything in classical mathematics is a _set_. Logicians are
wont to say "the language of Set Theory is _epsilon_." By that they mean
the only additional symbol required in first-order logic to define the
axioms for set membership is $\epsilon$

The first attempt at defining modern Set Theory is due to Frege. He
defined a set by giving a rule for membership. Bertrand Russell showed
that entailed a contradiction. Let $S$ be the set of all sets $x$ where
it is not the case $x\in x$, $S = \{x\mid x\notin x\}$.

__Exercise__. _Show $S\in S$ implies $S\notin S$ and $S\notin S$ implies $S\in S$_.

It was not easy to fix up Frege's theory. This led to various schemes to
axiomatize what a set is, e.g., Zermelo-Fraenkel, von Neumann.
Their axioms are not the first thing you might think of.

A simple solution to this is to only define subsets of an existing set
that satisfy a rule. For any set $S$ and a predicate $P$ on $S$ we can
stay out of trouble by defining $\{x\in S\mid P(x)\}$.  A _predicate_ is
a function from elements of a set that returns either true or false.

A _set_ is just a bag of things (elements) with no structure.
Two sets are _equal_ if they contain the same elements. Using epsilon and
first order logic this is written $A = B$ if and only if
$$
	(\forall a\in A\ a\in B)\wedge(\forall b\in B\ b\in A).
$$

If $A = B$ then they have the same number of elements.  A weaker notion
is two sets have the same _cardinality_ if they have the same number
of elements. If $A$ and $B$ are infinite this becomes a bit tricky to
define. The sets $A = \{1, 2, 3,\ldots\}$ and $B = \{2, 4, 6, \ldots\}$
are both infinite and clearly $B\subset A$ but $B\not=A$.
They have the same cardinality because we can associate $n\in A$
with $2n\in B$. The function $f\colon A\to B$ defined by
$f(n) = 2n$ is one-to-on and onto.

If $A$ and $B$ are sets, their _cartesian product_ is the set
of all pairs $A\times B = \{(a,b)\mid a\in A, b\in B\}$.
A _relation_ is a subset $R\subseteq A\times B$.
We write $aRb$ for $(a,b)\in R$.
The _left coset_ of $b\in B$ is $Rb = \{a\in A\mid aRb\}$.
The _right coset_ of $a\in A$ is $aR = \{b\in B\mid aRb\}$.

A relation is a _function_ if for every $a\in A$ there exists
a unique $b\in B$ with $(a,b)\in R$. We can write $R(a) = b$
instead of $aRb$ since $b$ is unique.

__Exercise__. _A relation $R\subseteq A\times B$ is a function if and
only if the the right coset $aR$ contains exactly one element of $B$_.

If $f$ is relation on $A\times B$ that is a function we write $f\colon A\to B$.
A function is _one-to-one_ if $f(a) = f(b)$ implies $a = b$.
A function is _onto_ if for every $b\in B$ there exists $a\in A$
with $f(a) = b$. An _isomorphism_ is a function that is
one-to-one and onto.

Two sets have the same _cardinality_ if there is an isomorphism $f\colon A\to B$
and we write $\#A = \#B$.

__Exercise__. _Show $\#A = \#A$ for every set $A$_.

_Hint_: Define $f\colon A\to A$ by $f(a) = a$, the _identity function_.

__Exercise__. _If a function $f\colon A\to B$ is an isomorphism show there exists
a function $g\colon B\to A$ that is also an isomorphism_.

_Hint_: Define $g\colon B\to A$ by $g(b) = a$ if and only if $f(a) = b$, the
_inverse function_ of $f$.

This shows $\#A = \#B$ implies $\#B = \#A$.

__Exercise__. _If $\#A = \#B$ and $\#B = \#C$ then $\#A = \#C$.

_Hint_: The composition of isomorphisms is an isomorphism.

This shows cardinality is an _equivalence relation_ on sets.

A relation $R\subseteq A\times A$ is _reflexive_ if $aRa$ for all $a\in A$.
The _diagonal_ of $A$ is the relation $\Delta_A = \{(a,a)\mid a\in A\}$.

__Exercise__. _Show $R$ is reflexive if and only if $\Delta_A\subseteq R$_.

__Exercise__. _Show $\Delta_A$ is the identity function on $A$._

If $R\subseteq A\times B$ then its _transpose_ is $R^* = \{(b, a)\mid a\in A, b\in B\} \subseteq B\times A$.

A relation $R\subseteq A\times A$ is _symmetric_ if and only if $R^* = R$.

A relation $R\subseteq A\times A$ is _antisymmetric_ if and only if $R^*\cap R = \emptyset$.

If $R\subseteq A\times B$ and $S\subseteq B\times C$ the _composition_
$SR\subseteq A\times C$ is the set of all $(a,c)$ for which
there exists $b\in B$ with $aRb$ and $bSc$.

A relation $R\subseteq A\times A$ is _transitive_ if and only if $RR\subseteq R$.

A relation $R\subseteq A\times A$ is an _equivalence relation_ if and only if
it is reflective, symmetric, and transitive.

__Exercise__. _If $R$ is an equivalence relation then $aR = Ra$ for all $a\in A$_.

__Exercise__. _If $R$ is an equivalence relation then either $aR = bR$ or
$aR\cap bR = \emptyset$ for $a,b\in A$_.

__Exercise__. _Show $\{aR\mid a\in A\}$ is a partition of $A$_.



## Category Theory 
Category theory uses _objects_ and _arrows_ instead of membership to express mathematical concepts. 

Using Category Theory to define a set turned out to be problematic.
It was not possible to recapture the notion of set membership.
Topos Theory identified the concept of parameterized membership
as a _subobject classifier_. Sometimes it is more natural to
consider the points on a sphere as the unique tangent plane to the point.

## Set

The objects in category $\cat{Set}$ are sets and the arrows are functions from one set to another.

If $A = \{a\}$ is a set with one element (a _singleton_)
then for every set $B$ there is a unique function from
$B$ to the singleton set $\{a\}$. Every $b\in B$ is sent to $a$.

__Exercise__. _If $A$ is a set and for every set $B$ there exists a unique function from $B$ to $A$
then $A$ is a singleton_.

We can define a singleton set using only objects and arrows.
We cannot define epsilon using objects an arrows.

This is an example of a _terminal object_.

The _cartesian product_ of sets $A$ and $B$ is $A\times B = \{(a,b)\mid a\in A, b\in B\}$.
Selecting the left and right elements correspond to the functions
$\alpha(a,b) = a$ and $\beta(a,b) = b$.

Note $\#(A\times B) = \#A\times \#B$.

__Exercise__. _If $\alpha\colon C\to A$ and $\beta\colon C\to B$ there exists a unique
function $\gamma\colon C\to A\times B$ with_
$$
	
$$

_Hint_: $\gamma c = (\alpha c, \beta c)$.

This defines cartesian product using only objects and arrows.

What is the "sum" of two sets? We could define $S + T = S\cup T$ to be the union, but
putting on our category theory glasses that turns out to be not quite right.

Reversing the arrows of the category definiton of product we are looking for
functions $l\colon S\to S + T$ and $r\colon T\to S + T$ with the following property:
if $\lambda\colon S\to U$ and $\rho\colon T\to U$ then there exists a unique 
function $\sigma\colon S + T\to U$ with
$$
	\sigma l = \lambda, \sigma r = \rho.
$$

We can define $l\colon S\to S\cup T$ and $r\colon T\to S\cup T$ by set inclusion.
If $\lambda\colon U\to S\cup T$ and $\rho\colon U\to S\cup T$ how do we define
$\sigma\colon S\cup T\to U$ so $\sigma l = \lambda$ and $\sigma r = \rho$?

If $s\in S$ we can define $\sigma s = \lambda s$ and if $t\in T$ we can define
$\sigma t = \rho t$.

__Exercise__. _If $s\in S$ and $s\notin T$ then $\sigma l s = \lambda s$.
If $t\in T$ and $t\notin S$ then $\sigma l t = \rho t$_.

The problem is ensuring $\sigma l = \lambda$ and $\sigma
r = \rho$ on the intersection $S\cap T$.


Computer science product and sum types.

Vector space V + W = V x W and V x W = L(V,W).

#A^B = #A^#B

We want #(A+B) = #A + #B
