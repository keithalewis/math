\newcommand\cat[1]{\mathbf{#1}}
\newcommand\RR{\mathbf{R}}

Mon cher et illustre maître,

I hope you don't mind me bothering you with my thoughts on mathematical
finance.  I've been following your work and think you are more advanced
than any researcher I am aware of.

When I was in graduate school I read the letters Albert Einstein sent
to Élie Cartan asking for his help in understanding differential
geometry for the general theory.  That is how Cartan would start all
his responses to Einstein. The left page was in English and the right
page was in French.  I was just trying to improve on the two years of
French I took as an undergrad.

Cartan's PhD thesis was fixing up Killing's characterization of Lie groups.
Completely ordered Archimedian fields win the unique characterization prize.
Vector spaces come in second with dimension.
If you add a topology making group multiplication continuous, semi-simple Lie groups
come in a distant but thrilling third with Dynkin diagrams.
It seems God has an inordinate fondness for $SL(2,\RR)$.

Of course volatility is path dependent. Black-Scholes and Merton give no answer to
what volatility to use even for the initial delta hedge of a European option.
Every trader knows if they see gyrating underlying movements they need to update their first pick.

I'm sure you've already thought of this, but an Ito process with $dS/S =
r\,dt + \Sigma_t\,dB$ where $\Sigma^2_t =  (1/t)\int_0^t (dS_s/S_s)\,ds$
might be a more accurate model of how traders actually behave.

Here is a funny observation that I might be making an elementary mistake about:

__Lemma__. _If $\Sigma^2_t =  (1/t)\int_0^t (dS_s/S_s)^2$ and $\Sigma$ is an Ito process
then $\Sigma$ is constant_.

_Proof_. Since $(dS/S)^2 = \Sigma^2\,dt$, clearly $d(t\Sigma^2) = \Sigma^2\,dt$.
We also have $d(t\Sigma^2) = t\,d\Sigma^2 + \Sigma^2\,dt$ so $d\Sigma^2 = 0$.

What am I missing here?
