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
\newcommand\cat[1]{\mathbf{#1}}
\newcommand\mb[1]{\mathbf{#1}}

> _Besides it is an error to believe that rigour is the enemy of simplicity. 
> On the contrary we find it confirmed by numerous examples that the rigorous 
> method is at the same time the simpler and the more easily comprehended. 
> The very effort for rigor forces us to find out simpler methods of proof. 
> &mdash; David Hilbert_


A _category_ consists of _objects_ and _arrows_ that can sometimes be _composed_.
Arrows that can be composed are _associative_. Every
object has an _identity arrow_.

The canonical example of a category is $\cat{Set}$ with objects sets and arrows functions.
Every _preset_ is a category in $\cat{Pre}$ with arrows $a\to b$ whenever $a\preceq b$.
The reflexive and transitive laws corresponds to identity arrows and composition.
The associative law follows from there being at most one arrow between any two objects.
Categories with exactly one object are in $\cat{Mon}$. The identity
and associative laws of categories correspond to the axioms of a monoid.

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
the axioms of category theory is that if the codomain of $f$
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

## Isomorphic

A key concept in category theory is _isomorphism_. Two objects $A$ and
$B$ are isomorphic if there exist arrows $f\colon A\to B$ and
$g\colon B\to A$ with $fg = 1_B$ and $gf = 1_A$ and we write $A\cong B$.
If $A=B$ then $1_A = f = g = 1_B$ demonstrates $A$ and $A$ are isomorphic.

__Exercise__. _Show isomorphism is an equivalence relation_.

Hint: We have shown $A\cong A$ for every object $A$. Show $A\cong B$
implies $B\cong A$ and $A\cong B$, $B\cong C$ imply $A\cong C$.

Think of equivalence as a weakened form of equality. In the case of
$\cat{Set}$ it is a very weakened form. Adding structure to sets by
reducing the number of functions creates finer grained equivalence
relations.

We call $f,g$ an _isomorphism pair_ for $A,B$.  If $f,g$ and $f,g'$ are
isomporphims pairs for $A,B$ then $g = g'$ since $g = g1_B = g(fg') =
(gf)g' = 1_Ag' = g'$. We write $g = f^{-1}$ and, mutatis mutandis,
$f = g^{-1}$.

__Exercise__. _Show two sets in $\cat{Set}$ are isomorphic if and only
if they have the same cardinality_.

This also shows isomorphism pairs are not, in general, unique.

## Examples

It is impossible to understand category theory without understanding
examples of categories. They are its raison d'être. Many seemingly
disparate constructs can be unified.

The canonical example of a category is $\cat{Set}$. The objects are sets and
the arrows are functions. People tried to come up with a purely
category theory notion of $\cat{Set}$ and ended up with _topos theory_.
One does not simply consider 'elements' of a 'set'. 
Composition is standared function composition, which is associative.
The identity arrows are the identity functions $1_A\colon A\to A$
by $1_A(a) = a$ for $a\in A$.

Then there is $\cat{Par}$, the category of partial functions. It does not
get the respect it deserves.
Most functions are actually partial functions. The function $x\mapsto 1/x$
is only a partial function from the real numbers to the real numbers.
The partial functions $f\colon A\to B$ and $g\colon B\to C$ can
be composed using $gf(a) = c$ if and only if there exists $b\in B$
with $f(a) = b$ and $g(b) = c$. It has the same identity arrows
as $\cat{Set}$.

A case could be made that $\cat{Set}$ should be called $\cat{Fun}$.

$\cat{Rel}$ is the category of relations. It generalizes $\cat{Set}$ and $\cat{Par}$.

### Sets with Structure

There are a slew of examples of categories where the objects are sets
'with structure' and the arrows are functions that preserve that structure.

We have already seen $\cat{Mon}$, categories having exactly one object.

$\cat{Grp}$ is the category of groups; the objects are groups and the arrows
are _homomorphisms_, functions that preserve the group structure.

$\cat{Vec}$ is the category of vector spaces; the objects are vector spaces
and the arrows are linear transformations.

Rings, fields, and algebras provide more examples. The theme of category
theory is to provide a unified treatment of various mathematical areas.

<!--
All of these examples satisfy a lemma of the form every arrow
$f\colon A\to B$ is a composition of arrows
$\pi\colon A\to A/\ker f$, $\nu\colon A/\ker f\to \ran B$, and $i\colon \ran B\to B$
where $\pi$ is 'onto' and $\nu$ is 'one-to-one'
for appropriate definitions of $\ker$, $\ran$, quotient $/$,
onto, and one-to-one. Arrows can be used to factor objects into smaller
objects $A/\ker f$ and $\ran f$. This is similar to factoring a number
into primes.
-->

### Orders 

$\cat{Pre}$ is the category of _presets_. A preset is a set wtih a relation
$\preceq$ that is reflexive ($a\preceq a$) and transitive
($a\preceq b$ and $b\preceq c$ imply $a\preceq b$).
Such relations are called
_preorders_.  Presets long predate categories, but this maps
perfectly into the the definition of a category. The objects are elements
of the set and there is an arrow $x\to y$ if and only if $x \preceq y$.
The identity arrow is the reflexive property and composition is the
transitive law.  Preorders have the property that homsets have at most
one arrow.  Every category with this property is a preset.

$\cat{Pos}$ is the category of _posets_.
A _poset_ is a preset that is also _antisymmetric_ ($a\preceq b$
and $b\preceq a$ imply $a = b$).
Such relations are called _partial orders_.
The category _Set_ can be viewed as a poset under subset inclusion.
The objects are sets and the arrows are $f\colon A\to B$ if $A\subseteq B$.

$\cat{Equ}$ is the category of _equivalence relations_.
An equivalence relations is a preorder that is also _symmetric_
($a\preceq b$ implies $b\preceq a$). Equivalence relations
are used to classify objects.

### $\cat{Cat}$

$\cat{Cat}$ is the category of categories.
The objects are categories and the arrows are _functors_.

A functor from category $C$ to category $D$ takes objects of $C$
to objects of $D$ and arrows of $C$ to arrows of $D$ and preserves
the category structure:

  i. If $f\colon A\to B$ in $C$ then $F(f)\colon F(A)\to F(B)$ in $D$.   
 ii. If $g\colon A\to B$ and $h\colon B\to C$ in $C$ then $F(hg) = F(h)F(g)$ in $D$.  
 
__Excercise__. _What is the identity functor?_

__Excercise__. _Show composition of functors is associative_.

You may now be wondering if there is a category of category
of categories. There is and it is called $2$-$\cat{Cat}$.
The objects are functors and the arrows are _natural transformations_.

A natural transformation, $\eta\colon F\to G$, of functors $F,G\colon\cat{C}\to\cat{D}$
takes objects of $\cat{C}$ to arrows of $\cat{D}$. If $h\colon A\to B$ in $\cat{C}$
then $F(h)\colon F(A)\to F(B)$ and $G(h)\colon G(A)\to G(B)$ in $\cat{D}$. The arrows
$\eta_A\colon F(A)\to G(A)$ and $\eta_B\colon G(A)\to G(B)$ in $\cat{D}$ satisfy
$\eta_A F(h) = G(h)\eta_B$.

The prototypical example of natural transformation arises in the category $\cat{Vec}$.
The _dual_ of a vector space is $V^* = \hom(V,\mb{F})$ where $\mb{F}$ is the
underlying field of the vector space. The _dual pairing_ between $V$ and
$V^*$ is $\langle v,v^*\rangle = v^*(v)$.  If $T\colon V\to W$ is a linear
transformation then $T^*\colon W^*\to V^*$ via $\langle Tv,w^*\rangle
= \langle v,T^*w^*\rangle$.  Note $T^{**}\colon V^{**}\to W^{**}$
and gives rise to a functor $D$ in $\cat{Vec}$ via $V\mapsto V^{**}$
and $T\mapsto T^{**}$.  There is a natural inclusion $\iota_V\colon
V\to V^{**}$ by $\langle \iota_V v,v^*\rangle = \langle v, v^*\rangle$.
The property $T^{**}\iota_V = \iota_W T$ says $\iota\colon I\to D$
is a natural transformation where $I$ is the identity functor of $\cat{Vec}$.

__Exercise__. _Show $T^{**}\iota_V = \iota_W T$_.

<details>
<summary>Solution</summary>

> For $v\in V$ and $w^*\in W^*$,
$\langle T^{**}\iota_V v,w^*\rangle
=\langle \iota_V v,T^*w^*\rangle
=\langle v,T^*w^*\rangle
=\langle Tv,w^*\rangle
=\langle \iota_W Tv,w^*\rangle$.

</details>

Are there categories of categories of ...?
Yep. They are called $n$-$\cat{Cat}$. It's categories all the way down.

## Arrows

Although $\cat{Set}$ is a prototypical example of a category you
will need to disabuse yourself of the notion objects have elements.
Everything in category theory must be expressed in terms of objects and
arrows.  Attempts to express $\cat{Set}$ purely in terms of objects and
arrows leads to $\cat{Top}$, the category of topoi. This attempt failed
in the sense that it did not lead back to the category $\cat{Set}$. It
was succesful at giving a better understanding of the foundations
of mathematics. Unfortunately, as often happens in mathematics, following
your nose leads to complications. For example, a sphere is a set. The
elements of the set are points on the sphere. In a topoi the "elements"
of the sphere are the tangent planes to each point.

We have already seen how to use arrows to define isomorphisms. If
$A$ and $B$ are isomorphic then there are arrows $f\colon A\to B$
and $g\colon B\to A$ with $fg = 1_B$ and $gf = 1_A$.
We say $f\colon A\to B$ has _right inverse_ $g\colon B\to A$ when $fg = 1_B$
and $f$ has _left inverse_ $g$ when $gf = 1_A$.

__Exercise__. _If $f$ has right inverse $g$ and left inverse $g'$ show $g = g'$_.

<details>
<summary>Solution</summary>

> We have $g' = g'1_B = g'(fg) = (g'f)g = 1_Ag = g$.

</details>

This shows an arrow with both a right and left inverse is an isomorphism.

If $fh = fk$ implies $h = k$ then $f$ is called _mono_.
If $f$ has a right inverse and $h,k\colon B\to C$ satisfy $hf = kf$
then $h = h1_B = hfg = kfg = k1_B = k$.
Arrows having a right inverse are mono.

If $hf = kf$ implies $h = k$ then $f$ is called _epi_.
If $f$ has a left inverse and $h,k\colon C\to A$ satisfy $fh = fk$
then $h = 1_Ah = gfh = gfk = 1_Ak = k$.
Arrows having a left inverse are epi.

In $\cat{Set}$ mono arrows have a left inverse and epi arrows have a right inverse,
but this is not true for every category.

An arrow that is both mono and epi is called _iso_.

!!!


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
