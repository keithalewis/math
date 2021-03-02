---
title: Duality
author: Keith A. Lewis
institution: KALX, LLC
email: kal@kalx.net
classoption: fleqn
abstract: Mirror, mirror, ...
...

\newcommand\RR{\bm{R}}
\newcommand\CC{\bm{C}}
\newcommand\FF{\bm{F}}
\newcommand\ker{\operatorname{ker}}
\newcommand\ran{\operatorname{ran}}

Duality shows up in many mathematical guises. One of the simplest is in the case of vector spaces.

If $V$ is a vector space over the real numbers $\RR$ then its dual, $V^*$, is the set of
all linear functionals from $V$ to $\RR$. The dual space is also a vector space with scalar
multiplication and vector addition defined pointwise: define $(tv^*)(u)
= t(v^*(u))$ and $(v^* + w^*)(u) = v^*(u) + w^*(u)$, $t\in\RR$, $u\in V$,
$v^*,w^*\in V^*$. The _dual pairing_ is $\langle v,v^*\rangle = v^*(v)$, $v\in V, $v^*\in V^*$.
Since $v^*\colon V\to\RR$ is a function, if we know $\langle v, v^*\rangle$ for all $v\in V$ we know $v^*$.

Linear transformations on vector spaces $T\colon V\to W$ have a notion of duality called _adjoint_.
Define $T^*\colon W^*\to V^*$ by $\langle v, T^*w^*\rangle = \langle Tv, w^*\rangle$, $v\in V$, $w^*\in W^*$.
