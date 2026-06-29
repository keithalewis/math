---
title: Sets and Functions
author: Keith A. Lewis
---

A set has _elements_. A _function_ $f$ from a set $A$ to a set $B$
takes an element $a\in A$ to an element $f(a)\in B$.
We write this as $f\colon A\to B$ and $a\in A\mapsto f(a)\in B$.

If $f\colon A\to B$ and $g\colon B\to C$ are functions then
their _composition_ $g\circ f\coloan A\to C$ is
$g\circ f(a) = g(f(a)$. We can drop $\circ$ when it clear function
composition is intended and write $(gf)(a) = gf(a) = g(f(a))$.

__Exercise__. _If $f\colon A\to B$, $g\colon B\to C$, and $h\colon C\to D$
then $h\circ(g\circ f) = (h\circ g)\circ f$_.

This shows we can write $h\circ g\circ f$ unambiguously. Function composition
is _associative_.

For any set $A$ define the _identity function_ $1_A\colon A\to A$ by $1_A(a) = a$ for $a\in A$.

__Exercise__. _If $f\colon A\to B$ show $f1_A = f$ and $1_Bf = f$_.

A function is _one-to-one_, or _injective_, if $f(a) = f(a')$ implies $a = a'$
whenever $a,a'\in A$. If $f\colon A\to B$ then $B$ might be larger than $A$,
but $f$ does not send two points in $A$ to the same value.

__Exercise__. _A function $f\colon A\to B$ is injective if and only if
there is a function $g\colon B\to A$ with $gf = 1_A$_.

_Hint_: The easy direction is if $gf = 1_A$. If $f(a) = f(a')$ then $gf(a) = gf(a').
Define $g\colon B\to A$ by $g(b) = a$ if $f(a) = b$.
Show this is _well-defined_ if $f$ is injective, i.e., if $g(b) = a$
and $g(b) = a'$ then $a = a'$.

A function is _onto_, or _surjective_, if for every $b\in B$ there exists
$a\in A$ with $f(a) = b$.

__Exercise__. _A function $f\colon A\to B$ is surjective if and only if
there is a function $h\colon B\to A$ with $fh = 1_B$_.

_Hint_: The easy direction is if $fh = 1_B$. Given $b\in B$ then $h(b)$ satisfies the
requirement. 
Define $h\colon B\to A$ by $h(b) = a$ if $f(a) = b$.
