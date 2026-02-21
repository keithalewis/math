---
title: Functions
author: Keith A. Lewis
abstract: Giving names to operations on functions.
---
\newcommand\cat[1]{\mathbf{#1}}

A function $f$ from set $A$ to set $B$, $f\colon A\to B$, takes an
element $a\in A$ and produces (somehow) an element $f(a)\in B$.
The _composition_ of $f\colon A\to B$ and $g\colon B\to C$
is $g\circ f\colon A\to C$ defined by $(g\circ f)(a) = g(f(a))$.

__Exercise__. _If $f\colon A\to B$, $g\colon B\to C$, and
$h\colon C\to D$ then $(h\circ g)\circ f = h\circ(g\circ f)$_.

This shows composition is _associative_ so functions under
composition form a _semigroup_.

The _identity function_ for the set $A$ is $1_A\colon A\to A$
defined by $1_A(a) = a$.

__Exercise__. _If $f\colon A\to B$ show $1_B\circ f = f$ and $f\circ 1_A = f$_.

This shows sets and functions form a _category_, $\cat{Set}$.
A category is a collection of _objects_ and _arrows_ with associative
composition that have left and right inverses.

## Mono

A function $f\colon A\to B$  is _one-to-one_, or _injective_ if 
$f(a) = f(a')$, $a,a'\in A$, implies $a = a'$.

__Exercise__. _Show $f\colon A\to B$ is one-to-one if and only if
there exists $g\colon B\to A$ with $g\circ f = 1_A$_.

_Hint_: If $g\circ f = 1_A$ and $f(a) = f(a')$ then $g\circ f(a) = g\circ f(a')$.

This is the definition of a _mono_ arrow in a category.

## Epi

A function $f\colon A\to B$  is _onto_, or _surjective_ if 
for every $b\in B$ there exists an $a\in A$ with $f(a) = b$.

__Exercise__. _Show $f\colon A\to B$ is onto if and only if
there exists $g\colon B\to A$ with $f\circ g = 1_B$_.

_Hint_: If $f\circ g = 1_B$ then $f\circ g(b) = b$.

This is the definition of an _epi_ arrow in a category.

## Iso

A function that is both one-to-one and onto is called
a one-to-one correspondence.

This is the definition of an _iso_ arrow in category.
It generalizes the notion of equality to equivalence.
If there exists $f\colon A\to B$ that is iso we write $A\cong B$.

__Exercise__. _Show (reflexive) $A\cong A$_.

__Exercise__. _Show (symmetric) if $A\cong B$ then $B\cong A$_.

__Exercise__. _Show (transitive) if $A\cong B$ and $B\cong C$ then
$A\cong C$_.

These exercises are the definition of $\cong$ being
an _equivalence relation_. Two sets are equal if they
have the same elements. Two sets are equivalent if
they have the same number of elements.

## Product

Everything in classical mathematics is a set.
Two sets are equal if and only if
they have the same elements. For example, $\{a,b\} = \{b, a\}$.
It is a little tricky to define an _ordered pair_ $(a, b)$ by
$(a,b) = (c,d)$ if and only if $a = c$ and $b = d$ using sets.
It is not the case $(a,b) = (b,a)$.

Kazimierz Kuratowski improved Norbert Wiener's definition of
an _ordered pair_ $(a,b)\in A\times B$ 
as the set $\{\{a\},\{a,b\}\}$.

__Exercise__. _Show $\{\{a\},\{a,b\}\} = \{\{c\},\{c,d\}\}$ if and only
if $a = c$ and $b = d$_.

_Hint_: Sets are equal if and only if they have the same elements.
It is not the case $\{a\} = \{c,d\}$ so $\{a\} = \{c\}$ and $a = c$.
It is also not the case $\{a,b\} = \{c\}$ so $\{a,b\} = \{c,d\}$.

The _(cartesian) product_ of set $A$ and $B$ is $A\times B = \{(a,b)\mid a\in A, b\in B\}$.
Define _projections_ $\pi_A\colon A\times B\to A$ by $\pi_A(a,b) = a$
and $\pi_B\colon A\times B\to B$ by $\pi_B(a,b) = b$.

__Exercise__. _Show if $p_A\colon C\to A$ and $p_B\colon C\to B$ then
there exists $p\colon C\to A\times B$ with $\pi_A p = p_A$ and
$\pi_B p = \pi_B$_.

_Hint_: Define $p(c) = (p_A(c), p_B(c)$.

This is a _pointwise_ definition. It is also possible 
define the product using only sets and functions.

The product of set $A$ and $B$ can be defined by functions $\pi_A\colon
A\times B\to A$ and $\pi_B\colon A\times B\to B$ with the property that
given functions $p_A\to C$ and $p_B\to C$ there exists a function $p\colon
C\to A\times B$ with  $p\pi_A = p_A$ and $p\pi_B = \pi_B$.
This is called a _pointless_ definition, but it is anything but that.

In classical mathematics a function $f\colon A\to B$
can be identified by its _graph_ $\{(a,f(a))\mid a\in A\}\subseteq A\times B$. 
This has limited usefulness if want to think of a function as something
performing a computataion. It also leads to a contradiction
that Bertand Russell pointed out to Frege's proposed theory of sets.
The graph of the identity function on sets is not a set.

## Sum

The _sum_ of two sets is not their union. If $c\in A\cup B$ then
$c\in A$ or $c\in B$. If $c$ is in their intersection $A\cap B$
it may have come from either $A$ or $B$.
The sum is the _disjoin union_ of $A$ and $B$ that preserves
that information,
$A\squarecup B = (\{0\}\times A)\cup (\{\1\}\times B)$.
Define _injections_ $\nu_A\colon A\to A\sqcup B$ by $\nu_A(a) = (0, a)$
and $\nu_B(b) = (1, b)$.

__Exercise__. _Show if $n_A\colon A\to C$ and $n_B\colon B\to C$
there exists $n\colon A\sqcup B\to C$ with $n\nu_A = n_A$
and $n\nu_B = n_B$. 

_Hint_: Define $n((0, a)) = a$ and n((1,b)) = b$. 

Note how sums are defined by reversing the arrows in products.

## Exponential

The set exponential $B^A$ is the set of all functions from $A$ to $B$:
$B^A = \{f\colon A\to B\}$. We also write this as $B^A = \{A\to B\}$.

## Evaluation

Given $f\colon A\to B$ and $a\in A$ evaluation produces $f(a)\in B$:
$e = e_{A,B}\colon B^A\times A\to B$ by $e(f,a) = f(a)$.

## Curry

Given $f\colon A\times B\to C$ define _curry_ $f,\colon A\to C^B$
by $(f,a)b = f(a,b)$. This looks more natural
if we write it as $f,\colon A\to\{B\to C\}$.

Given $g\colon A\to\{B\to C\}$ define _uncurry_ $,g\colon A\times B\to C$
by $,g(a,b) = (ga)b$.

__Exercise__. _Show $,(f,) = f$ and $(,g),= g$_.

## *Variance

Covariance and contravariance are defined for a function $f\colon A\to B$
by $\circ f\colon C^B\to C^A$ where $\circ f(g) = f\circ g$
and $f\circ\colon A^C\to B^C$ where $f\circ(h) = h\circ f$.
A tensor is a function that transforms as a tensor can be given
a rigorous definition.
