---
title: Grassman Algebra
---
\newcommand\RR{\bs{R}}
\newcommand\GG{\mathcal{G}}

Let $\RR$ be the real numbers and $E$ be Euclidean space. 

If $a\in\RR$ and $P\in E$ then $a\in\GG(E)$ and $P\in\GG(E)$

If $a\in\RR$ and $P\in E$ then $a + P = P + a\in\GG(E)$ and $aP = Pa\in\GG(E)$.

If $A,B\in\GG(E)$ then $A + B = B + A\in\GG(E)$ and $AB\in\GG(E)$.

If $A,B,C\in\GG(E)$ then $A + (B + C) = (A + B) + C$ and $A(BC) = (AB)C$.

If $A,B,C\in\GG(E)$ then $A(B + C) = AB + AC$ and $(A + B)C = AC + BC$.

If $A\in\GG(E)$ then $0A = 0$ and $1A = A$.

Define $-A = (-1)A$.

If $P,Q\in E$ then $PQ = 0$ if and only if $P = Q$.

__Lemma__. _If $P,Q\in E$ then $PQ = -QP$.

## Application

Given $P,Q,R,S\in E$ when is $PQ = RS$? If $PQ = 0$ then $P=Q$ and $RS = 0$ so $R = S$.
Since $PQR = 0$

If $A,B\in\GG(E)$ and $A = tB$ for some nonzero $t\in\RR$ we say $A$ and $B$ are _congruent_
and write $t = A/B$.

A _blade of order $k$_ is a product $P_0\cdots P_k$ where $P_j\in E$, $0\le j\le k$.

__Lemma__. _If $P_0\cdots P_k\not=0$ and $PP_0\cdots P_k = 0$ then_
$$
	P = \sum_{j=0}^k P_0\cdots P_{j-1} P P_{j+1} \cdots Pk/P_0\cdots P_k
$$

If $P = \sum_{j=0}^k t_j P_j$ then $P_0\cdots P_{j-1} P P_{j+1} = t_j\Pi$
so $t = P^j/\Pi$.

## Examples

Given $A,B,C\in E$ then $A(B + C)(A + B + C) = 0$.
