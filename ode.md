---
title: ODE
author: Keith A. Lewis
institute: KALX, LLC
classoption: fleqn
fleqn: true
abstract: Ordinary Differential Equations
...

\newcommand\dom{\operatorname{dom}}
\newcommand\cod{\operatorname{cod}}
\newcommand\ran{\operatorname{ran}}
\newcommand\cat[1]{\mathbf{#1}}
\newcommand\mb[1]{\mathbf{#1}}
\newcommand\RR{\mathbf{R}}

An _ordinary differential equation_ is a constraint on the derivatives
of a function of one variable.  The theory of ODE's show how to find all
functions satisfying the constraint.  A constraints on the derivatives of
a function of more than one variable leads to _partial differential equations_
and finding all solutions is a much more difficult problem.

If $x$ is a function of $t$ and $dx/dt = ax$, $a\in\RR$,
then $x(t) = e^{at}$ is a solution with $x(0) = 1$. This ODE is _linear_
so $cx(t)$ is also a solution for any constant $c\in\RR$.  Every solution of
$dx/dt = ax$ with $x(0) = x_0$ has the form $x(t) = x_0e^{at}$.
We also write $x'$ for $dx/dt$.

__Exercise__. _Find all solutions of $x' - ax = 0$ with $x(t_0) = x_0$_.

If $x' = ax$ and $x(t_0) = x_0$ then $x(t_0 + h) \approx x(t_0) + x'(t_0) h
= x_0 + a x_0 h$ for small $h$.
This suggests that an ODE with an _initial condition_ ($x(t_0) = x_0$) should
have a unique solution. We know the function at one point and the constraint
on its derivative allows us to find nearby points.
Note $x^{(n)} = d^nx/dt^n = a^nx$ so using all
terms in the Taylor expansion gives
$$
\begin{aligned}
	x(t_0 + h) &= \sum_{n \ge 0} x^{(n)}(t_0) h^n/n! \\
	&= \sum_{n \ge 0} a^n x_0 h^n/n! \\
	&= x_0 e^{ah} \\
\end{aligned}
$$
and we see the solution to the exercise is $x(t) = x_0 e^{a(t - t_0)}$.

This equation can be written $x' - ax = 0$. If $u' - au = 0$ and $v' -
av = 0$ are any two solutions then a linear combination of $u$ and $v$,
$cu + dv$ for $c,d\in\RR$, is also a solution. This shows the set of
all solutions is a _vector space_. 

__Exercise__. _If $u$ and $v$ are solutions of $x' - ax = 0$ and
$u(t_0) = v(t_0)$ for some $t_0\in\RR$ then $u = v$_.

_Hint_: If $x' - ax = 0$ and $x(t_0) = 0$ for some $t_0\in\RR$ then $x(t) = 0$ for all $t$.

This shows the vector space is one dimensional.

The ODE $x' - ax = 0$ is called _homogeneous_.
The ODE $x' - ax = b$, $b\in\RR$, is called _inhomogeneous_.
Clearly the constant function $x(t) = -b/a$ is a solution of this inhomogeous ODE.

__Exercise__. _If $x' - ax = b$ then $y = x - b/a$ satisfies $y' - ay = 0$_.

__Exercise__. _Find all solutions of $x' - ax = b$ with $x(t_0) = x_0$_.

The ODE $a_1 x' + a_0 x = 0$ is equivalent to $x' - ax = 0$ where $a = - a_0/a_1$.

## Higher Order

An ODE of the form $\sum_{k = 0}^n a_k x^{(k)} = 0$...

We can write this in matrix form as...
