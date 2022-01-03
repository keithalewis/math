Start with account containing $A$.

Buy $Γ_0$ shares at price $X_0$.

$A_0 = A - Γ_0 X_0$.

$V_0 = A_0 + Γ_0 X_0 = A - Γ_0 X_0 + Γ_0 X_0 = A$.

$A_1 = A_0 - Γ_1 X_1 =  A - Γ_0 X_0 - Γ_1 X_1$.

$$
\begin{aligned}
V_1 &= A_1 + (Γ_0 + Γ_1)X_1 \\
	&= A - Γ_0 X_0 - Γ_1 X_1 + (Γ_0 + Γ_1)X_1 \\
	&= A + Γ_0(X_1 - X_0) \\
\end{aligned}
$$

$A_2 = A_1 - Γ_2 X_2 = A - Γ_0 X_0 - Γ_1 X_1 - Γ_2 X_2$

\begin{aligned}
V_2 &= A_2 + (Γ_0 + Γ_1 + Γ_2)X_2 \\
	&= A - Γ_0 X_0 - Γ_1 X_1 - Γ_2 X_2 + (Γ_0 + Γ_1 + Γ_2)X_2 \\
	&= A + Γ_0(X_2 - X_0) + Γ_1(X_2 - X_1) \\
\end{aligned}
$$

$A_n = A - \sum_{j=0}^n Γ_j X_j$.

$V_n = A + \sum_{j=0}^{n-1} Γ_j(X_n - X_j)$.

$0 = \sum_^n Γ_j$, 
$$
\begin{aligned}
A_n &= A - \sum_{j=0}^{n-1} Γ_j X_j + (\sum_{j=0}^{n-1} Γ_j) X_n \\
	&= A + \sum_{j=0}^{n-1} (X_n - X_j) \\
\end{aligned}
$$
