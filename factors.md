---
title: $n$-factor Models
author: Keith A. Lewis
institute: KALX, LLC
classoption: fleqn
fleqn: true
abstract: 2-factor models are 1-factor models
...

\newcommand{\NN}{\mathbf{N}}

Suppose $X_t = (B^1_t, B_2_t)$ where $B^1$ and $B^2$ are independent
standard Brownian motions. This process is used to define 2-factor models.

__Lemma__. _Every 2-factor model is parameterized by 1-dimensional standard Brownian motion_.

_Proof_: Chop 1-dimensional Brownian motion into pieces
over the intervals $[n, n + 1)$, $n\in\NN$. Gglue the even and odd pieces together
to create two continuous paths. This creates two independent Brownian motions out
of one.

__Exercise__. _Show every $n$-factor model is parameterized by 1-dimensional standard Brownian motion_.

