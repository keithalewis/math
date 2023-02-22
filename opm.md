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

A _position_ $\xi\colon\RR^I\to\RR$ is a linear function from prices to the _value_ of a position.
It corresponds to the number of shares in each instrument being purchased.
The cost of acquiring the position is $\xi x$.
The value at the end of the period is $\xi X(\omega)$ if $\omega\in\Omega$ occurred.
The space of positions is denoted $\RR_I = (\RR^I)^*$.

Trading account activity is modelled by $A\colon R_I\to\RR\oplus
B(\Omega)$ where $A\xi = -\xi x\oplus\xi X$.  The initial trade $\xi$
causes $\xi x$ to be debited from the account at the beginning of the
period and $\xi X(\omega)$ will be credited when the trade is unwound
at the end of the period.

__Exercise__. _Show the adjoint $A^*\colon \RR\oplus ba(\Omega)\to\RR^I$
is $A^*(\pi\oplus\Pi) = -x\pi + \int_\Omega X\,d\Pi$_.

<!--
The adjoint $A^*\colon \RR\oplus ba(\Omega)\to\RR^I$ satisfies
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
-->

Arbitrage exists in a one-period model if there is a position $\xi\in\RR_I$
with $\xi x < 0$ and $\xi X(\omega)\ge0$, for all $\omega\in\Omega$.

Define a cone in $\RR\oplus B(\Omega)$ by $\mathcal{P} = \{y\oplus Y\mid y > 0, Y\ge0\}$
where $y\in\RR$ and $Y\in B(\Omega)$.

__Exercise__. _There is no arbitrage if and only if $\ran A\cap\mathcal{P} = \emptyset$_.

There exists a hyperplane in $\RR\oplus B(\Omega)$ containing $\ran A$
that does not intersect $\mathcal{P}$. Every hyperplane has the form
$\mathcal{H} = \ker \pi\oplus\Pi$ for some $\pi\in\RR$, $\Pi\in B(\omega)$.

__Exercise__. _Show $\mathcal{H} = \ker 1\oplus \Delta$ where $\Delta = \Pi/\pi$_.

_Hint_: Show $\pi\not=0$.

__Exercise__. _Show $x = \int_\Omega X\,d\Delta$_.

_Hint_: $\ran A\subseteq \mathcal{H}$

If $\zeta X = 1$ for some $\zeta\in\RR_I$ then a zero coupon bond is available.
Its price is $D = \zeta x$.

__Exercise__. _Show $x = E[X]D$ for some probability measure_.

## Remarks

The dual of a vector space $V$ is the set of all linear functionals $V^*$.

For $\xi\in V^*$, $\ker \xi$ is a hyperplane in $V$.

If $V$ has a topology we consider only continuous linear functionals.

$V\oplus W$, $(V\oplus W)^*\cong V^*\oplus W^*$.


