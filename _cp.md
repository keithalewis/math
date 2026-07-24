---
title: Conformal Prediction
author: Keith A. Lewis
abstract: Model free uncertainty measure.
classoption: fleqn
fleqn: true
---

\newcommand\bs[1]{\boldsymbol{{#1}}}
\newcommand\RR{\bs{R}}
\newcommand\AA{\mathcal{A}}

The basic prediction problem is
given samples $(x_1,y_1), \ldots, (x_n, y_n)$ how can we predict $y_{n+1}$ given $x_{n+1}$?
One approach is to find a function $f$ based on the first $n$ samples
and let $y_{n+1} = f(x_{n+1})$.

Linear regression assumes $f(x) = ax + b$ for some constants $a$ and $b$ then
minimizes the square error $E = \sum_i (ax_i + b - y_i)^2$ over $a$ and $b$.
Letting $\bar{x} = (1/n)\sum_i x_i$ $\bar{y} = (1/n)\sum_i y_i$ 
be the sample mean of the $x$ and the $y$ samples respectively we get
$$
	a = \frac{\sum_{i=1}^n (x_i - \bar{x})(y_i - \bar{y})}{\sum_{i=1}^n (x_i - \bar{x})^2}, b = \bar{y} - a\bar{x}
$$
One problem with this is that outliers $\epsilon_i = ax_i + b - y_i$ 
can have a big effect on $a$ and $b$. One approach is to throw out low and high
outliers if they they do not _conform_ to the sample data.

More generally, we want to find a function $f_\theta$ and use the data to estimate $\theta$.
Linear regression is the special case $f_{(a,b)}(x) = ax + b$.

## Random Variables

In order to make rigorous statements we need to introduce random variables
and make some assumptions.
A random variable is a variable, a symbol that can take the place of
a number in equations and inequalities, together with a specification
of the probability of the values it can take.
A _discrete_ random variable $X$ is defined by the probability $X$
takes on the value $x_j$, ${P(X = x_j) = p_j}$
where ${p_j > 0}$ and ${\sum_j p_j = 1}$.

Every random variable $X$ is completely determined
by its _cumulative distribution function_ ${F_X(x) = F(x) = P(X\le x)}$.
A _probability space_ is a set $\Omega$ of possible outcomes, an algebra of sets $\AA$ on
$\Omega$, and a probability measure $P\colon\AA\to [0,1]$.
A _random variable_ is an $\AA$-measurable function $X\colon\Omega\to\RR$.
Its cdf is ${F(x) = P(\{\omega\in\Omega\mid X(\omega)\le x\})}$.
The function $X$ is $\AA$-measurable if $\{X\le x\}\in\AA$ for all $x\in\RR$.

The _joint distribution_ of two random variables $X,Y\colon\Omega\to\RR$ is 
$F_{X,Y}(x, y) = P(X\le x, Y\le y)$. The variables $X$ and $Y$ are
_independent_ if $P(X\le x, Y\le y) = P(X\le x)P(Y\le y)$.

To make rigorous statements we need to replace sample data ${\{(x_i,y_i)\}}$
with random variables ${\{(X_i, Y_i)\}}$.
Our formulas above now make $a$ and $b$ into random variables.
We use the notation $\hat{a}$ and $\hat{b}$ to indicate
replacement of the numbers $x_j$ by the random variable $X_j$ and $y_j$ by $Y_j$.
This allows us to consider, e.g., the mean and variance of $\hat{a}$ and $\hat{b}$.

## Measurement

Let's start with a simple problem. Suppose we are given observations ${\{x_1,\ldots,x_n\}}$
of a random variable $X$, how do we find the cdf defining it?
The _empirical distribution_ is the cdf of the discrete random variable
$X$ with $P(X = x_j) = 1/n$. That gives us a guess at the actual cdf, but how good is our guess?

Assume the actual cdf is $F$. We can define independent random variables $X_j$ that have
distribution $F$ and define $X_n = $.


