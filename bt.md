---
title: Bayes
abstract: How to apply it
---
\newcommand\bs[1]{\boldsymbol{{#1}}}
\newcommand\RR{\bs{{R}}}

A _measure_ on a set $S$ is a _set function_ $\mu$ from subsets of $S$
to the real numbers that satisfies
${\mu(E\cup F) = \mu(E) + \mu(F) - \mu(E\cap F)}$ for ${E,F\subseteq S}$
and ${\mu(\emptyset) = 0}$;
measures do not count things twice and the measure of nothing is 0.

__Exercise__. _Show $\mu(E\cup F) = \mu(E) + \mu(F)$ if $E\cap F=\emptyset$_.

A _probability measure_ $P$ on a set $S$ is a positive measure with mass 1
so $P(E)\ge0$ for $E\subseteq S$ and $P(S) = 1$.

Subsets of $S$ are _events_.  The conditional expectation of an event
$A$ given event $B$ is ${P(A|B) = P(A\cap B)/P(B)}$. This makes $A\mapsto
P(A|B)$ a probability measure on $B$ if ${P(B)\not=0}$.

__Exercise__. _Show if $E,F\subseteq B$ then
${P(E \cup F|B) = P(E|B) + P(F|B) - P(E\cap F|B)}$,
${P(\emptyset|B) = 0}$, and ${P(B|B) = 1})$_.

_Hint_: Use $P(E\cup F) = P(E) + P(F) - P(E\cap F)$.

__Exercise__. _Show $P(A|B) = P(A)P(B|A)/P(B)$_.

_Hint_. Use $P(B|A) = P(B\cap A)/P(A)$.

This exercise establishes the simplest form of Bayes Theorem. It shows how to update the
probability of $A$ given information $B$.

A _random variable_ is a function $X\colon S\to\RR$. Its _cumulative distribution
function_ is $F(x) = P(X\le x)$. It determines everything there is to
know about $X$. Two random variables have the same _law_ if they have
the same cumulative distribution function.

__Exercise__. _If $\chi\colon\RR\to\RR$ is the identity function
and $P(\chi\le x) = \int_{-\infty}^x\,dF(x)$ then $\chi$ and
$X$ have the same law_.

Some wits call $\chi$ the physicists random variable. It is a special
case of the more general mathematical definition.

The first rule of Probablity Club is to specify a sample space and
a probability measure on it.

Let $S = \{(x_j,y_k)\}$ be a finite set of ordered pairs
with $P(\{(x_j, y_k)\}) = p_{jk}$ where $p_{jk}\ge0$ and $\sum_{j,k} p_{jk} = 1$.

Define random variables $X, Y\colon S\to\RR$ by $X(x,y) = x$ and $Y(x,y) = y$.

__Exercise__. _Show $P(X = x_j) = \sum_k p_{jk}$ and $P(Y = y_k) = \sum_j p_{jk}$_.

_Hint_: The set $\{X = x_j\} = \cup_k \{(x_j, y_k)\}$ is a disjoint union.

__Exercise__. _Show $P(X = x_j|Y = y_k) = p_{jk}/\sum_j p_{jk}$_.

_Hint_: $P(X = x_j|Y = y_k) = P(X = x_j, Y = y_k)/P(Y = y_k)$.

Using Bayes Theorem, ${P(X = x_j|E[Y] = y) = P(X = x_j)P(E[Y] = y|X = x_j)/P(E[Y] = y)}$...
