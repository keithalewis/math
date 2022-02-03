---
title: Portable, Efficient Software
author: Keith A. Lewis
institute: KALX, LLC
classoption: fleqn
fleqn: true
abstract: Writing performant code that can be used from any language
...

Almost every language provides a means of calling functions written in C.
The key to high performance software is passing pointers to data from
the calling language that do not require data to be copied.

Garbage collected languages usually have a means to temporarily pin
data while calling C functions.

