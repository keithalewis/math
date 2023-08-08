---
title: Totally Ordered Streams
author: Keith A. Lewis
institution: KALX, LLC
email: kal@kalx.net
classoption: fleqn
fleqn: true
abstract: Totally ordered streams.
...

\newcommand\RR{\bm{R}}
\newcommand\NN{\bm{N}}
\newcommand\BB{\bm{\text{bool}}}
\newcommand{\Var}{\operatorname{Var}}
\newcommand{\given}{\mid}
\newcommand{\skip}{\operatorname{skip}}
\newcommand{\first}{\operatorname{first}}



Let $\langle T,\le\rangle$ be a totally ordered set.

If $S$ is a finite subset of a totally ordered set $T$
let $\wedge S = \min\{s\in S\}$ and $\vee S = \max\{s\in S\}$.
Define
$$
\begin{aligned}
	*S &= \wedge S \\
	+S &= S\setminus\{*S\} \\
	?S &= S \not= \emptyset \\
\end{aligned}
$$

If $f\colon T\to U$ define $f(S)$ by
$$
\begin{aligned}
	*f(S) &= f(*S) \\
	+f(S) &= f(+S) \\ 
	?S &= f(S) \not= \emptyset \\
\end{aligned}
$$

__Exercise__. _Show $f(S) =\emptyset$ if and only if $S =\emptyset$_.

## Filter

Given a predicate $P$ on $S$ define $S\mid P$ by
$*(S\mid P) = *S$ if $P(*S)$ and $*(S\mid P) = *(+S\mid P)$ otherwise.
We call this $S$ _given_ $P$, or $S$ _filter_ $P$.

__Exercise__ _Show $s\in (S\mid P)$ if and only if $s\in S$ and $P(s)$_.

If $R$ is a relation on $T$ define $SRt$ by the predicate $P(s) = sRt$.

__Exercise__. _Show, e.g., $S<t = S\cap\{s\in S\mid s < t\}$_.

## Disjoint Union

If $\{S_j\}_{0\le j < n}$ are finite subsets of $T$ then
$\sqcup_j S_j = \cup_j S_j\times\{j\}$.
The lexicographical order $(s,i) < (t,j)$ by $s < t$ or
$s = t$ and $i < j$ is a total order.

```
template<class.. Is>
struct sqcup {
	std::tuple<Is...> is;
	sqcup((Is... is)
		: is(is)
	{}
	// std::apply([](auto ...x){std::make_tuple(some_function(x)...);} , the_tuple);
	operator bool() const
	{
		return std::apply([](auto&&... i) {
			i.operator bool() or ...}	
		}, is);
	}
	auto operator*() const
	{
		std::min(i.operator*());
	}
	sqcup& operator++()
	{
		const auto _i = operator*();
		++std::get<_i.second>(is);
		
		return *this;
	}
};
```

If $\{S_j\}_{0\le j < n}$ are finite subsets of $T$ define $,S_j$ by
$*(,S_j) = *(\sqcup_j S_j) = (s, k)$ and
$$
	+(,S_j) = \sqcup_j (S_j > s')).
$$
where $s' =  *S_{\mod(k+1,n)}$.

## Mask

If $Q$ is a boolean valued iterable we use the same notation for the iterable $S\mid Q$.
Define $*(S\mid Q) = *S$ if $*Q$ and $*(S\mid Q) = *(+S\mid +Q)$ otherwise.
Define $+(S\mid Q) = (+S\mid +Q)$ if $*+Q$ and $+(S\mid Q) = (++S\mid ++Q)$ otherwise.
We call this $S$ _mask_ $Q$.

__Exercise__ _Show $s\in (S\mid Q)$ if and only if and $s = *+^nS$ and $*+^nQ$ for some $n$_.

## Function

If $f\colon T\to U$ is a function and $S$ is a finite subeset of $T$ define 
$fRS\colon T\to U$ by $fRS(t) = f(*SRt)$.

$S = eow$ $f(eow)

## Relation

If $R$ is a relation on $T\supseteq S$ and $t\in T$ we write $SRt$ for $S\mid P$
where $P(s) = sRt$, i.e., $(s,t)\in R$. 


Recall the _disjoint union_ $S_0\sqcup S_1 = \{(i,s)\mid i\in 2, s\in S_i\}$
where $2 = \{0,1\}$. Define the lexicographical ordering $(i,s)\le(j, t)$ if
$i\le j$ or $i = j$ and $s\le t$.

Let $S_0,S_1 = 2\times S_0\sqcup S_1 = \{(i,(j,s))\mid i\in 2, j\in 2, s\in S_j\}$

Let $I$ be an ordered index set and $S_i\subseteq T$.

$I\times \sqcup_{\in I} S_i$

$*(j, \sqcup_i S_i) = *S_j$

$+(j, \sqcup_i S_i)$

Let $\{0,1\}\times S_0\sqcup S_1 = \{0,1\} \times \{0\}\times S_0\cup \{1\}\times S_1$

__Exercise__. _If $(X_t)$ is right continuouse and $T^a = \min\{t\mid X_t \ge a\}$
then $1_{T\ge t}$ is left continuous_.

```
	template<class A = double, class I = USD>
	struct Amount {
		A amount;
		I instrument;
	};
	struct Price : public Amount {};
	struct CashFlow : public Amount {};

	struct Market Model {
		iterable<Time, Price, CashFlow> from(date);
		Price price(date);
		CashFlow cashFlow(date);
		Information information(date);
	};

	auto s = iterable({1,2,3});
	cout << s; // [1,2,3]
	auto t = s|s > 1; // = s|(s > 1)
	cout << t; // [2,3]
	cout << t + s; // [3,5,NaN] - keep info

	// stop loss start gain
	begining_of_week bow(start);
	end_of_week eow(start);
	market_close close(start);

	auto t = eow ^ bow ^ close || eow; // = eow ^ bow ^ (close || eow)
	auto s = X[t]; // X market price at t
	while (const auto& o : s) { // o is variant for the disjoint union
		switch (v.index()) {
			case 0: // eow
		}
	}

	auto lwc = X[end_of_week]
```
