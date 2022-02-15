---
title: Elliptic Curves
author: Keith A. Lewis
institute: KALX, LLC
classoption: fleqn
fleqn: true
abstract: They're, like, totally modular dude.
...

\newcommand{\CC}{\bm{C}}

The set of points $(x,y)$ satisfying the quadratic eqution $y = ax^2 + bx + c$ is a parabola.
Replacing $x$ with $x/\sqrt{a}$ this becomes $y = x^2 + 2px + q$
where $2p = b/sqrt{a}$ and $q = c$.
Since $(x + p)^2 = x^2 + 2px + p^2$ we have
$$
y = (x + p)^2 - (p^2 - q) = (x + p + \sqrt{p^2 - 1})(x + p - \sqrt{p^2 - q} = (x - r)(x - s)
$$
where $r = -p - \sqrt{p^2 - q}$ and $s = -p + \sqrt{p^2 - q}$.
Of course we could also take
where $r = -p + \sqrt{p^2 - q}$ and $s = -p - \sqrt{p^2 - q}$ and get the same equation.
There is a two element group acting on the set of roots that leaves the quadratic equation
invariant. The identity is $(r,s)\mapsto (r,s)$ and the other element of the group
is $(r,s)\mapsto (s,r)$.

The fundamental theorem of algebra states for any polynomial $y = x^n + \sum_{j<n} a_j x^j$
there exist $n$ roots $r_j\in\CC$, $j < n$, with $y = \Pi_{j<n} (x - r_j)$.
The symmetric group of order $n$ acting on the roots leaves the polynomial invariant.

An _elliptic curve_ is the set of points $(x,y)$ satifying $y^2 = x^3 + a x^2 + b x + c$.
Note that an elliptic curve is not an ellipse.

__Exercise__. _Find $d$ such that $X = x - d$ satisfies $y^2 = X^3 + AX + B$ for some $A,B$_.

We will use the form $y^2 = x^3 + ax + b$ for elliptic curves in what follows.

__Exercise__. _If $P = (x,y)$ is on the curve then so is $-P = (x, -y)$_. 

_Hint_: $(-y)^2 = y^2$.

The first remarkable fact about elliptic curves is that an addition can be defined for
any two points $P$ and $Q$ on the curve. In general the line determined by $P$ and $Q$
intersects the curve at a third point $R$. Define $P + Q = -R$. Since the line
determined by $P$ and $Q$ is the same as the line determined by $Q$ and $P$
we have $Q + P = -R$ so addition is abelian.

__Exercise__. _If $Q = -P$ show only $P$ and $-P$ are the only points on the curve
determined by the line containing $P$ and $-P$_.

If $Q = -P$ we define $P + Q = P + (-P) = 0$.

If $P = (x_P,y_P)$ and $Q = (x_Q,y_Q)$ then $R = (x,y)$ satisfies
$y = m(x - x_P) + y_P$ where $m = (y_P - y_Q)/(x_P - x_Q)$ so
$(m(x - x_P) + y_P)^2 = x^2 + ax + b$.
