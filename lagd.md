---
title: Linear Algebra
author: Keith A. Lewis
institute: KALX, LLC
classoption: fleqn
fleqn: true
abstract: Linear Algebra from the Ground Down
...

\newcommand\RR{\mathbf{R}}
\newcommand\ran{\operatorname{ran}}
\newcommand\st{\mid}
\newcommand\span{\operatorname{span}}
\newcommand\given[1]{\qquad\{#1\}}

I assume you are familiar with the vector space $\RR^n = \{(x_1,\ldots,x_n)\mid x_j\in\RR\}$,
where $\RR$ denotes the real numbers,
which has the _dot product_ $x\cdot y = \sum_j x_j y_j$, $x,y\in\RR^n$.
We also use the notation $(x,y)$ for $x\cdot y$.
You might also see this written as $x^Ty$ where superscript $T$ indicates transpose.
The dot product defines a _norm_ $\|x\| = \sqrt{(x,x)}$.

__Exercise__. _Show $\|x\| = 0$ if and only if $x = 0$, \|tx\| = |t|\|x\|$,
$|(x,y)| \le \|x\| \|y\|$, and
$\|x + y\| \le \|x\| + \|y\|$, $x,y\in\RR^n$, $t\in\RR$_.

_Hint_. $0 \le \|tx + y\|^2 = t^2\|x\|^2 + 2t(x, y) + \|y\|^2$ for $t\in\RR$ so
$(x,y)^2 - \|x\|^2\|y\|^2 \le 0$.

This also shows $|(x,y)| = \|x\| \|y\|$ if and only if $y = tx$ for some $t\in\RR$
when $x$ and $y$ are not zero.

We want to describe all _linear operators_ $T\colon\RR^n\to\RR^n$.
A linear operator is a function that preserves the vector space operations of $\RR^n$:
$T(tx) = t(Tx)$ and $T(x + y) = Tx + Ty$, $x,y\in\RR^n$, $t\in\RR$.

__Exercise__. _If $n = 1$ and $t = T1$ then $Tx = tx$ for all $x\in\RR^1$_.

Let $(e_j^n)_{j=1}^n$ be the _standard basis_ of $\RR^n$, where the $j$-th component of $e_j$
is 1 and all others are 0. Write $e_j$ if $n$ is understood. In the exercise above
we identified $e_1 = e_1^1 = (1)$ with the real number 1. Every element of $\RR^1$
can be written $t e_1$ for some $t\in\RR$. This shows $\RR^1$ is the "same as" $\RR$, but
it is a good idea to keep track of when you make this identification.

Every vector $x = (x_1,\ldots,x_n)\in\RR^n$ can be written using the standard basis
as $x = \sum_j x_j e_j$. Every linear operator $T\colon\RR^n\to\RR^n$ is determined
by its values on the standard basis. If $Te_j = f_j\in\RR^n$ then
$Tx = T(\sum_j x_j e_j) = \sum_j x_j f_j$, $x\in\RR^n$.
Each $f_j = \sum_k t_{jk} e_k$ for some $t_{jk}\in\RR$.
We say $(t_{jk})_{j,k=1}^n$ is the _matrix representation of $T$.
This identifies all linear transformations on $\RR^n$ with $\RR^{n^2}$.

Matrix multiplication is composition...

$n = 2$

$Se_1 = e_2$, $Se_2 = 0$

$p(S) = p(0)I + p(1)S$.

General $n$. $p(S) \sum_{j=0}^n p^{(j)}S^j/j!$.

We can define $f(T)$ for any $f$.
