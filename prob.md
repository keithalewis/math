---
title: Probability
author: Keith A. Lewis
institution: KALX, LLC
email: kal@kalx.net
classoption: fleqn
fleqn: true
abstract: Random Variables
...

\newcommand\RR{\bm{R}}
\newcommand{\Var}{\operatorname{Var}}

# Probability Theory

A _random variable_ is a function on a _probability space_.  A probability
space is a set of _outcomes_, $\Omega$, and a set function $P$ from
_events_, subsets of $\Omega$, to numbers between 0 and 1 that satisfies
$P(E\cup F) = P(E) + P(F) - P(E\cap F)$ for $E,F\subseteq\Omega$
and $P(\emptyset) = 0$.

## Measure

A _measure_ is a set function on subets of $S$ taking values in the real numbers
$\mu\colon\mathcal{P}(S)\to\RR$ that satisfies
$\mu(E\cup F) = \mu(E) + \mu(F) - \mu(E\cap F)$ for $E,F\subseteq\Omega$
and $\mu(\emptyset) = 0$ where $\mathcal{P}(S) = \{E\subseteq S\}$
is the set of all subsets of $S$.

Measures don't count things twice and the measure of
nothing is 0.

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
$\|\mu\| = \sup_{(E_j)} \sum_j |\mu(E_j)|$ where $(E_j)$
is any finite collection of pairwise disjoint subsets of $S$.

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

> Since $f_n(x)$ is Cauchy so it has a limit $f(x)$.
The sequence $\|f_n\|$ is also Cauchy so it too has a limit
that is an upper bound for $|f(x)]$, $x\in S$.
</details>

The (vector space) dual of $B(S)$ is $ba(S).
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
$\lim_n \int_S f_n\,d\mu = \int f\,d\mu$.'

The product of a function and a measure is a measure defined by
$\langle f,g\mu\rangle = \langle fg,\mu\rangle$. Given measures $\mu,\nu\in ba(S)$
we say $g$ is the _Radon-Nikodym derivative_ of $\nu$ with respect to $\mu$ if $g\mu = \nu$.

## Probability Measure

A _probability measure_ is a measure taking values in the interval $[0,1]$.

If $\Omega$ is finite we can define a probability measure by specifying
$p_\omega = P(\{\omega\})$ for $\omega\in\Omega$. Note $p_\omega\ge
0$ and $\sum_{\omega\in\Omega} = 1$.  The probability of the event
$E\subseteq\Omega$ is $P(E) = \sum_{\omega\in E} p_\omega$.

### Partition

A _partition_ splits a sample space into disjoint subsets with union
equal to the sample space. Partitions are how _partial information_
is represented.  The elements of the partition are called _atoms_. The
way they represent partial information is you only know what atom an
outcome belongs to, not the exact outcome.

Partitions define an _equivalence relation_ on outcomes. We say $\omega\sim\omega'$
if and only if they belong to the same atom.

__Exercise__. _Show $\omega\sim\omega$, $\omega\sim\omega'$ implies $\omega'\sim\omega$,
and $\omega\sim\omega'$, $\omega'\sim\omega''$ implies $\omega\sim\omega''$_.

This is the definition of an equivalence relation. It is the mathematical way
of saying two things are the "same" even if they are not equal.

An _algebra_ of sets on $\Omega$ is a collection of subsets of $\Omega$
that contains the empty set and is closed under complement and finite
union. Closure under complements imples $\Omega$ belongs to the algebra
and De Morgan's Laws imply it is also close under finite intersection.

An element $A\subseteq S$ is an _atom_ of the algebra if $B\subseteq A$ and
$B$ in the algebra imply $B$ is either the empty set or equals $A$.

__Exercise__. _If an algebra is finite its atoms form a partition and the
smallest algebra containing the partition is equal to the algebra_.

A function is _measurable_ with respect to an algebra if the preimage
of every interval belongs to the algebra.

__Exercise__. _If an algebra is finite then a function is measurable if and
only if it is constant on atoms_.

In this case, it is a function on the atoms of the algebra.

## Random Variable

A _random variable_ is a symbol that can be used in place of a number when
manipulating equations and inequalities with with additional information
about the probability of the values it can take on.

The mathematical definition of a random variable is
a function $X\colon\Omega\to\mathbf{R}$. Its _cumulative
distribution function_ is $F(x) = P(X\le x) = P(\{\omega\in\Omega\mid X(\omega) \le x\})$.
More generally, given a subset $A\subseteq\mathbf{R}$ the probability that
$X$ takes a value in $X$ is $P(X\in A) = P(\{\omega\in\Omega\}\mid X(\omega\in A))\}$.

Two random variables have the same _law_ if they have the same cdf.

The cdf tells you everything there is to know about the probability of
the values the random variable can take on. For example, $P(a < X \le b) = F(b) - F(a)$. 

__Exercise__. _Show $P(a\le X\le b) = \lim_{x\uparrow a} F(b) - F(x)$_.

_Hint_: $[a,b] = \cap_n (a - 1/n, b]$.

In general $P(X\in A) = \int_A dF(x)$
for sufficiently nice subsets $A\subset\mathbf{R}$ where we are using
[Riemann–Stieltjes](https://mathworld.wolfram.com/StieltjesIntegral.html)
integration.

__Exercise__: _Show for any cumulative distribution function $F$ that
$F(x) \le F(y)$ if $x < y$, $\lim_{x\to -\infty} F(x) = 0$,
$\lim_{x\to\infty} F(x) = 1$, and $F$ is right continuous with left limits_.

_Hint_: For right continuity use $(-\infty, x] = \cap_n (-\infty, x + 1/n]$.

The cdf $F(x) = \max\{0,\min\{1,x\}\}$ defines the uniformly distributed
random variable, $U$, on the interval $[0,1]$.  For $0\le a < b\le 1$,
$P(a < U \le b) = P(U\in (a,b]) = b - a$ and $P(U < 0) = 0 = P(U > 1)$.

__Exercise__. _If $X$ has cdf $F$, then $X$ and $F^{-1}(U)$ have the same law_.

__Exercise__. _If $X$ has cdf $F$, then $F(X)$ and $U$ have the same law_.

This shows a uniformly distributed random variable has sufficient randomness to
generate any random variable. There are no random, random variables.

Given a cdf $F$ we can define a random variable having that distribution 
using the identity function $X\colon\mathbf{R}\to\mathbf{R}$, where $X(x) = x$.
Let $P$ be the probability measure on $\mathbf{R}$ defined by
$P(A) = \int_A dF(x)$. 

The mathematical definition is more flexible than defining a random variable by its
cumulative distribution function.

### Continuous Random Variable

If $F(x) = \int_{-\infty}^x F'(u)\,du$ we say the random variable
is _continuously distributed_. The _density function_ is
$f = F'$.
Any function satisfying $f\ge 0$ and $\int_\mathbf{R} f(x)\,dx = 1$ is a density function
for a random variable.

### Discrete Random Variable

If $dF = \sum_{\omega\in\Omega} p_\omega \delta_\omega$ where $\Omega\subseteq\mathbf{R}$ is countable
we say the random variable is _discretely distributed_. Here $\delta_\omega$ is the _delta function_
with unit mass at $\omega$ defined by $\int_{\mathbf{R}} f(x) \delta_\omega\,dx = f(\omega)$
when $f$ is continuous at $\omega$.

__Exercise__. _Show if $H_\omega(x) = 0$ for $\omega < x$ and $H_\omega(x) = 1$ for $\omega\ge x$
then $f(\omega) = \int_{\mathbf{R}} f(x)\,dH_\omega(x)$ when $f$ is continuous_.

Using this more precise notation, $F = \sum_{\omega\in\Omega} p_\omega H_\omega$.

### Expected Value

The _expected value_ of a random variable is defined by
$E[X] = \int_\Omega X\,dP$. More generally, the expected value of
any function $f\colon\RR\to\RR$ of
a random variable is $E[f(X)] = \int_\Omega f(X)\,dP$
where $f(X)\colon\Omega\to\RR$ via $f(X)(\omega) = f(X(\omega))$, $\omega\in\Omega$.

The _moments_ of a random variable are $m_n = E[X^n]$ where $n$ is a positive integer.
The _moment generating function_ is $M(s) = E[e^{sX}] = \sum_{n=0}^\infty m_n s^n/n!$.
Its natural logarithm is the _cumulant_ $\kappa(s) = \log E[e^sX]$.

The _variance_ of the random variable $X$ is $\Var(X) = E[(X - E[X])^2]= E[X^2] - E[X]^2$.

__Exercise__. _Show $\kappa'(0) = E[X]$ and $\kappa''(0) = \Var(X)$_.

__Lemma__. (Chebyshev) _If $f$ is non-negative then $P(f(X) > \lambda) \le E[f(X)]/\lambda$_.

_Proof_. We have $E[f(X)] \le E[f(X)1(f(X) > \lambda) \le \lambda P(f(X) > \lambda)$.

An immediate corollaries are $P(X > \lambda) \le E[|X|]/\lambda$ and
$P(|X - E[X]| > \lambda) \le \mathrm{Var}(X)/\lambda^2$.

## Joint Distribution

Two random variables, $X$ and $Y$, are defined by their _joint
distribution_, $H(x,y) = P(X\le x, Y\le y)$.  For example, the point $(X,Y)$ is
in the square $(a,b]\times (c,d]$ with probability
$P(a < X \le b, c < Y \le d) = P(X \le b, Y \le d) - P(X \le a) - P(Y \le c) + P(X \le a, Y \le c)$.

The _marginal distbutions_ are $F(x) = H(x,\infty)$ and $G(y) =  H(\infty,y)$,
where $F$ and $G$ are the cumulative distributions of $X$ and $Y$ respectively.

In general, the joint distribution of $X_1$, \ldots, $X_n$ is
$F(x_1,\ldots,x_n) = P(X_1\le x_1,\ldots, X_n\le x_n$).



<!--

## Examples

See ...

### Uniform

A random variable is uniformly distributed on the interval $[a, b]$ has density function
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

A function $X\colon\Omega\to\mathbf{R}$ is _measurable_ with respect to the algebra $\mathcal{A}$
if $\{\omega\in\Omega : X(\omega) \le a\}$ belongs to $\mathcal{A}$ for all $a\in\mathbf{R}$.

__Exercise__. _Show $X$ is measurable if and only if it is constant on atoms of $\mathcal{A}$
when the algebra has a finite number of elements._

In this case we can write $X\colon\mathcal{A}\to\mathbf{R}$ as a function on the
atoms of $\mathcal{A}$.

### Moments

The _moments_ of a random variable, $X$, are $m_n = E[X^n]$, $n = 0,1,2,\ldots$.
They don't necessarily exist for all $n$, except for $n = 0$.
They also cannot be an arbitrary sequence of values.

Suppose all moments of $X$ exist, then for any complex numbers,
$(c_i)$, $0 \le E|\sum_i c_i X^i|^2 = E\sum_{j,k} c_j\bar{c_k} X^{j+k}
= \sum_{j,k} c_j \bar{c_k} m_{j+k}$.  This says the Hankel matrix, $M =
[m_{j+k}]_{j,k}$, is positive definite.  The converse is also true: if
the Hankel matrix is positive definite there exists a random variable
with the corresponding moments.  This is not a trivial result and the
random variable might not be unique.

% Dunford Schwartz Volume 2 pg 1251.
% Extending unbounded symmetric operators. Deficiency index.
 
### Cumulant

The _cumulant_ of the random variable $X$ is $κ(s) = κ_X(s) = \log E\exp(sX)$.

__Exercise__. _Show $κ_X(0) = 0$, $κ_X'(0) = E[X]$, and $κ_X''(0) = \Var(X)$_.

__Exercise__. _Show if $c$ is a constant then $κ_{c + X}(s) = cs + κ_X(s)$_.

__Exercise__. _Show if $c$ is a constant then $κ_{cX}(s) = κ_X(cs)$_.

__Exercise__. _Show if $X$ and $Y$ are independent then $κ_{X + Y}(s) = κ_X(s) + κ_Y(s)$_.

The _cumulants_ $(κ_n)$ are the coefficients of the power series expansion
$κ(s) = \sum_{n>0}κ_n s^n/n!$.

__Exercise__. _Show $κ_1 = E[X]$ and $κ_2 = \mathrm{Var}(X)$_.

The third and fourth cumulants are related to skew and kurtosis.
If the variance is 1, then $κ_3$ is the skew and $κ_4$ is the
[excess kurtosis](https://en.wikipedia.org/wiki/Kurtosis#Excess_kurtosis).

__Exercise__. _Show $κ_1(c + X) = c + κ_1(X)$ and  $κ_n(c + X) = κ_n(X)$, $n \ge 2$_.

__Exercise__. _Show $κ_n(cX) = c^n κ_n(X)$ for all $n$_, $n\ge 1$.

__Exercise__. _Show if $X$ and $Y$ are independent $κ_n(X + Y) = κ_n(X) + κ_n(Y)$ for all $n$_.

The _moments_ of $X$, $\mu_n = E[X^n]$ are related
to the cumulants via complete Bell polynomials $B_n(κ_1,\ldots,κ_n)$.
$$
	E[e^{sX}] = \sum_{n\ge0} \mu_n s^n/n! = e^{κ(s)} = e^{\sum_{n>0} κ_n s^n/n!}
	= \sum_{n\ge0} B_n(κ_1,\ldots,κ_n) s^n/n!
$$
Taking a derivative with respect to $s$ of the last equality gives the recurrence formula
$$
	B_0 = 1, B_{n+1}(κ_1,\ldots,κ_{n+1})
		= \sum_{k = 0}^n \binom{n}{k} B_{n - k}(κ_1,\ldots,κ_{n-k})κ_{k + 1}, n > 0.
$$

The cumulants are related to the moments via partial Bell polynomials $B_{n,k}(\mu_1,\ldots,\mu_{n - k - 1}$
$$
	κ_n = \sum_{k=0}^{n-1} (-1)^k k! B_{n,k+1}(\mu_1,\ldots,\mu_{n - k})
$$
where $(B_{n,k})$ are partial Bell polynomials satisfying the recurrence
$B_{0,0} = 1$, $B_{n,0} = 0$ for $n > 0$, $B_{0,k} = 0$ for $k > 0$ and
$$
	B_{n,k}(x_1,\ldots,x_{n - k + 1})
		= \sum_{i=1}^{n-k+1}\binom{n-1}{i - 1} B_{n-i,k-1}(x_1,\ldots,x_{n - i - k + 2})x_i
$$

!!! use more recent recurrence

%Exercise. (Inclusion-Exclusion principal) Let $S$ be a finite set and
%let $f$ be any function defined on subsets of $S$.
%Define $\phi f(T) = \sum_{U\supseteq T} f(U)$ and
%$\psi g(T) = \sum_{U\supseteq T} (-1)^{|U| - |T|} g(T)$.
%These are both operators from $2^S\to\mathbf{R}$.
%Show $\phi\psi g = g$ and $\psi\phi f = f$.

%Hint: Group the sum by $|Y| - |T|$.

## Conditional Expectation

The _conditional expectation_ of an event $B$ given an event $A$ is
$P(B|A) = P(B\cap A)/P(A)$. In some sense, this reduces the sample space to $A$
since $P(A|A) = 1$ and $P(B\cup C|A) = P(B|A) + P(C|A) - P(B\cap C|A)$.
We also have $P(A|B) = P(A\cap B)/P(B)$ so $P(A|B) = P(B|A)P(A)/P(B)$. 
This is the simplest form of Bayes Theorem. It shows how to update your degree
of belief based on new information. Every probability is conditional on information.

Define the conditional expectation of the random variable $X$ with respect
to the event $A$ by $E[X|A] = E[X 1_A]/P(A)$.  If $X = 1_B$ then
this coincides with the definition of conditional expectation above.

Define the conditional expectation of $X$ with respect to the algebra
$\mathcal{A}$, $E[X|\mathcal{A}]:\mathcal{A}\to\mathbf{R}$, by
$E[X|\mathcal{A}](A) = E[X|A]$ for $A$ an atom of $\mathcal{A}$.

## Joint Distribution

Two random variables, $X$ and $Y$, are defined by their _joint
distribution_, $H(x,y) = P(X\le x, Y\le y)$.  For example, the point $(X,Y)$ is
in the square $(a,b]\times (c,d]$ with probability
$P(a < X \le b, c < Y \le d) = P(X \le b, Y \le d) - P(X \le a) - P(Y \le c) + P(X \le a, Y \le c)$.

The _marginal distbutions_ are $F(x) = H(x,\infty)$ and $G(y) =  H(\infty,y)$,
where $F$ and $G$ are the cumulative distributions of $X$ and $Y$ respectively.

In general, the joint distribution of $X_1$, \ldots, $X_n$ is
$F(x_1,\ldots,x_n) = P(X_1\le x_1,\ldots, X_n\le x_n$).

## Independent

The random variables $X$ and $Y$ are _independent_ if $H(x,y) = F(x)G(y)$ for all $x$ and $y$.
This is equivalent to $P(X\in A,Y\in B) = P(X\in A)P(Y\in B)$ for any sets $A$ and $B$.

We also have that $Ef(X)g(Y) = Ef(X) Eg(Y)$ for any functions $f$ and $g$ whenever all expected
values exist.

__Exercise__: Prove this for the case $f = \sum_i a_i 1_{A_i}$ and $g = \sum_j b_j 1_{B_j}$.

In general, $X_1$, \ldots, $X_n$ are independent if
$F(x_1,\ldots,x_n) = F_1(x_1)\cdots F_n(x_n)$, where $F_j$ is the law of $X_j$.

## Copula

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

A _discrete uniform_ random variable on $\Omega = \{x_1,\ldots,x_n\}$
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

A _partition_ of a set $\Omega$ is a collection of subsets (events)
that are _pairwise disjoint_ with union $\Omega$.
A partition $\mathcal{A} = \{A_i\}_{i\in I}$ satisfies $A_i\subseteq\Omega$ for all $i\in I$,
$A_i\cap A_j = \emptyset$ if $i \not= j$, and $\cup_{i\in I} A_i = \Omega$.
The elements $A_i$ of the partition $\mathcal{A}$ are called _atoms_.

__Exercise__. _If $\{A_i\}$ are pairwise disjoint show $A_i\cap A_j\cap
A_k = \emptyset$ if $i$, $j$, and $k$ are distinct._

__Exercise__. _If $\{A_i\}$ are pairwise disjoint show $A_i\cap A_j\cap
A_k = \emptyset$ if $i$, $j$, and $k$ are not all the same._

__Exercise__. _If $\{A_i\}$ are pairwise disjoint show $\cap_{j\in J}A_j =
\emptyset$ if $J\subseteq I$ has at least two elements._

Partitions represent partial information. 
Complete information means knowing what outcome $\omega\in\Omega$ occured.
This corresponds to the _finest_ partition consisting of singletons
$\{\{\omega\}:\omega\in\Omega\}$.  Complete lack of information
corresponds to the _coarsest_ partion consisting of one set $\{\Omega\}$.
Partial information correponds to knowing what atom of a partition $\omega$ belongs to.

Partitions have a _partial ordering_ where $\mathcal{A}\preceq\mathcal{B}$ indicates
every atom of $\mathcal{A}$ is a union of atoms in $\mathcal{B}$. In this case we say
$\mathcal{B}$ is a _refinement_ of $\mathcal{A}$ and $\mathcal{B}$ is _finer_ than $\mathcal{A}$
or $\mathcal{A}$ is _coarser_ than $\mathcal{B}$.

Recall a partial ordering is _reflexive_: $\mathcal{A}\preceq\mathcal{A}$ and
_transitive_:$\mathcal{A}\preceq\mathcal{B}$ and $\mathcal{B}\preceq\mathcal{C}$
imply $\mathcal{A}\preceq\mathcal{C}$ for $A,B,C\subseteq\Omega$.

__Exercise__. _Show refinement is a partial ordering._

### Algebra of Sets

More advanced texts use an _algebra_ of sets instead of a partition.
An algebra of sets is a collection of subsets closed under complement and union
that also contains the empty set.

Since algebras are closed under complement $\Omega = \emptyset' =
\Omega\setminus\emptyset$
is also in the algebra.

By [De Morgan's Laws](https://en.wikipedia.org/wiki/De_Morgan's_laws)
an algebra is also closed under intersection since
$A\cap B = (A'\cup B')'$.

If $E$ and $F$ are elements of an algebra we can use plain English to
talk about 'not $E$' ($E'= \Omega\setminus E$), '$E$ or $F$' ($E\cup F$), and
'$E$ and $F$' ($E\cap F$). The phrases '$E$ implies $F$' and 'if $E$ then $F$'
correspond to $E\subseteq F$.

An _atom_ of an algebra $\mathcal{A}$ is an element $A\in\mathcal{A}$ with
the property $B\subseteq A$ and $B\in\mathcal{A}$ imply $B = \emptyset$
or $B = A$.

__Exercise__. _If an algebra is finite its atoms form a partition._

_Hint_: Show $A_\omega = \cap\{B\in\mathcal{A}:\omega\in B\}$ is an atom for all $\omega\in\Omega$. 

If $\mathcal{A}$ is infinite then there is no guarantee the intersection above is still
in $\mathcal{A}$. A _countably addititve measure_ guarantees the algebra is closed under
countable unions (and hence countable intersections) and $P(\cup_i E_i) = \sum_i P(E_i)$ if
$(E_i)_{i\in\mathbf{N}}$ are pairwise disjoint. These conditions are required to prove
_limit theorems_ about measures.

For example, The Borel-Cantelli lemma states that if $\sum_i P(E_i) <
\infty$ for any countable collection of events $(E_i)_{i\in\mathbf{N}}$
then none of the events can occur _infinitely often_. The outcome $\omega$ occurs
after $k$ if $\omega\in\cup_{k > n} E_k$. If an outcome occurs a finite number
of times then $\omega\not\in\cup_{k > n} E_k$ for sufficiently large $k$.
If the outcome occurs in an infinite number of events then
$\omega\in\cap_n \cup_{k > n} E_k$ and we say $\omega$ occurs _infinitely often_.
For any $\epsilon > 0$ there exists $n$ such that $\sum_{k > n} P(E_k) < \epsilon$
since the infinite sum converges to a finite value. 

-->
