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
	X_t D_t = M_t - \sum_{s\le t} C_s D_s.
$$
__Exercise__. _Show_
$$
	X_t D_t = E_t[X_u D_u + \sum_{t < s \le u}C_s D_s], u \ge t,
$$ 
where $E_t$ is expected value conditioned on information available at time $t$.

_Hint_. $E_t[X_u D_u] = M_t - \sum_{s\le t} C_s D_s - \sum_{t < s \le u} E_t[C_s D_s]$.

We assume the model consists of two intruments, a money-market instrument $R$ and a stock $S$
The money-market instrument pays no cash flows and its price at time $t$ is $R_t = 1/D_t$. 
Note $R_tD_t = 1$ is a martingale. Let $D_t(u)$ be the value at time $t$ of a zero
coupon bond paying one unit at $u$. The exercise shows it must satisfy
$D_t(u)D_t = E_t[D_u]$ so
$$
	D_t(u) = E_t[D_u]/D_t.
$$

Forwards involve an interval of time. The value at time $t$ of a forward
contract paying $S_u - k$ at time $u \ge t$ is $E_t[(S_u - k)D_u]$.
The forward value of $S$ at $t$ expiring at time $u$ is the value of $k$ making this zero:
$$
	F_t(u) = E_t[S_u D_u]/E_t[D_u].
$$
If $S$ has no cash flows then $E_t[S_u D_u] = S_t D_t$ and
$F_t(u) = S_t/D_t(u)$ is the _cost of carry_ formula.

## Fixed dividends

If a stock pays fixed dividends $d_j$ at times $t_j$ then $C_t = (0, d_j)$ when $t = t_j$
and is zero otherwise.
Let $S^d_t$ denote the price of the dividend paying stock at time $t$.
Since $S^d_t D_t = S_t D_t - \sum_{t_j\le t} d_j D_{t_j}$, where $S_t D_t$ is a martingale
we have
$$
	S^d_t = S_t - \sum_{t_j\le t} d_j D_{t_j}/D_t.
$$
Note the value of a call or put option on a fixed dividend paying stock with strike $k$
is equal to the value of the corresponding call or put on the non-dividend paying stock with 
strike $k + \sum_{t_j\le t} d_j D_{t_j}/D_t$.

## Proportional dividends

If a stock pays proportional dividends $p_j$ at times $t_j$ then $C_t = (0, p_jS^p_{t_j})$ when $t = t_j$
and is zero otherwise, where
$S^p_t$ denotes the price of the dividend paying stock at time $t$.
Since $S^p_t D_t = S_t D_t - \sum_{t_j\le t} p_j S^p D_{t_j}$, where $S_t D_t$ is a martingale
we have
$$
	S^p_t = S_t - \sum_{t_j\le t} p_j S^p_{t_j} D_{t_j}/D_t.
$$
Note $S^p_0 = S_0$. At time $t_j$
$$
	S^p_j D_j = S_j D_j - \sum_{i \le j} p_i S^p_i D_i.
$$
Let $M_j = S_j D_j$, $M^p_j = S^p_j D_j$.
$$
	M^p_j = M_j - \sum_{i \le j} p_i M^p_i.
$$
$$
	(1 + p_j)M^p_j + \sum_{i < j} p_i M^p_i = M_j.
$$
$$
	S^p_j = S_j - \sum_{i \le j} p_i S^p_i D_i/D_j.
$$
$$
	S^p_j + \sum_{i \le j} p_i S^p_i D_i/D_j = S_j.
$$
$$
	S^p_j(1 + p_j) + \sum_{i < j} p_i S^p_i D_i/D_j = S_j.
$$
$$
	S^p_j(1 + p_j)D_j + \sum_{i < j} p_i S^p_i D_i = S_j D_j.
$$
$$
	S^p_{j+1}(1 + p_{j+1})D_{j+1} = S^p_j(1 + p_j)D_j - p_j S^p_j D_j + S_{j+1} D_{j+1} - S_j D_j.
$$
$$
	S^p_1(1 + p_1)D_1 = S^p_0(1 + p0) - p_0 S^p_0 D_0 + ΔM_0
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

