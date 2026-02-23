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
x = _O + B + s S + v1 P1 + ... + vn Pn
C(w) = _0 + R B + w S + (w - v1)^+ P1 + ... + (w - vn)^+ Pn

x = _O + B + s S + v1 P1 + v2 P2
C(L)  = _O + R B + L S 
C(K1) = _O + R B + K1 S
C(K2) = _O + R B + K2 S + (K2 - K1) P1
C(H)  = _O + R B + H S  +  (H - K1) P1 + (H - K2) P2

C(L)C(K1)C(K2)C(H)
= _O + (R K1 - L R) B S C(K2) C(H)
= _O + (R K1 - L R) B S (R B + K2 S + (K2 - K1) P1) C(H)
= _O + (R K1 - L R) B S (K2 S + (K2 - K1)P1) C(H)
= _O + R(K1 - L)(K2 - K1) B S P1 C(H)
= _O + R(K1 - L)(K2 - K1) B S P1 (R B + H S  +  (H - K1) P1 + (H - K2) P2)
= _O + R(K1 - L)(K2 - K1)(H - K2) B S P1 P2

C(K1)C(K2)C(H)
= _O + R(K2 - K1) B S C(H)
= _O + R(K2 - K1) B S (R B + H S  +  (H - K1) P1 + (H - K2) P2)
= _O + R(K2 - K1) B S ((H - K1) P1 + (H - K2) P2)
= _O + R(K2 - K1) ((H - K1) B S P1 + (H - K2) B S P2)
xC(K1)C(K2)C(H)
= _O + R(K2 - K1) (v2(H - K1) P2 B S P1 + v1(H - K2) P1 B S P2
= _O + R(K2 - K1) (-v2(H - K1) + v1(H - K2) B S P1 P2
OxC(K1)C(K2)C(H)
= R(K2 - K1)(-v2(H - K1) + v1(H - K2) O B S P1 P2
- v1/(H - K1) > v2/(H - K1)

C(L)C(K2)
= _O + RK2 B S + R(K2 - K1) B P1 + LR S B + L(K2 - K1) S P2
= _O + R(K2 - L) B S + R(K2 - K1) B P1 + L(K2 - K1) S P2
C(L)C(K2)C(H)
= [_O + R(K2 - L) B S + R(K2 - K1) B P1 + L(K2 - K1) S P2]C(H)
= _O + RL(K2 - K1) S P2 B + HR(K2 - K1) B P1 S
+ [R (K2 - L) B S + R(K2 - K1) B P1 + L(K2 - K1) S P2](H - K1) P1
+ [R (K2 - L) B S + R(K2 - K1) B P1 + L(K2 - K1) S P2](H - K2) P2
= _O + RL(K2 - K1) S P2 B + HR(K2 - K1) B P1 S
+ R(K2 - L)(H - K1) B S P1 + L(K2 - K1)(H - K1) S P2 P1
+ R(K2 - L)(H - K2) B S P2 + R(K2 - K1)(H - K2) B P1 P2
= _O
- L(K2 - K1)(H - K1) S P1 P2
+ R(K2 - K1)(H - K2) B P1 P2
+ (R(K2 - L)(H - K2) + RL(K2 - K1)) B S P2
+ (R(K2 - L)(H - K1) - RH(K2 - K1)) B S P1
OxC(L)C(K2)C(H)
= - L(K2 - K1)(H - K1) O B S P1 P2
  + sR(K2 - K1)(H - K2) O S B P1 P2
  + v1(R(K2 - L)(H - K2) + RL(K2 - K1)) O P1 B S P2
  + v2(R(K2 - L)(H - K1) - RH(K2 - K1)) O P2 B S P1
= [- L(K2 - K1)(H - K1)
  - sR(K2 - K1)(H - K2)
  + v1(R(K2 - L)(H - K2) + RL(K2 - K1)) 
  - v2(R(K2 - L)(H - K1) - RH(K2 - K1))] O B S P1 P2
= -(K2 - K1)(
  
x = _O + B + s S + v1 P1 + v2 P2

C(L)C(K1)C(H)

C(L)C(K1)C(K2)


DH = v2/(H - K1)(K2 - K1) - v1/(H - K1)(K2 - K1) - (H - L)(s - L/R)/(H - K1)(H - K2)
D2 = v1(1/(K2 - K1) + (H - K1)/(H - K2)(K2 - K1)^2 - v2/(K2 - K1)^2 + (H - L)(s - L/R)/(H - K2)(K2 - K1)
D1 = v2/(H - K1) - v1(H - K2)/(H - K1)(K2 - K1) 
