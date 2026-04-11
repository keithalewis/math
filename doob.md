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
\newcommand{\more}{\more}

An _iterable_ $\iota\in\it{I}{T}$ over type $T$ is define by three primitives:
$\ast$ (dereference), $+$ (increment), and $\more$ (more) where $\ast\colon\it{I}{T}\to T$,
$+\colon\it{I}{T}\to \it{I}{T}$,
and $\more\colon\it{I}{T}\to\BB$, the set of boolean values, indicating more values are available.

Many languages implement this under varying guises.
In C# iterables $\it{I}{T}$ are called `IEnumerator<T>` and require methods
`T Current() { get; }` to dereference and `bool MoveNext()` that
combines increment and more.

...More examples...

An iterable can be represented on a computer by an array ${\iota = (t_1,\ldots, t_n)}$
where ${\ast\iota = t_1}$, ${+\iota = (t_2,\ldots,t_n)}$, and $\more\iota$
is $n\not=0$. Iterables are more flexible than arrays.
They can be computed
on-the-fly taking only fixed memory and can also be potentially unbounded.

The iterable primitives allow a large number of algorithms to be defined.

Let $()$ be the iterable with $\more()$ always false.

If $n\in\NN$ is a non-negative integer and $\iota\in\it{I}{T}$
define "$n$ take $\iota$" by $n\uparrow \iota$ is $\iota$ if $n = 0$
and $(n - 1)\uparrow +\iota$ if $n > 0$.
Note while $n\uparrow() = ()$ if $n = 0$, it is undefined for $n > 0$.

Iterables benefit from _lazy evaluation_. The take operation creates
a new iterable. Explicit dereference and increment cause actual
computation.

If $P$ is a predicate on $T$ define "$\iota$ where $P$" by
$\ast(\iota|P) = \ast\iota$ if $P(\ast\iota)$ and $\ast(+U|P)$ otherwise.
This filters an iterable based on the predicate.

Define the cyclical comma operator by $\iot, = \ito$ if $\more\iota$
and $\emptyset, = \iota$.

If $U,V\subseteq T$ define the concatenation $U,V$ by
$\ast(U,V) = *U$ if $\more U$ otherwise $\ast V$.
Define $+(U,V) = +U,V$ if $\more U$ otherwise $+V$.
Define $\more (U,V)$ to be $\more U$ or $\more V$.

__Exercise__. _Show $U,U, = U,$ for $U\subsetequ T$_.


Let $T$ be a totally ordered finite set.

For $U\subseteq T$ define $\ast U = \min\{u\mid u\in U\}$ to be
the minimum element of $U$ so $\ast\colon\PP(T)\to T$.

For $U\subseteq T$ define $+U = U\setminus\{\ast U\}$ to be
the set with its least element dropped so $+\colon\PP(T)\to\PP(T)$.

For $U\subseteq T$ define $\more U$ to be $U\not=\emptyset$
If $\more U$ is false then $\ast U$ and $+U$ are undefined.

If $T_i\subseteq T$ are indexed by $i\in I$ define the _cartesian product_
$\prod_{i\in I} T_i = \{(t_i)_{i\in I}\in I\mid t_i\in T_i\}$.
It has projections $\pi_i\colon \prod_{j\in I} T_j\to T_i$ defined by
$\pi_i((t_j)_{j\in I}) = t_i$.

__Exercise__. _Given $p_i\colon U\to T_i$, $i\in I$,
show there exists $p\colon U\to\prod_i T_i$ with
$\pi_ip = p_i$, $i\in I$_.

_Hint_: Define $p(u) = (p_i(u))_{i\in I}$ for $u\in U$.

The _disjoint union_ of $T_i\subseteq T$ is
$\sqcup_{i\in I} T_i = \cup_{i\in I} \{i\}\times T_i$.
This has injections $\nu_i\colon T_i\to \sqcup_i T_i$ where
$\nu_i(t) = (i, t)$.

__Exercise__. _Given $q_i\colon T_i\to U$, $i\in I$,
show there exists $q\colon \sqcup_{j\in I}\to U$ with
$q\nu_i = q_i$, $i\in I$_.

_Hint_: Define $q((i, t)) = q_i(t)$ for $t\in T_i$.

If $I$ is totally ordered define $(i,t)<(j,u)$ to be $i < j$
or $i = j$ and $t < u$. This defines a total order on
the disjoint union in terms of the total orders on $I$ and $T$.

Note $\sqcup_i T_i\subseteq\sqcup_i T$ so the iterable primatives can be applied.
The primatives also come in indexed version.

Define $\ast_i\colon\sqcup_{j\in I} T_j$ by $\ast_i = \ast T_i$.

Define $+_i

T_j\to\sqcup_j T$ by
$+_i(i,times T_i) = \{i\}\times +T_k$ and
$+_i(\{j\}\times T_) = \{i\}\times +T_k$ and

Define $?_i\colon \sqcup_{j\in I}T_j = ?T_i$.

If $(X_t)_{t\in T}$ is a timeseries on $\Omega$


Define $\ast_i\colon \sqcup_{j\in I} T_j\to T_i$ by $\ast_i(t) = \ast T_i$.

Concatenate in increasing order. (Zig)

$U \subseteq \sqcup_i U_i$.

If $(M_t)$ is a martingale then the number of up crossings of the interval $[a,b]$
then $(b - a)N_{a,b}(t) \le E[\max\{M_t - a, 0\}] - \max\{M_0 - a, 0\}$.
