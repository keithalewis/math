---
title: Lean
author: Keith A. Lewis
classoption: fleqn
fleqn: true
---
\newcommand\implies{\Rightarrow}

## Well-Formed Formula

Every mathematical system has rules (_syntax_) for what symbols can
be written for a valid formula. There are many different mathematical
systems each with their own rules. For example, in Propositional Calculus
if $P$ and $Q$ are well-formed then so is $P\wedge Q$. A complete list of
rules in BNF is

```
    variable ::= <single character> | ⫟ | ⫠
    formula  ::= variable
               | ¬ formula
               | (formula ∧ formula)
               | (formula ∨ formula)
               | (formula → formula)
               | (formula ↔ formula)
```

As usual in mathematics, simple definitions get complicated with niggling details.
(dogs and other philosophers)
The single character may not be $\top$, $\bot$, $\neg$, or any of the four other
logical connectives. There is also the possibility we will run out of characters.
There a are finite number of [Unicode](https://www.unicode.org/faq/basic_q.html) code points
of which only 159,801 correspond to characters. A _code point_ corresponds to a non-negative integer
and is denoted `U+<n>` where `<n>` is in the range `0` to hexadecimal `10FFFF`.
The propositional calculus is not constrained by Unicode 
so we have a countably infinite set of "characters".

The Unicode standard does not specify the screen rendering of a _glyph_
corresponding to a code point.
The character "P" has several renderings:

+-----------+------------+--------------------------------------+
| Glyph     | Code Point | \ Name                               |
+===========+============+:=====================================+
| P         | `U+0050`   | \ LATIN CAPITAL LETTER P             |
+-----------+------------+--------------------------------------+
| ℙ         | `U+2119`   | \ DOUBLE-STRUCK CAPITAL P            |
+-----------+------------+--------------------------------------+
| 𝑃         | `U+1D443`  | \ MATHEMATICAL ITALIC CAPITAL P      |
+-----------+------------+--------------------------------------+
| 𝐏         | `U+1D40F`  | \ MATHEMATICAL BOLD CAPITAL P        |
+-----------+------------+--------------------------------------+
| 𝑷         | `U+1D477`  | \ MATHEMATICAL BOLD ITALIC CAPITAL P |
+-----------+------------+--------------------------------------+
| 𝔓         | `U+1D513`  | \ MATHEMATICAL FRAKTUR CAPITAL P     |
+-----------+------------+--------------------------------------+

<!-- lean code to write propositions -->

We can use the BNF grammar to generator formulas such as $P$, $\neg P$, $Q$, $\neg P\vee Q$, etc.

## Natural Deduction

Gentzen invented natural deduction to formalize mathematical reasoning.
if $A$ and $A\implies B$ then $B$.

A _sequent_ $\Gamma\vdash\Delta$ where the _antecdent_ $\Gamma$ and
_succeedent_ $\Delta$ are collections (possibly empty) of well-formed formulas.
A sequent is also called a _judgement_ and is read "If all formulas
in $\Gamma$ hold then at least one formula in $\Delta$ holds.
