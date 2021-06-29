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
functions satisfying the constraint.  Constraints on the derivatives of
a function of more than one variable leads to _partial differential equations_
and finding all solutions is a much more difficult problem.

# First Order

If $x(t)$ is a function and $dx(t)/dt = ax(t)$, $a\in\RR$,
then $x(t) = e^{at}$ is a solution with $x(0) = 1$. This ODE is _linear_
since $\alpha x(t)$ is also a solution for any constant $\alpha\in\RR$.
The solution of $dx/dt = ax$ with $x(0) = x_0$ is $x(t) = x_0e^{at}$.
We also write $x'$ for $dx/dt$.

__Exercise__. _Find all solutions of $x' = ax$ with $x(t_0) = x_0$_.

If $x'(t) = ax(t)$ and $x(t_0) = x_0$ then $x(t_0 + h) \approx x(t_0) + x'(t_0) h
= x_0 + a x_0 h$ for small $h$.
This suggests that an ODE with an _initial condition_ ($x(t_0) = x_0$) should
have a unique solution. We know the function at one point and the constraint
on its derivative allows us to find nearby points.
Note $x^{(n)}(t) = d^nx(t)/dt^n = a^nx(t)$ so using all
terms in the Taylor expansion gives
$$
	x(t_0 + h) = \sum_{n \ge 0} x^{(n)}(t_0) h^n/n! 
	= \sum_{n \ge 0} a^n x_0 h^n/n! 
	= x_0 e^{ah} 
$$
and we see the solution to the exercise is $x(t) = x_0 e^{a(t - t_0)}$.

This equation can be written $x' - ax = 0$. If $u' - au = 0$ and $v' -
av = 0$ are any two solutions then a linear combination of $u$ and $v$,
$cu + dv$ for $c,d\in\RR$, is also a solution. This shows the set of
all solutions is a _vector space_. 

__Exercise__. _If $u$ and $v$ are solutions of $x' - ax = 0$ and
$u(t_0) = v(t_0)$ for some $t_0\in\RR$ then $u = v$_.

_Hint_: If $x' - ax = 0$ and $x(t_0) = 0$ for some $t_0\in\RR$ then $x(t) = 0$ for all $t$.

This shows the vector space of solutions is one dimensional.

The ODE $x' - ax = 0$ is called _homogeneous_.
The ODE $x' - ax = b$, $b\in\RR$, is called _inhomogeneous_.
Clearly the constant function $x(t) = -b/a$ is a solution of this inhomogeous ODE.

__Exercise__. _If $x' - ax = b$ then $y = x - b/a$ satisfies $y' - ay = 0$_.

__Exercise__. _Find all solutions of $x' - ax = b$ with $x(t_0) = x_0$_.

If $x(t)$ is vector-value and $x'(t) = Ax(t)$ where $A$ is a matrix then
a similar argument shows $x(t) = e^{A(t - t_0)}x(t_0)$ where $e^{At} = \sum_{n\ge 0}A^nt^n/n!$.

## Higher Order

An ODE of the form $\sum_{k = 0}^n a_k x^{(k)}(t) = 0$
is a _homogeneous ODE of order $n$_ with constant coefficients
$a_k$, $0\le k \le n$, $a_n \not= 0$.
Dividing by $a_n$ we can assume the ODE has the form
$x^{(n)} + \sum_{0\le k <n} a_k x^{(k)}(t) = 0$. 
If $u$ and $v$ are any two solutions then a linear combination of $u$ and $v$,
$cu + dv$ for $c,d\in\RR$, is also a solution. This shows the set of
all solutions is a _vector space_. 

A solution of the form $x(t) = e^{\omega t}$ must satisfy
$\sum_{k = 0}^n a_k \omega^k = 0$ since $x^{(k)}(t) = \omega^k x(t)$.
If the polynomial has roots $\omega_k$ then any linear combination
$\sum_k \alpha_k e^{\omega_k t}$ is a solution.
If the roots are not distinct then this does not include all soltuions.
For example $x''(t) = 0$ has solutions $x(t) = 1$ and also $x(t) = t$.
The general solution is $x(t) = \sum_k \alpha_k \sum_{0\le j<\mu_k} t^j e^{\omega_k t}$
where $\mu_k$ is the _multiplicity_ of the root $\omega_k$, but we don't know that yet.

Differentiation is a linear operator $Dx = x'$. We can write the ODE
as $(\sum_n a_n D^n)x = 0$ where $\sum_n a_n D^n$ is also a linear operator.
The solution of the ODE is the _kernel_ of this operator, hence
must be a subspace.

Letting $x_k(t) = x^{(k)}(t) = D^kx(t)$ (and assuming $a_n = 1$) we can write this as
$$
\begin{aligned}
	x_0'(t) &= x_1(t) \\
	x_1'(t) &= x_2(t) \\
	&\cdots \\
	x_{(n-1)}'(t)  &= -a_0 x_0(t) - \cdots - a_{n-1} x_{n-1}(t)) \\
\end{aligned}
$$
or as a matrix
$$
	\begin{bmatrix}
		x_0(t) \\
		x_1(t) \\
		\dots \\
		x_{n-1}(t) \\
	\end{bmatrix}'
	=
	\begin{bmatrix}
		0 & 1 & 0 & \cdots & 0 \\
		0 & 0 & 1 & \cdots & 0 \\
		\dots & & & & \\
		-a_0/a_n & -a_1/a_n & -a_2/a_n & \cdots & -a_{n-1}/a_n \\
	\end{bmatrix}
	\begin{bmatrix}
		x_0(t) \\
		x_1(t) \\
		\dots \\
		x_{n-1}(t) \\
	\end{bmatrix}
$$
For example, the ODE $x''(t) + x(t) = 0$ has matrix $A = \begin{bmatrix}0 & 1 \\ -1 & 0 \end{bmatrix}$ so
$A^2 =  \begin{bmatrix}-1 & 0 \\ 0 & -1 \end{bmatrix} = -I$,
$A^3 =  -A$, $A^4 = I$, $A^5 = A$, \dots.
We have $e^{At} = \begin{bmatrix}\cos t & \sin t \\ -\sin t & \cos t \end{bmatrix}$.
Given initial conditions $x_0(0) = x(0) = c$ and $x_1(0) = x'(0) = d$ we have the solution
$x(t) = c\cos t + d\sin t$.

We are now in a position to solve any homogeneous ODE with constant coefficents.
Recall every matrix can be reduced to Jordan normal form so all we need to do
is compute $e^{At}$ where $A = \lambda I + J$ where $J$ is ...
