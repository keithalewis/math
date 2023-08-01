---
title: Two-Period Model
author: Keith A. Lewis
institution: KALX, LLC
email: kal@kalx.net
classoption: fleqn
abstract: Examples
...

\newcommand\RR{\boldsymbol{R}}
\newcommand\AA{\mathcal{A}}
\newcommand\ran{\operatorname{ran}}

## One period binomial

$Ω = \{0,1\}$.

$D_0 = 1$, $D_j(\}ω\}) = d_ω$.

$X_0 = (1, s, n)$,

$X_1(ω) = (R, S(ω), 0)$, $C_1 = (0,0,ν(S(ω)))$.

$\AA_0 = \{\{0,1\}\}$, $\AA_1 = \{\{0\},\{1\}\}$.

$X_0D_0 = (X_1 + C_1)D_1|_{\AA_0}$

$(1, s, n) = (R, S(0), ν(S(ω)) d_0 + (R, S(1), ν(S(1)) d_1$

\begin{aligned}
	1 &= R d_0 + R d_1 \\
	s &= S(0) d_0 + S(1) d_1 \\
	n &=  ν(S(1))d_0 +  ν(S(1))d_1 \\
\end{aligned}

## Two period binomial

$Ω = \{0,1\}^2$.

$X_0 = (1, s, n)$,

$X_1(ω) = (R, S_1(ω), 0)$, $C_1 = (0,0,0)$.

$X_2(ω) = (R^2, S_2(ω), 0)$, $C_2 = (0,0,ν(S_2(ω)))$

$\AA_0 = \{\{00, 01, 10, 11\}\}$

$\AA_1 = \{\{00, 01\},\{10, 11\}\}$.

$X_1 D_1 = (X_2 + C_2) D_2|_{\AA_1}$

\begin{aligned}
	R &= R^2(d_{00} + d_{01}) \\
	S_1(0*) &= S_2(00)(d_{00} + S_2(01) d_{01}) \\
	V_1(0*) &= ν(S_2(00))d_{00} + ν(S_2(01)) d_{01}) \\
\end{aligned}

\begin{aligned}
	R &= R^2(d_{10} + d_{01}) \\
	S_1(1*) &= S_2(10)(d_{10} + S_2(11) d_{11}) \\
	V_1(1*) &= ν(S_2(10))d_{10} + ν(S_2(11)) d_{11}) \\
\end{aligned}

$X_0D_0 = (X_1 + C_1)D_1|_{\AA_0}$

$(1, s, n) = (R, S(0), ν(S(ω)) d_0 + (R, S(1), ν(S(1)) d_1$

\begin{aligned}
	1 &= R d_0 + R d_1 \\
	s &= S(0) d_0 + S(1) d_1 \\
	n &=  ν(S(1))d_0 +  ν(S(1))d_1 \\
\end{aligned}

\begin{aligned}
 \end{aligned}

