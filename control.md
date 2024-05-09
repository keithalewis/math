---
title: Control Theory
author: Keith A. Lewis
---

\newcommand\RR{\bm{R}}
\newcommand\CC{\bm{C}}

## Linear System

A _(stationary) linear system_ on a _state space_ $X$ is specified by a linear operator $A\colon X\to X$.
If $x(t)$ is the state of the system at time $t$ the dynamics are determined
by $dx/dt = Ax(t)$, $x(t_0) = x_0$.

__Exercise__. _Show a solution is $x(t) = \exp(tA)x_0$_.

_Hint_. $\exp(tA) = \sum_{n=0}^\infty t^n A^n/n!$.

__Exercise__. _If $X = \RR^2$ and $A = [0, 1;-1 0]$ show $x(t) = (\cos t, \sin t)$ for $x_0 = (1, 0)$_.

_Hint_. Use $A^2 = [-1, 0;0, 1]$, $A^3 = [0, -1;1, 0]$, and $A^4 = I$ to show
$\exp(tA) = [\cos t, \sin t; -\sin t, \cos t]$.

Note $A$ has eigenvalues $\lambda_\pm = \pm i$ with eigenvectors $e_\pm = [\pm i, 1]$.

## Linear Control

Suppose $B\colon U\to X$ is a linear operator. 
