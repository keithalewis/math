---
title: APL
author: Keith A. Lewis
institute: KALX, LLC
classoption: fleqn
fleqn: true
abstract: A Programming Language
...

\newcommand\BB{\bm{B}}
\newcommand\CC{\bm{C}}
\newcommand\FF{\bm{F}}
\newcommand\NN{\bm{N}}
\newcommand\RR{\bm{R}}
\newcommand\SS{\bm{S}}
\newcommand\ZZ{\bm{Z}}
\newcommand\span{\operatorname{span}}
\newcommand\dom{\operatorname{dom}}
\newcommand\cod{\operatorname{cod}}
\newcommand\hom{\operatorname{hom}}
\newcommand\ran{\operatorname{ran}}
\newcommand\cat[1]{\mathbf{#1}}
\newcommand\o[1]{\overline{#1}}
\newcommand\eq{\text{$=$}}
\newcommand\from{\widehat{\phantom{x}}}
\newcommand\To{\Rightarrow}
\newcommand\From{\Leftarrow}
\newcommand\fold{/}
\newcommand\scan{\backslash}



> _APL is a mistake carried through to perfection_ &mdash; Edsgar W. Dijkstra

> _Such is the advantage of a well constructed language that its simplified
> notation often becomes the source of profound theories_.
>  &mdash; Pierre-Simon Laplace

A Programming Language _APL_ was invented by Ken E. Iverson, a
mathematician unsatisfied by the limited expressiveness of early versions
of FORTRAN when it came to manipulating multidimensional arrays. Modern
[Fortran](https://wg5-fortran.org/) is much more popular than APL and
incorporates many of Iverson's ideas. Maybe it should incorporate more.

What follows is a mathematical description of the objects and operations
on them he envisioned to scratch that itch.  It is simply a matter
of giving explicit names to the operations that can be performed
on collections of data, what Iverson called [Notation as a Tool of
Thought](https://www.eecg.toronto.edu/~jzhu/csc326/readings/iverson.pdf)

There have been many languages inspired by APL and this write-up takes
liberties with the classical language. Let's agree to call it TPL, This
Programming Language.  Our approach is informed by category theory and
best practices for implementing functional languages on current computer
architectures.  We take a purely functional view so no side effects are
allowed and data cannot be mutated.  Similar to Everett's many-worlds
interpretation of quantum mechanics, this makes it easy to reason about
programs mathematically, but can be computationally expensive on computers.
Using lazy evaluation, [optics](optics.html), and other implementation
techniques can help with that.

The _primitive types_ are booleans, natural numbers, integers, real
numbers, and characters.  The _types_ in TPL are [_categories_](cat.html)
constructed from primitive types using (disjoint) unions, Cartesian
products, and exponentials.

Note the real numbers $\RR$ form a one dimensional vector space.
_Strings_ are zero or more characters and form a _monoid_ under the
binary operation of concatenation with the empty string as identity.

The two main concepts of TPL are composition of functions and vector space duality.
It is just a matter of providing a language to manipulate sums, products,
and exponentials in the appropriate categories.

## Categories

Categories have _objects_ and _arrows_. An arrow $f$ from object $X$
to object $Y$ is denoted $f\colon X\to Y$.
The _domain_ of $f$ is $X = \dom f$ and the _codomain_ of $f$ is $Y = \cod f$.
If $f\colon X\to Y$ and $g\colon Y\to Z$ then there exists a
unique arrow $gf\colon X\to Z$ called the _composition_
of $f$ followed by $g$.

Arrows are _associative_, $(fg)h = f(gh)$, so $fgh$ is unambiguous.
Every object $Y$ has an _identity_ arrow $1_Y\colon Y\to Y$ with
$1_Yf = f$ for all $f\colon X\to Y$ and $g1_y = g$ for all $g\colon Y\to Z$.

The arrows from the object $X$ to the object $Y$ are denoted $(X\to Y)$.
This is also called the _homset_ $\hom(X,Y)$.

Given an arrow $f\colon X\to Y$ and an object $Z$
define _left composition_ $f^Z\colon (Z\to X)\to (Z\to Y)$ by
$f^Zx = fx\in (Z\to Y)$ for $x\in (X\to Z)$
and _right composition_ $f_Z\colon (Y\to Z)\to (X\to Z)$ by
$f_Zy = yf\in (X\to Z)$ for $y\in (Z\to Y)$.

### Sum

The _sum_ $\Sigma_{i\in I} X_i = \Sigma X_I$ of $X_i$, is defined by
arrows $\nu_i\colon X_i\to\Sigma X_I$, $i\in I$. If for any arrows
$n_i\colon X_i\to Y$ there exists an arrow
$n\colon\Sigma X_I\to Y$ with $n\nu_i = n_i$, $i\in I$.
The sum of $X$ and $Y$ is denoted $X + Y$.

### Product

The _product_ $\Pi_{i\in I} X_i = \Pi X_I$ of $X_i$ is defined by
arrows $\pi_i\colon \Pi X_I\to X_i$, $i\in I$. If for any arrows
$p_i\colon Y\to X_i$ there exists an arrow
$p\colon Y\to \Pi X_I$ with $\pi_ip = p_i$, $i\in I$.
The product of $X$ and $Y$ is denoted $X\times Y$.

### Exponential

If a category has products the _exponential_ $Z^Y$ is an object $\langle
Y\to Z\rangle$ and an _evaluation_ arrow
$e\colon Y\times\langle Y\to Z\rangle\to Z$. 
Note $\langle Y\to Z\rangle$ might not be the same as $(Y\to Z)$.
The evaluation arrow satisfies the condition that any
arrow $f\colon X\times Y\to Z$ corresponds to a unique arrow
$f_X\colon X\to\langle Y\to Z\rangle$ via ...

## Set

We use the convention that applying a function to an element of a set
is right associative so $f(x)$ can be written $fx$.
This is natural in languages where composition means function application.
Applying a function to an element of a set causes a slight problem.
$fgh(x) = f(g(h(x))$ but $(fg)(h(x))\not= f(g(h(x)))$.

$\cat{Set}$ is _Cartesian closed_ &ndash; It has products and exponentials
that satisfy $Z^{X\times Y}\cong Z^{Y^X}$. 
The _Cartesian product_ of sets $X$ and $Y$
$X\times Y = \{(x,y):x\in X, y\in Y\}$ is the set of all pairs of elements from each set.
The _exponential_ $Y^X = \{f\colon X\to Y\}$ is the set of functions
from $X$ to $Y$. We write $Y^X$ in linear notation as $X\to Y$ or $Y\leftarrow X$.

Products and exponentials are related by $Z^{X\times Y}$ is in one-to-one
correspondence with $Z^{Y^X}$.[^1] Every $f\in Z^{X\times Y}$ corresponds
to $g\in Z^{Y^X}$ via $f(x,y) = z$ if and only if $g(x)(y) = (gx)y = z$,
$x\in X$, $y\in Y$, $z\in Z$.
This correspondence can be written
$$
	(X\times Y)\to Z \cong X\to(Y\to Z)
$$
Going from left to right is _currying_ and going from right to left
is _uncurrying_.

$e(f,x) = f(x)$, $f\in Y^X$, $x\in X$. It is just an explicit
name for _function application_. The curried form of the evaluation
map identifies $Y^X$ with $X\to Y$.

[^1]: In fancy pants category theory language this is expressed as
the product functor $F_Y(X) = X\times Y$ and the exponential functor
$G_Y(Z) = Z^Y$ are adjoint: $\hom(F_Y(X),Z)\cong\hom(X,G_Y(Z))$.

Product and disjoint union are related by $\Pi_{j\in J} X^{I_j}\cong X^{\sqcup_{j\in J} I_j}$
where $X$ is any set and $(I_j)_{j\in J}$ is any indexed collection of sets
&ndash; the product of exponentials is the exponential of the sum.
The element $x\in\Pi_{j\in J} X^{I_j}$ corresponds to $\o{x}\in  X^{\sqcup_{j\in J} I_j}$
via $\pi_j x = \o{x}\nu_j$ where $\pi_j\colon\Pi_{j\in J}\to X_j$ are the projection
defining the product and $\nu_j\colon X_j\to\sqcup_{j\in J}$ are the injections defining
the disjoint sum.
If $I_j = \{j\}$, $j\in J$, this becomes $X_J = \Pi_{j\in J} X\cong X^J$.
The element $x = (x_j)\in X_J$ corresponds to $\o{x}\in X^J$
via $x_j = \o{x}(j)$, $j\in J$.

We use $n\in\NN$ for the set $\{0,1,\ldots,n-1\}$. From above, we
can identify $x\colon n\to X$ with an element of $X^n$.
A function $\xi\colon X\to n$ corresponds to a _partition_ of $X$ into $n$
_atoms_ $X_i = \{x\in X: \xi(x) = i\}$, $i\in n$. This partition is also called
the _kernel_ of $\xi$.

__Exercise__. _Show $X_i\cap X_j = \emptyset$ if $i\not= j$ and $\cup_i X_i = X$_.

A function $s\colon X\to\BB$ determines a subset of $X$ (and its complement)
by $S = \{x\in X:s(x) = t\}$ so $X\setminus S = \{x\in X:s(x) = f\}$.

### Vec

Vector spaces and linear tranformations are the objects and arrows of
the category $\cat{Vec}$.  The identities are written $I_V$ instead of
$1_V$. We write  $V\To W$ for the arrows in $W^V$ that
preserve the vector space structure.[^2] This is also written
$\mathcal{L}(V,W)$ or $\hom_{\cat{Vec}}(V, W)$ and the elements
are called _homomorphisms_. Note $V\To W$ is also a vector space
where addition and scalar multiplication are defined pointwise;
if $S,T\colon V\To W$ then
$(S + T)v = Sv + Tv\in W$ and $a(S + T)v = a(Sv) + a(Tv)\in W$, $v\in V$, $a\in\FF$.

[^2]: If $T\colon V\To W$ is a linear transformation in $\cat{Vec}$ we
write $\{T\}\colon \{V\}\to\{W\}$ in $\cat{Set}$ for the corresponding
function on the underlying sets of the vector spaces.  This is the
_forgetful functor_ $\{\}\colon\cat{Vec}\to\cat{Set}$.  There is
also the _free functor_ $\langle\rangle\colon\cat{Set}\to\cat{Vec}$
defined by $X\subseteq V\mapsto \langle X\rangle = \span\{\delta_x:x\in
X\}\subseteq B(X)$ where $B(X)$ is the vector space of bounded functions
on $X$ and $\delta_x(y) = 1$ if $y = x$ and $\delta_x(y) = 0$ if $y\not=
x$, $x,y\in X$. A function on sets $t\colon X\to Y$ can be extended to
$\langle t\rangle\colon \langle X\rangle\to\langle Y\rangle$ by extending
it linearly. Since $\{\delta_x:x\in X\}\subseteq B(X)$ are independent
this extension is well-defined.
Show $\{V\}\To X\cong V\To\langle X\rangle$ for $V$ a vector
space and $X$ a set.

The _dual_ $V^*$ of the vector space $V$ is $V\To \FF$ where $\FF$ is the
one-dimensional vector space consisting of the underlying field.
The _dual pairing_ is $\langle v,v^*\rangle = v^*v\in\FF$, $v\in V$, $v^*\in V^*$.
A linear transformation $T\colon V\To W$ has a dual $T^*\colon W^*\To V^*$ defined by
$\langle Tv, w^*\rangle = \langle v, T^*w^\rangle$.
This defines a _functor_ on $\cat{Vec}$.

__Exercise__. _What is the dual of $V\To W$_?

There is a natural injection $\nu_V = \nu\colon V\To V^{**}$ defined by 
$\langle \nu v, v^*\rangle = \langle v, v^*\rangle$. 
If $V$ is finite dimensional then $\nu$ is an isomorphism.

__Exercise__ _If $T\colon V\To W$ show $T^{**}\nu_V = \nu_W T$_.

If $V = \FF^n$ then $V^*$ is isomorphic to $V = \FF^n$ via the identity map with the
dual pairing $\langle v, w^*\rangle = v\cdot w^*$ where $w^*$ is the image of $w$
considered as an element of $V^*$.
We eschew the 2-dimensionally biased notion of "row" and "column" vectors
since duality allows us to generalize to any number of dimensions.
As we will soon see, inner, outer, matrix, etc. products 
are simply composition of linear operators.

The _tensor product_ of vectors $v\in V$ and $w\in W$ is $v\otimes w\colon W^*\To V$
defined by $(v\otimes w)w^* = v\langle w,w^*\rangle = (w^*w)v\in V$, $w^*\in W^*$.

The _tensor product_ of vector spaces $V$ and $W$, $V\otimes W$, is
the smallest subspace of $W\To V$ containing $v\otimes w$, $v\in V$, $w\in W$.

__Exercise__. _What is the dual of $V\otimes W$_?

$\cat{Vec}$ is cartesian closed: $(V\otimes W)\To U\cong V\To(W\To U)$.
If $T\colon(V\otimes W)\To U$ define $\o{T}\colon V\To (W\To U)$
by $((\o{T}v)w)u^* = T(v\otimes w)u^*$, $v\in V$, $w\in W$, $u^*\in U^*$.
If $\o{T}\colon V\To (W\To U)$ define $\o{\o{T}}\colon (V\otimes W)\To U$
by $\o{\o{T}}(v\otimes w)u^* = ((\o{T}v)w)u^*$.

__Exercise__. _Show $T\to\o{T}\in ((V\otimes W)\To U)\to (V\To (W\To U))$
is well-defined and linear_.

__Exercise__. _Show $\o{T}\to\o{\o{T}}\in (V\To (W\To U))\to ((V\otimes W)\To U)$
is well-defined and linear_.

__Exercise__. _Show $\o{\o{T}} = T$ and $\o{\o{\o{T}}} = \o{T}$_.

Taking $U = \FF$ shows $(V\otimes W)^*\cong (V\To W^*)$.

## Tensor

A _tensor_ (over the vector space $V$) is a multi-dimensional array $a\in X^{\Pi_j n_j}$, $n_j\in\NN$.

## Computer

A _program_ takes a stream of characters and outputs a stream of characters.
It can give names to types appended to a read only store and use names to produce output.
We only assume that there is an encoding and decoding from and to characters for
all primitive types. We use $t > s$ to encode the primatve $t$ and give it the name $s$
and $t < s$ retrieve the name $s$ into the type $t$.

Encoding is a function $E\colon T\times\CC^*\to T$.
For example, $E(\RR, "1.23") = 1.23$ and write `R"1.23"` for the left-hand side.
E.g., `N"123"` is $123\in\NN$ and `S("ab\"c")` is $('a', 'b', '"', 'c')\in\CC^*$.

We assume unique string representations for all types.

Decoding is a function $D\colon T\to\CC^*$.
for example $D(1.23)$ is `"1.23"`.

A type is either a primitive type, a (disjoint) sum of types, or a product of types.
A sum of types is a _variant_.
A product of types is a _tuple_. Tuples with two elements are _pairs_.
A _dictionary_ is a sum of pairs having the same type with distinct first elements.

### Reshape

The function $\rho = \rho_{n_0,...,n_{k-1}}\colon\iota
n_0\times\cdots\times\iota n_{k-1}\to\iota n_0\cdots n_{k-1}$ is
defined by $\rho(i_0, i_1, \ldots, i_{k-1}) = i_0 + n_0(\rho(i_1,
\ldots, n_{k-1}))$.

Every element $x\in X^n$ corresponds to a function $x\colon\iota n\to X$.
The composition $x\rho\colon n_0\times\cdots\times\iota n_{k-1}\to X$
reshapes $x$.

### Fork

Same as $S$ combinator? $Sxyz = xz(yx)$ using left association.

### Each

If $f\colon X\to Y$ and $x\colon Z\to X$ then $fx\colon Z\to Y$.
This can be viewed as a function $f^Z\colon X^Z\to Y^Z$.
It is common to call this _apply_ or _map_ or _fmap_, but in APL
it is called _each_. With $X^Z$ and $Y^Z$ as products,
$x\mapsto fx$ where $(fx)_z = f(x_z)$

### Index

If $y\colon Y\to Z$ and $f\colon X\to Y$ then $yf\colon X\to Z$.
This can be viewed as a function $f_Z\colon Z^Y\to Z^X$.  It is
common to call this _projection_, but in APL it is called _index_.
With $Z^Y$ and $Z^X$ as products, $y\mapsto yf$ where $(yf)_x = y_{fx}$.
If $X\subseteq Y$ and $f\colon X\to Y$ is the inclusion map
then $Z^Y\to Z^X$ is the projection $\Pi Z_Y\to \Pi Z_X$.
If we write the inclusion map as $[X]$ then $y[X]$ selects
the $X$ indices from $y = y[Y]$.

APL is primarily concerned with arrays $X^{n_0\times\cdots n_{m-1}}$
and giving names to the functions operating on those.
Most often $X$ is $\RR$, the set of real numbers,
but $X$ can also be a set of characters.

## Example

The identity function $1_X$ is written '=' in APL.

APL lets you turn a number into a lot of numbers.  The function $\iota$
(iota) is used to produce sequences. If $n\in \NN$ then $\iota n = (0,
1, \ldots n-1)$ where $\NN$ is the set of natural numbers. It
is related to our convention $n = \{0,\ldots, n-1\}$ but
$\iota n$ is not equal to $n$, it is an element of $\NN^n$.
Note $(\iota n)_i = i$, $i\in n$ so $\iota n$ is the identity function
on $n$.

In two dimensions the $n\times n$ identity matrix is
$(\delta_{ij})_{i,j\in n}\in \NN^{n\times n}$. In APL
it is $\delta$ applied to each element of $n\times n$.
The elements of $n\times n$ are $\{(i,j):i,j\in n\}$ so
$\delta n\times n = \{\delta(i,j):(i,j)\in n\times n\}$.

We can define $\delta\colon X^n\to X$ for any $n$
by $\delta(x_0,\ldots,x_n-1) = 1$ if all $x_i$ are equal and $0$ otherwise.
We should probably use `true` and `false` instead of $1$ and $0$.
If we use $X$ as the name of the _type conversion_ function
`true`$\mapsto 1$ and `false`$\mapsto 0$
we would write $X(\delta)$, or $X\delta$, instead of $\delta$.

In APL we use $\eq$ instead of pussyfooting around with $\delta$.
This can be written more succinctly
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
$\bullet/\colon X^n\to X$ for $n > 2$
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

### Dimension

The main datatype in APL is a _multi-dimensional array_ $X^{n_0\times\cdots n_{m-1}}$.
The _shape_ of the array is $n_0\times\cdots n_{m-1}$. It is a function from exponentials
to sets defined by $\rho X^Y = Y$.
Every $f\in X^Y$ is a function $f\colon X\to Y$ so $\rho$ is a constant function,
$\rho f = Y$ for all $f\in X^Y$.

## Remarks

Notation $x = (x_0, \ldots)$ for numeric vectors but for s = "ABC" has indices from high to low.

Distinguish between an _expression_ and the result of _evaluating_ the expression.
($e$ vs $!e$ maybe?) Need a language for the machine.

$\Pi X_I = \Pi_{i\in I} X_i$, $\pi_i\colon\Pi X_I\to X_i$, $\pi_i(x) = x_i$  projections.

If $X = X_i$, $i\in I$ then $X_I = \Pi X_I = \Pi_{i\in I} X\cong X^I$
via $x = (x_i)\in \Pi X_I$ corresponds to $\hat{x}\in X^I$ via $x_i = \hat{x}(i)$. 
More generally, $\Pi_{i\in I} X_{I_i}\cong X^{\sqcup_{i\in I} I_i}$
via $x = (x_i)\in \Pi_I X_{I_i}$ correspoinds to $\hat{x}\in X^I$ via $x_i = \hat{x}(i)$. 
via $x_{i_j} = x(i_j)$, $i_j\in I_j$
shows the fundamental relationship between product and disjoint sum.

If $f\colon X\to Y$ then $f^Z\colon X^Z\to Y^Z$ via $f^Zx = fx$
and $f_Z\colon Z^Y\to Z^X$ via $f_Zy = yf$.

via $(x_j)\leftrightarrow x$ for $x_j\in X^{I_j}$ where $x(i_j) = x_j(i)$, for $i_j = (j,i)\in \sqcup_j I_j$.

Indices: If $\sigma\colon m\to n$ then $\sigma_X\colon X^n\to X^m$ via
$x\in X^n\mapsto x\sigma\in X^m$. We write $\sigma = (\sigma_i)$
where $\sigma(i) = \sigma_i\in n$ for $i\in m$.

For example, if $f\colon X^2\to Y$ then $f(1,0)\colon X^2\to Y$ via
$f(0,1)(x_0,x_1) = f(x_1,x_0)$. If $f\colon X^2\to Y$ then $f(0,0)\colon X\to Y$
via $f(0,0)(x) = f(x, x)$.

Currying: If $f\colon X^I\to Y$ and $J\subseteq I$ define
$?\colon I\to I$ by $X^{I\setminus J}\times X^J\to X^I$

$f\colon\Pi X_n\to Y$ 

If $J\subseteq I$ and $[J]\colon J\to I$ is inclusion then $y[J]\in X_J$ projects $y\in X_I$ to $X_J$.

Currying: $X\times Y\to Z\cong (Z^Y)^X$ via $f(x,y) = z$ iff $(fx)y = z$.

## [A History of APL in 50 functions](https://www.jsoftware.com/papers/50/)

One funny thing about vector spaces is they are completely classified
by their dimension. Two vector spaces are isomorphic if and
only if they have the same dimiension. This is unlike any other
mathematical type.

Sxyz = xz(xz)

$\RR^I = \{x\colon I\to\RR\}$. 

\Pi_I \RR = \{(x_i)\mid x_i\in\RR\}$

scan right to left
if type push value on stack
else if function execute on stack arguments
else combinator scans for arguments to its left

Numeric Types
Bool < Char < Nat < Int < Rat < Real < Complex

vector (indexed by Nat) '[' v0 v1 ... ']' vi's have common type  
tuple (indexed by Nat)  '(' t0 t1 ... ')' ti's any type  
map<K,V> is a partial function from K to V  


v : [ 1 2 3 ] // vector
w : ( 2 true "abc" )

/ +/ v # v

x y z S -> x z (y z)
push z {z}
push z {z z}
push y {y z z}
eval   {yz z}
swap   {z yz}
push x {x z yz}
eval   {xz yz}
eval   {xz(yz)}

/ +/ # v S

When does evaluation happen? Should it only eval to a certain level?

R(x y)
