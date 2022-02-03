---
title: Set Functions
author: Keith A. Lewis
institute: KALX, LLC
classoption: fleqn
fleqn: true
abstract: More power to the functions
...

\newcommand\RR{\mathbf{R}}

A real-valued function on $X$, $f\colon X\to\RR$, assigns elements of the
set $X$ to real numbers in $\RR$.  A real-valued set function $σ\colon
\mathcal{P}(X)\to\RR$ assigns subsets of $X$ to real numbers in $\RR$,
where the _power set_ $\mathcal{P}(X)$ is the set of all subsets of $X$.
If $σ(E\cup F) = σ(E) + σ(F) - σ(E\cap F)$, $E,F\subseteq X$, and
$σ(\emptyset) = 0$ then $σ$ is a _measure_. Measures don't count things
twice and the measure of nothing is zero.

Newton's fundamental theorem of calculus demonstates how finding tangent
lines to the graph of a function on real numbers is related to the area
underneath its graph: $\int_a^b f'(x)\,dx = f(b) - f(a)$.
Special cases of finding areas bounded by curves had been solved
prior to Newton but he was the first to invent a systematic
treatment, aka calculus, for doing this. After a long train of
brilliant mathematicians following the scent Newton layed down
we now have the Generalized Stokes Theorem
$$
	\int_Ω dω = \int_{∂Ω} ω
$$
where $Ω$ is a region of $n$-dimensional space, $ω$ is a _smooth form_
on $Ω$, $∂Ω$ is the boundary of $Ω$, and $dω$ is the _differential_ of $ω$.

Newton's theorem is the 1-dimensional case where $Ω = [a,b]$ and $ω = f(x)$
is differentiable function.  In this case $dω = f'(x)\,dx$ is a 1-form
and $∂[a,b] = δ_b - δ_a$ is the difference of delta functions at the
endpoints of the interval.  We will not delve
furthur into the defintions and conditions required for this theorem,
but hopefully whet your appetite to learn more with another example.

Suppose $dx\,dy = -dy\,dx$. This implies $dx\,dx = 0$ when $y = x$
and makes it plausible that $d^2x = 0$.
Let $P(x,y)$ and $Q(x,y)$ be functions on $\RR^2$ and write
$P_x = ∂P/∂x$ for partial derivatives.
If $ω = P\,dx + Q\,dy$ is a 1-form then
$dω = d(P\,dx + Q\,dy) = dP\,dx + dQ\,dy = (P_x\,dx + P_y\,dy)dx + (Q_x\,dx + Q_y\,dy)dy
= P_y\,dy\,dx + Q_y\,dx\,dy = (Q_y - P_x)dx\,dy$ is a 2-form.
Green's theorem is the 2-dimensional case of Stokes theorem
$$
	\int_Ω (Q_y - P_x)dx\,dy = \int_{∂Ω} P\,dx + Q\,dy.
$$

Further reading: Grassmann, R. C. Buck.

A different train of brilliant thought led to considering how to extend the
set function on intervals $[a,b]\mapsto \int_a^b f$ to all sets
and for functions $f$ that might not be differentiable.
This led to many complications if the set function is required
to be countably additive. Integrating any bounded function
over a finitely additive measure is elementary.

Write $Y^X$ for the set of all functions from $X$ to $Y$. 
We can identify the power set $\mathcal{P}(X)$ with $2^X = \{0,1\}^X$
where $S\subseteq X$ corresponds to the _characteristic function_ $1_S$ with
$1_S(x) = 1$ if $x\in S$ and $1_S(x) = 0$ if $x\not\in S$.

Real-valued functions on $X$, $\RR^X$, are a vector space with pointwise
addition $(f + g)(x) = f(x) + g(x)$ and scalar multiplication $(af)(x)
= a f(x)$, $f,g\in\RR^X$, $a\in\RR$.  The _dual_ of a vector space $V$
is the set of all functions $v^*\in\RR^V\colon V\to\RR$ that are linear,
$v^*(av + w) = av^*(v) + v^*(w)$, $a\in\RR$ and $v, w\in V$. 
The _dual pairing_ is a function $\langle , \rangle\colon V\times
V^*\to\RR$ defined by $\langle v, v^*\rangle = v^*(v)$, $v\in V$,
$v^*\in V^*$.

A function $f$ is _bounded_ if there is a number $M\in\RR$ with
$|f(x)| \le M$ for all $x\in X$. The smallest number satifying this
is $\|f\|$, the _norm_ of $f$.
The set of bounded functions on $X$ is a _normed vector space_, $B(X)$.
A _norm_ on a vector space is a function $\|\cdot\|\colon V\to\RR$ that
satisfies $\|v\|\ge 0$, $\|av\| = |a| \|v\|$ and $\|v + w\| \le \|v\| +
\|w\|$, $v,w\in V$, $a\in\RR$. Norms induce a _metric_ $d(v, w) = \|v -
w\|$ that provides a _topology_ on $V$. A linear transformation $T\colon
V\to W$ is continuous in the metric topology if and only if it is bounded,
$\|Tv\| \le \|T\|\|v\|$.

The _dual_ of a normed vector space $V$ is the set of all function $\RR^V$ that are linear
and continuous/bounded.

