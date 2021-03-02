---
title: Machine Learning
author: Keith A. Lewis
institution: KALX, LLC
email: kal@kalx.net
classoption: fleqn
abstract: Interpolation in high dimensions
...

\newcommand\RR{\bm{R}}
\newcommand\CC{\bm{C}}
\newcommand\FF{\bm{F}}
\newcommand\ker{\operatorname{ker}}
\newcommand\ran{\operatorname{ran}}

Machine learning is interpolation. Given $x_i$ and $y_i$ we
want to find a function $f$ with $f(x_i) \approx y_i$ for all $i$.
If the $x_i$ and $y_i$ are real numbers then there is a well developed
theory for this. I can highly recommend learning about _basis splines_.

If the $x_i$ are each several megabytes of pixels and the $y_i$ are only
allowed the values true or false the problem becomes much more complicated.
Machines identifying pictures that look like noise to
the human eye as stop signs is a well-known example indicating the
difficulty.

Moore's law has covered up the inconvenient truth that there has been
little recent advancement in machine learning.  Even people who never
learned proper programming skills can now use a language as inefficient
as Python to produce lots of results that are not-obviously-wrong. As
Freud documented in "The Interpretation of Dreams", it takes a long time
to sort things out correctly.

The human brain has evolved over 100,000's of years to make up stories.
Michael Gazzaniga's research starting in the 70's on people who had
their corpus callousm severed brought to light that there is not merely
a right hemisphere/left hemisphere phenomenon; there are thousands of
independent agents simultaneously vying for the first-place prize of
human consciousness. The tricky little bastards will make up any story to get
that. The human brain was definitely not evolved to handle the plethora
of tricky Lilliputian bastards in five billion other people's brains
that are getting up every day and want to use that for their advantage.

## Reinforcement Learning

The success of Alpha Zero in beating human experts in the games of go, shogi, and
chess as if they were small babies has been a shining achievement of
of machine learning, but let's not forget
[Arthur Samuel's](https://history-computer.com/arthur-samuel-biography-history-and-inventions/)
checkers program from 1959. Lee Se-dol, Yoshiharu Habu, and Magnus Carlsen
can take comfort in the fact that the checkers world champion at the time
had his ego slowly but relentlessly crushed as he realized a program written
by someone admitting to know little about checkers beat him in game after game.

Samuel used reinforcement learning and alpha-beta pruning, as does Alpha Zero.
Of course he did not have 5,000 TPU's and four 44-core CPU's at his disposal
that enable Monte Carlo tree search to plumb greater plys. 

Reinforcement learning originated from the multi-armed bandit problem;
given serial choices of $n$ random rewards how should you choose among them?
Single-armed bandit is slang for a slot machine. Given $n$ slot-machines
how should you play to maximize your take? Strategies involve
a tradeoff between _exploring_ the returns of each machine and _exploiting_
the machines that seem to have the highest payoff.
Some wag at RAND suggested dropping leaflets over Germany during WWII describing
the problem in order to divert their best minds.

There is still no canonical solution to this important and practical problem. If
you are running a research group how do you allocate your budget to various teams?
The composition of teams can change over time and you can use pep talks to
inspire people but mathematics is limited in its ability to capture the
messy reality of the world we live in.

### Markov Decision Process

The mathematical model used for reinforcement learning is a _Markov decision process_.

A MDP is defined by states $S$, actions $A$, rewards
$R\subseteq\bold{R}$, and transition probabilities, $p(s',r'|s,a) =
P(S_{t+1} = s', R_{t+1} = r'\mid S_t = s, A_t = a)$; the probability
of moving to state $s'$ and receive reward $r'$ given the agent is in
state $s$ and takes action $a$ at time $t$.

Some models specify $A_s\subseteq A$, for $s\in S$, the set of possible
actions when in state $s$.

At time $t$ the agent in state $s$ chooses an action $a$. This results in a new
state $s'$ and reward $r'$ at time $t+1$ with probability $p(s',r'|s,a)$.
In the multi-armed bandit problem there is only one state:
the set of machines to play. The action is which machine to play.
This results in the reward $r'$ with probability $p(r'|a)$
after you drop your quarter in machine $a$. The next round still has the same
set of machines to play and associated blue-haired old ladies entertaining
themselves by slowly losing their retirement savings.

A _policy_, $π(a|s)$, specifies the probability of taking action $a$
given the agent is in state $s$. This results in the sequence of random
variables $S_{t + k}$, $R_{t + k}$, $k > 0$, given $S_t = s$.

Reinforcement learning is the study of how to find the optimal policy
given a definition of optimal.

A _gain_ (or _loss_) function is any function of future rewards,
$$
G_t = g_t(R_{t+1}, R_{t+2}, \ldots).
$$
Common choices are are average rewards
$$
G_t = (1/k) \sum_{j=1}^k R_{t + j}
$$
and exponential decay 
$$
G_t = \sum_{k > 0} γ^k R_{t + k},
$$
where $0<γ<1$ is the _discount factor_.

The _state-value function_ for policy $π$ is
$V_π(s) = E[G_t\mid S_t = s]$.
(Note that, by the Markov property, it does not depend on $t$.)
For exponential decay the law of total probability yields
$$
V_π(s) = \sum_a π(a|s) \sum_{s',r'} p(s',r'|s,a)[r' + γ V_π(s')].
$$
We want to find $V^*(s) = \max_π V_π(s)$.
$$
V^*(s) = \max_{a\in A_s} \sum_{s',r'} p(s',r'|s,a)[r + γ V^*(s')].
$$
This is called the _Bellman optimality equation_.

The _action-value function_ for $π$ is
$Q_π(s,a) = E[G_t\mid S_t = s, A_t = a]$.
We want to find $Q^*(s,a) = \max_π Q_π(s,a)$.
Note
$$
Q^*(s,a) = E[R_{t+1} + γ V^*(S_{t+1})|S_t = s, A_t = a].
$$
gives the optimal value function.

### Bandits

An $n$-armed bandit is a MDP with one state and $n$ actions.
Solutions should _explore_ the $n$ available actions and
_exploit_ the most promising. In this case the action-value function does
not depend on the state.  If we knew the reward distributions for each
action then the optimal strategy would be to always select the action
with the largest expected value. This is not how people actually play.
Nobel prizes have been won by demonstrating sure rewards are preferred over
uncertain rewards having larger expected value. People also seem to
prefer uncertain losses over certain loss. (Reflection.)

Machina, Rappoport, Tversky, Khaneman, ...

The _$ε$-greedy_ strategy selects the action maximizing the current
action-value function with probability $1-ε$ and a random action
with probability $ε$. The action-value function is updated based
on the observed reward.

### Monte Carlo Methods

The _first visit_ Monte Carlo prediction approximates the state-value function for a given policy.
Choose an initial state-value function $V(s)$ and generate actions using $π$.
For each state in the run update $V(s)$ to be the sample average of the returns.

## Temporal Distance Learning

TDL is a model-free method that learns by bootstrapping the value function.

The simplest example, $TD(0)$, specifies a _learning rate_ $α$ and updates
$V(s)$ to $(1 - α)V(s) + α(r + γV(s'))$.
