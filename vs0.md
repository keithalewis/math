---
title: Vector Space
author: Keith A. Lewis
institution: KALX, LLC
email: kal@kalx.net
classoption: fleqn
abstract: Abelian group with scalar multiplication satisfying the distributed law.
...

\newcommand\mb[1]{\boldsymbol{#1}}
\newcommand\bm[1]{\boldsymbol{#1}}
\newcommand\RR{\bm{R}}
\newcommand\FF{\bm{F}}
\newcommand\NN{\bm{N}}
\newcommand\LL{\mathcal{L}}
\newcommand\BB{\mathcal{B}}
\newcommand\GG{\mathcal{G}}
\newcommand\ran{\operatorname{ran}}
\renewcommand\ker{\operatorname{ker}}
\renewcommand\span{\operatorname{span}}

A _vector_ is a function from an index set $I$ to the real numbers, $x\colon I\to\RR$.
Functions can be multiplied by a scalar, $(ax)(i) = (xa)(i) = a(x(i))$, and
added, $(x + y)(i) = x(i) + y(i)$, $a\in\RR$, $i,j\in I$.
This generalizes the usual definition of $\RR^n$ as the set of $n$-tuples
of real numbers $\{(x_1,\ldots,x_n)\mid x_j\in\RR\}$
by letting $I = \{1,\ldots,n\}$ and defining $x$ by $x(i) = x_i$.

__Exercise__. _Show $a(x + y) = ax + ay$ for $a\in\RR$, $x,y\in\RR^I$_.

Define the _zero vector_ $\bm{0}^I\colon I\to\RR$ by $\bm{0}^I(i) = 0$ for $i\in I$.
We write $\bm{0}$ if $I$ is understood.

__Exercise__. _Show $x + \bm{0} = x = \bm{0} + x$ for every vector $x$_.

The zero vector is an _additive identity_ for vector addition.

__Exercise__. _Show if $x + x = x$ then $x = \bm{0}$_.

_Hint_: $x(i) + x(i) = x(i)$ for all $i\in I$.

If $A$ and $B$ are sets then the _set exponential_ $B^A = \{f\colon A\to B\}$ is
the set of all functions from $A$ to $B$.

__Exercise__. _If $A$ and $B$ are finite show $\#B^A = \#B^{\#A}$_.

_Hint_: Where $\#A$ is the number of elements in set $A$.

Define $e_i\in\RR^I$, $i\in I$, by $e_i^I(j) = 1$ if $i = j$ and $e_i^I(j) = 0$ if $i\not=j$, $j\in I$.
The _standard basis_ of the vector space $\RR^I$ is $(e_i^I)_{i\in I}$.
We write $e_i$ if $I$ is understood.

__Exercise__. _If $I$ is finite show $x = \sum_{i\in I}x(i)e_i$ for $x\in\RR^I$_.

A _linear transformation_ is a function $T|colon\RR^I\to\RR^J$ that preserves the
vector space structure, $T(ax) = a(Tx)$ and $T(x + y) = Tx + Ty$, $a\in\RR$, $x,y\in\RR^I$.

__Exercise__. _If $T$ is a linear transformation show $T\bm{0}^I = \bm{0}^J$_

_Hint_: Use $T(\bm{0} + \bm{0}) = T\bm{0}$.

The set of linear transformations, $\LL(\RR^I,\RR^J)$, is also a vector space with
scalar multiplication $(aT)(x) = a(Tx)$ and addition $(T + S)(x) = Tx + Sx$, $a\in\RR$, $T,S\in\LL(\RR^I,\RR^J)$.
For $i\in I$ and $j\in J$ let $t_{ij} = Te_i(j)$. 
We call $(t_{ij})_{i\in I,j\in J}$ the _matrix_ of $T$ under the standard
basis for $\RR^I$ and $\RR^J$.

__Exercise__ _Show $T(\sum_{i\in I} x_i e_i) = \sum_{j\in J}(\sum_{i\in I} t_{ij}x_i) e_j$_.

If $T\in\LL(\RR^I,\RR^J)$ and $S\in\LL(\RR^J,\RR^K)$ then the composition
$ST\in\LL(\RR^I,\RR^K)$.

__Exercise__. _Show the matrix of $U = ST$ is $u_{ik} = \sum_{j\in J}t_{ij}s_{jk}$, $i\in I, $k\in K$_.

Every $T\in\LL(\RR^I,\RR^J)$ corresponds to $\overline{T}\in\RR^{I\times J}$
by $\overline{T}(i, j) = (Te_i)(j)$, $i\in I$, $j\in J$.

__Exercise__ _Show this correspondence is one-to-one and onto_.

_Hint_: Show the standard basis of $\RR^{I\times J}$ is $e_{ij}^{I\times J}(k, l) = e_i^I(k)e_j^J(l)$.

## Determinant

If $(e_i)_{i\in I}$ is a standard basis define the product $e_ie_j = -e_je_i$, $i,j\in I$.

__Exercise__. _Show $e_ie_i = 0$_.

Define $\GG_0 = \RR$, $\GG_1 = \{\sum_i a_i e_i\}$

If $T$ is a linear transformation define $T(e_i e_j) = Te_iTe_j$.

$T(\prod_i e_i) = (\det T)\prod e_i$.
