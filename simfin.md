Simple Financial Model

Position: amount, instrument, (legal) entity. π = (a, i, e).

Market: (multi)set of positions, M = {..., π, ..., π', ...}

Netting: set of positions from adding amounts having the same instrument and entity.

Transaction: exchange of entities between two positions.

    { ..., (a, i, e), ..., (a', i', e'), ...}
<=>
    {..., (a', i', e), ..., (a, i, e'),  ...}

Transaction (accounting) price is X = a/a'. X a <=> 1 a'. 16 USD <=> 2 F has price 16/2 = 8.

Instrument: has future (random) prices and cash flows. X_t, C_t. C_t = 0 almost always

Present value: expected sum of future discounted cash flows. P_t = E_t[Σ_{u > t} C_u D_u]

Trading strategies are from the perspective of a single entity e where i is dollars or native currency.
Price and cash flow are vectors indexed by all available instruments, i' != i, in the market.

Trading strategy: buy amounts Γ_j at stopping times τ_j, j = 1,...,n.

Holdings: sum of shares traded. Δ_t = Σ_{τ_j < t} Γ_j = Σ_{s < t} Γ_s.

Value: of unwinding all holdings and last trade at current market price. V_t = (Δ_t + Γ_t) . X_t

Account: You receive the cash flows proportional to the amount
you hold and pay for the trades you just did. A_t = Δ_t . C_t - Γ_t . X_t

A trading strategy creates a synthetic instrument with price V_t and cash flow A_t.

If X_t D_t = E_t[Σ_{u > t} C_u D_u] then V_t D_t = E_t[Σ_{u > t} A_u D_u].

