---
title: Large Language Models
author: Keith A. Lewis
---

“What I cannot create, I do not understand” 
was found on Richard Feynman's blackboard at Caltech after he died.

At this year's NYU Tandon [commencement address](https://www.youtube.com/watch?v=pFscM-Z4rCE)
Yann LeCun said "Large Language Models do not create anything." And encouraged
students to learn how they work and use them to create new things.

The most valuable commodity in the world is trust.
It cannot be manufacured or bought, and can vanish in an instant.

You need to figure out who you can trust. It is the oldest problem in the world.

Most people that were well raised just try to the right thing. 

Let me take you through my current understading of how LLM's work


https://github.com/karpathy/llm.c

A large language model is a function. Given a sequence of characters it
returns a sequence of characters. How does it do that?

It takes training data consisting of "correct" answers and interpolates.

Machine learning began in ... with ... perceptrons. They were modelled
after neurons in the brain. Given a set of inputs they would either
fire or not.

The best prompt is "yes". It will clue you in to the current context
of the LLM you are using at the moment.
Use the output to detect what it is _not_ telling you.

A LLM is a function from an input string _prompt_ and a _context_ to an _output_ string.
So called "prompt engineering" is really about context engineering.
