Market
	X_t - prices at time t indexed by instruments
	C_t = cash flows at time t indexed by instruments

Trading
	(τ_j, Г_j) - times and trades with τ_0 < ··· < τ_n
	Δ_t - position ∑_{τ_j < t} Γ_j = ∑_{s < t} Γ_s.

Accounting
	V_t = (Δ_t + Γ_t)·X_t - value at time t
	A_t = Δ_t·C_t - Γ_t·X_t - amount deposited in trading account at time t

Arbitrage
	(τ_j, Г_j) with A_τ0 > 0 and A_t ≥ 0 for t > τ_0, and ∑_j Γ_ = 0

Fundamental Theorem of Asset Pricing
	No arbitrage iff there exist positive, adapted measures D_t with

	X_t D_t = (X_u D_u + ∑_{t < s ≤ u} C_u s_s)|_At

	where A_t is information at time t

With V_t and A_t as above

	V_t D_t = (V_u D_u + ∑_{t < s ≤ u} A_s D_s)|_At

TRADING STRATEGIES CREATE SYNTHETIC MARKET INSTRUMENTS.

Every arbitrage-free model is paramerized by vector-valued martingal measures M_t
	and D_t = D_u|_At, t ≤ u.

