---
title: Types and Units
---

type := elemenary type | compound type

elementary type := enum : char | bool < non-neg integer < integer < rational < real (??? floating point)

Need to specify mapping from elementary type to computer representation

compound type := product | disjoint union | function(exponential)

numeraire: instrument with no cash flow
bullet: instrument with one cash flow
cash flow: amount * instrument * type
type: principal, interest, dividend, fee, tax,...

entity: uid

exchange: time * cash flow (taker) * cash flow (maker)

transaction: group of related exchanges

object: value and type

set: collection of distinct objects

product, (disjoint union), function

map: object => object

function: map => map

lazy evaluation, must call eval to run code

vector: n = {0,...,n-1} => object of same type

tuple: n => object of any type
