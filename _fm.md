---
title: Financial Model
author: Keith A. Lewis
institute: KALX, LLC
classoption: fleqn
fleqn: true
abstract: Univeral Financial Model
...

\newcommand\RR{\bm{R}}

This note provides a mathematical model of finance.

Motivation: There are problems with mathematical finance.

## Time

Let $T$ denote the set of all times with the total order $t\le t'$ indicating $t$
occured before or at $t'$. 

## Entity

The set $E$ consists of all legal entities, i.e., all individuals and corporations.
The partial order $e\preceq e'$ indicates the entity $e$ is owned by entity $e'$.

## Instrument

Let $I$ denote the set of all instruments and let $I(t,e)$ the set of all instruments
that are available to entity $e$ at time $t$.

## Amount

Amounts $A$ can be represented by a real number. Let
$A(t;i,e;i',e')\subseteq \bm{R}$ denote the set of amounts of instrument $i$ that entity $e$ can
exchange for instrument $i'$ with entity $e'$ at time $t$. This set is determined by
the _seller_ $e'$. The _buyer_ is $e$.

## Holding

A holding $(a,i,e)$ is an amount, instrument, and entity. 

## Trade

A _trade_ $(t;a,i,e;a',i',e')$ is an exchange of holdings between a buyer and a seller.
At time $t$ the buyer $e$ _pays_ holding $(a,i,e)$ to the seller and _receives_ holding $(a',i',e')$.
The _price_ of the trade is $X = a/a'$. The buyer exchanges the holding $(a'X,i,e)$ for
the holding $(i',a',e')$ with the seller.

## Cash Flow

Instruments entail _cash flows_ $C\colon T\times I\times I\to\RR$. Holding $(a,i,e)$
at time $t$ results in an additional holding $(aC(t;i,i'), i', e)$. The cash flow
is determined by the _issuer_ of instrument $i$.

## Price

The seller determines the _price_ $X\colon T\times I\times E\times A\times I\times E\to\bm{R}$
At time $t\in T$ the buyer $e$ can _trade_ $a'X(t;i,e;a',i',e')$ of instrument $i$ for
amount $a'$ of instrument $i'$ with seller $e'$.

## Trading Strategy

A _trading strategy_ is a finite sequence of increasing times $(τ_j)$ and corresponding
amounts $(Γ_j)$. The trading times depend only on the information available to the
buyer. The amounts must satisfy $Г(t;i,e;i',e')$ belongs to $A(t;i,e;i',e')$.

### Position



The _value_ 

## Appendix

A _relation_ on the cartesian product $A\times B = \{(a,b):a\in A, b\in B\}$
is a subset $R\subseteq A\times B$. We use $aRb$ to indicate $(a,b)\in R$.
The _product_ of the relations $R\subseteq A\times B$ and $S\subseteq B\times C$
is the relation $RS = \{(a,c):aRb, bSc\text{ for some }b\in B\}\subseteq A\times C$.
The _converse_ of a relation $R\subseteq A\times B$ is
$R' = \{(b,a):(a,b)\in R\} \subseteq B\times A$.

Let $∆_A = ∆ = \{(a,a):a\in A$ be the _diagonal relation_ on $A\times A$.  A relation on
$R\subseteq A\times A$ is _reflexive_ if $∆\subseteq R$, _symmetric_ if $R = R'$,
_antisymmetric_ if $R\cap R'\subseteq ∆$, and _transitive_ if $R^2 = RR\subseteq R$.

Let $A^B = \{f:B\to A\}$ be the set of all _functons_ from the set $B$ to
the set $A$.


