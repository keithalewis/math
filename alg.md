---
title: Algebras
author: Keith A. Lewis
abstract: Algebras are sets with operations satisfying rules
---

An _algebra_ is a set with operations that satisfy rules.
A _homomorphism_ is a function from an algebra to an
algebra that respects the algebraic rules.
An _isomorphism_ is a one-to-one and onto (bijective) homomorphism.
The game mathemeticians like to play is finding a simple
way to classify algebras up to isomorphism.

Vector spaces are a mathematical sweet spot. Two vector spaces are
isomorphic if and only if they have the same dimension.
The only thing simpler is sets: they are isomorphic if and
only if they have the same number of element.

<!--
These two things are related.
-->


## Binary Operation

A _binary operation_ on a set $S$ is a function $m\colon S\times S\to S$.

It is _commutative_/_abelian_ if $m(a,b) = m(b,a)$ for $a,b\in S$.

## Semigroup

A _semigroup_ is a set with an associative binary operation:
$m\colons S\times S\to S$ with $m(m(a,b)c) = m(a,m(b,c))$.

Writing $ab$ for $m(a,b)$ gives $(ab)c = a(bc)$ so $abc$ has a unique reading.

Map-Reduce

## Monoid

A _monoid_ is a semigroup with identity. A monoid $M$ 
has identity element $e\in M$ satisfying $em = m = me$ for all $m\in M$.

__Exercise__: _Show the identity is unique_.

__Exercise__: _If $em = m$ for all $m\in M$ then $me = m$ for all $m\in M$_.

Every semigroup can be made into a monoid. Given a semigroup $S$ pick
an element $e\not\in S$ and let $M = S\cup\{e\}$.
Define $ab = ab$ if $a,b\in S$, $ae = a$ if $a\in S$, and $eb = b$ if $b\in S$.
This defines $ab$ for all $a,b\in M$.

__Exercise__: _Show $M$ is a monoid_.

_Hint_. Show the extended binary product is associative.

## Group

A group is a monoid where every element has an _inverse_:
for every $g\in G$ there exist $g'$ with $gg' = e$.

__Exercise__: _Show $g'$ is unique_.

__Exercise__: _Show if $g'g = e$ for all $g\in G$_.

The notation $g'$ for the inverse is not standard.
It is written $g^{-1}$ for multiplicative binary
operations an $-g$ for additive binary operations.

## Ring

A _ring_ is an additive abelian group, multiplicaive semigroup, left and right distributive
$a(b + c) = ab + ac$ and $(a + b)c = ac + bc$.

Ring with unity multiplication is a monoid.

## Domains

### Integral Domain

Commutative ring with identity where $ab = 0$ implies $a = 0$ or $b = 0$.

Allows cancellation.

__Exercise__: _Show $ab = ac$ implies $b = c$_.

### Principle Ideal Domain

### Unique Factorization Domain

## Field

Commutative ring where multiplication is a group.

## Module

## Vector Space
