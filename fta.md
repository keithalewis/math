---
title: Fundamental Theorem of Algebra
author: Keith A. Lewis
abstract: Every polynomial over the complex numbers is a product of monomials.
---
\newcommand\bs[1]{\boldsymbol{{#1}}}
\newcommand\CC{\bs{C}}

Let $p(z) = \sum_{j=0}^n a_j z^j$ where $a_j$ and $z\in\CC$, be a polynomial over the complex numbers.
The fundamental theorem of algebra states there exist $\alpha_j\in\CC$
with $p(z) = a_n\Pi_{j=0}^n (z - \alpha_j)$.
The basic idea of the proof is $p(z)$ behaves like $a_n z^n$ as $z$ gets large.

**Lemma**. _If a polynomial $p(z)$ is bounded then it is constant_.

_Proof_:
Recall $p$ is bounded is there exists a constant $M$ with $|p(z)| < M$ for all $z\in\CC$.
If $n=0$ then $p(z) = a_0$ is constant.
For $n > 0$ we have $a_n z^n = p(z) + O(|z|^{n-1})$ as $|z|\to\infty$ so $|a_n| R^n < M + CR^{n-1}$
for sufficiently large $R$.
Dividing by $R^n$ gives $|a_n| < M/R^n + C/R$ which tends to 0 as $R$ increases.
This shows $a_n = 0$ for all $n > 0$ so $p(z) = a_0$ is constant.

