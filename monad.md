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

Suppose function $f\colon X\to Y$ but things can go wrong when
computing $f(x)$ for some values of $x\in X$.  One approach is
to make $f$ a _partial function_ with domain the set of all untroublesome
$x\in X$.  We can make $f$ into a proper function on all of $X$ by assuming
a special element $\bot\not\in Y$ and define $f(x) = \bot$ when $x$
is not kosher.  Now $f$ is a function in the usual mathematical
sense but we've lost all information about the rabbinic code $f(x)$ violated.

In the [C standard library for mathematical
functions](https://en.cppreference.com/w/c/numeric/math)
this is handled by setting the macro
[`errno`](https://en.cppreference.com/w/c/error/errno)
to indicate what went wrong. $\bot$ is spelled
[NAN](https://en.cppreference.com/w/c/numeric/math/NAN)
in C and the programmer calling the function should use
[`isnan`](https://en.cppreference.com/w/c/numeric/math/isnan) to check
for $\bot$ and inspect `errno` to get more detailed information on why
the function failed.

It is common in numeric libraries written in C-like languages to have functions of the form
```
	int f(double x, double* py);
```
that write the value of $f(x)$ into the memory address of the pointer `py`
and return an error code indicating what went wrong if $x$ 
is not in the domain of $f$. This is an improvement over setting
a global `errno` but the programmer still has to check all possible
return values. If the library implementing `f` changes then
new error codes might be added that requires the programmer to
change their code to take into account.

Another problem with this approach is that `f` is not a _pure_ function.
It has a side-effect of changing the memory location pointed
to by `py`. Monads solve this problem.

## Monad

_Monads_ provides a way to wrap up values, map a function to act on
wrapped up values, and a way to unwrap values. Monads solve the problem
of turning partial functions into functions that can report on why the
partial function failed.

The C standard library function `double sqrt(double x)`
returns a `NAN` if $x < 0$ and sets the glob

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
