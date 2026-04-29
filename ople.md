---
title: Option Pricing Using Logical Entropy
classoption: fleqn
fleqn: true
header-includes:
	- \usepackage{bm}
---

Let $X$ be the value of an underlying at expiration with current price $x$
having put option prices $p_i = E[(k_i - X)^+]$ for increasing strikes $k_i$, $i = 1,\ldots,m$.
How do we use this to find a risk-neutral distribution of $X$?

Assume $P(X = x_j) = \pi_j$, $j = 1,\ldots,n$ where $n > m$.

Minimize the logical entropy given the constraints.
$$
\begin{aligned}
\Phi(\pi_j, \lambda, \mu_j)
&= \frac{1}{2}(1 - \sum_j \pi_j^2) - \lambda(E[X] - x) - \sum_i \mu_i(E[(k_i - X)^+] - p_i) \\
&= \frac{1}{2}(1 - \sum_j \pi_j^2) - \lambda(\sum_j x_j\pi_j - x) - \sum_i \mu_i([\sum_j (k_i - x_j)^+\pi_j] - p_i) \\
\end{aligned}
$$

$$
0 = \partial_{\pi_k}\Phi(\pi_j, \lambda, \mu_i) = -\pi_k - \lambda x_k - \sum_i \mu_i (k_i - x_k)^+
$$
so
$$
	\pi_j = - \lambda x_j - \sum_i \mu_i (k_i - x_j)^+
$$
We have
$$
\begin{aligned}
	x &= \sum_j x_j(- \lambda x_j - \sum_i \mu_i (k_i - x_j)^+) \\
	&= -\lambda\sum_j x_j^2 - \sum_i\mu_i \sum_j x_j(k_i - x_j)^+ \\
	&= -\lambda\sum_j x_j^2 - \sum_i\mu_i \sum_{x_j < k_i} x_j(k_i - x_j) \\
\end{aligned}
$$
and
$$
\begin{aligned}
	p_i &= \sum_j (k_i - x_j)^+(- \lambda x_j - \sum_l \mu_l (k_l - x_j)^+) \\
	&= -\lambda \sum_j (k_i - x_j)^+ x_j - \sum_l \mu_l \sum_j (k_i - x_j)^+(k_l - x_j)^+ \\
	&= -\lambda \sum_{x_j < k_i} (k_i - x_j) x_j - \sum_l \mu_l \sum_{x_j < \min\{k_i,k_l\}} (k_i - x_j)(k_l - x_j) \\
\end{aligned}
$$
Let $A = \sum_j x_j^2$, $B_i = \sum_{x_j < k_i} x_j(k_i - x_j)$ 
and $C_{il} = \sum_{x_j < \min\{k_i,k_l\}} (k_i - x_j)(k_l - x_j)$.
Note $C_{il} = C_{li}$.
$$
\begin{aligned}
	x &= -\lambda A - \sum_i \mu_i B_i \\
	p_i &= -\lambda B_i - \sum_l \mu_l C_{il} \\
\end{aligned}
$$
and
$$
\begin{bmatrix}
x \\
p_1 \\
\vdots \\
p_m \\
\end{bmatrix}
=
-\begin{bmatrix}
A & B_1 & \cdots & B_m \\
B_1 & C_{11} & \cdots & C_{1m} \\
\vdots & \vdots &\ddots & \vdots\\
B_m & C_{m1} & \cdots & C_{mm} \\
\end{bmatrix}
\begin{bmatrix}
\lambda \\
\mu_1 \\
\vdots \\
\mu_m \\
\end{bmatrix}
$$

## Examples

If there is only one option with strike $k$ then
$\pi_j = -\lambda x_j - \mu (k - x_j)^+$.
We have
$$
\begin{aligned}
x &= \sum_j x_j(-\lambda x_j - \mu (k - x_j)^+) \\
  &= \sum_{x_j < k} x_j(-\lambda x_j - \mu (k - x_j))
    +\sum_{x_j \ge k} x_j(-\lambda x_j) \\
  &= -\lambda \sum_j x_j^2 - \mu(\sum_{x_j < k} x_j(k - x_j)) \\
  &= -\lambda A - \mu B \\
\end{aligned}
$$
where $A = \sum_j x_j^2$ and $B = \sum_{x_j < k} x_j(k - x_j)$.
We also have
$$
\begin{aligned}
p &= \sum_j (k - x_j)^+(-\lambda x_j - \mu (k - x_j)^+) \\
  &= \sum_{x_j < k} (k - x_j)(-\lambda x_j - \mu (k - x_j)) \\
  &= -\lambda (\sum_{x_j < k} (k - x_j)x_j) - \mu \sum_{x_j < k} (k - x_j)^2 \\
  &= -\lambda B - \mu C \\
\end{aligned}
$$
where $C = \sum_{x_j < k} (k - x_j)^2$.
Solving for $\lambda$ and $\mu$
$$
\begin{aligned}
\lambda &= (-Cx + Bp)/D \\
\mu &= (Bx - Ap)/D \\
\end{aligned}
$$
where $D = AC - B^2$.

We have $D\pi_j = (Cx - Bp)x_j + (-Bx + Ap)(k - x_j)^+$
so $D\pi_j = (Cx - Bp + Bx - Ap)x_j + (-Bx + Ap)k$
when $x_j < k$ and $D\pi_j = (Cx - Bp)x_j$ if $x_j \ge k$.

Define $\bm{x} = (x_1,\ldots,x_n)$ and $\bm{k} = (k - \bm{x})1(\bm{x} < k)$
so $A = \bm{x}\cdot\bm{x}$, $B = \bm{x}\cdot\bm{k}$ and $C = \bm{k}\cdot\bm{k}$.
The Cauchy-Schwartz inequality shows $D > 0$.

In vector form
$$
\begin{aligned}
D\bm{\pi} &= (\bm{k}\cdot\bm{k} x - \bm{x}\cdot\bm{k} p) \bm{x} 
+ (-\bm{x}\cdot\bm{k} x + \bm{x}\cdot\bm{x} p) \bm{k} \\
	&= (\bm{k}\cdot\bm{k}\,\bm{x} - \bm{x}\cdot\bm{k}\,\bm{k})x
		+ (- \bm{x}\cdot\bm{k}\,\bm{x} +  \bm{x}\cdot\bm{x}\,\bm{k})p \\
\end{aligned}
$$
<!--
Consider $m = 1$ and $n = 3$ with $x_1 < x_2 = k_1 = k < x_3$.
We have $A = x_1^2 + x_2^2 + x_3^2$,
$B = B_1 = x_1(k - x_1)$ and
$C_{11} = (k - x_1)^2$ so
$$
\begin{bmatrix}
x \\
p \\
\end{bmatrix}
=
\begin{bmatrix}
 x_1^2 + x_2^2 + x_3^2 & x_1(k - x_1) \\
x_1(k - x_1) & (k - x_1)^2 \\
\end{bmatrix}
\begin{bmatrix}
\lambda \\
\mu \\
\end{bmatrix}
$$
The determinant is $D = A(k - x_1)^2 - x_1^2(k - x_1)^2
= (x_2^2 + x_3^2)(k - x_1)^2$ so
$$
\begin{bmatrix}
\lambda \\
\mu \\
\end{bmatrix}
=
\frac{1}{(x_2^2 + x_3^2)(k - x_1)^2}\begin{bmatrix}
(k - x_1)^2 & -x_1(k - x_1) \\
-x_1(k - x_1) & x_1^2 + x_2^2 + x_3^2 \\
\end{bmatrix}
\begin{bmatrix}
x \\
p \\
\end{bmatrix}
$$
so
$$
\begin{aligned}
\lambda &= ((k - x_1)^2 x - x_1(k - x_1)p)/(x_2^2 + x_3^2)(k - x_1)^2 \\
\mu &= (-x_1(k - x_1)x + (x_1^2 + x_2^2 + x_3^2)p)/(x_2^2 + x_3^2)(k - x_1)^2 \\
\end{aligned}
$$

The probabilities are
$$
\begin{aligned}
\pi_1 &= - \lambda x_1 - \mu (k - x_1)^+
\pi_2 &= - \lambda x_2 - \mu (k - x_2)^+
\pi_3 &= - \lambda x_3 - \mu (k - x_3)^+
\end{aligned}
$$
-->
