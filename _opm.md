---
title: One Period Model
author: Keith A. Lewis
classoption: fleqn
link-citations: true
header-includes:
	- \usepackage{bm}
---
\newcommand\bs[1]{\boldsymbol{{#1}}}
\renewcommand\AA{\mathcal{A}}
\newcommand\PP{\mathcal{P}}
\newcommand\RR{\bs{R}}
\newcommand{\ran}{\operatorname{ran}}
\newcommand{\ker}{\operatorname{ker}}

```
   x = _O + s S + 1 B + v1         P1 + ... + vn         Pn
C(w) = _O + w S + R B + (w - K1)^+ P1 + ... + (w - Kn)^+ Pn

C(L)  = _O + L  S + R B 
C(K1) = _O + K1 S + R B
C(K2) = _O + K2 S + R B + (K2 - K1) P1
...
C(Kn) = _O + Kn S + R B + (Kn - K1) P1 + ... + (Kn - Kn-1) Pn-1
C(H)  = _O + H  S + R B + (H - K1)  P1 + ... + (H - Kn-1)  Pn-1 + (H - Kn) Pn

C(L)C(K1)...C(Kn)C(H) = R(K1 - L) B S (K2 - K1) ... (H - Kn) P1 ... Pn

x C(K1) ... = (sR S B + K1 B S) (K2 - K1) ... (H - Kn) P1 ... Pn
            = (K1 - sR) (K2 - K1) ... (H - Kn) B S P1 ... Pn

C(L) x ...  = (L S B + sR B S) (K2 - K1) ... (H - Kn) P1 ... Pn
            = (sR - L) (K2 - K1) ... (H - Kn) B S P1 ... Pn
	

C(L)C(K1)xC(K3)...C(H) = R(K1 - L) B S x (K3 - K2) ... (H - Kn) P2 ... Pn
                       = R(K1 - L) B S v1 P1 (K3 - K2) ... (H - Kn) P2 ... Pn
                       = R(K1 - L) v1 (K3 - K2) ... (H - Kn) B S P1 P2 ... Pn

C(L)C(K1)C(K2)xC(K4)...C(H) = R(K1 - L) B S C(K2) x (K4 - K3)...(H - Kn) P3 ... Pn
	=  R(K1 - L) B S (K2 - K1) P1 x (K4 - K3)...(H - Kn) P3 ... Pn

   x = _O + s S + 1 B + v1 P1 + ... + vn Pn

					   B S P1

   x = _O + s S + 1 B + v1         P1 + ... + vn         Pn

C(L)C(K1) = R(K1 - L) B S
C(L)C(K1)C(K2) = R(K1 - L)(K2 - K1) B S P1
C(L)C(K1)C(K2)C(K3) = R(K1 - L)(K2 - K1)(K3 - K2) B S P1 P2
C(L)C(K1)C(K2)C(K3)x = R(K1 - L)(K2 - K1)(K3 - K2) B S P1 P2 (s S + 1 B + v1 P1 + ... + vn Pn)
	= R(K1 - L)(K2 - K1)(K3 - K2) B S P1 P2 (v3 P3 + ... + vn Pn)

```
