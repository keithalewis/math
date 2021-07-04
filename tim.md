---
title: Monads
author: Keith A. Lewis
institution: KALX, LLC
email: kal@kalx.net
classoption: fleqn
fleqn: true
abstract: A _monad_ is a _monoid_ on the _endofunctors_ of a _category_.
...

\newcommand\RR{\bm{R}}
\newcommand\NN{\bm{N}}
\newcommand{\dom}{\operatorname{dom}}
\newcommand{\cod}{\operatorname{cod}}
\newcommand{\given}{\mid}
\newcommand\cat[1]{\mathbf{#1}}

We communicate using vocabulary. Italicised words indicate terms you may
not be familiar with that will be defined later.  I owe you definitions
for _monad_, _monoid_, _endofunctor_ and _category_ but that requires
going a bit deeper in debt first. I am assuming you know the meaning
of 'a', 'is', 'on', 'the', and 'of'.

A monoid is a set with a _binary operation_ that is _associative_ and
has an _identity element_.
A binary operation on a set $M$ is a function $m\colon M\times M\to M$.
It is associative if $m(m(a,b),c) = m(a, m(b,c))$, $a,b,c\in M$.
If we write $m(a,b)$ as $ab$ this says $(ab)c = a(bc)$
so we can write $abc$ unambiguously.
An identity element $e\in M$ satisfies $em = m = me$, for all $m\in M$.

A category is a collection of _arrows_ with a
_partial_ binary operation that is associative. 
Each arrow in the collection is associatied with two _objects_, a _domain_ and _codomain_.
For an arrow $f$ we write $f\colon A\to B$ where $A = \dom f$ is the domain
and $B = \cod f$ is the codomain.
If $f$ and $g$ are arrows and $\cod f = \dom g$ then the
partial binary operation $gf$ is well-defined and called _composition_.
Every object $A$ has an _identity arrow_ $1_A$ that
satisfies $1_{\cod f} f = f = 1_{\dom f}$.

A _functor_ $F\colon\mathcal{A}\to\mathcal{B}$ takes
arrows of the category $\mathcal{A}$ to arrows of category $\mathcal{B}$ and
preserves the category structure.
If $f\colon A\to A'$ in $\mathcal{A}$ then $F(f)\colon F(A)\to F(A')$ in $\mathcal{B}$
and if $g\colon A'\to A''$ then $F(gf) = F(g)F(f)$.
If $\mathcal{A} = \mathcal{B}$ then $F$ is an _endofunctor_.

A monad is a monoid on the endofunctors of a category.

## Remarks

This is a complete and correct definition of a monad, if not particularly enlightening.

The definition of a category is similar to that of a monoid except the binary operation
is not defined for all pairs of arrows. 

__Exercise__. _If a category has one object then it is a monoid_.

_Hint_: The binary operation is defined for all arrows $f$ since $\dom f$ and
$\cod f$ are the one object.

If you already know something about category theory you might think my
definition is lacking. The usual definition states a category has
arrows and objects, but arrows have a domain and codomain. The
identity arrows determine the objects.

The usual definition of a functor states it also
takes objects of the first category to objects of the second.

__Exercise__. _Show identity arrows are unique_.

_Hint_: Show if $f 1'_A = f$ and $1'_A g$ whenever $f\colon A\to B$ and $g\colon B\to A$
then $1'_A = 1_A$.

__Exercise__. _If $F$ is a functor then $F(1_A) = 1_{F(A)}$_.

Since identity arrows correspond to objects we also have an object mapping.

The canonical example of a category is $\cat{Set}$ where the arrows
are functions. Given a set $S$ let $S^*$ be the set of all finite
length lists of elements of $S$. This is a monoid with binary
operation concatenation and identity the empty list.
This is a functor from $\cat{Set}$ to $\cat{Mon}$ ...

The forGetful functor.

FG and GF

unit and counit

Monoids are quite common. Now that you know their mathematical definition
you, Baader, and Meinhof will start seeing them everywhere.  Examples
of monoids are the set of real numbers with addition and identity 0,
multiplication and identity 1, maximum and identity $-\infty$, and
minimum having identity $\infty$.

The binary operation for these examples is commutative. A non-commutative example
of a monoid is string concatenation having identity the empty string. 

__Exercise__. _If $M$ is a monoid and $1'\in M$ satisfies $1'm = m = m1'$ then $1' = 1$_.

_Hint_: $1'1 = 1$. The identiy element of a monoid is unique.

Examples of categories are $\cat{Set}$ with objects sets and arrows
functions, $\cat{Par}$ with arrows partial functions, and $\cat{Rel}$
with arrows relations.  Every partially ordered set is a category with
arrows $a\to b$ if and only if $a\le b$ in the ordering.
Transitivity defines composition and reflexivity provides the identity arrows.

__Exercise__. _If $P$ is a poset then there exists at most one arrow $a\to b$ for $a,b\in P$_.

This proves the associative law.

Many subcategories of $\cat{Set}$ are "sets with structure." The category
$\cat{Mon}$ has objects monoids and arrows are _homomorphisms_: functions
that preserve the binary operation.

__Exercise__. _Show if $f\colon M\to N$ is a monoid homomorphism then $f(1_M) = 1_N$_.

Here $1_M$ and $1_N$ are the identity elements of $M$ and $N$, not the identity arrows.

The _forgetful functor_ can be defined from any set with structure

F:Set -> Mon, G:Mon -> Set, adjunction, monad example

The binary operation for a category is associative, when defined, 
but identity arrows are all distinct.

## Notes

I first stumbled across Category Theory as a fledgling assistant math professor
working in the area of operator theory and functional analysis.
Somehow I manage to land a job at an Ivy League school and had the priveldge
of working with people I idolized as a grad student.
Category theory seemed to unify things across different areas of mathematics
but my esteemed colleagues told me stop "wasting" my time on that.
They were quite adamant about how "useless" it was. 
That is when I learned the phrase, "Every proof in category theory is either
a 'put on', or it's dual, a 'push over'".

I'm not very good at listening to what other people tell me to do, so
I kept spending time trying to understand category theory.
Many years later I, um, inherited Sammy Eilenberg's library of math books.
(Don't ask, my wife would kill me.) He wrote notes in the margin.
Not like Fermat about what he wanted to prove, notes that were his
unbowdlerized comments about what the author was, or more often wasn't, contributing
to the theory he and Saunder's Mac Lane founded.



## Bibliograpy

prefix sums CMU Zotero
