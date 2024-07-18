--------------------------------------------------------------------------------
3.7.2  Examples 

       Illustrate, via examples, how to define functions by list comprehensions 
       where their mathematical definitions are given in set builder notations. 

--------------------------------------------------------------------------------

> import Prelude hiding (concat, product, reverse, zip)

a. Warm up examples

> eg1 = [(x,y) | x <- [1,2,3], y <- [4,5]]

> eg2 = [(x,y) | y <-  [4,5], x <- [1,2,3]]

> eg3 = [(x,y) | x <-  [1..3], y <- [x..3]]


b. Function: concat   

1. define a set mathematically using set notation

Given S is a set of sets. We can define the following:

{ x | xs is an element of S and x in an element of xs}

Remarks: S is not ordered.

> concat     :: [[a]] -> [a]
> concat xss = [x | xs <- xss, x <-xs]

c. Function: factors of an integer, even numbers (within a range)

> evens = [x | x <- [1..10], even x]

> factors n = [ x | x <-[1..n], n `mod` x == 0]

