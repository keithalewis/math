---
title: Bonds
author: Keith A. Lewis
institution: KALX, LLC
email: kal@kalx.net
classoption: fleqn
abstract: Terminology for bonds
fontsize: 12pt
...

\newcommand\RR{\boldsymbol{R}}
\renewcommand\AA{\mathcal{A}}

## Discount

A _zero coupon bond_, or _bullet_ has unit cash flow at maturity $t$. Its
price at time 0, $D(t)$, is the _discount_.
Its price at time $s \le t$ is $D(s, t)$
so $D(t) = D(0,t)$.

__Exercise__. _Show $D(s,t) = D(t)/D(s)$_.

_Hint_: Buy $D(s,t)$ at time 0 of a zero maturing at $s$.
At $s$ buy $D(s,t)$ of a zero maturing at $t$.
It costs $D(s,t)D(s)$ at time 0 to replicate a zero maturing at $t$.

The _forward curve_ $f(t)$ is defined by $D(t) = \exp(-\int_0^t f(s)\,ds)$ 
Note $D(t,u) = \exp(-\int_t^u f(s)\,ds)$.
The _par curve_, or _yields curve_, $y(t)$ is defined by $D(t) = \exp(-t y(t))$.
Note the yield $y(t) = (1/t)\int_0^t f(s)\,ds$
is the average of the forward curve so $ty'(t) + y(t) = f(t)$.
It is computationally preferable to work with the forward curve since
integration smooths out variations. 

### Stochastic Discount

An _interest rate model_ is determined by the _stochastic forward rate_ $f_t$.
It represents the (unknown) repo rate available at time $t$.
The _stochastic discount_ is $D_t = \exp(-\int_9^t f_s\,ds)$.
The price at time $s$ of a zero coupon bond maturing at time $t$
is $D_s(t) = E_s[D_t]/D_s$, where $E_s$ indicates the conditional expectation
given information available at time $s$.

## Bonds

Bonds are _fixed income_ instruments. 
A fixed income instrument has cash flows $(c_j)$ at times $(t_j)$,
$0\le j\le n$. The _issue date_ is $t_0$ and _maturity date_ is $t_n$.

For a standard bond with coupon $c$ and _day count basis $\delta$_ we have
$c_0 = 0$, $c_j = c\delta(t_{j-1}, t_j)$, $1 < j < n$, and 
$c_n = 1 + c\delta(t_{n-1}, t_n)$, where $\delta(t,u)$ is the _day count
fraction_ for the interval $[t,u]$ corresponding to the _day count basis_.
The day count fraction is approximately equal to the time in years from
$t$ to $u$. For example, the Actual/360 day count basis has day count fraction
equal to the number of days from $t$ to $u$ divided by 360.

At time $t$ the _next coupon date_ $t\_(t) = \min\{ t_j \mid t_j > t\}$
and the _previous coupon date_ $\_t(t) = \max\{ t_j \mid t_j \le t\}$.
Note if $\_t(t) \le t_j < t\_(t)$ then $\_t(t_j) = t_j$ and $t\_(t_j) = t_{j+1}$.

The _accrued interest_ at $t$ is $a(t) = c_j \delta(\_t(t), t)$. The
buyer must pay this to compensate the seller since the buyer gets the full coupon
at the next coupon date.  The _dirty price_ is _clean price_ plus accrued
interest. Clean price is the present value of future cash flows.

A fixed income instrument is a portfolio of zero coupon bonds.
Its _present value_ at _pv date_ $t$ is $p(t) = \sum_{t_j > t} c_j D(t, t_j)$.
For a stochastic interest rate model the present value at $t$ is
$p_t = \sum_{t_j > t} c_j D_t(t_j)$.

The yield $y = y(t) = y(t,p)$ for price $p$ quoted at $t$ is defined by 
$p = \sum_{t_j > t} c_j e^{-y(t_j - t)}$. This is never used in practice and
yields involve a _compounding frequency_ $n$.
The $n$-th annually compounded yield $y_n$, or _yield to maturity_, if $n$ is understood, is determined by 
$p = \sum_{t_j > t} c_j(1 + y_n/n)^{-n(t_j - t)}$. (Is this correct?).

($ytm = (c + (face - pv/2)/2)/(face + pv)/2$?)

There are several types of _duration_. 
Without an adjective, duration is the derivative of price with respect to a parallel
shift of the forward curve $dp/df = -\sum_{t_j > t} c_j D(t, t_j) (t_j - t)$,
the time weighted average of the discounted cash flows.
Since price is a decreasing function of yield the duration is typically quoted
without the minus sign.

__Exercise__. _The duration of a zero coupon bond is its maturity_.

_Modified duration_ is the derivative of bond price with respect to yield, 
$$
\begin{aligned}
	dp/dy_n &= \sum_{t_j > t} c_j(1 + y_n/n)^{-n(t_j - t) - 1}(-n(t_j - t)/n) \\
	&= -(\sum_{t_j > t} c_j(1 + y_n/n)^{-n(t_j - t)}(t_j - t))/(1 + y_n/n) \\
\end{aligned}
$$
This is approximately equal to $(dp/df)/(1 + y_n/n)$.

_Macaulay duration_ is the derivative of the logarithm of
the price $d(\log p)/df = (dp/df)/p$.

Bond issuers can make bonds cheaper by attaching a call option. The
option is specified by a series of times and call prices, the _call
schedule_. At each call date the issuer can pay the holder the call
price to terminate their remaining bond cash flow obligations.

They can also make a bond more valuable by attaching a put option by
specifying a put schedule allowing the bond holder to pay the issuer
the put price at any put date to _redeem_ (Are calling
and putting both considered redemption?) the bond.

The yield to the first call date of a bond redeemed at the call price is the _yield to call_.
The yield to the first put date redeemed at the put price is the _yield to put_.
The _yield to worst_ is the minimum of yield to maturity and yield to call.

## Tax Loss Harvesting

The _tax basis_ of a bond purchased at a premium is its preset value using
the purchase date yield and cannot be deducted for tax purposes.

Let $\sigma$ be the short term capital gains tax rate and $\lambda$
be the long term capital gains, where $\sigma > \lambda$.

## Vocabulary

refund:

redeem:

## Trading Strategy

Given a set of instruments $I$, trading times $T$, and information
$\AA_t$ at $t\in T$, let $X_t\colon\AA_t\to\RR^I$ be the prices and
$C_t\colon\AA_t\to\RR^I$ be the cash flows at time $t\in T$.
A _trading strategy_ is a finite collection of increasing stopping
times $\tau_j$ and trades $\Gamma_j\colon\AA_{\tau_j}\to\RR^I$.
Trades accumulate to positions $\Delta_t = \sum_{\tau_j < t} \Gamma_j =
\sum_{s<t} \Gamma_s$ where $\Gamma_s(\omega) = \Gamma_j(\omega)1(s =
\tau_j(\omega))$.

The _value_, or _mark-to-market_ at time $t$ of a trading strategy is
$V_t = (\Delta_t + \Gamma_t)\cdot X_t$. It is the amount unwinding the
current position and trades just executed at prevailing market prices would produce.

The _account_ at time $t$ is $A_t = \Delta_t\cdot C_t - \Gamma_t\cdot X_t$.
The trading strategy pays cash flows proportional to the position and
trades executed at $t$ must be paid for.
