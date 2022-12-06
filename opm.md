---
title: One Period Model
author: Keith A. Lewis
institution: KALX, LLC
email: kal@kalx.net
classoption: fleqn
abstract: Buy now, sell later.
...

\newcommand\RR{\mathit{R}}
\newcommand\Var{\operatorname{Var}}
\newcommand\Cov{\operatorname{Cov}}
\newcommand\ker{\operatorname{ker}}
\newcommand\ran{\operatorname{ran}}

Let $I$ be the set of _instruments_ available for trading over a period of time
and $Ω$ be the set of what can happen over the period.
The _prices_ at the beginning of the period are $x\in\RR^I$.
The prices at the end of the period are $X\colon\Omega\to \RR^I$ where $X(\omega)\in\RR^I$
are the instrument prices if $\omega\in\Omega$ occurred.

A _position_ $\xi$ is a linear function from prices to the _value_ of acquiring the position.
It corresponds to the number of shares in each instrument being purchased.
The value of acquiring the position is $\xi(x)$.
The value at the end of the period is $\xi X(\omega)$ if $\omega\in\Omega$ occured.

Trading account activity is modelled by $A\colon R_I\to\RR\oplus
B(\Omega)$ by $A\xi = -\xi x\oplus\xi X$.  The initial trade $\xi$
causes $\xi x$ to be debited from the account at the beginning of the
period and $\xi X(\omega)$ will be credited when the trade is unwound
at the end of the period.

The adjoint $A^*\colon \RR\oplus ba(\Omega)\to\R_I$ satisfies
$$
\begin{aligned}
	\langle \eta, A^*(\pi\oplus \Pi)\rangle &= \langle A\eta, \pi\oplus \Pi\rangle \\
	&= \langle -\eta x\oplus \eta X, \pi\oplus \Pi\rangle \\
	&= -\eta x\pi + \int_\Omega \eta X\,d\Pi \\
	&= \eta(-x\pi + \int_\Omega  X\,d\Pi) \\
\end{aligned}
$$
for $\eta\in\RR_I$, $\pi\in\RR$, $\Pi\in ba(\Omega)$ so
$A^*(\pi\oplus\Pi) = -x\pi + \int_\Omega  X\,d\Pi$.

Let $\mathcal{P} = \{\pi\oplus\Pi\mid \pi\in\RR, \pi > 0, \Pi\in ba(\Omega), \Pi\ge0\}$.

There is no arbitrage if and only if $\ran A\cap\mathcal{P} = \emptyset$.

There exists a hyperplane in $\RR\oplus ba(\Omega)$ containing $\ran A$
that does not intersect $\mathcal{P}$.

$H = \ker \pi\oplus\Pi$

Dividing by $\pi$ we have $1\oplus D$.

$\ran A\subseteq H$ so $1\oplus D\in\ker A^*$.

$0 = -x + \int_\Omega X\,dD$.

## Remarks

The dual of a vector space $V$ is the set of all linear functionals $V^*$.

If $V$ has a topology we consider only continuous linear functionals.

$V\oplus W$, $(V\oplus W)^*\cong V^*\oplus W^*$.

