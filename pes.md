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
the calling language so memory does not need to be copied.

Portability involves the Application Binary Interface.
In order for a language to use a C library it must link to either
a static library at compile time or a dynamic library at run-time.
Run-time linking requires information about the version of the library
being loaded and any dependencies it has on other dynamic libraries.
The most portable approach is to write C++ code, compile static libraries,
and use `extern "C"` to provide C linkage of public functions that can
be used from almost every language to avoid ABI issues.

The C ABI specifies the size and layout of standard types, structs and
arrays of standard types, linker visable names, and calling conventions.
As long as the host language respects this, it is possible to provide
a single library for each platform.

Garbage collected languages usually have a means to temporarily pin
data to prevent garbage collection while calling C functions. If the
C function requires memory the best practice is to provide a means to
communicate that to the calling function. The C function
should do no memory allocation, or offload that to the C++ functions being called.

To make a library easily available to a host language requires an understanding
of their Foreign Function Interface.

## C++

Existing C++ libraries can be wrapped using a C interface if they
use a subset of C++ features. For example arguments of type `const
std::vector<T>&` can be called from C using `const T*, size_t` but
memory will be copied to the vector.  This can be avoided if the C++
library uses non-owning memory such as
[`std::span<T>`](https://en.cppreference.com/w/cpp/container/span)
or [`std::mdspan`](http://www.open-std.org/jtc1/sc22/wg21/docs/papers/2021/p0009r14.html).

Smart pointers involve memory allocation. Use `std::unique_ptr`
for the tightest control on that. Avoid `std::shared_ptr` when possible.
It is trivial to convert a unique pointer to a shared pointer when
necessary, but a shared pointer abdicates control to any code using it.

## C\#

C# uses `pin_ptr` to pause garbage collection. It must be defined as a local variable
before passing it to a C++/CLI function. When it goes out of scope the GC takes over.
C++ does not allow 0 length arrays so 0 length C# arrays require special handling.
```
	void cli(array<T>^ a) {
	{
		pin_ptr<T> pa = (a.length == 0 ? nullptr : &a[0]);
		cpp(pa, a.length);
	}
```
Here `pa` gets passed to the C++/CLI function `cpp` as a `T*` to provide access to
the array of `T` managed by `a`. Passing `pa` when `a.length` is zero
is undefined behaviour.

## Java

(JNA)[https://github.com/java-native-access/jna)

## Python

https://pypi.org/project/PyFFI/

https://eli.thegreenplace.net/2013/03/09/python-ffi-with-ctypes-and-cffi

https://cffi.readthedocs.io/en/latest/
