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

$\int_t^u B_s\,ds = (u - t)B_t + \int_t^u (u - s)\,dBs$.

Term SOFR is an average of backward looking rates, similar to Fed Fund Futures settelment quote.

$S_t(t - h) = (1/h)\int_{t - h}^t f_s\,ds = r + \sigma B_t + (1/h) \sigma \int_{t-h}^t (t - s)\,dB_s$.

$F_t(t, t + h) = (1/h)(1/D_t(t + h) - 1) = (1/h)(\exp(rh - \sigma^2h^3/6 + \sigma hB_t) - 1)$.

$F_t(t, t + h) \approx r - \sigma^2h^2/6 + \sigma B_t$.

$S_t - F_t = (1/h) \sigma \int_{t-h}^t (t - s)\,dB_s + \sigma^2h^2/6$

Ho-Lee $f_t = r + \sigma B_t$. $f_t(u) = r - \sigma^2(u - t)^2/2 + \sigma B_t$.
