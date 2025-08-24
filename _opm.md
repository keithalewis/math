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
\newcommand\PP{\mathcal{P}}
\newcommand\RR{\bs{R}}
\newcommand{\ran}{\operatorname{ran}}
\newcommand{\ker}{\operatorname{ker}}

Instruments $I$, sample space $\Omega$, partitions $\AA_0$ and $\AA_1$ of $\Omega$, and
prices ${x\in B(\AA_0, \RR^I)}$, ${X\in B(\AA_1, R^I)}$.

Arbitrage exists if there is a $\gamma^*\in(\RR^I)^*$
with $\gamma^* x < 0$ and $\gamma^* X \ge0$.

Define $A\colon (\RR^I)^*\to B(\AA_0)\oplus B(\AA_1)$
by $\gamma^*\mapsto -\gamma^* x \oplus \gamma^* X$.

$A^*\colon ba(\AA_0)\oplus ba(\AA_1)\to\RR^I$ is defined by
$$
\begin{aligned}
\langle\gamma^*, A^*(\pi\oplus\Pi)\rangle
&= \langle A\gamma^*, \pi\oplus\Pi\rangle \\
&= \langle -\gamma^* x\oplus\gamma^* X, \pi\oplus\Pi\rangle \\
&= \langle -\gamma^* x, \pi\rangle + \langle\gamma^* X, \Pi\rangle \\
&= \langle \gamma^*, \langle -x, \pi\rangle + \langle X, \Pi\rangle\rangle \\
\end{aligned}
$$
so $A^*(\pi\oplus\Pi) = \langle -x, \pi\rangle + \langle X, \Pi\rangle$.

Define the positive cone in $ba(\AA_0)\oplus ba(\AA_1)$
by $\PP = \{\pi\oplus\Pi\mid \pi > 0, \Pi\ge0\}$
Arbitrage exists if and only if the range of $A$ meets $\PP$.

There is no arbitrage if and only if $\ran A\cap\PP = \emptyset$.
If so, there exists a hyperplane $H\supseteq\ran A$ with $H\cap\PP = \emptyset$.
There exists $\pi\oplus\Pi$ with preannihilator ${}^\perp\{\pi\oplus\Pi\} = H$.

Since $(\ran A)^\perp = \ker A^*$ \subseteq H$

we have $A^*(\pi\oplus\Pi) = 0$ so $\langle x, \pi\rangle = \langle X, \Pi\rangle$

$x\pi = X\Pi|_{\AA_0}$

## Binomial American Option

Sample space is
${\Omega = \{(\omega, t)\mid \omega\in\{+,-\}, t\in\{0,1\}\}}$, information at time 0 is
${\AA_0 = \{\{(-,0),(+,0)\},\{(-,1),(+,1)\}\}}$ and
information at time 1 is ${\AA_1 = \{\{(-,0)\},\{(+,0)\},\{(-,1)\},\{(+,1)\}\}}$.

Bond goes from 1 to $R$, stock goes from $s$ to $S^\pm$
and option pays $\nu(s)$ at time 0 or $\nu(S)$ at time 1.

$I$ is a bond, stock, and American option.
$$
	x = \begin{bmatrix}1\\ s\\ \nu(s)1(t=0)\end{bmatrix}
$$
