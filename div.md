---
title: Dividends
author: Keith A. Lewis
institute: KALX, LLC
classoption: fleqn
fleqn: true
abstract: Dividend paying stock
...

\newcommand\Var{\operatorname{Var}}
\newcommand\Cov{\operatorname{Cov}}

This note describes how to incorporate dividends into stock valuation.
Recall the [Unified Model](um.html) shows arbitrage-free models are
parameterized by a vector-valued martingale $(M_t)_{t\in T}$ and
a positive deflator $(D_t)_{t\in T}$, where $T$ is the set of trading times.
The prices $(X_t)_{t\in T}$ and discrete cash flows $(C_t)_{t\in T}$
must satisfy
$$
	X_t D_t = M_t - \sum_{s\le t} C_s D_s, s < t.
$$

The Black-Scholes/Merton model with no dividends ($C_t = 0$) specifies
$M_t = (r, se^{\sigma B_t - \sigma^2 t/2})$ and $D_t = e^{-\rho t}$,
where $B_t$ is standard Brownian motion.
The price process is $X_t = M_t/D_t = (R_t, S_t)$ where
$R_t = re^{\rho t}$ is the _money market_
and $S_t = se^{\rho t + \sigma B_t - \sigma^2 t/2}$ is the _stock_.

## Fixed dividends

If a stock pays fixed dividends $d_j$ at times $t_j$ then $C_t = (d_j, 0)$, $t = t_j$
and is zero otherwise.

In this case we have
$$
S_t D_t = se^{\sigma B_t - \sigma^2 t/2} - \sum_{t_j\le t} d_j D_{t_j}
$$
so the price of the stock is a linear combination of lognormal random variables.
We assume, as customary, this can be approximated by a lognormal.

Letting $F_t = S_t D_t$ we have
$$
F_t = se^{\sigma B_t - \sigma^2 t/2} - \sum_{t_j\le t} d_j D_{t_j}
$$
and setting $f_j = E[F_{t_j}]$ gives
$$
E[F_t] = s - \sum_{t_j\le t} d_j D_j.
$$


## Proportional dividends

The Black-Scholes/Merton model of a bond and a stock uses the martingale
$M_t = (r, se^{\sigma B_t - \sigma^2 t/2})$ and deflator $D_t = e^{-\rho t}$.
The bond is a zero coupon bond having no cash flows. If the stock pays
dividend $d_j$ per share at $t_j$ then it has cash flows of $d_j S_{t_j}$ at $t_j$.
In this case we have
$$
S_t D_t = se^{\sigma B_t - \sigma^2 t/2} - \sum_{t_j\le t} d_j S_{t_j} D_{t_j}
$$
so the price of the stock is a linear combination of lognormal random variables.
We assume, as customary, this can be approximated by a lognormal.

Recall if $N$ is normal then $E[e^N] = e^{E[N] + \Var(N)/2)}$
so $E[e^{\sigma B_t - \sigma^2 t/2}] = 1$.
Letting $F_t = S_t D_t$ we have
$$
F_t = se^{\sigma B_t - \sigma^2 t/2} - \sum_{t_j\le t} d_j F_{t_j}
$$
and setting $f_j = E[F_{t_j}]$ gives
$$
E[F_t] = s - \sum_{t_j\le t} d_j f_j.
$$
Note $f_0 = s - d_0 f_0$ so $f_0 = s/(1 + d_0)$.
Taking $t = t_k$ yields $f_k = s - \sum_{j\le k} d_j f_j = f_{k-1} - d_k f_k$
so $f_k = s/\Pi_{j=0}^k(1 + d_j)$ hence
$$
E[F_t] = s - \sum_{t_k\le t} d_k f_k = s(1 - \sum_{t_k\le t} d_k/\Pi_{j=0}^k(1 + d_j)).
$$

## Cum-dividend

The _cum-dividend_ stock process assumes dividends are reinvested in the stock as they occur
in order to remove jumps.

## [Terminology](https://www.investopedia.com/terms/d/dividend.asp)

Announcement date
: Dividends are announced by company management on the announcement date,
and must be approved by the shareholders before they can be paid.

Ex-dividend date
: The date on which the dividend eligibility expires is called the
ex-dividend date or simply the ex-date. For instance, if a stock has
an ex-date of Monday, May 5, then shareholders who buy the stock on or
after that day will NOT qualify to get the dividend as they are buying
it on or after the dividend expiry date. Shareholders who own the stock
one business day prior to the ex-date—that is on Friday, May 2, or
earlier—will receive the dividend.

Record date
: The record date is the cut-off date, established by the company in
order to determine which shareholders are eligible to receive a dividend
or distribution.

Payment date
: The company issues the payment of the dividend on the payment date,
which is when the money gets credited to investors' accounts.

