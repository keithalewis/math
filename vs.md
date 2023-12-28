---
title: Put-Call parity
author: Keith A. Lewis
institution: KALX, LLC
email: kal@kalx.net
classoption: fleqn
abstract: For European options
...

\newcommand\mb[1]{\boldsymbol{#1}}
\newcommand\bm[1]{\boldsymbol{#1}}
\newcommand\RR{\bm{R}}
\newcommand\FF{\bm{F}}
\newcommand\NN{\bm{N}}
\newcommand\LL{\mathcal{L}}
\newcommand\BB{\mathcal{B}}
\newcommand\ran{\operatorname{ran}}
\renewcommand\ker{\operatorname{ker}}
\newcommand\span{\operatorname{span}}

Put call parity states the price of a call minus a put
having the same strike and expiration is equal to the forward of the underlying minus the strike.
It is not the case this always holds. For example, if the options are American style exercise
then they may have different optimal exercise times.

The relation between the underlying spot price and its forward is called _cost-of-carry_.
For a one-period model of intruments $I$ the initial prices
are given by $x\in\RR^I$. The terminal prices are given by a bounded
functions $X\colon S\to\RR^I$ where $S$ is the set of possible outcomes.
