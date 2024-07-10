---
title: Principal Component Analysis
author: Keith A. Lewis
institution: KALX, LLC
email: kal@kalx.net
classoption: fleqn
abstract: Cloud summarizing
...

\newcommand\RR{\bm{R}}

Given a cloud of vectors $S = \{x_1,\ldots,x_m\}$ in $\RR^n$ what single vector
"best" represents the location of the cloud?
If $m = 1$ then obviously $\bar{x}_1 = x_1$ is the solution to this.
If $m = 2$ then the solution $\bar{x}_1 = (x_1 + x_2)/2$ seems
to be a likely candidate.
In general we might suspect the average $\bar{x}_1 = \sum_{j=1}^m x_j/m$
is the best representation of location.


