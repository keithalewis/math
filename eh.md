---
title: Error Handling in C++
author: Keith A. Lewis
institution: KALX, LLC
email: kal@kalx.net
classoption: fleqn
abstract: Go To statement considered annoying.
...

> _The great thing about computers is they do exactly what you tell them to do.
The awful thing about computers is they do exaclty what you tell them to do._

It is expensive to write program that have no bugs. It is also expensive
to debug programs. This note endeavours to strke a happy medium by
suggesting simple ways of minimizing the number of bugs in a program.

> _There are two ways to write code: write code so simple there are
obviously no bugs in it, or write code so complex that there are no
obvious bugs in it_. -- Tony Hoare

### Factor Your Code

Tony was right, "If it's complicated, it's wrong" is my mantra.
Every function should be succinct and do one thing.
Spend some time thinking about names so using
code reads naturally.

C++ has functions and classes with member functions.
Prefer standalone functions to classes.
If a function has some arguments that do not change often then
put those in the class constructor and call the
standalone function from a similarly named member function.

```
// option.h - Fischer Black option greeks.

namespace option {

	// Return put value given forward, vol, strike, and time in years to expiration.
	double put_value(double f, double s, double k, double t);

	// Return derivative put of value with respect to forward.
	double put_delta(double f, double s, double k, double t);

	// Return second derivative of put value with respect to forward.
	double put_gamma(double f, double s, double k, double t);

	// Fischer Black European put option valuation and greeks.
	class put {
		double k, t;
	public:
		// A put is specified by its strike and time in years to expiration.
		put(double k, double t)
			: k(k), t(t)
		{ }

		double value(double f, double s) const
		{
			return put_value(f, s, k, t);
		}
		double delta(double f, double s) const
		{
			return put_delta(f, s, k, t);
		}
		double gamma(double f, double s) const
		{
			return put_gamma(f, s, k, t);
		}
	};

} // namespace option
```

Provide succinct and helpful comments for people using your code.
And for yourself when you reuse what you wrote at some point in the future.

```
#include "option.h"
...
double f = 100, s = 0.1, k = 100, t = 0.25;
double v = option::put_value(f, s, k, t);
option::put p(k, t);
double d = p.delta(f, s);
```

Note how the function and class names document the single letter names.

### Test Your Code

Every function should have _unit tests_. C++ has an
[`assert`](https://en.cppreference.com/w/cpp/error/assert) macro.
Use `assert(expression)` to ensure the expression evalates to a non-zero value.
If not, the macro prints the file name and line number to
[standard error](https://en.wikipedia.org/wiki/Standard_streams) followed by
the text of expression to the terminal running the program, then calls
[`abort`](https://en.cppreference.com/w/cpp/utility/program/abort).

It is not only a politically incorrect word these days, it brings the
program to a grinding halt and deposits a core dump.[^1]
This is a good thing. The person writing
the code and running the unit test has to fix the bug before sauntering
off to other tasks. Buggy code must be forbidden to be
checked into the source code management system.
The person writing buggy code must must be immediatley
held accountable. If not, someone else will have to
spend time to figure out what they wrote and why it is wrong.
The person who wrote the buggy code is in the best position to solve this,
hopefully aided by code reviews from their colleagues.

[^1]: By setting another macro it is possible to make the program
suspend execution during runtime in a debugger at the point where the condition fails.

The best way to handle errors is to not have them.

### Return Codes

If you write a function people may call it
with improper inputs. For example, it is an error to call the function
`double sqrt(double x)` with `x < 0`.

The way this was dealt with in C was to set a global `errno`
that users had to check after every call to `sqrt`.
This does not work well with multi-threaded programs.

Programming languages
should allow programmers to communicate what they think
should be correct to the code that will ultimately be executed.

_Error handling_ is how a program running on a computer communicates
to the person using the program the mistakes the person who wrote the
program requested to be reported during execution.

Edsger Dijkstra wrote a letter to the 
editors of _Communications of the ACM_ in 1968
titled ["Go To Statement Considered Harmful."](https://www.cs.utexas.edu/%7EEWD/transcriptions/EWD02xx/EWD215.html)
He was (very much) concerned with providing programmers appropriate tools for
writing correct programs. 

> My second remark is that our intellectual powers are rather geared
to master static relations and that our powers to visualize processes
evolving in time are relatively poorly developed. For that reason we
should do (as wise programmers aware of our limitations) our utmost best
to shorten the conceptual gap between the static program and the dynamic
process, to make the correspondence between the program (spread out in
text space) and the process (spread out in time) as trivial as possible.

Like Newton, I appreciate what people smarter than me
spent their precious time on this planet passionately figuring out
and carefully communicated to posterity. All I need to do is take the
time to read the words they wrote and make an effort to understand their
hard-won knowledge.

Dijkstra's admonition led to the practice of functions returning
error codes instead of jumping to non-local code execution.
The code immediately after the function call checks the error
code and takes action based on that.
This places a burden on the programmer
of checking all possible return codes.

C++ uses _exceptions_ that _throw_
up the function _call stack_. A calling function in a better position to
report something
hopefully useful to whoever is using the program
can _catch_ and

In the "Design and Evolution of C++" Bjarne Stroustup reported his findings based
on a study of existing
languages that tried to handle exceptional behaviour during program execution. 
He found that trying to write code to work around the exception led to more problems.
It is better to just report the exception and terminate the program with
useful information. It is a flaw in the program that needs to be fixed by a human.




Functions monads
