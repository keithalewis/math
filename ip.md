---
title: Ito Processes
author: Keith A. Lewis
institution: KALX, LLC
email: kal@kalx.net
classoption: fleqn
abstract: Brownian motion and the heat equation.
...

A large class of [stochastic
processes](/content/enforced/201637-FA22_FRE-GY_6233_1_A/sp.html) can be
defined using standard [Brownian
motion](/content/enforced/201637-FA22_FRE-GY_6233_1_A/bm.html)
[(B_t)\_{t\\ge 0}]{.math .inline}.

The *stochastic differential equation* [ dX = \\mu\\,dt + \\sigma\\,dB,
X\_{t_0} = x_0 ]{.math .display} is shorthand for [ X_t = x_0 +
\\int\_{t_0}\^t \\mu\\,ds + \\int\_{t_0}\^t \\sigma\\,dB_s, ]{.math
.display} which is shorthand for [ X_t(\\omega) = x_0 + \\int\_{t_0}\^t
\\mu(s,\\omega)\\,ds + \\int\_{t_0}\^t
\\sigma(s,\\omega)\\,dB_s(\\omega), ]{.math .display} where
[\\mu,\\sigma\\colon
\[0,\\infty)\\times\\Omega\\to\\boldsymbol{R}]{.math .inline} are the
*drift* and *diffusion* coefficients, respectively. The first integral
is (pointwise in [\\omega]{.math .inline}) Riemann and the second is the
*Ito integral*.

::: {#ito-integral .section .level2}
## Ito Integral

Just as an integral is a continuous linear transformation from a vector
space of functions to the real numbers, a *stochastic integral* is a
continuous linear transformation from a vector space of functions to a
vector space of random variables.

Recall that Brownian motion is a stochastic process
[B_t\\colon\\Omega\\to\\boldsymbol{R}]{.math .inline}, [t\\ge 0]{.math
.inline}, where [B_t(\\omega) = \\omega(t)]{.math .inline} for
[\\omega\\in\\Omega = C\[0,\\infty)]{.math .inline}, the space of
continuous function from [\[0,\\infty)]{.math .inline} to the real
numbers [\\boldsymbol{R}]{.math .inline}. The information available at
time [t]{.math .inline} is specified by [\\mathcal{F}\_t]{.math
.inline}, the smallest [\\sigma]{.math .inline}-algebra for which
[(B_s)\_{0\\le s\\le t}]{.math .inline} are measurable.

If [\\omega\\mapsto\\sigma(t, \\omega)]{.math .inline} is
[\\mathcal{F}\_t]{.math .inline} measurable (only depends on the
information available at time [t]{.math .inline}) then so is the Ito
integral [\\int_0\^t \\sigma(s, \\omega)\\,dB_s(\\omega)]{.math .inline}
defined as a limit [ \\int_0\^t \\sigma(s, \\omega)\\,dB_s(\\omega) =
\\lim\_{\\Delta T\\to 0} \\sum\_{0\\le j \< n} \\sigma(t_j,
\\omega)\\,\\Delta B_j(\\omega) ]{.math .display} where [0 = t_0 \<
\\cdots \< t_n = t]{.math .inline} is a partition of [\[0,t\]]{.math
.inline} and [\\Delta B_j = B\_{t\_{j+1}} - B\_{t_j}]{.math .inline}. We
let [T = \\{t_j\\}]{.math .inline} denote the partition and define
[\\Delta T = \\max\_{0\\le j \< n}\\{\\Delta t_j\\}]{.math .inline}. The
set of all partitions of [\[0,t\]]{.math .inline} is a
[net](https://en.wikipedia.org/wiki/Net_(mathematics)) and the limit is
defined as described therein.

**Exercise**. *Show [E\[\\sum\_{0\\le j \< n} B\_{t_j}\\Delta B_j\] =
0]{.math .inline} for any partition [0 = t_0 \< \\cdots \< t_n =
t]{.math .inline} of [\[0,t\]]{.math .inline}*.

This shows [E\[\\int_0\^t B_s\\,dB_s\] = 0]{.math .inline}. Later we
will see [\\int_0\^t B_s dB_s = (B_t\^2 - t)/2]{.math .inline}.

**Exercise**. *Show [E\[\\sum\_{0\\le j \< n} B\_{t\_{j+1}}\\Delta B_j\]
= t \\not= 0]{.math .inline}*.

*Hint*: [E\[B_t B_u\] = \\min\\{t, u\\}]{.math .inline}. Note the
integrand [\\omega\\mapsto B\_{t\_{j+1}}(\\omega)]{.math .inline} is
*not* [\\mathcal{F}\_{t_j}]{.math .inline} measurable.

The Riemann integral [\\int_0\^t f(s)\\,ds = \\lim\_{\\Delta T\\to 0}
\\sum_j f(t_j\^\*)\\Delta t_j]{.math .inline} converges to the same
value if [f]{.math .inline} is continuous and [t_j\^\*]{.math .inline}
is *any* point in [\[t_j, t\_{j+1}\]]{.math .inline}. Unlike the Riemann
integral, the Ito integral requires the left endpoint be used.

**Exercise**. *Show [E\[\\sum\_{0\\le j \< n} (\\Delta B_j)\^2\] =
t]{.math .inline} for any partition*.

*Hint*: [E\[(\\Delta B)\^2\] = \\Delta t]{.math .inline}.

**Exercise**. *Show [\\lim\_{\\Delta T\\to 0}\\sum\_{0\\le j \< n}
(\\Delta t_j)\^2 = 0]{.math .inline}*.

*Hint*: [\\sum_j (\\Delta t_j)\^2 \\le (\\max_j \\Delta t_j) \\sum_j
\\Delta t_j = (\\max_j \\Delta t_j)t]{.math .inline}.

Shorthand notation for this is [(dt)\^2 = 0]{.math .inline}.

**Exercise** *Show [\\lim\_{\\Delta T\\to
0}\\operatorname{Var}\[\\sum\_{0\\le j \< n} (\\Delta B_j)\^2\] =
0]{.math .inline}*.

*Hint*: [E\[(\\Delta B)\^4\] = 3(\\Delta t)\^2]{.math .inline}.

Although [\\sum\_{0\\le j \< n} (\\Delta B_j)\^2]{.math .inline} is
random for any given partition, it always has expected value [t]{.math
.inline} and its variance tends to 0 as the partition gets finer.
Shorthand notation for this is [(dB)\^2 = dt]{.math .inline}.

**Exercise** *Show [\\sum\_{0\\le j \< n} \\Delta B_j \\Delta t_j]{.math
.inline} has mean 0 and its variance tends to 0 as [\\Delta T\\to
0]{.math .inline}*.

Shorthand notation for this is [dB\\,dt = 0]{.math .inline}.
:::

::: {#higher-dimensions .section .level2}
## Higher Dimensions

The Ito integral can be extended to [m]{.math .inline}-dimensional
Brownian motion, [B_t = (B_t\^1,\\ldots,B_t\^m)]{.math .inline}, where
the [B_t\^j]{.math .inline} are independent standard Brownian motions.
In this case [\\mu\\colon
\[0,\\infty)\\times\\Omega\\to\\boldsymbol{R}\^n]{.math .inline} is
vector-valued and [\\sigma\\colon
\[0,\\infty)\\times\\Omega\\to\\boldsymbol{R}\^{n,m}]{.math .inline} is
matrix-valued. The [\\sigma dB]{.math .inline} term is the matrix-vector
product.

::: {#stochastic-integral .section .level3}
### Stochastic Integral

The Ito integral can be generalized to stochastic process other than
Brownian motion. If [X_t]{.math .inline} is any stochastic process we
can define [dY_t = \\sigma\\,dX_t]{.math .inline}, [Y_0 = y]{.math
.inline}, by [ Y_t(\\omega) = y + \\lim\_{\\Delta T\\to 0}\\sum_j
\\sigma(t_j, \\omega) \\Delta X_j(\\omega) ]{.math .display} where
[\\Delta X_j = X\_{t\_{j+1}} - X\_{t_j}]{.math .inline}. For [Y_t]{.math
.inline} to be [\\mathcal{F}\_t]{.math .inline}-measurable we need
[\\sigma]{.math .inline} to be adapted. Of course there must be
restrictions on [X_t]{.math .inline} too in order to ensure convergence
and continuity. If [X_t]{.math .inline} is a martingale that is (almost
surely) continuous from the right and has left limits then a
well-behaved stochastic integral can be define. Note Brownian motion
satisfies this since it is almost everywhere continuous. This can be
generalized by adding a stochastic process to the martingale that has
bounded variation. As shown in [\[@Pro04\]]{.citation cites="Pro04"},
this is the most general process for which a well-behaved stochastic
integral can be defined.
:::
:::

::: {#ito-process .section .level2}
## Ito process

An Ito process [X_t:\\Omega\\to\\boldsymbol{R}]{.math .inline},
[t\\ge0]{.math .inline}, satisfies the SDE [ dX_t(\\omega) =
\\mu(t,\\omega)\\,dt + \\sigma(t,\\omega)\\,dB_t(\\omega), X\_{t_0} =
x_0, t\\ge t_0. ]{.math .display} where
[\\mu,\\sigma:\[0,\\infty)\\times\\Omega\\to\\boldsymbol{R}]{.math
.inline} are functions of time and the Brownian sample path
[\\omega\\in\\Omega]{.math .inline}. If [\\omega\\mapsto \\mu(t,
\\omega)]{.math .inline} is [\\mathcal{F}\_t]{.math .inline} measurable
for all [t]{.math .inline} then so is the Riemann integral
[\\omega\\mapsto \\int_0\^t \\mu(s, \\omega)\\,ds]{.math .inline}. If
[\\omega\\mapsto \\sigma(t, \\omega)]{.math .inline} is
[\\mathcal{F}\_t]{.math .inline} measurable for all [t]{.math .inline}
then so is the Ito integral [\\omega\\mapsto \\int_0\^t \\sigma(s,
\\omega)\\,dB_s(\\omega)]{.math .inline}.

**Exercise**. *In this case the Ito integral [\\int_0\^t \\sigma
dB]{.math .inline} is a martingale.*

*Hint*: [E\[B_u - B_t\\mid\\mathcal{F}\_s\] = 0]{.math .inline} if
[s\\le t\\le u]{.math .inline}.

**Exercise**. *If [dX = \\mu\\,dt + \\sigma\\,dB]{.math .inline} is a
martingale then [\\mu = 0]{.math .inline}*.

*Hint*: Show [\\int_t\^u E_t\[\\mu(s,\\omega)\]\\,ds = 0]{.math .inline}
for [t\\le u]{.math .inline}, [\\omega\\in\\Omega]{.math .inline}.

**Exercise**. *The sum of Ito processes is an Ito process*.

*Hint*: If [dX\^j = \\mu_j\\,dt + \\sigma_j\\,dB]{.math .inline} are Ito
processes what are [\\mu]{.math .inline} and [\\sigma]{.math .inline}
for [X = \\sum_j X_j]{.math .inline}? Write out the integrals in full.

If [X_t]{.math .inline} and [Y_t]{.math .inline} are Ito processes then
so is their product [X_tY_t]{.math .inline}.

**Exercise**. *Show [d(XY) = Y\\,dX + X\\,dY + dX\\,dY]{.math .inline}*.

*Hint*: Show [X_t Y_t = X_0 Y_0 + \\lim\_{\\Delta T\\to 0}\\sum_j
Y_j\\Delta X_j + Y_j\\Delta Y_j + \\Delta X_j\\Delta Y_j]{.math .inline}
where where [\\Delta X_j = X\_{t\_{j+1}} - X\_{t_j}]{.math .inline},
etc., using [(X_j + \\Delta X_j)(Y_j + \\Delta Y_j) = X_jY_j +
Y_j\\Delta X_j + X_j\\Delta Y_j + \\Delta X_j \\Delta Y_j]{.math
.inline}.

**Exercise**. *If [dX = \\mu\\,dt + \\sigma\\,dB]{.math .inline} and [dY
= \\nu\\,dt + \\tau\\,dB]{.math .inline} show [d(XY) = (\\mu Y + \\nu
X + \\sigma\\tau)\\,dt + (\\sigma + \\tau)\\,dB]{.math .inline}*.

*Hint*: Show [ \\begin{align\*} X_t(\\omega)Y_t(\\omega) = &X_0 Y_0 \\\\
&+ \\int_0\^t (\\mu(s,\\omega) Y_s(\\omega) + \\nu(s,\\omega)
X_s(\\omega) + \\sigma(s, \\omega)\\tau(s,\\omega))\\,ds \\\\ &+
\\int_0\^t (\\sigma(s,\\omega) + \\tau(s, \\omega))\\,dB_s(\\omega) \\\\
\\end{align\*} ]{.math .display}

The *Ito calculus* uses [(dt)\^2 = 0]{.math .inline}, [dt\\,dB = 0 =
dB\\,dt]{.math .inline}, and [(dB)\^2 = 0]{.math .inline} to simplify
such calculations. [ \\begin{align\*} d(XY) &= Y\\,dX + X\\,dY + dX\\,dY
\\\\ &= Y(\\mu\\,dt + \\sigma\\,dB) + X(\\nu\\,dt + \\tau\\,dB) +
(\\mu\\,dt + \\sigma\\,dB)(\\nu\\,dt + \\tau\\,dB) \\\\ &= (\\mu Y +
\\nu X + \\sigma\\tau)\\,dt + (\\sigma + \\tau)\\,dB. \\end{align\*}
]{.math .display}
:::

::: {#ito-diffusion .section .level2}
## Ito Diffusion

An *Ito diffusion* [\\bar{X}\_t(\\omega)]{.math .inline} satisfies [
d\\bar{X}\_t(\\omega) = \\bar{\\mu}(t,\\bar{X}\_t(\\omega))\\,dt +
\\bar{\\sigma}(t,\\bar{X}\_t(\\omega))\\,dB_t(\\omega), \\bar{X}\_{t_0}
= x, t \\ge t_0 ]{.math .display} where
[\\bar{\\mu},\\bar{\\sigma}\\colon
\[0,\\infty)\\times\\boldsymbol{R}\\to\\boldsymbol{R}]{.math .inline}.

Ito diffusions satisfy the *Markov property*. Loosely speaking, [E\[f(t,
\\bar{X}\_t)\\mid\\mathcal{F}\_t\] = E\[f(t, \\bar{X}\_t)\\mid
\\bar{X}\_t\]]{.math .inline}. The conditional expectation does not
depend on the trajectory [s\\mapsto X_s(\\omega)]{.math .inline}, [0\\le
s\\le t]{.math .inline}, it only depends on the final value
[X_t(\\omega)]{.math .inline}.
:::

::: {#ito-formula .section .level2}
## Ito Formula

If [X_t]{.math .inline} is an Ito diffusion and
[f\\colon\[0,\\infty)\\times\\boldsymbol{R}\\to\\boldsymbol{R}]{.math
.inline} then [Y_t = f(t, X_t)]{.math .inline} is also an Ito diffusion
satisfying the SDE [ dY_t = f_t(t, X_t)\\,dt + f_x(t, X_t)\\,dX_t +
\\frac{1}{2} f\_{xx}(t, X_t) (dX_t)\^2 ]{.math .display} If [X_t =
B_t]{.math .inline} is standard Brownian motion then [dY_t = (f_t +
\\frac{1}{2}f\_{xx})\\,dt + f_x\\,dB]{.math .inline}.

**Exercise**. *If [f_t + \\frac{1}{2}f\_{xx} = 0]{.math .inline} then
[f(t,B_t)]{.math .inline} is a martingale*.

**Exercise**. *Show [f(t, x) = x\^2 - t]{.math .inline}, [f(t, x) =
se\^{\\sigma x - \\sigma\^2t/2}]{.math .inline}, and [f(t, x) =
e\^{-x\^2/2t}/\\sqrt{2\\pi t}]{.math .inline} satisfy [f_t +
\\frac{1}{2}f\_{xx} = 0]{.math .inline}*.
:::
