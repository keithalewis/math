---
title: A Tale of Two Vector Spaces
author: Keith A. Lewis
---
\newcommand\bs[1]{\boldsymbol{{#1}}}
\newcommand\RR{\bs{R}}

When I was getting a "C" in my first linear algebra course I was taught
$\RR^n$ was a product of $n$-copies of the real numbers
${\Pi_{i=1}^n \RR = \{x = (x_1,\ldots,x_n)\mid x_i\in\RR, i = 1,\ldots n\}}$.
We used [@Ner1964] and when we got to determinants I noped out.
Who ordered those?

Eventually I got a PhD in Operator Theory and a job at Brown by solving
a problem about closed invariant subspaces of bounded linear operators
on Hilbert spaces. [@Beu1949] found all the invariant subspaces
of the unilateral shift operator in infinite dimensions.
If $S(x_1, x_2, \ldots)\mapsto(0,x_1, x_2, \ldots)$ then $S$ has
no eigenvectors, but it has plenty of invariant subspaces. 
Arne found all of them. Beurling inspired generations of mathematicians to extend
his result. 

He also solved the [Geheimschreiber teletype cipher](https://ciphermuseum.com/ciphers/beurling.html)
with pencil and paper in two weeks. To this day, nobody knows how he did that.

It wasn't until I started implementing math on computers that I realized
there was an equivalent, but different, definition of a vector space.
If $A$ and $B$ are sets, then the _set exponential_ ${B^A = \{f\colon A\to B\} = \{A\to B\}}$
is the set of all functions from $A$ to $B$.
We can identify $\RR^n$ with ${\RR^{\{1,\ldots,n\}}}$.
The tuple ${x = (x_1,\ldots,x_n)}$ can be identified with the function
${\bs{x}\colon\bs{n} \to\RR}$ by ${x_i = \bs{x}(i)}$
where ${\bs{n} = \{1,\ldots,n\}}$ and ${i\in\bs{n}}$.
We use bold font to distinguish the product from the exponential vector space definitions.

The _standard basis_ of $\RR^n$ is $\{e_i\}_{i=1}^n$ where $e_i$ is an
$n$-tuple of 0's except for a 1 in the $i$-th index so
${(x_1,\ldots,x_n) = x_1 e_1 + \cdots + x_n e_n}$.  The corresponding
basis of ${\RR^{\bs{n}}}$ is $\{\bs{e}_i\}_{i=1}^n$ where $\bs{e}_i(j) = \delta_{ij}$,
the _Kronecker delta_, so $\bs{x} = \sum_{i=1}^n \bs{x}(i)\bs{e}_i$.

The exponential definition is more flexible. Given any set $I$, $\RR^I$ is a vector space.
Define the scalar multiplication and vector addition _pointwise_ by
${(a\bs{x})(i) = a(\bs{x}(i))}$ for ${a\in\RR}$ and
${(\bs{x} + \bs{y})(i) = \bs{x}(i) + \bs{y}(i)}$ for ${\bs{x},\bs{y}\in\RR^I}$.

An _abstract vector space_ is any abelian (commutative) group $V$ having
a scalar multiplication that satisfies the distributive laws
${a(x + y) = ax + ay}$ and ${(a + b)x = ax + bx}$ for $a,b\in\RR$ and $x,y\in V$.
It is not trivial to show every finite dimensional abstract vector space of dimension $n$ is isomorphic
to $\RR^n$ so why bother with the abstract definition?

Every finite dimensional vector space has 

Recall a function ${T\colon\RR^n\to\RR^m}$ is a _linear operator_ if ${T(ax + y) = aTx + Ty}$
for $a\in\RR$ and $x,y\in\RR^n$. The set of all linear operators from vector space $V$
to vector space $W$ is denoted in various ways. The category theoretic teminology is
${\operatorname{Hom}(V,W)}$ for the set of all _homomorphisms_. The most common is $\mathcal{L}(V,W)$.
If the vectors spaces have an associated topology then $\mathcal{B}(V,W)$ indicates
all continuous operators. In finite dimensions all continuous linear operators
are $\mathcal{B}$ounded. We will use the non-standard notation
${[V\to W] = \{T:V\to W\mid T\text{ is linear}\}}$.

__Exercise__. _Show if $T\colon V\to W$ is linear then $T(ax) = a(Tx)$ and $T(x + y) = Tx + Ty$
for $a\in\RR$ and $x,y\in V$_.

Note the scalar multiplication and vector addition on the right-hand side of these equations
is occuring in $W$.

The _dual_ of a vector space $V$ is the space of all _linear functionals_ ${V^* = [V\to\RR]}$.

We can define a function ${}^*\colon\RR^n\to\RR^{\bs{n}}$


This can be used to show matrix multiplication is composition of linear operators.

## References
