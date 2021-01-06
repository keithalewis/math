---
title: Lambda
author: Keith A. Lewis
institute: KALX, LLC
classoption: fleqn
fleqn: true
abstract: The lambda calculus
...

\newcommand\ab{\Rightarrow}
\newcommand\re{\Leftarrow}

The _lambda calculus_ distills the essence of computing. Every function that can be calculated
is a $\lambda$-_expression_: a _variable_, an _abstraction_, or an _application_$.

A variable is just a symbol. An abstraction is $x\ab E$ where $x$ is
a variable and $E$ is an expression. Application is $EF$ where $E$ and $F$ are expressions.
The usual notation for $x\ab E$ is $\lambda x.E$.

Expressions can be converted to equivalent expressions by _renaming_ and _replacing_.
The abstraction $x\ab E[x]$ where $E$ is an expression involving the variable $x$ can be
$\alpha$-converted to $y\ab E[y]$ for any variable $y$.
The application $(x\ab E)F$ can be $\beta$-reduced to $E[x\re F]$
where all occurences of $x$ in $E$ are replace by $F$.

For example, since the variable $x$ is also an expression, the abstraction
$x\ab x$ is an expression.
By $\alpha$-conversion we can write this as $y\ab y$ for any variable $y$.
By $\beta$-reduction $(x\ab x)E$ is equivalent to $E$ for any expression $E$, 
so $x\ab x$ is the _identity function_.

True is the expression $t = x\ab y\ab x = x\ab(y\ab x)$ 
and false is $f = x\ab y\ab y = x\ab(y\ab y)$. If we tried alpha conversion
on either of these by replacing $y$ by $x$ we would get $x\ab x\ab x$

If at this point you don't believe something this simple can compute anything that
can be calculated, you are not completely wrong. ...Bound vs unbound variables...
...Parentheses... ...right-to-left associative...

Now that we've solved those issue, we can compute anything that
can be calculated.

Let's start with defining true and false.

The natural numbers are defined by
$0 = x\ab y\ab y$, 
$1 = x\ab y\ab xy$,
$2 = x\ab y\ab xxy$, ...,
$n = x\ab y\ab x\ldots xy$ where $x\ldots x$ is $n$ $x$'s.
This is not unlike how cavehumans may have counted by making marks on clay tablets equal to the count.
We have advanced to using chips made of sand that can move electrons to do the same.

Following Peano, let's compute $n + 1$ from $n$.
Let $s = n\ab x\ab y\ab y n x y$ be the _successor_ of $n$.
We have
$$
\begin{aligned}
s 0 &= (n\ab x\ab y\ab y n x y)(x\ab y\ab y) \\
	&\langle (x\ab E)F = E[x\re F]\rangle \\
	&= (x\ab y\ab y (x\ab y\ab y) x y) \\
	&= 1\\
\end{aligned}
$$


