---
title: RAII
author: Keith A. Lewis
institution: KALX, LLC
email: kal@kalx.net
classoption: fleqn
abstract: Worst name ever for built-in types.
...

\newcommand{\RR}{\mathbf{R}}
\newcommand{\FF}{\mathbf{F}}
\renewcommand{\AA}{\mathcal{A}}
\newcommand{\BB}{\mathcal{B}}
\newcommand{\Alg}{\mathop{\rm{Alg}}}

_RAII_ is an acronym for Resource Acquistion is Initialization.
A common, and valid, complaint about C++ is that it requires you
to allocate and deallocate memory. If you get those dance steps
wrong your program can spectacularly fail.

Some very smart people have come up with ways to
free users from manually keeping track of memory.
C++ makes it possible to define new types that behave like
built-in types. You don't have to think about allocating
an `int` and deallocating it when done using it.
RAII lets you think hard once and use the new type
just like an `int`.

The simplest example of a `string` class is:

```C++
class string {
	char* s;
	int n;
public:
	// constructor
	string(char* _s, int _n)
	{
		n = _n;
		s = new char[n]; // allocate n characters
		for (int i = 0; i < n; ++i) {
			s[i] = _s[i];
		}
		
	}
	// destructor
	~string()
	{
		delete [] s; // delete n characters
	}
}
```

You c
