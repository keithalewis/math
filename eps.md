# Epsilon

$f(x + a\epsilon) = \sum_{n=0}^\infty f^{(n)}(x_0)a^n\epsilon^n/n!$.

$$
\begin{aligned}
f(x + a\epsilon + b\epsilon^2)
&= f(x + (a + b\epsilon)\epsilon) \\
&= \sum_{n=0}^\infty f^{(n)}(x)(a + b\epsilon)^n\epsilon^n/n! \\
&= \sum_{n=0}^\infty f^{(n)}(x) (\sum_{k=0}^n\binom{n}{k} a^{n-k} b^k\epsilon^k)\epsilon^n/n!\\
&= \sum_{k=0}^\infty \sum_{n=k}^\infty f^{(n)}(x) (\binom{n}{k} a^{n-k} b^k\epsilon^k)\epsilon^n/n!\\
&= \sum_{k=0}^\infty \sum_{n=0}^\infty f^{(n+k)}(x) (\binom{n+k}{k} a^n b^k\epsilon^k)\epsilon^{n + k}/(n + k)!\\
&= \sum_{k=0}^\infty b^k\epsilon^{2k} \sum_{n=0}^\infty f^{(n+k)}(x) (\binom{n+k}{k} a^n)\epsilon^n/(n + k)!\\
&= \sum_{k=0}^\infty b^k\epsilon^{2k}/k! \sum_{n=0}^\infty f^{(n+k)}(x) a^n\epsilon^n/n!\\
&= \sum_{k=0}^\infty b^k\epsilon^{2k}/k! d^k/dx^k \sum_{n=0}^\infty f^{(n)}(x) a^n\epsilon^n/n!\\
&= \sum_{k=0}^\infty b^k\epsilon^{2k}/k! d^k/dx^k f(x + a\epsilon)\\
\end{aligned}
$$
