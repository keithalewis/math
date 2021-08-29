---
title: Musings on Mathematical Finance
author: Keith A. Lewis
institution: KALX, LLC
email: kal@kalx.net
classoption: fleqn
abstract: Waiting for Heisenberg, Schrodinger, and von Neumann
...

\newcommand\RR{\bm{R}}
\newcommand\AA{\mathcal{A}}

> _Much of current academic teaching and research has been criticized for
its lack of relevance, that is, of immediate practical impact. ... The
trouble is caused, however, not by an inadequate selection of targets,
but rather by our inability to hit squarely on them, ... by the palpable
inadequacy of the scientific means with which they try to solve
them. ... The weak and all too slowly growing empirical foundations
clearly cannot support the proliferating superstructure of pure, or
should I say, speculative economic theory.... By the time it comes to
interpretations of the substantive conclusions, the assumptions on which
the model has been based are easily forgotten. But it is precisely the
empirical validity of these assumptions on which the usefulness of the
entire exercise depends. ... A natural Darwinian feedback operating
through selection of academic personnel contributes greatly to the
perpetuation of this state of affairs_. -- Василий Васильевич Леонтьев


The Nobel Prize winning work of Fischer Black, Myron Scholes, and Robert Merton
had a profound influence on the application of Mathematical Finance
to the valuation of financial instruments.
They showed the probability of future prices were irrelevant to valuing
derivatives.

real-world

hedge - risk managment - How's my hedging?

Prize said value, but value comes from hedge.

In Physics when a theory does not fit observation, it is time to come up with
a new theory that does. In Mathematical Finance the problems to solve are
related to Economics and less tractable.

UV catastrophy and hydrogen atom
Leontiev won a Nobel prize for his model pioneering work

In physics, when a theory does not match observation it is time to come
up with a new theory.  This happened at the end of the 19th century when
physicists were getting a bit smug about the success of Newtow's theory
of gravity and Maxwell's theory of electromagnatism.  Some attribute
"there is nothing left but to carry measurement to a few more decimal
places" to Lord Kelvin. However there were two nagging problems: the
ultraviolet catastrophy and the spectrum of hydrogen atoms.

Max Plank could fit observed black-body radiation by assuming photons were
emitted in discrete packages. Rydberg noted the frequency of radiation
from hydrogen atoms was proportional to differences of the reciprocals of
squares of integers. The Bohr model of the hydrogen atom assumed electrons
orbited at distances equal to integer multiples of the Plack constant
divided by 2π and this agreed with Rydberg's empirical formula. What
could not be explained was how electons can orbit a nucleus as if it
were a planet without emitting radiation. Maxwell's theory said an
accelerating electron must do that.

Heisenberg and Schrodinger stepped up to provide the initial theories
of quantum mechanics. Heisenberg's original paper involved a clumsy
reinvention of matrix multiplication (later ... by Jordan) while
Schrodinger took a more principled approach based on the classical
equations of motion due to Lagrange and Hamilton. Eventually John von
Neumann reconciled these by showing both were identical to a theory
involving unbounded self-adjoint operators on Hilbert spaces.

Mathematical Finance is still at its 19th century fin de siècle stage.
We have had our Nobel prize winners ...
But we are still waiting for our Heisenberg and Schrodinger.
We will probably never have another von Neumann.

Shortly after Black, Scholes, and Merton \cite{BSM73}  Merton \cite{Mer76}
used the reflection principal of Brownian motion to derive
a closed form solution for the value of a barrier option.  When
used to value a barrier option that knocks in the second time the
barrier is touched it gives the wrong anser.  The theory says it should
have the same value as a barrier option that knocks in the first time
it is touched. In fact, the theory says a barrier option that knocks in
the millionth time the barrier is touched also has the same value.

This is a mathematical artifact of using geometric Brownian motion as
the model of stock prices and the unrealistic assumption that continuous
time hedging is possible.


## Notes

https://www.nobelprize.org/prizes/economic-sciences/1997/press-release/

for a new method to determine the value of derivatives.

Black, Merton and Scholes thus laid the foundation for the rapid
growth of markets for derivatives in the last ten years. Their
method has more general applicability, however, and has created
new areas of research – inside as well as outside of financial
economics. A similar method may be used to value insurance contracts
and guarantees, or the flexibility of physical investment projects.

Turned back of the envelope into math.

value only because hedge is perfect in their moddel.

Quesney (tableau) and Walras equilibrium theory.

Gosplan.
