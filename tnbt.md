\newcommand\cat[1]{\mathbf{#1}}

Mon cher et illustre maitre,

I hope you don't mind me bothering you with my thoughts on mathematical
finance.  I've been following your work and think you are more advanced
than any researcher I am aware of.

When I was in graduate school I read the letters Albert Einstein sent to
Elie Cartan asking for help in understanding differential geometry for
his general theory.  That is how Cartan would start all his responses
to Einstein. I thought the Italians had that market cornered back then.

Cartan's PhD thesis was fixing up Killing's characterization of Lie groups.
Completely ordered Archemidian fields win the unique characterization prize.
Vector spaces come in second with dimension.
If you add a topology making group multiplication continuous, Lie groups
come in a distant but thrilling third with Dynkin diagrams if they are semi-simple.

Of course volatility is path dependent. Black-Scholes and Merton give no answer to
what volatility to use for the initial delta hedge. Every trader knows if
they see gyrating underlying movements they need to update their first pick.

Peter Carr asked me to review a paper last year where the author did not understand
the difference between an Ito process and an Ito diffusion. B-S/M seduced people
into stumbling under the street light of Markov diffusions and continuous time trading.

I'm sure you've already thought of this, but an Ito process with $dS_t/S_t =
r\,dt + \Sigma_t\,dB$ where $\Sigma^2_t =  (1/t)\int_0^t (dS_s/S_s)\,ds
= (1/t)\int_0^t \Sigma^2_s\,ds$, $\Sigma_0 = \sigma_0$,
is probably closer to how traders actually behave.

If this makes sense to you let's keep talking.

Les arbes tardif fondont le meure fruit.

$dS/S = r\,dt + \Sigma\,dB$.

$\Sigma^2 = (1/t)\int_0^t (dS/S)^2 = (1/t)\int_0^t \Sigma^2\,ds$.

$d\Sigma = \alpha\,dt + \beta\,dB$, $\Sigma_0 = \sigma_0$.

$d(t\Sigma^2) = t(2\Sigma\,d\Sigma + (d\Sigma)^2) + \Sigma^2\,dt$

$= t(2\Sigma\,d\Sigma + \beta^2\,dt) + \Sigma^2\,dt$

$= t(2\Sigma(\alpha\,dt + \beta\,dB) + \beta^2\,dt) + \Sigma^2\,dt$

$= (2t\alpha\Sigma + \beta^2 + \Sigma^2)\,dt + 2t\beta\Sigma\,dB$

$d(t\Sigma^2) = \Sigma^2\,dt$

$\beta = 0$ and $2t\alpha\Sigma = 0$.

