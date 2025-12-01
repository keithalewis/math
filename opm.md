---
title: One-Period Model
author: Keith A. Lewis
institution: KALX, LLC
email: kal@kalx.net
classoption: fleqn
abstract: Simplest formal model of a financial market.
...

\newcommand\RR{\boldsymbol{R}}
\newcommand\ZZ{\boldsymbol{Z}}
\newcommand\ran{\operatorname{ran}}
\newcommand\Var{\operatorname{Var}}
\newcommand\Cov{\operatorname{Cov}}
\newcommand\co{\operatorname{co}}
\newcommand\sgn{\operatorname{sgn}}
\newcommand\cone{\operatorname{cone}}
\newcommand\BB{\mathcal{B}}
\newcommand\GG{\mathcal{G}}

The One‑Period Model is the simplest framework for rigorously
representing a financial market over a single time horizon. The model defines
the initial prices of tradable instruments and their terminal cash flows
contingent on the realized outcome. In the absence of arbitrage
prices are subject to geometric constraints determined by the cash flows.

We make the usual unrealistic assumptions that prices are real numbers
instead of integral multiples of each instrument's minimum trading
increment/tick size and there is no bid-ask spread depending on the amount
being bought or sold, much less any consideration of credit or tax issues.
We also ignore the fact instruments can only be purchased in integral
multiples of their minimum share/lot size.  The [Appendix](#appendix)
proposes a model that can incorporate more realistic assumptions.

Quants turn mathematical models into software used for trading.  If a
model is deployed without ensuring it is arbitrage-free then buy-side
clients will exploit mispricings by going long on trades that are undervalued
and short on overpriced ones. Eventually trading reality catches up
and the sell-side firm loses money.  Even worse, a "clever" trader might
find an internal arbitrage that gives the illusion of making profits[^1].

[^1]: Nick Leeson used this to put 233 year old, at the time, Barings Bank out of business.

The Fundamental Theorem of Asset Pricing characterizes arbitrage-free
models and provide an arbitrage if they are not. As [@Ros1978] showed,
this is a purely geometric result having nothing to do with probability.
Positive measures having mass one make an appearance, but they are not
the probability of anything.

Ross made the untenable assumption that continuous time trading is
possible and the category error of defining a cash flow as a jump
in price. Stock prices jump between market close and market open but
there is no associated cash flow.
A cash flow is a payment made by the instrument issuer
to each instrument holder. Stocks pay dividends, bonds pay coupons,
futures pay the change in end-of-day quotes (and always have price zero).
The Fundamental Theorem of Asset Pricing shows models of cash flows
entail geometric constraints on arbitrage-free prices.

## One-Period Model

The _One-Period Model_ specifies a finite set of tradable _instruments_ $I$.
The set of possible _outcomes_ $\Omega$ represents what can happen over the period.
The initial _prices_ are given by a vector ${x\in\RR^I}$[^2], indexed by the instruments.
Terminal _cash flows_ are defined by a vector-valued function
${C\colon\Omega\to \RR^I}$ where ${C(\omega)\in\RR^I}$ are the cash
flows for each instrument corresponding to outcome ${\omega\in\Omega}$.

A _position_ $\xi\in\RR^I$ is the number of shares purchased in each
instrument at the beginning of the period.  The _cost_ of acquiring the
position is ${\xi\cdot x = \sum_{i\in I}\xi(i) x(i)}$ and results in
${\xi\cdot C(\omega)}$ at the end of the period.
The _realized return_ of a position $\xi\in\RR^I$ is ${R_\xi = \xi\cdot C/\xi\cdot x}$ provided
$\xi\cdot x\not=0$.

__Exercise__. _Show $R_{t\xi} = R_{\xi}$ for any non-zero $t\in\RR$_.

This is actually a deleterious feature of the model. Going long ($t > 0$)
or short ($t < 0$) typically
affects the realized return. It also implies a portfolio strategy can be scaled
to arbitrarily large positions. At some point you will run out of instruments to buy
and sell.

We assume redundant instruments are removed from the model. 
If ${\xi\cdot C = 0}$ then one instrument is a linear combination
of the others and can be removed. This can be repeated until
${\xi\cdot C\not=0}$ for any $\xi\in\RR^I$.
If so, the map $\xi\in\RR^I$ to $\xi\cdot C\in\RR^\Omega$ is one-to-one.
A model is _complete_ if this map is _onto_. This cannot be the case
if the cardinality of $I$ is less than the cardinality of $\Omega$.
In general the number of instruments is much smaller than the number of
possible outcomes.

Classical literature often specifies terminal prices as a function $X\colon\Omega\to\RR^I$
rather than cash flows $C$. From a rigorous standpoint,
prices do not actually exist at the end of the period since there is no
further economic activity available.  The classical approach implicitly
assumes the initial position is liquidated at the end of the period
at prevailing prices yielding a payment of $\xi\cdot X$. In practice,
cash flows are paid proportional to position whether or not
any trading occurs.

For example, a zero coupon bond has an initial price/discount
and pays a unit cash flow at termination. 
If you are uncomfortable using cash flows $C$ instead of prices $X$ when the
instrument is a stock, $C$ may be interpreted as
the firm's liquidation value
or the proceeds from a stock buy back by the company at the end of the period.

The [Multi-period model](mpm.html) clarifies the relationship
between prices and cash flows.

The [Capital Asset Pricing Model](capm.html) is a one-period model
where a probability measure on possible outcomes is specified.

[^2]: Recall the _set exponential_ ${B^A = \{f\colon A\to B\}}$ is the set
of all functions from the set $A$ to the set $B$.  If ${x\in\RR^I}$ then
$x(i)\in\RR$ is the price of instrument $i\in I$.  If $I = \{1,\ldots,n\}$
we can identify $\RR^I$ with the vector space of $n$-tuples
${\RR^n = \prod_{i=1}^n\RR = \{(x_1,\ldots,x_n)\mid x_i\in\RR\}}$
by $x(i) = x_i$, $1\le i\le n$.

## Arbitrage

_Arbitrage_ exists in a one-period model if there is a position $\xi\in\RR^I$
with ${\xi\cdot x < 0}$ and ${\xi\cdot C(\omega)\ge0}$ for all ${\omega\in\Omega}$:
you make money acquiring the initial position and never lose money
at the end of the period.

Some authors define arbitrage as a portfolio satisfying ${\xi\cdot x = 0}$ and
${\xi\cdot C\ge0}$ is strictly positive on some set having positive probability.
We haven't specified a probability measure so we can't use this definition.
Moreover, no trader would consider this to be an arbitrage anyway. 
Even though the position costs nothing other than agita to put on,
the above definition has nothing definite to say about how much they will
make nor how likely it is they will make it.

Our stronger probability-free definition is still not good enough
for traders and risk managers.  Even though ${\xi\cdot x}$ is strictly
negative they will slap absolute value signs around every number and
compute ${|\xi|\cdot|x|}$ as a proxy of how much capital will be tied
up putting on the position.  No business would approve using a million
dollars from their funding account just to make a penny up front even though that
technically satisfies our mathematical definition of arbitrage.

## Fundamental Theorem of Asset Pricing

<!--
A derivative instrument is a contract: I will give you this on these dates if
you will give me that on those dates. Derivatives differ from bartering in that they
involve future transactions instead of immediate exchanges.
Caveman Korg may have asked caveman Grok for as many arrowheads as the fingers on
both hands and promised to give him a bear skin before the moon is big in the sky.
Korg might not be able to make delivery if the bear has a say in the matter so
Grok must take this into account when offering arrowheads.

-->

The assumption of no arbitrage places constraints on initial prices
that are determined by cash flows. The constraints involve a cone.

Recall a _cone_ $K$ is a subset of a vector space closed under positive scalar
multiplication and vector addition: if $x\in K$ then $tx\in K$ for $t > 0$
and if $x,y\in K$ then ${x + y\in K}$.

__Exercise__. _A cone is convex_.

_Hint_: Show $x,y\in K$ implies ${tx + (1-t)y\in K}$ for ${0 < t < 1}$.

<details><summary>Solution</summary>
Since $t > 0$ and $1 - t > 0$ both $tx$ and $(1 - t)y$ belong to $K$
hence $tx + (1 - t)y\in K$.
</details>

__Exercise__. _The set of arbitrage positions is a cone_.

<details><summary>Solution</summary>
If $\xi$ is an arbitrage then $t\xi$ is an arbitrage for $t > 0$.
If $\xi$ and $\eta$ are arbitrages then so is $\xi + \eta$.
</details>

The smallest cone containing the possible cash flows $C$ is the set
of finite linear combinations with positive coefficients
${\{\sum_i C(\omega_i) d_i\mid \omega_i\in\Omega, d_i > 0\}}$.
If $x = \sum_i C(\omega_i) d_i$ is in the cone
and $\xi\cdot C$ is non-negative on $\Omega$ then ${\xi\cdot x\ge 0}$
so no arbitrage exists.

__Exercise__. _If $x$ belongs to the smallest_ closed _cone containing
the range of $C$ then there is no arbitrage_.

<details><summary>Solution</summary>
If $x_n\in K$ converge to $x$ in norm and $\xi\cdot x_n\ge0$ then $\xi\cdot x\ge0$.
</details>

The contrapositive is also true.

__Theorem__.  _Arbitrage exists in
a one-period model if $x$ does not belong to the smallest
closed cone containing the range of $C$. If $x^*$ is the closest point
in the cone then $\xi = x^* - x$ is an arbitrage_.

In general the arbitrage is not unique. We will establish the theorem using
the purely geometric

__Lemma__. _If $x\in\RR^n$ and $K$ is a closed cone in
$\RR^n$ with $x\not\in K$ then there exists ${\xi\in\RR^n}$
with ${\xi\cdot x < 0}$ and ${\xi\cdot y \ge0}$ for ${y\in K}$_.

_Proof._ Let $x^*$ be the point in $K$ closest to $x$.
It exists since $K$ is closed and is unique since $K$ is convex.
Let $\xi = x^* - x$ and note $\xi\not=0$.

We have $ty + x^*\in K$ for any $t > 0$ and $y\in K$ 
so $\|x^* - x\| \le \|ty + x^* - x\|$.
Simplifying gives ${t^2||y||^2 + 2ty\cdot\xi\ge0}$. 
Dividing by $t > 0$ and letting $t$ decrease to 0 shows ${\xi\cdot y\ge0}$
for all $y\in K$.

We have $(t + 1)x^*\in K$ for $t + 1 > 0$
so $\|x^* - x\| \le \|tx^* + x^* - x\|$.
Simplifying gives ${t^2||x^*||^2 + 2tx^*\cdot\xi^*\ge 0}$ for  $t > -1$.
Dividing by $t < 0$ and letting $t$ increase to 0 shows ${\xi\cdot x^*\le 0}$.

Since ${0 < ||\xi||^2 = \xi\cdot (x^* - x) \le -\xi\cdot x}$ we have ${\xi\cdot x < 0}$.

The lemma proves the FTAP and that $\xi = x^* - x$ implements an arbitrage.

A _risk-neutral pricing measure_ is any positive, finitely additive measure $D$ on $\Omega$ with
$x = \int_\Omega C\,dD$. The FTAP shows no arbitrage implies this
set is not empty. Every such measure corresponds to a positive linear functional
on the vector space of bounded functions on $\Omega$.  See [@DunSch1958].
Risk-neutral pricing measures are not generally unique.

If $D$ is a risk-neutral pricing measure then $Q = D/D(\Omega)$ is a positive
measure having mass 1 so it satisfies the definition of a probability measure.
Every portfolio has the same expected realized return under a risk-neutral measure
so perhaps this should be called a _risk-blind_ measure.

__Exercise__. _If $D$ is a risk-neutral measure then the expected realized return
$R = E^Q[R_\xi] = 1/D(\Omega)$ is constant for any portfolio $\xi\in\RR^I$
with $\xi\cdot x\not=0$_.

_Hint_: The expectation is with respect to the "probability" measure $Q = D/D(\Omega)$.

This exercise is a wake-up call to the fact risk-neutral measures are useless for
risk management. The variance of a realized return can be arbitrarily large
but a risk-neutral measure cannot detect excess returns to compensate for this risk.

A _zero coupon bond_ pays 1 unit at the end of the period on every outcome.
A portfolio $\zeta\in\RR^I$ with 
${\zeta\cdot C(\omega) = 1}$ for all ${\omega\in\Omega}$
is a zero coupon bond.
The _discount_ of a zero coupon bond is its price
${\zeta\cdot x = \int_\Omega \zeta\cdot C(\omega)\,dD(\omega) = D(\Omega)}$.

__Exercise__. _If $\zeta$ is a zero coupon bond with only one non-zero component then
that component is equal to the discount_.

__Exercise__. _If $x = \int_\Omega C\,dD$ show $x = E^Q[C]D(\Omega)$_.

This formula can be read "Prices are expected discounted cash flows."
It is a mathematically rigorous one-period example of the method used by [@GraDod1934]
in _Security Analysis_ for valuing equities.

## Examples

We now apply the FTAP to particular models. 

### Zero Coupon Bond

A common misconception is that the price of a zero coupon bond must not be greater
than its notional since this would imply negative interest rates.
Negative rates actually occured in Europe between 2014 and 2020 but did not give rise
to arbitrage opportunities.

If the only instrument is a zero coupon bond then $C = 1$. In the absence of arbitrage
we have $x = CD = D$ for some positive number $D$. This shows that the discount
is not necessarily less than 1.

__Exercise__. _If $x < 0$ find an arbitrage_.

### 1-2-3 Model

A very simple and unrealistic one-period model consists of a bond with
price 1 at the beginning of the period that has a cash flow 2 at the end
and a stock with price 1 that has a cash flow of either 1 or 3. The model
is $x = (1, 1)$ and ${C(\omega) = (2, \omega)}$ where ${\omega\in\{1,3\}
= \Omega}$.  This is arbitrage-free if and only if we can find ${d_1,d_3
\ge0}$ with ${x = C(1)d_1 + C(3)d_3}$.  The bond component
implies ${1 = 2d_1 + 2d_3}$ and the stock component implies ${1 = 1d_1 +
3d_3}$ so ${d_1 = d_3 = 1/4}$.

This shows the risk-neutral measure is $D(\{1\}) = D(\{3\}) = 1/4$.
The risk-neutral probability measure $Q = D/D(\Omega)$
is $Q(\{1\}) = Q(\{3\}) = 1/2$.

__Exercise__. _Show $E^Q[C]D(\Omega) = \int_\Omega C\,dD = (1, 1)$ is the initial bond and stock price_.

If we add a call option with strike 2 and price $v$ then the model becomes
${x = (1, 1, v)}$, ${C(\omega) = (2, \omega, \max\{\omega - 2,0\})}$
where $v$ is the option value. Since the bond and stock components
determine ${d_1 = d_3 = 1/4}$ the option component is
${v = \max\{1 - 2, 0\}(1/4) + \max\{3 - 2, 0\}(1/4) = 1/4}$.

A similar argument shows any European option paying $\nu(\omega)$ at expiration
has value ${v = (\nu(1) + \nu(3))/4}$.
Every option payoff is linear in a binomial model.

Note this argument does not depend on probability. If the real-world probability
of the stock staying at 1 is $0.1$ and the stock tripling to 3 is $0.9$ then the
expected payoff is $(0(0.1) + 1(0.9))/2 = 0.45$. As John Illuzi at Banc of America
securities pointed out when I showed him this, "Do you mean I can buy the option for
0.25 and get 0.45 on average? I'd take that trade all day long!"
He also identified the risk-blind nature of risk-neutral probability.
"But not if I got shot in the head if the option ever finished out-of-the-money."

We have already seen every risk-neutral measure has the same expected realized
return. This example shows even if the measure is unique it implies infinite
risk aversion.

<!--
We don't need the FTAP so see the value of the option is a quarter
since we can use that to replicate the option payoff. Borrow another
quarter using the bond and invest half a dollar in the stock.
If the stock stays at 1 then we sell it and use the half dollar to pay back the bond
and the option is out of the money. If the stock goes to 3 then we use
the dollar and a half to pay half a dollar to cover the bond and
have a dollar left to meet the call obligation.
-->

### Binomial Model

The 1-2-3 model is a special case of the  _binomial model_ having instruments a bond and stock where ${x = (r, s)}$,
${C(\omega) = (R, \omega)}$, and ${\Omega = \{L, H\}}$ with ${L < H}$.
The bond has realized return $R/r$ and the stock can go from price $s$
to either $L$ or $H$. 
This is arbitrage-free if and only we can find $d_L,d_H \ge 0$
with $x = C(L)d_L + C(H)d_H$. Considering the bond and stock components
we have $d_L = (Hr/R - s)/(H - L)$ and $d_H = (s - Lr/R)/(H - L)$.
The model is arbitrage-free if and only if these are both non-negative
so $L/R \le s/r \le H/R$.

Adding an option with payoff $\nu(\omega)$ we have its arbitrage-free value is 
$$
v = \nu(L)d_L + \nu(H)d_H = \frac{(H\nu(L) - L\nu(H))r/R + (\nu(H) - \nu(L))s}{H - L}.
$$

This can be simplified for call options.

__Exercise__. _If $\nu(\omega) = \max\{\omega - K, 0\}$ where $L \le K \le H$ then
$v = (H - K)(Hr/R - s)/(H - L)$_.

__Exercise__. _Show this agrees with the 1-2-3 Model for a call option with strike 2_.

Even though the option price is completely determined by the bond and stock in the
binomial model we can use this to get bounds on the option price. Since $v = (H - K)d_H$
we always have $v \ge 0$. 

### Interval Model

A somewhat more realistic model is the binomial model with sample space
${\Omega = [L, H]}$ where the final stock price can be any value in the interval.
First we show the no arbitrage constraint is still $L/R\le s/r\le H/R$.

__Exercise__. _The smallest cone containing $C(L)$ and $C(H)$ is the same
as the smallest cone containing $C(\omega)$, $L\le\omega\le H$_.

_Hint_: Show if $L\le\omega\le H$ then $C(\omega) = (1 - t)C(L) + tC(H)$ 
for some $t\in[0,1]$.

Since cones are convex, this shows the smallest cone containing $C(L)$ and
$C(H)$ also contains $C(\omega)$ for $\omega\in[L,H]$.

## Appendix

We can make the one-period model more realistic. The price of an instrument must
be an integral multiple of its minimal trading increment, or _tick size_.
Let $\epsilon(i)\in\RR$ be the tick size 
of instrument $i\in I$. Initial prices $x\in\ZZ^I$ correspond
to actual prices $x(i)\epsilon(i)$. Likewise for final prices ${X\colon\Omega\to\ZZ^I}$.

The amount must be an
integral multiple of its minimum share size, or _lot size_.
Let $\delta(i)$ be the lot size 
of instrument $i\in I$. Shares $\xi\in\ZZ^I$ correspond
to amounts $\xi(i)\delta(i)$.

The atoms of finance are _holdings_: an instrument, amount, and owner.
Let ${\eta = (a,i,o)}$ denote owner $o$ holds amount $a$ of instrument $i$.
A _position_ is a collection of holdings.
A _transaction_ at time $t$ is a triple ${(t,\eta,\eta')}$ where 
$\eta$ and $\eta'$ are holdings. If the buyer $o$ holds $\eta$ and
the seller $o'$ holds $\eta'$ at time $t$ then after the transaction settles
the buyer holds $(a',i',o)$ and the seller holds $(a,i,o')$.
The _price_ of the transaction is $X = a/a'$.

Sellers quote prices for potential transactions. Buyers decide whether
or not to execute the transaction. For example, if a seller quotes Ford
stock for $12$ USD per share then the buyer can exchange $\$24$ for 2
shares of Ford stock. This corresponds to the transaction where ${\eta =
(24, \$, o)}$ and ${\eta' = (2, F, o')}$.  The price is ${X = a/a' = 24/2}$
and we can use  $12$ USD/F to indicate a price of $\$12$ per share of Ford
stock. Replacing the virgule '/' by '$= 1$' gives the mnemonic $12$ USD $=
1$ F.  After the transaction settles the buyer holds ${\eta = (2, F, o)}$
and the seller holds ${\eta' = (24, \$, o')}$ in their respective positions.

After a transaction the price is a well-defined number: the amount the buyer
exchanged with the seller divided by the amount the seller exchanged with the buyer.
This number is recorded in the books and records of each counterparty.

Prior to a transaction the price quoted by the seller is not a well-defined number.
The difference between a quoted price and the actual price is called _slippage_.
Sellers quote a bid price and an ask price.
When a buyer buys one share they pay the seller's ask price and when
the buyer sells one share they only get the sellers bid price.
The difference between the ask and the bid is the _bid-ask spread_
and is usually positive. This is how sellers get paid for
providing _liquidity_ to buyers in the market.

The quotes are only valid for transaction of a small number of shares.
As the number of shares becomes larger sellers increase the bid-ask
spread. On an exchange the quote only holds out to level 1 depth before
switching to level 2. Sellers might not know why so many shares are being purchased, but
know demand will move the price up and they will increase their ask.
At some point the number of shares to purchase will bump
into the total number of shares issued and price becomes meaningless.
When a buyer sells shares they face even more restrictions and are also
charged a _borrow cost_ over the period of time they are short.
Prices can also depend on the particular buyer and seller of the
transaction due to credit issues or regulations, among other things.

A more realistic model for prices in a one-period model is to replace
$x\colon I\to\RR$ by $x\colon I\times A\to\RR$ where $A$ is the set
of possible amounts. The cost of setting up the position $\xi\in\RR^I$
is ${\sum_{i\in I} \xi(i) x(i, \xi(i))}$. For a fixed transaction cost
$\tau\in\RR$ per share we have ${x(i, a) = x_0(i) + \tau a}$ where
$x_0$ is the mid price. If a limit order book is available then
a very good approximation to the execution price is the function of
cumulative limit order amounts versus order levels.


## References

<!--
### Grassmann Algebra

We can also solve this using Grassmann Algebra. If $E$ is Euclidean
space define $\GG(E)$ to be the (associative) algebra of points in $E$ with the
condition $PQ = 0$ if and only if $P = Q$ so $PP = 0$. Note $PQ = -QP$
since $(P + Q)(P + Q) = 0$. If $PQ = aRS$ for some scalar $a$ we
say $PQ$ is _congruent_ to $RS$ and write $a = \frac{PQ}{RS}$. If $R = aP + bQ$ then $RPQ = 0$.
Furthermore $PR = bPQ$ and $RQ = aPQ$ so
$R = \frac{RQ}{PQ} P + \frac{PR}{PQ} Q$.

This generalizes to any number of dimensions. If $P_0\cdots P_k = aQ_0\cdots Q_k$
then $a = \frac{P_0\cdots P_k}{Q_0\cdots Q_k}$ and if $PP_0\cdots P_k = 0$ then
$$
	P = \sum_{j=0}^k \frac{P_0\cdots P\cdots P_k}{P_0\cdots P_k} P_j
$$
if $P_0\cdots P_k\not=0$ where $P$ in the numerator takes the $j$-th spot.
Note if $\sum_{j=0}^k a_j P_j = 0$ then $a_j = 0$ for $0\le j\le k$
and we say the $P_j$ are _linearly independent_.
Note the sum of the coefficients is 1 and $P$ is in the convex hull
of $P_0,\ldots,P_n$ if and only if all coefficients are non-negative.

The _weight_ of $aP + bQ$ is $a + b$. Every point having weight 1 on the line determined
by the points $P$ and $Q$ has the form ${R(t) = (1 - t)P + tQ = P + t(Q - P)}$.
Note $Q - P\not= R(t)$ for any $t$. As $t$ goes to infinity $(1 - t)/t$ goes to $-1$
and we interpret $R(\infty) = Q - P$ as the point at infinity determined by $P$ and $Q$
and call it the _vector_ from $P$ to $Q$. As $t$ goes to negative infinity
we get $R(-\infty) = P - Q = -R(\infty)$.

In the last problem above using only the stock and option,
let $O = (0,0)$ be the origin, $P_1 = (0,1)$, and $P_2 = (1,0)$.
We call $E_1 = P_1 - O$ the _stock dimension and $E_2 = P_2 - O$ the _option dimension.
Note
${X(90) = (90, 0) = O + 90E_1 + E_2}$,
${X(100) = (100, 0) = O + 100E_1 + E_2}$, and
${X(110) = (110, 1) = O + 110E_1 + E_2}$.
Since $OX(90)X(100) = 0$ we know $X(100)$ is a linear combination of $O$ and $X(90)$

The smallest cone containing the range of $X$ is the set of all linear
combinations of $X(\omega) - O$, $\omega\in\{90,100,110\}$, with non-negative
coefficients. Since $X(90) - O = .9(X(100) - O)$ we need only
consider $\omega\in\{90,110\}$ so the cone is
$$
\{O + t_{90} 90 E_1 + t_{100} 100 E_1 + t_{110}(110E_1 + 10E_2)\mid t_{90},t_{100},t_{110}\ge 0\}
$$
This is clearly the same a $\{O + tE_1 + u(11E_1 + E_2)\mid t,u\ge0\}$.
Note $x = O + 100E_1 + vE_2$ if the initial option price is $v$
and $v = \frac{OE_1x}{OE_1E_2}$.

By Grassmann Algebra, $t = \frac{Ox(11E_1+E_1)}{OE_1(11E_1 + E_2)}$
and $u = \frac{OE_1x}{OE_1(11E_1 + E_2)}$.
Since $Ox(11E_1+E_1)
= O(O + 100E_1 + vE_2)(11E_1+E_2)
= 100 OE_1E_2 + 11v OE_2E_1 = (100 - 11v) OE_1E_2$ we have $t = 100 - 11v$.
Since $O E_1 x = O E_1 (O + 100E_1 + vE_2) = v O E_1 E_2$
we have $u = v$ so $x$ is in the cone if and only
if $100 - 11v \ge0$ and $v\ge0$ hence $0\le v\le 100/11$.

A more interesting example is the case of options at multiple strikes.
By put-call parity we can assume they are all calls. The sample space is
$\Omega = [L, H]$ containing all strikes and $\omega\in\Omega$ is the final stock price.
The initial prices are $x = (1, s, v_1,\ldots,v_n)$
and the final prices are $X(\omega) = (R, \omega, (\omega - K_1)^+,\ldots,(\omega - K_n)^+)$
The range of $X$ is $\{X(\omega)\mid L\le \omega\le H\}$.
The smallest cone containing the range of $X$ is
$$
	\{tX(L) + uX(H) \sum_{j=1}^n t_n X(K_j)\mid t,u,t_j\ge0\}
$$
where $L < K_1 < \cdots < K_n < H$. If $E_0 = P_0 - O$ is the bond dimension

## Reality

If you are willing to assume prices are bounded, as they are in the real world, then
the one-period model should require $X\colon\Omega\to\RR^I$ is bounded.
This is not the case in the Black-Scholes/Merton continuous time model of lognormal stock prices.
Scholes and Merton won a Nobel prize "for a new method to determine the value of derivatives."
Their assumptions eliminated the need to measure the real-world return on a stock. 
There is still a Nobel prize to be won by someone who can come up with a generally accepted
way to determine the volatility of a stock.
And perhaps multiple future prizes for those who develop theories
not founded on the mathematical fictions of continuous time trading and unbounded prices.


## Hedging

Let $\nu\colon\RR^I\to\RR$ be the _payoff_ of a derivative instrument.
If there exists $\gamma\in\RR^I$ with $\nu(X) = \gamma\cdot X$ then
$E[\nu(X)/R] = \gamma\cdot x$
so the cost of setting up the perfect hedge is $E[\nu(X)/R]$.

We can always compute $\gamma = (d/dx)E[\nu(X)/R]$ and the above shows
$E[\nu(X)/R] = \gamma\cdot X$.
The variance $\Var(\nu(X) - \gamma\cdot X)$ is a measure of how
good the hedge is.




## Probability

We now assume there is a probability measure $P$ on $\Omega$ representing
the real-world event probabilities.

Let $U\colon B(\Omega)\to\RR$ be a _utility function_.
A common choice is $U(Y) = E[Y] - \alpha \Var(Y)$ for some positive risk parameter $\alpha\in\RR$.
Note if $Y\in B(\Omega)$ then moments of all orders exist.

To find a portfolio that maximizes the utility of the realized return we use Lagrange multipliers
to solve
$$
	\max_\xi U(\xi\cdot X) - \lambda(\xi\cdot x - 1).
$$

We need to compute the [Fréchet Derivatives](fd.html) of $D(UM_X)$ where $M_X\xi = \xi\cdot X$ is
the market map as above. The chain rule gives $D(UM_X)\xi = DU(M_x\xi)DM_X\xi = DU(M_x\xi)M_X\xi$
since $DM_X = M_X$.
Note $DU(M_x\xi)$ is in $B(\Omega)^*$ and $M_X\xi\in B(\Omega)$.

The first order condition is $0 = DU(\xi\cdot X)M_X\xi - \lambda x^*$ for all $\xi\in\RR^I$.

$\Var(\xi^T X - \nu(X)) = \xi^T\Var(X)\xi - 2\Cov(X^T, \nu(X))\xi + \Var(\nu(X))$.

$\|A\xi - b\|^2 = \xi^T A^TA \xi - 2b^TA\xi + \|b\|^2$

$\Var(X) = \Cov(X,X) = A^T A$. $\Cov(X^T, \nu(X)) = E[X^T,\nu(X)] = E[X]^TE[\nu(X)]$.

## Liquidity and Risk

It is possible to define a model that takes into account bid/ask spreads involving
the amount traded and the counterparties involved.
A _holding_ is a triple $(a,i,e)$ specifying an integer amount, instrument, and legal entity.
It indicates $e$ is the legal owner of amount $a$ of instrument $i$.
The amount is an integral number of (minimum fractional) shares of the instrument.
-->

<!--

## Maximum Entropy

The _entropy_ of a measure on a finite set $Ω = \{ω_j\}$ with $P(\{ω_j\}) = p_j$, $p_j \ge0$,
is $H = -\sum_j p_j \log p_j$.

$Φ = -\sum_j p_j \log p_j - λ(\sum_j p_j - 1) - μ'(E[X] - Rx)$

$\partial Φ/\partial p_j = -1 - \log p_j - λp_j - μ_j X(ω_j)$

$\partial Φ/\partial λ = \sum_j p_j - 1$

$\partial Φ/\partial μ = E[X] - Rx$

$p_j = \exp(-1 - λ(\sum_j p_j - 1) - μ'(E[X] - Rx))$

$1 = \sum_j p_j = \sum_j \exp(-1 - λ(\sum_j p_j - 1) - μ'(E[X] - Rx))$

$Rx = E[X] = \sum_j X(ω_j) \exp(-1 - λ(\sum_j p_j - 1) - μ'(E[X] - Rx))$

-->
<!--

The Capital Asset Pricing Model assumes that a probability measure is
specified on the sample space of possible outcomes.
[@Mar1952] and [@Roy1952] developed Modern
Portfolio Theory by introducing the concept of an efficient portfolio:
one for which no alternative portfolio offers a higher expected return
at the same level of risk, or a lower level of risk for the same expected
return. In their framework, risk is quantified using the variance of realized
returns.

A common parameterization is to assume returns are jointly normal.
This reduces parameter estimation to the mean and covariance matrix.
If we assume a multi period model where the returns are stationary and independent
(i.e., a random walk)
then standard linear regression can be used to estimate the parameters
based on historical prices. There are still some practical questions
to answer: How far back do you go? Do you use exponential weights?
What exponent should you use?

[@Ros1976] invented Arbitrage Pricing Theory as a systematic approach to estimate
a CAPM probability distribution that depends on information other than historical prices.

After reseachers noted empirical contradictions of the CAPM [@FamFre1992] introduced
specific factors. In addition to excess return over the risk-free rate they used the excess returns
of small‑cap stocks over large‑cap stocks (SMB) and the excess returns of value stocks
over growth stock (HML). They also assume stationary and independent returns
and use linear regression to estimate their model parameters.

If the sample space consists of two point we get the binomial model.
It is not at all realistic, but it can illustrate the concept of arbitrage.
Models that are not arbitrage free are useless so we need a way of
detecting the. The Fundamental Theorem of asset pricing for the one-period
model states there is no arbitrage if and only if the initial prices belong
so the smallest closed cone containing all possible final prices.

-->
<!--
## Grassmann Algebra

We now show how to use the geometric algebra [@Gra1844] invented to solve problems
involving arbitrage free models.

Let $E$ be the set of points in space. The Grassmann algebra $\GG(E)$
is the (noncommutative) algebra over the real numbers generated by points in $E$ with the condition
$PQ = 0$ if and only if $P = Q$ for $P,Q\in E$. In particular $PP = 0$. Multiplication is
associative so $(PQ)R = P(QR)$ and we can write $PQR$ unambiguously.

__Exercise__. _Show $PQ = -QP$_.

_Hint_: $0 = (P + Q)(P + Q) = PP + PQ + QP + QQ$.

__Exercise__. _Show $P(Q + R)(P + Q + R) = 0$_.

<details><summary>Solution</summary>
We have
$$
\begin{aligned}
P(Q + R)(P + Q + R) &= (PQ + PR)(P + Q + R) \\
	&= PQP + PQQ + PQR + PRP + PRQ + PRR \\
	&= PQR + PRQ \\
	&= PQR - PQR \\
	&= 0 \\
\end{aligned}
$$
</details>

An _extensor_ is any nonzero product of points. If $P_0\cdots P_k
= tQ_0\cdots Q_k$ for some scalar $t$ we say the extensors
are _congruent_ and write $t = \frac{P_0\cdots P_k}{Q_0\cdots Q_k}$.

If $R = \sum_{j=0}^k t_j P_j$ $P_0\cdots P_k$ for scalars $t_j$ with $\sum_j t_j = 1$
then
$$
	R = \sum_{j=0}^k \frac{P_0\cdots R \cdots P_k}{P_0\cdots P_k} P_j
$$
where $R$ takes the place of $P_j$ in the numerator of each congruence ratio.

__Exercise__. _Show $\sum_{j=0}^k \frac{P_0\cdots R \cdots P_k}{P_0\cdots P_k} = 1$_.

_Hint_: $\sum_{j=0}^k t_j = 1$.


Descartes assumed an origin for his coordinate system. Given an origin $O\in E$
and points $P_1,\ldots,P_n\in E$ is is possible to write any point in their span
as $P = (1 - \sum_j t_j)O + \sum_j t_j P_j$, as we will see shortly.
The Cartesian coordinates of the $P_j$ relative to origin $O$ are
the tuple $(t_1,\ldots,t_n)$. Note the coefficient of $O$ is determined by the tuple.

If $PQ = tRS$ for some scalar $t$ (with $P\not=Q$ and $R\not=S$)
then $PQ$ and $RS$ are _congruent_ and we write $t = \frac{PQ}{RS}$.
If $R(t) = (1 - t)P + tQ = P + t(Q - P)$ we can think of $R(t)$ as the point $P$
plus a scalar multiple of the _vector_ $Q - P$.

__Exercise__. _Show $R(t) = Q + (1 - t)(P - Q)$_.

Since $R(t)Q = (1 - t)PQ$ and $PR(t) = tPQ$.
we have $R(t) = \frac{RQ}{PQ}P + \frac{PR}{PQ}Q$.

__Exercise__. _Show $PQR = 0$_.

__Exercise__. _Show $R(t) \not= Q - P$ for any $t$_.

Note $PQ(Q - P) = 0$.

__Exercise__. _Show $\frac{(Q - P)Q}{PQ} = -1$ and $\frac{P(Q - P)}{PQ} = 1$_.
The _convex hull_ of points $P_0,\ldots,P_k$ in $E$ is
$$
	\co(P_0,\ldots,P_k) = \{\sum_{j=0}^k t_j P_j\mid t_j \ge 0, \sum_j t_j = 1\}. 
$$
Clearly $P_j$ is in the convex hull for all $j$.

__Exercise__. _Show if $Q$ and $R$ are in the hull then
every convex combination of $Q$ and $R$ is also in the hull_.

This gives a simple way to detect if a point is in the convex hull of a set of points
whose product is not 0. Given a candidate point $P\in E$ calculate
$P_0\cdots P\cdots P_k$ where $P$ replaces $P_j$, $0\le j\le k$ in the product.
The point $P\in E$ is in the convex hull if and only if
all the congruent ratios are non-negative.

Since there is no origin in Euclidean space we have to define a cone relative to some point $O\in E$.
We say $C\subseteq\GG(E)$ is a cone with _origin_ $O$ if $C$ is convex and for every $P\in C$
we have the ray from $O$ through $P$, $O + t(P - O)$ for $t\ge0$, is in $C$.

__Exercise__. _Show the smallest cone with origin $O$ containing $P_1, \ldots, P_k$ is_
$$
\begin{aligned}
	\cone_O(P_1,\ldots,P_k) &= \{O + \sum_{j=1}^k t_j (P_j - O)\mid t_j\ge0\} \\
		&= \{(1 - \sum_{j=1}^n t_j) O + \sum_{j=0}^k t_j P_j\mid t_j\ge0\}. \\
\end{aligned}
$$
Note the similarity to the convex hull, however the coefficient of $O$ might be negative.

???Let's revisit the binomial model using Grassmann Algebra.
In the binomial model we have $x = (1, s)$ and $X(\omega) = \omega$ for $\omega\in\{L,H\}$. Let
$P_b$ be the point in the bond dimension and $P_s$ be the point in the stock dimension
so $x = (1 - 1 - s)O + P_b + s\,P_s$,
$X(L) = (1 - R - L )O + R\,P_b + L\,P_s$, and
$X(H) = (1 - R - H )O + R\,P_b + H\,P_s$.
Since
$$
	x = \frac{xX(L)X(H)}{OX(L)X(H)} O + \frac{OxX(H)}{OX(L)X(H)} X(L) + \frac{OX(L)x}{OX(L)X(H)} X(H)
$$
we can find the no arbitrage conditions by a simple, if somewhat tedious, calculation.
$$
\begin{aligned}
OX(L)X(H) &= (R\,OP_b + L\,OP_s)X(H) \\
	&= (R\,OP_b + L\,OP_s)( (1 - R - H )O + R\,P_b + H\,P_s) \\
	&= RH\,OP_bP_s + LR\,OP_sP_b \\
	&= R(H-L)\,OP_bP_s \\
\end{aligned}
$$
The coefficient of $O$ is determined by the other two coefficient so we write $\_O$ to streamline calculations.
For the bond coefficient we compute
$$
\begin{aligned}
OxX(H) &= (OP_b + s\,OP_s)X(H) \\
	&= (OP_b + s\,OP_s)(\_O + R\,P_b + H\,P_s) \\
	&= H\,OP_bP_s + sR\,OP_sP_b \\
	& = (H - sR)\,OP_bP_s \\
\end{aligned}
$$
For the stock coefficient we compute
$$
\begin{aligned}
OX(L)x &= (R\,OP_b + L\,OP_s)x \\
	&= (R\,OP_b + L\,OP_s)(\_O + P_b + s\,P_s) \\
	&= Rs\,OP_bP_s + L\,OP_sP_b \\
	&= (Rs - L)OP_bP_s \\
\end{aligned}
$$
Since $R$ and $H - L$ are positive
the no arbitrage condition are ${H - sR\ge0}$ and ${Rs - L\ge0}$
so $L/R \le s \le H/R$.

__Exercise__. _What is the cone with origin $O$ generated by $\{X(\omega)\mid L\le\omega\le H\}$_.

_Hint_: It is the same as the cone with origin $O$ generated by $X(L)$ and $X(H)$.

We have already established this without using Grassmann algebra
but generalizations to higher dimensional cases can be reduced to a calculation.

We can add a call option with price $v$ and strike $K\in(L,H)$.
The one period model is now ${x = (1, s, v)}$ and ${X(\omega) = (R, \omega, \max\{\omega - K, 0\})}$
for ${\omega\in[L,H]}$.
It is not obvious the no arbitrage conditions are ${s\le K}$ and ${0\le v\le\frac{(Rs - L)(H - K)}{R(H - L)}}$
but this can be reduced to a straightforward calculation.

__Exercise__. _Show the cone with origin $O$ generated by the range of $X$ is
the same as that generated by $X(L)$, $X(K)$, and $X(H)$_.

_Hint_: Every $X(\omega)$ is a convex combination of either $X(L)$ and $X(K)$
if $L\le\omega\le K$ or $X(K)$ and $X(H)$ if $K\le\omega\le H$.

If $P_o$ is a point in the option dimension then
${x = \_O + P_b + s\,P_s + v\,P_o}$ and
${X(\omega) = \_O + R\,P_b + \omega\,P_s + (\omega - K)^+\,P_o}$.

The arbitrage free conditions are reduced to calculating congruence ratios as above.
$$
\begin{aligned}
OX(L)X(K)X(H) &= (R\,OP_b + L\,OP_s)X(K)X(H) \\
	&= (R\,OP_b + L\,OP_s)(\_O + R\,P_b + K\,P_s)X(H) \\
	&= (RK\,OP_b P_s + LR\,OP_s P_b)(\_O + R\,P_b + H\,P_s + (H - K)\,P_o) \\
	&= RK(H - K)\,OP_b P_s P_o + LR(H - K)\,OP_s P_b P_o \\
	&= R(H - K)(K - L)\,OP_b P_s P_o \\
\end{aligned}
$$
The coefficient of $X(L)$ is
$$
\begin{aligned}
OxX(K)X(H) &= (OP_b + s\,OP_s + v\,OP_o)X(K)X(H) \\
	&= (OP_b + s\,OP_s + v\,OP_o)(\_O + R\,P_b + K\,P_s)X(H) \\
	&= (RK\,OP_b P_s + sR\,OP_s P_b)(\_O + R\,P_b + H\,P_s + (H - K)\,P_o) \\
	&= RK(H - K)\,OP_b P_s P_o + sR(H - K)\,OP_s P_b P_o \\
	&= R(H - K)(K - s)\,OP_b P_s P_o \\
\end{aligned}
$$
The coefficient of $X(K)$ is
$$
\begin{aligned}
OX(L)xX(H) &= (R\,OP_b + L\,OP_s)xX(H) \\
	&= (R\,OP_b + L\,OP_s)(P_b + s\,P_s + v\,P_o)X(H) \\
	&= (Rs\,OP_b P_s + Rv\,OP_b P_o + L\,OP_s P_b + Lv\,OP_s P_o)X(H) \\
	&= (Rs - L)OP_b P_s + Rv\,OP_b P_o + Lv\,OP_s P_o)( R\,P_b + H\,P_s + (H - K)\,P_o) \\
	&= ((Rs - L)(H - K) - RvH + LvR) OP_b P_s P_o \\
	&= ((Rs - L)(H - K) - Rv(H - L)) OP_b P_s P_o \\
\end{aligned}
$$
The coefficient of $X(H)$ is
$$
\begin{aligned}
OX(L)X(K)x &= (R\,OP_b + L\,OP_s)X(K)x \\
	&= (R\,OP_b + L\,OP_s)(R\,P_b + K\,P_s)x \\
	&= (RK\,OP_b P_s + LR\,OP_sP_b)x \\
	&= R(K - L)OP_b P_s(P_b + s\,P_s + v\,P_o) \\
	&= (R(K - L)v\,OP_b P_s P_o \\
\end{aligned}
$$
The no arbitrage conditions are ${s\le K}$ and ${0\le v\le\frac{(Rs - L)(H - K)}{R(H - L)}}$.
Of course the condition ${L\le Rs \le H}$ holds from the model not containing the option.

__Exercise__. _Consider a model with a bond having zero interest, and a stock that starts
at 100 and can go to either 90, 100, or 110. What are the arbitrage-free values
of an at-the-money call_?

_Hint_. The model is $x = (1, 100, v)$, $X(\omega) = (1, \omega, \max\{\omega - 100, 0\})$
where $\omega\in\{90,100,110\}$. Show $0\le v\le 5$.

__Exercise__. _Remove the bond from the above model and answer the same question_.

_Hint_: The answer is $0\le v\le 100/11 = 9.090\ldots$.

$x = (1, s, v_1,\ldots,v_n)$, $X(\omega) = (R, \omega, (\omega - K_1)^+,\ldots,(\omega - K_n)^+)$.

$X(L) = \_O + R\,P_r + L\,P_s$

$X(K_1) = \_O + R\,P_r + K_1\,P_s$

$X(K_2) = \_O + R\,P_r + K_2\,P_s + (K_2 - K_1)\,P_1$

$X(K_n) = \_O + R\,P_r + K_n\,P_s + (K_n - K_1)\,P_1 + \cdots + (K_n - K_{n-1})\,P_{n-1}$

$X(H) = \_O + R\,P_r + H\,P_s + (H - K_1)\,P_1 + \cdots, (H - K_{n-1})\,P_{n-1} + (H - K_n)\,P_n$

$OX(L) =  R\,OP_r + L\,OP_s$

$OX(L)X(K_1) = R(K_1 - L)\,OP_rP_s

Grassmann algebra can also be used to detect and find an arbitrage when it exists.
If any of the coefficients are negative then arbitrage exists. If only one
coefficient is negative the arbitrage is perpendicular the the hyperplane determined
by the points having positive coefficients.

We can also extend this to an arbitrary number of call options with strikes between the
low and high values for the underlying instrument. The author implemented this
for the option trading book at Banc of America Securities. We found the only arbitrage
opportunities were negative price butterfly spreads at adjacent traded strikes, but the bid/ask
spread turned the price positive.
-->

