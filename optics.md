---
title: Optics
author: Keith A. Lewis
institute: KALX, LLC
classoption: fleqn
fleqn: true
abstract: Lenses, Prisms, Grates, and Traversals
...

\newcommand\cat[1]{\mathbf{#1}}

Optics are getters and setters for data in functional form.
Let $T_0$ be the _primitive types_. Define _data_ $T = T_0 + \Pi T^* + \Sigma T^*$.
Data are either a primitive type, products of data, or sums of data.

A _lens_ takes data $T$, a _view_ of the data $A$, and an _update_ taking
$T$ and a replacement $B$ for the view to produce data $U$ with
the view of $A$ replaced by $B$, $(T\to A)\times(S\times B)\to U$.

A _prism_ takes data $T$, a _choice_ of $A$ in $T$, and an way to _build_
$U$ from $B$ to produce data $U$, $(T\to A + U)\times(B\to U)$.

The Yoneda lemma provides a way of representing homsets of any category
in terms of homsets of $\cat{Set}$:
$\cat{C}(A,B)\cong \int_X \cat{Set}(\cat{C}(B,X), \cat{C}(A,X))$.
If $\cat{C}$ is $\cat{Set}$ this is analogous to Cayley's theorem
that every group can be respresented by a permutation group.
This may have stunted the development of group theory by
hiding the abstract axioms in a much richer and concrete representation.

If $\cat{C}$ is a category we write $\cat{C}(A,B)$ for all arrows in
$\cat{C}$ from object $A\in\cat{C}$ to object $B\in\cat{C}$.  If $\cat{C}$
and $\cat{D}$ are categories we write $[\cat{C},\cat{D}]$ for the
_functor category_ with objects being the functors from $\cat{C}$ to $\cal{D}$
and arrows being the _natural transformations_.

