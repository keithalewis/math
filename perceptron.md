---
title: Perceptrons
author: Keith A. Lewis
---
\newcommand\bs[1]{\boldsymbol{{#1}}}
\newcommand\RR{\bs{R}}

_Perceptrons_ were invented by [@McCPit1943], two college professors
in the department of psychiatry and neuropsychiatricietry, respectively,
at the University of Chicago. Their abstract starts with:

> Because of the "all-or-none" character of nervous activity, neural
events and the relations among them can be treated by means of
propositional logic.

It is difficult to imagine the tenor of 1943 in the middle of WW II
where mathematical logic would hold such sway.

> Many years ago one of us, by considerations impertinent to this
argument, was led to conceive of the response of any neuron as factually
equivalent to a proposition which proposed its adequate stimulus. He
therefore attempted to record the behavior of complicated nets in the
notation of the symbolic logic of propositions.

> To present the theory, the most appropriate symbolism is that of
Language II of R. Carnap (1938), augmented with various notations
drawn from B. Russell and A. N. Whitehead (1927),

[@Ros1957] coined the term _percepton_ and described the model used today.
The limitations of a single perceptron were quickly realized and Rosenblatt
used layers containing multple perceptrons, a neural network, to
build his Mark I Perceptron. His model assumed the output of a
perceptron was 0 or 1 corresponding to an actual neuron either
not firing or not firing, similar to the false and true of propositional logic.
Later models softend this to emiting a number between 0 and 1 that is a non-decreasing
function of the inputs. These are called Rectified Linear Units by
people who like to call them ReLUs to sound smart.

"the embryo of an electronic computer that [the Navy] expects will be
able to walk, talk, see, write, reproduce itself and be conscious of
its existence."

## Classification

Large Language Models are functions from strings to strings.
Given a string of characters it returns a string of characters.
Models are trained by specifying a set of input strings and
the expected output strings then finds a function that
interpolates this data.

In [@Sea1980] the philosophical aspects of this were were considered.
He stipulated a _Chinese Room_ where
English text was slipped under a door and a human being
who did not know Chinese simply applied a set of fixed rules to translate it to Chinese characters.

Recall that a function from set $A$ to set $B$ is an element of the
_set exponential_ $B^A = \{f\colon A\to B\}$.
Every function can be represented by its graph $\{(a, f(a))\mid a\in A\}$
which is a subset of the cartesian product $A\times B$. If $A$ has $|A|$
elements and $B$ has $|B|$ elements then $B^A$ has $|B^A| = |B|^|A|$ elements.
Given the current estimate of the number of elementary particles
in the universe is considerably less than $10^{100}$ it is not physically possible
to represent graphs of all functions in $B^A$ on a computer
even for moderately sizes of $A$ and $B$.

[@Chu1941] invented the lambda calculus to express any computable function.
His student Alan Turing invented his eponymus Turing Machine that has
equivalent computing power.

Turing considered an infinite discrete tape that could have marks made on it
and move left and right. It's legacy is [BrainFuck](https://en.wikipedia.org/wiki/Brainfuck)

Church's lambda calculus specified an _expression_ as either a variable, abstraction, or application.
A _variable_ is a unique symbol, an _abstraction_ is a $\lambda x. E$ where $x$ is a variable and
$E$ is an expression,
an _application is $EF$ where $E$ and $F$ are expressions.
Unlike BrainFuck, many languaged based on the lambda calculus have been written.
One of the earliest was [Standard ML of New Jersey](https://www.smlnj.org/).
This led to [Ocaml](https://ocaml.org/) that [Jane Street Campital](https://www.janestreet.com/)
uses.
The current most popular function programming language is [Haskell](https://www.haskell.org/)
based on the SKI combinators.

Given sets $S_0, S_1\subseteq\RR^n$ a function $f\colon\RR^n\to\{0,1\}$
_classifies_ the data if $x\in S_0$ implies $f(x) = 0$ and $x\in S_1$ implies $f(x) = 1$.
find a function

A perceptron is a function $\pi\colon\RR^n\to\{0,1\}$ defined by $b\in\RR$ and $w\in\RR^n$
where $\pi(x) = b + w\cdot x > 0$.

$w' = w + r(d - f(x))x$
