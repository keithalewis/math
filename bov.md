---
title: Bayesian Option Value
---

Given a distribution for $F$ and option values, how do we compute the posterior distribution.

## Example

$P(AB) = P(A)P(B|A) = P(B)P(A|B)$

$P(A|B) = P(A)P(B|A)/P(B)$.

$P(X = x) = q^x(1-q)^{1-x}$, $x\in\{0,1\}$, $0\le q\le 1$.

$P(X = x|X_1 = x_1) = P(X = x)P(X_1 = x_1|X = x)/P(X = x)$
