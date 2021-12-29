---
title: A General Formula for Option Pricing
author: Keith A. Lewis
institute: KALX, LLC
classoption: fleqn
fleqn: true
abstract: Perturbation of the normal distribution
...

\newcommand{\Var}{\mathop{\rm{Var}}}
\newcommand{\Cov}{\mathop{\rm{Cov}}}
\theoremstyle{definition}
\newtheorem*{example}{}


The forward value of a European put option
having strike \(k > 0\) on underlying \(F\) is
\[
E[\max\{k - F, 0\}] = E[(k - F)1(F \le k)] = k P(F\le k) - E[F] P^s(F\le k),
\]
where \(P^s\) is _share measure_ defined by \(dP^s/dP = F/f\).

Every positive random variable can be written \(F = f e^{sX -\kappa(s)} \)
where \(X\) has mean 0, variance 1 and \(\kappa(s) = \log E[e^{s X}]\) is
the _cumulant_ of \(X\).

If \(X\) is standard normal and \(s = \sigma\sqrt{t}\),
then this is the Black\cite{Bla1976} put formula. Recall
\(
E[\exp(N)] = \exp(E[N] + \Var(N)/2)
\) 
if \(N\) is
normal, and 
\(
E[\exp(N) f(M)] = E[\exp(N)] E[f(M + \Cov(N,M))]
\)
if \(N\) and \(M\) are jointly normal. We have
\(\kappa(s) = \log E[\exp(sX)] = s^2/2 \) and
\(E^s[f(X)] = E[\exp(sX-s^2/2) f(X)]
= E[f(X + s)]\). In the usual notation,
\(m = -d_2 = (\log (k/f) + \sigma^2t/2)/\sigma\sqrt{t} \)
and \(P^s(X \le m) = P(X + \sigma\sqrt{t} \le -d_2)
= P(X \le -d_1)\) where \(d_1 = d_2 + \sigma\sqrt{t}\).

## Cumulants

The _cumulant generating function_ of the random variable \(X\)
is \(\kappa(s) = \log E[e^{sX}]\).
When they exist, the _cumulants_ \((\kappa_n)\)
are defined by
\[
\kappa(s) = \sum_{n=1}^\infty \kappa_n \frac{s^n}{n!}
\]
Since the \(n\)-th derivative evaluated at \(0\)
satisfies \(\kappa^{(n)}(s)|_{s = 0} = \kappa_n\) 
it is easy to
work out that
\(\kappa_1 = E[X]\) and \(\kappa_2 = \Var(X)\). Higher order
cumulants are less intuitive but the third and fourth are
related to skew and kurtosis.


The cumulants of a random variable plus a constant are the 
same except the first cumulant is increased by the constant.
More generally, the cumulants of the sum of two independent 
random variables are the sums of their cumulants.
They scale homogeneously, the \(n\)-th cumulant of a constant
times a random variable is
\(\kappa_n(cX) = c^n\kappa_n(X)\).

The exponential of the cumulant in terms of
powers of \(s\) is
\[
E[e^{sX}] =  \exp(\sum_{n=1}^\infty \kappa_n \frac{s^n}{n!})
= \sum_{n=0}^\infty B_n(\kappa_1,\dots,\kappa_n) \frac{s^n}{n!}
\]
where \(B_n(\kappa_1,\dots,\kappa_n)\) is the \(n\)-th complete
Bell polynomial.
This is just a special case of the
Fa\`a di Bruno formula first proved by Louis Fran\c{c}ois Antoine
Arborgast in 1800\cite{Arb1800}.
Bell polynomials satisfy the recurrence \cite{Com1974} \(B_0 = 1\) and
\[
B_{n+1}(x_1,\dots,x_{n+1}) = \sum_{k=0}^n \binom{n}{k}
B_{n - k}(x_1,\dots, x_{n - k}) x_{k+1}.
\]

## Edgeworth Expansion

Let \(\psi\) be the probability density of a random variable, \(X\),
with expected value 0 and mean 1.
The the Fourier transform is

\[
\begin{aligned}
E[e^{-iuX}] &= e^{\sum_{n=1}^\infty \kappa_n (-iu)^n/n!}\\
           &= e^{-u^2/2} e^{\sum_{n=3}^\infty \kappa_n (-iu)^n/n!}\\
           &= e^{-u^2/2} \sum_{n=0}^\infty B_n(0, 0, \kappa_3,...,\kappa_n)(-iu)^n/n!.\\
	   &= e^{-u^2/2} (1 + \sum_{n=3}^\infty B_n(0, 0, \kappa_3,...,\kappa_n)(-iu)^n/n!.\\
\end{aligned}
\]

where \((\kappa_n)\) are the cumulants of \(X\).

The Fourier transform, \(\hat{f}(u) = E[e^{-iuX}]\),
of \(f'\) is \(iu \hat f(u)\) so
the Fourier transform of the \(n\)-th derivative
\(f^{(n)}\) is \((iu)^n\hat f(u)\) hence
\[
\begin{aligned}
\hat{\psi}(u) &= \hat{\phi}(u)(1 + \sum_{n=3}^\infty B_n(0, 0,\kappa_3,...,\kappa_n) (-iu)^n/n!\\
	&= \hat{\phi}(u) + \sum_{n=3}^\infty (-1)^n B_n(0, 0, \kappa_3,...,\kappa_n)
	\widehat{\phi^{(n)}}(u)/n!\\
\end{aligned}
\]
where \(\phi(x) = e^{-x^2/2}\). Note \(\hat{\phi}(u) = e^{-u^2/2}\).
Taking inverse Fourier transforms and integrating both
sides yields
\[
	\Psi(x) = \Phi(x) + \sum_{n=3}^\infty (-1)^n B_n(0,0,\kappa_3,...,\kappa_n) \Phi^{(n)}(x)/n!.
\]

## Hermite Polynomials

The derivatives of the standard normal density 
can be computed using Hermite polynomials\cite{AbrSte1964}
pp. 793--801.
One definition is
\[
H_n(x) = (-1)^n e^{x^2/2}\frac{d^n}{dx^n}e^{-x^2/2}.
\]
They satisfy the recurrence \(H_0(x) = 1\), \(H_1(x) = x\) and
\[
H_{n+1}(x) = xH_n(x) - n H_{n-1}(x).
\]
Note some authors use \(He_n(x)\) instead of \(H_n(x)\).
This shows \(\phi^{(n)}(x) = (-1)^n\phi(x) H_n(x)\)
so \(\Phi^{(n)} = (-1)^{n-1} H_{n-1}(x)\) for \(n > 0\).

We now have an explicit formula for the cumulative
distibution function of \(X\):
\[
\Psi(x) = \Phi(x) - \phi(x)\sum_{n=1}^\infty
B_n(\kappa_1,\dots,\kappa_n) H_{n-1}(x)/n!
\]

## The Esscher Transform

Given any random variable, \(X\), and number \(s\), define
\(X^s\) by \(P(X^s\le x) = P^s(X\le x)\) where
\(dP^s/dP = e^{-\kappa(s) + sX}\).
The cumulant of \(X^s\) is \(\kappa^s(u) = \kappa(u + s) - \kappa(s)\),
where \(\kappa\) is the cumulant of \(X\).
This follows from \(E^s[e^{uX}] = E[e^{sX - \kappa(s)} e^{uX}]
= e^{\kappa(s + u) - \kappa(s)}\).

It follows that the \(n\)-th derivative satisfies
\(\kappa^{s(n)}(u) = \kappa^{(n)}(u + s)\), for \(n > 0\),\
and setting \(u=0\), \(\kappa^s_n = \kappa^{s(n)}(0) = \kappa^{(n)}(s)\).

The last expression can be expressed as \(\kappa^{(n)}(s) =
\sum_{k=0}^\infty \kappa_{n - k} s^k/k!\), but for many random variables,
we can use the closed form solution on the left-hand side instead of
the infinite sum.

## Examples

### Normal

A normally distributed random variable, \(X\), has density function 
\(f(x) = e^{-(x - \mu)^2/2\sigma^2}/\sigma\sqrt{2\pi}\), \(-\infty<x<\infty\),
with mean \(\mu\) and variance \(\sigma^2\).
The cumulant is \(\kappa(s) = \mu s + \sigma^2s^2/2\) so
\(\kappa_1 = \mu\) and \(\kappa_2 = \sigma^2\) are the only non-zero
cumulants. 

Since \(\kappa^s(u) = \kappa(u + s) - \kappa(s) = (\mu + \sigma^2s)u + \sigma^2u/2\)
we see that \(\kappa^s_1 = \kappa_1 + \sigma^2\) and \(\kappa^s_2 = \kappa_2\). The
Esscher transform of a normally distributed random variable is normal
with mean \(\mu^s = \mu + \sigma^2\) and variance \(\sigma^{s2} = \sigma^2\).

If the cumulants of a random variable vanish after some some point, then it must
be normal\cite{Luk1970} (Theorem 7.3.5). 

### Gamma
A gamma distributed random variable, \(X\), has density function
\(f(x) = x^{\alpha - 1} e^{-x/\beta}/\beta^\alpha\Gamma(\alpha)\), \(x > 0\),
with mean \(\alpha\beta\) and variance \(\alpha\beta^2\).
The cumulant is \(\kappa(s) = -\alpha\log(1 - \beta s)\) so
\(\kappa_n = \kappa^{(n)}(0) = (n-1)!\alpha\beta^n\) since
\(\kappa^{(n)}(s) = (n-1)!\alpha\beta^n/(1 - \beta s)^n\).

Since \(\kappa^s(u) = \kappa(u + s) - \kappa(s) = -\alpha\log (1 - \beta u/(1 - \beta s)\),
the Esscher transform of a gamma distributed random variable is gamma
with \(\alpha^* = \alpha\) and \(\beta^* = \beta/(1 - \beta s)\).

Note that an exponentially distributed random variable is the special case when 
\(\alpha = 1\).

### Poisson

If \(X\) is Poisson
with mean \(\mu\) then \(\kappa(s) = \mu(e^s - 1)\) so
\(\kappa_n = \mu\) for all \(n\) and
\(\kappa_n^* = \mu e^s\).
<!--
%\begin{example}[Compound Poisson]
%If \(Y\) is Poisson with mean \(\mu\) and \(Z_j\) are
%independent and identically distributed, define
%\(X = \sum_{j=1}^{Y} Z_j\). The cumulants of \(X\)
%are \(\kappa_n = ?\).
%\end{example}
%\begin{align*}
%Ee^{uX} &= \sum_{k=0}^\infty Ee^{u(Z_1 + \cdots Z_k)}\mu^k/k!\,e^{-\mu}\\
%&= \sum_{k=0}^\infty (Ee^{u Z_1})^k\mu^k/k!\,e^{-\mu}\\
%&= \sum_{k=0}^\infty (Ee^{u Z_1}\mu)^k/k!\,e^{-\mu}\\
%&= e^{\mu Ee^{u Z_1}}\,e^{-\mu}\\
%&= e^{\mu (Ee^{u Z_1} - 1)}\\
%\end{align*}
%Define \(\lambda(u) = \log Ee^{uZ_1}\). Then
%\(\log E e^{uX} = \mu(e^{\lambda(u)} -1)\).
-->

### Variance Gamma

The Variance Gamma model is the difference of independent Gamma distributions
so \(\kappa_n = (n-1)!(\alpha\beta^n - \alpha'\beta'^n)\).
In order for this to be a perturbation of a standard normal
distribution we need \(0 = \alpha\beta - \alpha'\beta'\)
and \(1 = \alpha\beta^2 - \alpha'\beta'^2\).
Using mean and standard deviation
\(\mu = \mu'\) and \(\sigma^2 = 1 + \sigma'^2\).
For convergence we need \(1 < \sigma^2 \lll \mu\).

### Compound Poisson

Assume \(Y_i\) are independent and identically distributed. If \(N\) is
Poisson with parameter \(\lambda\) then \(X\) is {\em compound Poisson}
if \(X = \sum_{i=0}^N Y_i\).
The exponential of the cumulant of X is
\[
\begin{aligned}
Ee^{sX} &= Ee^{s\sum_{i=0}^N Y_i}\\
&= \sum_{k=0}^\infty \frac{\lambda^k}{k!}e^{-\lambda}(Ee^{Y_i})^k\\
&= \sum_{k=0}^\infty \frac{\lambda^k}{k!}e^{-\lambda}(e^{\kappa^Y(s)})^k\\
&= \sum_{k=0}^\infty \frac{(\lambda e^{\kappa^Y(s)})^k}{k!}e^{-\lambda}\\
&= e^{\lambda(e^{\kappa(s) - 1})}
\end{aligned}
\]

### Jump Diffusion

Merton's \cite{Mer?} jump diffusion model assumes
\(X = \alpha Z + \beta\sum_{k=0}^N Y_k\) where
\(N\) is Poisson and \(Y_k\) are independent normal.

### Double Exponential

\(f(y) = p\eta_1 e^{-\eta_1 y}1(y > 0) + (1 - p)\eta_2 e^{\eta_2 y}1(y < 0)\)
\[
\begin{aligned}
Ee^{sY} &= \int_0^\infty e^{sx} pe^{-\eta_1 y}\,dy
+ \int_{-\infty}^0 e^{sy} (1-p)e^{\eta_2 y}\,dy\\
&= \frac{p}{1-s/\eta_1} + \frac{1-p}{1 + s/\eta_2}
\end{aligned}
\]

\(\kappa^Y_n = n!(\frac{p}{\eta_1^n} + \frac{1-p}{(-\eta_2)^n})\)


## Lévy Processes

Kolmogorov's precursor to the Lévy-Khintchine theorem\cite{Kol1992}
states that if a random variable \(X\) is infinitely divisible
and has finite variance
there exists a number \(\gamma\) and a non-decreasing function
\(G\) defined on the real line such that
\[
\kappa(s) = \log Ee^{sX} = \gamma s + \int_{-\infty}^\infty K_s(x)\,dG(x),
\]
where \(K_s(x) = (e^{sx} - 1 - sx)/x^2 = \sum_{n=2}^\infty s^nx^{n-2}/n!\).
Note the first cumulant of \(X\) is \(\gamma\) and for \(n\ge 2\),
\(\kappa_n = \int_{-\infty}^\infty x^{n-2}\,dG(x)\).

The Hamburger moment problem[cite?] provides the answer to
what the allowable cumulants are: the Hankel matrix
\([\kappa_{i+j}]_{i,j\ge 2}\) must be positive definite.

Since \(K_s(0) = s^2/2\) is the cumulant of the standard normal
distribution and \(a^2K_s(a) + as\) is the cumulant of a
Poisson distribution having mean \(a\),
infinitely divisible random variables can be
approximated by a normal plus a linear combination of
independent Poisson distributions.

### Remarks

The Gram-Charlier A series expands the quotients of cumulative
distribution functions \(G/F\) using Hermite polynomials, but does not
have asymptotic convergence, whereas the Edgeworth expansion involves
the quotient of characteristic functions \(\hat G/\hat F\) in terms of
cumulants and does have asymptotic convergence, ignoring some dainty
facts \cite{Pet1975}.

If \((X_t)\) is a Lévy process then \(X_1\) is
infinitely divisible and \(\log Ee^{sX_t} = t\kappa(s)\).
A consequence is that the volatility smile at a single
maturity determines the entire volatility surface, a fact that
may indicate Lévy processes are not appropriate for
modeling stock prices.

<!--
\bibliographystyle{amsplain}
\bibliography{njr}
-->
