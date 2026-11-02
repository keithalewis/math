---
title: Vector Space Speed Run
author: Keith A. Lewis
header-includes:
	- \usepackage{bm}
---

\newcommand\bs[1]{\boldsymbol{{#1}}}
\newcommand\FF{\bs{F}}
\newcommand\CC{\bs{C}}
\newcommand\RR{\bs{R}}
\newcommand\NN{\bs{N}}
\newcommand\ZZ{\bs{Z}}
\newcommand\QQ{\bs{Q}}

https://wikihack.netlify.app/a/1451/apl-programming-language

Karpathy



Fasten your seatbelt.

If you don't know what a vector space is, just assume it
is the set of $n$-tuples $\RR^n = \{(x_1,\ldots,x_n)\mid x_j\in\RR, 1\le j\le n\}$
where $\RR$ is the _field_ of _real numbers_.
Any field will do, e.g., the _complex numbers_ $\CC$ or _finite
fields_ $\ZZ_p = \ZZ/p\ZZ$ of integers modulo a prime number $p$.
We will use $\FF$ to denote any field.

Vector spaces have a _scalar multiplication_ and _vector addition_.
For $a\in\FF$ and $x,y\in\FF^n$ the scalar multiplication is $a(x_i) = (ax_i)$
and the vector addition is $(x + y)_i = x_i + y_i$, $1\le i\le n$.

A different, but equivalent, way to represent $\FF^n$ is
the set of all functions $x\colon\{1,\ldots,n\}\to\FF$
where $x_i$ corresponds to $x(i)$.
There seems to be no generally accepted notation
to distinguish them other than what Alan Iverson invented and every
major hedge fund pays Aurthur Whitney a pile of money to use.

Tools of thought

The natural number $n\in\NN$ is not special. We can use any set $I$
and define the _set product_ $\Pi_I\FF = \Pi_{i\in I}\FF = \{(x_i)\mid x_i\in\FF, i\in I\}$.
The _set exponential_ $\FF^I = \{x\colon I\to\FF\}$ is equivalent
by identifying $x_i$ with $x(i)$, $i\in I$.

Let's give an explicit name to this implicit correspondence 
$\Pi = \Pi_{\FF,I}\colon\Pi_I\FF\to\FF^I$ where $(\Pi x)(i) = x_i$.

It is a _linear operator_.

__Exercise__. _Show $\Pi(a x + y) = a\Pi x + \Pi y$_.




