---
title: Grassmann Algebra
author: Keith A. Lewis
institute: KALX, LLC
classoption: fleqn
fleqn: true
abstract: The algebra of space
...

\newcommand\dom{\operatorname{dom}}
\newcommand\cod{\operatorname{cod}}
\renewcommand\ker{\operatorname{ker}}
\newcommand\ran{\operatorname{ran}}
\newcommand\Alg{\operatorname{Alg}}
\newcommand\cat[1]{\mathbf{#1}}
\newcommand\mb[1]{\mathbf{#1}}
\newcommand\RR{\mathbf{R}}


Let $E$ be $n$-dimensional space and let $\Alg E$ be the algebra over the
set of real numbers generated by $E$.  Elements $P\in E$ are _points_ and
$aP = Pa$ for $a\in\RR$ is a point with _weight_ $a$.  Both $\RR$ and $E$
are subsets of $\Alg E$.  If $A,B\in\Alg E$ then $A + B = B + A\in\Alg E$
whenever $A,B\in\Alg E$. The product $AB\in\Alg E$ is not commutative.

An _extensor_ of order $n$ is the product of
$n + 1$ points. Let $\mathcal{A}_n$ be the vector space generated
by extensors of order $n$. Cleary $\Alg E = \sum_{n\ge 0} \mathcal{A}_n$
so this algebra is _graded_.

Grassmann posited the rule $PQ = 0$ if and only if $P = Q$,
for any $P,Q\in E$. This can be used to detect when geometric objects _meet_.
An immediate consequence is $PQ = -QP$ for any $P,Q\in E$.

__Exercise__. _Prove $PQ = -QP$ for $P,Q\in E$_.

_Hint_: $(P + Q)(P + Q) = 0$.

The product $PQ$ is the oriented one dimensional space determined by
the points $P$ and $Q$ when $P\not=Q$. The product of $k + 1$ points
is either the $k$-dimensional _extensor_ they determine, or zero.
If the product is not zero then the points are _independent_.
If all extensors of order $n + 1$ vanish and there is a non-zero
extensor of order $n$ then $E$ is $n$-_dimension_.

__Exercise__. _If $P_0 = \sum a_j P_j$, $a_j\in\RR$, $P_j\in E$, is a finite sum then $P_0 P_1\cdots P_n = 0$_.

The converse is also true...

This simple rule leads to the interpretation of $aP + bQ$ as the point
having weight $a + b$ that is the baricenter of $aP$ and $bQ$.

A finite set of points $P_i\in E$ is _independent_ if $\sum a_i P_i = 0$ implies $a_i = 0$ for all $i$.

## Progressive Product

If  $A$ and $B$ are extensors with $\langle A\rangle \cap \langle B\rangle = 0$ 
then $\langle A\vee B\rangle = \langle A\rangle \oplus \langle B\rangle$.
If $\langle A\rangle \cap \langle B\rangle \not= 0$ 
then $\langle A\vee B\rangle = 0$.

## Regressive Product

If  $A$ and $B$ are extensors with $\langle A\rangle \cap \langle B\rangle \not= 0$ 
then $\langle A\wedge B\rangle = \langle A\rangle \oplus \langle B\rangle$.
If $\langle A\rangle \cap \langle B\rangle \not= 0$ 
then $\langle A\vee B\rangle = 0$.