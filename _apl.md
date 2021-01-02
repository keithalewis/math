---
title: APL
author: Keith A. Lewis
institute: KALX, LLC
classoption: fleqn
fleqn: true
abstract: A Programming Language
...

# Notation

\newcommand\BB{\bm{B}}
\newcommand\CC{\bm{C}}
\newcommand\NN{\bm{N}}
\newcommand\RR{\bm{R}}
\newcommand\ZZ{\bm{Z}}

\newcommand\MM{\bm{M}}
\newcommand\SS{\bm{S}}
\newcommand\FF{\bm{R}}

\newcommand\st{\mid}
\newcommand\scan{\backslash}
\newcommand\fold{/}
\newcommand\add{+}
\newcommand\sub{-}
\newcommand\mul{×}
\newcommand\div{÷}
\newcommand\exec{!}
\newcommand\stop{'}
\newcommand\uniq{ν}
\newcommand{\f}{0}
\newcommand{\t}{1}

Let's give names to things.

## Types

Types are classified by mathematical objects: set, monoid, group, ring, field.

_Primitive types_ are _boolean_ (field), _natural number_ (monoid),
_integer_ (abelian group, ring), _real number_ (field), _string_ (monoid).

_Types_ are either primitive types, _products_ of types, _coproducts_ of types,
or _exponentials_.

An _array_ is a product of homogenous types.
Arrays are written $x = (x^i)$, $\pi_i x = x^i \in X$.

A _tuple_ is a product of not necessarily homogenous types.
Tuples are written $x = \langle x^i\rangle$, $\pi_i x = x^i\in X_i$.

A coproduct is a _variant type_ that can take on distinguished values.
It is a _dijoint union_ of types that is a union plus information
of which set an element belongs to.
Coproducts are written $x = [x_i]$, $ν_i x_i = x$.

An _exponential_ is the set of all functions from one type to another
that preserves the types.

## Product

If $X$ and $Y$ are sets then $X\prod Y = \{(x,y)\st x\in X, y\in Y\}$
is the _cartesian product_ of $X$ and $Y$.

The _projections_ $\pi_0\colon X\prod Y\to X$ where $\pi_0(x,y) = x$ and
$\pi_1\colon X\prod Y\to Y$ where $\pi_1(x,y) = y$ 
characterize the cartesian product.
If $p_0\colon Z\to X$ and $p_1\colon Z\to Y$ there exists
$p\colon Z\to X\prod Y$ with $\pi_0p = p_0$ and $\pi_1p = p_1$.

_Array_: $x\in\prod_i X$ is written $x = (x^i)$ where $π_i x = x^i$.

_Tuple_: $x\in\prod_i X_i$ is written $x = \langle x^i\rangle$ where $π_i x = x^i$

## Coproduct

If $X$ and $Y$ are sets then $X\coprod Y = \{(z,i)\st \text{where }z\in X, i = 0 \text{ or } z\in Y, i = 1\}$
is the _coproduct_ of $X$ and $Y$.

The _inclusions_ $\nu_0\colon X\to X\coprod Y$ where $\nu_0(x) = (x, 0)$ and
$\nu_1\colon Y\to X\coprod Y$ where $\nu_0(y) = (y, 1)$ 
characterize the coproduct.
If $n_0\colon X\to Z$ and $n_1\colon Y\to Z$ there exists
$n\colon X\coprod Y\to Z$ with $n\nu_0 = n_0$ and $n\nu_1 = n_1$.

_Variant_: $x\in\coprod_i X_i$ is written $x = [x_i]$ where $ν_i x_i = x$.

## Exponential

If $X$ and $Y$ are sets the _exponential_ $Y^X = \{X\to Y\} = \{f\colon X\to Y\}$
is the set of functions from $X$ to $Y$.

## Evaluation

The _evaluation function_ $e_Y^X = e\colon Y^X\prod X\to Y$
is $e(f,x) = f(x)\in Y$, $f\in Y^X$, $x\in X$.

## Curry

The _curry function_ $\gamma\colon \{X\prod Y\to Z\}\to \{X\to\{Y\to Z\}\}$ is
$(\gamma(f)x)y = f(x,y)\in Z$, $f\in \{X\prod Y\to Z\}$, $x\in X$, $y\in Y$.

The _uncurry function_ $\gamma^*\colon \{X\to\{Y\to Z\}\}\to \{X\prod Y\to Z\}$
is $\gamma^*(f)(x,y) = f(x,y)\in Z$, $f\in \{X\to\{Y\to Z\}\}$.
## Reshape

The _reshape_ function $\rho = \rho_{n_0,...,n_{k-1}}\colon\iota
n_0\prod\cdots\prod\iota n_{k-1}\to\iota n_0\cdots n_{k-1}$
is defined by $\rho(i_0, i_1, \ldots, i_{k-1}) = i_0 + n_0(\rho(i_1,
\ldots, n_{k-1}))$.

Every element $x\in X^{\iota n}$ corresponds to a function $x\colon\iota n\to X$.
The composition $x\rho\colon n_0\prod\cdots\prod\iota n_{k-1}\to X$
reshapes $x$.

## Partition

A function $p\colon X\to\iota n$ determines a _partition_ on $X$ where $i\sim i'$ iff $p(i) = p(i')$.

Example: s = "a,bc,def" is a string in $\CC^{\iota 8}$. Using cyclic arrays
$= "," s$ is $\f\t\f\f\t\f\f\f$ so $\add\scan = "," s$ is $0111222$.

Define $\uniq\colon X^n\to X^m$ by $\uniq x_0 x_1 \ldots = x_0 \nu x_2 \ldots$
if $x1 = x0$ and $\uniq x_0 x_1 \ldots = x_0 \nu x_1 \ldots$ if $x_1 \not= x_0$.

## Remarks

Natural numbers $\NN = \{0, 1, \ldots\}$.

$\iota n = \{0, \ldots, n - 1\}$, $n\in\NN$.

$\iota\colon\NN\to\NN^*$ where $\NN^* = \coprod{n\ge0}\NN^n$.  
$\iota n\in\NN^n$.

Every expression is a list of data or functions in Polish notation.

Expressions are parsed right to left.

Data is pushed on the call stack.

Functions know what is on the call stack.

_Each_ is $f␣\scan␣x␣y␣\ldots$ is $f␣x␣f␣y␣\ldots$, $f␣g\scan ␣x$ is $f␣x␣g␣x$.

_Fold_ is $f \fold a␣b \ldots$ is $f␣a␣f␣b␣\ldots))$.

$K$ is the constant function $K\colon X\to\{Y\to X\}$ where $Kxy = x$.

Use $!$ for evaluation. 

_Array_ $X^{\iota n}$, $[␣x_0␣x_1␣\ldots\colon \iota n\to X$ by $i\mapsto x_i$.

_Tuple_ $\sqcap_{i\in I} X_i$, $\langle␣x_0␣x_1␣\ldots\colon I\to\coprod{i\in I}X_i$ by $i\mapsto (i, x_i)$.

## Examples

_Average_ $\div␣\stop␣\add\fold␣\add\fold K 1\scan␣x_0␣x_1␣\ldots$

## Types

A _string_ is a utf-8 string that is a monoid with identity the empty string
and product concatenation. The _characters_ of the string are _code points_.

Generic duality? $Z$ an object, $\hat{}Z$ is a functor $X\mapsto X^Z$ and
$(f\colon X\to Y)\mapsto (X^Z\to Y^Z)$. The functor $Z\,\hat{}$ maps $Y\mapsto Z^Y$
and $g\colon X\to Y\mapsto (Z^Y\to Z^X)$.
