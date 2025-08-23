---
title: One Period Model
author: Keith A. Lewis
classoption: fleqn
link-citations: true
header-includes:
	- \usepackage{bm}
---
\newcommand\bs[1]{\boldsymbol{{#1}}}
\renewcommand\AA{\mathcal{A}}
\newcommand\RR{\bs{R}}

Sample space $\Omega$, partitions $\AA_0$, $\AA_1$, and
prices $X_j\in B(\AA_j, \RR^I)$.

$A\colon (\RR^I)^*\to B(\AA_0)\oplus B(\AA_1)$
by $\gamma^*\mapsto -\gamma^* X_0 \oplus \gamma^* X_1$.

$A^*\colon ba(\AA_0)\oplus ba(\AA_1)\to\RR^I$ is defined by
$$
\begin{aligned}
\langle A^*(\pi_0\oplus\pi_1), \gamma^*\rangle
&= \langle \pi_0\oplus\pi_1, A\gamma^*\rangle \\
&= \langle \pi_0\oplus\pi_1, -\gamma^* X_0 \oplus \gamma^* X_1\rangle \\
\end{aligned}
$$
