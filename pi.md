---
title: Partial Information
author: Keith A. Lewis
classoption: fleqn
fleqn: true
---
\newcommand\RR{\boldsymbol{R}}
\newcommand\AA{\mathcal{A}}

A _partition_ of a set $S$ is a collection of disjoint subsets with
union equal to $S$. The elements of the partition are called _atoms_.
The coarsest partition containing only the atom $S$ represents no information.
The finest partition of singletons $\{s\}$, $s\in S$, represents complete information.
Knowing which atom of a partition $s\in S$ belongs to represents _partial information_.
Finite algebras of set are in one-to-one correspondence with partitions.
An _algebra of sets_ on $S$ is a collection of subsets of $S$ closed under
union and complement. We assume every algebra contains the empty set.
By De Morgan's laws it is also closed under intersection.

If $\AA$ is an algebra of sets on $S$ then
$A\in\AA$ is an _atom_ if
$B\subseteq A$ and $B\in\AA$ imply $B = \emptyset$ or $B = A$.

George Boole showed how to reduce De Morgan's laws for sets to an algebraic calculation.
For $A\subseteq S$ define the _indicator function_ $1_A\colon S\to\RR$
by $1_A(s) = 1$ if $s\in A$ and $1_A(s) = 0$ if
${s\in S\setminus A = \{s\in S\mid s\not\in A\}}$.
Recall the _union_ $A\cup B$ of sets $A$ and $B$ is the set if elements belonging
to either $A$ or $B$ and
and the _intersection_ $A\cap B$ of sets $A$ and $B$ is the set of elements
belonging to both $A$ and $B$.

__Exercise__. _Show $1_{S\setminus A} = 1_S - 1_A$, $1_{A\cup B} = 1_A + 1_B - 1_{A\cap B}$,
and $1_{A\cap B} = 1_A1_B$_.

__Exercise__. (De Morgan) _Show $S\setminus (A\cup B) = (S\setminus A)\cap(S\setminus B)$
and $S\setminus (A\cap B) = (S\setminus A)\cup(S\setminus B)$_.

_Hint_: $1_{(S\setminus A)\cap(S\setminus B)} = 1_{S\setminus A}1_{S\setminus B}$
and $1_{(S\setminus A)\cup(S\setminus B)}
= 1_{S\setminus A} + 1_{S\setminus B} - 1_{S\setminus A}1_{S\setminus B}$.

<details><summary>Solution</summary>
We have
$$
\begin{aligned}
1_{(S\setminus A)\cap(S\setminus B)}
&= 1_{S\setminus A} 1_{S\setminus B} \\
&= (1_S - 1_A)(1_S - 1_B) \\
&= 1_S - 1_A - 1_B + 1_A 1_B \\
&= 1_S - (1_A + 1_B - 1_{A\cap B}) \\
&= 1_S - 1_{A\cup B}) \\
&= 1_{S\setminus (A\cup B)} \\
\end{aligned}
$$
and
$$
\begin{aligned}
1_{(S\setminus A)\cup(S\setminus B)}
&= 1_{S\setminus A} + 1_{S\setminus B} - 1_{S\setminus A} 1_{S\setminus B} \\
&= (1_S - 1_A) + (1_S - 1_B) - (1_S - 1_A)(1_S - 1B) \\
&= (1_S - 1_A) + (1_S - 1_B) - 1_S + 1_A + 1_B - 1_A 1_B \\
&= 1_S - 1_{A\cap B} \\
&= 1_{S\setminus (A\cap B)} \\
\end{aligned}
$$
</details>


For example, let $S = [0,1)$ be the real numbers greater or equal to 0
and strictly less than 1.
Every $s\in S$ can be written in a base-2 expansion $s = \sum_{n>0} s_n/2^n$ where $s_n$ is either 0 or 1.

The partition $\{[0,1/2),[1/2,1)\}$ represents knowing the first
base-2 digit of $s$. If $s\in[0,1/2)$ then $s_1 = 0$ and
if $s\in[1/2,1)$ then $s_1 = 1$.

The partition $\{[j/2^n, (j+1)/2^n)\mid 0\le j\le 2^n\}$ represents knowing
the first $n$ base-2 digits of $s$.
