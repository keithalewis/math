---
title: Tensor
author: Keith A. Lewis
header-includes:
  - \usepackage{amsmath}
  - \usepackage{bm}
---
\newcommand\RR{\bm{R}}
\newcommand\CC{\bm{C}}
\newcommand\ZZ{\bm{Z}}
\newcommand\FF{\bm{F}}
\newcommand\NN{\bm{N}}
\newcommand\QQ{\bm{Q}}
\newcommand\TT{\bm{T}}
\newcommand\BB{\bm{B}}
\newcommand\zero{\bm{0}}
\newcommand\LL{\mathcal{L}}
\newcommand\tr{\operatorname{tr}}
\newcommand\dom{\operatorname{dom}}
\newcommand\ran{\operatorname{ran}}
\newcommand\cod{\operatorname{cod}}
\newcommand\eval{\operatorname{eval}}
\newcommand\curry{\operatorname{curry}}
\newcommand\uncurry{\operatorname{uncurry}}
\newcommand\graph{\operatorname{graph}}
\renewcommand\span{\operatorname{span}}

There seems to be some uncertainty in the computer science community
about exactly what a tensor is. The only things involved are
functions and their composition.
This short note gives names to functions then composes them.
The mathematical definitions can be translated
directly into any computer language that allows functions to be
defined and called.  We cover topics described in [The Tensor
Cookbook](https://tensorcookbook.com/) but have no need for their
graphical notations that do not have a direct translation
to computer implementation.

## Set

Everything in classical mathematics is a _set_.
We assume the reader knows what a set is and use $\in$ to denote set membership.
The _set exponential_ of the sets $A$ and $B$ is $B^A = \{f\colon A\to B\}$, the set
of all functions from $A$ to $B$. We also write this as $\{A\to B\}$.
The _domain_ of a function $f\colon A\to B$ is $\dom f = A$ and the
_codomain_ is $\cod f = B$.

The _cartesian product_ of sets $A$ and $B$ is ${A\times B = \{(a,b)\mid a\in A,
b\in B\}}$, the set of ordered pairs of elements from the two sets.

__Exercise__. (Kuratowski) _Show we can identify the ordered pair $(a,b)$ with the 
set $\{\{a\},\{a,b\}\}$_.

_Hint_: An ordered pair is defined by $(a,b) = (c,d)$ if and only if $a = c$ and $b = d$.
Show $\{\{a\}, \{a,b\}\} = \{\{c\}, \{c,d\}\}$ if and only if $a = c$ and $b = d$.

__Exercise__. A function can be identified with its $\graph f = \{(a, f(a))\mid a\in A\}\subseteq A\times B$.

_Hint_: $f(a) = b$ if and only if $(a,b)\in\graph f$.

If $f\colon A\to B$ we say $a,a'\in A$ are _equivalent_ if $f(a) = f(a')$.
The _equivalence class_ of $a\in A$ is $[a] = \{a'\in A\mid f(a) = f(a')\}$.
The _kernel_ of a $f$ is $\ker f = \{[a]\mid a\in A\}$.

The kernel of a function is a _partition_ of its domain.

__Exercise__. _Show the union of sets in $\ker f$ is $A$_.

_Hint_. Show $\cup_{a\in A} [a] = A$ using $a\in[a]$ for $a\in A$.

__Exercise__. _Show the elements of $\ker f$ are either disjoint or equal_.

_Hint_. If $x\in [a]\cap[a']$
then $f(x) = f(a)$ and $f(x) = f(a')$ so $f(a) = f(a')$.
If $y\in [a]$ then $f(y) = f(a) = f(a')$ so $y\in [a']$.
Show the converse also holds.

The last two exercises show $\ker f$ is a partiion of $A$.
Partitions are a way to loosen the notion of equality to _equivalence_.
They are also a way of modeling partial information. Full information
is knowing the element $a\in A$, partial information is only knowing $[a]$,
no information is only knowing $a\in A$.

__Exercise__. _Show the parition $\{\{a\}\mid a\in A\}$ represents full information
and the partition $\{A\}$ represents no information_.

A function $f\colon A\to B$ is _one-to-one_, or _injective_, if $[a]$
is a singleton (has exactly one element) for all $a\in A$.

__Exercise__. _If $f\colon A\to B$ is injective then
$f(a) = f(a')$ implies $a = a'$_.

Define $[f]\colon\ker A\to B$ by $[a]\mapsto f(a)$.

__Exercise__. _Show $[f]$ is well-defined_.

_Hint_. Show if $[a] = [a']$ then $f(a) = f(a')$.

__Exercise__. _Show $[f]$ is injective_.

The _range_ of $f\colon A\to B$ is $\ran f = \{f(a)\mid a\in A\}$.
It is _onto_, or _surjective_ if $\ran f = B$.

__Exercise__. _If $f\colon A\to B$ is surjective then for
every $b\in B$ there exists at least one $a\in A$ with $f(a) = b$_.

Set exponential, domain, codomain...

## Composition

The _composition_ of two compatible functions is a function
$\circ\colon\{A\to B\}\times\{B\to C\}\to\{A\to C\}$
defined by $\circ(f,g)(a) = g(f(a))$, $a\in A$.
This is also written as $g\circ f$
or simply $gf$ when it is clear composition is intended.
Note the order of $f$ and $g$ are reversed.
If $\cod f = \dom g$
then the composition ${\circ(f,g) = g\circ f = gf}$ exists.
We could write $B^A$ as $\{B\leftarrow A\}$ and define
composition as $\circ\colon\{C\leftarrow B\}\times\{B\leftarrow A\}\to\{C\leftarrow A\}$
by $\circ(g,f)(a) = g(f(a))$ so we don't have to reverse the order of $f$ and $g$, but
we resist this temptation and stick to standard mathematical notation.

__Exercise__. _Show composition of functions is associative_.

_Hint_: If $f\colon A\to B$, $g\colon B\to C$, and $h\colon C\to D$
show $h\circ(g\circ f) = (h\circ g)\circ f$.

This allows us to write $h\circ g\circ f$ unambiguosly.

Given a set $A$ define the _identity function_ $1_A\colon A\to A$
by $1_A(a) = a$ for $a\in A$.

__Exercise__. _If $f\colon A\to B$ is a function then
$f1_A = f$ and $1_Bf = f$_.

The last two exercises shows sets and functions are the objects and arrows
of a [category](https://en.wikipedia.org/wiki/Category_(mathematics)){target="_blank"}
denoted by [$\text{\bf{Set}}$](https://en.wikipedia.org/wiki/Category_of_sets){target="_blank"}. 

__Exercise__. _Show if $f\colon A\to B$ is injective then there
exists $g\colon B\to A$ with $gf = 1_A$_.

_Hint_: If $f(a) = b$ then $b\in[a]$. Since $[a]$ is a singleton
we can define $g(b) = a$.

__Exercise__. _Show if $f\colon A\to B$ is surjective then there
exists $g\colon B\to A$ with $fg = 1_B$_.

_Hint_: For every $b\in B$ there exists $a\in A$ with $f(a) = b$.
Let $g(b) = a$. In general, there are many right inverses.

These two exercises show it is possible to define injective and
surjective without mentioning elements of sets.

## Curry

_Currying_ and _uncurrying_ provides a connection between set exponential and cartesian product.
The set ${\{A\times B\to C\}}$ is in one-to-one correspondence with
the set ${\{A\to\{B\to C\}\}}$. Given ${f\in\{A\times B\to C\}}$ define
${\curry f\colon A\to\{B\to C\}}$ by ${((\curry f)(a))(b) = f(a,b)}$.
The inverse is _uncurrying_. Given ${g\in\{A\to\{B\to C\}\}}$ define
${\uncurry g\colon A\times B\to C}$
by ${(\uncurry g)(a,b) = (g(a))(b)}$.

Using the non-standard notation $\curry f = f,$ then $f,a(b) = f(a,b)$
and $\uncurry g = ,g$ then $,g(a,b) = ga(b)$.

__Exercise__. _Show $,(f,) = f$ and $(,g), = g$_.

_Hint_. $,(f,)(a,b) = f,a(b) = f(a,b)$ and $(,g),a(b) = ,g(a,b) = ga(b)$.

## Evaluation

Given a function $f\colon A\to B$ and $a\in A$ then we can apply
the function to $a$ and get $f(a)\in B$. This is called 
_evaluation_ and we define the function $\eval\colon\{A\to B\}\times A\to B$ defined
by $\eval(f,a) = f(a)$, $f\in\{A\to B\}$, $a\in A$.

If $f\colon A\times B\to C$ an $a\in A$ then we can define a function from $B$
to $C$ by $b\mapsto f(a,b)$. Specifying some arguments for a multi-argument
function to make it a function on the remaining arguments is called _partial evaluation_.

## Relation

A _relation_ on sets $A$ and $B$ is a subset $R\subseteq A\times B$.
We write $aRb$ whenever $(a,b)\in R$.
The _left coset_ is $Rb = \{a\in A\mid aRb\}$ and the 
_right coset_ iis $aRb = \{b\in B\mid aRb\}$. If for every $a\in A$
the right coset $aR$ is a singleton then $R$ is a function and we
write $R(a) = b$ where $b\in B$ is the unique element of $aR$.

The _composition_ of relations $R\subseteq A\times B$ and $S\subseteq B\times C$
is $SR = \{a\in A, c\in C\mid aRb\text{ and }bSc\text{ for some }b\in B\}$.
This is used in the definition of the various
[`JOIN`](https://learn.microsoft.com/en-us/sql/relational-databases/performance/joins?view=sql-server-ver17){target="_black"}
commands in SQL.

The _transpose_ of a relation $R\subseteq A\times B$
is $R^T\subseteq B\times A$ where $bR^Ta$ if and only if $aRb$.

__Exercise__. _Show $(RS)^T = S^T R^T$_.

The relation _equal_ is $\Delta\subseteq\{(a,a)\mid a\in A\}$.
It is a left and right identity for composition.

__Exercise__. _Show $\Delta R$, $R$, and $R\Delta$ are all equal_.

Relations on $A\times A$ are classified by properties they satisfy

     Property    Definition                           Formula
-------------    ----------------------------   ------------------------
_reflexive_      $aRa$ is always true.          $\Delta\subseteq R$
_irreflexive_    $aRa$ is always false.         $\Delta\cap R = \emptyset$
_symmetric_      $aRb$ implies $bRa$.           $R^T = R$
_antisymmetric_  $aRb$ and $bRa$ imply $a = b$.  $\Delta\subseteq R\cap R^T$
_transitive_     $aRb$ and $bRc$ imply $aRc$.   $R^2\subseteq R$

__Exercise__. _Prove the formulas from the definitions_.

__Exercise__. _Show $R$ is symmetric if and only if $aR = Ra$, $a\in A$_.

_Hint_. If $b\in aR$ then $aRb$ so $bRa$ if R is symmetric. This shows $b\in Ra$.
Similarly for $a\in Rb$. If $aR = Ra$, $a\in A$, then
$aRb$ implies $a\in Rb = bR$ so $bRa$.

The Kleen plus of a relation $R$ is $R^+ = \cup_{n>0} R^n$ where
$R^n$ is $R$ composed with itself $n$ times.

__Exercise__. _Show the Kleen plus of any relation is transitive_.

_Hint_. Note $aR^+b$ if and only if $aR^nb$ for some $n>0$ and
$R^nR^m = R^{n+m}$.

An _equivalence relation_ is reflexive, symmetric, and transitive.

__Exercise__. _Show $\Delta$ (equal) is an equivalence relation_.

__Exercise__. _Show if $R$ is an equivalence relation then
$aRb$ if and only if $aR = Rb$_.

__Exercise__. _If $R$ is an equivalence relation show $\{aR\mid a\in A\}$
is a partition of $A$_.

_Hint_. Show $\cup_{a\in A}aR = A$ and if $aR\cap Rb\neq\emptyset$ then
$aR = Rb$.

<!-- review -->

__Exercise__. _If $\{A_i\}_{i\in I}$ is a partition of $A$ and $aRb$ if and only if
there exists $i\in I$ with $a,b\in A_i$ then $R$ is an equivalence relation_.

Every equivalence relation on $A\times A$ correponds to a partition of $A$.
Every partition of $A$ corresponds to an equivalence relation on $A\times A$.

## Vector Space

If the base of a set exponential is a _field_
then $\FF^I$ is a _vector space_ for any _index set_ $I$. Typically
$\FF$ is the real numbers $\RR$, the complex numbers $\CC$, the rational
numbers $\QQ$, or integers modulo $p$ $\ZZ_p$ where $p$ is prime.
If $I = \{1,\ldots,n\}$ or $I = \{0,\ldots,n-1\}$ we write $\FF^{\bm{n}}$
when the base index of 1 or 0 is understood.
Scalar multiplication and vector addition are defined pointwise:
$(ax)(i) = a(x(i))$ and $(x + y)(i) = x(i) + y(i)$ for $a\in\FF$, $x,y\in\FF^I$.
The additive identity is $\bm{0} = 0_I$ defined by $\bm{0}(i) = 0$, $i\in I$.
The _additive inverse_ of $x\in\FF^I$ is $-x$ defined by $(-x)(i) = -x(i)$, $i\in I$.

__Exercise__. _Show $\FF^I$ satisfies the
[vector space axioms](https://www.math.ucla.edu/~tao/resource/general/121.1.00s/vector_axioms.html){target="_blank"}_.

The _standard basis_ of $\RR^I$ is $(e_i)_{i\in I}$ where $e_i(j) = \delta_{ij}$
is the Kronecker delta. We write $e_i^I$ to indicate $e_i\in\FF^I$.

__Exercise__. _Show $x = \sum_{i\in I} x(i) e_i$ when $I$ is finite_.

_Hint_. If $x,y\in\FF^I$ then $x = y$ if and only if $x(j) = y(j)$ for all $j\in I$.
What is $x(j)$?

The _dot product_ of $x,y\in\FF^I$ when $I$ is fintite is
$x\cdot y = \sum_{i\in I} x(i) y(i)$, or $x\cdot y = \sum_{i\in I} x(i) \overline{y(i)}$
when $\FF$ is the complex numbers. Recall if $z = x + iy\in\CC$ where $x,y\in\RR$
then the _complex conjugate_ of $z$ is $\overline{z} = x - iy$.

__Exercise__. _Show for $x\in\FF^I$ that $x^*\colon\FF^I\to\FF$
defined by $x^*y = x\cdot\overline{y}$ is linear_.

_Hint_: Show $x^*(ay) = ax^*y$ and $x^*(y + z) = x^*y + x^*z$, $a\in\FF$, $x,y,z\in\FF^I$.

### Norm

The _norm_ of $x\in\FF^I$ is $\|x\| = \sqrt{x\cdot x}$.

__Exercise__. _Show $\|x\| \ge 0$, $\|x\| = 0$ implies $x = \zero$,
$\|ax\| = |a|\|x\|$ and $\|x + y\| \le \|x\| + \|y\|$_.

__Exercise__ (Cauchy-Schwartz)  _Show $|x\cdot y| \le \|x\| \|y\|$ and if equality
holds then $ax = by$ for some $a,b\in\FF$_.

_Hint_: Use $0\le\|x - ty\|^2$ for $t\in\FF$ and facts about quadratic equations
you learned in high school.

### Metric

Define the _distance_ from $x$ to $y$ by $d(x,y) = \|x - y\|$.

__Exercise__. _Show $d(x,y) = 0$ implies $x = y$, $d(x,y) = d(y,x)$
and $d(x,y) + d(y,z) \ge d(x,z)$_.

This shows $d$ is a _metric_ that defines a topology on $\FF^I$.

We can identify $\FF^I$ with the cartesian product of $I$ copies of the field $\FF$.
The element $(x_i)_{i\in I}$ in the cartesian product corresponds to the
function $x\in\FF^I$ by $x(i) = x_i$, $i\in I$.

A simple but quite useful observation is that if $\sigma\colon J\to I$ is any function
then $\circ\sigma\colon\FF^I\to\FF^J$ by $x\mapsto x\circ\sigma$, $x\in\FF^I$.

__Exercise__. _Show $\circ\sigma(ax) = a(\circ\sigma(x))$ and
$\circ\sigma(x + y) = \circ\sigma(x) + \circ\sigma(y)$ for $a\in\RR$ and $x,y\in\FF^I$_.

_Hint_: Show $(ax)\sigma = a(x\sigma)$ and $(x + y)\sigma = x\sigma + y\sigma$ on $\FF^J$.

If $i\in I$ and ${\sigma_i\colon\{i\}\to I}$ is the inclusion ${i\mapsto i}$
then ${\circ\sigma_i\colon\FF^I\to\FF^{\{i\}}}$. We can identify $\FF^{\{i\}}$
with $\FF$ by $(x)\leftrightarrow x$ and get a map ${e_i^* = e_i^{I*}\colon\FF^I\to\FF}$.

__Exercise__. _Show $x = \sum_{i\in I}e_i^*(x) e_i$, $x\in\FF^I$, if $I$ is finite_.

_Hint_: Show $e_i^*(x) = x(i)$.

### Subspace

A _subspace_ is a subset $V\subseteq\RR^I$ that is closed under scalar
multiplication and vector addition. There are two trivial subspaces.

__Exercise__. _Show $\{0\}$ and $\FF^I$ are subspaces of $\FF^I$_.

__Exercise__. _Show if $v\in\FF^I$ then $\{av\mid a\in\FF\}$ is a subspace_.

_Hint_: $b(av) = (ba)v$ and $av + bv = (a + b)v$ for $a,b\in\FF$.

Given $v_1,\ldots,v_k\in\FF^I$ define their _span_ as the set
of _linear combinations_
$\span \{v_j\}_{j=1}^k = \{\sum_{j=1}^k a_j v_j\mid a_f\in\FF\}$.

__Exercise__. _Show the span is a subspace_.

_Hint_. Use $a(\sum_j a_j v_j) = \sum_j aa_j v_j$
and $\sum_j a_j v_j + \sum_j b_j v_j = \sum_j (a_j + b_j) v_j$.

The vectors $v_1,\ldots,v_k\in\FF^I$ are _independent_ if
for $a_1,\ldots,a_k\in\FF$,
$\sum_j a_j v_j = 0$ implies $a_j = 0$ for all $j$.

The vectors $v_1,\ldots,v_k\in\FF^I$ are _dependent_ (not independent) if
there exist $a_1,\ldots,a_k\in\FF$, not all 0, with
$\sum_j a_j v_j = 0$. If $a_j\not=0$ then
$v_j = -\sum_{i\not=j} (a_i/a_j) v_i$.

A collection of vectors $v_1,\ldots,v_n\in\FF^I$ are a _basis_ if they
span $\FF^I$ and are independent.

__Exercise__ _Show if $\{v_i\}_{i=1}^n$ is a basis of $\FF^I$ then for every
$x\in\FF^I$ there exist unique $x_i$, $1\le i\le n$, with $x = \sum_{i=1}^n x_i v_i$_.

__Hint__. The vectors $\{v_i\}_{i=1}^n$ span $\FF^I$ so the $x_i\in\FF$ exist.
Use independence to show they are unique.

This defines a bijection from $\FF^I$ to $\FF^{\bm{n}}$.
This map is also a linear operator.

## Linear Operator

Any function $T\colon\FF^I\to\FF^J$ satisfying $T(ax) = a(Tx)$ and $T(x + y) = Tx + Ty$
for $a\in\FF$, $x,y\in\FF^I$ is a _linear operator_. We use
$\mathcal{L}(\FF^I, \FF^J)$ and $[\RR^I\to\FF^J]$ to denote the space of all
linear operators.
Linear operators also are a vector space with scalar multiplication $(aT)(x) = aT(x)$
and vector addition $(T + U)(x) = Tx + Ux$, $a\in\FF$, $T,U\in[\FF^I\to\FF^J]$, $x\in\FF^I$.

__Exercise__. _Prove $T\zero = \zero$_.

_Hint_: Use $x + x = x$ implies $x=\zero$.

The _kernel_ of a linear operator $T\colon\FF^I\to\FF^J$
is ${\ker T = \{x\in\FF^I\mid Tx = 0\}\subseteq\FF^J}$.

__Exercise__. _Show $\ker T$ is a subspace of $\FF^I$_.

_Hint_. Show if $Tx = \zero$ then $T(ax) = \zero$ and that
$Tx = \zero$, $Ty = \zero$ implies T(x + y) = \zero$.

__Exercise__. _Show if $Tx = Ty$ then $x - y\in\ker T$_.

_Hint_. Use $T$ is linear.

__Exercise__. _Show if $\ker T = \{\zero\}$ then $T$ is injective_.

If $T$ is injective and surjective then $T$ is an _isomorphism_,
a bijection that preserves the vector space structure.

The _matrix_ of a linear operator $T\in[\FF^I\to\FF^J]$ is $[T]\in\FF^{I\times J}$ defined
by $[t_{ij}] = [T](i,j) = e_j^{J*} Te_i^I$, $i\in I$, $j\in J$.

Since $I\times J$ is a set $\FF^{I\times J}$ is a vector space
and $[T] = \sum_{i,j} t_{ij} e_{ij}$ where $(e_{ij})_{i\in I, j\in J}$ is the
standard basis of $\FF^{I\times J}$.

__Exercise__. _Show $T\mapsto [T]$ is linear_.

_Hint_. Show $[aT] = a[T]$ and $[T + U] = [T] + [U]$.

__Exercise__. _If $T\colon\FF^I\to\FF^J$ and $U\colon\FF^J\to\FF^K$ then
$[UT](i,k) = \sum_{j\in J} t(i,j) u(j,k)$_.

_Hint_. Use $[UT](i,k) = e_k^*UTe_i$ and $Te_i = \sum_j e_j^*(Te_i)e_j$.

We have no need for the Einstein summation convention...

__Lemma__. _If $T\colon\FF^I\to\FF^J$ is injective then $|I| \le |J|$_.

__Lemma__. _If $T\colon\FF^I\to\FF^J$ is surjective then $|I| \ge |J|$_.

## Dual

The _dual_ of $\RR^I$ is $\FF^* = [\FF^I\to\FF]$, the set of _linear functionals_
from a vector space to its underlying field. We have already seen an
example of this $e_i^*\colon\FF^I\to\FF$. If $I$ is finite the
linear transformation $*\colon\FF\to\FF^*$ defined by $e_i\mapsto e_i^*$, $i\in I$,
is an isomorphism.

## Tensor

It seems to be popular to say "a tensor is something that transforms like a tensor."
A more useful definition is a tensor is a vector space indexed by a cartesian product.
The number of products is the _rank_ of the tensor.

For example, $\FF^{I\times J}$ is a rank 2 tensor.
As we have just seen it corresponds to a linear operator in $[\FF^I\to\FF^J]$.
Define a function with the slightly odd name superscript $T$ by ${}^T\colon J\times I\to I\times J$ by
$(j,i)\mapsto (i,j)$. Note $\circ{}^T\colon\FF^{J\times I}\to\FF^{I\times J}$.

__Exercise__. _Show if $T\colon\FF^I\to\FF^J$ with matrix $[t_{ij}]$ then the
matrix of $[T]\circ^T$ is $[t_{ji}]$_.

A _tensor_ is an element of $\FF^{\bm{n_1}}\times\cdots\times\bm{n_r}$
where $r$ is the _rank_ of the tensor.

## Structure

$[V\to V]\to\mathcal{P}$ from linear operators to characteristic polynomial is continuous.

$v\wedge w$ can be thought of as the oriented parallelogram determined by $v$ and $w$.

__Exercise__. _Show $v\wedge w = -w\wedge v$.

## Iterable

The Kleene star of a set $S$ is $S^* = \cup_{n\ge0} S^n$
so an element $s\in S^*\in S^n$ for some $n$.
The Kleene plus of a set $S$ is $S^+ = \cup_{n > 0} S^n$.
Define $?\colon S^*\to\BB$ by $?s$ to be false$ if $s\in S^0$ and true otherwise.
Define $*\colon S^+\to S$ by $*s = s_1$ if $s = (s_1, \ldots, s_n)$.
Define $+\colon S^+\to S^*$ by $+(s_1, s_2, \ldots, s_n) = (s_2, \ldots, s_n)$.



<!--

The vector space $\RR^n$ is the set of tuples ${x = (x_1,\ldots,x_n)}$ where
${x_i\in\RR}$, ${1\le i\le n}$. _Scalar multiplication_
is defined by ${a(x_1,\ldots,x_n) = (ax_1,\ldots,ax_n)}$ for ${a\in\RR}$.
_Vector addition_ is defined by ${(x_1,\ldots,x_n) + (y_1,\ldots,y_n)
= (x_1 + y_1,\ldots,x_n + y_n)}$.

Definitions involving dots are not ammenable to computer
implementation. Every vector ${x\in\RR^n}$ determines a function
${\bm{x}\colon\bm{n}\to\RR}$ by ${\bm{x}(i) = x_i}$ for ${i\in\bm{n} = \{1,\ldots,n\}}$.
Scalar multiplication and vector addition can
be defined _pointwise_ by ${(a\bm{x})(i) = a(\bm{x}(i))}$ and
${(\bm{x} + \bm{y})(i) = \bm{x}(i) + \bm{y}(i)}$, ${1\le i\le n}$.

The set of tuples $\RR^n$ is not the same as the set of functions $\RR^\bm{n}$
but they are in one-to-one correspondence.
Define a map ${\iota\colon\RR^n\to\RR^\bm{n}}$ by ${\iota x(i) = x_i}$, ${x\in\RR^n}$, ${i\in\bm{n}}$.


__Exercise__. _Show if $\iota x = \iota y$ then $x = y$, $x,y\in\RR^n$_

_Hint_: Use $x = y$ if and only if $x_i = y_i$ for all $i\in\bm{n}$.

This shows $\iota$ is _one-to-one_, or _injective_.

__Exercise__. _Show for every $\bm{x}\in\RR^\bm{n}$ there exists $x\in\RR^n$ with $\iota x = \bm{x}$_.

_Hint_: Given $\bm{x}\in\RR^\bm{n}$ let $x_i = \bm{x}(i)$, $i\in\bm{n}$.

This show $\iota$ is _onto_, or _surjective_.
A function that is one-to-one and onto is a _one-to-one correspondence_, or _bijective_.

__Exercise__. _Show $\iota(ax) = a(\iota x)$ and $\iota(x + y) = \iota x + \iota y$ for
$a\in\RR$, $x,y\in\RR^n$_.

This shows $\iota$ is a _linear operator_, a function from one vector space to
another that preserves the linear structure.
If a linear operator is bijective we call it an _isomorphism_.

## Cartesian Product

The _cartesian product_ $\prod_{i\in I}A_i$ of sets $A_i$, $i\in I$, is defined
by _projections_ $\pi_i\colon \Pi_{i\in I}A_i\to A_i$, $i\in I$ having the property
that if $P$ is a set with functions $p_i\colon P\to A_i$, $i\in I$, then there exists
a function $p\colon P\to\prod_{i\in I}A_i$ with $\pi_ip = p_i$, $i\in I$.

If $P$ is a set with functions $p_i\colon P\to A_i$, $i\in I$ having the property
that if $Q$ is a set with functions $q_i\colon Q\to A_i$, $i\in I$, then there exists
a function $q\colon Q\to P$ with $p_iq = q_i$, $i\in I$, then $P$ is in
one-to-one correspondence with $\prod_{i\in I}A_i$.

__Exercise__. _Prove this_.

_Hint_: Let $Q = \prod_{i\in I}A_i$ and $q_i = \pi_i$.

<details><summary>Solution</summary>
We have $p\colon P\to\prod_{i\in I}A_i$ with $\pi_ip = p_i$
and $q\colon\prod_{i\in I}A_i\to P$ with $p_i q = \pi_i$.
Use this to show this defines an isomorphism.
</details>

## Set Exponential

Given sets $A$ and $B$, the _set exponential_ $B^A$ is the set of all functions
from $A$ to $B$. It is related to cartesian product by $C^{A\times B}$
is in one-to-one correspondence with $C^{B^A}$.
If we write $B^A = \{A\to B\}$ this says
$\{A\times B\to C\}$ 
is in one-to-one correspondence with $\{A\to\{B\to C\}\}$
and is more easily recognized as _currying_.
If we have a function $f\colon A\times B\to C$ and $a\in A$ we
can define a function from $B\to C$ by $b\mapsto f(a,b)$.
Conversly, if we have a function $g\colon A\to C^B$ we can
define a function from $A\times B$ to $C$ by $(a,b)\mapsto (g(a))(b) = (ga)b$.

If $f\colon A\to B$ is a function then the value of $f$ at $a\in A$ is $f(a)$.
We reify this with the name $\eval_B^A\colon B^A\times A\to B$ defined
by $\eval_B^A(f,a) = f(a)$. If $g\in (C^B)^A$ and $a\in A$ then
$\eval_{C^B}^A(g, a)\in C^B$ is called _partial evaluation_.

## Tuple, Array

Given any _index set_ $I$ the cartesian product $\prod_{i\in I}\RR$ is
isomorphic to the set exponential $\RR^I$. 
Elements of the cartesian product are _tuples_. Elements
of the set exponential are _arrays_.

A _view_ of $\RR^I$ is a function $\sigma\colon J\to I$
and is used to define a function $\circ\sigma\colon\RR^I\to\RR^J$ by
right composition $(\circ\sigma)x = x\circ\sigma = x\sigma$ so
$(x\sigma)(j) = x(\sigma(j))$, $x\in\RR^I$, $j\in J$.

__Exercise__. _Show $\circ\sigma$ is a linear operator_.

_Hint_: Show $a(x\sigma) = (ax)\sigma$ and $(x + y)\sigma = x\sigma + y\sigma$.

__Exercise__. _Show if $\sigma$ is one-to-one then $\circ\sigma$ is onto._

_Hint_: Show there exists $\sigma^\dashv\colon I\to J$ with $\sigma^\dashv\sigma = 1_J$.
If $x\in\RR^J$ then $x\sigma^\dashv\in\RR^I$ and $x\sigma^\dashv\sigma = x$.

__Exercise__. _Show if $\sigma$ is onto then $\circ\sigma$ is one-to-one._

_Hint_: Show there exists $\sigma^\vdash\colon J\to I$ with $\sigma\sigma^\vdash = 1_I$.
If $x\sigma = y\sigma$, $x,y\in\RR^I$, then $x\sigma\sigma^\vdash = y\sigma\sigma^\vdash$
and $x = y$.

This shows if $\sigma$ is one-to-one and onto then $\circ\sigma$ is an isomorphism.

If $J\subset I$ we write $[J]\colon J\to I$ for the inclusion map and
call $x[J]$ the _projection_ on $J$ of $x\in\RR^I$.

## Dual

The _dual_ of the vector space $\RR^I$ is the set of all linear operators from $\RR^I$ to $\RR$.
The _standard basis_ of $\RR^I$ is $(e_i)_{i\in I}$ where $e_i(j) = \delta_{ij}$
is the Kronecker delta: $\delta_{ij} = 1$ if $i = j$ and $\delta_{ij} = 0$ if $i \not= j$.

__Exercise__. _Show $x = \sum_{i\in I} x(i)e_i$ if $I$ is finite_.

_Hint_: Evaluate $x(j)$, $j\in I$.

## Matrix

A _matrix_ is an array where the index set is the cartesian product
of two sets $\RR^{I\times J}$.

A vector is usually represented on a computer as a contiguous array of memory
with elements of the same type. The real numbers are uniquely characterized
mathematically as a complete Archemedean ordered field. Computers
can only model real numbers as a finite number of bits. 
The most common representation is 64-bit or 32-bit IEEE 754 floating point.



The _dual_ of a vector space $V$ over the real numbers $\RR$ is the set
of all linear functionals from $V$ to $\RR$.

The vector space $\RR^n$, where $\RR$ is the set of real numbers and
$n\in\NN$ is a natural number, can be identified with the set
of functions from $\bm{n} = \{1,\ldots, n\}$ to $\RR$.
The tuple $x = (x_1,\ldots,x_n)$ corresponds to the function
$\bm{x}\colon\bm{n}\to\RR$ by $\bm{x}(i) = x_i$, $i\in\bm{n}$.

The _dual_ of $\RR^n$ is the set of all _linear functionals_
from $\RR^n\to\RR$. 

$x^*y = x^*(y)$.

$xy^*\colon V\to V$ by $(xy^*)v = x(y^*v)$.

Hadamard Product $A\in\RR^{I\times J}$, $B\in\RR^{I\times J}$ 
$A\odot B = SAB$ where $Sxyz = xz(yz)$ is the $S$ combinator.

Trace. $\Delta\colon I\to I\times I$ by $i\mapsto (i,i)$. $\tr T = +*T\Delta$.

__Exercise__. _Show $\tr A^T = \tr B$_.

_Hint_. ${}^T\Delta = \Delta$.

__Exercise__. _Show $\tr TS = \tr ST$_.

$\RR^{n\times m}\times n\to \RR^m$, $(x, i)\mapsto (x,i)j = x(i,j)$, $j\in\bm{m}$

$\RR^{n\times m}\times m\to \RR^n$, $(x, j)\mapsto (x,j)i = x(i,j)$, $i\in\bm{n}$. 

Monoid. $m\colon M\times M\to M$. $m^*\colon M^*\to M$.
$m^* = m/$. Right vs left fold.

if $X$ and $Y$ are sets the _set exponential_ $Y^X = \{f\colon X\to Y\}$
is the set of all functions from $X$ to $Y$ and if $g\colon U\to X$
then _composition_ $\circ g\colon Y^X\to Y^U$ by $(\circ g)f = f\circ g = fg$,
where $(fg)(u) = f(g(u))$, $u\in U$.

__Exericise__: _Show if $g$ is one-to-one then so is $f\circ g$_.

_Hint_: Show $f\circ g(u) = f\circ g(u')$ then $u = u'$.

$\RR^n$ $X = n$, $Y = \RR$.

$\RR^{n\times n}$ $X = n\times m$, $Y = \RR$.

We use the somewhat unconventional name upper case capital $T$ 
for the function that transposes elements of an ordered pair:
${}^T\colon A\times B\to B\times A$ by ${}^T(a, b) = (b, a)$,
$a\in A$, $b\in B$.

__Exercise__. _Show ${}^T$ is bijective_.

We can generalize this to any permutation $\tau\colon X\to X$

$\RR^{n\times m}\to \RR^n$ by $T
-->

