---
title: Why Category Theory?
author: Keith A. Lewis
institution: KALX, LLC
email: kal@kalx.net
classoption: fleqn
abstract: 
...

\newcommand\cat[1]{\mathbf{#1}}

Everything in classical mathematics is a _set_. Logicians are
wont to say "the language of Set Theory is _epsilon_." By that they mean
the only additional symbol required in first-order logic to define the
axioms for set membership is $\epsilon$

The first attempt at defining modern Set Theory is due to Frege. He
defined a set by giving a rule for membership. Bertrand Russell showed
that entailed a contradiction. Let $S$ be the set of all sets $x$ where
it is not the case $x\in x$, $S = \{x\mid x\notin x\}$.

__Exercise__. _Show $S\in S$ implies $S\notin S$ and $S\notin S$ implies $S\in S$_.

It was not easy to fix up Frege's theory. Zermelo-Fraenkel, von Neumann.

Their axioms are not the first thing you might think of.

## Category Theory

Category theory uses _objects_ and _arrows_ instead of membership to express mathematical concepts. 

Using Category Theory to define a set turned out to be problematic.
It was not possible to recapture the notion of set membership.
Topos Theory identified the concept of parameterized membership
as a _subobject classifier_. Sometimes it is more natural to
consider the points on a sphere as the unique tangent plane to the point.

## \cat{Set}

The objects in category $\cat{Set}$ are sets and the arrows are functions from one set to another.
If $A = \{a\}$ is a set with one element (a _singleton_)
then for every set $B$ there is a unique function from
$A$ to the singleton set $\{a\}$.

__Exercise__. _If $A$ is a set and for every set $B$ there exists a unique function from $A$ to $B$
then $A$ is a singleton_.

We can define a singleton set using only objects and arrows.

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
