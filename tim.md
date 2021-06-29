---
title: Monads
author: Keith A. Lewis
institution: KALX, LLC
email: kal@kalx.net
classoption: fleqn
fleqn: true
abstract: What a monad is
...

\newcommand\RR{\bm{R}}
\newcommand\NN{\bm{N}}
\newcommand{\dom}{\operatorname{dom}}
\newcommand{\cod}{\operatorname{cod}}
\newcommand{\given}{\mid}

A _monad_ is a monoid on the endofunctors of a category.

A _monoid_ is a set with a binary operation that is associative and
an identity element. Examples are addition with identity 0,
multiplication with identity 1, maximum with identity $-\infty$,
and minimum with identity $\infty$.

A _binary operation_ on a set $M$ is a function $m\colon M\times M$ to $M$.
It is _associative_ if $m(m(a,b),c) = m(a, m(b,c))$, $a,b,c\in M$.
If we write $m(a,b) = (ab)$ this says $(ab)c = a(bc)$, dropping the
unnecessary outer parentheses, so we can write $abc$ unambiguously.

An _identity_ $e\in M$ satisfies $em = m = me$, $m\in M$.

__Exercise__. _If $e'\in M$ satisfies $e'm = m = me'$ then $e' = e$_.

_Hint_: $e'e = e$.

Any set with an associative binary operation (_semigroup_) can be
turned into a monoid by adjoining an identity.

__Exercise__. ...

A _category_ is a collection with a binary _partial_ operation, $\circ$,
that is associative.  Each _arrow_ in the collection has a _domain_
and _codomain_ that is an _object_.
Write $f\colon A\to B$ to indicate $f$ is an arrow with domain $\dom f = A$
and codomain $\cod f = B$.
If $f$ and $g$ are arrows and
$\cod f = \dom g$ then the binary operation $g\circ f$ is well-defined.
Every object $A$ has an _identity arrow_ $1_A$ that satisfies $1_{\cod
f}\circ f = f$ and $f\circ 1_{\dom f} = f$.

A _functor_ $F\colon\mathcal{A}\to\mathcal{B}$ takes
objects of the category $\mathcal{A}$ to objects of category $\mathcal{B}$ and
arrows of the category $\mathcal{A}$ to arrows of category $\mathcal{B}$ 
and preserves the category sturcture.
If $f\colon A\to A'$ in $\mathcal{A}$ then $F(f)\colon F(A)\to F(A')$ in $\mathcal{B}$.

__Exercise__. _Show $F(1_A) = 1_{F(A)}$_.

If $\mathcal{A} = \mathcal{B}$ then $F$ is an endofunctor.
A _monad_ is a monoid on the endofunctors of a category.
