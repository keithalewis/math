---
title: Things to Know
author: Keith A. Lewis
email: kal@kalx.net
classoption: fleqn
---
\newcommand\bs[1]{\boldsymbol{{#1}}}
\newcommand\RR{\bs{R}}
\renewcommand\AA{\mathcal{A}}
\newcommand\BB{\mathcal{B}}

Here are some things to know when reading about the [Simple Unified Model](sum.html).

## Algebra of Sets

An _algebra of sets_ on a set $S$ is a collection of subsets of $S$
that is closed under union and complement. We assume the empty set
belongs to any algebra.

__Exercise__. _Show algebras of sets are closed under intersection_.

_Hint_. Use De Morgan's law.

### Partition

If the algebra $\AA$ is finite then the atoms of the algebra form a _partition_
of $S$. A set $A\in\AA$ is an _atom_ of $\AA$ if $B\subseteq A$ and
$B\in\AA$ imply $B = \emptyset$ or $B = A$.

__Exercise__. _Show $A_s = \cap\{A\in\AA\mid s\in A\}$ is an atom of $\AA$_.

For $s\in S$ the _atom_ containing $s$ is the intersection of
all sets in the algebra containing $s$, $A_s = \cap\{A\in\AA\mid s\in A\}$.

__Exercise__. _Show if $B\subseteq A_s$ and $B\in\AA$ then either $B=\emptyset$ or $B = A_s$_.

_Hint_: If $s\in B$ then $A_s\subseteq B$. If $s\not\in B$ then $s\in A_s\setminus B$
so $A_s\subseteq A_s\setminus B\subseteq A_s$. It follows $A_s = A_s\setminus B$ and $B = \emptyset$.

Clearly $S = \cup_{s\in S} A_s$.

__Exercise__. _Show $A_s\cap A_t\not=\emptyset$ implies $A_s = A_t$_.

_Hint_: Use $A_s\subseteq A_t$ and $A_t\subseteq A_s$ then apply the previous exercise.

### Partial Information

A partition models _partial information_ about a sample space $S$.
No information corresponds to the singleton $\{S\}$.
Full information corresponds to the partition of singletons $\{\{s\}\mid s\in S\}$.
Partial information means knowing only which atom contains the element $s$.

For example, the partition $\{[0,1/2),[1/2,1)\}$ of $[0, 1)$ represents
knowledge of the first digit in the base 2 expansion of $s\in[0,1)$.
If $s\in[0,1/2)$ its first binary digit is 0 and if $s\in[1/2,1)$
its first binary digit is 1.

### Measurable

A function $f\colon S\to\RR$ is _measurable_ with respect to an algebra
if and only if it is constant on atoms. In particular, it __is__ a function
on the atoms. This is useful for software implementation of measurable functions.

### Finitely Additive Measure

The set of bounded functions on a set $S$ is
${B(S) = \{f\colon S\to\RR\mid \|f\| < \infty \}}$
where ${\|f\| = \sup_{s\in S}|f(s)|}$ is the norm of $f$.

The vector space dual of bounded functions, $B(S)^*$, is isometrically isomorphic to $ba(S)$, the space of
finitely additive measures on $S$. Given a linear functional $L\colon B(S)\to\RR$
define ${\lambda(A) = L1_A}$. The algebraic equality ${1_{A\cup B} = 1_A + 1_B - 1_{A\cap B}}$ shows
$\lambda$ is a finitely additive measure.

__Exercise__. _Show $\lambda(\emptyset) = 0$_.

_Hint_: $1_\emptyset(s) = 0$ for all $s\in S$ so $1_\emptyset$ is the zero function in $B(S)$.

__Exercise__. _If $T\colon V\to W$ is a linear operator then $T0_V = 0_W$_.

_Hint_ First show $v + v = v$ for any $v\in V$ implies $v = 0_v$.
Consider $T(0_V) = T(0_V + 0_v)$.

Given a finitely additive measure $\lambda\in ba(S)$ we can define a linear functional
on the vector space of finite linear combinations ${f = \sum_j a_j 1_{A_j}}$
by ${Lf = \sum_j a_j \lambda(A_j)}$.
The $A_j$ can be chosen to be disjoint.

__Exercise__. _Write $A\cup B$ as a disjoint union_.

_Hint_: Use $A\setminus B = \{a\in A\mid a\not\in B\}$.

This makes the definition well-defined.
The norm of $\lambda$ is the supremum over all disjoint $\{A_j\}$ of 
${\sum_j |\lambda(A_j)|}$. A short argument shows ${\|\lambda\| = \|L\|}$.
Elementary functions are uniformly dense in $B(S)$ so we can extend $L$
to an isometry from $B(S)$ to $ba(S)$.

For $g\in B(S)$ define $M_g\colon B(S)\to B(S)$ by ${M_gf = fg}$. Its
adjoint ${M_g^*\colon ba(S)\to ba(S)}$ defines multiplication of a measure
by a bounded function ${g\lambda = M_g^*\lambda}$.

If $P$ is a positive measure having mass 1 (a "probability" measure) and $\AA$
is an algebra of sets on the sample space then
the _conditional expectation_ ${Y = E[X\mid\AA]}$ is equivalent to ${Y(P|_\AA) = (XP)|_\AA}$
where $|_\AA$ indicates restriction of measure. It is trivial to implement
restriction of a function in software.

## Fréchet Derivative

If $F\colon X\to Y$ is a function between normed linear spaces
the Fréchet derivative ${DF\colon X\to\BB(X,Y)}$ is defined by
$$
	F(x + h) = F(x) + DF(x)h + o(h)
$$
for $x,h\in X$ where $\BB(X,Y)$ is the set of bounded linear operators from $X$ to $Y$.
The "little $o$" notation means
$\|F(x + h) - F(x) - DF(x)h\|/\|h\| \to 0$ as $\|h\| \to 0$.
The function $F$ can be approximated near $x$ by the linear operator $DF(x)$.

__Exercise__. _If $X$ is a Banach algebra and $F(x) = x^2$ show $DF(x)h = xh + hx$_.

_Hint_: Don't assume multiplication is commutative and use $h^2 = o(h)$.

If we define left multiplication by $x\in X$, $L_x\colon X\to X$, as $L_xy = xy$
and right multiplication by $x$ as $R_xy = yx$ then the above exercise shows
${DF(x^2) = L_x + R_x}$.

__Exercise__ _Show $D(x^n) = \sum_{k = 0}^n L_x^{n-k} R_x^k$_.

For $x\in\RR^n$ define the linear functional $x^*\colon\RR^n\to\RR$ by $x^*(y) = y\cdot x$.

__Exercise__. _Show $x\mapsto x^*$ is an isometric isomorphism from $\RR^n$ to its dual
$(\RR^n)^* = \BB(\RR^n,\RR)$_.

__Exercise__ _Let $\|x\|^p = \sum_i |x_i|^p$ for $x = (x_1,\ldots,x_n)\in\RR^n$.
Show $D\|x\|^p = p\|x\|^{p-2}x^*$_.

_Hint_: Start with $p = 2$ and use $\|x\|^p = \exp((p/2)\log\|x\|^2)$.
Note $x \mapsto \|x\|^p$ is a function $\RR^n\to\RR$ so its
Fréchet derivative goes from $\RR^n\to\BB(\RR^n,\RR) = (\RR^n)^*$.
