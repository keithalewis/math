% Cubes

A _database_ is a _relation_ $R\subseteq \Pi_{j\in J} T_j = T_J$ where
the $T_j$ are sets called the _column types_ of the database. The contents of the
database are _rows_ $r_i\in T_J$ with $R = \{r_i\}$.
If $I\subseteq J$ the _projection_ $\pi_I\colon T_J\to T_I$
selects the subset of column types belonging to the index set $I$.
We write $r_I$ for $\pi_I(r)$ and $R_I = \{r_I:r\in R\}$ for the
_projection_ of $R$ on $I$.

A predicate on a set $S$ is a subset $P\subseteq S$. The _restriction_
of a database given a predicate $P\subseteq T_J$ is
the set $\{r\in R:r\in P\}$.

The _join_ of two database consists of a cartesian product, a restriction,
and a projection. The join of $R\subseteq T_J$ and $R'\subseteq T'_{J'}$
on $I\subseteq J$ and $I'\subseteq J'$
starts with the cartesian product $R\times R'$. This is restricted
to rows $(r,r') satisfying $r_I = r'_{I'}$. The result is
projected on $J\cup (J'\setminus I')$ (or $(J\setminus I)\cup J')
to remove duplicates.

_Dimensions_ $D$ and _values_ $V$ are sets.
The set $V^D = \{f\colon D\to V\}$ is the set of all functions from $D$ to $V$.
Given $f\colon D\to V$ define the _push forward_
$f^*\colon\mathcal{P}(D)\to\mathcal{P}(V)$ by
$f^*(A) = \{f(a):a\in A\}\subseteq V$ for $A\subseteq D$
where $\mathcal{P}(V)$ is the collection of all subsets of $V$.
This is called the _power set_ of $V$.

__Exercise__. _If $2 = \{0,1\}$ show $\mathcal{P}(V)$ is in one-to-one correspondence with $2^V$_.

Hint: Given $U\subseteq V$ define $u\in 2^V$ by $u = 1_U$, the _indicator function_ of $U$ where
$1_U(v) = 1$ if $v\in U$ and $1_U(v) = 0$ if $v\not\in U$ for $v\in V$.

An _aggregator_ is a function $\alpha\colon\mathcal{P}(V)\to W$ where
$V$ and $W$ are values. The composition $\alpha\circ f^*$ is a function
from $\mathcal{P}(D)$ to $W$.

The aggregator _count_ takes a set to its cardinality.
If $V$ is an abelian group the aggregator _sum_ adds all elements of any subset.
If $V$ has an ordering then _max_ and _min_ are aggregators.

A _partition_ $\Delta$ of a set $D$ is a collection of subsets of $D$ satisfying
$D = \cup \Delta$ (for every $a\in D$ there exists $A\in\Delta$ with $a\in A$)
and for $A,B\in\Delta$ either $A\cap B = \emptyset$ or $A = B$.
The elements of a partition are called _atoms_.

The relation $a\sim b$ defined by both $a$ and $b$ belong to the same atom
is an _equivalence relation_.

__Exercise__. _Show $a\sim a$, $a\sim b$ implies $b\sim a$, and
$a\sim b$, $b\sim c$ imply $a\sim c$_.

__Exercise__. _Show every equivalence relation determines a partition_.

Hint. The atoms are $\{b\in D:b\sim a\}$ for $a\in D$.

Since paritions are sets they can also be dimensions. 

It is custumary to define a _measure_ $\Delta$ on a dimension $D$ to be a partition of $D$.
This word collides with another mathematical term for set functions satisfying certain
properties. We will use partition instead of measure in what follows.

A partition $\Delta'$ is a _refinement_ of the partition $\Delta$ if every atom of $\Delta$ is a
union of atoms of $\Delta'$. We say $\Delta'$ is _finer_ than $\Delta$
and $\Delta$ is _coarser_ than $\Delta'$.

__Exercise__. _Show the finest partion of a set $D$ is the collection of singletons
$\{\{d\}:d\in D\}$ and the coarsest partition of $D$ is the single set $\{D\}$_.

We denote these by $\{\{D\}\}$ and $\{D\}$ respectively.

__Exercise__. _Show $V^D$ is in one-to-one correspondence with $V^{\{\{D\}\}}$_.

__Exercise__. _If $(d,v)$ and $(d,v')$ belong to the graph of a function then $v = v'$_.

Any subset of $D\times V$ with this property is a _partial function_. If the subset
has the property that for every $d\in D$ there is some $v\in V$ with $(d,v)$ in the 
subset then it determines a function.

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
