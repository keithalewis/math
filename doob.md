---
title: Doob Upcrossing Lemma
author: Keith A. Lewis
email: kal@kalx.net
---
\newcommand\bs[1]{\boldsymbol{{#1}}}
\newcommand\RR{\bs{R}}
\newcommand\NN{\bs{N}}
\newcommand\BB{\bs{B}}
\newcommand\PP{\mathcal{P}}
\newcommand{\it}[2]{#1\langle #2\rangle}
\newcommand{\more}{\varepsilon}

Stop Loss/Start Gain

The SL/SG strategy is to hold one share when the underlying crosses a lower bound
and sell it when it crosses an upper bound. We develop a theory and notation where
this can be expressed using $(X > a)'(X < b)$.

## Notation

We use standard mathematical notation with an eye toward computer implemenetation.
Given symbols $f$ and $x$ how do we indicate when we want the result of applying the
function $f\colon X\to Y$ to the value $x\in X$?

Right to left parsing with parentheses for grouping. 

If $f$ is a function from set $X$ to set $Y$
then $f(x)$, $x\in X$, is the corresponding element in $Y$

Evaluation $e\colon Y^X \times X\to Y$.

An _iterable_ $\iota\in\it{I}{T}$ over value type $T$ is defined by three primitives:
$\ast$ (dereference), $+$ (increment), and $\more$ (more) where $\ast\colon\it{I}{T}\to T$,
$+\colon\it{I}{T}\to \it{I}{T}$,
and $\more\colon\it{I}{T}\to\BB$, the set of boolean values, indicating more values are available
to dereference. If $\more\iota$ is false then $\ast\iota$ and $+\iota$ are undefined.

Iterables benefit from _lazy evaluation_. 
Explicit dereference and increment cause computation.

Many languages implement this under varying guises.
In C# iterables $\it{I}{T}$ are an interface `IEnumerator<T>` requiring methods
`T Current() { get; }` to dereference and `bool MoveNext()` that
combines increment and indicates whether more values are available.

...More examples...

One representation of an iterable on a computer is by an array ${\iota = (t_1,\ldots, t_n)}$
where ${\ast\iota = t_1}$, ${+\iota = (t_2,\ldots,t_n)}$, and $\more\iota$
is $n\not=0$. Iterables are more flexible than arrays.
They can be computed
on-the-fly taking only fixed memory and can also be potentially unbounded.
Let $()$ be the iterable with $\more()$ always false.

The iterable primitives allow a large number of algorithms to be defined.

The _count_ of an iterable is $\#\iota = 1 + \#+\iota$ if $\more\iota$
and 0 otherwise.

If $n\in\NN$ is a non-negative integer and $\iota\in\it{I}{T}$
define "$n$ take $\iota$" by $n\uparrow \iota$ is $\iota$ if $n = 0$
and $(n - 1)\uparrow +\iota$ if $n > 0$.
Note $n\uparrow() = ()$ if $n = 0$, and is undefined for $n > 0$.

__Exercise__. _Show $(\#\iota)\uparrow\iota = ()$_.

If $P$ is a predicate on $T$ define "$\iota$ where $P$" by
$\ast(\iota|P) = \ast\iota$ if $P(\ast\iota)$ and $\ast(+U|P)$ otherwise.
This filters an iterable based on the predicate.

```
*where(i, p) => return p(*i) ? *i : *where(+i, p);
+where(i, p) => while (!p(*+i)); return where(i, p);
```

If $\iota_0,\iota_1\in\it{I}{T}$ define the concatenation $\iota_0,\iota_1$ by
$\ast(\iota_0,\iota_1) = *\iota_0$ if $\more \iota_0$ otherwise $\ast \iota_1$.
Define $+(\iota_0,\iota_1) = +\iota_0,\iota_1$ if $\more \iota_0$ otherwise $+\iota_1$.
Define $\more (\iota_0,\iota_1)$ to be $\more \iota_0$ or $\more \iota_1$.

Define the cyclical comma operator by $\iota, = \iota$ if $\more\iota$
and $(), = \iota$.

__Exercise__. _Show $\iota,\iota, = \iota,$ for $\iota\in\it{I}{T}$_.

Given $\iota_0\in\it{I}{T_0}$ and $\iota_1\in\it{I}{T_1}$ define their _zip_
$\iota_0 ," \iota_1$ by $*(\iota_0 ," \iota_1)$ to be the pair $(*\iota_0, *\iota_1)$,
$+(\iota_0 ," \iota_1) = (+\iota_0),"(+\iota_1)$, and
$\more(\iota_0 ," \iota_1)$ to be $\more\iota_0$ and $\more\iota_1$.

### Disjoin Union

The _disjoint union_ of $T_i\subseteq T$ is
$\sqcup_{i\in I} T_i = \cup_{i\in I} \{i\}\times T_i$.
This has injections $\nu_i\colon T_i\to \sqcup_i T_i$ where
$\nu_i(t) = (i, t)$.

__Exercise__. _Given $q_i\colon T_i\to U$, $i\in I$,
show there exists $q\colon \sqcup_{j\in I}\to U$ with
$q\nu_i = q_i$, $i\in I$_.

_Hint_: Define $q((i, t)) = q_i(t)$ for $t\in T_i$.

### Cartesian Product

If $T_i\subseteq T$ are indexed by $i\in I$ define the _cartesian product_
$\prod_{i\in I} T_i = \{(t_i)_{i\in I}\in I\mid t_i\in T_i\}$.
It has projections $\pi_i\colon \prod_{j\in I} T_j\to T_i$ defined by
$\pi_i((t_j)_{j\in I}) = t_i$.

__Exercise__. _Given $p_i\colon U\to T_i$, $i\in I$,
show there exists $p\colon U\to\prod_i T_i$ with
$\pi_ip = p_i$, $i\in I$_.

_Hint_: Define $p(u) = (p_i(u))_{i\in I}$ for $u\in U$.
If $I$ is totally ordered define $(i,t)<(j,u)$ to be $i < j$
or $i = j$ and $t < u$. This defines a total order on
the disjoint union in terms of the total orders on $I$ and $T$.

## Totally Ordered

If $T$ is a totally ordered finite set and $U\subseteq T$ we can make
$U$ an iterable by defining $\ast U = \min\{u\mid u\in U\}$,
$+U = U\setminus\{\ast U\}$, and
$\more U$ to be $U\not=\emptyset$

Note $\sqcup_i T_i\subseteq\sqcup_i T$ so the iterable primatives can be applied.
The primatives also come in indexed version.

Define $\ast_i\colon\sqcup_{j\in I} T_j$ by $\ast_i = \ast T_i$.

Define $+_i = \sqcup +T_i \sqcup_{j\not= k} T_i$.

Define $\more_i\colon \sqcup_{j\in I}T_j = \more T_i$.

If $(X_t)_{t\in T}$ is a timeseries on $\Omega$

Consider $I\times\cup_{i\in I} T_i$.
Define $\ast(i, t) = \ast T_i$.
If $\ast(i,t) < \ast(j,t)$ for all $j\not=i$ define ...


Define $\ast_i\colon \sqcup_{j\in I} T_j\to T_i$ by $\ast_i(t) = \ast T_i$.

Concatenate in increasing order. (Zig)

$U \subseteq \sqcup_i U_i$.

If $(M_t)$ is a (sub)martingale then the number of up crossings of the interval $[a,b]$
then $(b - a)N_{a,b}(t) \le E[\max\{M_t - a, 0\}] - \max\{M_0 - a, 0\}$.
