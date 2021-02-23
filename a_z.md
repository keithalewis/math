---
title: Getting from A to Z
author: Keith A. Lewis
institute: KALX, LLC
classoption: fleqn
fleqn: true
abstract: How to structure a mathematical argument.
...

\newcommand\u[1]{\underline{#1}}
\newcommand\o[1]{\overline{#1}}
\newcommand\is{\leftarrow}
\newcommand\implies{\Rightarrow}
\newcommand\given[1]{\qquad\{#1\}}


## Derivation

To derive $A = Z$ write down $A$.
Below that write a true statement and the substitutions
to apply to get the next statement $= B$. 
The equality is established when the last statement is $= Z$.

To get from $A$ to $B$ use a _true statement_ and _substitutions_. True
statements are _axioms_ of the the mathematical theory you are working in.
Substitutions are systematically replacing one thing by another.

Every mathematical theory has its own set of axioms. Axioms are just
pretend true; different theories can have have contradictory axioms.
For example, non-Euclidean geometries do not satisfy Euclid's Fifth
Postulate.

The _real numbers_ are a Dedekind complete ordered field that you are
familiar with from high school algebra, even though you might not be
able to write down all of its axioms off the top of your head.

One of the axioms is the identity law for multiplication $a = 1a$.

This can be used to show what you might think to be the
unremarkable fact that $x + x = 2x$. Start with

$\u{x} + \u{x}$

$\given{\o{a} = \u{1a}\mid a\is x}$

$=\o{1x} + \o{1x}$.

Underbar and overbar match what is being substituted with the
result of the substitution. In this case we substituted the
same expression two times. Substitution is a mechanical operation that
even a dumb computer could do, but it is also a useful
technique that can help you with more complicated derivations.

Another axiom is the distibutive law $ac + bc = (a + b)c$.

$=\u{1}\u{\u{\u{{x}}}} + \u{\u{1}}\u{\u{\u{x}}}$.

$\given{\o{a}\o{\o{\o{c}}} + \o{\o{b}}\o{\o{\o{c}}} =
(\u{a} + \u{\u{b}})\u{\u{\u{c}}}\mid a\is 1, b\is 1, c\is x}$

$= (\o{1} + \o{\o{1}})\o{\o{\o{x}}}$

$\given{\o{1 + 1} = \u{2}}$

$=\o{2}x$

This might seem to be a long-winded way of showing $x + x = 2x$ but it
illustrates the general technique of showing $A = Z$.  No mathematician uses this
clumsy over/underbar notation when deriving equations, but they are thinking
that in their head.

Let's derive the less unremarkable fact $(x + y)^2 = x^2 + 2xy + y^2$
using this technique. You may have learned the FOIL method for this &ndash;
First, Outer, Inner, Last so $(x + y)^2 = (x + y)(x + y)
= xx + xy + yx + yy = x^2 + 2xy + y^2$. Mathematics uses
axioms and substituion for rigorous derivations instead of cute mnemonics.

_Derivation_. Start by writing $A$

$\u{(x + y)}^2$

then write the axiom and substitutions

$\given{\o{a}^2 = \u{aa}\mid a\is (x + y)}$ 

Issac Newton's preferred way of writing $a^2$ was $aa$.
$\u{(x + y)}$ corresponds to $\o{a}$ and $\u{aa}$ corresponds to

$= \o{(x + y)(x + y)}$

after substituting $a$ by $(x + y)$. Next we apply the distributive law

$= \u{(x + y)}(\u{\u{x}} + \u{\u{\u{y}}})$

$\given{\o{a}(\o{\o{b}} + \o{\o{\o{c}}}) = \u{a}\u{\u{b}} + \u{a}\u{\u{\u{c}}}\mid a\is (x+y), b\is x, c\is y}$

$= \o{(x + y)}\o{\o{x}} + \o{(x + y)}\o{\o{\o{y}}}$

Applying the distributive law again

$= \u{(x + y)x} + \u{\u{(x + y)y}}$

$\given{(a + b)c = ac + bc}$

$= \o{xx + yx} + \o{\o{xy + yy}}$

where you can provide the subsitutions in your head now. 
The commutitive law for multiplication yields

$= xx + xy + xy + yy$

Using the lemma $a + a = 2a$ from above $xy + xy = 2xy$ so

$= x^2 + 2xy + y^2$

This shows $(x + y)^2 = x^2 + 2xy + y^2$.

To be pedantic we should write

$= \u{xx} + \u{\u{xy + xy}} + \u{yy}$

$\given{\o{aa} = \u{a}^2, \o{\o{b + b}} = \u{2b}\mid a\is x, a\is y, b \is xy}$.

$= \o{x}^2 + \o{2xy} + \o{y}^2$

As your math skills improve you won't need such low level derivations.
If you get into trouble skipping steps you can always fall back to this
to be confident what you write is mathematically true.

Here is a more interesting example from probability theory where $X$ is
a _random variable_ and $E[X]$ is its _expected value_. Behind the
scenes $X$ is a function and expectation is an integral.

Derive $E[(X - E[X])^2] = E[X^2] - E[X]^2$.

$E[\u{(X - E[X])^2}]$

$\given{\o{(a - b)^2} = \u{a^2 - 2ab + b^2} \mid a\is X, b\is E[X]}$

$= \u{E[\o{X^2 - 2XE[X] + E[X]^2}]}$

$\given{\o{E[A - B + C]} = \u{E[A]} - \u{\u{E[B]}} + \u{\u{\u{E[C]}}}\mid A\is X^2, B\is 2XE[X], C\is E[X]^2}$

$= \o{E[X^2]} - \o{\o{\u{E[2XE[X]]}}} + \o{\o{\o{\u{\u{E[E[X]^2]]}}}}}$

$\given{\o{E[cA]} = \u{cE[A]}, \o{\o{E[b]}} = \u{\u{b}}\mid c\is 2E[X], A\is X, b\is E[X]^2}$
(using $XE[X] = E[X]X$)

$= E[X^2] - \o{2\u{E[X]E[X]}} + \o{\o{E[X]^2]}}$

$\given{\o{aa} = \u{a^2}}$ (exponent)

$= E[X^2] - 2\o{E[X]^2} + E[X]^2$

$\given{ac + bc = (a + b)c}$ (distributive)

$= E[X^2] + (-2 + 1)E[X]^2$

$= E[X^2] - E[X]^2$.

This establishes $E[(X - E[X])^2] = E[X^2] - E[X]^2$.

## Proof

To prove '_if $A$ then $Z$_' or, equivalently, '$A\implies B$' write
down $A$.  Below that write a true statement and the substitutions
to apply to get the next statement $B$. If the statements $P$ and
$P\implies Q$ occur in the derivation then the statement $Q$ can be
written (modus ponens).
The proof is done when the last statement is $Z$ &ndash; QED (quod erat demonstrandum).

__Theorem__. _If $x + x = x$ then $x = 0$_.

_Proof_: Start by writing down $A$.

$x + x = x$

$\given{a = b \implies a + c = b + c\mid a\is x + x, b\is x, c\is (-x)}$

$x + x = x\implies x + x + (-x) = x + (-x)$

$\given{\text{modus ponens}}$

$x + \u{x + (-x)} = \u{x + (-x)}$

$\given{\o{a + (-a)} = \u{0}\mid a\is x}$ (inverse)

$\u{x + \o{0}} = \o{0}$

$\given{\o{a + 0} = \u{a}\mid a\is x}$ (identity)

$\o{x} = 0$

This shows $x + x = x$ implies $x = 0$.

It is good form to explicitly state when a proof has been completed.
This proof has been completed. QED.
