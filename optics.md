---
title: Optics
author: Keith A. Lewis
institute: KALX, LLC
classoption: fleqn
fleqn: true
abstract: Getters and Setters and Profunctors
...

\newcommand\cat[1]{\mathbf{#1}}

Optics are getters and setters for data in functional form.

If $\cat{C}$ is a category we write $\cat{C}(A,B)$ for all arrows in
$\cat{C}$ from object $A\in\cat{C}$ to object $B\in\cat{C}$.  If $\cat{C}$
and $\cat{D}$ are categories we write $[\cat{C},\cat{D}]$ for the
_functor category_ with objects being the functors from $\cat{C}$ to $\cal{D}$
and arrows being the _natural transformations_.

Let $T$ be _primitive types_. Define _data_ $D = T\sqcup \Pi D^* \sqcup \Sigma D^*$.
Data are either a primitive type, products of data, or sums of data.
