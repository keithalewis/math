---
title: Totally Ordered Streams
author: Keith A. Lewis
institution: KALX, LLC
email: kal@kalx.net
classoption: fleqn
fleqn: true
abstract: Totally ordered streams.
...

\newcommand\RR{\bm{R}}
\newcommand\NN{\bm{N}}
\newcommand\BB{\bm{bool}}
\newcommand{\Var}{\operatorname{Var}}
\newcommand{\given}{\mid}
\newcommand{\skip}{\operatorname{skip}}
\newcommand{\first}{\operatorname{first}}

Let $\langle T,\le\rangle$ be a totally ordered set:
for all $t,u\in T$ either $t \le u$ or $u\le t$.

If $S$ is a finite subset of a totally ordered set $T$
define an _iterable_ over $T$ by
$$
\begin{aligned}
	*S &= \min\{s\mid s\in S\} \\
	+S &\leftarrow S\setminus\{*S\} \\
	?S &= (S \not= \emptyset) \\
\end{aligned}
$$
where left arrow indicates $S$ is updated with the right hand value.

## Apply

If $f\colon T\to U$ define $f(S)$ as an iterable over $U$ by
$$
\begin{aligned}
	*f(S) &= f(*S) \\
	+f(S) &\leftarrow f(+S) \\ 
	?f(S) &= (S \not= \emptyset) \\
\end{aligned}
$$

## Filter

Given a predicate $P\colon S\to\BB$ define $S\mid P$ by
$$
\begin{aligned}
	*(S\mid P) &= P(*S) \text{ if } ?S \text{ else } *(+(S\mid P)) \\
	+(S\mid P) &\leftarrow (+S)\mid P \\
	?(S\mid P) &= (S\not=\emptyset) \\
\end{aligned}
$$
This will recursively find the next value of $S$ that satisfies
the predicate. We call this $S$ _given_ $P$.

__Exercise__ _Show $s\in (S\mid P)$ if and only if $s\in S$ and $P(s)$_.

### Relation

If $R\subset T\times T$ is a relation and $t\in T$ define the predicate $P(s) = sRt$
where $sRt$ means $(s,t)\in R$. Define $SRt$ to be $S\mid P$.

__Exercise__. _Show $S<t = S\cap\{s\in S\mid s < t\}$_.

## Mask

If $Q$ is a boolean valued iterable we use the same notation for the iterable $S\mid Q$.
Define
$$
\begin{aligned}
*(S\mid Q) &= *S\text{ if }*Q\text{ else } *(+(S\mid Q)) \\
+(S\mid Q) &\leftarrow (+S\mid +Q) \\
?(S\mid Q) &= ?Q \\
\end{aligned}
$$
This will recursively find the next value of $S$ that belongs to the mask.
We call this $S$ _mask_ $Q$.

__Exercise__ _Show $s\in (S\mid Q)$ if and only if and $s = *+^nS$ and $*+^nQ$ for some $n\ge0$_.

## Disjoint Union

If $\{S_j\}_{0\le j \le n}$ are finite subsets of $T$ then
$\sqcup_{0\le j \le n} S_j = \cup_{0\le j \le n} S_j\times\{j\}$.
The lexicographical order defined by $(s,i) \le (t,j)$ by $s < t$ or
$s = t$ and $i < j$ is a total order.

If $\{S_j\}_{0\le j < n}$ are finite subsets of $T$ define $,S_j$ by
$*(,S_j) = *(\sqcup_j S_j) = (s, k)$ and
$$
	+(,S_j) = \sqcup_j (S_j > s')).
$$
where $s' =  *S_{\mod(k+1,n)}$.

## Function

__Exercise__. _If $(X_t)$ is right continuouse and $T^a = \min\{t\mid X_t \ge a\}$
then $1_{T\ge t}$ is left continuous_.

## Examples

Consider a trading strategy where you buy 1 share of stock with the price goes below $L$
and sell when it goes above $H$. If $S_t$ is the price at time $t$
trade indicators are $(S < L),(S > H)$.

