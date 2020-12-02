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


To prove '_if $A$ then $Z$_' or, equivalently, '$A\implies B$' write
down $A$.  Below that write a true statement and the substitutions
to apply to get the next statement $B$. If the statements $P$ and
$P\implies Q$ occur in the derivation then the statement $Q$ can be
written (modus ponens).
The proof is done when the last statement is $Z$.

__Theorem__. _If $A$ is an abelian group then $x + x = x$ implies $x = 0$, for any $x\in A$_.

_Proof_:

$x + x = x$

$\given{a = b \implies a + c = b + c\mid a\is x + x, b\is x, c\is (-x)}$

$x + x = x\implies x + x + (-x) = x + (-x)$

$\given{\text{modus ponens}}$

$x + \u{x + (-x)} = \u{x + (-x)}$

$\given{\u{a + (-a)} = \o{0}\mid a\is x}$ (inverse)

$\u{x + \o{0}} = \o{0}$

$\given{\u{a + 0} = \o{a}\mid a\is x}$ (identity)

$\o{x} = 0$

QED (quod erat demonstrandum)

To prove '$A = \cdots = Z$' write
down $A$.  Below that write a true statement and the substitutions
to apply to get the next statement $=B$.
The equality is established when the last statement is $=Z$.

$E[\u{(X - E[X])^2}]$

$\given{\u{(a - b)^2} = \o{a^2 - 2ab + b^2} \mid a\is X, b\is E[X]}$

$= \u{E[\o{X^2 - 2XE[X] + E[X]^2}]}$

$\given{\u{E[A - B + C]} = \o{E[A]} - \o{\o{E[B]}} + \o{\o{\o{E[C]}}}\mid A\is X^2, B\is 2XE[X], C\is E[X]^2}$

$= \o{E[X^2]} - \o{\o{\u{E[2XE[X]]}}} + \o{\o{\o{\u{\u{E[E[X]^2]]}}}}}$

$\given{\u{E[cA]} = \o{cE[A]}, \u{\u{E[b]}} = \o{\o{b}}\mid c\is 2E[X], A\is X, b\is E[X]}$
(using $XE[X] = E[X]X$)

$= E[X^2] - \o{2\u{E[X]E[X]}} + \o{\o{E[X]^2]}}$

$\given{\u{aa} = \o{a^2}}$ (exponent)

$= E[X^2] - 2\o{E[X]^2} + E[X]^2$

$\given{ac + bc = (a + b)c}$ (distributive)

$= E[X^2] + (-2 + 1)E[X]^2$

$= E[X^2] - E[X]^2$.

This establishes $E[(X - E[X])^2] = E[X^2] - E[X]^2$.
