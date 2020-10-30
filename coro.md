---
title: Coroutines
author: Keith A. Lewis
institute: KALX, LLC
classoption: fleqn
fleqn: true
abstract: Coroutines are functions and a continuation point.
...

A _coroutine_ is a function and a _continuation point_. Unlike functions,
coroutines can suspend execution and resume at a later time.
The continuation point keeps track of where the coroutine was last suspended.

Coroutines make it far easier to write concurrent code than using threads.
Unlike threads, coroutines are suspended at function statements instead
of being preempted between some recondite machine instruction by the system thread scheduler.
There is no need to orchestrate the creation and collection of threads and then
sprinkle the code with mutexes or semaphores in the hopes of ensuring correct
program execution.

Like functions, coroutines can stand on their own. What they add is the ability
to cooperate with other coroutines to share the task of code execution.

Producer and consumer coroutines can cooperate to send items through a queue.
```
coroutine produce
	loop
		while queue not full
			add items to queue
		yield to consume

coroutine consume
	loop
		while queue not empty
			remove items from queue
		yield to produce
```
There is no need for multiple theads; yield can jump directly from one
coroutine to another.

Another common use is to generate unbounded streams of data.
```
coroutine iota
	i = 0
	loop
		yield i
		i = i + 1
```
The first time the coroutine is called a counter is set to 0 and the first
pass through the loop sets the yield statement as the continuation point
and returns 0.  Then next time it is resumed execution starts from the
yield stament and the counter is incremented. The second pass through
the loop sets a new continuation point and returns 1. Rinse and repeat.

## The Life of a Coroutine

When a coroutine is created the continuation point is set to the beginning
of the routine and it is put in a suspended state. Calling the coroutine
with its arguments resumes exectution from the beginning. If the function
contains a yield statement then the continuation point is set to the
next statement in the function and execution is suspended. The arguments
to yield become the result of the resume that activated the coroutine.
Subsequent calls of the coroutine resume execution at the coninuation
point and the arguments of the call become available to the coroutine.
Execution continues until the next yield statement and the above is
repeated or until the function terminates and the retun values
become the result of the last reactivation. At that point the
coroutine can no longer be resumed.

## Theory

A _full asymmetric coroutine_ has three operations: _create_, _resume_, and _yield_.
Create takes a coroutine body and instanciates it in a suspended state.
The _continuation point_ is set to the beginning of the body. Resume cause a
coroutine to execute from its continuation point until it either yields
at a new continuation point or terminates. A terminated coroutine cannot be resumed.

The first call to resume specifies the coroutine parameters. In subsequent calls to
resume these become the result of yield. When a coroutine suspends, the arguments
to yield become the result of the resume that activated the coroutine.
When a coroutine terminates, the values returned by the body become the result
of the last reactivation.

An _expression_ is a _lable_, _variable_, _function_, _application_, variable assignment, _conditional_,
equality operator for labels, or a _nil_ value.

$e \to l\mid v\mid x\mapsto e\mid e\,e\mid x := e\mid e\,?\,e : e\mid e = e\mid \bot$

A value is a label, function, or nil.

A _store_ is a mapping from variables and labels to values.
$\theta\colon\mathit{variables}\cup\mathit{labels}\to\mathit{values}$

An _evaluation context_ is used to specify evaluaton of _expressions_.

$$
C \to \emptyset\mid e C\mid C v\mid x := C\mid  C\,?\,e : e\mid e = C\mid C = v
$$

A context and a store is evaluated to a value.
$$
\begin{aligned}
	\langle C[x],\theta\rangle &\Rightarrow \langle C[\theta(x)],\theta\rangle \\
	\langle C[(x\mapsto e)v],\theta\rangle &\Rightarrow \langle C[e[z/x]],\theta[z\leftarrow v]\rangle \\
	\langle C[x := v],\theta\rangle &\Rightarrow \langle C[v],\theta[x\leftarrow v]\rangle \\
	\langle C[\bot\,?\,e_1 : e_2],\theta\rangle &\Rightarrow \langle e_2,\theta\rangle \\
	\langle C[v\,?\,e_1 : e_2],\theta\rangle &\Rightarrow \langle e_1,\theta\rangle \\
	\langle C[l = l],\theta\rangle &\Rightarrow \langle C[l],\theta\rangle \\
	\langle C[l_1 = l_2],\theta\rangle &\Rightarrow \langle C[\bot],\theta\rangle \\
\end{aligned}
$$

Expressions can be labeled and used in coroutine operators.

$$
e \to \dots\mid l:e\mid \mathbf{create}\,e\mid \mathbf{resume}\,e\,e\mid \mathbf{yield}\,e
$$
