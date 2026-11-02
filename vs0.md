This is a great example of where generalizing R^n to an abstract vector space removes irrelevant details.
Row and column vectors do not generalize to higher dimensional tensors.

If T:V -> W is a linear operator then its kernel is  ker T = {v in V | Tv = 0}  
and its range is  ran T = {Tv | v in V}.

There are linear operators V -> V/ker T -> ran T -> W.
The first in onto, the second is one-to-one and onto, and the third is one-to-one.
In Bourbaki speak, the are surjective, bijective, and injective, respectively.

The second linear operator is the key to understanding pseudo inverses.

Abstract vector spaces specify a scalar multiplication and vector addition that is commutative and associative:
v + w = w + v and (v + w) + u = v + (w + u). And some other rules people don't pay attention to.

A subspace of V is any subset U contained in V that is closed under scalar multiplication and vector addition:
R U is a subset of U where R U = {a u | a in R and u in U}
and U + U = {u + u' | u, u' in U}.


