---
title: Yoneda
author: Keith A. Lewis
institute: KALX, LLC
classoption: fleqn
fleqn: true
abstract: Representing categories
...

\newcommand\dom{\operatorname{dom}}
\newcommand\cod{\operatorname{cod}}
\newcommand\ran{\operatorname{ran}}
\newcommand\cat[1]{\mathbf{#1}}
\newcommand\mb[1]{\mathbf{#1}}

Nobody understands the Yoneda lemma, where by _nobody_ I mean _I_ don't understand
the Yoneda lemma. As Von Neumann said, "You don't understand
math, you just get used to it." This short exegesis is my attempt to get used to it.

The Yoneda lemma is similar to Cayley's theorem that states
every group is (isomorphic to) a subgroup of the permutaion group of the set of group elements.
The abstract notion of a group defined in terms of axioms
can be represented by embedded it in a more familiar structure.
The Yoneda lemma is different from Cayley's theorem in that it represents categories
by embedding them in a less familiar structure.

## Cayley's theorem

I will never understand why Cayley gets the cognomen "theorem" while Yoneda only rates a "lemma".
The proof of Cayley's theorem is much easier to demonstrate. Recall a _monoid_ is a
set $M$ with a binary operation that is associative and has an identity element $1$,
$1m = m = m1$, $m\in M$.

A _group_ $G$ is a moniod with inverse elements: for every $g\in G$ there exists an inverse
$g^{-1}\in G$ with $gg^{-1} = 1$.

__Exercise__. _Show inverses are unique_.

A _permutation_ on a set $S$ is a function $\sigma\colon S\to S$ that is one-to-one and onto.
Such functions are invertable and the collection of all permutations form a group $\Sigma(S)$
where the binary operation is function composition and the identity is the identity permutation.

For any $g$ in the group $G$ define $L_g\colon G\to\Sigma(G)$ by $L_gh = gh$, $h\in G$.

__Exercise__. _Show for any $g\in G$ that if $L_gh = L_gk$, $h,k\in G$, then $h = k$_.

_Hint_: Multiply both sides on the left by $g^{-1}$.

This shows $L_g$ is one-to-one, $g\in G$.

__Exercise__. _Show the range of $L_g$ is a subgroup of $\Sigma(G)$_.

Every one-to-one function is inverable onto its range so this establishes Cayley's theorem. 

We could also define $R_g\colon G\to\Sigma(G)$ by $L_gh = hg$, $h\in G$ to get
an equivalent result. Yoneda's lemma exhibits a similar chirality.

## Yoneda's lemma

Let's start by writing down some easily verifiable statements.

If $g\colon X\to Y$ is an arrow in the category $\cat{C}$ then for
any arrow $h\colon Z\to X$ define left composition $L_gh = gh\colon Z\to Y$.

If $g\colon X\to Y$ is an arrow in the category $\cat{C}$ then for
any arrow $h\colon Y\to Z$ define right composition $R_gh = hg\colon X\to Z$.

The collection of arrows having codomain $Z$ is usually denoted $\hom(\_,Z)$
but let's write it as $\{\_\to Z\}$ and let $\{Z\to\_\}$ be the collection
of arrows having domain $Z$.
Note $L_g\colon\{\_\to Z\}\to\{Z\to\_\}$ and $R_g\colon\{_\to Z\}\to\{_\to Z\}$.

The arrows of $\{\_\to Z\}$ are $L_g$ where $g$ is any arrow in $\cat{C}$.
The arrows of $\{Z\to\_\}$ are $R_g$ where $g$ is any arrow in $\cat{C}$.

If $f\colon X\to Y$ and $g\colon U\to V$
then $Z\to f\colon\{Z\to X\}\to\{Z\to Y\}$ and $Z\to g\colon\{Z\to U\}\to\{Z\to V\}$.  
If $U = Y$ we can compose $gf\colon X\to V$ in $\cat{C}$ and
$(Z\to g)(Z\to f)\colon\{Z\to X\}\to\{Z\to V\}$ in $\{Z\to\_\}$,

__Exercise__. _Show $Z\to gf = (Z\to g)(Z\to f)$_.

For every object $Z$ in $\cat{C}$ define the contravariant functor 
$\to Z\colon\cat{C}\to\{\_\to Z\}$ by $f\mapsto f\to Z$.  
For every object $Z$ in $\cat{C}$ define the (covariant) functor
$\to Z\colon\cat{C}\to\{\_\to Z\}$ by $f\mapsto Z\to f$.  

__Exercise__. _For any object $Z$ in $\cat{C}$ show $h\to Z = k\to Z$ implies $h = k$, where
$h,k$ are arrows in $\cat{C}$_.

_Hint_: If $h\colon X\to Y$ and $h\colon U\to V$ then $h\to Z$ and $k\to Z$ must have
the same domain and codomain so $X = U$ and $Y = V$. Apply $1_Y$ to both sides.

This shows the functor $\to Z$ is one-to-one. Likewise, $Z\to$ is also one-to-one.

It also establishes the Yoneda lemma

__Lemma__. (Yoneda) _Every categoy $\cat{C}$ is isomorphic to $\{\_\to Z\}$ and $\{Z\to\_\}$, where
$Z$ is an(y) object of $\cat{C}$_.

## Remarks

The standard terminology for a functor that is an isomorphism is that it is _full_ and _faithful_.
The standard way to write $\{\_\to Z\}$ is $\hom(\_,Z)$. If we define
$\to Z\colon\cat{C}^{op}\to\{\_\to Z\}$ then we don't need to mention contravariant functors.

Yoneda's lemma is quite shocking. Pick an object, any object, and you get a representation.
Also, each arrow of $\cat{C}$ gets sent to a boatload of arrows but the
fact the representation is one-to-one (faithfull) follows from evaluating
on the identity arrow (of a different object).

Maybe it should not be so shocking. In Cayley's theorem each group element gives both a left
and right representaion. Also, the representation involves a permutation that can
shuffle every element in the group.
