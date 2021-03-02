---
title: Duality
author: Keith A. Lewis
institution: KALX, LLC
email: kal@kalx.net
classoption: fleqn
abstract: Mirror, mirror, ...
...

\newcommand\RR{\bm{R}}
\newcommand\CC{\bm{C}}
\newcommand\FF{\bm{F}}
\newcommand\ker{\operatorname{ker}}
\newcommand\ran{\operatorname{ran}}

Duality shows up in many mathematical guises. One of the simplest is in
the case of vector spaces.

## Vector Space

If $V$ is a vector space over the real numbers $\RR$ then its dual, $V^*$,
is the set of all linear functionals from $V$ to $\RR$. The dual space
is also a vector space with scalar multiplication and vector addition
defined pointwise: $(tv^*)(u) = t(v^*(u))$ and $(v^* + w^*)(u)
= v^*(u) + w^*(u)$, $t\in\RR$, $u\in V$, $v^*,w^*\in V^*$. The _dual
pairing_ is $\langle v,v^*\rangle = v^*(v)$, $v\in V$, $v^*\in V^*$.
Since $v^*\colon V\to\RR$ is a function, if we know $\langle v,
v^*\rangle$ for all $v\in V$ we know $v^*$.

__Exercise__. _If $\langle v,v^*\rangle = 0$ for $v^*\in V^*$ show $v = 0$_.

__Exercise__. _If $\langle v,v^*\rangle = \langle w,v^*\rangle$ for $v^*\in V^*$ show $v = w$_.

If $V$ is finite dimensional then $V^*$ has the same dimension so they are isomorphic as vector spaces.
For any vector space $V$ define $ι_V\colon V\to V^{**}$ by $\langle ι_Vv, v^*\rangle = \langle v, v^*\rangle$.

__Exercise__. _Show $ι_Vv = 0$ if and only if $v = 0$, $v\in V$_.

The proof of this is trivial, unlike the proof that vector spaces of
the same dimension are isomorphic.  That proof involves the Steinitz
replacement theorem and introducing an arbitrary basis for each vector
space.

## Linear Transformation

Linear transformations on vector spaces $T\colon V\to W$ are also a vector
space with scalar multiplication and vector addition defined pointwise.
They have a notion of duality called _adjoint_.  Define $T^*\colon W^*\to
V^*$ by $\langle v, T^*w^*\rangle = \langle Tv, w^*\rangle$, $v\in V$,
$w^*\in W^*$.

__Exercise__. _If $S\colon U\to V$ and $T\colon V\to W$ show $(TS)^* = S^*T^*$_.

__Exercise__. _If $T\colon V\to W$ show $T^{**}ι_V = ι_WT$_.

<details>
<summary>Solution</summary>
For $v\in V$, $w^*\in W^*$,
$\langle T^{**}ι_Vv, w^*\rangle
= \langle ι_Vv, T^*w^*\rangle
= \langle v, T^*w^*\rangle
= \langle Tv, w^*\rangle
= \langle ι_W Tv, w^*\rangle$.
</details>

This is an example of a _natural transformation_ in category theory.

## Integration

Given a function on a finite interval $f\colon [a,b]\to\RR$, $a,b\in\RR$,
and a partition of $[a,b]$, $Δ = (x_0,\ldots,x_n)$ with
$a = x_0 < x_1 < \cdots < x_n = b$ define
$\underline{R}_{[a,b]}f = \sum_{0\le i < n} \underline{f_i}\,Δx_i$
where $\underline{f_i} = \inf_{x_i \le x < x_{i+1}} f(x)$ and $Δx_i = x_{i + 1} - x_i$.
Likewise define $\overline{R}_{[a,b]}f = \sum_{0\le i < n} \overline{f_i}\,Δx_i$ where
$\overline{f_i} = \sup_{x_i \le x < x_{i+1}} f(x)$.

Define $Δ\preceq Δ'$ if every $x_i$ in $Δ$ is equal to some
$x_i'$ in $Δ'$. This ordering is a _net_ so we can consider the limit
in both cases. Riemann showed that if $f$ is continuous on
$[a,b]$ the the lower and upper limits exist and are equal.

If $F\colon [a,b]\to\RR$ is any non-decreasing function a similar
argument goes through for sums of the for $\sum_{0\le i < n}
f(x_i^*)\,(F(x_{i+1}) - F(x_i))$, where $x_i^*\in [x_i, x_{i+1}]$,
which leads to Riemann-Stieljes integation. For example,
if $F(x) = 1_{[c,\infty)}$ is the Heavyside function it can be shown $\int_a^b f(x)\,dF(x) = f(a)$
when $a < c < b$.

__Exercise__. _Prove this_.

_Hint_: Only one term of $\sum f(x^*)\,ΔF(x)$ is non-zero.

There are also _improper integrals_ that can be defined if $a = -\infty$
or $b = +\infty$ if limits exist.  If $f$ tends to infinity at either endpoint then the
limits over $[a + ε,b]$ and $[a, b - ε]$ may exist as $ε\to 0$.  If $f$
has a countable number of jumps it is also possible to fix things up.

Things become even more complicated when trying find conditions when limits can be exchanged:
$\lim_{n\to\infty}\int_a^b f_n(x)\,dx = \int_a^b \lim_{n\to\infty} f_n(x)\,dx$.

Lebesgue cleaned up this mess by noticing the continuous functons on the interval $[a,b]$,
$C[a,b]$, is a vector space and $f\mapsto \int_a^b f(x)\,dx$ is a linear functional.
This led him to the notion of _set functions_ called _measures_ that greatly
extend the concept of integration.

### Bounded Functions

Let $Ω$ be _any_ set and define the bounded functions $B(Ω) = \{f\colon Ω\to\RR:\sup_Ω |f| < \infty\}$.
Given a linear functional $L\in B(Ω)^*$ and any subset $E\subseteq Ω$ define
$λ(E) = L(1_E)$, where $1_E(ω) = 1$ if $ω\in E$ and $1_E(ω) = 0$ if $ω\not\in E$.
If $E$ and $F$ are disjoint subsets of $Ω$ then $1_{E\cup F} = 1_E + 1_F$ so
$λ(E\cup F) = λ(E) + λ(F)$.

__Exercise__. _Show $λ(E\cup F) = λ(E) + λ(F) - λ(E\cap F)$ for any $E,F\subseteq Ω$_.

While $f$ is a function on $Ω$, $λ$ is a function on subsets of $Ω$ that satifies
$λ(E\cup F) = λ(E) + λ(F) - λ(E\cap F)$ for any $E,F\subseteq Ω$. Such functions
are called measures. Measures don't count things twice.
We also need $λ(\emptyset) = 0$, the measure of nothing is zero.

__Exercise__. _If $λ(E\cup F) = λ(E) + λ(F) - λ(E\cap F)$, $E,F\subseteq Ω$, then
$μ = λ + a$ also satisfies this condition_.

_Hint_. The "measure" $μ + a$ is $(μ + a)(E) = μ(E) + a$.
