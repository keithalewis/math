---
title: Probabilistic Reasoning
author: Keith A. Lewis
institution: KALX, LLC
email: kal@kalx.net
classoption: fleqn
fleqn: true
abstract: A calculus for uncertainty
...

\newcommand\RR{\mathbf{R}}
\newcommand\NN{\mathbf{N}}
\newcommand\AA{\mathcal{A}}
\newcommand{\Var}{\operatorname{Var}}
\newcommand{\Cov}{\operatorname{Var}}

> _The theory of probabilities is at bottom nothing but common sense
reduced to calculus; it enables us to appreciate with exactness that
which accurate minds feel with a sort of instinct for which of times
they are unable to account_. -- Pierre-Simon Laplace

Probability is an
[extension of the rules of logic](https://plato.stanford.edu/entries/logic-probability/)
to deal with uncertain events.
Instead of the absolute 'true' or 'false' of logic, it uses estimation to aid plausible reasoning.
The first step in any problem involving probability is to specify
what outcomes are possible and their a priori probability of occuring.
A probability is a number between 0 and 1 representing a degree
of belief.  All probabilities are conditional on available information
and can be systematically updated using Bayes' theorem as more information
becomes available.

## Origins

In 1654, Antoine Gombaud (aka le chevalier de Méré) asked Blaise Pascal
"Is it worthwhile betting even money that double sixes will turn up at
least once in 24 throws of a fair pair of dice?" Based on empirical data
he believed that the probability was greater than rolling at least one
6 in 4 throws. The probability of not throwing a 6 is $5/6$ so the
probability of not throwing a 6 in 4 throws is $(5/6)^4$.
The probability of pair of dice not having a pair of 6's is $(35/36)$ so the probability
of not throwing a pair of 6's in 24 throws is $(35/36)^{24}$.
This shows the answer to De Méré's first question is $1 - (35/36)^{24}\approx .491$
and since $1 - (5/6)^4 \approx .518$ we have shown his intuition was wrong.

In this case the sample space is 24 rolls of a pair of dice, $\Omega = (D\times D)^24$
where $D = \{1,2,3,4,5,6\}$.

...

$P(A\mid B) = P(AB)/P(B)$

$P(A\mid B) = P(A)P(B\mid A)/P(B)$

$\Omega = \{\text{heads},\text{tails}\}$. $P(\text{heads}) = p$, $P(\text{tails}) = 1 - p$ for some
$p\in[0, 1]$. Define $X\colon\Omega\to\RR$ by $X(\text{heads}) = 1$ and $X(\text{tails}) = 0$.

__Exercise__. _Show $P(X = x) = p^x(1 - p)^{1 - x}$_.

We could let $\Omega = \{0,1\}$ with $P(\{0\}) = 1 - p$, $P(\{1\}) = p$, and define $X(\omega) = \omega$.

What if we don't know $p$? How can coin flips give us information about its value?

Let $\Omega = \{0,1\}\times[0,1]$ and $X\colon\Omega\to\RR$ by $X(x,\theta) = x$.

$P(X = x) = P(\{x\}\times[0,1])$

$P(X = x) = p^x(1-p)^{1 - x}$, where $p = P(X = 1)$ so $1 - p = P(X = 0)$.

$P(\Theta\le\theta) = P(\{0,1\}\times [0,\theta])$.

$P(X = x) = \Theta^x (1 - \Theta)^{1 - x}$ is a random variable (???)

$P(X = x)$ means $P(X = x\mid\Theta)$.

$P(\Theta\le\theta|X = x) = P(\Theta\le\theta)P(X = x\mid \Theta\le\theta)/P(X = x)$

Suppose $P(\Theta \le \theta) = 1_{[p,\infty)}(\theta)$, i.e., $\Theta = p$ with probability 1.

Claim $P(X = x) = E[\Theta]^x(1 - E[\Theta])^{1 - x} = p^x(1 - p)^{1 - x}$.

$P(X = x\mid \Theta\le\theta) = ?$

$P(X = 0\mid \Theta\le\theta) = \int_0^1 (1 - q)\,d1_{[p,\infty)}(q)$

$P(X = 1\mid \Theta\le\theta) = \int_0^1 q\,d1_{[p,\infty)}(q)$


## Probability Space

A _sample space_ $Ω$ is the set of what can happen.
An _outcome_ $ω\in Ω$ is an element of a sample space.
An _event_ $E\subseteq Ω$ is a subset of a sample space.
A _probability measure_, $P$, is a function from events to $[0,1]$
satisfying $P(E\cup F) = P(E) + P(F) - P(E\cap F)$ and $P(\emptyset) = 0$.
A measure does not count things twice and the measure of nothing is $0$.

__Exercise__. _Show $P(E\cup F) = P(E) + P(F)$ if $E\cap F = \emptyset$._

It was a major event in our world when Kolomogorov legitimized previous
results in probability theory that rascals and scoundrels
figured out by hook or by crook to win at gambling.
Measure Theory was developed by Lesbegue to generalise Riemann-Stieltjes integration.
Mathematicans found probabilty theory more legitimate when Kolomogorov
pointed out a probability measure is simply a positive measure having mass 1.

_Partial information_ about outcomes in $\Omega$ is modeled by a _partition_:
a collection of pairwise disjoint subsets whose union is $\Omega$.
Elements of the partition are _atoms_.  Complete information
corresponds to the _finest_ partition of _singletons_ ${\{\{ω\}\mid ω\in Ω\}}$.
No information corresponds to the _coarsest_ partition $\{Ω\}$.
Partial information is knowing only which atom an outcome belongs to.


An _algebra_ $\AA$ is collection of events that is closed under set _complement_ and _union_.

The complement of the event $E\subseteq Ω$, $\neg E$,
the set of outcomes 'not' in $E$.
The union of events, $E\cup F$, is the set of outcomes that belong to $E$ 'or' $F$.

__Exercise__. _Show if $\AA$ is closed under complement and union then
so is $\AA\cup\{\emptyset, Ω\}$_.

It is convenient to assume the empty set belongs to the algebra.

__Exercise__. _Show $Ω\in\AA$ and $\AA$ is closed under set intersection_.

_Hint_: Use $\emptyset\in\AA$ and De Morgan's laws.

<details><summary>Solution</summary>
The set _complement_ of $A\subseteq Ω$ is $\neg A = \{ω\in Ω\mid ω\not\in A\}$
so $\neg \emptyset = Ω\in\AA$.
Since $\neg(A\cap B) = \neg A \cup\neg B$ we have $A\cap B\in\AA$.
</details>

If an algebra is also closed under countable unions of events then is it a $σ$-algebra.
This means if $E_n\in\AA$, $n\in\NN$, then $\cup_{n\in\NN} E_n\in\AA$, where
$\NN = \{0, 1, 2, \ldots\}$ is the set of _natural numbers_.

__Exercise__. _If an algebra is closed under countable unions then it is
also closed under countable intersections_.

Algebras model _partial information_.

### Partition

If $\AA$ is finite then its atoms are a partition of the sample space
and $\AA$ is generated by its atoms.

An _atom_ is an event $A\in\AA$ where $B\subseteq A$ for some $B\in\AA$
implies $B=\emptyset$ or $B=A$.  If $\AA$ is finite and $ω\in Ω$ define
${A_ω = \cap\{A\in\AA\mid ω\in A\}}$.

__Exercise__. _Show $A_ω$ is an atom of $\AA$ containing $ω\in Ω$_.

__Excercise__. _Show $\{A_ω\mid ω\in Ω\}$ is a partition of $Ω$_.

_Hint_: Since $ω\in A_ω$, $ω\in Ω$, the union is $Ω$.
Show either ${A_ω \cap A_{ω'} = \emptyset}$ or $A_ω = A_{ω'}$, $ω,ω'\in Ω$.

If $\AA$ is finite then we can identify it with its atoms.

#### Coin tossing

We can model a sequence of random coin flips by a sequence of 0's and 1's where
0 corresponds to heads and 1 corresponds to tails. (Or vice versa.)
If $ω_j\in\{0,1\}$ is the $j$-th flip define
${ω = \sum_{j=1}^\infty ω_j/2^j}$.

__Exercise__. _Show $ω\in [0,1)$_.

__Exercise__. _Show if $ω_1 = 0$ then $ω\in [0,1/2)$ and if $ω_1 = 1$ then $ω\in [1/2,1)$_.

This shows the partition $\AA_1 = \{[0,1/2), [1/2,1)\}$ of $[0, 1)$ represents knowing
the first base 2 digit of $ω$. Similarly, the partition
$\AA_2 = \{[0,1/4), [1/4, 1/2), [1/2, 3/4), [3/4,1)\}$ represents knowing the
first two base 2 digits of $ω$.

__Exercise__. _Show the partition $\AA_n = \{[j/2^n, (j + 1)/2^n)\mid 0\le j < 2^n\}$
of $[0, 1)$ represents knowing the first $n$ base 2 digits of $ω\in [0,1)$_.

### Measure

A _measure_ is a set function $μ\colon\AA\to\RR$ that
satisfies $μ(E\cup F) = μ(E) + μ(F) - μ(E\cap F)$ for $E,F\in\AA$.
Measures do not count things twice.
We also assume $μ(\emptyset) = 0$. The measure of nothing is 0.

__Exercise__ _Show $μ(E\cup F) = μ(E) + μ(F)$ if $E\cap F=\emptyset$_.

A _probability measure_ $P$ is a measure with $P(E)\ge0$ for all $E\in\AA$
and $P(Ω) = 1$.

#### Discrete

If $Ω = \{ω_j\}$ is finite (or countable) we can define a _discrete_ probability
measure by $P(\{ω_j\}) = p_j$ where $p_j > 0$ and $\sum_j p_j = 1$.

__Exercise__. _Show $P(E) = \sum_{ω_j\in E} p_j$_.

_Hint_. $E$ is the disjoint union of singletons $\{ω_j\}$ where $ω_j\in E$.

#### Uniform

The _uniform_ measure on $Ω = [0,1)$ is defined by $λ([a,b)) = b - a$ for $0\le a\le b < 1$.

## Conditional Expectation

The _conditional expectation_ of an event $B$ given an event $A$ is
${P(B\mid A) = P(B\cap A)/P(A)}$.

__Exercise__. _Show $P_A(B) = P(B\cap A)/P(A)$ is a probability measure on $A$_.

_Hint_: Show $P_A(A) = 1$ and $P_A(B\cup C) = P_A(B) + P_A(C) - P_A(B\cap C)$.

__Exercise__. _Show $P(B\mid A) = P(B) P(A\mid B)/P(A)$_.

This is the simplest form of Bayes Theorem. It shows how to update your degree
of belief based on new information. Every probability is conditional on information.

We say $B$ is _independent_ of $A$ if $P(B\mid A) = P(B)$.

__Exercise__. _Show $B$ is independent of $A$ if and only if $P(A\cap B) = P(A)P(B)$_.

__Exercise__. _Show $B$ is independent of $A$ if and only if $A$ is independent of $B$_.

We also say $A$ and $B$ are independent.

### Example

Suppose a family moves in next door and you are told they have
two children.  If you step on a GI Joe doll in their yard on your way
to work what is the probability they are both boys?

The first step is to establish the sample space and the probability
measure. We assume $\Omega = \{FF, FM, MF, MM\}$ represents the female
or male gender of the younger and older child and that each possibility
is equally likely.

The event "step on a GI Joe" doll corresponds to $B = \{FM, MF, MM\}$
indicating at least one of the children is a boy.  Bayes' theorem implies
$P(\{MM\}\mid B) = P(\{MM\})/P(B) = (1/4)/(3/4) = 1/3$, not $1/2$.

As in every model, there are assumptions. It may not be the case female
and male children are equally likely. If $p$ is the probabilty of a
child being male then ${P(\{MM\}\mid B) = p^2/(p(1-p) + (1-p)p + p^2) = p/(2 - p)}$.
If $p = 1/2$ then $p/(2- p) = 1/3$.

__Exercise__. _What if $p = 0$ or $p = 1$?_

This assumes the probability of each child being male or female is
independent of the order of having children. This does not hold, e.g.,
in counties where parents kill their first child if it is female.

The assumption of stumbling across a GI Joe, or a Barbie, doll implying one of the
children is or is not male may also not be valid.

Probability Theory can still be applied, it is just a matter of extending
the sample space and finding an appropriate probability measure.

## Random Variable

Random variables are symbols that can be used in place of a number when
manipulating equations and inequalities.
The cumulative distribution function $F$ of the random variable $X$
is $F(x) = P(X \le x)$, the probability $X$ is not greater than $x$.
The cdf tells you everything there is to know about the probability of
the values a random variable can take on.

__Exercise__. _If $P$ is discrete and $X$ is the identity function on $Ω$ then
$P(X \le x) = \sum_{x_j\le x} p_j$_.

Note $F$ is piece-wise constant, non-decreasing, and right-continuous.

__Exercise__. _If $X$ is uniformly distributed on $[0,1)$ then
$F(x) = \max\{0,\min\{1, x\}\}$ for $-\infty < x <  \infty$_.

_Hint_: If $x < 0$ then $F(x) = 0$ and if $x \ge 1$ then $F(x) = 1$.

The mathematical definition of a _random variable_
is an _$\AA$-measurable_ function $X\colon Ω\to\RR$
on a probability space $\langle Ω, P, \AA\rangle$.
The function is $\AA$-measurable if
${\{ω\in Ω\mid X(ω) \le x\}\in\AA}$, $x\in\RR$,
and we write $X\colon\AA\to\RR$.

__Exercise__. _If $\AA$ is finite then $X$ is constant on its atoms._

Note that $X$ _is_ a function on atoms in this case.

The casual definition of 
the cumulative distribution function of a random variable
as $F(x) = P(X\le x)$ being the probability of $X$ being
less than or equal to $x$ leaves out the important problem
of specifying exactly what "probability" means.

The rigorous mathematical definition is
${F_X(x) = P(\{ω\in Ω\mid X(ω) \le x\})}$ where $P$ is a probability measure.
We write $F$ instead of $F_X$ if $X$ is understood.
More generally, given a subset $A\subseteq\mathbf{R}$ the probability that
$X$ takes a value in $A$ is ${P(X\in A) = P(\{ω\in Ω\mid X(ω)\in A\}}$.
The cdf corresponds to $A = (-\infty, x]$.
Two random variables have the same _law_ if they have the same cdf.

__Exercise__. _Show $U$ and $1 - U$ have the same law_.

Note $U \not= 1-U$.

__Exercise__. _If $X$ has cdf $F$, then $F(X)$ and $U$ have the same law_.

_Hint_: If $F(x)$ jumps from $a$ to $b$ at $x = c$ we define $F^{-1}(u) = c$ for $a \le u < b$.

<details><summary>Solution</summary>
$P(F(X) \le x) = P(X\le F^{-1}(x)) = F(F^{-1}(x)) = x$ for $0\le x\le 1$.
</details>

__Exercise__. _If $X$ has cdf $F$, then $X$ and $F^{-1}(U)$ have the same law_.

<details><summary>Solution</summary>
We have $P(F^{-1}(U) \le x) = P(U\le F(x)) = F(x)$ since $0\le F(x)\le 1$.
</details>

This shows a uniformly distributed random variable has sufficient randomness to
generate any random variable. There are no random, random variables.


__Exercise__. _Show $P(a < X \le b) = F(b) - F(a)$_. 

_Hint_: $[-\infty, b) = [-\infty, a) \cup [a, b)$.

Every cdf is non-decreasing, continuous from the right, has left limits, and
$\lim_{x\to-\infty}F(x) = 0$, $\lim_{x\to+\infty}F(x) = 1$.
Any function with these properties is the cdf of a random variable.

__Exercise__: _Show $F(x) \le F(y)$ if $x < y$_.

_Hint_: $(-\infty, x] \subset (-\infty, y]$ if $x < y$ and $P(x < X \le y) \ge 0$.

__Exercise__: _Show $\lim_{y\downarrow x} F(y) = F(x)$_.

_Hint_: $\cap_{n=1}^\infty (-\infty, x + 1/n] = (-\infty, x]$.

__Exercise__: _Show $\lim_{y\uparrow x} F(y) = F(x-)$ exists_.

_Hint_: If $y_n$ is an increasing sequence with limit $x$
then $F(y_n)$ is a non-decreasing sequence bounded by $F(x)$
so $\sup_n F(y_n)$ exists and is not greater than $F(x)$.

__Exercise__. _Show $\lim_{x\to-\infty}F(x) = 0$_.

_Hint_ $\cap_n (-\infty, -n] = \emptyset$.

__Exercise__. _Show $\lim_{x\to\infty}F(x) = 1$_.

_Hint_ $\cup_n (-\infty, n] = (-\infty, \infty)$.

In general $P(X\in A) = \int_A dF(x)$
for sufficiently nice subsets $A\subset\mathbf{R}$ using
[Riemann–Stieltjes](https://mathworld.wolfram.com/StieltjesIntegral.html)
integration.

Define the conditional expectation of the random variable $X$ with respect
to the event $A$ by $E[X\mid A] = E[X 1_A]/P(A)$.  If $X = 1_B$ then
this coincides with the definition of conditional expectation above.

Define the conditional expectation of $X$ with respect to the algebra
$\AA$, $E[X\mid \AA]:\AA\to\mathbf{R}$, by
$E[X\mid \AA](A) = E[X\mid A]$ for $A$ an atom of $\AA$.


## Joint Distribution

Two random variables, $X$ and $Y$, are defined by their _joint
distribution_, $H(x,y) = P(X\le x, Y\le y)$.

__Exercise__. _Show the point $(X,Y)$ is
in the square $(a,b]\times (c,d]$ with probability
${P(a < X \le b, c < Y \le d) = P(X \le b, Y \le d) - P(X \le a) - P(Y \le c) + P(X \le a, Y \le c)}$_.

This allows computing the probability the point belongs to any set that is a countable
union of squares, a _measurable_ set.

__Exercise__.  _All convex sets are measurable_.

In general, the joint distribution of $X_1, \ldots, X_n$ is defined by
${F(x_1,\ldots,x_n) = P(X_1\le x_1, \ldots, X_n\le x_n)}$.
If $A$ is a measurable subset of $\RR^N$ we can use this to compute $P((X_1,\ldots,X_n)\in A)$.

### Independent

The random variables $X$ and $Y$ are _independent_ if $H(x,y) = F(x)G(y)$ for all $x$ and $y$.
This is equivalent to $P(X\in A,Y\in B) = P(X\in A)P(Y\in B)$ for measurable sets $A$ and $B$.

We also have that $E[f(X)g(Y)] = E[f(X)] E[g(Y)]$ for any functions $f$ and $g$ whenever all expected
values exist.

__Exercise__: Prove this for the case $f = \sum_i a_i 1_{A_i}$ and $g = \sum_j b_j 1_{B_j}$.

In general, $X_1$, \ldots, $X_n$ are independent if
$F(x_1,\ldots,x_n) = F_1(x_1)\cdots F_n(x_n)$, where $F_j$ is the law of $X_j$.

### Copula

A _copula_ is the joint distribution of uniformly distributed random variables on the unit interval.
The copula of $X$ and $Y$ is the joint distribution of $F^{-1}(X)$ and $G^{-1}(Y)$ where
$F$ and $G$ are the cumulative distributions of $X$ and $Y$ respectively:
$C(u,v) = C^{X,Y}(u,v) = P(F^{-1}(X) \le u, G^{-1}(Y) \le v)$.

__Exercise__: Show $C(u,v) = H(F(u),G(v))$ where
and $H$ is the joint distribution of $X$ and $Y$ and $F$ and $G$ are the cumulative
distribution of $X$, and $Y$.

__Exercise__: Show $H(x,y) = C(F^{-1}(x), G^{-1}(y))$

This shows how to use the copula and marginal distributions to recover the joint distribution.

An equivalent definition is a copula is a probability measure on $[0,1]^2$ with uniform
marginals. 

__Exercise__: Prove this.

If $U$ and $V$ are independent, uniformly distributed random variables on the unit interval
then $C(u,v) = uv$.

If $V=U$ then their joint distribution is
$C(u,v) = P(U\le u, V\le v) = P(U\le u, U\le v) = P(U\le \min\{u, v\}) = \min\{u,v\} = M(u,v)$.

If $V=1-U$ then their joint distribution is $C(u,v) = P(U\le u, V\le v) = P(U\le u, 1-U\le v)
= P(1-v\le U\le u) = \max\{u - (1 -v), 0\} = \max\{u + v - 1, 0\} = W(u,v)$

__Exercise__: (Fr&#233;chet-Hoeffding) For every copula, $C$, $W \le C \le M$.

Hint: For the upper bound use $H(x,y) \le F(x)$ and $H(x,y) \le G(y)$.
For the lower bound note $0\le C(u_1,v_1) - C(u_1, v_2) - C(u_2, v_1) + C(u_2, v_2)$
for $u_1 \ge u_2$ and $v_1 \ge v_2$.

### Uniform

A _uniformly distributed_ random variable $U$ on $[0,1)$
has cdf $F(x) = x$ if $0\le x\le 1$, $F(x) = 0$ if $x < 0$, and $F(x) = 1$ if $x > 1$.
Given a cdf $F$ we can define a random variable having that law
using the identity function $X\colon\mathbf{R}\to\mathbf{R}$, where $X(x) = x$.
Let $P$ be the probability measure on $\mathbf{R}$ defined by
$P(A) = \int_A dF(x)$. 

### Continuous Random Variable

If the cdf satisfies $F(x) = \int_{-\infty}^x F'(u)\,du$ we say the random variable
is _continuously distributed_. The _density function_ is $f = F'$.
Any function satisfying $f\ge 0$ and $\int_\mathbf{R} f(x)\,dx = 1$
is a density function for a random variable.

__Exercise__. _If $X$ is continuously distributed show
$P(a < X \le b) = P(a \le X \le b) = P(a \le X < b) = P(a \le X \le b)$_.

### Expected Value

The _expected value_ or _mean_ of a random variable is defined by
$μ = E[X] = \int_Ω X\,dP$. It is a measure of the _location_ of $X$.
More generally, the expected value of
a function $f\colon\RR\to\RR$ of
a random variable is $E[f(X)] = \int_Ω f(X)\,dP$
where $f(X)$ is a random variable defined by
$f(X)(ω) = f(X(ω))$, $ω\in Ω$.
The functions $f(x) = x^n$ are used to define moments.

### Moment

The _moments_ of a random variable are $\mu_n = E[X^n]$ where $n$ is a non-negative integer.
The _central moments_ are $\bar{μ}_n = E[(X - E[X])^n]$.
The second central moment is the _variance_ $σ^2 = \Var(X) = E[(X - E[X])^2]$.
The _standard deviation_ $σ$ is a measure of the _spread_ of $X$.

__Exercise__. _Show $\Var(X) = E[X^2] - E[X]^2$_.

Every random variable with non-zero variance can be _standardized_ to
have mean 0 and variance 1.
The _skew_ of a random variable is the third central moment of a standardized random variable.
It is a measure of the lopsidedness of the distribution.

__Exercise__. _If $X$ and $-X$ have the same law then its skew is 0_.

The _kurtosis_ of a random variable is the fourth central moment of a standardized random variable.
It is a measure of how peaked a distribution is.

The _moment generating function_ is $\mu(s) = E[e^{sX}] = \sum_{n=0}^\infty m_n s^n/n!$.
Note $\mu^{(n)}(0) = m_n$ by Taylor's theorem
if $μ$ converges in a neighborhood of $s = 0$.

Moments don't necessarily exist for all $n$, except for $n = 0$.
They also cannot be an arbitrary sequence of values.

Suppose all moments of $X$ exist, then for any complex numbers,
$(c_i)$, ${0 \le E|\sum_i c_i X^i|^2 = E[\sum_{j,k} c_j\bar{c}_k X^{j+k}]
= \sum_{j,k} c_j \bar{c}_k m_{j+k}}$.  This says the Hankel matrix $M =
[m_{j+k}]_{j,k}$ is positive definite.  The converse is also true: if
the Hankel matrix is positive definite there exists a random variable
with the corresponding moments.  This is not a trivial result and the
random variable might not be unique.

<!--
% Dunford Schwartz Volume 2 pg 1251.
% Extending unbounded symmetric operators. Deficiency index.
-->

### Cumulant

The _cumulant_ of $X$ is the natural logarithm of its moment
generating function ${\kappa(s) = \log E[e^sX]}$.

__Exercise__. _Show $κ_X(0) = 0$, $κ_X'(0) = E[X]$, and $κ_X''(0) = \Var(X)$_.

__Exercise__. _Show if $c$ is a constant then $κ_{c + X}(s) = cs + κ_X(s)$_.

__Exercise__. _Show if $c$ is a constant then $κ_{cX}(s) = κ_X(cs)$_.

__Exercise__. _Show if $X$ and $Y$ are independent then $κ_{X + Y}(s) = κ_X(s) + κ_Y(s)$_.

_Hint_. $X$ and $Y$ are _independent_ if and only if $E[f(X)g(Y)] = E[f(X)]E[g(Y)]$
for any functions $f$ and $g$.

The _cumulants_ $(κ_n)$ are the coefficients of the power series expansion
$κ(s) = \sum_{n>0}κ_n s^n/n!$.

__Exercise__. _Show $κ_1 = E[X]$ and $κ_2 = \mathrm{Var}(X)$_.

The third and fourth cumulants are related to skew and kurtosis.
If the variance is 1, then $κ_3$ is the skew and $κ_4$ is the
[excess kurtosis](https://en.wikipedia.org/wiki/Kurtosis#Excess_kurtosis).

__Exercise__. _Show $κ_1(c + X) = c + κ_1(X)$ and  $κ_n(c + X) = κ_n(X)$, $n \ge 2$_.

__Exercise__. _Show $κ_n(cX) = c^n κ_n(X)$, $n\ge 1$.

__Exercise__. _Show if $X$ and $Y$ are independent $κ_n(X + Y) = κ_n(X) + κ_n(Y)$ for all $n$_.

The moments of $X$, $\mu_n = E[X^n]$ are related
to the cumulants via complete Bell polynomials $B_n(κ_1,\ldots,κ_n)$.
$$
	E[e^{sX}] = \sum_{n\ge0} \mu_n s^n/n! = e^{κ(s)} = e^{\sum_{n>0} κ_n s^n/n!}
	= \sum_{n\ge0} B_n(κ_1,\ldots,κ_n) s^n/n!
$$
Taking a derivative with respect to $s$ of the last equality gives the recurrence formula
$$
	B_{n+1}(κ_1,\ldots,κ_{n+1})
		= \sum_{k = 0}^n \binom{n}{k} B_{n - k}(κ_1,\ldots,κ_{n-k})κ_{k + 1}, n > 0.
$$
Note $B_0 = 1$

The cumulants are related to the moments via partial Bell polynomials $B_{n,k}(\mu_1,\ldots,\mu_{n - k - 1})$
$$
	κ_n = \sum_{k=0}^{n-1} (-1)^k k! B_{n,k+1}(\mu_1,\ldots,\mu_{n - k})
$$
where $(B_{n,k})$ are partial Bell polynomials satisfying the recurrence
$B_{0,0} = 1$, $B_{n,0} = 0$ for $n > 0$, $B_{0,k} = 0$ for $k > 0$ and
$$
	B_{n,k}(x_1,\ldots,x_{n - k + 1})
		= \sum_{i=1}^{n-k+1}\binom{n-1}{i - 1} B_{n-i,k-1}(x_1,\ldots,x_{n - i - k + 2})x_i
$$

#### Normal

A _standard normal_ random variable $Z$ has density function $φ(z) = \exp(-z^2/2)/\sqrt{2\pi}$,
$-\infty < z < \infty$.

__Exercise__. _Show $\int_{-\infty}^\infty \exp(-\pi x^2)\,dx = 1$_.

<details><summary>Solution</summary>
Let $I = \int_{-\infty}^\infty \exp(-\pi x^2)\,dx$.
We compute $I^2$ using polar coordinates $x = r\cos\theta$, $y = r\sin\theta$.
Since $dx = -r\sin\theta\,d\theta + \cos\theta\,dr$ and
$dy = r\cos\theta\,d\theta + \sin\theta\,dr$ we have
$$
\begin{aligned}
	dx\,dy &= (-r\sin\theta\,d\theta + \cos\theta\,dr)(r\cos\theta\,d\theta + \sin\theta\,dr) \\
	&= -r\sin\theta\,r\cos\theta\,d\theta\,d\theta
		-r\sin\theta\sin\theta\,d\theta\,dr
		+ \cos\theta\,r\cos\theta\,dr\,d\theta
		+ \cos\theta\sin\theta\,dr\,dr \\
	&= -r\sin^2\theta\,d\theta\,dr + \cos^2\theta\,dr\,d\theta\\
	&= r(\sin^2\theta + \cos^2\theta)\,dr\,d\theta\\
	&= r\,dr\,d\theta\\
\end{aligned}
$$
using $d\theta\,d\theta = 0$, $dr\,dr = 0$, and $d\theta\,dr = -dr\,d\theta$.
$$
\begin{aligned}
I^2 &= \int_{-\infty}^\infty \exp(-\pi x^2)\,dx \int_{-\infty}^\infty \exp(-\pi y^2)\,dy \\
	&= \int_{-\infty}^\infty \int_{-\infty}^\infty \exp(-\pi x^2) \exp(-\pi y^2)\,dx\,dy \\
	&= \int_{-\infty}^\infty \int_{-\infty}^\infty \exp(-\pi x^2 + y^2) \,dx\,dy \\
	&= \int_{0}^{2\pi} \int_{0}^\infty \exp(-\pi r^2) r\,dr\,d\theta \\
	&= \int_{0}^{2\pi} -\exp(-\pi r^2)/2\pi|_0^\infty\,d\theta \\
	&= \int_{0}^{2\pi} 1/2\pi\,d\theta \\
	&= 1 \\
\end{aligned}
$$
</details>

__Exercise__. _Show $\int_{-\infty}^\infty \exp(-\alpha x^2)\,dx = \sqrt{\pi/\alpha}$_.

_Hint_: Use the change of variables $\pi x^2 = \alpha y^2$.

__Exercise__. _Show $\int_{-\infty}^\infty φ(x)\,dx = 1$_.

_Hint_: Use $\alpha = 1/2$.

__Exercise__. _Show the moment generation function of a standard normal is
${μ(s) = E[\exp(s Z)] = e^{s^2/2}}$_.

_Hint_: Complete the square.

<details><summary>Solution</summary>
$$
\begin{aligned}
E[\exp(s Z)] &= \int_{-\infty}^\infty e^{sz} e^{-z^2/2}\,dz/\sqrt{2\pi} \\
	&= e^{s^2/2}\int_{-\infty}^\infty e^{-(z-s)^2/2}\,dz/\sqrt{2\pi} \\
	&= e^{s^2/2}\int_{-\infty}^\infty e^{-z^2/2}\,dz/\sqrt{2\pi} \\
	&= e^{s^2/2} \\
\end{aligned}
$$
</details>

__Exercise__. _Show $E[e^{sZ} f(Z)] = E[e^{sZ}] E[f(Z + s)]$_.

_Hint_: Complete the square.

<details><summary>Solution</summary>
$$
\begin{aligned}
E[\exp(s Z) f(Z)] &= \int_{-\infty}^\infty e^{sz} f(z) e^{-z^2/2}\,dz/\sqrt{2\pi} \\
	&= e^{s^2/2}\int_{-\infty}^\infty f(z) e^{-(z-s)^2/2}\,dz/\sqrt{2\pi} \\
	&= e^{s^2/2}\int_{-\infty}^\infty f(z + s) e^{-z^2/2}\,dz/\sqrt{2\pi} \\
	&= E[e^{sZ}] E[f(Z + s)] \\
\end{aligned}
$$
</details>

The cumulant of a standard normal random variable is $κ(s) = \log μ(s) = s^2/2$.
This shows $Z$ has mean 0 and variance 1.

#### Jointly Normal

If $Z = (Z_1,\ldots,Z_n)$ are independent standard normally distributed random variables
then the joint density function is ${φ_n(z_1,\ldots,z_n) = \prod_{j=1}^n φ(z_j)}$.

__Exercise__. _If $s\in\RR^n$ show $E[\exp(s\cdot Z) f(Z)] = E[\exp(s\cdot Z)] E[f(Z + s)]$_.

_Hint_: Complete the square using $|z - s|^2 = |z|^2 - 2z\cdot s + |s|^2$.

We say $N = (N_1,\ldots,N_n)$ are _jointly normal_ if $a\cdot N$ is normal for every $a\in\RR^n$.
Let $μ = E[N]$ and $Σ = \Var(N) = E[NN'] - E[N]E[N']$.

__Exercise__. _Show $Z = Σ^{-1/2}(N - μ)$ are independent standard normally distributed_.

_Hint_: By joint normality we know $Z$ are normal. Show $E[Z] = 0$ and $\Var(Z) = I$, the $n\times n$
identity matrix.


## Concentration Inequalities

A common problem is determining when a sequence of random variables converges.
Concentration inequalities can be used for that.

__Lemma__. (Chebyshev) _If $f$ is non-negative then $P(f(X) > \lambda) \le E[f(X)]/\lambda$_.

_Proof_. We have $E[f(X)] \ge E[f(X)1(f(X) > \lambda)] \ge \lambda P(f(X) > \lambda)$.

Note this only has import for large $\lambda$.

__Exercise__. _For any non-negative random variable $X$ and any increasing function $\phi$,
$P(X > \lambda) \le E[\phi(X)]/\phi(\lambda)$_.

An immediate corollaries is $P(|X| > \lambda) \le E[|X|]/\lambda$.

__Exercise__. (Markov) _Show $P(|X - E[X]| > \lambda) \le \Var(X)/\lambda^2$_.

_Hint_: $|X - E[X]| > \lambda$ if and only if $|X - E[X]|^2 > \lambda^2$.

### Law of Large Numbers

A _statistic_ is a function of random variables. If $X$ is a random variable
and $(X_j)$ are independent and have
have the same law as $X$ let $S_n = (X_1 + \cdots + X_n)/n$.

__Exercise__. _Show $E[S_n] = E[X]$_.

__Exercise__. _Show $\Var(S_n) \le \Var(X)/n$_.

## Jensen's Inequality

A function $\phi\colon\RR\to\RR$ is _convex_ if $\phi(x) = \sup_{\lambda\le\phi} \lambda(x)$
and _concave_ if $\phi(x) = \inf_{\lambda\ge\phi} \lambda(x)$
where $\lambda$ is linear.

__Exercise__. _If $\phi$ is convex then $\phi(tx + (1 - t)x') \le t\phi(x) + (1 - t)\phi(x')$
if $0\le t\le 1$_.

Hint: $\lambda(x) = \phi(x^*) + m(x - x^*) \le \phi(x)$ where $x^* = t\phi(x) + (1 - t)\phi(x')$
and $m = (\phi(x') - \phi(x))/(x' - x)$.

__Theorem__. _If $\phi$ is convex then $E[\phi(X)] \ge \phi(E[X])$_.

For $\lambda\le\phi$ linear we have $E[\phi(X)] \ge E[\lambda(X)] = \lambda(E[X])$
so $E[\phi(X)] \ge \sup_{\lambda\le\phi}\lambda(E[X]) = \phi(E[X])$.

### Convergence

Random variables $X_n$ converge to $X$ in _mean_ if
$E[|X_n - X|]$ converges to 0. They converges in _mean square_ if
$\Var(X_n - X)$ converges to 0.
They converges _in probability_ if for all $\epsilon > 0$ 
$P(|X_n - X|) > \epsilon)$ converges to 0.
They converge _almost surely_ if $P(\lim_n X_n = X) = 1$.

__Exercise__. _If $X_n$ converges in mean square then it converges in probability_.

Hint: $\phi(x) = x^2$ is increasing for $x > 0$.


<!--

## Examples

See ...

### Uniform

A random variable is uniformly distributed on the interval $[a, b)$ has density function
$f(x) = (x - a)/(b - a)$ if $a \le x \le b$ and $f(x) = 0$ if $x < a$ or $x > b$.

__Exercise__. _Show if $U$ is uniformly distributed on $[0,1]$ then $a(1 - U) + bU$
is uniformly distributed on $[a, b]$_.

### Cantor

Let's define a function on the interval $[0,1]$ as follows.
Every $x\in[0,1]$ can be written $x = \sum_{j>0} x_j/3^j$ where $x_j\in\{0,1,2\}$
The digits $(x_j)$ are the base 3 representaton of $x$. Define $F(x) = ???$

We have $F(0) = 0$, $F(1) = 1$, and $F$ is continuous...

The measure of the set where $F' = 0$ is 1.

### Measurable

A function $X\colon Ω\to\mathbf{R}$ is _measurable_ with respect to the algebra $\AA$
if $\{ω\in Ω : X(ω) \le a\}$ belongs to $\AA$ for all $a\in\mathbf{R}$.

__Exercise__. _Show $X$ is measurable if and only if it is constant on atoms of $\AA$
when the algebra has a finite number of elements._

In this case we can write $X\colon\AA\to\mathbf{R}$ as a function on the
atoms of $\AA$.

!!! use more recent recurrence

%Exercise. (Inclusion-Exclusion principal) Let $S$ be a finite set and
%let $f$ be any function defined on subsets of $S$.
%Define $\phi f(T) = \sum_{U\supseteq T} f(U)$ and
%$\psi g(T) = \sum_{U\supseteq T} (-1)^{|U| - |T|} g(T)$.
%These are both operators from $2^S\to\mathbf{R}$.
%Show $\phi\psi g = g$ and $\psi\phi f = f$.

%Hint: Group the sum by $|Y| - |T|$.

## Joint Distribution

Two random variables, $X$ and $Y$, are defined by their _joint
distribution_, $H(x,y) = P(X\le x, Y\le y)$.  For example, the point $(X,Y)$ is
in the square $(a,b]\times (c,d]$ with probability
$P(a < X \le b, c < Y \le d) = P(X \le b, Y \le d) - P(X \le a) - P(Y \le c) + P(X \le a, Y \le c)$.

The _marginal distbutions_ are $F(x) = H(x,\infty)$ and $G(y) =  H(\infty,y)$,
where $F$ and $G$ are the cumulative distributions of $X$ and $Y$ respectively.

In general, the joint distribution of $X_1$, \ldots, $X_n$ is
$F(x_1,\ldots,x_n) = P(X_1\le x_1,\ldots, X_n\le x_n$).

## Examples

### Discrete

A _discrete_ random variable, $X$, is defined by
$x_i\in\mathbf{R}$ and $p_i > 0$ with $\sum p_i = 1$.
The probability the random variable takes on value $x_i$ is P(X = x_i) = $p_i$.

If a discrete random variable takes on a finite number of values, $n$, then
if $p_i = 1/n$ for all $i$ the variable is called _discrete uniform_.

### Bernoulli

A _Bernoulli_ random variable is a discrete random variable with $P(X = 0) = p$, $P(X = 1) = 1 - p$.

### Binomial

A _Binomial_ random variable is a discrete random variable with
$P(X = k) = \binom{n}{k}p^k(1-p)^{n-k}$, $k = 0$, \ldots, $n$.

### Uniform

A _continuous uniform_ random variable on the interval $[a,b]$ has density
$f(x) = 1_{[a,b]}/(b - a)$.

A _discrete uniform_ random variable on $ Ω = \{x_1,\ldots,x_n\}$
has $P(X = x_j) = 1/n$ for $j = 1,\ldots,n$.

### Normal

The _standard normal_ random variable, $Z$, has density function $\phi(x) = \exp(-x^2/2)/\sqrt{2\pi}$.

If $X$ is normal then $E\exp(N) = \exp(E[N] + \mathrm{Var}(N)/2)$ so the cumulants satisfy
$κ_n = 0$ for $n > 2$.

This follows from 
$$
\begin{aligned}
E[e^N] &= E[e^{\mu + \sigma Z}] \\
       &= \int_{-\infty}^\infty e^{\mu + \sigma z} e^{-z^2/2}\,dz/\sqrt{2\pi}\\
	   &= e^{\mu + \sigma^2/2} \int_{-\infty}^\infty e^{-(z - \sigma)^2/2}\,dz/\sqrt{2\pi}\\
	   &= e^{\mu + \sigma^2/2} \int_{-\infty}^\infty e^{-z^2/2}\,dz/\sqrt{2\pi}\\
	   &= e^{\mu + \sigma^2/2}
\end{aligned}
$$

For any normal random variable, $N$, $E[e^N f(N)] = E[e^N] E[f(N + \mathrm{Var}(N)]$.

__Exercise__. Prove this by first showing $E[e^{\sigma Z} f(Z)] = e^{\sigma^2/2} E[f(Z + \sigma)]$.

If $N$, $N_1$, \ldots, are jointly normal then
$E[e^N f(N_1,\ldots)] = E[e^N] E[f(N_1 + \Cov(N,N_1),\ldots)]$.

### Poisson

A _Poisson_ random variable with parameter $\lambda$ is defined by
$P(X = k) = e^{-\lambda}\lambda^k/k!$ for $k = 0, 1, \ldots$.

If $X$ is Poisson with parameter $\lambda$ then 
$$
\begin{aligned}
Ee^{sX} &= \sum_{k=0}^\infty e^{sk} e^{-\lambda}\lambda^k/k!\\
        &= \sum_{k=0}^\infty  (e^s\lambda)^ke^{-\lambda}/k!\\
		&= \exp(\lambda(e^s - 1))
\end{aligned}
$$
so $κ(s) = \lambda(e^s - 1)$ and $κ_n = \lambda$ for all $n$.

### Infinitely Divisible

A random variable, $X$, is _infinitely divisible_ if for any positive integer, $n$,
there exist independent, identically distributed random variables $X_1$,\ldots,$X_n$
such that $X_1 + \cdots + X_n$ has the same law as $X$.

A theorem of Kolmogorov states for every infinitely divisible random variable the exists
a number $\gamma$ and a non-decreasing function $G$ with

$$
κ(s) = \log E e^{sX} = \gamma s + \int_{-\infty}^\infty K_s(x)\,dG(x),
$$

where $K_s(x) = (e^{sx} - 1 - sx)/x^2 = \sum_{n=2}^\infty x^{n-2}s^n/n!$.
Note if $G(x) = 1_{(-\infty,0]}$ then $κ(s) = \gamma s + K_s(0) = \gamma s + s^2/2$
so the random variable is normal.

Note the cumulants of the random variable are $κ_1 = \gamma$ and
$κ_n = \int_{-\infty}^\infty x^{n - 2}\,dG(x)$ for $n \ge 2$.

If $G(x) = a^2 1_{(-\infty,a]}$ for $a\not=0$ then
$$
\begin{aligned}
κ(s) &= \gamma s + a^2 K_s(a)\\ 
          &= \gamma s + a^2 \sum_{n=2}^\infty a^{n-2}s^n/n!\\ 
          &= \gamma s + \sum_{n=2}^\infty a^n s^n/n!\\ 
          &= \gamma s - as + \sum_{n=1}^\infty a^n s^n/n!\\ 
          &= (\gamma - a)s + \sum_{n=1}^\infty a^n s^n/n!\\ 
\end{aligned}
$$

so the random variable is Poisson with parameter $a$ plus the constant $\gamma - a$.

This theorem states every infinitely divisible random variable can be
approximated by a normal plus a linear combination of independent Poisson
random variables.

If $X = \mu + \sigma Z + \sum_j \alpha_j a_j^2 P_j$ where $P_j$ is Poisson
with parameter $a_j$, then
$$
κ(s) = \mu s + \sigma s^2/2 + \sum_j \alpha_j (e^{a_j s} - 1) - \alpha_j s
$$


## Unsorted

### Characteristic Function

The _characteristic function_ of a random variable, $X$, is $\xi(t) = κ(it)$.

### Fourier Transform

The _Fourier transform_ is $\psi(t) = \xi(-t) = κ(-it)$.
Clearly $\psi(t) = \xi(-t)$.


## Remarks

Cheval de Mere

Pascal

Bernoulli(s)

Kolmogorov

Willy Feller

These can be used to prove the _central limit theorem_:
if $X_j$ are independent, identically distributed random variables with mean zero
and variance one, then $(X_1 + \cdots X_n)/sqrt{n}$ converges to a standard
normal random variable.

Probability and Logic (Ramsey)

Littlewood's law P(miracle) is large. 1 event per second, 1/10^6 are miracles, 8 hour days.

Birthday problem.

UUIDs

## Partition

A _partition_ of a set $ Ω$ is a collection of subsets (events)
that are _pairwise disjoint_ with union $ Ω$.
A partition $\AA = \{A_i\}_{i\in I}$ satisfies $A_i\subseteq Ω$ for all $i\in I$,
$A_i\cap A_j = \emptyset$ if $i \not= j$, and $\cup_{i\in I} A_i =  Ω$.
The elements $A_i$ of the partition $\AA$ are called _atoms_.

__Exercise__. _If $\{A_i\}$ are pairwise disjoint show $A_i\cap A_j\cap
A_k = \emptyset$ if $i$, $j$, and $k$ are distinct._

__Exercise__. _If $\{A_i\}$ are pairwise disjoint show $A_i\cap A_j\cap
A_k = \emptyset$ if $i$, $j$, and $k$ are not all the same._

__Exercise__. _If $\{A_i\}$ are pairwise disjoint show $\cap_{j\in J}A_j =
\emptyset$ if $J\subseteq I$ has at least two elements._

Partitions represent partial information. 
Complete information means knowing what outcome $ω\in Ω$ occured.
This corresponds to the _finest_ partition consisting of singletons
$\{\{ω\}:ω\in Ω\}$.  Complete lack of information
corresponds to the _coarsest_ partion consisting of one set $\{ Ω\}$.
Partial information correponds to knowing what atom of a partition $ω$ belongs to.

Partitions have a _partial ordering_ where $\AA\preceq\mathcal{B}$ indicates
every atom of $\AA$ is a union of atoms in $\mathcal{B}$. In this case we say
$\mathcal{B}$ is a _refinement_ of $\AA$ and $\mathcal{B}$ is _finer_ than $\AA$
or $\AA$ is _coarser_ than $\mathcal{B}$.

Recall a partial ordering is _reflexive_: $\AA\preceq\AA$ and
_transitive_:$\AA\preceq\mathcal{B}$ and $\mathcal{B}\preceq\mathcal{C}$
imply $\AA\preceq\mathcal{C}$ for $A,B,C\subseteq Ω$.

__Exercise__. _Show refinement is a partial ordering._

### Algebra of Sets

More advanced texts use an _algebra_ of sets instead of a partition.
An algebra of sets is a collection of subsets closed under complement and union
that also contains the empty set.

Since algebras are closed under complement $ Ω = \emptyset' =
 Ω\setminus\emptyset$
is also in the algebra.

By [De Morgan's Laws](https://en.wikipedia.org/wiki/De_Morgan's_laws)
an algebra is also closed under intersection since
$A\cap B = (A'\cup B')'$.

If $E$ and $F$ are elements of an algebra we can use plain English to
talk about 'not $E$' ($E'=  Ω\setminus E$), '$E$ or $F$' ($E\cup F$), and
'$E$ and $F$' ($E\cap F$). The phrases '$E$ implies $F$' and 'if $E$ then $F$'
correspond to $E\subseteq F$.

An _atom_ of an algebra $\AA$ is an element $A\in\AA$ with
the property $B\subseteq A$ and $B\in\AA$ imply $B = \emptyset$
or $B = A$.

__Exercise__. _If an algebra is finite its atoms form a partition._

_Hint_: Show $A_ω = \cap\{B\in\AA:ω\in B\}$ is an atom for all $ω\in Ω$. 

If $\AA$ is infinite then there is no guarantee the intersection above is still
in $\AA$. A _countably addititve measure_ guarantees the algebra is closed under
countable unions (and hence countable intersections) and $P(\cup_i E_i) = \sum_i P(E_i)$ if
$(E_i)_{i\in\mathbf{N}}$ are pairwise disjoint. These conditions are required to prove
_limit theorems_ about measures.

For example, The Borel-Cantelli lemma states that if $\sum_i P(E_i) <
\infty$ for any countable collection of events $(E_i)_{i\in\mathbf{N}}$
then none of the events can occur _infinitely often_. The outcome $ω$ occurs
after $k$ if $ω\in\cup_{k > n} E_k$. If an outcome occurs a finite number
of times then $ω\not\in\cup_{k > n} E_k$ for sufficiently large $k$.
If the outcome occurs in an infinite number of events then
$ω\in\cap_n \cup_{k > n} E_k$ and we say $ω$ occurs _infinitely often_.
For any $\epsilon > 0$ there exists $n$ such that $\sum_{k > n} P(E_k) < \epsilon$
since the infinite sum converges to a finite value. 

## Monte Hall Problem

PGN PNG GPN GNP NPG NGB

-->

## Unsorted

The traditional‘frequentist’ methods which
 use only sampling distributions are usable and useful in many particularly simple, idealized
 problems; however, they represent the most proscribed special cases of probability theory,
 because they presuppose conditions (independent repetitions of a ‘random experiment’ but
 no relevant prior information) that are hardly ever met in real problems. This approach is
 quite inadequate for the current needs of science.

### Conditional

For a probability measure $P$ on $\Omega$,
the _conditional probability_ of $A$ _given_ $B$ is $P(A|B) = P(AB)/P(B)$, $A,B\subseteq\Omega$.

__Exercise__. _Show $P(B|B) = 1$ and $P(A|\Omega) = A$_.

__Exercise__. _Show $A\mapsto P(A|B)$ is a probability measure on $B$_.

_Hint_: Show $P(A\cup A'|B) = P(A|B) + P(A'|B) - P(AA'|B)$.

### Estimation

Given $\langle \Omega, P\rangle$, $X\colon\Omega\to\RR$,
$P(X\le x) = F_\theta(x)$ for some $\theta\in\Theta$.

Given (independent) observations $x_1, \ldots, x_n$ estimate $\theta$.

Define $P^n$ on $\Omega^n$ by $P^n(A_1\times\cdots\times A_n) = P(A_1)\cdots P(A_n)$ for $A_j\subseteq\Omega$
and $\bm{X} = (X_1,\ldots,X_n)\colon\Omega^n\to\RR^n$ by
$\bm{X}(\omega_1,\ldots,\omega_n) = (X_1(\omega_1),\ldots,X_n(\omega_n))$.

#### Bernoulli

$P(X = 0) = 1 - p$, $P(X = 1) = p$ so
$P(X = x) = p^x (1 - p)^{1 - x}$, $x\in\{0,1\}$.

$E[X^n] = p$ for all $n > 0$ since $X^n = X$..

$\mu(s) = E[\exp(sX)] = 1 - p + e^s p = 1 + (e^s - 1)p$

$W_n = X_1 + \cdots X_n$

$Y = (X - p)/p(1 - p)$ has mean 0 and variance 1.

$E[\exp(s(a + bX))] = \exp(as)\mu(bs))$

$E[\exp(sY)] = \exp(-s/(1-p))(1 - p + e^{s/p(1 - p)} p)$

$p = 1/2$, $E[\exp(sY)] = e^{-2s}(1/2 + e^{4s}/2) = \cosh(2s)$.

$V_n = (Y_1 + \cdots + Y_n)/\sqrt{n}$.

$E[e^{sV_n} = \Pi E[e^{sY_n/sqrt{n}] = ?$ 

$e^{as}e^{bs} = e^{(a + b)s}$

$V_n = Y_1 + \cdots + Y_n$.

$\kappa(s) = \log(1 + (e^s - 1)p)$.

$\kappa'(s) = e^sp/(1 + (e^s - 1)p)$ so $\kappa'(0) = p$

$\kappa''(s) = ((1 + (e^s - 1)p)e^sp - e^sp e^sp )/(1 + (e^s - 1)p)^2
= ((1 + (e^s - 1)p - e^sp))e^sp/()^2$
$ so $\kappa'(0) = p$

Let $p$ be a random varialble with $P(p = p_j) = q_j$.

$P(X = x) = \sum_j P(X = x|p = p_j) q_j = \sum_j p_j^x (1 - p_j)^{1 - x}q_j$

$P(p = p_j|X_0 = x_0) = P(p = p_j) P(X_0 = x_0|p = p_j)/P(X_0 = x_0)$ so
$$
P(p = p_j|X_0 = x_0) = q_j \frac{p_j^{x_0}(1 - p_j)^{1 - x_0}}{\sum_k p_k^{x_0} (1 - p_k)^{1 - {x_0}}q_k}
$$
and
$$
P(p = p_j|X_0 = 0) = q_j\frac{1 - p_j}{\sum_k (1 - p_k) q_k}
$$
and
$$
P(p = p_j|X_0 = 1) = q_j\frac{p_j}{\sum_k p_k q_k}
$$

Suppose a uniform discrete prior $p_j = j/n$, $0\le j\le n$, and $q_j = 1/(n + 1)$.

$P(X = x) = \sum_j (j/n)^x (1 - j/n)^{1 - x}/(n + 1)$.

$P(X = 0) = \sum_j (1 - j/n)/(n + 1)$.

$P(X = 1) = \sum_j j/n/(n + 1) = n(n+1)/2 n(n+1) = 1/2 = 1 - P(X = 0)$.

$$
P(p = p_j|X_0 = 0) = 2q_j(1 - 1/(n+1))
$$
and
$$
P(p = p_j|X_0 = 1) = 2q_j/(n+1)
$$

## Timeline

Gerolamo Cardano (1501–-1576) Liber de ludo aleae ("Book on Games of Chance"),
First systematic treatment of probability, as well as a section on effective cheating methods.
Binomial theorem. Negative numbers.

Pierre de Fermat (1607-–1665)

Blaise Pascal (1623-–1662)

Sir Isaac Newton (1642–-1726) 

Gottfried Wilhelm Leibniz (1646--1716) 

Jacob Bernoulli (1654–-1705; also known as James or Jacques)
Bernoulli numbers, _Ars Conjectandi_.

Nicolaus I Bernoulli (1687–-1759; son of Jacob's brother Nicklaus)
Curves, differential equations, and probability; originator of the St. Petersburg paradox

Daniel Bernoulli (1700–-1782; son of Jacob's brother Johann)
Bernoulli's principle,  expected utility for resolving the St. Petersburg paradox

Leonhard Euler (1707-–1783)

Johann Carl Friedrich Gauss (1777--1855)
