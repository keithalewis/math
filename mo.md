---
title: Monoid
author: Keith A. Lewis
institute: KALX, LLC
classoption: fleqn
fleqn: true
abstract: Concatination
...


A moniod is a set $M$ with a binary operation $M\times M\to M$ that is
associative and has an identity element $e$. If $s,t\in M$ we write
$st\in M$ for the result of the binary operation. The identity satisfies $es = s = se$, $s\in M$.
The associative law is $(st)u = s(tu)$ so $stu$ is unambiguous.

Given a function $\mu\colon M\to\bm{R}$ with $\mu e = 0$ we can define a measure
on finite subsets of $S\subseteq M$ by $\mu(S) = \sum_{s\in S} \mu s$.
