---
title: Intro
author: Keith A. Lewis
abstract: AI starting from ordinary linear regression.
---

Some people like to say Large Language Models are just a function
from strings of characters to strings of characters.
You type something in and they type something back.
This is not false, but it is missing the important fact that
the function is parameterized by a _context_ and your job
is to winnow the mind boggling large initial context down
to what you want to get it to cough up.

An effective technique is to ask questions from general to specific.
It is a mathematical fact that diagonalizable operators from a
finite dimensional vector
space over the complex numbers to itself (endomorphisms) are dense in the operator norm.
If you ask models to provide a proof directly they usually give
incorrect results.

For example "Let's talk about math" will cause the LLM to 
start focusing on orders of magnitude less context.
You can safely ignore its reply.

Next, you might ask about Linear Algebra and then about diagonalizable
operators.  When you ask if diagonalizable operators are dense in
the space of all linear operators it may tell you that is not true.
That is the correct answer for vector spaces over the real numbers.
How can you figure out that is not the correct answer for vector spaces
over the complex numbers?


