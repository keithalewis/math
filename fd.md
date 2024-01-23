---
title: Fréchet Derivative
author: Keith A. Lewis
institute: KALX, LLC
classoption: fleqn
fleqn: true
abstract: Infinite dimensional derivatives
---

\newcommand\bm[1]{\boldsymbol{#1}}
\newcommand\RR{\boldsymbol{R}}
\newcommand\BB{\mathcal{B}}
\newcommand\LL{\mathcal{L}}
\newcommand\Var{\operatorname{Var}}
\newcommand\Cov{\operatorname{Cov}}

The Fréchet derivative is the derivative
of a function between normed vector spaces.

If $f\colon\RR\to\RR$ then the derivative of $f$ at $x$ is
$f'(x) = \lim_{h\to 0}(f(x + h) - f(x))/h$.
The function $f$ can be approximated near $x$ by
a line with slope $f'(x)$.

The limit can be written using _little $o$_ notation as
$$
	f(x + h) = f(x) + f'(x)h + o(h).
$$
The derivative is actually a linear functional $h\mapsto f'(x)h$.

If $F\colon X\to Y$ where $X$ and $Y$ are normed linear spaces
then the Fréchet derivative of $F$ at $x$ is ${DF\colon X\to\BB(X,Y)}$ defined by
$$
	F(x + h) = F(x) + DF(x)h + o(\|h\|)
$$
for $x,h\in X$ where $\BB(X,Y)$ is the set of bounded linear operators from $X$ to $Y$.
The function $F$ can be approximated near $x$ by the linear operator $DF(x)$.

The _dual_ of a normed linear space $X$ is $X^* = \BB(X,\RR)$.

__Exercise__. _Define $F\colon X\to\RR$ by $F(x) = a^*x$ where $a^*\in X^*$.
Show $DF(x) = a^*$_.

_Hint_: $F(x + h) = a^*(x + h) = F(x) + a^*h + 0$.

If $T\in\BB(X, Y)$ define the _adjoint_ $T^*\in\BB(Y^*, X^*)$ by
$(T^*y^*) x = y^*Tx$ for $x\in X$, $y^*\in Y^*$.

__Exercise__. _Show $T^*$ is linear_.

_Hint_: Show $T^*(tu^* + v^*) = tT^*u^* + T^*v^*$ for $t\in\RR$, $u^*, v^*\in Y^*$.


$V^*\cong V$ if $V$ is finite dimensional.

$(g\circ f)'(x) = g'(f(x))f'(x)$.

It is possible to write this without introducing the variable $x$.

$D(G\circ F)(x) = DG(f(x))DF(x)$.

$F\colon X\to Y$, $G\colon Y\to Z$

If $A$ and $B$ are sets then $B^A = \{f\colon A\to B\}$ is the set
of all function from $A$ to $B$. 

We write $B^A = \{A\to B\}$.

If $f 

