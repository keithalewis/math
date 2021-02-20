---
title: Monad
author: Keith A. Lewis
institute: KALX, LLC
classoption: fleqn
fleqn: true
abstract: Will it Function?
...

\newcommand\dom{\operatorname{dom}}
\newcommand\cod{\operatorname{cod}}
\newcommand\ker{\operatorname{ker}}
\newcommand\ran{\operatorname{ran}}
\newcommand\cat[1]{\mathbf{#1}}
\newcommand\mb[1]{\mathbf{#1}}

> _A monad is a monoid in the category of endofunctors_.

Whatever that means.

It is common in numeric libraries written in C-like languages to have 'functions' of the form
```
	err f_e(double in, double* out);
```
that take a numeric `in`put, place the result of the function in the
memory for the `out`put and return an integral `err`or code. 
If $x$ is the input and $y$ is the output then $y = f(x)$ after the call
if there is no error, otherwise $y$ is indeterminate and the error code
returned by `f_e` must be inspected to determine what went wrong.
The library user must make sure memory for the output exists and must
check the return code to detect problems.

Aside from being tedious to use, one problem with this convention is that
it is not a function in the mathematical sense.  Mathematical functions
don't have arguments that can be used as output. This can be solved by
making $f$ a _partial function_ with domain the set of all $x\in X$
such that `f_e` returns no error. The standard way to do this is
to assume a special element $\bot\not\in X$ and define $f(x) = \bot$
when $x$ is not in the domain.
Now $f$ is a function in the usual mathematical sense but we've lost
information about the error code.

A better way is to define $F\colon E\times X\to E\times X$, where $E$
is the set of error codes by $F(e,\_) = (e,\_)$ if $e$ is an error and
$F(\_,x) = (e,y)$ where $e$ is the error code from `f_e` and $y = f(x)$
if there was no error. A possible implementation with `err_t` being
the error type and `E_OK` indicating no error is
```
struct double_err {
	double x;
	err_t e;
};

double_err F(double_err X) {
	if (X.e == E_OK) {
		X.e = f_e(x, &X.x);
	}

	return X;
}
```
Congratulations, you've just created a monad. The `double_err` struct
wraps up a double and error code, and `F` acts on the wrapped up types.
You can now compose such functions and the result will be the usual
composition if there are no errors or else the first error encountered
will be propagated to the final result.

## Numbers that are not numbers

In IEEE floating point arithmetic certain bit patterns in the
representation indicate the number is not a number, a NaN. This is similar
to our $\bot$ element for turning partial functions into functions. Any
arithmetic operation involving a NaN results in a NaN so we get the same
lousy behavior of destroying information about exactly what error occured.
The IEEE standard specifies other special bit patterns for more informative
exceptions. There are positive or negative infinity in the case of overflow,
there is a positve and negative 0, very small (denormalized) numbers have
a special form that allow detection of the onset of underflow.

## Wrapping things up

We can extend this to types other than `double`. Given a type $T$ and errors $E$
define $M\colon T\to T\times E$ by $Mt = (t,e_0)$ where $e_0$ is the element
of $E$ indicating no error.
