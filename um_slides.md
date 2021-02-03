---
title: Unified Model
subtitle: How to value, hedge, and manage the risk of **any** portfolio
author: Keith A. Lewis
date: 4 Feb 2021
---

## What Quants Do

- Model prices and cash flows.
- Parameterize models to fit market data.
- Compute expected values and derivatives.
- Specify hedges.
- Provide measures of how good a hedge is.

::: notes
Not a talk about abstract math.
Nothing new. Things every practitioners knows.
Tie together things you already know in a bow.
Stop me if anything is not perfectly clear
:::

---

## What Quants Don't

- Provide realistic models.
- Specify _when_ to hedge.
- Use parameters traders understand.
- Manage risk.

::: notes
Continuous time is baloney. Heston model/Yield curves? Two fundamental problems. Double barrier option.
:::

---

## Holdings

### Holdings are the atoms of finance.

- A _holding_ $(i,a,e)$ is an _instrument_, _amount_, and _entity_.
- Instrument (_I_): stocks, bonds, futures, commodities, currencies, ...
- Amount (_A_): shares, notional, contracts, units, and physical quantity.
- Entity (_E_): individual or corporation owning the holding

::: notes
Instruments and entities change slowly over time. Amount depends on things. $A(I,E,T)$
:::

## Trades

### Holdings interact through _trades_.

- A trade $(t;i,a,e;i',a',e')$ is an exchange of holdings.
- At time $t\in T$ buyer $e$ exchanges $(i,a)$ for $(i',a')$ with seller $e'$.
- Price is $X = a/a'$ (after the trade).
- Buyers decide what and how much to exchange.
- Sellers quote a price for that.
- Buyer instrument is usually currency.

::: notes
Time depends on things. Price depends on things. $X(t;i,e;i',a',e')$. Heisenberg.
:::

---

## Price

Prices depend on when, the instruments, the entities,
and the amount the buyer wishes to acquire, among other things.

- The trade $(t;i,a'X,e;i',a',e')$ is avalable to $e$ from $e'$,
where $X = X(t;i,e;i',a',e')$.
- "Among other things" is denoted $\Omega$, the sample space.

::: notes
The sample space can be big.
:::

---

## Cash Flow

Stocks have dividends, bonds have coupons, futures have margin adjustments,
commodities have holding costs, ...

- Holding $(i,a)$ at time $t$ results in a cash flow $aC(t;i;i')$ of $i'$ at time $t$.
- Usually $i'$ is a currency, but payment-in-kind is possible.
- Cash flows are zero except at discrete times.
- Cash flows do not depend on entites, only on the issuer of $i$.

::: notes
Cash flows get short shrift in the MF literature. We do not model issuers
:::

---

## Market (Model)

A _market model_ specifies possible future prices and cash flows.

- Price: $X\colon T\times I\times E\times I' \times A'\times E' (\times \Omega)\to\bm{R}$.
- Cash Flow: $C\colon T\times I\times I'(\times\Omega)\to\bm{R}$.
- The trade $(t,i,a'X(t;i,e;i',a',e'),e;i',a',e')$ is available to the buyer.
- Assuming price does not depend on amount and $e$, $e'$ are understood...
- ... $X(t;i,e;i',a',e')$ is a vector-valued stochastic process $X_t\colon\Omega\to\bm{R}^I$
indexed by instruments

::: notes
It's not _the_ market. See Unified Finance for details.
:::

---

## Trading

A _trading strategy_ specifies when and what to trade.

- Trading times $τ_0 < τ_1 < \cdots$ and amounts $Γ_j\colon\Omega\to\bm{R}^I$.
- Position: $Δ_t = \sum_{τ_j < t} Γ_j = \sum_{s < t} Γ_s$.
- Value: $V_t = (Δ_t + Γ_t)\cdot X_t$ is the mark-to-market.
- Amount: $A_t = Δ_t\cdot C_t - Γ_t\cdot X_t$ shows up in the trade blotter.

::: notes
Want to get kicked off a trading floor? Trade when you can, not when you have to.
Almgren, ... Least Action???
:::

---

## Arbitrage

Arbitrage exists (for a model) if there exists a trading strategy that eventually
closes out with $A_{τ_0} > 0$ and $A_t\ge 0$, $t > τ_0$.

- Make money up front and never lose money until strategy is closed.
- _Closed out_ means the position is zero after some finite time.
- This definition does not depend on a measure.
- Traders consider RoI: $A_0/|Γ_0|\cdot |X_0|$.

::: notes
Closed out is essential. Just ask Nick Leeson.
:::

---

## FTAP

The Fundamental Theorem of Asset Pricing. No arbitrage if and only if there
exist _deflators_ $D_t\colon\Omega\to(0,\infty)$ such that
$$
X_tD_t = E_t[X_u D_u + \sum_{t < s \le u} C_s D_s],
$$
where $E_t$ is conditional expectation at time $t$.

- If $C_t = 0$, deflated prices are a martingale.
- As $u\to\infty$, value is discounted future cash flows.

---

## Lemma

If
$$
X_tD_t = E_t[X_u D_u + \sum_{t < s \le u} C_s D_s],
$$
then
$$
V_tD_t = E_t[V_u D_u + \sum_{t < s \le u} A_s D_s].
$$

Proof: High school algebra.

- Value corresponds to price, amount corresponds to cash flow.
- Trading strategies create synthetic market instruments.

::: notes
Does this formula exist in the literature?
:::

---

## FTAP...

Easy direction: deflators imply no arbitrage.

If $A_t \ge 0$, $t > 0$, then
$$
	V_0 D_0 = E_0[\sum_{t > 0} A_t D_t].
$$
Since $V_0 = Γ_0\cdot X_0 = -A_0$, there is no arbitrage.

---

### ...FTAP

Hard direction: no need to prove!

Given any vector-valued martingale $M_t$ and any deflator $D_t$
$$
	X_t D_t = M_t - \sum_{s \le t} C_s D_s
$$
is an arbitrage free model.

Proof: More high school algebra.

:::notes
Thank goodness!
:::

---

## Canonical Deflator

If the market has repos then $D_t = e^{-\int_0^t f_s\,ds}$ where $f_s$ is
the repo rate at time $s$.

- The repo/short rate determines the value of all fixed income instruments.

::: notes
You caught me!
:::

## Zero

A _zero coupon bond_ $D(u)$ has cash flow 1 at maturity $u$.

- $X_t D_t = E_t[D_u]$ so $X_t D_t = D_t(u)D_t = E_t[D_u]$ is
a martingale and
$$
	D_t(u) = E_t[D_u]/D_t = E_t[e^{-\int_t^u f(s)\,ds}]
$$
- Risky zero $D^{R,T}(u)$ has cash flow $C_u = 1(T > u)$ or $C_T = R1(T \le u)$.

## FRA

A _forward rate agreement_ $F^δ(t,u) has cash flow -1 at $t$ and $1 + fδ$ at $u$
where $δ$ is the day count fraction for the interval from $t$ to $u$.

- $X_0 = 0 = E[-D_t + (1 + fδ)D_u]$ so $f = (D(t)/D(u) - 1)/δ$.
- If $F^δ_s(t, u)$ is par forward at $s$ then
$$
	0 = X_s = E_s[-D_t + (1 + F_s(t,u)δ(t,u))D_u]
$$
so $E_s[D_t] = (E_s[D_u] + F_s δE_s[D_u])$ and  $F_s(t, u) = (D_s(t)/D_s(u) - 1)/δ(t,u).
- Note $D_s(t) = D_s(u) + F_sδ D_s(u)$ so $D_s(t) - D_s(u) = F_sδ D_s(u)$.

---

## Arrear

A FRA $\bar{F}(t,u)$ paying in _arrears_ has one cash flow $C_u = (f - F_t(t,u))δ$. 

- Model: $M_t = (E_t[D_u])_u$, $u >= t$, all zeros indexed by maturity.
- Trades: $τ_0 = t$, $Γ_t = +1_u$, $t_1 = u$, $Γ_u = -1_u$.
- FRA + trades = arrears.

---

## B-M/S

The Black-Merton/Scholes model is
$$
	M_t = (r, s e^{σ B_t - σ^2t/2}), D_t = e^{-ρt},
$$
so $X_t = M_t/D_t = (R_t,S_t)$ where $R_t = r e^{ρt}$, $S_t = se^{σ B_t + (ρ - σ^2)t/2}$.

- Fixed dividends $C_{t_j} = d$. Proportional dividends $C_{t_j} = pS_{t_j}$.
- No equilibrium arguments, self-financing portfolios, or Ito's lemma required.

---

## Hedge

Give a set of amounts $A_j$ at $t_j$ how do we find a trading strategy that
produces these?

- Since $V_0 = E[\sum_j A_j D_{t_j}] = Γ_0\cdot X_0$, $∂V_0/∂X_0 = Γ_0$.
- Since $V_j = E_j[\sum_{k > j} A_k D_{t_k}] = (Δ_j + Γ_j)\cdot X_j$,
$Δ_j + Γ_j = ∂V_j/∂X_j$ (Frechet derivative.)
- Note $Δ_{j + 1} - Δ_j = Γ_j$, so $Δ$ is delta and $Γ$ is gamma.
- This is _never_ a perfect hedge.

---

## Remarks

Trajectory of finance.

### Links

[Unified Model](https://keithalewis.github.io/math/um.html)
[Unified Finance](https://keithalewis.github.io/math/uf.html)
[Excel add-in libary](https://xlladdins.com)
