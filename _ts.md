---
title: Time Series
author: Keith A. Lewis
institute: KALX, LLC
classoption: fleqn
fleqn: true
abstract: The algebra of time series
...

\newcommand\u[1]{\underline{#1}}
\newcommand\o[1]{\overline{#1}}
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
\newcommand{\once}{\operatorname{once}}
\newcommand{\upto}{\operatorname{upto}}
\newcommand{\RR}{\bm{R}}
\newcommand{\NN}{\bm{N}}
\newcommand{\ZZ}{\bm{Z}}
\newcommand{\Bool}{\bm{B}}

## Discrete Time Series

We consider time series $X_n$ indexed by the integers $n\in\ZZ$ or non-negative integers $n\in\NN$.
Each $X_n$ is a random variable. Two random variables $X$ and $Y$ have the same _law_ if
they have the same cumulative distribution function $P(X\le x) = P(Y\le x)$ for all $x\in\RR$.
Two time series have the same law if they have the same finite joint distributions
$P(X_{n_1}\le x_1, \ldots, X_{n_k} \le x_k) = P(Y_{n_1}\le x_1, \ldots, Y_{n_k}\le x_k)$
for all $n_1,\ldots,n_k\in\NN$ and $x_1,\ldots,x_k\in\RR$.

_White noise_ is a time series where the $X_n$ are independent and have the same law.
In this case $P(X_{n_1}\le x_1, \ldots, X_{n_k}\le x_k) = P(X_{n_1}\le x_1) \cdots P(X_{n_k}\le x_k)$
by independence.

__Exercise__. _If $X_n$ and $Y_n$ are white noise then they have the same law if and only
if $X_0$ and $Y_0$ have the same law_.

_Hint_: This also holds if $X_k$ and $Y_k$ have the same law for some $k$.

This greatly simplifies the parameterization of the time series.

A time series is _stationary_ if $(X_n)_n$ and $(X_{n + k})_n$ have
the same law for all $k$. White noise is stationary.

A time series $X_n$ is _autoregessive_ (AR) of order $p$
if $X_n = W_n + \sum_{k=1}^p a_j X_{n-j}$ where
$W_n$ is white noise. For example, _random walk_ $X_n = W_n + \cdots + W_1$
is autoregressive or order 1 since $X_n = W_n + X_{n-1}$, so

A time series $X_n$ is a _moving average_ (MA) of order $q$
if $X_n = W_n + \sum_{j=1}^q b_j W_{n-j}$ where
$W_n$ is white noise and $b_j\in\RR$.


# Time Series

This note provides a mathematical definition of _time series_ and
fundamental operations on them.
A _time series_ is a collection of _time_-_value_
pairs $s = \{(t, x)\}\subseteq T\times X$.
We require $T$ to be totally ordered[^1], but $X$ can be any set.
We assume no two time-value pairs share the same time
so writing $x = s(t)\in X$ when $(t,x)\in s$ is unambiguous.

[^1]: An order is _total_ if it is
_comparable_ (either $t\le u$ or $u\le t$ for $t,u\in T$),
_antisymmetric_ ($t\le u$ and $u\le t$ imply $t = u$),
and _transitive_ ($t\le u$ and $u\le v$ imply $t\le v$).
All _orders_ are transitive.

__Exercise__. _Show comparable and antisymmetric imply the ordering is
reflexive_ ($t\le t$, $t\in T)$.


## Time

Time is modeled by a set $T$ with a total order $\le$. Since total
orders are reflexive and antisymmetric, $t = u$ is equivalent to $t \le u$ and $u \le t$.
Define $t < u$ by $t \le u$ and $t \not= u$. Likewise for
other standard relations.

Every non-empty finite total order $T$ has least element
$\u{T} = \min\{t: t\in T\}$ called the _current_ element.
Removing this element from $T$ gives the _next_ order $T' = T\setminus\{\u{T}\}$.
Non-empty orders are called _live_.

__Exercise__. _Show $\u{T} < t'$ for $t'\in T'$ and $T = \{\u{T}\}\cup T'$_.

By induction, every finite total order can be written
$T = \{t_j\}_{0\le j\le n}$ where
$t_j = \u{T^{(j)}}$ is the current element of the $j$-th next order.
Clearly $t_i < t_j$ if $i < j$.
If the total
order is countable and has a lower bound then $t_0 = \min\{t:t\in T\}$
exists and we get an increasing sequence $T = \{t_j\}_{j\ge 0}$.

Define functions `curr`, `next`, and `live` on
the discrete total order $T$ by
$$
\begin{aligned}
\curr(T) &= \min\{t:t\in T\} \in T \\ 
\next(T) &= T\setminus \{\curr(T)\} \subseteq T \\
\live(T)&\Leftrightarrow T\not=\emptyset \\
\end{aligned}
$$
where backslash denotes set difference $A\setminus B = \{a\in A:a\not\in B\}$.
If $T$ is not live then it has no current item.

Every total order can be extended by adding a _bottom_ element $α$
and $ω$ a _top_ element not in $T$
where $α < t$ and $t < ω$ for all $t\in T$.
The set $(t, u] = \{v\in T:t<v,v\le u\}$, $t,u\in T\cup\{α, ω\}$,
is an _interval_. The left or right end points are excluded when
using parentheses and included when using square brackets. The
bottom and top element are never included and are used for _half open_
intervals. For example, $[t, ω) = \{u\ge t:u\in T\}$.

Total orders are closed under union and intersection.

__Exercise__. _Show the union of subsets of a total order is total_.

__Exercise__. _Show the intersection subets of a total orders is a total_.

## Series

A _time series_ is a function on a discrete total order. As we have seen
above, this corresponds to a function $n\to X$ where $n = \{j\in\NN:j < n\}$
is a (strict) _initial segment_ of the extended natural numbers $\NN\cup\{\infty\}$.

Define `curr` on time series by $\curr s = (\curr(T), s(\curr(T)))$,
or $\u{s} = (\u{T}, s(\u{T}))$.
Define `next` on time series by $\next(s) = s|_{\next T}$,
or $s' = s|_{T'}$. We can define `live` by $\live(s) = \live(\dom s)$
where $\dom s = \{t_j:(t_j, x_j)\in x\}$.

It is not uncommon for some values of a time series to be _missing_.
This is modeled by adjoining and element '`_`' to $X$ not belonging to $X$. 
For computer implementations where $X$ is a set of IEEE floating point
values we can use NaN (Not-a-Number) for '`_`'.

It is often convenient to extend a time series to all of $T$. Given a
time series $s = \{(t_j, x_j)\}$ define $\u{t} = \max\{t_j:t_j\le t\}$
to be the largest time in the series less than or equal to $t$
and let $\u{s}(t) = s(\u{t})$. Note $\u{s}$ is piecewise constant
and right continuous. It is undefined for $t < t_0 = \u{\dom s}$.

__Exercise__. _Show $\u{s}(t) = s(\u{t})$, $t\ge\u{\dom s}$_.

Given a function $x\colon T\to X$ let $x_T = \u{x|_T}$

## Apply

If $f\colon X\to Y$ we can _apply_ $f$ to $s\colon T\to X$ via
$f(s) = \{(t,f(x)):(t,x)\in s\}\subseteq T\times Y$ to get a $Y$-valued time series.
If we define $f(\_) = \_$ this defines application for partial time series.
We write $sf$ instead of $f(s)$ using postfix notation which gives a
more natural left-to-right reading. Note $sf$ has the same domain as $s$.

## Combine

We can combine time series to create a new time series.

### Product

If $\{X_i\}$ is a collection of sets indexed by $i$, their _product_ $X = Π_i X_i$ has
projections $π_i\colon X\to X_i$ and we write $x = \langle \pi_i x\rangle
= \langle x_i\rangle$ for $x\in X$.  The projections are defined by the
property that if $p_i\colon Y\to X_i$ then there exists $p\colon Y\to X$
with $π_i(p(y)) = p_i(y)$, $y\in Y$, for all $i$.  If $p$ is _bijective_
(one-to-one and onto) then $π_i = p^{-1}p_i$ so projections are unique
up to isomorphism.

If $s_i\colon T_i\to X_i$ are time series indexed by $i$, then their _product_
is a time series $\langle s_i\rangle\colon\cup_i T_i\to Π_i X_i$ with elements
$(t, x)$ where $(t, π_i x)\in s_i$ for some $i$. If $(t, x_k)\not\in s_k$
for any $k\not= i$ we let $x_k = \_$.
For example if $s_1 = \{(1,x),(2,y)\}$ and $s_2 = \{(0,z),(1,w)\}$
then $\langle s_1, s_2\rangle = \{(0,\langle \_,z\rangle), (1,\langle x,w\rangle),
(2,\langle y,\_\rangle)\}$.

An item $(t,\langle x_i\rangle)$ is _missing_ if $x_i = \_$ for all $i$
and _partially missing_ if $x_i \not= \_$ for some $i$.

__Exercise__. _The product $\langle s_i\rangle$ never has missing items_.

### Coproduct

If $\{X_i\}$ is a collection of sets indexed by $i$, their _coroduct_ $X = \coprod_i X_i
= \cup_i X_i\times\{i\}$ has injections $ν_i\colon X_i\to X$ defined
by $ν_i x_i = (x_i,i)$ for $x\in X$.  The injections are defined by
the property that if $n_i\colon X_i\to Y$ then there exists $n\colon
X\to Y$ with $n(ν_i(x_i)) = ν_i(\x_i)$, $x_i\in X_i$, for all $i$.
If $n$ is _bijective_ then $ν_i = n_in^{-1}$ so injections are unique
up to isomorphism.

The coproduct is also called the _disjoint union_. It is the union of $\{X_i\}$
together with information about which index each element came from.

__Exercise__. _Show $π_1\coprod_i X_i = \cup_i X_i$ where
$π_1$ is the projection on the first component of the coproduct_.

If $s_i\colon T_i\to X_i$ are time series indexed by $i\in I$
and $σ\colon T\to I$ selects an index at each time
define $s_σ(t) = \{(t_j, (x_{σ(t_j)}, σ(t_j))$.

then their _coproduct_
is a time series with elements $(t_j, x_j)$ 
$(t, ν_i x_i)$ where $(t, x_i)\in s_j$ for some $j$.

$(t, π_j x)\in s_j$ for some $j$. If $(t, x_k)\not\in s_k$
for any $k\not= j$ we let $x_k = \_$.
For example if $s_1 = \{(1,x),(2,y)\}$ and $s_2 = \{(0,z),(1,w)\}$
then $\langle s_1, s_2\rangle = \{(0,\langle \_,z\rangle), (1,\langle x,w\rangle),
(2,\langle y,\_\rangle)\}$.

If the domains of $\{s_j\}$ are disjoint we can identify
the coproduct $\coprod_j s_j$ with the union $\cup_j s_j$.
In practice, we can apply arbitrarily small perturbation to each time
in the collection of time series to obtain this.
If the $j$ are ordered we can also ensure the jitter preserves the order.

## Transform

The set of time series from $T$ to $X$ is denoted $X^T$[^2]. 
A _time series transformation_ is a function $F\colon X^T\to Y^U$
where $T$ and $U$ are totally ordered sets and $X$ and  $Y$ are any sets.
For example, applying $f\colon X\to Y$ is a transformation from $X^T$ to $Y^T$
and `next` is a transformation from $X^T$ to $X^{T'}$.

__Exercise__. _Show $(f(s))(t) = f(s(t))$, $t\in T$_.

[^2]: It is standard mathematical notation to define the _exponential_ of
sets by $A^B = \{f\colon B\to A\}$, the set of all functions from $B$ to $A$.
Note if the cardinality of $A$ is $a$ and the cardinality of $B$ is $b$ then
the cardinality of $A^B$ is $a^b$.

### When

Given a predicate $p\subseteq T\times X$ define
$s\when(p) = s\cap p$. It filters out all points in
the time series not belonging to $p$.

This is also written $s|p$ and read $s$ given $p$.

### Upto

Given a predicate $p\subseteq T\times X$ let $(t_0, x_0) = *(s\cap p)$ be
the first item in the series satisfying $p$.
Define $s\upto(p) = s|_{(-ω, t_0]}$ to be all items in the series
upto and including time $t_0$.

This is also written $s\uparrow p$ and read $s$ until $p$ or $s$ take $p$.

### Skip

The transformation $\skip(n)$ for $n\ge 0$ is $\next$ applied $n$ times. 
We use $\skip(t)$ for $t\in T$ to indicate `next` is called until the time of
the current item is greater than or equal to $t$.

__Exercise__. _Show $\skip(t) = \when([t, ω)\times X)$_.

This is also written $s\downarrow n$ or $s\downarrow t$ and read $s$ drop $n$ or $s$ after $t$
respectively.

### Scan

If $T$ is a total order and $t\in T$ let $[t] = (-ω, t] = \{u\in T: u \le t\}$ be
the initial segment determinted by $t$. The set of all initial segments
is denoted $[T]$ and is isomorphic to $T$ via $[t]\leftrightarrow t$.

The history of a time series gets dragged along by _scan_.
The `scan` of $s\colon T\to X$ has items $([t],s|_{[t]})$. Each
item can be written $(\langle t_0,\ldots, t_n\rangle, \langle x_0,\ldots,x_n\rangle)$
where $(t_j, x_j) \in s$.

Most _trading indicators_ are transformations of scans. For example if
$MA((\langle t_j\rangle, \langle x_j\rangle)) = \sum_j x_j/\sum_j 1$
we get the _moving average_ $[s]MA$. It is common to weight values
by their duration to get the _weighted moving average_ with $WMA([s])
= \sum_j x_j Δt_j/\sum_j Δt_j$ where $Δt_j = t_{j + 1} - t_j$,
or $Δt = t' - t$. Here we assume there is a positive measure $τ$ on
$T$ and define $u - t = τ((t, u]) = τ([u]) - τ([t])$ for $t, u\in T$.
If $T$ is a subset of real numbers then the measure is typically length measure.

To bias towards the most recent values choose a 
decreasing function $\alpha(t)$ and let
$EWMA_α([s]) = \sum_{j < n} α(t_n - t_j) x_j Δ t_j/\sum_j Δ t_j$.
If $α(t) = e^{-at}$ we get the _exponentially weighted moving average_
with decay parameter $a > 0$.

To get _windowed_ data of size/count $m$ let $C(\langle t_j\rangle ,\langle x_j\rangle)
= (\langle t_{n - m + 1}, \ldots, t_n\rangle, \langle x_{n - m + 1}, \ldots, x_n\rangle)$.
To get windowed data of width $w$ let $W([s]) = s|_{(t - w, t]}$ where
$(t, u] = [u]\setminus [t]$ for $t < u$ in $T$. Transformations can be composed
so, for example, $(s W)MA$ is a _windowed moving average_.

### Step

Coproducts of time series have a function called 'step'. If the current item has
index $j$ then 'step' is the 
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

### Opening Range Breakout

A _range breakout_ is a signal defined by a time period $p = [t_0, t_1]$ and
a return $r$. If $(x(t_1) - x(t_0))/x(t_0) > r$ we say a breakout occured at $t_1$.

### Stop Loss/Start Gain

Buy at open if less than previous weeks close.
Sell at close if greater than buy.
Always sell and end of week close if long.
