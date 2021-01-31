---
title: Time Series
author: Keith A. Lewis
institute: KALX, LLC
classoption: fleqn
fleqn: true
abstract: The algebra of time series
...

\newcommand{\prod}{\Pi}
\newcommand{\coprod}{\amalg}
\newcommand{\Var}{\operatorname{Var}}
\newcommand{\dom}{\operatorname{dom}}
\newcommand{\curr}{\operatorname{curr}}
\newcommand{\next}{\operatorname{next}}
\newcommand{\live}{\operatorname{live}}
\newcommand{\step}{\operatorname{step}}
\newcommand{\skip}{\operatorname{skip}}
\newcommand{\trim}{\operatorname{trim}}
\newcommand{\when}{\operatorname{when}}
\newcommand{\RR}{\bm{R}}
\newcommand{\NN}{\bm{N}}
\newcommand{\Bool}{\bm{B}}

## Time Series

A _time series_ is (mathematically) a collection of _time_-_value_
pairs $s = \{(t, x)\}\subseteq T\times X$.
We require $T$ to be totally ordered[^1], but $X$ can be any set.
For now we assume no two time-value pairs have the same time
so the value $x = s(t)\in X$ when $(t,x)\in s$ is a function of $T$.

[^1]: An order is _total_ if it is
_comparable_ (either $t\le u$ or $u\le t$ for $t,u\in T$),
_antisymmetric_ ($t\le u$ and $u\le t$ imply $t = u$),
and _transitive_ ($t\le u$ and $u\le v$ imply $t\le v$).
All _orders_ are transitive.
__Exercise__. _Show the first two properties imply the ordering is
reflexive_ ($t\le t$, $t\in T)$.

Every total order on a finite set has a least element $t_0 = \min\{t:
t\in T\}$. It also has a second least element $t_1 = \min\{t: t\in T,
t \not= t_0\}$. By induction, very finite total order can be written
$T = \{t_j\}_{0\le j\le n}$ where $t_i < t_j$ if $i < j$.  If the total
order is countable and has a lower bound then $t_0 = \min\{t:t\in T\}$
exists and we get an increasing sequence $T = \{t_j\}_{j\ge 0}$.

Thinking operationally, we define three functions for any _discrete_
(finite or countable) total order.
The minimum element is called the _current_ item. Removing
the current item results in the set of _next_ elements. An order is _live_
if it is not empty. We define functions `curr`, `next`, and `live` on
the order $T$ by
$$
\begin{aligned}
\curr(T) &= \min\{t:t\in T\} \\ 
\next(T) &= T\setminus \{\curr(T)\} \\
\live(T)&\Leftrightarrow T\not=\emptyset \\
\end{aligned}
$$
where backslash indicates set difference $A\setminus B = \{a\in A:a\not\in B\}$.
By definition, $T = \curr(T)\cup\next(T)$. If $T$ is not live then
it has no current item. If we let $\bot$ represent an element not in $T$
we can make the partial function `curr` into a function by defining
$\curr(\emptyset) = \bot$. We extend $T$ to a total order on $T\cup\{\bot\}$
by $\bot < t$ for $t\in T$. Similarly, we let $\top$ represent an element
not in $T$ with $t < \top$ for $t\in T$.

Total orders are closed under union and intersection.

__Exercise__. _Show the union of subsets of a total order is total_.

__Exercise__. _Show the intersection subets of a total orders is a total_.

We use the shorthand notation $T' = \next(T)$ and $*T = \curr(T)$ so,
in particular, $T = \{*T\}\cup T'$.

A _time series_ is a function on a discrete total order. As we have seen
above, this corresponds to a function $n\to X$ where $n = \{j\in\NN:j < n\}$
is a (strict) _initial segment_ of the extended natural numbers $\NN\cup\{\top\}$.
In this case $\top$ is usually written $\infty$. 

It is not uncommon for some items of a time series to be _missing_.
We model this by adjoining $\bot$ to $X$ where $\bot$ is some element
not belonging to $X$.  A _partial time series_ is a function $s\colon
T\to X\cup\{\bot\}$ and uses $s(t) = \bot$ to indicate missing items.
For computer implementations where $X$ is a set of IEEE floating point
values we can use NaN (Not-a-Number) for $\bot$.

## Function

Let's recall some fundamental definitions concerning functions.

If $s\colon T\to X$ is a function (time series) and $U\subseteq T$ define
the _restriction_ of $s$ to $U$ by
$s|_U = \{(t,x):(t,x)\in s, t\in U\}$.

__Exercise__. _Show $s|_U = s\cap(U\times X)$_.

We can define `curr` on time series by $\curr s = (\curr(T), s(\curr(T)))$,
or $*s = (*T, s(*T))$.
We can define `next` on time series by $\next(s) = s|_{\next T}$,
or $s' = s|_{T'}$. We can define `live` by $\live(s) = \live(T)$.

Recall a _partial function_ $s\colon T\to X$ is a subset $s\subseteq T\times X$
such that $(t,x)\in s$ and $(t,x')\in s$ imply $x = x'$. This justifies
writing $s(t) = x$ for $(t,x)\in s$.

To extend a partial function $s\colon T\to X$ to a function
select $\bot\not\in T$
and define $s|^T(t) = s(t)$ if $t$ is in the domain of $s$ and
$s(t) = \bot$ otherwise.

__Exercise__. _Show $s|^T = s\cup (T\setminus\dom s)\times\{\bot\}$_.

Hint: The _domain_ of $s$, $\dom s$, is the set of $t\in T$ for which
$(t,x)\in x$ for some $x\in X$.

This is precisely what we did above for partial time series but it can
be used even if $T$ is just a set. Only God can trim time but a partial
time series taking values in $X\cup\{\bot\}$ can be _trimmed_ to a time
series taking values in $X$ by removing all $(t,x)\in s$ with $x=\bot$.

__Exercise__. _Show $\trim(s) = s\cap T\times X$_.

If $\trim(s) = s$ we say the time series is _complete_.

## Apply

If $f\colon X\to Y$ we can _apply_ $f$ to $s\colon T\to X$ via
$f(s) = \{(t,f(x)):(t,x)\in s\}\subseteq T\times Y$ to get a $Y$-valued time series.
If we define $f(\bot) = \bot$ this defines application for partial time series.
We write $sf$ instead of $f(s)$ using postfix notation which gives a
more natural left-to-right reading. Note $sf$ has the same domain as $s$.

## Combine

We can combine time series to create a new time series.

### Product

If $\{X_j\}$ is a collection of sets, their _product_ $X = Π_j X_j$ has
projections $π_j\colon X\to X_j$ and we write $x = \langle \pi_j x\rangle
= \langle x_j\rangle$ for $x\in X$.  The projections are defined by the
property that if $p_j\colon Y\to X_j$ then there exists $p\colon Y\to X$
with $π_j(p(y)) = p_j(y)$, $y\in Y$, for all $j$.  If $p$ is _bijective_
(one-to-on and onto) then $π_j = p^{-1}p_j$ so projections are unique
up to isomorphism.

If $\{s_j\}$ is a collection of time series, then their _product_
is $\langle s_j\rangle = \cup_j \{(t,\langle x_j\rangle): (t,x_j)\in s_j\}$
is a time series from $T = \cup_j T_jto $\Pi_j X_j$.
We use the convention $x_k = \bot$ if $(t,x_j)\in s_j$ for
some $j$ but $(t,x_k)\not\in s_k$ to make the product a function.
For example if $s_1 = \{(1,x),(2,y)\}$ and $s_2 = \{(0,z),(1,w)\}$
then $s_1\times s_2 = \{(0,(\bot,z)), (1,(x,w)), (2,(y,\bot))\}$.

An item $(t,\langle x_j\rangle)$ is _missing_ if $x_j = \bot$ for all $j$
and _partially missing_ if $x_j \not= \bot$ for some $j$.

__Exercise__. _If $s_j$ is complete for some $j$ then $\langle s_j\rangle$ has
no missing items_.

### Coproduct

If $\{X_j\}$ is a collection of sets, their _coroduct_ $X = \coprod X_j
= \cup_j X_j\times\{j\}$ has injections $ν_j\colon X_j\to X$ defined
by $ν_j x_j = (x_j,j)$ for $x\in X$.  The injections are defined by
the property that if $n_j\colon X_j\to Y$ then there exists $n\colon
X\to Y$ with $n(ν_j(x_j)) = ν_j(\x_j)$, $x_j\in X_j$, for all $j$.
If $n$ is _bijective_ then $ν_j = n_jn^{-1}$ so injections are unique
up to isomorphism.

The coproduct is also called the _disjoint union_. It is the union of $\{X_j\}$
together with information about which index each element came from.

__Exercise__. _Show $π_1\coprod_j X_j = \cup_j X_j$ where
$π_1$ is the projection on the first component of the coproduct_.

If the domains of $\{s_j\}$ are disjoint we can identify
the coproduct $\coprod_j s_j$ with the union $\cup_j s_j$.
In practice, we can apply arbitrarily small perturbation to each time
in the collection of time series to obtain this.
If the $j$ are ordered we can also ensure the jitter preserves the order.

## Transform

Let $\mathcal{S}_T$ be the collection of all time series on $T$.

A _time series transformation_ is a function $F\colon \mathcal{S}_T\to \mathcal{S}_T$
where $T$ is a fixed totally ordered set.
For example, apply is a transformation that preserves times
and `next` is a transformation that does not add any new values.

### When

Given a predicate $p\subseteq T\times X$ define
$\when(p) = s\cap p$. It filters out all points in
the time series not belonging to $p$.

__Exercise__. _Show $\next(s) = \when((T\times X)\setminus\{\curr(s)\})$_.

More succinctly, $s' = s\cap(\{*s\}^c)$ where $A^c$ denotes complement.

### Skip

The transformation $\skip(n)$ for $n\ge 0$ is `next` applied $n$ times. 
We use $\skip(t)$ for $t\in T$ to indicate `next` is called until the time of
the current item is greater than or equal to $t$.

__Exercise__. _Show $\next(\skip(t))$ is the first item in the series
with time strictly greater than $t$_.

__Exercise__. _Show $\skip(t) = \when([t,\top)\times X)$_.

Perhaps `until` or `filter` are better names for `when`.

### Scan

The history of a time series gets dragged along by _scan_.
If $T$ is a total order and $t\in T$ let $[t] = \{u\in T: u \le t\}$ be
the initial segment determinded by $t$. The set of initial segments
is denoted $[T]$ and is isomorphic to $T$ via $t\leftrightarrow [t]$.
The `scan` of $s\colon T\to X$ is denoted $[s]$ and has items $([t],s|_{[t]})$. Each
item can be written $(\langle t_0,\ldots, t_n\rangle, \langle s(t_0),\ldots,s(t_n)\rangle)$.

Most _trading indicators_ are transformations of scans. For example if
$MA((\langle t_j\rangle, \langle x_j\rangle)) = \sum_j x_j/\sum_j 1$
we get the _moving average_ $[s]MA$. It is common to weight values
by their duration to get the _weighted moving average_ with $WMA([s])
= \sum_j x_j Δt_j/\sum_j Δt_j$ where $Δt_j = t_{j + 1} - t_j$,
or $Δt = t' - t$. Here we assume there is a positive measure $τ$ on
$T$ and define $u - t = τ((t, u]) = τ([u]) - τ([t])$ for $t, u\in T$.
If $T$ is a subset of real numbers then $τ$ is typically length measure.

To bias towards the most recent values choose a 
decreasing function $\alpha(t)$ and let
$EWMA_α([s]) = \sum_{j < n} α(t_n - t_j) x_j Δ t_j/\sum_j Δ t_j$.
If $α(t) = e^{-at}$ we get the _exponentially weighted moving average_
with decay parameter $a > 0$.

To get _windowed_ data of size/count $c$ let $C(\langle t_j\rangle ,\langle x_j\rangle)
= (\langle t_{n - c + 1}, \ldots, t_n\rangle, \langle x_{n - c + 1}, \ldots, x_n\rangle)$.
To get windowed data of width $w$ let $W([s]) = s|_{(t - w, t]}$ where
$(t, u] = [u]\setminus [t]$ for $t < u$ in $T$. Transformation can be composed
so, for example, $(s W)MA$ would e a _windowed moving average_.

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

## Examples

A _range breakout_ is a signal defined by a time period $p = [t_0, t_1]$ and
a return $R$. If $(s(t_1) - s(t_0)/s(t_0) > R$ we say a breakout occured at $t_1$.
We also need a signal to terminate the strategy. If we always close out positions at
the end of the trading day the strategy is $β_{p,R}^1_C$.

It may be more efficient to compute transformations by keeping a small
amount of state.  For example, if $A([s])$ is the
moving average then the windowed moving average of size $c$ can store
the value $x_{n - c}$ and the last average $a_{n - 1}$ to get the next
value of the average by $a_n = a_{n-1} + (x_n - x_{n - c})/c$
since $c a_n = (c - 1) a_{n-1} + x_n - x_{n - c}$.
This suggests storing time series expression as _abstract syntax trees_ so
such optimizations become possible.
