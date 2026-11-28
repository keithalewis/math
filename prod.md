---
title: Product
author: Keith A. Lewis
classoption: fleqn
fleqn: true
header-includes:
 - \usepackage{fontspec}
---
\renewcommand\ker{\operatorname{ker}}
\newcommand\coker{\operatorname{coker}}
\newcommand\dom{\operatorname{dom}}
\newcommand\cod{\operatorname{cod}}
\newcommand\cat[1]{\mathsf{#1}}

What is the product of two sets? We look at two different
ways to define this. The first is the messy classical definition using
sets and their members/elements, the second is the elegant category theory definition where you have
to tie one arm behind your back and use only objects and arrows.

## Set

Everything in (classical) mathematics is a set. Logicians like to
say, "The language of set theory is epsilon."
What they mean is set theory is defined using first-order predicate logic
and the symbol (language) '$\in$' indicating set membership.

The set with _members_/_elements_ $a$ and $b$ can be written as $\{a,b\}$
so $a\in\{a,b\}$ and $b\in\{a,b\}$. If $c$ is different from $a$ and $b$
then $c\not\in\{a,b\}$.  Two sets are equal[^1] if and only if they have
the same elements so $\{a,b\} = \{b,a\}$.

[^1]: We will not attempt to define the words "equal" or "same."

Set products are defined using _ordered pairs_ $(a,b)$ where
$(a,b) = (c,d)$ if and only if $a = c$ and $b = d$.

__Exercise__. _Show $(a,b)\not=(b,a)$ if $a\not=b$_. 

__Exercise__. _Show $(a,b) = (b,a)$ if $a = b$_.

Norbert Wiener [@] defined an ordered pair using set theory by
$$
	(a, b) := \{\{\{a\},\emptyset\}, \{\{b\}\}\}
$$
It looks overly complicated, and it is, but you need to understand
the context of the times. Gottlob Frege's [@] theory of sets was that
a set is determined by a rule for membership. 
Bertrand Russell [@] cooked Frege's definition with the example
where the rule for membership is _all sets that are not an element of themselves_:
$S = \{x\mid x\not\in x\}$. If $S\in S$ then it satisfies the
rule $S\not\in S$. If $S\not\in S$ then it it is not the case
$S\not\in S$ so $S\in S$, assuming the law of the excluded middle.

Russell and Alfred North Whitehead [@] set about fixing this contradiction.
They defined an ordered pair in terms of a relation. Wiener showed a
relation could be defined more primitively as a subset of the product of sets.

Unlike Euclid's The Elements [@], that some regard as the second best
selling book after the Bible, only 750 copies of [@Pri] were printed.
Even fewer were purchased and it is anybody's guess how many
people made their way through the n pages of their three weighty tombs.
Nevertheless, their work had a profound influence on the future
of mathematics. They introduced the notion of _types_ and _classes_
to account for sets that got too big for their britches.

These ideas are very much alive and well in modern formal languages for
expressing mathematical proofs such as AUTOMATH, Coq, HOL, Isabelle, HoTT, and Lean.
They are based on the type theory of Church and Martin-Löf that led to
Curry and Howard showing a type and a proof are two sides of the same coin.

Felix Hausdorff proposed the definition
$$
	(a, b) := \{\{a,1\}, \{b,2\}\}
$$
where $1$ and $2$ are distinct from $a$ and $b$, and from each other.

Kazimierz Kuratowski [@] showed there was no need to drag 1 and 2 into the definition.
$$
	(a, b) := \{\{a\}, \{a,b\}\}.
$$

__Exercise__. _Show $(a,a) = \{\{a\}\}$_.

_Hint_. $\{a,a\} = \{a\}$.

__Exercise__. _Show $\{\{a\}, \{a,b\}\} = \{\{c\}, \{c,d\}\}$ if
and only if $a = c$ and $b = d$_.

_Hint_: If $a = b$ then $(a,b) = \{\{a\}\}$. If $\{\{a\}\} = \{\{c\}, \{c,d\}\}$
then $a = c$ and $c = d$.
If $a\not=b$ then $\{a\} = \{c\}$ and $\{a,b\} = \{c,d\}$.
Conclude $a = c$ and $b = d$.

### Product

The _Cartesian product_ of sets $A$ and $B$
is the set of ordered pairs $A\times B = \{(a,b)\mid a\in A, b\in B\}$.
Define _projections_ $\pi_A\colon A\times B\to A$ by $\pi_B(a,b) = b$
and $\pi_B\colon A\times B\to B$ by $\pi_A(a,b) = b$.

__Exercise__. _Show if $p_A\colon C\to A$ and $p_B\colon C\to B$ there
exists $p\colon C\to A\times B$ with $p_A = \pi_A p$ and $p_B = \pi_B p$_.

_Hint_: Let $p(c) = (p_A(c), p_B(c))$.

Next we show there is only one such function.

__Exercise__. _Show if $q_A\colon C\to A$, $q_B\colon C\to B$
and $q\colon C\to A\times B$ with $q_A = \pi_A q$ and $q_B = \pi_B q$
then $q = p$_.

_Hint_: If $q(c) = (a,b)$ then $a = \pi_A q(c) = (\pi_A q)(c)c = q_A(c) = p_A(c)$.
Similarly, $b = p_B(c)$ so $q(c) = (p_A(c), p_B(c)) = p(c)$ for all $c\in C$
and $q = p$.

This shows $p$ is unique and motivates the category theory definition of product.

## Category

Category theory provide a foundation for mathematics quite different from set theory.
Instead of sets with elements category theory uses objects and arrows.
The prototypical category $\cat{Set}$ has sets as objects and functions as arrows.
Many categories are defined as sets with structure where the arrows are
functions that preserve the structure: _homomorphisms_.

If $f\colon A\to B$ is an arrow from
object $A$ to object $B$, define the _domain_ $\dom f = A$ and _codomain_
$\cod f = B$.
If $g\colon B\to C$ is an arrow then $g$ can be _composed_
with $f$ to get an arrow $gf = g\circ f\colon A\to C$.
Any arrows $f$ and $g$ with $\cod f = \dom g$ can be composed.

Composition is associative. If $h\colon C\to D$ then $h(gf) = (hg)f$.
This allows us to write $hgf$ unambiguously. This should remind you
of a semigroup. A _semigroup_ has a binary associative operation.

__Exercise__. _Show a category with one object is a semigroup_.

_Hint_: Show any two arrows are composable and the arrows satisfy
the axioms of a semigroup.

The final requirement for the definition of a category is that every
object $A$ has an _identity arrow_ $1_A\colon A\to A$ with
$f_1A = f = 1_Bf$ for any arrow $f\colon A\to B$.

__Exercise__. _Show $cat{Set}$ is a category_.

A _monoid_ is a semigroup that has an identity element $e$ with 
$em = m = me$ for every element $m$ of the monoid.

__Exercise__. _Show a category with one object is a monoid_.

_Hint_: The arrows are the elements of the monoid and the identity
is $1_A$ where $A$ is the only object in the category.

Categories are monoids where the binary operation is partially defined. 

### Product

The category theory definition of a product of objects $A$ and $B$ is an
object $A\times B$ having _projections_ $\pi_A\colon A\times B\to A$
and $\pi_B\colon B\times A\to B$ having the property that
for any object $C$ and arrows $p_A\colon C\to A$ and
$p_B\colon C\to B$ there exists a unique arrow
$p\colon C\to A\times B$ with $p_A = \pi_A p$ and $p_B = \pi_B p$.

<!--
Given
```
       C
 p_A ↙   ↘ p_B
    A     B
```
there exists unique $p$
```
       C
       ⇣ p
      A×B
 π_A ↙   ↘ π_B
    A     B

```
with $p_A = \pi_A p$ and $p_B = \pi_B p$.
Informally, $p_A$ and $p_B$ factor through $\pi_A$ and $\pi_B$ by $p$.

For example, a function on sets $f\colon A\to B$ is _injective_(_one-to-one_) if
$f(a) = f(a')$ implies $a = a'$, $a,a'\in A$.
In category theory an arrow $f\colon A\to B$ is a _monomorphism_ if
$f$ has a _left inverse_ arrow $g\colon B\to A$ with $g f = 1_A$.

__Exercise__. _Show in the category $\cat{Set}$ that $f$ is injective if and only if
it is a monomorphism_.

_Hint_: If $f$ is mono then there exists $g\colon B\to A$ with $g f = 1_A$ so
$f(a) = f(a')$ implies $a = g f(a) = g f(a') = a'$.
If $f$ is injective define $g\colon B\to A$ by $g(b) = a$ if $f(a) = b$
when $b\in\cod f = f(A) = $\{f(a)\mid a\in A\}$.
For $b\in B\setminus\cod f$ pick any $a\in A$ and let $g(b) = a$.
Show $g$ is well-defined ($b = b'$ implies $g(b) = g(b')$) and
$gf(a) = a$ for $a\in A$.

Let $\#A$ denote the number of elements in set $A$.

__Exercise__. _Show the injective function $f\colon A\to B$ has $(\#B - \#A)^{\#A}$ left inverses_.

_Hint_: Count the functions from $B\setminus f(A)$ to $A$.

A function on sets $f\colon A\to B$ is _surjective_(_onto_) if and only if
for every $b\in B$ there exists $a\in A$ with $f(a) = b$.
In category theory an arrow $f\colon A\to B$ is an _epimorphism_ if 
$f$ has a _right inverse_ arrow $g\colon B\to A$ with $fg = 1_B$.

__Exercise__. _Show in the category $\cat{Set}$ that $f$ is surjective if and only if
it is a epimorphism_.

_Hint_: If $f$ is epi then there exists $g\colon B\to A$ with $fg = 1_B$.
Given $b\in B$ we have $f(a) = b$ where $a = g(b)$.
If $f$ is surjective define $g\colon B\to A$ by $g(b) = a$ for any $a\in A$
with $f(a) = b$. Conclude $fg = 1_B$.

A function is _bijective_ if it is injective and surjective.
An arrow is an _isomorphism_ if it is mono and epi.

__Exercise__. _Show $a\sim_R a$, $a\sim_R a'$ implies $a'\sim_R a$, 
and $a\sim_R a'$, $a'\sim_R a''$ implies $a\sim_R a''$ for $a,a',a''\in A$_.

_Hint_: $aR = aR$, $aR = a'R$ implies $a'R = aR$, and $aR = a'R$, $a'R = a''R$
implies $a = a''R$.

This shows $\sim_R$ is an _equivalence relation_. It satisfies the same
properties as equality, but it is a weaker and more powerful notion.



The category $\set{Poset}$ is motivated by sets as objects and inclusion as arrows.
If
Every pair of objects has exactly one arrow $A\to B$ and
satisfies $A\to A$, $A\to B$ then $B\to A$, and $A\to B$ and $B\to C$
implies $A\to C$.

In the category $\cat{Set}$ a function is mono if and only if it is
A funny thing happened when people tried to use category theory to
define set theory. In set theory we can define membership using
the _characteristic function_ $\xi_A\colon A\to\{0,1\}$ where
$\xi_A(a) = 1$ if $a\in A$ and $\xi_A(a) = 0$ if $a\not\in A$

__Exercise__. _Show $a\in A$ if and only if $\xi_A(a) = 1$_.

Category theory cannot be used to define set membership.
It lead to Topos Theory and subobject classifiers as a substitute for 

We define _category_ and show how they can be used to define _product_.


## Relation 

A _relation_ is a subset of a product ${R\subseteq A\times B}$.
It is convenient to write $aRb$ for ${(a,b)\in R}$.
The _left coset_ of $a\in A$ is $aR = \{b\in B\mid aRb\}$.
The _right coset_ of $b\in B$ is $Rb = \{a\in A\mid aRb\}$.

The _domain_ of a relation $R\subseteq A\times B$
is $\dom R = \pi_A R = \{a\in A\mid aRb\text{ for some }b\in B\}$.
The _codomain_ of a relation $R\subseteq A\times B$
is $\cod R = \pi_B R = \{b\in B\mid aRb\text{ for some }a\in A\}$.

__Exercise__. _Show $\dom R = \cup_{b\in B} Rb$ and $\cod R = \cup_{a\in A} aR$_.

Relations $R\subseteq A\times B$ and $S\subseteq B\times C$
can be _composed_ 
$$
	SR = \{(a,c)\in A\times C\mid aRb\text{ and } bRc\text{ for some }b\in B\}.
$$
This is used to define the the various joins in relational databases.

The _diagonal_ relation on a set $A$ is ${\Delta_A = \{(a,a)\mid a\in A\}\subseteq A\times A}$.

__Exercise__. _Show if $R\subseteq A\times B$ then $R\Delta_A = R = \Delta_BR$_.

This shows the diagonal is an identity for relational composition.

__Exercise__. _Show if $R\subseteq A\times B$, $S\subseteq B\times C$,
and $T\subset C\times D$ then $(TS)R = T(SR)$_.

_Hint_: If $d((TS))Ra$ then $d(TS)b$ and $bRa$ for some $b\in B$.
If $d(TS)b$ then $dTc$ and $cSb$ for some $c\in C$.

This shows relational composition is _associative_ so we can write $TSR$
unambiguously. 

The _transpose_ of a relation $R\subseteq A\times B$
is $R^* = \{(b,a)\mid b\in B, a\in A\}\subseteq B\times A$.

__Exercise__. _Show if $R\subseteq A\times B$ then $(R^*)^* = R$_.

__Exercise__. _Show if $R\subseteq A\times B$ and $S\subseteq B\times C$
then $(SR)^* = R^*S^*$_.

The _kernel_ of a relation $R\subseteq A\times B$ is the
set of right cosets $\ker R = \{Rb\mid b\in B\}$.
The _cokernel_ of a relation $R\subseteq A\times B$ is the
set of left cosets $\coker R = \{aR\mid a\in A\}$.

Define the relations $\sim_R\subseteq A\times A$ by
$a \sim_R a'$ if and only if $aR = a'R$
and ${}_R\!\sim\subseteq B\times B$ by
$b {}_R\!\sim b'$ if and only if $Rb = Rb'$

__Exercise__. _Show $a\sim_R a$, $a\sim_R a'$ implies $a'\sim_R a$, 
and $a\sim_R a'$, $a'\sim_R a''$ implies $a\sim_R a''$ for $a,a',a''\in A$_.

_Hint_: $aR = aR$, $aR = a'R$ implies $a'R = aR$, and $aR = a'R$, $a'R = a''R$
implies $a = a''R$.

This shows $\sim_R$ is an _equivalence relation_. It satisfies the same
properties as equality, but it is a weaker and more powerful notion.


## Function

A relation is a _function_ if its left coset is $A$ and
every right coset contains exactly one element.
In this case we write $R(a) = b$ for the unique element $b\in B$ with $aRb$
and use the notation $R\colon A\to B$.

The _kernel_ of a function $R\colon A\to B$ is the collection of
right cosets $\ker R = \{Rb\mid b\in B\}$.

Every set $A$ has an _identity function_ $1_A\colon A\to A$ defined
by $1_A(a) = a$ for all $a\in A$.

__Exercise__. _Show if $f\colon A\to B$ is a function then
$f1_A = 1_Bf$_.

_Hint_: Fill in the dots $f1_A(a) = f(a) = \cdots = 1_Bf(a)$.

A function $f\colon A\to B$ is _injective_ (_one-to-one_) if $f(x) = f(y)$
implies $x = y$.

__Exercise__. _Show $f\colon A\to B$ is injective if and only
if there exists $g\colon B\to A$ with $fg = 1_B$_.

_Hint_: $1_B\colon B\to B$ by $1_B(b) = b$ for all $b\in B$.

A function is _surjective_ (_onto_) if for every $y\in B$
there exists $x\in A$ with $f(x) = y$.
A function is _bijective_ (one-to-one and onto) if it is injective and surjective.

Two sets are _equal_ if and only if they have the same elements. Two
sets are _equivalent_ if and only if they have the same number of elements.
This is defined by the existence of a bijective function $f\colon A\to B$.

__Exercise__. _Show $A$ is equivalent to $A$ for any set $A$_.

_Hint_: Show $1_A\colon A\to A$ by $1_A(a) = a$, $a\in A$ is a bijection.

__Exercise__. _Show if $A$ is equivalent to $B$ then $B$ is equivalent to $A$_.

_Hint_: Show if $f\colon A\to B$ is a bijection then $f^{-1}\colon B\to A$
exists and is a bijection.

__Exercise__. _Show if $A$ is equivalent to $B$ and $B$ is equivalent to $C$
then $A$ is equivalent to $C$_.

_Hint_: Show composition of bijections is a bijection.

The _powerset_ of a set $A$ is the set of all subsets.

Set equivalence in a category

Objects and arrows.

The product $A\times B$ is defined by two arrows
$\pi_A\colon A\times B\to A$ and $\pi_B\colon A\times B\to B$.
Given two arrows $p_A\colon C\to A$ and $p_B\colon C\to B$ with

Set -> Category

p_A: C -> A, p_B:C -> B$, exists initial element.

## Category

A _category_ has objects and arrows.
-->
