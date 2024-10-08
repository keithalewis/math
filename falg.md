---
title: F-Algebra
author: Keith A. Lewis
institute: KALX, LLC
classoption: fleqn
fleqn: true
abstract: Category with structure
...

\newcommand\dom{\operatorname{dom}}
\newcommand\cod{\operatorname{cod}}
\renewcommand\ker{\operatorname{ker}}
\newcommand\ran{\operatorname{ran}}
\newcommand\cat[1]{\mathbf{#1}}
\newcommand\mb[1]{\mathbf{#1}}
\newcommand\ZZ{\bm{Z}}

These conditions are not very categoryish. How does one say  $m(a,m(b,c)) = m(m(a,b),c)$
without mentioning $a$, $b$, or $c$?
Categories are just arrows and objects.
Define $i\colon M\to I\times M$ by $i(a) = (\star,a)$.

We can define a functor on $\cat{Set}$ by $F(M) = I \times M$, for any set $M$, where $I$ is
initial object of $\cat{Set}$, i.e., any singleton.
Let $α\colon F(M)\to M$ be the projection on the second component $(\star,a)\mapsto a$, $a\in M$.

If $a\colon M\to N$ is
and arrow the $F(a)\colon F(M)\to F(N)$ by $I\times aM\mapsto 

An F-algebra on a category $\cat{C}$ is a functor $F\colon \cat{C}\to\cat{C}$,
an object $A$ in $\cat{C}$, and an arrow $α\colon F(A)\to A$.
For a monoid the F-algebra has functor $F(M) = M\times M$ on $\cat{Set}$
and arrow $α\colon M\times M\to M$ where and $(a,b)\mapsto m(a,b)$.
Here $I$ is an initial object of $\cat{Set}$, i.e., any singleton.




Sets can be equipped with an algebraic structure.
For example, a _semigroup_ is a set $S$ with
an associative binary operation.  A binary operation $m\colon S\times
S\to S$ is _associative_ if $m(a,m(b,c)) = m(m(a,b),c)$, $a,b,c\in M$.
If we write $ab$ for $m(a,b)$ this becomes $a(bc) = (ab)c$.

__Exercise__. _The binary operation of subtraction on the integers is not associative_.

A _monoid_ is a semigroup with an identity element $e$ satisfying $ea = a = ae$ for all $a$
in the semigroup.

## F-algebra

Given an endofuction $F\colon\cat{C}\to\cat{C}$, an _F-algebra_
$\lbracket A,α\rbracket$ for category $\cat{C}$ is an endofunctor
$F\colon\cat{C}\to\cat{C}$, an object $A$, and an arrow $α\colon F(A)\to
A$. If $\lbracket B,β\rbraket$ is an F-algebra then $f\colon A\to B$ is an F-algebra
homomorphism if $fα = βF(f)$.

If $M$ is a moniod with identity $e\in M$ then $ea = a = ae$, $a\in M$,
and $a(bc) = (ab)c$, $a,b,c\in M$ where $ab = m(a,b)$ is the monoid operation $m\colon M\times M\to M$.

Need facts that are special to $\cat{Set}$.

$B^A = \{f\colon A\to B\} = \{A\to B\}$.

If $f\colon X\to Y$ is a function, $(x,x')\in\ker f$ iff $f(x) = f(x')$ is an equivalence relation on $X$.

The map $X\to X/\ker X$, $x\mapsto x/\ker f$, is surjective

The map $X/\ker f\to \ran f$, $x/\ker f\mapsto f(x)$, is well-defined and bijective

The map $\ran f\to Y$, $f(x)\mapsto f(x)$, is injective.

$f\colon X\to Y$, $f^\vdash\colon\mathcal{P}(Y)\to\mathcal{P}(X)$,
$f^\vdash(S) = \{x\in X\mid f(x)\in S\}\subseteq X$, $S\subseteq Y$.
$x/\ker f = f^\vdash(\{f(x)\})$.

Product $\prod_{i\in I}A_i$, $\pi_i\colon \prod_{i\in I}A_i\to A_i$ such that
$p_i\colon C\to A_i$ implies there exists $p\colon C\to\prod_{i\in I}A_i$
with $\pi_ip = p_i$ all $i\in I$.

$σ\colon J\to I$, $\Pi_{j\in J} A_{σ(j)}$. Permutaion if $σ$ is bijective.
Projection if $J\subseteq I$.
Reshape if $J=n_1\times\cdots$, $(j_1,\ldots)\mapsto j_1 + n_1(\cdots)$.

$τ\colon I\to J$, $\Pi_{j\in J} \Pi_{i\mid σ(i) = j} A_i$. Grouping.
If $I = n$ and $τ\colon n\to m$, $m \le n$ then $I/\ker τ$ is a partition of $I$,
$τ_{0|12}\colon X_0\times X_1\times X_2\to (X_0)\times(X_\time X_2)$.

$(A\times B)\times C \equiv A\times(B\times C)$

$\Pi_{i\in I} A \equiv A^I$, $π_i\colon \Pi_{i\in I} A\to A$, $π_i(a) = a(i)$.
$a\in\Pi_{i\in I} A\mapsto (i\mapsto π_i(a))$.


Exponential $e\colon (B^A\times A)\to B$.

Product, $A\to A\times B$, and exponential, $A\to B^A$, are adjoint functors.
$\{(A \times B)\to C\} \equiv \{A \to \{B\to C\}\}$ $f(a,b) = c$ iff $(\underline{f}(a))(b) = c$.
$(g(a))b = c$ iff $\overline{g}(a, b) = c$.

$σ\colon I\to J$, $σ^\vdash J\to \ker σ$.

$M\times M\to M^2$ product to exponential, as sets

$M\times M\times M\to M\times M^2$

$M\times M\times M\to M^2\times M$

$\NN\to M\times\cdots\times M$, $σ\colon n\to m$, $m\le n$.

$M\times\cdots\times M\ to M^{σ(0)} \times M^b \times \ldots$

$m(a,m(b,c)) = m(m(a,b),c)$

(a,b,c) -> (a, (b,c)) -> (a, m(b,c)) -> m(a, m(b,c))

m:G^2 -> G, m x m^2: G x G^2 -> 

G^3-> G G^2 (a,b,c) -> (a,(b,c))

G^3-> G^2 G (a,b,c) -> ((a,b),c)

(a,b,c) -> (a,m(b,c)) 
