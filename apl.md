---
title: APL
author: Keith A. Lewis
institute: KALX, LLC
classoption: fleqn
fleqn: true
abstract: A Programming Language
...

\newcommand\RR{\bm{R}}
\newcommand\NN{\bm{N}}
\newcommand\ZZ{\bm{Z}}
\newcommand\dom{\operatorname{dom}}
\newcommand\cod{\operatorname{cod}}
\newcommand\hom{\operatorname{hom}}
\newcommand\ran{\operatorname{ran}}
\newcommand\Set{\mathbf{Set}}
\newcommand\eq{\text{$=$}}
\newcommand\from{\widehat{\phantom{x}}

A Programming Language _APL_ was invented by Ken E. Iverson, a mathematician
unsatisfied by the limited expressiveness of FORTRAN when it came to manipulating
multidimensional arrays. What follows is a mathematical description of
the objects and operations on them he envisioned to scratch that itch.
It is simply a matter of giving explicit names to the operations that can be
performed on collections of data; what Iverson called "tools of thought."

There have been many languages inspired by APL and this writeup takes
liberties with the classical language.  Our approach is informed by
advances in mathematics and best practices for implmementing functional
languages on current computer architectures. 
We take a purely functional view so no side effects are allowed and data cannot
be mutated.  Similar to Everett's many-world interpretation, this makes
it easy to reason about programs mathematically, but can be hard on
computers computationally.  Using lazy evaluation, lenses, zippers and
other implementation techniques can help with that.

Dijkstra called APL "a mistake carried through to perfection,"
as if that were a bad thing.

## Set

Given a function $f\colon X\to Y$ we write $f(x)$ as $fx$.
If $g\colon Y\to Z$ we write the composition $g(f(x))$ as $gfx$.
Right to left association is natural in functional languages
to chain application. If $h\colon Z\to W$ then $h(gf) = (hg)f$
so writing $hgf$ is unambiguous. The identity function of a
set $X$ is $1_X\colon X\to X$ with $1_X(x) = x$, $x\in X$
and $f1_X = f = 1_Yf$ whenever $f\colon X\to Y$.
Sets and functions are the objects and arrows of a category
called $\Set$.

This category is _cartesian closed_; it has products and exponetials.
The product of sets $X$ and $Y$ is the cartesian product
$X\times Y = \{(x,y):x\in X, y\in Y\}$ is the set of all pairs from each set
and the exponential $Y^X = \{f\colon X\to Y\}$ is the set of functions
from $X$ to $Y$.

They are related by $Z^{X\times Y}$ is in one-to-one
correspondence with $Z^{Y^X}$. Every $f\in Z^{X\times Y}$ corresponds
to $g\in Z^{Y^X}$ via $f(x,y) = z$ if and only if $g(x)(y) = (gx)y = z$,
$x\in X$, $y\in Y$, $z\in Z$.
This can be written $(X\times Y)\to Z \leftrightarrow X\to(Y\to Z)$.[^1]
Going from left to right is _currying_ and going from right to left
is _uncurrying_. Given $f\colon X\times Y\to Z$ we write $fx\colon Y\to Z$
for _partial application_ instead of $g(x)$.

The cartesian product of a set $X$ with itself $n$ times, $X^n$, can be
identified with the set of functions $n\to X$ if we use the convention $n
= \{0,\ldots,n-1\}$. The element $x = (x_0,\ldots,n-1)$ of the cartesian
product corresponds to the function $x\colon n\to X$ via $x_i = x(i)$,
$i\in n$.

### Product

The cartesian product of a set $X$ with itself $Y$ times,
$\Pi X_Y = \Pi_{y\in Y} X$, can be defined for any set $Y$.
As above, it can be identified with $X^Y$.
The product has _projections_ $\pi_y\colon \Pi X_y\to X$
defined by $\pi_y a = a(y)$, $y\in Y. We write $\pi_y a = a_y$
and $a = (a_y)$ _as an array_ in the product for $a$ _as a function_
in the exponential.

__Exercise__. _If $a,b\in\Pi X_Y$ and $\pi_y a = \pi_y b$ for
all $y\in Y$ then $a = b$ as functions in $Y^X$_.

Note $\Pi X_Y$ is not equal to $X^Y$, but
they are _isomorphic_.
Define $\eta\colon X^Y\to \Pi X_Y$ by $\pi_y(\eta a) = a(y)$
and $\epsilon\colon\Pi X_Y\to X^Y$ by $(\epsilon a)y = \pi_y a$.

__Exercise__. _Show $\epsilon\eta$ is the identity on $\Pi X_Y$
and $\eta\epsilon$ is the identity on $\Pi X_Y$_.

[^1]: In fancy pants category theory language this is expressed as
the product functor $F_Y(X) = X\times Y$ and the exponential functor
$G_Y(Z) = Z^Y$ are adjoint: $\hom(F_Y(X),Z)\cong\hom(X,G_Y(Z))$.

### Each

If $f\colon X\to Y$ and $x\colon Z\to X$ then $fx\colon Z\to Y$.
This can be viewed as a function $f^Z\colon X^Z\to Y^Z$.
It is common to call this _apply_ or _map_, but in APL
it is called _each_. With $X^Z$ and $Y^Z$ as products,
$x\mapsto fx$ where $(fx)_z = f(x_z)$

### Index

If $y\colon Y\to Z$ and $f\colon X\to Y$ then $yf\colon X\to Z$.
This can be viewed as a function $f_Z\colon Z^Y\to Z^X$.  It is
common to call this _projection_, but in APL it is called _index_.
With $Z^Y$ and $Z^X$ as products, $y\mapsto yf$ where $(yf)_x = y_{fx}$.
Given $Z^X$ as a product, $Z^Y$ is a product on the indices selected
by $f$.  If $I\subseteq Y$ and $f\colon I\to Y$ is the inclusion map
then $Z^Y\to Z^I$ is the projection $\Pi Z_Y\to \Pi Z_I$. The inclusion
map is written $[I]$ if $Y$ is understood.

APL is primarily concerned with arrays $X^{n_0\times\cdots n_{m-1}}$
and giving names to the functions operating on those.
Most often $X$ is $\RR$, the set of real numbers,
but $X$ can also be a set of characters.

## Example

APL lets you turn a number into a lot of numbers.
The function $\iota$ (iota) is used to produce sequences. If $n\in \NN$ then
$\iota n = (0, 1, \ldots n-1)$ where $\NN$ is the set of natural numbers. 
It gives a name related to our convention $n = \{0,\ldots, n-1\}$ but there
is a difference: $\iota n$ is not a set, it is an element of $\NN^n$.
Note $(\iota n)_i = i$, $i\in n$ so $\iota n$ is the identity function
on $n$.

In two dimensions the $n\times n$ identity matrix is
$(\delta_{ij})_{i,j\in n}\in \NN^{n\times n}$. In APL
it is $\delta$ applied to each element of $n\times n$.
The elements of $n\times n$ are $\{(i,j):i,j\in n\}$ so
$\delta n\times n = \{\delta(i,j):(i,j)\in n\times n\}$.

We can define $\delta\colon X^n\to X$ for any $n$
by $\delta(x_0,\ldots,x_n-1) = 1$ if all $x_i$ are equal and $0$ otherwise.
In APL we use $\eq$ instead of pussyfooting around with $\delta$.
We should probably use `true` and `false` instead of $1$ and $0$.
If $X$ is the name of the _type converion_ function
`true`$\mapsto 1$ and `false`$\mapsto 0$
we would write $X(\delta)$, or $X\delta$, instead of $\delta$.

But wait, that's not all! This can be written more succinctly
as $\eq n^2$ since $n^2$ is equivalent to $n\times n$.
The $k$-dimensional identity matrix is $\eq n^k$. If we
define $\from(A, B) = A\from B = A^B$, ⍣ in APL,
then $\eq \from$ allows us to parameterize over $n$ too since
$\eq \from(n,k)$ is $\eq n^k$.

Never play code golf with an APLer.

### Reduce

APL also lets you turn a lot of numbers into one number.
For instance, $+/(a_0,\ldots,a_n) = a_0 + \cdots + a_n$
where slash ($/$) is called _reduce_. Other languages
call this _fold_.

Any binary operator $\bullet\colon X\times X\to X$ can
be extended to
$\bullet/\colon X^n\colon X$ for $n > 2$
inductively by $\bullet/(x_0, x_1, \ldots) = x_0 \bullet (\bullet/(x_1, \dots))$.
This is called _right reduce_. If the array is finite then
then _left reduce_ is $/\bullet(x_0,\ldots,x_n) = (/\bullet(x_0,\ldots,x_{n-1}))\bullet x_n$.
Here we are using _infix notation_ $\bullet(x,y) = x\bullet y$.

If $\bullet$ is associative then right and left right reduce are equal.
If we define $\bullet/(x) = x$ then $\bullet/(x,y) = (\bullet/x)\bullet(\bullet/y)$
where $(x,y)$ is the concatenation of array $x$ with array $y$. Likewise for $/\bullet$.
If $\bullet$ has an _identity element_ $e\in X$ we can define
$\bullet/\emptyset = e = /\bullet\emptyset$
and this holds when $x$ or $y$ are empty. These conditions make $X$ a _monoid_ under $\bullet$.

If the binary operation is commutative then changing the order of the array elements does not alter the result.


<!--

__Exercise__. _Show if $f$ is injective then it has a left inverse_.

Hint: Define $g\colon Y\to X$ by $g(fx) = x$ and $g(y)$ arbitrarily
for $y$ not in the range of $f$.

A function $f\colon X\to Y$ has a _right inverse_ if there exists
$g\colon Y\to X$ with $fg = 1_Y$. If $y\in Y$ then $y = f(gy)$ and $gy\in X$.
A function is _surjective_ if for every $y\in Y$ there exists $x\in X$ with $fx = y$.
Functions with right inverses are surjective.

__Exercise__. _Show if $f$ is surjective then it has a right inverse_.

Hint: Define $h\colon Y\to X$ by $hy = x$ for arbitrary $x\in X$ with $fx = y$.

The left and right inverse of injective and surjective functions are not necessarily unique.
If $f\colon X\to Y$ has left inverse $g$ and right inverse $h$ then $f$ is _invertible_.
A function is _bijective_ if it is injective and surjective.

__Exercise__. _If $f$ is bijective show the left and right inverse are unique_.

Hint: If $g'$ is a left inverse of $f$ then $g'fx = gfx$ for all $x\in X$.
Since $fx = y$ for some $y\in Y$ we have $g' = g$.

If $f\colon X\to Y$ is bijective we write $f^{-1}\colon Y\to X$ for the unique inverse.

__Exercise__. _Show $ff^{-1} = 1_Y$ and $f^{-1}f = 1_X$_.

Define an _equivalence relation_ on sets by $X\sim Y$ if and only if
there is a bijection $f\colon X\to Y$.

__Exercise__. _Show $\sim$ is an equivalence relation_.

Hint: Show $X\sim X$, $X\sim Y$ implies $Y\sim X$, and $X\sim Y$, $Y\sim Z$ imply $X\sim Z$
for sets $X$, $Y$, $Z$.
>>>>>>> 9f6e21cdaa0eab42d71d928b4294ea6a773a1ee9

## Product

The _cartesian product_ of the sets $X_0$ and $X_1$
is equipped with two _projections_ $\pi_i\colon X_0\times X_1\to X_i$, $i=0,1$.
For $x\in X_0\times X_1$ we write $x = (\pi_0 x, \pi_1 x) = (x_0, x_1)$.

__Exercise__. _Show if $p_0\colon Y\to X_0$ and $p_1\colon Y\to X_1$ are functions
then there exists a function $p\colon Y\to X_0\times X_1$ with $p_0 = \pi_0 p$
and $p_1 = \pi_1 p$_.

Hint: Define $p$ by $py = (p_0y, p_1y)$, $y\in Y$.

Functions having this property are called _projections_.
Any set having two projections can be identified with $X_0\times X_1$.

__Exercise__. _If $X$ is a set with projection $p_0\colon X\to X_0$ and
$p_1\colon X\to X_1$ show $X\sim X_0\times X_1$_.

Hint: There exist functions $p\colon X\to X_0\times X_1$ with $p_0 = \pi_0p$
and $p_1 = \pi_1p$ and $q\colon X_0\times X_1\to X$ with $\pi_0 = p_0q$
and $\pi_1 = p_1q$. Show $pq$ is the identity function on $X_0\times X_1$
and $qp$ is the identity function on $X$.

This can be generalized to any collection of indexed sets $X_i$, $i\in I$.
The product $\Pi X_I = \Pi_{i\in I} X_i$ has projections $\pi_i\colon \Pi X_I\to X_i$, $i\in I$.
For $x\in \Pi X_I$ we write $x = (\pi_i x) = (x_i)$, $i\in I$.

__Exercise__. _Show if $p_i\colon Y\to X_i$, $i\in I$ are functions
then there exists a function $p\colon Y\to \Pi X_I$ with $p_i = \pi_i p$, $i\in I$_.

Any set having projections indexed by $I$ can be identified with $\Pi X_I$.

## Exponential

If $X$ and $Y$ are sets then the _exponential_ $Y^X$ is the set of all functions
from $X$ to $Y$, $\{f\colon X\to Y\}$. If $X$ and $Y$ are sets
then $\Pi Y_X\sim Y^X$ in a natural way. Every $y\in\Pi Y_X$ determines
a function $y'\colon X\to Y$ by $y'x = \pi_x y$ and every $y\in Y^X$ determines
an element $y'\in\Pi Y_X$ by $\pi_x y' = yx$.

The $n$-fold cartesian product of the set $Y$ is usually written $Y^n$.
We use the convention $n=\{0,1,\ldots,n-1\}$ to turn $n$ into a set.
APL gives names to things and calls this $\iota n$.
Elements of $X^n$ are called (one-dimensional) arrays and
have the form $x = (x_0,\ldots,x_n-1})$ when $X^n$ is a product
and $x = (x(0),\ldots,x(n-1))$ when $X^n$ is an exponent.

### Each

Given any sets $X$, $Y$, and $Z$, $Z^{X\times Y}$ is isomorphic to $Z^{Y^X}$
via $f(x,y) = z$, $f\in Z^{X\times Y}, if and only if $(gx)y = z$, $g\in Z^{Y^X}$
for $x\in X$, $y\in Y$, $z\in Z$.
Given $f\colon X\to Y$ and any set $Z$
define $f^Z\colon X^Z\to Y^Z$ by $(f^Zx)z = fxz\in Y$ for $x\in X^Z$, $z\in Z$.
We can write this more succinctly as $f^Zx = fx$ to clarify
that left composition can be expressed as a function.

This is called _each_ in APL. Other languages call it _map_ or _appy_.
It acts on arrays by applying $f$ to each
element of the array and we drop the superscript $Z = n$ to get
$f(x_1,\ldots) = (f(x_1),\ldots)$ for $x\in X^n$.
If $x\colon n\to X$ then this is just composition on the left with $f$

### Projection
>>>>>>> 9f6e21cdaa0eab42d71d928b4294ea6a773a1ee9

Given $f\colon X\to Y$ and any set $Z$
define $f_Z\colon Z^Y\to Z^X$ by $(f_Zy)x = yfx\in Z$ for $y\in Z^Y$, $x\in X$.
We can write this more succinctly as $f_Zy = yf$ to
clarify that right composition can be expressed as a functions.
This function maps the index set $X$ to a new index set $Y$. 
If $X = Y$ this map is the projection on the indices $f(X)$.

__Exercise__. _If $f\colon X\to Y$ is bijective, so is $f_Z$_.

If $X = n$ and Y = n$ then $f\colon n\to m$ is defined by $f(i)$, $i\in n$.
We can use function values as the name of the function.
Such function are identified by enclosing the list in square brackets
so, for example, $[2 1](x_0, x_1, x_2) = (x_2, x_1)$, but that looks funny.
In APL the functions on the left are reversed to get the normal
looking $(x_0, x_1, x_3)[2 1] = (x_2, x_1)$

### Curry

For sets $X$, $Y$, and $Z$ we can identify $Z^{X\times Y}$ with $Z^{Y^X}$.
A function $f\in Z^{X\times Y}$ corresponds to $f'\in Z^{Y^X}$
via $f(x,y) = z$ if and only if $(f'x)y = z$, $x\in X$, $y\in Y$, $z\in Z$.
We write this correspondence as $(X\times Y)\to Z \leftrightarrow X\to(Y\to Z)$.
Going from left to right is _currying_ and going from right to left
is _uncurrying_. Currying makes it possible to reduce functions of
multiple variables to functions of a single variable.

## Examples

Let $\RR$ be the real numbers, or their computer approximation: 64-bit
IEEE floating point numbers.  Let $\NN$ be the natural numbers and
$\ZZ$ be the integers. These are represented by unsigned and signed
integers respectively on a computer. They can be categorized by the
number of bits used in their computer representation. Mathematically,
$\NN\subseteq\ZZ\subseteq\RR$ but it gets more complicated when
considering computer implimentations. APL, like most computer languages,
_implicitly promotes_ types to a common type. This leads
to problems like the fact that while 32-bit integers (and even 53-bit
integers) can be exactly represented by 64-bit floating point numbers,
64-bit integers cannot. We will ignore these problems and assume all
numeric values are real numbers.

APL lets you turn a number into a lot of numbers.
The function $\iota$ (iota) is used to produce sequences. If $n\in \NN$ then
$\iota n = (0, 1, \ldots n-1)$.

It is a function from $\NN$ to $\NN^* = \cup_{n\ge 0}\NN^n$, the
set of all finite sequences of natural numbers.
In what follows I will habitually forget to write $\iota n$ and just write $n$.

Using the notation above, the $n\times n$ identity matrix can be written
as $\delta^{n\times n}(n\times n)$ where $\delta\colon\NN\times\NN\to\NN$
is $\delta(i,j) = 1$ if $i = j$ and $\delta(i,j) = 0$ if $i\not= j$.
For any set $Z$, $\delta^Z\colon (A\times A)^Z\to A^Z$. Taking $Z = n\times n$
and $A = n$
gives $\delta^{n\times n}(n\times n) \in n^{n\times n}$. This is
an $n\times n$ matrix taking values $\delta(i,j)$, aka the identity matrix.
APL is parsed right-to-left so we drop the right parentheses to
read $ab$ as $a(b)$. This is natural in a functional language
where statements are chains of function calls.

APL doesn't pussyfoot around and uses $\eq$ instead of $\delta$.

But wait, that's not all! This can be written more succinctly
as $\eq n^2$. Recall $n^2$ is the same as $n\times n$.
If $f\colon X\to Y$ we can
leave out the $Z$ in $f^Z$ if the value of $Z$ can be deduced
from the function arguments. In this case $\delta^{n^2}\colon (A^2)^{n^2}\to A^{n^2}$
and we know $\delta\colon A^2\to A$ so we must have $Z = n^2$.

We can extend $\eq\colon A^k\to A$ by $\eq(a_0,\ldots) = 1$ if all $a_j$ are
equal and 0 otherwise.
The $k$-dimensional identity matrix is $\eq n^k$. If we
define $\from(A, B) = A\from B = A^B$,
then $\eq n\from$ is
a function from $\NN$ to identity matrices having the dimension of the argument.
Further, $\eq\from$ allows us to parameterize over $n$ too since
$\eq(\from(n,k)) = \eq(n^k) = \eq n^k$.

Never play code golf with an APLer.

The basic data type in APL is a multidimensional array in $\RR^{\times n*}$ where
$n^*\in\NN^* = \cup_{n\ge0}\NN$ is a finite sequence of natural numbers
and $\times$ is the cartesian product. If $X$ is a monoid with binary operator
$\otimes$ and identity $1$ we can extend $\otimes\colon X^2\to X$ to
$\otimes\colon X^*\to X$ by defining $\otimes(x_0\ldots, x_n) =
= x_0\otimes\cdots\otimes x_n$.


The 

## Category Theory

We put on our Category Theory spectacles to clarify the fundamental data
structures and transformations between them. The
Curry-Howard-Lambek equivalence shows certain classes of proofs and the $\lambda$-calculus,
are identical to _cartesian closed cateories_.

A CCC has a _product_ and _exponential_. The product behaves like the cartesion product
of sets and the exponential represents functions between sets. Every object $Y$ defines
adjoint functors $F_Y(X) = X\times Y$ and $G_Y(Z) = Z^Y$ that are related by
$\hom(F_Y(X), Z)\cong \hom(X, G_Y(Z))$, which is natural in both $X$ and $Z$.
We write the explict correspondence as $(X\times Y)\to Z\leftrightarrow X\to(Y\to Z)$.
Going from the left to the right form is _currying_. Going from the right to the left
form is _uncurrying_.

The _counit_ of this adjunction is the
_evaluation map_ $e_{Y,Z}\colon Z^Y\times Y\to Z$. It takes a function and
evaluates it at a value in categories that have functions and values.

We can use the evaluation map and currying to define composition using arrows.
If $f\colon X\to Y$ then for any for any object $Z$,
$fe_{X,Z}\colon X^Z \times Z)\to Y$
and $f^Z\colon X^Z\to Y^Z$ is the curried form.
Since $A\times B$ is isomorphic to $B\times A$
we can write $e_{Y,Z}\colon Y\times Z^Y\to Z$
Its curried form is $Y\to (Z^Y)^Z$ so $fe_{Y,Z}\colon X\to (Z^Y)^Z$.
uncurrying give $X\times Z^Y\to Z$ and $X^Z$ ???

In category theory the product of two objects $A_0$ and $A_1$,
$A_0\times A_1$, is defined by two arrows $\pi_0 A_0\times A_1\to A_0$
and $\pi_1\colon A_0\times A_1\to A_1$ that satisfy the property: if
$p_0\colon B\to A_0$ and $p_1\colon B\to A_1$ then there exists an arrow
$p\colon B\to A_0\times A_1$ with $p_0 = \pi_0 p$ and $p_1 \pi_1 p$.

Any object $A'$ with arrows $\pi_0'\colon A'\to A_0$ and $\pi_1'\colon A'\to A_1$
satisfying this property is isomorphic to the product $A_0\times A_1$.
Arrows satisfying this property are called _projections_.

In a CCC the homsets can be identified with an object in the category,
$\hom(A,B)$ can be identified with the exponential $B^A$.
This is the key to functional programming using first-class functions.

The product of $A_0$ and $A_1$ can be written $\Pi_{i\in\{0,1\}} A_i$.
This can be generalized to a product over any index set $I$.
The product $\Pi A_I = \Pi_{i\in I} A_i$ is an object having projections
$\pi_i\colon\Pi A_I\to A_i$.

We can also define products for a single object. Let $\Pi_B A$ be ....
In a CCC $A^B$ is isomorphic to $\Pi_B A$. This generalizes[^1]
the notion $A^B = A\times\cdots\times A$ $B$ times.

[^1] Out the wazoo.

### Set

We only consider the category $\Set$ of sets and functions, which is
a CCC, as we will now prove.  The function $f\colon (X\times Y)\to Z$
corresponds to the function $g\colon X\to (Y\to Z)$ via $f(x,y) = z$
if and only if $g(x)y = (g(x))(y) = z$.  The evaluation function takes
a function $h\colon Y\to Z$ and a value $y\in Y$ to produce $h(y)\in Z$.

If $f\colon X\to Y$ then for any set $Z$, $(f^Z(x))z = f(x(z))$ where
$x\colon Z\to X$ and $(f_Z(y))x = y(f(x))$ where $y\colon Y\to Z$.
We can fly first class and write this as $f^Zx = fx$ and $f_Zy = yf$
to see that composition on either the left or the right can indeed be
expressed as a function.

APL is concerned with products and functions between them (exponentials).
Currying lets us reduce functions on a product to functions of one variable.
Exponents allows us to express functions between objects as another object.
This is the core of any language with first-class functions that can
be passed to other functions as data.

A key relationship between products and exponentials is that $A\times A$
can be identified with $A^2$ where $2 = \{0,1\}$.
The pair $(a_0, a_1)$ corresponds to the function $a(0) = a_0$ and $a(1)
= a_1$.  For any natural number $n\in\NN$, $\Pi_n A$ can be identified
with $A^n$, where $\Pi_n A$ is the $n$-fold cartesian product of $A$. The
correspondence is $(a_i)\in \Pi_n A$ corresponds to $a\in A^n$ via $a(i)
= a_i$, $i\in n = \{0,\ldots,n-1\}$.

__Exercise__. _Show $A$ is in one-to-one correspondence with $A^1$_.

The elements of $A^n$ are
called (one dimensional) _arrays_.  They are sometimes called
vectors, but that collides with the term for elements of a vector space.

APL is quite handy for dealing with linear algebra. An element
of $A^{n\times n}$ corresponds to an $n\times n$ matrix taking
values in $A$. The matrix $(a_{i,j})$, $a_{i,j}\in A$, $0\le i,j < n$,
corresponds to the
function $a\colon n\times n\to A$ via $a(i,j) = a_{i,j}$.

It is even handier when dealing with higher dimensional data.
An $n_0\times\cdots$ dimensional cube taking values in $A$
is just an element of $A^{n_0\times\cdots}$. APL provides
primitives for slicing and dicing along any dimensions.

## Data and Operators
### Shape

The exponential $Y^X$ is the set of all functions from $X\to Y$.
The domain of $f\in Y^X$ is $X$ and its codomain is $Y$.
In APL the _monadic_ $\rho$ operator takes an exponential to its domain.
A better name might be $\log$ since $\rho Y^X = X$.
Note $\rho$ is not a function from $Y^X$ to $X$, it is a functions
from exponentials to sets. For every $f\in Y^X$ we have $\rho f = X$.

...

Given $f\in Y^X$ and $g\in X^W$ the composition $fg\in Y^W$.

composition gives an element $fg\in Y^W$.


## Preliminaries

A _relation_ on the sets $A$ and $B$ is a subset $R\subseteq A\times B$.
It is customary to write $aRb$ for $(a,b)\in R$.  The _right coset_
of $a\in A$ under $R$ is $aR = \{b\in B:aRb\}$ and the _left coset_ of $b\in B$
under $R$ is $Rb = \{a\in A:aRb\}$.  If $X\subseteq A$ we define the _push forward_
of $X$ under $R$ to be $XR = \cup_{x\in X}xR\subseteq B$ If $Y\subseteq B$
the _pull back_ of $Y$ under $R$ is $RY = \cup_{y\in Y}Ry\subseteq A$.
The _domain_ of a relation $R\subseteq A\times B$ is $\dom R = RB$ and the
_range_, or _codomain_, is $\cod R = AR$.

A relation is a _function_ if and only if all right cosets are
singletons. In this case we write $R\colon A\to B$ and $R(a) = b$ for
$aRb$ where $b$ is the unique element of the right coset $aR$.
The push forward of $X\subseteq A$ is written $R(X)$ if $R$ is a function.

If all right cosets are singletons or empty we call $R$ a _partial function_.
Every partial function can be augmented to a function by adding a special
element $\bot\not\in B$ to $B$ and defining $\underline{R}\colon A\to B\cup\{\bot\}$
by $\underline{R}(a) = R(a)$ if $a\in\dom R$ and $\underline{R}(a') = \bot$ if $a'\not\in\dom R$.

## Exponential

If $A$ and $B$ are sets then the _exponential_ is the set of all functions
from $B$ to $A$, $A^B = \{f\colon B\to A\}$.
If $n\in\mathbf{N}$ is a natural numbers we identify it with the set $\{0,\ldots, n - 1\}$
so $A^n = \{(a_1,\ldots,a_n)\colon a_i\in A, 1\le i\le n\}$ represents the
functions $a\colon n\to A$ where $a(i) = a_i$.

## Product

The _cartesian product_ of the sets $A_0$ and $A_1$ is the set of all pairs
of element where the first item belongs to $A_0$ and the second item belongs
to $A_1$, $A_0\times A_1 = \{(a_0,a_1):a_0\in A_0 \text{ and } a_1\in A_1\}$.
It is equipped with two
_projections_ $\pi_0\colon A_0\times A_1\to A_0$ where $\pi_0((a_0,a_1)) = a_0$
and $\pi_1\colon A_0\times A_0\to A_1$ where $\pi_1((a_0,a_1)) = a_1$.

__Exercise__. _Show if $p_0\colon B\to A_0$ and $p_1\colon B\to A_1$ are functions
then there exists a function $p\colon B\to A_0\times A_1$ with $p_0 = \pi_0 p$
and $p_1 = \pi_1 p$_.

Any set having this property can be identified with $A_0\times A_1$.

## Union

The _union_ of the sets $A_0$ and $A_1$ is the collection of elements belonging to either
$A_0$ or $A_1$, $A_0\cup A_1 = \{a:a\in A_0 \text{ or } a\in A_1\}$.
The _disjoint union_ is similar to the union but includes
information about where elements in the union originated.
$A_0\sqcup A_1 = (\{0\}\times A_0)\cup (\{1\}\times A_1)$.
It is equipped with two _inclusions_ $\nu_0\colon A_0\to A_0\sqcup A_1$ by
$\nu_0(a_0) = (0,a_0)$ and $\nu_1\colon A_1\to A_0\sqcup A_1$ by
$\nu_1(a_1) = (1,a_1)$.
Note $A_i$ is in one-to-one correspondence with $\{i\}\times A_i$
via $a_i \leftrightarrow (i, a_i)$ for $a_i\in A_i$, $i = 0,1$.

__Exercise__. _Show if $n_0\colon A_0\to B$ and $n_1\colon A_1\to B$ are functions
then there exists a function $n\colon A_0\sqcup A_1\to B$ with $n_0 = n\nu_0$
and $n_1 = n\nu_1$_.

Any set having this property can be identified with $A_0\sqcup A_1$.

__Exercise__. _Show $a\in A_0\cap A_1$ if and only if $(0,a)$ and $(1,a)$ belong to $A_0\sqcup A_1$_.

Note $A_0\sqcup A_1\subseteq 2\times (A_0\cup A_1)$ where $2 = \{0,1\}$ so the disjoint
union is a relation with $\cod A_0\sqcup A_1 = A_0\cup A_1$.
The left coset of $a\in A_0\cup A_1$ is the set
$(A_0\sqcup A_1)a = \{i\in 2:(i,a)\in A_0\sqcup A_1\}$ so $a\in A_0\cap A_1$
if and only if $(A_0\sqcup A_1)a = 2$.

The disjoint union defines a function $A_0\cup A_1\to\mathcal{P}(2)$
by $a\mapsto (A_0\sqcup A_1)a$. The intersection is the pull back of
$2 = \{0,1\}\in\mathcal{P}(2)$.

## Pair

A _pair_ in $A_0\times A_1$ can be identified with an element $a\in (A_0\sqcup A_1)^2$.
The pair $a = (a_0,a_1)$  corresponds to the function with $a(0) = (0,a_0)$
and $a(1) = (1,a_1)$. Note that not every function in $(A_0\sqcup A_1)^2$
corresponds to a pair. The function $a\in(A_0\sqcup A_1)^2$ comes from a pair
if and only if $a(0)\in \{0\}\times A_0$ and $a(1)\in \{1\}\times A_1$.

If $A_0 = A_1 = A$ then $A\times A$ is in one-to-one correspondence with $A^2$.
The pair $(a_0,a_1)$ corresponds to the function $a\in A^2$ defined by
$a(0) = a_0$ and $a(1) = a_1$.

It is not the case $A\times A$ is in one-to-one correspondence with $(A\sqcup A)^2$.

__Exercise__. _Show $A\sqcup A = 2\times A$_.

## Tuple

Products and unions can be defined for any collection of sets $X_i$, $i\in I$.
The product $\Pi X_I = \Pi_{i\in I} X_i$ has projections $\pi_i\colon \Pi X_I\to X_i$
where $\pi_i(x) = x_i$, $i\in I$.  The elements of a cartesian product are called _tuples_.

__Exercise__. _Show if $p_i\colon Y\to X_i$, $i\in I$, are functions then there exists a function
$p\colon Y\to\Pi X_I$ with $p_i = \pi_i p$_.

If $f_i\colon X_i\to X_i$, $i\in I$, then $\Pi_{i\in I} = \Pi f_I\colon \Pi X_I\to \Pi X_I$
by $(x_i)\mapsto (f_i(x_i))$, $i\in I$. In terms of projections $\pi_i\Pi f_I = f_i\pi_i$.

More generally, if $Y_j$, $j\in J$ is another collection of sets and $\sigma\colon I\to J$
then we get a map $\Pi f_{I,\sigma}\colon \Pi X_I\to \Pi Y_J$
by $x\mapsto x\sigma$ where $(x_i)\mapsto (y_{\sigma(i})$.
In terms of projections this is $\pi_j^Y x\sigma = 

Every function $\sigma\colon I\to I$ induces a map $\Pi X_I\to \Pi X_{\sigma(I)}$
by $x\mapsto x\sigma$ where $(x_i)\mapsto (x_{\sigma(i)}$).

__Exercise__. _If $\sigma$ is bijective then $\Pi X_I$ and $\Pi X_{\sigma(I)}$
are isomorphic_.

In particular $X_0\times X_1$ is isomorphic to $X_1\times X_0$. We say
cartesian products are commutative up to isomorphism.




We can define projections $\pi_J\colon \Pi X_I\to \Pi X_J$ for $J\subseteq I$
by $\pi_J = \Pi_{j\in J}\pi_j$.

It is also the case $X_0\times(X_1\times X_2)$ and $(X_0\times X_1)\times X_2$
are isomorphic to $X_0\times X_1\times X_2$. We say cartesian products are
associative up to isomorphism. This can be proved using the properties of projections.

If $p_i\colon Y\to X_i$, $i = 0,1,2$, there exists a map $q\colon Y\to X_1\times X_2$
with $p_i = \pi_i q$, $q = 1,2$,
hence there also exists a map $r\colon Y\to X_0\times(X_1\times X_2)$
with $pi_0 = \pi_0 r$ and $r = \pi_{12) r$ where $\pi_{12}$ is the projection
for the se
This shows $X_0\times(X_1\times X_2)$ is isomorphic to $X_0\times X_1\times X_2$.

We can identify $\Pi X_I$ with a subset of $(\sqcup X_I)^I$
via $x\leftrightarrow\underline{x}$ where $\underline{x}(i) = (i,\pi_i x)$.
If $\sigma\colon I\to I$ then the composition $\underline{x}\sigma$
belongs to $(\sqcup X_I)^I$.
Since $(\underline{x}\sigma)(i) = (\sigma(i),\pi_{\sigma(i)} x)$ this
restricts to a mapping $\Pi X_I\to \Pi X_{\sigma(I)}$.

The disjoint union is $\sqcup X_I = \cup_{i\in I} \{i\}\times X_i$ with inclusions
$\nu_i\colon X_i\to\sqcup X_I$ where $\nu_i(x_i) = (i, x_i)$, $i\in I$.

__Exercise__. _Show if $n_i\colon X_i\to Y$, $i\in I$, are functions then there exists a function
$n\colon\sqcup X_I\to Y$ with $n_i = n\nu_i$_.

Cartesian product is commutative and associative-ish.

## Curry

Exponentials and cartesian products have the property that every function
$f\colon A\times B\to C$ corresponds to a function $g\colon A\to C^B$
via $f(a,b) = c$ if and only if $g(a)(b) = (g(a))(b) = c$. This is called _currying_
and the reverse process is _uncurrying_. Using $B\to A$ for $A^B$ this
becomes $g\colon A\to (B\to C)$.

In general, if $f\colon\Pi X_I\to Y$ we can curry on $J\subseteq I$ to
get $f_J\colon\Pi X_J\to (\Pi X_{I\setminus J} \to Y)$.

We write $f(a,-)\colon B\to C$ when currying the second argument and
$f(-,b)\colon A\to C$ when currying the first argument. Using this
notation $f = f(-,-)$.

## Application

Given functions $f_i\colon X_i\to Y_i$ define _componentwise
application_ by $\Pi f_I\colon \Pi X_I\to \Pi Y_I$ where
$\pi_i^Y(\Pi f_I(x)) = f_i(\pi_i^X(x))$ or more simply,
$\pi_i^Y(\Pi f_I) = f_i\pi_i^X$.

More generally, if $\sigma\colon I\to J$ and $f_i\colon X_i\to
Y_{\sigma(i)}$ then $\Pi f_{I,\sigma}\colon X_I\to Y_{\sigma(I)}$ by
$\pi_{\sigma(i)}^Y(\Pi f_{I,\sigma}) = f_i \pi_i^X$.

If we want to be more careful about notation, as Iverson was, we should distinguish between
a function $f\colon A\to B$ and its _push forward_ $f^*\colon\mathcal{P}(A)\to\mathcal{P}(B)$
defined by $f^*(S) = \{f(s):s\in S\}\subseteq B$ for $S\subseteq A$ where
the _power set_ of $A$ is the set of all subsets of $A$, $\mathcal{P}(A) = \{S\subseteq A\}$.
Similarly, the _pull back_ of $f$ is $f_*\colon\mathcal{P}(B)\to\mathcal{P}(A)$
defined by $f_*(T) = \{s\in A:f(s)\in T\}\subseteq A$ for $T\subseteq B$.

If all $X_i$ have the common data type $X$ and $f\colon X\to Y$ we can apply the single
function $f$ to all components $f_\_\colon X_I\to Y_I$ so $f_\_(x)(i) = f(x_i)$.
In APL this is written using diaeresis $f_\_ = f¨$.


The disjoint union $\sqcup X_I = \sqcup_{i\in I}(\{i\}\times X_i)$
has inclusions $\nu_i\colon X_i\to \sqcup X_I$ where $\nu_i(x_i) = (i, x_i)$.

An element $x\in\Pi X_I$ corresponds to a function $I\to\sqcup X_I$
where $x(i) = (i,\pi_i(x))$.
An element $x\in\sqcup X_I$ corresponds to a function $I\to\sqcup X_I$
where $x(i) = (i, x_i)$.

Elements of a product are _tuples_. If all the sets in the product
are the same we call the element an _array_. They are sometimes called
vectors, but that collides with the term for elements of a vector space.

If $J\subseteq I$ let $\pi_{J}\colon X_I\to X_J$ be the _projection_ that
selects elements of $J$. If $I = n$ we write $\pi_j$ instead of $\pi_{\{j\}}$ for $j\in n$.
A _pointed set_ is a set $X$ with a special element $\star\in X$.
If the $X_i$ are pointed sets we can define the _injection_ $\nu{J}\colon X_J\to X_I$ by
replacing missing indices with the $\star$ for $X_i$, $i\not\in J$.
In APL this is written using the _backslash_ operator $J\setminus = \nu$.


A _data type_ is a set $X$ together with a collection of operations involving $X$.
We assume $X$ is finite in what follows since we
are concerned with computer implementation.
Given data types from some index set $X_i$, $i\in I$,
their cartesian product is $X_I = \Pi_{i\in I}X_i$. The projections
$\pi_i\colon X_I\to X_i$ are defined by $\pi_i(x) = x_i$ for
$x\in X_I$. 

## One Dimension

### Sequence

The set of all sequences from $X$ is $X^* = \cup_{n\in \mathbf{N}} X^n$.
Each element has the form $(x_0,\ldots,x_{n-1})$ for $x_i\in X$ but
it does not necessarily mean all elements are stored somewhere.
The unary operator `?:X^* -> bool` tests if a seqence is not empty.
The binary operator `@`
returns the first element of the sequence.
More generally, `@:N x X^* -> X` returns the $n$-th element
and is called _pick_. Its default argument is `0`.
Use `n @` to return the $n$-th element.
The operator `<` removes
the first element of the sequence and is called _take_. Use `n <` to remove the first
$n$ elements.

Let `s:N -> N`, then `xs` is `xs(i) = x(s(i))`.

### Iota

We have been using the convention that the natural number $n$ represents the
set $\{0,1,\ldots,n-1\}$. In APL this is given the name $\iota n$.

The function _take_ is $\uparrow \mathbf{N}\times X^{\iota n}\to X


# Reduce

If a data type $X$ is an _abelian monoid_ then we can define a measure on the
$\mathcal{P}(X)$ by $\oplus(\{x_j\})
= \oplus_j x_j$ where $\oplus$ is the binary monoid operation
and $\oplus(\emptyset) = 0$ is the identity element of the monoid.
Monoids are pointed sets with their identity being the special element.

Every abelian group is a moniod if we ignore the condition that groups
are required to have inverses. Monoids are only required to have an
associative and commutative binary operation, and an identity element.
Addition and multiplication of numbers are abelian groups.
The set $[-\infty,\infty)$ with binary
operation $x\vee y = \max\{x,y\}$ is an abelian monoid with identity
$-\infty$.  Similarly, $(-\infty,\infty]$ with $x\wedge y = \min\{x,y\}$
and identity $\infty$ is an abelian monoid.

__Exercise__. _Show $\oplus(\{s_j\}) = \oplus_j s_j$ is a well-defined measure on $X$_.

Technically we should write this as $\oplus(\{(j, s_j)\}) = \oplus_j s_j$
to avoid collapsing set elements.

Hint: Since monoid operations are associative and commutative
$\oplus(\{x_1,\ldots,x_n\}) = x_1\oplus\cdots\oplus x_n$ is well-defined.
You need to show $\oplus(U\cup V) = (\oplus(U))\oplus(\oplus(V))$ if
$U\cap V = \emptyset$ for $U,V\subseteq X$.
Start with $\oplus(U\cup \emptyset) = \oplus(U) =
(\oplus(U))\oplus 0 = (\oplus(U))\oplus(\oplus\emptyset)$ and use induction
on the number of elements of $V$.

If $R\in X^n$ then $\oplus R$ is an element of $X$. If $R\in X_I^n$
is a table and $X_i$ is an abelian monoid we can apply its operation at index $i$
to get $\oplus_i R\in X_I^n$ where the rows of $R$ have their $i-th$
component replaced by the constant value $\oplus R_{\{i\}}$.
This is called _reduction_ along column $i$ and in APL it is written using
the _forward slash_ operator $\oplus_i/R$.

## Expand

If an abelian monoid has a total ordering that is discrete with elements
$0 = x_0 < x_1 < \cdots $ define $\iota\colon \mathbf{N}\to $X^\infty$
by $\iota n = (x_0,\ldots,x_n)$.

## Notation

tuple $\Pi_{i\in I} X_i\subseteq (\sqcup_{i\in I} X_i)^I$.

projection $\pi_i\colon\Pi_{i\in I} X_i\to X_i$ where $\pi_i(x) = x_i$.

array $X^I$

## Remarks

A pair $(a,b)$ must satisfy the property $(a,b) = (c,d)$ if and only
if $a = c$ and $b = d$.  Everything in mathematics is a set. What
set is the pair $(a,b)$?  This is a subtle problem with no unique
solution. Kuratowski defined it to be the set $\langle a,b\rangle
= \{\{a\},\{a,b\}\}$.  Clearly if $a = c$ and $b = d$ then $\langle
a,b\rangle$ and $\langle c,d\rangle$ are equal sets. The other direction
is not so trivial. If $a = b$ then $\langle a,b\rangle
=\{\{a\},\{a,a\}\} = \{\{a\},\{a\}\} = \{\{a\}\}$ so $\langle c,d\rangle$
must be a singleton and $\{c\} = \{c,d\}$. This can only
be true if $c = d$, hence $\{a\} = \{c\}$ and $a = c$.

__Exercise__. _Prove the case $a\not= b$_.

Category Theory uses _objects_ and _arrows_ instead of sets.  The
_product_ of sets is defined in terms of objects and arrows.  An object
$C$ with arrows $p\colon C\to A$ and $q\colon C\to B$ is the product of
$A$ and $B$ if and only if for every object $D$ having arrows $r\colon
D\to A$ and $s\colon D\to B$ there exists an arrow $t\colon D\to C$
with $rt = p$ and $st = q$. The product is unique up to isomorphism.

Objects do not have elements in Category Theory, everything must be
defined in terms of objects and arrows. In the category Set we
can define all subsets of the object $S$ as $\hom(S,\{0,1\})$,
the arrows $a\colon S\to\{0,1\}$.
The arrow corresponds to the subset $A = \{s\in S:a(s) = 1\}$.

A _terminal object_ is an object
that always has exactly one arrow from any other object.  In category
Set the terminal objects are singletons and the corresponding arrow can
be thought of as selecting an element from its domain.
If $a\in\hom(S,\{0,1\})$ is terminal then it corresponds to picking
one element from $A$.

The "pairs" of $C$ are terminal objects having domain $C$.
Let $t\colon C\to T$ and $t'\colon C\to T'$ be the unique arrows for $T$ and $T'$.
We also have unique arrows $a\colon A\to T$, $a'\colon A\to T'$
and $b\colon B\to T$, $b'\colon B\to T'$. Since $ap\colon C\to T$
and $a'p\colon C\to T$ we have $ap = a'p$. Likewise $bq = b'q$.


...product as terminal object...
-->
