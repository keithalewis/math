::: contact-float
[kal@kalx.net](mailto:kal@kalx.net?subject=Simplified!)
:::

::: hidden-content
# Black-Scholes/Merton

Myron Scholes and Robert C. Merton III shared a [Nobel Prize in
Economics]{.underline
title="Bank of Sweden Prize in Economic Sciences in Memory of Alfred Nobel"}
in 1997 \"for a new method to determine the *value* of derivatives.\"
Their 1973 [papers](#references) showed how to *hedge* stock options by
continuously adjusting the amount (delta) of the underlying stock using
a funding account. If there is no *arbitrage* then the value of an
option is the cost of its initial hedge.

By the end of the talk you will know what value, hedge, and arbitrage
mean.

::: hidden-content
### Option Formula

Black, Scholes, and Merton assume stock prices follow geometric Brownian
motion. The price at time \\(t\\) is \\\[ S_t = S_0 e\^{\\rho t}
e\^{\\sigma B_t - \\sigma\^2t/2} \\\] where \\((B_t)\_{t \\ge 0}\\) is
standard Brownian motion, \\(\\sigma\\) is the *volatility*, and
\\(\\rho\\) is the *risk-free interest rate*.

Using Ito processes and partial differential equations they derive the
formula for the price of a European call option with strike \\(K\\) and
expiration \\(T\\): \\\[ C = S_0 N(d_1) - K e\^{-\\rho T} N(d_2) \\\]
where \\\[ d_1 = \\frac{\\ln(S_0/K) + (\\rho + \\sigma\^2/2)T}{\\sigma
\\sqrt{T}}, \\quad d_2 = d_1 - \\sigma \\sqrt{T} \\\] and \\(N(x) =
\\int\_{-\\infty}\^x e\^{-s\^2/2}\\,ds/\\sqrt{2\\pi}\\) is the
cumulative distribution function of the standard normal distribution.

Whew!
:::

::: hidden-content
# Stephen Ross

In 1978 Stephen Ross published \"A simple approach to the valuation of
risky streams\" that derived the same option pricing formula using
purely geometric arguments. It does not require stochastic calculus or
partial differential equations, much less the assumption of a so-called
\"real world\" measure that is immediately discarded for a
\"risk-neutral\" measure. His theory also applies to *all* asset
classes, not just a bond, stock, and option.

Ross made the same physically untenable assumption as B-S/M that
continuous time trading is possible. He also made the category error of
assuming a jump in price is a cash flow. In the Equity world it is
common knowledge that stock prices jump down by the dividend amount
immediately after the issuer pays a dividend. But stock prices also
\"jump\" between market close and market open where there is no
corresponding cash flow.

This can be rectified by accepting the reality that only a finite number
of trades are possible and by putting cash flows on an equal footing
with prices.
:::

::: hidden-content
# Simple Unified Model

## I) Market

Market instruments have *prices* \\(X_t\\) and *cash flows* \\(C_t\\)
over time.

![](data:image/svg+xml;base64,PHN2ZyBpZD0ibWFya2V0IiBjbGFzcz0iZ3JhcGgiIHZpZXdib3g9IjAgMCAyMDAgMTUwIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPgogICAgICAgICAgICAgICAgPGRlZnM+CiAgICAgICAgICAgICAgICAgICAgPG1hcmtlciBpZD0iYXJyb3doZWFkIiBtYXJrZXJ3aWR0aD0iNSIgbWFya2VyaGVpZ2h0PSIzLjUiIHJlZng9IjQuNSIgcmVmeT0iMS43NSIgb3JpZW50PSJhdXRvIj4KICAgICAgICAgICAgICAgICAgICAgICAgPHBvbHlsaW5lIHBvaW50cz0iMCAwLCA1IDEuNzUsIDAgMy41IiBmaWxsPSJub25lIiBzdHJva2U9IiMzMzMiIHN0cm9rZS13aWR0aD0iMSI+PC9wb2x5bGluZT4KICAgICAgICAgICAgICAgICAgICA8L21hcmtlcj4KICAgICAgICAgICAgICAgICAgICA8bWFya2VyIGlkPSJhcnJvd2hlYWQtZ3JlZW4iIG1hcmtlcndpZHRoPSI1IiBtYXJrZXJoZWlnaHQ9IjMuNSIgcmVmeD0iNC41IiByZWZ5PSIxLjc1IiBvcmllbnQ9ImF1dG8tc3RhcnQtcmV2ZXJzZSI+CiAgICAgICAgICAgICAgICAgICAgICAgIDxwb2x5bGluZSBwb2ludHM9IjAgMCwgNSAxLjc1LCAwIDMuNSIgZmlsbD0ibm9uZSIgc3Ryb2tlPSIjMDBjYzY2IiBzdHJva2Utd2lkdGg9IjEiPjwvcG9seWxpbmU+CiAgICAgICAgICAgICAgICAgICAgPC9tYXJrZXI+CiAgICAgICAgICAgICAgICA8L2RlZnM+CiAgICAgICAgICAgICAgICA8ZyB0cmFuc2Zvcm09InRyYW5zbGF0ZSgyMCwgMTIwKSBzY2FsZSgxLCAtMSkiPgogICAgICAgICAgICAgICAgICAgIDwhLS0gQXhlcyAtLT4KICAgICAgICAgICAgICAgICAgICA8bGluZSB4MT0iMCIgeTE9IjAiIHgyPSIxMDAiIHkyPSIwIiBzdHJva2U9IiMzMzMiIHN0cm9rZS13aWR0aD0iMC41IiBtYXJrZXItZW5kPSJ1cmwoI2Fycm93aGVhZCkiPjwvbGluZT4KICAgICAgICAgICAgICAgICAgICA8bGluZSB4MT0iMCIgeTE9IjAiIHgyPSIwIiB5Mj0iMTAwIiBzdHJva2U9IiMzMzMiIHN0cm9rZS13aWR0aD0iMC41IiBtYXJrZXItZW5kPSJ1cmwoI2Fycm93aGVhZCkiPjwvbGluZT4KCiAgICAgICAgICAgICAgICAgICAgPCEtLSBSaWdodCBheGlzIGZvciBjYXNoIGZsb3cgLS0+CiAgICAgICAgICAgICAgICAgICAgPGxpbmUgeDE9IjEwMCIgeTE9IjAiIHgyPSIxMDAiIHkyPSIxMDAiIHN0cm9rZT0iIzMzMyIgc3Ryb2tlLXdpZHRoPSIwLjUiIG1hcmtlci1lbmQ9InVybCgjYXJyb3doZWFkKSI+PC9saW5lPgoKICAgICAgICAgICAgICAgICAgICA8IS0tIEdlb21ldHJpYyBCcm93bmlhbiBNb3Rpb24gcGF0aCAtLT4KICAgICAgICAgICAgICAgICAgICA8cGF0aCBpZD0iZ2JtLXBhdGgiIGQgZmlsbD0ibm9uZSIgc3Ryb2tlPSIjMDA2NmNjIiBzdHJva2Utd2lkdGg9IjEiPjwvcGF0aD4KCiAgICAgICAgICAgICAgICAgICAgPCEtLSBWZXJ0aWNhbCBsaW5lIGF0IHg9MjAgLS0+CiAgICAgICAgICAgICAgICAgICAgPGxpbmUgeDE9IjIwIiB5MT0iMCIgeDI9IjIwIiB5Mj0iMjAiIHN0cm9rZT0iIzAwY2M2NiIgc3Ryb2tlLXdpZHRoPSIxIj48L2xpbmU+CgogICAgICAgICAgICAgICAgICAgIDwhLS0gV2lnZ2x5IGxpbmUgYXQgeD01MCAtLT4KICAgICAgICAgICAgICAgICAgICA8cGF0aCBkPSJNIDUwLDAgUSA0OCwyLjUgNTAsNSBUIDUwLDEwIFEgNDgsMTIuNSA1MCwxNSBUIDUwLDIwIFEgNDgsMjIuNSA1MCwyNCBMIDUwLDI2IiBmaWxsPSJub25lIiBzdHJva2U9IiMwMGNjNjYiIHN0cm9rZS13aWR0aD0iMSI+PC9wYXRoPgoKICAgICAgICAgICAgICAgICAgICA8dGV4dCB4PSIxMTAiIHk9IjAiIGZvbnQtc2l6ZT0iMTEiIGZpbGw9IiMzMzMiIGZvbnQtc3R5bGU9Iml0YWxpYyIgdGV4dC1hbmNob3I9ImxlZnQiIGRvbWluYW50LWJhc2VsaW5lPSJtaWRkbGUiIHRyYW5zZm9ybT0ic2NhbGUoMSwgLTEpIj50aW1lPC90ZXh0PgogICAgICAgICAgICAgICAgICAgIDx0ZXh0IHg9IjAiIHk9Ii0xMTAiIGZvbnQtc2l6ZT0iMTEiIGZpbGw9IiMwMDY2Y2MiIGZvbnQtc3R5bGU9Iml0YWxpYyIgdGV4dC1hbmNob3I9Im1pZGRsZSIgdHJhbnNmb3JtPSJzY2FsZSgxLCAtMSkiPnByaWNlPC90ZXh0PgogICAgICAgICAgICAgICAgICAgIDx0ZXh0IHg9IjEwMCIgeT0iLTExMCIgZm9udC1zaXplPSIxMSIgZmlsbD0iIzAwY2M2NiIgZm9udC1zdHlsZT0iaXRhbGljIiB0ZXh0LWFuY2hvcj0ibWlkZGxlIiB0cmFuc2Zvcm09InNjYWxlKDEsIC0xKSI+Y2FzaCBmbG93PC90ZXh0PgogICAgICAgICAgICAgICAgPC9nPgogICAgICAgICAgICA8L3N2Zz4=){#market
.graph}
:::

::: hidden-content
## II) Trading

Traders buy *shares* \\(\\Gamma_j\\) of instruments at times
\\(\\tau_j\\) that accumulate into *positions* \\(\\Delta_t =
\\sum\_{\\tau_j \< t} \\Gamma_j\\).

![](data:image/svg+xml;base64,PHN2ZyBpZD0idHJhZGluZyIgY2xhc3M9ImdyYXBoIiB2aWV3Ym94PSIwIDAgMjAwIDE1MCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgICAgICAgICAgICAgICAgICAgICAgPGRlZnM+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICA8bWFya2VyIGlkPSJhcnJvd2hlYWQiIG1hcmtlcndpZHRoPSI1IiBtYXJrZXJoZWlnaHQ9IjMuNSIgcmVmeD0iNC41IiByZWZ5PSIxLjc1IiBvcmllbnQ9ImF1dG8iPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxwb2x5bGluZSBwb2ludHM9IjAgMCwgNSAxLjc1LCAwIDMuNSIgZmlsbD0ibm9uZSIgc3Ryb2tlPSIjMzMzIiBzdHJva2Utd2lkdGg9IjEiPjwvcG9seWxpbmU+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICA8L21hcmtlcj4KICAgICAgICAgICAgICAgICAgICAgICAgPC9kZWZzPgogICAgICAgICAgICAgICAgICAgICAgICA8ZyB0cmFuc2Zvcm09InRyYW5zbGF0ZSgyMCwgMTIwKSBzY2FsZSgxLCAtMSkiPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgPCEtLSBBeGVzIC0tPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgPGxpbmUgeDE9IjAiIHkxPSIwIiB4Mj0iMTAwIiB5Mj0iMCIgc3Ryb2tlPSIjMzMzIiBzdHJva2Utd2lkdGg9IjAuNSIgbWFya2VyLWVuZD0idXJsKCNhcnJvd2hlYWQpIj48L2xpbmU+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICA8dGV4dCB4PSIxMTAiIHk9IjAiIGZvbnQtc2l6ZT0iMTEiIGZpbGw9IiMzMzMiIGZvbnQtc3R5bGU9Iml0YWxpYyIgdGV4dC1hbmNob3I9ImxlZnQiIGRvbWluYW50LWJhc2VsaW5lPSJtaWRkbGUiIHRyYW5zZm9ybT0ic2NhbGUoMSwgLTEpIj50aW1lPC90ZXh0PgogICAgICAgICAgICAgICAgICAgICAgICAgICAgPGxpbmUgeDE9IjAiIHkxPSIwIiB4Mj0iMCIgeTI9IjEwMCIgc3Ryb2tlPSIjMzMzIiBzdHJva2Utd2lkdGg9IjAuNSIgbWFya2VyLWVuZD0idXJsKCNhcnJvd2hlYWQpIj48L2xpbmU+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICA8dGV4dCB4PSIwIiB5PSItMTEwIiBmb250LXNpemU9IjExIiBmaWxsPSIjY2MwMDY2IiBmb250LXN0eWxlPSJpdGFsaWMiIHRleHQtYW5jaG9yPSJtaWRkbGUiIHRyYW5zZm9ybT0ic2NhbGUoMSwgLTEpIj5wb3NpdGlvbjwvdGV4dD4KCiAgICAgICAgICAgICAgICAgICAgICAgICAgICA8IS0tIFRyYWRpbmcgbGluZSB3aXRoIGNsb3NlZCBjaXJjbGUgLS0+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICA8bGluZSB4MT0iMCIgeTE9IjAiIHgyPSIyMCIgeTI9IjAiIHN0cm9rZT0iI2NjMDA2NiIgc3Ryb2tlLXdpZHRoPSIxIj48L2xpbmU+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICA8Y2lyY2xlIGN4PSIyMCIgY3k9IjAiIHI9IjIiIGZpbGw9IiNjYzAwNjYiPjwvY2lyY2xlPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgPCEtLSBEYXNoZWQgbGluZSB3aXRoIG9wZW4gY2lyY2xlIC0tPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgPGxpbmUgeDE9IjIwIiB5MT0iMCIgeDI9IjIwIiB5Mj0iMjgiIHN0cm9rZT0iI2NjMDA2NiIgc3Ryb2tlLXdpZHRoPSIxIiBzdHJva2UtZGFzaGFycmF5PSIzLDMiPjwvbGluZT4KICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxjaXJjbGUgY3g9IjIwIiBjeT0iMzAiIHI9IjIiIGZpbGw9Im5vbmUiIHN0cm9rZT0iI2NjMDA2NiIgc3Ryb2tlLXdpZHRoPSIxIj48L2NpcmNsZT4KICAgICAgICAgICAgICAgICAgICAgICAgICAgIDx0ZXh0IHg9IjIwIiB5PSIxMCIgZm9udC1zaXplPSIxMSIgZmlsbD0iIzMzMyIgZm9udC1zdHlsZT0iaXRhbGljIiB0ZXh0LWFuY2hvcj0ibWlkZGxlIiB0cmFuc2Zvcm09InNjYWxlKDEsIC0xKSI+z4TigoA8L3RleHQ+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICA8dGV4dCB4PSIxNSIgeT0iLTEyIiBmb250LXNpemU9IjExIiBmaWxsPSIjY2MwMDY2IiBmb250LXN0eWxlPSJpdGFsaWMiIHRleHQtYW5jaG9yPSJlbmQiIHRyYW5zZm9ybT0ic2NhbGUoMSwgLTEpIj7Ok+KCgDwvdGV4dD4KCiAgICAgICAgICAgICAgICAgICAgICAgICAgICA8IS0tIEhvcml6b250YWwgbGluZSB3aXRoIGNsb3NlZCBjaXJjbGUgLS0+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICA8bGluZSB4MT0iMjIiIHkxPSIzMCIgeDI9IjQwIiB5Mj0iMzAiIHN0cm9rZT0iI2NjMDA2NiIgc3Ryb2tlLXdpZHRoPSIxIj48L2xpbmU+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICA8Y2lyY2xlIGN4PSI0MCIgY3k9IjMwIiByPSIyIiBmaWxsPSIjY2MwMDY2Ij48L2NpcmNsZT4KICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwhLS0gRGFzaGVkIGxpbmUgd2l0aCBvcGVuIGNpcmNsZSAtLT4KICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxsaW5lIHgxPSI0MCIgeTE9IjMwIiB4Mj0iNDAiIHkyPSI3OCIgc3Ryb2tlPSIjY2MwMDY2IiBzdHJva2Utd2lkdGg9IjEiIHN0cm9rZS1kYXNoYXJyYXk9IjMsMyI+PC9saW5lPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgPGNpcmNsZSBjeD0iNDAiIGN5PSI4MCIgcj0iMiIgZmlsbD0ibm9uZSIgc3Ryb2tlPSIjY2MwMDY2IiBzdHJva2Utd2lkdGg9IjEiPjwvY2lyY2xlPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgPHRleHQgeD0iNDIiIHk9IjEwIiBmb250LXNpemU9IjExIiBmaWxsPSIjMzMzIiBmb250LXN0eWxlPSJpdGFsaWMiIHRleHQtYW5jaG9yPSJtaWRkbGUiIHRyYW5zZm9ybT0ic2NhbGUoMSwgLTEpIj7PhOKCgTwvdGV4dD4KICAgICAgICAgICAgICAgICAgICAgICAgICAgIDx0ZXh0IHg9IjM2IiB5PSItNTIiIGZvbnQtc2l6ZT0iMTEiIGZpbGw9IiNjYzAwNjYiIGZvbnQtc3R5bGU9Iml0YWxpYyIgdGV4dC1hbmNob3I9ImVuZCIgdHJhbnNmb3JtPSJzY2FsZSgxLCAtMSkiPs6T4oKBPC90ZXh0PgoKCiAgICAgICAgICAgICAgICAgICAgICAgICAgICA8IS0tIEhvcml6b250YWwgbGluZSB3aXRoIGNsb3NlZCBjaXJjbGUgLS0+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICA8bGluZSB4MT0iNDIiIHkxPSI4MCIgeDI9IjgwIiB5Mj0iODAiIHN0cm9rZT0iI2NjMDA2NiIgc3Ryb2tlLXdpZHRoPSIxIj48L2xpbmU+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICA8Y2lyY2xlIGN4PSI0MCIgY3k9IjMwIiByPSIyIiBmaWxsPSIjY2MwMDY2Ij48L2NpcmNsZT4KICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwhLS0gRGFzaGVkIGxpbmUgd2l0aCBvcGVuIGNpcmNsZSAtLT4KICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxsaW5lIHgxPSI0MCIgeTE9IjMwIiB4Mj0iNDAiIHkyPSI3OCIgc3Ryb2tlPSIjY2MwMDY2IiBzdHJva2Utd2lkdGg9IjEiIHN0cm9rZS1kYXNoYXJyYXk9IjMsMyI+PC9saW5lPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgPGNpcmNsZSBjeD0iNDAiIGN5PSI4MCIgcj0iMiIgZmlsbD0ibm9uZSIgc3Ryb2tlPSIjY2MwMDY2IiBzdHJva2Utd2lkdGg9IjEiPjwvY2lyY2xlPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgPHRleHQgeD0iNDIiIHk9IjEwIiBmb250LXNpemU9IjExIiBmaWxsPSIjMzMzIiBmb250LXN0eWxlPSJpdGFsaWMiIHRleHQtYW5jaG9yPSJtaWRkbGUiIHRyYW5zZm9ybT0ic2NhbGUoMSwgLTEpIj7PhOKCgTwvdGV4dD4KICAgICAgICAgICAgICAgICAgICAgICAgICAgIDx0ZXh0IHg9IjM2IiB5PSItNTIiIGZvbnQtc2l6ZT0iMTEiIGZpbGw9IiNjYzAwNjYiIGZvbnQtc3R5bGU9Iml0YWxpYyIgdGV4dC1hbmNob3I9ImVuZCIgdHJhbnNmb3JtPSJzY2FsZSgxLCAtMSkiPs6T4oKBPC90ZXh0PgoKICAgICAgICAgICAgICAgICAgICAgICAgICAgIDx0ZXh0IHg9Ii00IiB5PSItMjgiIGZvbnQtc2l6ZT0iMTEiIGZpbGw9IiNjYzAwNjYiIGZvbnQtc3R5bGU9Iml0YWxpYyIgdGV4dC1hbmNob3I9ImVuZCIgdHJhbnNmb3JtPSJzY2FsZSgxLCAtMSkiPs6U4oKAPC90ZXh0PgogICAgICAgICAgICAgICAgICAgICAgICAgICAgPHRleHQgeD0iLTQiIHk9Ii03OCIgZm9udC1zaXplPSIxMSIgZmlsbD0iI2NjMDA2NiIgZm9udC1zdHlsZT0iaXRhbGljIiB0ZXh0LWFuY2hvcj0iZW5kIiB0cmFuc2Zvcm09InNjYWxlKDEsIC0xKSI+zpTigoE8L3RleHQ+CiAgICAgICAgICAgICAgICAgICAgICAgIDwvZz4KICAgICAgICAgICAgICAgICAgICA8L3N2Zz4=){#trading
.graph}
:::

::: hidden-content
## III) Accounting

Accountants keep track of *amount*s. Cash flows are received
proportional to position and shares are bought at market price. \\\[ A_t
= \\Delta_t\\cdot C_t - \\Gamma_t\\cdot X_t \\\]

The *mark-to-market value* is the amount that would be received from
liquidating the existing position and trades just done at the current
market price. \\\[ V_t = (\\Delta_t + \\Gamma_t)\\cdot X_t \\\]
:::

::: hidden-content
## IV) Arbitrage

A trading strategy \\((\\tau_j, \\Gamma_j)\\) that makes money on the
first trade; never loses money after that; and closes out: \\\[
A\_{\\tau_0} \> 0;\\, A_t \\ge 0, t \> \\tau_0;\\, \\sum_j \\Gamma_j = 0
\\\]
:::

::: hidden-content
## V) Fundamental Theorem of Asset Pricing

If there is no arbitrage then there exist positive measures
\\((D_t)\_{t\\in T}\\) with \\\[ \\underline{X_t} D_t = \\sum\_{t \< u
\\le v} \\underline{\\underline{C_u}} D_u + \\underline{X_v}
D_v\|\_{\\mathcal{A}\_t}. \\\] [Note \\(Y=E\[X\|\\mathcal{A}\]\\) if and
only if \\(Y(P\|\_\\mathcal{A})=(XP)\|\_\\mathcal{A}\\). Read
\\(\|\_{\\mathcal{A}\_t}\\) as \"given information available at time
\\(t\\)\". ]{style="color: grey;"}

These are are what Ross called a \"(not generally unique) positive
linear operator that can be used to value all marketed assets.\" If a
funding account is available then \\(D_t\\) is its reciprocal: the
*stochastic discount*.
:::

::: hidden-content
## Consequences

Given the 5 easy pieces we have \\\[ \\underline{V_t} D_t = \\sum\_{t \<
u \\le v} \\underline{\\underline{A_u}} D_u + \\underline{V_v}
D_v\|\_{\\mathcal{A}\_t} \\\] Note how value \\(V_t\\) corresponds to
price \\(X_t\\) and amount \\(A_t\\) corresponds to cash flow \\(C_t\\).

> **Trading strategies create synthetic market instruments.**
:::

::: hidden-content
### Derivative

A *derivative instrument* is a contract for a risky stream of cash
flows. The seller agrees to pay the buyer cash flows \\((\\hat{A}\_j)\\)
on dates \\((\\hat{\\tau}\_j)\\). A *hedge* is a trading strategy
\\((\\tau_t, \\Gamma_t)\\) such that the \\(A_t = \\hat{A}\_j\\) when
\\(t = \\hat{\\tau}\_j\\) and is zero otherwise.

#### Value

The *value* of a derivative is the cost of setting up a hedge. \\\[ V_t
D_t = \\sum\_{\\hat{\\tau_j} \> t} \\hat{A}\_j
D\_{\\hat{\\tau_j}}\|\_{\\mathcal{A}\_t} \\\] Note the value is
determined by the contract information and the stochastic discount.

#### Hedge

How do you find the initial hedge? Since \\(V_0 = \\Gamma_0\\cdot X_0\\)
the derivative of the initial value \\(V_0\\) with respect to the
initial price \\(X_0\\) gives the initial hedge \\(D\_{X_0}V_0 =
\\Gamma_0\\).

How do you hedge over time? Since \\(V_t = (\\Delta_t + \\Gamma_t)\\cdot
X_t\\) the derivative of the value \\(V_t\\) with respect to the price
\\(X_t\\) gives the hedge \\(D\_{X_t}V_t = \\Delta_t + \\Gamma_t\\) so
\\\[ \\Gamma_t = D\_{X_t}V_t - \\Delta_t = D\_{X_t}V_t - \\sum\_{s \< t}
\\Gamma_s. \\\]

When do you hedge? Continuously is the \"completely correct\" answer!
:::

::: hidden-content
### Universal Model

If \\((M_t)\_{t\\in T}\\) are vector-valued measures with \\(M_t =
M_u\|\_{\\mathcal{A}\_t}\\) for \\(t \\le u\\) then the price process
\\\[ X_t D_t = M_t - \\sum\_{s\\le t} C_s D_s \\\] is arbitrage free.

> **Every arbitrage free price process has this form.**

For example, the Black-Scholes/Merton model is \\(D_t = e\^{-\\rho
t}P\\), \\(M_t = (1, se\^{\\sigma B_t - \\sigma\^2t/2}) P\\), where
\\(P\\) is Wiener measure for Brownian motion \\((B_t)\_{t \\ge 0}\\).

The Fischer Black model does not require interest rates. It only
considers forward values. If \\(F = fe\^{sZ - s\^2/2}\\) where \\(Z\\)
is standard normal then \\(E\[F\] = f\\) since \\(E\[e\^N\] =
e\^{E\[N\] + \\operatorname{Var}(N)/2}\\). For any payoff \\(\\phi\\) we
have \\(E\[F \\phi(F)\] = f E\[\\phi(Fe\^{s\^2})\]\\). For a put payoff
\$\\phi(x) = \\max\\{k - x, 0\\}\$ \\\[ E\[(k - F)\^+\] = E\[(k - F)1(F
\\le k)\] = k P(F \\le k) - E\[F 1(F \\le k)\] \\\] \\\[ E\[F 1(F \\le
k)\] = f P(F e\^{s\^2} \\le k) = f P(F \\le ke\^{-s\^2}) \\\] This
provides a simpler derivation of the option pricing formula \\\[ E\[(k -
F)\^+\] = kP(F\\le k) - fP(F\\le ke\^{-s\^2}) \\\]
:::

::: hidden-content
## References

-   Black, F. and Scholes, M. (1973). \"The Pricing of Options and
    Corporate Liabilities\". *Journal of Political Economy*, 81(3):
    637--654.
-   Merton, R. C. (1973). \"Theory of Rational Option Pricing\". *Bell
    Journal of Economics and Management Science*, 4(1): 141--183.
-   Ross, S. A. (1978). \"A simple approach to the valuation of risky
    streams\". Journal of Business. 51 (3): 453--475.
    doi:10.1086/295992.
-   Lewis, K. A. (2019). \"A Simple Proof of the Fundamental Theorem of
    Asset Pricing\". *arXiv preprint* arXiv:1912.01091 \[q-fin.MF\].
    <https://arxiv.org/abs/1912.01091>
-   Lewis, K. A. (2025). [\"Simple Unified
    Model\"](https://keithalewis.github.io/math/sum.html).
:::
:::
