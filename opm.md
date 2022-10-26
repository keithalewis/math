---
title: One Period Model
author: Keith A. Lewis
institution: KALX, LLC
email: kal@kalx.net
classoption: fleqn
abstract: Buy now, sell later
...

\newcommand\RR{\mathbf{R}}
\newcommand\Var{\operatorname{Var}}
\newcommand\Cov{\operatorname{Cov}}

Let $I$ be the set of _instruments_ available for trading over a period of time
and $Ω$ be the set of what can happen over the period.
The _prices_ at the beginning of the period are $x\in\RR^I$ where $x_i = x(i)\in\RR$ is the initial
price of instrument $i\in I$.
The prices at the end of the period are $X\colon\Omega\to \RR^I$ where $X(\omega)\in\RR^I$
are the instrument prices if $\omega\in\Omega$ occurred.

A _position_ $\xi\in\RR^I$ is the number of shares of each instrument purchased
at the beginning of the period. Its value at the beginning of the period
is $\xi\cdot x$ and its value at the end of the period is $\xi\cdot X(\omega)$
given $\omega\in\Omega$ occurred. The _realized return_ of $\xi$
is the function $R_\xi = \xi\cdot X/\xi\cdot x$.

__Exercise__. _Show $R_\xi = R_{t\xi}$ for any non-zero $t\in\RR$_.

If $\xi\cdot x\not=0$ there exists $t\in\RR$ with $t\xi\cdot x = 1$
so $R_{t\xi} = \xi\cdot X$. One unit invested proportional to $\xi$
returns this amount.

Assume $P$ is a probability measure on $\Omega$.

A portfolio $\xi\in\RR^I$ is _efficient_ if $\Var(R_\xi) \le \Var(R_\eta)$
whenever $E[R_\xi] = E[R_\eta]$, $\eta\in\RR^I$.

Given a realized return $R$ we can find an efficient portfolio by
minimizing $\Var(R_\xi)$ given $E[R_\xi] = R$. This can be solved using Lagrange
multipliers by minimizing
$$
	\frac{1}{2}\Var(\xi\cdot X) - \lambda(\xi\cdot x - 1) - \mu(E[\xi\cdot X] - R)
$$

If $\Sigma = E[XX'] - E[X]E[X']$, where prime denotes transpose, then the first order condition is
$$
	0 = \xi'\Sigma - \lambda x' - \mu E[X']
$$
where $\xi\cdot x = 1$ and $E[\xi\cdot X] = R$. Assuming $\Sigma$ is invertible
$$
	\xi = \Sigma^{-1}(\lambda x - \mu E[X]).
$$
Note every optimal portfolio is a linear combination of $\Sigma^{-1}x$ and $\Sigma^{-1}E[X]$.

A portfolio $\xi\in\RR^I$ is _efficient_ if $E[R_\xi] \ge E[R_\eta]$
whenever $\Var(R_\xi) = \Var(R_\eta)$, $\eta\in\RR^I$.

Given a variance $V$ we can find an efficient portfolio by
minimizing $E[R_\xi]$ given $\Var(R_\xi) = V$. This can be solved using Lagrange
multipliers by minimizing
$$
	E[\xi\cdot X] - \lambda(\xi\cdot x - 1) - \frac{\mu}{2}(\Var(\xi\cdot X) - V)
$$
The first order condition is
$$
	0 = E[X'] - \lambda x' - \mu \xi'\Sigma
$$
where $\xi\cdot x = 1$ and $\Var(\xi\cdot X) = V$. Assuming $\Sigma$ is invertible
$$
	\xi = \Sigma^{-1}(E[X] - \lambda x)/\mu.
$$
Note every optimal portfolio is a linear combination of $\Sigma^{-1}E[X]$ and
$\Sigma^{-1}x$ so the two definitions of efficient portfolio agree.

__Exercise__. _If $\xi_0\not=\xi_1$ are any two optimal portfolios then
every optimal portfolio is a linear combination of $\xi_0$ and $\xi_1$_.

_Hint_: $\xi_0 = a\Sigma^{-1}x + b\Sigma^{-1}E[X]$ and
$\xi_1 = c\Sigma^{-1}x + d\Sigma^{-1}E[X]$ for some $a,b,c,d\in\RR$ with
$ad - bc\not=0$.

## CAPM

The Capital Asset Pricing model assumes there are two optimal portfolios,
one having variance 0 and the other is called the _market portfolio_.
If $\Var(R_\zeta) = 0$ then $\zeta\cdot X$ is a constant which we may
assume is 1.  This is called a _zero coupon bond_ and $\zeta\cdot x = 1/R_\zeta$
is its initial price, called the _discount_. Let $\mu\in\RR^I$ be the market portfolio
with $\mu\cdot x = 1$.

Every optimal portfolio $\xi$ can be written as $\xi = \alpha\zeta + \beta\mu$ for
some $\alpha,\beta\in\RR$ and we may assume $\xi\cdot x = 1$
so $1 = \xi\cdot x = \alpha/R_\zeta + \beta$ and $R_\zeta = \alpha + \beta R_\zeta$.
Taking a dot product with $X$ in $\xi = \alpha\zeta + \beta\mu$ gives
$R_\xi = \alpha + \beta R_\mu$ hence
$$
	R_\xi - R_\zeta = \beta(R_\mu - R_\zeta).
$$

__Exercise__. _Show $\beta = \Cov(R_\xi,R_\mu)/\Var(R_\mu)$_.

_Hint_: $\Cov(R_\xi - R_\zeta, R_\mu) = \Cov(\beta(R_\mu - R_\zeta), R_\mu)$.

The usual CAPM formula is $E[R_\xi] - R_\zeta = \beta(E[R_\mu] - R_\zeta)$
but a much stronger result holds: there is an equality between random variables,
not just their expectations.


<!--

## Derivative

A _derivative instrument_ is a function $A\colonΩ\to\RR$ that pays some _amount_
at the end of the period depending on what happened.
If there is a $γ\in\RR^I$ with
$γ\cdot X = A$ then there is a perfect hedge. The _cost_ of
setting up the hedge at the beginning of the period is $γ\cdot x$.

If more things can happen than the number of instruments then it is not
the case perfect hedges always exist.  The usual case is that they do
not and risk management involves the study of how well a derivative can
be hedged.
The basic problem of one-period hedging is to find $γ\in\RR^I$ such that
$γ\cdot X - A$ is "minimized" in some sense.

## Arbitrage

The cost of acquiring $γ$ shares of each instrument at the beginning
of the period is $γ\cdot x$. If that is negative then you make money.
At the end of the period you close the position by selling all of your
shares.  This results in a cash flow of $γ\cdot X$ to your account.
If that is non-negative then you don't lose money.  A one period model
has _arbitrage_ if there exists $γ\in \RR^I$ with $γ\cdot x <
0$ and $γ\cdot X(\omega)\ge0$, $\omega\inΩ$.

## FTAP

The one-period Fundamental Theorem of Asset Pricing states that there is no
arbitrage if and only if there exists a non-negative measure $\Pi$ on $Ω$
such that $x = \int_Ω X\,d\Pi$. If such a measure exists and
$γ\cdot X\ge 0$ then $γ\cdot x \ge 0$ so there is no arbitrage.

We assume $X$ is bounded and $\Pi$ is finitely additive.

**Lemma.** _If $x\in\bm{R}^n$ and $C$ is a closed cone in
$\bm{R}^n$ with $x\not\in C$ then there exists $ξ\in\bm{R}^n$
with $ξ\cdot x < 0$ and $ξ\cdot y \ge0$ for $y\in C$._

Recall that a _cone_ is a subset of a vector space closed under addition
and multiplication by a positive scalar, that is, $C + C\subseteq C$
and $tC\subseteq C$ for $t > 0$.
For example, the set of arbitrage positions is a cone.

_Proof._ Since $C$ is closed and convex there exists $x^*\in C$ with
$0 < ||x^* - x|| \le ||y - x||$ for all $y\in C$.  Let $ξ = x^* - x$.
For any $y\in C$ and $t > 0$ we have $ty + x^*\in C$ so $||ξ|| \le ||ty + ξ||$. 
Simplifying gives $t^2||y||^2 + 2tξ\cdot y\ge 0$. 
Dividing by $t > 0$ and letting $t$ decrease to 0 shows $ξ\cdot y\ge 0$. 
Take $y = x^*$ then $tx^* + x^*\in C$ for $t \ge -1$. By similar reasoning,
letting $t$ increase to 0 shows $ξ\cdot x^*\le 0$ so $ξ\cdot x^* = 0$. 
Since $0 < ||ξ||^2 = ξ\cdot (x^* - x) = -ξ\cdot x$ we have $ξ\cdot x < 0$.
$\blacksquare$

The set of non-negative finitely additive measures is a closed
cone and $X\mapsto \int_Ω X\,d\Pi$ is positive, linear, and continuous
so $C = \{\int_Ω X\,d\Pi \mid \Pi\ge 0\}$ is also a closed cone.
The contrapositive of the FTAP follows from the lemma.

The proof also shows how to find an arbitrage when one exists.
For example, if $Ω$ is a singleton then the cone generated by $X(Ω)$
is $\{tX(ω)\mid t \ge 0\}$ where $Ω = \{ω\}$.  The projection onto the
ray is $e\otimes e$ where $e = X(ω)/\|X(ω)\|$ so $ξ = (x\cdot e)e - x$
is an arbitrage unless $x$ is a positive scalar multiple of $X(ω)$.

Note that the lemma is a purely geometric fact that does not involve measures.
It is usually called Farkas' lemma and is a special case of the Hahn-Banach theorem
in finite dimensional space.

## Hedging

Given a derivative payoff $A$ at the end of the period we wish to
minimize, in some sense, $γ\cdot X - A$ over available hedges $γ\in\RR^I$.

__Lemma__. _Using the notation above $(γ\cdot X - A)^2 = \|(XX')^{1/2}(γ - XA/X'X)\|^2$ on $Ω$_.

Letting $Σ = (XX')^{1/2}$ we have 
$$
	\|Σγ - Σ^{-1}XA\|^2 = γ'XX'γ - 2γ'XA + X'(XX')^{-1}X A^2
$$
so 
$$
\begin{aligned}
(γ\cdot X - A)^2 &= γ'XX'γ - 2γ'XA + A^2 \\
	&= \|Σγ - Σ^{-1}XA\|^2 - X'(XX')^{-1}X A^2 + A^2.\\
\end{aligned}
$$
Since $(XX')X = X(X'X)$ the matrix $XX'$ has eigenvector $X$ with eigenvalue $V = X'X$
as functions on $Ω$.
This implies $Σ^{-1}X = X/\sigma$ and $X'(XX')^{-1}X = 1$ hence
$$
	(γ\cdot X - A)^2 = \|Σ γ - XA/\sigma\|^2 = \|Σ(γ - XA/σ^2)\|^2.
$$

Given a probability measure on $Ω$, $E[(γ\cdot X - A)^2]$ is minimized
when $γ - E[XX']^{-1}E[XA] = 0$. This is analogous to $γ - XA/σ^2$
being "minimized" over $Ω$. 

If $Ω = \{ω\}$ is a singleton then $γ^* = X(ω)A(ω)/\|X(ω)\|^2$ is the natural choice for the
best estimate. If the model is arbitrage free then $Rx = X(ω)$ for some $R > 0$ and
$γ\cdot x = A(ω)/R$ is the cost of the hedge. In this case $γ\cdot X(ω) = A(ω)$ replicates the derivative
and $X(ω)X'(ω) = R^2xx'$ so $R = \|X\|/\|x\|$.

If $Ω = \{ω_0, ω_1\}$ has two points then $XX'$ is rank two.
If $u,v\in\RR^I$ then the SVD of $uu' + vv'$ in terms of the basis $\{u,v\}$ has eigenvalues 
$$
(a^2 + c^2 \pm \sqrt{(a^2 - c^2)^2 + (2b)^2})/2
$$
where $a^2 = u'u = \|u\|^2$,
$c^2 = v'v = \|v\|^2$, and
$b = u'v = v'u = ρac$.
Note $\|u \pm v\|^2 = a^2 \pm 2b + c^2$.
The eigenvectors are
$$
(a^2 - c^2 \pm \sqrt{(a^2 - c^2)^2 + (2b)^2}, 2b).
$$
Note these are orthogonal and if $a = c$ the eigenvalues are
$a^2 \pm b$, and the eigenvectors are $2(\pm b, b)$

Using $\sqrt{d + x} \approx \sqrt{d} + x/2\sqrt{d}$ for small $x$, the eigenvalues for small $ρ$
are $(a^2 + c^2 \pm |a^2 - c^2| + 2b^2)/2$.
If $a \ge c$ these are $a^2 + b^2/sqrt{a^c - c^2}$ and $c^2 - b^2/sqrt{a^c - c^2}$.
The corresponding eigenvectors are
$(a^2 - c^2 \pm |a^2 - c^2| + 2b^2, 2b)$.
If $a \ge c$ these are $2(a^2 - c^2 + b^2, b)$ and $2(-b^2, b)$.

$$
-(a^2 - c^2 + b^2)b^2 + (b+e)^2$.
= -(a^2 - c^2 + b^2)b^2 + b^2 + 2be + e^2$
$$
$$
	e = -b \pm \sqrt{b^2 + b((a^2 - c^2 + b^2)b^2}
$$

Let $d^2 = a^2 - c^2$ assuming $a \ge c$.
$$
\|(d \pm \sqrt{d^2 + 4b^2})u + 2bv\|^2
$$
$$
= (d \pm \sqrt{d^2 + 4b^2})^2 u'u
  + 2(d \pm \sqrt{d^2 + 4b^2})2b u'v
  + 4b^2 v'v
$$  
$$  
= (d \pm \sqrt{d^2 + 4b^2})^2 a^2
  + 4(d \pm \sqrt{d^2 + 4b^2})b^2
  + 4b^2 c^2
$$
$$
= (d^2 \pm 2d\sqrt{d^2 + 4b^2} + d^2 + 4b^2) a^2
  + 4(d \pm \sqrt{d^2 + 4r^2})b^2
  + 4b^2 c^2
$$
$$
= (a^2d^2 \pm 2a^2d\sqrt{d^2 + 4b^2} + a^2d^2 + 4a^2b^2)
  + 4b^2d \pm 4b^2\sqrt{d^2 + 4r^2}
  + 4b^2 c^2
$$
$$
= 2a^2d^2 + 4a^2b^2
+ 4b^2d
+ 4b^2 c^2
\pm (2a^2d + 4b^2)\sqrt{d^2 + 4b^2}
$$

In general we can do a principal component analysis on $\{X(ω)A(ω)/\|X(ω)\|^2\mid ω\in Ω\}$ and
choose $γ^*$ to be first principal component.

Fix a probability measure and let $Σ = E[XX']^{1/2}$ so
$$
\begin{aligned}
E[(γ\cdot X - A)^2] &= γ'E[XX']γ - 2E[X'A]γ + E[A^2]\\
	&= \|Σγ - Σ^{-1}E[XA]\|^2 - \|Σ^{-1}E[XA]\|^2 + E[A^2].\\
\end{aligned}
$$
This has minimum value $E[A^2] - E[X'A]E[XX']^{-1}E[XA]$ when $γ = E[XX']^{-1}E[XA]$.
The least squares minimum does not depend on initial prices $x$, but we are only
interested in arbitrage free models. In this case we have $x = \int X\,dΠ = E[X]\|Π\|$
where we use the probability measure $P = Π/\|Π\|$.


### Two Instruments

Let $x = (r, s)$, $r,s\in\RR$ and $X = (R, S)$, $R,S\colonΩ\to\RR$.
We may assume $r = s = 1$. The matrix $XX'$ has eigenvectors
$(R/S, 1)$ and $(-S/R, 1)$ with eigenvalues $σ^2 = R^2 + S^2$ and $0$, respectively.

We have
$$
E[XX'] = \begin{pmatrix} E[R^2] & E[RS] \\ E[SR] & E[S^2] \end{pmatrix}
$$
and
$$
E[XX']^{-1} = \frac{1}{E[R^2]E[S^2] - E[RS]^2} 
\begin{pmatrix} E[S^2] & -E[RS] \\ -E[SR] & E[R^2] \end{pmatrix}
$$
The eigenvalues of $E[XX']$ are
$$
(E[R^2] + E[S^2] \pm \sqrt{(E[R^2] - E[S^2])^2 + 4 E[RS]^2})/2
$$
and
The corresponding eigenvectors are
$$
((E[R^2] - E[S^2] \pm \sqrt{(E[R^2] - E[S^2])^2 + 4 E[RS]^2})/2E[RS], 1).
$$

$E[X^2] = E[X]^2 + Var(X)$

-->
