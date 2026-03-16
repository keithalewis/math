---
title: Reinforcement Learning
author: Keith A. Lewis
---

\newcommand\bs[1]{\boldsymbol{{#1}}}
\newcommand\RR{\bs{R}}
\newcommand\NN{\bs{N}}
\renewcommand\AA{\mathcal{A}}

A mathematical framework that can be turned into software.

If $\AA$ is a $\sigma$-algebra on the set $\Omega$ then it is an algebra.
If an algebra is finite then its atoms form a partition of $\Omega$
and the smallest algebra containing them is the original algebra.

Let $A_\omega = \cap\{A\in\AA\mid \omega\in A\}$

__Exercise__. _Show if $B\subset A_\omega$ and $B\in\AA$ then
$B = A_\omega$ or $B = \emptyset$_.

This shows $A_\omega$ is an _atom_ of $\AA$.

__Exercise__. _Show $A_\omega = A_{\omega'}$ or $A_\omega \cap A_{\omega'} = \emptyset$
for $\omega, \omega'\in\Omega$_.

__Exercise__. _Show $\Omega = \cup\{A_\omega\mid\omega\in A\}$_.

This shows $\AA_\Omega = \{A_\omega\mid\omega\in\Omega\}$ is a _partition_ of $\Omega$.
Partitions represent _partial information_. Complete information is
the partition of singletons $\{\{\omega\}\mid \omega\in\Omega\}$.
No information is the singleton partition $\{\Omega\}$. Partial information
is knowing only to which partition $\omega\in\Omega$ belongs.

For example, if $\Omega = [0, 1)$ then the partition 
$\{[0, 1/2), [1/2, 1)\}$ represents knowing the first digit of $\omega$
in its base 2 representation.

__Exercise__. _What partition of $[0,1)$ represents knowing the first two binary digits_?

A function $X\colon\Omega\to\RR$ is $\AA$-measurable if and only if
it is constant on atoms. We can write $X\colon\AA_\Omega\to\RR$ 
since measurable functions _are_ functions on the atoms.

Recall the dual of bounded functions on $\Omega$ is isometrically isomorphic to the
the vector space of finitely additive measures on $\Omega$, $B(\Omega)^*\cong ba(\Omega)$.
For $f\in B(\Omega)$ define $M_f\colon B(\Omega)\to B(\Omega)$ by $g\mapsto fg$.
The adjoint $M_f^*\colon ba(\Omega)\to ba(\Omega)$. We write $f\mu$ for $M_f\mu$, $\mu\in ba(\Omega)$.
Given $M\in B(\Omega)^*$ define $\mu(E) = M1_E$ for $E\subseteq\Omega$.
Since $1_{E\cup F} = 1_E + 1_F - 1_{E\cap F}$ and $1_\emptyset = 0$
we have $\mu(E\cup F) = \mu(E) + \mu(F) - \mu(E\cap F)$ and $\mu(\emptyset)$ by linearity,
hence $\mu$ is a measure.

Conditional expectation $Y = E[X\mid\AA]$ if and only if $Y(P|_\AA) = (XP)|_\AA$
where the vertical bar indicates restriction of a measure to an algebra.

## MDP

Probability space $\langle\Omega, (\AA_n)_{n\in\NN}, P\rangle$ of a set, filtration, and probability measure.

Actions $a\in A$, states $s\in S$, reward $r\colon S\times A\to\RR$.

$\Omega = (S\times A)^* = \cup_{n\in\NN}(S\times A)^n$

Given $\omega = ((s_0, a_0),\ldots)$ we get rewards $r_{t+1} = r(s_t,a_t)$, $t \ge 0$,
at time $t + 1$.

Policy $\pi\colon S\to ba(A)$ is a function from states to a measure on actions
with $\pi(s) \ll P$.

Markov decision process $P(s_{t+1} = s', r_{t+1} = r'\mid s_t, a_t)$.

...
