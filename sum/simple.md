<!--
:!pandoc % --css math.css -o %:r.html
-->
Alien: Take me to your data Earthling.  
Earthling: Not our ruler?
A: Stop wasting my time! (You are making me very mad - Marvin Martian)
E: Okay, but we have lots of data.  
A: No problemo, I will store it on this. (Stick)  
E: You don't understand. We have lots and lots of data.  
A: No, you don't understand. We will encode the data as a sequence of 0's and 1's, just like you Earthlings.  
E: You'll need a bigger stick.  
A: We will just take the encoded data $0110\ldots$ then stick a decimal point in front.  
E: Wat?

$\omega = .0110\ldots_2 = \sum_{n > 0} \omega_n$ where $\omega_n\in\{0,1\}$.

$0 \le \omega \le 1/2 + 1/4 + 1/8 + \cdots \le 1$.

E: Then what?  
A: Make a mark on the stick at $\omega$.  

(Diameter of an atom?)

This is completely correct mathematically, but not totally useless.

Add the time dimension

-------> time  
01101...  
THHTH...  
-++-+...  
$.\omega_1\omega_2\ldots_2$  

## Partial Information

How do we represent "knowing the first digit of $\omega$"?

$\AA_1 = \{[0, 1/2), [1/2, 0)\}$

## Function

If $A$ and $B$ are sets then the _set exponential_ $B^A = \{f\colon A\to B\}$
is the set of all functions from $A$ to $B$.

If $B$ is the real numbers... Vector space.

## Measure

A _measure_ takes a subset of a set to a number.
Measures don't count things twice: the measure of the union
of two sets is the sum of their measures minus
the measure of their intersection.
The measure of nothing is zero.

The simplest example is counting measure: the number of elements of a set.

### Hadwiger's Theorem

Mathematicians like countably additive measures so they can prove
theorems about when the integral of a limit of functions is the limit of the integral
of functions. If a measure is only finitely additive proofs of that get complicated.

But sometimes you don't need that. Finitely additive measures allow you to 
measure more sets. If $C$ is a convex set then its area and perimitor
are both measures.

People 

Hadwiger's Theorem.



## Measure
