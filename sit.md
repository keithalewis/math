---
title: Some Interesting Things
author: Keith A. Lewis
abstract: Uncategorized thoughts.
---

At least to me.

A timeseries $(X_n)_{n\ge 0}$ is determined by all finite joint distributions.

To have a chance to apply statistics to observed sample paths we need to assume
(strict) stationarity: $(X_n)$ and $(X_{n+k})$ have the same law for any $k > 0$.

Kolmogorov showed there exists a positive _spectral measure_ $dF$ on the
boundary of the unit disk $D = \{z\mid |z| < 1\}$.
$$
	\Cov(X_n, X_{n + k}) = \int_{\partial D} z^k dF(t).
$$

Parameterize by Bernolli series?
