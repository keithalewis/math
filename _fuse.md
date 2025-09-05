---
title: File system interface
---

Basic Types: integer, number, string, enumeration, symbol/key/UUID

String: finite array of code points

Enumerations: Month, Day of Week, CUSIP, State, ... (???define by regular exprssion)

Union/Sum type

Product type

Project, Restrict, Join(relational product)

Reduce(group by using monids)

Hierarchy as union type. union(a/b, a/c/d, ...)

```
$ ls
instrument
model
$ cd instrument
$ ls
bond
stock
futures
$ cd bond
$ ls
basic
municipal
treasury
$ ls basic
coupon
dated
maturity
```
