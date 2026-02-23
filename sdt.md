---
title: Simple Difficult Things
author: Keith A. Lewis
classoption: fleqn
fleqn: true
---
\newcommand\bs[1]{\boldsymbol{{#1}}}
\newcommand\NN{\bs{N}}
\newcommand\RR{\bs{R}}
\newcommand\dom{\operatorname{dom}}
\newcommand\cod{\operatorname{cod}}

Mathematics is all about thinking clearly and following your nose,
but it turns out to be remarkably difficult to do this in a rigorous manner.

Euclid introduced the notion of _truth_ that could be _proved_ from
_axioms_ that were assumed to be true.
The Sophists before him were concerned with using language to shape reality.
They figured out how to shut someone down by pointing out their
argument was not _valid_.

Euclid was wrong. The Sophists were right(er). He lead humanity on a two
millenium wild goose chase with his fifth postulate:

> If a straight line falling on two straight lines makes the interior
angles on the same side less than two right angles, then the two straight
lines—if extended indefinitely—meet on that side on which the angles
are less than two right angles.

Perhaps in the context of Euclid's time this was lucid.
A more modern statement is
[Playfair's](https://archive.org/details/elementsgeometr05playgoog/page/n8/mode/2up)

> In a plane, given a line and a point not on it, at most one line
parallel to the given line can be drawn through the point.

It goes against evolution to belive humans think in terms of axioms and rules
of inference. 


## Set

In classical mathematics everything is a set, a bag of distinct _elements_.
Logicians are wont to say "The language of set theory is epsilon."
If you know first order logic and what a language is, this makes perfect sense.
So does the Dao De Jing if you are already enlightened.

The first attempt at defining modern Set Theory is due to Frege. He
defined a set by giving a rule for membership. Bertrand Russell showed
that entailed a contradiction. Let $S$ be the set of all sets $x$ where
it is not the case $x\in x$, $S = \{x\mid x\notin x\}$.

__Exercise__. _Show $S\in S$ implies $S\notin S$ and $S\notin S$ implies $S\in S$_.

Some call this Russell's Paradox but it is actually an antinomy: if
the assumptions of a theorem lead to a contradiction $P$ and not $P$
then the theorem cannot be true. There are two ways to show a theorem
is incorrect: go through the theorem step by step and find an
error in the application of the axioms or rules of inferrence, or
find a counterexample. The later is usually simpler, and more ego crushing
to the incorrect theorem's author.

### Equal

It was not easy to fix up Frege's theory. This led to various schemes to
axiomatize what a set is, e.g., Zermelo-Fraenkel, von Neumann, Gödel–Bernays.
But they all define two sets are _equal_, $A = B$, <span class="define">if and only if</span>
they have the same elements.
$$
	\forall x (x\in A\color{red}\leftrightarrow\color{black} x\in B)
$$

__Exercise__. _Show $A = A$, if $A = B$ then $B = A$, and
if $A = B$, $B = C$ then $A = C$_.

We write $A\not= B$ if it is not the case $A = B$.

__Exercise__. _Show $A\not= B$ if and only if there exists $x\in A$
with $x\not\in B$ or there exists $y\in B$ with $y\not\in A$_.

_Hint_: ??? a <-> b iff !a <-> !b

### Subset

We say $A$ is a _subset_ of $B$, $A\subseteq B$, if and only if
$x\in A$ <span class="define">implies</span> $x\in B$
$$
	\forall x(x\in A\color{red}\rightarrow\color{black} x\in B)
$$

__Exercise__. _Show $A = B$ if and only if $A\subseteq B$ and $B\subseteq A$_.

_Hint_: For propositions $P$ and $Q$, $P\leftrightarrow Q$ if and only if $P\rightarrow Q$ and $Q\rightarrow P$.

### Union

Other logical connectives can be used to define new sets from existing sets.

The _union_ of two sets $A$ and $B$, $A\cup B$, is the set of all
elements belonging to either $A$ <span class="define">or</span> $B$
$$
	\exists A\cup B \forall x(x\in A\cup B\leftrightarrow x\in A\color{red}\vee\color{black} x\in B)	
$$

### Intersection

The _intersection_ of two sets $A$ and $B$, $A\cap B$, is the set of all
elements belonging to both $A$ <span class="define">and</span> $B$
$$
	\exists A\cap B\forall x(x\in A\cap B\leftrightarrow x\in A\color{red}\wedge\color{black} x\in B)
$$
Two sets are _disjoint_ if their intersection does not contain
any elements. The _empty set_ axiom states there exists a set with no
elements, $\emptyset$.
$$
	\exists\emptyset\forall x(x\notin\emptyset)
$$

__Exercise__. _Show $A$ and $B$ are disjoint if and only if $A\cap B=\emptyset$_.

The other axioms are not the first thing you might think of.

### Pairing

The _pairing_ axiom states if $x$ and $y$ are sets then there is a set
with elements $x$ and $y$, $\{x,y\}$. Every element of $\{x,y\}$ is either $x$ or $y$.
$$
	\forall x\forall y\exists \{x,y\}\forall z (z\in \{x,y\} \leftrightarrow (z = x\vee z = y)
$$
At this point we only have the empty set. Using pairing we get
$\{\emptyset,\emptyset\}$.

__Exercise__. _Show $\{\emptyset,\emptyset\ =\{\emptyset\}$_.

By definition $\emptyset\in\{\emptyset\}$.

__Exercise__. _Show $\emptyset\not=\{\emptyset\}$_.

Now we have a set with one element, the emptyset $\emptyset$.
For any set $x$ pairing gives us singleton $\{x\} = \{x,x\}$.

__Exercise__. _Show for any set $x$ we have $x\not=\{x\}$_.

__Exercise__. _Construct the set $\{\{\emptyset\}\}$_.

_Hint_. Use pairing with $\{\emptyset\}$.

### Natural Numbers

This can be repeated to any finite level of nesting.
It is possible to identify ${\emptyset, \{\emptyset\}, \{\{\emptyset\}\},\ldots}$ with
the natural numbers $\NN = {0,1,2\ldots}$ but that is not the preferred encoding.
The von Neumann encoding starts by identifying $\emptyset$ with 0 and for any $n$
define $n + 1 = n\cup\{n\}$.
We have $1 = \{\emptyset\}$ and $2 = 1 + 1 = \{\emptyset\},\{\{\emptyset\}\}\}$.

__Exercise__. _Write $3 = (1 + 1) + 1$ in terms of $\emptyset$_.

__Exercise__. _Show $n \not= n+1$_. ???

_Hint_. Show $n\not= n\cup\{n\}$. ???

__Exercise__. _Show $n + m = n\cup\{m\}$_.

_Hint_: Clearly $n + 0 = n\cup\{0\}$ ???

### Foundation

The axiom of _foundation_ addresses the Russell counterexample.

__Exercise__. _Let $S = \{\cdots\{\emptyset\}\cdots\}$ be an infinite
level of nesting. Show $S\in S$_.

_Hint_: You cannot prove or disprove this with the axioms discussed so far.

It may seem plausible that removing the outside pairing of a countably infinite
number of brackets leaves a countably infinite number of brackets, but
always be wary of proofs involving $\cdots$.

There are some set theories where this is true, and some where it is not.
In ZF set theory the axiom of _foundation_ states every set has an element 
not in the set.
$$
	\forall x\exists y(y\not\in x)
$$
This unobvious axiom has several implications.
First of all it does not tell you how to compute the element not in the set.
One of them being $x\not\in x$ for any set $x$.

__Exercise__. _Show $y\not\in x$ if and only if $y\cap\{x\}=\emptyset$_.

__Exercise__. _Show for every set $x$ we have $x\not\in x$_.

We have seen an example of an infinite ascending chain $x_0\in x_1 \in x_2\in \cdots$.
It is not possible to have in infinite descending chain $\cdot\in x_{-2}\in x_{-1} \in x_0$.

### Ordered Pair

Two ordered pairs $(a,b)$ and $(c,d)$ are equal if and only
if $a = c$ and $b = d$. We can't define $(a,b)$ by
the set $\{a,b\}$ since $\{a,b\} = \{b,a\}$ have
the same elements.

Kazimierz Kuratowski improved Norbert Wiener's definition of
an _ordered pair_ $(a,b)\in A\times B$ 
as the set $\{a,\{a,b\}\}$.

__Exercise__. _Show $\cap\{a,\{a,b\}\} = \{a\}$ and $\cup\{a,\{a,b\}\} = \{a,b\}$_.

_Hint_ For any set $A$, $\cap A$ is the intersection $\cap\{x\mid x\in A\}$;
$x$ belongs to $\cap A$ if and only if $x$ is a member of every element of $A$.
For any set $A$, $\cup A$ is the union $\cup\{x\mid x\in A\}$;
$x$ belongs to $\cup A$ if and only if $x$ is a member of some element of $A$.


### Product

The product of sets $A$ and $B$ is the set of ordered pairs of elements of A$
and $B$, $A\times B = \{(a,b)\mid a\in A, b\in B\}$.

The product of $A$, $B$, and $C$ is $A\times B\times C = (A\times B)\times C$.
This can be extended to any finite product of sets.



A simple solution to this is to only define subsets of an existing set
that satisfy a rule. For any set $S$ and a predicate $P$ on $S$ we can
stay out of trouble by defining $\{x\in S\mid P(x)\}$.  A _predicate_ is
a function from elements of a set that returns either true or false.

A _set_ is just a bag of things (elements) with no structure.
Two sets are _equal_ if they contain the same elements. Using epsilon and
first order logic this is written $A = B$ if and only if
$$
	(\forall a\in A\ a\in B)\wedge(\forall b\in B\ b\in A).
$$

If $A = B$ then they have the same number of elements.  A weaker notion
is two sets have the same _cardinality_ if they have the same number
of elements. If $A$ and $B$ are infinite this becomes a bit tricky to
define. The sets $A = \{1, 2, 3,\ldots\}$ and $B = \{2, 4, 6, \ldots\}$
are both infinite and clearly $B\subset A$ but $B\not=A$.
They have the same cardinality because we can associate $n\in A$
with $2n\in B$. The function $f\colon A\to B$ defined by
$f(n) = 2n$ is one-to-on and onto.

## Relation

A _relation_ on sets $A$ and $B$ is a subset of their product
$R\subseteq A\times B$.
We write $aRb$ for $(a,b)\in R$.
The _domain_ of $R$ is $\dom R = A$ and
the _codomain_ of $R$ is $\cod R = B$.
The _left coset_ of $b\in B$ is $Rb = \{a\in A: aRb\}\subseteq A$.
The _right coset_ of $a\in A$ is $aR = \{b\in B: aRb\}\subseteq B$.

Relations can be _composed_. If ${R\subset A\times B}$ and ${S\subset B\times C}$
then
$$
SR = \{(a,c)\mid aRb \text{\ and\ }bSc \text{\ for\ some\ } b\in B\}\subseteq A\times C.
$$
This is closely related to the definition of the SQL join of tables in a database.

The _transpose_ of a relation $R\subseteq A\times B$
is $R^T = \{(b,a)\mid (a,b)\in R\}\subseteq B\times A$.

__Exercise__. _Show $(SR)^T = R^T S^T$.

If $A = B$ we can define properties to characterize a relation $R\subseteq A\times A$.

### Equivalence

The notion of equality can be generalize to _equivalence_.

_reflexive_
    $aRa$, $a\in A$

_symmetric_
    $aRb$ implies $bRa$, $a,b\in A$

_transitive_
    $aRb$ and $bRc$ imply $aRc$, $a,b,c\in A$.

A relation with these three properties is an _equivalence_ relation.
If $R$ is an equivalence relations then $aR = Ra$, $a\in A$, and
for $a,b\in A$ either $aR = bR$ or $aR\cap bR = \emptyset$.

__Exercise__. _Show $aR = Ra$, $a\in A$, if $R$ is symmetric.

__Exercise__. _Show the cosets of an equivalence relation
form a partition of $A$_.

_Hint_: $\{A_i\}_{i\in I}$ is a partition of $A$
if $\cup_{i\in I} A_i = A$ and $A_i\cap A_j = \emptyset$
if $A_i\not= A_j$.

Equivalence relations express partial information.
Full information corresponds to the partition of singletons
$\{\{a\}\mid a\in A\}$. No information corresponds to
the singleton partition $\{A\}$.
Partial information is knowing which element of the partition $A_i$
that $a\in A$ is an element of.

## Function

A _function_ $f\colon A\to B$ is a relation with domain $A$
where every right coset is a singleton.
Since $af = \{b\}$ for all $a\in A$ and some $b\in B$
we can write $f(a) = b$ since $b$ is unique.

The _set exponential_ $B^A = \{f\colon A\to B\}$ is the set of all functions from $A$ to $B$.
We also write this as $\{A\to B\}$.

If we omit the condition the domain is $A$ we have
a _partial function_. Partial functions are more ubiquitous
than functions.
For example $f\colon\RR\to\RR$ where $f(x)=1/x$ is not
defined at $x = 0$.
Partial functions can be turned into a function by defining
$f(a) = b$ if $(a,b)\in f$ and $f(a) = \bot$ otherwise, where
$\bot$ is some element not in $B$.

__Exercise__. Show the codomain of the fixed up partial function is $B\cup\{\bot\}$_.

Function composition is relation composition. 

__Exercise__. _Show if $f\colon A\to B$ and $g\colon B\to C$ are functions then
$(gf)(a) = g(f(a))$_.

_Hint_: If $f(a) = b$ and $g(b) = c$ then the right coset $a(gf) = \{c\}$

### 1-1

A function $f\colon A\to B$ is 1-1, or _injective_, if $f(a) = f(a')$ implies
$a = a'$.

__Exercise__. _Show $f$ is injective if and only if there exists $g\colon B\to A$ with $gf = 1_A$_.

_Hint_: If $gf = 1_A$ and $f(a) = f(a')$ then $gf(a) = gf(a')$.

### Onto

A function $f\colon A\to B$ is onto, or _surjective_, if for every $b\in B$
there exists $a\in A$ with $f(a) = b$.

__Exercise__. _Show $f$ is surjective if and only if there exists $h\colon B\to A$ with $fh = 1_B$_.

_Hint_: If $fh = 1_B$ then $f(a) = b$ when $a = h(b)$.

### Bijective

A function that is 1-1 and onto is _bijective_. It is also called a 1-1 correspondence.

### Equivalent

The sets are _eqivalent_ if there is a bijection between them.

Show $A\cong B$ is an equivalence relation.

### Curry/Uncurry

$\{A\times B\}\to C\} \cong \{A\to\{B\to C\}\}$.


