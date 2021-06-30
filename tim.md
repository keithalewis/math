---
title: Monads
author: Keith A. Lewis
institution: KALX, LLC
email: kal@kalx.net
classoption: fleqn
fleqn: true
abstract: This is monad
...

\newcommand\RR{\bm{R}}
\newcommand\NN{\bm{N}}
\newcommand{\dom}{\operatorname{dom}}
\newcommand{\cod}{\operatorname{cod}}
\newcommand{\given}{\mid}
\newcommand\cat[1]{\mathbf{#1}}

A _monad_ is a monoid on the endofunctors of a category.

A _monoid_ is a set with a binary operation that is associative and
has an identity element.

A _binary operation_ on a set $M$ is a function $m\colon M\times M\to M$.
It is _associative_ if $m(m(a,b),c) = m(a, m(b,c))$, $a,b,c\in M$.
If we write $m(a,b) = (ab)$ this says $(ab)c = a(bc)$, dropping the
unnecessary outer parentheses, so we can write $abc$ unambiguously.

An _identity_ $e\in M$ satisfies $em = m = me$, for all $m\in M$.

A _category_ is a collection of _arrows_ and _objects_ with a
binary _partial_ operation, $\circ$, that is associative. 
Each arrow in the collection has a _domain_ and _codomain_ that are objects.
We write $f\colon A\to B$ where $A = \dom f$ and $B = \cod f$.
If $f$ and $g$ are arrows and $\cod f = \dom g$ then the
binary operation $g\circ f$ is well-defined.
Often $\circ$ is elided and simply $gf$ is written.
Every object $A$ has an _identity arrow_ $1_A$ that
satisfies $1_{\cod f} f = f = 1_{\dom f}$.

A _functor_ $F\colon\mathcal{A}\to\mathcal{B}$ takes
objects of the category $\mathcal{A}$ to objects of category $\mathcal{B}$ and
arrows of the category $\mathcal{A}$ to arrows of category $\mathcal{B}$ 
that preserves the category structure.
If $f\colon A\to A'$ in $\mathcal{A}$ then $F(f)\colon F(A)\to F(A')$ in $\mathcal{B}$
and if $g\colon A'\to A''$ then $F(gf) = F(g)F(f)$.
If $\mathcal{A} = \mathcal{B}$ then $F$ is an _endofunctor_.

A _monad_ is a monoid on the endofunctors of a category.

## Remarks

Examples of monoids are the set of real numbers with addition and identity 0,
multiplication and identity 1, maximum and identity $-\infty$,
and minimum having identity $\infty$.

__Exercise__. _If $M$ is a monoid and $e'\in M$ satisfies $e'm = m = me'$ then $e' = e$_.

_Hint_: $e'e = e$, so the identiy element of a monoid is unique.

The canonical example of a category is $\cat{Set}$, where the arrows are functions and
the objects are sets. If the arrows are partial functions we get the category $\cat{Par}$.
If the arrows are relations we get the category $\cat{Rel}$.
A _relation_ $R\colon A\to B$ is a subset $R\subseteq A\times B$.
For any relation $R$, $\dom R = \{a\in A\mid (a,b)\in R\text{ for some }b\in B\}$
and $\cod R = \{b\in B\mid (a,b)\in R{ for some }a\in A\}$.
If $S\colon B\to C$ is a relation define composition by
$SR = \{(a,c)\in A\times C\mid (a,b)\in R, (b,c)\in S\text{ for some }b\in B\}$.

__Exercise__. _Show $\cat{Par}$ and $\cat{Rel}$ are categories_.

The second canonical example of a category is $\cat{Pos}$, the collection of
partially ordered sets. Every poset is a category whose objects are elements
of the set and there is an arrow $a\to b$ if and only if $a\le b$.
In a poset the order relation is _reflexive_, $a\le a$, and _transitive_,
$a\le b$ and $b\le c$ imply $a\le c$.

__Exercise__ _Show every poset is a category_.

Unlike $\cat{Set}$ the objects are elements. 

The binary operation for a category is associative, but it is not defined
for all pairs of arrows. Identity arrows are all distinct.

__Exercise__. _Show $F(1_A) = 1_{F(A)}$_.
