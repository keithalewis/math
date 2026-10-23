---
title: Derivative of $\|x\|^p$
author: Keith A. Lewis
---
\newcommand\bs[1]{\boldsymbol{{#1}}}
\newcommand\RR{\bs{R}}

What is the derivative of the function $x\mapsto\|x\|^p$ where $x\in\RR^n$?
It was the last question my friend Peter Carr asked me before he left
for the math conference in the sky.

The answer is $D\|x\|^p = p\|x\|^{p - 2}x^*$, but the notation needs some
explaining. It looks similar to $dx^p/dx = px^{p-1}$ but the definiton
of derivative of a function from a vector space to a vector space
is the Frechet derivative.

If $f\colon\RR\to\RR$ then its derivative is
$Df(x) = f'(x) = df(x)/dx = \lim_{h\to 0} (f(x + h) - f(x))/h$
when it exists. If $F\colon\RR^n\to\RR^m$ then we cannot use
this definition $f(x + h) - f(x)\in\RR^m$ and $h\in\RR^n$ so
we cannot "divide" the two vectors.

