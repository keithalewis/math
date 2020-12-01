---
title: Coroutines
author: Keith A. Lewis
institute: KALX, LLC
classoption: fleqn
fleqn: true
abstract: Coroutines are functions and a continuation point.
...

Acknowledgements: [Lewis Baker](https://lewissbaker.github.io/)
and [Raymond Chen](https://devblogs.microsoft.com/oldnewthing/20191209-00).

A _coroutine_ is a function and a _continuation point_. Unlike functions,
coroutines can suspend execution (_yield_) and resume at a later time.
The continuation point keeps track of where the coroutine was last suspended.
A coroutine can call another coroutine exactly as if it were a function.
Use _await_ to suspend execution and resume a live coroutine.
Both yield and await set a continuation point and suspend execution.
Yield is used to return results, await is used to call a coroutine
then capture the results it yields.

Coroutines make it far easier to write concurrent code than using threads.
Unlike threads, coroutines are suspended at function statements instead
of being preempted between some recondite machine instruction by the system thread scheduler.
There is no need to orchestrate the creation and collection of threads and then
sprinkle the code with mutexes or semaphores in the hope of ensuring correct
program execution.

Like functions, coroutines can stand on their own. What they add is the ability
to cooperate with other coroutines to share the task of code execution.
You still have to worry about deadlocks and race conditions however.

Coroutines can _generate_ unbounded streams of data.
```
coroutine iota
	i = 0
	loop
		yield i
		i = i + 1
```
The first time the coroutine is called a counter is set to 0.
The first pass through the loop sets the statement after yield as the
continuation point and returns 0.  The next time it is resumed the
counter is incremented and the second pass through the loop sets a new
continuation point and returns 1. Rinse and repeat.

_Producer_ and _consumer_ coroutines can cooperate to send items through a queue.
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

### Handles

A handle is an object representing a coroutine.

### Await

Calling `await x` results in `x` being called and returns an _awaiter_.
Awaiters can _suspend_ a coroutine and _resume_ to get the result of the coroutine.
Awaiters are usually temporary objects and the destructor cleans up everything
associated with it.

Coroutines returning an awaitable object: struct with well-known functions.

### [Symmetric transfer](https://devblogs.microsoft.com/cppblog/c-coroutines-in-visual-studio-2019-version-16-8/#symmetric-transfer-and-no-op-coroutines)

With symmetric transfer a coroutine can indicate a coroutine handle for
another coroutine to immediately resume when suspending.
This suspend-and-resume operation works without introducing another frame onto the call stack.

```C++
std::coroutine_handle<> await_suspend(std::coroutine_handle<promise_type> h) noexcept {
    return h.promise().continuation ? *continuation : std::noop_coroutine();
}
```



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
repeated or until the function terminates and the return values
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
