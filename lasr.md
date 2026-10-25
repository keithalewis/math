---
title: Linear Algebra Speedrun
author: Keith A. Lewis
institution: KALX, LLC
email: kal@kalx.net
classoption: fleqn
abstract: Quickest route through Linear Algebra
...

\newcommand\RR{\boldsymbol{R}}
\newcommand\ZZ{\boldsymbol{Z}}
\newcommand\CC{\boldsymbol{C}}
\newcommand\FF{\boldsymbol{F}}
\newcommand\zero{\boldsymbol{0}}
\newcommand\ran{\operatorname{ran}}
\newcommand\Var{\operatorname{Var}}
\newcommand\Cov{\operatorname{Cov}}
\newcommand\co{\operatorname{co}}
\newcommand\sgn{\operatorname{sgn}}
\newcommand\Alg{\operatorname{Alg}}
\newcommand\cone{\operatorname{cone}}
\newcommand\BB{\mathcal{B}}
\newcommand\GG{\mathcal{G}}
\newcommand\PP{\mathcal{P}}

We assume you know about vector space scalar multiplication, vector addition,
and the laws they satisfy. The scalars must be a _field_ such as the
_real numbers_ $\RR$ or _complex numbers_ $\CC$.
Another example is $\ZZ_p = \ZZ/p\ZZ$ of integers modulo a prime $p$.
We will use $\FF$ to denote a generic field of scalars.

## Linear Operator

A _linear operator_ is a function $T\colon V\to W$ between two vector spaces
that preserves the vector space structure: $T(ax + y) = a(Tx) + Ty$ for scalar $a\in\FF$
and vectors $x,y\in V$. Note the scalar multiplication and vector addition
an the left-hand side are those for $V$ and
on the right-hand side are those for $W$.

We write $\zero_V$ for the zero of vector addition in $V$: $\zero_V + v = v = v + \zero_V$.

__Exercise__: _Show $v + v = v$ implies $v = \zero_V$_.

_Hint_: Add $-v$ to both sides.

<details><summary>Solution</summary>
If $v + v = v$ then
$$
\begin{aligned}
(v + v) - v &= v - v \\
v + (v - v) &= v - v \\
v + \zero &= \zero \\
v &= \zero \\
\end{aligned}
$$
</details>

__Exercise__: _Show $T\zero_V = \zero_W$_.

_Hint_: $T(\zero + \zero) = T\zero$.

__Exercise__: _Show $T(x + y) = Tx + Ty$_.

_Hint_: Use $1x = x$.

__Exercise__: _Show $T(ax) = a(Tx)$_.

_Hint_: Use $T(\zero_V) = \zero_W$.

## Subspace

A _subspace_ of a vector space $V$ is a subset $U\subseteq V$ that is closed under scalar multiplication
and vector addition. We can write this as ${\FF U \subseteq U}$ and ${U + U\subseteq U}$
where ${\FF U = \{au\mid a\in\FF, u\in U\}}$ and ${U + U = \{u + u'\mid u,u'\in U\}}$.

### Quotient

The _quotient_ of a vector space $V$ by a subspace $U$ is ${V/U = \{v + U\mid v\in V\}}$.

__Exercise__: _Show $v + U = v' + U$ if and only if $v - v'\in U$_.

_Hint_: Note $w\in v + U$ if and only if $w = v + u$ for some $u\in U$
and $w\in v' + U$ if and only if $w = v' + u'$ for some $u'\in U$.
This shows $\zero = w - w = v - v' + (u - u')$.

...

The quotient space is also a vector space
with scalar multiplication $a(v + U) = av + U$ for $a\in\RR$, $v\in V$, and vector addition
$(v + U) + (v' + U) = (v + v') + U$ for $v, v'\in V$.

__Exercise__. _Show these are_ well-defined.

_Hint_: Show $v + U = v' + U$ implies $av + U = av' + U$ and

...

## Structure

The _kernel_ of a linear operator $T\colon V\to W$ is ${\ker T = \{v\in V\mid Tv = \zero\}\subseteq V}$ and the
_range_ is ${\ran T = \{Tv\mid v\in V\}\subseteq W}$.

__Exercise__ _Show $\ker T$ is a subspace of $V$ and $\ran T$ is a subspace of $W$_.

The first fundamental fact about the structure of a linear operator ${T\colon V\to W}$ is there are linear operators
${V \to V/\ker T \to \ran T \to W}$. The first linear operator is onto/surjective, the second linear operator
is one-to-one and onto/bijective and the third linear operater is one-to-one/injective.

The second operator demystifies the various pseudo inverse notions people still stuck in the
Gilbert Strang row and column vector tediousness suffer through.
Every linear operator from ${V/\ker T\to\ran T}$ is invertible.

__Exercise__ _Show $V\to V/\ker V$ where $v\mapsto v + \ker T$ is onto_.

__Exercise__ _Show $V/\ker T\to\ran T$ where $v + \ker T\mapsto Tv$ is well-defined, onto, and one-to-one_.

_Hint_. It is well-defined if $v + \ker T = v' + \ker T$ implies $Tv = Tv'$.
It is clearly onto. Show if $Tv = Tv'$ then $v + \ker T = v' + \ker T$ using the
previous exercises.

__Exercise__. _Show $\ran T\to W$ where $Tv\to Tv$ is one-to-one_.

_Hint_. Duh!

If $S\colon U\to V$ and $T\colon V\to W$ are linear operators we say they are _exact_
if $\ran S = \ker T$, $S$ is injective, and $T$ is surjective. 

## Eigenvectors
