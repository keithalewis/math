---
title: Early-Ending Barrier Option
author: Keith A. Lewis
institution: KALX, LLC
email: kal@kalx.net
classoption: fleqn
abstract: For European options
...

\newcommand\bm[1]{\boldsymbol{#1}}
\newcommand\RR{\bm{R}}
\newcommand\FF{\bm{F}}
\newcommand\NN{\bm{N}}
\newcommand\LL{\mathcal{L}}
\newcommand\BB{\mathcal{B}}
\newcommand\ran{\operatorname{ran}}
\renewcommand\ker{\operatorname{ker}}
\newcommand\span{\operatorname{span}}

It is quite rare that mathematics can be applied to financial problems.
Businesses face many problems that cannot be reduced to statements that are either
true or false that can be derived from axioms using rules of inference.
On the occasions that mathematics can be used there is often no other way of solving a problem.

When I worked at a sell-side Big Bank a company we will refer to as D came
to us with a problem to solve.  They issued an IPO to raise capital and
were very successful at turning a profit.  As is quite common in this
situation, they wanted to use their profits to buy back shares they issued.
They were about to issue an earnings announcement that they knew would
cause their stock price to go down and wanted to buy back shares at a lower price.
People running a company have the best inside information.

Unfortunately, that would most likely result in their CFO doing jail
time. Mathematical finance papers rarely mention legal issues involved
with trading, but people running a business have to pay attention.
There is a lockout period after earnings announcements forbidding companies
to transact their stock shares.

One way to lock in a lower price for their buyback is to purchase a
call option.  It is legal to do this as long as the call expiration
date is after the lockout period. The company can choose the strike
equal to their target buyback price. At expiration the call option
will pay the difference between the price at expiration and the strike
if that is positive.  But D knew something no option issuer did: they
were overvaluing the option.  The option issuer will value it using the
discounted risk-neural expected payoff of the call without incorporating
the knowledge D has about its price drastically dropping in the near
future.

D gave BigBank this information so we were able to offer them a lower
price on the call option that our lawyers advised was legal.
It seemed like secondhand insider information to me at the time.
D thought it was still too expensive.  They knew the stock price would
spike down but gave us the option of not paying the call if it didn't.

This is called a down-and-in barrier option. It pays the call if the
stock price goes below a specified level at any point before expiration.
Robert Merton III showed how to price a barrier option assuming constant
volatility in 1976 using the reflection principle for Brownian motion.
BigBank used that to offer them an even cheaper price if they let us
know what knock-in barrier they wanted to use.

D was still not happy with the price quoted based on the barrier level they gave us.
They knew the barrier would be hit shortly after their earnings announcement.
At the time, I worked with Peter Carr who wrote a paper on early ending barrier
options. The call only knocks in if the barrier is hit at a specified time
prior to expiration. 

This is an example of where mathematics can be applied to financial
engineering problems.  No trader on the BigBank desk had ever heard of
early ending barrier options until Peter Carr showed them how to make
this trade happen. BigBank made 9 bucks on the trade and Peter and I
got a good bonus that year.

Something we were unable to figure out was how traders decided to quote
a price that was $9MM above what we told them the risk-neutral price was.
Mathematics was not useful in figuring out that problem.
