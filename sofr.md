---
title: EFFR, OBFR, SOFR
author: Keith A. Lewis
institute: KALX, LLC
classoption: fleqn
fleqn: true
abstract: Short Rates
...

Unlike the equity world where the volatility of stocks drown out dainty
considerations of interests rates, the price dynamics of fixed income
instruments without default are completely determine by the (model of)
repo rates.  The large notionals involved require careful attention
to technical details involving valuation versus settlement, day count
conventions, and payment date adjustments based on roll conventions
and holiday calendars.

Building a yield curve involves cash deposits for the short term, forward
rate agreements/futures for the medium term, and swaps for the long term.
The problem of finding a discount curve repricing market instruments
is highly underdetermined. The bootstrap method assumes forward rates
are piecewise constant to provide a unique solution where successive
forwards correspond to the instrument maturities.
It is popular to use splining methods to "smooth" the forward curve but
those introduce spurious mathematical noise into the actual market prices.

It is better to spline by adding synthetic market instruments.
Adding a synthetic 6 year swap with par coupon linearly interpolated from
market 5 and 7 year par coupons is easier to explain to a trader
than an artifact of a cubic Hermite tension spline.

Replacing LIBOR by SOFR is a significant cost to doing business.
Lawyers have to draft new contracts and accomodate existing contracts
that depend on deprecated LIBOR quotes. Quants must
devise new models that can be tuned to the latest market instruments.
Technologists need to implement these. Businesses have to allocate
funds for this and assess the impact on current and future positions
using the new models.

## Silver Lining

In spite of these disruptions, SOFR connects more closly with
the theory of mathematical finance that has been quite successful
in the fixed income world. Dollar denominated swap markets out to 4 years
have been quoted to a few basis point spreads since the late 90's.
There is a clear trajectory in mathematical finance of developing
models that more accurately reflect the realities of trading.
SOFR is the overnight secured lending rate. This maps directly
to the (model of) repo rates.

LIBOR was always a proxy for unsecured lending. After 2008 swaps with
different floating rate payment frequency started trading at different
values. This led to a cottage industry of ad hoc models.
Intoducing a hazard rate and recovery seems to be a little known
two parameter solution to fitting these curves.

Something mathematical finance still needs to grapple with is the
fact SOFR is far more volitile than LIBOR. It can jump more than
bitcoin, as witnessed in September 2019.

## Playbook

As with any new deveopment, understanding its history and current details


The New York Fed calculates the Effective Federal Funds Rate (EFFR) and
Overnight Bank Funding Rate (OBFR) from daily transaction data reported
under the authority of the Board of Governors of the Federal Reserve
System on the FR 2420 Report of Selected Money Market Rates.


## Vocabulary

BCGR
: The Broad General Collateral Rate (BGCR) is a measure of rates on
  overnight Treasury general collateral repurchase agreement (repo)
  transactions. General collateral repo transactions are those for which
  the specific securities provided as collateral are not identified until
  after other terms of the trade are agreed. The BGCR includes all trades
  in the Tri-Party General Collateral Rate plus GCF Repo transactions

EFFR
: The federal funds market consists of domestic unsecured borrowings in
  U.S. dollars by depository institutions from other depository institutions
  and certain other entities, primarily government-sponsored enterprises.

SOFR
: The Secured Overnight Financing Rate (SOFR) provides a broad measure
  of the general cost of financing Treasury securities overnight. The SOFR
  includes all trades used in the BGCR plus data on transactions cleared
  through the Fixed Income Clearing Corporation's Delivery-versus-Payment
  (DVP) repo service. In the DVP repo market, counterparties identify
  specific securities to settle each trade, rather than a population of
  acceptable collateral as in the tri-party repo market.

TCGR
: The Tri-Party General Collateral Rate (TGCR) is a measure of rates on
  overnight, specific-counterparty tri-party general collateral repurchase
  agreement (repo) transactions secured by Treasury securities. General
  collateral repo transactions are those for which the specific securities
  provided as collateral are not identified until after other terms of
  the trade are agreed.
