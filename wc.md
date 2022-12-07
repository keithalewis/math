---
title: Why Category Theory?
author: Keith A. Lewis
institution: KALX, LLC
email: kal@kalx.net
classoption: fleqn
abstract: 
...

\newcommand\cat[1]{\mathbf{#1}}

Category theory uses  _objects_ and _arrows_ to express mathematical
concepts.  Everything in classical mathematics is a _set_. Logicians are
wont to say "the language of Set Theory is _epsilon_." By that they mean
the only additional symbol required in first-order logic to define the
axioms for set membership is $\epsilon$

The first attempt at defining modern Set Theory is due to Frege. He
defined a set by giving a rule for membership. Bertrand Russell showed
that entailed a contradiction. Let $S$ be the set of all sets $x$ where
it is not the case $x\in x$, $S = \{x\mid x\notin x\}$.

__Exercise__. _Show $S\in S$ implies $S\notin S$ and $S\notin S$ implies $S\in S$_.

When a mathematical theory has a contradiction it is useless. Why?

It was not easy to fix up Frege's theory. Zermelo-Fraenkel, von Neumann.

Axioms are not the first thing you might think of.

Using Category Theory to define a set turned out to be problematic.
It was not possible to recapture the notion of set membership.
Topos Theory identified the concept of parameterized membership
as a _subobject classifier_. Sometimes it is more natural to
consider the points on a sphere as the unique tangent plane to the point.

## \cat{Set}

The objects in category $\cat{Set}$ are sets and the arrows are functions from one set to another.
If $S = \{x\}$ is a set with one element (a _singleton_)
then for every set $T$ there is a unique function from
$T$ to the singleton set $\{x\}$.

__Exercise__. _If $S$ is a set and for every set $T$ there exists a unique function from $T$ to $S$
then $S$ is a singleton_.

We can define a singleton set using only objects and arrows.

The cartesian product of sets $S$ and $T$ is $S\times T = \{(s,t)\mid s\in S, t\in T\}$.
Selecting the left and right elements correspond to the functions
$l(s,t) = s$ and $r(s,t) = t$.

__Exercise__. _If $\lambda\colon U\to S$ and $\rho\colon U\to T$ there exists a unique
function $\pi\colon U\to S\times T$ with_
$$
	l\pi = \lambda, r\pi = \rho.
$$

_Hint_: $\pi u = (\lambda u, \rho u)$.

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
