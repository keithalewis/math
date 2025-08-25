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
There exists $\pi\oplus\Pi$ with pre-annihilator ${}^\perp\{\pi\oplus\Pi\} = H$.

Since $(\ran A)^\perp = \ker A^*$ \subseteq H$

We have $A^*(\pi\oplus\Pi) = 0$ so $\angle x, \pi\angle = \angle X, \Pi\angle$


$X_j\Pi_j = (X_{j+1} + C_{j+1})|_{\AA_j}$

## Trinomial American Option

The sample space is the possible stock price movements over the first
and second periods, and
when the option is exercised.
${\Omega = \{(\omega_1, \omega_2, t)\mid \omega_i\in\{-,+\}, t\in\{1,2\}\}}$.
We write, e.g., $-+1$ for $(-,+,1)$.

Information at time 0 is $\AA_0 = \{\Omega\}$.
At time one we know if the stock went up or down in the first period and whether or not the option was exercised.
so ${\AA_1 = \{\{--1,-+1\}, \{+-1,++1\}, \{--2,-+2\}, \{+-2,+-2\}\}}$.
Of course $\AA_2$ consists of all singletons of $\Omega$.

We have $X_0(\omega_1,\omega_2, t) = (1, S_0, V_0)$ where $S_0$ and $V_0$ are scalar.

And $X_1(\omega_1, \omega_2, t) = (R, S_1(\omega_1), V_1(\omega_1) 1(t = 2))$ with
$C_1 = (0, 0, \nu(S_1(\omega_1)) 1(t = 1))$.

Also $X_2(\omega_1, \omega_2, t) = (R^2, S_2(\omega_1, \omega_2), 0)$ with
$C_2(\omega_1, \omega_2, t) = (0, 0, \nu(S_2(\omega_1, \omega_2))1(t = 2))$.
