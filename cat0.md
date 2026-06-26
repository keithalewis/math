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
