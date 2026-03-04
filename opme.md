---
title: One Period Entropy Model
author: Keith A. Lewis
institution: KALX, LLC
email: kal@kalx.net
classoption: fleqn
---
\newcommand\RR{\boldsymbol{R}}
\newcommand\ZZ{\boldsymbol{Z}}
\newcommand\ran{\operatorname{ran}}
\newcommand\Var{\operatorname{Var}}
\newcommand\Cov{\operatorname{Cov}}
\newcommand\co{\operatorname{co}}
\newcommand\sgn{\operatorname{sgn}}
\newcommand\cone{\operatorname{cone}}
\newcommand\BB{\mathcal{B}}
\newcommand\GG{\mathcal{G}}

$x = (1, v, s)$, $X(\omega) = (R, (\omega - K)^+, \omega)$, $\omega\in\Omega$.

$\min_{p,\lambda} (1 - \sum_i p_i^2)/2 - \lambda\cdot(x - \sum_i X(\omega_i) p_i$

$d/dp_j$, $0 = -p_j + \lambda\cdot X(\omega_j)$.

$p_j = \lambda\cdot X(\omega_j)$

$x = \sum_i X(\omega_i))\lambda\cdot X(\omega_j) = (\sum_i X(\omega_i)X(\omega_i)^T)\lambda$

$\lambda =  (\sum_i X(\omega_i)X(\omega_i)^T)^{-1}x$.

$x = (1, v, s)$, $X(\omega) = (R, (\omega - K)^+, \omega)$, $\omega\in\{L,K,H\}$.

$X(L) = (R, 0, L)$, $X(K) = (R, 0, K)$, $X(H) = (R, H-K, H)$

$$
\begin{bmatrix}
R^2 & 0 & RL \\
0   & 0 & 0 \\
LR  & 0 & L^2 \\
\end{bmatrix}
+
\begin{bmatrix}
R^2 & 0 & RK \\
0   & 0 & 0 \\
KR  & 0 & K^2 \\
\end{bmatrix}
+
\begin{bmatrix}
R^2    & R(H-K)  & RH \\
R(H-K) & (H-K)^2 & (H-K)H \\
HR     & (H-K)H  & H^2 \\
\end{bmatrix}
$$

$$
\begin{bmatrix}
3R^2     & R(H-K)  & R(L + K + H) \\
R(H-K)   & (H-K)^2 & (H-K)H \\
R(L+K+H) & (H-K)H  & L^2 + K^2 + H^2 \\
\end{bmatrix}
$$

𝐴 − 1 = [ 𝐿 2 + 𝐾 2 / 𝑅 2 ( 𝐿 − 𝐾) 2 & − 𝐿 2 + 𝐾 2 − 𝐻 ( 𝐿 + 𝐾) 𝑅 ( 𝐻 − 𝐾) (
𝐿
−
𝐾
)
2
−
𝐿
+
𝐾
𝑅
(
𝐿
−
𝐾
)
2
 
\[
10
𝑝
𝑡
]
−
𝐿
2
+
𝐾
2
−
𝐻
(
𝐿
+
𝐾
)
𝑅
(
𝐻
−
𝐾
)
(
𝐿
−
𝐾
)
2
2
(
𝐿
2
+
𝐾
2
+
𝐻
2
−
𝐿
𝐾
−
𝐿
𝐻
−
𝐾
𝐻
)
(
𝐻
−
𝐾
)
2
(
𝐿
−
𝐾
)
2
−
2
𝐻
−
𝐿
−
𝐾
(
𝐻
−
𝐾
)
(
𝐿
−
𝐾
)
2
 
\[
10
𝑝
𝑡
]
−
𝐿
+
𝐾
𝑅
(
𝐿
−
𝐾
)
2
−
2
𝐻
−
𝐿
−
𝐾
(
𝐻
−
𝐾
)
(
𝐿
−
𝐾
)
2
2
(
𝐿
−
𝐾
)
2
]
.
