---
title: Database
author: Keith A. Lewis
institute: KALX, LLC
classoption: fleqn
fleqn: true
abstract: The mathematical foundations of databases.
...

A _relational database_ $R$ is a subset of a cartesian product of _columns_ $(T_j)_{j\in J}$:
$R\subseteq \Pi_{j\in J} T_j = T_J$.
Databases contain _rows_ $r_i\in T_J$ where $R = \{r_i\}$.

If $I\subseteq J$ the _projection_ $\pi_I\colon T_J\to T_I$
selects the subset of columns belonging to the index set $I$.
We write $r_I = \pi_I(r)$ for $r\in R$ and $R_I = \{r_I:r\in R\}$
for the _projection_ of $R$ on $I$. This is called SELECT in SQL.

A predicate on a set $S$ is a subset $P\subseteq S$. The _restriction_
of a database given a predicate $P\subseteq T_J$ is
the set $\{r\in R:r\in P\}$. One way to specify subsets of
$T_J$ is by equations or inequalities involving involving
row values $r = (t_j)_{j\in J} \in T_J$.
This is called WHERE in SQL.

The _join_ of two database consists of a cartesian product, a restriction,
and a projection. The join of $R\subseteq T_J$ and $R'\subseteq T'_{J'}$
on $I\subseteq J$ and $I'\subseteq J'$
starts with the cartesian product $R\times R'$. This is restricted
to rows $(r,r')$ satisfying $r_I = r'_{I'}$. The result is
projected on columns $J\cup (J'\setminus I')$ (or $(J\setminus I)\cup J'$)
to remove redundant data. This is called JOIN in SQL.

If $R,R'\subseteq T_J$ are databases then $R\cup R'$ is also a database.
This is called UNION in SQL.

The rows of a database are a set. In mathematics the order of set
elements does not matter.
The order in which rows are presented to a user as a result of a query does matter.
If a column has an ordering it can be used to sort the data returned by a query.
This is called ORDER BY in SQL.

Columns can, and often do, contain duplicate values. The unique values
of a column can be used to partition the results of a query. All rows
having the same column value can be grouped by unique values. This
is called GROUP BY in SQL.

To maintain the mathematical illusion that database rows are merely a set,
software implmentations resort to _indicies_ to improve performance. For
example, if one of the columns is a time value then the data can be
scanned to compute a permutation of the physical row postion that
preserves the time ordering.
