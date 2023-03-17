---
title: Finance
author: Keith A. Lewis
institution: KALX, LLC
email: kal@kalx.net
classoption: fleqn
abstract: Atoms of finance and their interaction.
...

\newcommand\mb[1]{\mathbf{#1}}
\newcommand\RR{\mb{R}}
\newcommand\ker{\operatorname{ker}}
\newcommand\ran{\operatorname{ran}}
\newcommand\cod{\operatorname{cod}}
\newcommand\dom{\operatorname{dom}}

What does it mean to say "Ford is trading at 8?"

The first approximation is "Ford stock is trading at 8 dollars per share."

This means you can pay 8 dollars to obtain 1 share of Ford stock.
You can also get 8 dollars to take on the obligation of buying
back one share of F at some future date.
More generally, you can pay $8a$ dollars to obtain $a$ shares of Ford stock,
where $a$ can be positive or negative, if you are a mathematician
ignoring reality.

In order to do this you will need to set up an account with an _exchange_
that has legal agreements with _broker_s
licensed to trade F, the stock symbol for Ford.  Step one is to lay down
some money for a _margin account_ with the exchange to fund your trading
activity.  They will provide you with software that will show you the
"price" of F.  When their screen shows a price of 8 and you buy one
share of F you might be surprised to find out they debited your account
for 8.01 dollars. This is called "slippage" but the exchange calls it
the vigorish they get for hooking you up with a broker/_liquidity provider_.

Liquidity providers submit _limit orders_ to the exchange.
They agree to buy or sell some _amount_ of the underlying at a specific _level.

Broker

bid/ask spread

a = 8a' <-> a'

(a, i, e) <-> (a', i', e') has price X = a'/a


## Entity

Let $E$ be a set of _entities_. An entitiy $e\in E$ can own intruments and is subject to
laws and regulations of the country they are governed by.

## Instrument

Let $I$ be a set of _instruments_. An _instrument_ $i\in I$ is a tradeable asset that can be owned by an entity.

## Amount

An _amount_ $A$ measures the quantity of an instrument. Each instrument has a smallest unit
of exchange so $A$ is an integer.

## Atom

The _atoms_ of finance are _positions_: $\pi = (a, i, e)\in A\times I\times E$.
Entity $e$ owns amount $a$ of instrument $i$.
Given a postion $\pi = (a, i, e)$ we write $\pi_a$, $\pi_i$, and $\pi_e$ for $a$, $e$, and $i$.

## Portfolio

A _portfolio_ is a set of positions $\Pi \subseteq A\times I\times E$.
It is convenient to aggregate portfolios into _net_ amounts.
Define $A_\Pi\colon I\times E\to A$ by
$$
	A_\Pi(i, e) = \sum_{\pi\in\Pi} \{\pi_a\mid \pi_i = i, \pi_e = e\}
$$

The _net_ portfolio of $\Pi$ is $N_\Pi = \{(A_\Pi(i, e), i, e)\mid i\in I, e\in E\}$.
Note $N_\Pi\subseteq A^{I\times E}$.

Define $\alpha_\Pi\colon \Pi\to I\times E$ by $\alpha_\Pi(a, i, e) = (i, e)$

__Exercise__. _Show $A_\Pi(i,e) = +^*\alpha_\Pi(i,e)$_.

_Hint_. $\alpha_\Pi(i,e)$ is the right coset and $+^*S = \sum\{s\in S\}$.

## Transaction

A _transaction_ is an exchange of positions at a time $t$, $\chi = (t, \pi, \pi')$.
The _buyer_ holding $\pi$ trades that with a _seller_ holding $\pi'$ at time $t$.
After a transaction the buyer holds $(a',i',e)$ and the seller holds $(a, i, e')$.
The _price_ of the transaction is $X = \pi'_a/\pi_a$.

Define $\delta_{i,e}(i',e') = 1$ if $i = i'$ and $e = e'$, otherwise 0.
A transaction can be represented by a vector
$$
	X(\chi) = a(\delta_{i,e'} - \delta_{i,e}) + a'(\delta_{i',e} - \delta_{i',e'}).
$$
Amount $a$ of of instrument $i$ is credited to entity $e'$ and debited from $e$.
Amount $a'$ of of instrument $i'$ is credited to entity $e$ and debited from $e'$.

If the net portfolio is $N$ at time $t$ the result of the transaction
is $N + X(\chi)$ when it settles.


## Mark to Market

Given $i'\in I$ and a set of prices $X_{i,i'}$ we can mark a portfolio to $i'$
by assuming the transactions $(t; a'X_{i,i'}, i; a', i')$, $a\in\RR$
are available to any entities.

A single entity $e$ computes $\sum$...

If the USD/JPY exchange rate is $123$ then one dollar can be exchanged for 123 yen at
the time it is _quoted_ by the seller. It is almost true that the buyer
can exchange $a$ dollars for $123a$ yen with the seller. In reality it depends on
the sign and size of $a$. If $a$ is positive then the seller will quote
the _ask_ price. If $a$ is negative then the seller will quote the _bid_ price.
The _spread_ is the difference between the ask and bid is typically a positive number.
As the magnitude of the amount the buyer wants to transact increases, the spread gets larger.

## Notes

We assemble some basic facts about sets and relations.

### Product

The _cartesian product_ of sets $A$ and $B$ is the set of ordered
pairs $A\times B = \{(a, b)\mid a\in A, b\in B\}$.
Define _projections_ $\pi_A\colon A\times B\to A$ by $\pi_A(a, b) = a$
and $\pi_B\colon A\times B\to B$ by $\pi_B(a, b) = b$.

__Exercise__. _If $\alpha\colon C\to A$ and $\beta\colon C\to B$
are functions, show there is a unique function $\gamma\colon C\to A\times B$
with $\alpha(c) = \pi_A(\gamma(c))$ and $\beta(c) = \pi_B(\gamma(c))$, $c\in C$_.

_Hint_. Show $\gamma(c) = (\alpha(c), \beta(c))$ is the only such function.

The cartesian product can be generalized to any collection of sets $(A_i)_{i\in I}$.
Define $\Pi_{i\in I} A_i$ by $\pi_j\colon\Pi_{i\in I} A_i\to A_j$, $j\in I$
where given $\alpha_j\colon C\to A_j$, $j\in I$ there exists a unique
function $\gamma\colon C\to\Pi_{i\in I} A_i$ with $\pi_j(\gamma(c)) = \alpha_j(c)$,
$j\in I$, $c\in C$.

__Exercise__. _If $A_i = A$ for all $i\in I$ then
$\Pi_{i\in I} A = A^I = \{\alpha\colon I\to A\}$_.

_Hint_. Let $\pi_j(a) = a(j)$ for $a\in A^I$.

### Relation

A _relation_ is a subset of the cartesian product of sets.  If $A$ and
$B$ are sets and $R\subseteq A\times B$ we write $aRb$ for $(a,b)\in R$.
Define $aR = \{b\in B\mid aRb\}$ and $Rb = \{a\in A\mid aRb\}$ to be
the left and right _coset_, respectively.

The _domain_ of a relation is $\dom R = \{a\in A\mid aRb\text{ for some }b\in B\}$
and the _codomain_ is $\cod R = \{b\in B\mid aRb\text{ for some }a\in A\}$.

__Exercise__. _Show $\dom R = \cup_{b\in B} Rb$ and $\cod R = \cup_{a\in A} aR$_.

A _function_ is a relation when $aR$ is a singleton for every $a\in A$.
We write $R(a) = b$ where $b$ is the unique element of the left coset.
If the left coset is either a singleton or empty then $R$ is a _partial function_.

Given a function $f\colon X\to Y$ define $\ker f = \{fb\mid b\in B\}$
where $fb$ is the right coset of $b$ for $f$.
The kernel of a function is a partition of its domain.

__Exercise__. _Show $\cup\ker f = \cup_{b\in B} fb = A$ and if $fb = fb'$ then
either $fb = fb'$ or $fb\cap fb' = \emptyset$._

_Hint_. For $a\in A$ we have $a\in fb$ where $b = f(a)$.
If $a\in fb\cap fb'$ then $f(a) = b$ and $f(a) = b'$ so $b = b'$ and $fb = fb'$.

### Monoid

A _monoid_ is an _associative_ binary operation $m\colon M\times M\to M$ with an _identity_
element $e\in M$. Associative means $m(a, m(b, c)) = m(m(a, b), c)$ for $a,b,c\in M$.
The identity satisfies $m(a,e) = a = m(e, a)$ for $a\in M$.
When the binary operation is understood we write $ab$ for $m(a,b)$.

__Exercise__. _Show the identity element is unique_.

_Hint_: If $e'$ is another identity then $e = ee' = e'$.

__Exercise__ _If $m$ is an associative binary operation on $M$ and define $ae = a = ea$, $a\in M$, then
$M\cup\{e\}$ is a monoid_.

We can extend the binary operation to all finite ordered sequences of elements from $M$.
Let $M^* = \cup_{n\ge 0} M^n$. Define $m^*\colon M^0$ by $m^0(\emptyset) = e$.
Given $m^n\colon M^n\to M$ define $m^{n+1}\colon M^{n+1} = M^n\times M\to M$ by
$m^{n+1}(a,b) = m(m^n(a), b)$.

### Partition

$f\colon A\to M$ 
