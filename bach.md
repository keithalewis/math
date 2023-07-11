---
title: Bachelier Model
author: Keith A. Lewis
institute: KALX, LLC
classoption: fleqn
fleqn: true
abstract: Normal stock price
...

\newcommand\mb[1]{\mathbf{#1}}
\newcommand\RR{\boldsymbol{R}}
\newcommand\Var{\operatorname{Var}}
\newcommand\Cov{\operatorname{Cov}}

The Bachelier model assumes stock price has the form $F_t = f + \sigma B_t$
where $f$ and $\sigma$ are constants and $B_t$ is standard Brownian motion,
assuming zero interest rate.

The risk-neutral value of a put with strike $k$ expiring at $t$ is 
$$
E[(k - F_t)^+] = E[(k - F)1(F\le k)] = E[k - F]P(F \le k) + \Cov(k - F, 1(F\le k)).
$$

__Exercise__. _Show if $M$ and $N$ are jointly normal then $\Cov(M, g(N)) = \Cov(M, N) E[g'(N)]$_.

_Hint_: Use $E[e^{\alpha N} g(M)] = E[e^{\alpha N}] E[g(M + \Cov(\alpha N, M))]$,
take a derivative with respect to $\alpha$, then set it equal to 0.

This shows ${\Cov(k - F, 1(F\le k)) = \Cov(k - F, F) E[-\delta_k(F)]
= \Var(F) E[\delta_k(F)]}$.

__Exercise__ _Show $E[\delta_a(b + cZ)] = \phi((a - b)/c)/c$ if $\phi$ is the density function of $Z$_.

<details><summary>Solution</summary>
If $d_a(x) = 1/h$ for $a < x \le a + h$ and 0 otherwise
then ${E[\delta_a(b + cZ)] = \lim_{h\to 0} E[d_a(b + c Z)].}$ 
Using $y = (b + cz)/c = b/c + z$ we have 
$$
\begin{aligned}
E[d_a(b + c Z)] &= (1/h)\int_a^{a+h} (b + cz)\phi(z)\,dz \\
	&= (1/h)\int_{b/c + a}^{b/c + a + h} cy\phi(y - b/c)\,dy \\
\end{aligned}
$$
</details>

If $g$ is differentiable at $z = g^{-1}(a)$ then ${E[\delta_a(g(Z))] = \phi(z)/g'(z)}$
since ${g(x) \approx g(z) + g'(z)(x - z)}$ for ${z\approx x}$.

We have ${E[\delta_k(F)] = E[\delta_k(f + \sigma\sqrt{t}Z)] = \phi(z)/\sigma\sqrt{t}}$,
where $Z$ is standard normal and ${z = (k - f)/\sigma\sqrt{t}}$ so
$$
E[(k - F_t)^+] = (k - F)\Phi(z) + \sigma\sqrt{t}\phi(z)
$$
where $\Phi$ is the standard normal cumulative distribution function and $\phi = \Phi'$.

__Exercise__. _Show $E[(F_t - k)^+] = (f - k)\Phi(-z) + \sigma\sqrt{t}\phi(-z)$_.
