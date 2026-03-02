---
title: Random Variable
author: Keith A. Lewis
institute: KALX, LLC
classoption: fleqn
fleqn: true
abstract: A variable and the probability of the values it can have.
...

\newcommand{\RR}{{\boldsymbol{R}}}
\newcommand{\Var}{\operatorname{Var}}
\renewcommand{\o}[1]{\bar{#1}}

A _random variable_ is a variable, a symbol that takes the place of
number in an equation or inequality, and the probability of the values it can have.
Random variables are specified by their _cumulative distribution function_
$F^X(x)$, or just $F(x)$, if $X$ is understood, giving the probability $X\le x$.

Every cdf must satisfy $0\le F\le 1$ since it is a probability and
is nondecreasing, $F(x) \le F(y)$ if $x < y$, since $X\le x$ implies $X\le y$.

__Exercise__ _Show every cdf is right continuous_.

_Hint_. This means $\lim_{h\downarrow 0} F(x + h) = F(x)$. Use $(-\infty, x] = \cap_{h>0} (-\infty, x + h]$.

__Exercise__ _Show every cdf has left limits_.

_Hint_. This means $\lim_{h\downarrow 0} F(x - h)$ exists.
Use $(-\infty, x) = \cup_{h>0} (-\infty, x - h]$ and every bounded set in $\RR$ has a _least upper bound_.

Any function satsifying these properties is the cdf of a random variable.

## Expected Value

The _expected value_, or _mean_, of $X$ is the Riemann-Stieljes integral $E[X] = \int_\RR x\,dF(x)$.
The greek letter $μ$ is typically used for this.
Expected value is a _measure of central tendency_ providing a single number
indicating the _location_ of $X$.
The _median_ of $X$ is the number $m$
with $F(m) = P(X \le m) = 1/2$. It provides a more _robust_ measure of location.
Values of $F(x)$ for $x > m$ or $x < m$ do not change the median.

The _expected value_ of $f(X)$ for a function $f\colon\RR\to\RR$ is 
$E[f(X)] = \int_\RR f(x)\,dF(x)$.

Exercise. _If $f$ is continuous show $\int_{\RR} f(x)\,dF(x) = f(a)$ when $F(x) = 1(x \ge a)$_.

_Hint_. All terms in the Riemann-Stieljes integral are zero except for the interval containing $a$.

<details><summary>Solution</summary>
Given increasing $\{x_j\}$, $x_j\in\RR$, we have $F(x_{j+1}) - F(x_j) = 0$ if $a < x_j$ or $a > x_{j+1}$
and $F(x_{j+1}) - F(x_j) = 1$ otherwise. As $\Delta x_j\to 0$ the minimum and maximum
of $f$ on $[x_j, x_{j+1}]$ converge to $f(a)$ since $f$ is continuous.
</details>

If $A$ is a set the _indicator function_ $1_A(x)$ is $1$ when $x\in A$
and $0$ when $x\not\in A$.  If $A(x)$ is a _proposition_, a statement
that is either true or false, involving $x$ then $1(A(x))$ is $1$ when
$A(x)$ is true and $0$ when $A(x)$ is false.

✓ __Exercise__. _If $X = a$ with probablity one show $F(x) = 1(x < a)$_.

<details><summary>Solution</summary>
Since $F(x) = P(X\le x)$, $F(x) = 0$ if $x < a$ and $F(x) = 1$ if $x\ge a$.
</details>

This is also written as $dF(x) = δ_a(x)$, the _delta function_ with unit mass at $a$.
Delta functions are _set functions_. Given a set $A$ the
delta "function" $δ_a(A)$ is $1$ if $a\in A$ and $0$ if $a\not\in A$.

### Discrete

A random variable $X$ is _discrete_ if $P(X = x_j) = p_j$ where $p_j > 0$
and $\sum_j p_j = 1$. The data $(x_j, p_j)$ completely specify the random variable.

A discrete random variable that can only take on values 0 or 1 is called _Bernoulli_.
A Bernoulli random variable is specified by a single number $p\in(0, 1)$ where
$P(X = 1) = p$. This implies $P(X = 0) = 1 - p$.

### Continuous

A random variable $X$ is _continuously distributed_ if
$F(x) = \int_{-\infty}^x dF(u) = \int_{-\infty}^x F'(u)\,du$.
The function $f(x) = F'(x)$ is the _density function_ of the random variable.

### Uniform

The random variable $U$ is _uniformly distributed_ on the interval $[0,1]$
if it has density function $f(x) = 1_{[0,1]}(x)$, $-\infty < x < \infty$.
A remarkable fact is that every random variable can be defined using this.
Random variables have the same _law_ if they have the same cumulative distribution function.

✓ __Exercise__. _If $X$ has cdf $F$ then $X$ has the same law as $F^{-1}(U)$_.

_Hint_. What is $P(F^{-1}(U) \le x)$? Use $P(U \le u) = u$ for $0\le u\le 1$.

<details><summary>Solution</summary>
$P(F^{-1}(U) \le x) = P(U\le F(x)) = F(x)$ since $0\le F(x) \le 1$.
</details>

There are no random random variables. The uniform distribution has enough
randomness to specify any random variable.

## Moments

The $n$-th _moment_ of $X$ is $μ_n = E[X^n]$ when it exists.
The _moment generating function_ of $X$ is $m(s) = E[e^{sX}] = \sum_{n=0}^\infty μ_n s^n/n!$.
It is possible for two unequal random variables to have the same moments [@cite].

The $n$-th _central moment_ of $X$ is $\bar{μ}_n = E[(X - E[X])^n]$.
The second central moment is the _variance_.

✓ __Exercise__. _Show $\Var(X) = E[(X - E[X])^2] = E[X^2] - E[X]^2$_.

_Hint_. Expectation is an integral so it is linear, $E[aX + b] = aE[X] + b$.

<details><summary>Solution</summary>
$\Var(X) = E[(X - E[X])^2]
= E[X^2 - 2XE[X] + E[X]^2]
= E[X^2] - 2E[X]E[X] + E[X]^2
= E[X^2] - E[X]^2$.
</details>

Variance is a measure of _dispersion_,
how far the random variable can stray from its mean.
The _standard deviation_ is the square root of the variance and has
the same units as $X$.
The greek letter $σ$ is typically used for the standard deviation.

✓ __Exercise__. _If $\Var(X) = 0$ show $P(X = E[X]) = 1$_.

<details><summary>Solution</summary>
If you know $P(|X - E[X]| > \epsilon) < \Var(X)/\epsilon^2$ then
$P(|X - E[X]| > 0) = 0$ so $P(X = E[X]) = 1$.
</details>

✓ __Exercise__. _If $X$ has first and second moments then $(X - μ)/σ$ has mean zero and variance one_.

_Hint_. $\Var(X + a) = \Var(X)$ and $\Var(aX) = a^2\Var(X)$ for $a\in\RR$.

<details><summary>Solution</summary>
$E[(X - \mu)/\sigma] = (E[X] - \mu)/\sigma = 0$.
$\Var((X - \mu)/\sigma) = \Var(X)/\sigma^2 = 1$.
</details>

Subtracting the mean and dividing by the standard deviation is called _standardizing_
the random variable.

The third moment of a standardized random variable is called _skewness_,
a measure of how lopsided a distribution is.

✓ __Exercise__. _If $X$ and $-X$ have the same distribution then its skewness is zero_.

<details><summary>Solution</summary>
Note $E[X^3] = E[(-X)^3] = -E[X^3]$ so $E[X^3] = 0$.
</details>

The fourth moment of a standardized random variable is called _kurtosis_,
a measure of how peaked a distribution is.

### Normal

The standard normal density function is $f(x) = e^{-x^2/2}/\sqrt{2\pi}$, $-\infty < x < \infty$.

__Exercise__. _Show $\int_{-\infty}^\infty e^{-\pi x^2}\,dx = 1$_.

<details><summary>Solution</summary>
Let $I = \int_{-\infty}^\infty e^{-\pi x^2}\,dx$.
Using polar coordinates $x = r\cos\theta$ and $y = r\sin\theta$ we have
$$
\begin{aligned}
I^2 &= \int_{-\infty}^\infty \int_{-\infty}^\infty e^{-\pi x^2} e^{-\pi y^2}\,dx\,dy \\
	&= \int_{-\infty}^\infty \int_{-\infty}^\infty e^{-\pi (x^2 + y^2)}\,dx\,dy \\
	&= \int_0^{2\pi} \int_0^\infty e^{-\pi r^2} r\,dr\,d\theta \\
	&= \int_0^{2\pi} -e^{-\pi r^2}/2\pi|_0^\infty\,d\theta \\
	&= \int_0^{2\pi} 1/2\pi\,d\theta \\
	&= 1 \\
\end{aligned}
$$
</details>

✓ __Exercise__. _Show $\int_\RR e^{-\alpha x^2}\,dx = \sqrt{\pi/\alpha}$_.

This shows $\int_\RR e^{-x^2/2}\,dx = \sqrt{2\pi}$.

<details><summary>Solution</summary>
If $\alpha x^2 = \pi y^2$ then $x = \sqrt{\pi/\alpha}y$ so
$\int_\RR e^{-\alpha x^2}\,dx = \int_\RR e^{-\pi y^2}\sqrt{\pi/\alpha}\,dy$.
</details>

✓ __Exercise__. _If $Z$ is standard normal then $E[e^{sZ}] = e^{s^2/2}$_.

_Hint_. $E[e^{sZ}] = \int_\RR e^{sz} e^{-z^2/2}/\sqrt{2\pi}\,dz$.
Use $sz - z^2/2 = s^2/2 - (z - s)^2/2$.

<details><summary>Solution</summary>
$E[e^{sZ}] = \int_\RR e^{sz} e^{-z^2/2}/\sqrt{2\pi}\,dz = e^{s^2/2}\int_R e^{-(z - s)^2/2}\sqrt{2\pi}\,dz$
and change variable $z \to z + s$.
</details>

✓ __Exercise__. _If $N$ is normal show $E[e^N] = e^{E[N] + \Var(N)/2}$_.

_Hint_. Every normal can be written as $N = \mu + \sigma Z$ where $Z$ is
standard normal.

<details><summary>Solution</summary>
$E[e^{sN}] = E[e^{\mu + \sigma Z}] = e^\mu e^{\sigma^2/2}$.
</details>

✓ __Exercise__. _If $Z$ is standard normal then $E[e^{sZ} f(Z)] = E[e^{sZ}] E[f(Z + s)]$_.

_Hint_. $E[e^{sZ} f(Z)] = \int_\RR e^{sz} f(z) e^{-z^2/2}/\sqrt{2\pi}\,dz
= e^{-s^2/2}\int_\RR f(z) e^{-(z - s)^2/2}/\sqrt{2\pi}\,dz$.

<details><summary>Solution</summary>
$$
\begin{aligned}
E[e^{sZ}f(Z)] &= int_\RR e^{sz} e^{-z^2/2}f(z)/\sqrt{2\pi}\,dz \\
&= e^{s^2/2}\int_R e^{-(z - s)^2/2}f(z)\sqrt{2\pi}\,dz \\
&= e^{s^2/2}\int_R e^{-z^2/2}f(z + s)\sqrt{2\pi}\,dz \\
&= E[e^{sZ}] E[f(Z + s)] \\
\end{aligned}
$$
</details>

✓ __Exercise__. _If $N$ is normal then $E[e^N f(N)] = E[e^N] E[f(N + \Var(N))]$_.

<details><summary>Solution</summary>
$$
\begin{aligned}
E[e^N f(N)] &= E[e^{\mu + \sigma Z} f(\mu + \sigma Z)] \\
&= E[e^{\mu + \sigma Z}] E[f(\mu + \sigma (Z + \sigma))] \\
&= E[e^N] E[f(N + \sigma^2)] \\
\end{aligned}
$$
</details>

__Exercise__. _Show the $2n$-th moment of a standard normal is $(2n)!/2^n n!$_.

<details>
<summary>Solution</summary>
We have $\sum_0^\infty μ_n s^n/n! = e^{s^2/2} = \sum_0^\infty (s^2/2)^n/n!$.
Equating coefficients, $μ_{2n}/(2n)! = (1/2)^n/n!$ so $μ_{2n} = (2n)!/2^n n!$.
</details>

## Cumulants

The logarithm of the moment generating function is the _cumulant_
$κ(s) = \log E[e^{sX}] = \sum_{n=1}^\infty κ_n s^n/n!$.
The coefficients $(κ_n)$ are the _cumulants_.

✓ __Exercise__. _Show $κ(0) = 0$, $κ'(0) = E[X]$, and $κ''(0) = \Var(X)$_.

<details><summary>Solution</summary>
$\kappa(0) = \log E[e^0] = \log 1 = 0$.

$\kappa'(s) = E[Xe^{sX}]/E[e^{sX}]$ so $\kappa'(0) = E[X]$.

$\kappa''(s) = (E[e^{sX}] E[X^2e^{sX}])/E[e^{sX}]^2 - E[Xe^{sX}]E[Xe^{sX}]/E[e^{sX}]^2$
so $\kappa''(0) = E[X^2] - E[X]^2 = \Var(X)$.
</details>

✓ __Exercise__. _If $Z$ is standard normal show $\kappa_n = 0$ for $n > 2$_.

<details><summary>Solution</summary>
$\kappa(s) = \log E[e^{sX}] = s^2/2 = \sum_{n > 0}\kappa_n s^n/n!$.
</details>

## Inequalities

The mean of a random variable places a contraint on its upper tail.

__Lemma__. (Markov) _For any random variable $X$, $P(X > λ) \le E[X]/λ$_.

_Proof_.  $E[X] \ge E[X1(X\ge λ)] \ge \lambda E[1(X\ge\lambda)] = λ P(X\ge λ)$.

✓ __Exercise__. (Chebychev) _Show $P(|X - E[X]| > ε) \le \Var(X)/ε^2$_.

_Hint_. Replace $X$ by $(X - E[X])^2$ and $λ$ by $ε^2$.

<details><summary>Solution</summary>
$P(|X - E[X]| > ε) = P((X - E[X])^2 > \epsilon^2)
\le E[(X - E[X])^2]/\epsilon^2 = \Var(X)/ε^2$.
</details>

### Concentration Inequalities

Let $(X_j)$ be independent, identically distributed random variables
with mean $μ$ and standard deviation $σ$.
Define the average $S_n = (1/n)\sum_{j=1}^n X_j$.

__Exercise__. _Show $E[S_n] = μ$ and $\Var(S_n) = σ^2/n$_.

<details><summary>Solution</summary>
$E[S_n] = E[(1/n)\sum_{j=1}^n X_j] = nE[X]/n = \mu$.

$\Var(S_n) = \Var((1/n)\sum_{j=1}^n X_j) = \Var(\sum_{j=1}^n X_j)/n^2 = n\Var(X)/n^2 = \sigma^2/n$.
</details>

__Exercise__. (Weak law of large numbers) _Show for any $ε > 0$ that $\lim_{n\to\infty} P(|S_n - μ| > ε) = 0$_.

_Hint_. Show $P(|S_n - μ| > ε) \le σ^2/nε^2$

<details><summary>Solution</summary>
By Chebyshev's inequality $P(|S_n - μ| > ε) \le σ^2/nε^2$ and
$\lim_{n\to\infty} c/n = 0$ for any constant $c$.
</details>
