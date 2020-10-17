---
title: Coroutines
author: Keith A. Lewis
institute: KALX, LLC
classoption: fleqn
fleqn: true
---

A _full asymmetric coroutine_ has three operations: _create_, _resume_, and _yield_.
Create takes a coroutine body and instanciates it in a suspended state.
The _continuation point_ is set to the beginning of the body. Resume cause the
coroutine to execute from its continuation point until it either yields
at a new continuation point or terminates. A terminated coroutine cannot be resumed.

The first call to resume specifies the coroutine parameters. In subsequent calls to
resume these become the result of yield. When a coroutine suspends the arguments
to yield become the result of the resume that activated the coroutine.
When a coroutine terminates the values returned by the body become the result
of the last reactivation.

An _expression_ is a _lable_, _variable_, _function_, _application_, variable assignment, _conditional_,
equality operator for labels, or a _nil_ value.

$e \to l\mid v\mid x\mapsto e\mid e\,e\mid x := e\mid e\,?\,e : e\mid e = e\mid \bot$

A value is a label, function, or nil.

A _store_ is a mapping from variables and labels to values.
$\theta\colon\mathit{variables}\cup\mathit{labels}\to\mathit{values}$

An _evaluation context_ is used to specify evaluaton of _expressions_.

$C \to \emptyset\mid e C\mid C v\mid x := C\mid  C\,?\,e : e\mid e = C\mid C = v$.

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

$e \to \dots\mid l:e\mid \mathbf{create} e\mid \mathbr{resume}\,e\,e\mid \mathbf{yield}\,e$
