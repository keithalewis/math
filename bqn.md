---
title: BQN
author: Keith A. Lewis
institution: KALX, LLC
email: kal@kalx.net
classoption: fleqn
abstract: Category Theory for Array Languages
...

\newcommand\NN{\bm{N}}


## Product

The cartesian product of sets $A$ and $B$ is the set of all pairs of
elements ${A\times B = \{(a, b)\mid a\in A, b\in B\}}$.
<!--
Define projections
$\pi_A\colon A\times B\to A$ by by $\pi_A(a,b) = a$ and
$\pi_B\colon A\times B\to B$ by by $\pi_B(a,b) = b$.

__Exercise__ _Show if functions $\alpha\colon C\to A$ and $\beta\colon C\to B$ 
there exists a function $\gamma\colon C\to A\times B$ with
$\alpha = \pi_A\gamma$ and $\beta = \pi_B\gamma$_.
-->

A relation is a subset of a cartesian product $R\subseteq A\times B$. We
write $aRb$ for $(a, b)\in R$ where $a\in A$, $b\in B$.
A right coset of $R$ is ${aR = \{b\in B\mid aRb\}\subseteq B}$, $a\in A$, and a left coset
is ${Rb = \{a\in A\mid aRb\}\subseteq A}$, $b\in B$.

A function is a relation where every right coset contains exactly one element.
We write $R\colon A\to B$ and $R(a) = b$ where $b\in B$ is the unique element of $aR$.
A partial function is a relation where every right coset contains at most one element.
A partial function can be extended to a function using a unique symbol
$\bot$ and defining $R(a) = \bot$ if $aR$ is empty.

The composition of relations $R\subseteq A\times B$ and $S\subseteq B\times C$ 
is the relation ${SR = \{(a,c)\mid aRb\text{ and }bRc\text{ for some }b\in B\}\subseteq A\times C}$.

__Exercise__. _Show $a(SR)c$ if and only if $aR\cap Sc\not\emptyset$_.

A relational database is a collection of relations.
The join (on $B$) of relations $R\subseteq A\times B$ and $S\subseteq B\times C$
is the relation ${SR = \{(a,b,c)\mid aRb\text{ and }bRc\text{ for some }b\in B\}\subseteq A\times C}$.

__Exercise__. _If $f\colon A\to B$ and $g\colon B\to C$ are functions show
$a(gf)c$ if and only if $c = g(f(a)$, $a\in A$, $c\in C$_.

The transpose of $R\subset A\times B$ is ${R^* = \{(b,a)\mid a\in A, b\in B\}\subseteq B\times A}$.

__Exercise__. _Show $bR^* = Rb$ and $R^*a = aR$ for $a\in A$ and $b\in B$_.

A relation $R\subseteq A\times A$ is _reflexive_ if $aRa$,
_symmetric_ if $aRb$ implies $bRa$, _antisymmetric_ if $aRb$ and $bRa$ imply
$a = b$, and _transitive_ if $aRb$ and $bRc$ imply $aRc$, $a,b,c\in A$.

The _identity relation_ is $I_A = \{(a,a)\mid a\in A\}$.

__Exercise__. _Show $R$ is reflexive if and only if $I_A\subseteq R$_.

__Exercise__. _Show $R$ is symmetric if and only if $R^* = R$_.

__Exercise__. _Show $R$ is symmetric implies $I_A\subseteq R$_.

__Exercise__. _Show $R$ is antisymmetric if and only if $I_A\subseteq R\cap R^*$_.

__Exercise__. _Show $R$ is transitive if and only if $R^2 = RR\subseteq R$_.

$I_A\subseteq R\cap R^*$_.

For $f\in A^B$ define $\pi_b f = f(b)$, $b\in B$.
If $f_b\colon C\to A$, $b\in B$, define $g\colon C\to A^B$ by
$g(c)b = f_b(c)$.

If $f\colon (A\times B)\to C$ then $f,\colon A\to(B\to C)$ by $(f,a)b = f(a,b)$, $a\in A$, $b\in B$.

If $f\colon A\times B^I\to C^I$ then $f,\colon A\to(B^I\to C^I)$ since $(f,a)b\colon I\to C$.

If $S$ is a set define $S^* = \sqcup_{n\in\NN}S^n$.

If $\langle M,m,e\rangle$ is a monoid with binary operation $m\colon M^2\to M$
and identity $e\in M$ define
$$
\begin{aligned}
m^0\colon M^0\to M &\text{ by } m(\emptyset) = e \\
m^1\colon M^1\to M &\text{ by } m^1(a) = a, a\in A \\
m^n\colon M^n\cong M\times M^{n-1}\to M &\text{ by }
m^n(a,b) = m(a, m(b)), a\in M, b\in M^{n-1}\\
\end{aligned}
$$

This defines $m^*\colon M^*\to M$ by $m^*|_{M^n} = m^n$.
