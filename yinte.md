---
title: Grassmann Algebra
---

Your calculation is correct. Let me show you a simplifying technique.

For example $D = O + 100(X - O) + r(Y - O) = (1 -  100 - r)O + 100 X + r Y = d O + 100 X + r Y$,
where $d = 1 - 100 = r$.

$D$ is on the line determined by $A = a O + 90 X$ and $B = b O + 110 X + 10 Y$ if and only if $A B D = 0$.
We have 
$$
\begin{aligned}
AB &= (a O + 90 X)(b O + 110 X + 10 Y) \\
AB &= a O(b O + 110 X + 10 Y) + 90 X(b O + 110 X + 10 Y) \\
   &= 110a O X + 10a O Y + 90b X O + 900 X Y \\
\end{aligned}
$$
and
$$
\begin{aligned}
A B D &= (110 \_O X + 10 \_O Y + 90 X\_O + 900 X Y)D \\
      &= (110 \_O X + 10 \_O Y + 90 X\_O + 900 X Y)(\_O + 100 X + r Y) \\
	  &= 110 r \_O X Y + 1000 \_O Y X + 900 X Y \_O \\
	  &= (100 r - 1000 + 900)\_O X Y \\
\end{aligned}
$$
