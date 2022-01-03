---
title: Portable, Efficient Software
author: Keith A. Lewis
institute: KALX, LLC
classoption: fleqn
fleqn: true
abstract: Writing performant code that can be used from any language
...

Almost every language provides a means of calling C functions.
The key to high performance software is passing pointers to data from
the calling language that do not require data to be copied.

Another portability issue involves the Application Binary Interface.
In order for a language to use an existing library it must link to either
a static library at compile time or a dynamic library at run-time.
Run-time linking requires information about the version of the library
being loaded, in particular its ABI. The most portable approach is to
write C++ code, compile static libraries, and use `extern "C"` to provide
C linkage of public functions that can be used from almost every language
to avoid ABI issues.

Garbage collected languages usually have a means to temporarily pin
data to prevent garbage collection while calling C functions. If the
C function requires memory the best practice is to provide a means to
communicate that to the calling function. The C function
should do no memory allocation.

## C++

Existing C++ libraries can be wrapped using a C interface if they
use a subset of C++ features. For example arguments of type `const
std::vector<T>&` can be called from C using `const T*, size_t` but
memory will be copied to the vector.  This can be avoided if the C++
library uses non-owning memory such as `std::span<T>` or `std::mdspan`

Smart pointers always involve memory allocation. Use `std::unique_ptr`
for the tightest control on that. Avoid `std::shared_ptr` when possible.
It is trivial to convert a unique pointer to a shared pointer when
necessary, but a shared pointer lives as long as anyone is holding it.
