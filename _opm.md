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

	a0 P0 + ... + ak Pk
	b0 P0 + ... + bk Pk
	=
	sum_{i < j) (ai bk - ak bi) Pi Pj
	
	a0 P0 + ... + ak Pk
	b0 P0 + ... + bk Pk + bk+1 Pk+1
	=
	A(B + bk+1 Pk+1)
	=
	AB + A bk+1 Pk+1
	= 
	sum_{i < j} (ai bj - aj bi) Pi Pj
	+ a0 bk+1 P0 Pk+1 + ... + ak bk+1 Pk Pk+1

	A0
	A1 + a_11 P1
	A2 + a_21 P1 + a_22 P2
	=
	A0 A1 A3 + a_11 A0 P1 A2 + a_11 a_22 A0 P1 P2


	a_11 P1
	a_22 P1 + a_22 P2
	...
	a_n1 P1 + a_n2 P2 + ... + a_nn Pn
	=
	a_11 a_22 ... a_nn P1 P2 ... Pn

	A0
	A1 + a_11 P1
	A2 + a_21 P1 + a_22 P2
	...
	An + a_n1 P1 + a_n2 P2 + ... + a_nn Pn
	=
	A0 A1 + a_11 A0 P1
	A2 + a_21 P1 + a_22 P2
	...
	An + a_n1 P1 + a_n2 P2 + ... + a_nn Pn
	=
	A0 A1 (A2 + a_21 P1 + a_22 P2) + a_11 A0 P1(A2 + a_21 P1 + a_22 P2)
	A3 + a_31 P1 + a_32 P2 + a_33 P3
	...
	An + a_n1 P1 + a_n2 P2 + ... + a_nn Pn
	=
	A0 A1 A2 + a_21 A0 A1 P1 + a_22 A0 A1 P2 + a_11 A0 P1 A2 + a_11 a_22 A0 P1 P2
	A3 + a_31 P1 + a_32 P2 + a_33 P3
	...
	An + a_n1 P1 + a_n2 P2 + ... + a_nn Pn
	=
	A0 A1 A2 + a_21 A0 A1 P1 + a_22 A0 A1 P2 + a_11 A0 P1 A2 + a_11 a_22 A0 P1 P2
	A3 + a_31 P1 + a_32 P2 + a_33 P3
	---
	(A0 A1 A2 A3 + a_31 A0 A1 A2 P1 + a_32 A0 A1 P2 + a_33 A0 A1 P3
	+a_21 A0 A1 P1 A3 + a_21 a_32 A0 A1 P1 P2 + a_21 a_33 A0 A1 P2 P3
	+
	A4 + a_41 P1 + a_42 P2 + a_43 P3 + a_44 P4
	...
	An + a_n1 P1 + a_n2 P2 + ... + a_nn Pn



x  = _O + s S + 1 B + v1         P1 + ... + vn         Pn
C(w)  = _O + w S + R B + (w - K1)^+ P1 + ... + (w - Kn)^+ Pn

C(L)  = _O + L  S + R B 
C(K1) = _O + K1 S + R B
C(K2) = _O + K2 S + R B + (K2 - K1) P1
...
C(Kn) = _O + Kn S + R B + (Kn - K1) P1 + ... + (Kn - Kn-1) Pn-1
C(H)  = _O + H  S + R B + (H  - K1) P1 + ... + (H  - Kn-1) Pn-1 + (H - Kn) Pn

C(L)C(K1)...C(Kn)C(H) = R(K1 - L) B S (K2 - K1)...(H - Kn) P1...Pn

x C(K1) ... = (sR S B + K1 B S) (K2 - K1) ... (H - Kn) P1 ... Pn
            = (K1 - sR) (K2 - K1) ... (H - Kn) B S P1 ... Pn

C(L) x ...  = (L S B + sR B S) (K2 - K1) ... (H - Kn) P1 ... Pn
            = (sR - L) (K2 - K1) ... (H - Kn) B S P1 ... Pn


C(L)C(K1)xC(K3)...C(H) = R(K1 - L) B S x (K3 - K2) ... (H - Kn) P2 ... Pn
                       = R(K1 - L) B S v1 P1 (K3 - K2) ... (H - Kn) P2 ... Pn
                       = R(K1 - L) v1 (K3 - K2) ... (H - Kn) B S P1 P2 ... Pn

C(L)C(K1)C(K2)xC(K4)...C(H) = R(K1 - L) B S C(K2) x C(K4) ... C(H)
    =  R(K1 - L) B S (K2 - K1) P1 x C(K4) ... C(H)
    =  R(K1 - L) B S (K2 - K1) P1 
	   s S + B + v1 P1 + v2 P2 ... + vn Pn
	   C(K4) ... C(H)
    =  R(K1 - L) (K2 - K1) B S P1 (v2 P2 + v3 P3 + ... + vn Pn)
	   C(K4) ... C(H)
    =  R(K1 - L) (K2 - K1) B S P1 (v2 P2 + v3 P3 + ... + vn Pn)
	   K4 S + R B + (K4 - K1) P1 + (K4 - K2) P2 + (K4 - K3) P3
	   C(K5)... C(H)
    =  R(K1 - L) (K2 - K1) B S P1 (v2 P2 + v3 P3 + ... + vn Pn)
	    (K4 - K2) P2 + (K4 - K3) P3
	   C(K5)... C(H)
    =  R(K1 - L) (K2 - K1) B S P1 (v2 P2 + v3 P3 + ... + vn Pn)
	   [v2 (K4 - K3) - v3(K4 - K2)] P2 P3
	   C(K5)... C(H)
	= R(K1 - L) (K2 - K1)[v2 (K4 - K3) - v3(K4 - K2)](K5 - K4) ... (H - Kn) B S P1 ... Pn
      R(K1 - L) (K2 - K1)(K3 - K2)(K4 - K3)(K5 - K4)...(H - Kn) B S P1...Pn

[v2 (K4 - K3) - v3(K4 - K2)]/(K3 - K2)(K4 - K3) > 0
v2/(K3 - K2) > v3(K4 - K2)/(K3 - K2)(K4 - K3)
v2(K3 - K2)/(K3 - K2) > v3(K4 - K2)/(K4 - K3)
v2 > v3(K4 - K2)/(K4 - K3)
v2/(K4 - K2) > v3/(K4 - K3)
