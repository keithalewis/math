---
title: APL
author: Keith A. Lewis
institute: KALX, LLC
classoption: fleqn
fleqn: true
abstract: A Programming Language
...

# Notation

\newcommand\NN{\bm{N}}
\newcommand\st{\mid}
\newcommand\each{\backslash}
\newcommand\fold{/}

Let's give names to things.

## Product

If $X$ and $Y$ are sets then $X\times Y = \{(x,y)\st x\in X, y\in Y\}$
is the _cartesian produce_ of $X$ and $Y$.

The _projections_ $\pi_0\colon X\times Y\to X$ where $\pi_0(x,y) = a$ and
$\pi_1\colon X\times Y\to Y$ where $\pi_1(x,y) = y$ 
characterize the cartesian product.
If $p_0\colon Z\to X$ and $p_1\colon Z\to Y$ there exists
$p\colon Z\to X\times Y$ with $\pi_0p = p_0$ and $\pi_1p = p_1$.

## Union

If $X$ and $Y$ are sets then $X\sqcup Y = \{(i,z)\st \text{where }z\in X, i = 0 \text{ or } z\in Y, i = 1\}$
is the _disjoint union_ of $X$ and $Y$.

The _inclusions_ $\nu_0\colon X\to X\sqcup Y$ where $\nu_0(x) = (0,x)$ and
$\nu_1\colon Y\to X\sqcup Y$ where $\nu_0(y) = (1,y)$ 
characterize the disjoint union.
If $n_0\colon X\to Z$ and $n_1\colon Y\to Z$ there exists
$n\colon X\sqcup Y\to Z$ with $n\nu_0 = n_0$ and $n\nu_1 = n_1$.

## Exponential

If $X$ and $Y$ are sets the _exponential_ $Y^X = \{X\to Y\} = \{f\colon X\to Y\}$
is the set of functions from $X$ to $Y$.

## Evaluation

The _evaluation function_ $e_Y^X = e\colon Y^X\times X\to Y$
is $e(f,x) = f(x)\in Y$, $f\in Y^X$, $x\in X$.

## Curry

The _curry function_ $\gamma\colon \{X\times Y\to Z\}\to \{X\to\{Y\to Z\}\}$ is
$(\gamma(f)x)y = f(x,y)\in Z$, $f\in \{X\times Y\to Z\}$, $x\in X$, $y\in Y$.

The _uncurry function_ $\gamma^*\colon \{X\to\{Y\to Z\}\}\to \{X\times Y\to Z\}$
is $\gamma^*(f)(x,y) = f(x,y)\in Z$, $f\in \{X\to\{Y\to Z\}\}$.

Natural numbers $\NN = \{0, 1, \ldots\}$.

$\iota n = \{0, \ldots, n - 1\}$, $n\in\NN$.

$\iota\colon\NN\to\NN^*$ where $\NN^* = \sqcup_{n\ge0}\NN^n$.
$\iota n\in\NN^n$.

## Remarks

Every expression is a list of data or functions in Polish notation.

Expressions are parsed right to left.

Data is pushed on the call stack.

Functions know what is on the call stack.

_Each_ is $f \each x y \ldots$ is $f x, f y, \ldots$. $f g\each x$ is $f x, g x$.

_Fold_ is $f \fold a b \ldots$ is $f(a,f(b,\ldots))$.

$K$ is the constant function $K\colon X\to\{X\to X\}$ where $K x y = x$.

Use $!$ for evaluation. 

_Array_ $X^{\iota n}$. $\[ x_0 x_1 \ldots\colon \iota n\to X$ by $i\mapsto x_i$.

_Tuple_ $\sqcap_{i\in I} X_i$

