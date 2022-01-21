---
title: Measure
author: Keith A. Lewis
institution: KALX, LLC
email: kal@kalx.net
classoption: fleqn
fleqn: true
abstract: Do not count twice
...

\newcommand\RR{\bm{R}}
\newcommand{\Var}{\operatorname{Var}}

A _finitely additive measure_ on a set $S$ is a set function from subsets of $S$ to real numbers
$\mu\colon\mathcal{P}(S)\to\RR$, where $\mathcal{P}(S) = \{E\subseteq S\}$
is the set of all subsets of $S$,
that satisfies $\mu(E\cup F) = \mu(E) + \mu(F) - \mu(E\cap F)$ for $E,F\subseteq S$
and $\mu(\emptyset) = 0$

Measures don't count things twice and the measure of nothing is zero.

__Exercise__. _Show if $\nu(E\cup F) = \nu(E) + \nu(F) - \nu(E\cap F)$ for $E,F\subseteq S$
then $\mu = \nu - \nu(\emptyset)$ is measure_.
<details>
<summary>Solution</summary>

> By $\mu = \nu - \nu(\emptyset)$ we mean $\mu(E) = \nu(E) - \nu(\emptyset)$ for any
subset $E\subseteq S$. Clearly $\mu(E\cup F) = \mu(E) + \mu(F) - \mu(E\cap F)$
for any $E,F\subseteq S$. Since $\mu(\emptyset) = \nu(\emptyset) - \nu(\emptyset) = 0$,
$\mu$ is a measure.

</details>

__Exercise__. _Show if $\mu$ is a measure then $\mu(E\cup F) = \mu(E) + \mu(F)$
for any subsets $E$ and $F$ with empty intersection $E\cap F = \emptyset$_.
<details>
<summary>Solution</summary>

> Since $\mu(\emptyset) = 0$, $\mu(E\cup F) = \mu(E) + \mu(F) - \mu(E\cap F)
= \mu(E) + \mu(F) - \mu(\emptyset) = \mu(E) + \mu(F)$.

</details>

__Exercise__. _Show if $\mu$ is a set function with $\mu(E\cup F) = \mu(E) + \mu(F)$
for any subsets $E$ and $F$ having empty intersection then $\mu$ is a measure_.
<details>
<summary>Solution</summary>

> $\mu(E\cup F) = \mu(E\setminus F) + \mu(E\cap F) + \mu(F\setminus E)$,
$\mu(E) = \mu(E\setminus F) + \mu(E\cap F)$, and $\mu(F) = \mu(F\setminus E) + \mu(F\cap E)$
so $\mu(E\cup F) - \mu(E) - \mu(F) = -\mu(E\cap F)$. Also
$\mu(\emptyset) = \mu(\emptyset\cup\emptyset)
= \mu(\emptyset) + \mu(\emptyset)$ so $\mu(\emptyset) = 0$.

</details>

__Exercise__. _Show if $\mu$ is a measure then $\mu(E) = \mu(E\cap F) + \mu(E\cap F')$
for any subsets $E$ and $F$ where $F' = S\setminus F = \{x\in S\mid x\not\in F\}$
is the _complement_ of $F$ in $S$_.
<details>
<summary>Solution</summary>

> Note $(E\cap F)\cup(E\cap F') = E\cap(F\cup F') = E\cap S = E$
and $(E\cap F)\cap(E\cap F') = E\cap(F\cap F') = E\cap\emptyset = \emptyset$ so
$\mu(E\cap F) + \mu(E\cap F') = \mu((E\cap F)\cup(E\cap F') = \mu(E)$.

</details>

The space of all (finitely additive) measures on $S$ is denoted $ba(S)$.
Note $ba(S)$ is a vector space with $(a\mu)(E) = a\mu(E)$
and $(\mu + \nu)(E) = \mu(E) + \nu(E)$, $a\in\RR$, $E\subseteq S$.
The _norm_ of a measure $\mu\in ba(S)$ is
$\|\mu\| = \sup_{\{E_j\}} \sum_j |\mu(E_j)|$ where $\{E_j\}$
is any finite collection of pairwise disjoint subsets of $S$.

__Exercise__. _Show $\|\mu\| = 0$ implies $\mu = 0$,
$\|a\mu\| = |a|\|\mu\|$, and $\|\mu + \nu\| \le \|\mu\| + \|\nu\|$_.

Let $B(S)$ be the vector space of all bounded functions
on $S$. It has norm $\|f\| = \sup_{x\in S}|f(x)|$.
Vector space norms define a _metric_ $d\colon B(S)\times B(S)\to\RR$
by $d(f,g) = \|f - g\|$.

__Exercise__. _Show $d$ is a metric_.

Hint: Show $d(f,g) = 0$ implies $f = g$, $d(f,g) = d(g,f)$, and
$d(f,h) \le d(f,g) + d(g, h)$ for $f,g,h\in B(\Omega)$.
Note $d(f,f) \le 2d(f,f)$ so $0\le d(f,f)$ for all $f$.

The norm is _complete_ so $B(S)$ is a _Banach space_.

__Exercise__. _Show if $(f_n)$ is Cauchy then there exists $f\in B(\Omega)$
with $\lim_n \|f_n - f\| = 0$_.
<details>
<summary>Solution</summary>

> Since $(f_n(x))$ is also Cauchy it has a limit $f(x)$.
Since $(\|f_n\|)$ is Cauchy it has an upper bound so $f$ is bounded.
</details>

The (vector space) dual of $B(S)$ is $ba(S)$.
Given $M\in B(S)^*$ define $\mu(E) = M1_E$ and given
$\mu\in ba(S)$ define $M(\sum_j a_j 1_{E_j}) = \sum_j a_j\mu(E_j)$.

__Exercise__. _Show $\mu\mapsto M$ is well-defined_.
<details>
<summary>Solution</summary>

> Every finite sum of the form $\sum_j a_j 1_{E_j}$ is equal to a function
$\sum_k b_k 1_{F_k}$ where the $(F_k)$ are pairwise disjoint.
Such functions are uniformly dense in $B(S)$.
</details>

The dual pairing defines the integral $\int_S f\,d\mu = \langle f,\mu\rangle$,
$f\in B(\Omega)$, $\mu\in ba(\Omega)$. Finitely additive measures make
it challenging to prove theorems of the form 'If $\lim_n f_n = f$ then
$\lim_n \int_S f_n\,d\mu = \int f\,d\mu$.' However, Fatou's Lemma
does hold for positive finitely additive measures.

The product of a function and a measure is a measure defined by
$\langle f,g\mu\rangle = \langle fg,\mu\rangle$. Given measures $\mu,\nu\in ba(S)$
we say $g$ is the _Radon-Nikodym derivative_ of $\nu$ with respect to $\mu$ if $g\mu = \nu$.

