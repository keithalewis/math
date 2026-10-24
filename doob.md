---
title: Doob Upcrossing Lemma
author: Keith A. Lewis
email: kal@kalx.net
classoption: fleqn
fleqn: true
---
\newcommand\bs[1]{\boldsymbol{{#1}}}
\newcommand\RR{\bs{R}}
\newcommand\NN{\bs{N}}
\newcommand\BB{\bs{B}}
\newcommand\PP{\mathcal{P}}
\newcommand{\more}{\varepsilon}

Joe Doob's upcrossing Lemma [@Doo1953] for a martingale $(M_t)$
states the number of upcrossings of the interval $[a,b]$ over $[0,t]$
times $(b - a)$ is less than ${E[\max\{M_t - a, 0\}] - \max\{M_0 - a, 0\}}$.
It is just a lemma because Doob needed it to prove
martingale convergence theorems -- generalizations to stochastic
processes of the fact bounded, monotone sequences converge.

His proof has a simple financial interpretation:
the number of upcrossings can be used to find an option premium,
its value minus the intrinsic, using historical data.
This is mentioned in mathematical finance literature but
there does not seem to be any detailed analysis.
This short note begins to rectifying that.

Suppose a money-market account $R_t$ is available for
hedging and $S_t$ is the price of a stock at time $t$.
To hedge a call option with strike $K$ and expiration $T$
you need to find a self-financing trading strategy that pays
$\max\{S_T - K,0\}$ at time $T$.

For now, lets assume zero interest rates so $R_t = 1$, $S_0 < K$,
and the stock pays no dividends.
A naive approach is to borrow $K$ and buy one share of stock when it
hits level $K$. If the stock remains above $K$ until
expiration $T$ then sell the stock for $S_T$, use that
to pay back the $K$ you borrowed, and the remaining $S_T - K$ to cover
the option obligation
If the stock goes back down to level $K$ then sell it
at $K$ to preserve self-financing. Rinse and repeat.

__Exercise__. _If $S_0 > K$ immediately buy one share. 
Show the P&L is $\max\{S_T - K,0\} - \max\{S_0 - K,0\}$_. 

_Hint_: $S_T - S_0 = S_T - K - (S_0 - K)$.

Note this is true for every stock trajectory and does not
involve probability.

When I showed this argument to Peter Carr he laughed and
said, "That can't be right!" It isn't.
He eventually turned this into the paper [@CarMah2010].
If you try to implement this strategy you will find out that local time
is a mathematical fiction.

In reality stocks trade at integer multiples of their minimum tick size.
To hedge a call option with strike $K$
and expiration $T$ specify possible levels $a < K$ and $b > K$,
buy one share when $S_t > b$, then sell it when $S_t < a$.
If limit orders exist they can be used to execute at exact levels
with no slippage.
What is not clear is how small $b - a$ can be and still
result in a practical hedging strategy.

Define trading times
$$
\begin{aligned}
\tau_0 &= \inf\{t > 0\mid S_t > b\} \\
\tau_1 &= \inf\{t > \tau_1\mid S_t < a\} \\
&\cdots \\
\tau_{2n} &= \inf\{t > \tau_{2n-1}\mid S_t > b\} \\
\tau_{2n+1} &= \inf\{t > \tau_{2n}\mid S_t < a\} \\
\end{aligned}
$$
for $n > 0$.
The trading strategy is to buy 1 share at $\tau_{2n}$
and sell it at $\tau_{2n+1}$.

For simplicity assume $a = K$.
Assuming $S_0 < b$ this results in cash flows $-b$ at $\tau_0$,
$K$ at $\tau_1$, $\ldots$, that alternate until expiration $T$.
We pay $b - K$ at each down crossing.
This costs $(b - a)N_T(a,b)$ where
$N_t(a,b) = \sum_j 1(\tau_j \le t)$, the number of _crossings_
of $[a,b]$ at time $t$.


<!--
Joe used the lemma to prove the martingale convergence theorem.


Stop Loss/Start Gain

Suppose an underlying has price $(S_t)$ at time $t$.
To hedge a call option with strike $K$ and expiration $T$ choose $a \le b$
with $a \le K\le b$.
The general idea is to hold 1 share when $S_t > b$ and 0 shares
when $S_t < a$. If $a = b = K$ this would provide a perfect hedge for the call option,
however this strategy cannot be implemented in practice.
The minimum value of $b - a$ must be a positive integral value of
the tick size of the underlying.

Buy $\max\{S_0 - b, 0\}$ shares at time 0.
Hold one share when $S_t > b$ and zero shares when $S_t < a$.
If $S_T > b$ sell 1 share and cover the option obligation for a
cash flow of $S_T - b - (S_T - K) = K - b$.
If $S_T < a$ then your position is zero and the call payoff is zero.
If $a \le S_T \le b$ 

The SL/SG strategy is to hold one share when the underlying crosses a lower bound
and sell it when it crosses an upper bound. We develop a theory and notation where
this can be expressed using $(X > a)'(X < b)$.

## Notation

We use standard mathematical notation with an eye toward computer implementation.
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
-->
