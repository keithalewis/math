---
title: Determinants Made Easy
author: Keith A. Lewis
institution: KALX, LLC
email: kal@kalx.net
classoption: fleqn
abstract: Hermann Grassmann showed us how.
...

<!--
\newcommand\det{\operatorname{det}}
-->

What is the determinant of a square matrix $A = [a_{ij}]$?  Let $(P_i)$
be _points_ in Euclidean space.  Hermann Grassmann came up with Die
Lineale Ausdehnungslehre that posited $P_i P_j = -P_j P_i$. If $i = j$
then $P_i P_i = -P_i P_i$ so $2P_i P_i = 0$ and $P_i^2 = 0$.

If $P_j = \sum_i a_{ij}P_i$ then $\prod_i\sum_j a_{ij} P_i = (\det A)\prod_i P_i$.

For two-dimensional matrices
$$
\begin{aligned}
(a_{11}P_1 + a_{12}P_2)(a_{21}P_1 + a_{22}P_2)
&= a_{11}P_1 a_{21}P_1 + a_{11}P_1 a_{22} P_2
+ a_{12}P_2 a_{21}P_1 + a_{21}P_2 a_{22} P_2\\
&= a_{11} a_{21}P_1 P_1 + a_{11}a_{22} P_1 P_2
+ a_{12} a_{21}P_2 P_1 + a_{21} a_{22} P_2 P_2\\
&= a_{11}a_{22} P_1 P_2 + a_{12} a_{21}P_2 P_1\\
&= a_{11}a_{22} P_1 P_2 - a_{12} a_{21}P_1 P_2\\
&= (a_{11}a_{22} - a_{12} a_{21})P_1 P_2\\
\end{aligned}
$$
so $\det[a_{ij}] = a_{11}a_{22} - a_{12}a_{22}$ in 2 dimensions.

The same technique holds in any number of dimensions for computing determinants.
Back in Hermann's day people were still grappling with how to extend Euclidiean geometry
into higher dimensions. 
