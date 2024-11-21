---
title: Logical Entropy
author: Keith A. Lewis
institute: New York University
classoption: fleqn
fleqn: true
keywords: entropy
abstract: |
	An improvement over Shannon entropy
---

<!--
Authors will need to provide no more than 3 ‘key points’ that summarize the key messages of their paper to be published with their article. The key points should be written with a practitioner audience in mind.
-->

\newcommand\RR{\mathbf{R}}
\newcommand\BB{\mathcal{B}}
\newcommand\LL{\mathcal{L}}
\newcommand\Var{\operatorname{Var}}
\newcommand\Cov{\operatorname{Cov}}
\newcommand\dom{\operatorname{dom}}
\newcommand\cod{\operatorname{cod}}

Shannon entropy is defined for measures, not random variables.
It is a common mistake to define the entropy of a discrete random variable
$X$, where the probability $X$ takes on the value $x_j$ with probability $p_j$,
as $-\sum_j p_j \log p_j$. Note this definition
of entropy does not involve any $x_j$.

It is an even worse mistake to define the entropy of a random variable
with density $f$ as $-\int_\RR f(x)\log f(x)\,dx$.  It is true that every
random variable $X$ with cumulative distribution $F(x) = P(X\le x)$ can be
modelled as the identity function on the sample space of real numbers
with probablility measure $P((-\infty, x]) = \int_{-\infty}^x dF(x)$.

...

Joint distributions. Negative entropy.

Logical entropy can incorporate values or random variables...

## Logic

Boole and De Morgan layed down the foundation for computer science by
showing predicate calculus can be reduced to arithmetic.

Frege introduced the notion of parameterizing a predicate with
a variable.

## Set

Frege advanced the predicate calculus of logic developed by Boole and De Morgan
by 

A _set_ is a collection of _elements_ that are _members_ of the set.

$S = \{a,...\}$.

## Relation

A _relation_ $R$ on sets $A$ and $B$ is a subset of their cartesian product $R\subseteq A\times B$.
The _domain_ of $R$ is $\dom R = A$ and the _codomain_ of $R$ is $\cod R = B$.
We write ${R\colon A\leftrightarrow B}$ and $aRb$ when ${(a,b)\in R}$.
The _codset_ ${aR = \{b\in B\mid aRb\}}$ and the _domset_ ${Rb = \{a\in A\mid aRb\}}$.
If $S\subseteq B\times C$ is a relation on sets $B$ and $C$, then
the _composition_ $SR\colon A\leftrightarrow C$ is a relation on $A\times C$ where
$a(SR)c$ if and only if there is a $b\in B$ with $aRb$ and $bSc$.
This is used to define the _join_ of relational database tables.

## Function

A relation $R\colon A\leftrightarrow B$ is a _function_ if the codset $aR$ has exactly one element
for every $a\in A$.
To indicate this we write $R\colon A\to B$
and $b = R(a)$ where $b$ is the unique element of $aR$.  A function is
_injective_, or _one-to-one_, if $Rb$ has at most one element for all $b\in B$.

__Exercise__. _If $f\colon A\to B$ is injective and $g,h\colon C\to A$ are functions
where $fg = fh$ then $g = h$_.

A function is _surjective_, or _onto_, if $|Rb| > 0$ for all $b\in B$.
There is some $a\in A$ with $aRb$.

__Exercise__. _If $f\colon A\to B$ is surjective and $g,h\colon B\to C$ are functions
where $gf = hf$ then $g = h$_.

A _part_ of a set $A$ is an injective function $P\colon I\to A$.
It corresponds to the subset $P(I) = \{P(i)\mid i\in I\}\subseteq A$.

A _partition_ of a set $A$ is a surjective function $\Pi\colon A\to I$.
Let ${A_i = \{a\in A\mid \Pi(a) = i\}}$.

__Exercise__. _Show either $A_i = A_j$ or $A_i\cap A_j = \emptyset$ for $i,j\in I$_.

__Exercise__. _Show $\cup_{i\in I}A_i = A$_.

Partitions are a mathematically rigorous way of representing partial
information.  Given a set $A$, full information is the partition of
singletons ${\{\{a\}\mid a\in A\}}$, no information is $\{A\}$, partial
information is knowing only which $A_i$ in the partition that $a\in A$ belongs to.


