---
title: One Period Entropy Model
author: Keith A. Lewis
institution: KALX, LLC
email: kal@kalx.net
classoption: fleqn
---
\newcommand\RR{\boldsymbol{R}}
\newcommand\ZZ{\boldsymbol{Z}}
\newcommand\diag{\operatorname{diag}}
\newcommand\Var{\operatorname{Var}}
\newcommand\Cov{\operatorname{Cov}}
\newcommand\co{\operatorname{co}}
\newcommand\sgn{\operatorname{sgn}}
\newcommand\cone{\operatorname{cone}}
\newcommand\BB{\mathcal{B}}
\newcommand\GG{\mathcal{G}}

$x = (1, v, s)$, $X(\omega) = (R, (\omega - K)^+, \omega)$, $\omega\in\Omega$.

$\min_{p,\lambda} \frac{1}{2}(1 - \sum_i p_i^2) - \lambda\cdot(x - \sum_i X(\omega_i) p_i$

$d/dp_j$, $0 = -p_j + \lambda\cdot X(\omega_j)$.

$p_j = \lambda\cdot X(\omega_j)$

$x = \sum_i X(\omega_i))\lambda\cdot X(\omega_j) = (\sum_i X(\omega_i)X(\omega_i)^T)\lambda$

$\lambda =  (\sum_i X(\omega_i)X(\omega_i)^T)^{-1}x$.

$x = (1, v, s)$, $X(\omega) = (R, (\omega - K)^+, \omega)$, $\omega\in\{L,K,H\}$.

$p_j = (\sum_i X(\omega_i)X(\omega_i)^T)^{-1}x \cdot X(\omega_j)
= (\sum_i X(\omega_i)X(\omega_i)^T)^{-1}X(\omega_j)^T x$.

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

<!--
𝐴^{-1} =
\begin{bmatrix}
\frac{𝐿^2 + 𝐾^2}{𝑅^2 (𝐿 − 𝐾)^2 & −𝐿^2 + 𝐾^2 − 𝐻 ( 𝐿 + 𝐾) 𝑅 ( 𝐻 − 𝐾) (
𝐿 − 𝐾) 2 − 𝐿 + 𝐾 𝑅 ( 𝐿 − 𝐾) 2   \[ 10 𝑝 𝑡 ] − 𝐿 2 + 𝐾 2 − 𝐻 ( 𝐿 + 𝐾) 𝑅 ( 𝐻 − 𝐾) ( 𝐿 − 𝐾) 2 2 ( 𝐿 2 + 𝐾 2 + 𝐻 2 − 𝐿 𝐾 − 𝐿 𝐻 − 𝐾 𝐻) ( 𝐻 − 𝐾) 2 ( 𝐿 − 𝐾) 2 − 2 𝐻 − 𝐿 − 𝐾 ( 𝐻 − 𝐾) ( 𝐿 − 𝐾) 2   \[ 10 𝑝 𝑡 ] − 𝐿 + 𝐾 𝑅 ( 𝐿 − 𝐾) 2 − 2 𝐻 − 𝐿 − 𝐾 ( 𝐻 − 𝐾) ( 𝐿 − 𝐾) 2 2 ( 𝐿 − 𝐾) 2 ]
-->

$x = (1, v_1,\ldots,v_n, s)$,
$X(\omega) = (R, (\omega - K_1)^+,\ldots,(\omega - K_n)^+, \omega)$, $\omega\in\Omega$.

$X(L) = (R, 0,\ldots, 0, L)$

$X(K_1) = (R, 0,\ldots, 0, K_1)$

$X(K_2) = (R, K_2 - K_1,\ldots, 0, K_2)$

$\dots$

$X(H) = (R, H - K_1,\ldots, 0, H)$

$x = X(L) D_L + X(K_1) D_{K1} \cdots X(H) D_H$

$x = X(L) D_L + X_1 D_1 \cdots X(H) D_H$

$$
\begin{bmatrix}
1 \\
v_1 \\
v_2 \\
v_3 \\
\vdots \\
v_n \\
s \\
\end{bmatrix}
=
\begin{bmatrix}
R & R   & R         & R         &\cdots & R             & R \\
0 & 0   & K_2 - K_1 & K_2 - K_1 &\cdots & K_n - K_1     & H - K_1 \\
0 & 0   & 0         & K_3 - K_2 &\cdots & K_n - K_2     & H - K_2 \\
0 & 0   & 0         & 0         &\cdots & K_n - K_3     & H - K_3 \\
\vdots  & \vdots    &\vdots     &\vdots &\ddots         &\vdots         &\vdots \\
0 & 0   & 0         & 0         &\cdots & K_n - K_{n-1} & H - K_{n-1} \\
0 & 0   & 0         & 0         &\cdots & 0             & H - K_n \\
L & K_1 & K_2       & K_3       &\cdots & K_n           & H \\
\end{bmatrix}
\begin{bmatrix}
D_L \\
D_1 \\
D_2 \\
D_3 \\
\vdots \\
D_n \\
D_H \\
\end{bmatrix}
$$

$$
\begin{bmatrix}
1 \\
s \\
v_1 \\
v_2 \\
v_3 \\
\vdots \\
v_n \\
\end{bmatrix}
=
\begin{bmatrix}
R & R   & R         & R         &\cdots & R             & R \\
L & K_1 & K_2       & K_3       &\cdots & K_n           & H \\
0 & 0   & K_2 - K_1 & K_2 - K_1 &\cdots & K_n - K_1     & H - K_1 \\
0 & 0   & 0         & K_3 - K_2 &\cdots & K_n - K_2     & H - K_2 \\
0 & 0   & 0         & 0         &\cdots & K_n - K_3     & H - K_3 \\
\vdots  & \vdots    &\vdots     &\vdots &\ddots         &\vdots         &\vdots \\
0 & 0   & 0         & 0         &\cdots & K_n - K_{n-1} & H - K_{n-1} \\
0 & 0   & 0         & 0         &\cdots & 0             & H - K_n \\
\end{bmatrix}
\begin{bmatrix}
D_L \\
D_H \\
D_1 \\
D_2 \\
D_3 \\
\vdots \\
D_n \\
\end{bmatrix}
$$

Let $K_0 = 0$ and $K_{n+1} = H$.

$$
\begin{bmatrix}
1 \\
s \\
v_1 \\
v_2 \\
v_3 \\
\vdots \\
v_n \\
\end{bmatrix}
=
\begin{bmatrix}
R & R   & R         & R         &\cdots & R             & R \\
L & K_1 - K_0 & K_2 - K_0       & K_3 - K_0       &\cdots & K_n - K_0           & K_{n+1} - K_0 \\
0 & 0   & K_2 - K_1 & K_2 - K_1 &\cdots & K_n - K_1     & K_{n+1} - K_1 \\
0 & 0   & 0         & K_3 - K_2 &\cdots & K_n - K_2     & K_{n+1} - K_2 \\
0 & 0   & 0         & 0         &\cdots & K_n - K_3     & K_{n+1} - K_3 \\
\vdots  & \vdots    &\vdots     &\vdots &\ddots         &\vdots         &\vdots \\
0 & 0   & 0         & 0         &\cdots & K_n - K_{n-1} & K_{n+1} - K_{n-1} \\
0 & 0   & 0         & 0         &\cdots & 0             & K_{n+1} - K_n \\
\end{bmatrix}
\begin{bmatrix}
D_L \\
D_H \\
D_1 \\
D_2 \\
D_3 \\
\vdots \\
D_n \\
\end{bmatrix}
$$

Let $J = 1[i + 1 = j]$ so $J^k = 1[i + k = j]$.

Let $\Delta = I - J$.

$\Delta^{-1} = (I - J)^{-1} = \sum_{k\ge 0} J^k$.

$\Delta D = \diag(K_1, \ldots, K_n)\Delta^{-1}$

$u_{ij} = K_j - K_{i-1}$

$D = [(K_j - K_{i-1})1(i\le j)]$, $V = D^{-1} = [v_{ij}1(i\le j)]$

$v_{ii} = 1/u_{ii}$

$v_{ij} = (-1/u_{ii}) \sum_{k = i + 1}^j u_{ik} v_{kj}$

$v_{i,i} = 1/(K_i - K_{i-1})$

$v_{i,i+1} = -1/(K_{i} - K_{i-1}) + 1/(K_{i+1} - K_{i})$

$v_{i,i+2} = 1/(K_{i+1} - K_i)$.

$v_{i,j} = 0$, $j > 2$.

$A = [R]$, $B = [R\,R\,R\cdots R\,R]$, $C = [L\,0\,0\,0 \cdots 0\,0]^T$
and $D = [(K_j - K_i)1(j > i)]$, $0 \le i < j \le n + 1$.

If $E = (D - CA^{-1}B)^{-1}$ is the Schur complement then
$$
\begin{bmatrix}
A & B \\
C & D \\
\end{bmatrix}^{-1}
=
\begin{bmatrix}
A^{-1} + A^{-1}BECA^{-1} & -A^{-1}BE \\
-ECA^{-1} & E \\
\end{bmatrix}
$$
If $E = (A - BD^{-1}C)^{-1}$ is the Schur complement then
$$
\begin{bmatrix}
A & B \\
C & D \\
\end{bmatrix}^{-1}
=
\begin{bmatrix}
E & - EBD^{-1} \\
-D^{-1}CE & D^{-1} + D^{-1}CEBD^{-1} \\
\end{bmatrix}
$$

$$
\begin{bmatrix}
K_1 & K_2 & \cdots & K_{n + 1} \\
0   & K_2 & \cdots & K_{n + 1} \\
\vdots & \vdots &\ddots & \vdots \\
0   & 0   &\cdots  & K_{n+1} \\
\end{bmatrix}
=
\begin{bmatrix}
1 & 1 & \cdots & 1 \\
0   & 1 & \cdots & 1 \\
\vdots & \vdots &\ddots & \vdots \\
0   & 0   &\cdots  & 1\\
\end{bmatrix}
\begin{bmatrix}
K_1 & 0 & \cdots & 0 \\
0   & K_2 & \cdots & 0 \\
\vdots & \vdots &\ddots & \vdots \\
0   & 0   &\cdots  & K_{n+1} \\
\end{bmatrix}
$$
$$
\begin{bmatrix}
1 & 1 & \cdots & 1 \\
0   & 1 & \cdots & 1 \\
\vdots & \vdots &\ddots & \vdots \\
0   & 0   &\cdots  & 1\\
\end{bmatrix}^{-1}
=
\begin{bmatrix}
1 & -1 & 0 & \cdots & 0 \\
0 & 1  & -1 & \cdots & 0 \\
\vdots & \vdots &\ddots & \vdots \\
0 & 0  &0 &\cdots  & 1\\
\end{bmatrix}^{-1}
$$
$$
\begin{bmatrix}
K_0 & K_0 & \cdots & K_0 \\
0   & K_1 & \cdots & K_1 \\
\vdots & \vdots &\ddots & \vdots \\
0   & 0   &\cdots  & K_n \\
\end{bmatrix}
=
\begin{bmatrix}
K_0 & 0 & \cdots & 0 \\
0   & K_1 & \cdots & 0 \\
\vdots & \vdots &\ddots & \vdots \\
0   & 0   &\cdots  & K_n \\
\end{bmatrix}
\begin{bmatrix}
1 & 1 & \cdots & 1 \\
0   & 1 & \cdots & 1 \\
\vdots & \vdots &\ddots & \vdots \\
0   & 0   &\cdots  & 1\\
\end{bmatrix}
$$

$(A - B)^{-1} = A^{-1}\sum_{k=0}^\infty (A^{-1}B)^k$

Let $U = [1(i\le j)] = 1[\le]$ so $U^{-1} = I - J$, $J = [1(i + 1 = j)]$.

$A = U \diag(K_1,\ldots,K_{n+1})$, $B = \diag(K_0,\ldots,K_n)U$

$U^{-1} = I - J$.

$A^{-1} B = K_1^{-1}(I - J)K_0 U$

$(A^{-1} B)^2 = K_1^{-1}(I - J)K_0 U K_1^{-1}(I - J)K_0 U$
