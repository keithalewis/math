---
title: FTAP History
author: Keith A. Lewis
---
\newcommand\bs[1]{\boldsymbol{{#1}}}
\newcommand\RR{\bs{{R}}}
\renewcommand\AA{\mathcal{A}}

Mathematical model.

$T$ - trading times

$I$ - instruments

$\Omega$ - sample space of possible outcomes

$(\AA_t)_{t\in T}$ - information at time $t$ is a partition of $\Omega$

$X_t\colon\AA_t\to\RR^I$ - prices

$C_t\colon\AA_t\to\RR^I$ - cash flows

$\tau_0 < \cdots < \tau_n$, $\Gamma_j\colon\AA_{\tau_j}\to\RR^I$ - trading strategy

$\Delta_t = \sum_{\tau_j < t} \Gamma_j = \sum_s < t} \Gamma_s$ - position

$V_t = (\Delta_t + \Gamma_t)\cdot X_t - value

$A_t = \Delta_t\codt C_t - \Gamma_t\cdot X_t$ - amount

$X_t D_t = (\sum_{u > t} C_u D_u)|_{\AA_t}$

$V_t D_t = (\sum_{u > t} A_u D_u)|_{\AA_t}$

## 1971

### [A. Beja](https://www.jstor.org/stable/2296388)

"The Structure of the Cost of Capital under Uncertainty"

>  The present study represents an attempt at a slightly different approach. We postulate
 the existence of equilibrium prices for capital assets under uncertainty, and then proceed to
 analyze the properties implicit in their definition. It is shown that some results can be
 derived without recourse to the way individuals make decisions, their detailed preferences
 or their subjective assessments of probabilities

Section II. $T$ finite times. $S$ state space, $(e_t^i)_i$ partition of $S$ at $t\in T$.
$Z = \RR^{\cup_{t,i} e_t^i}$ is prospect space.
