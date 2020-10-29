% Database
% abstract: Databases from a mathematical perspective.

A _database_ is a subset of a cartesian product of columns $R\subseteq \Pi_{j\in J}
T_j = T_J$ where the $T_j$.
 The contents of the database are _rows_ $r_i\in T_J$ with
$R = \{r_i\}$.  If $I\subseteq J$ the _projection_ $\pi_I\colon T_J\to
T_I$ selects the subset of column types belonging to the index set $I$.
We write $r_I = \pi_I(r)$ and $R_I = \{r_I:r\in R\}$ for the _projection_
of $R$ on $I$.

A predicate on a set $S$ is a subset $P\subseteq S$. The _restriction_
of a database given a predicate $P\subseteq T_J$ is
the set $\{r\in R:r\in P\}$.

The _join_ of two database consists of a cartesian product, a restriction,
and a projection. The join of $R\subseteq T_J$ and $R'\subseteq T'_{J'}$
on $I\subseteq J$ and $I'\subseteq J'$
starts with the cartesian product $R\times R'$. This is restricted
to rows $(r,r')$ satisfying $r_I = r'_{I'}$. The result is
projected on $J\cup (J'\setminus I')$ (or $(J\setminus I)\cup J'$)
to remove redundant data.
