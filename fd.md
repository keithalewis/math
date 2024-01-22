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

The Fréchet derivative was invented to generalize the notion of a derivative
of functions between infinite dimensional vector spaces.
It exists when a function is locally linear.

It $F\colon X\to Y$ where $X$ and $Y$ are normed linear spaces
the Fréchet derivative ${DF\colon X\to\BB(X,Y)}$ is defined by
$$
	F(x + h) = F(x) + DF(x)h + o(\|h\|)
$$
for $x,h\in X$ where $\BB(X,Y)$ is the set of bounded linear operators from $X$ to $Y$.
The "little $o$" notation means
$\|F(x + h) - F(x) - DF(x)h\|/\|h\| \to 0$ as $\|h\| \to 0$.
The function $F$ can be approximated near $x$ by the linear operator $DF(x)$.

If $f\colon\RR\to\RR$ then $f'(x) = \lim_{h\to 0}(f(x + h) - f(x))/h$.
The Fréchet derivative ${DF\colon\RR\to\LL(\RR,\RR)}$.

$V^*\cong V$ if $V$ is finite dimensional.

$(g\circ f)'(x) = g'(f(x))f'(x)$.

It is possible to write this without introducing the variable $x$.

$D(G\circ F)(x) = DG(f(x))DF(x)$.

$F\colon X\to Y$, $G\colon Y\to Z$

If $A$ and $B$ are sets then $B^A = \{f\colon A\to $B$\}$ is the set
of all function from $A$ to $B$. 



