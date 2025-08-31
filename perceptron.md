---
title: Perceptrons
author: Keith A. Lewis
---

_Perceptrons_ were invented by [@McCPit1943], two college professors
in the department of psychiatry and neuropsychiatricietry, respectively,
at the University of Chicago. Their abstract starts with:

> Because of the "all-or-none" character of nervous activity, neural 
events and the relations among them can be treated by means of propositional logic. 

It is difficult to imagine the tenor of 1943 in the middle of WW II.
The Vienna Circle dissolved in the late 1930's after the Nazi's invaded Austria.

> Many years ago one of us, by considerations impertinent to this 
argument, was led to conceive of the response of any neuron as factually equivalent to
a proposition which proposed its adequate stimulus. He therefore attempted to record the behavior of complicated 
nets in the notation of the symbolic logic of propositions.

> To present the theory, the most appropriate symbolism is that of
Language II of R. Carnap (1938), augmented with various notations
drawn from B. Russell and A. N. Whitehead (1927),

Rosenblatt.

"the embryo of an electronic computer that [the Navy] expects will be able to walk, talk, see, write, reproduce itself and be conscious of its existence."

A perceptron is a function $\pi\colon\RR^n\to\{0,1\}$ defined by $b\in\RR$ and $w\in\RR^n$
where $\pi(x) = b + w\cdot x > 0$.
