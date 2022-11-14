\newcommand{\RR}{\mathbf{R}}
\newcommand{\NN}{\mathbf{N}}
\newcommand{\ZZ}{\mathbf{Z}}
\newcommand{\Var}{\operatorname{Var}}
\newcommand{\Cov}{\operatorname{Cov}}

# File System Analytics

## Arrays

For $n\in\NN$ use $n = \{0,1,\ldots,n-1\}$.

Define $n\colon\ZZ\to n$ by $m\mapsto \mod(m,n)$.

$x\in\RR^n$ is a function $n\to\RR$. $x\%n\colon\ZZ\to\RR$ so $x\%n\in\RR^\ZZ$.

$f\colon\Prod_{i\in I} X_i \to \Prod Y_{j\in J}$

Notation for index maps $\Prod_{i\in I} X_i) \to \Prod Y_{j\in J}$

readdir - functions (x--), inputs (-r*), outputs (-*w)

attr - functions: signature (name: type)
       inputs: n-dim homogeneous array
       outputs: n-dim homogeneous array determined by function and inputs

```
$ ls -l
-x--       black
--r-       forward
--r-       vol
--r-       strike
--rw       value

$ cat forward
100
$ cat vol
$ 0.1
$ cat strike
100
$ black
$ cat value
3.9...
```

If no ouputs use memfd_create to assign a name to the ouput.

## Array

Layout: | n | d[0] | ... | d[n-1] | x[0] | ... | x[d[0] * ... * d[n-1] - 1] |

```
// x[i0][i1]...
size_t index(size_t n, const size_t* d, const size_t* i)
{
	size_t ind = 0;

	if (size_t i = 0; i < n; ++i) {
		ind = d[0] + 
	}

	return ind;
}
```

```
// black.cpp
double black(double f, double s, double k)
{
	double x = moneyness(f, s, k);

	return k*P(x) - f*P(x + s);
}

int main(int ac, const char* av)
{
	// if forward, vol, strike not in cwd get from command line
	// `black f - k ` looks for vol
	
	// if value not in cwd set up memory mapped file

}
```
