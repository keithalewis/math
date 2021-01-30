---
title: Time Series
author: Keith A. Lewis
institute: KALX, LLC
classoption: fleqn
fleqn: true
abstract: The algebra of time series
...

\newcommand{\Var}{\operatorname{Var}}
\newcommand{\dom}{\operatorname{dom}}
\newcommand{\curr}{\operatorname{curr}}
\newcommand{\next}{\operatorname{next}}
\newcommand{\live}{\operatorname{live}}
\newcommand{\step}{\operatorname{step}}
\newcommand{\skip}{\operatorname{skip}}
\newcommand{\when}{\operatorname{when}}
\newcommand{\RR}{𝑹}
\newcommand{\Bool}{\bm{B}}

## Time Series

A _time series_ is (mathematically) a collection of _time_-_value_
pairs $s = \{(t, x)\}\subseteq T\times X$.
We require $T$ to be totally ordered and has a smallest element $0\in T$,
but $X$ can be any set.
For now we assume no two time-value pairs have the same time
so the graph of $s$ is a function.

For a time series to be traversed in time order we need three
operations: `curr`, `next`, and `live`.
The _current_ item of a time series is the pair having the smallest
time value under the $T$ ordering,
$(t_0,x_0)\in s$ where $t_0 = \min\{t:(t,x)\in s\}$.
The _next_ operation removes the current time-value pair from the series.
Repeated calls to `next`
will eventually result in the empty set if the time series is finite.
The operation $\live(s)$ tests for this.
The current item of an timeseries that is not live is undefined
and `next` returns the empty set.

The mathematical model of all time series $S$ has operations
$$
\begin{aligned}
\curr(s) = (t_0,x_0)&\Leftrightarrow t_0\le t, (t,x)\in s \\
\next(s) &= s\setminus \{\curr(s)\} \\
\live(s)&\Leftrightarrow s\not=\emptyset \\
\end{aligned}
$$
where backslash indicates set difference $A\setminus B = \{a\in A:a\not\in B\}$.

By definition, if $\curr(s) = (t, x)$ and $\curr(\next(s)) = (t', x')$
then $t < t'$.

__Exercise__. _Show the intersection of time series is a time series_.

__Exercise__. _Show the union of time series having dijoint times
is a times series_.

__Exercise__. _Show $s = \{\curr(s)\} \cup \next(s)$ for any time series $s$_.

## Function

If $s\colon T\to X$ is a time series and $U\subseteq T$ define
the _restriction_ of $s$ to $U$ by
$s|_U = \{(t,x):(t,x)\in s, t\in U\}$.

__Exercise__. _Show $s|_U = s\cap(U\times X)$_.

__Exercise__. _Show $\next(s) = s\cap(T\times X)\setminus\curr(s)$_.

Recall a _partial function_ $f\colon X\to Y$ is a subset of $X\times Y$
such that $(x,y)\in f$ and $(x,y')\in f$ imply $y = y'$. This justifies
writing $f(x) = y$ for $(x,y)\in f$.
To extend a partial function $f\colon X\to Y$ to a function
select $\bot\not\in Y$
and define $f|^X(x) = f(x)$ if $x$ is in the domain of $f$ and
$\bot$ otherwise. The same technique can be used to extend a
partial function to any superset of its domain.

__Exercise__. _Show $f|^Z = f\cup (Z\setminus\dom f)\times\{\bot\}$ for any $Z\supseteq\dom f$_.

Hint: The _domain_ of $f$, $\dom f$, is the set of $x\in X$ for which
$(x,y)\in f$ for some $y\in Y$.

In what follows we allow for partial time series by adjoining the element $\{\bot\}$ to 
the set of values $X$. Items of the form $(t,\bot)$ and called _missing_.
We will assume all time series are partial and drop the adjective.

If $f\colon X\to Y$ we can _apply_ $f$ to $s$ via
$f(s) = \{(t,f(x)):(t,x)\in s\}\subseteq T\times Y$ to get a $Y$-valued time series.
If we define $f(\bot) = \bot$ we can apply functions to partial time series.
We write $sf$ instead of $f(s)$ using postfix notation which gives a
more natural left-to-right reading.

## Combine

We can combine time series to create a new time series.
If $s_1,\ldots,s_n$ are time series then their _product_
is $s_1\times\cdots s_n = \{(t,(x_1,\ldots,x_n)): (t,x_j)\in s_j\}$
is a time series from $T_1\cup\cdots T_n$ to $X_1\times\cdots X_n$.
We use the convention $x_k = \bot$ if $(t,x_j)\in s_j$ for
some $j$ but $(t,x_k)\not\in s_k$.
For example if $s_1 = \{(1,x),(2,y)\}$ and $s_2 = \{(0,z),(1,w)\}$
then $s_1\times s_2 = \{(0,(\bot,z)), (1,(x,w)), (2,(y,\bot))\}$.

The _time series sum_ is $s_1 \cup \cdots \cup s_n$ if the series
times are disjoint. [What if not? What if $X_j$ not disjoint?]

## Transform

A _time series transformation_ is a function $F\colon S\to S$.
For example, apply is a transformation that preserves times
and `next` is a transformation that preserves values.
We use prime for $s' = \next(s)$ as shorthand.

### When

Given a predicate $u\subseteq T\times X$ define
$\when(u) = s\cap u$. It filters out all points in
the time series not belonging to $u$.

__Exercise__. _Show $\next(s) = \when((T\times X)\setminus\{\curr(s)\})$_.

### Skip

The transformation $\skip(n)$ for $n\ge 0$ is $\next$ applied $n$ times. 
We use $\skip(t)$ for $t\in T$ to indicate `next` is called until the time of
the current item is greater than or equal to $t$.

__Exercise__. _Show $\next(\skip(t))$ is the first item in the series
with time strictly greater than $t$_.

__Exercise__. _Show $\skip(t) = \when([t,\omega)\times X)$_.

Perhaps a better name for `when` is `until`.

### Step

Given time series $s_j$ in $T_j\times X_j$, $j = 1,\ldots n$,
Let $X = \sqcup X_j$ be the disjoint union of values. The elements of $X$ are pairs
$(x, j)$ where $x\in X_j$. Unlike set union, the disjoint union keeps track of which
set in the union the elements come from. The disjoint union is defined by
the _inclusions_ $ν_j\colon X_j\to X$ where $x_j\mapsto (x_j, j)$.

Define $s = \step(s_1,\ldots,s_n) = \{(t_j, ν_j(x_j)):(t_j, x_j)\in s_j\}\subseteq\cup_j T_j\times \sqcup_j X_j$.
Both `curr` and `live` are defined as for any time series.
If $\curr(s) = (t,(x,j))$ and $\curr(s') = (u,(y,k))$ where $s'$ is the usual `next` then
$\next(s) = s'$ if $k != j + 1$ and $\next(s) = skip(u)$ if $k = j + 1$.

