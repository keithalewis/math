---
title: Vector Space Speed Run
author: Keith A. Lewis
header-includes:
	- \usepackage{bm}
---

\newcommand\bs[1]{\boldsymbol{{#1}}}
\newcommand\BB{\bs{B}}
\newcommand\CC{\bs{C}}
\newcommand\FF{\bs{F}}
\newcommand\NN{\bs{N}}
\newcommand\RR{\bs{R}}
\newcommand\ZZ{\bs{Z}}
\newcommand\QQ{\bs{Q}}
\renewcommand\ker{\operatorname{ker}}
\newcommand\ran{\operatorname{ran}}
\newcommand\LL{\operatorname{L}}
\newcommand\Hom{\operatorname{Hom}}
\newcommand\End{\operatorname{End}}

I assume you are familiar with the vector
space of $n$-tuples ${\RR^n = \{\bs{x} = (x_1,\ldots,x_n)\mid x_j\in\RR, 1\le j\le n\}}$
where $\RR$ is the _field_ of _real numbers_.
Any field[^1] will do, e.g., the _complex numbers_ $\CC$ or _finite
fields_ ${\ZZ_p = \ZZ/p\ZZ}$ of integers modulo a prime number $p$.
We will use $\FF$ to denote an arbitrary field.

[^1]: Mathematicians have to pick words to describe mathematical objects.
Richard Feynman said, "I learned very early the difference between knowing the name
of something and knowing something."

Vector spaces have a _scalar multiplication_ and _vector addition_.
For $a\in\FF$ and $\bs{x},\bs{y}\in\FF^n$ the scalar multiplication
and vector addition are defined _pointwise_ by
$(a\bs{x})_i = ax_i$
and ${(\bs{x} + \bs{y})_i = x_i + y_i}$, ${1\le i\le n}$.

A different, but equivalent, way to represent $\FF^n$ is
the set of all functions $x\colon\{1,\ldots,n\}\to\FF$
where $x_i$ corresponds to $x(i)$.

We now have two different, but equivalent, ways of
expressing the underlying field $\FF$.

__Exercise__: Show the field $\FF$ can be identified with the 1-tuple $\FF^1 = \{\{a\}\}\mid a\in\FF\}$ and the
set of all functions ${1}\to\FF$_.

For any set $I$ define the _set product_
${\Pi_I\FF = \Pi_{i\in I}\FF = \{\bs{x} = (x_i)\mid x_i\in\FF, i\in I\}}$.
The _set exponential_ ${\FF^I = \{x\colon I\to\FF\}}$ is equivalent by identifying $x_i$ with $x(i)$,
$i\in I$.

Let's give an explicit name to this implicit correspondence.
${\Pi = \Pi_{\FF,I}\colon\FF^I\to\Pi_I\FF}$ where ${(\Pi x)_i = x(i)}$.

This is our first example of a _linear operator_.

__Exercise__. _Show $\Pi(a x + y) = a\Pi(x) + \Pi(y)$_.

Hint: If $u,v\in\Pi_I\FF$ then $u = v$ if and only if $u_i = v_i$ for all $i\in I$.

__Exercise__. _Show $\Pi(ax) = aPi(x)$ and $\Pi(x + y) = \Pi(x) + \Pi(y)$,
$a\in\FF$, $x,y\in \Pi_I \FF$_.

_Hint_: Use $\Pi(0) = 0$ and $1x = x$.

If $V$ is a vector space then a subset $U\subseteq V$ is a _subspace_ if
it is closed under scalar multiplication and vector addition.
We can write this as $\FF U\subseteq U$ and $U + U\subseteq U$
where ${\FF U = \{au\mid a\in\FF, u\in U\}}$
and ${U + U = \{u + v\mid u,v\in U\}}$.

__Exercise__. _Show if $V$ and $W$ are vector spaces show their intersection $V\cap W$ and
sum $V + W$ are vector spaces_.

_Hint_: Show they are closed under scalar addition and vector multiplication.

Given a subspace $U\subseteq V$ define the _quotient_ space
${V/U = \{v + U\mid v\in V\}}$ with scalar multiplication
${a(v + U) = av + U}$ and vector addition ${(v + U) + (w + U)
= (v + w) + U}$.

__Exercise__. _Show $v + U = w + U$ if and only if $v - w\in U$_.

_Hint_: If $v + u = w + u'$ for some $u, u'\in U$ then $v - w = u' - u$.

__Exercise__. _Show scalar multiplication and vector addition
are well-defined_.

_Hint_: This means if ${v + U = w + U}$ then ${av + U = aw + U}$
and if ${v' + U = w' + U}$ then ${(v + v') + U = (w + w') + U}$.

Let ${\LL(V,W) = \{T\colon V\to W\mid T\text{ is linear}\}}$ be the set of all
linear operators from the vector space $V$ to the vector space $W$.
It is also a vector space with scalar prodcut $(aT)(v) = a(T(v))$
and vector addition $(T + U)(v) = T(v) + U(v)$, $a\in\FF$, $v\in V$.
This is also written as $\Hom(V,W)$ for the set of _homomorphism_:
functions that preserve the vector space structure.
If $V = W$ we write $\End(V)$ for $\Hom(V,V)$, the set of _endomorphisms_
for a vectorspace to itself.

The _kernel_ of a linear oprator $T\in\LL(V,W)$ is
$\ker T = \{v\in V\mid Tv = 0\}$ and the _range_
is $\ran T\{Tv\mid v\in V\}\subseteq W$.


## TODO

$\sigma\colon\nn\to\nn$ premutation. $\sigma(i j \ldots)$ is $0\to i$, $1\to j$, $\ldots$.

_Curry_ pre $,\colon(A\times B)^C\to A^{(B^C)}$ by $(,f(a))(b) = f(a,b)$.

_Uncurry_ post $,\colon A^{(B^C)}\to(A\times B)^C$ by $g,(a,b) = (g(a))b$

__Exercise__. _Show $(,f), = f$ and $,(g,) = g$_.

If $J\subseteq I$ and $x\in\FF^I$ then $x(J)\colon\FF^I\to\FF^J$

$()\colon\FF^I\times 2^I\to\FF^J$ by $()(x,J) = x(J)$ with $x(J)(j) = x(j)$, $j\in J$.

$R$ a relation on $\FF$ then $R\colon\FF^I\times\FF^I\to\BB^I$ is
defined by $(x R y)(i) = x(i) R y(i)$ for $i\in I$.

_mask_/_replicate_ $/\colon\NN^I\times\FF^I\to\FF^J$
For $m\in\NN^I$ and $x\in\FF^I$ repeats $x(i)$ $m(i)$ times.

$\FF^{I_\le}$

https://wikihack.netlify.app/a/1451/apl-programming-language

Karpathy

$\FF^n$ and $\FF^{\bs{n}}$

Replace $\bs{n}$ by any index set $I$.
$\FF^I$ for any index set $I$. $\Pi_I\FF$.

Products have _projections_.  
$\pi_i\colon\Pi_I\FF$ by $\pi_i(x_1,\ldots,x_n) = x_i$ projections.

How do we write this without dots?  
Products are mathematically problematical.

Aside: $(a,b) = \{\{a\},\{a,b\}\}$

$\pi_A\colon A\times B\to A$, $\pi_B\colon A\times B\to B$.  
If $p_A\colon C\to A$ and $p_B\colon C\to B$ then there
exists $p\colon C\to A\times B$ with $p_A = \pi_A p$
and $p_B = \pi_B p$.

Exercise. Any set with this property is isomorphic to the product.

Exercise. $x = y$ if and only if $\pi_i(x) = \pi_i(y)$ for all $i\in I$.

Hint: Use abstract definition???

Set exponentials have _evaluations_.  
$e_i\colon\FF^I\to\FF$ by $e_i(x) = x(i)$.

Exercise. $x = y$ iff $e_i(x) = e_i(y)$ for all $i\in I$.

Hint: This is just function equality.

One reason to prefer exp to prod.

Define $\Pi_I\colon\FF^I\to\Pi_{i\in I}\FF$ by
$\pi_i\Pi_I = e_i$ on $\FF^I$.

Exercise: $x = \sum_i x(i) e_i$.

span, independent

Euclidean norm. Sup-norm, $p$-norm $(\FF^I)_p$ ?

Every norm gives same topology. $x_n\to x$ on one topology implies all topologies..

$\|x\|_1 \le \|x\|_p \le \|x\|_\infty$.

$(\FF^I)^* \cong \FF^I$$

Define $*\colon (\FF^I)^*\to\FF^I$ by $(*x)(i) = x(e_i)$.
