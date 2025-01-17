---
title: LIBOR Market Model
---

\renewcommand{\AA}{\mathcal{A}}

Instantaneous short (repo) rate $(f_t)$.

Stochastic discount $D_t = \exp(-\int_0^t f_s\,ds)P$.

$D_t(\Omega) = \exp(-\int_0^t f(s)\,ds)$.

$D_t(u)P = (D_u/D_t)|_{\AA_t} = \exp(-\int_t^u f_t(s)\,ds)P$

Futures $\phi_t(u)P = f_u P|_{\AA_t}$.
