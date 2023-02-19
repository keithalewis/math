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
is a $\lambda$-_expression_: a _variable_, an _abstraction_, or an _application_.

A variable is just a symbol. An abstraction is $(x\ab E)$ where $x$ is
a variable and $E$ is an expression. Application is $(EF)$ where $E$ and $F$ are expressions.
The standard notation for $x\ab E$ is $\lambda x.E$.

Expressions can be converted to equivalent expressions by _renaming_ and _replacing_.
The abstraction $x\ab E[x]$ where $E$ is an expression involving the variable $x$ can be
$\alpha$-converted to $y\ab E[y]$ renaming all (free) occurences of $x$ in $E$ as $y$.
The application $(x\ab E)F$ can be $\beta$-reduced to $E[x\re F]$
where all (free) occurences of $x$ in $E$ are replace by $F$.
The standard notation for $E[x\re F]$ is $E[x:=F]$.

For example, since the variable $x$ is also an expression, the abstraction
$x\ab x$ is an expression.
By $\alpha$-conversion we can write this as $y\ab y$ for any variable $y$.
By $\beta$-reduction $(x\ab x)E$ is equivalent to $E$ for any expression $E$, 
so $x\ab x$ is the _identity function_.

Variables in an expression can be either _bound_ or _free_.
For an abstraction $x\ab E$ we say all free occurences of $x$ in $E$ are bound.
A variable is free if it is not bound.
In the abstraction $x\ab xy$ the variable $x$ is bound and $y$ is free.
If we apply $(x\ab xy)x$ we would get $xx$ if we did not require $x$ to
be free. We must first $\alpha$-convert/rename $x\ab xy$ to, e.g., $z\ab zy$
to apply $(z\ab zy)x$ and $\beta$-reduce/replace to get the correct result $xy$.

True is the expression $t = x\ab y\ab x = x\ab(y\ab x)$ 
and false is $f = x\ab y\ab y = x\ab(y\ab y)$.
We assume abstraction is right-to-left associative to reduce the number of parentheses.
Note $t E F = E$ and $f E F = F$ for any expression $E$ and $F$.

The natural number $0$ is $x\ab y\ab y$, which is the same as $f$.
Successive numbers are defined by
$1 = x\ab y\ab xy$,
$2 = x\ab y\ab xxy$, ...,
$n = x\ab y\ab x\ldots xy$ where $x\ldots x$ is $n$ $x$'s.
This is not unlike how cavehumans may have counted by making marks on clay tablets equal to the count.
We have advanced to using chips made of sand that can move electrons to do the same.

Let $x^n = x\ldots x$ be $n$ $x$'s. Clearly $x^{n + 1}$ is $xx^n$ but this is not a lambda expression
since the $\{}^$ is not defined using the lambda calculus.
Define $s = n\ab x\ab y\ab y n x y$ to be the _successor_ of $n$.
We have
$$
\begin{aligned}
s\ 0 &= (n\ab (x\ab (y\ab y n x y)))0 \\
	&= (x\ab (y\ab (y\ab y 0 x y))) \\
\end{aligned}
$$


