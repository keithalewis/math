---
title: Vector Space
author: Keith A. Lewis
institute: KALX, LLC
classoption: fleqn
fleqn: true
abstract: A mathematical sweet spot
...

\newcommand\FF{\boldsymbol{F}}
\newcommand\CC{\boldsymbol{C}}
\newcommand\RR{\boldsymbol{R}}
\newcommand\NN{\boldsymbol{N}}
\newcommand\LL{\mathcal{L}}
\newcommand{\ran}{\operatorname{ran}}
\renewcommand{\implies}{\Rightarrow}

Everything in math is a set, but things become more interesting for sets
having a "structure". Functions between sets "with structure" that preserve the
structure are _homomorphisms_. A one-to-one and onto homomorphism is an
_isomorphism_. Two sets with structure are _equivalent_ if there is an
isomorphism between them.

A vector space over the real numbers $\RR$ is a set having a scalar multiplication
and a commutative vector addition satisfying a distributive law.
A vector space homomorphism is a _linear transformation_. Two vector spaces are
equivalent if and only if they have the same _dimension_.

The set of all functions from a set $I$ to the real numbers, $\RR^I = \{x\colon I\to\RR\}$
is a vector space over $\RR$.
Scalar multiplication and vector addition are defined pointwise:
${(ax)(i) = ax(i)}$ and ${(x + y)(i) = x(i) + y(i)}$ for ${i\in I}$.
It is customary to write $\RR^n$, $n\in\NN$, for ${I = \{1,\ldots,n\}}$ or
${I = \{0,\ldots,n-1\}}$.

For $x, y, z\in\RR^I$ and $a,b\in\RR$,

__Exercise__. _Show $x + (y + z) = (x + y) + z$_.

__Exercise__. _Show $x + y = y + x$_.

__Exercise__. _Show $\bm{0} + x = x$ where $\bm{0}(i) = 0$ for $i\in I$_.

__Exercise__. _Show $x + (-x) = \bm{0}$ where $(-x)(i) = -x(i)$, for $i\in I$_.

__Exercise__. _Show $a(bx) = (ab)x$_.

__Exercise__. _Show $1x = x$_.

__Exercise__. _Show $a(x + y) = ax + ay$_.

__Exercise__. _Show $(a + b)x = ax + bx$_.

_Hint_: These follow directly from the pointwise definitions and properties of real numbers.

The exercises are the axioms for an abstract vector space with scalar multiplication
$\RR\times V\to V$ where $(a,x)\mapsto ax$ and binary addition $V\times V\to V$
where $(x,y)\mapsto x + y$. We omit the non-trivial result these imply there exists
a set $I$ where $V$ can be identified with $\RR^I$

Proofs involving only the abstract axioms are considered more elegant.

__Exercise__. _Using only the abstract axioms show $v + v = v$ implies $v = 0$, $v\in V$_.

<details>
<summary>Solution</summary>
$$
\begin{aligned}
v + v &= v \\
	&\quad\langle x = y\implies x + z = y + z\rangle\\
(v + v) + (-v) &= v + (-v) \\
	&\quad\langle (x + y) + z = x + (y + z)\rangle\\
v + (v + (-v)) &= v + (-v) \\
	&\quad\langle v + (-v) = 0\rangle\\
v + 0 &= 0 \\
	&\quad\langle v + 0 = v\rangle\\
v &= 0
\end{aligned}
$$
</details>

The _standard basis_ $e_i\in\RR^I$ is defined by $e_i(j) = δ_{ij}$,
where $δ_{ij} = 1$ if $i=j$ and $δ_{ij} = 0$ if $i\not= j$ is the _Kronecker delta_,

__Exercise__. _Show every $v\in\RR^n$ can be written $v=\sum_i v_i e_i$ for some $v_i\in\RR$_.

_Hint_: $v_i = v(i)$.

<details><summary>Solution</summary>
$v_(j) = \sum_i v_i \delta_{ij} = \sum_i v_i e_i(j) = v_j$.
</details>

## Linear Transformation

A _linear transformation_ is a function $T\colon V\to W$, where $V$ and
$W$ are vector spaces that satisfies ${T(av + w) = aTv + Tw}$, $a\in\RR$,
$v,w\in V$. Note that the addition ${av + w}$ occurs in $V$ and
${aTv + Tw}$ occurs in $W$.  The space of all such linear transformations is
denoted $\LL(V,W)$.

__Exercise__. _Show if $T$ is a linear transformation then $T\bm{0} = \bm{0}$_.

__Hint__: Consider $T(\bm{0} + \bm{0})$ and $v + v = v$ implies $v = \bm{0}$.

<details><summary>Solution</summary>
$T(\bm{0} + \bm{0}) = T(\bm{0}) + T(\bm{0})$ and $T(\bm{0} + \bm{0}) = T(\bm{0})$ so $T(\bm{0}) = \bm{0}$.
</details>

__Exercise__. _Show $T(av) = aTv$, $a\in\RR$, $v\in V$_.

<details>
<summary>Solution</summary>
Using $T(av + w) = aTv + Tw$,
$T(av) = T(av + 0) = aTv + T0 = aTv + 0 = aTv$.
</details>

__Exercise__. _Show $T(av + bw) = aTv + bTw$, $a,b\in\RR$, $v,w\in V$_.

<details>
<summary>Solution</summary>
$T(av + bw) = aTv + T(bw) = aTv = bTw$.
</details>

A linear transformation $T\colon V\to W$ is _one-to-one_, or _injective_,
if $Tu = Tv$ implies $u = v$ then $T$

__Exercise__. _Show if $Tv = \bm{0}$ implies $v = \bm{0}$ then $T$ is one-to-one_.

_Hint_. Use linearity.

<details><summary>Solution</summary>
If $Tu = Tv$ then $T(u - v) = \bm{0}$ so $u - v = \bm{0}$ and $u = v$.
</details>

A linear transformation $T\colon V\to W$ is _onto_, or _surjective_,
if for every $w\in W$ there exists $v\in V$ with $Tv = w$.

A linear transformation that is one-to-one and onto, or bijective, is an _isomorphism_.
If $T\colon V\to W$ is an isomorphism then $V$ and $W$ are _isomorphic_, $V\cong W$.

__Exercise__. _Show $V\cong W$ is an equivalence relation_.

_Hint_: This means $V\cong V$, $V\cong W$ implies $W\cong V$, and $V\cong W$, $W\cong U$ implies $V\cong U$.

<details><summary>Solution</summary>
The identity transformation $I\colon V\to V$ defined by $I(v) = v$ shows $V\cong V$.
If $T\colon V\to W$ is an isomorphism then its inverse $T^{-1}\colon W\to V$ shows
$W\cong V$. If $T\colon V\to W$ and $S\colon W\to U$ are isomorphisms then
so is $ST$ and $V\cong U$.
</details>

The space of linear transformations $\LL(V,W)$ is also a vector
space under pointwise scalar multiplication ${(aT)v = a(Tv)}$
pointwise addition ${(T + S)v = Tv + Sv}$, $a\in\RR$, $v,w\in V$.
The space $\LL(\RR^n,\RR^m)$ can be identified with $\RR^{n\times m}$.
If ${T\colon\RR^n\to\RR^m}$ then ${Te_i = \sum_j t_{ij} e_j}$
for some $t_{ij}\in\RR$.

__Exercise__. _If $T\colon\RR^k\to\RR^n$ and $S\colon\RR^n\to\RR^m$ then the composition
$R = ST\colon\RR^k\to\RR^m$. Show $r_{ij} = \sum_k t_{ik} s_{kj}$_.

<details><summary>Solution</summary>
$R(e_i) = ST(e_i)
	= S(\sum_k t_{ik} e_k)
	= \sum_k t_{ik} Se_k
	= \sum_k t_{ik} \sum_j s_{kj} e_j
	= \sum_j \sum_k t_{ik} s_{kj} e_j
	= \sum_j r_{ij} e_j$
</details>

Matrix multiplication is composition of linear transformations.

## Dual

The _dual_ of a vector space is $V^* = \LL(V,\RR)$, the space of _linear functionals_ on $V$.
Define the _dual pairing_ by $\langle v,v^*\rangle = v^*(v)$ for $v\in V$ and $v^*\in V^*$.

If $V = \RR^n$ we can identify $V^*$ with $\RR^n$ using the standard basis.
Define the _dual basis_ $e_j^*\colon\RR^n\to\RR$ by $e_j^*(e_k) = δ_{jk}$.

__Exercise__. _Show every $v\in\RR^n$ can be written $v = \sum_j e_j^*(v) e_j$._

<details><summary>Solution</summary>
If $v = \sum_j v_j e_j$ then $e_i^*(v) = v_i$.
</details>

__Exercise__. _Show every $v^*\in(\RR^n)^*$ can be written $v^* = \sum_j v^*(e_j) e_j^*$._

<details><summary>Solution</summary>
If $v^* = \sum_j v_j e_j^*$ then $e_i^*(v) = v_i$.
</details>

If $V$ has _any_ basis $e_j$ then every $v\in V$ can be written $v = \sum v_j e_j$ for some $v_j\in\RR$. 
Define the _dual basis_ $e_j^*\colon V\to\RR\in V^*$ by $e_j^*(v) = v_j$. 
The map $V\to V^*$ by $v = \sum_j v_j e_j\mapsto \sum v_j e_j^* = v^*$
is one-to-one and onto (an _isomorphism_).

Functions are vectors. They can be added and scalar multiplication satisfies the distributed law.
Integration is a linear functional on a space of functions.
Given a set $\Omega$ let $B(\Omega) = \{f\colon\Omega\to\RR : \|f\| = \sup_{\omega\in\Omega}|f(\omega)| < \infty\}$.

If $L\colon B(\Omega)\to\RR$ is a linear functional define $λ(E) = L(1_E)$ for $E\subseteq\Omega$.

__Exercise__. _If $E,F\subseteq\Omega$ are disjoint the $1_{E\cup F} = 1_E + 1_F$_.

This shows $λ(E\cup F) = λ(E) + λ(F)$ if $E\cap F=\emptyset$.
Since $1_\emptyset = 0$ we have $λ(\emptyset) = 0$ so
$λ$ is a (finitely additive) measure.

Given a finitely additive measure $λ$ on subsets of $\Omega$ define a linear functional
$L\colon B(\Omega)\to\RR$ by $L(\sum_i a_i 1_{E_i}) = \sum_i a_i λ(E_i)$.

__Exercise__. _Show this is well-defined_.

_Hint_: $\sum_i a_i 1_{A_i} = \sum_j b_j 1_{B_j}$ where $(B_j)$ are pairwise disjoint.
Note $1_A + 1_B = 1_{A\setminus B} + 1_{A\cap B} + 1_{B\setminus A}$ is a sum of
pairwise disjoint sets.

__Exercise__. _Given $f\in B(Ω)$ and $ε > 0$ show there exist a finite number of $a_i\in\RR$
and $A_i\subseteq Ω$ with $\|f - \sum_i a_i 1_{A_i}\| < ε$_.

This shows the linear functional can be extended to $B(\Omega)$
and $B(\Omega)^*$ is isomorphic to the space of finitely additive measures on $\Omega$, $ba(\Omega)$.

If $\Omega$ has a sufficiently rich topology (e.g., compact and Hausdorff) then
$C(\Omega)^*$ can be identfied with the space of countably additive Borel measures on $\Omega$, $M(\Omega)$.
If $\mu\in M(\Omega)$ define $L^p(\mu) = \{f\colon\Omega\to\RR : \int_\Omega |f|^p\,d\mu < \infty\}$.
It is true that $L^p(\mu)^*\cong L^q(\mu)$ where $1/p + 1/q = 1$ and $p > 1$.
It is not true that $L^\infty(\mu)^* \cong L^1(\mu)$ in general.
Proving these claims is non-trivial.


## Span





A _linear combination_ of vectors $v_j\in V$ is a sum $\sum_j a_j v_j$ where
$a_j\in\RR$. The _span_ of $\{v_j\}$ is the set of all linear combinations.

__Exercise__. _Show the span is a vector space_.

_Hint_. Show if $u$ is in the span then $au$ is also in the span for $a\in\RR$
and if $v$ and $w$ are in the span then $v + w$ is also in the span.

<details><summary>Solution</summary>
If $u = \sum_j a_j v_j$ then ${au = \sum_j a(a_j v_j) = \sum_j (aa_j)v_j}$ is in the span.
If ${v = \sum_j b_j v_j}$ and ${w = \sum_j c_j v_j}$ then
${v + w = \sum_j (b_j + c_j) v_j}$ is in the span.
</details>

## Subspace

A subset $U\subseteq V$ of a vector space $V$ is a _subspace_ if $U$ is also a vector space.

__Exercise__. _Let $U$ be a subset of $V$. If $\RR U\subseteq U$ and $U + U\subseteq U$ then
$U$ is a subspace of $V$_.

_Hint_. $\RR U = \{au\mid a\in\RR, u\in U\}$ and $U + U = \{v + w\mid v\in U, w\in U\}$.
Show if $u\in U$ then $au\in U$
and if $v,w\in U$ then $v + w\in U$.

<details><summary>Solution</summary>
If $u\in U$ and $a\in\RR$ then $au\in\RR U\subseteq U$.
If $v\in U$ and $w\in U$ then $v + w\in U + U\subseteq U$.
</details>

__Exercise__. _Show the intersection of two subspaces is a subspace_.

_Hint_. Show if $v$ is in the intersection then $av$ is also in the intersection for $a\in\RR$
and if $u$ and $w$ are in the intersection then $u + w$ is also in the intersection.

<details><summary>Solution</summary>
If $v\in U\cap V$ then $au\in U$ and $av\in V$ so $au\in U\cap V$.
If $u,w\in U\cap V$ then $u + w\in U$ and $u + w\in V$ so $u + w\in U\cap V$.
</details>

__Exercise__. _Show the sum of two subspaces is a subspace_.

_Hint_. The sum of subspaces $U, W\subseteq V$ is $U + W = \{u + w\mid u\in U, w\in W\}$.

## Independent

A set of vectors $\{v_j\}$ are _independent_ if
$\sum a_j v_j = 0$ implies $a_j = 0$ for all $j$.

__Exercise__. _If $\{v_j\}$ are not independent then
$v_i = \sum_{j\not= i} a_j v_j$ for some $i$_.

_Hint_: If $\sum a_j v_j = 0$ and $a_i\not= 0$ for some $i$ then
$a_i v_i = -\sum_{j\not=i} a_j v_j$.

<details><summary>Solution</summary>
$v_i = -\sum_{j\not=i} a_j/a_i v_j$.
</details>

## Basis

A collection of vectors $(v_i)_{i\in I}$, $v_i\in V$, is a _basis_ of $V$ if
they are independent and span $V$. Since they span $V$ every
vector $v\in V$ can be written $v = \sum_{i\in I} a_i v_i$.

__Exercise__. _If $\sum_i a_i v_i = \sum_i b_i v_i$ then $a_i = b_i$ for all $i\in I$_.

_Hint_: $0 = \sum_i (a_i - b_i) v_i$.

<details><summary>Solution</summary>
$\sum_i a_i v_i - \sum_i b_i v_i = \sum_i (a_i - b_i)v_i = 0$ so $a_i - b_i = 0$ for $i\in I$.
</details>

This shows how to identify any vector space $V$ with $\RR^I$ given a basis $(v_i)_{i\in I}$.

The _dimension_ of a vector space is the number of elements of a basis.
A vector space has many collections of vectors that are a basis but
every basis has the same number of vectors. This is not trivial to prove.
Vector spaces occupy a sweet spot in the menagerie of mathematical objects.
They are determined up to _isomorphism_ by their dimension.

## Heisenberg

Werner Heisenberg rediscovered matrix multiplication by considering
orbital levels of the hydrogen atom. If $e_{ij}$ represents a jump
from level $i$ to level $j$, he posited
$e_{ij}e_{kl} = e_{il}$ if $j = k$ and equals $e_{ij}e_{kl} = 0$ if $j\not= k$. [@cite Hei]
An electron can jump from $i$ to $j$, then $j$ to $l$, but not
from $i$ to $j$, then $k$ to $l$ if $k\not= j$.

__Exercise__. _If $S = \sum_{i,j}s_{ij}e_{ij}$ and $T = \sum_{k,l} t_{kl}e_{kl}$ show
$TS = \sum_{i,j} (\sum_k t_{ik} s_{kj}) e_{ij}$_.

<details><summary>Solution</summary>
$$
\begin{aligned}
TS &= (\sum_{kl} t_{kl}e_{kl})(\sum_{ij}s_{ij}e_{ij}) \\
&= \sum_{ij} \sum_{kl} s_{ij} t_{kl} e_{ij}e_{kl} \\
&= \sum_{ij} \sum_{kl} s_{ij} t_{kl} e_{il}\delta_{jk} \\
&= \sum_{ij} \sum_k s_{ik} t_{kl} e_{il} \\
\end{aligned}
$$
</details>

The _kernel_ of a linear transformation $T\colon V\to W$ is
$\ker T = \{v\in V\mid Tv = 0\}\subseteq V$.

__Exercise__. _The kernel of a linear transformation is a subspace_.

_Hint_: $T(av + w) = aTv + Tw = 0$ for $a\in\RR$, $v,w\in \ker T$.

__Exercise__. _$T$ is one-to-one if and only if $\ker T = \{0\}$_.

_Hint_: Consider $T(v - v')$.

The _range_ of a linear transformation $T\colon V\to W$ is
$\ran T = \{Tv\mid v\in V\}\subseteq W$.

__Exercise__. _The range of a linear transformation is a subspace_.

_Hint_: $aTv + Tw = T(av + w)\in\ran T$.

If $\ran T = W$ then $T$ is _onto_, or _surjective_.

Every linear transformation $T\colon V\to W$ factors through the quotient space $V/\ker T$.
Define $π\colon V\to V/\ker T$ by $πv = v + \ker T$.

__Exercise__. _Show $π$ is a surjective linear transformation_.

Define $ν\colon V/\ker T\to\ran T$ by $ν(v + \ker T) = Tv$.

__Exercise__. _Show $ν$ is a well-defined injective linear transformation_.

_Hint_: Start by showing it is well-defined; if $v + \ker T = v' + \ker T$ then $Tv = Tv'$, $v,v'\in V$.

<details>
<summary>Solution</summary>
Since $v + \ker T = v' + \ker T$ if and only if $v - v'\in\ker T$ we have
$T(v - v') = 0$ so $Tv = Tv'$ and $ν$ is well-defined.
If $Tv = Tv'$ then $v - v'\in\ker T$ so $v + \ker T = v' + \ker T$
showing $ν$ is injective.
</details>


### Quotient

If $U$ is a subspace of $V$ and $v\in V$ define the _coset_ of $U$ containing $v$
by $v + U = \{v + u\mid u\in U\}$. Subspaces factor vector spaces into smaller vector spaces.

__Exercise__. _Show $v\in v+U$ for $v\in V$_.

_Hint_: $U$ is a vector space so $0\in U$.

__Exercise__. _Show $u + U = U$ if and only if $u\in U$_.

<details>
<summary>Solution</summary>
If $u + U = U$ then $u + u' = u''$ for some $u',u''\in U$
so $u = u'' - u'\in U$.

If $u\in U$ then $u + u'\in U$ for all $u'\in U$ so $u + U \subseteq U$
and if $u'\in U$ then $u' = u + (u' - u)\in u + U$ so $U\subseteq u + U$.
</details>

__Exercise__. _Show $v + U = w + U$ if and only if $v - w\in U$_.

<details>
<summary>Solution</summary>
If $v + U = w + U$ then $v + u = w + u'$ for some $u,u'\in U$
so $v - w = u' - u\in U$.

If $v - w\in U$ then $v - w = u$ for some $u\in U$
so $v + U = w + u + U = w + U$.
</details>

__Exercise__. _Show $v\cong_U w$ if and only if $v + U = w + U$ is
an equivalence relation_.

_Hint_: Show $v\cong v$ (reflexive), $v\cong w$ implies $w\cong v$ (symmetric), and
$v\cong w$ and $w\cong x$ implies $v\cong x$ (transitive).

The _quotient space_ $V/U = \{v + U\mid v\in V\}$ is a vector
space with scalar multiplication $a(v + U) = av + U$ and
addition $(v + U) + (w + U) = (v + w) + U$.

__Exercise__. _Show $v + U = w + U$ implies $av + U = aw + U$, $a\in\RR$, $v,w\in V$_.

_Hint_: $av - aw\in U$.

<details>
<summary>Solution</summary>
If $v + U = w + U$ then $v - w\in U$, so $a(v - w)\in U$ and $av + U = aw + U$.
</details>

__Exercise__. _Show $v + U = v' + U$ and $w + U = w' + U$ implies
$v + u + U = v' + w' + U$, $v,v',w,w'\in V$_.

_Hint_: $v - v', w - w'\in U$.

The last two exercises show scalar multiplication and addition are well-defined in $V/U$.

__Exercise__. _Show $(u + U) + (v + U) = (v + U) + (u + U)$ and
$a((u + U) + (v + U)) = a(u + U) + a(v + U)$_.

This shows addition is commutative and scalar multiplication distributes over addition,
hence the quotient space $V/U$ is a vector space where
the cosets are the vectors. A subspace $U$ and the quotient space $V/U$
determine $V$ up to isomorphism, but that requires more machinery.

<!--
$T\colon U\to V$

$0\to\ker T\to U\to \ran T\to V\to 0$

$0\to U\to V\to V/U\to 0$.
-->

## Invariant Subspace

An _invariant subspace_ of $T\colon V\to V$ is a subspace $U\subseteq V$ with $T(U) \subseteq U$.

__Exercise__. _If $T\colon V\to V$ show $\ker T$ and $\ran T$ are invariant subspaces_.

If $U$ is a 1-dimensional subspace spanned by $e\in V$ then $e$ is an _eigenvector_
and $Te = λe$ for some $λ\in\RR$, the _eigenvalue_ corresponding to $u$.

If the eigenvectors of $T$ are independent they and their corresponding eigenvalues determine $T$.
Let $(e_i)$, $(λ_i)$ be the eigenvectors and corresponding eigenvalues. Every vector $v\in V$
can be written $v = \sum_i a_i e_i$ so $Tv = \sum_i a_i Te_i = \sum_i λ_i a_i v_i$.
In this case we say $T$ is _diagonalizable_. Using the eigenvectors as a basis,
$t_{ij} = λ_i δ_{ij}$.

If $e$ is an eigenvector with eigenvalue $λ$ then $Te = λe$ so $(T - λI)e = 0$ where
$I:V\to V$ is the _identity transformation_ $Iv = v$, $v\in V$.

__Exercise__. _If the eigenvectors of $T$ form a basis then $(T-λ_1I)\cdots(T-λ_nI) = 0$_.

The dimension of $\LL(\RR^n,\RR^n)$ is $n^2$ so we know
$I$, $T$, $T^2$, \dots, $T^{n^2}$ must be linearly dependent so there is a polynomial
of order at most $n^2$ with $p(T) = 0$. If $T$ is diagonalizable the above exercise shows there is
a polynomial of order $n$ satisfying this. The Cayley-Hamilton states this is true for any $T$
where $p(λ) = \det(T - λ I)$.

## Norm

A _norm_ on a vector space is a function $\|\cdot\|\colon V\to[0,\infty)$ with
$\|av\| = |a|\|v\|$, $\|v + w\| \le \|v\| + \|w\|$, $a\in\RR$, $v,w\in V$,
and $\|v\| = 0$ implies $v = 0$.

If $V=\CC^n$ then $\|v\|_\infty = \max_i |v_i|$ and $\|v\|_p = (\sum_i |v_i|^p)^{1/p}$
are the _sup norm_ and $p$-_norm_, $p\ge 1$.

__Exercise__. _Show $\lim_{p\to\infty}\|v\|_p = \|v\|_\infty$_.

If $T\colon V\to W$ is a linear transformation between normed vector spaces then
the _operator norm_ is $\|T\| = \sup_{\|v\|\le 1}\|Tv\|$.

__Exercise__. _Show $\|aT\| = |a|\|T\|$, $\|T + S\|\le \|T\| + \|S\|$ and $\|T\| = 0$ implies $T = 0$,
$a\in\RR$, $T,S\in\LL(V,W)$_.

## Inner Product

An _inner product_ on a vector space is a bilinear function $V\times V\to\RR$.
The pair $(u,v)$ is sent to $v\cdot w$, $v, w\in V$. The inner product satisfies
$v\cdot v \ge 0$ and $v\cdot v = 0$ implies $v = 0$.

__Exercise__. _Show $\|v\| = v\cdot v$ is a norm_.

__Theorem__ (Cauchy-Schwartz) _$|u\cdot v| \le \|u\| \|v\|$ and equality
holds if and only if $u$ and $v$ are colinear_.

_Proof_. Since $0\le\|au - v\|^2 = a^2\|u\|^2 - 2au\cdot v + \|v\|^2$
the discriminat $|u\cdot v|^2 - \|u\|^2 \|v\|^2\ge 0$. The discriminant
is 0 if and only if $au - v = 0$.

## Spectrum

If $V$ is a finite dimensional normed space over $\CC$ then every operator $T\colon V\to V$ has
and eigenvector.

The _spectrum_, $σ(T)$, of a linear operator $T\colon V\to V$ is the set of all $λ\in\CC$
such that $\ker(T - λI)$ is not invertable. The _spectral radius_ is
$ρ(T) = \max\{|λ|\mid λ\in σ(T)\}$.

__Exercise__. _Show if $V$ is finite dimensional then the spectrum is the set of eigenvalues_.

_Hint_: $\ker(T - λI)\neq 0$ if and only if $Te = λe$ for some $e\in V$.

Define $E_λ = \ker(T - λI)$.

__Exercise__. _Show $E_λ\cap E_μ = 0$ if $λ\ne μ$_.

__Exercise__. _Show $\sum_{λ\in σ(T)} E_λ = V$_.

Define the _multiplicity_ of $λ\in\CC$ by $m(λ) = \dim\ker(T - λI)$.

__Exercise__. _Show there exists $e\in V$ with $(T - λI)^ke\neq 0$ for $0\le k < m(λ)$
and $(T - λI)^{m(λ)}e = 0$_.

### Adjoint

The _adjoint_ of a linear operator $T\colon V\to W$ is $T^*\colon W^*\to V^*$ defined
by $\langle v, T^* w\rangle = \langle Tv, w^*\rangle$, $v\in V$, $w^*\in W^*$.

## Fréchet Derivative

If $F\colon X\to Y$ is a function between normed vector spaces the _Fréchet_ derivative
$DF\colon X\to\LL(X,Y)$ is defined by
$$
	F(x + h) - F(x) = DF(x)h + o(\|h\|).
$$

Recall $F(x) = G(x) + o(\|h\|)$ means $\lim_{\|h\|\to 0} \|F(x) - G(x)\|/\|h\| = 0$.

__Exercise__. _If $F(x) = x^2$ where $x$ is a square matrix show $DF(x) = L_x + R_x$ where
$L_xy = xy$ and $R_xy = yx$_.

A suggestive way to write this is $D(x^2) = x(Dx) + (Dx)x$.

_Hint_: $(x + h)^2 = x^2 + xh + hx + h^2$ and $h^2 = o(\|h\|)$.

<details><summary>Solution</summary>
Since $(x + h)^2 = xx + xh + hx + hh$ and $\|h^2\| = o(\|h\})$ we have
$D(x^2)h = L_x h + R_x h$.
</details>

__Exercise__. _If $F(x) = x^n$ where $x$ is a square matrix and $n\in\NN$ show
$DF(x) = \sum_{i=0}^{n-1} L_x^{n-i-1}R_x^{i}$_.

_Hint_: What are the terms in $(x + h)^n$ containing exactly one $h$?

__Exercise__. _If $F\colon\RR^n\to\RR$ is
$F(x) = \|x\|^p$ show $DF(x) = p\|x\|^{p-2}x^*$._

_Hint_. Show $D\|x\|^2 = 2x^*$ and note $\|x\|^p = (\|x\|^2)^{p/2}$.
By the chain rule $D\|x\|^p = (p/2)\|x\|^{2(p/2 - 1)}2x^* = p\|x\|^{p - 2}x^*$.

