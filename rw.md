---
title: Random Walk
author: Keith A. Lewis
institute: KALX, LLC
classoption: fleqn
fleqn: true
abstract: Move based on coin flip
...

\newcommand\NN{\bm{N}}
\newcommand\RR{\bm{R}}
\newcommand{\Var}{\operatorname{Var}}

Flip a coin and move one step right if heads or one step left if tails.
Or up and down instead of right and left. Or swap the directives of heads and tails.

The possible outcomes of repeatedly flipping a coin are described
by the _sample space_ $\Omega = \{H,T\}^\NN$, where $\NN = \{0, 1, 2, \ldots\}$ is
the set of _natural numbers_,
consisting of all functions $\omega\colon\NN\to\Omega$.
The outcome of the $n$-th flip is $\omega(n)\in\{H,T\}$ for $n\in\NN$.

Given $n$ initial flips $\omega_n\in\{H,T\}^n$ let $A_{\omega_n}$
be the elements $\omega\in\Omega$ starting with $\omega_n$,
$\omega(k) = \omega_n(k)$ for $k < n$.
The probability of $A_{\omega_n}$ occuring is $1/2^n$ for each $\omega_n$.
Let $\mathcal{A}_n = \{A_{\omega_n}:\omega_n\in\{H,T\}^n\}$.

__Exercise__. _Show $\mathcal{A}_n$ is a partition of $\Omega$_.

Hint: A partition of a set is ...

We are assuming the coin is _fair_ so the probabitly of either heads or tails is $1/2$.
If the probability of heads is $p$ (so the probability of tails is $1 - p$) then
the probability of $A_{\omega_n} = p^h(1 - p)^t$ where $h$ is the number of
heads in $\omega_n$ and $t = n - h$ is the number of tails.

## Random Walk

To turn coin flips into a _stochastic process_ define a function $V\colon\{H,T\}\to\RR$.
This determines a _random walk_ $W\colon \NN\times\Omega\to\RR$
by $W(n,\omega) = \sum_{0\le k < n} V(\omega(k))$. We also write $W_n(\omega) = W(n, \omega)$.
Note $W_n(\omega)$ only depends only on the first $n$ values of $\omega$.
Such processes are called _adapted_.

Typical choices for $V$ are $V(H) = 1$ and $V(T) = 0$ or $V(H) = 1$ and $V(T) = -1$.
We could also choose $V(H) = 0$ and $V(T) = 1$ or $V(H) = -1$ and $V(T) = 1$ 
to get processes with the same _law_ if the coin is fair. Let's call the first
case _standard random walk_, or just random walk, and the second _symmetric random walk_.

__Exercise__. _Show $E[W_n] = 0$ and $\Var(W_n) = n$ if $W$ is a symmetric (fair) random walk_.

_Hint_: $E[V] = 0$ and $\Var(V) = 1$.

__Exercise__. _If $W$ is a (standard) random walk then $P(W_n = k) = \binom{n}{k}/2^n$_.

_Hint_: $W_n(\omega) = k$ if the first $n$ elements of $\omega$ has $k$ 1's and $n - k$ 0's.
Recall $\binom{n}{k} = n!/(n - k)!k!$ is the number of ways to choose $k$ (or $n-k$)
elements from a set of $n$ elements.

### Reflection Principle

## Stochastic Difference Equations

If $x\colon\NN\to\RR$ define $\Delta x\colon\NN\to\RR$ by
$\Delta x(n) = x(n + 1) - x(n)$. The _difference equation_ $\Delta x = \mu$
where $\mu\colon\NN\to\RR$ has a unique solution given $x(0) = x_0\in\RR$.

__Exercise__. _Show $x(n) = x_0 + \sum_{0\le k < n} \mu(n)$_.

If $W_n$ is a random walk and $X_n\colon\Omega\to\RR$ define $\Delta X_n = \mu + \sigma\Delta W_n$
by 


The _stochastic difference equation_ $\Delta X_n(\omega) = \mu(n, \omega) + \sigma(n, \omega) \Delta W_n(\omega)$,
where $W_n$ is a random walk, has a unique solution given $X(0, \omega_9) = x_0\in\RR$.
