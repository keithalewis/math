---
title: APL
author: Keith A. Lewis
institute: KALX, LLC
classoption: fleqn
fleqn: true
abstract: A Programming Language
...


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
\newcommand{\f}{f}
\newcommand{\t}{t}

\newcommand{\dom}{\operatorname{dom}}
\newcommand{\ran}{\operatorname{ran}}
\newcommand{\ker}{\operatorname{ker}}

Let's give names to things.

## Primitive Types

The _primitive types_ are
booleans $\BB$,
integers $\ZZ$,
non-negative integers $\ZZ$,
real numbers $\RR$, 
and characters $\CC$.
We have $\BB\subseteq\NN\subseteq\ZZ\subseteq\RR$ as rings.
We assume $u\colon\CC\to\NN$ is an encoding of the set of characters. (E.g., UTF-8 codepoints)

Primitive types are classified by mathematical objects: set, monoid, group, ring, field:
boolean (field),
integer (commutative ring),
natural number (monoid),
real number (field),
character (set).

## Types

If $X$, $X_i$ are types

_array_ $x = [x_1,\ldots,x_n]\in X^n\cong n\to X$, $x[i] = x_i$.

_tuple_ $x = \langle x_1,\ldots,x_n\rangle\in\prod X_{i\in\NN}$, $n\to(\prod X_i\to X_i)$,
$n\mapsto π_i$, 
$x\langle i\rangle = π_i(x) = x_i$.

_union_ $x = \{\ldots,x_i,\ldots\} = \langle i,x_i\rangle\in\coprod_{i\in n} X_i$, $n\to(X_i\to\coprod X_i)$,
$n\mapsto ν_i$, $x\{i\} = ν_i(x) = \langle i,x_i\rangle$.

_sequence_ $x = (x,\ldots) \in X^* = \coprod_{n\in\NN} X^n$. 
$*(x,\ldots) = x$, $+(x,\ldots) = (\ldots)$, $?(x,\ldots) = \t$, $?() = \f$,
$x\in\dom *$ iff $?x$.

_exponential_ $f\in Y^X = \{f\colon X\to Y\}$ is the set of all functions from $X$ to $Y$.
We also write $X\to Y$ for $Y^X$.

_relation_ $R\subseteq X\times Y$. Write $xRy$ for $\langle x,y\rangle\in R$
and $R' = \{\langle y, x\rangle \st xRy\}\subseteq Y\times X$ for its _transpose_.
The _domain_ of $R$ is $\dom R = π_X(R)\subseteq X$ and
the _range_ is $\ran R = π_Y(R)\subseteq Y$.
The _right coset_ $xR = \{y\in Y \st xRy\}\subseteq Y$ for $x\in X$,
the _left coset_ $Ry = \{x\in X \st xRy\}\subseteq X$ for $y\in Y$.
The right cosets $\{xR \st x\in X\}$
parition $\ran R$ and the left cosets $\{Ry \st y\in Y\}$ partition $\dom R$.

The _graph_ of a function $f\in Y^X$ is
$\{\langle x,y\rangle \st f(x) = y\}\subseteq X\times Y$. A relation $R$ is a function if the
_right coset_ $xR$ is a singleton for all $x\in X$ and we
write $R(x)$ for that unique element.


## Operations

The _evaluation function_ $ε_Y^X = ε\colon (X\to Y)\times X\to Y$
is $ε(f,x) = f(x)\in Y$, $f\in Y^X$, $x\in X$.

### Curry

The _curry function_ $γ\colon ((X\times Y)\to Z)\to (X\to(Y\to Z))$ is
$(γ(f)(x))(y) = f(x,y)\in Z$, $f\in X\times Y\to Z$, $x\in X$, $y\in Y$.

The _uncurry function_ $γ^*\colon ((X\to (Y\to Z))\to (X\times Y\to Z)$
is $(γ^*(f))(x,y) = f(x,y)\in Z$, $f\in X\to(Y\to Z)$, $x\in X$, $y\in Y$.

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

_boolean_ $\BB$.

_integer_ $\ZZ$.

_unsigned_ $\NN$.

_number_ $\RR$.

_character_ $\CC$ utf-8 _code points_.

## Structures
shape $ρ\colon\NN^k\to (\NN^{k-1}\to\NN)$, $ρ\mapsto(n \mapsto n)$,
$ρ(n,\ldots)\mapsto ((i,\ldots) \mapsto i + n ρ(\ldots)(\ldots))$

monoid folds $\star\colon X\times X\to X$

left fold $(\star\colon X^n\to X$, $(\star(x_0,\ldots,x_n) = x_0\star(x_1\dots x_n)$

right fold $)\star\colon X^n\to X$, $)\star(x_0,\ldots,x_n) = (x_0\dots x_{n-1})\star x_n$


Storage: stack (life of function), heap (life of process), persistent (across processes), lazy generators.
