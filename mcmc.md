---
title: Markov Chain Monte Carlo
author: Keith A. Lewis
institute: KALX, LLC
classoption: fleqn
fleqn: true
abstract: 
...

$\pi\colon M(X)\to M(X)$, positive, isometric, w-star continuous.

A measure $\mu$ on $X\times Y$ determines a linear transformaton
$M\colon B(X)\to B(Y)$ by $Mf(y) = \int_X f\,d\mu_y$
where $\mu_Y(E) = \mu(X,E)$

$Mf(y) = sum_x f(x) m_{x,y}$

$B(X\times Y)^* = M(X\times Y)$

$C_y\colon B(X\times Y) \to B(X)$ by $f\mapsto (x \to f(x,y))$.

$C_y^*\colon ba(X)\to ba(X\times Y)$. $\mu(X) = 

A _Markov chain_ on a set $X$ is a positive measure $\pi$ on $X\times X$ 
where  $\pi_x(E) = \pi(X,E)$, $E\subseteq X$, is a probability measure
for all $x\in X$.

Define $\Pi\colon B(X)\to B(X)$ by $\Pi(f)(x) = \int_X f\,d\pi_x$.

A stochastic process $(X_t)_{t\in T}$ satisfies the _Markov property_
if given $t_0 < \cdots < t_n$, $t_j\in T$ then
$P(X_t \le x \mid X_{t_0} = x_0, \ldots, X_{t_n} = x_n) = P(X_t \le x \mid X_{t_n} = x_n)$
whenever $t \ge t_n$. Informally, the process forgets its history.

__Exercise__. _If $(X_t)$ has independent increments then it satisfies the Markov property_.

If the sample space $\Omega = \{\omega_j\}$ is finite and $T = \{t_0,t_1,\ldots\}$ is
discrete then ...

Let $M\colon ba(\Omega)\to ba(\Omega)$ be a positive unitary linear transformation.

$M\delta_\omega = \sum_{\omega'} \pi_{\omega,\omega'} \delta_{\omega'}$.
$\pi_{\omega,\omega'} \ge 0$, $\sum_{\omega'} \pi_{\omega,\omega'} = 1$, $\omega\in\Omega$.

$\mu = \sum \mu_\omega\delta_\omega$.

$M\mu = M(\sum \mu_\omega\delta_\omega) = \sum \mu_\omega \sum_{\omega'} \pi_{\omega,\omega'} \delta_{\omega'}$.

$(M\mu)_{\omega'} = \sum \mu_\omega \sum_{\omega'} \pi_{\omega,\omega'}$.

$M_\star\colon B(\Omega)\to B(\Omega)$.

$$
\begin{aligned}
\langle M_\star X,\mu\rangle
	&= \langle X, M\mu\rangle \\
	&= \langle X, M\sum_{\omega\in\Omega}\mu_\omega\delta_\omega\rangle \\
	&= \langle X, \sum_{\omega\in\Omega}\mu_\omega M\delta_\omega\rangle \\
	&= \langle X, \sum_{\omega}\mu_\omega \sum_{\omega'} \pi_{\omega,\omega'} \delta_{\omega'}\rangle \\
	&= \langle X, \sum_{\omega'}\sum_{\omega}\mu_\omega \pi_{\omega,\omega'} \delta_{\omega'}\rangle \\
	&= \langle \sum_{\omega'} X(\omega'), \sum_{\omega}\mu_\omega \pi_{\omega,\omega'} \rangle \\
\end{aligned}
$$
