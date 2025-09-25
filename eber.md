---
title: Thoughts on Finance
abstract: Toward a universal model of trading, hedging, and risk-management
author: Keith A. Lewis
---
\newcommand\bs[1]{\boldsymbol{{#1}}}
\newcommand\RR{\bs{R}}
\newcommand\NN{\bs{N}}
\renewcommand\AA{\mathcal{A}}
\newcommand\ob{\text{?}}
\newcommand\os{\text{*}}
\newcommand\oi{\text{+}}

We discuss the Simple Universal Model for market prices and cash flows, trading
strategies, and the values and amounts involved.
Every company trading in the market needs to describe instument
contracts. They also need models to value, hedge, and manage their risk.

Inspired by [Lexifi](https://www.lexify.com), we propose a mathematical
theory that can be practially implemented on a computer.  A key
simplification is to seperate the notion of an increasing sequence of
times to be used in the contact specifications and trading strategies. We
identify primitive operations that apply only to increasing time series
and a operations on them. These can be used to convert contract specifications
into a stream of cash flows.

It is important to include knobs for all possible actions an intrument owner can take.
For example, an American option holder can exercise any time prior to expiration.
A realistic model should not assume the holder will exercise optimally. In the mortgage-backed
secuities market a number of individual mortages are bundled together and the
principal and interest paid by individual mortages are passed through to MBS holders.
It is well known that most individual mortage holders do not exercise their right to pay
off their mortgage in an optimal fashion.[^1] Any model that assumes this will be
unable to fit observed market prices. See [@KalYanFab2004] for a prepayment model that
takes this into account.

[^1]: Such as me.

## Date and Time

A fundamental problem when implementing date and time operations is how to convert two
calendar dates to a time duration and a date plus a time duration back to a calendar date.
Let $t(d)$ be the _time_ associated with _date_ $d$. On Unix systems it is common
to use the number of non-leap seconds since midnight 1 January, 1970
[UTC](https://en.wikipedia.org/wiki/Coordinated_Universal_Time).
Most modern systems allow resolution to microseconds.
The inverse function $d(t)$ converts time to dates.
Complications arise when considering durations such as weeks and months.
For example, 31 Jan plus one month cannot be 31 Feb. Should it be
29 Feb on leap-years and 28 Feb otherwise?
Such issues will not be considered here.

It is also important to distinguish between prices and cash flows. Every actual
trade has a price: the quotient of the amount the seller exchanges with the buyer.
If a buyer receives 2 shares of Ford stock for \$22 the price is \$11 per share
of Ford stock. The price 11 and number of shares 2 will be entered into books and records.
A model of an instrument specifies possible future prices and
cash flows. Models typically do not take into account the bid/ask spread,
how that widens as the amounts get larger, much less how price is affected
by the counterparties involved.

Owning an instrument can entail cash flows. Bonds have coupons, stocks have dividends,
futures have daily margin adjustments. The price of a futures is always zero and
futures quotes are a naturally occuring martingale in efficient markets.

## Examples

### Call

A European call option is specified by a triple $(X, k, d)\in I\times\RR\times d(T)$
where $X$ is the call underlying, $k$ is the strike[^2], and $d$ is the
expiration date. On the expiration date the option issuer pays the option holder
$\max\{X_t - k, 0\}$ per unit held where $X_t$ is the price of the underlying at time $t(d)$.
Prices are $X_t\colon\Omega\to\RR$[^3] that are measurable with respect to information
available at time $t$. We can also write this as $X\colon\T\times\Omega\to\RR$ where
$X(t,\omega) = X_t(\omega)$, $t\in T$, $\omega\in\Omega$.

[^2]: The strike can be implemented as an integer the multiplied by the
minimum trading increment of the underlying to get the contract strike.

[^3]: See[^2].

## Time Series

An _ordered time series_ is a non-decreasing sequence of times $u_0 \le u_1 \le \cdots$
where the $u_j$ belong to a totally ordered set $T$. Let $U$ for the set $\{u_j\}$.
We introduce the notation $\ob U = \text{true}$ if $U$ is not empty and
$\ob U = \text{false}$ otherwise, $\os U = \min U$, and $\oi U = U\setminus\os U$.
In particular $\os U = u_0$, $\os\oi U = u_1$, etc., so $U$ is an iterator.

If $R\subset T\times T$ is a relation on $T$ define $URt$ for $t\in T$
by $u\in URt$ if and only if $uRt$ and $u\in U$. For example, $U < t$
is a stream that terminates at the first $u_j \ge t$.

Recall the disjoint union of two sets $A\sqcup B = (\{0\}\times A)\cup(\{1\}\times B)$.
An element of the disjoint union for the form $(i,c)$ satisfies $i = 0$ and $c\in A$
or $i = 1$ and $c\in B$.
The order $(i,c)\le(i',c')$ if and only if $c < c'$ or $c = c'$ and $i < i'$ is a total order

The disjoint union of sets $A_i$ indexed by $i\in I$
is
$$
	\sqcup_{i\in I} A_i = \cup_{i\in I} (\{i\}\times A_i)
$$


The [Simple Universal Model](sum.html) posits a mathematical model of the market that
is arbitrage free. Possible trading times are denoted $T$.
The set of all instruments is $I$. The sample space $\Omega$ is the set of
everything that can happen. Information available at time $t\in T$ corresponds
to a partition $\AA_t$ of $\Omega$. The prices and cash flows associated with
each instrument are $\AA_t$-measurable functions $X_t,C_t\colon\AA_t\to\RR^I$.

The SUM shows every arbitrage-free model has the form
$$
	X_t D_t = M_t - \sum_{s < t} C_s
$$
Where $D_t$ is a positive measure on $\AA_t$ and $M_t$ is a $\RR^I$-valued
martingale measure on $\AA_t$. We say $(M_t)_{t\in T}$ is a martingale
measure if $M_t = M_u|_{\AA_t}$ for $t < u$ where the vertical bar and subscript
algebra indicate restriction of $M_u$ on $\AA_u$ to $\AA_t$.
This requires $\AA_u$ to be a refinement of $\AA_t$ if $u < t$.

The SUM can be used for any collection of instruments:
bonds, stocks, futures, options, convertible bonds, FX spot/options/futures, commodities, etc.

We also need a mechanism to convert between calendar dates
and times and assume $t(d)$ is the time correpondng to calendar date $d$.
This will not be considered in what follows.

## References
