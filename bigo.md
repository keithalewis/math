---
title: Big O notation
author: Keith A. Lewis
institution: KALX, LLC
email: kal@kalx.net
classoption: fleqn
abstract: Back of the envelope calculations.
...

\newcommand\mb[1]{\boldsymbol{#1}}
\newcommand\bm[1]{\boldsymbol{#1}}
\newcommand\RR{\bm{R}}
\newcommand\FF{\bm{F}}
\newcommand\NN{\bm{N}}
\newcommand\LL{\mathcal{L}}
\newcommand\BB{\mathcal{B}}
\newcommand\ran{\operatorname{ran}}
\renewcommand\ker{\operatorname{ker}}
\newcommand\span{\operatorname{span}}

The expression $f(n) = O(n)$ means $f(n) \le Cn$ for some constant $C$
and every positive integer $n\in\NN$.
The function $f$ is not necessarily linear, but it is bounded by a linear function.

__Exercise__. _Show $f(n) = O(n)$ implies $c + f(n) = O(n)$ for any constant $c$_.

_Hint_. If $f(n) \le Cn$ then $c + f(n)\le (c + C)n$ for $n\in\NN$.

__Exercise__. _Show $f(n) = O(n)$ implies $cf(n) = O(n)$ for any constant $c$_.

_Hint_. If $f(n) \le Cn$ then $cf(n) \le (cC)n$ for $n\in\NN$.

The "big O" notation is an abuse of the equal sign. For example $n = O(n^2)$
and $n^2 = O(n^2)$ but it is not the case $n = n^2$.
It is better to read $f(n) = O(n)$ as $f(n)$ _is_ $O(n)$.
This can be made mathematically rigorous by defining
the set $O(n) = \{f\colon\NN\to\NN\mid f(n) \le Cn\text{ for some constant }C\}$
and interpret $f(n) = O(n)$ as $f\in O(n)$.

We can similarly define $f(n) = O(g(n))$ for any function $g$
to mean $f(n) \le Cg(n)$ for some constant $C$ and all $n\in\NN$.
We write this in the mathematically honest form $f\in O(g)$.

__Exercise__ _Show if $f_1\in O(g_1)$ and $f_2\in O(g_2)$ then
$f_1 + f_2\in O(g_1 + g_2)$ and $f_1f_2\in O(g_1g_2)$_.

Computers compute things that take time and space in memory.
Time is usually measured by the number of machine instructions
needed for an algorithm. Some algorithms can be run in _parallel_
and the time can be divided by the number of processors available.
Space cannot be subdivided but it can be _distributed_ across
multiple storage devices. The [CAP theorem](https://en.wikipedia.org/wiki/CAP_theorem)
proves limitations on the Consistency, Availability, and Partition tolerance.

> A distributed system is a system where I can’t get my work done because a
 computer has failed that I’ve never even heard of. -- Leslie Lamport

Big O notation is a useful way to express rough estimates.
It can help identify when a potential solution to a complicated problem
is not feasible by writing on the back of an envelope.
