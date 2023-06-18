---
title: SOFR, so Good
author: Keith A. Lewis
institute: KALX, LLC
classoption: fleqn
fleqn: true
abstract: One more thing to figure out.
...

SOFR is the Secured Overnight Financing Rate. Quants should be overjoyed
that there is a highly liquid market instrument that is a proxy
for the continously compounded risk-free forward rate, $f_t$.
The reality is that SOFR can spike, as it did in September 2019.

$D_t = \exp(-\int_0^t f_s\,ds)$.

$D_t(u) = E_t[D_u]/D_t = \exp(-\int_t^u f_t(s)\,ds)$.

Term SOFR is an average of backward looking rates, similar to Fed Fund Futures settelment quotes.

$S_t(t - h, t) = (1/h)\int_{t - h}^t f_s\,ds$

Forward rate at $t$ over $[t, t + h]$.

$F_t(t, t + h) = (1/h)(1/D_t(t + h) - 1) \approx (1/h)\int_t^{t + h} f_t(s)\,ds$

## Ho-Lee

$f_t = r(t) + \sigma B_t$.

$f_t(u) = r(t) - \sigma^2 (u - t)^2/2 + \sigma B_t$_.

$\int_t^u B_s\,ds = \int_t^u s\,dB_s + (u - t) B_t$.
