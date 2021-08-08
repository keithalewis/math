---
title: Lipschitz Functional Calculus
author: Keith A. Lewis
institute: KALX, LLC
classoption: fleqn
fleqn: true
abstract: none
...

\newcommand\CC{\bm{C}}
\newcommand\ran{\operatorname{ran}}
\newcommand\tr{\operatorname{tr}}
\newcommand\Lip{\operatorname{Lip}}
\newcommand\BH{\mathcal{B}(\mathcal{H})}
\newcommand\TC{\mathcal{C}_1}

Let $X$ be a compact subset of the complex plane $\CC$.
Define $\|f\|_\infty = \sup_{x\in X} |f(x)|$ and $\|f\|_d =
\sup_{z\not=w}|f(z) - f(w)|/|z - w|\}$.
Define the Lipschitz norm of $f\colon X\to\CC$ by $\|f\| = \|f\|_\infty + \|f\|_d$
and let $\Lip(X)$ be the set of functions with finite Lipschitz norm.
$\Lip(X)$ is a Banach algebra under this norm.

For a real measure $\mu\in M(X)$ define
$\|\mu\|_{KR} = \int_{\mu_0\in M_0(X)} \|\mu_0\| + \|\mu - \mu_0\|_{TV}$
where $M_0(X)$ are measures $\mu_0$ with $\mu_0(X) = 0$ and $TV$ is the total variation.
Let $AE(X)$ be the space of real measures under this norm.

__Theorem__. $AE(X)^*\cong \Lip(X)$

Define $\phi\colon\TC\to AE(X)$ by $\phi(L)(z) = \tr (z - T)^{-1}L$ 

Fix $T\in\mathcal{B}(\mathcal{H})$.

$\Phi\colon R(X)\to\mathcal{B}(\mathcal{H})$. If $f\in H(X)$ then $f(z) = (1/2\pi i)\int_\gamma f(w)(w - z)^{-1}\,dw$.

$f(T) = (1/2\pi i)\int_\gamma f(w)(w - T)^{-1}\,dw$.

$\langle f(T), L\rangle = (1/2\pi i)\int_\gamma f(w)\tr (w - T)^{-1}L\,dw$.



pqrstuvwxyz

$\BH \to M(X)/R(X)^\perp$ 
