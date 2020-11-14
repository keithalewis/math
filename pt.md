---
title: Pivot Table
author: Keith A. Lewis
institute: KALX, LLC
classoption: fleqn
fleqn: true
abstract: The mathematical foundations of pivot tables.
...

Pivot tables summarize multidimensional data values using measures.
Pivot table data is a function $t\colon D\to V$ where $D$
are the _dimensions_ and $V$ are the _values_.
If $\Delta$ is a collection of subsets of $D$ and $\mu$ is a
function from subsets of $V$ to $V$ we can define pivot table data
$t_{\Delta,\mu}\colon\Delta\to V$ by $t_{\Delta,\mu}(\delta)
= \mu(t(\delta))$ for $\delta\in\Delta$ where $t(\delta) =
\{t(d):d\in\delta\}\subseteq V$.  Any function $u\colon D'\to D$ can be
be composed with $t$ to get pivot table data $t\circ u\colon D'\to V$.

For example, if $D$ are dates and $V$ are prices then we can aggregate
maximum or minimum prices over days, weeks, or months.  If $D'\subseteq D$
are the market open times then the inclusion function gives the open prices.

Pivot tables become more useful when dimensions and values have
more structure.

## Partition

A _partition_ $\Delta$ of a dimension $D$ is a collection of subsets of $D$
satisfying $D = \cup \Delta$ (for every $a\in D$ there exists $A\in\Delta$
with $a\in A$) and for $A,B\in\Delta$ either $A\cap B = \emptyset$ or
$A = B$.  The elements of a partition are called _atoms_. If $\Delta =
\{\delta_1,\ldots,\delta_n\}$ is finite then it is a partition of $D$ if
and only if $\cup_j \detla_j = D$ and $\delta_j\cap\delta_k = \emptyset$
if $j\not= k$.

<!--
The relation $a\sim b$ defined by $a$ and $b$ belong to the same atom
is an _equivalence relation_.

__Exercise__. _Show $a\sim a$, $a\sim b$ implies $b\sim a$, and
$a\sim b$, $b\sim c$ imply $a\sim c$_ for $a,b,c\in D$.

__Exercise__. _Show every equivalence relation determines a partition_.

Hint. The atoms are $\{b\in D:b\sim a\}$ for $a\in D$.
-->

A function $t\colon D\to V$ is _measurable_ with respect to the partition $\Delta$
if it is constant on atoms of $\Delta$. In this case
$t|_\Delta\colon\Delta\to V$ is a function on the atoms since $t|_\Delta(\delta) = t(d)$
for any $d\in\delta\in\Delta$.

A partition $\Delta'$ is a _refinement_ of the partition $\Delta$ if every atom of $\Delta$ is a
union of atoms of $\Delta'$. We say $\Delta'$ is _finer_ than $\Delta$
and $\Delta$ is _coarser_ than $\Delta'$.
The set of atoms of $\Delta'$ contained in $D\in\Delta$ is denoted $\Delta'|D$.

__Exercise__. _Show the the coarsest partition of a set $D$ is the single set $\{D\}$
and finest partion of $D$ is the collection of singletons $\{\{D\}\} = \{\{d\}:d\in D\}$_.

Note $D$ is in
one-to-one correspondence with $\{\{D\}\}$ by $d\leftrightarrow\{d\}$
for $d\in D$. Any function $t\colon D\to V$ corresponds to a function
$t\colon\{\{D\}\}\to V$ where $\{\d\}\}\mapsto t(d)$, $d\in D$.
Above we called this function $t|_{\{\D\}\}$. Every function from $t\colon D\to V$
is $\{\{D\}\} measurable.

<!--
An _algebra_ $\mathcal{A}$ of sets on $D$ is a subset of the powerset of $D$ that contains
the $\emptyset$ and is
closed under union and _complement_ in $D$. The complement of $C\subseteq D$
in $D$ is $C' = D\setminus C = \{x\in D : x\not\in C\}$.
Clearly $D\in\mathcal{A}$ since $D = \emptyset' = D\setminus\emptyset$.

__Exercise__. _Show every algebra is also closed under intersection_.

Hint: De Morgan.

If $\mathcal{A}$ is an algebra on $D$ and $C\in\mathcal{A}$ 
let $\mathcal{A}|C = \{B\in\mathcal{A} : B\subseteq C\}$.
We call this $\mathcal{A}$ restricted to $C$.

__Exercise__. _Show $\mathcal{A}|C = \{B\cap C:B\in\mathcal{A}\}$_.

__Exercise__. _Show $\mathcal{A}|C$ is an algebra on $C$_.

A set $A\in\mathcal{A}$ is an _atom_ if $B\in\mathcal{A}$ and $B\subseteq A$
imply either $B = \emptyset$ or $B = A$.

__Exercise__. _If $\mathcal{A}$ is and algebra on $D$ with a finite number of elements
show the atoms of $\mathcal{A}$ are a partition of $D$_.
-->

## Measure

A _measure_ on a set $S$ is a set function
$\mu\colon\mathcal{P}(S)\to\mathbf{R}$ with $\mu(\emptyset) = 0$ and
$\mu(E\cup F) = \mu(E) + \mu(F)$ whenever $E\cap F=\emptyset$.
We use the notation $\mathcal{P}(V) = \{E\subseteq S\}$ for the collection of all
subsets and call it the _power set_ of $S$.

__Exercise__. _Show if $\mu$ is a measure on $S$ then $\mu(E\cup F) = \mu(E) + \mu(F) - \mu(E\cap F)$
for any subsets $E,F\subseteq S$_.

Hint: $E$ is the disjoint union of $E\setminus F$ and $E\cap F$.
$E\cup F$ is the disjoint union of $E\setminus F$, $E\cap F$, and $F\setminus E$.

Measures don't count things twice.
The canonical example of a measure is counting the number of elements in a set.



If $\mu'$ is a measure on $\Delta'$ that is a refinement of $\Delta$ then
we can define a measure $\mu'|_\Delta$ on $\Delta$ by
$(\mu'|_\Delta)(\delta) = \mu'(\Delta'|\delta)$ for $\delta\in\Delta$.

__Exercise__. _If $\mu'$ is a measure on a partion $\Delta'$ 
show $\mu'|_\Delta$ is a measure on any coarser partition $\Delta$_.

<details>
<summary>Solution</summary>

> With $\mu = \mu'|_\Delta$, we must show $\mu(\emptyset) = 0$ and $\mu(E\cup F) = \mu(E)\oplus\mu(F)$
when $E\cap F = \emptyset$ for $E,F\in\Delta$. Since $\Delta'|\emptyset = \emptyset$
we have $\mu(\emptyset) = \mu'(\emptyset) = 0$. If $E,F\in\Delta$ are disjoint then
so are $\Delta'|E$ and $\Delta'|F$ hence $\mu(E\cup F) = \mu'(\Delta'|(E\cup F))
= \mu'((\Delta'|E)\cup(\Delta'|F)) = \mu'(\Delta'|E)\oplus\mu'(\Delta'|F)) = \mu(E)\oplus\mu(F)$.

</details>

If $t''\colon\Delta''\to V$
and $\Delta''$ is finer than $\Delta'$ and $\Delta'$ is finer then $\Delta$
then $t''|_\Delta = (t''|\Delta')|_\Delta$.

We can generalize measures by replacing $\mathbf{R}$ with any abelian monoid $V$.
Since $\mathbf{R}$ is an abelian group under addition with identity $0$ it is an
abelian monoid. A _monoid_ is a group that is not required to have inverses.
We require $\mu(\emptyset)$ to be the identity of the monoid
and $\mu(E\cup F) = \mu(E) \oplus \mu(F)$ whenever $E\cap F = \emptyset$ where
$\oplus$ is the binary operation of the monoid.

The set $[-\infty,\infty)$ with binary operation $x\vee y = \max\{x,y\}$ is an abelian monoid
with identity $-\infty$.

__Exercise__. _Show $x\vee(y\vee z) = (x\vee y)\vee z$ (associative), $x\vee y = y\vee x$ (commutative),
and $x\vee -\infty = x$ (identity) for $x,y,z\in [-\infty,\infty)$_.

Similarly, $(-\infty,\infty]$ with $x\wedge y = \min\{x,y\}$ and identity $\infty$ is an abelian monoid.

If $S$ is finite every measure is determined by $\{\mu(\{s\}): s\in S\}$.

__Exercise__. _If $S$ is finite show $\mu(\{s_1,\ldots,s_n\})
= \mu(\{s_1\})\oplus\cdots\oplus\mu(\{s_n\})$ where $s_j\in S$, $1\le j\le n$_.

<details>
<summary>Solution</summary>

> This follows from $V$ being an abelian monoid. By associativity
$\mu(\{s_1\})\oplus\cdots\oplus\mu(\{s_n\})$ is well-defined.
Any permutation of $(s_j)$ in the left-hand side set results in the same set.
Commutativity shows the right hand side is unchanged by any permutation.

</details>


## Cartesian Product

Pivot tables become more interesting when $D$ and $V$ are cartesian products.

<!--

__Exercise__. _If $(d,v)$ and $(d,v')$ belong to the graph of a function then $v = v'$_.

Any subset of $D\times V$ with this property is a _partial function_. If the subset
also has the property that for every $d\in D$ there is some $v\in V$ with $(d,v)$ in the 
subset then it determines a function.


Given $f\colon D\to V$ define the _push forward_
$f^*\colon\mathcal{P}(D)\to\mathcal{P}(V)$ by
$f^*(A) = \{f(a):a\in A\}\subseteq V$ for $A\subseteq D$
If $\alpha\colon V\times V\to V$ is any binary function that is
commutative and associative with identity element $\iota\in V$ then
the aggregator $\bar{\alpha}\colon\mathcal{P}(V)\to V$ can be defined
by $\bar{\alpha}(\emptyset) = \iota$ and $\bar{\alpha}(\{u\}\cup U) =
\alpha(u, \bar{\alpha}(U))$ for $u\in V$ and $U\subseteq V$.

__Exercise__. _Show $\hat{\alpha}(\{u\}) = u$ for $u\in V$_.

<details>
<summary>Solution</summary>

> By the definition of $\hat{\alpha}$ and $\iota$ being the identity element
$\hat{\alpha}(\{u\}) = \hat{\alpha}(\{u\}\cup\emptyset)
= \alpha(u, \hat{\alpha}(\emptyset)) = \alpha(u, \iota) = u$.
</details>

__Exercise__. _Show $\hat{\alpha}(\{u_1,\ldots,u_n\})$
= $\hat{\alpha}(\{u_{\sigma(1)},\ldots,u_{\sigma(n)}\})$
if $\sigma$ is a permutation of $\{1,\ldots,n\}$_.

<details>
<summary>Solution</summary>

> We prove this by induction on $n$. The previous exercise shows this
it true if $n = 1$. Assume the statement is true for $n$. We have
$$
\begin{aligned}
	\hat{\alpha}(\{u_1,\ldots, u_{n+1}\}) &= \alpha(u_1, \hat{\alpha}(\{u_2,\ldots,u_{n+1}\})) \\
	&= ... \\
\end{aligned}
$$
</details>

## Cube

A _cube_ on $D$ taking values in $V$ is a function belonging to $V^\Delta$
where $\Delta$ is a partion of $D$.  Any function in $V^D$ determines
a cube in $V^{\{\{D\}\}$ and vice verse.

If $f\colon\Delta\to V$ is a cube and $\alpha$ is an
aggregator on subsets of $V$ to $W$ then $\alpha\circ f^*\colon\Delta\to W$
is a cube on $D$ taking values in $W$.

Functions in $V^D$ are called _cubes_. This makes more sense if
$D=D_1\times\cdots D_n$ and $V=V_1\times\cdots V_m$ are cartesian
products. The _graph_ of $f$ is the set $\{(d,f(d)):d\in D\}\subseteq
D\times V$.

A _cube transformation_ is a function $\tau\colon V^\Delta'\to W^\Delta$ where
$\Delta'$ is a refinement of $\Delta$ and $V$, $W$ are values.


Cubes together with aggregators are _pivot tables_.

__Exercise__. _If $f\colon\Delta\to V$ is a cube and $\Delta'$ coarser than $\Delta$
show $\alpha\circ f^*
-->

## Notes

Fix $D$, $V$, $\mu$, and $t\colon D\to V$. Let $\{\tau\colon Delta\to V: \Delta/D\}$ be
the objects of a category. There is an arrow $\tau'\to\tau$ if $\Delta'$ is a refinement
of $\Delta$ and $\tau(\delta) = \mu(t(\Delta'|\delta))$ for $\delta\in\Delta$.
We say $\tau = \tau'|_\Delta$ if this holds.

The object $\{\{t\}\}\colon\{\{D\}\}\to V$ is $\{\{t\}\}(\{d\}) = t(d)$ for $d\in D$.
It is the _initial object_ of the category.

__Exercise__. _Show $\tau(\delta) = \mu(t(\delta))$_.

__Exercise__. _Arrows are unique_.


Since $\mu(t(\Delta|\delta)) = \mu(t(\delta)) = \tau(\delta)$ the identity function
$\tau\to\tau$ is an arrow.

The composition of $\tau'$ and $\tau$, $\tau\tau'\colon\Delta\to V$,
is defined by $\tau\tau'(\delta) = 

__Exercise__. _Show the identity function is an identity of the category_.
