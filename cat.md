---
title: Category Theory
author: Keith A. Lewis
institute: KALX, LLC
classoption: fleqn
fleqn: true
abstract: Objects and Arrow
...

\newcommand\dom{\operatorname{dom}}
\newcommand\cod{\operatorname{cod}}
\newcommand\ker{\operatorname{ker}}
\newcommand\ran{\operatorname{ran}}
\newcommand\Fun{\mathbf{Fun}}
\newcommand\Set{\mathbf{Set}}
\newcommand\Par{\mathbf{Par}}
\newcommand\Rel{\mathbf{Rel}}
\newcommand\Grp{\mathbf{Grp}}
\newcommand\Vec{\mathbf{Vec}}
\newcommand\Cat{\mathbf{Cat}}

> _Besides it is an error to believe that rigour is the enemy of simplicity. 
> On the contrary we find it confirmed by numerous examples that the rigorous 
> method is at the same time the simpler and the more easily comprehended. 
> The very effort for rigor forces us to find out simpler methods of proof. 
> &mdash; David Hilbert_


A _category_ consists of _objects_ and _arrows_ that can sometimes be _composed_.
Arrows that can be composed are _associative_. Every
object has an _identity arrow_.

## Objects and Arrows

An _arrow_ $f$ from _object_ $A$ to object $B$ is written $f\colon A\to B$.

The _domain_ of $f$ is $\dom f = A$ and
the _codomain_ of $f$ is $\cod f = B$
The codomain is also called _range_, _target_, or _but_ if you parlez Français.
 
We could do away with objects use the domain and codomain of arrows,
just as it is possible to use nand to define all other logical operators,
but why make things more difficult?

The "set" of arrows from $A$ to $B$ is called $\hom(A,B)$. 
The scare quotes indicate this is not necessarily a set
but standard terminology for this is _homset_.

## Composition

If $f\colon A\to B$ and $g\colon B\to C$ then there exists an arrow
$g \circ f\colon A\to C$, the _composition_ of $g$ with $f$. One of
the axioms of Category Theory is that if the codomain of $f$
equals the domain of $g$, then the composition exists.

Since we will be doing a lot of composing we just write $gf$
instead of $g \circ f$. 
Some people prefer to use $f;g$ instead of $gf$.
In this notation $f\colon A\to B$ and $g\colon B\to C$
compose to $f;g\colon A\to C$ keeping the arrow names in order.
If this sort of trifling is a concern you can just
write the arrows backwards:
$g\colon C\leftarrow B$ and $\colon\colon B\leftarrow A$ so $gf\colon C\leftarrow A$.

## Identity Arrow

On to more interesting things. Every object has an _identity arrow_.
If $f\colon A\to B$ then the identity arrows $1_A\colon A\to A$ and $1_B\colon B\to B$ 
satisfy $f 1_A = f = 1_B f$. Or maybe only somewhat more interesing.
You can always throw in identity arrows if they don't exist.

### Exercises

__Excercise__. _If $e\colon A\to A$ has the property $fe = f$ for all $f\colon A\to B$
then $e = 1_A$_.

__Excercise__. _If $e\colon B\to B$ has the property $ef = f$ for all $f\colon A\to B$
then $e = 1_B$_.

## Associative Law

If $f\colon A\to B$, $g\colon B\to C$, and $h\colon C\to D$ then we have arrows
$gf$, $hg$, $h(gf)$, and $(hg)f$.
The _associative law_ states $(hg)f = h(gf)$
so $hgf$ is unambiguous in category theory.

A collection of objects and arrow satisfying these laws is a _category_.

## Examples

It is impossible to understand Category Theory without understanding
examples of categories. They are its raison d'être. Many seemingly
disparate constructs can be unified.

The canonical example of a category is $\Set$. The objects are sets and
the arrows are functions. People tried to come up with a purely
category theory notion of $\Set$ and ended up with _topos theory_.
One does not simply consider 'elements' of a 'set'. 
Composition is standared function composition, which is associative.
The identity arrows are the identity functions $1_A\colon A\to A$
by $1_A(a) = a$ for $a\in A$.

Then there is $\Par$, the category of partial functions. It does not
get the respect it deserves.
Most functions are actually partial functions. The function $x\mapsto 1/x$
is only a partial function from the real numbers to the real numbers.
The partial functions $f\colon A\to B$ and $g\colon B\to C$ can
be composed using $gf(a) = c$ if and only if there exists $b\in B$
with $f(a) = b$ and $g(b) = c$. It has the same identity arrows
as $\Set$.

A case could be made that $\Set$ should be called $\Fun$.

$\Rel$ is the category of relations. It generalizes $\Set$ and $\Par$.
Given sets $A$ and $B$, a _relation_ is a subset of the cartesian product
$A\times B$. We write $aRb$ for $(a,b)\in R$.
The _left coset_ of $b\in B$ is $Rb = \{a\in A:aRb\}\subseteq A$ and
the _right coset_ of $a\in A$ is $aR = \{b\in B:aRb\}\subseteq B$.
The left are right cosets are also call the domain and range of $R$
but these can be different from category $\dom R$ and $\cod R$.

A function $f$ is a relation with the property that for every $a\in A$
there exists a unique $b$ in $B$ such that $(a,b)\in f$;
the cardinality of the right coset $af$ is exactly one. We write $f(a) = b$
instead of $afb$ where $b$ is the unique element of the right coset.

A partial function $g$ is a relation with the property that for every $a\in A$
there exists at most one $b\in B$ such that $(a,b)\in g$;
the cardinality of the right coset $ag$ is at moste one. We write $g(a) = b$
instead of $agb$ when $b$ belongs to the right coset.

Composition of the relation $R\subseteq A\times B$, and the relation
$S\subseteq B\times C$ is
$SR = \{(a,c)\in A\times C:aRb \text{ and }bSc\text{ for some }b\in B\}\subseteq A\times C$.

__Excercise__. _Show the identity arrows of $\Rel$ are $1_A = \{(a,a)\in A\times A : a\in A\}$_.

__Excercise__. _Show that composition is associative in Set_.

The _transpose_ or _conjugate_ of a relation $R\subseteq A\times B$ is
$R' = \{(b,a)\in B\times A:aRb\}$.

A relation $R\subseteq A\times A$ is _reflexive_ if $1_A\subseteq R$, that is,
$aRa$ for all $a\in A$. It is transitive if $R^2 = RR\subseteq R$, that is,
$aRb$ and $bRc$ imply $aRc$. Such relations are called _preorders_.
If we define a category with objects being elements of $A$ and arrows
$a\to b$ if and only if $aRb$ then the poset requirements show this
is indeed a category. On the flip side, every category where homsets contain at most one arrow
are preorders. The ordering is $A\preculyeq B$ whenever there is an arrow $A\to B$.

A relation is _antisymmetric_ if $R\cap R' \subseteq 1_A$, that is $aRb$ and $bRa$ imply $a = b$.
Antisymmetric preorders are _partial orders_.

A relation is _symmetric_ if $R \subseteq R'$, that is, $aRb$ implies $bRa$.
Symmetric preorders are _equivalence relations_.

__Exercise__. _Show $R\subseteq R'$ implies $R = R'$_.

Equivalence relations show up all over the place. They let you express the notion of
two things being 'the same' even if they are not equal. Two things $a$, $b$ are _equivalent_
if $aRb$.

### Sets with Structure

There are a slew of examples of categories where the objects are sets
'with structure' and the arrows are functions that preserve that structure.

$\Grp$ is the category of groups; the objects are groups and the arrows
are _homomorphisms_ (functions) that preserve the group structure.

$\Vec$ is the category of vector spaces; the objects are vector spaces
and the arrows are linear transformations.

Rings, fields, and algebras provide more examples. The theme of category
theory is to provide a unified treatment of various mathematical areas.

All of these examples satisfy a lemma of the form every arrow
$f\colon A\to B$ is a composition of arrows
$\pi\colon A\to A/\ker f$, $\nu\colon A/\ker f\to \ran B$, and $i\colon \ran B\to B$
where $\pi$ is 'onto' and $\nu$ is 'one-to-one'
for appropriate definitions of $\ker$, $\ran$, quotient $/$,
onto, and one-to-one. Arrows can be used to factor objects into smaller
objects $A/\ker f$ and $\ran f$. This is similar to factoring a number
into primes.

### Orders 

A _Preset_ is a set wtih a relation $<=$ that is reflexive and transitive.
The relation is called a _preorder_.
The notion predates Category Theory, but this maps perfectly into the
the definition of a category. The objects are elements of the set and
there is an arrow $x\to y$ if and only if $x <= y$.

The identity arrow is the relexive property and composition is the
transitive law.
Preorders have the property that homsets have at most one arrow.

The category with arrows $f\colon A\to B$ if $A$ is a subset of $B$ is
a preorder. It is also a _Poset_\colon a preorder that is _anti-symmetric_.
If $x <= y$ and $y <= x$ then $x = y$.
The relation is called a _partial order_.
The category _Set_ can be viewed as a preset. The objects are sets
and the arrows are $f\colon A\to B$ if $A$ is a subset of $B$.
It is also a _Poset_\colon a preorder that is _anti-symmetric_.
If $x <= y$ and $y <= x$ then $x = y$. The relation is called a _partial order_.

A preorder satisfying $x <= y$ implies $y <= x$ is an _equivalence relation_. 
It is more common to use the notation $x ~ y$ for equivalence relations
and say $x$ and $y$ belong to the same _equivalence class_. 

For any relation $R:A\to B$ define $R*:B\to A$ by $(b, a)\in R*$ if
and only if $(a, b)\in R$.

In the following exercises, let $R:A\to A$ be a relation.

__Excercise__. 5. Show $R$ is reflexive if and only if $1_A$ is a subset of $R$_.

__Excercise__. 6. Show $R$ is transitive if and only if $RR$ is a subset of $R$_.

__Excercise__. 7. Show $R$ is anti-symmetric if and only if the intersection of
$R$ and $R*$ is contained in $1_A$_.

A _partition_ of a set is a collection of disjoint subsets whos union equals the set.

__Excercise__. 8. If $R$ is an equivalence relation, then the equivalence classes
form a partion of $A$_.

### The Category $\Cat$

A _functor_ from category $C$ to category $D$ takes objects of $C$
to objects of $D$ and arrows of $C$ to arrows of $D$ and preserves
the category structure:

  i. If $f\colon A\to B$ in $C$ then $F(f)\colon F(A)\to F(B)$ in $D$.   
 ii. If $g\colon A\to B$ and $h\colon B\to C$ in $C$ then $F(hg) = F(h)F(g)$ in $D$.  
 
The category $\Cat$ has categories as objects and functors as arrows.

__Excercise__. _What is the identity functor?_

__Excercise__. _Show composition of functors is associative_.

You may now be wondering is there is a category of category
of categories. There is. The objects are functors and the
arrows are _natural transformations_. It is called $2-\Cat$.
Are there categories of categories of ...?
Yep. They are called $n-\Cat$. 

#### Some Properties of $\Set$

Every function in $\Set$ $f\colon A\to B$ determines an equivalence relation on $A$.
For $x, y\in A$, define $x \sim y$ iff $f(x) = f(y)$. 
The function $f/\sim$ takes elements of $A$ to the equivalence class it belongs to
$(f/\sim)(x) = x/\sim = {y\in A : y \sim x}$.

__Excercise__. _Show $f/\sim$ is a function_.

There exists a function $g:A/\sim\to B$ defined by $g(x/\sim) = f(x)$.

__Excercise__. _Show $g$ is a function_.

The function $f/\sim$ is _onto_, or _surjective_. For every element in its
codomain there exists an element in its domain that the function maps to.

The function $g$ is _one-to-one_, or _injective_. No two elements in the
domain get mapped to the same element in the codomain.

Functions that satisfy both properties are called one-to-one and onto
in the old school, and _bijective_ by 
[Nicolas Bourbaki](https://en.wikipedia.org/wiki/Nicolas_Bourbaki).

### Properties of Arrows

It is not always the case that arrows in a category can be factored
in a similar way.

A _surjective_ function, $f\colon A\to B$ has the property that for any functions
$g,h\colon B\to C$ if $fg = fh$ then $g = h$. In category theory such arrows are
called _epimorphisms_, or _epi_. 

An _injective_ function, $f\colon A\to B$ has the property that for any functions
$g,h\colon C\to A$ if $gf = hf$ then $g = h$. In category theory such arrows are
called _monomorphisms_, or _mono_.

A function that is both injective and surjective is call _bijective_.
An arrow that is both mono and epi is an _isomorphism_, or _iso_.

__Exercise__. _Show bijection and isomorphism are different concepts._


## Arrow Vocabulary


## Answers to Exercises

__Excercise__. 1. If $e\colon A\to A$ has the property $fe = f$ for all $f\colon A\to B$
then $e = 1_A$_.

**Solution.** Taking $f = 1_A$, $1_A e = 1_A$. By the definition of $1_A$, $1_A e = e$, hence $1_A = e$.

__Excercise__. 2. If $e\colon B\to B$ has the property $ef = f$ for all $f\colon A\to B$
then $e = 1_B$_.

**Solution** Taking $f = 1_B$, $e 1_B = 1_B$. By the definition of $1_B$, $e 1_B = e$, hence $1_B = e$.

__Excercise__. 3. Show the identity arrows of_ Set _are $1_A = {(a,a)\in A\times A \colon a\in A}$_.

**Solution** Let $R\colon A\to B$ be a relation. The following are equivalent:
> $(a, b)\in 1_A R$  
> There exists $a' in A$ with $(a, a')\in 1_A$ and $(a', b)\in R$.  
> $(a, a)\in 1_A$ and $(a, b)\in R$  
> $(a, b)\in R$  
The proof of $R 1_B = R$ is similar.

__Excercise__. 4. Show that composition is associative in_ Set.

**Solution** Let $R\colon A\to B$, $S\colon B\to C$ and $T:C\to D$. The following
are equivalent:
> $(a, d)\in (TS)R$.  
> There exists $b\in B$ with $(a, b)\in R$ and $(b, d)\in (TS)$.  
> There exists $b\in B$ with $(a, b)\in R$ and there exists $c\in C$ with $(b, c)\in S$ and $(c, d)\in T$.  
> There exists $b\in B$ and there exists $c\in C$ with $(a, b)\in R$ and $(b, c)\in S$ and $(c, d)\in T$.    
> There exists $c\in C$ and there exists $b\in B$ with $(a, b)\in R$ and $(b, c)\in S$ and $(c, d)\in T$.    
> There exists $c\in C$ with $(a, c)\in SR$ and $(c, d)\in T$.    
> $(a, d)\in T(SR)$.

__Excercise__. 5. Show $R$ is reflexive if and only if $1_A$ is a subset of $R$_.

**Solution** The following statements are equivalent\colon  
> $R$ is reflexive  
> $a <= a$ for all $a\in A$  
> $(a, a)\in R$ for all $a\in A$  
> $1_A$ is a subset of $R$  

__Excercise__. 6. Show $R$ is transitive if and only if $RR$ is a subset of $R$_.

**Solution** The following statements are equivalent\colon  
> $R$ is transitive  
> $a <= b$ and $b <= c$ imply $a <= c$  
> $(a, b)\in R$ and $(b, c)\in R$ imply $(a, c)\in R$  
> $(a, c)\in RR$ implies $(a, c)\in R$  
> $RR$ is a subset of $R$  

__Excercise__. 7. Show $R$ is anti-symmetric if and only if the intersection of
$R$ and $R*$ is contained in $1_A$_.

**Solution** The following statements are equivalent\colon  
> $R$ is anti-symmetric  
> $a <= b$ and $b <= a$ imply $a = b$  
> $(a, b)\in R$ and $(b, a)\in R$ imply $a = b$  
> $(a, b)\in R$ and $(a, b)\in R*$ imply $a = b$  
> $(a, b)\in R intersect R*$ imply $(a, b)\in 1_A$   
> The intersection of $R$ and $R*$ is contained in $1_A$  
