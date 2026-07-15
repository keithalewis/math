---
title: A Tale of Two Vector Spaces
author: Keith A. Lewis
---
\newcommand\bs[1]{\boldsymbol{{#1}}}
\newcommand\RR{\bs{R}}

When I was getting a "C" in my first linear algebra course I was told
$\RR^n$ was a set of $n$-tuples ${\{x = (x_1,\ldots,x_n)\mid x_j\in\RR, j = 1,\ldots n\}}$
where $\RR$ is the set of real numbers.
We used [@Ner1964] and when we got to determinants I noped out.
Who ordered those?

Eventually I got a PhD in Operator Theory and a job at Brown by solving
a problem about invariant subspaces of bounded linear operators
on Hilbert spaces. [@Beu1949] found all the invariant subspaces
of the unilateral shift operator in infinite dimensions.
If $S(x_1, x_2, \ldots)\mapsto(0,x_1, x_2, \ldots)$ then $S$ has
no eigenvectors, but it has plenty of invariant subspaces. 
Arne found all of them. It inspired generations of mathematicians to extend
his result. 

TODO: Gian Carlo Rota

He also solved the [Geheimschreiber teletype cipher](https://ciphermuseum.com/ciphers/beurling.html)
with pencil and paper in two weeks. To this day, nobody knows how he did that.

It wasn't until I started implementing math on computers that I realized
there was an equivalent, but different, definition.
If $A$ and $B$ are sets, then the _set exponential_ $B^A = \{f\colon A\to B\}$
is the set of all functions from $A$ to $B$.
We can identify $\RR^n$ with $\RR^{\{1,\ldots,n\}}$.
The tuple $x = (x_1,\ldots,x_n)$ can be identified with the function
$\bs{x}\colon\bs{n} \to\RR$ by $x_i = \bs{x}(i)$
where $\bs{n} = \{1,\ldots,n\}$ and $i\in\bs{n}$.

This can be used to show matrix multiplication is composition of linear operators.


## References
