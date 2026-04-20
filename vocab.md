---
title: Vocabulary
---

Fischer Black was an iconoclast advocating careful thinking about the
[vocabulary](https://www.rasmusen.org/special/black/GlossaryforFinance83.pdf)
used in finance. The next step after vocabulary is to consider how
what is spoken about comes to be.

Do you have $20 in your pocket? Do you own some shares of stock? How did that happen?

The atoms of finance are _holdings_, an _amount_ of some _instrument_ _owned_ by a person or company.
The amount is an integral multiple of the minimal trading increment for the instrument.
It is a mathematical fiction to assume it is a real number and a programming error to
represent this as a floating point number. It is rare to find a mathematician who can give a rigorous
definition of real numbers and even rarer to find a computer programmer who understand the
IEEE 754 floating point standard.

## Finance



## Math

We collect some mathematical facts from a naive perspective.

### Set

We use the naive defininton of a set as a collection of _elements_ that are _members_ of a set.
We write $x\in A$ to indicate $x$ is an element belonging to set $A$.
The set with no elements is the emptyset $\emptyset$.
Two sets are _equal_ if they have the same members.
The set $A$ is a _subset_ of $B$, $A\subseteq B$, if every element of $A$ also belongs to $B$
and is a _strict subset_ of $B$, $A\subset B$, if $A\subseteq B$ and $A\not=B$.

#### Intersection

Given two sets, the _intersection_ is the collection of elements belonging to both sets,
$A\cap B = \{x\mid x\in A\text{ and }x\in B\}$.

#### Union

The _union_ is the collection of elements belonging to either set,
$A\cup B = \{x\mid x\in A\text{ or }x\in B\}$.

#### Difference

The _set difference_ is $A\setminus B = \{x\mid x\in A\text{ and }x\not\in B\}$.
If $A\supseteq B$ then $A\setminus B$ is the _complement_ of $B$ with
respect to $A$.

__Exericise__. _If $A\supseteq B$ show $(A\setminus B)\cap B = \emptyset$
and $(A\setminus B)\cup B = A$_.

#### Product

The _cartesian product_ of two sets is the collection of ordered pairs from each set.
The set $\{a,b\}$ is equal to the set $\{b,a\}$ since they have the same elements.
The _ordered pair_ $(a,b)$ is equal to $(c,d)$ if and only if
$a = c$ and $b = d$. In particular, $(a,b)\not=(b,a)$.
Define $(a,b)$ to be $\{\{a\},\{a,b\}\}$.

__Exercise__. _Show this is an ordered pair_.

_Hint_: If $\{\{a\},\{a,b\}\} = \{\{c\},\{c,d\}\}$
then $\{a\} = \{c\}$ and $\{a,b\} = \{c, d\}$.

The _set exponential_ of two set is the collection of functions from one set to the other.

Bertrand Russell blew Frege's defintion out of the water.

complement, intersection, union, disjoint union, cartesian product, set exponentional.

What is a type? A set together with operations. F-algebra.

What is the difference between a security and an instrument?
